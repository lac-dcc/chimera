// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct74573.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns
`default_nettype none

module icarus_tb();
    
	logic [7:0] D, Q;
	logic LE, _OE;
    
	hct74573 latch(
	.D, .Q,
	.LE, ._OE
	);
    
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0,  latch);
        
        $display ("");
        $display ($time, "   D         Q         LE  _OE");
`ifndef verilator
        $monitor ($time, "   %8b  %8b  %b   %b", D,   Q,   LE,  _OE);
`endif
    end

    initial begin
        parameter zero      = 8'b0;
        parameter aa     = 8'b10101010;
        parameter undefined = 8'bx;
        parameter zed       = 8'bz;

        parameter latched  = 0;
        parameter transparent  = 1;

        parameter disabled = 1;
        parameter enabled = 0;
        

	D=zero;
	#30 
        `equals(Q , undefined, "initial");

	_OE=disabled;
	LE=transparent;
	#16 
        `equals(Q , zed, "latch transparent - output enabled");

	_OE=enabled;
	#19 
        `equals(Q , zero, "latch transparent - D0 zero");

	D=aa;
	#18
        `equals(Q , aa, "D0 0xAA");

	LE=latched;
	D=zero;
	#50
        `equals(Q , aa, "D0 0xAA because latched");

	LE=transparent;
	#16
        `equals(Q , zero, "D0 zero because transparent");

	_OE=disabled;
	#19
        `equals(Q , zed, "D0 zero because transparent");

    end
endmodule
