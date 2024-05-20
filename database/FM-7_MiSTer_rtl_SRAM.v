// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module SRAM(
  input CLKSYS,
  input [15:0] SADDRBUS,
  input [15:0] MADDRBUS,
  input [7:0] SDATA_in,
  input [7:0] MDATA_in,
  output [7:0] SRDATA_out,
  input SHALTACn,
  input RDQEn,
  input SRDQEn,
  input WTQEn,
  input SWTQEn,
  input SSMEMn,
  input SUBSELn
);

wire [9:0] SAB = ~SHALTACn ? {2'b11, MADDRBUS[7:0] } : SADDRBUS[9:0];
wire [7:0] SDB = ~(SUBSELn | SHALTACn) ? MDATA_in : SDATA_in;

wire ce_n = SUBSELn & SSMEMn;
wire wr_n = (SSMEMn | SWTQEn) & (SUBSELn | WTQEn);
wire rd_n = RDQEn & SRDQEn;

ram #(10,8) sram(
  .clk  ( CLKSYS     ),
  .addr ( SAB        ),
  .din  ( SDB        ),
  .q    ( SRDATA_out ),
  .wr_n ( wr_n       ),
  .rd_n ( rd_n       ),
  .ce_n ( ce_n       )
);

endmodule
