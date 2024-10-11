// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module cpu_68k(
	input clk,	// Must be 2x CPU clock
	input nRESET,
	input IPL2, IPL1, IPL0,
	input nDTACK,
	output [23:1] M68K_ADDR,
	input [15:0] FX68K_DATAIN,
	output [15:0] FX68K_DATAOUT,
	output nLDS, nUDS,
	output nAS,
	output M68K_RW,
	output FC2, FC1, FC0,
	output nBG,
	input nBR, nBGACK
);
	
reg  M68K_CLKEN;
wire EN_PHI1 = M68K_CLKEN;
wire EN_PHI2 = ~M68K_CLKEN;

// Divide-by-2
always @(negedge clk or negedge nRESET)
begin
	if (!nRESET)
		M68K_CLKEN <= 1'b0;
	else
		M68K_CLKEN <= ~M68K_CLKEN;
end
	
reg reset;
always @(posedge clk)
	if (EN_PHI2) reset <= ~nRESET;

fx68k FX68K(
		.clk(clk),
		.extReset(reset),
		.pwrUp(reset),
		
		.enPhi1(EN_PHI1),
		.enPhi2(EN_PHI2),
		
		.eRWn(M68K_RW),
		.ASn(nAS),
		.UDSn(nUDS),
		.LDSn(nLDS),
		
		.BGn(nBG),
		.BRn(nBR),
		.BGACKn(nBGACK),
		
		.DTACKn(nDTACK),
		
		.VPAn(1'b1),	//~IPL2 | nAS | ~&M68K_ADDR[23:4]), // VPA must be fired only in IACK cycle !
		.BERRn(1'b1),
		
		.IPL0n(IPL0),
		.IPL1n(IPL1),
		.IPL2n(IPL2),
		
		.FC0(FC0),
		.FC1(FC1),
		.FC2(FC2),
		
		.iEdb(FX68K_DATAIN),
		.oEdb(FX68K_DATAOUT),
		.eab(M68K_ADDR)
		);
	
endmodule
