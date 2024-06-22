module Main where

import qualified SelectionSort
import qualified InsertionSort
import qualified MergeSort
import qualified BubbleSort

main :: IO ()
main = do
  putStrLn "Sorting Algorithms"
  putStrLn "=================="
  putStrLn "Unsorted List:"
  print [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  putStrLn "Selection Sort:"
  print $ SelectionSort.selectionSort [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  putStrLn "Insertion Sort:"
  print $ InsertionSort.insertionSort [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  putStrLn "Merge Sort:"
  print $ MergeSort.mergeSort [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  putStrLn "Bubble Sort:"
  print $ BubbleSort.bubbleSort [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
