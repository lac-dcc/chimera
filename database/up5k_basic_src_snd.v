// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// snd.v - 4-voice sound generation via 1-bit Sigma-Delta modulation
// 04-14-19 E. Brombaugh
//
// 16 8-bit registers in 4 sets of 4 - one set for each voice
// Each set contains
// Base + Voice # * 4 + 0 = low 8 bits frequency - buffered
// Base + Voice # * 4 + 1 = high 8 bits frequency - write here to load lo & hi
// Base + Voice # * 4 + 2 = 3 bits waveform select
// Base + Voice # * 4 + 3 = 8 bits amplitude
// Actual frequency is [16-bit freq value] * Clock Freq / 2^25
// which is roughly value * 0.476Hz for 16MHz clock, so max freq
// range is 0 - 31.250kHz in 0.476Hz steps
// Waveforms are: 0 = saw up, 1 = square, 2 = triangle, 3 = sine,
//                4 = 1-bit noise, 5 = 16-bit noise, 6,7 = saw down
// Output is 1-bit. Filter with 100ohm/0.1uf RC LPF for ~16kHz rolloff.

`default_nettype none

module snd(
	input clk,				// system clock
	input rst,				// system reset
	input cs,				// chip select
	input we,				// write enable
	input [3:0] addr,		// register select
	input [7:0] din,		// data bus input
	output reg [7:0] dout,	// data bus output
	output snd_l,			// left 1-bit DAC output
	output snd_r,			// right 1-bit DAC output
	output snd_nmute		// /mute output
);
	// write control registers
	reg [7:0] f_lo[3:0];
	reg [15:0] frq[3:0];
	reg [2:0] wave[3:0];
	reg [7:0] gain[3:0];
	integer i;
	always @(posedge clk)
		if(rst)
		begin
			for(i=0;i<=3;i=i+1)
			begin
				f_lo[i] <= 8'h00;
				frq[i] <= 16'h0000;
			end
		end
		else if(cs & we)
			case(addr[1:0])
				2'h0: f_lo[addr[3:2]] <= din;
				2'h1: frq[addr[3:2]] <= {din,f_lo[addr[3:2]]};
				2'h2: wave[addr[3:2]] <= din[2:0];
				2'h3: gain[addr[3:2]] <= din;
			endcase
	
	// read registers
	always @(posedge clk)
		if(cs & !we)
			case(addr[1:0])
				2'h0: dout <= frq[addr[3:2]][7:0];
				2'h1: dout <= frq[addr[3:2]][15:8];
				2'h2: dout <= {5'h00,wave[addr[3:2]]};
				2'h3: dout <= gain[addr[3:2]];
				default: dout <= 8'h00;
			endcase
	
	// sine LUT
	reg signed [15:0] sine_lut[255:0];
	initial
		$readmemh("../src/sine.hex", sine_lut, 0);
		
	// NCOs and SD acc
	reg [1:0] seq, seq_d1;
	reg [23:0] phs[3:0];
	reg carry;
	reg [19:0] noise[3:0];
	reg [16:0] seq_phs;
	reg [15:0] sine;
	reg [15:0] wv;
	reg [7:0] seq_gain;
	reg [23:0] wv_scl;
	reg [16:0] sd_acc;
	always @(posedge clk)
		if(rst)
		begin
			seq <= 2'b00;
			
			for(i=0;i<=3;i=i+1)
				phs[i] <= 24'h000000;
			
			sd_acc <= 17'h00000;
		end
		else 			
		begin
			// sequential count to index all four voices
			seq <= seq + 2'b01;
			
			// 24-bit NCO with carry output
			{carry,phs[seq]} <= {1'b0,phs[seq]} + {9'h00,frq[seq]};
			
			// select phase
			seq_d1 <= seq;
			seq_phs <= phs[seq][23:7];
			
			// sine shaping
			sine <= sine_lut[phs[seq][23:16]];
			
			// 16-bit noise generation from 2^20-1 LFSR
			if(carry)
				noise[seq] <= 
					{
						noise[seq][3:0],		// top 4 are just shifted
						~(noise[seq][19:4]^noise[seq][16:1])
					};
			
			// wave shaping
			seq_gain <= gain[seq_d1];
			case(wave[seq_d1])
				3'b000: wv <= seq_phs[16:1];	// saw up
				3'b001: wv <= seq_phs[16] ? 16'hffff : 16'h0000; // square
				3'b010: wv <= seq_phs[16] ? ~seq_phs[15:0] : seq_phs[15:0]; // triangle
				3'b011: wv <= sine^16'h8000;	// offset-binary sine
				3'b100: wv <= noise[seq][19] ? 16'hffff : 16'h0000; // 1-bit noise
				3'b101: wv <= noise[seq][15:0]; // 16-bit noise
				default : wv <= ~seq_phs[16:1]; // saw down
			endcase
			
			// gain scaling
			wv_scl <= wv * seq_gain;
			
			// 1st-order sigma-delta
			sd_acc <= {1'b0,sd_acc[15:0]} + {1'b0,wv_scl[23:8]};
		end
		
	// sigma-delta output is carry output of accum
	assign snd_l = sd_acc[16];
	assign snd_r = sd_acc[16];
	assign snd_nmute = 1'b1;
endmodule
