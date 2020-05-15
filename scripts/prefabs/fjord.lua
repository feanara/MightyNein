
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

        Asset( "ANIM", "anim/fjord.zip" ),
}

local prefabs = {}

local start_inv = {}

local easing = require("easing")

local function NoWetnessRate(inst)
	local moist_dapperness = 0
	for k, v in pairs(inst.components.inventory.equipslots) do
		if v:GetIsWet() and v.components.equippable then
			moist_dapperness = moist_dapperness - TUNING.WET_ITEM_DAPPERNESS
		end
	end
	local moisture = inst.components.moisture
	local moisture_delta = easing.inSine(moisture:GetMoisture(), 0, TUNING.MOISTURE_SANITY_PENALTY_MAX, moisture:GetMaxMoisture())
	return moist_dapperness - moisture_delta
end

local fn = function(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "wilson"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "fjord.tex" )
	
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6

	--AFRAID OF DARKNESS AND GHOSTS	
	inst.components.sanity.night_drain_mult = 1.2
	inst.components.sanity.neg_aura_mult = 1.2
	
	--WATER RESISTANT
	inst.components.sanity.custom_rate_fn = NoWetnessRate
	
	--TODO UK'ATOA OR TENTACLES
	
end

return MakePlayerCharacter("fjord", prefabs, assets, fn, start_inv)