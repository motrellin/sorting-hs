module BubbleSort where

bubble :: Ord a => [a] -> [a]
bubble [] = []
bubble [x] = [x]
bubble (x:y:zs) | x <= y = x : bubble (y:zs)
		| otherwise = y : bubble (x:zs)

bubbleSort' :: Ord a => [a] -> Int -> [a]
bubbleSort' xs 0 = xs
bubbleSort' xs n = bubbleSort' (bubble xs) (n - 1)

bubbleSort :: Ord a => [a] -> [a]
bubbleSort xs = bubbleSort' xs (length xs)
