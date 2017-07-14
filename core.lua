--Writen by Forgent/Zore12345
--TD: write an algorithm to decide when to reset severseconds to 0. Should be based on seconds since last updated and elapsed time (or fps).


SLASH_EXPANDEDSERVERTIME1, SLASH_EXPANDEDSERVERTIME2 = '/showservertime','/stime'
local function slashServerTimeStuff(msg, editbox)
	local hour,minute = GetGameTime();
	print("Current Server Time is "..string.format("%02i:%02i:%02i",hour,minute, math.floor(serverseconds + .5)));
end
SlashCmdList["EXPANDEDSERVERTIME"] = slashServerTimeStuff;

local serverseconds = 0;
local previousminute = 0;
local function onUpdate(self,elapsed)
	serverseconds = serverseconds + elapsed;
	local hour,minute = GetGameTime();
	if serverseconds >= 60 then
		serverseconds = serverseconds - 60;
	end
	--below is a naieve method used to decided if the seconds should be reset to 0.
	if minute > previousminute then
		previousminute = minute;
		if elapsed < 1 then
			serverseconds=0;
		end
	end
end

local onUpdateFrame = CreateFrame("Frame");
onUpdateFrame:SetScript("OnUpdate", onUpdate);
