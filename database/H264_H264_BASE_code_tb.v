`timescale 1ps/1ps
module tb(
          );

   parameter aw = 12;
   parameter dw = 16;

   reg	clk, rst;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [dw-1:0]        ao_data;                // From s of sram_wait.v
   wire                 ao_valid;               // From s of sram_wait.v
   // End of automatics
   reg [aw-1:0]  ai_addr_w,ai_addr_r;
   reg [dw-1:0]  ai_data;
   reg           ai_ce;
   reg           ai_we;
   reg           ai_oe;
   spram_wait #(
               .dw                  (dw),
               .aw                  (aw)
               ) s(/*AUTOINST*/
                   // Outputs
                   .ao_data             (ao_data[dw-1:0]),
                   .ao_valid            (ao_valid),
                   // Inputs
                   .clk                 (clk),
                   .rst                 (rst),
                   .ai_ce               (ai_ce),
                   .ai_we               (ai_we),
                   .ai_oe               (ai_oe),
                   .ai_addr_w             (ai_addr_w[aw-1:0]),
		   .ai_addr_r            (ai_addr_r[aw-1:0]),
                   .ai_data             (ai_data[dw-1:0]));


   
   initial begin
      rst <= 0;
      @(posedge clk);	rst <= 1;
      @(posedge clk);	rst <= 0;
      @(posedge clk); ai_addr_w <= 3; ai_ce <= 1; ai_oe <=1; ai_we <= 1; ai_data <= 7;
      @(posedge clk); ai_addr_w <= 4; ai_ce <= 1; ai_oe <=1; ai_we <= 1; ai_data <= 9;
      @(posedge clk); ai_addr_r <= 3; ai_ce <= 1; ai_oe <=1; ai_we <= 0;
      @(posedge clk); ai_addr_r <= 4; ai_ce <= 1; ai_oe <=1; ai_we <= 0;
      @(posedge clk); ai_addr_r <= 3;
      @(posedge clk); ai_addr_r <= 4;
      @(posedge clk); ai_addr_r <= 3;
      @(posedge clk); ai_addr_r <= 4;
      @(posedge clk); ai_addr_r <= 3;
      @(posedge clk);  if (ao_valid) ai_addr_r <= 4;
      @(posedge clk);  if (ao_valid) ai_addr_r <= 4;
      @(posedge clk);  if (ao_valid) ai_addr_r <= 4;
      @(posedge clk);  if (ao_valid) ai_addr_r <= 4;
      @(posedge clk);  if (ao_valid) ai_addr_r <= 4;      
   end

   initial begin
      clk = 0;
      forever #5 clk <= ~clk;
   end

   
endmodule
