// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`include "pulseGenerator.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns
`default_nettype none

module icarus_tb();
    
	logic clk;
	logic clk_en;
// verilator lint_off UNOPTFLAT
	wire pulse;
// verilator lint_on UNOPTFLAT
    
	pulseGenerator gen( clk, clk_en, pulse);
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, gen);
        
        $display ("");
        $display ($time, "   clk  clk_en pulse");
`ifndef verilator
        $monitor ($time, "   %b    %b      %b", clk, clk_en, pulse);
`endif 

    end

    initial begin
	clk=0;

	// pulse enabled
	clk_en = 1;
        #30; // let the X settle out
        `equals(pulse , 1'b1, "t2");

	// as clock goes high get pulse
	clk=1;
        #11;
        `equals(pulse , 1'b0, "t4");  // pulse low

        #30; //should be into phase after end of pulse
        `equals(pulse , 1'b1, "t6");
	clk=0;
        
	// Same sequence but with enabled low
	clk_en = 0;
        #10; // let the X settle out
        `equals(pulse , 1'b1, "t2");

	// as clock goes high would normally get pulse
	clk=1;
        #11;
        `equals(pulse , 1'b1, "t4");  // no pulse low

        #30; //should be into phase after end ofpule
        `equals(pulse , 1'b1, "t6");
        
        #400 $finish;
    end

endmodule
