---HeritageWindow
---@param Mum number
---@param Dad number
---@return nil
---@public
function RageUI.HeritageWindow(Mum, Dad)
    if RageUI.CurrentMenu ~= nil then
        if RageUI.CurrentMenu() then
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
            RageUI.RenderSprite(RageUI.Settings.Windows.Heritage.Background.Dictionary, RageUI.Settings.Windows.Heritage.Background.Texture, RageUI.CurrentMenu.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Windows.Heritage.Background.Width, RageUI.Settings.Windows.Heritage.Background.Height)
            RageUI.RenderSprite(RageUI.Settings.Windows.Heritage.Dad.Dictionary, Dad, RageUI.CurrentMenu.X + RageUI.Settings.Windows.Heritage.Dad.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Windows.Heritage.Dad.Width, RageUI.Settings.Windows.Heritage.Dad.Height)
            RageUI.RenderSprite(RageUI.Settings.Windows.Heritage.Mum.Dictionary, Mum, RageUI.CurrentMenu.X + RageUI.Settings.Windows.Heritage.Mum.X + (RageUI.CurrentMenu.WidthOffset / 2), RageUI.CurrentMenu.Y + RageUI.CurrentMenu.SubtitleHeight + RageUI.ItemOffset, RageUI.Settings.Windows.Heritage.Mum.Width, RageUI.Settings.Windows.Heritage.Mum.Height)
            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Windows.Heritage.Background.Height
        end
    end
end