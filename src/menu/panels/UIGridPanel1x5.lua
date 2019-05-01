---GridPanel1x5
---@param X number
---@param TopText string
---@param LeftText string
---@param RightText string
---@param Callback table
---@return table
---@public
function RageUI.GridPanel1x5(X,TopText, LeftText, RightText, Callback)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then

            ---@type boolean
            local Hovered = RageUI.IsMouseInBounds(RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + RageUI.CurrentMenu.SafeZoneSize.X + 20, RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + RageUI.CurrentMenu.SafeZoneSize.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, RageUI.Settings.Panels.Grid1x5.Grid.Width + RageUI.CurrentMenu.WidthOffset - 40, RageUI.Settings.Panels.Grid1x5.Grid.Height - 40)

            ---@type boolean
            local Selected = false

            ---@type number
            local CircleX = RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (RageUI.CurrentMenu.WidthOffset / 2) + 20

            ---@type number
            local CircleY = RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20

            if X < 0.0 or X > 1.0 then
                X = 0.0
            end

            Y = 0.5

            CircleX = CircleX + ((RageUI.Settings.Panels.Grid1x5.Grid.Width - 40) * X) - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)
            CircleY = CircleY + ((RageUI.Settings.Panels.Grid1x5.Grid.Height - 40) * Y) - (RageUI.Settings.Panels.Grid1x5.Circle.Height / 2)

            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Background.Dictionary, RageUI.Settings.Panels.Grid1x5.Background.Texture, RageUI.CurrentMenu.X, RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Background.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Grid1x5.Background.Width + RageUI.CurrentMenu.WidthOffset, RageUI.Settings.Panels.Grid1x5.Background.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Grid.Dictionary, RageUI.Settings.Panels.Grid1x5.Grid.Texture, RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Grid.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Panels.Grid1x5.Grid.Width, RageUI.Settings.Panels.Grid1x5.Grid.Height)
            RageUI.RenderSprite(RageUI.Settings.Panels.Grid1x5.Circle.Dictionary, RageUI.Settings.Panels.Grid1x5.Circle.Texture, CircleX, CircleY, RageUI.Settings.Panels.Grid1x5.Circle.Width, RageUI.Settings.Panels.Grid1x5.Circle.Height)

            RageUI.RenderText(TopText or "", RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Top.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Top.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Top.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(LeftText or "", RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Left.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Left.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Left.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(RightText or "", RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Text.Right.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.Settings.Panels.Grid1x5.Text.Right.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid1x5.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    CircleX = math.round(GetControlNormal(0, 239) * 1920) - RageUI.CurrentMenu.SafeZoneSize.X - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)

                    if CircleX > (RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (RageUI.CurrentMenu.WidthOffset / 2) + 20 + RageUI.Settings.Panels.Grid1x5.Grid.Width - 40) then
                        CircleX = RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (RageUI.CurrentMenu.WidthOffset / 2) + 20 + RageUI.Settings.Panels.Grid1x5.Grid.Width - 40
                    elseif CircleX < (RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + 20 - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)) then
                        CircleX = RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + 20 - (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)
                    end

                    X = math.round((CircleX - (RageUI.CurrentMenu.X + RageUI.Settings.Panels.Grid1x5.Grid.X + (RageUI.CurrentMenu.WidthOffset / 2) + 20) + (RageUI.Settings.Panels.Grid1x5.Circle.Width / 2)) / (RageUI.Settings.Panels.Grid1x5.Grid.Width - 40), 2)
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
