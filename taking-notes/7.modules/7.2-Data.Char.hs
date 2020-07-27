import           Data.Char
import           Data.Function (on)
import           Data.List

-- isControl checks whether a character is a control character.
--
-- isSpace checks whether a character is a white-space characters. That includes spaces, tab characters, newlines, etc.
--
-- isLower checks whether a character is lower-cased.
--
-- isUpper checks whether a character is upper-cased.
--
-- isAlpha checks whether a character is a letter.
--
-- isAlphaNum checks whether a character is a letter or a number.
--
-- isPrint checks whether a character is printable. Control characters, for instance, are not printable.
--
-- isDigit checks whether a character is a digit.
--
-- isOctDigit checks whether a character is an octal digit.
--
-- isHexDigit checks whether a character is a hex digit.
--
-- isLetter checks whether a character is a letter.
--
-- isMark checks for Unicode mark characters. Those are characters that combine with preceding letters to form latters with accents. Use this if you are French.
--
-- isNumber checks whether a character is numeric.
--
-- isPunctuation checks whether a character is punctuation.
--
-- isSymbol checks whether a character is a fancy mathematical or currency symbol.
--
-- isSeparator checks for Unicode spaces and separators.
--
-- isAscii checks whether a character falls into the first 128 characters of the Unicode character set.
--
-- isLatin1 checks whether a character falls into the first 256 characters of Unicode.
--
-- isAsciiUpper checks whether a character is ASCII and upper-case.
--
-- isAsciiLower checks whether a character is ASCII and lower-case.

a = all isAlphaNum "abc123" -- True
b = filter isNumber "ab12cd34" -- "1234"

-- isSpace apply to chars.
-- all $ not . isSpace checks if string contains no space char
words' :: String -> [String]
words' = filter (all $ not . isSpace ) . groupBy ((==) `on` isSpace)

c = generalCategory ' ' -- Space
d = generalCategory 'A' -- UppercaseLetter
e = groupBy ((==) `on` generalCategory ) "abc123aþbαβb \nabc152" -- ["abc","123","a\254b\945\946b"," ","\n","abc","152"]

f = toUpper 'a' -- 'A'
g = toLower 'A' -- 'a'
h = toTitle 'a' -- 'A'
i = digitToInt '3' -- 3
j = intToDigit 15 -- 'f'

k = map ord "abcdefgh" -- [97,98,99,100,101,102,103,104]
l = chr 35 -- '#'

encode :: Int -> String -> String
encode shift msg =
  let ords = map ord msg
      shifted = map (+shift) ords
  in map chr shifted

decode shift = encode (negate shift)
