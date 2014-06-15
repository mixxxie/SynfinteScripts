--Script Info--
local Version = "0.01"
local ScriptVersion = "0.01"
local AutoUpdate = true
local Author = "Timii"
local LoadedText = "SynfiniteEzreal"
local ServerData

 --         _____              __ _       _ _       ______                    _         --
 --        / ____|            / _(_)     (_) |     |  ____|                  | |        --
 --       | (___  _   _ _ __ | |_ _ _ __  _| |_ ___| |__   _____ __ ___  __ _| |        --
 --        \___ \| | | | '_ \|  _| | '_ \| | __/ _ \  __| |_  / '__/ _ \/ _` | |        --
 --        ____) | |_| | | | | | | | | | | | ||  __/ |____ / /| | |  __/ (_| | |        --
 --       |_____/ \__, |_| |_|_| |_|_| |_|_|\__\___|______/___|_|  \___|\__,_|_|        --
 --                __/ |                                                                --
 --               |___/                                                                 --
 --  _____ _          ___             _ _           _   ___          _                 
 -- |_   _| |_  ___  | _ \_ _ ___  __| (_)__ _ __ _| | | __|_ ___ __| |___ _ _ ___ _ _  --
 --   | | | ' \/ -_) |  _/ '_/ _ \/ _` | / _` / _` | | | _|\ \ / '_ \ / _ \ '_/ -_) '_| --
 --   |_| |_||_\___| |_| |_| \___/\__,_|_\__, \__,_|_| |___/_\_\ .__/_\___/_| \___|_|   --
 --                                      |___/                 |_|                      --

--Champion--
--if myHero.charName ~= "Ezreal" then return end

--Auto-Update: Thanks to QQQ--
local UPDATE_FILE_PATH = SCRIPT_PATH.."SynfiniteEzreal - The Prodigal Explorer"
local UPDATE_NAME = "SynfiniteEzreal - The Prodigal Explorer"
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/SynfiniteTimii/SynfinteScripts/master/SynfiniteEzreal%20-%20The%20Prodigal%20Explorer.lua?chunk="..math.random(1, 1000)
local UPDATE_FILE_PATH = SCRIPT_PATH.."SynfiniteEzreal - The Prodigal Explorer.lua"
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

--Message Display [AutoUpdate]--
function Messages(MSG) 
	print("<font color=\"#000000\">[</font><font color=\"#FFBF00\">"..LoadedText.."</font><font color=\"#000000\">]</font> "..MSG) 
end

function AUpdate()
	if AutoUpdate then
		ServerData = GetWebResult(UPDATE_HOST, UPDATE_PATH)
		if ServerData then
			local ServerVersion = string.match(ServerData, "ScriptVersion = \"%d.%d%d\"")
			ServerVersion = string.match(ServerVersion and ServerVersion or "", "%d.%d%d")
			if ServerVersion then
				if ScriptVersion ~= ServerVersion then
					Messages("<font color=\"#151515\"> Script is not updated. Current Version: </font> <font color=\"#8A0808\">"..ScriptVersion.."</font> <font color=\"#151515\">Latest Version: </font> <font color=\"#8A0808\">"..ServerVersion.."</font>.")
					Messages("<font color=\"#151515\">Now Updating Script to </font><font color=\"#8A0808\">v."..ServerVersion.."</font><font color=\"#151515\">. Do not press [F9].</font>")
					DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function ()
					Messages("<font color=\"#151515\">Succesfully Updated </font><font color=\"#FFBF00\">"..LoadedText.."</font> <font color=\"#151515\"> to </font><font color=\"#8A0808\">v."..ServerVersion.."</font>.") end) end, 3)
					Messages("<font color=\"#151515\">Please reload the script for changes to take effect.</font>")
				else 
					Messages("<font color=\"#151515\">Your script is already updated to the latest version</font> <font color=\"#8A0808\">v"..ScriptVersion.."</font>")
				end
			end
		else
			Messages("<font color=\"#151515\">An error occured while checking version information.</font>")
		end
	end
end
--End Auto Update--

--OnLoad Function--
function OnLoad()
	AUpdate()
end