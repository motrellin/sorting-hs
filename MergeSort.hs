module MergeSort where

divide :: [a] -> ([a], [a])
divide [] = ([], [])
divide [x] = ([x], [])
divide (x:y:zs) = (x:xs, y:ys)
	where (xs, ys) = divide zs

merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs') (y:ys') | x <= y = x : merge xs' (y:ys')
		      | otherwise = y : merge (x:xs') ys'

mergeSort :: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs = merge (mergeSort ys) (mergeSort zs)
	where (ys, zs) = divide xs
