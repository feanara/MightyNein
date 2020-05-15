local assets =
{
    Asset("INV_IMAGE", "scroll_magearmor")
}
 
local prefabs =
{
    "book_fx"
}

local function magearmor(inst, reader)
    reader.components.sanity:DoDelta(-TUNING.SANITY_LARGE)
	--equip without taking slot?
    return true
end

local function canmagearmor()
	return true
end

function MakeMageArmor()

    local function fn(Sim)
    	local inst = CreateEntity()
    	local trans = inst.entity:AddTransform()
    	local anim = inst.entity:AddAnimState()
        local sound = inst.entity:AddSoundEmitter()
        --anim:SetBank("books")
        --anim:SetBuild("books")

        anim:PlayAnimation("book_maxwell")
        MakeInventoryPhysics(inst)
        
        inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(3)
		inst.components.finiteuses:SetUses(3)

		inst:AddComponent("spellcaster")
		inst.components.spellcaster:SetSpellFn(magearmor)
		inst.components.spellcaster:SetSpellTestFn(canmagearmor)
		inst.components.spellcaster.canuseontargets = true
		inst.components.spellcaster.canusefrominventory = true
		inst:AddTag("nopunch")

        return inst
    end

    return Prefab( "common/".."scroll_magearmor", fn, assets, prefabs) 
end

---------COMMON-------------
function onfinished(inst)
    inst:Remove()
end

return MakeMageArmor()