module SelectionSort where

maxList :: Ord a => [a] -> a
maxList [] = error "empty list"
maxList [x] = x
maxList (x:xs)
  | x > m = x
  | otherwise = m
  where m = maxList xs

removeMax :: Ord a => [a] -> [a]
removeMax [] = []
removeMax (x:xs)
  | x == maxList (x:xs) = xs
  | otherwise = x : removeMax xs

selectionSort' :: Ord a => [a] -> [a] -> [a]
selectionSort' [] ys = ys
selectionSort' xs ys = selectionSort' (removeMax xs) ((maxList xs) : ys)

selectionSort :: Ord a => [a] -> [a]
selectionSort xs = selectionSort' xs []
