removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A' .. 'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

factorial :: Integer -> Integer --Integer can be very big! {- block comment -}
factorial n = product [1..n]

fibonacci :: Integer -> [Integer]
fibonacci 0 = []
fibonacci 1 = [1]
fibonacci 2 = (fibonacci 1 )++[1]
fibonacci n = fibonacci (n-1) ++ [last (fibonacci (n-1)) + last (fibonacci (n-2))] 

fibonacci2 :: [Integer]
fibonacci2 = f 0 1
  where
    f :: Integer -> Integer -> [Integer]
    f x y = x : f y (x + y)

unfoldr :: (b -> Maybe (a, b)) -> b -> [a]
unfoldr g b = case g b of Nothing      -> []
                          Just (a, b') -> a : unfoldr g b'

fibonacci3 :: [Integer]
fibonacci3 = unfoldr (\(x, y) -> Just (x, (y, x+y))) (0, 1)

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

circumference :: Float -> Float
circumference r = 2 * pi * r

circumference' :: Double -> Double
circumference' r = 2 * pi * r
