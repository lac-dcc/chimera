// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 **                                                                          **
 **  IDT6168A                                                                **
 **  16K (4Kx4) Static RAM  (using BLOCK RAM)                                **
 **                                                                          **
 *****************************************************************************/

module IDT6168A_20( 
   input wire   clk,       // Clock input (BLOCK RAM MUST HAVE CLOCK)
   input wire   reset_n,   // FPGA Reset input (active low) 

   input [11:0] A_11_0,    // Address input
   input        CE_n,      // Chip enable (active low)
   input        WE_n,      // Write enable (active low)
   input [3:0]  D_3_0_IN,  // Data input/output
   output [3:0] D_3_0_OUT  // Data input/output
);

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [11:0] s_address;
   wire [3:0]  s_databus; // 4 bit wide databus
   wire        s_ce_n;
   wire        s_we_n;

 /*******************************************************************************
   ** Signals                                                                    **
   *******************************************************************************/
   reg [3:0] data_out;     // Output data register
   wire [3:0] data_in;     // Input data from the bus
   assign data_in = D_3_0_IN; // Connect input data
   assign D_3_0_OUT = (!CE_n && WE_n) ? data_out : 4'b0; // Tristate logic for bidirectional data bus in chip, in FPGA use 0000 for no output.

   
   /*******************************************************************************
   ** Memory array using block RAM                                               **
   *******************************************************************************/
   (* ram_style = "block" *) reg [3:0] memory_array[0:4095];



   /*
    * In typical SRAM modules, write operations are enabled when the WE_n (Write Enable) signal is low (active low), 
    * and it's more appropriate to trigger the write operation with the signal's level rather than its edge. 
    * This is because SRAM is usually designed to accept data as long as WE_n is low and the chip enable (CE_n) is also low, 
    * enabling continuous write operations during the active period.
    */

   /* verilator lint_off BLKSEQ */
   always @(posedge clk) begin
      if (!CE_n) begin
         if (!WE_n) begin
            memory_array[A_11_0] = data_in;  // Write operation
         end else begin
            data_out = memory_array[A_11_0]; // Read operation
         end
      end
   end


endmodule
