// This program was cloned from: https://github.com/IObundle/iob-soc
// License: MIT License

`timescale 1ns / 1ps

`define DATA_W 8
`define ADDR_W 4

module iob_ram_sp_tb;

   // Inputs
   reg               clk;
   reg               en;  // enable access to ram
   reg               we;  // write enable
   reg [`ADDR_W-1:0] addr;
   reg [`DATA_W-1:0] data_in;

   // Ouptuts
   reg [`DATA_W-1:0] data_out;

   integer i, seq_ini;
   integer fd;

   parameter clk_per = 10;  // clk period = 10 timeticks

   initial begin
      // optional VCD
`ifdef VCD
      $dumpfile("uut.vcd");
      $dumpvars();
`endif

      // Initialize Inputs
      clk     = 1;
      en      = 0;
      we      = 0;
      addr    = 0;

      // Number from which to start the incremental sequence to write into the RAM
      seq_ini = 32;

      #clk_per;
      @(posedge clk) #1;
      en = 1;

      // Write to all RAM words
      @(posedge clk) #1;
      we = 1;

      for (i = 0; i < 2 ** `ADDR_W; i = i + 1) begin
         addr    = i;
         data_in = i + seq_ini;
         @(posedge clk) #1;
      end

      @(posedge clk) #1;
      we = 0;

      // Read from all RAM words
      @(posedge clk) #1;
      for (i = 0; i < 2 ** `ADDR_W; i = i + 1) begin
         addr = i;
         @(posedge clk) #1;
         if (i + seq_ini != data_out) begin
            $display(
                "ERROR: read error in data_out. \n \t i=%0d; data = %h when it should have been %0h",
                i, i + seq_ini, data_out);
            $fatal();
         end
      end

      @(posedge clk) #1;
      en = 0;

      #clk_per;
      $display("%c[1;34m", 27);
      $display("Test completed successfully.");
      $display("%c[0m", 27);
      fd = $fopen("test.log", "w");
      $fdisplay(fd, "Test passed!");
      $fclose(fd);
      #(5 * clk_per) $finish();

   end

   // Instantiate the Unit Under Test (UUT)
   iob_ram_sp #(
      .DATA_W(`DATA_W),
      .ADDR_W(`ADDR_W)
   ) uut (
      .clk_i (clk),
      .en_i  (en),
      .we_i  (we),
      .addr_i(addr),
      .d_i   (data_in),
      .d_o   (data_out)
   );

   // system clock
   always #(clk_per / 2) clk = ~clk;

endmodule
