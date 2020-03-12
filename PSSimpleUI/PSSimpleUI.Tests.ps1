$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
$module = $sut.Replace('ps1', 'psm1')

Import-Module -Name $here/$module -Force 3>$null

Describe "Text Box" {
    Context "Graphical Text Box" {
        It "Display the form in Windows" {
            $formText = "Input a Computer"
            $labelText = "Please input a computer:"
            $formMessage = "Windows PC"
            $msg = Invoke-TextBox $formText $labelText $formMessage 
            ($msg -eq $formMessage) | Should -Be $true
        }
    }
}

Describe "Input Box" {
    Context "Graphical Input Box" {
        It "Display the form in Windows" {
            $formText = "Select a Computer"
            $labelText = "Please select a computer:"
            $formItems = @("Windows PC", "Mac", "Linux PC")
            $msg = Invoke-InputBox $formText $labelText $formItems
            ($msg -eq $formItems[0]) | Should -Be $true
        }
    }
}
