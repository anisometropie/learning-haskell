import qualified Birthday   as B
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "parseInts" $ do
    it "should return list of Int" $ do
      B.parseInts "1 2 3" `shouldBe` [1,2,3]

  describe "maxElementsCount" $ do
    it "should return the number of elements equal to the max of the list" $ do
      B.maxElementsCount [] `shouldBe` 0
      B.maxElementsCount [1] `shouldBe` 1
      B.maxElementsCount [5] `shouldBe` 1
      B.maxElementsCount [1,2] `shouldBe` 1
      B.maxElementsCount [2,1] `shouldBe` 1
      B.maxElementsCount [2,2] `shouldBe` 2
      B.maxElementsCount [1,2,3] `shouldBe` 1
      B.maxElementsCount [1,3,3] `shouldBe` 2
