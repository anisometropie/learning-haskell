import           Control.Monad (when)
import           System.Random
import           Text.Read

main :: IO ()
main = do
  number <- makeRandomNumber
  putStrLn "What’s the number?"
  guessLoop number

guessLoop :: Int -> IO ()
guessLoop number = do
  line <- getLine
  let guess = readMaybe line
  let state = checkAnswer number guess
  putStrLn state
  when (state /= "Correct") $ guessLoop number

checkAnswer :: Int -> Maybe Int -> String
checkAnswer _ Nothing = "Not a number"
checkAnswer number (Just guess)
  | guess < number = "Too small"
  | guess > number = "Too big"
  | otherwise = "Correct"

makeRandomNumber :: IO Int
makeRandomNumber = do
  gen <- getStdGen
  let (number, gen2) = randomR (1, 100) gen :: (Int, StdGen)
  return number
