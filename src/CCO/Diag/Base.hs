-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.Base
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  stefan@cs.uu.nl
-- Stability   :  provisional
-- Portability :  portable
--
-- T-diagrams. This was part of the source distribution, and just exports a few
-- data types.
--
-------------------------------------------------------------------------------

module CCO.Diag.Base (
    -- * Syntax
    Ident
  , Diag (Diag)    -- instances: Tree
  , Diag_ (..)     -- instances: Tree
) where

import CCO.Diag.ConvertAG
import CCO.Types
