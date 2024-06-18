// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module TMNTAudio (
	input clk_main,
	input nRESET,
	input SNDON,
	input [15:0] M68K_dout,
	input SNDDT
);

wire [15:0] Z80_addr;
reg [7:0] Z80_din;
wire [7:0] Z80_dout;

wire [7:0] Z80_rom_dout;
wire [7:0] Z80_ram_dout;

reg [18:0] theme_addr;
wire [15:0] theme_rom_dout;
wire [15:0] upd7759_addr;
wire [7:0] upd7759_rom_dout;

wire [15:0] k007232_addr;
wire [7:0] k007232_rom_dout;

reg [7:0] levels;
reg [7:0] U82;

reg [7:0] snd_code;
wire [7:0] ym2151_dout;

reg nINT;
reg SNDON_prev;
reg SNDDT_prev;

rom_sim #(8, 15, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_z80_8.txt") ROM_Z80(Z80_addr[14:0], Z80_rom_dout);			// 32k * 8
rom_sim #(16, 18, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_theme_16.txt") ROM_THEME(theme_addr[17:0], theme_rom_dout);		// 256k * 16
rom_sim #(8, 16, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_7759C_8.txt") ROM_7759(upd7759_addr, upd7759_rom_dout);		// 128k * 8
rom_sim #(8, 16, "C:/Users/furrtek/Documents/Arcade-TMNT_MiSTer/sim/roms/rom_007232_8.txt") ROM_007232(k007232_addr, k007232_rom_dout);	// 128k * 8
ram_sim #(8, 11, "") RAM_Z80(Z80_addr[10:0], ~nWR & ~U82[0], Z80_dout, Z80_ram_dout);		// 2k * 8

assign nNMI = 1'b1;		// Hardwired
assign nIORQ = 1'b1;	// DEBUG

T80s cpu(
	.RESET_n(nRESET),
	.CLK(CLK_Z80),
	.CEN(1),
	.WAIT_n(nWAIT),
	.INT_n(nINT),
	.NMI_n(nNMI),
	.MREQ_n(nMREQ),
	.IORQ_n(nIORQ),
	.RD_n(nRD),
	.WR_n(nWR),
	.RFSH_n(nRFSH),
	.A(Z80_addr),
	.DI(Z80_din),
	.DO(Z80_dout)
);

always @(posedge clk_main) begin
	// Z80 IRQ
	if (~nRESET | ~nIORQ)
		nINT <= 1;	// Clear IRQ on any Z80 access
	else if ({SNDON_prev, SNDON} == 2'b01)
		nINT <= 0;	// Trigger IRQ on SNDON rising edge

	SNDON_prev <= SNDON;

	// Z80 comm reg
	if ({SNDDT_prev, SNDDT} == 2'b01)
		snd_code <= M68K_dout[7:0];	// Store data on SNDDT rising edge

	SNDDT_prev <= SNDDT;
end

reg [5:0] clk_640k_div;
reg theme_en;

// TMNT theme playback system
always @(posedge clk_main or negedge nRESET) begin
	if (!nRESET) begin
		clk_640k_div <= 6'd0;
		theme_en <= 0;
		theme_addr <= 19'd0;
	end else begin
		clk_640k_div <= clk_640k_div + 1'b1;
		// U119_Q: clk_640k_div[0];
		
		if (theme_en) begin
			theme_addr <= 19'd0;
		end else begin
			if ((clk_640k_div[4:0] == 5'd16) & !theme_addr[18])
				theme_addr <= theme_addr + 1'b1;
		end
	end
end

// Z80 has 32kB ROM at 0000~7FFF
// Z80_A[15:12] Zone
// 1000			work RAM	8000~8FFF (mirrored x2)
// 1001			SRES    	9000~9FFF
// 1010			Comm reg	A000~AFFF
// 1011			DACS    	B000~BFFF (007232)
// 1100			YM2151  	C000~CFFF
// 1101			VDIN    	D000~DFFF
// 1110			VST     	E000~EFFF
// 1111			BSY    	F000~FFFF
// Address decoding only enabled when Z80_RFSH is high !

// The 007232 SLEV ("Set Level") output is used to latch Z80_DOUT to set the analog output levels (4 bits per channel)

// On the real PCB, nothing prevents the Z80 from fighting against the sound code reg U84 if it decides to write to it
// Hopefully this never actually happens
always @(*) begin
	// Check Z80_nMREQ ?
	casez(Z80_addr[15:12])
		4'b0zzz: Z80_din <= Z80_rom_dout;
		4'b1000: Z80_din <= Z80_ram_dout;
		4'b1010: Z80_din <= snd_code;
		4'b1100: Z80_din <= ym2151_dout;
		default: Z80_din <= 8'bzzzz_zzzz;	// DEBUG
	endcase
end

k007232 K007232(
	.DB(Z80_dout),
	.AB({Z80_addr[3:1], ~Z80_addr[0]}),
	.RAM(PCM_ROM_D),
	.SA(PCM_ROM_A),
	.ASD(SAMPLE_A),
	.BSD(SAMPLE_B),
	.SLEV(SLEV),
	.CLK(CLK),
	.DACS(U82[3]),
	.NRES(nRESET),
	.NRD(1),
	.NRCS(1)
);

always @(posedge SLEV)
	levels <= Z80_dout;

always @(*) begin
	case ({Z80_addr[15], nMREQ, ~nRFSH, Z80_addr[14:12]})
		6'b100_000: U82 <= 8'b11111110;
		6'b100_001: U82 <= 8'b11111101;
		6'b100_010: U82 <= 8'b11111011;
		6'b100_011: U82 <= 8'b11110111;
		6'b100_100: U82 <= 8'b11101111;
		6'b100_101: U82 <= 8'b11011111;
		6'b100_110: U82 <= 8'b10111111;
		6'b100_111: U82 <= 8'b01111111;
		default: U82 <= 8'b11111111;
	endcase
end

/*YM2151 YM(
	.CLK(SNDCLK),
	.IC(nRESET),
	.A0(Z80_addr[0]),
	.DIN(Z80_dout),
	.DOUT(ym2151_dout),
	.nWR(nWR),
	.nRD(nRD),
	.nCS(U82[4])
);*/
assign ym2151_dout = 8'd0;

endmodule
