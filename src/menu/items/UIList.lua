
---List
---@param Label string
---@param Items table
---@param Index number
---@param Description string
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function RageUI.List(Label, Items, Index, Description, Enabled, Callback)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

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

                local ListText = (type(Items[Index]) == "table") and tostring(Items[Index].Name) or tostring(Items[Index]) or "NIL"
                local TextOffset = RageUI.MeasureStringWidth(ListText, 0, 0.35)

                if Hovered and not Selected then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)
                    if RageUI.CurrentMenu.Controls.Click.Active then
                        RageUI.CurrentMenu.Index = Option
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    RageUI.RenderSprite(RageUI.Settings.Items.Button.SelectedSprite.Dictionary, RageUI.Settings.Items.Button.SelectedSprite.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.SelectedSprite.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.SelectedSprite.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Button.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Items.List.LeftArrow.X - TextOffset + RageUI.CurrentMenu.SafeZoneSize.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.LeftArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.LeftArrow.Width, RageUI.Settings.Items.List.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Items.List.RightArrow.X + RageUI.CurrentMenu.SafeZoneSize.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.RightArrow.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.RightArrow.Width, RageUI.Settings.Items.List.RightArrow.Height)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)

                        RageUI.RenderSprite(RageUI.Settings.Items.List.LeftArrow.Dictionary, RageUI.Settings.Items.List.LeftArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.LeftArrow.X - TextOffset + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.LeftArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.LeftArrow.Width, RageUI.Settings.Items.List.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RageUI.RenderSprite(RageUI.Settings.Items.List.RightArrow.Dictionary, RageUI.Settings.Items.List.RightArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.RightArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.RightArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.RightArrow.Width, RageUI.Settings.Items.List.RightArrow.Height, 0, 0, 0, 0, 255)

                        RageUI.RenderText(ListText, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.Text.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.List.Text.Scale, 0, 0, 0, 255, 2)
                    else
                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)

                        RageUI.RenderText(ListText, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.Text.X + 15 + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.List.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RageUI.RenderSprite(RageUI.Settings.Items.List.LeftArrow.Dictionary, RageUI.Settings.Items.List.LeftArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.LeftArrow.X - TextOffset + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.LeftArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.LeftArrow.Width, RageUI.Settings.Items.List.LeftArrow.Height, 0, 163, 159, 148, 255)
                        RageUI.RenderSprite(RageUI.Settings.Items.List.RightArrow.Dictionary, RageUI.Settings.Items.List.RightArrow.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.RightArrow.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.RightArrow.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.List.RightArrow.Width, RageUI.Settings.Items.List.RightArrow.Height, 0, 163, 159, 148, 255)

                        RageUI.RenderText(ListText, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.Text.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.List.Text.Scale, 163, 159, 148, 255, 2)
                    else
                        RageUI.RenderText(ListText, RageUI.CurrentMenu.X + RageUI.Settings.Items.List.Text.X + 15 + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.List.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.List.Text.Scale, 163, 159, 148, 255, 2)
                    end
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
                    Index = Index - 1

                    if Index < 1 then
                        Index = #Items
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                elseif Selected and (RageUI.CurrentMenu.Controls.Right.Active or (RageUI.CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (RageUI.CurrentMenu.Controls.Left.Active or (RageUI.CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1

                    if Index > #Items then
                        Index = 1
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                end

                if Selected and (RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
                end

                Callback(Hovered, Selected, ((RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) and Selected), Index)
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end