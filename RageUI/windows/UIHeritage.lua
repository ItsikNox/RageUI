---HeritageWindow
---@param Mum number
---@param Dad number
---@return nil
---@public
function NativeUI.HeritageWindow(Mum, Dad)
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
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
            NativeUI.RenderSprite(NativeUI.Settings.Windows.Heritage.Background.Dictionary, NativeUI.Settings.Windows.Heritage.Background.Texture, NativeUI.CurrentMenu.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Windows.Heritage.Background.Width, NativeUI.Settings.Windows.Heritage.Background.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Windows.Heritage.Dad.Dictionary, Dad, NativeUI.CurrentMenu.X + NativeUI.Settings.Windows.Heritage.Dad.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Windows.Heritage.Dad.Width, NativeUI.Settings.Windows.Heritage.Dad.Height)
            NativeUI.RenderSprite(NativeUI.Settings.Windows.Heritage.Mum.Dictionary, Mum, NativeUI.CurrentMenu.X + NativeUI.Settings.Windows.Heritage.Mum.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Windows.Heritage.Mum.Width, NativeUI.Settings.Windows.Heritage.Mum.Height)
            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Windows.Heritage.Background.Height
        end
    end
end