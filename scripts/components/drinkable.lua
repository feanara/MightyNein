local Drinkable = Class(function(self, inst)
    self.inst = inst
    self.healthvalue = 0
    self.hungervalue = 0
    self.sanityvalue = 0
    self.ondrunk = nil
end)

function Drinkable:Drink(inst,drinker)
	if self.inst:HasTag("flask") then
		local numberofslot = self.inst.components.inventoryitem:GetSlotNum() or 5
		local newflask = SpawnPrefab(self.inst.prefab)
		GetPlayer():DoTaskInTime(0.01, function() drinker.components.inventory:GiveItem(newflask, numberofslot, nil, true) end)
	end
end

function Drinkable:SetOnDrunkFn(fn)
    self.ondrunk = fn
end

function Drinkable:OnDrunk(drinker)
    if self.ondrunk then
        self.ondrunk(self.inst, drinker)
    end
    self.inst:PushEvent("ondrunk", {drinker = drinker})
end

function Drinkable:CollectInventoryActions(doer, actions, right)
	if not self.inst.components.equippable or right then
		table.insert(actions, ACTIONS.DRINK)
    end
end

function Drinkable:DebugString()
	return 'Drinkable: Health '..self.healthvalue..' | Hunger '..self.hungervalue..' | Sanity '..self.sanityvalue
end
return Drinkable
