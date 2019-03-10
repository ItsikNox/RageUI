---round
---@param num number
---@param numDecimalPlaces number
---@return number
---@public
function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

---starts
---@param String string
---@param Start number
---@return number
---@public
function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

---@type table
NativeUI = {}

---@type table
NativeUI.Menus = setmetatable({}, NativeUI.Menus)

---@type table
---@return boolean
NativeUI.Menus.__call = function()
    return true
end

---@type table
NativeUI.Menus.__index = NativeUI.Menus

---@type table
NativeUI.CurrentMenu = nil

---@type table
NativeUI.NextMenu = nil

---@type number
NativeUI.Options = 0

---@type number
NativeUI.ItemOffset = 0

---@type table
NativeUI.Settings = {
    Controls = {
        Up = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 172 },
                { 1, 172 },
                { 2, 172 },
                { 0, 241 },
                { 1, 241 },
                { 2, 241 },
            },
        },
        Down = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 173 },
                { 1, 173 },
                { 2, 173 },
                { 0, 242 },
                { 1, 242 },
                { 2, 242 },
            },
        },
        Left = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        Right = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        Select = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 201 },
                { 1, 201 },
                { 2, 201 },
            },
        },
        Back = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 177 },
                { 1, 177 },
                { 2, 177 },
                { 0, 199 },
                { 1, 199 },
                { 2, 199 },
            },
        },
        Click = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 24 },
            },
        },
        Enabled = {
            Controller = {
                { 0, 2 }, -- Look Up and Down
                { 0, 1 }, -- Look Left and Right
                { 0, 25 }, -- Aim
                { 0, 24 }, -- Attack
            },
            Keyboard = {
                { 0, 201 }, -- Select
                { 0, 195 }, -- X axis
                { 0, 196 }, -- Y axis
                { 0, 187 }, -- Down
                { 0, 188 }, -- Up
                { 0, 189 }, -- Left
                { 0, 190 }, -- Right
                { 0, 202 }, -- Back
                { 0, 217 }, -- Select
                { 0, 242 }, -- Scroll down
                { 0, 241 }, -- Scroll up
                { 0, 239 }, -- Cursor X
                { 0, 240 }, -- Cursor Y
                { 0, 31 }, -- Move Up and Down
                { 0, 30 }, -- Move Left and Right
                { 0, 21 }, -- Sprint
                { 0, 22 }, -- Jump
                { 0, 23 }, -- Enter
                { 0, 75 }, -- Exit Vehicle
                { 0, 71 }, -- Accelerate Vehicle
                { 0, 72 }, -- Vehicle Brake
                { 0, 59 }, -- Move Vehicle Left and Right
                { 0, 89 }, -- Fly Yaw Left
                { 0, 9 }, -- Fly Left and Right
                { 0, 8 }, -- Fly Up and Down
                { 0, 90 }, -- Fly Yaw Right
                { 0, 76 }, -- Vehicle Handbrake
            },
        },
    },
    Audio = {
        Library = "HUD_FRONTEND_DEFAULT_SOUNDSET",
        UpDown = "NAV_UP_DOWN",
        LeftRight = "NAV_LEFT_RIGHT",
        Select = "SELECT",
        Back = "BACK",
        Error = "ERROR",
        Slider = "CONTINUOUS_SLIDER",
        Id = nil,
    },
    Items = {
        Title = {
            Background = { Width = 431, Height = 107 },
            Text = { X = 215, Y = 20, Scale = 1.15 },
        },
        Subtitle = {
            Background = { Width = 431, Height = 37 },
            Text = { X = 8, Y = 3, Scale = 0.35 },
            PreText = { X = 425, Y = 3, Scale = 0.35 },
        },
        Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 0, Width = 431 },
        Navigation = {
            Rectangle = { Width = 431, Height = 18 },
            Offset = 5,
            Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 190, Y = -6, Width = 50, Height = 50 },
        },
        Description = {
            Bar = { Y = 4, Width = 431, Height = 4 },
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 30 },
            Text = { X = 8, Y = 10, Scale = 0.35 },
        },
        Button = {
            Rectangle = { Y = 0, Width = 431, Height = 38 },
            Text = { X = 8, Y = 3, Scale = 0.33 },
            LeftBadge = { Y = -2, Width = 40, Height = 40 },
            RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
            RightText = { X = 420, Y = 4, Scale = 0.35 },
            SelectedSprite = { Dictionary = "commonmenu", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
        },
        Checkbox = { Dictionary = "commonmenu", Textures = {
            "shop_box_blankb", -- 1
            "shop_box_tickb", -- 2
            "shop_box_blank", -- 3
            "shop_box_tick", -- 4
            "shop_box_crossb", -- 5
            "shop_box_cross", -- 6
        }, X = 380, Y = -6, Width = 50, Height = 50 },
        List = {
            LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 378, Y = 3, Width = 30, Height = 30 },
            RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 400, Y = 3, Width = 30, Height = 30 },
            Text = { X = 403, Y = 3, Scale = 0.35 },
        },
        Slider = {
            Background = { X = 250, Y = 14.5, Width = 150, Height = 9 },
            Slider = { X = 250, Y = 14.5, Width = 75, Height = 9 },
            Divider = { X = 323.5, Y = 9, Width = 2.5, Height = 20 },
            LeftArrow = { Dictionary = "commonmenutu", Texture = "arrowleft", X = 235, Y = 11.5, Width = 15, Height = 15 },
            RightArrow = { Dictionary = "commonmenutu", Texture = "arrowright", X = 400, Y = 11.5, Width = 15, Height = 15 },
        },
        Progress = {
            Background = { X = 8, Y = 33, Width = 415, Height = 20 },
            Bar = { X = 11.75, Y = 36.75, Width = 407.5, Height = 12.5 },
            Height = 60
        },
    },
    Panels = {
        Grid = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 275 },
            Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 115.5, Y = 47.5, Width = 200, Height = 200 },
            Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
            Text = {
                Top = { X = 215.5, Y = 15, Scale = 0.35 },
                Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
                Left = { X = 57.75, Y = 130, Scale = 0.35 },
                Right = { X = 373.25, Y = 130, Scale = 0.35 },
            },
        },
        Colour = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 112 },
            LeftArrow = { Dictionary = "commonmenu", Texture = "arrowleft", X = 7.5, Y = 15, Width = 30, Height = 30 },
            RightArrow = { Dictionary = "commonmenu", Texture = "arrowright", X = 393.5, Y = 15, Width = 30, Height = 30 },
            Header = { X = 215.5, Y = 15, Scale = 0.35 },
            Box = { X = 15, Y = 55, Width = 44.5, Height = 44.5 },
            SelectedRectangle = { X = 15, Y = 47, Width = 44.5, Height = 8 },
        },
        Percentage = {
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 76 },
            Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
            Text = {
                Left = { X = 25, Y = 15, Scale = 0.35 },
                Middle = { X = 215.5, Y = 15, Scale = 0.35 },
                Right = { X = 398, Y = 15, Scale = 0.35 },
            },
        },
    },
    Windows = {
        Heritage = {
            Background = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "mumdadbg", Width = 431, Height = 228 },
            Mum = { Dictionary = "char_creator_portraits", X = 25, Width = 228, Height = 228 },
            Dad = { Dictionary = "char_creator_portraits", X = 195, Width = 228, Height = 228 },
        },
    },
}

---IsMouseInBounds
---@param X number
---@param Y number
---@param Width number
---@param Height number
---@return number
---@public
function NativeUI.IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(0, 239) * 1920) / 1920, math.round(GetControlNormal(0, 240) * 1080) / 1080
    X, Y = X / 1920, Y / 1080
    Width, Height = Width / 1920, Height / 1080
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end

---GetSafeZoneBounds
---@return table
---@public
function NativeUI.GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize

    local W, H = 1920, 1080

    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end

---PlaySound
---@param Library string
---@param Sound string
---@param IsLooped boolean
---@return nil
---@public
function NativeUI.PlaySound(Library, Sound, IsLooped)
    if not IsLooped then
        PlaySoundFrontend(-1, Sound, Library, true)
    else
        if not NativeUI.Settings.Audio.Id then
            Citizen.CreateThread(function()
                NativeUI.Settings.Audio.Id = GetSoundId()

                PlaySoundFrontend(NativeUI.Settings.Audio.Id, Sound, Library, true)

                Citizen.Wait(0.01)

                StopSound(NativeUI.Settings.Audio.Id)

                ReleaseSoundId(NativeUI.Settings.Audio.Id)

                NativeUI.Settings.Audio.Id = nil
            end)
        end
    end
end

---CreateMenu
---@param Title string
---@param Subtitle string
---@param X number
---@param Y number
---@param TextureDictionary string
---@param TextureName string
---@return table
---@public
function NativeUI.CreateMenu(Title, Subtitle, X, Y, TextureDictionary, TextureName)

    ---@type table
    local Menu = {}

    Menu.Title = Title or ""
    Menu.Subtitle = Subtitle or ""
    Menu.SubtitleHeight = -37
    Menu.Description = ""
    Menu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height
    Menu.X = X or 0
    Menu.Y = Y or 0
    Menu.Parent = nil
    Menu.WidthOffset = 0
    Menu.Open = false
    Menu.Controls = NativeUI.Settings.Controls
    Menu.Index = 1
    Menu.Sprite = { Dictionary = TextureDictionary or "commonmenu", Texture = TextureName or "interaction_bgd" }
    Menu.Rectangle = nil
    Menu.Pagination = { Minimum = 1, Maximum = 10, Total = 10 }
    Menu.Safezone = false
    Menu.SafeZoneSize = nil
    Menu.Options = 0

    if string.starts(Menu.Subtitle, "~") then
        Menu.PageCounterColour = string.sub(Menu.Subtitle, 1, 3)
    else
        Menu.PageCounterColour = ""
    end

    if Menu.Subtitle ~= "" then
        local SubtitleLineCount = NativeUI.GetLineCount(Menu.Subtitle, Menu.X + NativeUI.Settings.Items.Subtitle.Text.X, Menu.Y + NativeUI.Settings.Items.Subtitle.Text.Y, 0, NativeUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, NativeUI.Settings.Items.Subtitle.Background.Width + Menu.WidthOffset)

        if SubtitleLineCount > 1 then
            Menu.SubtitleHeight = 18 * SubtitleLineCount
        else
            Menu.SubtitleHeight = 0
        end
    end

    return setmetatable(Menu, NativeUI.Menus)
end

---CreateSubMenu
---@param ParentMenu function
---@param Title string
---@param Subtitle string
---@param X number
---@param Y number
---@param TextureDictionary string
---@param TextureName string
---@return table
---@public
function NativeUI.CreateSubMenu(ParentMenu, Title, Subtitle, X, Y, TextureDictionary, TextureName)
    if ParentMenu ~= nil then
        if ParentMenu() then

            ---@type table
            local Menu = {}

            Menu.Title = Title or ParentMenu.Title
            Menu.Subtitle = Subtitle or ParentMenu.Subtitle
            Menu.SubtitleHeight = -37
            Menu.Description = ""
            Menu.DescriptionHeight = NativeUI.Settings.Items.Description.Background.Height
            Menu.X = X or ParentMenu.X
            Menu.Y = Y or ParentMenu.Y
            Menu.Parent = ParentMenu
            Menu.WidthOffset = ParentMenu.WidthOffset
            Menu.Open = false
            Menu.Controls = NativeUI.Settings.Controls
            Menu.Index = 1
            Menu.Pagination = { Minimum = 1, Maximum = 10, Total = 10 }
            Menu.Safezone = ParentMenu.Safezone
            Menu.SafeZoneSize = nil
            Menu.Options = 0

            if string.starts(Menu.Subtitle, "~") then
                Menu.PageCounterColour = string.sub(Menu.Subtitle, 1, 3)
            else
                Menu.PageCounterColour = ""
            end

            if Menu.Subtitle ~= "" then
                local SubtitleLineCount = NativeUI.GetLineCount(Menu.Subtitle, Menu.X + NativeUI.Settings.Items.Subtitle.Text.X, Menu.Y + NativeUI.Settings.Items.Subtitle.Text.Y, 0, NativeUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, NativeUI.Settings.Items.Subtitle.Background.Width + Menu.WidthOffset)

                if SubtitleLineCount > 1 then
                    Menu.SubtitleHeight = 18 * SubtitleLineCount
                else
                    Menu.SubtitleHeight = 0
                end
            end

            if ParentMenu.Sprite then
                Menu.Sprite = { Dictionary = TextureDictionary or ParentMenu.Sprite.Dictionary, Texture = TextureName or ParentMenu.Sprite.Texture }
            else
                Menu.Rectangle = ParentMenu.Rectangle
            end

            return setmetatable(Menu, NativeUI.Menus)
        else
            return nil
        end
    else
        return nil
    end
end

---Visible
---@param Menu function
---@param Value boolean
---@return table
---@public
function NativeUI.Visible(Menu, Value)
    if Menu ~= nil then
        if Menu() then
            if type(Value) == "boolean" then
                Menu.Open = Value

                if Menu.Open then
                    NativeUI.CurrentMenu = Menu
                    NativeUI.Options = 0
                    NativeUI.ItemOffset = 0
                else
                    NativeUI.CurrentMenu = nil
                    NativeUI.Options = 0
                    NativeUI.ItemOffset = 0
                end
            else
                return Menu.Open
            end
        end
    end
end

---Title
---@return nil
---@public
function NativeUI.Title()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if not NativeUI.CurrentMenu.SafeZoneSize then
                NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                if NativeUI.CurrentMenu.Safezone then
                    NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                    ScreenDrawPositionBegin(76, 84)
                    ScreenDrawPositionRatio(0, 0, 0, 0)
                end
            end

            if NativeUI.CurrentMenu.Sprite then
                NativeUI.RenderSprite(NativeUI.CurrentMenu.Sprite.Dictionary, NativeUI.CurrentMenu.Sprite.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y, NativeUI.Settings.Items.Title.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Title.Background.Height)
            else
                NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y, NativeUI.Settings.Items.Title.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Title.Background.Height, NativeUI.CurrentMenu.Rectangle.R, NativeUI.CurrentMenu.Rectangle.G, NativeUI.CurrentMenu.Rectangle.B, NativeUI.CurrentMenu.Rectangle.A)
            end

            NativeUI.RenderText(NativeUI.CurrentMenu.Title, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Title.Text.X + (NativeUI.CurrentMenu.WidthOffset / 2), NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Title.Text.Y, 1, NativeUI.Settings.Items.Title.Text.Scale, 255, 255, 255, 255, 1)

            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Items.Title.Background.Height
        end
    end
end

---Subtitle
---@return nil
---@public
function NativeUI.Subtitle()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if not NativeUI.CurrentMenu.SafeZoneSize then
                NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                if NativeUI.CurrentMenu.Safezone then
                    NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                    ScreenDrawPositionBegin(76, 84)
                    ScreenDrawPositionRatio(0, 0, 0, 0)
                end
            end

            if NativeUI.CurrentMenu.Subtitle ~= "" then
                NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.ItemOffset, NativeUI.Settings.Items.Subtitle.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Subtitle.Background.Height + NativeUI.CurrentMenu.SubtitleHeight, 0, 0, 0, 255)
                NativeUI.RenderText(NativeUI.CurrentMenu.Subtitle, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Subtitle.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Subtitle.Text.Y + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, NativeUI.Settings.Items.Subtitle.Background.Width + NativeUI.CurrentMenu.WidthOffset)

                if NativeUI.CurrentMenu.Options >= NativeUI.CurrentMenu.Pagination.Total + 1 then
                    NativeUI.RenderText(NativeUI.CurrentMenu.PageCounterColour .. NativeUI.CurrentMenu.Index .. " / " .. NativeUI.CurrentMenu.Options, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Subtitle.PreText.X + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Subtitle.PreText.Y + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                end

                NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.Settings.Items.Subtitle.Background.Height
            end
        end
    end
end

---Background
---@return nil
---@public
function NativeUI.Background()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if not NativeUI.CurrentMenu.SafeZoneSize then
                NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                if NativeUI.CurrentMenu.Safezone then
                    NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                    ScreenDrawPositionBegin(76, 84)
                    ScreenDrawPositionRatio(0, 0, 0, 0)
                end
            end

            SetUiLayer(0)
            NativeUI.RenderSprite(NativeUI.Settings.Items.Background.Dictionary, NativeUI.Settings.Items.Background.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Background.Y + NativeUI.CurrentMenu.SubtitleHeight, NativeUI.Settings.Items.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.ItemOffset, 0, 0, 0, 255)
            SetUiLayer(1)
        end
    end
end

---Description
---@return nil
---@public
function NativeUI.Description()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then
            if not NativeUI.CurrentMenu.SafeZoneSize then
                NativeUI.CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }

                if NativeUI.CurrentMenu.Safezone then
                    NativeUI.CurrentMenu.SafeZoneSize = NativeUI.GetSafeZoneBounds()

                    ScreenDrawPositionBegin(76, 84)
                    ScreenDrawPositionRatio(0, 0, 0, 0)
                end
            end


            NativeUI.RenderRectangle(NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Description.Bar.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Description.Bar.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.Settings.Items.Description.Bar.Height, 0, 0, 0, 255)
            NativeUI.RenderSprite(NativeUI.Settings.Items.Description.Background.Dictionary, NativeUI.Settings.Items.Description.Background.Texture, NativeUI.CurrentMenu.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Description.Background.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, NativeUI.Settings.Items.Description.Background.Width + NativeUI.CurrentMenu.WidthOffset, NativeUI.CurrentMenu.DescriptionHeight, 0, 0, 0, 255)
            NativeUI.RenderText(NativeUI.CurrentMenu.Description, NativeUI.CurrentMenu.X + NativeUI.Settings.Items.Description.Text.X, NativeUI.CurrentMenu.Y + NativeUI.Settings.Items.Description.Text.Y + NativeUI.CurrentMenu.SubtitleHeight + NativeUI.ItemOffset, 0, NativeUI.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, NativeUI.Settings.Items.Description.Background.Width + NativeUI.CurrentMenu.WidthOffset)

            NativeUI.ItemOffset = NativeUI.ItemOffset + NativeUI.CurrentMenu.DescriptionHeight + NativeUI.Settings.Items.Description.Bar.Y
        end
    end
end

---Render
---@return nil
---@public
function NativeUI.Render()
    if NativeUI.CurrentMenu ~= nil then
        if NativeUI.CurrentMenu() then

            if NativeUI.CurrentMenu.Safezone then
                ScreenDrawPositionEnd()
            end

            NativeUI.CurrentMenu.Options = NativeUI.Options
            NativeUI.CurrentMenu.SafeZoneSize = nil

            NativeUI.Controls()

            NativeUI.Options = 0
            NativeUI.ItemOffset = 0

            if NativeUI.CurrentMenu.Controls.Back.Pressed then
                NativeUI.CurrentMenu.Controls.Back.Pressed = false

                NativeUI.PlaySound(NativeUI.Settings.Audio.Library, NativeUI.Settings.Audio.Back)

                if NativeUI.CurrentMenu.Parent ~= nil then
                    if NativeUI.CurrentMenu.Parent() then
                        NativeUI.NextMenu = NativeUI.CurrentMenu.Parent
                    else
                        NativeUI.NextMenu = nil
                        NativeUI.Visible(NativeUI.CurrentMenu, false)
                    end
                else
                    NativeUI.NextMenu = nil
                    NativeUI.Visible(NativeUI.CurrentMenu, false)
                end
            end

            if NativeUI.NextMenu ~= nil then
                if NativeUI.NextMenu() then
                    NativeUI.Visible(NativeUI.CurrentMenu, false)
                    NativeUI.Visible(NativeUI.NextMenu, true)
                    NativeUI.CurrentMenu.Controls.Select.Active = false
                end
            end
        end
    end
end

---SetTitle
---@param Title string
---@return nil
---@public
function NativeUI.Menus:SetTitle(Title)
    self.Title = Title
end

---SetSubtitle
---@param Subtitle string
---@return nil
---@public
function NativeUI.Menus:SetSubtitle(Subtitle)

    self.Subtitle = Subtitle or self.Subtitle

    if string.starts(self.Subtitle, "~") then
        self.PageCounterColour = string.sub(self.Subtitle, 1, 3)
    else
        self.PageCounterColour = ""
    end

    if self.Subtitle ~= "" then
        local SubtitleLineCount = NativeUI.GetLineCount(self.Subtitle, self.X + NativeUI.Settings.Items.Subtitle.Text.X, self.Y + NativeUI.Settings.Items.Subtitle.Text.Y, 0, NativeUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, NativeUI.Settings.Items.Subtitle.Background.Width + self.WidthOffset)

        if SubtitleLineCount > 1 then
            self.SubtitleHeight = 18 * SubtitleLineCount
        else
            self.SubtitleHeight = 0
        end
    else
        self.SubtitleHeight = -37
    end
end

---SetPosition
---@param X number
---@param Y number
---@return nil
---@public
function NativeUI.Menus:SetPosition(X, Y)
    self.X = tonumber(X) or self.X
    self.Y = tonumber(Y) or self.Y
end

---SetTotalItemsPerPage
---@param Value number
---@return nil
---@public
function NativeUI.Menus:SetTotalItemsPerPage(Value)
    self.Pagination.Total = tonumber(Value) or self.Pagination.Total
end

---SetRectangleBanner
---@param R number
---@param G number
---@param B number
---@param A number
---@return nil
---@public
function NativeUI.Menus:SetRectangleBanner(R, G, B, A)
    self.Rectangle = { R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255 }
    self.Sprite = nil
end

---SetSpriteBanner
---@param TextureDictionary string
---@param Texture string
---@return nil
---@public
function NativeUI.Menus:SetSpriteBanner(TextureDictionary, Texture)
    self.Sprite = { Dictionary = TextureDictionary or "commonmenu", Texture = Texture or "interaction_bgd" }
    self.Rectangle = nil
end