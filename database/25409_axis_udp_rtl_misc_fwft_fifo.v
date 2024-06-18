// This program was cloned from: https://github.com/alknvl/axis_udp
// License: MIT License



module fwft_fifo #(
   parameter DATA_WIDTH = 64

    ) (
    input wire RST,
    input wire CLK,
    output wire [DATA_WIDTH-1:0] DO,
    output wire EMPTY,
    output wire FULL,
    input wire [DATA_WIDTH-1:0] DI,
    input wire RDEN,
    input wire WREN
    );


   localparam FIFO_SIZE = (DATA_WIDTH > 36) ? "36Kb" : "18Kb";

   wire empty_int;
   wire rd_en_int;
   reg dout_valid =0;
    
   FIFO_SYNC_MACRO  #(
      .DEVICE("7SERIES"),           // Target Device: "7SERIES" 
      .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
      .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
      .DATA_WIDTH(DATA_WIDTH),      // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
      .DO_REG(0),                   // Optional output register (0 or 1)
      .FIFO_SIZE (FIFO_SIZE)        // Target BRAM: "18Kb" or "36Kb" 
   ) FIFO_SYNC_MACRO_inst (   
      .ALMOSTEMPTY(),               // 1-bit output almost empty
      .ALMOSTFULL(),                // 1-bit output almost full
      .DO(DO),                      // Output data, width defined by DATA_WIDTH parameter
      .EMPTY(empty_int),            // 1-bit output empty
      .FULL(FULL),                  // 1-bit output full
      .RDCOUNT(),                   // Output read count, width determined by FIFO depth
      .RDERR(),                     // 1-bit output read error
      .WRCOUNT(),                   // Output write count, width determined by FIFO depth
      .WRERR(),                     // 1-bit output write error
      .CLK(CLK),                    // 1-bit input clock
      .DI(DI),                      // Input data, width defined by DATA_WIDTH parameter
      .RDEN(rd_en_int),             // 1-bit input read enable
      .RST(RST),                    // 1-bit input reset
      .WREN(WREN)                   // 1-bit input write enable
   );

   assign rd_en_int = !empty_int && (!dout_valid || RDEN);
   assign EMPTY = !dout_valid;

   always @(posedge CLK) begin
      if (RST)
         dout_valid <= 0;
      else
         begin
            if (rd_en_int)
               dout_valid <= 1;
            else if (RDEN)
               dout_valid <= 0;
         end 
   end

endmodule