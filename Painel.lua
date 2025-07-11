local GuiLib = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Local = Players.LocalPlayer
local PlayerGui = Local:WaitForChild("PlayerGui")

function GuiLib:Painelzao(nome)
    local Antiguin = PlayerGui:FindFirstChild(nome)
    if Antiguin then
        local Out = TweenService:Create(Antiguin, TweenInfo.new(0.3), {BackgroundTransparency = 1})
        Out:Play()
        Out.Completed:Wait()
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

    local Gradizão = Instance.new("UIGradient")
    Gradizão.Rotation = 45
    Gradizão.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 60, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
    }
    Gradizão.Parent = Painelzao

    local UICornerzão = Instance.new("UICorner")
    UICornerzão.CornerRadius = UDim.new(0, 15)
    UICornerzão.Parent = Painelzao

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

    local BotãoMin = Instance.new("TextButton")
    BotãoMin.Size = UDim2.new(0, 35, 0, 35)
    BotãoMin.Position = UDim2.new(1, -40, 0, 10)
    BotãoMin.AnchorPoint = Vector2.new(1, 0)
    BotãoMin.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    BotãoMin.Text = "—"
    BotãoMin.Font = Enum.Font.GothamBold
    BotãoMin.TextSize = 25
    BotãoMin.TextColor3 = Color3.new(1, 1, 1)
    BotãoMin.Name = "BotãoMin"
    BotãoMin.Parent = Painelzao

    local UICornerBot = Instance.new("UICorner")
    UICornerBot.CornerRadius = UDim.new(0, 8)
    UICornerBot.Parent = BotãoMin

    local function AnimarFade(obj, vis)
        local target = vis and 0 or 1
        local tween = TweenService:Create(obj, TweenInfo.new(0.25), {BackgroundTransparency = target})
        tween:Play()
        tween.Completed:Wait()
    end

    BotãoMin.MouseButton1Click:Connect(function()
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
        BotaoMin = BotãoMin
    }
end

function GuiLib:Botaozin(texto, parent, callback)
    local Botãozin = Instance.new("TextButton")
    Botãozin.Size = UDim2.new(1, 0, 0, 45)
    Botãozin.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    Botãozin.TextColor3 = Color3.new(1, 1, 1)
    Botãozin.Text = texto
    Botãozin.Font = Enum.Font.GothamBold
    Botãozin.TextSize = 22
    Botãozin.AutoButtonColor = false
    Botãozin.Parent = parent

    local UICornerBtn = Instance.new("UICorner")
    UICornerBtn.CornerRadius = UDim.new(0, 10)
    UICornerBtn.Parent = Botãozin

    Botãozin.MouseEnter:Connect(function()
        TweenService:Create(Botãozin, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
    end)

    Botãozin.MouseLeave:Connect(function()
        TweenService:Create(Botãozin, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play()
    end)

    Botãozin.MouseButton1Click:Connect(callback)

    return Botãozin
end

return GuiLib
