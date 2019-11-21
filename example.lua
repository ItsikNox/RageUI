--[[
local _timerBarPool = UITimerBarPool.New()

local Food = UIBarIcon.New("commonmenu", "mp_specitem_heroin", math.random(0, 100), { R = 255, G = 163, B = 26 })
_timerBarPool:Add(Food)
Food:Visible(_timerBarPool, true)

local Water = UIBarIcon.New("commonmenu", "mp_specitem_heroin", math.random(0, 100), { R = 0, G = 102, B = 255 })
_timerBarPool:Add(Water)
Water:Visible(_timerBarPool, true)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        _timerBarPool:Draw()
    end
end)
]]--

--[[
local updateShowcaseData = {
    count = 1;
}

Citizen.CreateThreadNow(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE")

    --mainMenu:SetPosition(700,300)
    mainMenu.Closed = function()
        RageUI.Popup({
            message = "RageUI showcase menu closed",
            colors = 200
        })
    end

    mainMenu:SetSubtitle("~b~RAGEUI SHOWCASE - RAGEUI")
    mainMenu.EnableMouse = true;

    local updateShowcase = RageUI.CreateSubMenu(mainMenu, "", "~b~RAGEUI SHOWCASE", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")

    local menuWeaponPanel = RageUI.CreateSubMenu(mainMenu, "", "~b~RAGEUI SHOWCASE", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")

    menuWeaponPanel.list = {
        index = 1
    }

    menuWeaponPanel.list.WeaponName = {
        ['weapon_golfclub'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_gclub_silhouette' },
        },
        ['weapon_knife'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_knife_silhouette' },
        },
        ['weapon_crowbar'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_crowbar_silhouette' },
        },
        ['weapon_bat'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_bat_silhouette' },
        },
        ['weapon_hammer'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_hammer_silhouette' },
        },
        ['weapon_pistol'] = {
            ['base'] = { 'mpweaponsgang1', 'w_pi_pistol_silhouette_overlay' },
            ['acc'] = { ['component_pistol_clip_01'] = 'w_pi_pistol_mag1_silhouette',
                        ['component_pistol_clip_02'] = 'w_pi_pistol_mag2_silhouette',
                        ['component_at_pi_supp_02'] = 'w_pi_pistol_supp_silhouette',
                        ['component_at_pi_flsh'] = 'w_pi_pistol_flash_silhouette'
            }
        },
        ['weapon_smokegrenade'] = {
            ['base'] = { 'mpweaponscommon', 'w_ex_grenadesmoke_silhouette' },
        },
        ['weapon_pumpshotgun'] = {
            ['base'] = { 'mpweaponscommon', 'w_sg_pumpshotgun_silhouette _overlay' },
            ['acc'] = { ['component_at_ar_flsh'] = 'w_sg_pumpshotgun_flash_silhouette',
                        ['component_at_sr_supp'] = 'w_sg_pumpshotgun_supp_silhouette',
            }
        },
        ['weapon_microsmg'] = {
            ['base'] = { 'mpweaponscommon', 'w_sb_microsmg_silhouette_overlay' },
            ['acc'] = { ['component_at_pi_flsh'] = 'w_sb_microsmg_flash_silhouette',
                        ['component_microsmg_clip_01'] = 'w_sb_microsmg_mag1_silhouette',
                        ['component_microsmg_clip_02'] = 'w_sb_microsmg_mag2_silhouette',
                        ['component_at_scope_macro'] = 'w_sb_microsmg_scope_silhouette',
                        ['component_at_ar_supp_02'] = 'w_sb_microsmg_supp_silhouette',
            }
        },
        ['weapon_smg'] = {
            ['base'] = { 'mpweaponsgang0', 'w_sb_smg_silhouette_overlay' },
            ['acc'] = { ['component_at_ar_flsh'] = 'w_sb_smg_flash_silhouette',
                        ['component_smg_clip_01'] = 'w_sb_smg_mag1_silhouette',
                        ['component_smg_clip_02'] = 'w_sb_smg_mag2_silhouette',
                        ['component_smg_clip_03'] = '',
                        ['component_at_scope_macro_02'] = 'w_sb_smg_scope_silhouette',
                        ['component_at_pi_supp'] = 'w_sb_smg_supp_silhouette',
                        ['component_smg_clip_03'] = '',
            }
        },
        ['weapon_assaultrifle'] = {
            ['base'] = { 'mpweaponsgang1', 'w_ar_assaultrifle_silhouette_overlay' },
            ['acc'] = { ['component_assaultrifle_clip_01'] = 'w_ar_assaultrifle_mag1_silhouette',
                        ['component_assaultrifle_clip_02'] = 'w_ar_assaultrifle_mag2_silhouette',
                        ['component_assaultrifle_clip_03'] = '',
                        ['component_at_ar_supp_02'] = 'w_ar_assaultrifle_supp_silhouette',
                        ['component_at_ar_flsh'] = 'w_ar_assaultrifle_flash_silhouette',
                        ['component_at_ar_afgrip'] = 'w_ar_assaultrifle_grip_silhouette',
                        ['component_at_scope_macro'] = 'w_ar_assaultrifle_scope_silhouette',
            }
        },
        ['weapon_carbinerifle'] = {
            ['base'] = { 'mpweaponsgang0', 'w_ar_carbinerifle_silhouette_overlay' },
            ['acc'] = { ['component_carbinerifle_clip_01'] = 'w_ar_carbinerifle_mag1_silhouette',
                        ['component_carbinerifle_clip_02'] = 'w_ar_carbinerifle_mag2_silhouette',
                        ['component_carbinerifle_clip_03'] = '',
                        ['component_at_ar_supp'] = 'w_ar_carbinerifle_supp_silhouette',
                        ['component_at_ar_flsh'] = 'w_ar_carbinerifle_flash_silhouette',
                        ['component_at_ar_afgrip'] = 'w_ar_carbinerifle_grip_silhouette',
                        ['component_at_scope_medium'] = 'w_ar_carbinerifle_scope_silhouette',
            }
        },
        ['weapon_sniperrifle'] = {
            ['base'] = { 'mpweaponsgang0', 'w_sr_sniperrifle_silhouette_overlay' },
            ['acc'] = { ['component_at_scope_large'] = 'w_sr_sniperrifle_scope_large_silhouette',
                        ['component_at_scope_max'] = 'w_sr_sniperrifle_scope_silhouette',
                        ['component_at_ar_supp_02'] = 'w_sr_sniperrifle_supp_silhouette',
            }
        },
        ['weapon_stungun'] = {
            ['base'] = { 'mpweaponsgang0', 'w_pi_stungun_silhouette' },
        },
        ['weapon_nightstick'] = {
            ['base'] = { 'mpweaponsunusedfornow', 'w_me_nightstick_silhouette' },
        },
    }

    menuWeaponPanel.list.Indexes = {}
    for k, v in pairs(menuWeaponPanel.list.WeaponName) do
        file = v.base[1]
        if not HasStreamedTextureDictLoaded(file) then
            RequestStreamedTextureDict(file, true)
            while not HasStreamedTextureDictLoaded(file) do
                Wait(1)
            end
        end

        table.insert(menuWeaponPanel.list.Indexes, k)
    end

    updateShowcase.EnableMouse = false;
    updateShowcase:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 56, 0),
        [2] = "Add item",
    })

    updateShowcase:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 57, 0),
        [2] = "Remove item",
    })

    local panelShowcase = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~RAGEUI SHOWCASE - PANELS")
    panelShowcase.EnableMouse = true;

    local description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

    local mainMenuData = {
        checkbox = {
            tick = false,
            cross = false,
        },
        list = {
            data = {
                "Banana",
                "Apple",
                "Pizza",
                "Quartilicious",
                "Steak",
                0xF00D,
            },
            index = 1,
        },
        slider = {
            max = 10,
            index = 1
        },
        progress = {
            show = false,
            max = 25,
            index = 1,
        },
    }

    local panelShowcaseData = {
        colors = {
            enable = false,
            index_one = 1,
            index_two = 1
        },
        percentage = {
            enable = false,
            index = 1
        },
        vertical = {
            enable = false,
            y = 0.5
        },
        horizontal = {
            enable = false,
            x = 0.5,
        },
        square = {
            enable = false,
            x = 0.5,
            y = 0.5
        }
    }

    local HeritageIndex = 5
    function RefreshWeaponsAccess(weapon_name)
        menuWeaponPanel.list.access = {}
        EnabledAcces = {}
        if menuWeaponPanel.list.WeaponName[weapon_name]["acc"] ~= nil then
            for k, v in pairs(menuWeaponPanel.list.WeaponName[weapon_name]["acc"]) do
                menuWeaponPanel.list.access[k] = v
                EnabledAcces[k] = {}
            end
        end
    end
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end

        if IsControlJustPressed(1, 56) then
            updateShowcaseData.count = updateShowcaseData.count + 1
        end
        if IsControlJustPressed(1, 57) then
            if (updateShowcaseData.count > 1) then
                updateShowcaseData.count = updateShowcaseData.count - 1
            end
        end

        if RageUI.Visible(mainMenu) then

            RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
                ---Items

                RageUI.Checkbox("Checkbox - Style 1 (click me!)", description, mainMenuData.checkbox.tick, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    mainMenuData.checkbox.tick = Checked
                    mainMenuData.progress.show = Checked
                end)

                RageUI.Checkbox("Checkbox - Style 2", description, mainMenuData.checkbox.cross, { Style = RageUI.CheckboxStyle.Cross }, function(Hovered, Selected, Active, Checked)
                    mainMenuData.checkbox.cross = Checked
                end)

                RageUI.List("Food", mainMenuData.list.data, mainMenuData.list.index, description, {}, true, function(Hovered, Active, Selected, Index)
                    mainMenuData.list.index = Index

                end)


                RageUI.Slider("Quantité", mainMenuData.slider.index, mainMenuData.slider.max, description, true, { }, true, function(Hovered, Selected, Active, Index)
                    mainMenuData.slider.index = Index

                    RageUI.Text({
                        message = Index
                    })
                end)

                RageUI.UISliderHeritage("Ressemblance", HeritageIndex, description, function(Hovered, Selected, Active, Heritage, Index)
                    HeritageIndex = Index

                    RageUI.Text({
                        message = Heritage
                    })
                end)

                if (mainMenuData.progress.show) then
                    RageUI.Progress("Progress ", mainMenuData.progress.index, mainMenuData.progress.max, description, true, true, function(Hovered, Selected, Active, Index)
                        mainMenuData.progress.index = Index
                    end)
                end

                RageUI.Button("Another Menu", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                end, updateShowcase)

                RageUI.Button("Weapon Panel Menu", description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                end, menuWeaponPanel)

            end, function()
                ---Panels

            end)
        elseif RageUI.Visible(menuWeaponPanel) then
            RageUI.DrawContent({ header = true, glare = false, nstructionalButton = true }, function()
                RageUI.List("Weapon", menuWeaponPanel.list.Indexes, menuWeaponPanel.list.index, nil, {}, true, function(Hovered, Active, Selected, Index)
                    if Index ~= menuWeaponPanel.list.index then
                        menuWeaponPanel.list.index = Index
                        RefreshWeaponsAccess(menuWeaponPanel.list.Indexes[menuWeaponPanel.list.index])
                    end
                end)
                if menuWeaponPanel.list.access ~= nil then
                    for k, v in pairs(menuWeaponPanel.list.access) do
                        RageUI.Checkbox(k, nil, EnabledAcces[k].enabled, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                            EnabledAcces[k].enabled = Checked
                        end)
                    end
                end
            end, function()
                local accessoires = {}
                if menuWeaponPanel.list.access ~= nil then
                    for k, v in pairs(menuWeaponPanel.list.access) do
                        if EnabledAcces[k].enabled then
                            table.insert(accessoires, k)
                        end
                    end
                end
                RageUI.WeaponPanel(menuWeaponPanel.list.Indexes[menuWeaponPanel.list.index], accessoires, "Accessoires", function()
                end)
            end)
        elseif RageUI.Visible(updateShowcase) then
            RageUI.DrawContent({ header = true, glare = false, nstructionalButton = true }, function()

                for i = 1, updateShowcaseData.count do
                    RageUI.Button("Another Sub-Menu " .. i, description, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                        if Active then
                        end
                    end, panelShowcase)
                end

            end, function()
                ---Panels
            end)
        elseif RageUI.Visible(panelShowcase) then
            RageUI.DrawContent({ header = false, glare = true, instructionalButton = true }, function()
                ---Items
                RageUI.Checkbox("Colors Panel", description, panelShowcaseData.colors.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.colors.enable = Checked
                end)

                RageUI.Checkbox("Percentage Panel", description, panelShowcaseData.percentage.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.percentage.enable = Checked
                end)

                RageUI.Checkbox("Horizontal Grid Panel", description, panelShowcaseData.horizontal.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.horizontal.enable = Checked
                end)

                RageUI.Checkbox("Vertical Grid Panel", description, panelShowcaseData.vertical.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.vertical.enable = Checked
                end)

                RageUI.Checkbox("Square Grid Panel", description, panelShowcaseData.square.enable, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    panelShowcaseData.square.enable = Checked
                end)

            end, function()
                ---Panels

                if (panelShowcaseData.colors.enable) then
                    RageUI.ColourPanel("Colours", RageUI.HaircutColorsPanel, panelShowcaseData.colors.index_one, panelShowcaseData.colors.index_two, function(Hovered, Active, MinimumIndex, CurrentIndex)
                        panelShowcaseData.colors.index_one = MinimumIndex
                        panelShowcaseData.colors.index_two = CurrentIndex

                        RageUI.Text({
                            message = "Colours Panel | MinimumIndex : " .. MinimumIndex .. " CurrentIndex : " .. CurrentIndex
                        })
                    end)
                end

                if (panelShowcaseData.percentage.enable) then
                    RageUI.PercentagePanel(panelShowcaseData.percentage.index, "HeaderText", "MinText", "MaxText", function(Hovered, Active, Percent)
                        panelShowcaseData.percentage.index = Percent
                        RageUI.Text({
                            message = "Percentage | Current : " .. Percent
                        })
                    end)
                end

                if (panelShowcaseData.horizontal.enable) then
                    RageUI.GridPanelHorizontal(panelShowcaseData.horizontal.x, "LeftText", "RightText", function(Hovered, Active, X)
                        panelShowcaseData.horizontal.x = X
                        RageUI.Text({
                            message = "Grid Panel Horizontal | X : " .. X
                        })
                    end)
                end

                if (panelShowcaseData.vertical.enable) then
                    RageUI.GridPanelVertical(panelShowcaseData.vertical.y, "TopText", "BottomText", function(Hovered, Active, Y)
                        panelShowcaseData.vertical.y = Y
                        RageUI.Text({
                            message = "Grid Panel Vertical | Y : " .. Y
                        })
                    end)
                end

                if (panelShowcaseData.square.enable) then
                    RageUI.GridPanel(panelShowcaseData.square.x, panelShowcaseData.square.y, "TopText", "BottomText", "LeftText", "RightText", function(Hovered, Active, X, Y)
                        panelShowcaseData.square.x = X
                        panelShowcaseData.square.y = Y
                        RageUI.Text({
                            message = "Grid Panel | X :" .. X .. " Y : " .. Y
                        })
                    end)
                end

            end)
        end
    end

end)
]]--