---HeritageWindow
---@param Mum number
---@param Dad number
---@return nil
---@public
function RageUI.HeritageWindow(Mum, Dad)

    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            if Mum < 0 or Mum > 21 then
                Mum = 0
            end
            if Dad < 0 or Dad > 23 then
                Dad = 0
            end
            if Mum == 21 then
                Mum = "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1)
            else
                Mum = "female_" .. Mum
            end
            if Dad >= 21 then
                Dad = "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1)
            else
                Dad = "male_" .. Dad
            end

            ---@type table
            local Heritage = RageUI.Settings.Windows.Heritage;

            RageUI.RenderSprite(Heritage.Background.Dictionary, Heritage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Background.Width + (CurrentMenu.WidthOffset / 1), Heritage.Background.Height)
            RageUI.RenderSprite(Heritage.Dad.Dictionary, Dad, CurrentMenu.X + Heritage.Dad.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Dad.Width, Heritage.Dad.Height)
            RageUI.RenderSprite(Heritage.Mum.Dictionary, Mum, CurrentMenu.X + Heritage.Mum.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Mum.Width, Heritage.Mum.Height)

            RageUI.ItemOffset = RageUI.ItemOffset + Heritage.Background.Height
        end
    end
end