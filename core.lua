SLASH_SERVERTIME1, SLASH_SERVERTIME2 = '/showservertime','/stime'
local function slashServerTimeStuff(msg, editbox)
	local hour,minute = GetGameTime();
	print("Current Server Time is "..string.format("%02i:%02i:%02i",hour,minute, math.floor(serverseconds + .5)));
end
SlashCmdList["SERVERTIME"] = slashServerTimeStuff;

local serverseconds = 0;
local previousminute = 0;
local function onUpdate(self,elapsed)
	serverseconds = serverseconds + elapsed;
	local hour,minute = GetGameTime();
	if serverseconds >= 60 then
		serverseconds = serverseconds%60;
	end
	if minute > previousminute and elapsed < 1 then
		previousminute = minute;
		serverseconds=0;
	end
end
 
local f = CreateFrame("Frame")
f:SetScript("OnUpdate", onUpdate)