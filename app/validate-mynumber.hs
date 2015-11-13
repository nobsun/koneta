module Main where

import System.Environment (getArgs)
import MyNumber.Validate (valid)

main :: IO ()
main =  putStrLn . show . valid . head =<< getArgs

