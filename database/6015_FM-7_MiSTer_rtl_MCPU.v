// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module MCPU(
  input [7:0] MDATABUS_in,
  input RESETn,
  input Z80W,
  input MCPUCLK,
  input GHn,
  input NMIn,
  input IRQn,
  input FIRQn,
  input DMAn,
  input CLKSYS,
  output Z80,
  output RESETBn,
  output QB,
  output EB,
  output BAB,
  output BSB,
  output RWB,
  output WTQEn,
  output RDQEn,
  output REFGRVTn,
  output [7:0] MDATABUS_out,
  output [15:0] MADDRBUS,
  output RDEn,
  output RWBn,
  output E
);

reg [7:0] D;
reg ff_q;

wire BA;
wire BS;
wire RnW;
wire Q;
wire m16_6 = ~(BA & BS); // hold address bus
wire m29_q = ~(m16_6 | GHn);
wire AVMA;
wire BUSY;
wire LIC;

wire [7:0] x74244_A = { 1'b0, RnW, E, Q, 1'b0, BS, BA, RESETn };
wire [7:0] x74244_Y;

assign RESETBn =  x74244_Y[0];
assign BAB     =  x74244_Y[1];
assign BSB     =  x74244_Y[2];
assign QB      =  x74244_Y[4];
assign EB      =  x74244_Y[5];
assign RWB     =  x74244_Y[6];
assign RWBn    = ~x74244_Y[6];

assign WTQEn = x74244_Y[6] | ~(x74244_Y[4] & x74244_Y[5]);
assign RDQEn = ~(x74244_Y[6] & (x74244_Y[4] | x74244_Y[5]));
assign RDEn  = ~(x74244_Y[6] & x74244_Y[5]);

assign Z80 = ~(Q ^ E);

assign REFGRVTn = ~(~m16_6 & ff_q);

always @(posedge QB)
  ff_q <= Z80W;

x74244 x74244_i1(
  .A  ( x74244_A        ),
  .OE ( { m29_q, 1'b0 } ),
  .Y  ( x74244_Y        )
);

mc6809s mc6809s_i0 (
  .CLK4     ( MCPUCLK      ),
  .D        ( MDATABUS_in  ),
  .E        ( E            ),
  .Q        ( Q            ),
  .nIRQ     ( IRQn         ),
  .nFIRQ    ( FIRQn        ),
  .nNMI     ( NMIn         ),
  .nHALT    ( GHn          ),
  .nRESET   ( RESETn       ),
  .nDMABREQ ( DMAn         ),
  .DOut     ( MDATABUS_out ),
  .ADDR     ( MADDRBUS     ),
  .RnW      ( RnW          ),
  .BS       ( BS           ),
  .BA       ( BA           ),
  .AVMA     ( AVMA         ),
  .BUSY     ( BUSY         ),
  .LIC      ( LIC          )
);

endmodule
