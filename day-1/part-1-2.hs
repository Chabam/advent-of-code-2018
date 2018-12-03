main = do
    file <- readFile "input"
    let linesStr = lines file
    let formattedLines = map formatLine linesStr
    putStrLn . show . sum $ formattedLines

formatLine :: String -> Int
formatLine line = do
    let value = dropWhile (== '+') line
    read value :: Int