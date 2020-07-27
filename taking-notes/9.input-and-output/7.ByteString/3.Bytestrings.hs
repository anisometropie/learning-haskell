-- Strict bytestrings, no laziness, no promises :  Data.ByteString
-- will take more memory, but more efficient
-- Lazy bystrings: Data.ByteString.Lazy
-- lazy but not quite as lazy as lists. (chuncks of 64k)

import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S
-- pack :: [GHC.Word.Word8] -> ByteString
-- unpack :: ByteString -> [GHC.Word.Word8]
-- Word8 type is like Int, but 0-255

B.pack [99,97, 15] -- "cae"

-- fromChunks takes a list of strict bytestrings and converts it to a lazy bytestring. toChunks takes a lazy bytestring and converts it to a list of strict ones.
B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]

-- cons is like 3 : [4,5] for lists
-- cons is going to create a new Chunk for every single new element
-- cons' is strict, will fill existing chuncks
B.cons 85 $ B.pack [80,81,82,84]
-- Chunk "U" (Chunk "PQRT" Empty)
B.cons' 85 $ B.pack [80,81,82,84]
-- Chunk "UPQRT" Empty

foldr B.cons B.empty [50..60]
-- Chunk "2" (Chunk "3" (Chunk "4" (Chunk "5" (Chunk "6" (Chunk "7" (Chunk "8" (Chunk "9" (Chunk ":" (Chunk ";" (Chunk "<" Empty))))))))))
foldr B.cons' B.empty [50..60]
-- Chunk "23456789:;<" Empty

-- readFile
-- the usual readFile from System.IO
-- readFile :: FilePath -> IO String
-- from ByteString, better for big files
-- readFile :: FilePath -> IO ByteString
-- strict version is going to read the entire file into memory at once!
