module UnitTest.Util where

import Test.Framework
import qualified UnitTest.Util.HogeTest    as HogeTest (testSuite)
import qualified UnitTest.Util.NumericTest as NumericTest (testSuite)


main :: IO ()
main = defaultMain testSuite

testSuite :: [Test]
testSuite = [ HogeTest.testSuite
            , NumericTest.testSuite
            ]