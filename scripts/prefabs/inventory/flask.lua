local assets=
{
	Asset("ANIM", "anim/flask.zip"),
    Asset("ATLAS", "images/inventoryimages/flask.xml"),
	Asset("IMAGE", "images/inventoryimages/flask.tex")
}

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	
    anim:SetBank("flask")
    anim:SetBuild("flask")
    anim:PlayAnimation("idle")
    	
	inst:AddTag("flask")
    inst:AddTag("irreplaceable")
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon( "images/inventoryimages/flask.png" )

	inst:AddComponent("drinkable")
    inst.components.drinkable.healthvalue = -TUNING.HEALING_MEDSMALL
	inst.components.drinkable.sanityvalue = TUNING.SANITY_SMALL

    inst:AddComponent("inspectable")	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/flask.xml"

    inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("nott")
    return inst
end

return Prefab( "common/inventory/flask", fn, assets) 