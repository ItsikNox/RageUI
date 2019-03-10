---GridPanel
---@param X number
---@param Y number
---@param TopText string
---@param BottomText string
---@param LeftText string
---@param RightText string
---@param Callback table
---@return table
---@public
function NativeUI.GridPanel(X, Y, TopText, BottomText, LeftText, RightText, Callback)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type boolean
            local Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + NativeUI.CurrentMenu.SafeZoneSize.X + 20, NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20, NativeUI.Settings.Panels.Grid.Grid.Width + NativeUI.CurrentMenu.WidthOffset - 40, NativeUI.Settings.Panels.Grid.Grid.Height - 40)

            ---@type boolean
            local Selected = false

            ---@type number
            local CircleX = NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + (NativeUI.CurrentMenu.WidthOffset / 2) + 20

            ---@type number
            local CircleY = NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20

            if X < 0.0 or X > 1.0 then
                X = 0.0
            end

            if Y < 0.0 or Y > 1.0 then
                Y = 0.0
            end

            CircleX = CircleX + ((NativeUI.Settings.Panels.Grid.Grid.Width - 40) * X) - (NativeUI.Settings.Panels.Grid.Circle.Width / 2)
            CircleY = CircleY + ((NativeUI.Settings.Panels.Grid.Grid.Height - 40) * Y) - (NativeUI.Settings.Panels.Grid.Circle.Height / 2)

            NativeUI.RenderSprite(NativeUI.Settings.Panels.Grid.Background.Dictionary, NativeUI.Settings.Panels.Grid.Background.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Grid.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Panels.Grid.Background.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Panels.Grid.Grid.Dictionary, NativeUI.Settings.Panels.Grid.Grid.Texture, NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Panels.Grid.Grid.Width, NativeUI.Settings.Panels.Grid.Grid.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Panels.Grid.Circle.Dictionary, NativeUI.Settings.Panels.Grid.Circle.Texture, CircleX, CircleY, NativeUI.Settings.Panels.Grid.Circle.Width, NativeUI.Settings.Panels.Grid.Circle.Height)

            NativeUI.RenderText(TopText or "", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Text.Top.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Text.Top.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
            NativeUI.RenderText(BottomText or "", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Text.Bottom.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Text.Bottom.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            NativeUI.RenderText(LeftText or "", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Text.Left.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Text.Left.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
            NativeUI.RenderText(RightText or "", NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Text.Right.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Text.Right.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Panels.Grid.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    CircleX = math.round(GetControlNormal(0, 239) * 1920) - NativeUI.CurrentMenu.SafeZoneSize.X - (NativeUI.Settings.Panels.Grid.Circle.Width / 2)
                    CircleY = math.round(GetControlNormal(0, 240) * 1080) - NativeUI.CurrentMenu.SafeZoneSize.Y - (NativeUI.Settings.Panels.Grid.Circle.Height / 2)

                    if CircleX > (NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + (NativeUI.CurrentMenu.WidthOffset / 2) + 20 + NativeUI.Settings.Panels.Grid.Grid.Width - 40) then
                        CircleX = NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + (NativeUI.CurrentMenu.WidthOffset / 2) + 20 + NativeUI.Settings.Panels.Grid.Grid.Width - 40
                    elseif CircleX < (NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + 20 - (NativeUI.Settings.Panels.Grid.Circle.Width / 2)) then
                        CircleX = NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + 20 - (NativeUI.Settings.Panels.Grid.Circle.Width / 2)
                    end

                    if CircleY > (NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20 + NativeUI.Settings.Panels.Grid.Grid.Height - 40) then
                        CircleY = NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20 + NativeUI.Settings.Panels.Grid.Grid.Height - 40
                    elseif CircleY < (NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20 - (NativeUI.Settings.Panels.Grid.Circle.Height / 2)) then
                        CircleY = NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20 - (NativeUI.Settings.Panels.Grid.Circle.Height / 2)
                    end

                    X = math.round((CircleX - (NativeUI.CurrentMenu.X + NativeUI.Settings.Panels.Grid.Grid.X + (NativeUI.CurrentMenu.WidthOffset / 2) + 20) + (NativeUI.Settings.Panels.Grid.Circle.Width / 2)) / (NativeUI.Settings.Panels.Grid.Grid.Width - 40), 2)
                    Y = math.round((CircleY - (NativeUI.CurrentMenu.Y + NativeUI.Settings.Panels.Grid.Grid.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset + 20) + (NativeUI.Settings.Panels.Grid.Circle.Height / 2)) / (NativeUI.Settings.Panels.Grid.Grid.Height - 40), 2)

                    if X > 1.0 then
                        X = 1.0
                    end
                    if Y > 1.0 then
                        Y = 1.0
                    end
                end
            end
            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Panels.Grid.Background.Height + NativeUI.Settings.Panels.Grid.Background.Y
            if Hovered and Selected then
                NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Slider, true)
            end
            Callback(Hovered, Selected, X, Y)
        end
    end
end
