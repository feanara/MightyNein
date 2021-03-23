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
        Asset( "ANIM", "anim/caleb.zip" ),
}

local prefabs = 
{
	"inventory/scroll_fire",
	"inventory/scroll_armor",
	"inventory/scroll_lights",
	"inventory/magearmor"
}

local start_inv = 
{
}

--Sanity hit when something is on fire (excluding torches, campfires, and fire pits)
local function sanityfn(inst)
	local x,y,z = inst.Transform:GetWorldPosition()	
	local delta = 0
	local max_rad = 10
	local ents = TheSim:FindEntities(x,y,z, max_rad, {"fire"})
    for k,v in pairs(ents) do 
    	if v.components.burnable and v.components.burnable.burning and not v:HasTag("structure") and not v.components.lighter then
    		local sz = -TUNING.SANITYAURA_TINY
    		local rad = v.components.burnable:GetLargestLightRadius() or 1
    		sz = sz * ( math.min(max_rad, rad) / max_rad )
			local distsq = inst:GetDistanceSqToInst(v)
			delta = delta + sz/math.max(1, distsq)
    	end
    end
    
    return delta
end

local fn = function(inst)
	inst.soundsname = "wilson"
	inst.MiniMapEntity:SetIcon( "caleb.tex" )
	
	-- SQUISHY
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	--SPELLS
	inst:AddComponent("scrollreader")

	--inst:ListenForEvent(scrollread, onscrollread)
	inst:AddComponent("magearmorable")
	inst.components.magearmorable.putonfn = function(inst, absorb)
		inst.components.health.absorb = absorb
		inst.components.talker:Say('I feel much safer now!')
	end

	inst.components.magearmorable.takeofffn = function(inst)
		inst.components.health.absorb = 0
		inst.components.talker:Say('There goes my mage armor!')
		if inst.SoundEmitter then inst.SoundEmitter:PlaySound("dontstarve/HUD/get_gold") end
	end

	local lights = Recipe("scroll_lights", 
	{
		Ingredient("papyrus", 2), 
		Ingredient("fireflies", 2)
	}, RECIPETABS.MAGIC, TECH.NONE)
	lights.atlas = "images/inventoryimages/scroll_lights.xml"
	inst.components.builder:AddRecipe("scroll_lights")

	local armor = Recipe("scroll_armor", 
	{
		Ingredient("papyrus", 2),
		Ingredient("marble", 2)
	}, RECIPETABS.MAGIC, TECH.ONE)
	armor.atlas = "images/inventoryimages/scroll_armor.xml"
	inst.components.builder:AddRecipe("scroll_armor")
	
	local fire = Recipe("scroll_fire", 
	{
		Ingredient("papyrus", 2), 
		Ingredient("ash", 4)
	}, RECIPETABS.MAGIC, TECH.TWO)
	fire.atlas = "images/inventoryimages/scroll_fire.xml"
	inst.components.builder:AddRecipe("scroll_fire")

	-- FIRE SANITY LOSS
	inst.components.sanity.custom_rate_fn = sanityfn
end

return MakePlayerCharacter("caleb", prefabs, assets, fn, start_inv)