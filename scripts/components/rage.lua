local Rage = Class(function(self, inst)
    self.inst = inst
	self.max = 100
    self.current = 0
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

function Rage:StopTimeEffect()
    if self.task then
        self.task:Cancel()
        self.task = nil
    end
end

function Rage:StartTimeEffect(dt, delta_b)
    if self.task then
        self.task:Cancel()
        self.task = nil
    end
    self.task = self.inst:DoPeriodicTask(dt, function() self:DoDelta(delta_b, true) end)
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

    if self.is_raging then
        if self.makeraging then
            self.makeraging(self.inst)
        end
    else
        if self.makenormal then
            self.makenormal(self.inst)
        end
    end

end

function Rage:DoDelta(delta, overtime)
    local oldpercent = self.current/self.max
    self.current = self.current + delta
    
    if self.current < 0 then self.current = 0 end
    if self.current > self.max then self.current = self.max end

    self.inst:PushEvent("Ragedelta", {oldpercent = oldpercent, newpercent = self.current/self.max, overtime = overtime})

    --if delta ~= 0 then
        if self.is_raging and self.current <= 0 then
            self.is_raging = false
            
            if self.onmakenormal then
                self.onmakenormal(self.inst)
                self.inst:PushEvent("rageend")
            end

        elseif not self.is_raging and self.current >= self.max then
            self.is_raging = true
            
            if self.onmakeraging then
                self.onmakeraging(self.inst)
                self.inst:PushEvent("ragestart")
            end
        end
    --end
end

function Rage:GetPercent()
    return self.current / self.max
end

function Rage:GetDebugString()
    return string.format("%2.2f / %2.2f", self.current, self.max)
end

function Rage:SetPercent(percent)
    self.current = self.max*percent
    self:DoDelta(0)
end

return Rage
