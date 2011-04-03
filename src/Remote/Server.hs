module Remote.Server (prueba) where

import Network.Socket
import System.IO

prueba = do
         s <- socket AF_INET Stream defaultProtocol
         setSocketOption s ReuseAddr (99::Int)
         print =<< getSocketOption s ReuseAddr
         addr <- inet_addr "0.0.0.0"
         bindSocket s $ SockAddrInet 8080 addr
         listen s 50
         x <- accept s
         h <- socketToHandle s ReadWriteMode
         hClose h
         return x
