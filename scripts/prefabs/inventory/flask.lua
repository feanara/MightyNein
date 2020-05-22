local assets=
{
	Asset("ANIM", "anim/flask.zip"),
    Asset("ATLAS", "images/inventoryimages/flask.xml"),
	Asset("IMAGE", "images/inventoryimages/flask.tex")
}

local function oneaten(inst, eater)
	if eater == GetPlayer() then
		inst.components.drinkable:Drink(inst,eater)
		return
	end
end

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
    inst:AddComponent("edible")
    inst.components.edible.hungervalue = 0
    inst.components.edible.healthvalue = -TUNING.HEALING_MEDSMALL
	inst.components.edible.sanityvalue = TUNING.SANITY_SMALL
    inst.components.edible:SetOnEatenFn(oneaten)
	inst.components.edible.foodtype = "GENERIC"
    inst.components.edible.stale_hunger = 0
    inst.components.edible.stale_health = 0
    inst.components.edible.spoiled_hunger = 0
    inst.components.edible.spoiled_health = 0	
	inst.components.edible.forcequickeat=true

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/flask.xml"

    inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("nott")
    return inst
end

return Prefab( "common/inventory/flask", fn, assets) 