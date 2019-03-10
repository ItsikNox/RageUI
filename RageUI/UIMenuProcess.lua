---GoUp
---@param Options number
---@return nil
---@public
function NativeUI.GoUp(Options)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if Options > NativeUI.CurrentMenu.Pagination.Total then
                if NativeUI.CurrentMenu.Index <= NativeUI.CurrentMenu.Pagination.Minimum then
                    if NativeUI.CurrentMenu.Index == 1 then
                        NativeUI.CurrentMenu.Pagination.Minimum = Options - (NativeUI.CurrentMenu.Pagination.Total - 1)
                        NativeUI.CurrentMenu.Pagination.Maximum = Options
                        NativeUI.CurrentMenu.Index = Options
                    else
                        NativeUI.CurrentMenu.Pagination.Minimum = NativeUI.CurrentMenu.Pagination.Minimum - 1
                        NativeUI.CurrentMenu.Pagination.Maximum = NativeUI.CurrentMenu.Pagination.Maximum - 1
                        NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index - 1
                    end
                else
                    NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index - 1
                end
            else
                if NativeUI.CurrentMenu.Index == 1 then
                    NativeUI.CurrentMenu.Pagination.Minimum = Options - (NativeUI.CurrentMenu.Pagination.Total - 1)
                    NativeUI.CurrentMenu.Pagination.Maximum = Options
                    NativeUI.CurrentMenu.Index = Options
                else
                    NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index - 1
                end
            end

            NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.UpDown)
        end
    end
end

---GoDown
---@param Options number
---@return nil
---@public
function NativeUI.GoDown(Options)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if Options > NativeUI.CurrentMenu.Pagination.Total then
                if NativeUI.CurrentMenu.Index >= NativeUI.CurrentMenu.Pagination.Maximum then
                    if NativeUI.CurrentMenu.Index == Options then
                        NativeUI.CurrentMenu.Pagination.Minimum = 1
                        NativeUI.CurrentMenu.Pagination.Maximum = NativeUI.CurrentMenu.Pagination.Total
                        NativeUI.CurrentMenu.Index = 1
                    else
                        NativeUI.CurrentMenu.Pagination.Maximum = NativeUI.CurrentMenu.Pagination.Maximum + 1
                        NativeUI.CurrentMenu.Pagination.Minimum = NativeUI.CurrentMenu.Pagination.Maximum - (NativeUI.CurrentMenu.Pagination.Total - 1)
                        NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index + 1
                    end
                else
                    NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index + 1
                end
            else
                if NativeUI.CurrentMenu.Index == Options then
                    NativeUI.CurrentMenu.Pagination.Minimum = 1
                    NativeUI.CurrentMenu.Pagination.Maximum = NativeUI.CurrentMenu.Pagination.Total
                    NativeUI.CurrentMenu.Index = 1
                else
                    NativeUI.CurrentMenu.Index = NativeUI.CurrentMenu.Index + 1
                end
            end

            NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.UpDown)
        end
    end
end

---Controls
---@return nil
---@public
function NativeUI.Controls()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if NativeUI.CurrentMenu.Open then

                ---@type number
                local Options = NativeUI.Options

                DisableAllControlActions(2)

                if not IsInputDisabled(2) then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Enabled.Controller do
                        EnableControlAction(NativeUI.CurrentMenu.Controls.Enabled.Controller[Index][1], NativeUI.CurrentMenu.Controls.Enabled.Controller[Index][2], true)
                    end
                else
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Enabled.Keyboard do
                        EnableControlAction(NativeUI.CurrentMenu.Controls.Enabled.Keyboard[Index][1], NativeUI.CurrentMenu.Controls.Enabled.Keyboard[Index][2], true)
                    end
                end

                if NativeUI.CurrentMenu.Controls.Up.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Up.Keys do
                        if not NativeUI.CurrentMenu.Controls.Up.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Up.Keys[Index][1], NativeUI.CurrentMenu.Controls.Up.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Up.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.GoUp(Options)

                                    Citizen.Wait(175)

                                    while NativeUI.CurrentMenu.Controls.Up.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Up.Keys[Index][1], NativeUI.CurrentMenu.Controls.Up.Keys[Index][2]) do
                                        NativeUI.GoUp(Options)

                                        Citizen.Wait(125)
                                    end

                                    NativeUI.CurrentMenu.Controls.Up.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Down.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Down.Keys do
                        if not NativeUI.CurrentMenu.Controls.Down.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Down.Keys[Index][1], NativeUI.CurrentMenu.Controls.Down.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Down.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.GoDown(Options)

                                    Citizen.Wait(175)

                                    while NativeUI.CurrentMenu.Controls.Down.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Down.Keys[Index][1], NativeUI.CurrentMenu.Controls.Down.Keys[Index][2]) do
                                        NativeUI.GoDown(Options)

                                        Citizen.Wait(125)
                                    end

                                    NativeUI.CurrentMenu.Controls.Down.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Left.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Left.Keys do
                        if not NativeUI.CurrentMenu.Controls.Left.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Left.Keys[Index][1], NativeUI.CurrentMenu.Controls.Left.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Left.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.CurrentMenu.Controls.Left.Active = true

                                    Citizen.Wait(0.01)

                                    NativeUI.CurrentMenu.Controls.Left.Active = false

                                    Citizen.Wait(174.99)

                                    while NativeUI.CurrentMenu.Controls.Left.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Left.Keys[Index][1], NativeUI.CurrentMenu.Controls.Left.Keys[Index][2]) do
                                        NativeUI.CurrentMenu.Controls.Left.Active = true

                                        Citizen.Wait(0.01)

                                        NativeUI.CurrentMenu.Controls.Left.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    NativeUI.CurrentMenu.Controls.Left.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Right.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Right.Keys do
                        if not NativeUI.CurrentMenu.Controls.Right.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Right.Keys[Index][1], NativeUI.CurrentMenu.Controls.Right.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Right.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.CurrentMenu.Controls.Right.Active = true

                                    Citizen.Wait(0.01)

                                    NativeUI.CurrentMenu.Controls.Right.Active = false

                                    Citizen.Wait(174.99)

                                    while NativeUI.CurrentMenu.Controls.Right.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Right.Keys[Index][1], NativeUI.CurrentMenu.Controls.Right.Keys[Index][2]) do
                                        NativeUI.CurrentMenu.Controls.Right.Active = true

                                        Citizen.Wait(1)

                                        NativeUI.CurrentMenu.Controls.Right.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    NativeUI.CurrentMenu.Controls.Right.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Select.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Select.Keys do
                        if not NativeUI.CurrentMenu.Controls.Select.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Select.Keys[Index][1], NativeUI.CurrentMenu.Controls.Select.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Select.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.CurrentMenu.Controls.Select.Active = true

                                    Citizen.Wait(0.01)

                                    NativeUI.CurrentMenu.Controls.Select.Active = false

                                    Citizen.Wait(174.99)

                                    while NativeUI.CurrentMenu.Controls.Select.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Select.Keys[Index][1], NativeUI.CurrentMenu.Controls.Select.Keys[Index][2]) do
                                        NativeUI.CurrentMenu.Controls.Select.Active = true

                                        Citizen.Wait(0.01)

                                        NativeUI.CurrentMenu.Controls.Select.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    NativeUI.CurrentMenu.Controls.Select.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Click.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Click.Keys do
                        if not NativeUI.CurrentMenu.Controls.Click.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Click.Keys[Index][1], NativeUI.CurrentMenu.Controls.Click.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Click.Pressed = true

                                Citizen.CreateThread(function()
                                    NativeUI.CurrentMenu.Controls.Click.Active = true

                                    Citizen.Wait(0.01)

                                    NativeUI.CurrentMenu.Controls.Click.Active = false

                                    Citizen.Wait(174.99)

                                    while NativeUI.CurrentMenu.Controls.Click.Enabled and IsDisabledControlPressed(NativeUI.CurrentMenu.Controls.Click.Keys[Index][1], NativeUI.CurrentMenu.Controls.Click.Keys[Index][2]) do
                                        NativeUI.CurrentMenu.Controls.Click.Active = true

                                        Citizen.Wait(0.01)

                                        NativeUI.CurrentMenu.Controls.Click.Active = false

                                        Citizen.Wait(124.99)
                                    end

                                    NativeUI.CurrentMenu.Controls.Click.Pressed = false
                                end)

                                break
                            end
                        end
                    end
                end

                if NativeUI.CurrentMenu.Controls.Back.Enabled then
                    for Index = 1, #NativeUI.CurrentMenu.Controls.Back.Keys do
                        if not NativeUI.CurrentMenu.Controls.Back.Pressed then
                            if IsDisabledControlJustPressed(NativeUI.CurrentMenu.Controls.Back.Keys[Index][1], NativeUI.CurrentMenu.Controls.Back.Keys[Index][2]) then
                                NativeUI.CurrentMenu.Controls.Back.Pressed = true
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
function NativeUI.Navigation()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if NativeUI.Options > NativeUI.CurrentMenu.Pagination.Total then

                ---@type boolean
                local UpHovered = false

                ---@type boolean
                local DownHovered = false

                if not NativeUI.CurrentMenu.SafeZoneSize then
                    NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if NativeUI.CurrentMenu.Safezone then
                        NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                UpHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height)
                DownHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Navigation.Rectangle.Height + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height)

                if NativeUI.CurrentMenu.Controls.Click.Active then
                    if UpHovered then
                        NativeUI.GoUp(NativeUI.Options)
                    elseif DownHovered then
                        NativeUI.GoDown(NativeUI.Options)
                    end
                end

                if UpHovered then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                else
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end

                if DownHovered then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Navigation.Rectangle.Height + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height, 30, 30, 30, 255)
                else
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Navigation.Rectangle.Height + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Navigation.Rectangle.Height, 0, 0, 0, 200)
                end

                NativeUI.RenderSprite(NativeUI.Settings.Items.Navigation.Arrows.Dictionary, NativeUI.Settings.Items.Navigation.Arrows.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Navigation.Arrows.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Navigation.Arrows.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Navigation.Arrows.Width, NativeUI.Settings.Items.Navigation.Arrows.Height)

                NativeUI.ItemOffset = NativeUI.ItemOffset + (NativeUI.Settings.Items.Navigation.Rectangle.Height * 2)
            end
        end
    end
end
