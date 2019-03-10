NativeUI.CheckboxStyle = {
    Tick = 1,
    Cross = 2
}

local function StyleCheckBox(Selected, Checked, Box, BoxSelect)
    if Selected then
        if Checked then
            NativeUI.RenderSprite(NativeUI.Settings.Items.Checkbox.Dictionary, NativeUI.Settings.Items.Checkbox.Textures[Box], NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Checkbox.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Checkbox.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Checkbox.Width, NativeUI.Settings.Items.Checkbox.Height)
        else
            NativeUI.RenderSprite(NativeUI.Settings.Items.Checkbox.Dictionary, NativeUI.Settings.Items.Checkbox.Textures[1], NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Checkbox.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Checkbox.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Checkbox.Width, NativeUI.Settings.Items.Checkbox.Height)
        end
    else
        if Checked then
            NativeUI.RenderSprite(NativeUI.Settings.Items.Checkbox.Dictionary, NativeUI.Settings.Items.Checkbox.Textures[BoxSelect], NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Checkbox.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Checkbox.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Checkbox.Width, NativeUI.Settings.Items.Checkbox.Height)
        else
            NativeUI.RenderSprite(NativeUI.Settings.Items.Checkbox.Dictionary, NativeUI.Settings.Items.Checkbox.Textures[3], NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Checkbox.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Checkbox.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Checkbox.Width, NativeUI.Settings.Items.Checkbox.Height)
        end
    end
end

local function CheckBoxLockBadgeColor(Selected)
    if Selected then
        return 0, 0, 0, 255
    else
        return 163, 159, 148, 255
    end
end

---Checkbox
---@param Label string
---@param Description string
---@param Checked boolean
---@param Enabled boolean
---@param Callback function
---@return nil
---@public
function NativeUI.Checkbox(Label, Description, Checked, Style, Callback)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            ---@type number
            local Option = NativeUI.Options + 1

            if NativeUI.CurrentMenu.Pagination.Minimum <= Option and NativeUI.CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = NativeUI.CurrentMenu.Index == Option

                ---@type number
                local Hovered = false

                if not NativeUI.CurrentMenu.SafeZoneSize then
                    NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                    if NativeUI.CurrentMenu.Safezone then
                        NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                        ScreenDrawPositionBegin(76, 84)
                        ScreenDrawPositionRatio(0, 0, 0, 0)
                    end
                end

                Hovered = NativeUI.IsMouseInBounds(NativeUI.CurrentMenu.X + NativeUI.CurrentMenu.SafeZoneSize.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SafeZoneSize.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height)

                if Hovered and not Selected then
                    NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Rectangle.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.Rectangle.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.Rectangle.Height, 255, 255, 255, 20)

                    if NativeUI.CurrentMenu.Controls.Click.Active then
                        NativeUI.CurrentMenu.Index = Option
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Error)
                        NativeUI.CurrentMenu.Controls.Click.Active = false
                    end
                end

                if Selected then
                    NativeUI.RenderSprite(NativeUI.Settings.Items.Button.SelectedSprite.Dictionary, NativeUI.Settings.Items.Button.SelectedSprite.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.SelectedSprite.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.SelectedSprite.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Button.SelectedSprite.Height)
                end

                if type(Style) == "table" then

                    if Style.Enabled == true or Style.Enabled == nil then

                        if Selected then
                            NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                        else
                            NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                        end
                    else
                        ---@type table
                        local LeftBadge = NativeUI.BadgeStyle.Lock

                        ---@type number
                        local LeftBadgeOffset = ((LeftBadge == NativeUI.BadgeStyle.None or tonumber(LeftBadge) == nil) and 0 or 27)

                        if Selected then
                            NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X + LeftBadgeOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                        else
                            NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X + LeftBadgeOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                        end
                        if LeftBadge ~= NativeUI.BadgeStyle.None and tonumber(LeftBadge) ~= nil then
                            NativeUI.RenderSprite(NativeUI.GetBadgeDictionary(LeftBadge, Selected), NativeUI.GetBadgeTexture(LeftBadge, Selected), NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.LeftBadge.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Button.LeftBadge.Width, NativeUI.Settings.Items.Button.LeftBadge.Height, nil, CheckBoxLockBadgeColor(Selected))
                        end
                    end

                    if Style.Style ~= nil then
                        if Style.Style == NativeUI.CheckboxStyle.Tick then
                            StyleCheckBox(Selected, Checked, 2, 4)
                        elseif Style.Style == NativeUI.CheckboxStyle.Cross then
                            StyleCheckBox(Selected, Checked, 5, 6)
                        else
                            StyleCheckBox(Selected, Checked, 2, 4)
                        end
                    else
                        StyleCheckBox(Selected, Checked, 2, 4)
                    end

                    if Selected and (NativeUI.CurrentMenu.Controls.Select.Active or (Hovered and NativeUI.CurrentMenu.Controls.Click.Active)) and (Style.Enabled == true or Style.Enabled == nil) then
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Select)
                        Checked = not Checked
                    end

                    if Selected and (NativeUI.CurrentMenu.Controls.Select.Active or (Hovered and NativeUI.CurrentMenu.Controls.Click.Active)) and (Style.Enabled == false) then
                        NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Error)
                        Checked = false
                    end

                else
                    error("UICheckBox Style is not a `table`")
                end

                --[[
                if Enabled == true or Enabled == nil then
                    if Selected then
                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 0, 0, 0, 255)
                    else
                        NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    NativeUI.RenderText(Label, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Button.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Button.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Button.Text.Scale, 163, 159, 148, 255)
                end
                ]]--

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

                Callback(Hovered, Selected, ((NativeUI.CurrentMenu.Controls.Select.Active or (Hovered and NativeUI.CurrentMenu.Controls.Click.Active)) and Selected), Checked)
            end

            NativeUI.Options = NativeUI.Options + 1
        end
    end
end