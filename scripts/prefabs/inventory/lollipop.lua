local assets=
{
	Asset("ANIM", "anim/lollipop.zip"),
	Asset("ATLAS", "images/inventoryimages/lollipop.xml"),
	Asset("IMAGE", "images/inventoryimages/lollipop.tex"),
}

local function onfinished(inst)
    inst:Remove()
end

local function onequip(inst, owner) 
    --owner.AnimState:OverrideSymbol("swap_object", "swap_lollipop", "swap_lollipop")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("lollipop")
    anim:SetBuild("lollipop")
    anim:PlayAnimation("idle")
    

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.LOLLIPOP_DAMAGE)
    
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.LOLLIPOP_USES)
    inst.components.finiteuses:SetUses(TUNING.LOLLIPOP_USES)
    
    inst.components.finiteuses:SetOnFinished( onfinished )

    inst:AddTag("show_spoilage")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/lollipop.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    return inst
end

return Prefab( "common/inventory/lollipop", fn, assets) 
