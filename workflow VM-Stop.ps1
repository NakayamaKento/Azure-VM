workflow VM-Stop
{
    Param(
        [string]$edition
   )
   #VM list
    $vm_List01 = ("VM01", "VM02","VM03", "VM04")
    $vm_List02 = ("VM11", "VM12","VM13", "VM14")

    #log in Azure
    Connect-AzAccount -Identity
    if($edition -eq "list01"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Pro_List)
        {
            Stop-AzVM -ResourceGroupName "resourcegroup" -Name $VM -Force
            Write-Output "$VM Stop."
        }
    }elseif($edition -eq "list02"){
        ForEach -Parallel -ThrottleLimit 4 ($VM in $Edu_List)
        {
            Stop-AzVM -ResourceGroupName "resourcegroup" -Name $VM -Force
            Write-Output "$VM Stop."
        }
    }
}