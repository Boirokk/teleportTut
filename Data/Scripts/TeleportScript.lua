local startTeleport = script:GetCustomProperty("StartFX")
local endTeleport = script:GetCustomProperty("EndFX")
local finalPosition = script:GetCustomProperty("FinalPosition"):WaitForObject()
local hideFinalPosition = script:GetCustomProperty("HideFinalPosition")


local trigger = script.parent

if hideFinalPosition then
    finalPosition.visibility = Visibility.FORCE_OFF
end

function OnBeginOverlap(theTrigger, player)
    if player:IsA("Player") then
        Task.Wait(.2)
        World.SpawnAsset(startTeleport, {position = player:GetWorldPosition() - Vector3.New(0,0,98)})
        player.isMovementEnabled = false
        Task.Wait(2.3)
        
        player:SetWorldPosition(finalPosition:GetWorldPosition()  + Vector3.New(0,0,98))

        World.SpawnAsset(endTeleport, {position = finalPosition:GetWorldPosition()})
    
        Task.Wait(2.4)
        player.isMovementEnabled = true
    end

end



trigger.beginOverlapEvent:Connect(OnBeginOverlap)