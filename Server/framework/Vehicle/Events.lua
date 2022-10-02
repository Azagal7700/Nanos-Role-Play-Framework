---
---Created Date: 22:19 26/09/2022
---Author: JustGod
---Made with ❤

---File: [Events]

---Copyright (c) 2022 JustGodWork, All Rights Reserved.
---This file is part of JustGodWork project.
---Unauthorized using, copying, modifying and/or distributing of this file
---via any medium is strictly prohibited. This code is confidential.
---

---@param self Vehicle
Vehicle.Subscribe("Destroy", function(self)
    local vehicleId = self:GetValue("vehicleId")
    if (vehicleId) then
        jServer.vehicleManager:deleteById(vehicleId);
    end
end)

---@param self Vehicle
Vehicle.Subscribe("Hit", function(self, impact_force, normal_impulse, impact_location, velocity)
    local vehicleId = self:GetValue("vehicleId")
    if (vehicleId) then
        print("[VEHICLE] (HIT)", self:GetHealth())
    end
end)

---@param self Vehicle
Vehicle.Subscribe("TakeDamage", function(self, damage, bone, type, from_direction, instigator, causer)
    local vehicleId = self:GetValue("vehicleId")
    if (vehicleId) then
        local newHealth = self:GetHealth() - damage
        self:SetHealth(newHealth)
    end
end)