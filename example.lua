local updateShowcaseData = {
    count = 1;
}

Citizen.CreateThreadNow(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE")

    --mainMenu:SetPosition(700,300)
    mainMenu.Closed = function()
        RageUI.Popup({
            message = "RageUI showcase menu closed",
            colors = 200
        })
    end

    mainMenu:SetSubtitle("~b~RAGEUI SHOWCASE - RAGEUI")
    mainMenu.EnableMouse = true;

    local updateShowcase = RageUI.CreateSubMenu(mainMenu, "", "~b~RAGEUI SHOWCASE", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
    updateShowcase.EnableMouse = false;
    updateShowcase:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 56, 0),
        [2] = "Add item",
    })

    updateShowcase:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 57, 0),
        [2] = "Remove item",
    })

    local panelShowcase = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~RAGEUI SHOWCASE - PANELS")
    panelShowcase.EnableMouse = true;

    local description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

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
            max = 10,
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
            index_one = 1,
            index_two = 1
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

    local HeritageIndex = 5
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end

        if IsControlJustPressed(1, 56) then
            updateShowcaseData.count = updateShowcaseData.count + 1
        end
        if IsControlJustPressed(1, 57) then
            if (updateShowcaseData.count > 1) then
                updateShowcaseData.count = updateShowcaseData.count - 1
            end
        end

        if RageUI.Visible(mainMenu) then

            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
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

                --[[
                RageUI.Slider("Quantité", mainMenuData.slider.index, mainMenuData.slider.max, description, true, { }, true, function(Hovered, Selected, Active, Index)
                    mainMenuData.slider.index = Index

                    RageUI.Text({
                        message = Index
                    })
                end)]]

                RageUI.UISliderHeritage("Ressemblance", HeritageIndex, description, function(Hovered, Selected, Active, Heritage, Index)
                    HeritageIndex = Index

                    RageUI.Text({
                        message = Heritage
                    })
                end)

                if (mainMenuData.progress.show) then
                    RageUI.Progress("Progress ", mainMenuData.progress.index, mainMenuData.progress.max, description, true, true, function(Hovered, Selected, Active, Index)
                        mainMenuData.progress.index = Index
                    end)
                end

                RageUI.Button("Another Menu", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                end, updateShowcase)
                
            end, function()
                ---Panels

            end)

        elseif RageUI.Visible(updateShowcase) then
            RageUI.DrawContent({ header = true, glare = false, nstructionalButton = true }, function()

                for i = 1, updateShowcaseData.count do
                    RageUI.Button("Another Sub-Menu " .. i, description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                        if Active then
                        end
                    end, panelShowcase)
                end

            end, function()
                ---Panels
            end)
        elseif RageUI.Visible(panelShowcase) then
            RageUI.DrawContent({ header = false, glare = true, instructionalButton = true }, function()
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
                    RageUI.ColourPanel("Colours", RageUI.HaircutColorsPanel, panelShowcaseData.colors.index_one, panelShowcaseData.colors.index_two, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        panelShowcaseData.colors.index_one = MinimumIndex
                        panelShowcaseData.colors.index_two = CurrentIndex

                        RageUI.Text({
                            message = "Colours Panel | MinimumIndex : " .. MinimumIndex .. " CurrentIndex : " .. CurrentIndex
                        })
                    end)
                end

                if (panelShowcaseData.percentage.enable) then
                    RageUI.PercentagePanel(panelShowcaseData.percentage.index, "HeaderText", "MinText", "MaxText", function(Hovered, Active, Percent)
                        panelShowcaseData.percentage.index = Percent
                        RageUI.Text({
                            message = "Percentage | Current : " .. Percent
                        })
                    end)
                end

                if (panelShowcaseData.horizontal.enable) then
                    RageUI.GridPanelHorizontal(panelShowcaseData.horizontal.x, "LeftText", "RightText", function(Hovered, Active, X)
                        panelShowcaseData.horizontal.x = X
                        RageUI.Text({
                            message = "Grid Panel Horizontal | X : " .. X
                        })
                    end)
                end

                if (panelShowcaseData.vertical.enable) then
                    RageUI.GridPanelVertical(panelShowcaseData.vertical.y, "TopText", "BottomText", function(Hovered, Active, Y)
                        panelShowcaseData.vertical.y = Y
                        RageUI.Text({
                            message = "Grid Panel Vertical | Y : " .. Y
                        })
                    end)
                end

                if (panelShowcaseData.square.enable) then
                    RageUI.GridPanel(panelShowcaseData.square.x, panelShowcaseData.square.y, "TopText", "BottomText", "LeftText", "RightText", function(Hovered, Active, X, Y)
                        panelShowcaseData.square.x = X
                        panelShowcaseData.square.y = Y
                        RageUI.Text({
                            message = "Grid Panel | X :" .. X .. " Y : " .. Y
                        })
                    end)
                end

            end)
        end
    end

end)