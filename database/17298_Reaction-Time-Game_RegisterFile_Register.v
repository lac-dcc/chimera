// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

`ifndef Register
	`define Register
	
	// `include "dffCustom.v"
module Register(In, Load, Clock, CLRN, Q);
  input In;
  input Load;
  input Clock;
  input CLRN;
  output Q;
  
  
  assign D = Load ? In : Q;
  dff regDFF (.D(D), .Clk(Clock), .CLRN(CLRN), .Q(Q)/*, .QN(_ignore23)*/);
  
endmodule

`endif
