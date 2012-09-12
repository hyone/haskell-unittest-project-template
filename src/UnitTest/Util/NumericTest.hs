{-# LANGUAGE TemplateHaskell #-}

module UnitTest.Util.NumericTest (testSuite) where

import Test.Framework (defaultMain, Test)
import Test.Framework.Providers.HUnit
import Test.Framework.Providers.QuickCheck2
import Test.Framework.TH
import Test.HUnit ((@?=), Assertion)
import Test.QuickCheck (Arbitrary(..))
import Control.Monad (liftM)

import Util.Numeric


main = defaultMain [testSuite]

testSuite :: Test
testSuite = $(testGroupGenerator)


instance Arbitrary MyInt where
  arbitrary = liftM myint arbitrary


prop_myplus :: MyInt -> MyInt -> Bool
prop_myplus x y = let i1 = getMyInt x
                      i2 = getMyInt y in
                  getMyInt (myplus x y) == i1 + i2

prop_myminus :: MyInt -> MyInt -> Bool
prop_myminus x y = let i1 = getMyInt x
                       i2 = getMyInt y in
                   getMyInt (myminus x y) == i1 - i2


case_hunit1 :: Assertion
case_hunit1 = let m1 = MyInt 2
                  m2 = MyInt 3
                  m3 = MyInt 8 in
              myint (2 + 3 - 8) @?= (m1 `myplus` m2 `myminus` m3)

