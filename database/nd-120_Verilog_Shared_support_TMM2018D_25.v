// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **  TMM2018D_25 | 16K bit Static RAM (Cache)                               **
 *****************************************************************************/

module TMM2018D_25(
   input wire    clk, // Clock input (needed for BLOCK RAM)
   input wire    reset_n, // FPGA Reset input (active low)

   input wire [10:0] ADDRESS, // 11 bits address
   input wire        CS_n,
   input wire        OE_n,
   input wire        W_n,
   input wire [7:0]  D,
   output reg [7:0]  D_OUT
   );

integer i;

     
/*******************************************************************************
** Memory array using block RAM                                               **
*******************************************************************************/
(* ram_style = "block" *) reg [7:0] memory_array [0:2047]; // 2^11 addresses, each 8-bit wide

   
always @(posedge clk) begin

   if (!reset_n) begin
         /* verilator lint_off BLKSEQ */

         // BLOCK RAM DOESNT SUPPORT INITIALISATION
         
         // Reset operation: set all memory locations to 0                
         //for (i = 0; i < 2047; i = i + 1) begin
         //   memory_array[i] = 8'b00000000; // none delayed initialisation
         //end               
         /* verilator lint_on BLKSEQ */
   end

   if (!CS_n) begin
      if (!W_n) begin
         // Write operation: active when chip is selected and write enable is low
         memory_array[ADDRESS] <= D;
         D_OUT = 8'b0; // High-impedance state after write
      end else if (!OE_n) begin
         // Read operation: active when chip is selected and output enable is low
         D_OUT = memory_array[ADDRESS];
      end        
   end else begin
      D_OUT = 8'b0; // High-impedance state when not selected
   end        

end    


endmodule

