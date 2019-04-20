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
function RageUI.Progress(Label, ProgressStart, ProgressMax, Description, Counter, Enabled, Callback)
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
                local ProgressHovered = false

                if not RageUI.CurrentMenu.SafeZoneSize then
                    RageUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if RageUI.CurrentMenu.Safezone then
                        RageUI.CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Height)

                local ProgressText = (Counter and ProgressStart .. "/" .. #Items or (type(Items[ProgressStart]) == "table") and tostring(Items[ProgressStart].Name) or tostring(Items[ProgressStart]))

                if Hovered and not Selected then
                    RageUI.RenderRectangle(RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Rectangle.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.Rectangle.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Height, 255, 255, 255, 20)

                    if RageUI.CurrentMenu.Controls.Click.Active then
                        RageUI.CurrentMenu.Index = Option
                        RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Error)
                    end
                end

                if Selected then
                    RageUI.RenderSprite(RageUI.Settings.Items.Button.SelectedSprite.Dictionary, RageUI.Settings.Items.Button.SelectedSprite.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.SelectedSprite.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Button.SelectedSprite.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Height)
                    ProgressHovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Bar.X + RageUI.CurrentMenu.SafeZoneSize.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Bar.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 12, RageUI.Settings.Items.Progress.Bar.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Bar.Height + 24)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        RageUI.RenderText(ProgressText, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 0, 0, 0, 255, 2)

                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)

                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Background.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Progress.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Background.Height, 0, 0, 0, 255)
                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Bar.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Bar.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, ((ProgressStart / #Items) * (RageUI.Settings.Items.Progress.Bar.Width + RageUI.CurrentMenu.WidthOffset)), RageUI.Settings.Items.Progress.Bar.Height, 240, 240, 240, 255)
                    else
                        RageUI.RenderText(ProgressText, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 245, 245, 245, 255, 2)

                        RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)

                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Background.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Progress.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Background.Height, 240, 240, 240, 255)
                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Bar.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Bar.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, ((ProgressStart / #Items) * (RageUI.Settings.Items.Progress.Bar.Width + RageUI.CurrentMenu.WidthOffset)), RageUI.Settings.Items.Progress.Bar.Height, 0, 0, 0, 255)
                    end
                else
                    RageUI.RenderText(ProgressText, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.RightText.X + RageUI.CurrentMenu.WidthOffset, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.RightText.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.RightText.Scale, 163, 159, 148, 255, 2)

                    RageUI.RenderText(Label, RageUI.CurrentMenu.X + RageUI.Settings.Items.Button.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Button.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Background.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Progress.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Background.Height, 0, 0, 0, 255)
                    else
                        RageUI.RenderRectangle(RageUI.CurrentMenu.X + RageUI.Settings.Items.Progress.Background.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Progress.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Items.Progress.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Items.Progress.Background.Height, 240, 240, 240, 255)
                    end
                end

                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Progress.Height

                if Selected and RageUI.CurrentMenu.Description ~= Description then
                    RageUI.CurrentMenu.Description = Description or ""

                    local DescriptionLineCount = RageUI.GetLineCount(RageUI.CurrentMenu.Description, RageUI.CurrentMenu.X + RageUI.Settings.Items.Description.Text.X, RageUI.CurrentMenu.Y + RageUI.Settings.Items.Description.Text.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUI.Settings.Items.Description.Background.Width + RageUI.CurrentMenu.WidthOffset)

                    if DescriptionLineCount > 1 then
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height * DescriptionLineCount
                    else
                        RageUI.CurrentMenu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height + 7
                    end
                end

                if Selected and RageUI.CurrentMenu.Controls.Left.Active and not RageUI.CurrentMenu.Controls.Right.Active then
                    ProgressStart = ProgressStart - 1

                    if ProgressStart < 0 then
                        ProgressStart = #Items
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                elseif Selected and RageUI.CurrentMenu.Controls.Right.Active and not RageUI.CurrentMenu.Controls.Left.Active then
                    ProgressStart = ProgressStart + 1

                    if ProgressStart > #Items then
                        ProgressStart = 0
                    end

                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                end

                if Selected and (RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and not ProgressHovered)) then
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
                elseif Selected and (Hovered and RageUI.CurrentMenu.Controls.Click.Active and ProgressHovered) then
                    local Progress = (math.round(GetControlNormal(0, 239) * 1920) - RageUI.CurrentMenu.SafeZoneSize.X) - RageUI.Settings.Items.Progress.Bar.X
                    local Barsize = RageUI.Settings.Items.Progress.Bar.Width + RageUI.CurrentMenu.WidthOffset

                    if Progress > Barsize then
                        Progress = Barsize
                    elseif Progress < 0 then
                        Progress = 0
                    end

                    ProgressStart = math.round(#Items * (Progress / Barsize))

                    if ProgressStart > #Items or ProgressStart < 0 then
                        ProgressStart = 0
                    end
                end

                Callback(Hovered, Selected, ((RageUI.CurrentMenu.Controls.Select.Active or ((Hovered and RageUI.CurrentMenu.Controls.Click.Active) and not ProgressHovered)) and Selected), ProgressStart)
            end

            RageUI.Options = RageUI.Options + 1

            Items = nil
        end
    end
end