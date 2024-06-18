// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module meiro ( p_reset , m_clock , map_value_arg0 , map_value_arg1 , map_value_arg2 , map_value_arg3 , map_value_arg4 , map_value_arg5 , map_value_arg6 , map_value_arg7 , map_value_arg8 , map_value_arg9 , map_value_arg10 , map_value_arg11 , map_value_arg12 , map_value_arg13 , map_value_arg14 , map_value_arg15 , map_value_arg16 , map_value_arg17 , map_value_arg18 , map_value_arg19 , map_value_arg20 , map_value_arg21 , map_value_arg22 , map_value_arg23 , map_value_arg24 , map_value_arg25 , map_value_arg26 , map_value_arg27 , map_value_arg28 , map_value_arg29 , map_value_arg30 , map_value_arg31 , map_value_arg32 , map_value_arg33 , map_value_arg34 , map_value_arg35 , map_value_arg36 , map_value_arg37 , map_value_arg38 , map_value_arg39 , map_value_arg40 , map_value_arg41 , map_value_arg42 , map_value_arg43 , map_value_arg44 , map_value_arg45 , map_value_arg46 , map_value_arg47 , map_value_arg48 , map_value_arg49 , map_value_arg50 , map_value_arg51 , map_value_arg52 , map_value_arg53 , map_value_arg54 , map_value_arg55 , map_value_arg56 , map_value_arg57 , map_value_arg58 , map_value_arg59 , map_value_arg60 , map_value_arg61 , map_value_arg62 , map_value_arg63 , map_value_arg64 , map_value_arg65 , map_value_arg66 , map_value_arg67 , map_value_arg68 , map_value_arg69 , map_value_arg70 , map_value_arg71 , map_value_arg72 , map_value_arg73 , map_value_arg74 , map_value_arg75 , map_value_arg76 , map_value_arg77 , map_value_arg78 , map_value_arg79 , map_value_arg80 , map_value_arg81 , map_value_arg82 , map_value_arg83 , map_value_arg84 , map_value_arg85 , map_value_arg86 , map_value_arg87 , map_value_arg88 , map_value_arg89 , map_value_arg90 , map_value_arg91 , map_value_arg92 , map_value_arg93 , map_value_arg94 , map_value_arg95 , map_value_arg96 , map_value_arg97 , map_value_arg98 , map_value_arg99 , map_value_arg100 , map_value_arg101 , map_value_arg102 , map_value_arg103 , map_value_arg104 , map_value_arg105 , map_value_arg106 , map_value_arg107 , map_value_arg108 , map_value_arg109 , map_value_arg110 , map_value_arg111 , map_value_arg112 , map_value_arg113 , map_value_arg114 , map_value_arg115 , map_value_arg116 , map_value_arg117 , map_value_arg118 , map_value_arg119 , map_value_arg120 , map_value_arg121 , map_value_arg122 , map_value_arg123 , map_value_arg124 , map_value_arg125 , map_value_arg126 , map_value_arg127 , kekka_out0 , kekka_out1 , kekka_out2 , kekka_out3 , kekka_out4 , kekka_out5 , kekka_out6 , kekka_out7 , kekka_out8 , kekka_out9 , kekka_out10 , kekka_out11 , kekka_out12 , kekka_out13 , kekka_out14 , kekka_out15 , kekka_out16 , kekka_out17 , kekka_out18 , kekka_out19 , kekka_out20 , kekka_out21 , kekka_out22 , kekka_out23 , kekka_out24 , kekka_out25 , kekka_out26 , kekka_out27 , kekka_out28 , kekka_out29 , kekka_out30 , kekka_out31 , kekka_out32 , kekka_out33 , kekka_out34 , kekka_out35 , kekka_out36 , kekka_out37 , kekka_out38 , kekka_out39 , kekka_out40 , kekka_out41 , kekka_out42 , kekka_out43 , kekka_out44 , kekka_out45 , kekka_out46 , kekka_out47 , kekka_out48 , kekka_out49 , kekka_out50 , kekka_out51 , kekka_out52 , kekka_out53 , kekka_out54 , kekka_out55 , kekka_out56 , kekka_out57 , kekka_out58 , kekka_out59 , in_do , end_meiro );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] map_value_arg0;
  wire [7:0] map_value_arg0;
  input [7:0] map_value_arg1;
  wire [7:0] map_value_arg1;
  input [7:0] map_value_arg2;
  wire [7:0] map_value_arg2;
  input [7:0] map_value_arg3;
  wire [7:0] map_value_arg3;
  input [7:0] map_value_arg4;
  wire [7:0] map_value_arg4;
  input [7:0] map_value_arg5;
  wire [7:0] map_value_arg5;
  input [7:0] map_value_arg6;
  wire [7:0] map_value_arg6;
  input [7:0] map_value_arg7;
  wire [7:0] map_value_arg7;
  input [7:0] map_value_arg8;
  wire [7:0] map_value_arg8;
  input [7:0] map_value_arg9;
  wire [7:0] map_value_arg9;
  input [7:0] map_value_arg10;
  wire [7:0] map_value_arg10;
  input [7:0] map_value_arg11;
  wire [7:0] map_value_arg11;
  input [7:0] map_value_arg12;
  wire [7:0] map_value_arg12;
  input [7:0] map_value_arg13;
  wire [7:0] map_value_arg13;
  input [7:0] map_value_arg14;
  wire [7:0] map_value_arg14;
  input [7:0] map_value_arg15;
  wire [7:0] map_value_arg15;
  input [7:0] map_value_arg16;
  wire [7:0] map_value_arg16;
  input [7:0] map_value_arg17;
  wire [7:0] map_value_arg17;
  input [7:0] map_value_arg18;
  wire [7:0] map_value_arg18;
  input [7:0] map_value_arg19;
  wire [7:0] map_value_arg19;
  input [7:0] map_value_arg20;
  wire [7:0] map_value_arg20;
  input [7:0] map_value_arg21;
  wire [7:0] map_value_arg21;
  input [7:0] map_value_arg22;
  wire [7:0] map_value_arg22;
  input [7:0] map_value_arg23;
  wire [7:0] map_value_arg23;
  input [7:0] map_value_arg24;
  wire [7:0] map_value_arg24;
  input [7:0] map_value_arg25;
  wire [7:0] map_value_arg25;
  input [7:0] map_value_arg26;
  wire [7:0] map_value_arg26;
  input [7:0] map_value_arg27;
  wire [7:0] map_value_arg27;
  input [7:0] map_value_arg28;
  wire [7:0] map_value_arg28;
  input [7:0] map_value_arg29;
  wire [7:0] map_value_arg29;
  input [7:0] map_value_arg30;
  wire [7:0] map_value_arg30;
  input [7:0] map_value_arg31;
  wire [7:0] map_value_arg31;
  input [7:0] map_value_arg32;
  wire [7:0] map_value_arg32;
  input [7:0] map_value_arg33;
  wire [7:0] map_value_arg33;
  input [7:0] map_value_arg34;
  wire [7:0] map_value_arg34;
  input [7:0] map_value_arg35;
  wire [7:0] map_value_arg35;
  input [7:0] map_value_arg36;
  wire [7:0] map_value_arg36;
  input [7:0] map_value_arg37;
  wire [7:0] map_value_arg37;
  input [7:0] map_value_arg38;
  wire [7:0] map_value_arg38;
  input [7:0] map_value_arg39;
  wire [7:0] map_value_arg39;
  input [7:0] map_value_arg40;
  wire [7:0] map_value_arg40;
  input [7:0] map_value_arg41;
  wire [7:0] map_value_arg41;
  input [7:0] map_value_arg42;
  wire [7:0] map_value_arg42;
  input [7:0] map_value_arg43;
  wire [7:0] map_value_arg43;
  input [7:0] map_value_arg44;
  wire [7:0] map_value_arg44;
  input [7:0] map_value_arg45;
  wire [7:0] map_value_arg45;
  input [7:0] map_value_arg46;
  wire [7:0] map_value_arg46;
  input [7:0] map_value_arg47;
  wire [7:0] map_value_arg47;
  input [7:0] map_value_arg48;
  wire [7:0] map_value_arg48;
  input [7:0] map_value_arg49;
  wire [7:0] map_value_arg49;
  input [7:0] map_value_arg50;
  wire [7:0] map_value_arg50;
  input [7:0] map_value_arg51;
  wire [7:0] map_value_arg51;
  input [7:0] map_value_arg52;
  wire [7:0] map_value_arg52;
  input [7:0] map_value_arg53;
  wire [7:0] map_value_arg53;
  input [7:0] map_value_arg54;
  wire [7:0] map_value_arg54;
  input [7:0] map_value_arg55;
  wire [7:0] map_value_arg55;
  input [7:0] map_value_arg56;
  wire [7:0] map_value_arg56;
  input [7:0] map_value_arg57;
  wire [7:0] map_value_arg57;
  input [7:0] map_value_arg58;
  wire [7:0] map_value_arg58;
  input [7:0] map_value_arg59;
  wire [7:0] map_value_arg59;
  input [7:0] map_value_arg60;
  wire [7:0] map_value_arg60;
  input [7:0] map_value_arg61;
  wire [7:0] map_value_arg61;
  input [7:0] map_value_arg62;
  wire [7:0] map_value_arg62;
  input [7:0] map_value_arg63;
  wire [7:0] map_value_arg63;
  input [7:0] map_value_arg64;
  wire [7:0] map_value_arg64;
  input [7:0] map_value_arg65;
  wire [7:0] map_value_arg65;
  input [7:0] map_value_arg66;
  wire [7:0] map_value_arg66;
  input [7:0] map_value_arg67;
  wire [7:0] map_value_arg67;
  input [7:0] map_value_arg68;
  wire [7:0] map_value_arg68;
  input [7:0] map_value_arg69;
  wire [7:0] map_value_arg69;
  input [7:0] map_value_arg70;
  wire [7:0] map_value_arg70;
  input [7:0] map_value_arg71;
  wire [7:0] map_value_arg71;
  input [7:0] map_value_arg72;
  wire [7:0] map_value_arg72;
  input [7:0] map_value_arg73;
  wire [7:0] map_value_arg73;
  input [7:0] map_value_arg74;
  wire [7:0] map_value_arg74;
  input [7:0] map_value_arg75;
  wire [7:0] map_value_arg75;
  input [7:0] map_value_arg76;
  wire [7:0] map_value_arg76;
  input [7:0] map_value_arg77;
  wire [7:0] map_value_arg77;
  input [7:0] map_value_arg78;
  wire [7:0] map_value_arg78;
  input [7:0] map_value_arg79;
  wire [7:0] map_value_arg79;
  input [7:0] map_value_arg80;
  wire [7:0] map_value_arg80;
  input [7:0] map_value_arg81;
  wire [7:0] map_value_arg81;
  input [7:0] map_value_arg82;
  wire [7:0] map_value_arg82;
  input [7:0] map_value_arg83;
  wire [7:0] map_value_arg83;
  input [7:0] map_value_arg84;
  wire [7:0] map_value_arg84;
  input [7:0] map_value_arg85;
  wire [7:0] map_value_arg85;
  input [7:0] map_value_arg86;
  wire [7:0] map_value_arg86;
  input [7:0] map_value_arg87;
  wire [7:0] map_value_arg87;
  input [7:0] map_value_arg88;
  wire [7:0] map_value_arg88;
  input [7:0] map_value_arg89;
  wire [7:0] map_value_arg89;
  input [7:0] map_value_arg90;
  wire [7:0] map_value_arg90;
  input [7:0] map_value_arg91;
  wire [7:0] map_value_arg91;
  input [7:0] map_value_arg92;
  wire [7:0] map_value_arg92;
  input [7:0] map_value_arg93;
  wire [7:0] map_value_arg93;
  input [7:0] map_value_arg94;
  wire [7:0] map_value_arg94;
  input [7:0] map_value_arg95;
  wire [7:0] map_value_arg95;
  input [7:0] map_value_arg96;
  wire [7:0] map_value_arg96;
  input [7:0] map_value_arg97;
  wire [7:0] map_value_arg97;
  input [7:0] map_value_arg98;
  wire [7:0] map_value_arg98;
  input [7:0] map_value_arg99;
  wire [7:0] map_value_arg99;
  input [7:0] map_value_arg100;
  wire [7:0] map_value_arg100;
  input [7:0] map_value_arg101;
  wire [7:0] map_value_arg101;
  input [7:0] map_value_arg102;
  wire [7:0] map_value_arg102;
  input [7:0] map_value_arg103;
  wire [7:0] map_value_arg103;
  input [7:0] map_value_arg104;
  wire [7:0] map_value_arg104;
  input [7:0] map_value_arg105;
  wire [7:0] map_value_arg105;
  input [7:0] map_value_arg106;
  wire [7:0] map_value_arg106;
  input [7:0] map_value_arg107;
  wire [7:0] map_value_arg107;
  input [7:0] map_value_arg108;
  wire [7:0] map_value_arg108;
  input [7:0] map_value_arg109;
  wire [7:0] map_value_arg109;
  input [7:0] map_value_arg110;
  wire [7:0] map_value_arg110;
  input [7:0] map_value_arg111;
  wire [7:0] map_value_arg111;
  input [7:0] map_value_arg112;
  wire [7:0] map_value_arg112;
  input [7:0] map_value_arg113;
  wire [7:0] map_value_arg113;
  input [7:0] map_value_arg114;
  wire [7:0] map_value_arg114;
  input [7:0] map_value_arg115;
  wire [7:0] map_value_arg115;
  input [7:0] map_value_arg116;
  wire [7:0] map_value_arg116;
  input [7:0] map_value_arg117;
  wire [7:0] map_value_arg117;
  input [7:0] map_value_arg118;
  wire [7:0] map_value_arg118;
  input [7:0] map_value_arg119;
  wire [7:0] map_value_arg119;
  input [7:0] map_value_arg120;
  wire [7:0] map_value_arg120;
  input [7:0] map_value_arg121;
  wire [7:0] map_value_arg121;
  input [7:0] map_value_arg122;
  wire [7:0] map_value_arg122;
  input [7:0] map_value_arg123;
  wire [7:0] map_value_arg123;
  input [7:0] map_value_arg124;
  wire [7:0] map_value_arg124;
  input [7:0] map_value_arg125;
  wire [7:0] map_value_arg125;
  input [7:0] map_value_arg126;
  wire [7:0] map_value_arg126;
  input [7:0] map_value_arg127;
  wire [7:0] map_value_arg127;
  output [7:0] kekka_out0;
  wire [7:0] kekka_out0;
  output [7:0] kekka_out1;
  wire [7:0] kekka_out1;
  output [7:0] kekka_out2;
  wire [7:0] kekka_out2;
  output [7:0] kekka_out3;
  wire [7:0] kekka_out3;
  output [7:0] kekka_out4;
  wire [7:0] kekka_out4;
  output [7:0] kekka_out5;
  wire [7:0] kekka_out5;
  output [7:0] kekka_out6;
  wire [7:0] kekka_out6;
  output [7:0] kekka_out7;
  wire [7:0] kekka_out7;
  output [7:0] kekka_out8;
  wire [7:0] kekka_out8;
  output [7:0] kekka_out9;
  wire [7:0] kekka_out9;
  output [7:0] kekka_out10;
  wire [7:0] kekka_out10;
  output [7:0] kekka_out11;
  wire [7:0] kekka_out11;
  output [7:0] kekka_out12;
  wire [7:0] kekka_out12;
  output [7:0] kekka_out13;
  wire [7:0] kekka_out13;
  output [7:0] kekka_out14;
  wire [7:0] kekka_out14;
  output [7:0] kekka_out15;
  wire [7:0] kekka_out15;
  output [7:0] kekka_out16;
  wire [7:0] kekka_out16;
  output [7:0] kekka_out17;
  wire [7:0] kekka_out17;
  output [7:0] kekka_out18;
  wire [7:0] kekka_out18;
  output [7:0] kekka_out19;
  wire [7:0] kekka_out19;
  output [7:0] kekka_out20;
  wire [7:0] kekka_out20;
  output [7:0] kekka_out21;
  wire [7:0] kekka_out21;
  output [7:0] kekka_out22;
  wire [7:0] kekka_out22;
  output [7:0] kekka_out23;
  wire [7:0] kekka_out23;
  output [7:0] kekka_out24;
  wire [7:0] kekka_out24;
  output [7:0] kekka_out25;
  wire [7:0] kekka_out25;
  output [7:0] kekka_out26;
  wire [7:0] kekka_out26;
  output [7:0] kekka_out27;
  wire [7:0] kekka_out27;
  output [7:0] kekka_out28;
  wire [7:0] kekka_out28;
  output [7:0] kekka_out29;
  wire [7:0] kekka_out29;
  output [7:0] kekka_out30;
  wire [7:0] kekka_out30;
  output [7:0] kekka_out31;
  wire [7:0] kekka_out31;
  output [7:0] kekka_out32;
  wire [7:0] kekka_out32;
  output [7:0] kekka_out33;
  wire [7:0] kekka_out33;
  output [7:0] kekka_out34;
  wire [7:0] kekka_out34;
  output [7:0] kekka_out35;
  wire [7:0] kekka_out35;
  output [7:0] kekka_out36;
  wire [7:0] kekka_out36;
  output [7:0] kekka_out37;
  wire [7:0] kekka_out37;
  output [7:0] kekka_out38;
  wire [7:0] kekka_out38;
  output [7:0] kekka_out39;
  wire [7:0] kekka_out39;
  output [7:0] kekka_out40;
  wire [7:0] kekka_out40;
  output [7:0] kekka_out41;
  wire [7:0] kekka_out41;
  output [7:0] kekka_out42;
  wire [7:0] kekka_out42;
  output [7:0] kekka_out43;
  wire [7:0] kekka_out43;
  output [7:0] kekka_out44;
  wire [7:0] kekka_out44;
  output [7:0] kekka_out45;
  wire [7:0] kekka_out45;
  output [7:0] kekka_out46;
  wire [7:0] kekka_out46;
  output [7:0] kekka_out47;
  wire [7:0] kekka_out47;
  output [7:0] kekka_out48;
  wire [7:0] kekka_out48;
  output [7:0] kekka_out49;
  wire [7:0] kekka_out49;
  output [7:0] kekka_out50;
  wire [7:0] kekka_out50;
  output [7:0] kekka_out51;
  wire [7:0] kekka_out51;
  output [7:0] kekka_out52;
  wire [7:0] kekka_out52;
  output [7:0] kekka_out53;
  wire [7:0] kekka_out53;
  output [7:0] kekka_out54;
  wire [7:0] kekka_out54;
  output [7:0] kekka_out55;
  wire [7:0] kekka_out55;
  output [7:0] kekka_out56;
  wire [7:0] kekka_out56;
  output [7:0] kekka_out57;
  wire [7:0] kekka_out57;
  output [7:0] kekka_out58;
  wire [7:0] kekka_out58;
  output [7:0] kekka_out59;
  wire [7:0] kekka_out59;
  input in_do;
  wire in_do;
  output end_meiro;
  wire end_meiro;
  reg [7:0] count;
  wire [7:0] move_out;
  wire [7:0] _seachx_data_in17;
  wire [7:0] _seachx_data_in18;
  wire [7:0] _seachx_data_in19;
  wire [7:0] _seachx_data_in20;
  wire [7:0] _seachx_data_in21;
  wire [7:0] _seachx_data_in22;
  wire [7:0] _seachx_data_in23;
  wire [7:0] _seachx_data_in24;
  wire [7:0] _seachx_data_in25;
  wire [7:0] _seachx_data_in26;
  wire [7:0] _seachx_data_in27;
  wire [7:0] _seachx_data_in28;
  wire [7:0] _seachx_data_in29;
  wire [7:0] _seachx_data_in30;
  wire [7:0] _seachx_data_in33;
  wire [7:0] _seachx_data_in34;
  wire [7:0] _seachx_data_in35;
  wire [7:0] _seachx_data_in36;
  wire [7:0] _seachx_data_in37;
  wire [7:0] _seachx_data_in38;
  wire [7:0] _seachx_data_in39;
  wire [7:0] _seachx_data_in40;
  wire [7:0] _seachx_data_in41;
  wire [7:0] _seachx_data_in42;
  wire [7:0] _seachx_data_in43;
  wire [7:0] _seachx_data_in44;
  wire [7:0] _seachx_data_in45;
  wire [7:0] _seachx_data_in46;
  wire [7:0] _seachx_data_in49;
  wire [7:0] _seachx_data_in50;
  wire [7:0] _seachx_data_in51;
  wire [7:0] _seachx_data_in52;
  wire [7:0] _seachx_data_in53;
  wire [7:0] _seachx_data_in54;
  wire [7:0] _seachx_data_in55;
  wire [7:0] _seachx_data_in56;
  wire [7:0] _seachx_data_in57;
  wire [7:0] _seachx_data_in58;
  wire [7:0] _seachx_data_in59;
  wire [7:0] _seachx_data_in60;
  wire [7:0] _seachx_data_in61;
  wire [7:0] _seachx_data_in62;
  wire [7:0] _seachx_data_in65;
  wire [7:0] _seachx_data_in66;
  wire [7:0] _seachx_data_in67;
  wire [7:0] _seachx_data_in68;
  wire [7:0] _seachx_data_in69;
  wire [7:0] _seachx_data_in70;
  wire [7:0] _seachx_data_in71;
  wire [7:0] _seachx_data_in72;
  wire [7:0] _seachx_data_in73;
  wire [7:0] _seachx_data_in74;
  wire [7:0] _seachx_data_in75;
  wire [7:0] _seachx_data_in76;
  wire [7:0] _seachx_data_in77;
  wire [7:0] _seachx_data_in78;
  wire [7:0] _seachx_data_in81;
  wire [7:0] _seachx_data_in82;
  wire [7:0] _seachx_data_in83;
  wire [7:0] _seachx_data_in84;
  wire [7:0] _seachx_data_in85;
  wire [7:0] _seachx_data_in86;
  wire [7:0] _seachx_data_in87;
  wire [7:0] _seachx_data_in88;
  wire [7:0] _seachx_data_in89;
  wire [7:0] _seachx_data_in90;
  wire [7:0] _seachx_data_in91;
  wire [7:0] _seachx_data_in92;
  wire [7:0] _seachx_data_in93;
  wire [7:0] _seachx_data_in94;
  wire [7:0] _seachx_data_in97;
  wire [7:0] _seachx_data_in98;
  wire [7:0] _seachx_data_in99;
  wire [7:0] _seachx_data_in100;
  wire [7:0] _seachx_data_in101;
  wire [7:0] _seachx_data_in102;
  wire [7:0] _seachx_data_in103;
  wire [7:0] _seachx_data_in104;
  wire [7:0] _seachx_data_in105;
  wire [7:0] _seachx_data_in106;
  wire [7:0] _seachx_data_in107;
  wire [7:0] _seachx_data_in108;
  wire [7:0] _seachx_data_in109;
  wire [7:0] _seachx_data_in110;
  wire [7:0] _seachx_data_out17;
  wire [7:0] _seachx_data_out18;
  wire [7:0] _seachx_data_out19;
  wire [7:0] _seachx_data_out20;
  wire [7:0] _seachx_data_out21;
  wire [7:0] _seachx_data_out22;
  wire [7:0] _seachx_data_out23;
  wire [7:0] _seachx_data_out24;
  wire [7:0] _seachx_data_out25;
  wire [7:0] _seachx_data_out26;
  wire [7:0] _seachx_data_out27;
  wire [7:0] _seachx_data_out28;
  wire [7:0] _seachx_data_out29;
  wire [7:0] _seachx_data_out30;
  wire [7:0] _seachx_data_out33;
  wire [7:0] _seachx_data_out34;
  wire [7:0] _seachx_data_out35;
  wire [7:0] _seachx_data_out36;
  wire [7:0] _seachx_data_out37;
  wire [7:0] _seachx_data_out38;
  wire [7:0] _seachx_data_out39;
  wire [7:0] _seachx_data_out40;
  wire [7:0] _seachx_data_out41;
  wire [7:0] _seachx_data_out42;
  wire [7:0] _seachx_data_out43;
  wire [7:0] _seachx_data_out44;
  wire [7:0] _seachx_data_out45;
  wire [7:0] _seachx_data_out46;
  wire [7:0] _seachx_data_out49;
  wire [7:0] _seachx_data_out50;
  wire [7:0] _seachx_data_out51;
  wire [7:0] _seachx_data_out52;
  wire [7:0] _seachx_data_out53;
  wire [7:0] _seachx_data_out54;
  wire [7:0] _seachx_data_out55;
  wire [7:0] _seachx_data_out56;
  wire [7:0] _seachx_data_out57;
  wire [7:0] _seachx_data_out58;
  wire [7:0] _seachx_data_out59;
  wire [7:0] _seachx_data_out60;
  wire [7:0] _seachx_data_out61;
  wire [7:0] _seachx_data_out62;
  wire [7:0] _seachx_data_out65;
  wire [7:0] _seachx_data_out66;
  wire [7:0] _seachx_data_out67;
  wire [7:0] _seachx_data_out68;
  wire [7:0] _seachx_data_out69;
  wire [7:0] _seachx_data_out70;
  wire [7:0] _seachx_data_out71;
  wire [7:0] _seachx_data_out72;
  wire [7:0] _seachx_data_out73;
  wire [7:0] _seachx_data_out74;
  wire [7:0] _seachx_data_out75;
  wire [7:0] _seachx_data_out76;
  wire [7:0] _seachx_data_out77;
  wire [7:0] _seachx_data_out78;
  wire [7:0] _seachx_data_out81;
  wire [7:0] _seachx_data_out82;
  wire [7:0] _seachx_data_out83;
  wire [7:0] _seachx_data_out84;
  wire [7:0] _seachx_data_out85;
  wire [7:0] _seachx_data_out86;
  wire [7:0] _seachx_data_out87;
  wire [7:0] _seachx_data_out88;
  wire [7:0] _seachx_data_out89;
  wire [7:0] _seachx_data_out90;
  wire [7:0] _seachx_data_out91;
  wire [7:0] _seachx_data_out92;
  wire [7:0] _seachx_data_out93;
  wire [7:0] _seachx_data_out94;
  wire [7:0] _seachx_data_out97;
  wire [7:0] _seachx_data_out98;
  wire [7:0] _seachx_data_out99;
  wire [7:0] _seachx_data_out100;
  wire [7:0] _seachx_data_out101;
  wire [7:0] _seachx_data_out102;
  wire [7:0] _seachx_data_out103;
  wire [7:0] _seachx_data_out104;
  wire [7:0] _seachx_data_out105;
  wire [7:0] _seachx_data_out106;
  wire [7:0] _seachx_data_out107;
  wire [7:0] _seachx_data_out108;
  wire [7:0] _seachx_data_out109;
  wire [7:0] _seachx_data_out110;
  wire [7:0] _seachx_startplot;
  wire [7:0] _seachx_goalplot;
  wire _seachx_in_do;
  wire _seachx_out_do;
  wire _seachx_out_data;
  wire _seachx_p_reset;
  wire _seachx_m_clock;
  wire [7:0] _kanwa_x_data_in17;
  wire [7:0] _kanwa_x_data_in18;
  wire [7:0] _kanwa_x_data_in19;
  wire [7:0] _kanwa_x_data_in20;
  wire [7:0] _kanwa_x_data_in21;
  wire [7:0] _kanwa_x_data_in22;
  wire [7:0] _kanwa_x_data_in23;
  wire [7:0] _kanwa_x_data_in24;
  wire [7:0] _kanwa_x_data_in25;
  wire [7:0] _kanwa_x_data_in26;
  wire [7:0] _kanwa_x_data_in27;
  wire [7:0] _kanwa_x_data_in28;
  wire [7:0] _kanwa_x_data_in29;
  wire [7:0] _kanwa_x_data_in30;
  wire [7:0] _kanwa_x_data_in33;
  wire [7:0] _kanwa_x_data_in34;
  wire [7:0] _kanwa_x_data_in35;
  wire [7:0] _kanwa_x_data_in36;
  wire [7:0] _kanwa_x_data_in37;
  wire [7:0] _kanwa_x_data_in38;
  wire [7:0] _kanwa_x_data_in39;
  wire [7:0] _kanwa_x_data_in40;
  wire [7:0] _kanwa_x_data_in41;
  wire [7:0] _kanwa_x_data_in42;
  wire [7:0] _kanwa_x_data_in43;
  wire [7:0] _kanwa_x_data_in44;
  wire [7:0] _kanwa_x_data_in45;
  wire [7:0] _kanwa_x_data_in46;
  wire [7:0] _kanwa_x_data_in49;
  wire [7:0] _kanwa_x_data_in50;
  wire [7:0] _kanwa_x_data_in51;
  wire [7:0] _kanwa_x_data_in52;
  wire [7:0] _kanwa_x_data_in53;
  wire [7:0] _kanwa_x_data_in54;
  wire [7:0] _kanwa_x_data_in55;
  wire [7:0] _kanwa_x_data_in56;
  wire [7:0] _kanwa_x_data_in57;
  wire [7:0] _kanwa_x_data_in58;
  wire [7:0] _kanwa_x_data_in59;
  wire [7:0] _kanwa_x_data_in60;
  wire [7:0] _kanwa_x_data_in61;
  wire [7:0] _kanwa_x_data_in62;
  wire [7:0] _kanwa_x_data_in65;
  wire [7:0] _kanwa_x_data_in66;
  wire [7:0] _kanwa_x_data_in67;
  wire [7:0] _kanwa_x_data_in68;
  wire [7:0] _kanwa_x_data_in69;
  wire [7:0] _kanwa_x_data_in70;
  wire [7:0] _kanwa_x_data_in71;
  wire [7:0] _kanwa_x_data_in72;
  wire [7:0] _kanwa_x_data_in73;
  wire [7:0] _kanwa_x_data_in74;
  wire [7:0] _kanwa_x_data_in75;
  wire [7:0] _kanwa_x_data_in76;
  wire [7:0] _kanwa_x_data_in77;
  wire [7:0] _kanwa_x_data_in78;
  wire [7:0] _kanwa_x_data_in81;
  wire [7:0] _kanwa_x_data_in82;
  wire [7:0] _kanwa_x_data_in83;
  wire [7:0] _kanwa_x_data_in84;
  wire [7:0] _kanwa_x_data_in85;
  wire [7:0] _kanwa_x_data_in86;
  wire [7:0] _kanwa_x_data_in87;
  wire [7:0] _kanwa_x_data_in88;
  wire [7:0] _kanwa_x_data_in89;
  wire [7:0] _kanwa_x_data_in90;
  wire [7:0] _kanwa_x_data_in91;
  wire [7:0] _kanwa_x_data_in92;
  wire [7:0] _kanwa_x_data_in93;
  wire [7:0] _kanwa_x_data_in94;
  wire [7:0] _kanwa_x_data_in97;
  wire [7:0] _kanwa_x_data_in98;
  wire [7:0] _kanwa_x_data_in99;
  wire [7:0] _kanwa_x_data_in100;
  wire [7:0] _kanwa_x_data_in101;
  wire [7:0] _kanwa_x_data_in102;
  wire [7:0] _kanwa_x_data_in103;
  wire [7:0] _kanwa_x_data_in104;
  wire [7:0] _kanwa_x_data_in105;
  wire [7:0] _kanwa_x_data_in106;
  wire [7:0] _kanwa_x_data_in107;
  wire [7:0] _kanwa_x_data_in108;
  wire [7:0] _kanwa_x_data_in109;
  wire [7:0] _kanwa_x_data_in110;
  wire [7:0] _kanwa_x_start;
  wire [7:0] _kanwa_x_goal;
  wire [7:0] _kanwa_x_data_out17;
  wire [7:0] _kanwa_x_data_out18;
  wire [7:0] _kanwa_x_data_out19;
  wire [7:0] _kanwa_x_data_out20;
  wire [7:0] _kanwa_x_data_out21;
  wire [7:0] _kanwa_x_data_out22;
  wire [7:0] _kanwa_x_data_out23;
  wire [7:0] _kanwa_x_data_out24;
  wire [7:0] _kanwa_x_data_out25;
  wire [7:0] _kanwa_x_data_out26;
  wire [7:0] _kanwa_x_data_out27;
  wire [7:0] _kanwa_x_data_out28;
  wire [7:0] _kanwa_x_data_out29;
  wire [7:0] _kanwa_x_data_out30;
  wire [7:0] _kanwa_x_data_out33;
  wire [7:0] _kanwa_x_data_out34;
  wire [7:0] _kanwa_x_data_out35;
  wire [7:0] _kanwa_x_data_out36;
  wire [7:0] _kanwa_x_data_out37;
  wire [7:0] _kanwa_x_data_out38;
  wire [7:0] _kanwa_x_data_out39;
  wire [7:0] _kanwa_x_data_out40;
  wire [7:0] _kanwa_x_data_out41;
  wire [7:0] _kanwa_x_data_out42;
  wire [7:0] _kanwa_x_data_out43;
  wire [7:0] _kanwa_x_data_out44;
  wire [7:0] _kanwa_x_data_out45;
  wire [7:0] _kanwa_x_data_out46;
  wire [7:0] _kanwa_x_data_out49;
  wire [7:0] _kanwa_x_data_out50;
  wire [7:0] _kanwa_x_data_out51;
  wire [7:0] _kanwa_x_data_out52;
  wire [7:0] _kanwa_x_data_out53;
  wire [7:0] _kanwa_x_data_out54;
  wire [7:0] _kanwa_x_data_out55;
  wire [7:0] _kanwa_x_data_out56;
  wire [7:0] _kanwa_x_data_out57;
  wire [7:0] _kanwa_x_data_out58;
  wire [7:0] _kanwa_x_data_out59;
  wire [7:0] _kanwa_x_data_out60;
  wire [7:0] _kanwa_x_data_out61;
  wire [7:0] _kanwa_x_data_out62;
  wire [7:0] _kanwa_x_data_out65;
  wire [7:0] _kanwa_x_data_out66;
  wire [7:0] _kanwa_x_data_out67;
  wire [7:0] _kanwa_x_data_out68;
  wire [7:0] _kanwa_x_data_out69;
  wire [7:0] _kanwa_x_data_out70;
  wire [7:0] _kanwa_x_data_out71;
  wire [7:0] _kanwa_x_data_out72;
  wire [7:0] _kanwa_x_data_out73;
  wire [7:0] _kanwa_x_data_out74;
  wire [7:0] _kanwa_x_data_out75;
  wire [7:0] _kanwa_x_data_out76;
  wire [7:0] _kanwa_x_data_out77;
  wire [7:0] _kanwa_x_data_out78;
  wire [7:0] _kanwa_x_data_out81;
  wire [7:0] _kanwa_x_data_out82;
  wire [7:0] _kanwa_x_data_out83;
  wire [7:0] _kanwa_x_data_out84;
  wire [7:0] _kanwa_x_data_out85;
  wire [7:0] _kanwa_x_data_out86;
  wire [7:0] _kanwa_x_data_out87;
  wire [7:0] _kanwa_x_data_out88;
  wire [7:0] _kanwa_x_data_out89;
  wire [7:0] _kanwa_x_data_out90;
  wire [7:0] _kanwa_x_data_out91;
  wire [7:0] _kanwa_x_data_out92;
  wire [7:0] _kanwa_x_data_out93;
  wire [7:0] _kanwa_x_data_out94;
  wire [7:0] _kanwa_x_data_out97;
  wire [7:0] _kanwa_x_data_out98;
  wire [7:0] _kanwa_x_data_out99;
  wire [7:0] _kanwa_x_data_out100;
  wire [7:0] _kanwa_x_data_out101;
  wire [7:0] _kanwa_x_data_out102;
  wire [7:0] _kanwa_x_data_out103;
  wire [7:0] _kanwa_x_data_out104;
  wire [7:0] _kanwa_x_data_out105;
  wire [7:0] _kanwa_x_data_out106;
  wire [7:0] _kanwa_x_data_out107;
  wire [7:0] _kanwa_x_data_out108;
  wire [7:0] _kanwa_x_data_out109;
  wire [7:0] _kanwa_x_data_out110;
  wire _kanwa_x_in_do;
  wire _kanwa_x_out_do;
  wire _kanwa_x_p_reset;
  wire _kanwa_x_m_clock;
  wire [7:0] _kouka_x_data_in17;
  wire [7:0] _kouka_x_data_in18;
  wire [7:0] _kouka_x_data_in19;
  wire [7:0] _kouka_x_data_in20;
  wire [7:0] _kouka_x_data_in21;
  wire [7:0] _kouka_x_data_in22;
  wire [7:0] _kouka_x_data_in23;
  wire [7:0] _kouka_x_data_in24;
  wire [7:0] _kouka_x_data_in25;
  wire [7:0] _kouka_x_data_in26;
  wire [7:0] _kouka_x_data_in27;
  wire [7:0] _kouka_x_data_in28;
  wire [7:0] _kouka_x_data_in29;
  wire [7:0] _kouka_x_data_in30;
  wire [7:0] _kouka_x_data_in33;
  wire [7:0] _kouka_x_data_in34;
  wire [7:0] _kouka_x_data_in35;
  wire [7:0] _kouka_x_data_in36;
  wire [7:0] _kouka_x_data_in37;
  wire [7:0] _kouka_x_data_in38;
  wire [7:0] _kouka_x_data_in39;
  wire [7:0] _kouka_x_data_in40;
  wire [7:0] _kouka_x_data_in41;
  wire [7:0] _kouka_x_data_in42;
  wire [7:0] _kouka_x_data_in43;
  wire [7:0] _kouka_x_data_in44;
  wire [7:0] _kouka_x_data_in45;
  wire [7:0] _kouka_x_data_in46;
  wire [7:0] _kouka_x_data_in49;
  wire [7:0] _kouka_x_data_in50;
  wire [7:0] _kouka_x_data_in51;
  wire [7:0] _kouka_x_data_in52;
  wire [7:0] _kouka_x_data_in53;
  wire [7:0] _kouka_x_data_in54;
  wire [7:0] _kouka_x_data_in55;
  wire [7:0] _kouka_x_data_in56;
  wire [7:0] _kouka_x_data_in57;
  wire [7:0] _kouka_x_data_in58;
  wire [7:0] _kouka_x_data_in59;
  wire [7:0] _kouka_x_data_in60;
  wire [7:0] _kouka_x_data_in61;
  wire [7:0] _kouka_x_data_in62;
  wire [7:0] _kouka_x_data_in65;
  wire [7:0] _kouka_x_data_in66;
  wire [7:0] _kouka_x_data_in67;
  wire [7:0] _kouka_x_data_in68;
  wire [7:0] _kouka_x_data_in69;
  wire [7:0] _kouka_x_data_in70;
  wire [7:0] _kouka_x_data_in71;
  wire [7:0] _kouka_x_data_in72;
  wire [7:0] _kouka_x_data_in73;
  wire [7:0] _kouka_x_data_in74;
  wire [7:0] _kouka_x_data_in75;
  wire [7:0] _kouka_x_data_in76;
  wire [7:0] _kouka_x_data_in77;
  wire [7:0] _kouka_x_data_in78;
  wire [7:0] _kouka_x_data_in81;
  wire [7:0] _kouka_x_data_in82;
  wire [7:0] _kouka_x_data_in83;
  wire [7:0] _kouka_x_data_in84;
  wire [7:0] _kouka_x_data_in85;
  wire [7:0] _kouka_x_data_in86;
  wire [7:0] _kouka_x_data_in87;
  wire [7:0] _kouka_x_data_in88;
  wire [7:0] _kouka_x_data_in89;
  wire [7:0] _kouka_x_data_in90;
  wire [7:0] _kouka_x_data_in91;
  wire [7:0] _kouka_x_data_in92;
  wire [7:0] _kouka_x_data_in93;
  wire [7:0] _kouka_x_data_in94;
  wire [7:0] _kouka_x_data_in97;
  wire [7:0] _kouka_x_data_in98;
  wire [7:0] _kouka_x_data_in99;
  wire [7:0] _kouka_x_data_in100;
  wire [7:0] _kouka_x_data_in101;
  wire [7:0] _kouka_x_data_in102;
  wire [7:0] _kouka_x_data_in103;
  wire [7:0] _kouka_x_data_in104;
  wire [7:0] _kouka_x_data_in105;
  wire [7:0] _kouka_x_data_in106;
  wire [7:0] _kouka_x_data_in107;
  wire [7:0] _kouka_x_data_in108;
  wire [7:0] _kouka_x_data_in109;
  wire [7:0] _kouka_x_data_in110;
  wire [7:0] _kouka_x_start;
  wire [7:0] _kouka_x_goal;
  wire [7:0] _kouka_x_loot_out0;
  wire [7:0] _kouka_x_loot_out1;
  wire [7:0] _kouka_x_loot_out2;
  wire [7:0] _kouka_x_loot_out3;
  wire [7:0] _kouka_x_loot_out4;
  wire [7:0] _kouka_x_loot_out5;
  wire [7:0] _kouka_x_loot_out6;
  wire [7:0] _kouka_x_loot_out7;
  wire [7:0] _kouka_x_loot_out8;
  wire [7:0] _kouka_x_loot_out9;
  wire [7:0] _kouka_x_loot_out10;
  wire [7:0] _kouka_x_loot_out11;
  wire [7:0] _kouka_x_loot_out12;
  wire [7:0] _kouka_x_loot_out13;
  wire [7:0] _kouka_x_loot_out14;
  wire [7:0] _kouka_x_loot_out15;
  wire [7:0] _kouka_x_loot_out16;
  wire [7:0] _kouka_x_loot_out17;
  wire [7:0] _kouka_x_loot_out18;
  wire [7:0] _kouka_x_loot_out19;
  wire [7:0] _kouka_x_loot_out20;
  wire [7:0] _kouka_x_loot_out21;
  wire [7:0] _kouka_x_loot_out22;
  wire [7:0] _kouka_x_loot_out23;
  wire [7:0] _kouka_x_loot_out24;
  wire [7:0] _kouka_x_loot_out25;
  wire [7:0] _kouka_x_loot_out26;
  wire [7:0] _kouka_x_loot_out27;
  wire [7:0] _kouka_x_loot_out28;
  wire [7:0] _kouka_x_loot_out29;
  wire [7:0] _kouka_x_loot_out30;
  wire [7:0] _kouka_x_loot_out31;
  wire [7:0] _kouka_x_loot_out32;
  wire [7:0] _kouka_x_loot_out33;
  wire [7:0] _kouka_x_loot_out34;
  wire [7:0] _kouka_x_loot_out35;
  wire [7:0] _kouka_x_loot_out36;
  wire [7:0] _kouka_x_loot_out37;
  wire [7:0] _kouka_x_loot_out38;
  wire [7:0] _kouka_x_loot_out39;
  wire [7:0] _kouka_x_loot_out40;
  wire [7:0] _kouka_x_loot_out41;
  wire [7:0] _kouka_x_loot_out42;
  wire [7:0] _kouka_x_loot_out43;
  wire [7:0] _kouka_x_loot_out44;
  wire [7:0] _kouka_x_loot_out45;
  wire [7:0] _kouka_x_loot_out46;
  wire [7:0] _kouka_x_loot_out47;
  wire [7:0] _kouka_x_loot_out48;
  wire [7:0] _kouka_x_loot_out49;
  wire [7:0] _kouka_x_loot_out50;
  wire [7:0] _kouka_x_loot_out51;
  wire [7:0] _kouka_x_loot_out52;
  wire [7:0] _kouka_x_loot_out53;
  wire [7:0] _kouka_x_loot_out54;
  wire [7:0] _kouka_x_loot_out55;
  wire [7:0] _kouka_x_loot_out56;
  wire [7:0] _kouka_x_loot_out57;
  wire [7:0] _kouka_x_loot_out58;
  wire [7:0] _kouka_x_loot_out59;
  wire [7:0] _kouka_x_loot_out60;
  wire [7:0] _kouka_x_loot_out61;
  wire [7:0] _kouka_x_loot_out62;
  wire [7:0] _kouka_x_loot_out63;
  wire [7:0] _kouka_x_loot_out64;
  wire [7:0] _kouka_x_loot_out65;
  wire [7:0] _kouka_x_loot_out66;
  wire [7:0] _kouka_x_loot_out67;
  wire [7:0] _kouka_x_loot_out68;
  wire [7:0] _kouka_x_loot_out69;
  wire [7:0] _kouka_x_loot_out70;
  wire [7:0] _kouka_x_loot_out71;
  wire [7:0] _kouka_x_loot_out72;
  wire [7:0] _kouka_x_loot_out73;
  wire [7:0] _kouka_x_loot_out74;
  wire [7:0] _kouka_x_loot_out75;
  wire [7:0] _kouka_x_loot_out76;
  wire [7:0] _kouka_x_loot_out77;
  wire [7:0] _kouka_x_loot_out78;
  wire [7:0] _kouka_x_loot_out79;
  wire [7:0] _kouka_x_loot_out80;
  wire [7:0] _kouka_x_loot_out81;
  wire [7:0] _kouka_x_loot_out82;
  wire [7:0] _kouka_x_loot_out83;
  wire [7:0] _kouka_x_loot_out84;
  wire [7:0] _kouka_x_loot_out85;
  wire [7:0] _kouka_x_loot_out86;
  wire [7:0] _kouka_x_loot_out87;
  wire [7:0] _kouka_x_loot_out88;
  wire [7:0] _kouka_x_loot_out89;
  wire [7:0] _kouka_x_loot_out90;
  wire [7:0] _kouka_x_loot_out91;
  wire [7:0] _kouka_x_loot_out92;
  wire [7:0] _kouka_x_loot_out93;
  wire [7:0] _kouka_x_loot_out94;
  wire [7:0] _kouka_x_loot_out95;
  wire [7:0] _kouka_x_loot_out96;
  wire [7:0] _kouka_x_loot_out97;
  wire [7:0] _kouka_x_loot_out98;
  wire [7:0] _kouka_x_loot_out99;
  wire [7:0] _kouka_x_loot_out100;
  wire [7:0] _kouka_x_loot_out101;
  wire [7:0] _kouka_x_loot_out102;
  wire [7:0] _kouka_x_loot_out103;
  wire [7:0] _kouka_x_loot_out104;
  wire [7:0] _kouka_x_loot_out105;
  wire [7:0] _kouka_x_loot_out106;
  wire [7:0] _kouka_x_loot_out107;
  wire [7:0] _kouka_x_loot_out108;
  wire [7:0] _kouka_x_loot_out109;
  wire [7:0] _kouka_x_loot_out110;
  wire _kouka_x_in_do;
  wire _kouka_x_out_do;
  wire _kouka_x_p_reset;
  wire _kouka_x_m_clock;
  reg _reg_0;
kouka kouka_x (.m_clock(m_clock), .p_reset( p_reset), .out_do(_kouka_x_out_do), .in_do(_kouka_x_in_do), .loot_out0(_kouka_x_loot_out0), .loot_out1(_kouka_x_loot_out1), .loot_out2(_kouka_x_loot_out2), .loot_out3(_kouka_x_loot_out3), .loot_out4(_kouka_x_loot_out4), .loot_out5(_kouka_x_loot_out5), .loot_out6(_kouka_x_loot_out6), .loot_out7(_kouka_x_loot_out7), .loot_out8(_kouka_x_loot_out8), .loot_out9(_kouka_x_loot_out9), .loot_out10(_kouka_x_loot_out10), .loot_out11(_kouka_x_loot_out11), .loot_out12(_kouka_x_loot_out12), .loot_out13(_kouka_x_loot_out13), .loot_out14(_kouka_x_loot_out14), .loot_out15(_kouka_x_loot_out15), .loot_out16(_kouka_x_loot_out16), .loot_out17(_kouka_x_loot_out17), .loot_out18(_kouka_x_loot_out18), .loot_out19(_kouka_x_loot_out19), .loot_out20(_kouka_x_loot_out20), .loot_out21(_kouka_x_loot_out21), .loot_out22(_kouka_x_loot_out22), .loot_out23(_kouka_x_loot_out23), .loot_out24(_kouka_x_loot_out24), .loot_out25(_kouka_x_loot_out25), .loot_out26(_kouka_x_loot_out26), .loot_out27(_kouka_x_loot_out27), .loot_out28(_kouka_x_loot_out28), .loot_out29(_kouka_x_loot_out29), .loot_out30(_kouka_x_loot_out30), .loot_out31(_kouka_x_loot_out31), .loot_out32(_kouka_x_loot_out32), .loot_out33(_kouka_x_loot_out33), .loot_out34(_kouka_x_loot_out34), .loot_out35(_kouka_x_loot_out35), .loot_out36(_kouka_x_loot_out36), .loot_out37(_kouka_x_loot_out37), .loot_out38(_kouka_x_loot_out38), .loot_out39(_kouka_x_loot_out39), .loot_out40(_kouka_x_loot_out40), .loot_out41(_kouka_x_loot_out41), .loot_out42(_kouka_x_loot_out42), .loot_out43(_kouka_x_loot_out43), .loot_out44(_kouka_x_loot_out44), .loot_out45(_kouka_x_loot_out45), .loot_out46(_kouka_x_loot_out46), .loot_out47(_kouka_x_loot_out47), .loot_out48(_kouka_x_loot_out48), .loot_out49(_kouka_x_loot_out49), .loot_out50(_kouka_x_loot_out50), .loot_out51(_kouka_x_loot_out51), .loot_out52(_kouka_x_loot_out52), .loot_out53(_kouka_x_loot_out53), .loot_out54(_kouka_x_loot_out54), .loot_out55(_kouka_x_loot_out55), .loot_out56(_kouka_x_loot_out56), .loot_out57(_kouka_x_loot_out57), .loot_out58(_kouka_x_loot_out58), .loot_out59(_kouka_x_loot_out59), .loot_out60(_kouka_x_loot_out60), .loot_out61(_kouka_x_loot_out61), .loot_out62(_kouka_x_loot_out62), .loot_out63(_kouka_x_loot_out63), .loot_out64(_kouka_x_loot_out64), .loot_out65(_kouka_x_loot_out65), .loot_out66(_kouka_x_loot_out66), .loot_out67(_kouka_x_loot_out67), .loot_out68(_kouka_x_loot_out68), .loot_out69(_kouka_x_loot_out69), .loot_out70(_kouka_x_loot_out70), .loot_out71(_kouka_x_loot_out71), .loot_out72(_kouka_x_loot_out72), .loot_out73(_kouka_x_loot_out73), .loot_out74(_kouka_x_loot_out74), .loot_out75(_kouka_x_loot_out75), .loot_out76(_kouka_x_loot_out76), .loot_out77(_kouka_x_loot_out77), .loot_out78(_kouka_x_loot_out78), .loot_out79(_kouka_x_loot_out79), .loot_out80(_kouka_x_loot_out80), .loot_out81(_kouka_x_loot_out81), .loot_out82(_kouka_x_loot_out82), .loot_out83(_kouka_x_loot_out83), .loot_out84(_kouka_x_loot_out84), .loot_out85(_kouka_x_loot_out85), .loot_out86(_kouka_x_loot_out86), .loot_out87(_kouka_x_loot_out87), .loot_out88(_kouka_x_loot_out88), .loot_out89(_kouka_x_loot_out89), .loot_out90(_kouka_x_loot_out90), .loot_out91(_kouka_x_loot_out91), .loot_out92(_kouka_x_loot_out92), .loot_out93(_kouka_x_loot_out93), .loot_out94(_kouka_x_loot_out94), .loot_out95(_kouka_x_loot_out95), .loot_out96(_kouka_x_loot_out96), .loot_out97(_kouka_x_loot_out97), .loot_out98(_kouka_x_loot_out98), .loot_out99(_kouka_x_loot_out99), .loot_out100(_kouka_x_loot_out100), .loot_out101(_kouka_x_loot_out101), .loot_out102(_kouka_x_loot_out102), .loot_out103(_kouka_x_loot_out103), .loot_out104(_kouka_x_loot_out104), .loot_out105(_kouka_x_loot_out105), .loot_out106(_kouka_x_loot_out106), .loot_out107(_kouka_x_loot_out107), .loot_out108(_kouka_x_loot_out108), .loot_out109(_kouka_x_loot_out109), .loot_out110(_kouka_x_loot_out110), .data_in17(_kouka_x_data_in17), .data_in18(_kouka_x_data_in18), .data_in19(_kouka_x_data_in19), .data_in20(_kouka_x_data_in20), .data_in21(_kouka_x_data_in21), .data_in22(_kouka_x_data_in22), .data_in23(_kouka_x_data_in23), .data_in24(_kouka_x_data_in24), .data_in25(_kouka_x_data_in25), .data_in26(_kouka_x_data_in26), .data_in27(_kouka_x_data_in27), .data_in28(_kouka_x_data_in28), .data_in29(_kouka_x_data_in29), .data_in30(_kouka_x_data_in30), .data_in33(_kouka_x_data_in33), .data_in34(_kouka_x_data_in34), .data_in35(_kouka_x_data_in35), .data_in36(_kouka_x_data_in36), .data_in37(_kouka_x_data_in37), .data_in38(_kouka_x_data_in38), .data_in39(_kouka_x_data_in39), .data_in40(_kouka_x_data_in40), .data_in41(_kouka_x_data_in41), .data_in42(_kouka_x_data_in42), .data_in43(_kouka_x_data_in43), .data_in44(_kouka_x_data_in44), .data_in45(_kouka_x_data_in45), .data_in46(_kouka_x_data_in46), .data_in49(_kouka_x_data_in49), .data_in50(_kouka_x_data_in50), .data_in51(_kouka_x_data_in51), .data_in52(_kouka_x_data_in52), .data_in53(_kouka_x_data_in53), .data_in54(_kouka_x_data_in54), .data_in55(_kouka_x_data_in55), .data_in56(_kouka_x_data_in56), .data_in57(_kouka_x_data_in57), .data_in58(_kouka_x_data_in58), .data_in59(_kouka_x_data_in59), .data_in60(_kouka_x_data_in60), .data_in61(_kouka_x_data_in61), .data_in62(_kouka_x_data_in62), .data_in65(_kouka_x_data_in65), .data_in66(_kouka_x_data_in66), .data_in67(_kouka_x_data_in67), .data_in68(_kouka_x_data_in68), .data_in69(_kouka_x_data_in69), .data_in70(_kouka_x_data_in70), .data_in71(_kouka_x_data_in71), .data_in72(_kouka_x_data_in72), .data_in73(_kouka_x_data_in73), .data_in74(_kouka_x_data_in74), .data_in75(_kouka_x_data_in75), .data_in76(_kouka_x_data_in76), .data_in77(_kouka_x_data_in77), .data_in78(_kouka_x_data_in78), .data_in81(_kouka_x_data_in81), .data_in82(_kouka_x_data_in82), .data_in83(_kouka_x_data_in83), .data_in84(_kouka_x_data_in84), .data_in85(_kouka_x_data_in85), .data_in86(_kouka_x_data_in86), .data_in87(_kouka_x_data_in87), .data_in88(_kouka_x_data_in88), .data_in89(_kouka_x_data_in89), .data_in90(_kouka_x_data_in90), .data_in91(_kouka_x_data_in91), .data_in92(_kouka_x_data_in92), .data_in93(_kouka_x_data_in93), .data_in94(_kouka_x_data_in94), .data_in97(_kouka_x_data_in97), .data_in98(_kouka_x_data_in98), .data_in99(_kouka_x_data_in99), .data_in100(_kouka_x_data_in100), .data_in101(_kouka_x_data_in101), .data_in102(_kouka_x_data_in102), .data_in103(_kouka_x_data_in103), .data_in104(_kouka_x_data_in104), .data_in105(_kouka_x_data_in105), .data_in106(_kouka_x_data_in106), .data_in107(_kouka_x_data_in107), .data_in108(_kouka_x_data_in108), .data_in109(_kouka_x_data_in109), .data_in110(_kouka_x_data_in110), .start(_kouka_x_start), .goal(_kouka_x_goal));
kanwa kanwa_x (.m_clock(m_clock), .p_reset( p_reset), .out_do(_kanwa_x_out_do), .in_do(_kanwa_x_in_do), .data_out17(_kanwa_x_data_out17), .data_out18(_kanwa_x_data_out18), .data_out19(_kanwa_x_data_out19), .data_out20(_kanwa_x_data_out20), .data_out21(_kanwa_x_data_out21), .data_out22(_kanwa_x_data_out22), .data_out23(_kanwa_x_data_out23), .data_out24(_kanwa_x_data_out24), .data_out25(_kanwa_x_data_out25), .data_out26(_kanwa_x_data_out26), .data_out27(_kanwa_x_data_out27), .data_out28(_kanwa_x_data_out28), .data_out29(_kanwa_x_data_out29), .data_out30(_kanwa_x_data_out30), .data_out33(_kanwa_x_data_out33), .data_out34(_kanwa_x_data_out34), .data_out35(_kanwa_x_data_out35), .data_out36(_kanwa_x_data_out36), .data_out37(_kanwa_x_data_out37), .data_out38(_kanwa_x_data_out38), .data_out39(_kanwa_x_data_out39), .data_out40(_kanwa_x_data_out40), .data_out41(_kanwa_x_data_out41), .data_out42(_kanwa_x_data_out42), .data_out43(_kanwa_x_data_out43), .data_out44(_kanwa_x_data_out44), .data_out45(_kanwa_x_data_out45), .data_out46(_kanwa_x_data_out46), .data_out49(_kanwa_x_data_out49), .data_out50(_kanwa_x_data_out50), .data_out51(_kanwa_x_data_out51), .data_out52(_kanwa_x_data_out52), .data_out53(_kanwa_x_data_out53), .data_out54(_kanwa_x_data_out54), .data_out55(_kanwa_x_data_out55), .data_out56(_kanwa_x_data_out56), .data_out57(_kanwa_x_data_out57), .data_out58(_kanwa_x_data_out58), .data_out59(_kanwa_x_data_out59), .data_out60(_kanwa_x_data_out60), .data_out61(_kanwa_x_data_out61), .data_out62(_kanwa_x_data_out62), .data_out65(_kanwa_x_data_out65), .data_out66(_kanwa_x_data_out66), .data_out67(_kanwa_x_data_out67), .data_out68(_kanwa_x_data_out68), .data_out69(_kanwa_x_data_out69), .data_out70(_kanwa_x_data_out70), .data_out71(_kanwa_x_data_out71), .data_out72(_kanwa_x_data_out72), .data_out73(_kanwa_x_data_out73), .data_out74(_kanwa_x_data_out74), .data_out75(_kanwa_x_data_out75), .data_out76(_kanwa_x_data_out76), .data_out77(_kanwa_x_data_out77), .data_out78(_kanwa_x_data_out78), .data_out81(_kanwa_x_data_out81), .data_out82(_kanwa_x_data_out82), .data_out83(_kanwa_x_data_out83), .data_out84(_kanwa_x_data_out84), .data_out85(_kanwa_x_data_out85), .data_out86(_kanwa_x_data_out86), .data_out87(_kanwa_x_data_out87), .data_out88(_kanwa_x_data_out88), .data_out89(_kanwa_x_data_out89), .data_out90(_kanwa_x_data_out90), .data_out91(_kanwa_x_data_out91), .data_out92(_kanwa_x_data_out92), .data_out93(_kanwa_x_data_out93), .data_out94(_kanwa_x_data_out94), .data_out97(_kanwa_x_data_out97), .data_out98(_kanwa_x_data_out98), .data_out99(_kanwa_x_data_out99), .data_out100(_kanwa_x_data_out100), .data_out101(_kanwa_x_data_out101), .data_out102(_kanwa_x_data_out102), .data_out103(_kanwa_x_data_out103), .data_out104(_kanwa_x_data_out104), .data_out105(_kanwa_x_data_out105), .data_out106(_kanwa_x_data_out106), .data_out107(_kanwa_x_data_out107), .data_out108(_kanwa_x_data_out108), .data_out109(_kanwa_x_data_out109), .data_out110(_kanwa_x_data_out110), .data_in17(_kanwa_x_data_in17), .data_in18(_kanwa_x_data_in18), .data_in19(_kanwa_x_data_in19), .data_in20(_kanwa_x_data_in20), .data_in21(_kanwa_x_data_in21), .data_in22(_kanwa_x_data_in22), .data_in23(_kanwa_x_data_in23), .data_in24(_kanwa_x_data_in24), .data_in25(_kanwa_x_data_in25), .data_in26(_kanwa_x_data_in26), .data_in27(_kanwa_x_data_in27), .data_in28(_kanwa_x_data_in28), .data_in29(_kanwa_x_data_in29), .data_in30(_kanwa_x_data_in30), .data_in33(_kanwa_x_data_in33), .data_in34(_kanwa_x_data_in34), .data_in35(_kanwa_x_data_in35), .data_in36(_kanwa_x_data_in36), .data_in37(_kanwa_x_data_in37), .data_in38(_kanwa_x_data_in38), .data_in39(_kanwa_x_data_in39), .data_in40(_kanwa_x_data_in40), .data_in41(_kanwa_x_data_in41), .data_in42(_kanwa_x_data_in42), .data_in43(_kanwa_x_data_in43), .data_in44(_kanwa_x_data_in44), .data_in45(_kanwa_x_data_in45), .data_in46(_kanwa_x_data_in46), .data_in49(_kanwa_x_data_in49), .data_in50(_kanwa_x_data_in50), .data_in51(_kanwa_x_data_in51), .data_in52(_kanwa_x_data_in52), .data_in53(_kanwa_x_data_in53), .data_in54(_kanwa_x_data_in54), .data_in55(_kanwa_x_data_in55), .data_in56(_kanwa_x_data_in56), .data_in57(_kanwa_x_data_in57), .data_in58(_kanwa_x_data_in58), .data_in59(_kanwa_x_data_in59), .data_in60(_kanwa_x_data_in60), .data_in61(_kanwa_x_data_in61), .data_in62(_kanwa_x_data_in62), .data_in65(_kanwa_x_data_in65), .data_in66(_kanwa_x_data_in66), .data_in67(_kanwa_x_data_in67), .data_in68(_kanwa_x_data_in68), .data_in69(_kanwa_x_data_in69), .data_in70(_kanwa_x_data_in70), .data_in71(_kanwa_x_data_in71), .data_in72(_kanwa_x_data_in72), .data_in73(_kanwa_x_data_in73), .data_in74(_kanwa_x_data_in74), .data_in75(_kanwa_x_data_in75), .data_in76(_kanwa_x_data_in76), .data_in77(_kanwa_x_data_in77), .data_in78(_kanwa_x_data_in78), .data_in81(_kanwa_x_data_in81), .data_in82(_kanwa_x_data_in82), .data_in83(_kanwa_x_data_in83), .data_in84(_kanwa_x_data_in84), .data_in85(_kanwa_x_data_in85), .data_in86(_kanwa_x_data_in86), .data_in87(_kanwa_x_data_in87), .data_in88(_kanwa_x_data_in88), .data_in89(_kanwa_x_data_in89), .data_in90(_kanwa_x_data_in90), .data_in91(_kanwa_x_data_in91), .data_in92(_kanwa_x_data_in92), .data_in93(_kanwa_x_data_in93), .data_in94(_kanwa_x_data_in94), .data_in97(_kanwa_x_data_in97), .data_in98(_kanwa_x_data_in98), .data_in99(_kanwa_x_data_in99), .data_in100(_kanwa_x_data_in100), .data_in101(_kanwa_x_data_in101), .data_in102(_kanwa_x_data_in102), .data_in103(_kanwa_x_data_in103), .data_in104(_kanwa_x_data_in104), .data_in105(_kanwa_x_data_in105), .data_in106(_kanwa_x_data_in106), .data_in107(_kanwa_x_data_in107), .data_in108(_kanwa_x_data_in108), .data_in109(_kanwa_x_data_in109), .data_in110(_kanwa_x_data_in110), .start(_kanwa_x_start), .goal(_kanwa_x_goal));
seach seachx (.m_clock(m_clock), .p_reset( p_reset), .out_data(_seachx_out_data), .out_do(_seachx_out_do), .in_do(_seachx_in_do), .startplot(_seachx_startplot), .goalplot(_seachx_goalplot), .data_out17(_seachx_data_out17), .data_out18(_seachx_data_out18), .data_out19(_seachx_data_out19), .data_out20(_seachx_data_out20), .data_out21(_seachx_data_out21), .data_out22(_seachx_data_out22), .data_out23(_seachx_data_out23), .data_out24(_seachx_data_out24), .data_out25(_seachx_data_out25), .data_out26(_seachx_data_out26), .data_out27(_seachx_data_out27), .data_out28(_seachx_data_out28), .data_out29(_seachx_data_out29), .data_out30(_seachx_data_out30), .data_out33(_seachx_data_out33), .data_out34(_seachx_data_out34), .data_out35(_seachx_data_out35), .data_out36(_seachx_data_out36), .data_out37(_seachx_data_out37), .data_out38(_seachx_data_out38), .data_out39(_seachx_data_out39), .data_out40(_seachx_data_out40), .data_out41(_seachx_data_out41), .data_out42(_seachx_data_out42), .data_out43(_seachx_data_out43), .data_out44(_seachx_data_out44), .data_out45(_seachx_data_out45), .data_out46(_seachx_data_out46), .data_out49(_seachx_data_out49), .data_out50(_seachx_data_out50), .data_out51(_seachx_data_out51), .data_out52(_seachx_data_out52), .data_out53(_seachx_data_out53), .data_out54(_seachx_data_out54), .data_out55(_seachx_data_out55), .data_out56(_seachx_data_out56), .data_out57(_seachx_data_out57), .data_out58(_seachx_data_out58), .data_out59(_seachx_data_out59), .data_out60(_seachx_data_out60), .data_out61(_seachx_data_out61), .data_out62(_seachx_data_out62), .data_out65(_seachx_data_out65), .data_out66(_seachx_data_out66), .data_out67(_seachx_data_out67), .data_out68(_seachx_data_out68), .data_out69(_seachx_data_out69), .data_out70(_seachx_data_out70), .data_out71(_seachx_data_out71), .data_out72(_seachx_data_out72), .data_out73(_seachx_data_out73), .data_out74(_seachx_data_out74), .data_out75(_seachx_data_out75), .data_out76(_seachx_data_out76), .data_out77(_seachx_data_out77), .data_out78(_seachx_data_out78), .data_out81(_seachx_data_out81), .data_out82(_seachx_data_out82), .data_out83(_seachx_data_out83), .data_out84(_seachx_data_out84), .data_out85(_seachx_data_out85), .data_out86(_seachx_data_out86), .data_out87(_seachx_data_out87), .data_out88(_seachx_data_out88), .data_out89(_seachx_data_out89), .data_out90(_seachx_data_out90), .data_out91(_seachx_data_out91), .data_out92(_seachx_data_out92), .data_out93(_seachx_data_out93), .data_out94(_seachx_data_out94), .data_out97(_seachx_data_out97), .data_out98(_seachx_data_out98), .data_out99(_seachx_data_out99), .data_out100(_seachx_data_out100), .data_out101(_seachx_data_out101), .data_out102(_seachx_data_out102), .data_out103(_seachx_data_out103), .data_out104(_seachx_data_out104), .data_out105(_seachx_data_out105), .data_out106(_seachx_data_out106), .data_out107(_seachx_data_out107), .data_out108(_seachx_data_out108), .data_out109(_seachx_data_out109), .data_out110(_seachx_data_out110), .data_in17(_seachx_data_in17), .data_in18(_seachx_data_in18), .data_in19(_seachx_data_in19), .data_in20(_seachx_data_in20), .data_in21(_seachx_data_in21), .data_in22(_seachx_data_in22), .data_in23(_seachx_data_in23), .data_in24(_seachx_data_in24), .data_in25(_seachx_data_in25), .data_in26(_seachx_data_in26), .data_in27(_seachx_data_in27), .data_in28(_seachx_data_in28), .data_in29(_seachx_data_in29), .data_in30(_seachx_data_in30), .data_in33(_seachx_data_in33), .data_in34(_seachx_data_in34), .data_in35(_seachx_data_in35), .data_in36(_seachx_data_in36), .data_in37(_seachx_data_in37), .data_in38(_seachx_data_in38), .data_in39(_seachx_data_in39), .data_in40(_seachx_data_in40), .data_in41(_seachx_data_in41), .data_in42(_seachx_data_in42), .data_in43(_seachx_data_in43), .data_in44(_seachx_data_in44), .data_in45(_seachx_data_in45), .data_in46(_seachx_data_in46), .data_in49(_seachx_data_in49), .data_in50(_seachx_data_in50), .data_in51(_seachx_data_in51), .data_in52(_seachx_data_in52), .data_in53(_seachx_data_in53), .data_in54(_seachx_data_in54), .data_in55(_seachx_data_in55), .data_in56(_seachx_data_in56), .data_in57(_seachx_data_in57), .data_in58(_seachx_data_in58), .data_in59(_seachx_data_in59), .data_in60(_seachx_data_in60), .data_in61(_seachx_data_in61), .data_in62(_seachx_data_in62), .data_in65(_seachx_data_in65), .data_in66(_seachx_data_in66), .data_in67(_seachx_data_in67), .data_in68(_seachx_data_in68), .data_in69(_seachx_data_in69), .data_in70(_seachx_data_in70), .data_in71(_seachx_data_in71), .data_in72(_seachx_data_in72), .data_in73(_seachx_data_in73), .data_in74(_seachx_data_in74), .data_in75(_seachx_data_in75), .data_in76(_seachx_data_in76), .data_in77(_seachx_data_in77), .data_in78(_seachx_data_in78), .data_in81(_seachx_data_in81), .data_in82(_seachx_data_in82), .data_in83(_seachx_data_in83), .data_in84(_seachx_data_in84), .data_in85(_seachx_data_in85), .data_in86(_seachx_data_in86), .data_in87(_seachx_data_in87), .data_in88(_seachx_data_in88), .data_in89(_seachx_data_in89), .data_in90(_seachx_data_in90), .data_in91(_seachx_data_in91), .data_in92(_seachx_data_in92), .data_in93(_seachx_data_in93), .data_in94(_seachx_data_in94), .data_in97(_seachx_data_in97), .data_in98(_seachx_data_in98), .data_in99(_seachx_data_in99), .data_in100(_seachx_data_in100), .data_in101(_seachx_data_in101), .data_in102(_seachx_data_in102), .data_in103(_seachx_data_in103), .data_in104(_seachx_data_in104), .data_in105(_seachx_data_in105), .data_in106(_seachx_data_in106), .data_in107(_seachx_data_in107), .data_in108(_seachx_data_in108), .data_in109(_seachx_data_in109), .data_in110(_seachx_data_in110));

   assign  _seachx_data_in17 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in18 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in19 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in20 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in21 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in22 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in23 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in24 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in25 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in26 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in27 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in28 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in29 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in30 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in33 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in34 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in35 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in36 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in37 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in38 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in39 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in40 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in41 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in42 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in43 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in44 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in45 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in46 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in49 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in50 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in51 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in52 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in53 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in54 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in55 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in56 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in57 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in58 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in59 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in60 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in61 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in62 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in65 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in66 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in67 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in68 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in69 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in70 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in71 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in72 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in73 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in74 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in75 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in76 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in77 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in78 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in81 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in82 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in83 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in84 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in85 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in86 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in87 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in88 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in89 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in90 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in91 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in92 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in93 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in94 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in97 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in98 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in99 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in100 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in101 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in102 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in103 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in104 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in105 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in106 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in107 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in108 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in109 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _seachx_data_in110 = 
// synthesis translate_off
// synopsys translate_off
((in_do|_reg_0))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_0))?map_value_arg110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _seachx_in_do)
  begin
#1 if (_seachx_in_do===1'bx)
 begin
$display("Warning: control hazard(meiro:_seachx_in_do) at %d",$time);
 end
#1 if ((((in_do|_reg_0))===1'bx) || (1'b1)===1'bx) $display("hazard ((in_do|_reg_0) || 1'b1) line 23 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _seachx_in_do = (in_do|_reg_0);
   assign  _seachx_p_reset = p_reset;
   assign  _seachx_m_clock = m_clock;
   assign  _kanwa_x_data_in17 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in18 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in19 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in20 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in21 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in22 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in23 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in24 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in25 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in26 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in27 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in28 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in29 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in30 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in33 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in34 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in35 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in36 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in37 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in38 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in39 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in40 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in41 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in42 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in43 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in44 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in45 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in46 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in49 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in50 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in51 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in52 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in53 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in54 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in55 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in56 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in57 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in58 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in59 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in60 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in61 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in62 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in65 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in66 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in67 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in68 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in69 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in70 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in71 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in72 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in73 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in74 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in75 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in76 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in77 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in78 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in81 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in82 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in83 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in84 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in85 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in86 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in87 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in88 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in89 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in90 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in91 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in92 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in93 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in94 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in97 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in98 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in99 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in100 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in101 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in102 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in103 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in104 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in105 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in106 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in107 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in108 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in109 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_data_in110 = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_data_out110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_start = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_startplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kanwa_x_goal = 
// synthesis translate_off
// synopsys translate_off
(_seachx_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_seachx_out_do)?_seachx_goalplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _kanwa_x_in_do)
  begin
#1 if (_kanwa_x_in_do===1'bx)
 begin
$display("Warning: control hazard(meiro:_kanwa_x_in_do) at %d",$time);
 end
#1 if (((_seachx_out_do)===1'bx) || (1'b1)===1'bx) $display("hazard (_seachx_out_do || 1'b1) line 38 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _kanwa_x_in_do = _seachx_out_do;
   assign  _kanwa_x_p_reset = p_reset;
   assign  _kanwa_x_m_clock = m_clock;
   assign  _kouka_x_data_in17 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in18 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in19 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in20 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in21 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in22 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in23 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in24 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in25 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in26 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in27 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in28 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in29 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in30 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in33 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in34 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in35 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in36 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in37 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in38 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in39 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in40 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in41 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in42 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in43 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in44 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in45 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in46 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in49 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in50 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in51 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in52 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in53 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in54 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in55 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in56 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in57 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in58 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in59 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in60 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in61 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in62 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in65 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in66 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in67 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in68 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in69 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in70 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in71 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in72 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in73 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in74 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in75 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in76 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in77 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in78 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in81 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in82 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in83 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in84 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in85 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in86 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in87 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in88 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in89 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in90 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in91 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in92 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in93 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in94 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in97 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in98 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in99 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in100 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in101 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in102 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in103 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in104 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in105 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in106 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in107 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in108 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in109 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_data_in110 = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_kanwa_x_data_out110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_start = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_seachx_startplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _kouka_x_goal = 
// synthesis translate_off
// synopsys translate_off
(_kanwa_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kanwa_x_out_do)?_seachx_goalplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _kouka_x_in_do)
  begin
#1 if (_kouka_x_in_do===1'bx)
 begin
$display("Warning: control hazard(meiro:_kouka_x_in_do) at %d",$time);
 end
#1 if (((_kanwa_x_out_do)===1'bx) || (1'b1)===1'bx) $display("hazard (_kanwa_x_out_do || 1'b1) line 64 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _kouka_x_in_do = _kanwa_x_out_do;
   assign  _kouka_x_p_reset = p_reset;
   assign  _kouka_x_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_seachx_out_do)
    begin
    $display("start %d goal %d",_seachx_startplot,_seachx_goalplot);
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_seachx_out_do)
    begin
    $display("out0=%d",_seachx_data_out33);
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  kekka_out0 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out0:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out1 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out1:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out2 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out2:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out3 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out3:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out4 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out4:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out5 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out5:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out6 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out6:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out7 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out7:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out8 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out8:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out9 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out9:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out10 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out10:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out11 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out11:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out12 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out12:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out13 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out13:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out14 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out14:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out15 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out15:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out16 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out16:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out17 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out18 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out19 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out20 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out21 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out22 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out23 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out24 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out25 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out26 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out27 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out28 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out29 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out30 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out31 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out31:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out32 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out32:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out33 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out34 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out35 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out36 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out37 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out38 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out39 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out40 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out41 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out42 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out43 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out44 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out45 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out46 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out47 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out47:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out48 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out48:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out49 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out50 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out51 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out52 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out53 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out54 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out55 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out56 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out57 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out58 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  kekka_out59 = 
// synthesis translate_off
// synopsys translate_off
(_kouka_x_out_do)? 
// synthesis translate_on
// synopsys translate_on
((_kouka_x_out_do)?_kouka_x_loot_out59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge end_meiro)
  begin
#1 if (end_meiro===1'bx)
 begin
$display("Warning: control hazard(meiro:end_meiro) at %d",$time);
 end
#1 if (((_kouka_x_out_do)===1'bx) || (1'b1)===1'bx) $display("hazard (_kouka_x_out_do || 1'b1) line 72 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  end_meiro = _kouka_x_out_do;
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     count <= 8'b00000000;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_0 <= 1'b0;
else if (_reg_0)
      _reg_0 <= 1'b0;
end
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:04 2024
 Licensed to :EVALUATION USER*/
