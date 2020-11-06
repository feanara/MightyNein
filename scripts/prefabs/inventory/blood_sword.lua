local assets=
{
	Asset("ANIM", "anim/blood_sword.zip"),
	Asset("ANIM", "anim/swap_blood_sword.zip"),
    Asset("ATLAS", "images/inventoryimages/blood_sword.xml"),
	Asset("IMAGE", "images/inventoryimages/blood_sword.tex")
}

local function onfinished(inst)
    inst:Remove()
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_blood_sword", "swap_blood_sword")
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
    
    anim:SetBank("blood_sword")
    anim:SetBuild("blood_sword")
    anim:PlayAnimation("idle")
    
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BLOOD_SWORD_DAMAGE)

	local old_OnAttack = inst.components.weapon.OnAttack
	function inst.components.weapon.OnAttack(attacker, target, projectile)
		if attacker.components.sanity then
			attacker.components.sanity:DoDelta(-TUNING.SANITY_SMALL) --SANITY_TINY
			return old_OnAttack(attacker, target, projectile)
		end
    end
	
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/blood_sword.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    inst:AddComponent("characterspecific")
    inst.components.characterspecific:SetOwner("mollymauk")
	return inst
end

return Prefab( "common/inventory/blood_sword", fn, assets) 
