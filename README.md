# Haskell Unit Test Project Template

a project template for unit test using cabal.

## To run a single test:

    $ cd src
    $ runhaskell UnitTest/Util/NumericTest.hs

## To run a module test:

    $ cd src
    $ runhaskell UnitTest/Util.hs

## to run whole test:

    $ cabal configure --enable-tests --enable-library-coverage
    $ cabal build
    $ cabal test
