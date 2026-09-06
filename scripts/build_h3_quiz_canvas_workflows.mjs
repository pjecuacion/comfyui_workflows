/**
 * Converts submitted MiniMax H3 API prompts into grouped, editable ComfyUI
 * canvas workflows. It deliberately keeps the source submission files intact.
 */
import { readFile, writeFile } from 'node:fs/promises'
import { resolve, basename } from 'node:path'
import { randomUUID } from 'node:crypto'

const bundle = resolve('workflows/minimax-h3-realistic-quiz-prince')
const sources = ['realistic_quiz_prince_scene_01_submitted_workflow.json', 'realistic_quiz_prince_scene_02_submitted_workflow.json']
const groupByNode = {
  115: 'Story Setup', 131: 'Story Setup', 132: 'Story Setup', 137: 'Story Setup', 142: 'Story Setup', 143: 'Story Setup',
  119: 'Models and Look', 120: 'Models and Look', 127: 'Models and Look', 128: 'Models and Look', 170: 'Models and Look', story_reference_attire: 'Story Setup',
  136: 'H3 Conditioning', story_live_preview: 'H3 Conditioning', 177: 'H3 Conditioning',
  123: 'Sampling', 124: 'Sampling', 125: 'Sampling', 126: 'Sampling', 129: 'Sampling', 178: 'Sampling',
  121: 'Decode and Output', 122: 'Decode and Output', 171: 'Decode and Output', 172: 'Decode and Output', 175: 'Decode and Output'
}
const groupLayouts = {
  'Story Setup': { bounding: [0, 0, 1100, 960], color: '#4a6fa5' },
  'Models and Look': { bounding: [0, 1050, 1100, 850], color: '#6c5b7b' },
  'H3 Conditioning': { bounding: [1250, 0, 780, 960], color: '#2e8b8b' },
  Sampling: { bounding: [2150, 0, 800, 960], color: '#b07035' },
  'Decode and Output': { bounding: [3050, 0, 800, 960], color: '#4c8c4a' }
}
const layouts = {
  'Story Setup': [[40, 90], [390, 90], [740, 90], [40, 330], [500, 330], [40, 570]],
  'Models and Look': [[40, 1140], [400, 1140], [740, 1140], [40, 1410], [460, 1410]],
  'H3 Conditioning': [[1290, 100], [1290, 430], [1290, 690]],
  Sampling: [[2190, 100], [2550, 100], [2190, 330], [2550, 330], [2190, 600], [2550, 600]],
  'Decode and Output': [[3090, 100], [3440, 100], [3090, 360], [3440, 360], [3090, 620]]
}

function idKey(id) {
  return String(id).replaceAll(':', '_').replaceAll('-', '_')
}

function connection(value, nodeIds) {
  return Array.isArray(value) && value.length === 2 && nodeIds.has(String(value[0])) && Number.isInteger(value[1])
}

function sizeFor(node) {
  if (node.class_type === 'PrimitiveStringMultiline') return [1000, 260]
  if (node.class_type === 'MiniMaxH3ReferenceToVideo') return [680, 300]
  if (node.class_type === 'Power Lora Loader (rgthree)') return [600, 260]
  return [300, 110]
}

function positionNodes(api) {
  const counters = Object.fromEntries(Object.keys(layouts).map((name) => [name, 0]))
  return Object.entries(api).map(([id, node], order) => {
    const section = groupByNode[idKey(id)] ?? 'Story Setup'
    const position = layouts[section][counters[section]++] ?? [40, 760]
    return { id, node, order, position }
  })
}

function widgetsFor(id, inputs, nodeIds) {
  const values = Object.entries(inputs)
    .filter(([, value]) => !connection(value, nodeIds))
    .map(([, value]) => value)
  if (id === '170') {
    const header = inputs.PowerLoraLoaderHeaderWidget ?? {}
    return [{}, header, inputs.lora_1 ?? {}, inputs.lora_2 ?? {}, {}, inputs['➕ Add Lora'] ?? '']
  }
  return values
}

async function definitionsFor(api) {
  const types = [...new Set(Object.values(api).map((node) => node.class_type))]
  const records = await Promise.all(types.map(async (type) => {
    const response = await fetch(`http://127.0.0.1:8188/object_info/${encodeURIComponent(type)}`)
    if (!response.ok) throw new Error(`Could not load the live node definition for ${type}`)
    const data = await response.json()
    return [type, data[type]]
  }))
  return new Map(records)
}

function outputSpec(definition, slot) {
  const types = Array.isArray(definition?.output) ? definition.output : [definition?.output ?? '*']
  const names = Array.isArray(definition?.output_name) ? definition.output_name : [definition?.output_name ?? 'OUTPUT']
  return { name: names[slot] ?? `OUTPUT ${slot + 1}`, type: types[slot] ?? '*' }
}

function makeCanvas(api, sourceName, definitions) {
  const nodeIds = new Set(Object.keys(api))
  const positioned = positionNodes(api)
  const incoming = new Map()
  const outgoing = new Map()
  let linkId = 1
  const links = []
  for (const { id, node } of positioned) {
    Object.entries(node.inputs ?? {}).forEach(([name, value]) => {
      if (!connection(value, nodeIds)) return
      const targetSlot = (incoming.get(id) ?? []).length
      const sourceKey = `${value[0]}:${value[1]}`
      const sourceSlot = value[1]
      const link = [linkId++, Number(value[0]) || value[0], sourceSlot, Number(id) || id, targetSlot, '*']
      links.push(link)
      incoming.set(id, [...(incoming.get(id) ?? []), { name, link: link[0] }])
      outgoing.set(sourceKey, [...(outgoing.get(sourceKey) ?? []), link[0]])
    })
  }
  const nodes = positioned.map(({ id, node, order, position }) => {
    const inputs = (incoming.get(id) ?? []).map(({ name, link }) => {
      const source = links.find((candidate) => candidate[0] === link)
      const sourceNode = api[String(source[1])]
      return { name, type: outputSpec(definitions.get(sourceNode.class_type), source[2]).type, link }
    })
    const outputCount = Math.max(1, ...[...outgoing.keys()]
      .filter((key) => key.startsWith(`${id}:`))
      .map((key) => Number(key.split(':')[1]) + 1))
    const outputs = Array.from({ length: outputCount }, (_, index) => ({ ...outputSpec(definitions.get(node.class_type), index), links: outgoing.get(`${id}:${index}`) ?? [] }))
    return {
      id: Number(id) || id,
      type: node.class_type,
      pos: position,
      size: sizeFor(node),
      flags: {}, order, mode: 0, inputs, outputs,
      properties: { 'Node name for S&R': node.class_type },
      widgets_values: widgetsFor(id, node.inputs ?? {}, nodeIds),
      title: node._meta?.title
    }
  })
  const groups = Object.entries(groupLayouts).map(([title, layout], index) => ({ id: index + 1, title, ...layout, font_size: 26 }))
  return {
    id: randomUUID(), revision: 0, last_node_id: 178, last_link_id: linkId - 1,
    nodes, links, groups, config: {},
    extra: { frontendVersion: '1.47.12', ds: { scale: 0.7, offset: [120, 80] }, BlueprintDescription: `Grouped canvas version of ${sourceName}; source submitted workflow retained beside it.` },
    version: 0.4
  }
}

for (const source of sources) {
  const api = JSON.parse(await readFile(resolve(bundle, source), 'utf8'))
  const canvas = makeCanvas(api, source, await definitionsFor(api))
  const target = source.replace('_submitted_workflow.json', '_canvas_grouped.json')
  await writeFile(resolve(bundle, target), `${JSON.stringify(canvas, null, 2)}\n`)
  console.log(`Created ${basename(target)} with ${canvas.nodes.length} nodes and ${canvas.groups.length} groups.`)
}
