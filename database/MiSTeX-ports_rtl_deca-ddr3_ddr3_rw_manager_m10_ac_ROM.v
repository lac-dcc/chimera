// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ps / 1 ps
module rw_manager_m10_ac_ROM (
	clock,
	rdaddress,
	q);
	
	input	  clock;
	input	[5:0]  rdaddress;
	output	[31:0]  q;
	
	reg	[31:0]  q;
	
	reg	[5:0]  rdaddress_r;
always @ (posedge clock)
    rdaddress_r <=  rdaddress;
	
always @ (posedge clock)
    case(rdaddress_r)
'h00 : q <= 'h180E0000;
'h01 : q <= 'h180F0000;
'h02 : q <= 'h0C010231;
'h03 : q <= 'h0C010330;
'h04 : q <= 'h0C012046;
'h05 : q <= 'h0C014208;
'h06 : q <= 'h0C016000;
'h07 : q <= 'h0C070400;
'h08 : q <= 'h0C010249;
'h09 : q <= 'h0C0102C8;
'h0A : q <= 'h0C014026;
'h0B : q <= 'h0C012210;
'h0C : q <= 'h0C016000;
'h0D : q <= 'h1C0F0000;
'h0E : q <= 'h1E0F0000;
'h0F : q <= 'h1C0F0000;
'h10 : q <= 'h0C0D0000;
'h11 : q <= 'h0C0D6000;
'h12 : q <= 'h0C050400;
'h13 : q <= 'h0C090000;
'h14 : q <= 'h0F330000;
'h15 : q <= 'h0F336000;
'h16 : q <= 'h0F330008;
'h17 : q <= 'h0F336008;
'h18 : q <= 'h1E2F0000;
'h19 : q <= 'h1F3F0000;
'h1A : q <= 'h1E0F0000;
'h1B : q <= 'h0E030000;
'h1C : q <= 'h0E230000;
'h1D : q <= 'h0CCB0000;
'h1E : q <= 'h0CCB6000;
'h1F : q <= 'h0CCB0008;
'h20 : q <= 'h0CCB6008;
'h21 : q <= 'h1CCF0000;
'h22 : q <= 'h0C0B0008;
'h23 : q <= 'h0C0F0000;
'h24 : q <= 'h00000000;
'h25 : q <= 'h00000000;
'h26 : q <= 'h00000000;
'h27 : q <= 'h00000000;
        default : q <= 0;
    endcase
endmodule
