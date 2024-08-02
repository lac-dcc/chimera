// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns / 1ps

`define DATA_W 8
`define ADDR_W 4

module iob_ram_tdp_tb;
   
   // Inputs
   reg               clkA;
   reg [`DATA_W-1:0] data_a;
   reg [`ADDR_W-1:0] addr_a;
   reg               en_a;
   reg               we_a;

   reg               clkB;
   reg [`DATA_W-1:0] data_b;
   reg [`ADDR_W-1:0] addr_b;
   reg               en_b;
   reg               we_b;
   
   // Outputs
   reg [`DATA_W-1:0] q_a;
   reg [`DATA_W-1:0] q_b;

   integer           i, seq_ini;

   parameter clk_per = 10; // clk period = 10 timeticks

   initial begin
      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif
      
      // Initialize Inputs
      clkA = 1;
      clkB = 1;

      data_a = 0;
      addr_a = 0;
      en_a = 0;
      we_a = 0;

      data_b = 0;
      addr_b = 0;
      en_b = 0;
      we_b = 0;

      // Number from which to start the incremental sequence to write into the RAM
      seq_ini = 32;

      #clk_per;
      @(posedge clkA) #1;
      @(posedge clkB) #1;

      @(posedge clkA) #1;
      en_a = 1;

      // Write into port A and read from it
      @(posedge clkA) #1;
      we_a = 1;

      for(i = 0; i < 2**`ADDR_W; i = i + 1) begin
         addr_a = i;
         data_a = i+seq_ini;
         @(posedge clkA) #1;
      end

      @(posedge clkA) #1;
      we_a = 0;

      @(posedge clkA) #1;
      for(i = 0; i < 2**`ADDR_W; i = i + 1) begin
         addr_a = i;
         @(posedge clkA) #1;
         if(i+seq_ini != q_a) begin
            $display("ERROR: write error in port A position %d, where data=%h but q_a=%h", i, i+seq_ini, q_a);
            $finish;
         end
      end

      // Number from which to start the incremental sequence to write into the RAM
      seq_ini = 64;

      @(posedge clkB) #1;
      en_b = 1;

      // Write into port B and read from it
      @(posedge clkB) #1;
      we_b = 1;

      for(i = 0; i < 2**`ADDR_W; i = i + 1) begin
         addr_b = i;
         data_b = i+seq_ini;
         @(posedge clkB) #1;
      end

      @(posedge clkB) #1;
      we_b = 0;

      @(posedge clkB) #1;
      for(i = 0; i < 2**`ADDR_W; i = i + 1) begin
         addr_b = i;
         @(posedge clkB) #1;
         if(i+seq_ini != q_b) begin
            $display("ERROR: write error in port B position %d, where data=%h but q_b=%h", i, i+seq_ini, q_b);
            $finish;
         end
      end

      @(posedge clkB) #1;
      en_a = 0;
      en_b = 0;

      #clk_per;
      $display("%c[1;34m",27);
      $display("Test completed successfully.");
      $display("%c[0m",27);
      #(5*clk_per) $finish;

   end

   // Instantiate the Unit Under Test (UUT)
   iob_ram_tdp
     #(
       .DATA_W(`DATA_W),
       .ADDR_W(`ADDR_W)
       )
   uut
     (
      .clkA(clkA),
      .dinA(data_a),
      .addrA(addr_a),
      .enA(en_a),
      .weA(we_a),
      .doutA(q_a),

      .clkB(clkB),
      .dinB(data_b),
      .addrB(addr_b),
      .enB(en_b),
      .weB(we_b),
      .doutB(q_b)
      );

   // system clock
   always #(clk_per/2) clkA = ~clkA;
   always #(clk_per/2) clkB = ~clkB;

endmodule
