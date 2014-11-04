import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookUp :: Int -> LockerMap -> Either String Code
lockerLookUp lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing           -> Left $ "Locker number" ++ show lockerNumber ++ "doesn't exist!"
        Just (state,code) ->  if state /= Taken
                                 then Right code
                                 else Left $ "Locker " ++  show lockerNumber ++ "iss already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))  
    ,(101,(Free,"JAH3I"))  
    ,(103,(Free,"IQSA9"))  
    ,(105,(Free,"QOTSA"))  
    ,(109,(Taken,"893JJ"))  
    ,(110,(Taken,"99292"))  
    ]  

infixr 5 :-:
data List a = Empty | a :-: (List a)  deriving (Show,Read,Eq,Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)
