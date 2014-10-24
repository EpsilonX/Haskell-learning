maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)
{-    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs -}

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' i a
    | i <= 0    = []
    | otherwise = a:replicate' (i-1) a 

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [a] -> [(a,a)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' a []     = False
elem' a (x:xs) = if (a == x) then True
                 else elem' a xs
{- elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs -}

-- Classic QuickSort!
quicksort :: (Ord a) => [a] -> [a]
quicksort []     = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs , a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted
