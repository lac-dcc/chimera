// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module SCPU(
  input RESETBn,
  input SCPUCLK,
  input SCLKNMIn,
  input SUBIRQn,
  input KSTROBEn,
  input SHALTn,
  output [15:0] SADDRBUS,
  input [7:0] SDATABUS_in,
  output [7:0] SDATABUS_out,
  output SWTQEn,
  output SQANDEn,
  output SRDQEn,
  output SQB,
  output SEB,
  output SHALTSTn,
  output SRWB,
  output SRWBn,
  output SBA
);

wire E, Q;
wire RnW;
wire BS, BA;

assign SBA = BA;
assign SRWB = RnW;
assign SRWBn = ~RnW;
assign SHALTSTn = ~(BA & BS);
assign SEB = E;
assign SQB = Q;

assign SQANDEn = ~(Q&E);
assign SWTQEn = SQANDEn | RnW;
assign SRDQEn = ~((Q|E) & RnW);

mc6809s mc6809s_i0 (
  .CLK4     ( SCPUCLK      ),
  .D        ( SDATABUS_in  ),
  .E        ( E            ),
  .Q        ( Q            ),
  .nIRQ     ( SUBIRQn      ),
  .nFIRQ    ( KSTROBEn     ),
  .nNMI     ( SCLKNMIn     ),
  .nHALT    ( SHALTn       ),
  .nRESET   ( RESETBn      ),
  .nDMABREQ ( 1'b1         ),
  .DOut     ( SDATABUS_out ),
  .ADDR     ( SADDRBUS     ),
  .RnW      ( RnW          ),
  .BS       ( BS           ),
  .BA       ( BA           ),
  .AVMA     (              ),
  .BUSY     (              ),
  .LIC      (              )
);

endmodule
