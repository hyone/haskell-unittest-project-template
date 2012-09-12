{-# LANGUAGE TemplateHaskell #-}

module UnitTest.Foo.FugaTest (testSuite) where

import Test.Framework (defaultMain, Test)
import Test.Framework.Providers.QuickCheck2
import Test.Framework.TH


main = defaultMain [testSuite]

testSuite :: Test
testSuite = $(testGroupGenerator)


prop_sum :: [Int] -> Bool
prop_sum xs = sum xs == foldr (+) 0 xs
