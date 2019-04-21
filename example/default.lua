Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUILua", "~b~SHOWCASE", 0, 0)
    mainMenu:SetSubtitle("~b~SHOWCASE - RAGEUI")
    --mainMenu.Safezone = true

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

            for i = 0, 10 do
                RageUI.Button("Hello - " .. i, nil, {
                    RightBadge = RageUI.BadgeStyle.Gun,
                    RightLabel = "Hello im label"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        Citizen.Trace("Ello2")
                    end
                end)
            end

            local Description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

            RageUI.Button("Hello", Description, {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "Hello im label"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("Wsh ALOR")
                end
            end)



            RageUI.Render()
        elseif RageUI.Visible(subMenu) then
            ShowCursorThisFrame()
            RageUI.Banner(true)
            RageUI.Subtitle()

            RageUI.Button("Hello form submenu", math.random(99999999, 999999999999999999999999), {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                --RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "→→→"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("Ello2")
                end
            end)

            RageUI.Render()
        end
    end
end)








