Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE")

    mainMenu.Closed = function()
        RageUI.Popup({
            message = "RageUI showcase menu closed",
            colors = 200
        })
    end

    mainMenu:SetSubtitle("~b~RAGEUI SHOWCASE - RAGEUI")
    mainMenu.EnableMouse = true;

    local subMenu = RageUI.CreateSubMenu(mainMenu, "", "~b~RAGEUI SHOWCASE", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
    subMenu.EnableMouse = true;

    local panelShowcase = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~RAGEUI SHOWCASE - PANELS")
    panelShowcase.EnableMouse = true;

    local description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

    subMenu:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 55, 0),
        [2] = "This is a Spacebar",
    })

    local mainMenuData = {
        checkbox = {
            tick = false,
            cross = false,
        },
        list = {
            data = {
                "Banana",
                "Apple",
                "Pizza",
                "Quartilicious",
                "Steak",
                0xF00D,
            },
            index = 1,
        },
        slider = {
            max = 20,
            index = 1
        },
        progress = {
            show = false,
            max = 25,
            index = 1,
        },
    }

    local panelShowcaseData = {
        colors = {
            enable = false,
            index = 1
        },
        percentage = {
            enable = false,
            index = 1
        },
        vertical = {
            enable = false,
            y = 0.5
        },
        horizontal = {
            enable = false,
            x = 0.5,
        },
        square = {
            enable = false,
            x = 0.5,
            y = 0.5
        }
    }
    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then

            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                ---Items

                RageUI.Checkbox("Checkbox - Style 1 (click me!)", description, mainMenuData.checkbox.tick, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    mainMenuData.checkbox.tick = Checked
                    mainMenuData.progress.show = Checked
                end)

                RageUI.Checkbox("Checkbox - Style 2", description, mainMenuData.checkbox.cross, { Style = RageUI.CheckboxStyle.Cross }, function(Hovered, Selected, Active, Checked)
                    mainMenuData.checkbox.cross = Checked
                end)

                RageUI.List("Food", mainMenuData.list.data, mainMenuData.list.index, description, {}, true, function(Hovered, Active, Selected, Index)
                    mainMenuData.list.index = Index

                end)

                RageUI.Slider("Quantité", mainMenuData.slider.index, mainMenuData.slider.max, description, false, { }, true, function(Hovered, Selected, Active, Index)
                    mainMenuData.slider.index = Index
                end)

                if (mainMenuData.progress.show) then
                    RageUI.Progress("Progress ", mainMenuData.progress.index, mainMenuData.progress.max, description, true, true, function(Hovered, Selected, Active, Index)
                        mainMenuData.progress.index = Index
                    end)
                end

                RageUI.Button("Another Menu", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                end, subMenu)

            end, function()
                ---Panels
            end)

        elseif RageUI.Visible(subMenu) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()

                for i = 1, 50 do
                    RageUI.Button("Another Sub-Menu " .. i, description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                        if Active then
                        end
                    end, panelShowcase)
                end

            end, function()
                ---Panels
            end)
        elseif RageUI.Visible(panelShowcase) then
            RageUI.DrawContent({ header = false, instructionalButton = true }, function()
                ---Items
                RageUI.Checkbox("Colors Panel", description, panelShowcaseData.colors.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.colors.enable = Checked
                end)

                RageUI.Checkbox("Percentage Panel", description, panelShowcaseData.percentage.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.percentage.enable = Checked
                end)

                RageUI.Checkbox("Horizontal Grid Panel", description, panelShowcaseData.horizontal.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.horizontal.enable = Checked
                end)

                RageUI.Checkbox("Vertical Grid Panel", description, panelShowcaseData.vertical.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.vertical.enable = Checked
                end)

                RageUI.Checkbox("Square Grid Panel", description, panelShowcaseData.square.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.square.enable = Checked
                end)

            end, function()
                ---Panels

                if (panelShowcaseData.colors.enable) then

                end

                if (panelShowcaseData.percentage.enable) then

                end

                if (panelShowcaseData.horizontal.enable) then
                    RageUI.GridPanelHorizontal(panelShowcaseData.horizontal.x, "LeftText", "RightText", function(Hovered, Active, Y)
                        panelShowcaseData.horizontal.x = Y
                    end)

                end

                if (panelShowcaseData.vertical.enable) then
                    RageUI.GridPanelVertical(panelShowcaseData.vertical.y, "TopText", "BottomText", function(Hovered, Active, Y)
                        panelShowcaseData.vertical.y = Y
                    end)
                end

                if (panelShowcaseData.square.enable) then
                    RageUI.GridPanel(panelShowcaseData.square.x, panelShowcaseData.square.y, "TopText", "BottomText", "LeftText", "RightText", function(Hovered, Active, X, Y)
                        panelShowcaseData.square.x = X
                        panelShowcaseData.square.y = Y
                    end)
                end

            end)
        end
    end

end)