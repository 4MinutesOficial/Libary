local GuiLib = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

function GuiLib:Painelzao(nome)
    local Antiguin = PlayerGui:FindFirstChild(nome)
    if Antiguin then
        local outTween = TweenService:Create(Antiguin, TweenInfo.new(0.3), {BackgroundTransparency = 1})
        outTween:Play()
        outTween.Completed:Wait()
        Antiguin:Destroy()
    end

    local GuiN = Instance.new("ScreenGui")
    GuiN.Name = nome
    GuiN.IgnoreGuiInset = true
    GuiN.ResetOnSpawn = false
    GuiN.Parent = PlayerGui

    local Painelzao = Instance.new("Frame")
    Painelzao.Name = "Painelzao"
    Painelzao.Size = UDim2.new(0, 450, 0, 500)
    Painelzao.AnchorPoint = Vector2.new(0.5, 0.5)
    Painelzao.Position = UDim2.new(0.5, 0, 0.5, 0)
    Painelzao.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Painelzao.ClipsDescendants = true
    Painelzao.Parent = GuiN

    local Gradient = Instance.new("UIGradient")
    Gradient.Rotation = 45
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25)),
    }
    Gradient.Parent = Painelzao

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Painelzao

    -- Barra superior (titulo + mover + minimizar)
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TopBar.Parent = Painelzao

    local TopGradient = Instance.new("UIGradient")
    TopGradient.Rotation = 90
    TopGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35)),
    }
    TopGradient.Parent = TopBar

    local UICornerTop = Instance.new("UICorner")
    UICornerTop.CornerRadius = UDim.new(0, 15)
    UICornerTop.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = nome
    TitleLabel.Size = UDim2.new(1, -80, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 22
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar

    -- Botão minimizar
    local BtnMin = Instance.new("TextButton")
    BtnMin.Size = UDim2.new(0, 30, 0, 30)
    BtnMin.Position = UDim2.new(1, -40, 0, 5)
    BtnMin.AnchorPoint = Vector2.new(1, 0)
    BtnMin.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    BtnMin.Text = "—"
    BtnMin.Font = Enum.Font.GothamBold
    BtnMin.TextSize = 24
    BtnMin.TextColor3 = Color3.new(1, 1, 1)
    BtnMin.Name = "BtnMin"
    BtnMin.Parent = TopBar

    local UICornerBtnMin = Instance.new("UICorner")
    UICornerBtnMin.CornerRadius = UDim.new(0, 8)
    UICornerBtnMin.Parent = BtnMin

    -- Container principal com scroll
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.Size = UDim2.new(1, -20, 1, -60)
    Container.Position = UDim2.new(0, 10, 0, 50)
    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0
    Container.ScrollBarThickness = 6
    Container.CanvasSize = UDim2.new(0, 0, 1, 0)
    Container.Parent = Painelzao
    Container.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 15)
    Layout.Parent = Container

    local function updateCanvasSize()
        Container.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
    end

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvasSize)
    updateCanvasSize()

    -- Barra minimizada que aparece quando minimizar
    local BarraMin = Instance.new("Frame")
    BarraMin.Name = "BarraMin"
    BarraMin.Size = UDim2.new(0, 200, 0, 40)
    BarraMin.Position = UDim2.new(0, 20, 1, -60)
    BarraMin.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    BarraMin.AnchorPoint = Vector2.new(0, 1)
    BarraMin.ClipsDescendants = true
    BarraMin.Visible = false
    BarraMin.Parent = GuiN

    local GradBar = Instance.new("UIGradient")
    GradBar.Rotation = 45
    GradBar.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 55, 55)),
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

    -- Animar minimização estilo "subindo"
    BtnMin.MouseButton1Click:Connect(function()
        local tweenSize = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Size = UDim2.new(0, 200, 0, 40)})
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
            local tweenSize = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Size = UDim2.new(0, 450, 0, 500)})
            local tweenPos = TweenService:Create(Painelzao, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0.5, 0)})
            tweenSize:Play()
            tweenPos:Play()
        end
    end)

    -- Função para tornar UI arrastável
    do
        local dragging = false
        local dragInput, dragStart, startPos

        local function update(input)
            local delta = input.Position - dragStart
            Painelzao.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end

        TopBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = Painelzao.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        TopBar.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end

    -- Função para criar botão
    function GuiLib:Botaozin(texto, parent, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 40)
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Text = texto
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 20
        btn.AutoButtonColor = false
        btn.Parent = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btn

        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}):Play()
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    -- Função para criar toggle
    function GuiLib:Toggle(texto, parent, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 40)
        frame.BackgroundTransparency = 1
        frame.Parent = parent

        local label = Instance.new("TextLabel")
        label.Text = texto
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 20
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local toggleBtn = Instance.new("TextButton")
        toggleBtn.Size = UDim2.new(0, 40, 0, 25)
        toggleBtn.Position = UDim2.new(1, -50, 0.5, -12)
        toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        toggleBtn.Text = ""
        toggleBtn.Parent = frame

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 12)
        corner.Parent = toggleBtn

        local toggled = false
        local function updateToggle()
            if toggled then
                toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            else
                toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            end
        end

        toggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
            callback(toggled)
        end)

        updateToggle()
        return frame
    end

    -- Função para criar select (slider)
    function GuiLib:Select(texto, parent, min, max, startValue, callback)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 50)
        frame.BackgroundTransparency = 1
        frame.Parent = parent

        local label = Instance.new("TextLabel")
        label.Text = texto
        label.Size = UDim2.new(1, 0, 0, 20)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamBold
        label.TextSize = 18
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local sliderBar = Instance.new("Frame")
        sliderBar.Size = UDim2.new(1, 0, 0, 10)
        sliderBar.Position = UDim2.new(0, 0, 0, 30)
        sliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        sliderBar.Parent = frame

        local UICornerSlider = Instance.new("UICorner")
        UICornerSlider.CornerRadius = UDim.new(0, 5)
        UICornerSlider.Parent = sliderBar

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((startValue - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        fill.Parent = sliderBar

        local UICornerFill = Instance.new("UICorner")
        UICornerFill.CornerRadius = UDim.new(0, 5)
        UICornerFill.Parent = fill

        local dragging = false

        local function updateFill(x)
            local relativeX = math.clamp(x - sliderBar.AbsolutePosition.X, 0, sliderBar.AbsoluteSize.X)
            local percent = relativeX / sliderBar.AbsoluteSize.X
            fill.Size = UDim2.new(percent, 0, 1, 0)
            local value = math.floor(min + percent * (max - min))
            callback(value)
        end

        sliderBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                updateFill(input.Position.X)
            end
        end)

        sliderBar.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        sliderBar.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                updateFill(input.Position.X)
            end
        end)

        return frame
    end

    return {
        Gui = GuiN,
        Painel = Painelzao,
        Container = Container,
        BarraMin = BarraMin,
        BtnMin = BtnMin,
        Botaozin = function(texto, parent, callback) return GuiLib:Botaozin(texto, parent, callback) end,
        Toggle = function(texto, parent, callback) return GuiLib:Toggle(texto, parent, callback) end,
        Select = function(texto, parent, min, max, startValue, callback) return GuiLib:Select(texto, parent, min, max, startValue, callback) end,
    }
end

return GuiLib
