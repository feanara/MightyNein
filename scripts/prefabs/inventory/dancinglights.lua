local assets=
{
    Asset("ANIM", "anim/fireflies.zip"),
}

local INTENSITY = .6

local function fadeout(inst)
    inst.components.fader:StopAll()
    inst.AnimState:PlayAnimation("swarm_pst")
    inst.components.fader:Fade(INTENSITY, 0, .75+math.random()*1, function(v) inst.Light:SetIntensity(v) end, function() inst:Remove() end)
end

local function fn(Sim)
    local inst = CreateEntity()

    inst:AddTag("NOBLOCK")
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    
    inst.entity:AddPhysics()
 
    local light = inst.entity:AddLight()
    inst.Light:SetFalloff( 0.5 )
    inst.Light:SetRadius( 2 )
    light:SetIntensity( INTENSITY )
    light:SetColour(100/255, 100/255, 100/255)
    light:Enable(false)

    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
    
    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    
    inst:AddComponent("follower")
    inst:AddComponent("inspectable")
    
    --FADE IN
	print("Lights fading in")
    inst:AddComponent("fader")
    inst.components.fader:StopAll()
    inst.AnimState:PlayAnimation("swarm_pre")
    inst.AnimState:PushAnimation("swarm_loop", true)
    inst.Light:Enable(true)
    inst.Light:SetIntensity(0)
    inst.components.fader:Fade(0, INTENSITY, 3+math.random()*2, function(v) inst.Light:SetIntensity(v) end, function() end)
	
	--Fade out when day starts
    inst:ListenForEvent( "daytime", function()
        inst:DoTaskInTime(2+math.random()*1, function() fadeout(inst) end)
    end, GetWorld())
    
    return inst
end

return Prefab( "common/inventory/dancinglights", fn, assets) 
