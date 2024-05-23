local addonName,ns = ...


--勾选框
function ns.AddCheck(name,tooltip,defaultValue,db)
    local variable = "toggle"
    local defaultValue = defaultValue
    local setting = Settings.RegisterProxySetting(ns.category, variable, db, type(defaultValue), name, defaultValue)
    return Settings.CreateCheckBox(ns.category, setting, tooltip)
end

--滑动条
function ns.AddSlider(name,tooltip,defaultValue,minValue,maxValue,step,db)
    local variable = "slider"
    local setting = Settings.RegisterProxySetting(ns.category, variable, db, type(defaultValue), name, defaultValue)
    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
    return Settings.CreateSlider(ns.category, setting, options, tooltip)
end

--下拉菜单
function ns.AddDropDown(name,tooltip,defaultValue,db,a,b,c,d,e)
    local variable = "selection"
    local function GetOptions()
        local container = Settings.CreateControlTextContainer()
		if a then 
        container:Add(1, a)
		end
		if b then 
        container:Add(2, b)
		end
		if c then 
        container:Add(3, c)
		end
		if d then
        container:Add(4, d)
		end

        return container:GetData()
    end

    local setting = Settings.RegisterProxySetting(ns.category, variable, db, type(defaultValue), name, defaultValue)
    Settings.CreateDropDown(ns.category, setting, GetOptions, tooltip)
end
--单按钮Blizzard_SettingControls.lua
function ns.AddButton(name,buttonText,tooltip,func,layout)
    local title= name or ''
    local buttonText= buttonText or ''
    local buttonClick= func or (function() end)
    local tooltip= tooltip or buttonText or tab.title or nil
    local layout= layout or ns.layout
    local addSearchTags= addSearchTags or title or buttonText or ''

    local initializer= CreateSettingsButtonInitializer(title, buttonText, buttonClick, tooltip, addSearchTags)
	layout:AddInitializer(initializer)
    return initializer
end
--勾选框+按钮
function ns.AddCheckButton(name,buttonText,tooltip,buttonfunc,checkValue,checkFunc,layout)
    local checkName = name
    local defaultValue= checkValue and true or false
    local checkFunc= checkFunc or (function() end)
	local variable = "toggle"
    local buttonText= buttonText
    local buttonFunc= buttonfunc or (function() end)

    local tooltip = tooltip
    local layout= layout or ns.layout

    local setting= Settings.RegisterAddOnSetting(ns.category, checkName, variable, type(defaultValue), defaultValue)
    local initializer= CreateSettingsCheckBoxWithButtonInitializer(setting, buttonText, buttonFunc, false, tooltip)
    ns.layout:AddInitializer(initializer)
    Settings.SetOnValueChangedCallback(variable, checkFunc, initializer)
    return initializer
end
--标题
function ns.AddTitle(layout, title)
    layout= layout or Layout
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(title))
end