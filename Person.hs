data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber ::String
                     , flavor :: String
                     } deriving (Eq,Read,Show)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday   
           deriving (Eq, Ord, Show, Read, Bounded, Enum)  

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]

phoneBook :: PhoneBook
phoneBook = [("betty","555-2938")     
             ,("bonnie","452-2928")     
             ,("patsy","493-2928")     
             ,("lucille","205-2928")     
             ,("wendy","939-8282")     
             ,("penny","853-2492")     
             ]  

type AssocList k v = [(k,v)]

data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)  
