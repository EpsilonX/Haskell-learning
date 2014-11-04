Simple Notes of Learning Haskell
====

By <b>Jeffrey Liu</b>

Contents
---
1. [Basic Typeclass](#basic-typeclass)
2. [Elegent of Haskell](#elegant-of-haskell)
3. [Three rules of Lambda Calculus](#three-rules-of-lambda-calculus)
4. [Higher Order Functions](#higher-order-functions)
5. [Type, Kind and Info](#type-kind-and-info)
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

##Three rules of Lambda Calculus

* a variable, x, is itself a valid lambda term
* if t is a lambda term, and x is a variable, then (λx.t) is a lambda term (called a lambda abstraction);
* if t and s are lambda terms, then (ts) is a lambda term (called an application).

##Higher Order Functions

* **Definition**: Haskell functions can take functions as parameters and return functions as return values. A function that does either of those is called a higher order function.
* **Curried functions**:All the functions that accepted several parameters so far have been curried functions.
  <br/>Putting a space between two things is simply **function application**.
  <br/>The space is sort of like an operator and it has the highest precedence.
  <br/> Let's examine the type of max. It's max :: (Ord a) => a -> a -> a.
  <br/>That can also be written as max :: (Ord a) => a -> (a -> a). That could be read as: max takes an a and returns (that's the ->) a function that takes an a and returns an a. That's why the return type and the parameters of functions are all simply separated with arrows.
* **map,filter and folds**
    * map::(a -> b) -> [a] -> [b]
    takes a function and a list and applies that function to every element in the list, producing a new list.
    * filter::(a -> Bool) -> [a] -> [a]
    takes a predicate (a predicate is a function that tells whether something is true or not, so in our case, a function that returns a boolean value) and a list and then returns the list of elements that satisfy the predicate.
    * folds (foldl::(a -> b -> a) -> a -> [b] -> a and foldr::(a -> b -> b) -> b -> [a] -> b): we usually use right folds when we're building up new lists from a list.
    <br/> Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold.

##Type, Kind and Info
1. Type

    use ```:t``` on a value to get its type
2. Kind

    use ```:k``` on a type to get its kind
3. Info

    use ```:info``` on a typeclass to get its instances
