import qualified Apple      as A
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "isOnHouse" $ do
    it "should return true if int is between the bounds" $ do
      A.isOnHouse [0,10] 0 `shouldBe` True
      A.isOnHouse [0,10] 1 `shouldBe` True
      A.isOnHouse [0,10] (-1) `shouldBe` False

  describe "solve" $ do
    it "should return the correct list of int [apples, oranges]" $ do
      A.solve [[7,11],[5,15],[3,2],[-2,2,1],[5,-6]] `shouldBe` [1,1]
