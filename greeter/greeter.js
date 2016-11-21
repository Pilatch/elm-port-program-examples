    const elm = require('./elm.js')
    const elmPorts = elm.Greet.worker().ports
    let inHobbyMode = false

    console.log(`Ready to greet people whose names you enter.`)
    console.log(`Press enter without any text to start adding hobbies.`)
    console.log(`Press Ctrl + C when you want to exit.\n`)

    elmPorts.greet.subscribe(greeting => {
      console.log(`${greeting}`)
    })
    process.stdin.resume()
    process.stdin.on('data', chunk => {
      const input = chunk.toString('utf8').trim();
      if (input === '') {
        inHobbyMode = true
        console.log(`Enter hobbies.`)
      } else if (inHobbyMode) {
        elmPorts.inputHobby.send(input)
      } else {
        elmPorts.inputName.send(input)
      }
    })
