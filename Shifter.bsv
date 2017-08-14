
package Shifter;

import Shifterinterface::*;
(* synthesize *)

module mkBintoInt (Shifter_IFC);

function Bit#(n) shift(Bit#(n) y,Bit#(m) x);

   for (Integer i=0; i<valueof(m); i=i+1)
   begin
   		if (x[i]==1)
   			y= y >> 2**i;
   end

   return y;
endfunction

function Tout hhh1(Tout a1,Tin b1) = shift(a1,b1);

method Tout shift1(Tout b,Tin a);
	return hhh1(b,a);
endmethod

endmodule: mkBintoInt

endpackage: Shifter
