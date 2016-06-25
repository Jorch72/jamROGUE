local main = {}
local buffer = require("src/buffer.lua")

main.exiting = false

main.states = {
    menu = require("src/states/state_menu.lua"),
    login = require("src/states/state_login.lua"),
    register = require("src/states/state_register.lua"),
    game = require("src/states/state_game.lua")
}

main.state = "menu"
main.stateTime = 1

function main.changeState(dest)
    main.state = dest
    main.stateTime = 1

    if main.states[main.state] then
        if main.states[main.state].init then
            main.states[main.state].init(main)
        end
    end
end

main.changeState("menu")

require("src/loop.lua")(main)

return main
