module CCO.Types where
    
    import CCO.SourcePos

    type Ident = String
    type Func = (Ident, Ident)
    type Message = String
    data TypeError = Err SourcePos Message

    instance Show TypeError
    show (Err (SourcePos f (Pos x y)) msg) = "In " ++ 
                                             Prelude.show f ++ 
                                             ":" ++ 
                                             Prelude.show x ++ "," ++ 
                                             Prelude.show y ++ ": " ++ 
                                             msg
