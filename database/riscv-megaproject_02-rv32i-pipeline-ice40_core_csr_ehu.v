// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 * This module is the CSR register file and Exception Handling Unit
 *
 * The CSR RF is pipelined.
 * 
 * All exceptions are handled in the XB stage. The naming prefix XB_FD_
 * means an exception originates from FD stage, but currently is in XB
 * stage.
 */

module csr_ehu
  (
   // Stateful
   clk, resetb, XB_bubble,
   // Control
   read, write, set, clear, imm, a_rd,
   initiate_exception,
   // Exception In
   XB_FD_exception_illegal_instruction,
   XB_FD_exception_ecall,
   XB_FD_exception_ebreak,
   XB_FD_exception_instruction_misaligned,
   XB_FD_exception_load_misaligned,
   XB_FD_exception_store_misaligned,
   irq_mtimecmp,
   // Data
   src_dst, d_rs1, uimm, FD_aluout, 
   nextPC, XB_pc, 
   data_out, csr_mepc, csr_mtvec
   );
`include "core/csrlist.vh"
   input wire clk, resetb, XB_bubble;
   // CSR read, write, set, clear; imm means operand is an immediate
   // or from register
   input wire read, write, set, clear, imm;
   input wire [4:0] a_rd;
   input wire [11:0] src_dst;
   input wire [31:2] XB_pc;
   input wire [31:0] d_rs1, FD_aluout, nextPC;
   input wire [4:0]  uimm;
   input wire	     XB_FD_exception_illegal_instruction;
   input wire	     XB_FD_exception_ecall;
   input wire	     XB_FD_exception_ebreak;
   input wire	     XB_FD_exception_instruction_misaligned;
   input wire	     XB_FD_exception_load_misaligned;
   input wire	     XB_FD_exception_store_misaligned;
   input wire        irq_mtimecmp;
   output reg [31:0] data_out;
   output reg 	     initiate_exception;
   output wire [31:0] csr_mepc;
   output wire [31:0] csr_mtvec;
   reg 		      XB_exception_illegal_instruction;
   reg [31:2] 	      mepc;
   reg [31:0] 	      mscratch, mcause, mtval;
   reg [31:2] 	      mtvec;
   reg 		      mpie, mie;
   reg 		      mtie;
   reg [63:0] 	      mcycle, minstret;

   reg 		     irq_mtimecmp_p;

   wire 	      FD_exception, XB_exception;
   // Output for PC update
   assign csr_mepc = {mepc[31:2], 2'b0};
   // Output for Machine Trap Vector Base Addr
   assign csr_mtvec = {mtvec[31:2], 2'b0};

   // Exception Handling Unit. XB exceptions have higher priority
   // since XB instruction is senior. XB must not be a bubble
   reg 		      initiate_irq_mtimecmp,
		      initiate_illinst, initiate_misaligned, 
		      initiate_ecall, initiate_ebreak;
   always @ (*) begin : EXCEPTION_HANDLING_UNIT
      // Timer interrupt is executed only once 
      initiate_irq_mtimecmp
	= mtie & irq_mtimecmp & ~irq_mtimecmp_p;
      initiate_ecall
        = ~XB_bubble & XB_FD_exception_ecall;
      initiate_ebreak
        = ~XB_bubble & XB_FD_exception_ebreak;
      initiate_illinst
        = ~XB_bubble & (XB_exception_illegal_instruction |
			XB_FD_exception_illegal_instruction);
      initiate_misaligned
        = ~XB_bubble & (XB_FD_exception_instruction_misaligned |
			XB_FD_exception_load_misaligned |
			XB_FD_exception_store_misaligned);

      initiate_exception = initiate_irq_mtimecmp 
			   | initiate_ecall | initiate_ebreak
			   | initiate_illinst | initiate_misaligned;
      //initiate_exception = initiate_illinst | initiate_misaligned;
   end

   // There exists an exception from FD stage
   assign FD_exception = XB_FD_exception_illegal_instruction |
			 XB_FD_exception_ecall |
			 XB_FD_exception_ebreak |
			 XB_FD_exception_instruction_misaligned |
			 XB_FD_exception_load_misaligned |
			 XB_FD_exception_store_misaligned;
   // There exists an exception from XB stage
   assign XB_exception = XB_exception_illegal_instruction | initiate_irq_mtimecmp;

   // The operand to operate on target CSR
   wire [31:0] 	     operand;
   assign operand = imm ? {27'b0, uimm} : d_rs1;

   wire 	     really_read, really_write, really_set, really_clear;
   // If rd/uimm field is 0, then do not perform operation to prevent
   // side effect
   assign really_read = read && (a_rd != 5'b0);
   assign really_write = write;
   assign really_set = set && (uimm != 5'b0);
   assign really_clear = clear && (uimm != 5'b0);

   reg [31:0] 	     badaddr_p, nextPC_p;

   /* verilator lint_off BLKSEQ */
   always @ (posedge clk) begin : CSR_PIPELINE
      if (!resetb) begin
         mcycle <= 64'b0;
         minstret <= 64'b0;
         mepc <= 30'bX;
         data_out <= 32'bX;
         mtvec[31:2] <= 30'h1; // or, 0x4
         // No interrupt on reset
         mpie <= 1'b0;
         mie <= 1'b0;
	 mtie <= 1'b0;
         badaddr_p <= 32'bX;
         nextPC_p <= 32'bX;
	 irq_mtimecmp_p <= 1'b0;
      end
      else if (clk) begin
         XB_exception_illegal_instruction = 1'b0;
         mcycle <= mcycle + 64'b1;
         // On trap, mpie is updated
         if (initiate_exception) mpie <= mie;
	 irq_mtimecmp_p <= irq_mtimecmp;

         if (!XB_bubble) begin
            // Instruction is committed when it is not a bubble
            minstret <= minstret + 64'b1;
         end
         // Badaddr is the address output from the FD ALU
         badaddr_p <= FD_aluout;
         nextPC_p <= nextPC;
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
	   `CSR_MSTATUS: begin
              if (really_read) 
		data_out <= {19'b0,2'b11,3'b0,mpie,3'b0,mie,3'b0};
              if (really_write) begin
		 mpie <= operand[7];
		 mie <= operand[3];
              end
              if (really_set) begin
		 mpie <= operand[7] ? 1 : mpie;
		 mie <= operand[3] ? 1 : mie;
              end
              if (really_clear) begin
		 mpie <= operand[7] ? 0 : mpie;
		 mie <= operand[3] ? 0 : mie;
              end
	   end
	   `CSR_MISA: begin
              // 32-bit, I subset. Read RISC-V Spec Vol 2
              if (really_read) data_out <= 32'b0100_0000_0000_0000_0000_0001_0000_0000;
	   end
	   `CSR_MIE: begin
	      if (really_read) data_out <= {24'b0, mtie, 7'b0};
	      if (really_write) mtie <= operand[7];
	      if (really_set) mtie <= mtie | operand[7];
	      if (really_clear) mtie <= mtie & ~operand[7];
	   end
	   `CSR_MTVEC: begin
	      // Direct
	      if (really_read) data_out <= {mtvec[31:2], 2'b0};
	      if (really_write) mtvec[31:2] <= operand[31:2];
	      if (really_set) mtvec[31:2] <= mtvec[31:2] | operand[31:2];
	      if (really_clear) mtvec[31:2] <= mtvec[31:2] & ~operand[31:2];
	   end
	   `CSR_MSCRATCH: begin
	      if (really_read) data_out <= mscratch;
	      if (really_write) mscratch <= operand;
	      if (really_set) mscratch <= mscratch | operand;
	      if (really_clear) mscratch <= mscratch & ~operand;
	   end
	   `CSR_MEPC: begin
	      if (really_read) data_out <= {mepc, 2'b0};
	      if (really_write) mepc[31:2] <= operand[31:2];
	      if (really_set) mepc[31:2] <= mepc[31:2] | operand[31:2];
	      if (really_clear) mepc[31:2] <= mepc & ~operand[31:2];
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
	   `CSR_MIP: begin
	      if (really_read) data_out <= {24'b0, irq_mtimecmp, 7'b0};
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
            // Note that timer interrupt has higher priority
	    mepc <= XB_pc[31:2];
            if (initiate_irq_mtimecmp) begin
	       mcause <= {1'b0, 31'd7};
	       mtval <= 32'b0;
            end
            else if (XB_exception_illegal_instruction) begin
               mcause <= 32'd2; // Illegal Instruction
               mtval <= 32'b0;
            end
         end
         else if (FD_exception) begin
            mepc <= XB_pc[31:2];
            if (XB_FD_exception_instruction_misaligned) begin
               mcause <= 32'd0;
               mtval <= nextPC_p;
            end
            else if (XB_FD_exception_illegal_instruction) begin
               mcause <= 32'd2;
               mtval <= 32'b0;
            end
            else if (XB_FD_exception_ebreak) begin
               mcause <= 32'd3;
            end
            else if (XB_FD_exception_load_misaligned) begin
               mcause <= 32'd4;
               mtval <= badaddr_p;
            end
            else if (XB_FD_exception_store_misaligned) begin
               mcause <= 32'd6;
               mtval <= badaddr_p;
            end
            else if (XB_FD_exception_ecall) begin
               mcause <= 32'd11;
            end
         end // if (FD_exception)
      end // if (clk)
   end // block: CSR_PIPELINE
   /* verilator lint_on BLKSEQ */
endmodule // csrrf
