local assets =
{
    Asset("ANIM", "anim/scroll_armor.zip"),
    --Asset("ANIM", "anim/magearmor_meter.zip"),
	Asset("ATLAS", "images/inventoryimages/scroll_armor.xml"),
	Asset("IMAGE", "images/inventoryimages/scroll_armor.tex"),
}

function armorfn(inst, reader)
	if reader.components.magearmorable then
		reader.components.magearmorable:PutOn(inst)
    end
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

	anim:SetBank("scroll_armor")
	anim:SetBuild("scroll_armor")
    anim:PlayAnimation("idle")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("spellscroll")
	inst.components.spellscroll.onread = armorfn
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_armor.xml"

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

return Prefab( "inventory/scroll_armor", fn, assets) 
