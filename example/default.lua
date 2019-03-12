Citizen.CreateThread(function()
    local NewMenu = RageUI.CreateMenu("RageUILua", "~b~SHOWCASE", 0, 0)
    --NewMenu:SetSubtitle(math.random(1000,20000))

    NewMenu.Safezone = true
    NewMenu.WidthOffset = 100

    local activeBanner = false;

    local NewMenu2 = RageUI.CreateSubMenu(NewMenu, "RageUILua", "Subtitle2")
    local Indexes = { 1, 1, 2, 1, 1, 1 }

    local Checkedboxes = { false, true, false }
    local Grid = { X = 0.5, Y = 0.5 }
    local Percentage = 0.5
    local Colour = { 1, 1 }
    local Mum, Dad = 0, 0

    local ProgressTable = 1

    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(NewMenu, not RageUI.Visible(NewMenu))
        end
        if RageUI.Visible(NewMenu) then
            -- ShowCursorThisFrame()

            --if activeBanner then
            RageUI.Title()
            --end

            RageUI.Subtitle()
            --RageUI.HeritageWindow(Mum, Dad)
            
            RageUI.List("List", { 1, 2, 3 }, Indexes[1], "Save your current settings. All saving is done on the client side, if you re-install windows you will lose your settings. Settings are shared across all servers using vMenu.", true, function(Hovered, Active, Selected, Index)
                Indexes[1] = Index
            end)

            RageUI.List("List", { 0, 0.0, 0.01 }, Indexes[2], "Save your current settings. All saving is done on the client side, if you re-install windows you will lose your settings. Settings are shared across all servers using vMenu.", true, function(Hovered, Active, Selected, Index)
                Indexes[2] = Index
            end)

            RageUI.Button("Hello 2", test, {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                --RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "→→→"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("Ello2")
                end
            end, NewMenu2)

            RageUI.Progress("Progress item", ProgressTable, 12, "yes", true, true, function(Hovered, Selected, Active, Index)
                --print(Index)
                ProgressTable = Index
            end)

            RageUI.Slider("Progress item", ProgressTable, 12, "yes", true, true, function(Hovered, Selected, Active, Index)
                --print(Index)
                ProgressTable = Index
            end)
            
            RageUI.Button("Hello", math.random(99999999, 999999999999999999999999), {
                LeftBadge = RageUI.BadgeStyle.Ammo,
                --RightBadge = RageUI.BadgeStyle.Gun,
                RightLabel = "→→→"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    Citizen.Trace("Ello2")
                end
            end)

            for i = 0, 13000 do 
                RageUI.Button(i, i, {
                    LeftBadge = RageUI.BadgeStyle.Ammo,
                    --RightBadge = RageUI.BadgeStyle.Gun,
                    RightLabel = "→→→"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        Citizen.Trace("Ello2")
                    end
                end)
            end

            RageUI.Background()
            RageUI.Navigation()
            RageUI.Description()


            --[[
             RageUI.GridPanel(Grid.X, Grid.Y, "TopText", "BottomText", "LeftText", "RightText", function(Hovered, Active, X, Y)
                 Grid.X = X
                 Grid.Y = Y
             end)

             RageUI.PercentagePanel(Percentage, nil, nil, nil, function(Hovered, Active, Percent)
                 Percentage = Percent
             end)
             RageUI.ColourPanel("Colour", RageUI.HaircutColorsPanel, Colour[1], Colour[2], function(Hovered, Active, MinimumIndex, CurrentIndex)
                 Colour[1] = MinimumIndex
                 Colour[2] = CurrentIndex
             end)
             ]]

            RageUI.Render()
        elseif RageUI.Visible(NewMenu2) then
            -- ShowCursorThisFrame()

            RageUI.Title()
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

            RageUI.Background()
            RageUI.Navigation()
            RageUI.Description()
            RageUI.Render()
        end
    end
end)








