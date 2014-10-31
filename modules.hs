{-# OPTIONS -XBangPatterns #-}

import Data.List
import Data.Char
import Data.Function
import qualified Data.Map as Map
import qualified Data.Set as Set

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

calcPolyNomials :: (Num a) => [[a]] -> [a]
calcPolyNomials = map sum . transpose

concatMap' :: (a -> [b]) -> [a] -> [b]
concatMap' f = concat . map f

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs)
    | x == False = False
    | x == True  = and' xs

or' :: [Bool] -> Bool
or' [] = False
or' (x:xs)
    | x == False = or' xs
    | x == True  = True 

any' :: (a -> Bool) -> [a] -> Bool
any' f = or . map f

all' :: (a -> Bool) -> [a] -> Bool
all' f = and . map f

iterate' :: (a -> a) -> a -> [a]
iterate' f x = x : iterate' f (f x)

splitAt' :: Int -> [a] -> ([a],[a])
splitAt' _ []   = ([],[])
splitAt' n (x:xs)
    | n <= 0    = ([],(x:xs))
    | otherwise = let (a, b) = splitAt' (n-1) xs in ((x:a),b) 

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' f (x:xs)
    | f x       = x : takeWhile' f xs
    | otherwise = []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f (x:xs)
    | f x       = dropWhile' f xs
    | otherwise = x:xs

span' :: (a -> Bool) -> [a] -> ([a],[a])
span' _ [] = ([],[])
span' f xs = (takeWhile' f xs, dropWhile' f xs)

break' :: (a -> Bool) -> [a] -> ([a],[a])
break' p = span (not . p)

sort' :: (Ord a) => [a] -> [a]
sort' [] = []
sort' (x:xs) = let (smaller,larger) = partition (<= x) xs
               in sort' smaller ++ [x] ++ sort' larger

partition' :: (Ord a) => a -> [a] -> [a] -> [a] -> [a] -> [a]
partition' x []     !ls !rs !zs = sort'' ls (x : sort'' rs zs)
partition' x (y:ys) !ls !rs !zs | y <= x    = partition' x ys (y:ls) rs zs
                                | otherwise = partition' x ys ls (y:rs) zs

sort'' :: (Ord a) => [a] -> [a] -> [a]
sort'' []     !zs = zs
sort'' (x:xs) !zs = partition' x xs [] [] zs

qsort3 :: Ord a => [a] -> [a]
qsort3 x = qsort3' x []

qsort3' [] y     = y
qsort3' [x] y    = x:y
qsort3' (x:xs) y = part xs [] [x] []  
  where
    part [] l e g = qsort3' l (e ++ (qsort3' g y))
    part (z:zs) l e g 
      | z > x     = part zs l e (z:g) 
      | z < x     = part zs (z:l) e g 
      | otherwise = part zs l (z:e) g

main :: IO ()
main = print (qsort3 ([5001..10000] ++ [1..5000]))

group' :: (Eq a) => [a] -> [[a]]
group' [] = [[]] 
group' (x:xs) = (x:ys):group' zs
                where (ys,zs) = span (== x) xs

inits' :: [a] -> [[a]]
inits' = reverse.f
    where f [] = [[]] 
          f xs = xs:(f$init xs)

tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' xs = xs:(tails'$tail xs)

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack = 
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

words' :: [Char] -> [[Char]]
words' = filter (not . any isSpace) . groupBy ((==) `on` isSpace)

encode :: Int -> String -> String
encode shift msg = 
    let ords = map ord msg
        shifted = map (+ shift) ords
    in map chr shifted

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg 

phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ] 

phoneBook2 =   
    [("betty","555-2938")  
    ,("betty","342-2492")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("patsy","943-2929")  
    ,("patsy","827-9162")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ,("penny","555-2111")  
    ] 

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty

phoneBookToMap :: (Ord k) => [(k,a)] -> Map.Map k [a]
phoneBookToMap xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

set1 = Set.fromList text1
set2 = Set.fromList text2

setNub xs = Set.toList $ Set.fromList xs
