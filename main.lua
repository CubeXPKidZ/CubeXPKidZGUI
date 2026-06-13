-- REBUILT AND HOOKED UP CUBEXP_KIDZ_GUI
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local TargetParent = (getgui and getgui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")

-- Prevent duplication
if TargetParent:FindFirstChild("CubeXPKidZGUI") then
    TargetParent:FindFirstChild("CubeXPKidZGUI"):Destroy()
end

-- Main Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CubeXPKidZGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Frame"
MainFrame.Size = UDim2.new(0, 692, 0, 387)
MainFrame.Position = UDim2.new(0.11, 0, 0.05, 0)
MainFrame.BackgroundColor3 = Color3.new(0.784, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- UI Labels
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 473, 0, 79)
TitleLabel.Position = UDim2.new(0.166, 0, -0.013, 0)
TitleLabel.BackgroundColor3 = Color3.new(0.5, 0, 0)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Text = "CubeXPKidZGUI"
TitleLabel.TextSize = 24
TitleLabel.Parent = MainFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(0, 250, 0, 31)
CreditsLabel.Position = UDim2.new(0.556, 0, 0.144, 0)
CreditsLabel.BackgroundColor3 = Color3.new(0.5, 0, 0)
CreditsLabel.TextColor3 = Color3.new(1, 1, 1)
CreditsLabel.Text = "made by @cubexpkidz on discord"
CreditsLabel.Parent = MainFrame

-- Walkspeed Configurations
local WalkSpeedBox = Instance.new("TextBox")
WalkSpeedBox.Size = UDim2.new(0, 157, 0, 24)
WalkSpeedBox.Position = UDim2.new(0.145, 0, 0.224, 0)
WalkSpeedBox.Text = "16"
WalkSpeedBox.PlaceholderText = "WALKSPEED:"
WalkSpeedBox.Parent = MainFrame

local WalkSpeedButton = Instance.new("TextButton")
WalkSpeedButton.Size = UDim2.new(0, 82, 0, 50)
WalkSpeedButton.Position = UDim2.new(0.011, 0, 0.188, 0)
WalkSpeedButton.Text = "WALKSPEED"
WalkSpeedButton.Parent = MainFrame

WalkSpeedButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = tonumber(WalkSpeedBox.Text) or 16 end
end)

-- JumpPower Configurations
local JumpPowerBox = Instance.new("TextBox")
JumpPowerBox.Size = UDim2.new(0, 173, 0, 29)
JumpPowerBox.Position = UDim2.new(0.134, 0, 0.288, 0)
JumpPowerBox.Text = "50"
JumpPowerBox.PlaceholderText = "JUMPOWER:"
JumpPowerBox.Parent = MainFrame

local JumpPowerButton = Instance.new("TextButton")
JumpPowerButton.Size = UDim2.new(0, 86, 0, 45)
JumpPowerButton.Position = UDim2.new(0.01, 0, 0.269, 0)
JumpPowerButton.Text = "JUMPPOWER"
JumpPowerButton.Parent = MainFrame

JumpPowerButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then 
        hum.UseJumpPower = true
        hum.JumpPower = tonumber(JumpPowerBox.Text) or 50 
    end
end)

-- Character Controls
local SitButton = Instance.new("TextButton")
SitButton.Size = UDim2.new(0, 70, 0, 45)
SitButton.Position = UDim2.new(0.004, 0, 0.34)
SitButton.Text = "Sit"
SitButton.Parent = MainFrame

SitButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Sit = true end
end)

local StandButton = Instance.new("TextButton")
StandButton.Size = UDim2.new(0, 139, 0, 31)
StandButton.Position = UDim2.new(0.225, 0, 0.363, 0)
StandButton.Text = "STAND UP"
StandButton.Parent = MainFrame

StandButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Sit = false end
end)

-- Teleport to Mouse
local TPButton = Instance.new("TextButton")
TPButton.Size = UDim2.new(0, 149, 0, 45)
TPButton.Position = UDim2.new(0.011, 0, 0.458, 0)
TPButton.Text = "TP TO MOUSE"
TPButton.Parent = MainFrame

TPButton.MouseButton1Click:Connect(function()
    local mouse = LocalPlayer:GetMouse()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

-- Infinite Jump Action
local InfiniteJumpButton = Instance.new("TextButton")
InfiniteJumpButton.Size = UDim2.new(0, 112, 0, 26)
InfiniteJumpButton.Position = UDim2.new(0.127, 0, 0.821, 0)
InfiniteJumpButton.Text = "INFINITE JUMP"
InfiniteJumpButton.Parent = MainFrame

local infJumpEnabled = false
InfiniteJumpButton.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    InfiniteJumpButton.BackgroundColor3 = infJumpEnabled and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

print("CubeXPKidZGUI compiled and functional!")
