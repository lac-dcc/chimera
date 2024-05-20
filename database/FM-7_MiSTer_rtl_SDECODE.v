// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module SDECODE(
  input [15:0] SADDRBUS,
  input SQB,
  input SEB,
  input SBA,
  input SQANDEn,
  input SRWB,
  input VPAGE1n,
  input VPAGE2n,
  input VPAGE3n,
  output SCPUWEn,
  output SRDEn,
  output SROMSELn,
  output SRAM1CSn,
  output SRAM2CSn,
  output SROMDn,
  output SSMEMn,
  output SCRTSWn,
  output SVRACSn,
  output SBUSYSETn,
  output SLEDn,
  output SREGHn,
  output SREGLn,
  output KDATAn,
  output KACKNGn,
  output SIRQCLRn,
  output BUZZERn,
  output ATTENTn,
  output SDRAMGn,
  output SDRAMRn,
  output SDRAMBn,
  output SDRAMV1n,
  output SDRAMV2n,
  output SDRAMV3n
);

wire m86_y6;
wire m80_10 = ~(SQB | SEB);
wire m158_11 = ~&SADDRBUS[15:14];
wire m58_3 = m80_10 | m158_11;
wire m87_3 = SQB | SRWB;
wire m58_6 = m58_3 | m87_3;
wire m57_6 = ~(SRWB & SEB);
wire m57_8 = ~(&SADDRBUS[15:13] & ~SBA);
wire m58_11 = m57_8 | m80_10;
wire m64_11 = m86_y6 | SADDRBUS[10];
wire m64_8 = m86_y6 | ~SADDRBUS[10];

x74138 m86(
  .G2B ( SBA          ),
  .G2A ( SADDRBUS[13] ),
  .G1  ( SADDRBUS[15] ),
  .A   ( SADDRBUS[11] ),
  .B   ( SADDRBUS[12] ),
  .C   ( SADDRBUS[14] ),
  .Y4  ( SRAM1CSn     ),
  .Y5  ( SRAM2CSn     ),
  .Y6  ( m86_y6       ),
  .Y7  ( SROMDn       )
);

x74138 m87(
  .G2B ( m64_8       ),
  .G2A ( SQANDEn     ),
  .G1  ( SADDRBUS[3] ),
  .A   ( SADDRBUS[0] ),
  .B   ( SADDRBUS[1] ),
  .C   ( SADDRBUS[2] ),
  .Y0  ( SCRTSWn     ),
  .Y1  ( SVRACSn     ),
  .Y2  ( SBUSYSETn   ),
  .Y3  (             ),
  .Y4  (             ),
  .Y5  ( SLEDn       ),
  .Y6  ( SREGHn      ),
  .Y7  ( SREGLn      )
);

x74138 m98(
  .G2B ( m64_8        ),
  .G2A ( SRDEn        ),
  .G1  ( ~SADDRBUS[3] ),
  .A   ( SADDRBUS[0]  ),
  .B   ( SADDRBUS[1]  ),
  .C   ( SADDRBUS[2]  ),
  .Y0  ( KDATAn       ),
  .Y1  ( KACKNGn      ),
  .Y2  ( SIRQCLRn     ),
  .Y3  ( BUZZERn      ),
  .Y4  ( ATTENTn      ),
  .Y5  (              ),
  .Y6  (              ),
  .Y7  (              )
);

wire [3:0] m95_y;

x74139 m95(
	.E1 ( SBA             ),
  .A1 ( SADDRBUS[15:14] ),
  .O1 ( m95_y           )
);


assign SCPUWEn = m58_6;
assign SRDEn = m57_6;
assign SROMSELn = m58_11;

assign SDRAMBn = m95_y[0];
assign SDRAMRn = m95_y[1];
assign SDRAMGn = m95_y[2];

assign SDRAMV1n = SDRAMBn | VPAGE1n;
assign SDRAMV2n = SDRAMRn | VPAGE2n;
assign SDRAMV3n = SDRAMGn | VPAGE3n;

assign SSMEMn = m64_11;

endmodule
