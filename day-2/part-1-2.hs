import Data.List

main = do
    file <- readFile "input"
    let linesStr = lines file
    let formattedLines = map (filter (\x -> (length x) > 1) . group . sort) linesStr
    let numberOfTwos = sum (map (containsNbElem 2) formattedLines)
    let numberOfThrees = sum (map (containsNbElem 3) formattedLines)
    putStrLn . show $ numberOfTwos * numberOfThrees

containsNbElem nb line = (\x -> if x >= 1 then 1 else 0) . length . filter (\x -> (length x) == nb) $ line