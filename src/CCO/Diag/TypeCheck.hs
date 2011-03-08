-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.TypeCheck
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  Paul van der Walt
-- Stability   :  provisional
-- Portability :  portable
--
-- Calls the type checker for Diags. I.e. wrap the AG function.
-------------------------------------------------------------------------------

module CCO.Diag.TypeCheck (
    -- * The type checker.
    typecheck,  -- :: Component Diag Diag
    Diag 
) where

import Prelude hiding (show)
import CCO.Component                 (Component, component)
import Control.Monad
import CCO.Types
import CCO.Feedback
import qualified CCO.Component as C  (parser)
import CCO.Diag.TypeCheckAG
import CCO.Parsing                   (Parser, eof, sourcePos, (<!>))
import Control.Applicative

-- | A 'Component' for type checking Diags; 
-- Basically a wrapper around the 'typecheck' AG function with possible error reporting
-- if anything turns out to be amiss. 
typecheck :: Component Diag Diag
typecheck = component  (\d -> do let (dChecked, errs) = typecheck_Syn_Diag (wrap_Diag (sem_Diag d) Inh_Diag)
                                 (unless (null errs) $
                                    mapM_ (error . show) errs)
                                 return dChecked
                       )
