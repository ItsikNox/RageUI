local Grid = {
    Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 200 },
    Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 115.5, Y = 47.5, Width = 200, Height = 100 },
    Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
    Text = {
        Top = { X = 215.5, Y = 15, Scale = 0.35 },
        Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
        Left = { X = 57.75, Y = 130, Scale = 0.35 },
        Right = { X = 373.25, Y = 130, Scale = 0.35 },
    },
}


local weapon_data = {
     ['weapon_golfclub'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_gclub_silhouette'},
                         },
     ['weapon_knife'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_knife_silhouette'},
                         },
     ['weapon_crowbar'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_crowbar_silhouette'},
                         },
     ['weapon_bat'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_bat_silhouette'},
                         },
     ['weapon_hammer'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_hammer_silhouette'},
                         },
     ['weapon_pistol'] = {
                         ['base'] = {'mpweaponsgang1','w_pi_pistol_silhouette_overlay'},
                         ['acc'] = {['component_pistol_clip_01'] = 'w_pi_pistol_mag1_silhouette',
                                    ['component_pistol_clip_02'] = 'w_pi_pistol_mag2_silhouette',
                                    ['component_at_pi_supp_02'] = 'w_pi_pistol_supp_silhouette',
                                    ['component_at_pi_flsh'] = 'w_pi_pistol_flash_silhouette'
                                 }
                         },
     ['weapon_smokegrenade'] = {
                         ['base'] = {'mpweaponscommon','w_ex_grenadesmoke_silhouette'},
                         },
     ['weapon_pumpshotgun'] = {
                         ['base'] = {'mpweaponscommon','w_sg_pumpshotgun_silhouette _overlay'},
                         ['acc'] = {['component_at_ar_flsh'] ='w_sg_pumpshotgun_flash_silhouette',
                                    ['component_at_sr_supp'] ='w_sg_pumpshotgun_supp_silhouette',
                                    }
                         },
     ['weapon_microsmg'] = {
                         ['base'] = {'mpweaponscommon','w_sb_microsmg_silhouette_overlay'},
                         ['acc'] = {['component_at_pi_flsh'] = 'w_sb_microsmg_flash_silhouette',
                                    ['component_microsmg_clip_01'] = 'w_sb_microsmg_mag1_silhouette',
                                    ['component_microsmg_clip_02'] = 'w_sb_microsmg_mag2_silhouette',
                                    ['component_at_scope_macro'] = 'w_sb_microsmg_scope_silhouette',
                                    ['component_at_ar_supp_02'] = 'w_sb_microsmg_supp_silhouette',
                                   }
                         },
     ['weapon_smg'] = {
                         ['base'] = {'mpweaponsgang0','w_sb_smg_silhouette_overlay'},
                         ['acc'] = {['component_at_ar_flsh'] = 'w_sb_smg_flash_silhouette',
                                    ['component_smg_clip_01'] = 'w_sb_smg_mag1_silhouette',
                                    ['component_smg_clip_02'] = 'w_sb_smg_mag2_silhouette',
                                    ['component_smg_clip_03'] = '',
                                    ['component_at_scope_macro_02'] = 'w_sb_smg_scope_silhouette',
                                    ['component_at_pi_supp'] = 'w_sb_smg_supp_silhouette',
                                    ['component_smg_clip_03'] = '',
                                    }
                         },
     ['weapon_assaultrifle'] = {
                         ['base'] = {'mpweaponsgang1','w_ar_assaultrifle_silhouette_overlay'},
                         ['acc'] = {['component_assaultrifle_clip_01'] = 'w_ar_assaultrifle_mag1_silhouette',
                                    ['component_assaultrifle_clip_02'] = 'w_ar_assaultrifle_mag2_silhouette',
                                    ['component_assaultrifle_clip_03'] = '',
                                    ['component_at_ar_supp_02'] = 'w_ar_assaultrifle_supp_silhouette',
                                    ['component_at_ar_flsh'] = 'w_ar_assaultrifle_flash_silhouette',
                                    ['component_at_ar_afgrip'] = 'w_ar_assaultrifle_grip_silhouette',
                                    ['component_at_scope_macro'] = 'w_ar_assaultrifle_scope_silhouette',
                                    }
                         },
     ['weapon_carbinerifle'] = {
                         ['base'] = {'mpweaponsgang0','w_ar_carbinerifle_silhouette_overlay'},
                         ['acc'] = {['component_carbinerifle_clip_01'] = 'w_ar_carbinerifle_mag1_silhouette',
                                    ['component_carbinerifle_clip_02'] = 'w_ar_carbinerifle_mag2_silhouette',
                                    ['component_carbinerifle_clip_03'] = '',
                                    ['component_at_ar_supp'] = 'w_ar_carbinerifle_supp_silhouette',
                                    ['component_at_ar_flsh'] = 'w_ar_carbinerifle_flash_silhouette',
                                    ['component_at_ar_afgrip'] = 'w_ar_carbinerifle_grip_silhouette',
                                    ['component_at_scope_medium'] = 'w_ar_carbinerifle_scope_silhouette',
                                   }
                         },
     ['weapon_sniperrifle'] = {
                         ['base'] = {'mpweaponsgang0','w_sr_sniperrifle_silhouette_overlay'},
                         ['acc'] = {['component_at_scope_large'] = 'w_sr_sniperrifle_scope_large_silhouette',
                                    ['component_at_scope_max'] = 'w_sr_sniperrifle_scope_silhouette',
                                    ['component_at_ar_supp_02'] = 'w_sr_sniperrifle_supp_silhouette',
                                   }
                         },
     ['weapon_stungun'] = {
                         ['base'] = {'mpweaponsgang0','w_pi_stungun_silhouette'},
                         },
     ['weapon_nightstick'] = {
                         ['base'] = {'mpweaponsunusedfornow','w_me_nightstick_silhouette'},
                         },
}


---WeaponPanel
---@param Weapon string
---@param Component array
---@param Callback function
---@return nil
---@public
function RageUI.WeaponPanel(Weapon,Component, Title ,Callback)
    local CurrentMenu = RageUI.CurrentMenu

    if CurrentMenu ~= nil then
        if CurrentMenu() then
            ---@type boolean
            ---@type boolean
            local Selected = false

            if weapon_data[Weapon] ~= nil then
                local file = weapon_data[Weapon]['base'][1]
                if not HasStreamedTextureDictLoaded(file) then
                    RequestStreamedTextureDict(file, true)
                    while not HasStreamedTextureDictLoaded(file) do
                     Wait(1)
                    end
                end
                RenderSprite(file, weapon_data[Weapon].base[2], CurrentMenu.X  +  85.5 + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 300, 150,0.0,255, 255, 255, 255)
                RenderText(Title or "", CurrentMenu.X + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
                if Component ~= nil then
                    for _,acc in pairs(Component) do
                        if type(acc) == 'string' and weapon_data[Weapon]['acc'] ~= nil and weapon_data[Weapon]['acc'][acc] ~= nil then
                            RenderSprite(file,weapon_data[Weapon]['acc'][acc], CurrentMenu.X +85.5 + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 300, 150,0.0,255,0,0)
                        end
                    end
                end
            end
            RenderSprite(Grid.Background.Dictionary, Grid.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Grid.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Background.Width + CurrentMenu.WidthOffset, Grid.Background.Height)
            RageUI.ItemOffset = RageUI.ItemOffset + Grid.Background.Height + Grid.Background.Y

            Callback()
        end
    end
end


