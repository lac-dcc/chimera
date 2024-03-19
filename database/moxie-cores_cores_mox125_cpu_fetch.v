// cpu_fetch.v - The instruction fetch unit
//
// Copyright (c) 2010, 2011, 2012, 2017 Anthony Green.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

// branch_flag_i - set high when we need to flush the pipeline and
//                 move to a new PC (branch_target_i).

module cpu_fetch #(parameter BOOT_ADDRESS = 32'h00001000
		   )(/*AUTOARG*/
   // Outputs
   imem_address_o, imem_stb_o, imem_cyc_o, PC_o, opcode, valid,
   operand, imem_sel_o,
   // Inputs
   rst_i, clk_i, imem_data_i, imem_ack_i, branch_flag_i,
   branch_target_i, stall_i
   );
  
  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;
  
  // --- Instruction memory ---------------------------------------
  output [31:0] imem_address_o;
  input  [15:0] imem_data_i;
  output 	imem_stb_o;
  output [1:0]	imem_sel_o;
  output 	imem_cyc_o;
  output [31:0] PC_o;
  input 	imem_ack_i;

  // --- Branch controls ------------------------------------------
  input 	branch_flag_i;
  input [31:0]	branch_target_i;
  
  // --- Pipeline interlock ---------------------------------------
  input stall_i;
  
  // --- Instruction Buffer ---------------------------------------
  output [15:0] opcode;
  output [0:0] 	valid;
  output [31:0] operand;

  // The program counter that we're using for fetching.
  wire [31:0] 	fetchPC;
  reg [31:0] 	nextPC;

  wire [0:0] 	valid, full, rden, wren;
  wire [0:0] 	newPC_p;
  wire [15:0]   opcode;
  wire [31:0]   operand;

  wire [31:0]  imem_address_o;
  
  // This is a rediculous bit of logic.  We should try to recode the
  // moxie instructions so that we can determine the length with less
  // logic.
  function [0:0] is_48bit_insn;
    input [7:0] op;
    is_48bit_insn = ((op == 8'h01) //  ldi.l
		    | (op == 8'h03) // jsra
		    | (op == 8'h08) // lda.l
		    | (op == 8'h09) // sta.l
		    | (op == 8'h1a) // jmpa
		    | (op == 8'h1b) // ldi.b
		    | (op == 8'h1d) // lda.b
		    | (op == 8'h1f) // sta.b
		    | (op == 8'h20) // ldi.s
		    | (op == 8'h22) // lda.s
		    | (op == 8'h24) // sta.s
		    | (op == 8'h25) // jmp
		    | (op == 8'h30)); // swi
  endfunction

   function [0:0] is_32bit_insn;
    input [7:0] op;
    is_32bit_insn = ((op == 8'h0c) // ldo.l
		    | (op == 8'h0d) // sto.l
		    | (op == 8'h36) // ldo.b
		    | (op == 8'h37) // sto.b
		    | (op == 8'h38) // ldo.s
		    | (op == 8'h39)); // sto.s
  endfunction

//  wire [15:0] 	cache_op;
  // assign opcode[15:0] = (valid & !stall_i) ? cache_op : 8'b00001111;
    
  icache cache (
		// Outputs
		.inst_o (opcode),
		.data_o (operand[31:0]),
		.hit_o (valid),
		.wb_adr_o (imem_address_o),
		.wb_sel_o (imem_sel_o),
		.wb_cyc_o (imem_cyc_o),
		.wb_stb_o (imem_stb_o),

		// Inputs
		.rst_i	(rst_i),
		.clk_i	(clk_i),
		.adr_i	(fetchPC),
		.stb_i	(!stall_i),
		.wb_dat_i (imem_data_i),
		.wb_ack_i (imem_ack_i));

  assign fetchPC = branch_flag_i ? branch_target_i : nextPC;
  assign PC_o = fetchPC;

  always @(posedge clk_i) begin
     nextPC <= rst_i ? BOOT_ADDRESS : (valid & !stall_i ? fetchPC + 2 + (is_48bit_insn (opcode[15:8]) ? 4 : is_32bit_insn (opcode[15:8]) ? 2 : 0) : fetchPC);
  end

endmodule // cpu_fetch
