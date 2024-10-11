// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License


module msu_fifo #(parameter WIDTH=32, DEPTH=10)
(
	input	             aclr,

	input	             wrclk,
	input	             wrreq,
	input	 [WIDTH-1:0] data,
	output             wrfull,
	output [DEPTH-1:0] wrusedw,

	input	             rdclk,
	input	             rdreq,
	output [WIDTH-1:0] q,
	output             rdempty,
	output [DEPTH-1:0] rdusedw
);

FIFO_DUALCLOCK_MACRO  #(
    .DEVICE("7SERIES"),           // Target Device: "7SERIES" 
    .ALMOST_EMPTY_OFFSET(9'h080), // Sets the almost empty threshold
    .ALMOST_FULL_OFFSET(9'h080),  // Sets almost full threshold
    .DATA_WIDTH(WIDTH),           // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
    .FIFO_SIZE ("18Kb"),           // Target BRAM: "18Kb" or "36Kb" 
    .FIRST_WORD_FALL_THROUGH ("TRUE") // Sets the FIFO FWFT to "TRUE" or "FALSE" 
 ) FIFO_SYNC_MACRO_inst (
    .ALMOSTEMPTY(),               // 1-bit output almost empty
    .ALMOSTFULL(),                // 1-bit output almost full
    .DO(q),                       // Output data, width defined by DATA_WIDTH parameter
    .EMPTY(rdempty),              // 1-bit output empty
    .FULL(wrfull),                // 1-bit output full
    .RDCOUNT(rdusedw),            // Output read count, width determined by FIFO depth
    .RDERR(),                     // 1-bit output read error
    .WRCOUNT(wrusedw),            // Output write count, width determined by FIFO depth
    .WRERR(),                     // 1-bit output write error
    .WRCLK(wrclk),                // 1-bit input write clock
    .RDCLK(rdclk),                // 1-bit input read clock
    .DI(data),                    // Input data, width defined by DATA_WIDTH parameter
    .RDEN(rdreq),                 // 1-bit input read enable
    .RST(aclr),                   // 1-bit input reset
    .WREN(wrreq)                  // 1-bit input write enable
  );

endmodule
