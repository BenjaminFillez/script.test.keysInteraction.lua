--[[
@ Benjamin Fillez
08/09/23
KeyInteraction - module permettent de teste l'entrer d'une nouvel valeur a la table souhaité

(module fait rapidement donc j'ai un peu mal fait certaine chose)
]]

local keyInteraction = {}
keyInteraction.__index = keyInteraction

function keyInteraction.new(name)
    local self = setmetatable({},keyInteraction)
    if (not name) then 
    elseif (name) and type(name) == "string" then
        self[name] = {}
    end
    return self
end

function keyInteraction:CreateKey(value,hasUniqueName)
    if (not value) then return self:GetWarnMessage() end
    if (not hasUniqueName) then
        if self[value] ~= nil then
            self:GetWarnMessage()
        else
            self[value] = value
            self:GetWarnMessage()
        end
    else
        if (self[hasUniqueName][value] == value) then
            self:GetWarnMessage()
        else
            self[hasUniqueName][value] = value
            self:GetWarnMessage()
        end
    end
    return self 
end

function keyInteraction:GetKey(value,hasUniqueName)
    if (not hasUniqueName) then
        if (self[value] == value) then
            print(self[value])
            self:GetWarnMessage()
        else
            self:GetWarnMessage()
        end
    elseif (self[hasUniqueName]) then
        if (self[hasUniqueName][value] == value) then
            print(self[hasUniqueName][value])
            self:GetWarnMessage()
        else
            self:GetWarnMessage()
        end
    end
    return self
end

function keyInteraction:RemoveKey(value,hasUniqueName)
    if (not value) then return self:GetWarnMessage() end
    if (not hasUniqueName) then
        if self[value] == value then
            return self:GetWarnMessage()
        else
            self[value] = nil
            self:GetWarnMessage()
        end
    else
        if (self[hasUniqueName][value]) then
            return self:GetWarnMessage()
        else
            self[hasUniqueName][value] = nil
            self:GetWarnMessage()
        end
    end
    return self 
end

function keyInteraction:GetWarnMessage()
    print("Un message d'erreur ou de r'envoie a etait recu")
end

--[[
    --  @parti sans nom spécifique

    local keysModules = keyInteraction.new()
keysModules:CreateKey(451) -- envoie la nouvel valeur
keysModules:GetKey(451) -- obtien la nouvel valeur
print("envoie") 
keysModules:RemoveKey(451) -- retire la valeur
keysModules:GetKey(451) -- obtien (nil) car valeur n'est plus présente dans la table
print("clear")
]]

--[[
    @parti avec nom spécifique
    local keysModules = keyInteraction.new("TEST_TABLE")
keysModules:CreateKey("string","TEST_TABLE") -- envoie la nouvel valeur
keysModules:GetKey("string","TEST_TABLE") -- obtien la nouvel valeur
print("envoie") 
keysModules:RemoveKey("string","TEST_TABLE") -- retire la valeur
keysModules:GetKey("string","TEST_TABLE") -- obtien (nil) car valeur n'est plus présente dans la table
print("supprimer")
]]


