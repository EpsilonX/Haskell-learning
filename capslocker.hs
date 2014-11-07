import Data.Char

{-
main = do
    contents <- getContents
    putStr (map toUpper contents)
-} 
-- main = interact $ unlines . filter ((<10) . length) . lines

respondPalindromes = unlines . map (\xs ->
    if isPalindrome xs then "palindrome" else  "not a palindrome") . lines
        where isPalindrome xs = xs == reverse xs

main = interact respondPalindromes
