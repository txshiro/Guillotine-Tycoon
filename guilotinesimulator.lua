--SHOUTOUT TO bloodball FOR CREATING WIZARD UI

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local simulator = Library:NewWindow("Guillotine Tycoon", "#19cf83", 9160626035)

local main = simulator:NewSection("Farm")

getgenv().headsFarm = false
getgenv().superprizeFarm = false
getgenv().autodeposit = false
getgenv().nextguillotine = false
getgenv().pertick = false

plr = game.Players.Locaplrlayer
plot = nil

for _,v in pairs(workspace.Plots:GetChildren()) do
    if v.OwnerId.Value == plr.UserId then
        plot = v 
    end
end

main:CreateToggle("Heads",function(bool)
    getgenv().headsFarm = bool
    if bool then
        headsFarm();
    end
end)

main:CreateToggle("Super Prize",function(bool)
    getgenv().superprizeFarm = bool
    if bool then
        superprizeFarm();
    end
end)

main:CreateToggle("Auto Deposit",function(bool)
    getgenv().autodeposit = bool
    if bool then
        autodeposit();
    end
end)

main:CreateToggle("Auto-Buy Guillotine",function(bool)
    getgenv().nextguillotine = bool
    if bool then
        nextguillotine();
    end
end)

main:CreateToggle("Auto-Buy ticks",function(bool)
    getgenv().pertick = bool
    if bool then
        pertick();
    end
end)



function FTI(parent)
    firetouchinterest(plr.Character:WaitForChild("HumanoidRootPart"), parent, 0)
    firetouchinterest(plr.Character:WaitForChild("HumanoidRootPart"), parent, 1)
end

function headsFarm()

    spawn(function()
        while getgenv().headsFarm == true do 
            for _,v in pairs(plot.Heads:GetChildren()) do
                if v:FindFirstChild("Part") then
                    v.Part.CanCollide = false
                    v.CFrame = plr.Character:WaitForChild("HumanoidRootPart").CFrame
                end
                wait()

            end
            wait()
        end
    end)
end

function autodeposit()
    spawn(function()
        while getgenv().autodeposit == true do 
            FTI(plot.DepositStep)
            wait()
        end
    end)
end

function nextguillotine()
    spawn(function()
        while getgenv().nextguillotine == true do 
            FTI(plot.PurchaseButton)
            wait()
        end
    end)
end


function superprizeFarm() 
    spawn(function()
        while getgenv().superprizeFarm == true do 
            while wait() do
                 if plot:FindFirstChild("SuperPrize") then FTI(plot.SuperPrize:WaitForChild("TouchPart")) end 
            end
            wait()
        end
    end)
end


function pertick()
    spawn(function()
        while getgenv().pertick == true do 
            FTI(plot.IncreaseTick)
            wait()
        end
    end)
end


