---
---Created Date: 23:31 26/09/2022
---Author: JustGod
---Made with ❤

---File: [Vehicle]

---Copyright (c) 2022 JustGodWork, All Rights Reserved.
---This file is part of JustGodWork project.
---Unauthorized using, copying, modifying and/or distributing of this file
---via any medium is strictly prohibited. This code is confidential.
---

---@return number
function Vehicle:GetMaxHealth()
    return self:GetValue("maxHealth", 1000)
end

---@param maxHealth number
---@param syncWithClient boolean
function Vehicle:SetMaxHealth(maxHealth, syncWithClient)
    self:SetValue("maxHealth", maxHealth, syncWithClient)
end

---@return number
function Vehicle:GetHealth()
    return self:GetValue("currentHealth", self:GetMaxHealth())
end

---@param health number
---@param syncWithClient boolean
function Vehicle:SetHealth(health, syncWithClient)
    if (health > self:GetMaxHealth()) then
        return
    elseif (health < 1) then
        self:Destroy()
    else
        self:SetValue("currentHealth", health, syncWithClient)
    end
end

---@param maxHealth number
function Vehicle:SetMaxHealth(maxHealth, syncWithClient)
    self:SetValue("maxHealth", maxHealth, syncWithClient)
end

---@param plate string
---@param syncWithClient boolean
function Vehicle:setPlate(plate, syncWithClient)
    self:SetValue("plate", plate, syncWithClient)
end

---@return string
function Vehicle:getPlate()
    return self:GetValue("plate")
end