// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module top (
        input clk,
        input rst,
        input [127:0] state,
        input [127:0] key,
        output [127:0] out) ;

    wire  AES_clk;
    wire [127:0] AES_state;
    wire [127:0] AES_key;
    wire [127:0] AES_out;
    assign AES_clk = clk;
    assign AES_state = state;
    assign AES_key = key;
    assign out = AES_out;

    reg[127:0] AES_s0 , AES_k0 ;
    wire[127:0] AES_s1 , AES_s2 , AES_s3 , AES_s4 , AES_s5 , AES_s6 , AES_s7 , AES_s8 , AES_s9 , AES_k1 , AES_k2 , AES_k3 , AES_k4 , AES_k5 , AES_k6 , AES_k7 , AES_k8 , AES_k9 , AES_k10 , AES_k0b , AES_k1b , AES_k2b , AES_k3b , AES_k4b , AES_k5b , AES_k6b , AES_k7b , AES_k8b , AES_k9b ;
    always @( posedge  AES_clk )
    begin
        AES_s0  <= AES_state ^ AES_key ;
        AES_k0  <= AES_key ;
    end


    wire  AES_a1_clk;
    wire [127:0] AES_a1_in;
    wire [127:0] AES_a1_out_1;
    wire [127:0] AES_a1_out_2;
    wire [7:0] AES_a1_rcon;
    assign AES_a1_clk = AES_clk;
    assign AES_a1_in = AES_k0;
    assign AES_k1 = AES_a1_out_1;
    assign AES_k0b = AES_a1_out_2;
    assign AES_a1_rcon = 8'h1;

    wire[31:0] AES_a1_k0 , AES_a1_k1 , AES_a1_k2 , AES_a1_k3 , AES_a1_v0 , AES_a1_v1 , AES_a1_v2 , AES_a1_v3 ;
    reg[31:0] AES_a1_k0a , AES_a1_k1a , AES_a1_k2a , AES_a1_k3a ;
    wire[31:0] AES_a1_k0b , AES_a1_k1b , AES_a1_k2b , AES_a1_k3b , AES_a1_k4a ;
    assign  AES_a1_k0 = AES_a1_in [127:96];
    assign  AES_a1_k1 = AES_a1_in [95:64];
    assign  AES_a1_k2 = AES_a1_in [63:32];
    assign  AES_a1_k3 = AES_a1_in [31:0];
    assign  AES_a1_v0 ={ AES_a1_k0 [31:24]^ AES_a1_rcon , AES_a1_k0 [23:0]};
    assign  AES_a1_v1 = AES_a1_v0 ^ AES_a1_k1 ;
    assign  AES_a1_v2 = AES_a1_v1 ^ AES_a1_k2 ;
    assign  AES_a1_v3 = AES_a1_v2 ^ AES_a1_k3 ;
    always @( posedge  AES_a1_clk )
    begin
        AES_a1_k0a  <= AES_a1_v0 ;
        AES_a1_k1a  <= AES_a1_v1 ;
        AES_a1_k2a  <= AES_a1_v2 ;
        AES_a1_k3a  <= AES_a1_v3 ;
    end


    wire  AES_a1_S4_0_clk;
    wire [31:0] AES_a1_S4_0_in;
    wire [31:0] AES_a1_S4_0_out;
    assign AES_a1_S4_0_clk = AES_a1_clk;
    assign AES_a1_S4_0_in = {AES_a1_k3[23:0],AES_a1_k3[31:24]};
    assign AES_a1_k4a = AES_a1_S4_0_out;

    wire[7:0] AES_a1_S4_0_k0 , AES_a1_S4_0_k1 , AES_a1_S4_0_k2 , AES_a1_S4_0_k3 ;

    wire  AES_a1_S4_0_S_0_clk;
    wire [7:0] AES_a1_S4_0_S_0_in;
    wire [7:0] AES_a1_S4_0_S_0_out;
    assign AES_a1_S4_0_S_0_clk = AES_a1_S4_0_clk;
    assign AES_a1_S4_0_S_0_in = AES_a1_S4_0_in[31:24];
    assign AES_a1_S4_0_k0 = AES_a1_S4_0_S_0_out;

    always @( posedge  AES_a1_S4_0_S_0_clk )
    case ( AES_a1_S4_0_S_0_in )
        8 'h00:
            AES_a1_S4_0_S_0_out  <=8'h63;
        8 'h01:
            AES_a1_S4_0_S_0_out  <=8'h7c;
        8 'h02:
            AES_a1_S4_0_S_0_out  <=8'h77;
        8 'h03:
            AES_a1_S4_0_S_0_out  <=8'h7b;
        8 'h04:
            AES_a1_S4_0_S_0_out  <=8'hf2;
        8 'h05:
            AES_a1_S4_0_S_0_out  <=8'h6b;
        8 'h06:
            AES_a1_S4_0_S_0_out  <=8'h6f;
        8 'h07:
            AES_a1_S4_0_S_0_out  <=8'hc5;
        8 'h08:
            AES_a1_S4_0_S_0_out  <=8'h30;
        8 'h09:
            AES_a1_S4_0_S_0_out  <=8'h01;
        8 'h0a:
            AES_a1_S4_0_S_0_out  <=8'h67;
        8 'h0b:
            AES_a1_S4_0_S_0_out  <=8'h2b;
        8 'h0c:
            AES_a1_S4_0_S_0_out  <=8'hfe;
        8 'h0d:
            AES_a1_S4_0_S_0_out  <=8'hd7;
        8 'h0e:
            AES_a1_S4_0_S_0_out  <=8'hab;
        8 'h0f:
            AES_a1_S4_0_S_0_out  <=8'h76;
        8 'h10:
            AES_a1_S4_0_S_0_out  <=8'hca;
        8 'h11:
            AES_a1_S4_0_S_0_out  <=8'h82;
        8 'h12:
            AES_a1_S4_0_S_0_out  <=8'hc9;
        8 'h13:
            AES_a1_S4_0_S_0_out  <=8'h7d;
        8 'h14:
            AES_a1_S4_0_S_0_out  <=8'hfa;
        8 'h15:
            AES_a1_S4_0_S_0_out  <=8'h59;
        8 'h16:
            AES_a1_S4_0_S_0_out  <=8'h47;
        8 'h17:
            AES_a1_S4_0_S_0_out  <=8'hf0;
        8 'h18:
            AES_a1_S4_0_S_0_out  <=8'had;
        8 'h19:
            AES_a1_S4_0_S_0_out  <=8'hd4;
        8 'h1a:
            AES_a1_S4_0_S_0_out  <=8'ha2;
        8 'h1b:
            AES_a1_S4_0_S_0_out  <=8'haf;
        8 'h1c:
            AES_a1_S4_0_S_0_out  <=8'h9c;
        8 'h1d:
            AES_a1_S4_0_S_0_out  <=8'ha4;
        8 'h1e:
            AES_a1_S4_0_S_0_out  <=8'h72;
        8 'h1f:
            AES_a1_S4_0_S_0_out  <=8'hc0;
        8 'h20:
            AES_a1_S4_0_S_0_out  <=8'hb7;
        8 'h21:
            AES_a1_S4_0_S_0_out  <=8'hfd;
        8 'h22:
            AES_a1_S4_0_S_0_out  <=8'h93;
        8 'h23:
            AES_a1_S4_0_S_0_out  <=8'h26;
        8 'h24:
            AES_a1_S4_0_S_0_out  <=8'h36;
        8 'h25:
            AES_a1_S4_0_S_0_out  <=8'h3f;
        8 'h26:
            AES_a1_S4_0_S_0_out  <=8'hf7;
        8 'h27:
            AES_a1_S4_0_S_0_out  <=8'hcc;
        8 'h28:
            AES_a1_S4_0_S_0_out  <=8'h34;
        8 'h29:
            AES_a1_S4_0_S_0_out  <=8'ha5;
        8 'h2a:
            AES_a1_S4_0_S_0_out  <=8'he5;
        8 'h2b:
            AES_a1_S4_0_S_0_out  <=8'hf1;
        8 'h2c:
            AES_a1_S4_0_S_0_out  <=8'h71;
        8 'h2d:
            AES_a1_S4_0_S_0_out  <=8'hd8;
        8 'h2e:
            AES_a1_S4_0_S_0_out  <=8'h31;
        8 'h2f:
            AES_a1_S4_0_S_0_out  <=8'h15;
        8 'h30:
            AES_a1_S4_0_S_0_out  <=8'h04;
        8 'h31:
            AES_a1_S4_0_S_0_out  <=8'hc7;
        8 'h32:
            AES_a1_S4_0_S_0_out  <=8'h23;
        8 'h33:
            AES_a1_S4_0_S_0_out  <=8'hc3;
        8 'h34:
            AES_a1_S4_0_S_0_out  <=8'h18;
        8 'h35:
            AES_a1_S4_0_S_0_out  <=8'h96;
        8 'h36:
            AES_a1_S4_0_S_0_out  <=8'h05;
        8 'h37:
            AES_a1_S4_0_S_0_out  <=8'h9a;
        8 'h38:
            AES_a1_S4_0_S_0_out  <=8'h07;
        8 'h39:
            AES_a1_S4_0_S_0_out  <=8'h12;
        8 'h3a:
            AES_a1_S4_0_S_0_out  <=8'h80;
        8 'h3b:
            AES_a1_S4_0_S_0_out  <=8'he2;
        8 'h3c:
            AES_a1_S4_0_S_0_out  <=8'heb;
        8 'h3d:
            AES_a1_S4_0_S_0_out  <=8'h27;
        8 'h3e:
            AES_a1_S4_0_S_0_out  <=8'hb2;
        8 'h3f:
            AES_a1_S4_0_S_0_out  <=8'h75;
        8 'h40:
            AES_a1_S4_0_S_0_out  <=8'h09;
        8 'h41:
            AES_a1_S4_0_S_0_out  <=8'h83;
        8 'h42:
            AES_a1_S4_0_S_0_out  <=8'h2c;
        8 'h43:
            AES_a1_S4_0_S_0_out  <=8'h1a;
        8 'h44:
            AES_a1_S4_0_S_0_out  <=8'h1b;
        8 'h45:
            AES_a1_S4_0_S_0_out  <=8'h6e;
        8 'h46:
            AES_a1_S4_0_S_0_out  <=8'h5a;
        8 'h47:
            AES_a1_S4_0_S_0_out  <=8'ha0;
        8 'h48:
            AES_a1_S4_0_S_0_out  <=8'h52;
        8 'h49:
            AES_a1_S4_0_S_0_out  <=8'h3b;
        8 'h4a:
            AES_a1_S4_0_S_0_out  <=8'hd6;
        8 'h4b:
            AES_a1_S4_0_S_0_out  <=8'hb3;
        8 'h4c:
            AES_a1_S4_0_S_0_out  <=8'h29;
        8 'h4d:
            AES_a1_S4_0_S_0_out  <=8'he3;
        8 'h4e:
            AES_a1_S4_0_S_0_out  <=8'h2f;
        8 'h4f:
            AES_a1_S4_0_S_0_out  <=8'h84;
        8 'h50:
            AES_a1_S4_0_S_0_out  <=8'h53;
        8 'h51:
            AES_a1_S4_0_S_0_out  <=8'hd1;
        8 'h52:
            AES_a1_S4_0_S_0_out  <=8'h00;
        8 'h53:
            AES_a1_S4_0_S_0_out  <=8'hed;
        8 'h54:
            AES_a1_S4_0_S_0_out  <=8'h20;
        8 'h55:
            AES_a1_S4_0_S_0_out  <=8'hfc;
        8 'h56:
            AES_a1_S4_0_S_0_out  <=8'hb1;
        8 'h57:
            AES_a1_S4_0_S_0_out  <=8'h5b;
        8 'h58:
            AES_a1_S4_0_S_0_out  <=8'h6a;
        8 'h59:
            AES_a1_S4_0_S_0_out  <=8'hcb;
        8 'h5a:
            AES_a1_S4_0_S_0_out  <=8'hbe;
        8 'h5b:
            AES_a1_S4_0_S_0_out  <=8'h39;
        8 'h5c:
            AES_a1_S4_0_S_0_out  <=8'h4a;
        8 'h5d:
            AES_a1_S4_0_S_0_out  <=8'h4c;
        8 'h5e:
            AES_a1_S4_0_S_0_out  <=8'h58;
        8 'h5f:
            AES_a1_S4_0_S_0_out  <=8'hcf;
        8 'h60:
            AES_a1_S4_0_S_0_out  <=8'hd0;
        8 'h61:
            AES_a1_S4_0_S_0_out  <=8'hef;
        8 'h62:
            AES_a1_S4_0_S_0_out  <=8'haa;
        8 'h63:
            AES_a1_S4_0_S_0_out  <=8'hfb;
        8 'h64:
            AES_a1_S4_0_S_0_out  <=8'h43;
        8 'h65:
            AES_a1_S4_0_S_0_out  <=8'h4d;
        8 'h66:
            AES_a1_S4_0_S_0_out  <=8'h33;
        8 'h67:
            AES_a1_S4_0_S_0_out  <=8'h85;
        8 'h68:
            AES_a1_S4_0_S_0_out  <=8'h45;
        8 'h69:
            AES_a1_S4_0_S_0_out  <=8'hf9;
        8 'h6a:
            AES_a1_S4_0_S_0_out  <=8'h02;
        8 'h6b:
            AES_a1_S4_0_S_0_out  <=8'h7f;
        8 'h6c:
            AES_a1_S4_0_S_0_out  <=8'h50;
        8 'h6d:
            AES_a1_S4_0_S_0_out  <=8'h3c;
        8 'h6e:
            AES_a1_S4_0_S_0_out  <=8'h9f;
        8 'h6f:
            AES_a1_S4_0_S_0_out  <=8'ha8;
        8 'h70:
            AES_a1_S4_0_S_0_out  <=8'h51;
        8 'h71:
            AES_a1_S4_0_S_0_out  <=8'ha3;
        8 'h72:
            AES_a1_S4_0_S_0_out  <=8'h40;
        8 'h73:
            AES_a1_S4_0_S_0_out  <=8'h8f;
        8 'h74:
            AES_a1_S4_0_S_0_out  <=8'h92;
        8 'h75:
            AES_a1_S4_0_S_0_out  <=8'h9d;
        8 'h76:
            AES_a1_S4_0_S_0_out  <=8'h38;
        8 'h77:
            AES_a1_S4_0_S_0_out  <=8'hf5;
        8 'h78:
            AES_a1_S4_0_S_0_out  <=8'hbc;
        8 'h79:
            AES_a1_S4_0_S_0_out  <=8'hb6;
        8 'h7a:
            AES_a1_S4_0_S_0_out  <=8'hda;
        8 'h7b:
            AES_a1_S4_0_S_0_out  <=8'h21;
        8 'h7c:
            AES_a1_S4_0_S_0_out  <=8'h10;
        8 'h7d:
            AES_a1_S4_0_S_0_out  <=8'hff;
        8 'h7e:
            AES_a1_S4_0_S_0_out  <=8'hf3;
        8 'h7f:
            AES_a1_S4_0_S_0_out  <=8'hd2;
        8 'h80:
            AES_a1_S4_0_S_0_out  <=8'hcd;
        8 'h81:
            AES_a1_S4_0_S_0_out  <=8'h0c;
        8 'h82:
            AES_a1_S4_0_S_0_out  <=8'h13;
        8 'h83:
            AES_a1_S4_0_S_0_out  <=8'hec;
        8 'h84:
            AES_a1_S4_0_S_0_out  <=8'h5f;
        8 'h85:
            AES_a1_S4_0_S_0_out  <=8'h97;
        8 'h86:
            AES_a1_S4_0_S_0_out  <=8'h44;
        8 'h87:
            AES_a1_S4_0_S_0_out  <=8'h17;
        8 'h88:
            AES_a1_S4_0_S_0_out  <=8'hc4;
        8 'h89:
            AES_a1_S4_0_S_0_out  <=8'ha7;
        8 'h8a:
            AES_a1_S4_0_S_0_out  <=8'h7e;
        8 'h8b:
            AES_a1_S4_0_S_0_out  <=8'h3d;
        8 'h8c:
            AES_a1_S4_0_S_0_out  <=8'h64;
        8 'h8d:
            AES_a1_S4_0_S_0_out  <=8'h5d;
        8 'h8e:
            AES_a1_S4_0_S_0_out  <=8'h19;
        8 'h8f:
            AES_a1_S4_0_S_0_out  <=8'h73;
        8 'h90:
            AES_a1_S4_0_S_0_out  <=8'h60;
        8 'h91:
            AES_a1_S4_0_S_0_out  <=8'h81;
        8 'h92:
            AES_a1_S4_0_S_0_out  <=8'h4f;
        8 'h93:
            AES_a1_S4_0_S_0_out  <=8'hdc;
        8 'h94:
            AES_a1_S4_0_S_0_out  <=8'h22;
        8 'h95:
            AES_a1_S4_0_S_0_out  <=8'h2a;
        8 'h96:
            AES_a1_S4_0_S_0_out  <=8'h90;
        8 'h97:
            AES_a1_S4_0_S_0_out  <=8'h88;
        8 'h98:
            AES_a1_S4_0_S_0_out  <=8'h46;
        8 'h99:
            AES_a1_S4_0_S_0_out  <=8'hee;
        8 'h9a:
            AES_a1_S4_0_S_0_out  <=8'hb8;
        8 'h9b:
            AES_a1_S4_0_S_0_out  <=8'h14;
        8 'h9c:
            AES_a1_S4_0_S_0_out  <=8'hde;
        8 'h9d:
            AES_a1_S4_0_S_0_out  <=8'h5e;
        8 'h9e:
            AES_a1_S4_0_S_0_out  <=8'h0b;
        8 'h9f:
            AES_a1_S4_0_S_0_out  <=8'hdb;
        8 'ha0:
            AES_a1_S4_0_S_0_out  <=8'he0;
        8 'ha1:
            AES_a1_S4_0_S_0_out  <=8'h32;
        8 'ha2:
            AES_a1_S4_0_S_0_out  <=8'h3a;
        8 'ha3:
            AES_a1_S4_0_S_0_out  <=8'h0a;
        8 'ha4:
            AES_a1_S4_0_S_0_out  <=8'h49;
        8 'ha5:
            AES_a1_S4_0_S_0_out  <=8'h06;
        8 'ha6:
            AES_a1_S4_0_S_0_out  <=8'h24;
        8 'ha7:
            AES_a1_S4_0_S_0_out  <=8'h5c;
        8 'ha8:
            AES_a1_S4_0_S_0_out  <=8'hc2;
        8 'ha9:
            AES_a1_S4_0_S_0_out  <=8'hd3;
        8 'haa:
            AES_a1_S4_0_S_0_out  <=8'hac;
        8 'hab:
            AES_a1_S4_0_S_0_out  <=8'h62;
        8 'hac:
            AES_a1_S4_0_S_0_out  <=8'h91;
        8 'had:
            AES_a1_S4_0_S_0_out  <=8'h95;
        8 'hae:
            AES_a1_S4_0_S_0_out  <=8'he4;
        8 'haf:
            AES_a1_S4_0_S_0_out  <=8'h79;
        8 'hb0:
            AES_a1_S4_0_S_0_out  <=8'he7;
        8 'hb1:
            AES_a1_S4_0_S_0_out  <=8'hc8;
        8 'hb2:
            AES_a1_S4_0_S_0_out  <=8'h37;
        8 'hb3:
            AES_a1_S4_0_S_0_out  <=8'h6d;
        8 'hb4:
            AES_a1_S4_0_S_0_out  <=8'h8d;
        8 'hb5:
            AES_a1_S4_0_S_0_out  <=8'hd5;
        8 'hb6:
            AES_a1_S4_0_S_0_out  <=8'h4e;
        8 'hb7:
            AES_a1_S4_0_S_0_out  <=8'ha9;
        8 'hb8:
            AES_a1_S4_0_S_0_out  <=8'h6c;
        8 'hb9:
            AES_a1_S4_0_S_0_out  <=8'h56;
        8 'hba:
            AES_a1_S4_0_S_0_out  <=8'hf4;
        8 'hbb:
            AES_a1_S4_0_S_0_out  <=8'hea;
        8 'hbc:
            AES_a1_S4_0_S_0_out  <=8'h65;
        8 'hbd:
            AES_a1_S4_0_S_0_out  <=8'h7a;
        8 'hbe:
            AES_a1_S4_0_S_0_out  <=8'hae;
        8 'hbf:
            AES_a1_S4_0_S_0_out  <=8'h08;
        8 'hc0:
            AES_a1_S4_0_S_0_out  <=8'hba;
        8 'hc1:
            AES_a1_S4_0_S_0_out  <=8'h78;
        8 'hc2:
            AES_a1_S4_0_S_0_out  <=8'h25;
        8 'hc3:
            AES_a1_S4_0_S_0_out  <=8'h2e;
        8 'hc4:
            AES_a1_S4_0_S_0_out  <=8'h1c;
        8 'hc5:
            AES_a1_S4_0_S_0_out  <=8'ha6;
        8 'hc6:
            AES_a1_S4_0_S_0_out  <=8'hb4;
        8 'hc7:
            AES_a1_S4_0_S_0_out  <=8'hc6;
        8 'hc8:
            AES_a1_S4_0_S_0_out  <=8'he8;
        8 'hc9:
            AES_a1_S4_0_S_0_out  <=8'hdd;
        8 'hca:
            AES_a1_S4_0_S_0_out  <=8'h74;
        8 'hcb:
            AES_a1_S4_0_S_0_out  <=8'h1f;
        8 'hcc:
            AES_a1_S4_0_S_0_out  <=8'h4b;
        8 'hcd:
            AES_a1_S4_0_S_0_out  <=8'hbd;
        8 'hce:
            AES_a1_S4_0_S_0_out  <=8'h8b;
        8 'hcf:
            AES_a1_S4_0_S_0_out  <=8'h8a;
        8 'hd0:
            AES_a1_S4_0_S_0_out  <=8'h70;
        8 'hd1:
            AES_a1_S4_0_S_0_out  <=8'h3e;
        8 'hd2:
            AES_a1_S4_0_S_0_out  <=8'hb5;
        8 'hd3:
            AES_a1_S4_0_S_0_out  <=8'h66;
        8 'hd4:
            AES_a1_S4_0_S_0_out  <=8'h48;
        8 'hd5:
            AES_a1_S4_0_S_0_out  <=8'h03;
        8 'hd6:
            AES_a1_S4_0_S_0_out  <=8'hf6;
        8 'hd7:
            AES_a1_S4_0_S_0_out  <=8'h0e;
        8 'hd8:
            AES_a1_S4_0_S_0_out  <=8'h61;
        8 'hd9:
            AES_a1_S4_0_S_0_out  <=8'h35;
        8 'hda:
            AES_a1_S4_0_S_0_out  <=8'h57;
        8 'hdb:
            AES_a1_S4_0_S_0_out  <=8'hb9;
        8 'hdc:
            AES_a1_S4_0_S_0_out  <=8'h86;
        8 'hdd:
            AES_a1_S4_0_S_0_out  <=8'hc1;
        8 'hde:
            AES_a1_S4_0_S_0_out  <=8'h1d;
        8 'hdf:
            AES_a1_S4_0_S_0_out  <=8'h9e;
        8 'he0:
            AES_a1_S4_0_S_0_out  <=8'he1;
        8 'he1:
            AES_a1_S4_0_S_0_out  <=8'hf8;
        8 'he2:
            AES_a1_S4_0_S_0_out  <=8'h98;
        8 'he3:
            AES_a1_S4_0_S_0_out  <=8'h11;
        8 'he4:
            AES_a1_S4_0_S_0_out  <=8'h69;
        8 'he5:
            AES_a1_S4_0_S_0_out  <=8'hd9;
        8 'he6:
            AES_a1_S4_0_S_0_out  <=8'h8e;
        8 'he7:
            AES_a1_S4_0_S_0_out  <=8'h94;
        8 'he8:
            AES_a1_S4_0_S_0_out  <=8'h9b;
        8 'he9:
            AES_a1_S4_0_S_0_out  <=8'h1e;
        8 'hea:
            AES_a1_S4_0_S_0_out  <=8'h87;
        8 'heb:
            AES_a1_S4_0_S_0_out  <=8'he9;
        8 'hec:
            AES_a1_S4_0_S_0_out  <=8'hce;
        8 'hed:
            AES_a1_S4_0_S_0_out  <=8'h55;
        8 'hee:
            AES_a1_S4_0_S_0_out  <=8'h28;
        8 'hef:
            AES_a1_S4_0_S_0_out  <=8'hdf;
        8 'hf0:
            AES_a1_S4_0_S_0_out  <=8'h8c;
        8 'hf1:
            AES_a1_S4_0_S_0_out  <=8'ha1;
        8 'hf2:
            AES_a1_S4_0_S_0_out  <=8'h89;
        8 'hf3:
            AES_a1_S4_0_S_0_out  <=8'h0d;
        8 'hf4:
            AES_a1_S4_0_S_0_out  <=8'hbf;
        8 'hf5:
            AES_a1_S4_0_S_0_out  <=8'he6;
        8 'hf6:
            AES_a1_S4_0_S_0_out  <=8'h42;
        8 'hf7:
            AES_a1_S4_0_S_0_out  <=8'h68;
        8 'hf8:
            AES_a1_S4_0_S_0_out  <=8'h41;
        8 'hf9:
            AES_a1_S4_0_S_0_out  <=8'h99;
        8 'hfa:
            AES_a1_S4_0_S_0_out  <=8'h2d;
        8 'hfb:
            AES_a1_S4_0_S_0_out  <=8'h0f;
        8 'hfc:
            AES_a1_S4_0_S_0_out  <=8'hb0;
        8 'hfd:
            AES_a1_S4_0_S_0_out  <=8'h54;
        8 'hfe:
            AES_a1_S4_0_S_0_out  <=8'hbb;
        8 'hff:
            AES_a1_S4_0_S_0_out  <=8'h16;
    endcase


    assign  AES_a1_S4_0_out ={ AES_a1_S4_0_k0 , AES_a1_S4_0_k1 , AES_a1_S4_0_k2 , AES_a1_S4_0_k3 };

    assign  AES_a1_k0b = AES_a1_k0a ^ AES_a1_k4a ;
    assign  AES_a1_k1b = AES_a1_k1a ^ AES_a1_k4a ;
    assign  AES_a1_k2b = AES_a1_k2a ^ AES_a1_k4a ;
    assign  AES_a1_k3b = AES_a1_k3a ^ AES_a1_k4a ;
    always @( posedge  AES_a1_clk )
        AES_a1_out_1  <={ AES_a1_k0b , AES_a1_k1b , AES_a1_k2b , AES_a1_k3b };

    assign  AES_a1_out_2 ={ AES_a1_k0b , AES_a1_k1b , AES_a1_k2b , AES_a1_k3b };


    wire  AES_r1_clk;
    wire [127:0] AES_r1_state_in;
    wire [127:0] AES_r1_key;
    wire [127:0] AES_r1_state_out;
    assign AES_r1_clk = AES_clk;
    assign AES_r1_state_in = AES_s0;
    assign AES_r1_key = AES_k0b;
    assign AES_s1 = AES_r1_state_out;

    wire[31:0] AES_r1_s0 , AES_r1_s1 , AES_r1_s2 , AES_r1_s3 , AES_r1_z0 , AES_r1_z1 , AES_r1_z2 , AES_r1_z3 , AES_r1_p00 , AES_r1_p01 , AES_r1_p02 , AES_r1_p03 , AES_r1_p10 , AES_r1_p11 , AES_r1_p12 , AES_r1_p13 , AES_r1_p20 , AES_r1_p21 , AES_r1_p22 , AES_r1_p23 , AES_r1_p30 , AES_r1_p31 , AES_r1_p32 , AES_r1_p33 , AES_r1_k0 , AES_r1_k1 , AES_r1_k2 , AES_r1_k3 ;
    assign  AES_r1_k0 = AES_r1_key [127:96];
    assign  AES_r1_k1 = AES_r1_key [95:64];
    assign  AES_r1_k2 = AES_r1_key [63:32];
    assign  AES_r1_k3 = AES_r1_key [31:0];
    assign  AES_r1_s0 = AES_r1_state_in [127:96];
    assign  AES_r1_s1 = AES_r1_state_in [95:64];
    assign  AES_r1_s2 = AES_r1_state_in [63:32];
    assign  AES_r1_s3 = AES_r1_state_in [31:0];

    wire  AES_r1_t0_clk;
    wire [31:0] AES_r1_t0_state;
    wire [31:0] AES_r1_t0_p0;
    wire [31:0] AES_r1_t0_p1;
    wire [31:0] AES_r1_t0_p2;
    wire [31:0] AES_r1_t0_p3;
    assign AES_r1_t0_clk = AES_r1_clk;
    assign AES_r1_t0_state = AES_r1_s0;
    assign AES_r1_p00 = AES_r1_t0_p0;
    assign AES_r1_p01 = AES_r1_t0_p1;
    assign AES_r1_p02 = AES_r1_t0_p2;
    assign AES_r1_p03 = AES_r1_t0_p3;

    wire[7:0] AES_r1_t0_b0 , AES_r1_t0_b1 , AES_r1_t0_b2 , AES_r1_t0_b3 ;
    wire[31:0] AES_r1_t0_k0 , AES_r1_t0_k1 , AES_r1_t0_k2 ;
    assign  AES_r1_t0_p0 ={ AES_r1_t0_k0 [7:0], AES_r1_t0_k0 [31:8]};
    assign  AES_r1_t0_p1 ={ AES_r1_t0_k1 [15:0], AES_r1_t0_k1 [31:16]};
    assign  AES_r1_t0_p2 ={ AES_r1_t0_k2 [23:0], AES_r1_t0_k2 [31:24]};
    assign  AES_r1_t0_b0 = AES_r1_t0_state [31:24];
    assign  AES_r1_t0_b1 = AES_r1_t0_state [23:16];
    assign  AES_r1_t0_b2 = AES_r1_t0_state [15:8];
    assign  AES_r1_t0_b3 = AES_r1_t0_state [7:0];

    wire  AES_r1_t0_t0_clk;
    wire [7:0] AES_r1_t0_t0_in;
    wire [31:0] AES_r1_t0_t0_out;
    assign AES_r1_t0_t0_clk = AES_r1_t0_clk;
    assign AES_r1_t0_t0_in = AES_r1_t0_b0;
    assign AES_r1_t0_k0 = AES_r1_t0_t0_out;

    wire[7:0] AES_r1_t0_t0_k0 , AES_r1_t0_t0_k1 ;

    wire  AES_r1_t0_t0_s0_clk;
    wire [7:0] AES_r1_t0_t0_s0_in;
    wire [7:0] AES_r1_t0_t0_s0_out;
    assign AES_r1_t0_t0_s0_clk = AES_r1_t0_t0_clk;
    assign AES_r1_t0_t0_s0_in = AES_r1_t0_t0_in;
    assign AES_r1_t0_t0_k0 = AES_r1_t0_t0_s0_out;

    always @( posedge  AES_r1_t0_t0_s0_clk )
    case ( AES_r1_t0_t0_s0_in )
        8 'h00:
            AES_r1_t0_t0_s0_out  <=8'h63;
        8 'h01:
            AES_r1_t0_t0_s0_out  <=8'h7c;
        8 'h02:
            AES_r1_t0_t0_s0_out  <=8'h77;
        8 'h03:
            AES_r1_t0_t0_s0_out  <=8'h7b;
        8 'h04:
            AES_r1_t0_t0_s0_out  <=8'hf2;
        8 'h05:
            AES_r1_t0_t0_s0_out  <=8'h6b;
        8 'h06:
            AES_r1_t0_t0_s0_out  <=8'h6f;
        8 'h07:
            AES_r1_t0_t0_s0_out  <=8'hc5;
        8 'h08:
            AES_r1_t0_t0_s0_out  <=8'h30;
        8 'h09:
            AES_r1_t0_t0_s0_out  <=8'h01;
        8 'h0a:
            AES_r1_t0_t0_s0_out  <=8'h67;
        8 'h0b:
            AES_r1_t0_t0_s0_out  <=8'h2b;
        8 'h0c:
            AES_r1_t0_t0_s0_out  <=8'hfe;
        8 'h0d:
            AES_r1_t0_t0_s0_out  <=8'hd7;
        8 'h0e:
            AES_r1_t0_t0_s0_out  <=8'hab;
        8 'h0f:
            AES_r1_t0_t0_s0_out  <=8'h76;
        8 'h10:
            AES_r1_t0_t0_s0_out  <=8'hca;
        8 'h11:
            AES_r1_t0_t0_s0_out  <=8'h82;
        8 'h12:
            AES_r1_t0_t0_s0_out  <=8'hc9;
        8 'h13:
            AES_r1_t0_t0_s0_out  <=8'h7d;
        8 'h14:
            AES_r1_t0_t0_s0_out  <=8'hfa;
        8 'h15:
            AES_r1_t0_t0_s0_out  <=8'h59;
        8 'h16:
            AES_r1_t0_t0_s0_out  <=8'h47;
        8 'h17:
            AES_r1_t0_t0_s0_out  <=8'hf0;
        8 'h18:
            AES_r1_t0_t0_s0_out  <=8'had;
        8 'h19:
            AES_r1_t0_t0_s0_out  <=8'hd4;
        8 'h1a:
            AES_r1_t0_t0_s0_out  <=8'ha2;
        8 'h1b:
            AES_r1_t0_t0_s0_out  <=8'haf;
        8 'h1c:
            AES_r1_t0_t0_s0_out  <=8'h9c;
        8 'h1d:
            AES_r1_t0_t0_s0_out  <=8'ha4;
        8 'h1e:
            AES_r1_t0_t0_s0_out  <=8'h72;
        8 'h1f:
            AES_r1_t0_t0_s0_out  <=8'hc0;
        8 'h20:
            AES_r1_t0_t0_s0_out  <=8'hb7;
        8 'h21:
            AES_r1_t0_t0_s0_out  <=8'hfd;
        8 'h22:
            AES_r1_t0_t0_s0_out  <=8'h93;
        8 'h23:
            AES_r1_t0_t0_s0_out  <=8'h26;
        8 'h24:
            AES_r1_t0_t0_s0_out  <=8'h36;
        8 'h25:
            AES_r1_t0_t0_s0_out  <=8'h3f;
        8 'h26:
            AES_r1_t0_t0_s0_out  <=8'hf7;
        8 'h27:
            AES_r1_t0_t0_s0_out  <=8'hcc;
        8 'h28:
            AES_r1_t0_t0_s0_out  <=8'h34;
        8 'h29:
            AES_r1_t0_t0_s0_out  <=8'ha5;
        8 'h2a:
            AES_r1_t0_t0_s0_out  <=8'he5;
        8 'h2b:
            AES_r1_t0_t0_s0_out  <=8'hf1;
        8 'h2c:
            AES_r1_t0_t0_s0_out  <=8'h71;
        8 'h2d:
            AES_r1_t0_t0_s0_out  <=8'hd8;
        8 'h2e:
            AES_r1_t0_t0_s0_out  <=8'h31;
        8 'h2f:
            AES_r1_t0_t0_s0_out  <=8'h15;
        8 'h30:
            AES_r1_t0_t0_s0_out  <=8'h04;
        8 'h31:
            AES_r1_t0_t0_s0_out  <=8'hc7;
        8 'h32:
            AES_r1_t0_t0_s0_out  <=8'h23;
        8 'h33:
            AES_r1_t0_t0_s0_out  <=8'hc3;
        8 'h34:
            AES_r1_t0_t0_s0_out  <=8'h18;
        8 'h35:
            AES_r1_t0_t0_s0_out  <=8'h96;
        8 'h36:
            AES_r1_t0_t0_s0_out  <=8'h05;
        8 'h37:
            AES_r1_t0_t0_s0_out  <=8'h9a;
        8 'h38:
            AES_r1_t0_t0_s0_out  <=8'h07;
        8 'h39:
            AES_r1_t0_t0_s0_out  <=8'h12;
        8 'h3a:
            AES_r1_t0_t0_s0_out  <=8'h80;
        8 'h3b:
            AES_r1_t0_t0_s0_out  <=8'he2;
        8 'h3c:
            AES_r1_t0_t0_s0_out  <=8'heb;
        8 'h3d:
            AES_r1_t0_t0_s0_out  <=8'h27;
        8 'h3e:
            AES_r1_t0_t0_s0_out  <=8'hb2;
        8 'h3f:
            AES_r1_t0_t0_s0_out  <=8'h75;
        8 'h40:
            AES_r1_t0_t0_s0_out  <=8'h09;
        8 'h41:
            AES_r1_t0_t0_s0_out  <=8'h83;
        8 'h42:
            AES_r1_t0_t0_s0_out  <=8'h2c;
        8 'h43:
            AES_r1_t0_t0_s0_out  <=8'h1a;
        8 'h44:
            AES_r1_t0_t0_s0_out  <=8'h1b;
        8 'h45:
            AES_r1_t0_t0_s0_out  <=8'h6e;
        8 'h46:
            AES_r1_t0_t0_s0_out  <=8'h5a;
        8 'h47:
            AES_r1_t0_t0_s0_out  <=8'ha0;
        8 'h48:
            AES_r1_t0_t0_s0_out  <=8'h52;
        8 'h49:
            AES_r1_t0_t0_s0_out  <=8'h3b;
        8 'h4a:
            AES_r1_t0_t0_s0_out  <=8'hd6;
        8 'h4b:
            AES_r1_t0_t0_s0_out  <=8'hb3;
        8 'h4c:
            AES_r1_t0_t0_s0_out  <=8'h29;
        8 'h4d:
            AES_r1_t0_t0_s0_out  <=8'he3;
        8 'h4e:
            AES_r1_t0_t0_s0_out  <=8'h2f;
        8 'h4f:
            AES_r1_t0_t0_s0_out  <=8'h84;
        8 'h50:
            AES_r1_t0_t0_s0_out  <=8'h53;
        8 'h51:
            AES_r1_t0_t0_s0_out  <=8'hd1;
        8 'h52:
            AES_r1_t0_t0_s0_out  <=8'h00;
        8 'h53:
            AES_r1_t0_t0_s0_out  <=8'hed;
        8 'h54:
            AES_r1_t0_t0_s0_out  <=8'h20;
        8 'h55:
            AES_r1_t0_t0_s0_out  <=8'hfc;
        8 'h56:
            AES_r1_t0_t0_s0_out  <=8'hb1;
        8 'h57:
            AES_r1_t0_t0_s0_out  <=8'h5b;
        8 'h58:
            AES_r1_t0_t0_s0_out  <=8'h6a;
        8 'h59:
            AES_r1_t0_t0_s0_out  <=8'hcb;
        8 'h5a:
            AES_r1_t0_t0_s0_out  <=8'hbe;
        8 'h5b:
            AES_r1_t0_t0_s0_out  <=8'h39;
        8 'h5c:
            AES_r1_t0_t0_s0_out  <=8'h4a;
        8 'h5d:
            AES_r1_t0_t0_s0_out  <=8'h4c;
        8 'h5e:
            AES_r1_t0_t0_s0_out  <=8'h58;
        8 'h5f:
            AES_r1_t0_t0_s0_out  <=8'hcf;
        8 'h60:
            AES_r1_t0_t0_s0_out  <=8'hd0;
        8 'h61:
            AES_r1_t0_t0_s0_out  <=8'hef;
        8 'h62:
            AES_r1_t0_t0_s0_out  <=8'haa;
        8 'h63:
            AES_r1_t0_t0_s0_out  <=8'hfb;
        8 'h64:
            AES_r1_t0_t0_s0_out  <=8'h43;
        8 'h65:
            AES_r1_t0_t0_s0_out  <=8'h4d;
        8 'h66:
            AES_r1_t0_t0_s0_out  <=8'h33;
        8 'h67:
            AES_r1_t0_t0_s0_out  <=8'h85;
        8 'h68:
            AES_r1_t0_t0_s0_out  <=8'h45;
        8 'h69:
            AES_r1_t0_t0_s0_out  <=8'hf9;
        8 'h6a:
            AES_r1_t0_t0_s0_out  <=8'h02;
        8 'h6b:
            AES_r1_t0_t0_s0_out  <=8'h7f;
        8 'h6c:
            AES_r1_t0_t0_s0_out  <=8'h50;
        8 'h6d:
            AES_r1_t0_t0_s0_out  <=8'h3c;
        8 'h6e:
            AES_r1_t0_t0_s0_out  <=8'h9f;
        8 'h6f:
            AES_r1_t0_t0_s0_out  <=8'ha8;
        8 'h70:
            AES_r1_t0_t0_s0_out  <=8'h51;
        8 'h71:
            AES_r1_t0_t0_s0_out  <=8'ha3;
        8 'h72:
            AES_r1_t0_t0_s0_out  <=8'h40;
        8 'h73:
            AES_r1_t0_t0_s0_out  <=8'h8f;
        8 'h74:
            AES_r1_t0_t0_s0_out  <=8'h92;
        8 'h75:
            AES_r1_t0_t0_s0_out  <=8'h9d;
        8 'h76:
            AES_r1_t0_t0_s0_out  <=8'h38;
        8 'h77:
            AES_r1_t0_t0_s0_out  <=8'hf5;
        8 'h78:
            AES_r1_t0_t0_s0_out  <=8'hbc;
        8 'h79:
            AES_r1_t0_t0_s0_out  <=8'hb6;
        8 'h7a:
            AES_r1_t0_t0_s0_out  <=8'hda;
        8 'h7b:
            AES_r1_t0_t0_s0_out  <=8'h21;
        8 'h7c:
            AES_r1_t0_t0_s0_out  <=8'h10;
        8 'h7d:
            AES_r1_t0_t0_s0_out  <=8'hff;
        8 'h7e:
            AES_r1_t0_t0_s0_out  <=8'hf3;
        8 'h7f:
            AES_r1_t0_t0_s0_out  <=8'hd2;
        8 'h80:
            AES_r1_t0_t0_s0_out  <=8'hcd;
        8 'h81:
            AES_r1_t0_t0_s0_out  <=8'h0c;
        8 'h82:
            AES_r1_t0_t0_s0_out  <=8'h13;
        8 'h83:
            AES_r1_t0_t0_s0_out  <=8'hec;
        8 'h84:
            AES_r1_t0_t0_s0_out  <=8'h5f;
        8 'h85:
            AES_r1_t0_t0_s0_out  <=8'h97;
        8 'h86:
            AES_r1_t0_t0_s0_out  <=8'h44;
        8 'h87:
            AES_r1_t0_t0_s0_out  <=8'h17;
        8 'h88:
            AES_r1_t0_t0_s0_out  <=8'hc4;
        8 'h89:
            AES_r1_t0_t0_s0_out  <=8'ha7;
        8 'h8a:
            AES_r1_t0_t0_s0_out  <=8'h7e;
        8 'h8b:
            AES_r1_t0_t0_s0_out  <=8'h3d;
        8 'h8c:
            AES_r1_t0_t0_s0_out  <=8'h64;
        8 'h8d:
            AES_r1_t0_t0_s0_out  <=8'h5d;
        8 'h8e:
            AES_r1_t0_t0_s0_out  <=8'h19;
        8 'h8f:
            AES_r1_t0_t0_s0_out  <=8'h73;
        8 'h90:
            AES_r1_t0_t0_s0_out  <=8'h60;
        8 'h91:
            AES_r1_t0_t0_s0_out  <=8'h81;
        8 'h92:
            AES_r1_t0_t0_s0_out  <=8'h4f;
        8 'h93:
            AES_r1_t0_t0_s0_out  <=8'hdc;
        8 'h94:
            AES_r1_t0_t0_s0_out  <=8'h22;
        8 'h95:
            AES_r1_t0_t0_s0_out  <=8'h2a;
        8 'h96:
            AES_r1_t0_t0_s0_out  <=8'h90;
        8 'h97:
            AES_r1_t0_t0_s0_out  <=8'h88;
        8 'h98:
            AES_r1_t0_t0_s0_out  <=8'h46;
        8 'h99:
            AES_r1_t0_t0_s0_out  <=8'hee;
        8 'h9a:
            AES_r1_t0_t0_s0_out  <=8'hb8;
        8 'h9b:
            AES_r1_t0_t0_s0_out  <=8'h14;
        8 'h9c:
            AES_r1_t0_t0_s0_out  <=8'hde;
        8 'h9d:
            AES_r1_t0_t0_s0_out  <=8'h5e;
        8 'h9e:
            AES_r1_t0_t0_s0_out  <=8'h0b;
        8 'h9f:
            AES_r1_t0_t0_s0_out  <=8'hdb;
        8 'ha0:
            AES_r1_t0_t0_s0_out  <=8'he0;
        8 'ha1:
            AES_r1_t0_t0_s0_out  <=8'h32;
        8 'ha2:
            AES_r1_t0_t0_s0_out  <=8'h3a;
        8 'ha3:
            AES_r1_t0_t0_s0_out  <=8'h0a;
        8 'ha4:
            AES_r1_t0_t0_s0_out  <=8'h49;
        8 'ha5:
            AES_r1_t0_t0_s0_out  <=8'h06;
        8 'ha6:
            AES_r1_t0_t0_s0_out  <=8'h24;
        8 'ha7:
            AES_r1_t0_t0_s0_out  <=8'h5c;
        8 'ha8:
            AES_r1_t0_t0_s0_out  <=8'hc2;
        8 'ha9:
            AES_r1_t0_t0_s0_out  <=8'hd3;
        8 'haa:
            AES_r1_t0_t0_s0_out  <=8'hac;
        8 'hab:
            AES_r1_t0_t0_s0_out  <=8'h62;
        8 'hac:
            AES_r1_t0_t0_s0_out  <=8'h91;
        8 'had:
            AES_r1_t0_t0_s0_out  <=8'h95;
        8 'hae:
            AES_r1_t0_t0_s0_out  <=8'he4;
        8 'haf:
            AES_r1_t0_t0_s0_out  <=8'h79;
        8 'hb0:
            AES_r1_t0_t0_s0_out  <=8'he7;
        8 'hb1:
            AES_r1_t0_t0_s0_out  <=8'hc8;
        8 'hb2:
            AES_r1_t0_t0_s0_out  <=8'h37;
        8 'hb3:
            AES_r1_t0_t0_s0_out  <=8'h6d;
        8 'hb4:
            AES_r1_t0_t0_s0_out  <=8'h8d;
        8 'hb5:
            AES_r1_t0_t0_s0_out  <=8'hd5;
        8 'hb6:
            AES_r1_t0_t0_s0_out  <=8'h4e;
        8 'hb7:
            AES_r1_t0_t0_s0_out  <=8'ha9;
        8 'hb8:
            AES_r1_t0_t0_s0_out  <=8'h6c;
        8 'hb9:
            AES_r1_t0_t0_s0_out  <=8'h56;
        8 'hba:
            AES_r1_t0_t0_s0_out  <=8'hf4;
        8 'hbb:
            AES_r1_t0_t0_s0_out  <=8'hea;
        8 'hbc:
            AES_r1_t0_t0_s0_out  <=8'h65;
        8 'hbd:
            AES_r1_t0_t0_s0_out  <=8'h7a;
        8 'hbe:
            AES_r1_t0_t0_s0_out  <=8'hae;
        8 'hbf:
            AES_r1_t0_t0_s0_out  <=8'h08;
        8 'hc0:
            AES_r1_t0_t0_s0_out  <=8'hba;
        8 'hc1:
            AES_r1_t0_t0_s0_out  <=8'h78;
        8 'hc2:
            AES_r1_t0_t0_s0_out  <=8'h25;
        8 'hc3:
            AES_r1_t0_t0_s0_out  <=8'h2e;
        8 'hc4:
            AES_r1_t0_t0_s0_out  <=8'h1c;
        8 'hc5:
            AES_r1_t0_t0_s0_out  <=8'ha6;
        8 'hc6:
            AES_r1_t0_t0_s0_out  <=8'hb4;
        8 'hc7:
            AES_r1_t0_t0_s0_out  <=8'hc6;
        8 'hc8:
            AES_r1_t0_t0_s0_out  <=8'he8;
        8 'hc9:
            AES_r1_t0_t0_s0_out  <=8'hdd;
        8 'hca:
            AES_r1_t0_t0_s0_out  <=8'h74;
        8 'hcb:
            AES_r1_t0_t0_s0_out  <=8'h1f;
        8 'hcc:
            AES_r1_t0_t0_s0_out  <=8'h4b;
        8 'hcd:
            AES_r1_t0_t0_s0_out  <=8'hbd;
        8 'hce:
            AES_r1_t0_t0_s0_out  <=8'h8b;
        8 'hcf:
            AES_r1_t0_t0_s0_out  <=8'h8a;
        8 'hd0:
            AES_r1_t0_t0_s0_out  <=8'h70;
        8 'hd1:
            AES_r1_t0_t0_s0_out  <=8'h3e;
        8 'hd2:
            AES_r1_t0_t0_s0_out  <=8'hb5;
        8 'hd3:
            AES_r1_t0_t0_s0_out  <=8'h66;
        8 'hd4:
            AES_r1_t0_t0_s0_out  <=8'h48;
        8 'hd5:
            AES_r1_t0_t0_s0_out  <=8'h03;
        8 'hd6:
            AES_r1_t0_t0_s0_out  <=8'hf6;
        8 'hd7:
            AES_r1_t0_t0_s0_out  <=8'h0e;
        8 'hd8:
            AES_r1_t0_t0_s0_out  <=8'h61;
        8 'hd9:
            AES_r1_t0_t0_s0_out  <=8'h35;
        8 'hda:
            AES_r1_t0_t0_s0_out  <=8'h57;
        8 'hdb:
            AES_r1_t0_t0_s0_out  <=8'hb9;
        8 'hdc:
            AES_r1_t0_t0_s0_out  <=8'h86;
        8 'hdd:
            AES_r1_t0_t0_s0_out  <=8'hc1;
        8 'hde:
            AES_r1_t0_t0_s0_out  <=8'h1d;
        8 'hdf:
            AES_r1_t0_t0_s0_out  <=8'h9e;
        8 'he0:
            AES_r1_t0_t0_s0_out  <=8'he1;
        8 'he1:
            AES_r1_t0_t0_s0_out  <=8'hf8;
        8 'he2:
            AES_r1_t0_t0_s0_out  <=8'h98;
        8 'he3:
            AES_r1_t0_t0_s0_out  <=8'h11;
        8 'he4:
            AES_r1_t0_t0_s0_out  <=8'h69;
        8 'he5:
            AES_r1_t0_t0_s0_out  <=8'hd9;
        8 'he6:
            AES_r1_t0_t0_s0_out  <=8'h8e;
        8 'he7:
            AES_r1_t0_t0_s0_out  <=8'h94;
        8 'he8:
            AES_r1_t0_t0_s0_out  <=8'h9b;
        8 'he9:
            AES_r1_t0_t0_s0_out  <=8'h1e;
        8 'hea:
            AES_r1_t0_t0_s0_out  <=8'h87;
        8 'heb:
            AES_r1_t0_t0_s0_out  <=8'he9;
        8 'hec:
            AES_r1_t0_t0_s0_out  <=8'hce;
        8 'hed:
            AES_r1_t0_t0_s0_out  <=8'h55;
        8 'hee:
            AES_r1_t0_t0_s0_out  <=8'h28;
        8 'hef:
            AES_r1_t0_t0_s0_out  <=8'hdf;
        8 'hf0:
            AES_r1_t0_t0_s0_out  <=8'h8c;
        8 'hf1:
            AES_r1_t0_t0_s0_out  <=8'ha1;
        8 'hf2:
            AES_r1_t0_t0_s0_out  <=8'h89;
        8 'hf3:
            AES_r1_t0_t0_s0_out  <=8'h0d;
        8 'hf4:
            AES_r1_t0_t0_s0_out  <=8'hbf;
        8 'hf5:
            AES_r1_t0_t0_s0_out  <=8'he6;
        8 'hf6:
            AES_r1_t0_t0_s0_out  <=8'h42;
        8 'hf7:
            AES_r1_t0_t0_s0_out  <=8'h68;
        8 'hf8:
            AES_r1_t0_t0_s0_out  <=8'h41;
        8 'hf9:
            AES_r1_t0_t0_s0_out  <=8'h99;
        8 'hfa:
            AES_r1_t0_t0_s0_out  <=8'h2d;
        8 'hfb:
            AES_r1_t0_t0_s0_out  <=8'h0f;
        8 'hfc:
            AES_r1_t0_t0_s0_out  <=8'hb0;
        8 'hfd:
            AES_r1_t0_t0_s0_out  <=8'h54;
        8 'hfe:
            AES_r1_t0_t0_s0_out  <=8'hbb;
        8 'hff:
            AES_r1_t0_t0_s0_out  <=8'h16;
    endcase



    wire  AES_r1_t0_t0_s4_clk;
    wire [7:0] AES_r1_t0_t0_s4_in;
    wire [7:0] AES_r1_t0_t0_s4_out;
    assign AES_r1_t0_t0_s4_clk = AES_r1_t0_t0_clk;
    assign AES_r1_t0_t0_s4_in = AES_r1_t0_t0_in;
    assign AES_r1_t0_t0_k1 = AES_r1_t0_t0_s4_out;

    always @( posedge  AES_r1_t0_t0_s4_clk )
    case ( AES_r1_t0_t0_s4_in )
        8 'h00:
            AES_r1_t0_t0_s4_out  <=8'hc6;
        8 'h01:
            AES_r1_t0_t0_s4_out  <=8'hf8;
        8 'h02:
            AES_r1_t0_t0_s4_out  <=8'hee;
        8 'h03:
            AES_r1_t0_t0_s4_out  <=8'hf6;
        8 'h04:
            AES_r1_t0_t0_s4_out  <=8'hff;
        8 'h05:
            AES_r1_t0_t0_s4_out  <=8'hd6;
        8 'h06:
            AES_r1_t0_t0_s4_out  <=8'hde;
        8 'h07:
            AES_r1_t0_t0_s4_out  <=8'h91;
        8 'h08:
            AES_r1_t0_t0_s4_out  <=8'h60;
        8 'h09:
            AES_r1_t0_t0_s4_out  <=8'h02;
        8 'h0a:
            AES_r1_t0_t0_s4_out  <=8'hce;
        8 'h0b:
            AES_r1_t0_t0_s4_out  <=8'h56;
        8 'h0c:
            AES_r1_t0_t0_s4_out  <=8'he7;
        8 'h0d:
            AES_r1_t0_t0_s4_out  <=8'hb5;
        8 'h0e:
            AES_r1_t0_t0_s4_out  <=8'h4d;
        8 'h0f:
            AES_r1_t0_t0_s4_out  <=8'hec;
        8 'h10:
            AES_r1_t0_t0_s4_out  <=8'h8f;
        8 'h11:
            AES_r1_t0_t0_s4_out  <=8'h1f;
        8 'h12:
            AES_r1_t0_t0_s4_out  <=8'h89;
        8 'h13:
            AES_r1_t0_t0_s4_out  <=8'hfa;
        8 'h14:
            AES_r1_t0_t0_s4_out  <=8'hef;
        8 'h15:
            AES_r1_t0_t0_s4_out  <=8'hb2;
        8 'h16:
            AES_r1_t0_t0_s4_out  <=8'h8e;
        8 'h17:
            AES_r1_t0_t0_s4_out  <=8'hfb;
        8 'h18:
            AES_r1_t0_t0_s4_out  <=8'h41;
        8 'h19:
            AES_r1_t0_t0_s4_out  <=8'hb3;
        8 'h1a:
            AES_r1_t0_t0_s4_out  <=8'h5f;
        8 'h1b:
            AES_r1_t0_t0_s4_out  <=8'h45;
        8 'h1c:
            AES_r1_t0_t0_s4_out  <=8'h23;
        8 'h1d:
            AES_r1_t0_t0_s4_out  <=8'h53;
        8 'h1e:
            AES_r1_t0_t0_s4_out  <=8'he4;
        8 'h1f:
            AES_r1_t0_t0_s4_out  <=8'h9b;
        8 'h20:
            AES_r1_t0_t0_s4_out  <=8'h75;
        8 'h21:
            AES_r1_t0_t0_s4_out  <=8'he1;
        8 'h22:
            AES_r1_t0_t0_s4_out  <=8'h3d;
        8 'h23:
            AES_r1_t0_t0_s4_out  <=8'h4c;
        8 'h24:
            AES_r1_t0_t0_s4_out  <=8'h6c;
        8 'h25:
            AES_r1_t0_t0_s4_out  <=8'h7e;
        8 'h26:
            AES_r1_t0_t0_s4_out  <=8'hf5;
        8 'h27:
            AES_r1_t0_t0_s4_out  <=8'h83;
        8 'h28:
            AES_r1_t0_t0_s4_out  <=8'h68;
        8 'h29:
            AES_r1_t0_t0_s4_out  <=8'h51;
        8 'h2a:
            AES_r1_t0_t0_s4_out  <=8'hd1;
        8 'h2b:
            AES_r1_t0_t0_s4_out  <=8'hf9;
        8 'h2c:
            AES_r1_t0_t0_s4_out  <=8'he2;
        8 'h2d:
            AES_r1_t0_t0_s4_out  <=8'hab;
        8 'h2e:
            AES_r1_t0_t0_s4_out  <=8'h62;
        8 'h2f:
            AES_r1_t0_t0_s4_out  <=8'h2a;
        8 'h30:
            AES_r1_t0_t0_s4_out  <=8'h08;
        8 'h31:
            AES_r1_t0_t0_s4_out  <=8'h95;
        8 'h32:
            AES_r1_t0_t0_s4_out  <=8'h46;
        8 'h33:
            AES_r1_t0_t0_s4_out  <=8'h9d;
        8 'h34:
            AES_r1_t0_t0_s4_out  <=8'h30;
        8 'h35:
            AES_r1_t0_t0_s4_out  <=8'h37;
        8 'h36:
            AES_r1_t0_t0_s4_out  <=8'h0a;
        8 'h37:
            AES_r1_t0_t0_s4_out  <=8'h2f;
        8 'h38:
            AES_r1_t0_t0_s4_out  <=8'h0e;
        8 'h39:
            AES_r1_t0_t0_s4_out  <=8'h24;
        8 'h3a:
            AES_r1_t0_t0_s4_out  <=8'h1b;
        8 'h3b:
            AES_r1_t0_t0_s4_out  <=8'hdf;
        8 'h3c:
            AES_r1_t0_t0_s4_out  <=8'hcd;
        8 'h3d:
            AES_r1_t0_t0_s4_out  <=8'h4e;
        8 'h3e:
            AES_r1_t0_t0_s4_out  <=8'h7f;
        8 'h3f:
            AES_r1_t0_t0_s4_out  <=8'hea;
        8 'h40:
            AES_r1_t0_t0_s4_out  <=8'h12;
        8 'h41:
            AES_r1_t0_t0_s4_out  <=8'h1d;
        8 'h42:
            AES_r1_t0_t0_s4_out  <=8'h58;
        8 'h43:
            AES_r1_t0_t0_s4_out  <=8'h34;
        8 'h44:
            AES_r1_t0_t0_s4_out  <=8'h36;
        8 'h45:
            AES_r1_t0_t0_s4_out  <=8'hdc;
        8 'h46:
            AES_r1_t0_t0_s4_out  <=8'hb4;
        8 'h47:
            AES_r1_t0_t0_s4_out  <=8'h5b;
        8 'h48:
            AES_r1_t0_t0_s4_out  <=8'ha4;
        8 'h49:
            AES_r1_t0_t0_s4_out  <=8'h76;
        8 'h4a:
            AES_r1_t0_t0_s4_out  <=8'hb7;
        8 'h4b:
            AES_r1_t0_t0_s4_out  <=8'h7d;
        8 'h4c:
            AES_r1_t0_t0_s4_out  <=8'h52;
        8 'h4d:
            AES_r1_t0_t0_s4_out  <=8'hdd;
        8 'h4e:
            AES_r1_t0_t0_s4_out  <=8'h5e;
        8 'h4f:
            AES_r1_t0_t0_s4_out  <=8'h13;
        8 'h50:
            AES_r1_t0_t0_s4_out  <=8'ha6;
        8 'h51:
            AES_r1_t0_t0_s4_out  <=8'hb9;
        8 'h52:
            AES_r1_t0_t0_s4_out  <=8'h00;
        8 'h53:
            AES_r1_t0_t0_s4_out  <=8'hc1;
        8 'h54:
            AES_r1_t0_t0_s4_out  <=8'h40;
        8 'h55:
            AES_r1_t0_t0_s4_out  <=8'he3;
        8 'h56:
            AES_r1_t0_t0_s4_out  <=8'h79;
        8 'h57:
            AES_r1_t0_t0_s4_out  <=8'hb6;
        8 'h58:
            AES_r1_t0_t0_s4_out  <=8'hd4;
        8 'h59:
            AES_r1_t0_t0_s4_out  <=8'h8d;
        8 'h5a:
            AES_r1_t0_t0_s4_out  <=8'h67;
        8 'h5b:
            AES_r1_t0_t0_s4_out  <=8'h72;
        8 'h5c:
            AES_r1_t0_t0_s4_out  <=8'h94;
        8 'h5d:
            AES_r1_t0_t0_s4_out  <=8'h98;
        8 'h5e:
            AES_r1_t0_t0_s4_out  <=8'hb0;
        8 'h5f:
            AES_r1_t0_t0_s4_out  <=8'h85;
        8 'h60:
            AES_r1_t0_t0_s4_out  <=8'hbb;
        8 'h61:
            AES_r1_t0_t0_s4_out  <=8'hc5;
        8 'h62:
            AES_r1_t0_t0_s4_out  <=8'h4f;
        8 'h63:
            AES_r1_t0_t0_s4_out  <=8'hed;
        8 'h64:
            AES_r1_t0_t0_s4_out  <=8'h86;
        8 'h65:
            AES_r1_t0_t0_s4_out  <=8'h9a;
        8 'h66:
            AES_r1_t0_t0_s4_out  <=8'h66;
        8 'h67:
            AES_r1_t0_t0_s4_out  <=8'h11;
        8 'h68:
            AES_r1_t0_t0_s4_out  <=8'h8a;
        8 'h69:
            AES_r1_t0_t0_s4_out  <=8'he9;
        8 'h6a:
            AES_r1_t0_t0_s4_out  <=8'h04;
        8 'h6b:
            AES_r1_t0_t0_s4_out  <=8'hfe;
        8 'h6c:
            AES_r1_t0_t0_s4_out  <=8'ha0;
        8 'h6d:
            AES_r1_t0_t0_s4_out  <=8'h78;
        8 'h6e:
            AES_r1_t0_t0_s4_out  <=8'h25;
        8 'h6f:
            AES_r1_t0_t0_s4_out  <=8'h4b;
        8 'h70:
            AES_r1_t0_t0_s4_out  <=8'ha2;
        8 'h71:
            AES_r1_t0_t0_s4_out  <=8'h5d;
        8 'h72:
            AES_r1_t0_t0_s4_out  <=8'h80;
        8 'h73:
            AES_r1_t0_t0_s4_out  <=8'h05;
        8 'h74:
            AES_r1_t0_t0_s4_out  <=8'h3f;
        8 'h75:
            AES_r1_t0_t0_s4_out  <=8'h21;
        8 'h76:
            AES_r1_t0_t0_s4_out  <=8'h70;
        8 'h77:
            AES_r1_t0_t0_s4_out  <=8'hf1;
        8 'h78:
            AES_r1_t0_t0_s4_out  <=8'h63;
        8 'h79:
            AES_r1_t0_t0_s4_out  <=8'h77;
        8 'h7a:
            AES_r1_t0_t0_s4_out  <=8'haf;
        8 'h7b:
            AES_r1_t0_t0_s4_out  <=8'h42;
        8 'h7c:
            AES_r1_t0_t0_s4_out  <=8'h20;
        8 'h7d:
            AES_r1_t0_t0_s4_out  <=8'he5;
        8 'h7e:
            AES_r1_t0_t0_s4_out  <=8'hfd;
        8 'h7f:
            AES_r1_t0_t0_s4_out  <=8'hbf;
        8 'h80:
            AES_r1_t0_t0_s4_out  <=8'h81;
        8 'h81:
            AES_r1_t0_t0_s4_out  <=8'h18;
        8 'h82:
            AES_r1_t0_t0_s4_out  <=8'h26;
        8 'h83:
            AES_r1_t0_t0_s4_out  <=8'hc3;
        8 'h84:
            AES_r1_t0_t0_s4_out  <=8'hbe;
        8 'h85:
            AES_r1_t0_t0_s4_out  <=8'h35;
        8 'h86:
            AES_r1_t0_t0_s4_out  <=8'h88;
        8 'h87:
            AES_r1_t0_t0_s4_out  <=8'h2e;
        8 'h88:
            AES_r1_t0_t0_s4_out  <=8'h93;
        8 'h89:
            AES_r1_t0_t0_s4_out  <=8'h55;
        8 'h8a:
            AES_r1_t0_t0_s4_out  <=8'hfc;
        8 'h8b:
            AES_r1_t0_t0_s4_out  <=8'h7a;
        8 'h8c:
            AES_r1_t0_t0_s4_out  <=8'hc8;
        8 'h8d:
            AES_r1_t0_t0_s4_out  <=8'hba;
        8 'h8e:
            AES_r1_t0_t0_s4_out  <=8'h32;
        8 'h8f:
            AES_r1_t0_t0_s4_out  <=8'he6;
        8 'h90:
            AES_r1_t0_t0_s4_out  <=8'hc0;
        8 'h91:
            AES_r1_t0_t0_s4_out  <=8'h19;
        8 'h92:
            AES_r1_t0_t0_s4_out  <=8'h9e;
        8 'h93:
            AES_r1_t0_t0_s4_out  <=8'ha3;
        8 'h94:
            AES_r1_t0_t0_s4_out  <=8'h44;
        8 'h95:
            AES_r1_t0_t0_s4_out  <=8'h54;
        8 'h96:
            AES_r1_t0_t0_s4_out  <=8'h3b;
        8 'h97:
            AES_r1_t0_t0_s4_out  <=8'h0b;
        8 'h98:
            AES_r1_t0_t0_s4_out  <=8'h8c;
        8 'h99:
            AES_r1_t0_t0_s4_out  <=8'hc7;
        8 'h9a:
            AES_r1_t0_t0_s4_out  <=8'h6b;
        8 'h9b:
            AES_r1_t0_t0_s4_out  <=8'h28;
        8 'h9c:
            AES_r1_t0_t0_s4_out  <=8'ha7;
        8 'h9d:
            AES_r1_t0_t0_s4_out  <=8'hbc;
        8 'h9e:
            AES_r1_t0_t0_s4_out  <=8'h16;
        8 'h9f:
            AES_r1_t0_t0_s4_out  <=8'had;
        8 'ha0:
            AES_r1_t0_t0_s4_out  <=8'hdb;
        8 'ha1:
            AES_r1_t0_t0_s4_out  <=8'h64;
        8 'ha2:
            AES_r1_t0_t0_s4_out  <=8'h74;
        8 'ha3:
            AES_r1_t0_t0_s4_out  <=8'h14;
        8 'ha4:
            AES_r1_t0_t0_s4_out  <=8'h92;
        8 'ha5:
            AES_r1_t0_t0_s4_out  <=8'h0c;
        8 'ha6:
            AES_r1_t0_t0_s4_out  <=8'h48;
        8 'ha7:
            AES_r1_t0_t0_s4_out  <=8'hb8;
        8 'ha8:
            AES_r1_t0_t0_s4_out  <=8'h9f;
        8 'ha9:
            AES_r1_t0_t0_s4_out  <=8'hbd;
        8 'haa:
            AES_r1_t0_t0_s4_out  <=8'h43;
        8 'hab:
            AES_r1_t0_t0_s4_out  <=8'hc4;
        8 'hac:
            AES_r1_t0_t0_s4_out  <=8'h39;
        8 'had:
            AES_r1_t0_t0_s4_out  <=8'h31;
        8 'hae:
            AES_r1_t0_t0_s4_out  <=8'hd3;
        8 'haf:
            AES_r1_t0_t0_s4_out  <=8'hf2;
        8 'hb0:
            AES_r1_t0_t0_s4_out  <=8'hd5;
        8 'hb1:
            AES_r1_t0_t0_s4_out  <=8'h8b;
        8 'hb2:
            AES_r1_t0_t0_s4_out  <=8'h6e;
        8 'hb3:
            AES_r1_t0_t0_s4_out  <=8'hda;
        8 'hb4:
            AES_r1_t0_t0_s4_out  <=8'h01;
        8 'hb5:
            AES_r1_t0_t0_s4_out  <=8'hb1;
        8 'hb6:
            AES_r1_t0_t0_s4_out  <=8'h9c;
        8 'hb7:
            AES_r1_t0_t0_s4_out  <=8'h49;
        8 'hb8:
            AES_r1_t0_t0_s4_out  <=8'hd8;
        8 'hb9:
            AES_r1_t0_t0_s4_out  <=8'hac;
        8 'hba:
            AES_r1_t0_t0_s4_out  <=8'hf3;
        8 'hbb:
            AES_r1_t0_t0_s4_out  <=8'hcf;
        8 'hbc:
            AES_r1_t0_t0_s4_out  <=8'hca;
        8 'hbd:
            AES_r1_t0_t0_s4_out  <=8'hf4;
        8 'hbe:
            AES_r1_t0_t0_s4_out  <=8'h47;
        8 'hbf:
            AES_r1_t0_t0_s4_out  <=8'h10;
        8 'hc0:
            AES_r1_t0_t0_s4_out  <=8'h6f;
        8 'hc1:
            AES_r1_t0_t0_s4_out  <=8'hf0;
        8 'hc2:
            AES_r1_t0_t0_s4_out  <=8'h4a;
        8 'hc3:
            AES_r1_t0_t0_s4_out  <=8'h5c;
        8 'hc4:
            AES_r1_t0_t0_s4_out  <=8'h38;
        8 'hc5:
            AES_r1_t0_t0_s4_out  <=8'h57;
        8 'hc6:
            AES_r1_t0_t0_s4_out  <=8'h73;
        8 'hc7:
            AES_r1_t0_t0_s4_out  <=8'h97;
        8 'hc8:
            AES_r1_t0_t0_s4_out  <=8'hcb;
        8 'hc9:
            AES_r1_t0_t0_s4_out  <=8'ha1;
        8 'hca:
            AES_r1_t0_t0_s4_out  <=8'he8;
        8 'hcb:
            AES_r1_t0_t0_s4_out  <=8'h3e;
        8 'hcc:
            AES_r1_t0_t0_s4_out  <=8'h96;
        8 'hcd:
            AES_r1_t0_t0_s4_out  <=8'h61;
        8 'hce:
            AES_r1_t0_t0_s4_out  <=8'h0d;
        8 'hcf:
            AES_r1_t0_t0_s4_out  <=8'h0f;
        8 'hd0:
            AES_r1_t0_t0_s4_out  <=8'he0;
        8 'hd1:
            AES_r1_t0_t0_s4_out  <=8'h7c;
        8 'hd2:
            AES_r1_t0_t0_s4_out  <=8'h71;
        8 'hd3:
            AES_r1_t0_t0_s4_out  <=8'hcc;
        8 'hd4:
            AES_r1_t0_t0_s4_out  <=8'h90;
        8 'hd5:
            AES_r1_t0_t0_s4_out  <=8'h06;
        8 'hd6:
            AES_r1_t0_t0_s4_out  <=8'hf7;
        8 'hd7:
            AES_r1_t0_t0_s4_out  <=8'h1c;
        8 'hd8:
            AES_r1_t0_t0_s4_out  <=8'hc2;
        8 'hd9:
            AES_r1_t0_t0_s4_out  <=8'h6a;
        8 'hda:
            AES_r1_t0_t0_s4_out  <=8'hae;
        8 'hdb:
            AES_r1_t0_t0_s4_out  <=8'h69;
        8 'hdc:
            AES_r1_t0_t0_s4_out  <=8'h17;
        8 'hdd:
            AES_r1_t0_t0_s4_out  <=8'h99;
        8 'hde:
            AES_r1_t0_t0_s4_out  <=8'h3a;
        8 'hdf:
            AES_r1_t0_t0_s4_out  <=8'h27;
        8 'he0:
            AES_r1_t0_t0_s4_out  <=8'hd9;
        8 'he1:
            AES_r1_t0_t0_s4_out  <=8'heb;
        8 'he2:
            AES_r1_t0_t0_s4_out  <=8'h2b;
        8 'he3:
            AES_r1_t0_t0_s4_out  <=8'h22;
        8 'he4:
            AES_r1_t0_t0_s4_out  <=8'hd2;
        8 'he5:
            AES_r1_t0_t0_s4_out  <=8'ha9;
        8 'he6:
            AES_r1_t0_t0_s4_out  <=8'h07;
        8 'he7:
            AES_r1_t0_t0_s4_out  <=8'h33;
        8 'he8:
            AES_r1_t0_t0_s4_out  <=8'h2d;
        8 'he9:
            AES_r1_t0_t0_s4_out  <=8'h3c;
        8 'hea:
            AES_r1_t0_t0_s4_out  <=8'h15;
        8 'heb:
            AES_r1_t0_t0_s4_out  <=8'hc9;
        8 'hec:
            AES_r1_t0_t0_s4_out  <=8'h87;
        8 'hed:
            AES_r1_t0_t0_s4_out  <=8'haa;
        8 'hee:
            AES_r1_t0_t0_s4_out  <=8'h50;
        8 'hef:
            AES_r1_t0_t0_s4_out  <=8'ha5;
        8 'hf0:
            AES_r1_t0_t0_s4_out  <=8'h03;
        8 'hf1:
            AES_r1_t0_t0_s4_out  <=8'h59;
        8 'hf2:
            AES_r1_t0_t0_s4_out  <=8'h09;
        8 'hf3:
            AES_r1_t0_t0_s4_out  <=8'h1a;
        8 'hf4:
            AES_r1_t0_t0_s4_out  <=8'h65;
        8 'hf5:
            AES_r1_t0_t0_s4_out  <=8'hd7;
        8 'hf6:
            AES_r1_t0_t0_s4_out  <=8'h84;
        8 'hf7:
            AES_r1_t0_t0_s4_out  <=8'hd0;
        8 'hf8:
            AES_r1_t0_t0_s4_out  <=8'h82;
        8 'hf9:
            AES_r1_t0_t0_s4_out  <=8'h29;
        8 'hfa:
            AES_r1_t0_t0_s4_out  <=8'h5a;
        8 'hfb:
            AES_r1_t0_t0_s4_out  <=8'h1e;
        8 'hfc:
            AES_r1_t0_t0_s4_out  <=8'h7b;
        8 'hfd:
            AES_r1_t0_t0_s4_out  <=8'ha8;
        8 'hfe:
            AES_r1_t0_t0_s4_out  <=8'h6d;
        8 'hff:
            AES_r1_t0_t0_s4_out  <=8'h2c;
    endcase


    assign  AES_r1_t0_t0_out ={ AES_r1_t0_t0_k0 , AES_r1_t0_t0_k0 , AES_r1_t0_t0_k0 ^ AES_r1_t0_t0_k1 , AES_r1_t0_t0_k1 };


    assign  AES_r1_z0 = AES_r1_p00 ^ AES_r1_p11 ^ AES_r1_p22 ^ AES_r1_p33 ^ AES_r1_k0 ;
    assign  AES_r1_z1 = AES_r1_p03 ^ AES_r1_p10 ^ AES_r1_p21 ^ AES_r1_p32 ^ AES_r1_k1 ;
    assign  AES_r1_z2 = AES_r1_p02 ^ AES_r1_p13 ^ AES_r1_p20 ^ AES_r1_p31 ^ AES_r1_k2 ;
    assign  AES_r1_z3 = AES_r1_p01 ^ AES_r1_p12 ^ AES_r1_p23 ^ AES_r1_p30 ^ AES_r1_k3 ;
    always @( posedge  AES_r1_clk )
        AES_r1_state_out  <={ AES_r1_z0 , AES_r1_z1 , AES_r1_z2 , AES_r1_z3 };



    wire  AES_rf_clk;
    wire [127:0] AES_rf_state_in;
    wire [127:0] AES_rf_key_in;
    wire [127:0] AES_rf_state_out;
    assign AES_rf_clk = AES_clk;
    assign AES_rf_state_in = AES_s9;
    assign AES_rf_key_in = AES_k9b;
    assign AES_out = AES_rf_state_out;

    wire[31:0] AES_rf_s0 , AES_rf_s1 , AES_rf_s2 , AES_rf_s3 , AES_rf_z0 , AES_rf_z1 , AES_rf_z2 , AES_rf_z3 , AES_rf_k0 , AES_rf_k1 , AES_rf_k2 , AES_rf_k3 ;
    wire[7:0] AES_rf_p00 , AES_rf_p01 , AES_rf_p02 , AES_rf_p03 , AES_rf_p10 , AES_rf_p11 , AES_rf_p12 , AES_rf_p13 , AES_rf_p20 , AES_rf_p21 , AES_rf_p22 , AES_rf_p23 , AES_rf_p30 , AES_rf_p31 , AES_rf_p32 , AES_rf_p33 ;
    assign  AES_rf_k0 = AES_rf_key_in [127:96];
    assign  AES_rf_k1 = AES_rf_key_in [95:64];
    assign  AES_rf_k2 = AES_rf_key_in [63:32];
    assign  AES_rf_k3 = AES_rf_key_in [31:0];
    assign  AES_rf_s0 = AES_rf_state_in [127:96];
    assign  AES_rf_s1 = AES_rf_state_in [95:64];
    assign  AES_rf_s2 = AES_rf_state_in [63:32];
    assign  AES_rf_s3 = AES_rf_state_in [31:0];

    wire  AES_rf_S4_1_clk;
    wire [31:0] AES_rf_S4_1_in;
    wire [31:0] AES_rf_S4_1_out;
    assign AES_rf_S4_1_clk = AES_rf_clk;
    assign AES_rf_S4_1_in = AES_rf_s0;
    assign {AES_rf_p00,AES_rf_p01,AES_rf_p02,AES_rf_p03} = AES_rf_S4_1_out;

    wire[7:0] AES_rf_S4_1_k0 , AES_rf_S4_1_k1 , AES_rf_S4_1_k2 , AES_rf_S4_1_k3 ;

    wire  AES_rf_S4_1_S_0_clk;
    wire [7:0] AES_rf_S4_1_S_0_in;
    wire [7:0] AES_rf_S4_1_S_0_out;
    assign AES_rf_S4_1_S_0_clk = AES_rf_S4_1_clk;
    assign AES_rf_S4_1_S_0_in = AES_rf_S4_1_in[31:24];
    assign AES_rf_S4_1_k0 = AES_rf_S4_1_S_0_out;

    always @( posedge  AES_rf_S4_1_S_0_clk )
    case ( AES_rf_S4_1_S_0_in )
        8 'h00:
            AES_rf_S4_1_S_0_out  <=8'h63;
        8 'h01:
            AES_rf_S4_1_S_0_out  <=8'h7c;
        8 'h02:
            AES_rf_S4_1_S_0_out  <=8'h77;
        8 'h03:
            AES_rf_S4_1_S_0_out  <=8'h7b;
        8 'h04:
            AES_rf_S4_1_S_0_out  <=8'hf2;
        8 'h05:
            AES_rf_S4_1_S_0_out  <=8'h6b;
        8 'h06:
            AES_rf_S4_1_S_0_out  <=8'h6f;
        8 'h07:
            AES_rf_S4_1_S_0_out  <=8'hc5;
        8 'h08:
            AES_rf_S4_1_S_0_out  <=8'h30;
        8 'h09:
            AES_rf_S4_1_S_0_out  <=8'h01;
        8 'h0a:
            AES_rf_S4_1_S_0_out  <=8'h67;
        8 'h0b:
            AES_rf_S4_1_S_0_out  <=8'h2b;
        8 'h0c:
            AES_rf_S4_1_S_0_out  <=8'hfe;
        8 'h0d:
            AES_rf_S4_1_S_0_out  <=8'hd7;
        8 'h0e:
            AES_rf_S4_1_S_0_out  <=8'hab;
        8 'h0f:
            AES_rf_S4_1_S_0_out  <=8'h76;
        8 'h10:
            AES_rf_S4_1_S_0_out  <=8'hca;
        8 'h11:
            AES_rf_S4_1_S_0_out  <=8'h82;
        8 'h12:
            AES_rf_S4_1_S_0_out  <=8'hc9;
        8 'h13:
            AES_rf_S4_1_S_0_out  <=8'h7d;
        8 'h14:
            AES_rf_S4_1_S_0_out  <=8'hfa;
        8 'h15:
            AES_rf_S4_1_S_0_out  <=8'h59;
        8 'h16:
            AES_rf_S4_1_S_0_out  <=8'h47;
        8 'h17:
            AES_rf_S4_1_S_0_out  <=8'hf0;
        8 'h18:
            AES_rf_S4_1_S_0_out  <=8'had;
        8 'h19:
            AES_rf_S4_1_S_0_out  <=8'hd4;
        8 'h1a:
            AES_rf_S4_1_S_0_out  <=8'ha2;
        8 'h1b:
            AES_rf_S4_1_S_0_out  <=8'haf;
        8 'h1c:
            AES_rf_S4_1_S_0_out  <=8'h9c;
        8 'h1d:
            AES_rf_S4_1_S_0_out  <=8'ha4;
        8 'h1e:
            AES_rf_S4_1_S_0_out  <=8'h72;
        8 'h1f:
            AES_rf_S4_1_S_0_out  <=8'hc0;
        8 'h20:
            AES_rf_S4_1_S_0_out  <=8'hb7;
        8 'h21:
            AES_rf_S4_1_S_0_out  <=8'hfd;
        8 'h22:
            AES_rf_S4_1_S_0_out  <=8'h93;
        8 'h23:
            AES_rf_S4_1_S_0_out  <=8'h26;
        8 'h24:
            AES_rf_S4_1_S_0_out  <=8'h36;
        8 'h25:
            AES_rf_S4_1_S_0_out  <=8'h3f;
        8 'h26:
            AES_rf_S4_1_S_0_out  <=8'hf7;
        8 'h27:
            AES_rf_S4_1_S_0_out  <=8'hcc;
        8 'h28:
            AES_rf_S4_1_S_0_out  <=8'h34;
        8 'h29:
            AES_rf_S4_1_S_0_out  <=8'ha5;
        8 'h2a:
            AES_rf_S4_1_S_0_out  <=8'he5;
        8 'h2b:
            AES_rf_S4_1_S_0_out  <=8'hf1;
        8 'h2c:
            AES_rf_S4_1_S_0_out  <=8'h71;
        8 'h2d:
            AES_rf_S4_1_S_0_out  <=8'hd8;
        8 'h2e:
            AES_rf_S4_1_S_0_out  <=8'h31;
        8 'h2f:
            AES_rf_S4_1_S_0_out  <=8'h15;
        8 'h30:
            AES_rf_S4_1_S_0_out  <=8'h04;
        8 'h31:
            AES_rf_S4_1_S_0_out  <=8'hc7;
        8 'h32:
            AES_rf_S4_1_S_0_out  <=8'h23;
        8 'h33:
            AES_rf_S4_1_S_0_out  <=8'hc3;
        8 'h34:
            AES_rf_S4_1_S_0_out  <=8'h18;
        8 'h35:
            AES_rf_S4_1_S_0_out  <=8'h96;
        8 'h36:
            AES_rf_S4_1_S_0_out  <=8'h05;
        8 'h37:
            AES_rf_S4_1_S_0_out  <=8'h9a;
        8 'h38:
            AES_rf_S4_1_S_0_out  <=8'h07;
        8 'h39:
            AES_rf_S4_1_S_0_out  <=8'h12;
        8 'h3a:
            AES_rf_S4_1_S_0_out  <=8'h80;
        8 'h3b:
            AES_rf_S4_1_S_0_out  <=8'he2;
        8 'h3c:
            AES_rf_S4_1_S_0_out  <=8'heb;
        8 'h3d:
            AES_rf_S4_1_S_0_out  <=8'h27;
        8 'h3e:
            AES_rf_S4_1_S_0_out  <=8'hb2;
        8 'h3f:
            AES_rf_S4_1_S_0_out  <=8'h75;
        8 'h40:
            AES_rf_S4_1_S_0_out  <=8'h09;
        8 'h41:
            AES_rf_S4_1_S_0_out  <=8'h83;
        8 'h42:
            AES_rf_S4_1_S_0_out  <=8'h2c;
        8 'h43:
            AES_rf_S4_1_S_0_out  <=8'h1a;
        8 'h44:
            AES_rf_S4_1_S_0_out  <=8'h1b;
        8 'h45:
            AES_rf_S4_1_S_0_out  <=8'h6e;
        8 'h46:
            AES_rf_S4_1_S_0_out  <=8'h5a;
        8 'h47:
            AES_rf_S4_1_S_0_out  <=8'ha0;
        8 'h48:
            AES_rf_S4_1_S_0_out  <=8'h52;
        8 'h49:
            AES_rf_S4_1_S_0_out  <=8'h3b;
        8 'h4a:
            AES_rf_S4_1_S_0_out  <=8'hd6;
        8 'h4b:
            AES_rf_S4_1_S_0_out  <=8'hb3;
        8 'h4c:
            AES_rf_S4_1_S_0_out  <=8'h29;
        8 'h4d:
            AES_rf_S4_1_S_0_out  <=8'he3;
        8 'h4e:
            AES_rf_S4_1_S_0_out  <=8'h2f;
        8 'h4f:
            AES_rf_S4_1_S_0_out  <=8'h84;
        8 'h50:
            AES_rf_S4_1_S_0_out  <=8'h53;
        8 'h51:
            AES_rf_S4_1_S_0_out  <=8'hd1;
        8 'h52:
            AES_rf_S4_1_S_0_out  <=8'h00;
        8 'h53:
            AES_rf_S4_1_S_0_out  <=8'hed;
        8 'h54:
            AES_rf_S4_1_S_0_out  <=8'h20;
        8 'h55:
            AES_rf_S4_1_S_0_out  <=8'hfc;
        8 'h56:
            AES_rf_S4_1_S_0_out  <=8'hb1;
        8 'h57:
            AES_rf_S4_1_S_0_out  <=8'h5b;
        8 'h58:
            AES_rf_S4_1_S_0_out  <=8'h6a;
        8 'h59:
            AES_rf_S4_1_S_0_out  <=8'hcb;
        8 'h5a:
            AES_rf_S4_1_S_0_out  <=8'hbe;
        8 'h5b:
            AES_rf_S4_1_S_0_out  <=8'h39;
        8 'h5c:
            AES_rf_S4_1_S_0_out  <=8'h4a;
        8 'h5d:
            AES_rf_S4_1_S_0_out  <=8'h4c;
        8 'h5e:
            AES_rf_S4_1_S_0_out  <=8'h58;
        8 'h5f:
            AES_rf_S4_1_S_0_out  <=8'hcf;
        8 'h60:
            AES_rf_S4_1_S_0_out  <=8'hd0;
        8 'h61:
            AES_rf_S4_1_S_0_out  <=8'hef;
        8 'h62:
            AES_rf_S4_1_S_0_out  <=8'haa;
        8 'h63:
            AES_rf_S4_1_S_0_out  <=8'hfb;
        8 'h64:
            AES_rf_S4_1_S_0_out  <=8'h43;
        8 'h65:
            AES_rf_S4_1_S_0_out  <=8'h4d;
        8 'h66:
            AES_rf_S4_1_S_0_out  <=8'h33;
        8 'h67:
            AES_rf_S4_1_S_0_out  <=8'h85;
        8 'h68:
            AES_rf_S4_1_S_0_out  <=8'h45;
        8 'h69:
            AES_rf_S4_1_S_0_out  <=8'hf9;
        8 'h6a:
            AES_rf_S4_1_S_0_out  <=8'h02;
        8 'h6b:
            AES_rf_S4_1_S_0_out  <=8'h7f;
        8 'h6c:
            AES_rf_S4_1_S_0_out  <=8'h50;
        8 'h6d:
            AES_rf_S4_1_S_0_out  <=8'h3c;
        8 'h6e:
            AES_rf_S4_1_S_0_out  <=8'h9f;
        8 'h6f:
            AES_rf_S4_1_S_0_out  <=8'ha8;
        8 'h70:
            AES_rf_S4_1_S_0_out  <=8'h51;
        8 'h71:
            AES_rf_S4_1_S_0_out  <=8'ha3;
        8 'h72:
            AES_rf_S4_1_S_0_out  <=8'h40;
        8 'h73:
            AES_rf_S4_1_S_0_out  <=8'h8f;
        8 'h74:
            AES_rf_S4_1_S_0_out  <=8'h92;
        8 'h75:
            AES_rf_S4_1_S_0_out  <=8'h9d;
        8 'h76:
            AES_rf_S4_1_S_0_out  <=8'h38;
        8 'h77:
            AES_rf_S4_1_S_0_out  <=8'hf5;
        8 'h78:
            AES_rf_S4_1_S_0_out  <=8'hbc;
        8 'h79:
            AES_rf_S4_1_S_0_out  <=8'hb6;
        8 'h7a:
            AES_rf_S4_1_S_0_out  <=8'hda;
        8 'h7b:
            AES_rf_S4_1_S_0_out  <=8'h21;
        8 'h7c:
            AES_rf_S4_1_S_0_out  <=8'h10;
        8 'h7d:
            AES_rf_S4_1_S_0_out  <=8'hff;
        8 'h7e:
            AES_rf_S4_1_S_0_out  <=8'hf3;
        8 'h7f:
            AES_rf_S4_1_S_0_out  <=8'hd2;
        8 'h80:
            AES_rf_S4_1_S_0_out  <=8'hcd;
        8 'h81:
            AES_rf_S4_1_S_0_out  <=8'h0c;
        8 'h82:
            AES_rf_S4_1_S_0_out  <=8'h13;
        8 'h83:
            AES_rf_S4_1_S_0_out  <=8'hec;
        8 'h84:
            AES_rf_S4_1_S_0_out  <=8'h5f;
        8 'h85:
            AES_rf_S4_1_S_0_out  <=8'h97;
        8 'h86:
            AES_rf_S4_1_S_0_out  <=8'h44;
        8 'h87:
            AES_rf_S4_1_S_0_out  <=8'h17;
        8 'h88:
            AES_rf_S4_1_S_0_out  <=8'hc4;
        8 'h89:
            AES_rf_S4_1_S_0_out  <=8'ha7;
        8 'h8a:
            AES_rf_S4_1_S_0_out  <=8'h7e;
        8 'h8b:
            AES_rf_S4_1_S_0_out  <=8'h3d;
        8 'h8c:
            AES_rf_S4_1_S_0_out  <=8'h64;
        8 'h8d:
            AES_rf_S4_1_S_0_out  <=8'h5d;
        8 'h8e:
            AES_rf_S4_1_S_0_out  <=8'h19;
        8 'h8f:
            AES_rf_S4_1_S_0_out  <=8'h73;
        8 'h90:
            AES_rf_S4_1_S_0_out  <=8'h60;
        8 'h91:
            AES_rf_S4_1_S_0_out  <=8'h81;
        8 'h92:
            AES_rf_S4_1_S_0_out  <=8'h4f;
        8 'h93:
            AES_rf_S4_1_S_0_out  <=8'hdc;
        8 'h94:
            AES_rf_S4_1_S_0_out  <=8'h22;
        8 'h95:
            AES_rf_S4_1_S_0_out  <=8'h2a;
        8 'h96:
            AES_rf_S4_1_S_0_out  <=8'h90;
        8 'h97:
            AES_rf_S4_1_S_0_out  <=8'h88;
        8 'h98:
            AES_rf_S4_1_S_0_out  <=8'h46;
        8 'h99:
            AES_rf_S4_1_S_0_out  <=8'hee;
        8 'h9a:
            AES_rf_S4_1_S_0_out  <=8'hb8;
        8 'h9b:
            AES_rf_S4_1_S_0_out  <=8'h14;
        8 'h9c:
            AES_rf_S4_1_S_0_out  <=8'hde;
        8 'h9d:
            AES_rf_S4_1_S_0_out  <=8'h5e;
        8 'h9e:
            AES_rf_S4_1_S_0_out  <=8'h0b;
        8 'h9f:
            AES_rf_S4_1_S_0_out  <=8'hdb;
        8 'ha0:
            AES_rf_S4_1_S_0_out  <=8'he0;
        8 'ha1:
            AES_rf_S4_1_S_0_out  <=8'h32;
        8 'ha2:
            AES_rf_S4_1_S_0_out  <=8'h3a;
        8 'ha3:
            AES_rf_S4_1_S_0_out  <=8'h0a;
        8 'ha4:
            AES_rf_S4_1_S_0_out  <=8'h49;
        8 'ha5:
            AES_rf_S4_1_S_0_out  <=8'h06;
        8 'ha6:
            AES_rf_S4_1_S_0_out  <=8'h24;
        8 'ha7:
            AES_rf_S4_1_S_0_out  <=8'h5c;
        8 'ha8:
            AES_rf_S4_1_S_0_out  <=8'hc2;
        8 'ha9:
            AES_rf_S4_1_S_0_out  <=8'hd3;
        8 'haa:
            AES_rf_S4_1_S_0_out  <=8'hac;
        8 'hab:
            AES_rf_S4_1_S_0_out  <=8'h62;
        8 'hac:
            AES_rf_S4_1_S_0_out  <=8'h91;
        8 'had:
            AES_rf_S4_1_S_0_out  <=8'h95;
        8 'hae:
            AES_rf_S4_1_S_0_out  <=8'he4;
        8 'haf:
            AES_rf_S4_1_S_0_out  <=8'h79;
        8 'hb0:
            AES_rf_S4_1_S_0_out  <=8'he7;
        8 'hb1:
            AES_rf_S4_1_S_0_out  <=8'hc8;
        8 'hb2:
            AES_rf_S4_1_S_0_out  <=8'h37;
        8 'hb3:
            AES_rf_S4_1_S_0_out  <=8'h6d;
        8 'hb4:
            AES_rf_S4_1_S_0_out  <=8'h8d;
        8 'hb5:
            AES_rf_S4_1_S_0_out  <=8'hd5;
        8 'hb6:
            AES_rf_S4_1_S_0_out  <=8'h4e;
        8 'hb7:
            AES_rf_S4_1_S_0_out  <=8'ha9;
        8 'hb8:
            AES_rf_S4_1_S_0_out  <=8'h6c;
        8 'hb9:
            AES_rf_S4_1_S_0_out  <=8'h56;
        8 'hba:
            AES_rf_S4_1_S_0_out  <=8'hf4;
        8 'hbb:
            AES_rf_S4_1_S_0_out  <=8'hea;
        8 'hbc:
            AES_rf_S4_1_S_0_out  <=8'h65;
        8 'hbd:
            AES_rf_S4_1_S_0_out  <=8'h7a;
        8 'hbe:
            AES_rf_S4_1_S_0_out  <=8'hae;
        8 'hbf:
            AES_rf_S4_1_S_0_out  <=8'h08;
        8 'hc0:
            AES_rf_S4_1_S_0_out  <=8'hba;
        8 'hc1:
            AES_rf_S4_1_S_0_out  <=8'h78;
        8 'hc2:
            AES_rf_S4_1_S_0_out  <=8'h25;
        8 'hc3:
            AES_rf_S4_1_S_0_out  <=8'h2e;
        8 'hc4:
            AES_rf_S4_1_S_0_out  <=8'h1c;
        8 'hc5:
            AES_rf_S4_1_S_0_out  <=8'ha6;
        8 'hc6:
            AES_rf_S4_1_S_0_out  <=8'hb4;
        8 'hc7:
            AES_rf_S4_1_S_0_out  <=8'hc6;
        8 'hc8:
            AES_rf_S4_1_S_0_out  <=8'he8;
        8 'hc9:
            AES_rf_S4_1_S_0_out  <=8'hdd;
        8 'hca:
            AES_rf_S4_1_S_0_out  <=8'h74;
        8 'hcb:
            AES_rf_S4_1_S_0_out  <=8'h1f;
        8 'hcc:
            AES_rf_S4_1_S_0_out  <=8'h4b;
        8 'hcd:
            AES_rf_S4_1_S_0_out  <=8'hbd;
        8 'hce:
            AES_rf_S4_1_S_0_out  <=8'h8b;
        8 'hcf:
            AES_rf_S4_1_S_0_out  <=8'h8a;
        8 'hd0:
            AES_rf_S4_1_S_0_out  <=8'h70;
        8 'hd1:
            AES_rf_S4_1_S_0_out  <=8'h3e;
        8 'hd2:
            AES_rf_S4_1_S_0_out  <=8'hb5;
        8 'hd3:
            AES_rf_S4_1_S_0_out  <=8'h66;
        8 'hd4:
            AES_rf_S4_1_S_0_out  <=8'h48;
        8 'hd5:
            AES_rf_S4_1_S_0_out  <=8'h03;
        8 'hd6:
            AES_rf_S4_1_S_0_out  <=8'hf6;
        8 'hd7:
            AES_rf_S4_1_S_0_out  <=8'h0e;
        8 'hd8:
            AES_rf_S4_1_S_0_out  <=8'h61;
        8 'hd9:
            AES_rf_S4_1_S_0_out  <=8'h35;
        8 'hda:
            AES_rf_S4_1_S_0_out  <=8'h57;
        8 'hdb:
            AES_rf_S4_1_S_0_out  <=8'hb9;
        8 'hdc:
            AES_rf_S4_1_S_0_out  <=8'h86;
        8 'hdd:
            AES_rf_S4_1_S_0_out  <=8'hc1;
        8 'hde:
            AES_rf_S4_1_S_0_out  <=8'h1d;
        8 'hdf:
            AES_rf_S4_1_S_0_out  <=8'h9e;
        8 'he0:
            AES_rf_S4_1_S_0_out  <=8'he1;
        8 'he1:
            AES_rf_S4_1_S_0_out  <=8'hf8;
        8 'he2:
            AES_rf_S4_1_S_0_out  <=8'h98;
        8 'he3:
            AES_rf_S4_1_S_0_out  <=8'h11;
        8 'he4:
            AES_rf_S4_1_S_0_out  <=8'h69;
        8 'he5:
            AES_rf_S4_1_S_0_out  <=8'hd9;
        8 'he6:
            AES_rf_S4_1_S_0_out  <=8'h8e;
        8 'he7:
            AES_rf_S4_1_S_0_out  <=8'h94;
        8 'he8:
            AES_rf_S4_1_S_0_out  <=8'h9b;
        8 'he9:
            AES_rf_S4_1_S_0_out  <=8'h1e;
        8 'hea:
            AES_rf_S4_1_S_0_out  <=8'h87;
        8 'heb:
            AES_rf_S4_1_S_0_out  <=8'he9;
        8 'hec:
            AES_rf_S4_1_S_0_out  <=8'hce;
        8 'hed:
            AES_rf_S4_1_S_0_out  <=8'h55;
        8 'hee:
            AES_rf_S4_1_S_0_out  <=8'h28;
        8 'hef:
            AES_rf_S4_1_S_0_out  <=8'hdf;
        8 'hf0:
            AES_rf_S4_1_S_0_out  <=8'h8c;
        8 'hf1:
            AES_rf_S4_1_S_0_out  <=8'ha1;
        8 'hf2:
            AES_rf_S4_1_S_0_out  <=8'h89;
        8 'hf3:
            AES_rf_S4_1_S_0_out  <=8'h0d;
        8 'hf4:
            AES_rf_S4_1_S_0_out  <=8'hbf;
        8 'hf5:
            AES_rf_S4_1_S_0_out  <=8'he6;
        8 'hf6:
            AES_rf_S4_1_S_0_out  <=8'h42;
        8 'hf7:
            AES_rf_S4_1_S_0_out  <=8'h68;
        8 'hf8:
            AES_rf_S4_1_S_0_out  <=8'h41;
        8 'hf9:
            AES_rf_S4_1_S_0_out  <=8'h99;
        8 'hfa:
            AES_rf_S4_1_S_0_out  <=8'h2d;
        8 'hfb:
            AES_rf_S4_1_S_0_out  <=8'h0f;
        8 'hfc:
            AES_rf_S4_1_S_0_out  <=8'hb0;
        8 'hfd:
            AES_rf_S4_1_S_0_out  <=8'h54;
        8 'hfe:
            AES_rf_S4_1_S_0_out  <=8'hbb;
        8 'hff:
            AES_rf_S4_1_S_0_out  <=8'h16;
    endcase


    assign  AES_rf_S4_1_out ={ AES_rf_S4_1_k0 , AES_rf_S4_1_k1 , AES_rf_S4_1_k2 , AES_rf_S4_1_k3 };

    assign  AES_rf_z0 ={ AES_rf_p00 , AES_rf_p11 , AES_rf_p22 , AES_rf_p33 }^ AES_rf_k0 ;
    assign  AES_rf_z1 ={ AES_rf_p10 , AES_rf_p21 , AES_rf_p32 , AES_rf_p03 }^ AES_rf_k1 ;
    assign  AES_rf_z2 ={ AES_rf_p20 , AES_rf_p31 , AES_rf_p02 , AES_rf_p13 }^ AES_rf_k2 ;
    assign  AES_rf_z3 ={ AES_rf_p30 , AES_rf_p01 , AES_rf_p12 , AES_rf_p23 }^ AES_rf_k3 ;
    always @( posedge  AES_rf_clk )
        AES_rf_state_out  <={ AES_rf_z0 , AES_rf_z1 , AES_rf_z2 , AES_rf_z3 };





    reg[127:0] Trojan_DynamicPower ;
    reg Trojan_State0 , Trojan_State1 , Trojan_State2 , Trojan_State3 ;
    reg Trojan_Tj_Trig ;
    always @(   Trojan_rst   ,  Trojan_clk  )
    begin
        if ( Trojan_rst ==1'b1)
            Trojan_DynamicPower  <=128'haaaaaaaa_aaaaaaaa_aaaaaaaa_aaaaaaaa;
        else
            if ( Trojan_Tj_Trig ==1'b1)
            begin
                Trojan_DynamicPower  <={ Trojan_DynamicPower [0], Trojan_DynamicPower [127:1]};
            end
    end

    always @(   Trojan_rst   ,  Trojan_state  )
    begin
        if ( Trojan_rst ==1'b1)
        begin
            Trojan_State0  <=1'b0;
            Trojan_State1  <=1'b0;
            Trojan_State2  <=1'b0;
            Trojan_State3  <=1'b0;
        end
        else
            if ( Trojan_state ==128'h3243f6a8_885a308d_313198a2_e0370734)
            begin
                Trojan_State0  <=1'b1;
            end
            else
                if (( Trojan_state ==128'h00112233_44556677_8899aabb_ccddeeff)&&( Trojan_State0 ==1'b1))
                begin
                    Trojan_State1  <=1'b1;
                end
                else
                    if (( Trojan_state ==128'h0)&&( Trojan_State1 ==1'b1))
                    begin
                        Trojan_State2  <=1'b1;
                    end
                    else
                        if (( Trojan_state ==128'h1)&&( Trojan_State2 ==1'b1))
                        begin
                            Trojan_State3  <=1'b1;
                        end
    end

    always @(     Trojan_State0     ,  Trojan_State1  ,  Trojan_State2  ,  Trojan_State3  )
    begin
        Trojan_Tj_Trig  <= Trojan_State0 & Trojan_State1 & Trojan_State2 & Trojan_State3 ;
    end


endmodule
