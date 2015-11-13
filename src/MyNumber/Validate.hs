-- | validate 'My Number digits'
module MyNumber.Validate (valid) where

import Data.Char (isDigit, digitToInt)

valid :: String -> Bool
valid = check 11 0
  where
    check 0 s [c] = isDigit c && 11 - s `mod` 11 == digitToInt c
    check n s (c:cs)
      | n >= 7    = isDigit c && check (n-1) (s+(n-5)*digitToInt c) cs
      | n >= 1    = isDigit c && check (n-1) (s+(n+1)*digitToInt c) cs
    check _ _ _   = False

-- ^ validate "My Number" string
--
-- >>> valid "123456789010"
-- False
-- >>> valid "123456789011"
-- False
-- >>> valid "123456789012"
-- False
-- >>> valid "123456789013"
-- False
-- >>> valid "123456789014"
-- False
-- >>> valid "123456789015"
-- False
-- >>> valid "123456789016"
-- False
-- >>> valid "123456789017"
-- False
-- >>> valid "123456789018"
-- True
-- >>> valid "123456789019"
-- False
-- >>> valid "1234567890180"
-- False
-- >>> valid "12345678901"
-- False
-- >>> valid "123456789abc"
-- False
