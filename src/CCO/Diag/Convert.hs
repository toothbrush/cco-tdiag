-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.Convert
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  Paul van der Walt
-- Stability   :  provisional
-- Portability :  portable
--
-- A 'Convertor' for 'Diag's.
--
-------------------------------------------------------------------------------

module CCO.Diag.Convert (
    -- * Convertor
    convert    -- :: Component Diag Picture
) where

import CCO.Component                 (Component, component)
import CCO.Feedback
import qualified CCO.Component as C  (parser)
import CCO.Diag.Base                 (Diag (Diag), Diag_ (..))
import CCO.Diag.ConvertAG
import CCO.Picture
import CCO.Parsing                   (Parser, eof, sourcePos, (<!>))
import Control.Applicative

-- | A 'Component' for parsing 'Diag's.
-- It just prints a trace of what it's doing, then calls the 'toPicture' AG
-- function. Just a wrapper, in other words.
convert :: Component Diag Picture
convert = component (\d -> do trace_ "Converting Diag to Picture..."
                              return $ toPicture_Syn_Diag (wrap_Diag (sem_Diag d) (Inh_Diag (0,0)))
                    )

