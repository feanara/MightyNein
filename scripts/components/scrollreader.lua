local ScrollReader = Class(function(self, inst)
    self.inst = inst
end)

function ScrollReader:ReadScroll(obj)
	if obj.components.spellscroll then
		if obj.components.spellscroll:OnRead(self.inst) then
			if obj.components.finiteuses then
				obj.components.finiteuses:Use(1)
			end
			self.inst:PushEvent("scrollread", obj)
			return true
		end		
	end
end
return ScrollReader