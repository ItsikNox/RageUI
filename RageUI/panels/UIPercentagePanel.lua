
---PercentagePanel
---@param Percent number
---@param HeaderText string
---@param MinText string
---@param MaxText string
---@param Callback function
---@return nil
---@public
function NativeUI.PercentagePanel(Percent, HeaderText, MinText, MaxText, Callback)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type boolean
            local Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Bar.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Bar.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset - 4, NativeUI.Settings.Panels.Percentage.Bar.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Panels.Percentage.Bar.Height + 8)

            ---@type boolean
            local Selected = false

            ---@type number
            local Progress = NativeUI.Settings.Panels.Percentage.Bar.Width

            if Percent < 0.0 then
                Percent = 0.0
            elseif Percent > 1.0 then
                Percent = 1.0
            end

            Progress = Progress * Percent

            NativeUI.RenderSprite(NativeUI.Settings.Panels.Percentage.Background.Dictionary, NativeUI.Settings.Panels.Percentage.Background.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Percentage.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Panels.Percentage.Background.Height)
            NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Bar.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Bar.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Percentage.Bar.Width, NativeUI.Settings.Panels.Percentage.Bar.Height, 87, 87, 87, 255)
            NativeUI.RenderRectangle(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Bar.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Bar.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, Progress, NativeUI.Settings.Panels.Percentage.Bar.Height, 245, 245, 245, 255)

            NativeUI.RenderText(HeaderText or "Opacity", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Text.Middle.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Text.Middle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Percentage.Text.Middle.Scale, 245, 245, 245, 255, 1)
            NativeUI.RenderText(MinText or "0%", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Text.Left.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Text.Left.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Percentage.Text.Left.Scale, 245, 245, 245, 255, 1)
            NativeUI.RenderText(MaxText or "100%", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Text.Right.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Percentage.Text.Right.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Percentage.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    Progress = math.round(GetControlNormal(0, 239) * 1920) - NativeUI.CurrentMenu.SafeZoneSize.X - (NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Percentage.Bar.X + (NativeUI.CurrentMenu.WidthOffset / 2))

                    if Progress < 0 then
                        Progress = 0
                    elseif Progress > (NativeUI.Settings.Panels.Percentage.Bar.Width) then
                        Progress = NativeUI.Settings.Panels.Percentage.Bar.Width
                    end

                    Percent = math.round(Progress / NativeUI.Settings.Panels.Percentage.Bar.Width, 2)
                end
            end

            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Panels.Percentage.Background.Height + NativeUI.Settings.Panels.Percentage.Background.Y

            if Hovered and Selected then
                NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Slider, true)
            end

            Callback(Hovered, Selected, Percent)
        end
    end
end
