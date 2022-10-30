_G.Hoopz = false
_G.PrisonLife = false
if game.PlaceId == 155615604 then
	_G.PrisonLife = true
end
if _G.PrisonLife == true then
	local Library =
		loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("PL Hub (Prison Life)", "DarkTheme")

	-- MAIN
	local Main = Window:NewTab("Main")
	local MainSection = Main:NewSection("Main")
	MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", { "M9", "Remington 870", "AK-47" }, function(v)
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
		local Event = game:GetService("Workspace").Remote.ItemHandler
		Event:InvokeServer(A_1)
	end)

	MainSection:NewButton("Chat Bypasser (13+)", "Bypasses chat", function()
		print("Clicked")
		getgenv().method = "fn"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser", true))()
	end)

	MainSection:NewDropdown("Gun Mod", "Makes the gun op", { "M9", "Remington 870", "AK-47" }, function(v)
		local module = nil
		if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
			module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
		elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
			module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
		end
		if module ~= nil then
			module["MaxAmmo"] = math.huge
			module["CurrentAmmo"] = math.huge
			module["StoredAmmo"] = math.huge
		end
	end)

	MainSection:NewButton("Teleport to crim base", "Teleports you to criminal base", function(v)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
			-919.577148,
			95.327179,
			2130.32495,
			-0.0693258122,
			1.40396983e-08,
			0.997594059,
			1.61146865e-08,
			1,
			-1.29537003e-08,
			-0.997594059,
			1.51778892e-08,
			-0.0693258122
		)
	end)

	MainSection:NewButton("Aimbot (Press right mouse button", "Locks on to people", function(v)
		--> variables
		local UIS = game:GetService("UserInputService")
		local camera = game.Workspace.CurrentCamera
		--> getting the closest player
		function getClosest()
			local closestPlayer = nil
			local closesDist = math.huge
			for i, v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
					local Dist = (
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						- v.Character.HumanoidRootPart.Position
					).Magnitude
					if Dist < closesDist then
						closesDist = Dist
						closestPlayer = v
					end
				end
			end
			return closestPlayer
		end

		--> starting the aimbot
		_G.aim = false
		UIS.InputBegan:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton2 then
				_G.aim = true
				while task.wait() do
					camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)
					if _G.aim == false then
						return
					end
				end
			end
		end)
		--> ending the aimbot
		UIS.InputEnded:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton2 then
				_G.aim = false
			end
		end)
	end)

	MainSection:NewButton("ESP Gui", "Opens a ESP Gui", function(v)
		loadstring(game:HttpGet("https://pastebin.com/raw/T1Bn4Rue", true))()
	end)
    
    MainSection:NewButton("Destroy Prison Cells (Client sided)", "Destroys prison cells", function()
        game.Workspace.Prison_Cellblock.Cells_B:Destroy()
        game.Workspace.Prison_Cellblock.Cells_A:Destroy()
    end)    
  
	-- PLAYER
	local Player = Window:NewTab("Player")
	local PlayerSection = Player:NewSection("Player")
	PlayerSection:NewSlider("WalkSpeed", "Changes the walkspeed", 500, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	PlayerSection:NewSlider("Jump Power", "Changes the jump power", 500, 0, function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)

	PlayerSection:NewSlider("FOV", "Changes Fov", 120, 0, function(v) -- 500 (MaxValue) | 0 (MinValue)
		game.Workspace.CurrentCamera.FieldOfView = v
	end)

	PlayerSection:NewButton("Reset WS/JP/FOV", "Resets your walkspeed and jumppower and FOV", function(v)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		game.Workspace.CurrentCamera.FieldOfView = 60
	end)
	-- EXTRA
	local Credits = Window:NewTab("Credits")
	local CreditsSection = Credits:NewSection("Credits")
	CreditsSection:NewButton("Made by ! logan !#0294", "Person who made it", function()
		print("Clicked")
	end)

	-- Infinite Yield
	local InfiniteYield = Window:NewTab("InfiniteYield")
	local InfiniteYieldSection = InfiniteYield:NewSection("InfiniteYield")
	InfiniteYieldSection:NewButton("Infinite Yield", "Loads infinite yield", function(x)
		print("Clicked")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end)
end

_G.Arsenal = false
if game.PlaceId == 286090429 then
	_G.Arsenal = true
end
if _G.Arsenal == true then
	local Library =
		loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("PL Hub", "DarkTheme")

	local Main = Window:NewTab("Main")
	local Section = Main:NewSection("Main")
	Section:NewButton("Aimbot (Press right mouse button", "Locks on to people", function(v)
		--> variables
		local UIS = game:GetService("UserInputService")
		local camera = game.Workspace.CurrentCamera
		--> getting the closest player
		function getClosest()
			local closestPlayer = nil
			local closesDist = math.huge
			for i, v in pairs(game.Players:GetPlayers()) do
				if v ~= game.Players.LocalPlayer and v.Team ~= game.Players.LocalPlayer.Team then
					local Dist = (
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						- v.Character.HumanoidRootPart.Position
					).Magnitude
					if Dist < closesDist then
						closesDist = Dist
						closestPlayer = v
					end
				end
			end
			return closestPlayer
		end

		--> starting the aimbot
		_G.aim = false
		UIS.InputBegan:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton2 then
				_G.aim = true
				while wait() do
					camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Character.Head.Position)
					if _G.aim == false then
						return
					end
				end
			end
		end)
		--> ending the aimbot
		UIS.InputEnded:Connect(function(inp)
			if inp.UserInputType == Enum.UserInputType.MouseButton2 then
				_G.aim = false
			end
		end)
	end)

	local Visuals = Window:NewTab("Visuals")
	local Section = Visuals:NewSection("Visuals")
	Section:NewButton("ESP Gui (Look in bottom right corner if u press it)", "opens a ESP GUI", function(v)
		loadstring(game:HttpGet("https://pastebin.com/raw/T1Bn4Rue", true))()
	end)
end

_G.BubbleGumSimulator = false
if game.PlaceId == 2512643572 then
	_G.BubbleGumSimulator = true
end
if _G.BubbleGumSimulator == true then
	local Library =
		loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("PL Hub", "DarkTheme")

	local Toggles = { -- Put your toggles in here, looks better
		GumFarm = false,
		AutoSell = false,
	}
	local Event = game.ReplicatedStorage.NetworkRemoteEvent

	local Main = Window:NewTab("Main")
	local Section = Main:NewSection("Main")
	Section:NewToggle("Auto Blow", "ToggleInfo", function(bool)
		Toggles.GumFarm = bool
	end)
	Section:NewToggle("Auto Sell", "ToggleInfo", function(bool)
		Toggles.AutoSell = bool
	end)

	task.spawn(function()
		while true do
			task.wait()
			if Toggles.GumFarm then
				Event:FireServer("BlowBubble")
			end
		end
	end)

	task.spawn(function()
		while true do
			task.wait()
			if Toggles.AutoSell then
				Event:FireServer("SellBubble", "Sell")
			end
		end
	end)
end
