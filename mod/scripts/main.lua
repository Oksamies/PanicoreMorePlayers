LoopAsync(2000, function()
    local menus = FindAllOf("WBP_HostMultiplayerMenu_Silence_C")
    if menus then
        for Index, menu in pairs(menus) do
            if not (tostring(menu:GetPropertyValue("MaxPlayerCountSlider").SliderMaxValue) == "100.0") then
                menu:GetPropertyValue("MaxPlayerCountSlider").SliderMaxValue = 100.000000
                print("Set max players to 100")
            end
        end
    end
    return false -- Loops forever
end)


RegisterHook("/Script/Engine.PlayerController:ClientRestart", function (Context)

    LoopAsync(2000, function()
        local players = FindAllOf("PS_Lobby_C")
        if players then
            for Index, player in pairs(players) do
                player.Ready = true
            end
        end
        return false -- Loops forever
    end)
end)