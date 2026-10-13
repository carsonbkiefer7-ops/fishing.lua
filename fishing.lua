
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local GREEN = Color3.fromRGB(0, 255, 0)

local function findGreenTargets()
    local targets = {}

    for _, obj in ipairs(playerGui:GetDescendants()) do
        if obj:IsA("GuiObject")
            and obj.Visible
            and obj.AbsoluteSize.X > 0
            and obj.AbsoluteSize.Y > 0 then

            if obj.BackgroundColor3 == GREEN then
                table.insert(targets, obj)
            end
        end
    end

    return targets
end

local function overlaps(a, b)
    local ap = a.AbsolutePosition
    local as = a.AbsoluteSize
    local bp = b.AbsolutePosition
    local bs = b.AbsoluteSize

    return ap.X < bp.X + bs.X
        and ap.X + as.X > bp.X
        and ap.Y < bp.Y + bs.Y
        and ap.Y + as.Y > bp.Y
end

while task.wait(0.03) do
    for _, target in ipairs(findGreenTargets()) do
        print("Green target found:", target:GetFullName())
    end
end
