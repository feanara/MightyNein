local assets =
{
    Asset("ANIM", "anim/scroll_fire.zip"),
	Asset("ATLAS", "images/inventoryimages/scroll_fire.xml"),
	Asset("IMAGE", "images/inventoryimages/scroll_fire.tex"),
}
 
local prefabs =
{
}    

function firefn(inst, reader)
    local pos = Vector3(inst.Transform:GetWorldPosition())

    GetClock():DoLightningLighting()
    GetPlayer().components.playercontroller:ShakeCamera(inst, "FULL", 0.7, 0.02, .5, 40)

    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 10)

    for k,v in pairs(ents) do
        local inpocket = v.components.inventoryitem and v.components.inventoryitem:IsHeld()
        if v.components.burnable and not inpocket and not v.components.fueled and not v.components.burnable:IsBurning() then
			if v.components.freezable and v.components.freezable:IsFrozen() then           
				v.components.freezable:Unfreeze()            
			else            
				v.components.burnable:Ignite(true)
			end   
        end
    end

	reader.components.sanity:DoDelta(-TUNING.SANITY_MED)
    return true    
end

function onfinished(inst)
    inst:Remove()
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()
	MakeInventoryPhysics(inst)

	anim:SetBank("scroll_fire")
	anim:SetBuild("scroll_fire")
    anim:PlayAnimation("idle")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("spellscroll")
	inst.components.spellscroll.onread = firefn
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_fire.xml"

	inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses( 3 )
	inst.components.finiteuses:SetUses( 3 )
	inst.components.finiteuses:SetOnFinished( onfinished )

	inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("caleb")

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)

	return inst
end

return Prefab( "inventory/scroll_fire", fn, assets, prefabs) 
