TUNING.LOLLIPOP_USES = 100
TUNING.LOLLIPOP_DAMAGE = 60
--TUNING.BLOOD_SWORD_DAMAGE = 60

PrefabFiles = {
	"beauregard",
	"caduceus",
	"caleb",
	--"inventory/scroll_magearmor",

	"fjord",
	"jester",
	"inventory/lollipop",

	"mollymauk",
	"nott",
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

GLOBAL.STRINGS.NAMES.LOLLIPOP = "Lollipop"
GLOBAL.STRINGS.RECIPE_DESC.LOLLIPOP = "Deliciously dangerous."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LOLLIPOP = "Sweet and deadly...just like me!"

-- The character select screen lines
GLOBAL.STRINGS.CHARACTER_TITLES.beauregard = "The Expositor"
GLOBAL.STRINGS.CHARACTER_NAMES.beauregard = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.beauregard = "*Walks fast\n*Hits hard\n*Hungry for pocket bacon"
GLOBAL.STRINGS.CHARACTER_QUOTES.beauregard = "\"Pop pop!\""

GLOBAL.STRINGS.CHARACTER_TITLES.caduceus = "Maker of Fine Graves"
GLOBAL.STRINGS.CHARACTER_NAMES.caduceus = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.caduceus = "*Vegetarian\n*Loves mushrooms\n*Isn't scared of death"
GLOBAL.STRINGS.CHARACTER_QUOTES.caduceus = "\"That's really great.\""

GLOBAL.STRINGS.CHARACTER_TITLES.caleb = "The Zemnian"
GLOBAL.STRINGS.CHARACTER_NAMES.caleb = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.caleb = "*Knows magic spells\n*Doesn't like killing with fire\n*Is squishy"
GLOBAL.STRINGS.CHARACTER_QUOTES.caleb = "\"Leave me alone, I'm reading.\""

GLOBAL.STRINGS.CHARACTER_TITLES.fjord = "The Captain"
GLOBAL.STRINGS.CHARACTER_NAMES.fjord = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.fjord = "*Vegetarian\n*Loves mushrooms\n*Isn't scared of death"
GLOBAL.STRINGS.CHARACTER_QUOTES.fjord = "\"Eldritch blast.\""

GLOBAL.STRINGS.CHARACTER_TITLES.jester = "The Little Sapphire"
GLOBAL.STRINGS.CHARACTER_NAMES.jester = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.jester = "*Has a sweet tooth\n*Can build a spiritual weapon\n*Doesn't like killing cute things"
GLOBAL.STRINGS.CHARACTER_QUOTES.jester = "\"Have you heard of the traveller?\""

GLOBAL.STRINGS.CHARACTER_TITLES.mollymauk = "The Fabulous Fool"
GLOBAL.STRINGS.CHARACTER_NAMES.mollymauk = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.mollymauk = "*Not scared of much\n*Has a pretty sweet sword"
GLOBAL.STRINGS.CHARACTER_QUOTES.mollymauk = "\"Long may I reign!\""

GLOBAL.STRINGS.CHARACTER_TITLES.nott = "The Brave"
GLOBAL.STRINGS.CHARACTER_NAMES.nott = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.nott = "*Monsters like her\n*Goes crazy pretty easily\n*Loves her booze"
GLOBAL.STRINGS.CHARACTER_QUOTES.nott = "\"There's no comma.\""

GLOBAL.STRINGS.CHARACTER_TITLES.yasha = "The Orphanmaker"
GLOBAL.STRINGS.CHARACTER_NAMES.yasha = "Esc"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.yasha = "*Is pretty tough\n*Loves to pick flowers\n*Gets really angry"
GLOBAL.STRINGS.CHARACTER_QUOTES.yasha = "\"I'm learning how to people.\""

GLOBAL.STRINGS.CHARACTERS.BEAUREGARD = require "speech_beauregard"
GLOBAL.STRINGS.CHARACTERS.CADUCEUS = require "speech_caduceus"
GLOBAL.STRINGS.CHARACTERS.CALEB = require "speech_caleb"
GLOBAL.STRINGS.CHARACTERS.FJORD = require "speech_fjord"
GLOBAL.STRINGS.CHARACTERS.JESTER = require "speech_jester"
GLOBAL.STRINGS.CHARACTERS.MOLLYMAUK = require "speech_mollymauk"
GLOBAL.STRINGS.CHARACTERS.NOTT = require "speech_nott"
GLOBAL.STRINGS.CHARACTERS.YASHA = require "speech_yasha"

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
