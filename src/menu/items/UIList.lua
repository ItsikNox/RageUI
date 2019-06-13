---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}

---@type table
local SettingsList = {
    LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 378, Y = 3, Width = 30, Height = 30 },
    RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 400, Y = 3, Width = 30, Height = 30 },
    Text = { X = 403, Y = 3, Scale = 0.35 },
}

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
    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            ---@type number
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = CurrentMenu.Index == Option

                ---@type boolean
                local LeftArrowHovered, RightArrowHovered = false, false

                ItemsWrapper.ItemsSafeZone(CurrentMenu)

                local Hovered = false;

                ---@type boolean
                if CurrentMenu.EnableMouse == true then
                    Hovered = ItemsWrapper.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                end

                local ListText = (type(Items[Index]) == "table") and tostring(Items[Index].Name) or tostring(Items[Index]) or "NIL"
                local TextOffset = MeasureStringWidth(ListText, 0, 0.35)

                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsList.LeftArrow.X - TextOffset + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.LeftArrow.Width, SettingsList.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsList.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.RightArrow.Width, SettingsList.RightArrow.Height)
                end

                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)

                        RenderSprite(SettingsList.LeftArrow.Dictionary, SettingsList.LeftArrow.Texture, CurrentMenu.X + SettingsList.LeftArrow.X - TextOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.LeftArrow.Width, SettingsList.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RenderSprite(SettingsList.RightArrow.Dictionary, SettingsList.RightArrow.Texture, CurrentMenu.X + SettingsList.RightArrow.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.RightArrow.Width, SettingsList.RightArrow.Height, 0, 0, 0, 0, 255)

                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 0, 0, 0, 255, 2)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)

                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)

                    if Selected then
                        RenderSprite(SettingsList.LeftArrow.Dictionary, SettingsList.LeftArrow.Texture, CurrentMenu.X + SettingsList.LeftArrow.X - TextOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.LeftArrow.Width, SettingsList.LeftArrow.Height, 0, 163, 159, 148, 255)
                        RenderSprite(SettingsList.RightArrow.Dictionary, SettingsList.RightArrow.Texture, CurrentMenu.X + SettingsList.RightArrow.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsList.RightArrow.Width, SettingsList.RightArrow.Height, 0, 163, 159, 148, 255)

                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    else
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 163, 159, 148, 255, 2)
                    end
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                ItemsWrapper.ItemsDescription(CurrentMenu, Description, Selected);

                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    Index = Index - 1
                    if Index < 1 then
                        Index = #Items
                    end
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1
                    if Index > #Items then
                        Index = 1
                    end
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.LeftRight)
                end

                if Selected and (CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) then
                    RageUI.PlaySound(RageUI.Settings.Audio.Library, RageUI.Settings.Audio.Select)
                end

                if (Enabled) then
                    Callback(Hovered, Selected, ((CurrentMenu.Controls.Select.Active or ((Hovered and CurrentMenu.Controls.Click.Active) and (not LeftArrowHovered and not RightArrowHovered))) and Selected), Index)
                end
            end

            RageUI.Options = RageUI.Options + 1
        end
    end
end