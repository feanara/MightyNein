local SpellScroll = Class(function(self, inst)
    self.inst = inst
end)

function SpellScroll:OnRead(reader)
    if self.onread then
        return self.onread(self.inst, reader)
    end
    return true
end

function SpellScroll:CollectInventoryActions(doer, actions)
    if doer.components.scrollreader then
        table.insert(actions, ACTIONS.READSPELLSCROLL)
    end
end

return SpellScroll