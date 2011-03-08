-------------------------------------------------------------------------------
-- |
-- Module      :  CCO.Types
-- Copyright   :  (c) 2008 Utrecht University
-- License     :  All rights reserved
--
-- Maintainer  :  Paul van der Walt
-- Stability   :  provisional
-- Portability :  portable
--
-- A few types and a data structure which are useful in the other modules. 
--
-------------------------------------------------------------------------------

module CCO.Types where
    
    import CCO.SourcePos

    -- * Type aliases
    -- | An identifier, such as programming language name.
    type Ident = String

    -- | The "type" of a block, from (for example) one language to another in the case of a compiler. 
    type Func = (Ident, Ident)

    -- | For now, an error message is just a string.
    type Message = String

    -- * The error data type. 
    -- | An error has a position (in the input, inherited) and an associated message.
    data TypeError = Err SourcePos Message

    -- | We implement our own instance of Show, because we'd like the error messages 
    -- to be printed just so.
    instance Show TypeError
    show (Err (SourcePos f (Pos x y)) msg) = "In " ++ 
                                             Prelude.show f ++ 
                                             ":" ++ 
                                             Prelude.show x ++ "," ++ 
                                             Prelude.show y ++ ": " ++ 
                                             msg
