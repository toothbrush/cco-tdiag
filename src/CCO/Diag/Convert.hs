-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.Convert
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  stefan@cs.uu.nl
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

import CCO.Component                 (Component)
import qualified CCO.Component as C  (parser)
import CCO.Diag.Base                 (Diag (Diag), Diag_ (..))
import CCO.Picture
import CCO.Parsing                   (Parser, eof, sourcePos, (<!>))
import Control.Applicative

-- | A 'Component' for parsing 'Diag's.
convert :: Component Diag Picture
convert = undefined

