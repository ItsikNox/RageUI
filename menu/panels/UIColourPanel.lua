---ColourPanel
---@param Title string
---@param Colours thread
---@param MinimumIndex number
---@param CurrentIndex number
---@param Callback function
---@return nil
---@public
function RageUI.ColourPanel(Title, Colours, MinimumIndex, CurrentIndex, Callback)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

            ---@type number
            local Maximum = (#Colours > 9) and 9 or #Colours

            ---@type boolean
            local Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.Box.X + RageUI.CurrentMenu.SafeZoneSize.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.Box.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, (RageUI.Settings.Panels.Colour.Box.Width * Maximum), RageUI.Settings.Panels.Colour.Box.Height)

            ---@type number
            local LeftArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.LeftArrow.X + RageUI.CurrentMenu.SafeZoneSize.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.LeftArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.LeftArrow.Width, RageUI.Settings.Panels.Colour.LeftArrow.Height)

            ---@type number
            local RightArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.RightArrow.X + RageUI.CurrentMenu.SafeZoneSize.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.RightArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.RightArrow.Width, RageUI.Settings.Panels.Colour.RightArrow.Height)

            ---@type boolean
            local Selected = false

            RageUI.RenderSprite(RageUI.Settings.Panels.Colour.Background.Dictionary, RageUI.Settings.Panels.Colour.Background.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Panels.Colour.Background.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Colour.LeftArrow.Dictionary, RageUI.Settings.Panels.Colour.LeftArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.LeftArrow.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.LeftArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.LeftArrow.Width, RageUI.Settings.Panels.Colour.LeftArrow.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Colour.RightArrow.Dictionary, RageUI.Settings.Panels.Colour.RightArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.RightArrow.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.RightArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.RightArrow.Width, RageUI.Settings.Panels.Colour.RightArrow.Height)

            RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.SelectedRectangle.X + (RageUI.Settings.Panels.Colour.Box.Width * (CurrentIndex - MinimumIndex)) + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.SelectedRectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.SelectedRectangle.Width, RageUI.Settings.Panels.Colour.SelectedRectangle.Height, 245, 245, 245, 255)

            for Index = 1, Maximum do
                RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.Box.X + (RageUI.Settings.Panels.Colour.Box.Width * (Index - 1)) + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.Box.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.Box.Width, RageUI.Settings.Panels.Colour.Box.Height, table.unpack(Colours[MinimumIndex + Index - 1]))
            end

            RageUI.RenderText((Title and Title or "") .. " (" .. CurrentIndex .. " of " .. #Colours .. ")", RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid.Text.Top.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid.Text.Top.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid.Text.Top.Scale, 245, 245, 245, 255, 1)

            if Hovered or LeftArrowHovered or RightArrowHovered then
                if RageUI.Settings.Controls.Click.Active then
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
                            if RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Colour.Box.X + (RageUI.Settings.Panels.Colour.Box.Width * (Index - 1)) + RageUI.CurrentMenu.SafeZoneSize.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Colour.Box.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Colour.Box.Width, RageUI.Settings.Panels.Colour.Box.Height) then
                                CurrentIndex = MinimumIndex + Index - 1
                            end
                        end
                    end
                end
            end

            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Panels.Colour.Background.Height + RageUI.Settings.Panels.Colour.Background.Y

            if (Hovered or LeftArrowHovered or RightArrowHovered) and RageUI.Settings.Controls.Click.Active then
                RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
            end

            Callback((Hovered or LeftArrowHovered or RightArrowHovered), Selected, MinimumIndex, CurrentIndex)
        end
    end
end
