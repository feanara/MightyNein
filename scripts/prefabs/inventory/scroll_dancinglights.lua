local assets =
{
    Asset("INV_IMAGE", "scroll_magearmor")
}
 
local prefabs =
{
    "book_fx"
}

local function cancreatelight(scroll, caster, target, pos)
    local ground = GetWorld()
    if ground and pos then
        local tile = ground.Map:GetTileAtPoint(pos.x, pos.y, pos.z)
        return tile ~= GROUND.IMPASSIBLE and tile < GROUND.UNDERGROUND
    end
    return false
end

local function createlight(scroll, target, pos)
    local light = SpawnPrefab("stafflight")
    light.Transform:SetPosition(pos.x, pos.y, pos.z)
    scroll.components.finiteuses:Use(1)

    local caster = scroll.components.inventoryitem.owner
    if caster and caster.components.sanity then
        caster.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
    end

end

function MakeDancingLights()

    local function fn(Sim)
    	local inst = CreateEntity()
    	local trans = inst.entity:AddTransform()
    	local anim = inst.entity:AddAnimState()
        local sound = inst.entity:AddSoundEmitter()
        anim:SetBank("books")
        anim:SetBuild("books")

        anim:PlayAnimation("book_maxwell")
        MakeInventoryPhysics(inst)
        
		inst:AddComponent("inspectable")		
		inst:AddComponent("inventoryitem")

        inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(3)
		inst.components.finiteuses:SetUses(3)
        inst.components.finiteuses:SetOnFinished( onfinished )

		inst:AddComponent("spellcaster")
		inst.components.spellcaster:SetSpellFn(createlight)
		inst.components.spellcaster:SetSpellTestFn(cancreatelight)
		inst.components.spellcaster.canuseonpoint = true
		inst.components.spellcaster.canusefrominventory = true
		inst:AddTag("nopunch")

        return inst
    end

    return Prefab( "common/".."scroll_dancinglights", fn, assets, prefabs) 
end

---------COMMON-------------
function onfinished(inst)
    inst:Remove()
end

return MakeDancingLights()