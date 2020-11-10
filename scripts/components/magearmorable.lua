local MageArmorable = Class(function(self, inst)
    self.inst = inst
	self.absorb = .25
    self.current = 0
	self.max = 120
	self.rate = 10
	self.is_wearing = false
	self.fx = nil
end)

function MageArmorable:IsWearing()
    return self.is_wearing
end

function MageArmorable:OnSave()
	print('Saving magearmor. current: '..self.current..' / is wearing: '..tostring(self.is_wearing))
    return 
    {
		current = self.current,
        is_wearing = self.is_wearing
	}
end

function MageArmorable:OnLoad(data)
	print('Loading magearmor!')
    if data then
		print('have magearmor data. current: '..data.current..' / is wearing: '..tostring(data.is_wearing))
        if data.current then
            self.current = data.current
        end

        if data.is_wearing then
            self.is_wearing = data.is_wearing
        end
    end

    if self.is_wearing then
		self:PutOnExisting(self.inst, self.current)
    end
end

function MageArmorable:PutOn(inst)
	self:PutOnExisting(inst, self.max)
end

function MageArmorable:PutOnExisting(inst, current)
	self.current = current
	self.is_wearing = true

	if self.putonfn then
		self.putonfn(self.inst, self.absorb)
	end
		
	if self.task then
        self.task:Cancel()
        self.task = nil
    end
	
    self.fx = SpawnPrefab( "inventory/magearmor" )
    local follower = self.fx.entity:AddFollower()
    follower:FollowSymbol( GetPlayer().GUID, "swap_body", 0, -110, 1 )


    self.task = self.inst:DoPeriodicTask(3, function() self:Persist() end)
end

function MageArmorable:TakeOff()
	self.is_wearing = false

	if self.takeofffn then
		self.takeofffn(self.inst)
	end

	if self.task then
		self.task:Cancel()
		self.task = nil
	end

	self.fx:Remove()
    self.fx = nil
end

function MageArmorable:Persist()
    self.current = self.current - self.rate    
    if self.current < 0 then self.current = 0 end
    if self.current > self.max then self.current = self.max end
    self.inst:PushEvent("magearmorpersist", {newvalue = self.current})

	if self.is_wearing and self.current == 0 then
		self:TakeOff()
	end
end

function MageArmorable:GetDebugString()
    return string.format("%2.2f / %2.2f", self.current, self.max)
end

return MageArmorable
