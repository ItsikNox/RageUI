Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE", 0, 0)
    mainMenu:SetSubtitle("~b~SHOWCASE - RAGEUI")

    local subMenu = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~ SHOWCASE RAGEUI - SUBMENU")

    local checkbox_boolean = false

    local quantity_number = 1

    local progress_number = 1

    local slider_number = 1

    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then
            RageUI.Header();

            local Title = "Confirmé vous votre achat ? "
            local Description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

            RageUI.Button(Title, Description, { LeftBadge = RageUI.BadgeStyle.Ammo, RightBadge = RageUI.BadgeStyle.Gun, RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("1")
                end
            end)

            RageUI.Checkbox("Activé ceci : ", Description, checkbox_boolean, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                checkbox_boolean = Checked
            end)

            local list_table = {
                {Name = "RageUI", Value = 1},
                {Name = "iTexZoz", Value = 2},
                {Name = "Parow", Value = 3},
            }
            RageUI.List("Projet & contributeur", list_table, quantity_number, Description, true, function(Hovered, Active, Selected, Index)
                quantity_number = Index
            end)

            RageUI.Progress("Niveaux de seum de pichot ", progress_number, 50, Description, true, true, function(Hovered, Selected, Active, Index)
                progress_number = Index
            end)

            RageUI.Slider("Quantité", slider_number, 20, Description, false, true, function(Hovered, Selected, Active, Index)
                slider_number = Index
            end)

            RageUI.Render()
        elseif RageUI.Visible(subMenu) then
            RageUI.Header();

            -- Content

            RageUI.Render()
        end
    end
end)








