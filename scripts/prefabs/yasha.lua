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

local function onattack(inst, data)
	print('Current Rage: '..inst.components.rage.current..' / '..inst.components.rage.max)
	if inst.components.rage:IsRaging() then
		inst.components.rage:DoDelta(10)
	else
		inst.components.rage:DoDelta(5)
	end
end

local function ragedelta(inst, ragelevel)
	print('rage hud function')
	if inst.HUD and inst.HUD.controls then
	print('rage hud')
		if inst.components.rage:IsRaging() then
			print('rage hud raging')
			if not inst.HUD.controls.ragemeter then
				print('adding rage hud')
				inst.HUD.controls.ragemeter = inst.HUD.controls.sidepanel:AddChild(RageMeter(inst))
				inst.HUD.controls.ragemeter:SetPosition(0,-300,0)
				inst.HUD.controls.crafttabs:Hide()
				inst.HUD.controls.mapcontrols.minimapBtn:Hide()
			end
			inst.HUD.controls.ragemeter.rage = ragelevel
		elseif not inst.components.rage:IsRaging() and inst.HUD.controls.ragemeter then
			print('rage hud removing')
			inst.HUD.controls.ragemeter:Deactivate()
			inst.HUD.controls.ragemeter:Kill()
			inst.HUD.controls.ragemeter = nil
			inst.HUD.controls.crafttabs:Show()
			inst.HUD.controls.mapcontrols.minimapBtn:Show()
		end
	end
end

local function EnterRage(inst)
	GetClock():DoLightningLighting()
	GetPlayer().components.playercontroller:ShakeCamera(inst, "FULL", 0.7, 0.02, .5, 40)

	inst:PushEvent("transform_raging")
	inst:AddTag("raging")
	inst.AnimState:SetBuild("yasha_raging")

	inst.components.talker:Say("I would like to rage!")
	--inst.sg:PushEvent("powerup")

    inst.components.combat.damagemultiplier = 2.1
	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1.1

	inst.components.hunger:Pause()
	inst.components.sanity.ignore = true
	inst.components.health.absorb = .75

	inst.HUD.rageOL = inst.HUD.under_root:AddChild(Image("images/woodie.xml", "beaver_vision_OL.tex"))
	inst.HUD.rageOL:SetVRegPoint(ANCHOR_MIDDLE)
	inst.HUD.rageOL:SetHRegPoint(ANCHOR_MIDDLE)
	inst.HUD.rageOL:SetVAnchor(ANCHOR_MIDDLE)
	inst.HUD.rageOL:SetHAnchor(ANCHOR_MIDDLE)
	inst.HUD.rageOL:SetScaleMode(SCALEMODE_FILLSCREEN)
	inst.HUD.rageOL:SetClickable(false)
	GetWorld().components.colourcubemanager:SetOverrideColourCube("images/colour_cubes/beaver_vision_cc.tex")

	inst.components.rage:StartDrainEffect(2)
end


local function LoseRage(inst)
	inst:PushEvent("transform_normal")
	inst:RemoveTag("raging")
	inst.AnimState:SetBuild("yasha")

	inst.components.talker:Say("That was exhausting.")
	--inst.sg:PushEvent("powerdown")

    inst.components.combat.damagemultiplier = 1.1
	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED

	inst.components.hunger:Resume()
	inst.components.sanity.ignore = false
	inst.components.health.absorb = 0

	inst.components.sanity:DoDelta(25)
	inst.components.rage:StopDrainEffect()

	if inst.HUD.rageOL then
		inst.HUD.rageOL:Kill()
		inst.HUD.rageOL = nil
	end
	GetWorld().components.colourcubemanager:SetOverrideColourCube(nil)
end


--EXTRA SANITY FOR FLOWERS
local function onpick(inst, data)
	if data.inventoryitem.HasTag("petals") then
        inst.components.sanity:DoDelta(TUNING.SANITY_SMALL)
    end
end

local fn = function(inst)
	inst.soundsname = "willow"
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
	inst:ListenForEvent("ragedelta", ragedelta)

	inst:ListenForEvent("attacked", onattack)
	inst:ListenForEvent("onhitother", onattack)
	inst:ListenForEvent("doattack", onattack)
end

return MakePlayerCharacter("yasha", prefabs, assets, fn, start_inv)