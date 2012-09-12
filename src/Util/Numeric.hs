module Util.Numeric
  ( MyInt(..)
  , myint
  , myplus
  , myminus
  ) where

newtype MyInt = MyInt { getMyInt :: Int }
                deriving (Show, Eq, Ord)

myint :: Int -> MyInt
myint = MyInt

myplus :: MyInt -> MyInt -> MyInt
myplus (MyInt i1) (MyInt i2) = MyInt (i1 + i2)

myminus :: MyInt -> MyInt -> MyInt
myminus (MyInt i1) (MyInt i2) = MyInt (i1 - i2)

