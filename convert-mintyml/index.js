const { MintymlConverter } = require('mintyml')
const consumers = require('node:stream/consumers')

async function throwIfTruthy(x) {
    const e = await x
    if (e) {
        throw e
    }
}

async function main() {
    let stdin = process.stdin.setEncoding('utf8')
    const converter = new MintymlConverter({ completePage: false, indent: 2 })
    const src = await consumers.text(stdin)
    const out = await converter.convert(src)
    await new Promise(ok => process.stdout.write(out, ok)).then(throwIfTruthy)
    await new Promise(ok => process.stdout.end(ok))
}

main().catch(e => {
    console.error(e.message ?? e)
    process.exitCode = 1
})
