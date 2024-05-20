// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module PERIPHERAL(
    input [7:0] MDATABUS_in,
    output [7:0] MDATABUS_out,
    input WFD00n,
    input WFD01n,
    input WFD05n,
    input RFD02n,
    input RFD03n,
    input RESETBn,
    input LPMASKn,
    output reg LPINTn,
    output IRQCLRn,
    output reg LPBUSY,
    output GHn,
    output Z80W,
    output CANCELn,
    output SUBHALTREQn,
    output motor,
    input cin
);

reg [7:0] m10;
reg [7:0] m2;
reg [2:0] m9;
wire reset = ~RESETBn;

assign motor = m10[1];

// m10: TAPE
always @(negedge WFD00n or negedge RESETBn)
  if (~RESETBn) m10 <= 8'd0;
  else m10 <= MDATABUS_in;

always @(posedge WFD01n or posedge reset)
  if (reset) m2 <= 8'd0;
  else m2 <= MDATABUS_in;

always @(posedge WFD05n or posedge reset)
  if (reset) m9 <= 3'd0;
  else m9 <= { MDATABUS_in[7:6], MDATABUS_in[0] };

wire [34:1] CN2;
wire [8:1] CN3;
//                                       TAPEIN        LPDET2  LPDET1    ON      ACKNG   /ERROR   BUSY
assign MDATABUS_out = RFD02n ? 8'hff : { cin, 1'b0, CN2[6], CN2[3], CN2[12], CN2[16], CN2[7], LPBUSY };

assign CN3[4] = m10[0]; // TAPEOUT
assign CN3[6] = m10[1]; // MOTOR

assign GHn = ~m9[0];
assign Z80W = m9[0];
assign CANCELn = ~m9[1];
assign SUBHALTREQn = ~m9[2];

// ack or reset
wire m39_q11 = ~(CN2[16] & RESETBn);

wire s0 = ~m10[6];
always @(posedge s0 or posedge m39_q11)
  if (m39_q11) LPBUSY <= 1'b0;
  else LPBUSY <= 1'b1;

assign IRQCLRn = RFD03n & RESETBn;
wire s1 = ~IRQCLRn;

// m15
always @(posedge CN2[16] or posedge s1)
  if (s1) LPINTn <= 1'b1;
  else LPINTn <= LPMASKn;

endmodule
