Citizen.CreateThread(function()

    local mainMenu = RageUI.CreateMenu("RageUI", "~b~SHOWCASE", nil, nil)

    mainMenu.Closed = function()
        RageUI.Popup({
            message = "RageUI showcase menu closed",
            colors = 200
        })
    end

    mainMenu:SetSubtitle("~b~RAGEUI SHOWCASE - RAGEUI")
    mainMenu.EnableMouse = true;

    local subMenu = RageUI.CreateSubMenu(mainMenu, "", "~b~RAGEUI SHOWCASE", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
    subMenu.EnableMouse = true;

    local subMenuToSubMenu = RageUI.CreateSubMenu(mainMenu, "RageUI", "~b~RAGEUI SHOWCASE")
    subMenuToSubMenu.EnableMouse = true;

    local Description = "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"

    subMenu:AddInstructionButton({
        [1] = GetControlInstructionalButton(2, 55, 0),
        [2] = "This is a Spacebar",
    })

    while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 51) then
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end
        if RageUI.Visible(mainMenu) then

            RageUI.DrawContent({ header = false, instructionalButton = true }, function()
                ---Items
            end, function()
                ---Panels
            end)

        elseif RageUI.Visible(subMenu) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                for i = 1, 15 do
                    RageUI.Button("UIButton - " .. i, Description, { }, true, function(Hovered, Active, Selected)
                        if Active then
                        end
                    end, subMenuToSubMenu)
                end

            end, function()
                ---Panels
            end)
        elseif RageUI.Visible(subMenuToSubMenu) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                ---Items
            end, function()
                ---Panels
            end)
        end
        DisplayRadar(false)
    end

end)