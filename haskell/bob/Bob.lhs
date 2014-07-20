Parece que hay que definir a bob como un module

> module Bob ( responseFor ) where
>
> type Phrase = String
>
> responseFor :: Phrase -> String
> responseFor phrase
>   | isQuestion phrase = "Sure."
>   | isYell phrase     = "Woah, chill out!"
>   | phrase == ""      = "Fine. Be that way!"
>   | otherwise         = "Whatever."

Es una pregunta solo si tiene mas de un caracter y termina en ?

> isQuestion :: Phrase -> Bool
> isQuestion "" = False
> isQuestion phrase = last phrase == '?'

Es un grito si esta todo en mayuscula.

> isYell :: Phrase -> Bool
> isYell "" = False
> isYell phrase = all isUpcase phrase
>                 where
>                   isUpcase char = let enum = fromEnum char
>                                   in  not ( enum >= 97 && enum <= 122 )
