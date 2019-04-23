---Slider
---@param Label string
---@param Number of choice
---@param Progress MAX
---@param Description string
---@param Divider number
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function RageUI.Slider(Label, ProgressStart, ProgressMax, Description, Divider, Enabled, Callback) -- A FAIRE : Changer le slider pour qu'il bouge entre 0 et X sinon il dépasse
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

            local Items = {}
            for i = 1, ProgressMax do 
                table.insert(Items,i)
            end
            ---@type number
            local Option = RageUI.Options + 1

            if RageUI.CurrentMenu.Pagination.Minimum <= Option and RageUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = RageUI.CurrentMenu.Index == Option

                ---@type boolean
                local Hovered = false

                ---@type boolean
                local LeftArrowHovered, RightArrowHovered = false, false

                if not RageUI.CurrentMenu.SafeZoneSize then
                    RageUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if RageUI.CurrentMenu.Safezone then
                        RageUI.CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height)

                if Hovered and not Selected then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)
                    if RageUI.CurrentMenu.Controls.Click.Active then
                        RageUI.CurrentMenu.Index = Option
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    RageUI.RenderSprite(RageUI.Settings.Items.Button.SelectedSprite.Dictionary, RageUI.Settings.Items.Button.SelectedSprite.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.SelectedSprite.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.SelectedSprite.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.LeftArrow.X + RageUI.CurrentMenu.SafeZoneSize.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.LeftArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.LeftArrow.Width, RageUI.Settings.Items.Slider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.RightArrow.X + RageUI.CurrentMenu.SafeZoneSize.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.RightArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.RightArrow.Width, RageUI.Settings.Items.Slider.RightArrow.Height)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)

                        RageUI.RenderSprite(RageUI.Settings.Items.Slider.LeftArrow.Dictionary, RageUI.Settings.Items.Slider.LeftArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.LeftArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.LeftArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.LeftArrow.Width, RageUI.Settings.Items.Slider.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RageUI.RenderSprite(RageUI.Settings.Items.Slider.RightArrow.Dictionary, RageUI.Settings.Items.Slider.RightArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.RightArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.RightArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.RightArrow.Width, RageUI.Settings.Items.Slider.RightArrow.Height, 0, 0, 0, 0, 255)
                    else
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RageUI.RenderSprite(RageUI.Settings.Items.Slider.LeftArrow.Dictionary, RageUI.Settings.Items.Slider.LeftArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.LeftArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.LeftArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.LeftArrow.Width, RageUI.Settings.Items.Slider.LeftArrow.Height, 163, 159, 148, 255)
                        RageUI.RenderSprite(RageUI.Settings.Items.Slider.RightArrow.Dictionary, RageUI.Settings.Items.Slider.RightArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.RightArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.RightArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.RightArrow.Width, RageUI.Settings.Items.Slider.RightArrow.Height, 163, 159, 148, 255)
                    end
                end

                RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.Background.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.Background.Width, RageUI.Settings.Items.Slider.Background.Height, 4, 32, 57, 255)
                RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.Slider.X + (((RageUI.Settings.Items.Slider.Background.Width - RageUI.Settings.Items.Slider.Slider.Width) / (#Items - 1)) * (ProgressStart - 1)) + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.Slider.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.Slider.Width, RageUI.Settings.Items.Slider.Slider.Height, 57, 116, 200, 255)

                if Divider then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Slider.Divider.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Slider.Divider.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Slider.Divider.Width, RageUI.Settings.Items.Slider.Divider.Height, 245, 245, 245, 255)
                end

                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Button.Rectangle.Height

                if Selected and RageUI.CurrentMenu.Description ~= Description then
                    RageUI.CurrentMenu.Description = Description or nil

                    local DescriptionLineCount = RageUI.GetLineCount(RageUI.CurrentMenu.Description, RageUI.CurrentMenu.X + RageUI.Settings.Items.Description.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Description.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUI.Settings.Items.Description.Background.Width + RageUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                if Selected and (RageUI.CurrentMenu.Controls.Left.Active or (RageUI.CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (RageUI.CurrentMenu.Controls.Right.Active or (RageUI.CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ProgressStart = ProgressStart - 1

                    if ProgressStart < 1 then
                        ProgressStart = #Items
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                elseif Selected and (RageUI.CurrentMenu.Controls.Right.Active or (RageUI.CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (RageUI.CurrentMenu.Controls.Left.Active or (RageUI.CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ProgressStart = ProgressStart + 1

                    if ProgressStart > #Items then
                        ProgressStart = 1
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                end

                if Selected and (RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
                end

                Callback(Hovered, Selected, ((RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) and Selected), ProgressStart)
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end
