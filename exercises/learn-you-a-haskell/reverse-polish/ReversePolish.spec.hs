-- import qualified SubArray   as S
import ReversePolish
import Test.Hspec

main :: IO ()
main =
  hspec $ do
    describe "solve" $ do
      it "should compute the string" $ do
        solve "10" `shouldBe` 10
        solve "10 4 +" `shouldBe` 14
        solve "10 4 3 + 2 * -" `shouldBe` -4
