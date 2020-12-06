import qualified PrimeFactors as P
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "breakMax" $ do
    it "should return the number of times we had a new max" $ do
      P.solve 1 `shouldBe` []
      P.solve 2 `shouldBe` [2]
      P.solve 4 `shouldBe` [2,2]
      P.solve 8 `shouldBe` [2,2,2]
      P.solve 16 `shouldBe` [2,2,2,2]
      P.solve 3 `shouldBe` [3]
      P.solve 9 `shouldBe` [3,3]
      P.solve 6 `shouldBe` [2,3]
      P.solve 12 `shouldBe` [2,2,3]
      P.solve 12 `shouldBe` [2,2,3]
      P.solve 1234567890 `shouldBe` [2,3,3,5,3607,3803]
