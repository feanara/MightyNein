
PrefabFiles = {
	"beauregard",
	"caduceus",
	"caleb",
	"inventory/scroll_lights",
	"inventory/scroll_armor",
	"inventory/scroll_fire",
	"inventory/dancinglights",
	"inventory/magearmor",

	"fjord",
	"jester",
	"inventory/lollipop",

	"mollymauk",
	"inventory/bloodsword",
	
	"nott",
	"inventory/flask",
	
	"yasha",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/beauregard.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/beauregard.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/caduceus.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/caduceus.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/caleb.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/caleb.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/fjord.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/fjord.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/jester.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/jester.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/mollymauk.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/mollymauk.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/nott.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/nott.xml" ),
    Asset( "IMAGE", "images/saveslot_portraits/yasha.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/yasha.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/beauregard.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/beauregard.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/caduceus.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/caduceus.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/caleb.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/caleb.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/fjord.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/fjord.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/jester.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/jester.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/mollymauk.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mollymauk.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/nott.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/nott.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/yasha.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/yasha.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/beauregard_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/beauregard_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/caduceus_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/caduceus_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/caleb_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/caleb_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/fjord_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/fjord_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/jester_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/jester_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/mollymauk_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mollymauk_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/nott_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/nott_silho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/yasha_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/yasha_silho.xml" ),

    Asset( "IMAGE", "bigportraits/beauregard.tex" ),
    Asset( "ATLAS", "bigportraits/beauregard.xml" ),
    Asset( "IMAGE", "bigportraits/caduceus.tex" ),
    Asset( "ATLAS", "bigportraits/caduceus.xml" ),
    Asset( "IMAGE", "bigportraits/caleb.tex" ),
    Asset( "ATLAS", "bigportraits/caleb.xml" ),
    Asset( "IMAGE", "bigportraits/fjord.tex" ),
    Asset( "ATLAS", "bigportraits/fjord.xml" ),
    Asset( "IMAGE", "bigportraits/jester.tex" ),
    Asset( "ATLAS", "bigportraits/jester.xml" ),
    Asset( "IMAGE", "bigportraits/mollymauk.tex" ),
    Asset( "ATLAS", "bigportraits/mollymauk.xml" ),
    Asset( "IMAGE", "bigportraits/nott.tex" ),
    Asset( "ATLAS", "bigportraits/nott.xml" ),
    Asset( "IMAGE", "bigportraits/yasha.tex" ),
    Asset( "ATLAS", "bigportraits/yasha.xml" ),

	Asset( "IMAGE", "images/map_icons/beauregard.tex" ),
	Asset( "ATLAS", "images/map_icons/beauregard.xml" ),
    Asset( "IMAGE", "images/map_icons/caduceus.tex" ),
    Asset( "ATLAS", "images/map_icons/caduceus.xml" ),
	Asset( "IMAGE", "images/map_icons/caleb.tex" ),
	Asset( "ATLAS", "images/map_icons/caleb.xml" ),
    Asset( "IMAGE", "images/map_icons/fjord.tex" ),
    Asset( "ATLAS", "images/map_icons/fjord.xml" ),
	Asset( "IMAGE", "images/map_icons/jester.tex" ),
	Asset( "ATLAS", "images/map_icons/jester.xml" ),
    Asset( "IMAGE", "images/map_icons/mollymauk.tex" ),
    Asset( "ATLAS", "images/map_icons/mollymauk.xml" ),
    Asset( "IMAGE", "images/map_icons/nott.tex" ),
    Asset( "ATLAS", "images/map_icons/nott.xml" ),
    Asset( "IMAGE", "images/map_icons/yasha.tex" ),
    Asset( "ATLAS", "images/map_icons/yasha.xml" ),
}

local require = GLOBAL.require
local ACTIONS = GLOBAL.ACTIONS
local FRAMES = GLOBAL.FRAMES
local STRINGS = GLOBAL.STRINGS
local ActionHandler = GLOBAL.ActionHandler
local EventHandler = GLOBAL.EventHandler
local State = GLOBAL.State
local TimeEvent = GLOBAL.TimeEvent

--------------- POST INIT ---------------
AddComponentPostInit("leader", function(self)
	self.OldAddFollower = self.AddFollower
	function self:AddFollower(follower)
		self:OldAddFollower(follower)
		self.inst:PushEvent("gainedfollower", follower)
	end
end)

AddComponentPostInit("trader", function(self)
	self.OldAcceptGift = self.AcceptGift
	function self:AcceptGift(giver, item)
		self:OldAcceptGift(giver, item)
		giver:PushEvent("gaveitem", {target = self.inst, item = item})
	end
end)

AddComponentPostInit("equippable", function(self)
	self.OldUnequip = self.Unequip
	function self:Unequip(owner, slot)
		self:OldUnequip(owner, slot)
		owner:PushEvent("unequippeditem", item)
	end
end)

AddPrefabPostInit("ghost", function(self)
	self.components.sanityaura.aurafn = function(inst, observer)
		if observer:HasTag("ghostwhisperer") then return inst.components.sanityaura.aura * .5
		else return inst.components.sanityaura.aura end
	end
end)


--------------- TUNING ---------------

--------------- ACTIONS ---------------
ACTIONS.DRINK = GLOBAL.Action({mount_enabled=true})
ACTIONS.DRINK.id = "DRINK"
ACTIONS.DRINK.str = "Drink"
ACTIONS.DRINK.fn = function(act)
    local obj = act.target or act.invobject
	print('drinking!')
	print(obj.components.drinkable:DebugString())
    if act.doer.components.eater and obj and obj.components.drinkable then
		obj:AddComponent("edible")
		obj.components.edible.healthvalue = obj.components.drinkable.healthvalue
		obj.components.edible.sanityvalue = obj.components.drinkable.sanityvalue
		obj.components.edible.hungervalue = obj.components.drinkable.hungervalue
		obj.components.edible.oneaten = function() obj.components.drinkable:Drink(inst, act.doer) end
    	return act.doer.components.eater:Eat(obj)
    end
end

local drink = State({
        name = "drink",
        tags ={"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
			inst.AnimState:PlayAnimation("horn")
			inst.AnimState:Show("ARM_normal")
		end,
		
        timeline=
        {
            TimeEvent(12*FRAMES, function(inst) 
                inst:PerformBufferedAction() 
                inst.sg:RemoveStateTag("busy")
            end),
        },        
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
        
        onexit= function(inst)
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
        end,
})

AddAction(ACTIONS.DRINK)
AddStategraphState("wilson", drink)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINK, "drink"))

ACTIONS.READSPELLSCROLL = GLOBAL.Action({mount_enabled=true})
ACTIONS.READSPELLSCROLL.id = "READSPELLSCROLL"
ACTIONS.READSPELLSCROLL.str = "Read Scroll"
ACTIONS.READSPELLSCROLL.fn = function(act)
    local obj = act.target or act.invobject
    if act.doer.components.scrollreader and obj and obj.components.spellscroll then
		return act.doer.components.scrollreader:ReadScroll(obj)
    end
end

local readscroll = State({
        name = "readscroll",
        tags = {"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
			inst.components.talker:Say('Øƒãи¶ë∂п ÌÂ╥√¶яÏ €§∂Égå')
            inst.AnimState:PlayAnimation("book")
            inst.AnimState:Show("ARM_normal")
        end,
        
        timeline=
        {
            --TimeEvent(0*FRAMES, function(inst)
            --    local fx = GLOBAL.SpawnPrefab("book_fx")
            --    local pos = inst:GetPosition()
            --    fx.Transform:SetRotation(inst.Transform:GetRotation())
            --    fx.Transform:SetPosition( pos.x, pos.y - .2, pos.z ) 
            --    inst.sg.statemem.book_fx = fx
            --end),
            TimeEvent(4*FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_gemstaff") 
            end),
            TimeEvent(16*FRAMES, function(inst) 
				inst:PerformBufferedAction() 
                --inst.sg.statemem.book_fx = nil
				inst.sg:RemoveStateTag("busy")
			end),
        },
        
        events=
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle")
            end),
        },
		
        onexit = function(inst)
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry") 
                inst.AnimState:Hide("ARM_normal")
            end
            --if inst.sg.statemem.book_fx then
            --    inst.sg.statemem.book_fx:Remove()
            --    inst.sg.statemem.book_fx = nil
            --end
        end,        
})

AddAction(ACTIONS.READSPELLSCROLL)
AddStategraphState("wilson", readscroll)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.READSPELLSCROLL, "readscroll"))

--------------- INVENTORY ---------------
STRINGS.NAMES.LOLLIPOP = "Lollipop"
STRINGS.RECIPE_DESC.LOLLIPOP = "Deliciously dangerous."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LOLLIPOP = "That looks vicious."

STRINGS.NAMES.SCROLL_LIGHTS = "Dancing Lights Spell"
STRINGS.RECIPE_DESC.SCROLL_LIGHTS = "Little baby fireflies."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCROLL_LIGHTS = "Caleb knows how to read this."

STRINGS.NAMES.DANCINGLIGHTS = "Dancing Lights"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DANCINGLIGHTS = "Pretty colors!"

STRINGS.NAMES.SCROLL_ARMOR = "Mage Armor Spell"
STRINGS.RECIPE_DESC.SCROLL_ARMOR = "Magical protection."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCROLL_ARMOR = "Caleb knows how to read this."

STRINGS.NAMES.SCROLL_FIRE = "Firebolt Spell"
STRINGS.RECIPE_DESC.SCROLL_FIRE = "Weaponized fire."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCROLL_FIRE = "Caleb knows how to read this."

STRINGS.NAMES.FLASK = "Bottomless Flask"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLASK = "Phew, that stuff is strong."

STRINGS.NAMES.BLOODSWORD = "Blood Sword"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLOODSWORD = "Molly's great with that sword."

--------------- CHARACTERS ---------------
STRINGS.CHARACTER_TITLES.beauregard = "The Expositor"
STRINGS.CHARACTER_NAMES.beauregard = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.beauregard = "*Walks fast\n*Hits hard\n*Always hungry for pocket bacon"
STRINGS.CHARACTER_QUOTES.beauregard = "\"Pop pop!\""

STRINGS.CHARACTER_TITLES.caduceus = "The Maker of Fine Graves"
STRINGS.CHARACTER_NAMES.caduceus = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.caduceus = "*Vegetarian\n*Loves mushrooms\n*Doesn't spook easily"
STRINGS.CHARACTER_QUOTES.caduceus = "\"That's really great.\""

STRINGS.CHARACTER_TITLES.caleb = "The Zemnian"
STRINGS.CHARACTER_NAMES.caleb = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.caleb = "*Knows magic spells\n*Doesn't like starting fires\n*Is squishy"
STRINGS.CHARACTER_QUOTES.caleb = "\"Leave me alone, I'm reading.\""

STRINGS.CHARACTER_TITLES.fjord = "The Captain"
STRINGS.CHARACTER_NAMES.fjord = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.fjord = "*Doesn't like spooky things\n*Loves getting caught in the rain\n*Good at making friends"
STRINGS.CHARACTER_QUOTES.fjord = "\"Eldriiitch bleeaast.\""

STRINGS.CHARACTER_TITLES.jester = "The Little Sapphire"
STRINGS.CHARACTER_NAMES.jester = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.jester = "*Has a sweet tooth\nFights with candy!\n*Murdering cute things makes her sad"
STRINGS.CHARACTER_QUOTES.jester = "\"Have you heard of the traveller?\""

STRINGS.CHARACTER_TITLES.mollymauk = "The Fabulous Fool"
STRINGS.CHARACTER_NAMES.mollymauk = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.mollymauk = "*Not scared of much\n*Has a pretty sweet sword\n*...that uses his blood."
STRINGS.CHARACTER_QUOTES.mollymauk = "\"Long may I reign!\""

STRINGS.CHARACTER_TITLES.nott = "The Little Goblin Girl"
STRINGS.CHARACTER_NAMES.nott = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.nott = "*Monsters like her\n*Booze keeps her sane...\n*...but isn't good for her"
STRINGS.CHARACTER_QUOTES.nott = "\"You can reply to this message.\""

STRINGS.CHARACTER_TITLES.yasha = "The Orphanmaker"
STRINGS.CHARACTER_NAMES.yasha = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.yasha = "*Is super strong\n*Loves to pick flowers\n*Gets really angry"
STRINGS.CHARACTER_QUOTES.yasha = "\"I'm learning how to people.\""

STRINGS.CHARACTERS.BEAUREGARD = require "speech_beauregard"
STRINGS.CHARACTERS.CADUCEUS = require "speech_caduceus"
STRINGS.CHARACTERS.CALEB = require "speech_caleb"
STRINGS.CHARACTERS.FJORD = require "speech_fjord"
STRINGS.CHARACTERS.JESTER = require "speech_jester"
STRINGS.CHARACTERS.MOLLYMAUK = require "speech_mollymauk"
STRINGS.CHARACTERS.NOTT = require "speech_nott"
STRINGS.CHARACTERS.YASHA = require "speech_yasha"

STRINGS.CHARACTERS.NOTT.DESCRIBE.FLASK = "It keeps me sane."
STRINGS.CHARACTERS.MOLLYMAUK.DESCRIBE.BLOODSWORD = "She's always hungry!"
STRINGS.CHARACTERS.JESTER.DESCRIBE.LOLLIPOP = "Sweet and deadly...just like me!"
STRINGS.CHARACTERS.CALEB.DESCRIBE.SCROLL_FIRE = "I shall light them up."
STRINGS.CHARACTERS.CALEB.DESCRIBE.SCROLL_ARMOR = "Squishy wizards need extra protection."
STRINGS.CHARACTERS.CALEB.DESCRIBE.SCROLL_LIGHTS = "A small comfort in the face of darkness."

table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "beauregard")
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "caduceus")
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "caleb")
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "fjord")
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "jester")
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "mollymauk")
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "nott")
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "yasha")

AddMinimapAtlas("images/map_icons/beauregard.xml")
AddMinimapAtlas("images/map_icons/caduceus.xml")
AddMinimapAtlas("images/map_icons/caleb.xml")
AddMinimapAtlas("images/map_icons/fjord.xml")
AddMinimapAtlas("images/map_icons/jester.xml")
AddMinimapAtlas("images/map_icons/mollymauk.xml")
AddMinimapAtlas("images/map_icons/nott.xml")
AddMinimapAtlas("images/map_icons/yasha.xml")

AddModCharacter("beauregard")
AddModCharacter("caduceus")
AddModCharacter("caleb")
AddModCharacter("fjord")
AddModCharacter("jester")
AddModCharacter("mollymauk")
AddModCharacter("nott")
AddModCharacter("yasha")
