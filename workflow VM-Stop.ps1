workflow VM-Stop
{
    Param(
        [string]$edition
   )
    $Pro_List = ("win10pro1909", "win10pro2004","win10pro20H2", "win10pro21H1")
    $Edu_List = ("win10edu1909", "win10edu2004","win10edu20H2", "win10edu21H1")

    Connect-AzAccount -Identity
    if($edition -eq "pro"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Pro_List)
        {
            Stop-AzVM -ResourceGroupName "win10update" -Name $VM -Force
            Write-Output "$VM Stop."
        }
    }elseif($edition -eq "edu"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Edu_List)
        {
            Stop-AzVM -ResourceGroupName "win10update" -Name $VM -Force
            Write-Output "$VM Stop."
        }
    }
}