module CCO.Diag.TypeCheckFunctions where

    import CCO.Types
    import CCO.SourcePos

    checkCompilation :: SourcePos -> Func -> Func -> [TypeError]
    checkCompilation pos (from1, to1) (from2, to2) = 
                                   if to1 /= from2 then 
                                      [Err pos ("Cannot compile "++ to1 ++", compiler expecting " ++ from2)] 
                                     else []

    checkExecution :: SourcePos -> Func -> Func -> [TypeError]
    checkExecution pos (from1,to1) (from2,to2) = 
                                   if to1 /= from2 then 
                                      [Err pos ("Cannot execute "++ to1 ++", expecting " ++ from2)] 
                                     else []

    checkPlatformCompile :: SourcePos -> Ident -> Ident -> [TypeError]
    checkPlatformCompile pos d1 d2 = concat 
                              [ if d1 == "platform" then [Err pos "Cannot compile a platform"]    else []
                              , if d2 == "program"  then [Err pos "Cannot compile with a program"]  else []
                              , if d2 == "platform" then [Err pos "Cannot compile with a platform"] else []
                              , if d2 == "interpreter" then [Err pos "Cannot compile with an interpreter"] else []
                              ]
    checkPlatform :: SourcePos -> Ident -> Ident -> [TypeError]
    checkPlatform pos d1 d2 = concat 
                              [ if d1 == "platform" then [Err pos "Cannot execute a platform"]    else []
                              , if d2 == "program"  then [Err pos "Cannot execute on a program"]  else []
                              , if d2 == "compiler" then [Err pos "Cannot execute on a compiler"] else []
                              ]
