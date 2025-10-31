param(
    [Parameter(ValueFromPipeline=$true, ValueFromRemainingArguments=$true)]
    [string[]]$InputText
)
process {
    # Handle both pipeline input and command-line arguments
    $text = if ($InputText) { $InputText -join ' ' } else { $_ }  
    $result = ""
    $letterCount = 0
    for ($i = 0; $i -lt $text.Length; $i++) {
        $char = $text[$i]
        if ($char -match '[a-zA-Z]') {
            if ($letterCount % 2 -eq 0) {
                $result += $char.ToString().ToUpper()
            } else {
                $result += $char.ToString().ToLower()
            }
            $letterCount++
        } else {
            $result += $char
        }
    }
    $result
}
