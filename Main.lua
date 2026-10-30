-- ==========================================
-- 影月系统 | 终极整合面板 (完整无截断版)
-- ==========================================
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local keysUrl = "https://raw.githubusercontent.com/yuh5710t/yingyue-vip-24-/main/keys.txt"

-- ================= 验证界面 (索尼克) =================
local gui = Instance.new("ScreenGui", playerGui)
gui.IgnoreGuiInset = true
gui.Name = "ShadowMoon_Auth"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromOffset(380, 250)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

local bg = Instance.new("ImageLabel", frame)
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundTransparency = 1
bg.Image = "https://i.ibb.co/1DgvgqX/image.png"
bg.ScaleType = Enum.ScaleType.Crop
bg.ZIndex = 0
Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 16)

local overlay = Instance.new("Frame", frame)
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
overlay.BackgroundTransparency = 0.35
overlay.BorderSizePixel = 0
overlay.ZIndex = 1
Instance.new("UICorner", overlay).CornerRadius = UDim.new(0, 16)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -60, 0, 30)
title.Position = UDim2.fromOffset(20, 20)
title.Text = "影月白名单验证"
title.TextColor3 = Color3.fromRGB(20, 20, 20)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1
title.ZIndex = 2

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.fromOffset(30, 30)
closeBtn.Position = UDim2.new(1, -45, 0, 15)
closeBtn.BackgroundColor3 = Color3.fromRGB(245, 240, 255)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(120, 80, 200)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.ZIndex = 2
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(1, -40, 0, 40)
input.Position = UDim2.fromOffset(20, 70)
input.BackgroundColor3 = Color3.fromRGB(245, 240, 255)
input.PlaceholderText = "输入卡密 (自己人直接点下方)"
input.Text = ""
input.TextColor3 = Color3.fromRGB(50, 50, 50)
input.Font = Enum.Font.Gotham
input.TextSize = 14
input.ZIndex = 2
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(1, -40, 0, 45)
btn.Position = UDim2.fromOffset(20, 130)
btn.BackgroundColor3 = Color3.fromRGB(138, 92, 246)
btn.Text = "验证并注入"
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 15
btn.ZIndex = 2
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -40, 0, 20)
status.Position = UDim2.fromOffset(20, 185)
status.Text = "验证仅发送当前账号用户名和白名单系统标识。"
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Font = Enum.Font.Gotham
status.TextSize = 10
status.TextXAlignment = Enum.TextXAlignment.Left
status.BackgroundTransparency = 1
status.ZIndex = 2

-- ================= 验证通过后加载 UI =================
local function LoadHub()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4925128366"
    sound.Parent = game.Workspace
    sound:Play()

    local ui = loadstring(game:HttpGet("https://shz.al/eAaSpWJZMP8SPcPsT8PHDifj"))()
    local win = ui:new("影月")

    -- 1. 主页
    local MainTab = win:Tab("关于影月")
    local MainSec = MainTab:section("信息", true)
    MainSec:Label("欢迎使用影月系统")
    MainSec:Label("作者：端午年")
    MainSec:Label("所有模块已就绪！")
    
    -- 2. 服务器传送
    local ServerTab = win:Tab("『服务器传送』")
    local ServerSec = ServerTab:section("『一键进服』", true)
    ServerSec:Button("进入 鱼 Fisch 服务器", function()
        game:GetService("TeleportService"):Teleport(16732694052, game.Players.LocalPlayer)
    end)
    ServerSec:Button("进入 兵工厂 Arsenal 服务器", function()
        game:GetService("TeleportService"):Teleport(286090429, game.Players.LocalPlayer)
    end)
    
    -- ================= 3. 脚本整合 =================
    local ScriptTab = win:Tab("『脚本整合』")
    local ScriptSec = ScriptTab:section("『一键启动』", true)
    
    -- 👇 破坏者谜团2
    ScriptSec:Button("启动 破坏者谜团2", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yuh5710t/yingyue-vip-24-/main/Puzzle2.lua"))()
    end)

    -- 👇 造船寻宝 (伊散版)
    ScriptSec:Button("启动 造船寻宝 (刷金条)", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yuh5710t/yingyue-vip-24-/main/zaochuan.lua"))()
    end)
end

btn.MouseButton1Click:Connect(function()
    btn.Text = "验证中..."
    status.Text = "⏳ 正在连接云端..."
    status.TextColor3 = Color3.fromRGB(100, 100, 100)
    task.wait(0.5)
    
    if player.Name == "yuh5710t" then
        status.Text = "✅ 验证通过 (管理员)"
        status.TextColor3 = Color3.fromRGB(0, 180, 50)
        btn.BackgroundColor3 = Color3.fromRGB(0, 200, 50)
        btn.Text = "注入成功"
        task.wait(1)
        gui:Destroy()
        LoadHub()
        return
    end
    
    local inputText = input.Text
    if inputText ~= "" then
        local ok, data = pcall(function() return game:HttpGet(keysUrl) end)
        if ok and data then
            local enc = HttpService:Base64Encode(inputText)
            if string.find(data, enc) then
                status.Text = "✅ 验证通过 (卡密用户)"
                status.TextColor3 = Color3.fromRGB(0, 180, 50)
                btn.BackgroundColor3 = Color3.fromRGB(0, 200, 50)
                btn.Text = "注入成功"
                task.wait(1)
                gui:Destroy()
                LoadHub()
                return
            end
        end
    end
    
    btn.Text = "重新验证"
    btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    status.Text = "❌ 验证失败：你不在白名单内或卡密错误"
    status.TextColor3 = Color3.fromRGB(200, 50, 50)
    task.wait(1.5)
    btn.BackgroundColor3 = Color3.fromRGB(138, 92, 246)
    btn.Text = "验证并注入"
end)
