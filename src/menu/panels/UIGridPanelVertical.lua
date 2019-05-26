local GridPanelVertical = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 275 },
    Grid = { Dictionary = "NativeUI", Texture = "vertical_grid", X = 115.5, Y = 47.5, Width = 200, Height = 200 },
    Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
    Text = {
        Top = { X = 215.5, Y = 15, Scale = 0.35 },
        Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
        Left = { X = 57.75, Y = 130, Scale = 0.35 },
        Right = { X = 373.25, Y = 130, Scale = 0.35 },
    },
}

---GridPanelVertical
---@param X number
---@param TopText string
---@param BottomText string
---@param LeftText string
---@param RightText string
---@param Callback table
---@return table
---@public
function RageUI.GridPanelVertical(X, TopText, BottomText, LeftText, RightText, Callback)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type boolean
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + GridPanelVertical.Grid.X + CurrentMenu.SafeZoneSize.X + 20, CurrentMenu.Y + GridPanelVertical.Grid.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, GridPanelVertical.Grid.Width + CurrentMenu.WidthOffset - 40, GridPanelVertical.Grid.Height - 40)

            ---@type boolean
            local Selected = false

            ---@type number
            local CircleX = CurrentMenu.X + GridPanelVertical.Grid.X + (CurrentMenu.WidthOffset / 2) + 20

            ---@type number
            local CircleY = CurrentMenu.Y + GridPanelVertical.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20

            if X < 0.0 or X > 1.0 then
                X = 0.0
            end

            local Y = 0.5

            CircleX = CircleX + ((GridPanelVertical.Grid.Width - 40) * X) - (GridPanelVertical.Circle.Width / 2)
            CircleY = CircleY + ((GridPanelVertical.Grid.Height - 40) * Y) - (GridPanelVertical.Circle.Height / 2)

            RageUI.RenderSprite(GridPanelVertical.Background.Dictionary, GridPanelVertical.Background.Texture, CurrentMenu.X, CurrentMenu.Y + GridPanelVertical.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, GridPanelVertical.Background.Width + CurrentMenu.WidthOffset, GridPanelVertical.Background.Height)
            RageUI.RenderSprite(GridPanelVertical.Grid.Dictionary, GridPanelVertical.Grid.Texture, CurrentMenu.X + GridPanelVertical.Grid.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + GridPanelVertical.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, GridPanelVertical.Grid.Width, GridPanelVertical.Grid.Height)
            RageUI.RenderSprite(GridPanelVertical.Circle.Dictionary, GridPanelVertical.Circle.Texture, CircleX, CircleY, GridPanelVertical.Circle.Width, GridPanelVertical.Circle.Height)

            RageUI.RenderText(TopText or "", CurrentMenu.X + GridPanelVertical.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + GridPanelVertical.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, GridPanelVertical.Text.Top.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(BottomText or "", CurrentMenu.X + GridPanelVertical.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + GridPanelVertical.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, GridPanelVertical.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(LeftText or "", CurrentMenu.X + GridPanelVertical.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + GridPanelVertical.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, GridPanelVertical.Text.Left.Scale, 245, 245, 245, 255, 1)
            RageUI.RenderText(RightText or "", CurrentMenu.X + GridPanelVertical.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + GridPanelVertical.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, GridPanelVertical.Text.Right.Scale, 245, 245, 245, 255, 1)

            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true

                    CircleX = math.round(GetControlNormal(0, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (GridPanelVertical.Circle.Width / 2)

                    if CircleX > (CurrentMenu.X + GridPanelVertical.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + GridPanelVertical.Grid.Width - 40) then
                        CircleX = CurrentMenu.X + GridPanelVertical.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + GridPanelVertical.Grid.Width - 40
                    elseif CircleX < (CurrentMenu.X + GridPanelVertical.Grid.X + 20 - (GridPanelVertical.Circle.Width / 2)) then
                        CircleX = CurrentMenu.X + GridPanelVertical.Grid.X + 20 - (GridPanelVertical.Circle.Width / 2)
                    end

                    X = math.round((CircleX - (CurrentMenu.X + GridPanelVertical.Grid.X + (CurrentMenu.WidthOffset / 2) + 20) + (GridPanelVertical.Circle.Width / 2)) / (GridPanelVertical.Grid.Width - 40), 2)
                    if X > 1.0 then
                        X = 1.0
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + GridPanelVertical.Background.Height + GridPanelVertical.Background.Y
            if Hovered and Selected then
                RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Slider, true)
            end
            Callback(Hovered, Selected, X)
        end
    end
end
