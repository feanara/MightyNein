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
	--self.anim:GetAnimState():SetBank("wet")
	--self.anim:GetAnimState():SetBuild("wet_meter_player")
	self.anim:GetAnimState():SetBank("rage")
	self.anim:GetAnimState():SetBuild("rage_meter")
	self.anim:SetClickable(true)


	self.arrow = self.anim:AddChild(UIAnim())
	self.arrow:GetAnimState():SetBank("sanity_arrow")
	self.arrow:GetAnimState():SetBuild("sanity_arrow")
	self.arrow:GetAnimState():PlayAnimation("neutral")
	self.arrow:SetClickable(false)

    self.underNumber = self:AddChild(Widget("undernumber"))

    self.num = self:AddChild(Text(BODYTEXTFONT, 33))
    self.num:SetHAlign(ANCHOR_MIDDLE)
    self.num:SetPosition(5, 0, 0)
	self.num:SetClickable(false)
    
    self.num:Hide()
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
end

function RageMeter:OnGainFocus()
	RageMeter._base:OnGainFocus(self)
	self.num:Show()
end

function RageMeter:OnLoseFocus()
	RageMeter._base:OnLoseFocus(self)
	self.num:Hide()
end

function RageMeter:UpdateArrowAnim(value)
	local small_down = 1
	local med_down = 6
	local large_down = 10
	local small_up = 1
	local med_up = 3
	local large_up = 5
	local anim = "neutral"
	if value > 0 and self.rage < self.max then
		if value > large_up then
			anim = "arrow_loop_increase_most"
		elseif value > med_up then
			anim = "arrow_loop_increase_more"
		elseif value > small_up then
			anim = "arrow_loop_increase"
		end
	elseif value < 0 and self.rage > 0 then
		if value < -large_down then
			anim = "arrow_loop_decrease_most"
		elseif value < -med_down then
			anim = "arrow_loop_decrease_more"
		elseif value < -small_down then
			anim = "arrow_loop_decrease"
		end
	end
	
	if anim and self.arrowdir ~= anim then
		self.arrowdir = anim
		self.arrow:GetAnimState():PlayAnimation(anim, true)
	end
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

	self.num:SetString(tostring(math.ceil(newRage)))

	self:UpdateArrowAnim(newRage-oldRage)
end

return RageMeter