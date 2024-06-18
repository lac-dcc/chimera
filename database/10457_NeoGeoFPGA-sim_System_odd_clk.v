// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module lspc2_clk(
	input CLK_24M,
	input nRESETP,
	output CLK_8M,
	output CLK_4M,
	output reg CLK_4MB
);

	reg [1:0] POS_CNT;
	reg [1:0] NEG_CNT;
	
	assign CLK_4M = ~CLK_4MB;
	
	always @(posedge CLK_24M or negedge nRESETP)
	begin
		if (!nRESETP)
			POS_CNT <= 2'b0;
		else
			POS_CNT <= (POS_CNT == 2) ? 2'b0 : POS_CNT + 1'b1;
	end

	always @(negedge CLK_24M or negedge nRESETP)
	begin
		if (!nRESETP)
			NEG_CNT <= 2'b0;
		else
			NEG_CNT <= (NEG_CNT == 2) ? 2'b0 : NEG_CNT + 1'b1;
	end
	
	assign CLK_8M = (|{POS_CNT} && |{NEG_CNT});
	
	always @(negedge CLK_8M or negedge nRESETP)
	begin
		if (!nRESETP)
			CLK_4MB <= 1'b0;
		else
			CLK_4MB = ~CLK_4MB;
	end
	
endmodule
