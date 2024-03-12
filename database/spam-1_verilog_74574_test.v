// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct74574.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns
`default_nettype none

module icarus_tb();
    
	logic [7:0] D, Q;
	logic CLK, _OE;
    
	hct74574 register( .D, .Q, .CLK, ._OE);
    
    integer pdOE = register.PD_OE_Q;
    integer pdCLK = register.PD_CLK_Q;
    integer setup = register.SETUP_TIME;
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0,  register);
        
        $display ("");
        $display ($time, "   D         Q         CLK  _OE");
`ifndef verilator
        $monitor ($time, "   %8b  %8b  %b   %b", D,   Q,   CLK,  _OE);
`endif
    end

    initial begin
        parameter zero      = 8'b0;
        parameter aa     = 8'b10101010;
        parameter undefined = 8'bx;
        parameter zed       = 8'bz;
        parameter low  = 0;
        parameter high  = 1;
        parameter disabled = 1;
        parameter enabled = 0;

	D=zero;
	CLK=low;
	#pdOE 
    `equals(Q , undefined, "initial");

	_OE=disabled;
	#(pdOE+1) 
    `equals(Q , zed, "output disabled");

	_OE=enabled;
	#(pdOE+1)
    `equals(Q , undefined, "unclocked - D = X");

	D=aa;
	CLK=high;
	#1000
    `equals(Q , 0, "clocked - but AA not setup prior to serup interval so pickup the earlier 00");

	CLK=low;
	#pdOE 

	D=1;
	#(setup+1)

	CLK=high;
	#(pdCLK+1)
    `equals(Q , 8'b1, "transition to high - wth 1");

	D=255;
	#1000
    `equals(Q , 8'b1, "remain high - wth 1");

	CLK=low;
	#1000
    `equals(Q , 1, "transition to low - with 255 should still be 1");

	D=255;
	_OE=disabled;
	#(setup+1)
	CLK=high;
	#pdOE
    `equals(Q , zed, "transition to high - should clock in 255 when _OE disabled");

	_OE=enabled;
	#(pdOE+1)
    `equals(Q , 8'd255, "oe enabled");


    end
endmodule
