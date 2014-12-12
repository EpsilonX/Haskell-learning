import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
pop = State $ \(x:xs) -> (x,xs)

push :: Int -> State Stack ()
push a = State $ \xs -> ((), a:xs)

stackMainip :: State Stack Int
stackMainip = do
    push 3
    pop
    pop
