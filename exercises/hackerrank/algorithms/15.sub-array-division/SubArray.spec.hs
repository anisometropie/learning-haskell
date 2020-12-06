import qualified SubArray   as S
import           Test.Hspec

main :: IO ()
main =
  hspec $ do
    describe "solve" $ do
      it "should return number of segments summing to d of length m " $ do
        S.solve [[], [1, 1]] `shouldBe` 0
        S.solve [[1], [1, 1]] `shouldBe` 1
        S.solve [[1, 1], [1, 1]] `shouldBe` 2
        S.solve [[1, 1], [2, 2]] `shouldBe` 1
        S.solve [[1, 1, 1, 1], [2, 2]] `shouldBe` 3
    describe "subListsOfLength" $ do
      it "should return all sublists of length l" $ do
        S.subListsOfLength [1, 2] 1 `shouldBe` [[1], [2]]
        S.subListsOfLength [1, 2] 2 `shouldBe` [[1, 2]]
