--!Type(UI)

--!Bind
local roleSelectionButton : Button = nil


function onButtonClicked()
    print("Button Clicked")
end

function self:Awake()
    roleSelectionButton:RegisterCallback(onButtonClicked)
end