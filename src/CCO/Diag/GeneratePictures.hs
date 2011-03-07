-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.GeneratePictures
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  Paul van der Walt
-- Stability   :  provisional
-- Portability :  portable
--
-- A bunch of functions for generating LaTeX code for a given
-- compiler primitive.
--
-------------------------------------------------------------------------------

module CCO.Diag.GeneratePictures (
    -- * Generators
    program,
    platform,
    interpreter,
    compiler,
    execute,
    compile,
    sizeCompile,
    sizeExecute
) where

import CCO.Picture
import CCO.Picture.AG
import CCO.Types

sizeCompile :: Picture -> Picture -> (Double, Double)
sizeCompile (Picture (w1,h1) cs1) (Picture (w2,h2) cs2) = (w1 + w2 + 50, max h1 h2 +15)

sizeExecute :: Picture -> Picture -> (Double, Double)
sizeExecute (Picture (w1,h1) cs1) (Picture (w2,h2) cs2) = (max w1 w2, h1+h2)

compile :: (Double,Double) -> Picture -> Picture -> Commands
compile (x,y) (Picture (w1,h1) cs1) (Picture (w2,h2) cs2) = cs
        where cs = cs1 ++ (map fLeft cs2) 
              fLeft   (Put (posx, posy) o) = Put (w1 + posx -7.5 ,posy   ) o

execute :: (Double,Double) -> Picture -> Picture -> Commands
execute (x,y) (Picture (w1,h1) cs1) (Picture (w2,h2) cs2) = cs
        where cs = (map fLeft cs2) ++ (map fHeight cs1)
              fHeight (Put (posx, posy) o) = Put (posx      ,posy+10) o
              fLeft   (Put (posx, posy) o) = Put (-7.5+ posx + w1 - w2 ,posy   ) o

interpreter :: (Double,Double) -> Ident -> Ident -> Ident -> Commands
interpreter (x,y) i l m = 
              [ Put (x+  0, y+ 0) (Framebox (50,30) [])
              , Put (x+  0, y+20) (Makebox (50,10) l)
              , Put (x+  0, y+10) (Makebox (50,10) i)
              , Put (x+  0, y+ 0) (Makebox (50,10) m)
              ]


compiler :: (Double,Double) -> Ident -> Ident -> Ident -> Ident -> Commands
compiler (x,y) c l1 l2 m = 
              [ Put (x+ 50, y+ 0) (Line ( 0, 1) 20)
              , Put (x+ 50, y+20) (Line (-1, 0) 50)
              , Put (x+  0, y+20) (Line ( 0, 1)  10)
              , Put (x+   0,y+30) (Line ( 1, 0) 150)
              , Put (x+ 150,y+30) (Line ( 0,-1) 10)
              , Put (x+ 150,y+20) (Line (-1, 0) 50)
              , Put (x+ 100,y+20) (Line ( 0,-1) 20)
              , Put (x+ 100,y+ 0) (Line (-1, 0) 50)
              , Put (x+  0, y+20) (Makebox (50,10) l1)
              , Put (x+ 50, y+20) (Makebox (50,10) "$\\longrightarrow$")
              , Put (x+100, y+20) (Makebox (50,10) l2)
              , Put (x+ 50, y+10) (Makebox (50,10) c)
              , Put (x+ 50, y+ 0) (Makebox (50,10) m)
              ]


platform :: (Double,Double) -> Ident -> Commands
platform (x,y) m = 
              [ Put (x+  0, y+15) (Line ( 5,-3) 25)
              , Put (x+ 25, y+ 0) (Line ( 5, 3) 25)
              , Put (x+  0, y+15) (Line ( 0, 1)  15)
              , Put (x+   0,y+30) (Line ( 1, 0)  50)
              , Put (x+  50,y+30) (Line ( 0,-1) 15)
              , Put (x+  0, y+15) (Makebox (50,15) m)
              ]

program :: (Double,Double) -> Ident -> Ident -> Commands
program (x,y) p l = 
              [ Put (x+7.5, y+20) (Line ( 1, 0) 50)
              , Put (x+7.5, y+20) (Line ( 0, 1) 15)
              , Put (x+7.5, y+35) (Line (-1, 2) 7.5)
              , Put (x+57.5,y+35) (Line ( 1, 2) 7.5)
              , Put (x+57.5,y+20) (Line ( 0, 1) 15)
              , Put (x+  0, y+50) (Line ( 1, 0) 65)
              , Put (x+7.5, y+35) (Makebox (50,15) p)
              , Put (x+7.5, y+20) (Makebox (50,15) l)
              ]

