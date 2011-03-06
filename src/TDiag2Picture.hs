import CCO.Component   (Component, component, printer, ioWrap)
import CCO.Picture     (Picture)
import CCO.Convert
import CCO.Tree        (ATerm, Tree (toTree), parser)
import CCO.Diag hiding (parser)
import Control.Arrow   ((>>>))

main =
  ioWrap (
          parser                                     >>> 
          (component toTree :: Component ATerm Diag) >>> 
          convert                                    >>> 
          printer
         )
