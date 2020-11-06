local assets =
{
	Asset("ANIM", "anim/books.zip"),
    Asset("ATLAS", "images/inventoryimages/scroll_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/scroll_armor.tex"),
}
 
local prefabs =
{
    "book_fx"
}    

function armorfn(inst, reader)
    --if not GetWorld().components.birdspawner then
    --    return false
    --end
	--
	--
    --reader.components.sanity:DoDelta(-TUNING.SANITY_HUGE)
    --local num = 20 + math.random(10)
    --
    ----we can actually run out of command buffer memory if we allow for infinite birds
	--local x, y, z = reader.Transform:GetWorldPosition()
	--local ents = TheSim:FindEntities(x,y,z, 10, nil, nil, {'magicalbird'})
	--if #ents > 30 then
	--	num = 0
	--	reader.components.talker:Say(GetString(reader.prefab, "ANNOUNCE_WAYTOOMANYBIRDS"))
	--elseif #ents > 20 then
	--	reader.components.talker:Say(GetString(reader.prefab, "ANNOUNCE_TOOMANYBIRDS"))
	--	num = 10 + math.random(10)
	--end
    --
    --if num > 0 then
	--	reader:StartThread(function()
	--		for k = 1, num do
	--			local pt = GetWorld().components.birdspawner:GetSpawnPoint(Vector3(reader.Transform:GetWorldPosition() ))
	--            
	--			if pt then
	--				local bird = GetWorld().components.birdspawner:SpawnBird(pt, true)
    --                if bird then
	--				   bird:AddTag("magicalbird")
    --                end
	--			end
	--			Sleep(math.random(.2, .25))
	--		end
	--	end)
	--end
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
		inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_armor.xml"

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses( scrolluses )
        inst.components.finiteuses:SetUses( scrolluses )
        inst.components.finiteuses:SetOnFinished( onfinished )

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
		
        return inst
    end

    return Prefab( "common/inventory/scroll_armor", fn, assets, prefabs) 
end

return MakeBook("scroll_armor", armorfn, 3)