// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2016 11:59:53 AM
// Design Name: 
// Module Name: dram_syn_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dram_syn_test(a, dpra, clk, din, we, qdpo_ce, qdpo, reset_n);

	parameter ADDRESSWIDTH = 6;
	parameter BITWIDTH     = 1;
	parameter DEPTH       = 34;

	input clk, we, qdpo_ce;
	input reset_n;
	input [BITWIDTH-1:0] din;
	input [ADDRESSWIDTH-1:0] a, dpra;

	output [BITWIDTH-1:0] qdpo;

	(* ram_style = "distributed", ARRAY_UPDATE="RW"*)
	reg [BITWIDTH-1:0] ram [DEPTH-1:0];
	reg [BITWIDTH-1:0] qdpo_reg;

	always @(posedge clk) begin
		if      (we)           begin    ram [a] <= din;    end

		if      (!reset_n)     begin    qdpo_reg <= {BITWIDTH{1'b0}};  end
		else if (qdpo_ce)      begin    qdpo_reg <= ram[dpra];         end  // read
	end

	assign qdpo = qdpo_reg;

endmodule
