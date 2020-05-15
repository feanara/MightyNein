
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

        Asset( "ANIM", "anim/yasha.zip" ),
        --Asset( "ANIM", "anim/raging.zip" ),
}
local prefabs = {}
local start_inv = {}


--local function onworked(inst, data)
--	if not inst.components.rage:IsRaging() and data.target and data.target.components.workable and data.target.components.workable.action == ACTIONS.ATTACK then
--		inst.components.rage:DoDelta(3)
--	end
--end

--local function EnterRage(inst)
--	inst.raging = true
--	inst:AddTag("raging")
--	inst.AnimState:SetBuild("raging_build")
--	inst.AnimState:SetBank("raging")
--	inst.components.talker:IgnoreAll()
--	inst.components.combat:SetDefaultDamage(TUNING.BEAVER_DAMAGE)
--
--	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1.1
--
--	local dt = 3
--	local RAGE_DRAIN_TIME = 120
--	inst.components.rage:StartTimeEffect(dt, (-100/RAGE_DRAIN_TIME)*dt)
--    
--end


--local function LoseRage(inst)
--	inst.raging = false
--    inst.ActionStringOverride = nil
--    inst.AnimState:SetBank("yasha")
--	inst.AnimState:SetBuild("yasha")
--	inst:SetStateGraph("SGwilson")
--	inst:RemoveTag("raging")
--
--	inst.components.rage:StartTimeEffect(2, -1)	
--end


--EXTRA SANITY FOR FLOWERS
local function onpick(inst, data)
	if data.inventoryitem.HasTag("petals") then
        inst.components.sanity:DoDelta(1)
    end
end

local fn = function(inst)
	
	--inst:AddComponent("rage")
	--inst.components.rage.makenormal = LoseRage
	--inst.components.rage.makeraging = EnterRage
		
	--inst.components.rage.onmakenormal = function()
	--	inst:PushEvent("transform_normal")
	--end

	--inst.components.rage.onmakeraging = function()
	--	inst:PushEvent("transform_raging")
	--end

	--inst:ListenForEvent("working", onworked)

	inst.onpick = onpick
    inst:ListenForEvent("onpicksomething", inst.onpick)


	-- choose which sounds this character will play
	inst.soundsname = "wendy"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "yasha.tex" )
	
	--HIGH HEALTH, LOW SANITY
	
	-- Stats
	inst.components.health:SetMaxHealth(200)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(175)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE

	-- Movement speed (optional)
	inst.components.locomotor.walkspeed = 4
	inst.components.locomotor.runspeed = 6
end

return MakePlayerCharacter("yasha", prefabs, assets, fn, start_inv)