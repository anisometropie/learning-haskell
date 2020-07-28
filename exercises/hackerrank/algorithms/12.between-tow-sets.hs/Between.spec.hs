import qualified Between    as B
import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "solve" $ do
    it "should return all n that are multiple of all a`s and are divisors of all bs" $ do
      B.solve [[2],[12]] `shouldBe` [2,4,6,12]
      B.solve [[2,6],[24,36]] `shouldBe` [6,12]
      B.solve [[100,99,98,97,96,95,94,93,92,91],[1,2,3,4,5,6,7,8,9,10]] `shouldBe` []

  describe "divisors" $ do
    it "should return common divisors of a list of numbers" $ do
      B.divisors [] `shouldBe`[]
      B.divisors [2] `shouldBe`[1,2]
      B.divisors [10] `shouldBe`[1,2,5,10]
      B.divisors [2,10] `shouldBe`[1,2]
      B.divisors [20,30,40] `shouldBe`[1,2,5,10]

  describe "multiples" $ do
    it "should return common multiples of a list of numbers" $ do
      B.multiples [] `shouldBe`[]
      take 5 (B.multiples [2]) `shouldBe`[2,4,6,8,10]
      take 5 (B.multiples [2,3]) `shouldBe`[6,12,18,24,30]
      take 5 (B.multiples [2,3,5]) `shouldBe`[30,60,90,120,150]

  describe "intersect" $ do
    it "should return intersection of lists" $ do
      B.intersect [1,2,3,4] [3,4,5] `shouldBe` [3,4]

  describe "isDivisibleBy" $ do
    it "should return True if number is divisible by all given numbers" $ do
      B.isDivisibleBy 10 [5] `shouldBe` True
      B.isDivisibleBy 10 [5,2] `shouldBe` True
      B.isDivisibleBy 60 [60,30,20,15,12,10,6,5,4,3,2,1] `shouldBe` True
