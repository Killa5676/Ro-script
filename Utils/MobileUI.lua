local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
frame.Position = UDim2.new(0.012, 0, 0.818, 0)
frame.Size = UDim2.new(0.075, 0, 0.159, 0)
frame.Parent = screenGui

local uicorner = Instance.new("UICorner")
uicorner.Parent = frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(24,24,24)
UIStroke.Thickness = 3
UIStroke.Parent = frame

local closebutton = Instance.new("TextButton")
closebutton.BackgroundTransparency = 1
closebutton.Position = UDim2.new(0,0,0,0)
closebutton.Size = UDim2.new(1,0,1,0)
closebutton.Parent = screenGui
closebutton.FontFace = Font.fromName("FredokaOne", Enum.FontWeight.Regular)
closebutton.TextColor3 = Color3.fromRGB(255,255,255)
closebutton.Text = "Ro-Script"
closebutton.TextScaled = true
closebutton.Parent = frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(40,40,40)
UIStroke.Thickness = 2
UIStroke.Parent = closebutton

local uitextsizeconstraint = Instance.new("UITextSizeConstraint")
uitextsizeconstraint.MaxTextSize = 26
uitextsizeconstraint.MinTextSize = 1

local function OnPressed()
    local vim = game:GetService('VirtualInputManager')
    local input = {
        hold = function(key, time)
            vim:SendKeyEvent(true, key, false, nil)
            task.wait(time)
            vim:SendKeyEvent(false, key, false, nil)
        end,
        press = function(key)
            vim:SendKeyEvent(true, key, false, nil)
            task.wait(0.005)
            vim:SendKeyEvent(false, key, false, nil)
        end
    }
    input.press(Enum.KeyCode.LeftControl)
end

closebutton.Activated:Connect(OnPressed)

local Players = game:GetService('Players')
local UIS = game:GetService("UserInputService")

local UI = closebutton

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Hovered = false
local Holding = false
local MoveCon = nil

local InitialX, InitialY, UIInitialPos

local ViewPortSize = workspace.Camera.ViewportSize
local Speed = 1
local function Drag()
    if Holding == false then
        MoveCon:Disconnect(); return
    end
    local distanceMovedX = (InitialX - Mouse.X) * Speed
    local distanceMovedY = (InitialY - Mouse.Y) * Speed

    local Pos = UIInitialPos - UDim2.new(distanceMovedX / ViewPortSize.X, 0, distanceMovedY / ViewPortSize.Y, 0)
    UI.Position = UDim2.new(math.clamp(Pos.X.Scale, 0, 1 - UI.Size.X.Scale), 0,
        math.clamp(Pos.Y.Scale, 0, 1 - UI.Size.Y.Scale), 0)
end


UI.MouseEnter:Connect(function()
    Hovered = true
end)

UI.MouseLeave:Connect(function()
    Hovered = false
end)

UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Holding = Hovered
        if Holding then
            InitialX, InitialY = Mouse.X, Mouse.Y
            UIInitialPos = UI.Position

            MoveCon = Mouse.Move:Connect(Drag)
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Holding = false
    end
end)
