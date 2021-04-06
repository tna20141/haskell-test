-- FuncParamPair is a type constructor (taking a type as parameter).
-- FuncParamPair Int is a type.
-- FPP is a value constructor. It can act like a function, as in: x = FPP (++"A") "B". It's similar to a constructor in OOP.
-- However it can ALSO act as a value literal and can be pattern matched. See extractParam.
-- Value constructor can be thought of as a "enhanced" function (the first letter of the name is capitalized).
-- <-- FPP (++"a") b --> is a value. <-- FPP (++"A") --> is a value, a function at that.
data FuncParamPair a = FPP (a -> a) a

-- Using FPP as a literal.
applyFPP :: FuncParamPair a -> a
applyFPP (FPP f x) = f x

-- Using FPP as a function.
makeMaybeFPP :: (a -> a) -> a -> Maybe (FuncParamPair a)
-- a -> a -> a -> Maybe (FuncParamPair a) doesn't work. The braces are needed to signify that the 1st parameter is a function.
makeMaybeFPP f x = Just (FPP f x)

extractParam :: FuncParamPair a -> a
extractParam (FPP _ x) = x

data FuncParamPairInt = FPPI (Int -> Int) Int
applyFPPI :: FuncParamPairInt -> Int
applyFPPI (FPPI f x) = f x

data Test = Test { a1 :: [Char], a2 :: [Char], a3 :: Integer }
