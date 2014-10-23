doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

conanO'Brien = "It's a-me, Conan O'Brien"

lostNumbers = [4,8,15,16,23,42]

combinedNumbers = [1,2,3,4] ++ [9,10,11,12]

combinedString = 'A' : " SMALL CAT"

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

length' xs = sum[ 1 | _ <- xs]

removeNonUppercase st = [ c | c <- st, c `elem` ['A' .. 'Z']]

zipList = zip [1,2,3,4,5] [5,4,2,1]

rightTriangles = [ (a,b,c) | c <- [1..10],b<-[1..c],a<-[1..b],a^2+b^2 == c^2, a+b+c == 24]
