import qualified Kangaroo   as K
import           Test.Hspec

-- [x1,v1,x2,v2]
main :: IO ()
main = hspec $ do
  describe "solve" $ do
    it "should return NO if first kangaroo is behind and slower" $ do
      K.solve [0,2,1,3] `shouldBe` "NO"
      K.solve [0,2,1,4] `shouldBe` "NO"
    it "should return NO if second kangaroo is behind and slower" $ do
      K.solve [10,5,1,3] `shouldBe` "NO"
    it "should return NO if they have the same speed but do not start in the same position" $ do
      K.solve [0,2,1,2] `shouldBe` "NO"
    it "should return NO if the one behind overtake the other without meeting in the same position" $ do
      K.solve [5,1,0,10] `shouldBe` "NO"
    it "should return YES if they start on the same position" $ do
      K.solve [5,1,5,100] `shouldBe` "YES"
    it "should return YES if they eventually meet on the same position" $ do
      K.solve [0,3,4,2] `shouldBe` "YES"
