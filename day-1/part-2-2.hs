main = do
    file <- readFile "input"
    let linesStr = lines file
    let formattedLines = map formatLines linesStr
    validateFrequency formattedLines formattedLines 0 [0]

formatLines :: String -> Int
formatLines line = do
    let value = dropWhile (== '+') line
    read value :: Int

validateFrequency :: [Int] -> [Int] -> Int -> [Int] -> IO ()
validateFrequency fl [] rf rfs     = validateFrequency fl fl rf rfs
validateFrequency fl (x:xs) rf rfs = do
    let currentFrequency = rf + x
    if currentFrequency `elem` rfs then
        putStrLn . show $ currentFrequency
    else
        validateFrequency fl xs currentFrequency (rfs ++ [currentFrequency])
