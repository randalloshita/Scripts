###   Author: Randall Oshita
###   Date: 04112023
###   Desc: Status report of Free Memory
###
###   NOTES
###   FreePhysicalMemory
###   Number, in kilobytes, of physical memory currently unused and available.
###   Results are to be expressed in GB from KB, convert to bytes needed.ie., ($_*1024/GB)OR ($_ /MB)
###
###   TotalVisibleMemorySize
###   Total amount, in kilobytes, of physical memory available to the operating system. This value does not necessarily indicate the true amount of physical memory, but what is reported to the operating system as available to it.

$PCInfo = Get-CIMInstance Win32_OperatingSystem 


$PCTotalVisibleMemorySize = $PCInfo.TotalVisibleMemorySize
#$Temp_TVM = ($PCInfo.TotalVisibleMemorySize*1024)/1GB
$PCTotalVisibleMemorySize = [math]::Round((($PCInfo.TotalVisibleMemorySize*1024)/1GB),2)
$PCTotalVisibleMemorySize

#$Temp_FPM = ($PCInfo.FreePhysicalMemory*1024)/1GB
#$PCFreePhysicalMemory = [math]::Round($Temp_FPM,2)
$PCFreePhysicalMemory = [math]::Round((($PCInfo.FreePhysicalMemory*1024)/1GB),2)
$PCFreePhysicalMemory

$PCPCTFree = $PCFreePhysicalMemory/$PCTotalVisibleMemorySize
$PCPCTFree.tostring("P")

