--!Type(UI)

--!Bind
local roleSelectionButton : UIButton = nil

--!Bind
local roleSelectionLabel : UILabel = nil

--!Bind
local mainUIButtonContainer : VisualElement = nil

--!Bind
local mainListView : UIListView = nil

--!Bind
local roleSelectionVE : VisualElement = nil

--!Bind
local mainScrollView : UIScrollView = nil

function onRoleSelectionButtonClicked()
    print("Role Selection clicked")

    mainUIButtonContainer:AddToClassList("hidden")
    roleSelectionVE:RemoveFromClassList("hidden")

end

roleSelectionButton:RegisterPressCallback(onRoleSelectionButtonClicked, true, true, true)