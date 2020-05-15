local MakePlayerCharacter = require "prefabs/player_common"

local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
		--Asset( "ATLAS", "images/inventoryimages/scroll_dancinglights.xml" ),

        Asset( "ANIM", "anim/caleb.zip" ),
}
local prefabs = 
{
	--"/inventory/scroll_magearmor",
}

local start_inv = 
{
	--"papyrus",
	--"papyrus"
}

local fn = function(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "wilson"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "caleb.tex" )
	
	-- SQUISHY
	-- Stats	
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6
	
	-- SPELLS
	--local scroll_dancinglights = Recipe("scroll_dancinglights", 
	--{
	--	Ingredient("papyrus", 2), 
	--	Ingredient("fireflies", 2)
	--}, 
	--GLOBAL.RECIPETABS.MAGIC, { MAGIC = 0 })
	--
	--local scroll_magearmor = Recipe("scroll_magearmor", 
	--{
	--	Ingredient("papyrus", 2), 
	--	Ingredient("ice", 2)
	--}, 
	--GLOBAL.RECIPETABS.MAGIC, { MAGIC = 2 })
	--
	--local scroll_firebolt = Recipe("scroll_firebolt", 
	--{
	--	Ingredient("papyrus", 2), 
	--	Ingredient("redgem", 1)
	--}, 
	--GLOBAL.RECIPETABS.MAGIC, {MAGIC = 3})
	--
	--inst.components.builder:AddRecipe("scroll_dancinglights")
	--inst.components.builder:AddRecipe("scroll_magearmor")
	--inst.components.builder:AddRecipe("scroll_firebolt")
	--
	--scroll_dancinglights.atlas = "images/inventoryimages/scroll_dancinglights.xml"
	--scroll_magearmor.atlas = "images/inventoryimages/scroll_magearmor.xml"
	--scroll_firebolt.atlas = "images/inventoryimages/scroll_firebolt.xml"

	-- TODO FIRE
	--inst:ListenForEvent( "killed", function(it, data)
	--	if data and data.victim and not data.victim:HasTag("hostile") and (data.victim:HasTag("prey") or data.victim:HasTag("butterfly") or data.victim:HasTag("follower")) then
	--		inst.components.sanity:DoDelta(-TUNING.SANITY_TINY)
	--	end
	--end )
end

return MakePlayerCharacter("caleb", prefabs, assets, fn, start_inv)