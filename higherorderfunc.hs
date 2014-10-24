compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred x = compare 100 x
{- compareWithHundred = compare 100 -}

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A' ..'Z'])

subtractByFour :: (Num a) => a -> a
subtractByFour = (subtract 4) --Cannot use -4

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: ( a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: ( a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x
{- flip' f y x = f x y -}
{- flip' f = \x y -> f y x -}

map' :: ( a -> b ) -> [a] -> [b]
map' _ []     = []
-- map' f (x:xs) = f x : map' f xs
-- map' f xs    = [f x | x <- xs]
map' f xs = foldr' (\x acc -> f x : acc) [] xs

filter' :: ( a -> Bool ) -> [a] -> [a]
filter' _ [] = []
{- filter' p (x:xs)
    | p x       = x : filter' p xs
    | otherwise = filter' p xs -}
filter' p xs = [ x | x <- xs, p x ]
-- filter' p = foldr (\x acc -> if p x then x : acc else acc) []

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort ( filter (<=x) xs)
        biggerSorted  = quicksort ( filter (>x) xs)
    in smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head ( filter p [100000,99999..])
    where p x = x `mod` 3829 == 0

takeWhileExample :: (Integral a) => a
takeWhileExample = sum ( takeWhile (<10000) (filter odd (map (^2) [1..])))

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd  n = n:chain (n*3 + 1)

numLongChains :: Int
{- numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15
-}
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

index' :: [a] -> Int -> a 
index' _ n
    | n < 0       = error "index is negtive!"
index' (x:xs) 0   = x
index' [] _       = error "out of bounds!"
index' (x:xs) n   = index' xs (n-1) 

(!!!) :: [a] -> Int -> a
(!!!) = index'

addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z

sum' :: (Num a) => [a] -> a
-- sum = foldl1 (+)
sum' xs = foldl' (\acc x -> acc + x) 0 xs

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' f n [] = n 
foldl' f n (x:xs) = foldl' f (f n x) xs

--use foldr to define foldl

foldl'' f a bs = foldr (flip(.) . flip(f)) id bs a

-- foldr usually is used to building up new lists from a list
foldr' :: (b -> a -> a) -> a -> [b] -> a
foldr' f n [] = n 
foldr' f n (x:xs) = f x (foldr' f n xs)

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl(\acc x -> if x == y then True else acc) False ys

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

-- special example of using foldl to build a new list
reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []
-- reverse' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

scanl' :: (b -> a -> b) -> b -> [a] -> [b]
scanl' f z [] = [z]
scanl' f z (x:xs) = z : scanl' f (f z x) xs 

scanr' :: (a -> b -> b) -> b -> [a] -> [b]
-- scanr' f z [] = [z]
scanr' f z xs = map (foldr' f z)(tails (xs))
{-
scanr' f z (x:xs) = let ys = scanr' f z xs
                    in f x (head ys):ys 
-}

tails :: [a] -> [[a]]
tails []     = [[]]
tails (x:xs) = (x:xs) : tails xs 

{-
map ($ 3) [(4+),(10*),(^2),sqrt]
map (\f -> f 3) [ ... ]
-}
