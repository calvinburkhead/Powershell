Function Remove-Line{
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory=$True
        )]
        [ValidateScript({Test-Path $_ -PathType Leaf})]
        [Object]
        $Path,
        [Parameter(
            Mandatory=$True
        )]
        [ValidateScript({$_ -ge 0})]
        [Int]
        $LineNumber,
        [Parameter()]
        [Switch]
        $Force
    )

    $confirm = $Force
    $index = $LineNumber - 1
    $fileContent = [System.Collections.Generic.List[System.Object]](Get-Content -Path $Path)

    If (-not $Force){
        $title    = 'Remove Line:'
        $question = $fileContent[$index]
        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
        $confirm = [Bool]($Host.UI.PromptForChoice($title, $question, $choices, 0))
    }
    
    If ($confirm)
    {
        $fileContent.RemoveAt($index)
        Set-Content -Path  $Path -Value ($fileContent)
    }

}