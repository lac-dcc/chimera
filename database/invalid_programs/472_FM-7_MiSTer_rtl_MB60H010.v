// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


// 640x200 x 8 colors or 8-level grayscale (80 digits x 25 lines)
// 40 x 12

// H=15.75KHz (16.128/1024)
//  |<- 384 (23.8us) ->|<- 640 (39.7us) ->|
// HSync = <9.9us><sync 4us><9.9us> = 23.8 (159.73px,64.53px,159.73px)


// V=60.1145Hz (15.75KHz/262)
// |<- 62 (3.937ms) ->|<- 200 (12.698ms) ->|
// VSync = <1.524ms (24)><sync 0.508ms(8)><1.505ms(30)>


module MB60H010(
  input SRESETn,
  input CLKSYS,
  input [15:0] SADDRBUS,
  input [7:0] SDATA,
  input SREGLn,
  input SREGHn,
  input SADRSEL,
  output SFTCLK, // shift register clock
  output SCLK1,
  output SCLK2, // clock for MB88401 MCU
  output [13:0] SVRADRS, // $0000-$3FFF - 7bits multiplexed on schematics
  output SVIDEOCLK, // video clock
  output SVSYNCn,
  output SHSYNCn,
  output SVDHALT,
  output SFTLODn, // shift registers load signal
  output SBLANKn,
  output SCSYNCn,
  output SCASSEL,
  output VBLANKn,
  output HBLANKn
);

wire _16128KHz; // bad name, it's a 16MHz clock

clk_en #(CORE_CLK_8) u_ck1_en(.ref_clk(CLKSYS), .clk(SCLK1));
clk_en #(CORE_CLK_4) u_ck2_en(.ref_clk(CLKSYS), .clk(SCLK2));
clk_en #(CORE_CLK_2) u_ck3_en(.ref_clk(CLKSYS), .clk(SVIDEOCLK));
clk_en #(CORE_CLK_16) u_ck_en(.ref_clk(CLKSYS), .clk(_16128KHz));

reg [7:0] SRL;
reg [7:0] SRH;
wire [13:0] VOFFSET = { SRH, SRL[7:5], 5'd0 };

assign SFTCLK = _16128KHz;

always @(negedge SREGLn)
  SRL <= SDATA;

always @(negedge SREGHn)
  SRH <= SDATA;


reg [9:0] xx;
reg [8:0] yy;

wire [6:0] char_x = xx[9:3];

wire [13:0] SRA = VOFFSET + yy * 80 + char_x;

// SVRADRS (VRAM address) mux based on blank (SUB or VIDEO)
assign SVRADRS = SCASSEL ? SADDRBUS[13:0] + VOFFSET : SRA;

assign SHSYNCn = ~(xx >= 10'd800 && xx < 10'd864);
assign SVSYNCn = ~(yy >= 9'd224 && yy < 9'd233);

assign HBLANKn = ~(xx > 10'd639);
assign VBLANKn = ~(yy > 9'd199);
assign SCASSEL = ~(HBLANKn & VBLANKn);
assign SBLANKn = ~SCASSEL;
assign SVDHALT =
  yy < 9'd200 ? (xx < 10'd639 || xx > 10'd930) :
  yy < 9'd261 ? 1'b0 :
  xx > 10'd930;

assign SFTLODn = |xx[2:0];// | SFTCLK;

always @(posedge _16128KHz) begin
  if (~SRESETn) begin
    xx <= 0;
    yy <= 0;
  end
  else begin
	  xx <= xx + 10'd1;
	  if (xx == 1023) begin
	    xx <= 10'd0;
	    yy <= yy + 9'd1;
	    if (yy == 261) begin
	      yy <= 9'd0;
	    end
	  end
	end
end
endmodule
