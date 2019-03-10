---Button
---@param Label string
---@param Description string
---@param Enabled boolean
---@param Callback function
---@param Submenu table
---@return nil
---@public
function NativeUI.Button(Label, Description, Style, Enabled, Callback, Submenu)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type number
            local Option = NativeUI.Options + 1

            if NativeUI.CurrentMenu.Pagination.Minimum <= Option and NativeUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type boolean
                local Selected = NativeUI.CurrentMenu.Index == Option

                ---@type boolean
                local Hovered = false

                if not NativeUI.CurrentMenu.SafeZoneSize then
                    NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if NativeUI.CurrentMenu.Safezone then
                        NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height)

                local LeftBadgeOffset = ((Style.LeftBadge == NativeUI.BadgeStyle.None or tonumber(Style.LeftBadge) == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == NativeUI.BadgeStyle.None or tonumber(Style.RightBadge) == nil) and 0 or 27)

                if Hovered and not Selected then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)
                    if NativeUI.CurrentMenu.Controls.Click.Active then
                        NativeUI.CurrentMenu.Index = Option
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    NativeUI.RenderSprite(NativeUI.Settings.Items.Button.SelectedSprite.Dictionary, NativeUI.Settings.Items.Button.SelectedSprite.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.SelectedSprite.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.SelectedSprite.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.SelectedSprite.Height)
                end

                if type(Style) == 'table' then
                    if Style.LeftBadge ~= nil then
                        if Style.LeftBadge ~= NativeUI.BadgeStyle.None and tonumber(Style.LeftBadge) ~= nil then
                            NativeUI.RenderSprite(NativeUI.GetBadgeDictionary(Style.LeftBadge, Selected), NativeUI.GetBadgeTexture(Style.LeftBadge, Selected), NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.LeftBadge.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.LeftBadge.Width, NativeUI.Settings.Items.Button.LeftBadge.Height, NativeUI.GetBadgeColour(Style.LeftBadge, Selected))
                        end
                    end

                    if Style.RightBadge ~= nil then
                        if Style.RightBadge ~= NativeUI.BadgeStyle.None and tonumber(Style.RightBadge) ~= nil then
                            NativeUI.RenderSprite(NativeUI.GetBadgeDictionary(Style.RightBadge, Selected), NativeUI.GetBadgeTexture(Style.RightBadge, Selected), NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightBadge.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightBadge.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.RightBadge.Width, NativeUI.Settings.Items.Button.RightBadge.Height, NativeUI.GetBadgeColour(Style.RightBadge, Selected))
                        end
                    end
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            NativeUI.RenderText(Style.RightLabel, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X - RightBadgeOffset + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 0, 0, 0, 255, 2)
                        end

                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X + LeftBadgeOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            NativeUI.RenderText(Style.RightLabel, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X - RightBadgeOffset + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 245, 245, 245, 255, 2)
                        end

                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X + LeftBadgeOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                        NativeUI.RenderText(RightLabel, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X - RightBadgeOffset + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 163, 159, 148, 255, 2)
                    end

                    NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X + LeftBadgeOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                end

                NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Items.Button.Rectangle.Height

                if Selected and NativeUI.CurrentMenu.Description ~= Description then
                    NativeUI.CurrentMenu.Description = Description or ""

                    local DescriptionLineCount = NativeUI.GetLineCount(NativeUI.CurrentMenu.Description, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Description.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Description.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, NativeUI.Settings.Items.Description.Background.Width + NativeUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        NativeUI.CurrentMenu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        NativeUI.CurrentMenu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                Callback(Hovered, Selected, ((NativeUI.CurrentMenu.Controls.Select.Active or (Hovered and NativeUI.CurrentMenu.Controls.Click.Active)) and Selected))

                if Selected and (NativeUI.CurrentMenu.Controls.Select.Active or (Hovered and NativeUI.CurrentMenu.Controls.Click.Active)) then
                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Select)

                    if Submenu ~= nil then
                        if Submenu() then
                            NativeUI.NextMenu = Submenu
                        end
                    end

                end

            end

            NativeUI.Options = NativeUI.Options + 1
        end
    end
end