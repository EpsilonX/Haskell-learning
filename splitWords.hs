splitWords :: String -> [String]
splitWords xs = let (fw,rest) = span (/=' ') xs
                in filter (/="") $ if (rest /= "") then fw:splitWords (tail rest) else [fw]
