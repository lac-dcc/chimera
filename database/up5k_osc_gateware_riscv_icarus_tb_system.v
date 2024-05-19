// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// tb_system.v - testbench for RISC-V system
// 04-26-21 E. Brombaugh

`timescale 1ns/1ps
`default_nettype none

module tb_system;
    reg clk;
    reg reset;
	reg rx;
	wire tx;
	reg [11:0] a0, a1, a2, a3;
	wire [31:0] gp_out;
	
    // 24 MHz clock source
    always
        #(2*10.4167) clk = ~clk;
    
    // reset
    initial
    begin
`ifdef icarus
  		$dumpfile("tb_system.vcd");
		$dumpvars;
`endif
		
       // init regs
        clk = 1'b0;
        reset = 1'b1;
		rx = 1'b1;
		a0 = 12'h000;
		a1 = 12'h000;
		a2 = 12'h000;
		a3 = 12'h000;
		
        // release reset
        #1000
        reset = 1'b0;
        
`ifdef icarus
        // stop after 1 sec
		//#12000000 $finish;
		#700000 $finish;
`endif
    end
	
    // Unit under test
	system u_riscv(
		.clk24(clk),
		.reset(reset),
		.RX(rx),
		.TX(tx),
		.gp_in0({20'h00000,a0}),
		.gp_in1({20'h00000,a1}),
		.gp_in2({20'h00000,a2}),
		.gp_in3({20'h00000,a3}),
		.gp_out(gp_out)
	);
endmodule
