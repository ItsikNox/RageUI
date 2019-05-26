Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE", 0, 0)
    mainMenu.Closed = function()
        Citizen.Trace("main menu closed")
    end
    mainMenu:SetSubtitle("~b~SHOWCASE - RAGEUI")
    mainMenu.EnableMouse = true;

    local subMenu = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~ SHOWCASE RAGEUI - SUBMENU - 1")
    subMenu.EnableMouse = true;

    local subMenuToSubMenu = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~ SHOWCASE RAGEUI - SUBMENU - 2")
    subMenuToSubMenu.EnableMouse = true;

    local Description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

    local checkbox_boolean = false

    local quantity_number = 1

    local progress_number = 1

    local slider_number = 1

    local colour_table = { 1, 1 }

    local percentage_float = 0.5

    Grid1x5X = 0
    local grid_5x5 = { X = 0.5, Y = 0.5 }

    local interger = 0
    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then
            RageUI.Header();

            for i = 1, 50 do
                RageUI.Button("Panels", Description, { LeftBadge = RageUI.BadgeStyle.Gun, RightBadge = RageUI.BadgeStyle.Heart, RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if Selected then

                    end
                end, subMenu)
            end

            RageUI.Checkbox("Activé ceci : ", Description, checkbox_boolean, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                checkbox_boolean = Checked
            end)

            local list_table = {
                { Name = "RageUI", Value = 1 },
                { Name = "iTexZoz", Value = 2 },
                { Name = "Parow", Value = 3 },
                { Name = "TDLC", Value = 3 },
                { Name = "Frazzle", Value = 3 },
            }
            RageUI.List("Projet & contributeur", list_table, quantity_number, Description, true, function(Hovered, Active, Selected, Index)
                quantity_number = Index
            end)

            RageUI.Progress("Progress ", progress_number, 50, Description, true, true, function(Hovered, Selected, Active, Index)
                progress_number = Index
            end)

            RageUI.Slider("Quantité", slider_number, 20, Description, false, true, function(Hovered, Selected, Active, Index)
                slider_number = Index
            end)

            --[[
            RageUI.Button("~b~Ajout +1", "Ajouter 1 item", { RightBadge = RageUI.BadgeStyle.Tick, RightLabel = "+1" }, true, function(Hovered, Active, Selected)
                if Selected then
                    interger = interger + 1
                end
            end)
            RageUI.Button("~r~Suppression", "Delete 1 item", { RightBadge = RageUI.BadgeStyle.Alert, RightLabel = "-1" }, true, function(Hovered, Active, Selected)
                if Selected then
                    interger = interger - 1
                end
            end)
            if interger ~= 0 then
                for i = 1, interger do
                    RageUI.Button("Item - N°"..i, "Mise a jour en temps reel du menu.", {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            interger = interger - 1
                        end
                    end)
                end
            end
            ]]--

            RageUI.Background();
            RageUI.Navigation();
            RageUI.Description();
            RageUI.Render()
        elseif RageUI.Visible(subMenu) then
            RageUI.Header();

            for i = 1, 2500 do
                RageUI.Button("UIButton - " .. i, Description, { }, true, function(Hovered, Active, Selected)
                    if Active then
                    end
                end, subMenuToSubMenu)

            end

            RageUI.Button("Percentage panel", Description, { }, true, function(Hovered, Active, Selected)
                if Selected then
                end
            end)

            RageUI.Button("5x5 Grid Panel", Description, { }, true, function(Hovered, Active, Selected)
                if Selected then
                end
            end)

            RageUI.Button("1x5 Grid Panel", Description, { }, true, function(Hovered, Active, Selected)
                if Active then
                end
            end)

            RageUI.Button("5x1 Grid Panel", Description, { }, true, function(Hovered, Active, Selected)
                if Selected then
                end
            end)

            RageUI.Background();
            RageUI.Navigation();
            RageUI.Description();

            -- Panel

            RageUI.GridPanelHorizontal(Grid1x5X, "TopText", "ddd","LeftText", "RightText", function(Hovered, Active, X)
                Grid1x5X = X
            end)

            --[[
            RageUI.ColourPanel("Colour", RageUI.HaircutColorsPanel, colour_table[1], colour_table[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                colour_table[1] = MinimumIndex
                colour_table[2] = CurrentIndex
            end)

            RageUI.PercentagePanel(percentage_float, nil, nil, nil, function(Hovered, Active, Percent)
                percentage_float = Percent
            end)

            RageUI.GridPanel(grid_5x5.X, grid_5x5.Y, "TopText", "BottomText", "LeftText", "RightText", function(Hovered, Active, X, Y)
                grid_5x5.X = X
                grid_5x5.Y = Y
            end)
            ]]
            RageUI.Render()
        elseif RageUI.Visible(subMenuToSubMenu) then

            RageUI.Header();

            for i = 1, 50 do
                RageUI.Button("Encore des UIButton - " .. i, Description, { }, true, function(Hovered, Active, Selected)
                    if Active then
                    end
                end)
            end

            RageUI.Background();
            RageUI.Navigation();
            RageUI.Description();
            RageUI.Render()

        end
        DisplayRadar(false)
    end

end)

