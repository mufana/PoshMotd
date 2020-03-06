function Show-ComputerInfo {

    [cmdletbinding()]
    param(
        [switch]$Colorful
    )

    $currentDate = Get-Date
    $osInfo = Get-CimInstance -ClassName Win32_OperatingSystem      
    $processorInfo = Get-CimInstance -ClassName Win32_Processor     
    $logicalDiskInfo = Get-CimInstance -ClassName Win32_LogicalDisk
    
    $os = $($osInfo.Caption)
    $kernel = $($osInfo.Version)
    $upTime = "$($osInfo.LastBootUpTime.Day) days, $($osInfo.LastBootUpTime.Hour) hours, $($osInfo.LastBootUpTime.Minute) minutes"
    $shell = "PowerShell $($PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor)"
    $cpu =  $($processorInfo.Name -replace '\(C\)', '' -replace '\(R\)', '' -replace '\(TM\)', '' -replace 'CPU', '' -replace '\s+', ' ')
    $cores = $($processorInfo.NumberOfCores)
    $memory = $("{0}mb of {1}mb Used" -f (([math]::round($osInfo.TotalVisibleMemorySize/1KB))-([math]::round($osInfo.FreePhysicalMemory/1KB))),([math]::round($osInfo.TotalVisibleMemorySize/1KB)))
    $load = "$($processorInfo.LoadPercentage)%"

    if ($Colorful){
        Write-Host -Object ("") 
        Write-Host -Object ("") 
        Write-Host -Object ("         ,.=:^!^!t3Z3z.                  ") -ForegroundColor Red 
        Write-Host -Object ("        :tt:::tt333EE3                    ") -ForegroundColor Red 
        Write-Host -Object ("        Et:::ztt33EEE ") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" @Ee.,      ..,     ${Get_Date}") -ForegroundColor Green 
        Write-Host -Object ("       ;tt:::tt333EE7") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" ;EEEEEEttttt33#     ") -ForegroundColor Green 
        Write-Host -Object ("      :Et:::zt333EEQ.") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" SEEEEEttttt33QL     ") -NoNewline -ForegroundColor Green 

        Write-Host -Object ("User: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $env:USERNAME -ForegroundColor Cyan

        Write-Host -Object ("      it::::tt333EEF") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" @EEEEEEttttt33F      ") -NoNewline -ForeGroundColor Green
         
        Write-Host -Object ("Computer: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $env:COMPUTERNAME -ForegroundColor Cyan

        Write-Host -Object ("     ;3=*^``````'*4EEV") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" :EEEEEEttttt33@.      ") -NoNewline -ForegroundColor Green
      
        Write-Host -Object ("OS: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $os -ForegroundColor Cyan

        Write-Host -Object ("     ,.=::::it=., ") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object ("``") -NoNewline -ForegroundColor Red 
        Write-Host -Object (" @EEEEEEtttz33QF       ") -NoNewline -ForegroundColor Green 

        Write-Host -Object ("OS Build: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $kernel -ForegroundColor Cyan

        Write-Host -Object ("    ;::::::::zt33) ") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object ("  '4EEEtttji3P*        ") -NoNewline -ForegroundColor Green 

        Write-Host -Object ("Uptime: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $upTime -ForegroundColor Cyan

        Write-Host -Object ("   :t::::::::tt33.") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (":Z3z.. ") -NoNewline -ForegroundColor Yellow 
        Write-Host -Object (" ````") -NoNewline -ForegroundColor Green 
        Write-Host -Object (" ,..g.        ") -NoNewline -ForegroundColor Yellow 

        Write-Host -Object ("Shell: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $shell -ForegroundColor Cyan

        Write-Host -Object ("   i::::::::zt33F") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (" AEEEtttt::::ztF         ") -NoNewline -ForegroundColor Yellow 

        Write-Host -Object ("CPU: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $cpu -ForegroundColor Cyan

        Write-Host -Object ("  ;:::::::::t33V") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (" ;EEEttttt::::t3          ") -NoNewline -ForegroundColor Yellow 

        Write-Host -Object ("CPU Cores: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $cores -ForegroundColor Cyan

        Write-Host -Object ("  E::::::::zt33L") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (" @EEEtttt::::z3F          ") -NoNewline -ForegroundColor Yellow 

        Write-Host -Object ("Memory: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $memory -ForegroundColor Cyan

        Write-Host -Object (" {3=*^``````'*4E3)") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (" ;EEEtttt:::::tZ``          ") -NoNewline -ForegroundColor Yellow 

        Write-Host -Object ("Current Load: ") -NoNewline -ForegroundColor Red
        Write-Host -Object $load -ForegroundColor Cyan

        Write-Host -Object ("             ``") -NoNewline -ForegroundColor Cyan 
        Write-Host -Object (" :EEEEtttt::::z7") -NoNewline -ForegroundColor Yellow
        Write-Host -Object ("              ") -ForegroundColor Yellow  
        Write-Host -Object ("                 'VEzjt:;;z>*``") -NoNewline -ForegroundColor Yellow 
        Write-Host -Object ("") -ForegroundColor Yellow 
        Write-Host -Object ("") 

    }
    else{
        $motdInfo = [PSCustomObject]@{
        "User" = $env:USERNAME
        "Computer" = $env:COMPUTERNAME
        "OS" = $os
        "OS build" = $kernel
        "Uptime" = $upTime
        "Shell" = $shell
        "CPU" = $cpu
        "CPU Cores" = $cores
        "Memory" = $memory
        "Current Load" = $load
        }
        
        Write-Output $motdInfo
    }
}