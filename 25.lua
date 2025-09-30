-- Script de Poderes para Roblox (Delta Executor)
-- Comandos: /speed /jump /freeze /unfreeze

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Valores originais para restaurar depois
local normalSpeed = 16
local normalJump = 50

-- Função de poderes
local function onChatted(msg)
    msg = msg:lower()
    if msg == "/speed" then
        Character.Humanoid.WalkSpeed = 100
        print("Super velocidade ativada!")
    elseif msg == "/jump" then
        Character.Humanoid.JumpPower = 150
        print("Super pulo ativado!")
    elseif msg == "/freeze" then
        Character.Humanoid.WalkSpeed = 0
        Character.Humanoid.JumpPower = 0
        print("Você está congelado!")
    elseif msg == "/unfreeze" then
        Character.Humanoid.WalkSpeed = normalSpeed
        Character.Humanoid.JumpPower = normalJump
        print("Você foi descongelado!")
    end
end

-- Detectar quando o jogador digita no chat
LocalPlayer.Chatted:Connect(onChatted)

-- Atualizar referência do personagem se morrer/respawnar
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    char:WaitForChild("Humanoid")
end)

print("Script de poderes carregado! Use /speed, /jump, /freeze, /unfreeze no chat.")
