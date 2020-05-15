local assets=
{
	Asset("ANIM", "anim/bottomless_flask.zip"),
    Asset("ATLAS", "images/inventoryimages/bottomless_flask.xml"),
	Asset("IMAGE", "images/inventoryimages/bottomless_flask.tex")
}
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	
    inst.AnimState:SetBank("bottomless_flask")
    inst.AnimState:SetBuild("bottomless_flask")
    inst.AnimState:PlayAnimation("idle")
    	
	inst:AddComponent("edible")
    inst.components.edible.sanityvalue = TUNING.SANITY_SMALL --10
    inst.components.edible.healthvalue = -TUNING.HEALING_MEDSMALL --8

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    return inst
end

return Prefab( "common/inventory/bottomless_flask", fn, assets) 
