
---List
---@param Label string
---@param Items table
---@param Index number
---@param Description string
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function NativeUI.List(Label, Items, Index, Description, Enabled, Callback)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type number
            local Option = NativeUI.Options + 1

            if NativeUI.CurrentMenu.Pagination.Minimum <= Option and NativeUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = NativeUI.CurrentMenu.Index == Option

                ---@type boolean
                local Hovered = false

                ---@type boolean
                local LeftArrowHovered, RightArrowHovered = false, false

                if not NativeUI.CurrentMenu.SafeZoneSize then
                    NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if NativeUI.CurrentMenu.Safezone then
                        NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height)

                local ListText = (type(Items[Index]) == "table") and tostring(Items[Index].Name) or tostring(Items[Index]) or "NIL"
                local TextOffset = NativeUI.MeasureStringWidth(ListText, 0, 0.35)

                if Hovered and not Selected then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)

                    if NativeUI.CurrentMenu.Controls.Click.Active then
                        NativeUI.CurrentMenu.Index = Option
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    NativeUI.RenderSprite(NativeUI.Settings.Items.Button.SelectedSprite.Dictionary, NativeUI.Settings.Items.Button.SelectedSprite.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.SelectedSprite.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.SelectedSprite.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.SelectedSprite.Height)
                    LeftArrowHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.LeftArrow.X - TextOffset + NativeUI.CurrentMenu.SafeZoneSize.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.LeftArrow.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.LeftArrow.Width, NativeUI.Settings.Items.List.LeftArrow.Height)
                    RightArrowHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.RightArrow.X + NativeUI.CurrentMenu.SafeZoneSize.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.RightArrow.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.RightArrow.Width, NativeUI.Settings.Items.List.RightArrow.Height)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)

                        NativeUI.RenderSprite(NativeUI.Settings.Items.List.LeftArrow.Dictionary, NativeUI.Settings.Items.List.LeftArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.LeftArrow.X - TextOffset + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.LeftArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.LeftArrow.Width, NativeUI.Settings.Items.List.LeftArrow.Height, 0, 0, 0, 0, 255)
                        NativeUI.RenderSprite(NativeUI.Settings.Items.List.RightArrow.Dictionary, NativeUI.Settings.Items.List.RightArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.RightArrow.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.RightArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.RightArrow.Width, NativeUI.Settings.Items.List.RightArrow.Height, 0, 0, 0, 0, 255)

                        NativeUI.RenderText(ListText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.Text.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.List.Text.Scale, 0, 0, 0, 255, 2)
                    else
                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)

                        NativeUI.RenderText(ListText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.Text.X + 15 + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.List.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        NativeUI.RenderSprite(NativeUI.Settings.Items.List.LeftArrow.Dictionary, NativeUI.Settings.Items.List.LeftArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.LeftArrow.X - TextOffset + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.LeftArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.LeftArrow.Width, NativeUI.Settings.Items.List.LeftArrow.Height, 0, 163, 159, 148, 255)
                        NativeUI.RenderSprite(NativeUI.Settings.Items.List.RightArrow.Dictionary, NativeUI.Settings.Items.List.RightArrow.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.RightArrow.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.RightArrow.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.List.RightArrow.Width, NativeUI.Settings.Items.List.RightArrow.Height, 0, 163, 159, 148, 255)

                        NativeUI.RenderText(ListText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.Text.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.List.Text.Scale, 163, 159, 148, 255, 2)
                    else
                        NativeUI.RenderText(ListText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.List.Text.X + 15 + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.List.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.List.Text.Scale, 163, 159, 148, 255, 2)
                    end
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

                if Selected and (NativeUI.CurrentMenu.Controls.Left.Active or (NativeUI.CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (NativeUI.CurrentMenu.Controls.Right.Active or (NativeUI.CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    Index = Index - 1

                    if Index < 1 then
                        Index = #Items
                    end

                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.LeftRight)
                elseif Selected and (NativeUI.CurrentMenu.Controls.Right.Active or (NativeUI.CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (NativeUI.CurrentMenu.Controls.Left.Active or (NativeUI.CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1

                    if Index > #Items then
                        Index = 1
                    end

                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.LeftRight)
                end

                if Selected and (NativeUI.CurrentMenu.Controls.Select.Active or ((Hovered and NativeUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Select)
                end

                Callback(Hovered, Selected, ((NativeUI.CurrentMenu.Controls.Select.Active or ((Hovered and NativeUI.CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) and Selected), Index)
            end

            NativeUI.Options = NativeUI.Options + 1
        end
    end
end