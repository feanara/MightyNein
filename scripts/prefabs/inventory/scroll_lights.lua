local assets =
{
    Asset("ANIM", "anim/scroll_lights.zip"),
	Asset("ATLAS", "images/inventoryimages/scroll_lights.xml"),
	Asset("IMAGE", "images/inventoryimages/scroll_lights.tex")
}
 
local prefabs =
{
	"inventory/dancinglights",
}    

function lightsfn(inst, reader)
	SpawnLights(reader, 209/255, 73/255, 170/255)
	SpawnLights(reader, 73/255, 170/255, 209/255)
	SpawnLights(reader, 170/255, 209/255, 73/255)
    return true
end

function SpawnLights(reader, red, green, blue)
	local pt = Vector3(reader.Transform:GetWorldPosition())

	local theta = math.random() * 2 * PI
	local radius = math.random(3, 8)

	local result_offset = FindValidPositionByFan(theta, radius, 12, function(offset)
		local x,y,z = (pt + offset):Get()
		local ents = TheSim:FindEntities(x,y,z , 1)
		return not next(ents) 
	end)

	if result_offset then
		local lights = SpawnPrefab( "dancinglights" )		
		lights.Light:SetColour(red, green, blue)
		lights.Transform:SetPosition((pt + result_offset):Get())
		reader.components.leader:AddFollower(lights)
	end
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

	anim:SetBank("scroll_lights")
	anim:SetBuild("scroll_lights")
    anim:PlayAnimation("idle")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("spellscroll")
	inst.components.spellscroll.onread = lightsfn
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/scroll_lights.xml"

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

return Prefab( "inventory/scroll_lights", fn, assets, prefabs) 
