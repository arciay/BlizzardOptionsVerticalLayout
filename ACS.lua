local addonName,ns = ...
local category,layout = Settings.RegisterVerticalLayoutCategory("My AddOn")
ns.layout = layout
ns.category = category
MyAddOn_SavedVars = {}


ns.AddButton("点击按钮","按钮文字","鼠标提示",function() print("按钮点击") end)
ns.AddCheck("点击按钮","鼠标提示",false,MyAddOn_SavedVars)
ns.AddSlider("点击按钮","鼠标提示",100,1,200,1,MyAddOn_SavedVars)
ns.AddDropDown("下拉菜单","鼠标提示",2,MyAddOn_SavedVars,"一","二","三","四")
ns.AddCheckButton("点击勾选+按钮","按钮文本","鼠标提示",function() print("点击")end,MyAddOn_SavedVars)

Settings.RegisterAddOnCategory(category)
