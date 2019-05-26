---GridPanelVertical
---@param X number
---@param TopText string
---@param BottomText string
---@param LeftText string
---@param RightText string
---@param Callback table
---@return table
---@public
function RageUI.GridPanelHorizontal(X, TopText, BottomText, LeftText, RightText, Callback)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type boolean
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + CurrentMenu.SafeZoneSize.X + 20, CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, RageUI.Settings.Panels.Grid1x5.Grid.Width + CurrentMenu.WidthOffset - 40, RageUI.Settings.Panels.Grid1x5.Grid.Height - 40)

            ---@type boolean
            local Selected = false

            ---@type number
            local CircleX = CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (CurrentMenu.WidthOffset / 2) + 20

            ---@type number
            local CircleY = CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20

            if X < 0.5 or X > 1.0 then
                X = 0.5
            end

            local Y = 0.5

            CircleX = CircleX + ((RageUI.Settings.Panels.Grid1x5.Grid.Width - 40) * X) - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)
            CircleY = CircleY + ((RageUI.Settings.Panels.Grid1x5.Grid.Height - 40) * Y) - (RageUI.Settings.Panels.Grid1x5.Circle.Height / 2)

            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Background.Dictionary, RageUI.Settings.Panels.Grid1x5.Background.Texture, CurrentMenu.X, CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Grid1x5.Background.Width + CurrentMenu.WidthOffset, RageUI.Settings.Panels.Grid1x5.Background.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Grid.Dictionary, RageUI.Settings.Panels.Grid1x5.Grid.Texture, CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Grid1x5.Grid.Width, RageUI.Settings.Panels.Grid1x5.Grid.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Circle.Dictionary, RageUI.Settings.Panels.Grid1x5.Circle.Texture, CircleX, CircleY, RageUI.Settings.Panels.Grid1x5.Circle.Width, RageUI.Settings.Panels.Grid1x5.Circle.Height)

            RageUI.RenderText(TopText or "", CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Top.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(BottomText or "", CurrentMenu.X + RageUI.Settings.Panels.Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(LeftText or "", CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Left.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(RightText or "", CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    CircleX = math.round(GetControlNormal(0, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)

                    if CircleX > (CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + RageUI.Settings.Panels.Grid1x5.Grid.Width - 40) then
                        CircleX = CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + RageUI.Settings.Panels.Grid1x5.Grid.Width - 40
                    elseif CircleX < (CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + 20 - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)) then
                        CircleX = CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + 20 - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)
                    end

                    X = math.round((CircleX - (CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (CurrentMenu.WidthOffset / 2) + 20) + (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)) / (RageUI.Settings.Panels.Grid1x5.Grid.Width - 40), 2)
                    if X > 1.0 then
                        X = 1.0
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Panels.Grid1x5.Background.Height + RageUI.Settings.Panels.Grid1x5.Background.Y
            if Hovered and Selected then
                RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Slider, true)
            end
            Callback(Hovered, Selected, X)
        end
    end
end
