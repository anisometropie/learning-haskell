import           Test.Hspec
import qualified Time       as T

main :: IO ()
main = hspec $ do
  describe "parseInts" $ do
    it "convert to 24h time" $ do
      T.convertTime "12:00:00AM" `shouldBe` "00:00:00"
      T.convertTime "12:00:01AM" `shouldBe` "00:00:01"
      T.convertTime "01:00:00AM" `shouldBe` "01:00:00"
      T.convertTime "02:00:00AM" `shouldBe` "02:00:00"
      T.convertTime "12:00:00PM" `shouldBe` "12:00:00"
      T.convertTime "01:00:00PM" `shouldBe` "13:00:00"
