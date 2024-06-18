// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`define DATA_W 32
`define ADDR_W 4

module iob_regfile_dp_tb;

   // Inputs
   reg clk;
   reg rst;
   reg [`DATA_W-1:0] wdataA;
   reg [`DATA_W-1:0] wdataB;
   reg [`ADDR_W-1:0] addrA;
   reg [`ADDR_W-1:0] addrB;
   reg               enA;
   reg               enB;

   // Ouptuts
   reg [`DATA_W-1 :0] rdataA;
   reg [`DATA_W-1 :0] rdataB;

   integer            i, seq_ini;

   parameter clk_per = 10; // clk period = 10 timeticks

   initial begin
      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif

      // Initialize Inputs
      clk = 1;
      rst = 0;

      wdataA = 0;
      addrA = 0;
      enA = 0;

      wdataB = 0;
      addrB = 0;
      enB = 0;

      // Number from which to start the incremental sequence to write into the Register File
      seq_ini = 32;

      #clk_per;
      @(posedge clk) #1; 
      rst = 1;
      @(posedge clk) #1;
      rst = 0;

      @(posedge clk) #1;
      enA = 1;

      // Write and real all the locations
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrA = i;
         wdataA = i+seq_ini;
         @(posedge clk) #1;
         if(rdataA != i+seq_ini) begin
            $display("ERROR: read error in rdata.\n \t data=%0d; rdata=%0d", i+seq_ini, rdataA);
            $finish;
         end
         @(posedge clk) #1;
      end

      @(posedge clk) #1;
      enA = 0;
      addrA = 0;

      // Read all the locations and check if still stored
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrA = i;
         @(posedge clk) #1;
         if(rdataA != i+seq_ini) begin
            $display("ERROR: read error in rdata.\n \t data=%0d; rdata=%0d", i+seq_ini, rdataA);
            $finish;
         end
         @(posedge clk) #1;
      end

      // Resets the entire memory
      @(posedge clk) #1;
      rst = 1;
      @(posedge clk) #1;
      rst = 0;

      // Read all the locations and check if reset worked
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrA = i;
         @(posedge clk) #1;
         if(rdataA != 0) begin
            $display("ERROR: rdata is not null");
            $finish;
         end
         @(posedge clk) #1;
      end

      // Number from which to start the incremental sequence to write into the Register File
      seq_ini = 64;

      @(posedge clk) #1;
      enB = 1;

      // Write and real all the locations
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrB = i;
         wdataB = i+seq_ini;
         @(posedge clk) #1;
         if(rdataB != i+seq_ini) begin
            $display("ERROR: read error in rdata.\n \t data=%0d; rdata=%0d", i+seq_ini, rdataB);
            $finish;
         end
         @(posedge clk) #1;
      end

      @(posedge clk) #1;
      enB = 0;
      addrB = 0;

      // Read all the locations and check if still stored
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrB = i;
         @(posedge clk) #1;
         if(rdataB != i+seq_ini) begin
            $display("ERROR: read error in rdata.\n \t data=%0d; rdata=%0d", i+seq_ini, rdataB);
            $finish;
         end
         @(posedge clk) #1;
      end

      // Resets the entire memory
      @(posedge clk) #1;
      rst = 1;
      @(posedge clk) #1;
      rst = 0;

      // Read all the locations and check if reset worked
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         addrB = i;
         @(posedge clk) #1;
         if(rdataB != 0) begin
            $display("ERROR: rdata is not null");
            $finish;
         end
         @(posedge clk) #1;
      end

      #clk_per;
      $display("%c[1;34m",27);
      $display("Test completed successfully.");
      $display("%c[0m",27);
      #(5*clk_per) $finish;
   end

   // Instantiate the Unit Under Test (UUT)
   iob_regfile_dp
     #(
       .ADDR_W(`ADDR_W),
       .DATA_W(`DATA_W)
       )
   uut (
        .clk(clk),
        .rst(rst),

        .wdataA(wdataA),
        .addrA(addrA),
        .weA(enA),
        .rdataA(rdataA),

        .wdataB(wdataB),
        .addrB(addrB),
        .weB(enB),
        .rdataB(rdataB)
        );

   // system clock
   always #(clk_per/2) clk = ~clk;

endmodule
