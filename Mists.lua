print("Hello World")

local LoreFrame = CreateFrame("Frame", "MyFrame", UIParent, "BasicFrameTemplateWithInset")

LoreFrame:SetSize(300, 450)
LoreFrame:SetPoint("TOPRIGHT", WorldMapFrame, "TOPRIGHT", 300, 0)
LoreFrame:EnableMouse(true)
LoreFrame:RegisterForDrag("LeftButton")
LoreFrame:SetScript("OnDragStart", LoreFrame.StartMoving)
LoreFrame:SetScript("OnDragStop", LoreFrame.StopMovingOrSizing)
LoreFrame:Hide()

LoreFrame.title = LoreFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
LoreFrame.title:SetPoint("CENTER", LoreFrame.TitleBg, "CENTER", 0, 0)
LoreFrame.title:SetText("Lore Panel")


local text = LoreFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetText([[Once a thriving part of the ancient troll empire, Tanaris is now a vast, sun-scorched desert at the southern edge of Kalimdor. It is home to the port city of Gadgetzan, a bustling goblin-run hub of trade, crime, and invention. The desert is dotted with ancient ruins, most notably the dungeons of Zul'Farrak, where the Sandfury trolls still lurk Adventurers crossing the dunes must contend with bandits, pirates, insects, and remnants of Titan technology buried beneath the sands. The mysterious Caverns of Time, hidden deep within Tanaris, hold portals to key historical events, guarded by the enigmatic bronze dragonflight.]])
text:SetPoint("TOPLEFT", LoreFrame, "TOPLEFT", 10, -40)
text:SetJustifyH("LEFT")
text:SetWidth(270)

local icon = LoreFrame:CreateTexture(nil, "ARTWORK")
icon:SetSize(200, 200)
icon:SetPoint("BOTTOM", 0, 20)
icon:SetTexture("Interface\\Icons\\INV_BannerPVP_01")

local map = WorldMapFrame

map:HookScript("OnShow", function()
    print("Map is Opened!")
    LoreFrame:Show();
end)

map:HookScript("OnHide", function()
    print("Map is Closed!")
    LoreFrame:Hide()
end)
