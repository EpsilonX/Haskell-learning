data CMaybe a = CNothing | CJust Int a deriving (Show)

--Actually this functor disobey the laws of functor : id
instance Functor CMaybe where
    fmap f CNothing = CNothing
    fmap f (CJust counter x) = CJust (counter + 1) (f x)
