// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
`default_nettype none

module core_tb();
   `include "core/opcode.vh"
   reg clk_tb, resetb_tb;
   wire dm_we_tb;
   wire [31:0] im_addr_tb, dm_addr_tb, dm_di_tb;
   wire [31:0] im_do_tb, dm_do_tb;
   wire [3:0]  dm_be_tb;
   wire        dm_is_signed_tb;
   wire [11:2] im_addr_out_tb;
   wire [31:0] im_data_tb, io_data_read_tb, io_data_write_tb;
   wire [7:0]  io_addr_tb;
   wire        io_en_tb, io_we_tb;

   reg [31:0]  instruction_memory_tb [0:1023];

   reg [31:0]  io_memory_tb [0:255];

   integer     i;

   reg [32767:0] im_rom_flattened;
   always @ (*) begin
      for (i=0; i<1024; i=i+1) 
	im_rom_flattened[i*4+:32] = instruction_memory_tb[i];
   end

   reg [255:0] FD_disasm_opcode;
   always @ (*) begin : Disassembly
      case (UUT.inst_dec.opcode[6:2])
	`LOAD: FD_disasm_opcode = "LOAD    ";
	`OP_IMM: begin
	   case (UUT.inst_dec.funct3)
	     3'b000: FD_disasm_opcode = "ADDI    ";
	     3'b001: FD_disasm_opcode = "SLLI    ";
	     3'b010: FD_disasm_opcode = "SLTI    ";
	     3'b011: FD_disasm_opcode = "SLTIU   ";
	     3'b100: FD_disasm_opcode = "XORI    ";
	     3'b101: FD_disasm_opcode = UUT.inst_dec.funct7[5] 
					? "SRAI    " : "SRLI    ";
	     3'b110: FD_disasm_opcode = "ORI     ";
	     3'b111: FD_disasm_opcode = "ANDI    ";
	     default: FD_disasm_opcode = "OP-IMM  ";
	   endcase
	end
	`AUIPC: FD_disasm_opcode = "AUIPC   ";
	`STORE: FD_disasm_opcode = "STORE   ";
	`OP: begin
	   case (UUT.inst_dec.funct3)
	     3'b000: FD_disasm_opcode = UUT.inst_dec.funct7[5] 
					? "SUB     " : "ADD     ";
	     3'b001: FD_disasm_opcode = "SLL     ";
	     3'b010: FD_disasm_opcode = "SLT     ";
	     3'b011: FD_disasm_opcode = "SLTU    ";
	     3'b100: FD_disasm_opcode = "XOR     ";
	     3'b101: FD_disasm_opcode = UUT.inst_dec.funct7[5] 
					? "SRA     " : "SRL     ";
	     3'b110: FD_disasm_opcode = "OR      ";
	     3'b111: FD_disasm_opcode = "AND     ";
	     default: 	   FD_disasm_opcode = "OP?     ";
	   endcase
	end
	`LUI:  FD_disasm_opcode = "LUI     ";
	`BRANCH: begin
	   case (UUT.inst_dec.funct3)
	     3'b000: FD_disasm_opcode = "BEQ     ";
	     3'b001: FD_disasm_opcode = "BNE     ";
	     3'b100: FD_disasm_opcode = "BLT     ";
	     3'b101: FD_disasm_opcode = "BGE     ";
	     3'b110: FD_disasm_opcode = "BLTU    ";
	     3'b111: FD_disasm_opcode = "BGEU    ";
	   default: FD_disasm_opcode = "BRANCH  ";
	   endcase
	end
	`JALR: FD_disasm_opcode = "JALR    ";
	`JAL: FD_disasm_opcode = "JAL     ";
	`SYSTEM: begin 
	   case (UUT.inst_dec.funct3)
	     3'b000: begin
		if (UUT.inst_dec.funct7==7'b0011000 &&
		    UUT.inst_dec.a_rs2 == 5'b00010 &&
		    UUT.inst_dec.a_rs1 == 5'b00000)
		  FD_disasm_opcode = "MRET    ";
		else
		  FD_disasm_opcode = "SYSTEM  ";
	     end
	     3'b001: FD_disasm_opcode = "CSRRW   ";
	     3'b010: FD_disasm_opcode = "CSRRS   ";
	     3'b011: FD_disasm_opcode = "CSRRC   ";
	     3'b101: FD_disasm_opcode = "CSRRWI  ";
	     3'b110: FD_disasm_opcode = "CSRRSI  ";
	     3'b111: FD_disasm_opcode = "CSRRCI  ";
	     default: FD_disasm_opcode = "SYSTEM  ";
	   endcase
	end
	default: FD_disasm_opcode = "ILLEGAL ";
      endcase
   end

   always begin : CLK_GENERATOR
      #5 clk_tb = 1'b0;
      #5 clk_tb = 1'b1;
   end

   task hard_reset;
      begin
	 resetb_tb = 1'b0;
	 @(posedge clk_tb) resetb_tb = 1'b1;
      end
   endtask // hard_reset

   task load_program;
      input [2047:0] path;
      integer 	     fid, tmp;
      reg [7:0]      bytes [0:4095];
      integer 	     i,j;
      begin
	 // Initialize the instruction memory and io memory for testing
	 fid = $fopen(path, "rb");
	 tmp = $fread(bytes, fid);
	 $fclose(fid);
	 for (i=0; i<1024; i=i+1) begin
	    for (j=0; j<4; j=j+1) begin
	       instruction_memory_tb[i][8*j+:8] = bytes[i*4+j];
	    end
	 end
      end
   endtask // load_program

   task render_pipeline;
      begin
      end
   endtask

   // Test 0: NOP
   task run_test0;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 0: NOP and J Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. Before reset, PC is at 0xFFFFFFFC.");
	 $display("(TT) 3. Reset PC is 0x0, which then jumps to 0xC.");
	 $display("(TT) 4. Then, increments at steps of 0x4.");
	 $display("(TT) 5. Then, jumps to 0xC after 0x20.");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/00-nop.bin");
	 hard_reset();
	 for (i=0; i<12; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h", FD_disasm_opcode, UUT.FD_PC);
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 1: OP-IMM
   task run_test1;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 1: OP-IMM Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. OP-IMM's start at PC=10, depositing x1 in XB stage");
	 $display("(TT) 3. x1=1,2,3,4,5,6,1,2,1,0,1,-1,-1");
	 $display("(TT) 4. Loops to 0x0C at 0x40");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/01-opimm.bin");
	 hard_reset();
	 for (i=0; i<20; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=%0D", 
		     FD_disasm_opcode, UUT.FD_PC, $signed(UUT.RF.data[1]));
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 2: OP
   task run_test2;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 2: OP Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. OP's start at PC=14. x1 has 2 clock delay");
	 $display("(TT) 3. x1=4,3,1,0,1,0,1,2,4,2,-2,-1,1,0,1");
	 $display("(TT) 4. Loops to 0x0C at 50");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/02-op.bin");
	 hard_reset();
	 for (i=0; i<24; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=%0D", 
		     FD_disasm_opcode, UUT.FD_PC, $signed(UUT.RF.data[1]));
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 3: Branch
   task run_test3;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 3: Branch Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. Each type of branch instruction executes twice");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/03-br.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h", 
		     FD_disasm_opcode, UUT.FD_PC);
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 4: LUI
   task run_test4;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 4: LUI/AUIPC Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. First, x1 will be loaded with 0xDEADBEEF");
	 $display("(TT) 3. Then, x1 will be loaded with PC=0x14");
	 $display("(TT) 4. Loops at 0x18");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/04-lui.bin");
	 hard_reset();
	 for (i=0; i<16; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
		     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 5: JAL/JALR
   task run_test5;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 5: JAL/JALR Test ");
	 $display("(TT) 1. Waveform must be inspected");
	 $display("(TT) 2. PC=00,0C,18,10,1C,14,0C,18,10,1C,...");
	 $display("(TT) 3. x1=XX,XX,XX,10,10,14,20,20,10,10,...");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/05-jalr.bin");
	 hard_reset();
	 for (i=0; i<16; i=i+1) begin
	    $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
		     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    @(posedge clk_tb);
	 end
      end	 
   endtask //

   // Test 6: CSRR
   task run_test6;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 6: CSRR Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/06-csrr.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 7: CSRWI
   task run_test7;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 7: CSRWI Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/07-csrwi.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 8: CSRW
   task run_test8;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 8: CSRW Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/08-csrw.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 9: CSRSI
   task run_test9;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 9: CSRSI Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/09-csrsi.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 10: CSRS
   task run_test10;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 10: CSRS Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/10-csrs.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 11: CSRCI
   task run_test11;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 11: CSRCI Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/11-csrci.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 12: CSRC
   task run_test12;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 12: CSRC Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/12-csrc.bin");
	 hard_reset();
	 for (i=0; i<48; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 13: CSR Atomic
   task run_test13;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 13: CSR Atomic Test ");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/13-csr.bin");
	 hard_reset();
	 for (i=0; i<12; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 14: Memory Operation
   task run_test14;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 14: Memory");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/14-mem.bin");
	 hard_reset();
	 for (i=0; i<80; i=i+1) begin
	    // $display("(TT) Opcode=%0s, FD_PC=0x%h, x1=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC, UUT.RF.data[1]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //

   // Test 15: Exception
   task run_test15;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 15: Exception");
	 $display("(TT) 1. On failure, a message is displayed");
	 $display("(TT) 2. Failure vector is PC=0x10");
	 $display("(TT) --------------------------------------------------");

	 load_program("tb_out/15-exception.bin");
	 hard_reset();
	 for (i=0; i<256; i=i+1) begin
	    // $display("(TT) Op=%0s, PC=0x%h, x1=0x%h, x6=0x%h, x7=0x%h", 
	    // 	     FD_disasm_opcode, UUT.FD_PC,
	    // 	     UUT.RF.data[1],
	    // 	     UUT.RF.data[6],
	    // 	     UUT.RF.data[7]);
	    if (UUT.FD_PC == 32'h10 || FD_disasm_opcode == "ILLEGAL ")
	      $display("(TT) Test failed!");
	    @(posedge clk_tb);
	 end
      end
   endtask //
   
   assign im_data_tb = instruction_memory_tb[im_addr_out_tb[11:2]];
   assign io_data_read_tb = io_memory_tb[io_addr_tb[7:2]];
   
   mmu MMU0(.clk(clk_tb), .resetb(resetb_tb), .dm_we(dm_we_tb), 
	   .im_addr(im_addr_tb), .im_do(im_do_tb),
	   .dm_addr(dm_addr_tb), .dm_di(dm_di_tb),
	   .dm_do(dm_do_tb), .dm_be(dm_be_tb),
	   .is_signed(dm_is_signed_tb),
	   .im_addr_out(im_addr_out_tb), .im_data(im_data_tb),
	   .io_addr(io_addr_tb), .io_en(io_en_tb), .io_we(io_we_tb),
	   .io_data_read(io_data_read_tb), .io_data_write(io_data_write_tb)
	   );

   core UUT
     (
      .clk(clk_tb), .resetb(resetb_tb),
      .dm_we(dm_we_tb), .im_addr(im_addr_tb),
      .im_do(im_do_tb), .dm_addr(dm_addr_tb),
      .dm_di(dm_di_tb), .dm_do(dm_do_tb),
      .dm_be(dm_be_tb), .dm_is_signed(dm_is_signed_tb)
      );

   // Run the tests
   initial
     begin : RUN_ALL_TESTS
	$dumpfile("tb_log/core_tb.vcd");
	$dumpvars(0,core_tb);
	for (i = 0; i < 256; i = i + 1) begin
	   io_memory_tb[i] = 4096 + i;
	end

	@(posedge clk_tb);

	run_test0();
	run_test1();
	run_test2();
	run_test3();
	run_test4();
	run_test5();
	run_test6();
	run_test7();
	run_test8();
	run_test9();
	run_test10();
	run_test11();
	run_test12();
	run_test13();
	run_test14();
	run_test15();

	$finish;
	
     end


endmodule 

