// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


// Video ram, three 1bit color areas for blue, red & green.
// "CRT RAM" page 15 on schematics.

module CRTRAM(
  input CLKSYS,
  input [7:0] SDATABUS,
  output [7:0] CRTRAMDATA,
  input [13:0] SVRADRS,
  input SVWEn,
  input SCASSEL,
  input SVCASBn,
  input SVCASRn,
  input SVCASGn,
  input SDRAMBn,
  input SDRAMRn,
  input SDRAMGn,
  output [7:0] SVDATAB,
  output [7:0] SVDATAR,
  output [7:0] SVDATAG
);

assign CRTRAMDATA =
  ~SDRAMBn ? SVDATAB :
  ~SDRAMRn ? SVDATAR :
  ~SDRAMGn ? SVDATAG :
  8'h0;

wire bwe_n = ~SDRAMBn ? SVWEn : 1'b1;
wire rwe_n = ~SDRAMRn ? SVWEn : 1'b1;
wire gwe_n = ~SDRAMGn ? SVWEn : 1'b1;


ram #(14,8) ramb(
  .clk  ( CLKSYS   ),
  .addr ( SVRADRS  ),
  .din  ( SDATABUS ),
  .q    ( SVDATAB  ),
  .wr_n ( bwe_n    ),
  .rd_n ( 1'b0     ),
  .ce_n ( 1'b0     )
);

ram #(14,8) ramr(
  .clk  ( CLKSYS   ),
  .addr ( SVRADRS  ),
  .din  ( SDATABUS ),
  .q    ( SVDATAR  ),
  .wr_n ( rwe_n    ),
  .rd_n ( 1'b0     ),
  .ce_n ( 1'b0     )
);

ram #(14,8) ramg(
  .clk  ( CLKSYS   ),
  .addr ( SVRADRS  ),
  .din  ( SDATABUS ),
  .q    ( SVDATAG  ),
  .wr_n ( gwe_n    ),
  .rd_n ( 1'b0     ),
  .ce_n ( 1'b0     )
);

endmodule
