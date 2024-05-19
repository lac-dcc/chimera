// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 This is the CPU core, consisting of the pipeline and register files
 
 Capability:
 - RV32I base instruction set
 - Precise exception
 - No interrupts
 
 Vectors:
 - Reset:	0x00000000
 - Exception:	0x00000004
 
 Interface:
 - To/From MMU
 
 Microarchitecture:
 - Two-stage pipeline
 - S1: Fetch/Decode (FD)
 - S2: Execute/Writeback (XB)
 - Early branch in FD
 */
module core
  (
   // Top
   clk, resetb,
   // MMU
   dm_we, im_addr, im_do, dm_addr, dm_di, dm_do, dm_be, dm_is_signed,
   // IRQ
   irq_mtimecmp
   );
`include "core/aluop.vh"
`include "core/exception_vector.vh"
   input wire clk, resetb;

   // Interface to MMU
   input wire [31:0] im_do/*verilator public*/, dm_do;
   output 	     dm_we, dm_is_signed;
   output [31:0]     im_addr, dm_addr, dm_di;
   output [3:0]      dm_be;

   wire 	     dm_we, dm_is_signed;
   wire [31:0] 	     dm_addr, dm_di;
   reg [31:0] 	     im_addr;
   wire [3:0] 	     dm_be;
   
   // Timer interrupt
   input wire irq_mtimecmp;
   
   // Instruction Decode
   wire [31:0] 	     FD_imm;
   wire 	     FD_alu_is_signed;
   wire [31:0] 	     FD_aluop1_sel, FD_aluop2_sel, FD_alu_op;
   wire 	     FD_pc_update, FD_pc_mepc;
   wire 	     FD_regwrite;
   wire 	     FD_jump, FD_link, FD_jr, FD_br;
   wire [3:0] 	     FD_dm_be;
   wire 	     FD_dm_we;
   wire 	     FD_dm_is_signed;
   wire 	     FD_csr_read, FD_csr_write, FD_csr_set, FD_csr_clear, FD_csr_imm;
   wire [4:0] 	     FD_a_rs1, FD_a_rs2, FD_a_rd;
   wire [2:0] 	     FD_funct3;
   /* verilator lint_off UNUSED */
   wire [6:0] 	     FD_funct7;
   /* verilator lint_on UNUSED */   
   wire 	     FD_exception_illegal_instruction;
   wire 	     FD_exception_ecall;
   wire 	     FD_exception_ebreak;
   reg 		     FD_exception_instruction_misaligned;
   wire 	     FD_exception_load_misaligned;
   wire 	     FD_exception_store_misaligned;

   // Program Counter
   wire 	     FD_initiate_exception;
   reg [31:0] FD_PC /*verilator public*/;
   reg [31:0] 	     nextPC /*verilator public*/;

   // FD ALU
   wire [31:0] FD_aluout;

   // Internally Forwarding Register File
   reg [4:0]   XB_a_rd;
   reg [31:0]  XB_d_rd;
   wire [31:0]  FD_d_rs1, FD_d_rs2;

   // XB Stage registers
   reg [31:0]  XB_d_rs1, XB_d_rs2, XB_imm;
   /* verilator lint_off UNUSED */   
   reg [4:0]   XB_a_rs1;
   /* verilator lint_on UNUSED */   
   reg 	       XB_regwrite;
   reg 	       XB_memtoreg;
   reg 	       XB_alu_is_signed;
   reg [31:0]  XB_aluop1_sel, XB_aluop2_sel, XB_alu_op;
   reg 	       XB_FD_exception_illegal_instruction;
   reg 	       XB_FD_exception_ecall;
   reg 	       XB_FD_exception_ebreak;
   reg 	       XB_FD_exception_instruction_misaligned;
   reg 	       XB_FD_exception_load_misaligned;
   reg 	       XB_FD_exception_store_misaligned;
   reg [31:0]  XB_PC;
   wire        FD_bubble;
   reg FD_reset;
   reg 	       XB_bubble;

   // XB ALU
   reg [31:0]  XB_aluop1, XB_aluop2, XB_aluout;

   // CSR Register file and Exception Handling Unit
   wire [31:0] XB_csr_out;
   wire        XB_csr_read, XB_csr_write, XB_csr_set, XB_csr_clear, XB_csr_imm;
   wire [31:0] CSR_mepc, CSR_mtvec;
   reg 	       XB_csr_writeback;

   assign dm_be = FD_bubble ? 4'b0 : FD_dm_be;
   assign dm_we = (FD_exception_store_misaligned | FD_bubble) ?
     1'b0 : FD_dm_we;
   assign dm_is_signed = FD_dm_is_signed;

   instruction_decoder inst_dec
   (
     .FD_reset(FD_reset),
     .inst(im_do), .aluout_1_0(FD_aluout[1:0]),
     .immediate(FD_imm),
     .alu_is_signed(FD_alu_is_signed),
     .aluop1_sel(FD_aluop1_sel), .aluop2_sel(FD_aluop2_sel), 
     .alu_op(FD_alu_op),
     .pc_update(FD_pc_update), .pc_mepc(FD_pc_mepc),
     .regwrite(FD_regwrite), .jump(FD_jump), .link(FD_link),
     .jr(FD_jr), .br(FD_br),
     .dm_be(FD_dm_be), .dm_we(FD_dm_we), 
     .mem_is_signed(FD_dm_is_signed),
     .csr_read(FD_csr_read), .csr_write(FD_csr_write),
     .csr_set(FD_csr_set), .csr_clear(FD_csr_clear), .csr_imm(FD_csr_imm),
     .a_rs1(FD_a_rs1), .a_rs2(FD_a_rs2), .a_rd(FD_a_rd), 
     .funct3(FD_funct3), .funct7(FD_funct7),
     .exception_illegal_instruction(FD_exception_illegal_instruction),
     .exception_ecall(FD_exception_ecall),
     .exception_ebreak(FD_exception_ebreak),
     .exception_load_misaligned(FD_exception_load_misaligned),
     .exception_store_misaligned(FD_exception_store_misaligned)
     //.disasm_opcode(FD_disasm_opcode)
   );

   // Next PC for Branches
   // reg [31:0]  nextPC_br;
   // Successful branch
   reg 	       do_branch;
   always @ (*) begin : PC_UPDATE
      // Successful branch: FD instruction is branch and condition
      // match
      do_branch = FD_br == 1'b0 ? 1'b0
		  :
		  (
		   (FD_funct3==3'b000&&FD_d_rs1 == FD_d_rs2)
		   ||
		   (FD_funct3==3'b001&&FD_d_rs1 != FD_d_rs2)
		   ||
		   (FD_funct3==3'b100&&$signed(FD_d_rs1)<$signed(FD_d_rs2))
		   ||
		   (FD_funct3==3'b101&&$signed(FD_d_rs1)>=$signed(FD_d_rs2))
		   ||
		   (FD_funct3==3'b110&&$unsigned(FD_d_rs1)<$unsigned(FD_d_rs2))
		   ||
		   (FD_funct3==3'b111&&$unsigned(FD_d_rs1)>=$unsigned(FD_d_rs2))
		   )
		    ? 1'b1 : 1'b0;

      // Update PC. Priority from high to low:
      //
      // Illegal Instruction Exception, Misaligned Exception, MRET,
      // Branch, Jump, Jump Register, Increment
      nextPC = (FD_initiate_exception) ? CSR_mtvec
	       : (FD_pc_update & FD_pc_mepc) ? CSR_mepc
	       : (do_branch) ? FD_imm + FD_PC
	       : (FD_jump) ? FD_PC + FD_imm
	       : (FD_jr) ? {FD_aluout[31:1], 1'b0}
	       : FD_PC + 32'd4;
      FD_exception_instruction_misaligned = nextPC[1:0] != 2'b00;
      
      im_addr = nextPC;
   end

   // Update the Program Counter
   always @ (posedge clk) begin : PROGRAM_COUNTER
      if (!resetb) begin
	 FD_PC <= 32'hFFFFFFFC;
      end
      else if (clk) begin
	 FD_PC <= nextPC;
      end // if (clk)
   end
   
   // FD stage ALU, used in PC update and MMU address
   assign FD_aluout = FD_d_rs1 + FD_imm;

   // Register file
   regfile RF(
	      .clk(clk), .resetb(resetb),
	      .a_rs1(FD_a_rs1), .d_rs1(FD_d_rs1),
	      .a_rs2(FD_a_rs2), .d_rs2(FD_d_rs2),
	      .a_rd(XB_a_rd), .d_rd(XB_d_rd), .we_rd(XB_regwrite)
	      );

   // Main ALU in XB stage
   always @ (*) begin : XB_ALU
      // Select operator 1
      case (XB_aluop1_sel)
	`ALUOP1_RS1: XB_aluop1 = XB_d_rs1;
	`ALUOP1_PC: XB_aluop1 = XB_PC;
	default: XB_aluop1 = 32'bX;
      endcase // case (XB_aluop1_sel)
      // Select operator 2
      case (XB_aluop2_sel)
	`ALUOP2_RS2: XB_aluop2 = XB_d_rs2;
	`ALUOP2_IMM: XB_aluop2 = XB_imm;
	default: XB_aluop2 = 32'bX;
      endcase // case (XB_aluop2_sel)
      // ALU operation
      case (XB_alu_op)
	`ALU_ADD: begin
	   XB_aluout = XB_aluop1 + XB_aluop2;
	end
	`ALU_SLT: begin
	   XB_aluout = (XB_alu_is_signed)
	     ? ($signed(XB_aluop1) < $signed(XB_aluop2) ? 32'h1 : 32'h0)
	       : ($unsigned(XB_aluop1) < $unsigned(XB_aluop2) ? 32'h1 : 32'h0);
	end
	`ALU_AND: begin
	   XB_aluout = XB_aluop1 & XB_aluop2;
	end
	`ALU_OR: begin
	   XB_aluout = XB_aluop1 | XB_aluop2;
	end
	`ALU_XOR: begin
	   XB_aluout = XB_aluop1 ^ XB_aluop2;
	end
	`ALU_SLL: begin
	   XB_aluout = XB_aluop1 << XB_aluop2[4:0];
	end
	`ALU_SRL: begin
	   XB_aluout = XB_aluop1 >> XB_aluop2[4:0];
	end
	`ALU_SRA: begin
	   XB_aluout = $signed(XB_aluop1) >>> XB_aluop2[4:0];
	end
	`ALU_SUB: begin
	   XB_aluout = XB_aluop1 - XB_aluop2;
	end
	default:
	  XB_aluout = 32'bX;
      endcase // case (XB_alu_op)
   end // block: XB_ALU

   // Here, the naming is confusing because the signals are actually
   // in FD stage, due to the internally pipelined CSR_EHU module
   assign XB_csr_read = FD_bubble ? 1'b0 : FD_csr_read;
   assign XB_csr_write = FD_bubble ? 1'b0 : FD_csr_write;
   assign XB_csr_set = FD_bubble ? 1'b0 : FD_csr_set;
   assign XB_csr_clear = FD_bubble ? 1'b0 : FD_csr_clear;
   assign XB_csr_imm = FD_csr_imm;
   
   csr_ehu CSR_EHU0
     (
      .clk(clk), .resetb(resetb), .XB_bubble(XB_bubble),
      .read(XB_csr_read), .write(XB_csr_write),
      .set(XB_csr_set), .clear(XB_csr_clear),
      .imm(XB_csr_imm), .a_rd(FD_a_rd),
      .initiate_exception(FD_initiate_exception),
      .XB_FD_exception_illegal_instruction(XB_FD_exception_illegal_instruction),
      .XB_FD_exception_instruction_misaligned(XB_FD_exception_instruction_misaligned),
      .XB_FD_exception_ecall(XB_FD_exception_ecall),
      .XB_FD_exception_ebreak(XB_FD_exception_ebreak),
      .XB_FD_exception_load_misaligned(XB_FD_exception_load_misaligned),
      .XB_FD_exception_store_misaligned(XB_FD_exception_store_misaligned),
      .irq_mtimecmp(irq_mtimecmp),
      .src_dst(FD_imm[11:0]),
      .d_rs1(FD_d_rs1), .uimm(FD_a_rs1), .FD_aluout(FD_aluout),
      .nextPC(nextPC), .XB_pc(XB_PC[31:2]), .data_out(XB_csr_out), 
      .csr_mepc(CSR_mepc), .csr_mtvec(CSR_mtvec)
      );

   // Writeback path select
   always @ (*) begin : XB_Writeback_Path
      // MemToReg: Load memory to register
      // csr_writeback: CSR to register
      XB_d_rd = XB_memtoreg ? dm_do
		: XB_csr_writeback ? XB_csr_out
		: XB_aluout;
   end

   // MMU Interface
   assign dm_addr = FD_aluout;
   assign dm_di = FD_d_rs2;

   // Flush instructions on exception.
   assign FD_bubble = FD_initiate_exception;
   // The main pipeline
   always @ (posedge clk) begin : CORE_PIPELINE
      if (!resetb) begin
	 // Initialize stage registers with side effects
	 XB_regwrite <= 1'b0;
	 XB_csr_writeback <= 1'b0;
	 XB_FD_exception_illegal_instruction <= 1'b0;
	 XB_FD_exception_ecall <= 1'b0;
	 XB_FD_exception_ebreak <= 1'b0;
	 XB_FD_exception_instruction_misaligned <= 1'b0;
	 XB_FD_exception_load_misaligned <= 1'b0;
	 XB_FD_exception_store_misaligned <= 1'b0;
	 XB_bubble <= 1'b1;
	 // Initialize stage registers
	 XB_PC <= 32'bX;
	 XB_d_rs1 <= 32'bX;
	 XB_d_rs2 <= 32'bX;
	 XB_a_rs1 <= 5'bX;
	 XB_a_rd <= 5'bX;
	 // XB_csr_imm <= 1'bX;
	 XB_memtoreg <= 1'bX;
	 XB_alu_is_signed <= 1'bX;
	 XB_aluop1_sel <= 32'bX;
	 XB_aluop2_sel <= 32'bX;
         // FD Reset
         FD_reset <= 1'b1;
      end
      else if (clk) begin
        FD_reset <= 1'b0;
	 // XB stage
	 //// Operators
	 if (!FD_link) begin
	    XB_d_rs1 <= FD_d_rs1;
	    XB_d_rs2 <= FD_d_rs2;
	 end
	 else begin
	    // If Linking, the operation is PC + 4
	    XB_d_rs1 <= FD_PC;
	    XB_d_rs2 <= 32'h4;
	 end
	 XB_imm <= FD_imm;
	 XB_a_rs1 <= FD_a_rs1;
	 XB_a_rd <= FD_a_rd;
	 //// Pure signals
	 XB_memtoreg <= FD_dm_be[3] | FD_dm_be[2] | FD_dm_be[1] | FD_dm_be[0];
	 XB_aluop1_sel <= FD_aluop1_sel;
	 XB_aluop2_sel <= FD_aluop2_sel;
	 XB_alu_op <= FD_alu_op;
	 XB_alu_is_signed <= FD_alu_is_signed;
	 XB_PC <= FD_PC;
	 //// Side effect signals
	 XB_bubble <= FD_bubble;
	 if (!FD_bubble) begin
	    // Side effect signals propagate only if instruction is
	    // not a bubble
	    XB_csr_writeback <= XB_csr_read;
	    XB_regwrite <= FD_regwrite;
	    XB_FD_exception_illegal_instruction
	      <= FD_exception_illegal_instruction;
	    XB_FD_exception_ecall <= FD_exception_ecall;
	    XB_FD_exception_ebreak <= FD_exception_ebreak;
	    XB_FD_exception_instruction_misaligned
	      <= FD_exception_instruction_misaligned;
	    XB_FD_exception_load_misaligned
	      <= FD_exception_load_misaligned;
	    XB_FD_exception_store_misaligned
	      <= FD_exception_store_misaligned;
	 end
	 else begin
	    // A bubble has all side-effectful signals deactivated
	    XB_regwrite <= 1'b0;
	    XB_FD_exception_illegal_instruction <= 1'b0;
	    XB_FD_exception_instruction_misaligned <= 1'b0;
	    XB_FD_exception_load_misaligned <= 1'b0;
	    XB_FD_exception_store_misaligned <= 1'b0;
	 end // else: !if(!FD_bubble)

	 // FD stage
      end
   end
   
endmodule // core
