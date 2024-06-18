// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
`default_nettype none

module mmu_tb();
   reg clk_tb, resetb_tb, dm_we_tb;
   reg [31:0] im_addr_tb, dm_addr_tb, dm_di_tb;
   wire [31:0] im_do_tb, dm_do_tb;
   reg [3:0]  dm_be_tb;
   reg 	      is_signed_tb;
   wire [11:2] im_addr_out_tb;
   wire [31:0] im_data_tb, io_data_read_tb, io_data_write_tb;
   wire [7:0]  io_addr_tb;
   wire        io_en_tb, io_we_tb;

   reg [31:0]  instruction_memory [0:4095];
   reg [31:0]  io_memory [0:255];

   integer     i;
   
   always begin : CLK_GENERATOR
      #5 clk_tb = 1'b0;
      #5 clk_tb = 1'b1;
   end

   // Test 1: Byte read/write
   task run_test1;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 1: Byte R/W ");
	 $display("(TT) 1. Writes 0, 1, ... to 0x10000000, ... consecutively in unsigned bytes");
	 $display("(TT) 2. Then reads from the same addresses. Values should be same");
	 $display("(TT) 3. The first dm_do(prev) is invalid");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 dm_we_tb = 1'b0;
	 is_signed_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 dm_we_tb = 1'b1;
	 
	 // 1. Write process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_di_tb = 4*i + 0;
	    dm_be_tb = 4'b0001;
	    @(posedge clk_tb);
	    dm_be_tb = 4'b0010;
	    dm_di_tb = 4*i + 1;
	    @(posedge clk_tb);
	    dm_be_tb = 4'b0100;
	    dm_di_tb = 4*i + 2;
	    @(posedge clk_tb);
	    dm_be_tb = 4'b1000;
	    dm_di_tb = 4*i + 3;
	    @(posedge clk_tb);
	 end // for (i = 0; i < 40; i = i + 1)
	 dm_we_tb = 1'b0;
	 // 2. Read process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_be_tb = 4'b0001;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	    dm_be_tb = 4'b0010;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	    dm_be_tb = 4'b0100;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	    dm_be_tb = 4'b1000;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	 end
      end
   endtask //

   // Test 2: Half word read/write
   task run_test2;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 2: Half Word R/W ");
	 $display("(TT) 1. Writes 0, 1, ... to 0x10000000, ... consecutively in unsigned half words");
	 $display("(TT) 2. Then reads from the same addresses. Values should be same");
	 $display("(TT) 3. The first dm_do(prev) is invalid");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 dm_we_tb = 1'b0;
	 is_signed_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 dm_we_tb = 1'b1;
	 
	 // 1. Write process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_di_tb = 2*i + 0;
	    dm_be_tb = 4'b0011;
	    @(posedge clk_tb);
	    dm_be_tb = 4'b1100;
	    dm_di_tb = 2*i + 1;
	    @(posedge clk_tb);
	 end // for (i = 0; i < 40; i = i + 1)
	 dm_we_tb = 1'b0;
	 // 2. Read process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_be_tb = 4'b0011;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	    dm_be_tb = 4'b1100;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	 end
      end
   endtask //
   // Test 3: Word read/write
   task run_test3;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 3: Word R/W ");
	 $display("(TT) 1. Writes 0, 1, ... to 0x10000000, ... consecutively in unsigned words");
	 $display("(TT) 2. Then reads from the same addresses. Values should be same");
	 $display("(TT) 3. The first dm_do(prev) is invalid");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 dm_we_tb = 1'b0;
	 is_signed_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 dm_we_tb = 1'b1;
	 
	 // 1. Write process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_di_tb = i;
	    dm_be_tb = 4'b1111;
	    @(posedge clk_tb);
	 end
	 dm_we_tb = 1'b0;
	 // 2. Read process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h10000000 + i*4;
	    dm_be_tb = 4'b1111;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	 end
      end
   endtask //

   // Test 4: Read Instruction Memory
   task run_test4;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 4: Read Instruction Memory ");
	 $display("(TT) 1. Reads words from 0x0000000, 0x0000004, ...");
	 $display("(TT) 2. Pipelined. Should read 4095, 4094, ...");
	 $display("(TT) 3. The first read is invalid");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 dm_we_tb = 1'b0;
	 is_signed_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 
	 // Read process
	 for (i = 0; i < 8; i = i + 1) begin
	    im_addr_tb = 32'h0 + i*4;
	    @(posedge clk_tb);
	    $display("(TT) im_addr = 0x%h, im_do(prev) = %d", 
		     im_addr_tb, im_do_tb);
	    #0;
	 end
      end
   endtask //

      // Test 5: IO R/W
   task run_test5;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 5: IO R/W ");
	 $display("(TT) 1. Writes 0, 1, ... to 0x80000000, ... consecutively in unsigned words");
	 $display("(TT) 2. The IO port should pipeline output the written values");
	 $display("(TT) 3. Then IO port is read");
	 $display("(TT) 4. IO port should read 4096, 4097, ...");
	 $display("(TT) 5. The first dm_do(prev) is invalid");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 dm_we_tb = 1'b0;
	 is_signed_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 dm_we_tb = 1'b1;
	 
	 // 1. Write process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h80000000 + i*4;
	    dm_di_tb = i;
	    dm_be_tb = 4'b1111;
	    @(posedge clk_tb);
	    $display("(TT) io_we = %b, io_addr = 0x%h, io_data_write = 0x%h",
		     io_we_tb, io_addr_tb, io_data_write_tb);
	    #0;
	 end
	 dm_we_tb = 1'b0;
	 // 2. Read process
	 for (i = 0; i < 8; i = i + 1) begin
	    dm_addr_tb = 32'h80000000 + i*4;
	    dm_be_tb = 4'b1111;
	    @(posedge clk_tb);
	    $display("(TT) dm_addr = 0x%h, dm_be = %b, dm_do(prev) = %d", 
		     dm_addr_tb, dm_be_tb, dm_do_tb);
	    #0;
	 end
      end
   endtask //

   
   assign im_data_tb = instruction_memory[im_addr_out_tb[11:2]];
   assign io_data_read_tb = io_memory[io_addr_tb[7:2]];
   
   mmu UUT(.clk(clk_tb), .resetb(resetb_tb), .dm_we(dm_we_tb), 
	   .im_addr(im_addr_tb), .im_do(im_do_tb),
	   .dm_addr(dm_addr_tb), .dm_di(dm_di_tb),
	   .dm_do(dm_do_tb), .dm_be(dm_be_tb),
	   .is_signed(is_signed_tb),
	   .im_addr_out(im_addr_out_tb), .im_data(im_data_tb),
	   .io_addr(io_addr_tb), .io_en(io_en_tb), .io_we(io_we_tb),
	   .io_data_read(io_data_read_tb), .io_data_write(io_data_write_tb)
	   );

   // Run the tests
   initial
     begin : RUN_ALL_TESTS
	$dumpfile("tb_log/mmu_tb.vcd");
	$dumpvars(0,mmu_tb);
	// Initialize the instruction memory and io memory for testing
	for (i = 0; i < 4096; i = i + 1) begin
	   instruction_memory[i] = 4095 - i;
	end
	for (i = 0; i < 256; i = i + 1) begin
	   io_memory[i] = 4096 + i;
	end

	@(posedge clk_tb);

	run_test1();
	run_test2();
	run_test3();
	run_test4();
	run_test5();

	$finish;
	
     end


endmodule // mmu_tb

