import CCO.Component   (Component, component, printer, ioWrap)
import CCO.Feedback
import CCO.Tree        (ATerm, Tree (toTree, fromTree), parser)
import CCO.Diag.TypeCheck
import CCO.Printing
import Control.Arrow   ((>>>))

main =
  ioWrap (
          parser                                     >>> 
          (component toTree :: Component ATerm Diag) >>> 
          typecheck                                  >>>
          diag2Aterm                                 >>>
          printer
          )

-- | This function takes an abstract Diag tree and converts is into an ATerm
diag2Aterm :: Component Diag ATerm
diag2Aterm = component (\inp -> do trace_ "Checking type correctness..."
                                   return $ fromTree inp)
