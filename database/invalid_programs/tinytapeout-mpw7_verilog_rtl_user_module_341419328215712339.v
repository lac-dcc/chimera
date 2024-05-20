// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341419328215712339(
	input [7:0] io_in, 
	output [7:0] io_out
);
	wire clk25 = io_in[0];
	wire rst = io_in[1];

	wire sw_switch = io_in[7];

	// for funny
	wire [2:0]sw1 = io_in[4:2];

	// for counter
	wire [1:0]sw_outctrl = io_in[5:4];
	wire sw_pause = io_in[6];
	wire signal1 = io_in[2];
	wire signal2 = io_in[3];
	reg sig1r;
	reg sig2r;
	reg sig1rr;
	reg sig2rr;

	reg [13:0]cnt = 0;
	reg [13:0]cnt2 = 0;
	always @ (posedge clk25) begin
		sig1r <= signal1;
		sig2r <= signal2;
		sig1rr <= sig1r;
		sig2rr <= sig2r;
		if (sw_switch) begin
			if (rst) begin
				cnt <= 0;
				cnt2 <= 0;
			end else begin
				if (!sw_pause) begin
					if (sig1r != sig1rr) cnt <= cnt + 1;
					if (sig2r != sig2rr) cnt2 <= cnt2 + 1;
				end
			end
		end else begin
			cnt <= cnt + 1;
		end
	end
	wire clkslow = cnt[3 + sw1];
	reg [6:0]cntslow = 0;
	reg [2:0]cntf = 0;
	always @ (posedge clkslow) begin
		cntslow <= cntslow == 105 ? 0 : cntslow + 1;
		if (!cntslow[0]) begin
			if (cntslow >= 73) begin
				cntf <= cntf == 4 ? 0 : cntf + 1;
			end else
				cntf <= 0;
		end
	end
	reg	[2:0]finalpos;
	always @ (*) begin
		finalpos = 0;
		case (cntf)
			0: finalpos = 2;
			1: finalpos = 6;
			2: finalpos = 0;
			3: finalpos = 3;
			4: finalpos = 5;
		endcase
	end
	reg [7:0]io_out_funny;
	reg [7:0]io_out_cnter;
	always @ (*) begin
		io_out_funny = 0;
		if (cntslow >= 1 && cntslow <= 8) io_out_funny = 8'b11111111 << (8 - cntslow);
		else if (cntslow >= 9 && cntslow <= 17) io_out_funny = 8'b11111111 << (cntslow - 9);
		else if (cntslow >= 18 && cntslow <= 25) io_out_funny = 8'b10000000 >> (cntslow - 18);
		else if (cntslow >= 26 && cntslow <= 33) io_out_funny = 8'b00000001 << (cntslow - 26);
		else if (cntslow >= 35 && cntslow <= 55) io_out_funny = cntslow[0] ? 8'b00000000 : 8'b11111111;
		else if (cntslow >= 56 && cntslow <= 72) io_out_funny = cntslow[0] ? 8'b11110000 : 8'b00001111;
		else if (cntslow >= 73 && cntslow[0] == 0) io_out_funny = 8'b10000000 >> finalpos;

		io_out_cnter = 0;
		case (sw_outctrl)
			2'b00: io_out_cnter = cnt[7:0];
			2'b01: io_out_cnter = {2'b0, cnt[13:8]};
			2'b10: io_out_cnter = cnt2[7:0];
			2'b11: io_out_cnter = {2'b0, cnt2[13:8]};
		endcase
	end
	assign io_out = sw_switch ? io_out_cnter : io_out_funny;
endmodule
