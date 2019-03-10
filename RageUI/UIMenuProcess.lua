---GoUp
---@param Options number
---@return nil
---@public
function RageUI.GoUp(Options)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then
            if Options > RageUI.CurrentMenu.Pagination.Total then
                if RageUI.CurrentMenu.Index <= RageUI.CurrentMenu.Pagination.Minimum then
                    if RageUI.CurrentMenu.Index == 1 then
                        RageUI.CurrentMenu.Pagination.Minimum = Options - (RageUI.CurrentMenu.Pagination.Total - 1)
                        RageUI.CurrentMenu.Pagination.Maximum = Options
                        RageUI.CurrentMenu.Index = Options
                    else
                        RageUI.CurrentMenu.Pagination.Minimum = RageUI.CurrentMenu.Pagination.Minimum - 1
                        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Maximum - 1
                        RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index - 1
                    end
                else
                    RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index - 1
                end
            else
                if RageUI.CurrentMenu.Index == 1 then
                    RageUI.CurrentMenu.Pagination.Minimum = Options - (RageUI.CurrentMenu.Pagination.Total - 1)
                    RageUI.CurrentMenu.Pagination.Maximum = Options
                    RageUI.CurrentMenu.Index = Options
                else
                    RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index - 1
                end
            end

            RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.UpDown)
        end
    end
end

---GoDown
---@param Options number
---@return nil
---@public
function RageUI.GoDown(Options)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then
            if Options > RageUI.CurrentMenu.Pagination.Total then
                if RageUI.CurrentMenu.Index >= RageUI.CurrentMenu.Pagination.Maximum then
                    if RageUI.CurrentMenu.Index == Options then
                        RageUI.CurrentMenu.Pagination.Minimum = 1
                        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Total
                        RageUI.CurrentMenu.Index = 1
                    else
                        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Maximum + 1
                        RageUI.CurrentMenu.Pagination.Minimum = RageUI.CurrentMenu.Pagination.Maximum - (RageUI.CurrentMenu.Pagination.Total - 1)
                        RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index + 1
                    end
                else
                    RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index + 1
                end
            else
                if RageUI.CurrentMenu.Index == Options then
                    RageUI.CurrentMenu.Pagination.Minimum = 1
                    RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Total
                    RageUI.CurrentMenu.Index = 1
                else
                    RageUI.CurrentMenu.Index = RageUI.CurrentMenu.Index + 1
                end
            end

            RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.UpDown)
        end
    end
end

---Controls
---@return nil
---@public
function RageUI.Controls()
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then
            if RageUI.CurrentMenu.Open then

                ---@type number
                local Options = RageUI.Options

                DisableAllControlActions(2)

                if not IsInputDisabled(2) then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Enabled.Controller do
                        EnableControlAction(RageUI.CurrentMenu.Controls.Enabled.Controller[Index][1], RageUI.CurrentMenu.Controls.Enabled.Controller[Index][2], true)
                    end
                else
                    for Index = 1, #RageUI.CurrentMenu.Controls.Enabled.Keyboard do
                        EnableControlAction(RageUI.CurrentMenu.Controls.Enabled.Keyboard[Index][1], RageUI.CurrentMenu.Controls.Enabled.Keyboard[Index][2], true)
                    end
                end

                if RageUI.CurrentMenu.Controls.Up.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Up.Keys do
                        if not RageUI.CurrentMenu.Controls.Up.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Up.Keys[Index][1], RageUI.CurrentMenu.Controls.Up.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Up.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.GoUp(Options)

                                    Citizen.Wait(175)

                                    while RageUI.CurrentMenu.Controls.Up.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Up.Keys[Index][1], RageUI.CurrentMenu.Controls.Up.Keys[Index][2]) do
                                        RageUI.GoUp(Options)

                                        Citizen.Wait(125)
                                    end

                                    RageUI.CurrentMenu.Controls.Up.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Down.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Down.Keys do
                        if not RageUI.CurrentMenu.Controls.Down.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Down.Keys[Index][1], RageUI.CurrentMenu.Controls.Down.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Down.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.GoDown(Options)

                                    Citizen.Wait(175)

                                    while RageUI.CurrentMenu.Controls.Down.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Down.Keys[Index][1], RageUI.CurrentMenu.Controls.Down.Keys[Index][2]) do
                                        RageUI.GoDown(Options)

                                        Citizen.Wait(125)
                                    end

                                    RageUI.CurrentMenu.Controls.Down.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Left.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Left.Keys do
                        if not RageUI.CurrentMenu.Controls.Left.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Left.Keys[Index][1], RageUI.CurrentMenu.Controls.Left.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Left.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.CurrentMenu.Controls.Left.Active = true

                                    Citizen.Wait(0.01)

                                    RageUI.CurrentMenu.Controls.Left.Active = false

                                    Citizen.Wait(174.99)

                                    while RageUI.CurrentMenu.Controls.Left.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Left.Keys[Index][1], RageUI.CurrentMenu.Controls.Left.Keys[Index][2]) do
                                        RageUI.CurrentMenu.Controls.Left.Active = true

                                        Citizen.Wait(0.01)

                                        RageUI.CurrentMenu.Controls.Left.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    RageUI.CurrentMenu.Controls.Left.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Right.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Right.Keys do
                        if not RageUI.CurrentMenu.Controls.Right.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Right.Keys[Index][1], RageUI.CurrentMenu.Controls.Right.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Right.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.CurrentMenu.Controls.Right.Active = true

                                    Citizen.Wait(0.01)

                                    RageUI.CurrentMenu.Controls.Right.Active = false

                                    Citizen.Wait(174.99)

                                    while RageUI.CurrentMenu.Controls.Right.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Right.Keys[Index][1], RageUI.CurrentMenu.Controls.Right.Keys[Index][2]) do
                                        RageUI.CurrentMenu.Controls.Right.Active = true

                                        Citizen.Wait(1)

                                        RageUI.CurrentMenu.Controls.Right.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    RageUI.CurrentMenu.Controls.Right.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Select.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Select.Keys do
                        if not RageUI.CurrentMenu.Controls.Select.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Select.Keys[Index][1], RageUI.CurrentMenu.Controls.Select.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Select.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.CurrentMenu.Controls.Select.Active = true

                                    Citizen.Wait(0.01)

                                    RageUI.CurrentMenu.Controls.Select.Active = false

                                    Citizen.Wait(174.99)

                                    while RageUI.CurrentMenu.Controls.Select.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Select.Keys[Index][1], RageUI.CurrentMenu.Controls.Select.Keys[Index][2]) do
                                        RageUI.CurrentMenu.Controls.Select.Active = true

                                        Citizen.Wait(0.01)

                                        RageUI.CurrentMenu.Controls.Select.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    RageUI.CurrentMenu.Controls.Select.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Click.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Click.Keys do
                        if not RageUI.CurrentMenu.Controls.Click.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Click.Keys[Index][1], RageUI.CurrentMenu.Controls.Click.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Click.Pressed = true

                                Citizen.CreateThread(function()
                                    RageUI.CurrentMenu.Controls.Click.Active = true

                                    Citizen.Wait(0.01)

                                    RageUI.CurrentMenu.Controls.Click.Active = false

                                    Citizen.Wait(174.99)

                                    while RageUI.CurrentMenu.Controls.Click.Enabled and IsDisabledControlPressed(RageUI.CurrentMenu.Controls.Click.Keys[Index][1], RageUI.CurrentMenu.Controls.Click.Keys[Index][2]) do
                                        RageUI.CurrentMenu.Controls.Click.Active = true

                                        Citizen.Wait(0.01)

                                        RageUI.CurrentMenu.Controls.Click.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    RageUI.CurrentMenu.Controls.Click.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if RageUI.CurrentMenu.Controls.Back.Enabled then
                    for Index = 1, #RageUI.CurrentMenu.Controls.Back.Keys do
                        if not RageUI.CurrentMenu.Controls.Back.Pressed then
                            if IsDisabledControlJustPressed(RageUI.CurrentMenu.Controls.Back.Keys[Index][1], RageUI.CurrentMenu.Controls.Back.Keys[Index][2]) then
                                RageUI.CurrentMenu.Controls.Back.Pressed = true
                                break
                            end
                        end
                    end
                end

            end
        end
    end
end

---Navigation
---@return nil
---@public
function RageUI.Navigation()
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then
            if RageUI.Options > RageUI.CurrentMenu.Pagination.Total then

                ---@type boolean
                local UpHovered = false

                ---@type boolean
                local DownHovered = false

                if not RageUI.CurrentMenu.SafeZoneSize then
                    RageUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if RageUI.CurrentMenu.Safezone then
                        RageUI.CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                UpHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height)
                DownHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Navigation.Rectangle.Height + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height)

                if RageUI.CurrentMenu.Controls.Click.Active then
                    if UpHovered then
                        RageUI.GoUp(RageUI.Options)
                    elseif DownHovered then
                        RageUI.GoDown(RageUI.Options)
                    end
                end

                if UpHovered then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                else
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end

                if DownHovered then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Navigation.Rectangle.Height + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                else
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Navigation.Rectangle.Height + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end

                RageUI.RenderSprite(RageUI.Settings.Items.Navigation.Arrows.Dictionary, RageUI.Settings.Items.Navigation.Arrows.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.Navigation.Arrows.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Items.Navigation.Arrows.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Navigation.Arrows.Width, RageUI.Settings.Items.Navigation.Arrows.Height)

                RageUI.ItemOffset = RageUI.ItemOffset + (RageUI.Settings.Items.Navigation.Rectangle.Height * 2)
            end
        end
    end
end
