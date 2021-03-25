local UIAnim = require "widgets/uianim"
local Widget = require "widgets/widget"
local Text = require "widgets/text"

local RageMeter = Class(Widget, function(self, owner)
	Widget._ctor(self, "RageMeter")
	self.owner = owner

    self:SetPosition(0,0,0)
    self.active = false
    self.rage = 0
	self.max = owner.components.rage.max

    self.anim = self:AddChild(UIAnim())
	self.anim:GetAnimState():SetBank("rage")
	self.anim:GetAnimState():SetBuild("rage_meter")
	self.anim:SetClickable(false)

	self:StartUpdating()
end)

function RageMeter:UpdateMeter()
	self.anim:GetAnimState():SetPercent("anim", self.rage/self.max)
end

function RageMeter:Activate()
	self.anim:GetAnimState():PlayAnimation("open")
	self.animTask = self.owner:DoPeriodicTask(.5, function() self:UpdateMeter() end)
end

function RageMeter:Deactivate()
	if self.animTask then
		self.animTask:Cancel()
		self.animTask = nil
	end
	self.anim:GetAnimState():PlayAnimation("close")
	self.active = false
end

function RageMeter:OnGainFocus()
	RageMeter._base:OnGainFocus(self)
end

function RageMeter:OnLoseFocus()
	RageMeter._base:OnLoseFocus(self)
end

function RageMeter:OnUpdate(dt)
	local newRage = self.owner.components.rage.current
	local oldRage = self.rage
	self.rage = newRage
	if newRage ~= oldRage then
		if newRage > 0 and oldRage <= 0 then
			self:Activate()
			if newRage > 10 then
				self.anim:GetAnimState():SetPercent("anim", self.rage/self.max)
			end
		elseif newRage <= 0 then
			self:Deactivate()
		end
	end
end

return RageMeter