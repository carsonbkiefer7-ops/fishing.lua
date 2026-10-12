local Players = game:GetService("Players")
local VirtualInputManager =
    game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local running = true

-- Change these to match your fishing game's GUI
local GREEN_COLOR = Color3.fromRGB(0, 255, 0)

local function isGreen(guiObject)
    if not guiObject:IsA("GuiObject") then
        return false
    end

    local color = guiObject.BackgroundColor3

    return color.G > 0.7
        and color.G > color.R * 1.4
        and color.G > color.B * 1.2
        and guiObject.Visible
end

local function clickGui(guiObject)
    local position = guiObject.AbsolutePosition
        + guiObject.AbsoluteSize / 2

    VirtualInputManager:SendMouseButtonEvent(
        position.X, position.Y, 0, true, game, 0
    )

    task.wait(0.05)

    VirtualInputManager:SendMouseButtonEvent(
        position.X, position.Y, 0, false, game, 0
    )
end

while running do
    -- Find visible green GUI buttons
    local foundGreen = false

    for _, object in ipairs(playerGui:GetDescendants()) do
        if object:IsA("GuiButton") and isGreen(object) then
            foundGreen = true
            clickGui(object)
            task.wait(0.1)
        end
    end

    if not foundGreen then
        task.wait(0.2)
    else
        task.wait(0.5)
    end
end
