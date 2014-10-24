{-# OPTIONS -XMultiParamTypeClasses -XFlexibleInstances #-}

class Stack s a where
    push :: a -> s -> s
    pop  :: s -> Maybe s
    top  :: s -> Maybe a

instance Stack [a] a where
    push = (:)

    pop []     = Nothing
    pop (_:xs) = Just xs

    top []    = Nothing
    top (x:_) = Just x

class Queue q a where
    push  :: a -> q -> q
    pop   :: q -> Maybe q
    front :: q -> Maybe a

normalise :: ([a], [a]) -> ([a], [a])
normalise (xs, ys) | not (null xs) && null ys = ([], reverse xs)
                   | otherwise                = (xs, ys)

instance Queue ([a],[a]) a where
    push x (xs, ys) = normalise (x:xs, ys)

    pop (xs, []  ) = Nothing
    pop (xs, y:ys) = normalise (xs, ys)

    front (xs, [] ) = Nothing
    front (xs, y:ys) = Just y
