import qualified Grades     as G
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "roundGrade" $ do
    it "should round the grade" $ do
      G.roundGrade 9 `shouldBe` 9
      G.roundGrade 37 `shouldBe` 37
      G.roundGrade 38 `shouldBe` 40
      G.roundGrade 44 `shouldBe` 45
      G.roundGrade 48 `shouldBe` 50
      G.roundGrade 52 `shouldBe` 52
