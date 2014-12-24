import Control.Monad.State

type Stack = [Int]

pop :: State Stack Int
pop = state $ \(x:xs) -> (x,xs)

push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)

stackMainip :: State Stack Int
stackMainip = do
    push 3
    push 4
    push 5
    pop
