---Progress
---@param Label string
---@param Items thread
---@param Index number
---@param Description string
---@param Counter number
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function NativeUI.Progress(Label, Items, Index, Description, Counter, Enabled, Callback)
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
                local ProgressHovered = false

                if not NativeUI.CurrentMenu.SafeZoneSize then
                    NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if NativeUI.CurrentMenu.Safezone then
                        NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Height)

                local ProgressText = (Counter and Index .. "/" .. #Items or (type(Items[Index]) == "table") and tostring(Items[Index].Name) or tostring(Items[Index]))

                if Hovered and not Selected then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Height, 255, 255, 255, 20)

                    if NativeUI.CurrentMenu.Controls.Click.Active then
                        NativeUI.CurrentMenu.Index = Option
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    NativeUI.RenderSprite(NativeUI.Settings.Items.Button.SelectedSprite.Dictionary, NativeUI.Settings.Items.Button.SelectedSprite.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.SelectedSprite.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.SelectedSprite.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Height)
                    ProgressHovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Bar.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Bar.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset - 12, NativeUI.Settings.Items.Progress.Bar.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Bar.Height + 24)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        NativeUI.RenderText(ProgressText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 0, 0, 0, 255, 2)

                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)

                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Background.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Progress.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Background.Height, 0, 0, 0, 255)
                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Bar.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Bar.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, ((Index / #Items) * (NativeUI.Settings.Items.Progress.Bar.Width + NativeUI.CurrentMenu.WidthOffset)), NativeUI.Settings.Items.Progress.Bar.Height, 240, 240, 240, 255)
                    else
                        NativeUI.RenderText(ProgressText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 245, 245, 245, 255, 2)

                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)

                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Background.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Progress.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Background.Height, 240, 240, 240, 255)
                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Bar.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Bar.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, ((Index / #Items) * (NativeUI.Settings.Items.Progress.Bar.Width + NativeUI.CurrentMenu.WidthOffset)), NativeUI.Settings.Items.Progress.Bar.Height, 0, 0, 0, 255)
                    end
                else
                    NativeUI.RenderText(ProgressText, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.RightText.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.RightText.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.RightText.Scale, 163, 159, 148, 255, 2)

                    NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Background.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Progress.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Background.Height, 0, 0, 0, 255)
                    else
                        NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Progress.Background.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Progress.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Progress.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Progress.Background.Height, 240, 240, 240, 255)
                    end
                end

                NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Items.Progress.Height

                if Selected and NativeUI.CurrentMenu.Description ~= Description then
                    NativeUI.CurrentMenu.Description = Description or ""

                    local DescriptionLineCount = NativeUI.GetLineCount(NativeUI.CurrentMenu.Description, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Description.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Description.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, NativeUI.Settings.Items.Description.Background.Width + NativeUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        NativeUI.CurrentMenu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        NativeUI.CurrentMenu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                if Selected and NativeUI.CurrentMenu.Controls.Left.Active and not NativeUI.CurrentMenu.Controls.Right.Active then
                    Index = Index - 1

                    if Index < 1 then
                        Index = #Items
                    end

                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.LeftRight)
                elseif Selected and NativeUI.CurrentMenu.Controls.Right.Active and not NativeUI.CurrentMenu.Controls.Left.Active then
                    Index = Index + 1

                    if Index > #Items then
                        Index = 1
                    end

                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.LeftRight)
                end

                if Selected and (NativeUI.CurrentMenu.Controls.Select.Active or ((Hovered and NativeUI.CurrentMenu.Controls.Click.Active) and not ProgressHovered)) then
                    NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Select)
                elseif Selected and (Hovered and NativeUI.CurrentMenu.Controls.Click.Active and ProgressHovered) then
                    local Progress = (math.round(GetControlNormal(0, 239) * 1920) - NativeUI.CurrentMenu.SafeZoneSize.X) - NativeUI.Settings.Items.Progress.Bar.X
                    local Barsize = NativeUI.Settings.Items.Progress.Bar.Width + NativeUI.CurrentMenu.WidthOffset

                    if Progress > Barsize then
                        Progress = Barsize
                    elseif Progress < 0 then
                        Progress = 0
                    end

                    Index = math.round(#Items * (Progress / Barsize))

                    if Index > #Items or Index < 1 then
                        Index = 1
                    end
                end

                Callback(Hovered, Selected, ((NativeUI.CurrentMenu.Controls.Select.Active or ((Hovered and NativeUI.CurrentMenu.Controls.Click.Active) and not ProgressHovered)) and Selected), Index)
            end

            NativeUI.Options = NativeUI.Options + 1
        end
    end
end