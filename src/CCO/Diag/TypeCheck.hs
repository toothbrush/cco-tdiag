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
-- Implements the type checker for Diags. I.e. make sure
-- no nonsensical combinations are made. 
--
-------------------------------------------------------------------------------

module CCO.Diag.TypeCheck (
    -- * The type checker.
    typecheck,  -- :: Component Diag Diag
    Diag
) where

import CCO.Component                 (Component, component)
import CCO.Feedback
import qualified CCO.Component as C  (parser)
import CCO.Diag.TypeCheckAG
import CCO.Parsing                   (Parser, eof, sourcePos, (<!>))
import Control.Applicative

-- | A 'Component' for type checking Diags
typecheck :: Component Diag Diag
typecheck = component (\d -> do trace_ "Type checking the Diag..."
                                return $ typecheck_Syn_Diag (wrap_Diag (sem_Diag d) (Inh_Diag))
                      )
