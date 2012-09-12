module UnitTest.Foo where

import Test.Framework
import qualified UnitTest.Foo.FugaTest as FugaTest (testSuite)


main :: IO ()
main = defaultMain testSuite

testSuite :: [Test]
testSuite = [ FugaTest.testSuite
            ]
