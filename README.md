This scene library can allow you to switch to other lua files.<br>
It is really useful if you're making a game with multiple levels, and main menu.
<br>

# main.lua
##  Initialize the Scenes library:
```lua
local Scenes = require("scenes")

function love.load()
    Scenes.path = "assets/scenes" -- Your path to scenes folder
    Scenes:change("menu") -- Change your scene to menu.lua
end
```

## Initialize the functions needed:
```lua
local Scenes = require("scenes")

function love.load()
    Scenes.path = "assets/scenes" -- Your path to scenes folder
    Scenes:change("menu") -- Your scene name located at the scenes folder

    if Scenes.current.load then Scenes.current.load() end
end

function love.update()
    if Scenes.current.update then Scenes.current.update() end
end

function love.draw()
    if Scenes.current.draw then Scenes.current.draw() end
end
```
The `Scenes.current` is the module that had been required of the new scene you have changed,
it will be explained later on.<br>
Running the function: `Scenes.current.load` will run the function `module.load()` in the new scene you changed.<br><br>
It is recommended that you check if the function exists in the new scene, otherwise it would cause an error of trying to run a function that do not exist in the new scene.<br><br>

# menu.lua
This is the file that were gonna make the scene change to it.<br>
*You can make multiple files and name them whatever you want.*<br>

## Create a module
```lua
local M = {}

return M
```
## Add the love functions
Example of it is `love.load`, but instead, you replace the "love" to "M" as the module's variable.<br> So it would be: `M.load`.
```lua
local M = {}

function M.load()

end

function M.update()

end

function M.draw()

end

return M
```
Now you can put anything inside those function just like when you make a project in Love2D.<br>
You're all done!<br>

# Explanation
When we call the `Scenes.current.load` inside our **main.lua**, were actually the function `M.load` that we have made in **menu.lua**<br>
You can even create different functions, like when trying to get the input of the user `love.keypressed()`.
<br>
# Features
You can change the scenes easily, even change it inside a running scene by using the function: `Scenes:change("")`<br>
Take a look at **menu.lua**
```lua
local M = {}
local Scenes = require("scenes")

function M.load()
    love.timer.sleep( s ) -- Wait for 5 seconds
    Scenes:change("game") -- Switch to game scene
end

return M
```
