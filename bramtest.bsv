package bramtest;

import BRAM :: * ;
import StmtFSM::*;
import Clocks::*;
import Real :: * ;
import bram::*;
import braminter::*;
import "BDPI" function ActionValue#(Bit#(64)) get_rint(Bit#(64) data);



function BRAMRequest#(Bit#(20), Bit#(64)) makeRequest(Bool write, Bit#(20) addr, Bit#(64) data);
return BRAMRequest{
write: write,
responseOnWrite:False,
address: addr,
datain: data
};
endfunction

(* synthesize *)

module sysBRAMTest();

Reg#(Bit#(20)) i <- mkRegA(0);
Reg#(int) cnt <- mkReg(0);
Reg#(Bit#(64)) ans1 <- mkRegA(0);
let fh <- mkReg(InvalidFile) ;
Bshifter_IFC dut <- mkBram;

rule open (cnt == 0 ) ;
String dumpFile = "file1.txt" ;
File lfh <- $fopen( dumpFile, "w" ) ;
fh <= lfh ;
cnt<=1;
endrule

BRAM_Configure cfg = defaultValue;
cfg.allowWriteResponseBypass = False;
BRAM2Port#(Bit#(20), Bit#(64)) dut0 <- mkBRAM2Server(cfg);
cfg.loadFormat = tagged Binary "sample.txt";
BRAM2Port#(Bit#(20), Bit#(64)) dut1 <- mkBRAM2Server(cfg);

Stmt test =
(seq
delay(10);

while(i<151875)
par

action
dut1.portA.request.put(makeRequest(False, i, 0));
endaction

action
let x <- dut1.portA.response.get;
//$display("%b ",x);
//Bit#(64) x = 2;
let ans = dut.result(x);
$fwrite( fh , "%d\n",ans);
endaction

i<=i+1;
endpar

delay(100);
endseq);
mkAutoFSM(test);

endmodule
endpackage:bramtest
