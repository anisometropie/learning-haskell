import qualified Breaking   as B
import           Test.Hspec

main :: IO ()
main = hspec $ do
  -- describe "solve" $ do
    -- it "should return all n that are multiple of all a`s and are divisors of all bs" $ do
    --   B.solve [[2],[12]] `shouldBe` [2,4,6,12]

  describe "breakMax" $ do
    it "should return the number of times we had a new max" $ do
      B.breakMax [1,2] `shouldBe` 1
      B.breakMax [1,2,3] `shouldBe` 2

  describe "breakMin" $ do
    it "should return the number of times we had a new min" $ do
      B.breakMin [2,1] `shouldBe` 1
      B.breakMin [3,2,1] `shouldBe` 2
