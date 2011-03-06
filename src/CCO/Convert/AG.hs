

-- UUAGC 0.9.36 (src/CCO/Convert/AG.ag)
module CCO.Convert.AG where

{-# LINE 2 "src/CCO/Convert/../Diag/AG/Base.ag" #-}

import CCO.SourcePos        (SourcePos)
import CCO.Tree             (ATerm (App), Tree (fromTree, toTree))
import CCO.Tree.Parser      (parseTree, app, arg)
import Control.Applicative  (Applicative ((<*>)), (<$>))
{-# LINE 13 "src/CCO/Convert/AG.hs" #-}

{-# LINE 2 "src/CCO/Convert/AG/Base.ag" #-}

-- import CCO.Tree             (ATerm (App), Tree (fromTree, toTree))
-- import CCO.Tree.Parser      (parseTree, app, arg)
-- import Control.Applicative  (Applicative ((<*>)), (<$>))
import CCO.Picture
import CCO.Diag
{-# LINE 22 "src/CCO/Convert/AG.hs" #-}
{-# LINE 13 "src/CCO/Convert/../Diag/AG/Base.ag" #-}

type Ident = String
{-# LINE 26 "src/CCO/Convert/AG.hs" #-}

{-# LINE 32 "src/CCO/Convert/../Diag/AG/Base.ag" #-}

instance Tree Diag where
  fromTree (Diag pos d) = App "Diag" [fromTree pos, fromTree d]
  toTree = parseTree [app "Diag" (Diag <$> arg <*> arg)]

instance Tree Diag_ where
  fromTree (Program p l)        = App "Program"  [fromTree p, fromTree l]
  fromTree (Platform m)         = App "Platform" [fromTree m]
  fromTree (Interpreter i l m)  = App "Interpreter"
                                    [fromTree i, fromTree l, fromTree m]
  fromTree (Compiler c l1 l2 m) =
    App "Compiler" [fromTree c, fromTree l1, fromTree l2, fromTree m]
  fromTree (Execute d1 d2)      = App "Execute" [fromTree d1, fromTree d2]
  fromTree (Compile d1 d2)      = App "Compile" [fromTree d1, fromTree d2]

  toTree = parseTree 
             [ app "Program"     (Program     <$> arg <*> arg                )
             , app "Platform"    (Platform    <$> arg                        )
             , app "Interpreter" (Interpreter <$> arg <*> arg <*> arg        )
             , app "Compiler"    (Compiler    <$> arg <*> arg <*> arg <*> arg)
             , app "Execute"     (Execute     <$> arg <*> arg                )
             , app "Compile"     (Compile     <$> arg <*> arg                )
             ]
{-# LINE 52 "src/CCO/Convert/AG.hs" #-}
-- Diag --------------------------------------------------------
data Diag  = Diag (SourcePos) (Diag_ ) 
-- cata
sem_Diag :: Diag  ->
            T_Diag 
sem_Diag (Diag _pos _d )  =
    (sem_Diag_Diag _pos (sem_Diag_ _d ) )
-- semantic domain
type T_Diag  = ( ( Picture ))
data Inh_Diag  = Inh_Diag {}
data Syn_Diag  = Syn_Diag {toPicture_Syn_Diag :: ( Picture )}
wrap_Diag :: T_Diag  ->
             Inh_Diag  ->
             Syn_Diag 
wrap_Diag sem (Inh_Diag )  =
    (let ( _lhsOtoPicture) = sem 
     in  (Syn_Diag _lhsOtoPicture ))
sem_Diag_Diag :: SourcePos ->
                 T_Diag_  ->
                 T_Diag 
sem_Diag_Diag pos_ d_  =
    (let _lhsOtoPicture :: ( Picture )
         _lhsOtoPicture =
             ({-# LINE 14 "src/CCO/Convert/AG/Base.ag" #-}
              test
              {-# LINE 78 "src/CCO/Convert/AG.hs" #-}
              )
     in  ( _lhsOtoPicture))
-- Diag_ -------------------------------------------------------
data Diag_  = Compile (Diag ) (Diag ) 
            | Compiler (Ident) (Ident) (Ident) (Ident) 
            | Execute (Diag ) (Diag ) 
            | Interpreter (Ident) (Ident) (Ident) 
            | Platform (Ident) 
            | Program (Ident) (Ident) 
-- cata
sem_Diag_ :: Diag_  ->
             T_Diag_ 
sem_Diag_ (Compile _d1 _d2 )  =
    (sem_Diag__Compile (sem_Diag _d1 ) (sem_Diag _d2 ) )
sem_Diag_ (Compiler _c _l1 _l2 _m )  =
    (sem_Diag__Compiler _c _l1 _l2 _m )
sem_Diag_ (Execute _d1 _d2 )  =
    (sem_Diag__Execute (sem_Diag _d1 ) (sem_Diag _d2 ) )
sem_Diag_ (Interpreter _i _l _m )  =
    (sem_Diag__Interpreter _i _l _m )
sem_Diag_ (Platform _m )  =
    (sem_Diag__Platform _m )
sem_Diag_ (Program _p _l )  =
    (sem_Diag__Program _p _l )
-- semantic domain
type T_Diag_  = ( )
data Inh_Diag_  = Inh_Diag_ {}
data Syn_Diag_  = Syn_Diag_ {}
wrap_Diag_ :: T_Diag_  ->
              Inh_Diag_  ->
              Syn_Diag_ 
wrap_Diag_ sem (Inh_Diag_ )  =
    (let ( ) = sem 
     in  (Syn_Diag_ ))
sem_Diag__Compile :: T_Diag  ->
                     T_Diag  ->
                     T_Diag_ 
sem_Diag__Compile d1_ d2_  =
    (let _d1ItoPicture :: ( Picture )
         _d2ItoPicture :: ( Picture )
         ( _d1ItoPicture) =
             d1_ 
         ( _d2ItoPicture) =
             d2_ 
     in  ( ))
sem_Diag__Compiler :: Ident ->
                      Ident ->
                      Ident ->
                      Ident ->
                      T_Diag_ 
sem_Diag__Compiler c_ l1_ l2_ m_  =
    (let 
     in  ( ))
sem_Diag__Execute :: T_Diag  ->
                     T_Diag  ->
                     T_Diag_ 
sem_Diag__Execute d1_ d2_  =
    (let _d1ItoPicture :: ( Picture )
         _d2ItoPicture :: ( Picture )
         ( _d1ItoPicture) =
             d1_ 
         ( _d2ItoPicture) =
             d2_ 
     in  ( ))
sem_Diag__Interpreter :: Ident ->
                         Ident ->
                         Ident ->
                         T_Diag_ 
sem_Diag__Interpreter i_ l_ m_  =
    (let 
     in  ( ))
sem_Diag__Platform :: Ident ->
                      T_Diag_ 
sem_Diag__Platform m_  =
    (let 
     in  ( ))
sem_Diag__Program :: Ident ->
                     Ident ->
                     T_Diag_ 
sem_Diag__Program p_ l_  =
    (let 
     in  ( ))