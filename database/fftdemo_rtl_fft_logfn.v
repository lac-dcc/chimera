////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	logfn.v
// {{{
// Project:	FFT-DEMO, a verilator-based spectrogram display project
//
// Purpose:	Attempts to calculate the log(X_r^2+X_i^2).  As built, the
// 		log is rather crude, but it is amazingly close to the right
// 	answer over the full range of the potential values given to it.
//
// 	Requires 16-bit inputs (currently).
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2019-2024, Gisselquist Technology, LLC
// {{{
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:	GPL, v3, as defined and found on www.gnu.org,
// {{{
//		http://www.gnu.org/licenses/gpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype	none
// }}}
module	logfn #(
		// {{{
		localparam	IW=16, OW=8
		// }}}
	) (
		// {{{
		input	wire			i_clk, i_reset, i_ce, i_sync,
		input	wire	signed [IW-1:0]	i_real, i_imag,
		output	reg	[OW-1:0]	o_sample,
		output	reg			o_sync
		// }}}
	);

	// Local declarations
	// {{{
	reg	signed [2*IW-1:0] rp, ip;
	reg	[3:0]	pre_sync;
	reg	[6:0]	znibs;
	reg	[4:0]	preshift;
	reg	[5:0]	shft;
	reg	[32:0]	pshiftd;
	reg	[32:0]	shiftd;
	reg	[7:0]	pre_output;
	// }}}

	// rp, ip -- incoming real and imaginary values squared
	// {{{
	always @(posedge i_clk)
	if (i_ce)
	begin
		rp <= i_real * i_real;
		ip <= i_imag * i_imag;
	end
	// }}}

	// pre_sync
	// {{{
	initial	pre_sync = 0;
	always @(posedge i_clk)
	if (i_reset)
		pre_sync <= 0;
	else if (i_ce)
		pre_sync <= { pre_sync[2:0], i_sync };
	// }}}

	// squard -- the sum of the real and imaginary part squared
	// {{{
`ifdef	FORMAL
	(* anyseq *) reg	[2*IW:0]	squard;
`else
	reg	[2*IW:0]	squard;
	always @(posedge i_clk)
	if (i_ce)
		squard <= rp + ip;
`endif
	// }}}

	// Count the number of zero nibbles on the left
	// {{{
	always @(posedge i_clk)
	begin
		znibs[6] <= (squard[32:30]==3'h0);
		znibs[5] <= (squard[29:25]==5'h0);
		znibs[4] <= (squard[24:20]==5'h0);
		znibs[3] <= (squard[19:15]==5'h0);
		znibs[2] <= (squard[14:10]==5'h0);
		znibs[1] <= (squard[ 9: 5]==5'h0);
		znibs[0] <= (squard[ 4: 0]==5'h0);
	end
	// }}}

	// Shift the mantissa, to there's a one in the MSB
	// {{{
	always @(posedge i_clk)
	if (i_ce)
	begin
		// Stage one: Shift by multiples of five bits
		// {{{
		casez(znibs)
		7'b1_0??_???:begin preshift<=5'd03; pshiftd<=(squard <<  3); end
		7'b1_10?_???:begin preshift<=5'd08; pshiftd<=(squard <<  8); end
		7'b1_110_???:begin preshift<=5'd13; pshiftd<=(squard << 13); end
		7'b1_111_0??:begin preshift<=5'd18; pshiftd<=(squard << 18); end
		7'b1_111_10?:begin preshift<=5'd23; pshiftd<=(squard << 23); end
		7'b1_111_110:begin preshift<=5'd28; pshiftd<=(squard << 28); end
		default: begin     preshift<=5'd0;  pshiftd<= squard; end
		endcase
		// }}}

		// Stage two: Shift by any remaining bits
		// {{{
		casez(pshiftd[32:27])
		6'b1?????:begin shft<={1'b0,preshift};shiftd<=pshiftd   ; end
		6'b01????:begin shft<=preshift+1; shiftd <= (pshiftd<<1); end
		6'b001???:begin shft<=preshift+2; shiftd <= (pshiftd<<2); end
		6'b0001??:begin shft<=preshift+3; shiftd <= (pshiftd<<3); end
		6'b00001?:begin shft<=preshift+4; shiftd <= (pshiftd<<4); end
		6'b000001:begin shft<=preshift+4; shiftd <= (pshiftd<<5); end
		6'b000000:begin shft<=preshift+5; shiftd <= (pshiftd<<6); end
		endcase
		// }}}

		// Stage three: grab the upper 8-bits of the shifted value
		// {{{
		if (shft == 6'h00)
			pre_output <= 8'hff;
		else if (shiftd[32])
		begin
			pre_output[7:3] <= -shft[4:0];
			pre_output[2:0] <= shiftd[31:29];
		end else
			pre_output <= 0;
		// }}}
	end
	// }}}

	// o_sync
	// {{{
	initial	o_sync = 0;
	always @(posedge i_clk)
	if (i_reset)
		o_sync <= 0;
	else if (i_ce)
		o_sync <= pre_sync[3];
	// }}}

	// o_sample
	// {{{
	always @(posedge i_clk)
		o_sample <= pre_output;
	// }}}

	// Make Verilator happy
	// {{{
	// verilator lint_off UNUSED
	wire	[28:0] unused;
	assign	unused = { shiftd[28:0] };
	// verilator lint_on  UNUSED
	// }}}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
// Formal properties
// {{{
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
`ifdef	FORMAL
	reg	f_past_valid;
	initial	f_past_valid = 1'b0;
	always @(posedge i_clk)
		f_past_valid = 1'b1;

	always @(posedge i_clk)
	if ($past(i_ce))
		assume(!i_ce);

	always @(posedge i_clk)
	if ((!$past(i_ce))&&(!$past(i_ce,2))&&(!$past(i_ce,3)))
		assume(i_ce);

	always @(posedge i_clk)
	if (!$past(i_ce))
		assume($stable(squard));

	always @(posedge i_clk)
	if ((!f_past_valid)||($past(i_reset)))
	begin
		assert(pre_sync == 0);
		assert(o_sync == 0);
	end

	initial	assert(IW==16);

	reg	[32:0]	f_pipe_sum	[0:3];

	always @(posedge i_clk)
	if (i_ce)
	begin
		f_pipe_sum[0] <= squard;
		f_pipe_sum[1] <= f_pipe_sum[0];
		f_pipe_sum[2] <= f_pipe_sum[1];
		f_pipe_sum[3] <= f_pipe_sum[2];
	end

	reg	f_valid_data;

	initial	f_valid_data = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		f_valid_data <= 1'b0;
	else if ((i_ce)&&(pre_sync[3]))
		f_valid_data <= 1'b1;

	always @(posedge i_clk)
	if ((i_ce)&&(f_valid_data))
	begin
		casez(f_pipe_sum[2][32:0])
		33'b1????_????_????_????_????_????_????_????:
			assert(o_sample == 8'hff);
		33'b01???_????_????_????_????_????_????_????:
			assert(o_sample == { 5'd31, f_pipe_sum[2][30:28] });
		33'b001??_????_????_????_????_????_????_????:
			assert(o_sample == { 5'd30, f_pipe_sum[2][29:27] });
		33'b0001?_????_????_????_????_????_????_????:
			assert(o_sample == { 5'd29, f_pipe_sum[2][28:26] });
		33'b00001_????_????_????_????_????_????_????:
			assert(o_sample == { 5'd28, f_pipe_sum[2][27:25] });
		33'b00000_1???_????_????_????_????_????_????:
			assert(o_sample == { 5'd27, f_pipe_sum[2][26:24] });
		33'b00000_01??_????_????_????_????_????_????:
			assert(o_sample == { 5'd26, f_pipe_sum[2][25:23] });
		33'b00000_001?_????_????_????_????_????_????:
			assert(o_sample == { 5'd25, f_pipe_sum[2][24:22] });
		33'b00000_0001_????_????_????_????_????_????:
			assert(o_sample == { 5'd24, f_pipe_sum[2][23:21] });
		33'b00000_0000_1???_????_????_????_????_????:
			assert(o_sample == { 5'd23, f_pipe_sum[2][22:20] });
		33'b00000_0000_01??_????_????_????_????_????:
			assert(o_sample == { 5'd22, f_pipe_sum[2][21:19] });
		33'b00000_0000_001?_????_????_????_????_????:
			assert(o_sample == { 5'd21, f_pipe_sum[2][20:18] });
		33'b00000_0000_0001_????_????_????_????_????:
			assert(o_sample == { 5'd20, f_pipe_sum[2][19:17] });
		33'b00000_0000_0000_1???_????_????_????_????:
			assert(o_sample == { 5'd19, f_pipe_sum[2][18:16] });
		33'b00000_0000_0000_01??_????_????_????_????:
			assert(o_sample == { 5'd18, f_pipe_sum[2][17:15] });
		33'b00000_0000_0000_001?_????_????_????_????:
			assert(o_sample == { 5'd17, f_pipe_sum[2][16:14] });
		33'b00000_0000_0000_0001_????_????_????_????:
			assert(o_sample == { 5'd16, f_pipe_sum[2][15:13] });
		33'b00000_0000_0000_0000_1???_????_????_????:
			assert(o_sample == { 5'd15, f_pipe_sum[2][14:12] });
		33'b00000_0000_0000_0000_01??_????_????_????:
			assert(o_sample == { 5'd14, f_pipe_sum[2][13:11] });
		33'b00000_0000_0000_0000_001?_????_????_????:
			assert(o_sample == { 5'd13, f_pipe_sum[2][12:10] });
		33'b00000_0000_0000_0000_0001_????_????_????:
			assert(o_sample == { 5'd12, f_pipe_sum[2][11:9] });
		33'b00000_0000_0000_0000_0000_1???_????_????:
			assert(o_sample == { 5'd11, f_pipe_sum[2][10:8] });
		33'b00000_0000_0000_0000_0000_01??_????_????:
			assert(o_sample == { 5'd10, f_pipe_sum[2][9:7] });
		33'b00000_0000_0000_0000_0000_001?_????_????:
			assert(o_sample == { 5'd9, f_pipe_sum[2][8:6] });
		33'b00000_0000_0000_0000_0000_0001_????_????:
			assert(o_sample == { 5'd8, f_pipe_sum[2][7:5] });
		33'b00000_0000_0000_0000_0000_0000_1???_????:
			assert(o_sample == { 5'd7, f_pipe_sum[2][6:4] });
		33'b00000_0000_0000_0000_0000_0000_01??_????:
			assert(o_sample == { 5'd6, f_pipe_sum[2][5:3] });
		33'b00000_0000_0000_0000_0000_0000_001?_????:
			assert(o_sample == { 5'd5, f_pipe_sum[2][4:2]});
		33'b00000_0000_0000_0000_0000_0000_0001_????:
			assert(o_sample == { 5'd4, f_pipe_sum[2][3:1]});
		33'b00000_0000_0000_0000_0000_0000_0000_1???:
			assert(o_sample == { 5'd3, f_pipe_sum[2][2:0] });
		33'b00000_0000_0000_0000_0000_0000_0000_01??:
			assert(o_sample == { 5'd2, f_pipe_sum[2][1:0], 1'b0 });
		33'b00000_0000_0000_0000_0000_0000_0000_001?:
			assert(o_sample == { 5'd1, f_pipe_sum[2][0], 2'b0 });
		33'b00000_0000_0000_0000_0000_0000_0000_0?:
			assert(pre_output == 8'h0);
		default: begin end
		endcase
	end
`endif
// }}}
endmodule
