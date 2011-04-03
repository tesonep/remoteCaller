module Main where

import Remote.Server

main::IO()
main =  do
           (_,sa) <- prueba
           print sa
           return ()
