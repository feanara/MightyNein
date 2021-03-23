local MakePlayerCharacter = require "prefabs/player_common"
local RageMeter = require "widgets/rage_meter"

local assets = {
	Asset("ANIM", "anim/yasha.zip"),
	Asset("ANIM", "anim/rage_meter.zip"),
	Asset("SOUND", "sound/wilson.fsb"),
	
	Asset("ANIM", "anim/yasha_raging.zip"),
	Asset("ATLAS", "images/woodie.xml"),
	Asset("IMAGE", "images/woodie.tex"),
	Asset("IMAGE", "images/colour_cubes/beaver_vision_cc.tex"),
}
local prefabs = {}
local start_inv = {}

--#region Rage
local function onattack(inst, data)
	print('Current Rage: '..inst.components.rage:GetDebugString())
	if inst.components.rage:IsRaging() then
		inst.components.rage:DoDelta(15)
	else
		inst.components.rage:DoDelta(10)
	end
end

local function RageDelta(inst, ragelevel)
	print('rage delta function')
	if inst.components.rage:IsRaging() then
		GetSeasonManager():ForcePrecip()
		if inst.HUD and inst.HUD.controls.ragemeter then
			inst.HUD.controls.ragemeter:OnUpdate()
			--inst.HUD.controls.ragemeter.rage = ragelevel
		end
	end
end

local function EnterRage(inst)
	inst.components.talker:Say("I would like to rage!")
	inst.components.health.invincible = true

	local player = GetPlayer()
	local pos = Vector3(player.Transform:GetWorldPosition() )
	local lightning = SpawnPrefab("lightning")
	lightning.Transform:SetPosition(pos:Get())
	player:PushEvent("lightningstrike")

	inst:PushEvent("transform_raging")
	inst:AddTag("raging")
	inst.AnimState:SetBuild("yasha_raging")

    inst.components.combat.damagemultiplier = 2.1
	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1.1

	inst.components.hunger:Pause()
	inst.components.sanity.ignore = true
	inst.components.health.absorb = .75

	if inst.HUD and not inst.HUD.controls.ragemeter then
		print('adding rage hud')
		inst.HUD.controls.ragemeter = inst.HUD.controls.sidepanel:AddChild(RageMeter(inst))
		inst.HUD.controls.ragemeter:SetPosition(0,-300,0)
		inst.HUD.controls.ragemeter:OnUpdate()

		inst.HUD.controls.crafttabs:Hide()
		inst.HUD.controls.mapcontrols.minimapBtn:Hide()

		--inst.HUD.rageOL = inst.HUD.under_root:AddChild(Image("images/woodie.xml", "beaver_vision_OL.tex"))
		--inst.HUD.rageOL:SetVRegPoint(ANCHOR_MIDDLE)
		--inst.HUD.rageOL:SetHRegPoint(ANCHOR_MIDDLE)
		--inst.HUD.rageOL:SetVAnchor(ANCHOR_MIDDLE)
		--inst.HUD.rageOL:SetHAnchor(ANCHOR_MIDDLE)
		--inst.HUD.rageOL:SetScaleMode(SCALEMODE_FILLSCREEN)
		--inst.HUD.rageOL:SetClickable(false)
		--GetWorld().components.colourcubemanager:SetOverrideColourCube("images/colour_cubes/beaver_vision_cc.tex")
	end
	
	inst.components.rage:StartDrainEffect(2)
	inst.components.health.invincible = false
end

local function LoseRage(inst)
	inst:PushEvent("transform_normal")
	inst:RemoveTag("raging")
	inst.AnimState:SetBuild("yasha")

	inst.components.talker:Say("That was exhausting.")

    inst.components.combat.damagemultiplier = 1.1
	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED

	inst.components.hunger:Resume()
	inst.components.sanity.ignore = false
	inst.components.health.absorb = 0

	inst.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
	inst.components.rage:StopDrainEffect()
	GetSeasonManager():StopPrecip()
	
	if inst.HUD then
		if inst.HUD.ragemeter then
			print('removing rage hud')
			inst.HUD.controls.ragemeter:Deactivate()
			inst.HUD.controls.ragemeter:Kill()
			inst.HUD.controls.ragemeter = nil
		end

		inst.HUD.controls.crafttabs:Show()
		inst.HUD.controls.mapcontrols.minimapBtn:Show()

		--if inst.HUD.rageOL then
		--	inst.HUD.rageOL:Kill()
		--	inst.HUD.rageOL = nil
		--end
		--GetWorld().components.colourcubemanager:SetOverrideColourCube(nil)
	end
end
--#endregion Rage


--EXTRA SANITY FOR FLOWERS
local function onpick(inst, data)
	if data.inventoryitem.HasTag("petals") then
        inst.components.sanity:DoDelta(TUNING.SANITY_SMALL)
		
		if inst.components.rage:IsRaging() then
			inst.components.rage:DoDelta(-15)
		end
    end
end

local fn = function(inst)
	inst.soundsname = "wendy"
	inst.MiniMapEntity:SetIcon( "yasha.tex" )
	
	inst.components.health:SetMaxHealth(200)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)
	
    inst.components.combat.damagemultiplier = 1.1
	
	--FLOWERS BUFF
    inst:ListenForEvent("onpicksomething", onpick)

	--RAGE
	inst:AddComponent("rage")
	inst.components.rage.makenormal = LoseRage
	inst.components.rage.makeraging = EnterRage
	
	inst.components.rage.is_raging = false
	inst:ListenForEvent("ragedelta", RageDelta)

	inst:ListenForEvent("attacked", onattack)
	inst:ListenForEvent("onhitother", onattack)
	inst:ListenForEvent("doattack", onattack)
end

return MakePlayerCharacter("yasha", prefabs, assets, fn, start_inv)