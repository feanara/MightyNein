local Drinkable = Class(function(self, inst)
    self.inst = inst
    self.ondrunk = nil
end)

function Drinkable:Drink(inst,eater)
	if inst:HasTag("flask") then
		self:givenewflask(inst, eater)
	end
end

function Drinkable:givenewflask(flask,owner)
	local numberofslot = flask.components.inventoryitem:GetSlotNum() or 5
	local newflask = SpawnPrefab(flask.prefab)
	newflask.components.edible.foodtype = flask.components.edible.foodtype
	GetPlayer():DoTaskInTime(0.01, function()
		owner.components.inventory:GiveItem(newflask, numberofslot, nil, true)
	end)
	return newflask
end

function Drinkable:CollectInventoryActions(doer, actions, right)
    if doer.components.eater and doer.components.eater:CanEat(self.inst) then
        if not self.inst.components.equippable or right then
		table.insert(actions, ACTIONS.DRINK)
		end
    end
end
return Drinkable
