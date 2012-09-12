import System.Environment (getArgs)
import Test.Framework

import qualified UnitTest.Foo  as Foo  (testSuite)
import qualified UnitTest.Util as Util (testSuite)


main :: IO ()
main = do 
  args <- filter (/= "--tests") `fmap` getArgs
  defaultMainWithArgs testSuite args 

testSuite :: [Test]
testSuite = concat [ Foo.testSuite
                   , Util.testSuite
                   ]