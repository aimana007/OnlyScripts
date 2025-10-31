# Read from pipeline/stdin
$input | ForEach-Object {
    $text = $_
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
            # Keep non-letter characters as-is (spaces, punctuation, etc.)
            $result += $char
        }
    }
    
    $result
}
