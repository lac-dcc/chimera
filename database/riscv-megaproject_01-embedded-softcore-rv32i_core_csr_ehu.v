// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 This module is the CSR register file and Exception Handling Unit
 
 The CSR RF is pipelined.
 
 All exceptions are handled in the XB stage. The naming prefix XB_FD_
 means an exception originates from FD stage, but currently is in XB
 stage.
 
 */

module csr_ehu
  (
   // Stateful
   clk, resetb, XB_bubble,
   // Control
   read, write, set, clear, imm, a_rd,
   initiate_illinst, initiate_misaligned,
   // Exception In
   XB_FD_exception_unsupported_category,
   XB_FD_exception_illegal_instruction,
   XB_FD_exception_instruction_misaligned,
   XB_FD_exception_load_misaligned,
   XB_FD_exception_store_misaligned,
   // Data
   src_dst, d_rs1, uimm, FD_pc, XB_pc, data_out, csr_mepc
   );
`include "core/csrlist.vh"
   input wire clk, resetb, XB_bubble;
   // CSR read, write, set, clear; imm means operand is an immediate
   // or from register
   input wire read, write, set, clear, imm;
   input wire [4:0] a_rd;
   input wire [11:0] src_dst;
   input wire [31:0] FD_pc, XB_pc, d_rs1;
   input wire [4:0]  uimm;
   input wire	     XB_FD_exception_unsupported_category;
   input wire	     XB_FD_exception_illegal_instruction;
   input wire	     XB_FD_exception_instruction_misaligned;
   input wire	     XB_FD_exception_load_misaligned;
   input wire	     XB_FD_exception_store_misaligned;
   output reg [31:0] data_out;
   output reg 	     initiate_illinst, initiate_misaligned;
   output wire [31:0] csr_mepc;
   reg 		      XB_exception_illegal_instruction;
   reg [31:0] 	      mepc;
   reg [31:0] 	      mscratch, mcause, mtval;
   reg [63:0] 	      mcycle, minstret;

   wire 	      initiate_exception;
   wire 	      FD_exception, XB_exception;
   // There exists an exception from FD stage
   assign FD_exception = XB_FD_exception_unsupported_category |
   		         XB_FD_exception_illegal_instruction |
   		         XB_FD_exception_instruction_misaligned |
   		         XB_FD_exception_load_misaligned |
   		         XB_FD_exception_store_misaligned;
   // There exists an exception from XB stage
   assign XB_exception = XB_exception_illegal_instruction;
   // There exists an exception
   assign initiate_exception = XB_exception | FD_exception;
   // Output for PC update
   assign csr_mepc = mepc;

   // Exception Handling Unit. XB exceptions have higher priority
   // since XB instruction is senior. XB must not be a bubble
   always @ (*) begin : EXCEPTION_HANDLING_UNIT
      initiate_illinst
	= ~XB_bubble & (XB_exception_illegal_instruction |
      			XB_FD_exception_illegal_instruction |
      			XB_FD_exception_unsupported_category);
      initiate_misaligned
	= ~XB_bubble & (XB_FD_exception_instruction_misaligned |
      			XB_FD_exception_load_misaligned |
      			XB_FD_exception_store_misaligned);
   end

   // The operand to operate on target CSR
   wire [31:0] 	     operand;
   assign operand = imm ? {27'b0, uimm} : d_rs1;

   wire 	     really_read, really_write, really_set, really_clear;
   // If rd/uimm field is 0, then do not perform operation to prevent
   // side effect
   assign really_read = read && (a_rd != 5'b0);
   assign really_write = write && !(imm && uimm == 5'b0);
   assign really_set = set && (uimm != 5'b0);
   assign really_clear = clear && (uimm != 5'b0);

   always @ (posedge clk, negedge resetb) begin : CSR_PIPELINE
      if (!resetb) begin
	 mcycle <= 64'b0;
	 minstret <= 64'b0;
	 mepc <= 32'bX;
	 data_out <= 32'bX;
      end
      else if (clk) begin
	 XB_exception_illegal_instruction = 1'b0;
	 mcycle <= mcycle + 64'b1;
	 if (!XB_bubble) begin
	    // Instruction is committed when it is not a bubble
	    minstret <= minstret + 64'b1;
	 end
	 // CSR register file
	 case (src_dst)
	   `CSR_MVENDORID: begin
	      if (really_read) data_out <= 32'b0;
	   end
	   `CSR_MARCHID: begin
	      if (really_read) data_out <= 32'b0;
	   end
	   `CSR_MIMPID: begin
	      if (really_read) data_out <= 32'b0;
	   end
	   `CSR_MHARTID: begin
	      if (really_read) data_out <= 32'b0;
	   end
	   `CSR_MISA: begin
	      // 32-bit, I subset. Read RISC-V Spec Vol 2
	      if (really_read) data_out <= 32'b0100_0000_0000_0000_0000_0001_0000_0000;
	   end
	   `CSR_MTVEC: begin
	      // Direct
	      if (really_read) data_out <= 32'b0;
	   end
	   `CSR_MSCRATCH: begin
	      if (really_read) data_out <= mscratch;
	      if (really_write) mscratch <= operand;
	      if (really_set) mscratch <= mscratch | operand;
	      if (really_clear) mscratch <= mscratch & ~operand;
	   end
	   `CSR_MEPC: begin
	      if (really_read) data_out <= mepc;
	      if (really_write) mepc <= operand;
	      if (really_set) mepc <= mepc | operand;
	      if (really_clear) mepc <= mepc & ~operand;
	   end
	   `CSR_MCAUSE: begin
	      if (really_read) data_out <= mcause;
	      if (really_write) mcause <= operand;
	      if (really_set) mcause <= mcause | operand;
	      if (really_clear) mcause <= mcause & ~operand;
	   end
	   `CSR_MTVAL: begin
	      if (really_read) data_out <= mtval;
	      if (really_write) mtval <= operand;
	      if (really_set) mtval <= mtval | operand;
	      if (really_clear) mtval <= mtval & ~operand;
	   end
	   `CSR_MCYCLE: begin
	      if (really_read) data_out <= mcycle[0+:32];
	      if (really_write) mcycle[0+:32] <= operand;
	      if (really_set) mcycle[0+:32] <= mcycle[0+:32] | operand;
	      if (really_clear) mcycle[0+:32] <= mcycle[0+:32] & ~operand;
	   end
	   `CSR_MINSTRET: begin
	      if (really_read) data_out <= minstret[0+:32];
	      if (really_write) minstret[0+:32] <= operand;
	      if (really_set) minstret[0+:32] <= minstret[0+:32] | operand;
	      if (really_clear) minstret[0+:32] <= minstret[0+:32] & ~operand;
	   end
	   `CSR_MCYCLEH: begin
	      if (really_read) data_out <= mcycle[32+:32];
	      if (really_write) mcycle[32+:32] <= operand;
	      if (really_set) mcycle[32+:32] <= mcycle[32+:32] | operand;
	      if (really_clear) mcycle[32+:32] <= mcycle[32+:32] & ~operand;
	   end
	   `CSR_MINSTRETH: begin
	      if (really_read) data_out <= minstret[32+:32];
	      if (really_write) minstret[32+:32] <= operand;
	      if (really_set) minstret[32+:32] <= minstret[32+:32] | operand;
	      if (really_clear) minstret[32+:32] <= minstret[32+:32] & ~operand;
	   end
	   default: begin
	      // Performance monitors are hard wired to 0
	      if (src_dst[11:4] == 8'hB0 || 
		  src_dst[11:4] == 8'hB1 ||
		  src_dst[11:4] == 8'hB8 ||
		  src_dst[11:4] == 8'hB9 ||
		  src_dst[11:4] == 8'h32 ||
		  src_dst[11:4] == 8'h33
		  ) begin : PERFORMANCE_MONITORS
		 data_out <= 32'b0;
	      end
	      else begin
		 // Unknown CSR raise exceptions
		 if (~XB_bubble & (read|write|set|clear))
		   XB_exception_illegal_instruction = 1'b1;
	      end // else: !if(src_dst[11:4] == 8'hB0 ||...
	   end // case: default
	 endcase // case (src_dst)
	 // Magic numbers are from RISC-V Spec Vol 2
	 if (XB_exception) begin
	    // NOTE: This confusing statement is caused by the
	    // internal pipeline of the CSR. CSR has one stage
	    // pipeline, so even though the exception is supposed to
	    // happen in XB stage, a CSR exception's PC is in FD stage
	    mepc <= FD_pc;
	    mcause <= 32'd2; // Illegal Instruction
	 end
	 else if (FD_exception) begin
	    mepc <= XB_pc;
	    if (XB_FD_exception_instruction_misaligned) begin
	       mcause <= 32'd0;
	    end
	    else if (XB_FD_exception_illegal_instruction |
		     XB_FD_exception_unsupported_category) begin
	       mcause <= 32'd2;
	    end
	    else if (XB_FD_exception_load_misaligned) begin
	       mcause <= 32'd4;
	    end
	    else if (XB_FD_exception_store_misaligned) begin
	       mcause <= 32'd6;
	    end
	 end
      end // if (clk)
   end // block: CSR_PIPELINE
   
endmodule // csrrf
