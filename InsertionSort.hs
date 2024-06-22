module InsertionSort where

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x <= y = x : y : ys
		| otherwise = y : insert x ys

insertionSort' :: Ord a => [a] -> [a] -> [a]
insertionSort' [] ys = ys
insertionSort' (x:xs) ys = insertionSort' xs (insert x ys)

insertionSort :: Ord a => [a] -> [a]
insertionSort xs = insertionSort' xs []

