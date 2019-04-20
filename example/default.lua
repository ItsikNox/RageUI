Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUILua", "~b~SHOWCASE", 0, 100)
    mainMenu:SetSubtitle("~b~SHOWCASE - RAGEUI")
    mainMenu.Safezone = true

    local subMenu = RageUI.CreateSubMenu(mainMenu, "RageUILua", "~b~ SHOWCASE RAGEUI - SUBMENU")

    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then
            ShowCursorThisFrame()
            RageUI.Banner(true)
            RageUI.Subtitle()

            for i = 0, 13 do
                RageUI.Button("Hello", nil, {
                    LeftBadge = RageUI.BadgeStyle.Ammo,
                    RightBadge = RageUI.BadgeStyle.Gun,
                    RightLabel = "Hello im label"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        Citizen.Trace("Ello2")
                    end
                end)

            end

            RageUI.Button("Hello", "iTexZoz", {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "Hello im label"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("Ello2")
                end
            end)

            RageUI.Background()
            RageUI.Navigation()

            if mainMenu.Description ~= nil then
                RageUI.Description()
            end

        RageUI.Render()
        elseif RageUI.Visible(subMenu) then
    ShowCursorThisFrame()
        RageUI.Banner(true)
        RageUI.Subtitle()



    RageUI.Background()
    RageUI.Navigation()
    RageUI.Description()
    RageUI.Render()
        end
    end
end)








