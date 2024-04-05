// moxie.v - Top level Moxie Core
//
// Copyright (c) 2009, 2010, 2011, 2012, 2017  Anthony Green.
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

`include "defines.h"

module moxie (/*AUTOARG*/
  // Outputs
  wb_dat_o, wb_adr_o, wb_sel_o, wb_we_o, wb_cyc_o, wb_stb_o,
  // Inputs
  rst_i, clk_i, wb_dat_i, wb_ack_i
  );
   
  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;
  reg 	 rst;

  // --- Wishbone Interconnect ------------------------------------
  input [15:0]  wb_dat_i;
  output [15:0] wb_dat_o;
  output [31:0] wb_adr_o;
  output [1:0]   wb_sel_o;
  output        wb_we_o;
  output        wb_cyc_o;
  output        wb_stb_o;
  input         wb_ack_i;

  // --- Wishbone Interconnect for INSTRUCTION Memory -------------
  wire [15:0]  wb_I_dat_i;
  wire [15:0]  wb_I_dat_o;
  wire [31:0]  wb_I_adr_o;
  wire [1:0]   wb_I_sel_o;
  wire         wb_I_we_o;
  wire         wb_I_cyc_o;
  wire         wb_I_stb_o;
  wire         wb_I_ack_i;

 // --- Wishbone Interconnect for DATA Memory --------------------
  wire [15:0]  wb_D_dat_i;
  wire [15:0]  wb_D_dat_o;
  wire [31:0]  wb_D_adr_o;
  wire [1:0]   wb_D_sel_o;
  wire         wb_D_we_o;
  wire         wb_D_cyc_o;
  wire         wb_D_stb_o;
  wire         wb_D_ack_i;

  // --- Wishbone bus arbitration ---------------------------------
  assign wb_I_dat_i = wb_dat_i;
  assign wb_D_dat_i = wb_dat_i;
  assign wb_dat_o = wb_D_dat_o;
  assign wb_adr_o = wb_D_cyc_o ? wb_D_adr_o : wb_I_adr_o;
  assign wb_sel_o = wb_D_cyc_o ? wb_D_sel_o : 2'b11;
  assign wb_we_o = wb_D_cyc_o ? wb_D_we_o : 1'b0;
  assign wb_cyc_o = wb_D_cyc_o | wb_I_cyc_o;
  assign wb_stb_o = wb_D_cyc_o ? wb_D_stb_o : wb_I_stb_o;
  assign wb_I_ack_i  = wb_D_cyc_o ? 1'b0 : wb_ack_i;
  assign wb_D_ack_i  = wb_D_cyc_o ? wb_ack_i : 1'b0;

  // --- Wires to connect the 5 pipeline stages -------------------
  //
  //  Prefix codes for the control signals
  //        fd - Fetch to Decode
  //        dx - Decode to Execute
  //        rx - Register File to Execute
  //        xr - Execute to Register File

  wire [15:0] fd_opcode;
  wire [31:0] fd_operand;
  wire [31:0] fd_PC;
  wire [0:0]  fd_valid;
  wire [31:0] dx_operand;
  wire [31:0] dx_PC;
  wire [31:0] xw_PC;
  wire [`PCB_WIDTH-1:0] dx_pipeline_control_bits;
  wire [6:0]  dx_op;
  wire [9:0]  dx_pcrel_offset;
  wire [`PCB_WIDTH-1:0] xw_pipeline_control_bits;
  wire [0:0]  xr_register1_write_enable;
  wire [0:0]  xr_register2_write_enable;
  wire [3:0]  dx_register1_write_index;
  wire [3:0]  dx_register2_write_index;
  wire [3:0]  xr_register1_write_index;
  wire [3:0]  xr_register2_write_index;
  wire [31:0] xw_memory_address;
  wire [31:0] xr_reg1_result;
  wire [31:0] xr_reg2_result;
  wire [31:0] xw_mem_result;
  wire [3:0]  dx_regA;
  wire [3:0]  dx_regB;
  wire [3:0]  dx_regC;

  // Stack and frame pointers
  wire [31:0] rx_sp;
  wire [31:0] rx_fp;

  wire [0:0]  xf_branch_flag;
  wire [31:0] xf_branch_target;
 
  wire [31:0] rx_reg_value1;
  wire [31:0] rx_reg_value2;
  wire [3:0]  dr_reg_index1;
  wire [3:0]  dr_reg_index2;

  wire [0:0]  flush_x;

`ifndef VERILATOR   
  // synthesis translate_off 
  initial
    begin
      $dumpvars(1,stage_fetch); 
      $dumpvars(1,stage_fetch.cache); 
      $dumpvars(1,stage_decode); 
      $dumpvars(1,stage_decode.mcode); 
      $dumpvars(1,stage_execute); 
      $dumpvars(1,stage_write);
      $dumpvars(1,stage_write.cache);
      $dumpvars(1,regs);
      $display("-- BEGINNING --");
    end
  // synthesis translate_on
`endif

  cpu_registerfile regs (// Outputs
			 .value0_o (rx_reg_value1), 
			 .value1_o (rx_reg_value2),
			 // Inputs
			 .rst_i			(rst_i),
			 .clk_i			(clk_i),
			 .write_enable0_i (xr_register1_write_enable),
			 .write_enable1_i (xr_register2_write_enable), 
			 .reg_write_index0_i (xr_register1_write_index),
			 .reg_write_index1_i (xr_register2_write_index),
			 .reg_read_index0_i (dr_reg_index1), 
			 .reg_read_index1_i (dr_reg_index2),
			 .sp_o (rx_sp),
			 .fp_o (rx_fp),
			 .value0_i (xr_reg1_result),
			 .value1_i (0));

  // Forwarding logic.  
  wire forward_1_to_1;
  wire forward_1_to_2;
  wire forward_2_to_1;
  wire forward_2_to_2;
  reg maybe_forward_1_to_1;
  reg maybe_forward_1_to_2;
  reg maybe_forward_2_to_1;
  reg maybe_forward_2_to_2;
  reg [31:0] maybe_reg1;
  reg [31:0] maybe_reg2;
  
  // Memory stall logic.
  reg  memory_wait_state;

  parameter STATE_READY = 1'b0,
    STATE_MEMWAIT = 1'b1;
  
  always @(posedge rst_i or posedge clk_i)
    if (rst_i) begin
      memory_wait_state <= STATE_READY;
    end else begin
      case (memory_wait_state)
	STATE_READY:
	  begin
	    memory_wait_state <= wb_we_o ? STATE_MEMWAIT : STATE_READY;
	  end
	STATE_MEMWAIT:
	  begin
	    memory_wait_state <= wb_ack_i ? STATE_READY : STATE_MEMWAIT;
	  end
      endcase // case (memory_wait_state)
    end

  cpu_fetch stage_fetch (// Outputs
			 .opcode		(fd_opcode[15:0] ),
			 .valid		        (fd_valid),
			 .operand		(fd_operand[31:0]),
			 .imem_address_o        (wb_I_adr_o[31:0]),
			 .imem_stb_o            (wb_I_stb_o),
			 .imem_cyc_o            (wb_I_cyc_o),
			 .imem_sel_o            (),
			 .imem_ack_i            (wb_I_ack_i),
			 .PC_o                  (fd_PC[31:0]),
			 // Inputs
			 .rst_i			(rst_i),
			 .clk_i			(clk_i),
			 .branch_flag_i         (xf_branch_flag),
			 .branch_target_i       (xf_branch_target),
			 .stall_i               ((wb_we_o == 1) | (memory_wait_state == STATE_MEMWAIT)),
			 .imem_data_i           (wb_I_dat_i[15:0]));

  cpu_decode stage_decode (// Inputs
			   .rst_i			(rst_i),
			   .clk_i			(clk_i),
			   .opcode_i		(fd_opcode[15:0]),
			   .operand_i		(fd_operand[31:0]),
			   .PC_i                (fd_PC[31:0]),
			   .valid_i		(fd_valid),
			   .flush_i             (flush_x),
			   .branch_flag_i       (xf_branch_flag),
			   .stall_i             ((wb_we_o == 1) | (memory_wait_state == STATE_MEMWAIT)),
			   // Outputs
			   .pipeline_control_bits_o (dx_pipeline_control_bits),
			   .register1_write_index_o (dx_register1_write_index),
			   .register2_write_index_o (dx_register2_write_index),
			   .forward_1_to_1_o (forward_1_to_1),
			   .forward_1_to_2_o (forward_1_to_2),
			   .forward_2_to_1_o (forward_2_to_1),
			   .forward_2_to_2_o (forward_2_to_2),
			   .operand_o (dx_operand),
			   .PC_o (dx_PC),
			   .riA_o (dr_reg_index1),
			   .riB_o (dr_reg_index2),
			   .pcrel_offset_o (dx_pcrel_offset),
			   .op_o (dx_op));

  cpu_execute stage_execute (// Inputs
			     .rst_i	     (rst_i),
			     .clk_i	     (clk_i),
			     .flush_i        (1'b0),
			     .flush_o        (flush_x),
			     .stall_i        ((wb_we_o == 1) | (memory_wait_state == STATE_MEMWAIT)),
			     .op_i           (dx_op),
			     .PC_i           (dx_PC),
			     .PC_o           (xw_PC),
			     .dmem_address_o (wb_D_adr_o[31:0]),
			     .dmem_stb_o     (wb_D_stb_o),
			     .dmem_cyc_o     (wb_D_cyc_o),
			     .dmem_sel_o     (wb_D_sel_o),
			     .dmem_ack_i     (wb_D_ack_i),
			     .dmem_data_i    (wb_D_dat_i[15:0]),
			     .dmem_data_o    (wb_D_dat_o[15:0]),
			     .dmem_we_o      (wb_D_we_o),
			     .pcrel_offset_i (dx_pcrel_offset),
			     .operand_i		(dx_operand[31:0]),
			     .regA_i (xf_branch_flag ? rx_reg_value1 : (forward_1_to_1 ? xr_reg1_result : (forward_2_to_1 ? xr_reg2_result : (maybe_forward_1_to_1 ? maybe_reg1 : rx_reg_value1)))),
			     .regB_i (xf_branch_flag ? rx_reg_value2 : (forward_2_to_2 ? xr_reg2_result : (forward_1_to_2 ? xr_reg1_result : rx_reg_value2))),
			     .branch_flag_o (xf_branch_flag),
			     .branch_target_o (xf_branch_target),
			     .pipeline_control_bits_i (dx_pipeline_control_bits),
			     .register1_write_index_i (dx_register1_write_index),
			     .register2_write_index_i (dx_register2_write_index),
			     // Outputs
			     .pipeline_control_bits_o (xw_pipeline_control_bits),
			     .register1_write_index_o (xr_register1_write_index),
			     .register2_write_index_o (xr_register2_write_index),
			     .reg1_result_o (xr_reg1_result),
			     .reg2_result_o (xr_reg2_result),
			     .mem_result_o (xw_mem_result),
			     .memory_address_o (xw_memory_address),
			     .sp_i (rx_sp),
			     .fp_i (rx_fp),
			     .register_wea_o (xr_register1_write_enable),
			     .register_web_o (xr_register2_write_enable));
  
  cpu_write stage_write (  // Inputs
			   .rst_i (rst_i),
			   .clk_i (clk_i),
			   .PC_i           (xw_PC),
			   .pipeline_control_bits_i (xw_pipeline_control_bits),
			   .memory_address_i (xw_memory_address),
			   .mem_result_i (xw_mem_result) );

  always @(posedge rst_i or posedge clk_i)
    if (rst_i) begin
      maybe_forward_1_to_1 <= 0;
      maybe_forward_1_to_2 <= 0;
      maybe_forward_2_to_1 <= 0;
      maybe_forward_2_to_2 <= 0;
    end else begin
      maybe_forward_1_to_1 <= xr_register1_write_enable
			      & (xr_register1_write_index == dr_reg_index1);
      maybe_forward_2_to_1 <= xr_register2_write_enable
			      & (xr_register2_write_index == dr_reg_index1);
      maybe_forward_1_to_2 <= xr_register1_write_enable
			      & (xr_register1_write_index == dr_reg_index2);
      maybe_forward_2_to_2 <= xr_register2_write_enable
			      & (xr_register2_write_index == dr_reg_index2);
      maybe_reg1 <= xr_reg1_result;
      maybe_reg2 <= xr_reg2_result;
    end

endmodule // moxie
