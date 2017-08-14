package bram;
import BRAM :: * ;
import braminter::*;
import "BDPI" function Bit#(64) get_rint(Bit#(64) data);

(* synthesize *)
module mkBram (Bshifter_IFC);
function Bit#(64) hhh1(Bit#(64) data) = get_rint(data);

method Bit#(64) result(Bit#(64) data);
  return hhh1(data);
endmethod

endmodule
endpackage
