module Bob ( responseFor ) where

import Data.Char

data TeenTalk = Empty | Yell | Question | NonSense
                      deriving (Show)

responseFor :: String -> String
responseFor phrase = case toTeenTalk phrase of
  Empty    -> "Fine. Be that way!"
  Yell     -> "Woah, chill out!"
  Question -> "Sure."
  NonSense -> "Whatever."

toTeenTalk :: String -> TeenTalk
toTeenTalk phrase
  | isEmpty phrase    = Empty
  | isYell phrase     = Yell
  | isQuestion phrase = Question
  | otherwise         = NonSense

isQuestion :: String -> Bool
isQuestion phrase = last phrase == '?'

isYell :: String -> Bool
isYell phrase = all (not . isLower) phrase && any isUpper phrase

isEmpty :: String -> Bool
isEmpty phrase = all isSpace phrase
