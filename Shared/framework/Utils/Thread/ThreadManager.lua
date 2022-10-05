--[[
----
----Created Date: 6:19 Friday September 30th 2022
----Author: JustGod
----Made with ❤
----
----File: [ThreadManager]
----
----Copyright (c) 2022 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class ThreadManager
local ThreadManager = {};

---@return ThreadManager
function ThreadManager:new()
    ---@type ThreadManager
    local self = {};
    setmetatable(self, { __index = ThreadManager});

    self.threads = {};
    self.waiting_coroutines = {};
    self.to_resume = {};

    self:initialize();

    return self;
end

---Return time in milliseconds
---@return number
function ThreadManager:getTime()
    if (Server) then return Server.GetTime() end
    if (Client) then return Client.GetTime() end
end

---Clear or resume coroutines
---@private
function ThreadManager:initialize()
    Timer.SetInterval(function()
        self:checkWaiting();
        self:clear();
    end, 0);
end

---Check if coroutine need to resume
---@private
function ThreadManager:checkWaiting()
    for co, routineTime in pairs(self.waiting_coroutines) do
        if (routineTime < self:getTime()) then
            self.to_resume[#self.to_resume + 1] = co;
        end
    end
end

---Clear all cached coroutines
---@private
function ThreadManager:clear()
    for _, co in ipairs(self.to_resume) do
        self.waiting_coroutines[co] = nil
        coroutine.resume(co);
    end
end

---@param callback function
function ThreadManager:register(callback)
    local id = #self.threads + 1
    self.threads[id] = coroutine.create(callback);
    coroutine.resume(self.threads[id]);
end

---Waiting in a coroutine
---@param ms number
---@return void
function ThreadManager:wait(ms)
    local co = coroutine.running()
    assert(co ~= nil, "Cannot wait on main thread")
    local timeToWait = self:getTime() + ms
    self.waiting_coroutines[co] = timeToWait
    return coroutine.yield(co);
end

jShared.utils.thread = ThreadManager:new();