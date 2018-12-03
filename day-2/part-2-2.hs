import Data.List

main = do
    file <- readFile "input"
    let linesStr = lines file
    getBoxId linesStr linesStr


getBoxId :: [String] -> [String] -> IO ()
getBoxId allLines []     = putStrLn "Nope"
getBoxId allLines (x:xs) = do
    let differences = map (differentChars x) allLines
    let smallestDifference = filter (\x -> (length . snd $ x) == 1) differences
    if (length smallestDifference) == 1 then
        putStrLn . fst . head $ smallestDifference
    else
        getBoxId allLines xs

differentChars :: String -> String -> (String, String)
differentChars str1 str2 = differentChars' str1 str2 "" ""

differentChars' :: String -> String -> String -> String -> (String, String)
differentChars' [] [] goodChars badChars             = (goodChars, badChars)
differentChars' (x1:xs1) (x2:xs2) goodChars badChars =
    if x1 == x2 then
        differentChars' xs1 xs2 (goodChars ++ [x1]) badChars
    else
        differentChars' xs1 xs2 goodChars (badChars ++ [x1])