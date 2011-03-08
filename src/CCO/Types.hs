module CCO.Types where
    
    import CCO.SourcePos

    type Ident = String
    type Message = String
    data TypeError = Err SourcePos Message
                     deriving Show
