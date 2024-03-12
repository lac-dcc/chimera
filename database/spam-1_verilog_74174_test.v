// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct74174.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns
`default_nettype none

module icarus_tb();
    
	logic [5:0] D, Q;
	logic CLK, _MR;
    
	hct74174 register( .D, .Q, .CLK, ._MR);
    
    integer pdMR = register.PD_MR_Q;
    integer pdCLK = register.PD_CLK_Q;
    integer pdSU = register.PD_SETUP;
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0,  register);
        
        $display ("");
        $display ($time, "   D       Q       CLK  _MR");
`ifndef verilator
        $monitor ($time, "   %6b  %6b  %b   %b", D,   Q,   CLK,  _MR);
`endif
    end

    initial begin

	D=6'bxzxzxz;
	CLK=0;
	_MR=0;
	#pdMR;
    `equals(Q , 6'bxxxxxx, "initial");

	#1;
    `equals(Q , 6'b000000, "reset low");

	_MR=1;
	#pdMR;
    `equals(Q , 6'b000000, "reset gone high but not yet propagated");

	#1;
    `equals(Q , 6'bxxxxxx, "reset high propagated but D = X");

	D=6'b101010;
	CLK=1;
	#1000
    `equals(Q , 6'bxzxzxz, "clocked - but D was not setup prior to setup interval so pickup the earlier 00");

	CLK=0;
	#(pdCLK+1)
    CLK=1;
	#(pdCLK+1)
    `equals(Q , 6'b101010, "clocked");

	D=6'b010101;
	#(pdSU+1)
	CLK=0;
	#(pdCLK+1)
    CLK=1;
	#(pdCLK+1)
    `equals(Q , 6'b010101, "clocked");


	_MR=0;
	#(pdMR+1)
	`equals(Q , 6'b000000, "reset");

    end
endmodule
