Function Convert-BytesToHumanReadable
{
    Param(
        [Parameter(Mandatory,ValueFromPipeLine)]
        [Object]
        $BytesToConvert
    )

    $ReturnValue = $null
    If (Test-IsNumber($BytesToConvert)){
        switch ([math]::Truncate(([math]::Log($BytesToConvert) / [math]::Log(1KB))))
        {
            1{$suffixDivisor = 1KB;$suffixDisplay = "KiB";break} # kibibytes 2^10
            2{$suffixDivisor = 1MB;$suffixDisplay = "MiB";break} # mebibytes 2^20
            3{$suffixDivisor = 1GB;$suffixDisplay = "GiB";break} # gibibytes 2^30
            4{$suffixDivisor = 1TB;$suffixDisplay = "TiB";break} # tebibytes 2^40
            5{$suffixDivisor = 1PB;$suffixDisplay = "PiB";break} # pebibytes 2^50
            6{$suffixDivisor = [Math]::Pow(2,60);$suffixDisplay = "EiB";break} # exibyte 2^60
            7{$suffixDivisor = [Math]::Pow(2,70);$suffixDisplay = "ZiB";break} # zebibyte 2^60
            8{$suffixDivisor = [Math]::Pow(2,80);$suffixDisplay = "YiB";break} # yobibyte 2^60
            default {$suffixDivisor = 1;$suffixDisplay = "B";break}
        }
        $ReturnValue = "$([math]::Round($BytesToConvert/$suffixDivisor, 2))$suffixDisplay"
    }

    Return $ReturnValue
}
