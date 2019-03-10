---ColourPanel
---@param Title string
---@param Colours thread
---@param MinimumIndex number
---@param CurrentIndex number
---@param Callback function
---@return nil
---@public
function NativeUI.ColourPanel(Title, Colours, MinimumIndex, CurrentIndex, Callback)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type number
            local Maximum = (#Colours > 9) and 9 or #Colours

            ---@type boolean
            local Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.Box.X + NativeUI.CurrentMenu.SafeZoneSize.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.Box.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, (NativeUI.Settings.Panels.Colour.Box.Width * Maximum), NativeUI.Settings.Panels.Colour.Box.Height)

            ---@type number
            local LeftArrowHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.LeftArrow.X + NativeUI.CurrentMenu.SafeZoneSize.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.LeftArrow.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.LeftArrow.Width, NativeUI.Settings.Panels.Colour.LeftArrow.Height)

            ---@type number
            local RightArrowHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.RightArrow.X + NativeUI.CurrentMenu.SafeZoneSize.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.RightArrow.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.RightArrow.Width, NativeUI.Settings.Panels.Colour.RightArrow.Height)

            ---@type boolean
            local Selected = false

            NativeUI.RenderSprite(NativeUI.Settings.Panels.Colour.Background.Dictionary, NativeUI.Settings.Panels.Colour.Background.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Panels.Colour.Background.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Panels.Colour.LeftArrow.Dictionary, NativeUI.Settings.Panels.Colour.LeftArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.LeftArrow.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.LeftArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.LeftArrow.Width, NativeUI.Settings.Panels.Colour.LeftArrow.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Panels.Colour.RightArrow.Dictionary, NativeUI.Settings.Panels.Colour.RightArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.RightArrow.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.RightArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.RightArrow.Width, NativeUI.Settings.Panels.Colour.RightArrow.Height)

            NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.SelectedRectangle.X + (NativeUI.Settings.Panels.Colour.Box.Width * (CurrentIndex - MinimumIndex)) + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.SelectedRectangle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.SelectedRectangle.Width, NativeUI.Settings.Panels.Colour.SelectedRectangle.Height, 245, 245, 245, 255)

            for Index = 1, Maximum do
                NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.Box.X + (NativeUI.Settings.Panels.Colour.Box.Width * (Index - 1)) + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.Box.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.Box.Width, NativeUI.Settings.Panels.Colour.Box.Height, table.unpack(Colours[MinimumIndex + Index - 1]))
            end

            NativeUI.RenderText((Title and Title or "") .. " (" .. CurrentIndex .. " of " .. #Colours .. ")", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Text.Top.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Text.Top.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Grid.Text.Top.Scale, 245, 245, 245, 255, 1)

            if Hovered or LeftArrowHovered or RightArrowHovered then
                if NativeUI.Settings.Controls.Click.Active then
                    Selected = true

                    if LeftArrowHovered then
                        CurrentIndex = CurrentIndex - 1

                        if CurrentIndex < 1 then
                            CurrentIndex = #Colours
                            MinimumIndex = #Colours - Maximum + 1
                        elseif CurrentIndex < MinimumIndex then
                            MinimumIndex = MinimumIndex - 1
                        end
                    elseif RightArrowHovered then
                        CurrentIndex = CurrentIndex + 1

                        if CurrentIndex > #Colours then
                            CurrentIndex = 1
                            MinimumIndex = 1
                        elseif CurrentIndex > MinimumIndex + Maximum - 1 then
                            MinimumIndex = MinimumIndex + 1
                        end
                    elseif Hovered then
                        for Index = 1, Maximum do
                            if NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Colour.Box.X + (NativeUI.Settings.Panels.Colour.Box.Width * (Index - 1)) + NativeUI.CurrentMenu.SafeZoneSize.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Colour.Box.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Colour.Box.Width, NativeUI.Settings.Panels.Colour.Box.Height) then
                                CurrentIndex = MinimumIndex + Index - 1
                            end
                        end
                    end
                end
            end

            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Panels.Colour.Background.Height + NativeUI.Settings.Panels.Colour.Background.Y

            if (Hovered or LeftArrowHovered or RightArrowHovered) and NativeUI.Settings.Controls.Click.Active then
                NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Select)
            end

            Callback((Hovered or LeftArrowHovered or RightArrowHovered), Selected, MinimumIndex, CurrentIndex)
        end
    end
end
