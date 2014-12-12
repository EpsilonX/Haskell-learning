-- Maximum path sum
-- https://projecteuler.net/problem=18

import Control.Applicative
import System.IO
import System.Environment

data Dir = L | R
  deriving Show

data Tree = Leaf Int
          | Node Int Dir Int Tree Tree
  deriving Show

mps :: Tree -> Int
mps (Leaf x        ) = x
mps (Node _ _ x _ _) = x

path :: Tree -> [Dir]
path (Leaf _        ) = []
path (Node _ L _ t u) = L : path t
path (Node _ R _ t u) = R : path u

step :: [Int] -> [Tree] -> [Tree]
step xs ts = zipWith3 f xs ts (tail ts)
  where
    f :: Int -> Tree -> Tree -> Tree
    f x t u = let tm = mps t
                  um = mps u
              in  if tm > um then Node x L (x + tm) t u
                             else Node x R (x + um) t u

foldr1' :: (a -> b -> b) -> (a -> b) -> [a] -> b
foldr1' f g [x]    = g x
foldr1' f g (x:xs) = f x (foldr1' f g xs)

buildTree :: [[Int]] -> Tree
buildTree = head . foldr1' step (map Leaf)

main :: IO ()
main = do
  [arg] <- getArgs
  h <- openFile arg ReadMode
  xss <- map (map read . words) . lines <$> hGetContents h
  print $ mps (buildTree xss)
