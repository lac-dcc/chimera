// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


// Page 12 on schematics.

module FLAGS(
  input SRWB,
  input SCRTSWn,
  input SRESETn,
  input SLEDn,
  input CANCELn,
  input SIRQCLRn,
  input [7:0] MDATABUS_in,
  input RESETBn,
  input WFD37n,
  input SRWBn,
  input SVDHALT,
  input SVRACSn,
  input SUBHALTREQn,
  input SBUSYSETn,
  input SHALTSTn,
  output SHALTn,
  output SVDOFFn,
  output SUBIRQn,
  output BUSY,
  output SHALTACn,
  output VPAGE1n,
  output VPAGE2n,
  output VPAGE3n,
  output DPAGE1,
  output DPAGE2,
  output DPAGE3,
  output INS
);

reg m56_5;
reg m56_9;
reg m45;
reg m44_5;
reg m44_8;
reg [7:0] m46;


assign SVDOFFn = m56_5;
assign INS = m56_9;

wire s0 = ~SRESETn;
always @(posedge SCRTSWn, posedge s0)
  if (s0) m56_5 <= 1'b1;
  else m56_5 <= SRWB;

always @(posedge SLEDn, posedge s0)
  if (s0) m56_9 <= 1'b1;
  else m56_9 <= SRWB;

wire s1 = ~(SRESETn & SIRQCLRn);
always @(posedge CANCELn, posedge s1)
  if (s1) m45 <= 1'b0;
  else m45 <= 1'b1;

wire s2 = ~SRESETn;
always @(posedge SVRACSn or posedge s2)
  if (s2) m44_5 <= 1'b1;
  else m44_5 <= SRWBn;

assign SHALTn = ~(SVDHALT & m44_5) & SUBHALTREQn;
assign SHALTACn = SUBHALTREQn | SHALTSTn;

wire s3 = RESETBn & SHALTACn;
always @(negedge SBUSYSETn or negedge s3)
  if (~s3) m44_8 <= 1'b0;
  else m44_8 <= SRWBn;

wire s4 = ~RESETBn;
always @(posedge WFD37n or posedge s4)
  if (s4) m46 <= 8'h0;
  else m46 <= MDATABUS_in;

assign BUSY = m44_8;
assign SUBIRQn = ~m45;
assign VPAGE1n = m46[0]; // CPU access
assign VPAGE2n = m46[1]; // CPU access
assign VPAGE3n = m46[2]; // CPU access
assign DPAGE1  = m46[4]; // Display 0 = enable color layer
assign DPAGE2  = m46[5]; // Display
assign DPAGE3  = m46[6]; // Display

endmodule
