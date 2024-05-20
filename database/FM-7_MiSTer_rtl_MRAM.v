// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module MRAM (
  input RAM1HB1n,
  input RAM1HB2n,
  input RWBn,
  input CLKSYS,
  input [15:0] MADDRBUS,
  input [7:0] DIN,
  input RDQEn,
  output [7:0] DOUT
);

// ram #(16,8) ram(
//   .clk  ( CLKSYS              ),
//   .addr ( MADDRBUS            ),
//   .din  ( DIN                 ),
//   .q    ( DOUT                ),
//   .wr_n ( ~RWBn               ),
//   .rd_n ( ~RDQEn              ),
//   .ce_n ( 1'b0                )
// );

ram_quartus ram(
  .clock   ( CLKSYS   ),
  .address ( MADDRBUS ),
  .data    ( DIN      ),
  .q       ( DOUT     ),
  .wren    ( RWBn     ),
  .rden    ( RDQEn    )
);


endmodule
