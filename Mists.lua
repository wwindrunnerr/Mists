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

local f = CreateFrame("Frame")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", function()
    local zoneName = GetZoneText();
    if (zoneName == "Tanaris") then
        text:SetText([[Once a thriving part of the ancient troll empire, Tanaris is now a vast, sun-scorched desert at the southern edge of Kalimdor. It is home to the port city of Gadgetzan, a bustling goblin-run hub of trade, crime, and invention. The desert is dotted with ancient ruins, most notably the dungeons of Zul'Farrak, where the Sandfury trolls still lurk Adventurers crossing the dunes must contend with bandits, pirates, insects, and remnants of Titan technology buried beneath the sands. The mysterious Caverns of Time, hidden deep within Tanaris, hold portals to key historical events, guarded by the enigmatic bronze dragonflight.]])
    elseif (zoneName == "Thousand Needles")then
        text:SetText([[In ancient times, the region now known as Thousand Needles was a dry, rocky expanse marked by towering stone pillars that pierced the desert sky. For centuries, nomadic centaur clans and the stoic Grimtotem tauren vied for control of its harsh terrain.The Cataclysm shattered this balance. As the earth split and waters surged, Thousand Needles was drowned beneath a vast inland sea. The once-proud mesas now rise like islands from the flood, their secrets hidden beneath the waves. In this new world, goblins carved out opportunity amidst the ruin. From their floating outpost — Fizzle and Pozzik's Speedbarge — they race, trade, and scheme, while the Grimtotem cling to what remains of their ancient claim. Thousand Needles endures, transformed but untamed — a place where ambition, memory, and the elements still wage war.]])
    end
end
)

text:SetPoint("TOPLEFT", LoreFrame, "TOPLEFT", 10, -40)
text:SetJustifyH("LEFT")
text:SetWidth(270)

local icon = LoreFrame:CreateTexture(nil, "ARTWORK")
icon:SetSize(100, 100)
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
