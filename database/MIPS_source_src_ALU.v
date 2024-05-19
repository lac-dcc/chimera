// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:58 12/29/2016 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module ALU(
input wire signed [31:0]		opa,
input wire signed [31:0]		opb,
input wire [3:0]				cmd,
output wire signed [31:0]		res
    );
		
	wire [5:0]				     shift;
	
	wire [31:0]                    dsp_a;
	wire [31:0]                    dsp_b;
	wire                           dsp_sel;
	wire [31:0]                    dsp_out;                       
	
	
	/* instantiate of the ADD/SUB of DSP */
	assign dsp_a = opa;
	assign dsp_b = opb;
	assign dsp_sel = (cmd == `ALU_ADD) ? 1'b1 : 1'b0;
	c_addsub_0 addsub_dsp_inst(
	   .A(     dsp_a       ),
	   .B(     dsp_b       ),
	   .ADD(   dsp_sel     ),
	   .S(     dsp_out     )
	);
	
	/* the ALU operation */
	assign shift = opb[5:0];
	assign res = OUT(opa, opb, dsp_out, shift, cmd);
					
	function signed [31:0] OUT;
		input signed [31:0] opa;
		input signed [31:0] opb;
		input signed [31:0] dsp_out;
		input [5:0]			   shift;
		input [3:0]	 		   cmd;
		begin
			case( cmd )
			`ALU_AND: 	OUT = opa & opb;
			`ALU_OR:  	OUT = opa | opb;
            `ALU_ADD:   OUT = dsp_out;
            `ALU_SUB:   OUT = dsp_out;
			`ALU_SLT: 	OUT = (opa < opb) ? 32'd1 : 32'd0;
			`ALU_NOR: 	OUT = ~(opa | opb);
			`ALU_XOR: 	OUT = opa ^ opb;
			`ALU_LU:	OUT = {opb[15:0], 16'h0};
			`ALU_SLLV:	OUT = opa << shift;
			`ALU_SRLV:	OUT = opa >> shift;
			default: OUT = 32'hxxxxxxxx;
			endcase
		end
	endfunction

endmodule
