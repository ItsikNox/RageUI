---Button
---@param Label string
---@param Description string
---@param Enabled boolean
---@param Callback function
---@param Submenu table
---@return nil
---@public
function RageUI.Button(Label, Description, Style, Enabled, Callback, Submenu)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1

            if RageUI.CurrentMenu.Pagination.Minimum <= Option and RageUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type boolean
                local Selected = RageUI.CurrentMenu.Index == Option

                ---@type boolean
                local Hovered = false

                if not RageUI.CurrentMenu.SafeZoneSize then
                    RageUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if RageUI.CurrentMenu.Safezone then
                        RageUI.CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height)

                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or tonumber(Style.LeftBadge) == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or tonumber(Style.RightBadge) == nil) and 0 or 27)


                if Hovered and not Selected then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)
                    if RageUI.CurrentMenu.Controls.Click.Active then
                        RageUI.CurrentMenu.Index = Option
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    RageUI.RenderSprite(RageUI.Settings.Items.Button.SelectedSprite.Dictionary, RageUI.Settings.Items.Button.SelectedSprite.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.SelectedSprite.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.SelectedSprite.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.SelectedSprite.Height)
                end

                if type(Style) == 'table' then
                    if Style.LeftBadge ~= nil then
                        if Style.LeftBadge ~= RageUI.BadgeStyle.None and tonumber(Style.LeftBadge) ~= nil then
                            RageUI.RenderSprite(RageUI.GetBadgeDictionary(Style.LeftBadge, Selected), RageUI.GetBadgeTexture(Style.LeftBadge, Selected), RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.LeftBadge.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.LeftBadge.Width, RageUI.Settings.Items.Button.LeftBadge.Height, RageUI.GetBadgeColour(Style.LeftBadge, Selected))
                        end
                    end

                    if Style.RightBadge ~= nil then
                        if Style.RightBadge ~= RageUI.BadgeStyle.None and tonumber(Style.RightBadge) ~= nil then
                            RageUI.RenderSprite(RageUI.GetBadgeDictionary(Style.RightBadge, Selected), RageUI.GetBadgeTexture(Style.RightBadge, Selected), RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightBadge.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightBadge.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.RightBadge.Width, RageUI.Settings.Items.Button.RightBadge.Height, RageUI.GetBadgeColour(Style.RightBadge, Selected))
                        end
                    end
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RageUI.RenderText(Style.RightLabel, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X - RightBadgeOffset + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 0, 0, 0, 255, 2)
                        end

                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X + LeftBadgeOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RageUI.RenderText(Style.RightLabel, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X - RightBadgeOffset + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 245, 245, 245, 255, 2)
                        end

                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X + LeftBadgeOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                        RageUI.RenderText(RightLabel, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X - RightBadgeOffset + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 163, 159, 148, 255, 2)
                    end

                    RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X + LeftBadgeOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                end

                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Button.Rectangle.Height

                if Selected and RageUI.CurrentMenu.Description ~= Description then
                    RageUI.CurrentMenu.Description = Description or ""

                    local DescriptionLineCount = RageUI.GetLineCount(RageUI.CurrentMenu.Description, RageUI.CurrentMenu.X + RageUI.Settings.Items.Description.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Description.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUI.Settings.Items.Description.Background.Width + RageUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                Callback(Hovered, Selected, ((RageUI.CurrentMenu.Controls.Select.Active or (Hovered and RageUI.CurrentMenu.Controls.Click.Active)) and Selected))

                if Selected and (RageUI.CurrentMenu.Controls.Select.Active or (Hovered and RageUI.CurrentMenu.Controls.Click.Active)) then
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)

                    if Submenu ~= nil then
                        if Submenu() then
                            RageUI.NextMenu = Submenu
                        end
                    end

                end

            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end