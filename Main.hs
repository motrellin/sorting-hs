module Main where

import System.Console.Haskeline

import qualified SelectionSort
import qualified InsertionSort
import qualified MergeSort
import qualified BubbleSort

sort :: [Char] -> ([Int] -> [Int]) -> InputT IO ()
sort name sortFn = do
  outputStrLn ("<" ++ name ++ "> Enter a list of integers to sort.")
  outputStrLn ("<" ++ name ++ "> Example: 1 2 3 4 5\n")
  input <- getInputLine ("<" ++ name ++ "> Enter a list: ")
  case input of
    Nothing -> outputStrLn ("<" ++ name ++ "> Leaving " ++ name ++ ".\n") >> loop
    Just input -> do
      let numbers = map read $ words input
      outputStrLn ("\n----------------------------------------")
      outputStrLn ("<" ++ name ++ "> Sorting: " ++ show numbers)
      outputStrLn ("<" ++ name ++ "> Result: " ++ show (sortFn numbers))
      outputStrLn ("----------------------------------------\n")
      sort name sortFn

presort :: [Char] -> ([Int] -> [Int]) -> InputT IO ()
presort name sortFn = do
  outputStrLn ("\n<" ++ name ++ "> Welcome to " ++ name ++"!\n")
  sort name sortFn

loop :: InputT IO ()
loop = do
  -- Greet the user
  outputStrLn "\n<Start> Welcome to the sorting algorithm comparison tool."
  outputStrLn "<Start> Available algorithms: selection, insertion, merge, bubble.\n"
  algorithm <- getInputLine "<Start> Enter an algorithm: "
  case algorithm of
    Nothing -> outputStrLn "<Start> Goodbye."
    Just "selection" -> presort "Selection Sort" SelectionSort.selectionSort
    Just "insertion" -> presort "Insertion Sort" InsertionSort.insertionSort
    Just "merge" -> presort "Merge Sort" MergeSort.mergeSort
    Just "bubble" -> presort "Bubble Sort" BubbleSort.bubbleSort
    Just input -> outputStrLn ("<Start> Unknown algorithm: " ++ input) >> loop

main :: IO ()
main = runInputT defaultSettings loop
