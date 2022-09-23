--[[
--Created Date: Friday September 23rd 2022
--Author: JustGod
--Made with ❤
-------
--Last Modified: Friday September 23rd 2022 2:26:26 pm
-------
--Copyright (c) 2022 JustGodWork, All Rights Reserved.
--This file is part of JustGodWork project.
--Unauthorized using, copying, modifying and/or distributing of this file
--via any medium is strictly prohibited. This code is confidential.
-------
--]]

Events.Subscribe("jServer:modules:world:time:sync", function(hour, minute)
    World.SetTime(hour, minute)
end)

Events.Subscribe("jServer:modules:world:weather:sync", function(weather)
    World.SetWeather(weather)
end)