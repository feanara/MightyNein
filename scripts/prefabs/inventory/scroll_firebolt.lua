local assets =
{
    Asset("INV_IMAGE", "scroll_firebolt")
}
 
local prefabs =
{
    "book_fx"
}

local function firefn(inst, reader)

    local num_lightnings =  16
    reader.components.sanity:DoDelta(-TUNING.SANITY_LARGE)
    reader:StartThread(function()
        for k = 0, num_lightnings do

            local rad = math.random(3, 15)
            local angle = k*((4*PI)/num_lightnings)
            local pos = Vector3(reader.Transform:GetWorldPosition()) + Vector3(rad*math.cos(angle), 0, rad*math.sin(angle))
            GetSeasonManager():DoLightningStrike(pos)
            Sleep(math.random( .3, .5))
        end
    end)
    return true
end

local function canfirebolt()
return true
end

function MakeFirebolt()

    local function fn(Sim)
    	local inst = CreateEntity()
    	local trans = inst.entity:AddTransform()
    	local anim = inst.entity:AddAnimState()
        local sound = inst.entity:AddSoundEmitter()

        anim:PlayAnimation("book_maxwell")
        MakeInventoryPhysics(inst)
        
        inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(3)
		inst.components.finiteuses:SetUses(3)

		inst:AddComponent("spellcaster")
		inst.components.spellcaster:SetSpellFn(firefn)
		inst.components.spellcaster:SetSpellTestFn(canfirebolt)
		inst.components.spellcaster.canuseontargets = true
		inst.components.spellcaster.canusefrominventory = false
		inst:AddTag("nopunch")

        return inst
    end

    return Prefab( "common/".."scroll_firebolt", fn, assets, prefabs) 
end

---------COMMON-------------
function onfinished(inst)
    inst:Remove()
end

return MakeFirebolt()