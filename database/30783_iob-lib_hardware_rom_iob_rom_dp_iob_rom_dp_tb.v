// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`define DATA_W 8
`define ADDR_W 4

module iob_rom_dp_tb;

   // Inputs
   reg clk;
   reg r_en_a;
   reg [`ADDR_W-1:0] addr_a;
   reg               r_en_b;
   reg [`ADDR_W-1:0] addr_b;
   
   // Ouptuts
   reg [`DATA_W-1:0] r_data_a;
   reg [`DATA_W-1:0] r_data_b;

   integer           i, seq_ini;

   parameter clk_per = 10; // clk period = 10 timeticks
   

   initial begin
      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif
      
      // Initialize Inputs
      clk = 1;
      r_en_a = 0;
      addr_a = 0;
      r_en_b = 0;
      addr_b = 0;

      // Number from which to start the incremental sequence to initialize the ROM
      seq_ini = 32;
      for(i=0; i < 2**`ADDR_W; i = i + 1) begin
         uut.rom[i] = i+seq_ini;
      end

      #clk_per;
      @(posedge clk) #1;
      r_en_a = 1;
      r_en_b = 1;

      @(posedge clk) #1;
      for(i = 0; i < 2**`ADDR_W; i = i + 1) begin
         addr_a = i;
         addr_b = 2**`ADDR_W-1-i;
         @(posedge clk) #1;
         if(i+seq_ini != r_data_a) begin
            $display("ERROR: Port A - read error in position %d, where expected data=%h but r_data=%h", i, i+seq_ini, r_data_a);
            $finish;
         end
         if (seq_ini+2**`ADDR_W-1-i != r_data_b) begin
            $display("ERROR: Port B - read error in position %d, where expected data=%h but r_data=%h", 2**`ADDR_W-1-i, seq_ini+2**`ADDR_W-1-i, r_data_b);
            $finish;
         end
      end

      @(posedge clk) #1;
      r_en_a = 0;
      r_en_b = 0;
      
      #clk_per;
      $display("%c[1;34m",27);
      $display("Test completed successfully.");
      $display("%c[0m",27);
      #(5*clk_per) $finish;

   end

   // Instantiate the Unit Under Test (UUT)
   iob_rom_dp
     #(
       .DATA_W(`DATA_W),
       .ADDR_W(`ADDR_W)
       )
   uut
     (
      .clk(clk),

      .r_en_a(r_en_a),
      .addr_a(addr_a),
      .r_data_a(r_data_a),

      .r_en_b(r_en_b),
      .addr_b(addr_b),
      .r_data_b(r_data_b)
      );

   // system clock
   always #(clk_per/2) clk = ~clk; 

endmodule
