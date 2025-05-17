Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp"

$portvalue = 3389
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "PortNumber" -Value $portvalue
New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $portvalue
New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Public' -Direction Inbound -Action Allow -Protocol UDP -LocalPort $portvalue
New-NetFirewallRule -DisplayName 'RDPPORTLatest-TCP-In' -Profile 'Private' -Direction Inbound -Action Allow -Protocol TCP -LocalPort $portvalue
New-NetFirewallRule -DisplayName 'RDPPORTLatest-UDP-In' -Profile 'Private' -Direction Inbound -Action Allow -Protocol UDP -LocalPort $portvalue
Restart-Service -Name TermService -Force
