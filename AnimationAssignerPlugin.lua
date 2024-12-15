-- Create the plugin toolbar
local toolbar = plugin:CreateToolbar("Animation Assigner")

-- Create a toggle button with an icon
local toggleButton = toolbar:CreateButton(
	"ToggleUI",
	"Open the Animation Assigner GUI",
	"rbxassetid://92450429519659" -- Replace with your asset ID
)

-- Define DockWidget settings
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Left, -- Snap to the left by default
	true, -- Initially hidden
	false, -- Do not override previous state
	400, -- Default width
	200, -- Default height
	300, -- Minimum width
	200 -- Minimum height
)

-- Create the DockWidget GUI
local gui = plugin:CreateDockWidgetPluginGui("AnimationAssigner", widgetInfo)
gui.Title = "Animation Assigner"
gui.Enabled = false -- Initially hidden

-- Main frame (persistent container for all UI elements)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

-- Add header for branding
local header = Instance.new("TextLabel", frame)
header.Size = UDim2.new(1, 0, 0, 50)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
header.BorderSizePixel = 0
header.Text = "Animation Assigner"
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.Font = Enum.Font.SourceSansBold
header.TextSize = 20

-- Add subtitle (creator name)
local subHeader = Instance.new("TextLabel", frame)
subHeader.Size = UDim2.new(1, 0, 0, 20)
subHeader.Position = UDim2.new(0, 0, 0, 50)
subHeader.BackgroundTransparency = 1
subHeader.Text = "Made By - BigH"
subHeader.TextColor3 = Color3.fromRGB(180, 180, 180)
subHeader.Font = Enum.Font.SourceSansItalic
subHeader.TextSize = 16
subHeader.TextXAlignment = Enum.TextXAlignment.Center

-- Add logo to the header (optional)
local logo = Instance.new("ImageLabel", header)
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 5, 0, 5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://92450429519659" -- Replace with your asset ID

-- Animations Folder Text
local animationsLabel = Instance.new("TextLabel", frame)
animationsLabel.Size = UDim2.new(0.8, 0, 0, 30)
animationsLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
animationsLabel.BackgroundTransparency = 1
animationsLabel.Text = "Animations Folder: None selected"
animationsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
animationsLabel.Font = Enum.Font.SourceSans
animationsLabel.TextSize = 16
animationsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Select Animations Button
local selectAnimationsButton = Instance.new("TextButton", frame)
selectAnimationsButton.Size = UDim2.new(0.8, 0, 0, 40)
selectAnimationsButton.Position = UDim2.new(0.1, 0, 0.25, 0)
selectAnimationsButton.Text = "Select Animations Folder"
selectAnimationsButton.Font = Enum.Font.SourceSans
selectAnimationsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
selectAnimationsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
selectAnimationsButton.TextSize = 16
selectAnimationsButton.AutoButtonColor = true
local UICorner1 = Instance.new("UICorner", selectAnimationsButton)
UICorner1.CornerRadius = UDim.new(0, 6)

-- Rigs Folder Text
local rigsLabel = Instance.new("TextLabel", frame)
rigsLabel.Size = UDim2.new(0.8, 0, 0, 30)
rigsLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
rigsLabel.BackgroundTransparency = 1
rigsLabel.Text = "Rigs Folder: None selected"
rigsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
rigsLabel.Font = Enum.Font.SourceSans
rigsLabel.TextSize = 16
rigsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Select Rigs Button
local selectRigsButton = Instance.new("TextButton", frame)
selectRigsButton.Size = UDim2.new(0.8, 0, 0, 40)
selectRigsButton.Position = UDim2.new(0.1, 0, 0.4, 0)
selectRigsButton.Text = "Select Rigs Folder"
selectRigsButton.Font = Enum.Font.SourceSans
selectRigsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
selectRigsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
selectRigsButton.TextSize = 16
local UICorner2 = Instance.new("UICorner", selectRigsButton)
UICorner2.CornerRadius = UDim.new(0, 6)

-- Create "Add AnimSave" Button (attached to Select Rigs)
local addAnimSaveButton = Instance.new("TextButton", frame)
addAnimSaveButton.Size = UDim2.new(0.8, 0, 0, 40)
addAnimSaveButton.Position = UDim2.new(0.1, 0, 0.46, 0)
addAnimSaveButton.Text = "Add 'animsave' to All Rigs"
addAnimSaveButton.Font = Enum.Font.SourceSans
addAnimSaveButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180) -- Slight blue tint
addAnimSaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addAnimSaveButton.TextSize = 16
addAnimSaveButton.AutoButtonColor = true
addAnimSaveButton.Visible = false -- Initially hidden
local UICorner3 = Instance.new("UICorner", addAnimSaveButton)
UICorner3.CornerRadius = UDim.new(0, 6)

-- Start Button
local startButton = Instance.new("TextButton", frame)
startButton.Size = UDim2.new(0.8, 0, 0, 40)
startButton.Position = UDim2.new(0.1, 0, 0.55, 0)
startButton.Text = "Start Assigning Animations"
startButton.Font = Enum.Font.SourceSans
startButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.TextSize = 16
local UICorner4 = Instance.new("UICorner", startButton)
UICorner4.CornerRadius = UDim.new(0, 6)

-- Completion Label
local completionLabel = Instance.new("TextLabel", frame)
completionLabel.Size = UDim2.new(0.8, 0, 0, 30)
completionLabel.Position = UDim2.new(0.1, 0, 0.7, 0)
completionLabel.BackgroundTransparency = 1
completionLabel.Text = ""
completionLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
completionLabel.Font = Enum.Font.SourceSans
completionLabel.TextSize = 16
completionLabel.TextXAlignment = Enum.TextXAlignment.Left


-- Toggle GUI visibility
toggleButton.Click:Connect(function()
	gui.Enabled = not gui.Enabled
end)



-- Variables to store selected folders
local animationsFolder
local rigsFolder

-- Function to Add "animsave" ObjectValue to All Rigs
local function addAnimSaveToRigs(rigsFolder)
	local rigs = rigsFolder:GetChildren() -- Get all children in the folder
	local addedCount = 0
	local totalRigs = 0
	local allHaveAnimsave = true

	for _, rig in ipairs(rigs) do
		if rig:IsA("Model") then
			totalRigs += 1 -- Count total rigs
			-- Check if "animsave" already exists
			if not rig:FindFirstChild("animsave") then
				allHaveAnimsave = false -- At least one rig doesn't have "animsave"
				local animsave = Instance.new("ObjectValue")
				animsave.Name = "animsave"
				animsave.Parent = rig
				addedCount += 1
			end
		end
	end

	-- Display appropriate message
	if totalRigs == 0 then
		completionLabel.Text = "No rigs found in the selected folder."
	elseif allHaveAnimsave then
		completionLabel.Text = "All rigs already contain 'animsave'."
	elseif addedCount > 0 then
		completionLabel.Text = addedCount .. " 'animsave' ObjectValues have been added to rigs."
	end

	print(completionLabel.Text)
end


-- Show Add "animsave" Button after Rigs Folder Selection
selectRigsButton.MouseButton1Click:Connect(function()
	game:GetService("Selection").SelectionChanged:Connect(function()
		local selection = game:GetService("Selection"):Get()
		if #selection == 1 and selection[1]:IsA("Folder") then
			rigsFolder = selection[1]
			rigsLabel.Text = "Rigs Folder: " .. rigsFolder.Name
			addAnimSaveButton.Visible = true -- Show the button after folder selection
			print("Rigs Folder Selected: " .. rigsFolder.Name)
		end
	end)
end)

-- Add AnimSave Button Functionality
addAnimSaveButton.MouseButton1Click:Connect(function()
	if rigsFolder then
		addAnimSaveToRigs(rigsFolder)
	else
		completionLabel.Text = "Error: Please select a Rigs Folder first!"
	end
end)

-- Function to update animations label
local function updateAnimationsLabel(folder)
	local count = 0
	for _, child in ipairs(folder:GetChildren()) do
		if child:IsA("KeyframeSequence") then
			count += 1
		end
	end
	animationsLabel.Text = count .. " animations found in folder: " .. folder.Name
end

-- Function to update rigs label
local function updateRigsLabel(folder)
	local count = 0
	for _, child in ipairs(folder:GetChildren()) do
		if child:FindFirstChild("animsave") then
			count += 1
		end
	end
	rigsLabel.Text = count .. " rigs found in folder: " .. folder.Name
end

-- Isolate selection for animations
local animationsConnection
selectAnimationsButton.MouseButton1Click:Connect(function()
	if animationsConnection then
		animationsConnection:Disconnect() -- Disconnect previous selection event
	end
	animationsConnection = game:GetService("Selection").SelectionChanged:Connect(function()
		local selection = game:GetService("Selection"):Get()
		if #selection == 1 and selection[1]:IsA("Folder") then
			animationsFolder = selection[1]
			updateAnimationsLabel(animationsFolder)
			animationsConnection:Disconnect() -- Disconnect after selecting
		end
	end)
end)

-- Isolate selection for rigs
local rigsConnection
selectRigsButton.MouseButton1Click:Connect(function()
	if rigsConnection then
		rigsConnection:Disconnect() -- Disconnect previous selection event
	end
	rigsConnection = game:GetService("Selection").SelectionChanged:Connect(function()
		local selection = game:GetService("Selection"):Get()
		if #selection == 1 and selection[1]:IsA("Folder") then
			rigsFolder = selection[1]
			updateRigsLabel(rigsFolder)
			rigsConnection:Disconnect() -- Disconnect after selecting
		end
	end)
end)

startButton.MouseButton1Click:Connect(function()
	if not animationsFolder then
		completionLabel.Text = "Error: Please select an Animations Folder!"
		return
	end

	if not rigsFolder then
		completionLabel.Text = "Error: Please select a Rigs Folder!"
		return
	end

	-- Gather animations
	local availableAnimations = {}
	for _, child in ipairs(animationsFolder:GetChildren()) do
		if child:IsA("KeyframeSequence") then
			table.insert(availableAnimations, child)
		end
	end
	print("Found " .. #availableAnimations .. " animations in folder: " .. animationsFolder.Name)

	if #availableAnimations == 0 then
		completionLabel.Text = "Error: No animations found in the selected folder!"
		return
	end

	-- Gather rigs
	local rigs = {}
	for _, rig in ipairs(rigsFolder:GetChildren()) do
		if rig:FindFirstChild("animsave") then
			table.insert(rigs, rig)
		else
			warn(rig.Name .. " does not have an animsave folder. Skipping this rig.")
		end
	end
	print("Found " .. #rigs .. " rigs in folder: " .. rigsFolder.Name)

	-- Assign animations to rigs
	local animationsAssigned = 0
	for _, rig in ipairs(rigs) do
		local animSavesFolder = rig:FindFirstChild("animsave")
		if not animSavesFolder then
			continue
		end

		if #availableAnimations == 0 then
			break
		end

		local randomIndex = math.random(1, #availableAnimations)
		local chosenAnimation = table.remove(availableAnimations, randomIndex)

		local newAnim = chosenAnimation:Clone()
		newAnim.Parent = animSavesFolder

		animationsAssigned += 1
		print("Assigned animation '" .. newAnim.Name .. "' to rig: " .. rig.Name)
	end

	-- Completion message
	if #availableAnimations == 0 and animationsAssigned < #rigs then
		completionLabel.Text = "All animations have been assigned, but some rigs did not receive animations."
	else
		completionLabel.Text = "All animations successfully assigned to all rigs."
	end
	print("Completed assigning animations to " .. animationsAssigned .. " rigs.")
end)

