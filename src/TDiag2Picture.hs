import CCO.Component   (Component, component, printer, ioWrap)
import CCO.Picture     (Picture)
import CCO.Picture.AG
import CCO.Tree        (ATerm, Tree (toTree,fromTree), parser)
import CCO.Diag hiding (parser)
import Control.Arrow   ((>>>), arr)

main =
  ioWrap (
          parser                                     >>> 
          (component toTree :: Component ATerm Diag) >>> 
          convert                                    >>> 
          arr fromTree                               >>>
          printer
         )
