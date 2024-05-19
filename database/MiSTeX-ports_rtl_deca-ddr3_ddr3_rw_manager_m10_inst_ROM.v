// This program was cloned from: https://github.com/MiSTeX-devel/MiSTeX-ports
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1 ps / 1 ps
module rw_manager_m10_inst_ROM (
	clock,
	rdaddress,
	q);
	
	input	  clock;
	input	[6:0]  rdaddress;
	output	[19:0]  q;
	
	reg	[19:0]  q;
	
	wire	[6:0]  rdaddress_r;
  assign  rdaddress_r =   rdaddress;
	
always @ (posedge clock)
    case(rdaddress_r)
'h00 : q <= 'h080000;
'h01 : q <= 'h000780;
'h02 : q <= 'h080680;
'h03 : q <= 'h000180;
'h04 : q <= 'h080680;
'h05 : q <= 'h000200;
'h06 : q <= 'h080680;
'h07 : q <= 'h000280;
'h08 : q <= 'h080680;
'h09 : q <= 'h000300;
'h0A : q <= 'h080680;
'h0B : q <= 'h000380;
'h0C : q <= 'h080680;
'h0D : q <= 'h000100;
'h0E : q <= 'h080680;
'h0F : q <= 'h000800;
'h10 : q <= 'h008680;
'h11 : q <= 'h000880;
'h12 : q <= 'h00A680;
'h13 : q <= 'h080680;
'h14 : q <= 'h000900;
'h15 : q <= 'h080680;
'h16 : q <= 'h000980;
'h17 : q <= 'h008680;
'h18 : q <= 'h080680;
'h19 : q <= 'h000B68;
'h1A : q <= 'h00CCE8;
'h1B : q <= 'h000AE8;
'h1C : q <= 'h008CE8;
'h1D : q <= 'h000B88;
'h1E : q <= 'h00EC88;
'h1F : q <= 'h000A08;
'h20 : q <= 'h00AC88;
'h21 : q <= 'h080680;
'h22 : q <= 'h00CE00;
'h23 : q <= 'h00CD80;
'h24 : q <= 'h00E700;
'h25 : q <= 'h000C00;
'h26 : q <= 'h020CE0;
'h27 : q <= 'h020CE0;
'h28 : q <= 'h000D00;
'h29 : q <= 'h000680;
'h2A : q <= 'h000680;
'h2B : q <= 'h060E80;
'h2C : q <= 'h061080;
'h2D : q <= 'h00A680;
'h2E : q <= 'h008680;
'h2F : q <= 'h080680;
'h30 : q <= 'h00CE00;
'h31 : q <= 'h00CD80;
'h32 : q <= 'h00E700;
'h33 : q <= 'h000C00;
'h34 : q <= 'h030CE0;
'h35 : q <= 'h030CE0;
'h36 : q <= 'h000D00;
'h37 : q <= 'h000680;
'h38 : q <= 'h000680;
'h39 : q <= 'h070E80;
'h3A : q <= 'h071080;
'h3B : q <= 'h00A680;
'h3C : q <= 'h008680;
'h3D : q <= 'h080680;
'h3E : q <= 'h001158;
'h3F : q <= 'h0006D8;
'h40 : q <= 'h080680;
'h41 : q <= 'h040E88;
'h42 : q <= 'h041088;
'h43 : q <= 'h040F68;
'h44 : q <= 'h0410E8;
'h45 : q <= 'h00A680;
'h46 : q <= 'h040FE8;
'h47 : q <= 'h0410E8;
'h48 : q <= 'h041008;
'h49 : q <= 'h041088;
'h4A : q <= 'h001100;
'h4B : q <= 'h00C680;
'h4C : q <= 'h008680;
'h4D : q <= 'h00E680;
'h4E : q <= 'h080680;
'h4F : q <= 'h000000;
'h50 : q <= 'h000000;
'h51 : q <= 'h00A000;
'h52 : q <= 'h008000;
'h53 : q <= 'h080000;
'h54 : q <= 'h000080;
'h55 : q <= 'h000080;
'h56 : q <= 'h000080;
'h57 : q <= 'h000080;
'h58 : q <= 'h00A080;
'h59 : q <= 'h008080;
'h5A : q <= 'h080080;
'h5B : q <= 'h008680;
'h5C : q <= 'h00A680;
'h5D : q <= 'h080680;
'h5E : q <= 'h040F08;
'h5F : q <= 'h080680;
'h60 : q <= 'h000000;
'h61 : q <= 'h000000;
'h62 : q <= 'h000000;
'h63 : q <= 'h000000;
'h64 : q <= 'h000000;
'h65 : q <= 'h000000;
'h66 : q <= 'h000000;
'h67 : q <= 'h000000;
'h68 : q <= 'h000000;
'h69 : q <= 'h000000;
'h6A : q <= 'h000000;
'h6B : q <= 'h000000;
'h6C : q <= 'h000000;
'h6D : q <= 'h000000;
'h6E : q <= 'h000000;
'h6F : q <= 'h000000;
'h70 : q <= 'h000000;
'h71 : q <= 'h000000;
'h72 : q <= 'h000000;
'h73 : q <= 'h000000;
'h74 : q <= 'h000000;
'h75 : q <= 'h000000;
'h76 : q <= 'h000000;
'h77 : q <= 'h000000;
'h78 : q <= 'h000000;
'h79 : q <= 'h000000;
'h7A : q <= 'h000000;
'h7B : q <= 'h000000;
'h7C : q <= 'h000000;
'h7D : q <= 'h000000;
'h7E : q <= 'h000000;
'h7F : q <= 'h000000;
        default : q <= 0;
    endcase
endmodule
