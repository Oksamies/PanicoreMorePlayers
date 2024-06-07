local not_hooked = true
RegisterHook("/Script/UMG.Widget:SetFocus", function (Context)
    if not_hooked then
        print("MorePlayers: Hooked!")
        NotifyOnNewObject("/Game/MenuSystemPro/ExampleContent/Designs/Design_Silence/Widgets/Settings/WBP_Slider_Silence.WBP_Slider_Silence_C", function(slider)
            if tostring(slider:GetFullName()):sub(-#"MaxPlayerCountSlider") == "MaxPlayerCountSlider" then
                print("MorePlayers: MaxPlayerCountSlider created, waiting for it to initialize")
                ExecuteWithDelay(1000, function()
                    slider.SliderMaxValue = 20.000000
                    print(string.format("MorePlayers: Max player count set to: %s\n", tostring(slider:GetPropertyValue("SliderMaxValue"))))
                end)
            end
        end)
        not_hooked = false
    end
end)
