local assets =
{
	Asset("ANIM", "anim/books.zip"),
    Asset("ATLAS", "images/inventoryimages/scroll_fire.xml"),
    Asset("IMAGE", "images/inventoryimages/scroll_fire.tex"),
}
 
local prefabs =
{
    "book_fx"
}    

function firefn(inst, reader)

    --local num_lightnings =  16
    --reader.components.sanity:DoDelta(-TUNING.SANITY_LARGE)
    --reader:StartThread(function()
    --    for k = 0, num_lightnings do
	--
    --        local rad = math.random(3, 15)
    --        local angle = k*((4*PI)/num_lightnings)
    --        local pos = Vector3(reader.Transform:GetWorldPosition()) + Vector3(rad*math.cos(angle), 0, rad*math.sin(angle))
    --        GetSeasonManager():DoLightningStrike(pos)
    --        Sleep(math.random( .3, .5))
    --    end
    --end)
    return true
end

function onfinished(inst)
    inst:Remove()
end

function MakeScroll(name, usefn, scrolluses )

    local function fn(Sim)
    	local inst = CreateEntity()
    	local trans = inst.entity:AddTransform()
    	local anim = inst.entity:AddAnimState()
        local sound = inst.entity:AddSoundEmitter()
        anim:SetBuild("books")

        anim:PlayAnimation("book_brimstone")
        MakeInventoryPhysics(inst)
        
        -----------------------------------
        
        inst:AddComponent("inspectable")
        inst:AddComponent("book")
        inst.components.book.onread = usefn

        inst:AddComponent("characterspecific")
        inst.components.characterspecific:SetOwner("caleb")
        
        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_fire.xml"

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses( scrolluses )
        inst.components.finiteuses:SetUses( scrolluses )
        inst.components.finiteuses:SetOnFinished( onfinished )

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
		
        return inst
    end

    return Prefab( "common/inventory/scroll_fire", fn, assets, prefabs) 
end

return MakeBook("scroll_fire", firefn, 3)