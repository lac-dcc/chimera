// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module MDECODE (
  input [15:0] MADDRBUS,
  input RDEn,
  input E,
  input RWBn,
  input WTQEn,
  output IOSn,
  output FD0Xn,
  output PLTREGn,
  output AB3n,
  output WFD05n,
  output WFD37n,
  output WFD00n,
  output WFD01n,
  output WFD02n,
  output WFD03n,
  output WFD0Dn,
  output WFD0En,
  output WFD0Fn,
  output RFD00n,
  output RFD01n,
  output RFD02n,
  output RFD04n,
  output RFD03n,
  output RFD05n,
  output RFD0En,
  output RFD0Fn
);

wire m55_q8 = ~&{ MADDRBUS[15:10], ~MADDRBUS[9], MADDRBUS[8] };

wire m54_q11 = |MADDRBUS[7:6];
wire m54_q3  = |MADDRBUS[5:4];
wire m54_q6  = m54_q11 | m54_q3;
wire m54_q8 = m55_q8 | m54_q6;

wire m41_q8 = ~&MADDRBUS[5:4];
wire m22_q8 = ~(m41_q8 | m54_q11 | m55_q8);

wire m22_q12 = ~(FD0Xn | RDEn | AB3n);
wire m22_q6  = ~(FD0Xn | WTQEn | AB3n);

wire m120_q13 = ~(MADDRBUS[3] | MADDRBUS[1]);
wire m107_q8 = ~(m120_q13 & MADDRBUS[2] & MADDRBUS[0]);
wire m120_q1 = ~(m107_q8 | FD0Xn);
wire m14_q6 = ~(m120_q1 & E & RWBn);

assign IOSn = m55_q8;
assign FD0Xn = m54_q8;
assign PLTREGn = ~(m22_q8 & MADDRBUS[3]);
assign WFD05n = m14_q6;
assign AB3n = ~MADDRBUS[3];

x74138 x74138_m40 (
  .G2B ( m54_q8       ),
  .G2A ( WTQEn        ),
  .G1  ( ~MADDRBUS[3] ),
  .A   ( MADDRBUS[0]  ),
  .B   ( MADDRBUS[1]  ),
  .C   ( MADDRBUS[2]  ),
  .Y0  ( WFD00n       ),
  .Y1  ( WFD01n       ),
  .Y2  ( WFD02n       ),
  .Y3  ( WFD03n       )
);

x74138 x74138_m52 (
  .G2B ( m54_q8       ),
  .G2A ( RDEn         ),
  .G1  ( ~MADDRBUS[3] ),
  .A   ( MADDRBUS[0]  ),
  .B   ( MADDRBUS[1]  ),
  .C   ( MADDRBUS[2]  ),
  .Y0  ( RFD00n       ),
  .Y1  ( RFD01n       ),
  .Y2  ( RFD02n       ),
  .Y3  ( RFD03n       ),
  .Y4  ( RFD04n       ),
  .Y5  ( RFD05n       )
);

x74138 x74138_m93 (
  .G2B ( m54_q8       ),
  .G2A ( MADDRBUS[3]  ),
  .G1  ( m22_q8       ),
  .A   ( MADDRBUS[0]  ),
  .B   ( MADDRBUS[1]  ),
  .C   ( MADDRBUS[2]  ),
  .Y7  ( WFD37n       )
);

// This part was supposed to be implemented in the SOUND page if we follow schematics.

wire [3:0] m32_o1;
wire [3:0] m32_o2;

x74139 x74139_m32(
  .E1 ( ~m22_q12      ),
  .A1 ( MADDRBUS[1:0] ),
  .O1 ( m32_o1        ),
  .E2 ( ~m22_q6       ),
  .A2 ( MADDRBUS[1:0] ),
  .O2 ( m32_o2        )
);

assign RFD0En = m32_o1[2];
assign RFD0Fn = m32_o1[3];
assign WFD0Dn = m32_o2[1];
assign WFD0En = m32_o2[2];
assign WFD0Fn = m32_o2[3];

endmodule
