Simple Notes of Learning Haskell
====

By <b>Jeffrey Liu</b>

Contents
---
1. [Basic Typeclass](#-basic-typeclass)
2. [Elegent of Haskell](#-elegant-of-haskell)

## Basic Typeclass

1. Eq
  * == and /=
2. Ord
  * <,>,<=,>=
  * compare :: Ord a => a -> a -> Ordering (LT,GT,EQ)
3. Show
  * It takes a value whose type is a member of Show and presents it to us as a string.
  * ```show "True"```
4. Read
  * The read function takes a string and returns a type which is a member of Read.
  * ```read "4" + 3.8 ```
  *  use **type annotations** to explicitly specify the type <br />
  ```read "5" :: Int```c
  ```read "(3, 'a')" :: (Int, Char) ```
5. Enum
  * Enum members are sequentially ordered types
  * Types in this class: (), Bool, Char, Ordering, Int, Integer, Float and Double.
  * succ, pred
  * ``` ['a' .. 'z']``` ```[LT .. GT]```
6. Bounded
  * Bounded members have an upper and a lower bound.
  * maxBound, minBound
  * All tuples are also part of Bounded if the components are also in it.
7. Num
  * Types in this class: Int, Integer, Float, Double
  * To join Num, a type must already be friends with Show and Eq.
8. Integral
  * Types in this class: Int, Integer
  * Use **fromIntegral** to parse Integral to Num, ```fromIntegral (length [1,2,3,4]) + 3.2```
9. Floating
  * Types in this class: Float, Double

##Elegant of Haskell

1. Fibonacci
```haskell
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
```

2. QuickSort
```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort []     = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs , a <= x]
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted
```
