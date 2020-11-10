local assets=
{
	Asset("ANIM", "anim/bloodsword.zip"),
	Asset("ANIM", "anim/swap_bloodsword.zip"),
    Asset("ATLAS", "images/inventoryimages/bloodsword.xml"),
	Asset("IMAGE", "images/inventoryimages/bloodsword.tex")
}

local damage = 65

local function onfinished(inst)
    inst:Remove()
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_bloodsword", "swap_bloodsword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end

local function attackfn(inst, attacker, target)
	if attacker.components.sanity then
		attacker.components.sanity:DoDelta(-TUNING.SANITY_SMALL) --SANITY_TINY
	end
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("bloodsword")
    anim:SetBuild("bloodsword")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("mollymauk")

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(damage)
	inst.components.weapon:SetAttackCallback(attackfn)
	
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bloodsword.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	    return inst
end

return Prefab( "common/inventory/bloodsword", fn, assets) 
