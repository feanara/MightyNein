
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

        Asset( "ANIM", "anim/caduceus.zip" ),
}
local prefabs = {}

local start_inv = {}

local function fnWorkFinished(inst, data)
	if data.target and data.target.components.workable and data.target.components.workable.action == ACTIONS.DIG and data.target.prefab == "mound"
	then worker.components.sanity.ignore = true
	end
end

local fn = function(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "wolfgang"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "caduceus.tex" )
	
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	-- IS A VEGETARIAN
	inst.components.eater.SetVegetarian()

	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6
	
	-- NO FEAR OF DEATH
	inst:ListenForEvent("finishedwork", fnWorkFinished)
	inst.components.sanity.neg_aura_mult = 0
	
	-- NO MUSHROOM LOSSES
	local protected_foods = { "red_cap", "green_cap", "blue_cap", "red_cap_cooked", "green_cap_cooked", "blue_cap_cooked" }
	local old_DoFoodEffects = inst.components.eater.DoFoodEffects
	inst.components.eater.DoFoodEffects = function(self, food_inst)
		for i, v in ipairs(protected_foods) do
			if food_inst.prefab == v then
				return false
			end
		end
		return old_DoFoodEffects(self, food_inst)
	end
end

return MakePlayerCharacter("caduceus", prefabs, assets, fn, start_inv)