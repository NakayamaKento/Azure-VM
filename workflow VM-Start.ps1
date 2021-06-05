workflow VM-Start
{
    Param(
        [string]$edition
   )
   #VM list
    $Pro_List = ("win10pro1909", "win10pro2004","win10pro20H2", "win10pro21H1")
    $Edu_List = ("win10edu1909", "win10edu2004","win10edu20H2", "win10edu21H1")

    #log in Azure
    Connect-AzAccount -Identity
    if($edition -eq "pro"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Pro_List)
        {
            Start-AzVM -Name $VM -ResourceGroupName "win10update"
            Write-Output "$VM Start."
        }
    }elseif($edition -eq "edu"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Edu_List)
        {
            Start-AzVM -Name $VM -ResourceGroupName "win10update"
            Write-Output "$VM Start."
        }
    }
}