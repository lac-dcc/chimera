// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
`default_nettype none

module regfile_tb();
   reg clk_tb, resetb_tb, we_rd_tb;
   reg [4:0] a_rs1_tb, a_rs2_tb, a_rd_tb;
   wire [31:0] d_rs1_tb, d_rs2_tb;
   reg [31:0] d_rd_tb;
   
   always begin : CLK_GENERATOR
      #5 clk_tb = 1'b0;
      #5 clk_tb = 1'b1;
   end

   // Test 1: writes 16, 15, 14, 13, 12,... to registers x0, x1, x2, x3, x4,...
   // Rs1 and Rs2 reads with delay of 1 and 2 clocks, respectively
   task run_test1;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 1: Basic R/W ");
	 $display("(TT) 1. Writes 32, 31, ... to x0, x1, ... consecutively");
	 $display("(TT) 2. RS1 reads x31, x0, x1, ...");
	 $display("(TT) 3. RS2 reads x30, x31, x0, x1, ...");
	 $display("(TT) 4. RS1 should read X, 0, 31, 30, ...");
	 $display("(TT) 5. RS2 should read X, X, 0, 31, 30, ...");
	 $display("(TT) 6. No stray value should remain");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 we_rd_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 for (i = 0; i < 40; i = i + 1) begin
	    // Writeback addr
	    a_rd_tb = i;
	    // Writeback data
	    d_rd_tb = 32 - i%32;
	    we_rd_tb = 1'b1;
	    // RS1 addr
	    a_rs1_tb = i - 1;
	    // RS2 addr
	    a_rs2_tb = i - 2;
	    #0; // Wait for combinational to complete
	    // Then display results
	    $display("(TT) a_rd = x%d, d_rd = %d, we_rd = %d",
		     a_rd_tb, d_rd_tb, we_rd_tb);
	    $display("(TT) a_rs1 = x%d, d_rs1 = %d",
		     a_rs1_tb, d_rs1_tb);
	    $display("(TT) a_rs2 = x%d, d_rs2 = %d",
		     a_rs2_tb, d_rs2_tb);
	    $display("");
	    @(posedge clk_tb);
	 end
      end
   endtask //


   // Test 2: Forwarding test
   task run_test2;
      integer 	    i;
      begin
	 $display("(TT) --------------------------------------------------");
	 $display("(TT) Test 2: Forwarding R/W ");
	 $display("(TT) 1. Writes 32, 31, ... to x0, x1, ... consecutively");
	 $display("(TT) 2. RS1 reads x0, x1, ...");
	 $display("(TT) 3. RS2 reads x31, x0, x1, ...");
	 $display("(TT) 4. RS1 should read 0, 31, 30, ...");
	 $display("(TT) 5. RS2 should read X, 0, 31, 30, ...");
	 $display("(TT) 6. No stray value should remain");
	 $display("(TT) --------------------------------------------------");
	 
	 resetb_tb = 1'b0;
	 we_rd_tb = 1'b0;
	 @(posedge clk_tb)	    resetb_tb = 1'b1;
	 for (i = 0; i < 40; i = i + 1) begin
	    // Writeback addr
	    a_rd_tb = i;
	    // Writeback data
	    d_rd_tb = 32 - i%32;
	    we_rd_tb = 1'b1;
	    // RS1 addr
	    a_rs1_tb = i;
	    // RS2 addr
	    a_rs2_tb = i - 1;
	    #0; // Wait for combinational to complete
	    // Then display results
	    $display("(TT) a_rd = x%d, d_rd = %d, we_rd = %d",
		     a_rd_tb, d_rd_tb, we_rd_tb);
	    $display("(TT) a_rs1 = x%d, d_rs1 = %d",
		     a_rs1_tb, d_rs1_tb);
	    $display("(TT) a_rs2 = x%d, d_rs2 = %d",
		     a_rs2_tb, d_rs2_tb);
	    $display("");
	    @(posedge clk_tb);
	 end
      end
   endtask //
   
   regfile UUT(
	       .clk(clk_tb), .resetb(resetb_tb),
	       .a_rs1(a_rs1_tb), .d_rs1(d_rs1_tb),
	       .a_rs2(a_rs2_tb), .d_rs2(d_rs2_tb),
	       .a_rd(a_rd_tb), .d_rd(d_rd_tb),
	       .we_rd(we_rd_tb)
	       );

   // Run the tests
   initial
     begin : RUN_ALL_TESTS
	$dumpfile("tb_log/regfile_tb.vcd");
	$dumpvars(0,regfile_tb);

	@(posedge clk_tb);
	// Test 1
	run_test1();
	// Test 2
	run_test2();

	$finish;
	
     end


endmodule // regfile_tb
