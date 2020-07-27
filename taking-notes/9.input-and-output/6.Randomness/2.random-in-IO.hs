import           Control.Monad (when)
import           System.Random

-- getStdGen :: IO StdGen
main = do
  gen <- getStdGen
  putStrLn $ take 20 (randomRs ('a', 'z') gen )
  gen2 <- newStdGen
  putStrLn $ take 20 (randomRs ('a', 'z') gen2 )

-- running getStdGen twice will ask the system for the same generator
