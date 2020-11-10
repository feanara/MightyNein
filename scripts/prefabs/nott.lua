
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
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/nott.zip" ),
}
local prefabs = 
{
	"inventory/flask"
}

-- FLASK
local start_inv = 
{
	"flask"
}

local function fnUnequip(inst, item)
	if item and item.prefab == "spiderhat" then inst:AddTag("monster") end
end

local fn = function(inst)
	
	-- choose which sounds this character will play
	if IsDLCInstalled(REIGN_OF_GIANTS) then
		inst.soundsname = "webber"
	else inst.soundsname = "willow" end

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "nott.tex" )
	
	-- Stats	
	inst.components.health:SetMaxHealth(175)
	inst.components.hunger:SetMax(150)
	-- LOW SANITY MAX
	inst.components.sanity:SetMax(125)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6
	
	--NEUTRAL ENEMIES
	inst:AddTag("monster")
	inst.components.eater.monsterimmune = true
	inst:ListenForEvent("unequippeditem", fnUnequip)
end

return MakePlayerCharacter("nott", prefabs, assets, fn, start_inv)