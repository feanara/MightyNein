local Rage = Class(function(self, inst)
    self.inst = inst
	self.max = 100
    self.current = 0
	self.rate = 10
    self.is_raging = false
end)

function Rage:IsRaging()
    return self.is_raging
end

function Rage:OnSave()    
    return 
    {
		current = self.current,
        is_raging = self.is_raging
	}
end

function Rage:StopDrainEffect()
    if self.task then
        self.task:Cancel()
        self.task = nil
    end
end

function Rage:StartDrainEffect(dt)
	self:StopDrainEffect()
    self.task = self.inst:DoPeriodicTask(dt, function() self:DoDelta(-self.rate) end)
end

function Rage:OnLoad(data)
    if data then
        if data.current then
            self.current = data.current
        end

        if data.is_raging then
            self.is_raging = data.is_raging
        end
    end

    if self.is_raging and self.makeraging then
		self.makeraging(self.inst)
    end

end

function Rage:DoDelta(delta)
    local old = self.current
	
    self.current = self.current + delta    
    if self.current < 0 then self.current = 0 end
    if self.current > self.max then self.current = self.max end

	print('RAGE DELTA: '..old..' -> '..self.current)
	print(self:GetDebugString())
	self.inst:PushEvent("ragedelta", self.current)

    if delta ~= 0 then
        if self.is_raging and self.current <= 0 then
            self.is_raging = false
            
            if self.makenormal then
                self.makenormal(self.inst)
                self.inst:PushEvent("rageend")
				if self.inst.components.sanity then self.inst.components.sanity:DoDelta(-TUNING.SANITY_MED) end
            end

        elseif not self.is_raging and self.current >= (self.max/2) then
            self.is_raging = true
            
            if self.makeraging then
                self.makeraging(self.inst)
                self.inst:PushEvent("ragestart")
            end
        end
    end
end

function Rage:GetDebugString()
    return string.format("%2.2f / %2.2f", self.current, self.max)
end

return Rage
