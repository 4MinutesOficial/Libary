local GuiLib = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Local = Players.LocalPlayer
local PlayerGui = Local:WaitForChild("PlayerGui")

function GuiLib:Painelzao(nome)
    local Antiguin = PlayerGui:FindFirstChild(nome)
    if Antiguin then
        local Painel = Antiguin:FindFirstChild("Painelzao")
        if Painel then
            local Out = TweenService:Create(Painel, TweenInfo.new(0.3), {BackgroundTransparency = 1})
            Out:Play()
            Out.Completed:Wait()
        end
        Antiguin:Destroy()
    end

    local GuiN = Instance.new("ScreenGui")
    GuiN.Name = nome
    GuiN.IgnoreGuiInset = true
    GuiN.ResetOnSpawn = false
    GuiN.Parent = PlayerGui

    local Painelzao = Instance.new("Frame")
    Painelzao.Name = "Painelzao"
    Painelzao.Size = UDim2.new(0, 420, 0, 480)
    Painelzao.AnchorPoint = Vector2.new(0.5, 0.5)
    Painelzao.Position = UDim2.new(0.5, 0, 0.5, 0)
    Painelzao.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Painelzao.BackgroundTransparency = 1
    Painelzao.ClipsDescendants = true
    Painelzao.Parent = GuiN

    local Gradizao = Instance.new("UIGradient")
    Gradizao.Rotation = 45
    Gradizao.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
    }
    Gradizao.Parent = Painelzao

    local UICornerzao = Instance.new("UICorner")
    UICornerzao.CornerRadius = UDim.new(0, 15)
    UICornerzao.Parent = Painelzao

    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.Size = UDim2.new(1, -20, 1, -60)
    Container.Position = UDim2.new(0, 10, 0, 50)
    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0
    Container.ScrollBarThickness = 5
    Container.Parent = Painelzao

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 10)
    Layout.Parent = Container

    local BarraMin = Instance.new("Frame")
    BarraMin.Name = "BarraMin"
    BarraMin.Size = UDim2.new(0, 150, 0, 40)
    BarraMin.Position = UDim2.new(0, 20, 1, -60)
    BarraMin.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    BarraMin.AnchorPoint = Vector2.new(0, 1)
    BarraMin.ClipsDescendants = true
    BarraMin.Visible = false
    BarraMin.Parent = GuiN

    local GradBar = Instance.new("UIGradient")
    GradBar.Rotation = 45
    GradBar.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25)),
    }
    GradBar.Parent = BarraMin

    local UICornerBar = Instance.new("UICorner")
    UICornerBar.CornerRadius = UDim.new(0, 12)
    UICornerBar.Parent = BarraMin

    local TxtBarra = Instance.new("TextLabel")
    TxtBarra.Text = nome
    TxtBarra.TextColor3 = Color3.new(1,1,1)
    TxtBarra.BackgroundTransparency = 1
    TxtBarra.Size = UDim2.new(1, 0, 1, 0)
    TxtBarra.Font = Enum.Font.GothamBold
    TxtBarra.TextSize = 20
    TxtBarra.Parent = BarraMin

    local BotaoMin = Instance.new("TextButton")
    BotaoMin.Size = UDim2.new(0, 35, 0, 35)
    BotaoMin.Position = UDim2.new(1, -40, 0, 10)
    BotaoMin.AnchorPoint = Vector2.new(1, 0)
    BotaoMin.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    BotaoMin.Text = "—"
    BotaoMin.Font = Enum.Font.GothamBold
    BotaoMin.TextSize = 25
    BotaoMin.TextColor3 = Color3.new(1, 1, 1)
    BotaoMin.Name = "BotaoMin"
    BotaoMin.Parent = Painelzao

    local UICornerBot = Instance.new("UICorner")
    UICornerBot.CornerRadius = UDim.new(0, 8)
    UICornerBot.Parent = BotaoMin

    local function AnimarFade(obj, vis)
        local target = vis and 0 or 1
        local tween = TweenService:Create(obj, TweenInfo.new(0.25), {BackgroundTransparency = target})
        tween:Play()
        tween.Completed:Wait()
    end

    BotaoMin.MouseButton1Click:Connect(function()
        local tweenSize = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Size = UDim2.new(0, 150, 0, 40)})
        local tweenPos = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Position = UDim2.new(0, 20, 1, -60)})
        tweenSize:Play()
        tweenPos:Play()
        tweenPos.Completed:Wait()

        Painelzao.Visible = false
        BarraMin.Visible = true
    end)

    BarraMin.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            BarraMin.Visible = false
            Painelzao.Visible = true
            local tweenSize = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Size = UDim2.new(0, 420, 0, 480)})
            local tweenPos = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0.5, 0)})
            tweenSize:Play()
            tweenPos:Play()
        end
    end)

    AnimarFade(Painelzao, true)

    return {
        Gui = GuiN,
        Painel = Painelzao,
        Container = Container,
        Barra = BarraMin,
        BotaoMin = BotaoMin
    }
end

function GuiLib:Botaozin(texto, parent, callback)
    local Botaozin = Instance.new("TextButton")
    Botaozin.Size = UDim2.new(1, 0, 0, 45)
    Botaozin.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    Botaozin.TextColor3 = Color3.new(1, 1, 1)
    Botaozin.Text = texto
    Botaozin.Font = Enum.Font.GothamBold
    Botaozin.TextSize = 22
    Botaozin.AutoButtonColor = false
    Botaozin.Parent = parent

    local UICornerBtn = Instance.new("UICorner")
    UICornerBtn.CornerRadius = UDim.new(0, 10)
    UICornerBtn.Parent = Botaozin

    Botaozin.MouseEnter:Connect(function()
        TweenService:Create(Botaozin, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
    end)

    Botaozin.MouseLeave:Connect(function()
        TweenService:Create(Botaozin, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
    end)

    Botaozin.MouseButton1Click:Connect(callback)

    return Botaozin
end

return GuiLib
