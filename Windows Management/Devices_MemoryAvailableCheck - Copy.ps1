$Devices = Get-Content "C:\Dev\Scripts\Devices.txt"

 
#$Report = @()
 
#Looping each server
Foreach($Device in $Devices)
{
    #Write-Host "Processing $Device" -ForegroundColor Green
    
    $DeviceInfo = Get-CIMInstance Win32_OperatingSystem 

    $DeviceName = $DeviceInfo.CSName
    $DeviceTotalVisibleMemorySize = [math]::Round((($DeviceInfo.TotalVisibleMemorySize*1024)/1GB),2)
    $DeviceFreePhysicalMemory = [math]::Round((($DeviceInfo.FreePhysicalMemory*1024)/1GB),2)
    $DeviceFree = $DeviceFreePhysicalMemory/$DeviceTotalVisibleMemorySize
    $DevicePCTFree = $DeviceFree.tostring("P")
    
    If ($DevicePCTFree -ge 45) 
    {
        $MemoryStatus = "OK"
    }
            ElseIf ($DevicePCTFree -ge 15) 
            {
            $MemoryStatus = "Warning"
            }
            Else 
            {
            $MemoryStatus = "Critical"
            } 

    

    # Creating custom object
  <#  $Object = New-Object PSCustomObject

    $Object | Add-Member -MemberType NoteProperty -Name "Device name" -Value $Device
    $Object | Add-Member -MemberType NoteProperty -Name "Total Memory" -Value $DeviceTotalVisibleMemorySize
    $Object | Add-Member -MemberType NoteProperty -Name "Free Memory" -Value $DeviceFreePhysicalMemory
    $Object | Add-Member -MemberType NoteProperty -Name "Memory % Free" -Value $DevicePCTFree
    $Object | Add-Member -MemberType NoteProperty -Name "Memory Status" -Value $MemoryStatus
    $Object  
    $Report += $Object

  #>
  write-Host "Device name" $DeviceName
  write-Host "Total Memory" $DeviceTotalVisibleMemorySize
  write-Host "Free Memory" $DeviceFreePhysicalMemory
  write-Host "Memory % Free" $DevicePCTFree
  Write-Host "Memory Status" $MemoryStatus      
} 
 
#Display results
#return $Report
