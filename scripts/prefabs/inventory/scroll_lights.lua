local assets =
{
	Asset("ANIM", "anim/books.zip"),
    Asset("ATLAS", "images/inventoryimages/scroll_lights.xml"),
    Asset("IMAGE", "images/inventoryimages/scroll_lights.tex"),
}
 
local prefabs =
{
    "book_fx"
}    

function lightsfn(inst, reader)
	print("casting lights spell")
    local pt = Vector3(reader.Transform:GetWorldPosition())
	
    local numlights = 1
	
    reader:StartThread(function()
        for k = 1, numlights do
        
            local theta = math.random() * 2 * PI
            local radius = math.random(3, 8)
	
            local result_offset = FindValidPositionByFan(theta, radius, 12, function(offset)
                local x,y,z = (pt + offset):Get()
                local ents = TheSim:FindEntities(x,y,z , 1)
                return not next(ents) 
            end)
	
            if result_offset then
                local lights = SpawnPrefab("dancinglights")
                
                lights.Transform:SetPosition((pt + result_offset):Get())
                
                ----need a better effect
                --local fx = SpawnPrefab("splash_ocean")
                --local pos = pt + result_offset
                --fx.Transform:SetPosition(pos.x, pos.y, pos.z)
                ----PlayFX((pt + result_offset), "splash", "splash_ocean", "idle")
                --lights.sg:GoToState("attack_pre")
            end
	
            Sleep(.33)
        end
    end)
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
		inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_lights.xml"

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses( scrolluses )
        inst.components.finiteuses:SetUses( scrolluses )
        inst.components.finiteuses:SetOnFinished( onfinished )

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
		
        return inst
    end

    return Prefab( "common/inventory/scroll_lights", fn, assets, prefabs) 
end

return MakeBook("scroll_lights", lightsfn, 3)