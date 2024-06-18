// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module PAL(
  input CLKSYS,
  input SVDOFFn,
  input SBLANKn,
  input [7:0] SVDATAB,
  input [7:0] SVDATAR,
  input [7:0] SVDATAG,
  input SFTCLK,
  input SFTLODn,
  input DPAGE1,
  input DPAGE2,
  input DPAGE3,
  input [7:0] MDATA,
  output reg [7:0] PALDATA,
  input [15:0] MADDRBUS,
  input PLTREGn,
  input RDQEn,
  input WTQEn,
  input RESETBn,
  output reg [2:0] grb
);

wire SFTCLKn = ~SFTCLK;
reg [2:0] rst_idx;

reg [2:0] pal[7:0];
reg [7:0] SFT1;
reg [7:0] SFT2;
reg [7:0] SFT3;

wire m25_3 = ~(SVDOFFn & SBLANKn);

always @(posedge CLKSYS) begin
  if (~RESETBn) begin
    pal[rst_idx] <= rst_idx;
    rst_idx <= rst_idx + 3'b1;
  end
  if (~PLTREGn && ~SFTCLKn) begin
    pal[MADDRBUS[2:0]] <= MDATA[2:0];
  end
end

always @(negedge RDQEn) begin
  if (~PLTREGn) PALDATA <= pal[MADDRBUS[2:0]];
end

wire clr1 = DPAGE1|m25_3;
wire clr2 = DPAGE2|m25_3;
wire clr3 = DPAGE3|m25_3;

reg qh1;
reg qh2;
reg qh3;

wire [2:0] color = { qh3, qh2, qh1 };

always @(posedge SFTCLK) begin
  grb <= pal[color];
  qh1 <= SFT1[7];
  qh2 <= SFT2[7];
  qh3 <= SFT3[7];
end

wire sftlod = ~SFTLODn;

always @(posedge SFTCLK, posedge sftlod, posedge clr1) begin
  if (clr1) SFT1 <= 8'd0;
  else if (sftlod) SFT1 <= SVDATAB;
  else SFT1 <= { SFT1[6:0], 1'b0 };
end

always @(posedge SFTCLK, posedge sftlod, posedge clr2) begin
  if (clr2) SFT2 <= 8'd0;
  else if (sftlod) SFT2 <= SVDATAR;
  else SFT2 <= { SFT2[6:0], 1'b0 };
end

always @(posedge SFTCLK, posedge sftlod, posedge clr3) begin
  if (clr3) SFT3 <= 8'd0;
  else if (sftlod) SFT3 <= SVDATAG;
  else SFT3 <= { SFT3[6:0], 1'b0 };
end


endmodule

