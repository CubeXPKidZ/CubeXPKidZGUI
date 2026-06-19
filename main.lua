local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local TargetParent = (getgui and getgui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")


if TargetParent:FindFirstChild("CubeXPKidZGUI") then
    TargetParent:FindFirstChild("CubeXPKidZGUI"):Destroy()
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CubeXPKidZGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "Frame"
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui


local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Text = "CubeXPKidZ GUI"
TitleLabel.TextSize = 22
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = MainFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(0, 220, 0, 25)
CreditsLabel.Position = UDim2.new(1, -230, 0, 55)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
CreditsLabel.Text = "made by @cubexpkidz on discord"
CreditsLabel.TextSize = 14
CreditsLabel.Font = Enum.Font.SourceSansItalic
CreditsLabel.Parent = MainFrame


local WalkSpeedButton = Instance.new("TextButton")
WalkSpeedButton.Size = UDim2.new(0, 110, 0, 35)
WalkSpeedButton.Position = UDim2.new(0, 20, 0, 70)
WalkSpeedButton.Text = "WALKSPEED"
WalkSpeedButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
WalkSpeedButton.Parent = MainFrame

local WalkSpeedBox = Instance.new("TextBox")
WalkSpeedBox.Size = UDim2.new(0, 120, 0, 35)
WalkSpeedBox.Position = UDim2.new(0, 140, 0, 70)
WalkSpeedBox.Text = "16"
WalkSpeedBox.PlaceholderText = "16"
WalkSpeedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedBox.Parent = MainFrame

WalkSpeedButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = tonumber(WalkSpeedBox.Text) or 16 end
end)


local JumpPowerButton = Instance.new("TextButton")
JumpPowerButton.Size = UDim2.new(0, 110, 0, 35)
JumpPowerButton.Position = UDim2.new(0, 20, 0, 115)
JumpPowerButton.Text = "JUMPPOWER"
JumpPowerButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
JumpPowerButton.Parent = MainFrame

local JumpPowerBox = Instance.new("TextBox")
JumpPowerBox.Size = UDim2.new(0, 120, 0, 35)
JumpPowerBox.Position = UDim2.new(0, 140, 0, 115)
JumpPowerBox.Text = "50"
JumpPowerBox.PlaceholderText = "50"
JumpPowerBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JumpPowerBox.Parent = MainFrame

JumpPowerButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then 
        hum.UseJumpPower = true
        hum.JumpPower = tonumber(JumpPowerBox.Text) or 50 
    end
end)


local SitButton = Instance.new("TextButton")
SitButton.Size = UDim2.new(0, 110, 0, 35)
SitButton.Position = UDim2.new(0, 20, 0, 160)
SitButton.Text = "Sit"
SitButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
SitButton.Parent = MainFrame

SitButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Sit = true end
end)

local StandButton = Instance.new("TextButton")
StandButton.Size = UDim2.new(0, 120, 0, 35)
StandButton.Position = UDim2.new(0, 140, 0, 160)
StandButton.Text = "STAND UP"
StandButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
StandButton.Parent = MainFrame

StandButton.MouseButton1Click:Connect(function()
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Sit = false end
end)


local TPButton = Instance.new("TextButton")
TPButton.Size = UDim2.new(0, 240, 0, 35)
TPButton.Position = UDim2.new(0, 20, 0, 205)
TPButton.Text = "TELEPORT TO MOUSE"
TPButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
TPButton.Parent = MainFrame

TPButton.MouseButton1Click:Connect(function()
    local mouse = LocalPlayer:GetMouse()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)


local InfiniteJumpButton = Instance.new("TextButton")
InfiniteJumpButton.Size = UDim2.new(0, 240, 0, 35)
InfiniteJumpButton.Position = UDim2.new(0, 20, 0, 250)
InfiniteJumpButton.Text = "INFINITE JUMP: OFF"
InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
InfiniteJumpButton.Parent = MainFrame

local infJumpEnabled = false
InfiniteJumpButton.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    if infJumpEnabled then
        InfiniteJumpButton.Text = "INFINITE JUMP: ON"
        InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        InfiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        InfiniteJumpButton.Text = "INFINITE JUMP: OFF"
        InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        InfiniteJumpButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)


local InfoBox = Instance.new("TextLabel")
InfoBox.Size = UDim2.new(0, 240, 0, 215)
InfoBox.Position = UDim2.new(0, 290, 0, 100)
InfoBox.BackgroundColor3 = Color3.fromRGB(140, 0, 0)
InfoBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBox.TextSize = 14
InfoBox.TextWrapped = true
InfoBox.Text = "SUPPORT R6 & R15\n\nDiscord Server:\ndiscord.gg/Cc3PZ4679K\n\nReport any layout errors or feature requests directly to the server!"
InfoBox.Parent = MainFrame

print("CubeXPKidZGUI compiled and functional!")
