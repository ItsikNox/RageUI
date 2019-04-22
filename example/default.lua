Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE", 0, 0)
    mainMenu:SetSubtitle("~b~SHOWCASE - RAGEUI")

    local subMenu = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~ SHOWCASE RAGEUI - SUBMENU")

    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then
            RageUI.Header();

             local Title = "Confirmé vous votre achat ? "
             local Description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

            RageUI.Button(Title, Description, {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "→→→"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("1")
                end
            end)


            RageUI.Button("SubMenu", Description, {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "→→→"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("submenu")
                end
            end, subMenu)


            RageUI.Render()
        elseif RageUI.Visible(subMenu) then
            RageUI.Header();

            -- Content

            RageUI.Render()
        end
    end
end)








