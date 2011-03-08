-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Diag.TypeCheckFunctions
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  Paul van der Walt
-- Stability   :  provisional
-- Portability :  portable
--
-- A few functions for checking the various constrains on 
-- diagrams, such as types and incorrect combinations. 
--
-------------------------------------------------------------------------------

module CCO.Diag.TypeCheckFunctions where

    import CCO.Types
    import CCO.SourcePos

    -- * Type checking
    -- | Check that when compiling, the types match. I.e. that Haskell is compiled by a Haskell compiler. 
    checkCompilation :: SourcePos -> Func -> Func -> [TypeError]
    checkCompilation pos (from1, to1) (from2, to2) = 
                                   if to1 /= from2 then 
                                      [Err pos ("Cannot compile "++ to1 ++", compiler expecting " ++ from2)] 
                                     else []

    -- | Check that when executing, the types match. I.e. that Haskell is executed by a Haskell interpreter. 
    checkExecution :: SourcePos -> Func -> Func -> [TypeError]
    checkExecution pos (from1,to1) (from2,to2) = 
                                   if to1 /= from2 then 
                                      [Err pos ("Cannot execute "++ to1 ++", expecting " ++ from2)] 
                                     else []

    -- * Composition checking
    -- | This function checks to see that compilation isn't used for incorrect components, i.e.
    -- that only a compiler is used to compile, and that a platform isn't compiled. 
    checkPlatformCompile :: SourcePos -> Ident -> Ident -> [TypeError]
    checkPlatformCompile pos d1 d2 = concat 
                              [ if d1 == "platform" then [Err pos "Cannot compile a platform"]    else []
                              , if d2 == "program"  then [Err pos "Cannot compile with a program"]  else []
                              , if d2 == "platform" then [Err pos "Cannot compile with a platform"] else []
                              , if d2 == "interpreter" then [Err pos "Cannot compile with an interpreter"] else []
                              ]
    -- | This function checks that execution is only used to compose correct blocks, i.e. execution
    -- only happens on an interpreter or a platform, and only compiled things and programs can be 
    -- executed.
    checkPlatform :: SourcePos -> Ident -> Ident -> [TypeError]
    checkPlatform pos d1 d2 = concat 
                              [ if d1 == "platform" then [Err pos "Cannot execute a platform"]    else []
                              , if d2 == "program"  then [Err pos "Cannot execute on a program"]  else []
                              , if d2 == "compiler" then [Err pos "Cannot execute on a compiler"] else []
                              ]
