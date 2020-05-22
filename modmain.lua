TUNING.LOLLIPOP_USES = 100
TUNING.LOLLIPOP_DAMAGE = 60
--TUNING.BLOOD_SWORD_DAMAGE = 60

PrefabFiles = {
	"beauregard",
	"caduceus",
	"caleb",
	"inventory/scroll_lights",

	"fjord",
	"jester",
	"inventory/lollipop",

	"mollymauk",
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
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local State = GLOBAL.State
local TimeEvent = GLOBAL.TimeEvent
local EventHandler = GLOBAL.EventHandler
local FRAMES = GLOBAL.FRAMES

-- ACTIONS--
GLOBAL.ACTIONS.DRINK = GLOBAL.Action({mount_enabled=true})
GLOBAL.ACTIONS.DRINK.id = "DRINK"
GLOBAL.ACTIONS.DRINK.str = "Drink"
GLOBAL.ACTIONS.DRINK.fn = function(act)
    local obj = act.target or act.invobject
    if act.doer.components.eater and obj and obj.components.edible then
    	return act.doer.components.eater:Eat(obj) 
    end
end
AddAction(GLOBAL.ACTIONS.DRINK)

local newquickeat = State({
        name = "quickeat",
        tags ={"busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            local is_gear = inst:GetBufferedAction() and inst:GetBufferedAction().invobject and inst:GetBufferedAction().invobject.components.edible and inst:GetBufferedAction().invobject.components.edible.foodtype == "GEARS"
            local is_flask = inst:GetBufferedAction() and inst:GetBufferedAction().invobject and inst:GetBufferedAction().invobject.components.edible and inst:GetBufferedAction().invobject:HasTag("flask")
			if not (is_gear or is_flask) then
                inst.SoundEmitter:PlaySound("dontstarve/wilson/eat", "eating")    
            end
			if is_flask then
				inst.AnimState:PlayAnimation("horn")
				inst.AnimState:Show("ARM_normal")

			else
				inst.AnimState:PlayAnimation("quick_eat")
			end
            inst.components.hunger:Pause()
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
			
            inst.SoundEmitter:KillSound("eating")    
            inst.components.hunger:Resume()
        end,
})
AddStategraphState("wilson", newquickeat)

--INVENTORY--
GLOBAL.STRINGS.NAMES.LOLLIPOP = "Lollipop"
GLOBAL.STRINGS.RECIPE_DESC.LOLLIPOP = "Deliciously dangerous."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LOLLIPOP = "Sweet and deadly...just like me!"

GLOBAL.STRINGS.NAMES.SCROLL_LIGHTS = "Dancing Lights Spell"
GLOBAL.STRINGS.RECIPE_DESC.SCROLL_LIGHTS = "Little baby fireflies."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCROLL_LIGHTS = "So nice and glowy."

GLOBAL.STRINGS.NAMES.FLASK = "Bottomless Flask"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLASK = "That's some strong stuff."

--CHARACTERS--
GLOBAL.STRINGS.CHARACTER_TITLES.beauregard = "The Expositor"
GLOBAL.STRINGS.CHARACTER_NAMES.beauregard = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.beauregard = "*Walks fast\n*Hits hard\n*Always hungry for pocket bacon"
GLOBAL.STRINGS.CHARACTER_QUOTES.beauregard = "\"Pop pop!\""

GLOBAL.STRINGS.CHARACTER_TITLES.caduceus = "The Maker of Fine Graves"
GLOBAL.STRINGS.CHARACTER_NAMES.caduceus = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.caduceus = "*Vegetarian\n*Loves mushrooms\n*Doesn't spook easily"
GLOBAL.STRINGS.CHARACTER_QUOTES.caduceus = "\"That's really great.\""

GLOBAL.STRINGS.CHARACTER_TITLES.caleb = "The Zemnian"
GLOBAL.STRINGS.CHARACTER_NAMES.caleb = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.caleb = "*Knows magic spells\n*Doesn't like starting fires\n*Is squishy"
GLOBAL.STRINGS.CHARACTER_QUOTES.caleb = "\"Leave me alone, I'm reading.\""

GLOBAL.STRINGS.CHARACTER_TITLES.fjord = "The Captain"
GLOBAL.STRINGS.CHARACTER_NAMES.fjord = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.fjord = "*Doesn't like spooky things\n*Loves getting caught in the rain\n*Has a falchion?"
GLOBAL.STRINGS.CHARACTER_QUOTES.fjord = "\"Eldritch blast.\""

GLOBAL.STRINGS.CHARACTER_TITLES.jester = "The Little Sapphire"
GLOBAL.STRINGS.CHARACTER_NAMES.jester = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.jester = "*Has a sweet tooth\*nFights with candy!\n*Murdering cute things makes her sad"
GLOBAL.STRINGS.CHARACTER_QUOTES.jester = "\"Have you heard of the traveller?\""

GLOBAL.STRINGS.CHARACTER_TITLES.mollymauk = "The Fabulous Fool"
GLOBAL.STRINGS.CHARACTER_NAMES.mollymauk = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.mollymauk = "*Not scared of much\n*Has a pretty sweet sword\n*...that uses his blood."
GLOBAL.STRINGS.CHARACTER_QUOTES.MOLLYMAUK = "\"Long may I reign!\""

GLOBAL.STRINGS.CHARACTER_TITLES.nott = "The Little Goblin Girl"
GLOBAL.STRINGS.CHARACTER_NAMES.nott = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.nott = "*Monsters like her\n*Booze keeps her sane...\n*...but isn't good for her"
GLOBAL.STRINGS.CHARACTER_QUOTES.nott = "\"You can reply to this message.\""

GLOBAL.STRINGS.CHARACTER_TITLES.yasha = "The Orphanmaker"
GLOBAL.STRINGS.CHARACTER_NAMES.yasha = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.yasha = "*Is super strong\n*Loves to pick flowers\n*Gets really angry"
GLOBAL.STRINGS.CHARACTER_QUOTES.yasha = "\"I'm learning how to people.\""

GLOBAL.STRINGS.CHARACTERS.BEAUREGARD = require "speech_beauregard"
GLOBAL.STRINGS.CHARACTERS.CADUCEUS = require "speech_caduceus"
GLOBAL.STRINGS.CHARACTERS.CALEB = require "speech_caleb"
GLOBAL.STRINGS.CHARACTERS.FJORD = require "speech_fjord"
GLOBAL.STRINGS.CHARACTERS.JESTER = require "speech_jester"
GLOBAL.STRINGS.CHARACTERS.MOLLYMAUK = require "speech_mollymauk"
GLOBAL.STRINGS.CHARACTERS.NOTT = require "speech_nott"
GLOBAL.STRINGS.CHARACTERS.YASHA = require "speech_yasha"

GLOBAL.STRINGS.CHARACTERS.NOTT.DESCRIBE.FLASK = "It keeps me sane."

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
