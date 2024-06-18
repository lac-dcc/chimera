// This program was cloned from: https://github.com/raymondrc/FPGA_SM4
// License: GNU General Public License v3.0

`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Rui Chen, raymond.rui.chen@qq.com
// 
// Create Date: 2018/03/09 21:25:02
// Design Name: 
// Module Name: sbox_replace
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sbox_replace	
	(
		data_in,
		result_out														
	);

input	[7:0]	data_in;
output	[7:0]	result_out;

reg		[7:0]	result_out;

always@(*)
	case(data_in)
		8'h00:	result_out	<=	8'hd6;
		8'h01:	result_out	<=	8'h90;
		8'h02:	result_out	<=	8'he9;
		8'h03:	result_out	<=	8'hfe;
		8'h04:	result_out	<=	8'hcc;
		8'h05:	result_out	<=	8'he1;
		8'h06:	result_out	<=	8'h3d;
		8'h07:	result_out	<=	8'hb7;
		8'h08:	result_out	<=	8'h16;
		8'h09:	result_out	<=	8'hb6;
		8'h0a:	result_out	<=	8'h14;
		8'h0b:	result_out	<=	8'hc2;
		8'h0c:	result_out	<=	8'h28;
		8'h0d:	result_out	<=	8'hfb;
		8'h0e:	result_out	<=	8'h2c;
		8'h0f:	result_out	<=	8'h05;
		8'h10:	result_out	<=	8'h2b;
		8'h11:	result_out	<=	8'h67;
		8'h12:	result_out	<=	8'h9a;
		8'h13:	result_out	<=	8'h76;
		8'h14:	result_out	<=	8'h2a;
		8'h15:	result_out	<=	8'hbe;
		8'h16:	result_out	<=	8'h04;
		8'h17:	result_out	<=	8'hc3;
		8'h18:	result_out	<=	8'haa;
		8'h19:	result_out	<=	8'h44;
		8'h1a:	result_out	<=	8'h13;
		8'h1b:	result_out	<=	8'h26;
		8'h1c:	result_out	<=	8'h49;
		8'h1d:	result_out	<=	8'h86;
		8'h1e:	result_out	<=	8'h06;
		8'h1f:	result_out	<=	8'h99;
		8'h20:	result_out	<=	8'h9c;
		8'h21:	result_out	<=	8'h42;
		8'h22:	result_out	<=	8'h50;
		8'h23:	result_out	<=	8'hf4;
		8'h24:	result_out	<=	8'h91;
		8'h25:	result_out	<=	8'hef;
		8'h26:	result_out	<=	8'h98;
		8'h27:	result_out	<=	8'h7a;
		8'h28:	result_out	<=	8'h33;
		8'h29:	result_out	<=	8'h54;
		8'h2a:	result_out	<=	8'h0b;
		8'h2b:	result_out	<=	8'h43;
		8'h2c:	result_out	<=	8'hed;
		8'h2d:	result_out	<=	8'hcf;
		8'h2e:	result_out	<=	8'hac;
		8'h2f:	result_out	<=	8'h62;
		8'h30:	result_out	<=	8'he4;
		8'h31:	result_out	<=	8'hb3;
		8'h32:	result_out	<=	8'h1c;
		8'h33:	result_out	<=	8'ha9;
		8'h34:	result_out	<=	8'hc9;
		8'h35:	result_out	<=	8'h08;
		8'h36:	result_out	<=	8'he8;
		8'h37:	result_out	<=	8'h95;
		8'h38:	result_out	<=	8'h80;
		8'h39:	result_out	<=	8'hdf;
		8'h3a:	result_out	<=	8'h94;
		8'h3b:	result_out	<=	8'hfa;
		8'h3c:	result_out	<=	8'h75;
		8'h3d:	result_out	<=	8'h8f;
		8'h3e:	result_out	<=	8'h3f;
		8'h3f:	result_out	<=	8'ha6;
		8'h40:	result_out	<=	8'h47;
		8'h41:	result_out	<=	8'h07;
		8'h42:	result_out	<=	8'ha7;
		8'h43:	result_out	<=	8'hfc;
		8'h44:	result_out	<=	8'hf3;
		8'h45:	result_out	<=	8'h73;
		8'h46:	result_out	<=	8'h17;
		8'h47:	result_out	<=	8'hba;
		8'h48:	result_out	<=	8'h83;
		8'h49:	result_out	<=	8'h59;
		8'h4a:	result_out	<=	8'h3c;
		8'h4b:	result_out	<=	8'h19;
		8'h4c:	result_out	<=	8'he6;
		8'h4d:	result_out	<=	8'h85;
		8'h4e:	result_out	<=	8'h4f;
		8'h4f:	result_out	<=	8'ha8;
		8'h50:	result_out	<=	8'h68;
		8'h51:	result_out	<=	8'h6b;
		8'h52:	result_out	<=	8'h81;
		8'h53:	result_out	<=	8'hb2;
		8'h54:	result_out	<=	8'h71;
		8'h55:	result_out	<=	8'h64;
		8'h56:	result_out	<=	8'hda;
		8'h57:	result_out	<=	8'h8b;
		8'h58:	result_out	<=	8'hf8;
		8'h59:	result_out	<=	8'heb;
		8'h5a:	result_out	<=	8'h0f;
		8'h5b:	result_out	<=	8'h4b;
		8'h5c:	result_out	<=	8'h70;
		8'h5d:	result_out	<=	8'h56;
		8'h5e:	result_out	<=	8'h9d;
		8'h5f:	result_out	<=	8'h35;
		8'h60:	result_out	<=	8'h1e;
		8'h61:	result_out	<=	8'h24;
		8'h62:	result_out	<=	8'h0e;
		8'h63:	result_out	<=	8'h5e;
		8'h64:	result_out	<=	8'h63;
		8'h65:	result_out	<=	8'h58;
		8'h66:	result_out	<=	8'hd1;
		8'h67:	result_out	<=	8'ha2;
		8'h68:	result_out	<=	8'h25;
		8'h69:	result_out	<=	8'h22;
		8'h6a:	result_out	<=	8'h7c;
		8'h6b:	result_out	<=	8'h3b;
		8'h6c:	result_out	<=	8'h01;
		8'h6d:	result_out	<=	8'h21;
		8'h6e:	result_out	<=	8'h78;
		8'h6f:	result_out	<=	8'h87;
		8'h70:	result_out	<=	8'hd4;
		8'h71:	result_out	<=	8'h00;
		8'h72:	result_out	<=	8'h46;
		8'h73:	result_out	<=	8'h57;
		8'h74:	result_out	<=	8'h9f;
		8'h75:	result_out	<=	8'hd3;
		8'h76:	result_out	<=	8'h27;
		8'h77:	result_out	<=	8'h52;
		8'h78:	result_out	<=	8'h4c;
		8'h79:	result_out	<=	8'h36;
		8'h7a:	result_out	<=	8'h02;
		8'h7b:	result_out	<=	8'he7;
		8'h7c:	result_out	<=	8'ha0;
		8'h7d:	result_out	<=	8'hc4;
		8'h7e:	result_out	<=	8'hc8;
		8'h7f:	result_out	<=	8'h9e;
		8'h80:	result_out	<=	8'hea;
		8'h81:	result_out	<=	8'hbf;
		8'h82:	result_out	<=	8'h8a;
		8'h83:	result_out	<=	8'hd2;
		8'h84:	result_out	<=	8'h40;
		8'h85:	result_out	<=	8'hc7;
		8'h86:	result_out	<=	8'h38;
		8'h87:	result_out	<=	8'hb5;
		8'h88:	result_out	<=	8'ha3;
		8'h89:	result_out	<=	8'hf7;
		8'h8a:	result_out	<=	8'hf2;
		8'h8b:	result_out	<=	8'hce;
		8'h8c:	result_out	<=	8'hf9;
		8'h8d:	result_out	<=	8'h61;
		8'h8e:	result_out	<=	8'h15;
		8'h8f:	result_out	<=	8'ha1;
		8'h90:	result_out	<=	8'he0;
		8'h91:	result_out	<=	8'hae;
		8'h92:	result_out	<=	8'h5d;
		8'h93:	result_out	<=	8'ha4;
		8'h94:	result_out	<=	8'h9b;
		8'h95:	result_out	<=	8'h34;
		8'h96:	result_out	<=	8'h1a;
		8'h97:	result_out	<=	8'h55;
		8'h98:	result_out	<=	8'had;
		8'h99:	result_out	<=	8'h93;
		8'h9a:	result_out	<=	8'h32;
		8'h9b:	result_out	<=	8'h30;
		8'h9c:	result_out	<=	8'hf5;
		8'h9d:	result_out	<=	8'h8c;
		8'h9e:	result_out	<=	8'hb1;
		8'h9f:	result_out	<=	8'he3;
		8'ha0:	result_out	<=	8'h1d;
		8'ha1:	result_out	<=	8'hf6;
		8'ha2:	result_out	<=	8'he2;
		8'ha3:	result_out	<=	8'h2e;
		8'ha4:	result_out	<=	8'h82;
		8'ha5:	result_out	<=	8'h66;
		8'ha6:	result_out	<=	8'hca;
		8'ha7:	result_out	<=	8'h60;
		8'ha8:	result_out	<=	8'hc0;
		8'ha9:	result_out	<=	8'h29;
		8'haa:	result_out	<=	8'h23;
		8'hab:	result_out	<=	8'hab;
		8'hac:	result_out	<=	8'h0d;
		8'had:	result_out	<=	8'h53;
		8'hae:	result_out	<=	8'h4e;
		8'haf:	result_out	<=	8'h6f;
		8'hb0:	result_out	<=	8'hd5;
		8'hb1:	result_out	<=	8'hdb;
		8'hb2:	result_out	<=	8'h37;
		8'hb3:	result_out	<=	8'h45;
		8'hb4:	result_out	<=	8'hde;
		8'hb5:	result_out	<=	8'hfd;
		8'hb6:	result_out	<=	8'h8e;
		8'hb7:	result_out	<=	8'h2f;
		8'hb8:	result_out	<=	8'h03;
		8'hb9:	result_out	<=	8'hff;
		8'hba:	result_out	<=	8'h6a;
		8'hbb:	result_out	<=	8'h72;
		8'hbc:	result_out	<=	8'h6d;
		8'hbd:	result_out	<=	8'h6c;
		8'hbe:	result_out	<=	8'h5b;
		8'hbf:	result_out	<=	8'h51;
		8'hc0:	result_out	<=	8'h8d;
		8'hc1:	result_out	<=	8'h1b;
		8'hc2:	result_out	<=	8'haf;
		8'hc3:	result_out	<=	8'h92;
		8'hc4:	result_out	<=	8'hbb;
		8'hc5:	result_out	<=	8'hdd;
		8'hc6:	result_out	<=	8'hbc;
		8'hc7:	result_out	<=	8'h7f;
		8'hc8:	result_out	<=	8'h11;
		8'hc9:	result_out	<=	8'hd9;
		8'hca:	result_out	<=	8'h5c;
		8'hcb:	result_out	<=	8'h41;
		8'hcc:	result_out	<=	8'h1f;
		8'hcd:	result_out	<=	8'h10;
		8'hce:	result_out	<=	8'h5a;
		8'hcf:	result_out	<=	8'hd8;
		8'hd0:	result_out	<=	8'h0a;
		8'hd1:	result_out	<=	8'hc1;
		8'hd2:	result_out	<=	8'h31;
		8'hd3:	result_out	<=	8'h88;
		8'hd4:	result_out	<=	8'ha5;
		8'hd5:	result_out	<=	8'hcd;
		8'hd6:	result_out	<=	8'h7b;
		8'hd7:	result_out	<=	8'hbd;
		8'hd8:	result_out	<=	8'h2d;
		8'hd9:	result_out	<=	8'h74;
		8'hda:	result_out	<=	8'hd0;
		8'hdb:	result_out	<=	8'h12;
		8'hdc:	result_out	<=	8'hb8;
		8'hdd:	result_out	<=	8'he5;
		8'hde:	result_out	<=	8'hb4;
		8'hdf:	result_out	<=	8'hb0;
		8'he0:	result_out	<=	8'h89;
		8'he1:	result_out	<=	8'h69;
		8'he2:	result_out	<=	8'h97;
		8'he3:	result_out	<=	8'h4a;
		8'he4:	result_out	<=	8'h0c;
		8'he5:	result_out	<=	8'h96;
		8'he6:	result_out	<=	8'h77;
		8'he7:	result_out	<=	8'h7e;
		8'he8:	result_out	<=	8'h65;
		8'he9:	result_out	<=	8'hb9;
		8'hea:	result_out	<=	8'hf1;
		8'heb:	result_out	<=	8'h09;
		8'hec:	result_out	<=	8'hc5;
		8'hed:	result_out	<=	8'h6e;
		8'hee:	result_out	<=	8'hc6;
		8'hef:	result_out	<=	8'h84;
		8'hf0:	result_out	<=	8'h18;
		8'hf1:	result_out	<=	8'hf0;
		8'hf2:	result_out	<=	8'h7d;
		8'hf3:	result_out	<=	8'hec;
		8'hf4:	result_out	<=	8'h3a;
		8'hf5:	result_out	<=	8'hdc;
		8'hf6:	result_out	<=	8'h4d;
		8'hf7:	result_out	<=	8'h20;
		8'hf8:	result_out	<=	8'h79;
		8'hf9:	result_out	<=	8'hee;
		8'hfa:	result_out	<=	8'h5f;
		8'hfb:	result_out	<=	8'h3e;
		8'hfc:	result_out	<=	8'hd7;
		8'hfd:	result_out	<=	8'hcb;
		8'hfe:	result_out	<=	8'h39;
		8'hff:	result_out	<=	8'h48;
	endcase

endmodule
