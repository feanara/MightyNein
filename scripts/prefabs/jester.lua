
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

        Asset( "ANIM", "anim/jester.zip" ),
}
local prefabs = 
{
	"inventory/lollipop"
}
local start_inv = 
{
	"lollipop"
}

local function onkilled(it, data)
	if data and data.victim and (data.victim:HasTag("prey") or data.victim:HasTag("butterfly") or data.victim:HasTag("follower")) 
	and not data.victim:HasTag("hostile") then
		inst.components.sanity:DoDelta(-TUNING.SANITY_TINY)
	end
end 

local SWEETS = {'pomegranate', 'berries', 'dragonfruit', 'watermelon', 'cave_banana', 'honey', 'butterflymuffin', 'taffy', 'pumpkincookie', 'honeynuggets', 
				'honeyham', 'dragonpie', 'jammypreserves', 'waffles', 'powcake', 'coconut_halved', 'fruitmedley', 'taffy', 'flowersalad', 'watermelonicle',
				'coconut_cooked', 'banana', 'sweet_potato', 'bananapop', 'sweetpotatosouffle', 'freshfruitcrepes', 'lotus_flower', 'tea', 'icedtea', 'gummy_cake'}
				
local function issweet (val)
    for index, value in ipairs(SWEETS) do
        if value == val or value.."_cooked" == val then
            return true
        end
    end

    return false
end

local function calculateFoodValues(food)
	local changesweremade = false
	
	-- Local variables to hold our food values.
	local healthval = 0
	
	local food_stats = SWEETS[food.prefab]
	
	-- If we found an entry in our SWEETS dictionary for the food...
	if issweet(food.prefab) then
		-- We indicate that we made changes to the food.
		changesweremade = true
		healthval = food.components.edible.healthvalue + 5
	end
	
	-- Return the results.
	return changesweremade, healthval
end

local fn = function(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "willow"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "jester.tex" )
	
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

	-- LOLLIPOP RECIPE
	local lollipop = Recipe("lollipop", 
	{
		Ingredient("twigs", 2), 
		Ingredient("honey", 2), 
		Ingredient("petals", 5)
	}, RECIPETABS.WAR, TECH.NONE)

	inst.components.builder:AddRecipe("lollipop")
	lollipop.atlas = "images/inventoryimages/lollipop.xml"
	
	--SANITY LOSS ON MURDER	
	inst:ListenForEvent( "killed", onkilled)
	
	local old_Eat = inst.components.eater.Eat
	inst.components.eater.Eat =  function(self, food)
		-- Make a local variable holding the edible component of the food (optimization).
		local edible_comp = food.components.edible

		-- Make a local variable saying whether we made changes to the food.
		local changesweremade = false
		
		-- If the food has an edible component...
		if edible_comp then
			local healthval
			changesweremade, healthval = calculateFoodValues(food)
			
			if changesweremade then
				edible_comp.originalhealthvalue = edible_comp.healthvalue
				edible_comp.healthvalue = healthval
			end
		end
		
		-- Call the original Eat function, while the food has our new values, and save the result in a variable.
		local returnvalue = old_Eat(self, food)

		if food:IsValid() and changesweremade then
			-- We reset the food values after eating it.
			edible_comp.healthvalue = edible_comp.originalhealthvalue
			
			-- Remove the temporary values from the food to save memory.
			edible_comp.originalhealthvalue = nil
		end
		
		-- Then we return the value returned by the original Eat function.
		return returnvalue
	end

	-- This last piece of code will make the food values display correctly when using the popular ShowMe mod.
	inst.FoodValuesChanger = function(player, food)
		local changesweremade, healthval = calculateFoodValues(food)
		local e = food.components.edible
		if changesweremade then
			return healthval, e.hungervalue, e.sanityvalue
		end
		return e.healthvalue, e.hungervalue, e.sanityvalue
	end

end

return MakePlayerCharacter("jester", prefabs, assets, fn, start_inv)