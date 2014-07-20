module Bob ( responseFor ) where

import Data.Char

type Phrase = String

responseFor :: Phrase -> String
responseFor phrase
  | isEmpty phrase    = "Fine. Be that way!"
  | isYell phrase     = "Woah, chill out!"
  | isQuestion phrase = "Sure."
  | otherwise         = "Whatever."

isQuestion :: Phrase -> Bool
isQuestion phrase = last phrase == '?'

isYell :: Phrase -> Bool
isYell phrase = all (not . isLower) phrase && any isUpper phrase
                where

isEmpty :: Phrase -> Bool
isEmpty phrase = all isSpace phrase
