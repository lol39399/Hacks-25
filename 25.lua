-- Script de Poderes para Roblox (Delta Executor)
-- Comandos: /speed /jump /freeze /unfreeze

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function getCharacter()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")
    return char, humanoid
end

local normalSpeed = 16
local normalJump = 50

local currentChar, currentHumanoid = getCharacter()

local function onChatted(msg)
    msg = msg:lower()
    if not currentHumanoid or not currentHumanoid.Parent then return end
    if msg == "/speed" then
        currentHumanoid.WalkSpeed = 100
        print("Super velocidade ativada!")
    elseif msg == "/jump" then
        currentHumanoid.JumpPower = 150
        print("Super pulo ativado!")
    elseif msg == "/freeze" then
        currentHumanoid.WalkSpeed = 0
        currentHumanoid.JumpPower = 0
        print("Você está congelado!")
    elseif msg == "/unfreeze" then
        currentHumanoid.WalkSpeed = normalSpeed
        currentHumanoid.JumpPower = normalJump
        print("Você foi descongelado!")
    end
end

LocalPlayer.Chatted:Connect(onChatted)

LocalPlayer.CharacterAdded:Connect(function(char)
    currentChar = char
    currentHumanoid = char:WaitForChild("Humanoid")
end)

print("Script de poderes carregado! Use /speed, /jump, /freeze, /unfreeze no chat.")
