// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module test ( p_reset , m_clock , HEX0 );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  output HEX0;
  wire HEX0;
  reg [7:0] map_test [0:127];
  wire fpga_MAP_SIZE_start;
  reg out_put_flag;
  reg [3:0] first;
  reg [3:0] second;
  reg [3:0] third;
  reg [31:0] count;
  reg [7:0] encode [0:15];
  wire out_put;
  reg [1:0] end_reg;
  wire [17:0] _mul_bit_x_mul_bit1;
  wire [17:0] _mul_bit_x_mul_bit2;
  wire [20:0] _mul_bit_x_mul_bit_result;
  wire _mul_bit_x_mul_bit_exe;
  wire _mul_bit_x_p_reset;
  wire _mul_bit_x_m_clock;
  wire [17:0] _mul_bit_x_1_mul_bit1;
  wire [17:0] _mul_bit_x_1_mul_bit2;
  wire [20:0] _mul_bit_x_1_mul_bit_result;
  wire _mul_bit_x_1_mul_bit_exe;
  wire _mul_bit_x_1_p_reset;
  wire _mul_bit_x_1_m_clock;
  wire [7:0] _meirotest_map_value_arg0;
  wire [7:0] _meirotest_map_value_arg1;
  wire [7:0] _meirotest_map_value_arg2;
  wire [7:0] _meirotest_map_value_arg3;
  wire [7:0] _meirotest_map_value_arg4;
  wire [7:0] _meirotest_map_value_arg5;
  wire [7:0] _meirotest_map_value_arg6;
  wire [7:0] _meirotest_map_value_arg7;
  wire [7:0] _meirotest_map_value_arg8;
  wire [7:0] _meirotest_map_value_arg9;
  wire [7:0] _meirotest_map_value_arg10;
  wire [7:0] _meirotest_map_value_arg11;
  wire [7:0] _meirotest_map_value_arg12;
  wire [7:0] _meirotest_map_value_arg13;
  wire [7:0] _meirotest_map_value_arg14;
  wire [7:0] _meirotest_map_value_arg15;
  wire [7:0] _meirotest_map_value_arg16;
  wire [7:0] _meirotest_map_value_arg17;
  wire [7:0] _meirotest_map_value_arg18;
  wire [7:0] _meirotest_map_value_arg19;
  wire [7:0] _meirotest_map_value_arg20;
  wire [7:0] _meirotest_map_value_arg21;
  wire [7:0] _meirotest_map_value_arg22;
  wire [7:0] _meirotest_map_value_arg23;
  wire [7:0] _meirotest_map_value_arg24;
  wire [7:0] _meirotest_map_value_arg25;
  wire [7:0] _meirotest_map_value_arg26;
  wire [7:0] _meirotest_map_value_arg27;
  wire [7:0] _meirotest_map_value_arg28;
  wire [7:0] _meirotest_map_value_arg29;
  wire [7:0] _meirotest_map_value_arg30;
  wire [7:0] _meirotest_map_value_arg31;
  wire [7:0] _meirotest_map_value_arg32;
  wire [7:0] _meirotest_map_value_arg33;
  wire [7:0] _meirotest_map_value_arg34;
  wire [7:0] _meirotest_map_value_arg35;
  wire [7:0] _meirotest_map_value_arg36;
  wire [7:0] _meirotest_map_value_arg37;
  wire [7:0] _meirotest_map_value_arg38;
  wire [7:0] _meirotest_map_value_arg39;
  wire [7:0] _meirotest_map_value_arg40;
  wire [7:0] _meirotest_map_value_arg41;
  wire [7:0] _meirotest_map_value_arg42;
  wire [7:0] _meirotest_map_value_arg43;
  wire [7:0] _meirotest_map_value_arg44;
  wire [7:0] _meirotest_map_value_arg45;
  wire [7:0] _meirotest_map_value_arg46;
  wire [7:0] _meirotest_map_value_arg47;
  wire [7:0] _meirotest_map_value_arg48;
  wire [7:0] _meirotest_map_value_arg49;
  wire [7:0] _meirotest_map_value_arg50;
  wire [7:0] _meirotest_map_value_arg51;
  wire [7:0] _meirotest_map_value_arg52;
  wire [7:0] _meirotest_map_value_arg53;
  wire [7:0] _meirotest_map_value_arg54;
  wire [7:0] _meirotest_map_value_arg55;
  wire [7:0] _meirotest_map_value_arg56;
  wire [7:0] _meirotest_map_value_arg57;
  wire [7:0] _meirotest_map_value_arg58;
  wire [7:0] _meirotest_map_value_arg59;
  wire [7:0] _meirotest_map_value_arg60;
  wire [7:0] _meirotest_map_value_arg61;
  wire [7:0] _meirotest_map_value_arg62;
  wire [7:0] _meirotest_map_value_arg63;
  wire [7:0] _meirotest_map_value_arg64;
  wire [7:0] _meirotest_map_value_arg65;
  wire [7:0] _meirotest_map_value_arg66;
  wire [7:0] _meirotest_map_value_arg67;
  wire [7:0] _meirotest_map_value_arg68;
  wire [7:0] _meirotest_map_value_arg69;
  wire [7:0] _meirotest_map_value_arg70;
  wire [7:0] _meirotest_map_value_arg71;
  wire [7:0] _meirotest_map_value_arg72;
  wire [7:0] _meirotest_map_value_arg73;
  wire [7:0] _meirotest_map_value_arg74;
  wire [7:0] _meirotest_map_value_arg75;
  wire [7:0] _meirotest_map_value_arg76;
  wire [7:0] _meirotest_map_value_arg77;
  wire [7:0] _meirotest_map_value_arg78;
  wire [7:0] _meirotest_map_value_arg79;
  wire [7:0] _meirotest_map_value_arg80;
  wire [7:0] _meirotest_map_value_arg81;
  wire [7:0] _meirotest_map_value_arg82;
  wire [7:0] _meirotest_map_value_arg83;
  wire [7:0] _meirotest_map_value_arg84;
  wire [7:0] _meirotest_map_value_arg85;
  wire [7:0] _meirotest_map_value_arg86;
  wire [7:0] _meirotest_map_value_arg87;
  wire [7:0] _meirotest_map_value_arg88;
  wire [7:0] _meirotest_map_value_arg89;
  wire [7:0] _meirotest_map_value_arg90;
  wire [7:0] _meirotest_map_value_arg91;
  wire [7:0] _meirotest_map_value_arg92;
  wire [7:0] _meirotest_map_value_arg93;
  wire [7:0] _meirotest_map_value_arg94;
  wire [7:0] _meirotest_map_value_arg95;
  wire [7:0] _meirotest_map_value_arg96;
  wire [7:0] _meirotest_map_value_arg97;
  wire [7:0] _meirotest_map_value_arg98;
  wire [7:0] _meirotest_map_value_arg99;
  wire [7:0] _meirotest_map_value_arg100;
  wire [7:0] _meirotest_map_value_arg101;
  wire [7:0] _meirotest_map_value_arg102;
  wire [7:0] _meirotest_map_value_arg103;
  wire [7:0] _meirotest_map_value_arg104;
  wire [7:0] _meirotest_map_value_arg105;
  wire [7:0] _meirotest_map_value_arg106;
  wire [7:0] _meirotest_map_value_arg107;
  wire [7:0] _meirotest_map_value_arg108;
  wire [7:0] _meirotest_map_value_arg109;
  wire [7:0] _meirotest_map_value_arg110;
  wire [7:0] _meirotest_map_value_arg111;
  wire [7:0] _meirotest_map_value_arg112;
  wire [7:0] _meirotest_map_value_arg113;
  wire [7:0] _meirotest_map_value_arg114;
  wire [7:0] _meirotest_map_value_arg115;
  wire [7:0] _meirotest_map_value_arg116;
  wire [7:0] _meirotest_map_value_arg117;
  wire [7:0] _meirotest_map_value_arg118;
  wire [7:0] _meirotest_map_value_arg119;
  wire [7:0] _meirotest_map_value_arg120;
  wire [7:0] _meirotest_map_value_arg121;
  wire [7:0] _meirotest_map_value_arg122;
  wire [7:0] _meirotest_map_value_arg123;
  wire [7:0] _meirotest_map_value_arg124;
  wire [7:0] _meirotest_map_value_arg125;
  wire [7:0] _meirotest_map_value_arg126;
  wire [7:0] _meirotest_map_value_arg127;
  wire [7:0] _meirotest_kekka_out0;
  wire [7:0] _meirotest_kekka_out1;
  wire [7:0] _meirotest_kekka_out2;
  wire [7:0] _meirotest_kekka_out3;
  wire [7:0] _meirotest_kekka_out4;
  wire [7:0] _meirotest_kekka_out5;
  wire [7:0] _meirotest_kekka_out6;
  wire [7:0] _meirotest_kekka_out7;
  wire [7:0] _meirotest_kekka_out8;
  wire [7:0] _meirotest_kekka_out9;
  wire [7:0] _meirotest_kekka_out10;
  wire [7:0] _meirotest_kekka_out11;
  wire [7:0] _meirotest_kekka_out12;
  wire [7:0] _meirotest_kekka_out13;
  wire [7:0] _meirotest_kekka_out14;
  wire [7:0] _meirotest_kekka_out15;
  wire [7:0] _meirotest_kekka_out16;
  wire [7:0] _meirotest_kekka_out17;
  wire [7:0] _meirotest_kekka_out18;
  wire [7:0] _meirotest_kekka_out19;
  wire [7:0] _meirotest_kekka_out20;
  wire [7:0] _meirotest_kekka_out21;
  wire [7:0] _meirotest_kekka_out22;
  wire [7:0] _meirotest_kekka_out23;
  wire [7:0] _meirotest_kekka_out24;
  wire [7:0] _meirotest_kekka_out25;
  wire [7:0] _meirotest_kekka_out26;
  wire [7:0] _meirotest_kekka_out27;
  wire [7:0] _meirotest_kekka_out28;
  wire [7:0] _meirotest_kekka_out29;
  wire [7:0] _meirotest_kekka_out30;
  wire [7:0] _meirotest_kekka_out31;
  wire [7:0] _meirotest_kekka_out32;
  wire [7:0] _meirotest_kekka_out33;
  wire [7:0] _meirotest_kekka_out34;
  wire [7:0] _meirotest_kekka_out35;
  wire [7:0] _meirotest_kekka_out36;
  wire [7:0] _meirotest_kekka_out37;
  wire [7:0] _meirotest_kekka_out38;
  wire [7:0] _meirotest_kekka_out39;
  wire [7:0] _meirotest_kekka_out40;
  wire [7:0] _meirotest_kekka_out41;
  wire [7:0] _meirotest_kekka_out42;
  wire [7:0] _meirotest_kekka_out43;
  wire [7:0] _meirotest_kekka_out44;
  wire [7:0] _meirotest_kekka_out45;
  wire [7:0] _meirotest_kekka_out46;
  wire [7:0] _meirotest_kekka_out47;
  wire [7:0] _meirotest_kekka_out48;
  wire [7:0] _meirotest_kekka_out49;
  wire [7:0] _meirotest_kekka_out50;
  wire [7:0] _meirotest_kekka_out51;
  wire [7:0] _meirotest_kekka_out52;
  wire [7:0] _meirotest_kekka_out53;
  wire [7:0] _meirotest_kekka_out54;
  wire [7:0] _meirotest_kekka_out55;
  wire [7:0] _meirotest_kekka_out56;
  wire [7:0] _meirotest_kekka_out57;
  wire [7:0] _meirotest_kekka_out58;
  wire [7:0] _meirotest_kekka_out59;
  wire _meirotest_in_do;
  wire _meirotest_end_meiro;
  wire _meirotest_p_reset;
  wire _meirotest_m_clock;
  wire _net_0;
  wire _net_1;
  reg _reg_3;
meiro meirotest (.m_clock(m_clock), .p_reset( p_reset), .end_meiro(_meirotest_end_meiro), .in_do(_meirotest_in_do), .kekka_out0(_meirotest_kekka_out0), .kekka_out1(_meirotest_kekka_out1), .kekka_out2(_meirotest_kekka_out2), .kekka_out3(_meirotest_kekka_out3), .kekka_out4(_meirotest_kekka_out4), .kekka_out5(_meirotest_kekka_out5), .kekka_out6(_meirotest_kekka_out6), .kekka_out7(_meirotest_kekka_out7), .kekka_out8(_meirotest_kekka_out8), .kekka_out9(_meirotest_kekka_out9), .kekka_out10(_meirotest_kekka_out10), .kekka_out11(_meirotest_kekka_out11), .kekka_out12(_meirotest_kekka_out12), .kekka_out13(_meirotest_kekka_out13), .kekka_out14(_meirotest_kekka_out14), .kekka_out15(_meirotest_kekka_out15), .kekka_out16(_meirotest_kekka_out16), .kekka_out17(_meirotest_kekka_out17), .kekka_out18(_meirotest_kekka_out18), .kekka_out19(_meirotest_kekka_out19), .kekka_out20(_meirotest_kekka_out20), .kekka_out21(_meirotest_kekka_out21), .kekka_out22(_meirotest_kekka_out22), .kekka_out23(_meirotest_kekka_out23), .kekka_out24(_meirotest_kekka_out24), .kekka_out25(_meirotest_kekka_out25), .kekka_out26(_meirotest_kekka_out26), .kekka_out27(_meirotest_kekka_out27), .kekka_out28(_meirotest_kekka_out28), .kekka_out29(_meirotest_kekka_out29), .kekka_out30(_meirotest_kekka_out30), .kekka_out31(_meirotest_kekka_out31), .kekka_out32(_meirotest_kekka_out32), .kekka_out33(_meirotest_kekka_out33), .kekka_out34(_meirotest_kekka_out34), .kekka_out35(_meirotest_kekka_out35), .kekka_out36(_meirotest_kekka_out36), .kekka_out37(_meirotest_kekka_out37), .kekka_out38(_meirotest_kekka_out38), .kekka_out39(_meirotest_kekka_out39), .kekka_out40(_meirotest_kekka_out40), .kekka_out41(_meirotest_kekka_out41), .kekka_out42(_meirotest_kekka_out42), .kekka_out43(_meirotest_kekka_out43), .kekka_out44(_meirotest_kekka_out44), .kekka_out45(_meirotest_kekka_out45), .kekka_out46(_meirotest_kekka_out46), .kekka_out47(_meirotest_kekka_out47), .kekka_out48(_meirotest_kekka_out48), .kekka_out49(_meirotest_kekka_out49), .kekka_out50(_meirotest_kekka_out50), .kekka_out51(_meirotest_kekka_out51), .kekka_out52(_meirotest_kekka_out52), .kekka_out53(_meirotest_kekka_out53), .kekka_out54(_meirotest_kekka_out54), .kekka_out55(_meirotest_kekka_out55), .kekka_out56(_meirotest_kekka_out56), .kekka_out57(_meirotest_kekka_out57), .kekka_out58(_meirotest_kekka_out58), .kekka_out59(_meirotest_kekka_out59), .map_value_arg0(_meirotest_map_value_arg0), .map_value_arg1(_meirotest_map_value_arg1), .map_value_arg2(_meirotest_map_value_arg2), .map_value_arg3(_meirotest_map_value_arg3), .map_value_arg4(_meirotest_map_value_arg4), .map_value_arg5(_meirotest_map_value_arg5), .map_value_arg6(_meirotest_map_value_arg6), .map_value_arg7(_meirotest_map_value_arg7), .map_value_arg8(_meirotest_map_value_arg8), .map_value_arg9(_meirotest_map_value_arg9), .map_value_arg10(_meirotest_map_value_arg10), .map_value_arg11(_meirotest_map_value_arg11), .map_value_arg12(_meirotest_map_value_arg12), .map_value_arg13(_meirotest_map_value_arg13), .map_value_arg14(_meirotest_map_value_arg14), .map_value_arg15(_meirotest_map_value_arg15), .map_value_arg16(_meirotest_map_value_arg16), .map_value_arg17(_meirotest_map_value_arg17), .map_value_arg18(_meirotest_map_value_arg18), .map_value_arg19(_meirotest_map_value_arg19), .map_value_arg20(_meirotest_map_value_arg20), .map_value_arg21(_meirotest_map_value_arg21), .map_value_arg22(_meirotest_map_value_arg22), .map_value_arg23(_meirotest_map_value_arg23), .map_value_arg24(_meirotest_map_value_arg24), .map_value_arg25(_meirotest_map_value_arg25), .map_value_arg26(_meirotest_map_value_arg26), .map_value_arg27(_meirotest_map_value_arg27), .map_value_arg28(_meirotest_map_value_arg28), .map_value_arg29(_meirotest_map_value_arg29), .map_value_arg30(_meirotest_map_value_arg30), .map_value_arg31(_meirotest_map_value_arg31), .map_value_arg32(_meirotest_map_value_arg32), .map_value_arg33(_meirotest_map_value_arg33), .map_value_arg34(_meirotest_map_value_arg34), .map_value_arg35(_meirotest_map_value_arg35), .map_value_arg36(_meirotest_map_value_arg36), .map_value_arg37(_meirotest_map_value_arg37), .map_value_arg38(_meirotest_map_value_arg38), .map_value_arg39(_meirotest_map_value_arg39), .map_value_arg40(_meirotest_map_value_arg40), .map_value_arg41(_meirotest_map_value_arg41), .map_value_arg42(_meirotest_map_value_arg42), .map_value_arg43(_meirotest_map_value_arg43), .map_value_arg44(_meirotest_map_value_arg44), .map_value_arg45(_meirotest_map_value_arg45), .map_value_arg46(_meirotest_map_value_arg46), .map_value_arg47(_meirotest_map_value_arg47), .map_value_arg48(_meirotest_map_value_arg48), .map_value_arg49(_meirotest_map_value_arg49), .map_value_arg50(_meirotest_map_value_arg50), .map_value_arg51(_meirotest_map_value_arg51), .map_value_arg52(_meirotest_map_value_arg52), .map_value_arg53(_meirotest_map_value_arg53), .map_value_arg54(_meirotest_map_value_arg54), .map_value_arg55(_meirotest_map_value_arg55), .map_value_arg56(_meirotest_map_value_arg56), .map_value_arg57(_meirotest_map_value_arg57), .map_value_arg58(_meirotest_map_value_arg58), .map_value_arg59(_meirotest_map_value_arg59), .map_value_arg60(_meirotest_map_value_arg60), .map_value_arg61(_meirotest_map_value_arg61), .map_value_arg62(_meirotest_map_value_arg62), .map_value_arg63(_meirotest_map_value_arg63), .map_value_arg64(_meirotest_map_value_arg64), .map_value_arg65(_meirotest_map_value_arg65), .map_value_arg66(_meirotest_map_value_arg66), .map_value_arg67(_meirotest_map_value_arg67), .map_value_arg68(_meirotest_map_value_arg68), .map_value_arg69(_meirotest_map_value_arg69), .map_value_arg70(_meirotest_map_value_arg70), .map_value_arg71(_meirotest_map_value_arg71), .map_value_arg72(_meirotest_map_value_arg72), .map_value_arg73(_meirotest_map_value_arg73), .map_value_arg74(_meirotest_map_value_arg74), .map_value_arg75(_meirotest_map_value_arg75), .map_value_arg76(_meirotest_map_value_arg76), .map_value_arg77(_meirotest_map_value_arg77), .map_value_arg78(_meirotest_map_value_arg78), .map_value_arg79(_meirotest_map_value_arg79), .map_value_arg80(_meirotest_map_value_arg80), .map_value_arg81(_meirotest_map_value_arg81), .map_value_arg82(_meirotest_map_value_arg82), .map_value_arg83(_meirotest_map_value_arg83), .map_value_arg84(_meirotest_map_value_arg84), .map_value_arg85(_meirotest_map_value_arg85), .map_value_arg86(_meirotest_map_value_arg86), .map_value_arg87(_meirotest_map_value_arg87), .map_value_arg88(_meirotest_map_value_arg88), .map_value_arg89(_meirotest_map_value_arg89), .map_value_arg90(_meirotest_map_value_arg90), .map_value_arg91(_meirotest_map_value_arg91), .map_value_arg92(_meirotest_map_value_arg92), .map_value_arg93(_meirotest_map_value_arg93), .map_value_arg94(_meirotest_map_value_arg94), .map_value_arg95(_meirotest_map_value_arg95), .map_value_arg96(_meirotest_map_value_arg96), .map_value_arg97(_meirotest_map_value_arg97), .map_value_arg98(_meirotest_map_value_arg98), .map_value_arg99(_meirotest_map_value_arg99), .map_value_arg100(_meirotest_map_value_arg100), .map_value_arg101(_meirotest_map_value_arg101), .map_value_arg102(_meirotest_map_value_arg102), .map_value_arg103(_meirotest_map_value_arg103), .map_value_arg104(_meirotest_map_value_arg104), .map_value_arg105(_meirotest_map_value_arg105), .map_value_arg106(_meirotest_map_value_arg106), .map_value_arg107(_meirotest_map_value_arg107), .map_value_arg108(_meirotest_map_value_arg108), .map_value_arg109(_meirotest_map_value_arg109), .map_value_arg110(_meirotest_map_value_arg110), .map_value_arg111(_meirotest_map_value_arg111), .map_value_arg112(_meirotest_map_value_arg112), .map_value_arg113(_meirotest_map_value_arg113), .map_value_arg114(_meirotest_map_value_arg114), .map_value_arg115(_meirotest_map_value_arg115), .map_value_arg116(_meirotest_map_value_arg116), .map_value_arg117(_meirotest_map_value_arg117), .map_value_arg118(_meirotest_map_value_arg118), .map_value_arg119(_meirotest_map_value_arg119), .map_value_arg120(_meirotest_map_value_arg120), .map_value_arg121(_meirotest_map_value_arg121), .map_value_arg122(_meirotest_map_value_arg122), .map_value_arg123(_meirotest_map_value_arg123), .map_value_arg124(_meirotest_map_value_arg124), .map_value_arg125(_meirotest_map_value_arg125), .map_value_arg126(_meirotest_map_value_arg126), .map_value_arg127(_meirotest_map_value_arg127));
mul_bit mul_bit_x (.m_clock(m_clock), .p_reset( p_reset), .mul_bit_exe(_mul_bit_x_mul_bit_exe), .mul_bit_result(_mul_bit_x_mul_bit_result), .mul_bit1(_mul_bit_x_mul_bit1), .mul_bit2(_mul_bit_x_mul_bit2));
mul_bit mul_bit_x_1 (.m_clock(m_clock), .p_reset( p_reset), .mul_bit_exe(_mul_bit_x_1_mul_bit_exe), .mul_bit_result(_mul_bit_x_1_mul_bit_result), .mul_bit1(_mul_bit_x_1_mul_bit1), .mul_bit2(_mul_bit_x_1_mul_bit2));


// synthesis translate_off
// synopsys translate_off
always @(posedge fpga_MAP_SIZE_start)
  begin
#1 if (fpga_MAP_SIZE_start===1'bx)
 begin
$display("Warning: control hazard(test:fpga_MAP_SIZE_start) at %d",$time);
 end
#1 if (((_net_1)===1'bx) || (1'b1)===1'bx) $display("hazard (_net_1 || 1'b1) line 137 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  fpga_MAP_SIZE_start = _net_1;
   assign  out_put = 1'b0;
   assign  _mul_bit_x_mul_bit_exe = 1'b0;
   assign  _mul_bit_x_p_reset = p_reset;
   assign  _mul_bit_x_m_clock = m_clock;
   assign  _mul_bit_x_1_mul_bit_exe = 1'b0;
   assign  _mul_bit_x_1_p_reset = p_reset;
   assign  _mul_bit_x_1_m_clock = m_clock;
   assign  _meirotest_map_value_arg0 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg1 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg2 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg3 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg4 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg5 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg6 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg7 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0000111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg8 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg9 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg10 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg11 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg12 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg13 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg14 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg15 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0001111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg16 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg17 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg18 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg19 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg20 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg21 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg22 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg23 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0010111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg24 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg25 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg26 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg27 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg28 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg29 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg30 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg31 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0011111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg32 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg33 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg34 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg35 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg36 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg37 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg38 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg39 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0100111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg40 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg41 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg42 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg43 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg44 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg45 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg46 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg47 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0101111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg48 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg49 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg50 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg51 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg52 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg53 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg54 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg55 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0110111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg56 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg57 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg58 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg59 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg60 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg61 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg62 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg63 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b0111111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg64 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg65 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg66 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg67 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg68 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg69 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg70 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg71 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1000111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg72 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg73 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg74 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg75 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg76 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg77 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg78 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg79 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1001111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg80 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg81 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg82 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg83 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg84 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg85 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg86 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg87 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1010111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg88 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg89 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg90 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg91 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg92 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg93 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg94 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg95 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1011111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg96 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg97 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg98 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg99 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg100 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg101 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg102 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg103 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1100111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg104 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg105 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg106 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg107 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg108 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg109 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg110 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg111 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1101111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg112 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg113 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg114 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg115 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg116 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg117 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg118 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg119 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1110111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg120 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg121 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg122 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg123 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg124 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg125 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg126 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _meirotest_map_value_arg127 = 
// synthesis translate_off
// synopsys translate_off
((fpga_MAP_SIZE_start|_reg_3))? 
// synthesis translate_on
// synopsys translate_on
(((fpga_MAP_SIZE_start|_reg_3))?(map_test[7'b1111111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _meirotest_in_do)
  begin
#1 if (_meirotest_in_do===1'bx)
 begin
$display("Warning: control hazard(test:_meirotest_in_do) at %d",$time);
 end
#1 if ((((fpga_MAP_SIZE_start|_reg_3))===1'bx) || (1'b1)===1'bx) $display("hazard ((fpga_MAP_SIZE_start|_reg_3) || 1'b1) line 157 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _meirotest_in_do = (fpga_MAP_SIZE_start|_reg_3);
   assign  _meirotest_p_reset = p_reset;
   assign  _meirotest_m_clock = m_clock;
   assign  _net_0 = (end_reg==2'b11);
   assign  _net_1 = (end_reg==2'b01);

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_net_1)
    begin
    $display("hello");
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_meirotest_end_meiro)
    begin
    $display("bye");
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_meirotest_end_meiro)
    begin
    $finish;
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  HEX0 = 
// synthesis translate_off
// synopsys translate_off
(_meirotest_end_meiro)? 
// synthesis translate_on
// synopsys translate_on
_meirotest_end_meiro
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
initial begin
    map_test[0] = 8'b11111111;
    map_test[1] = 8'b11111111;
    map_test[2] = 8'b11111111;
    map_test[3] = 8'b11111111;
    map_test[4] = 8'b11111111;
    map_test[5] = 8'b11111111;
    map_test[6] = 8'b11111111;
    map_test[7] = 8'b11111111;
    map_test[8] = 8'b11111111;
    map_test[9] = 8'b11111111;
    map_test[10] = 8'b11111111;
    map_test[11] = 8'b11111111;
    map_test[12] = 8'b11111111;
    map_test[13] = 8'b11111111;
    map_test[14] = 8'b11111111;
    map_test[15] = 8'b11111111;
    map_test[16] = 8'b11111111;
    map_test[17] = 8'b01111111;
    map_test[18] = 8'b01000000;
    map_test[19] = 8'b01000000;
    map_test[20] = 8'b01000000;
    map_test[21] = 8'b01000000;
    map_test[22] = 8'b01000000;
    map_test[23] = 8'b01000000;
    map_test[24] = 8'b01000000;
    map_test[25] = 8'b01000000;
    map_test[26] = 8'b01000000;
    map_test[27] = 8'b01000000;
    map_test[28] = 8'b01000000;
    map_test[29] = 8'b01000000;
    map_test[30] = 8'b01000000;
    map_test[31] = 8'b11111111;
    map_test[32] = 8'b11111111;
    map_test[33] = 8'b01000000;
    map_test[34] = 8'b11111111;
    map_test[35] = 8'b01000000;
    map_test[36] = 8'b11111111;
    map_test[37] = 8'b01000000;
    map_test[38] = 8'b11111111;
    map_test[39] = 8'b01000000;
    map_test[40] = 8'b11111111;
    map_test[41] = 8'b01000000;
    map_test[42] = 8'b11111111;
    map_test[43] = 8'b01000000;
    map_test[44] = 8'b11111111;
    map_test[45] = 8'b01000000;
    map_test[46] = 8'b11111111;
    map_test[47] = 8'b11111111;
    map_test[48] = 8'b11111111;
    map_test[49] = 8'b01000000;
    map_test[50] = 8'b01000000;
    map_test[51] = 8'b01000000;
    map_test[52] = 8'b01000000;
    map_test[53] = 8'b01000000;
    map_test[54] = 8'b01000000;
    map_test[55] = 8'b01000000;
    map_test[56] = 8'b01000000;
    map_test[57] = 8'b01000000;
    map_test[58] = 8'b01000000;
    map_test[59] = 8'b01000000;
    map_test[60] = 8'b01000000;
    map_test[61] = 8'b01000000;
    map_test[62] = 8'b01000000;
    map_test[63] = 8'b11111111;
    map_test[64] = 8'b11111111;
    map_test[65] = 8'b01000000;
    map_test[66] = 8'b11111111;
    map_test[67] = 8'b01000000;
    map_test[68] = 8'b11111111;
    map_test[69] = 8'b01000000;
    map_test[70] = 8'b11111111;
    map_test[71] = 8'b01000000;
    map_test[72] = 8'b11111111;
    map_test[73] = 8'b01000000;
    map_test[74] = 8'b11111111;
    map_test[75] = 8'b01000000;
    map_test[76] = 8'b11111111;
    map_test[77] = 8'b01000000;
    map_test[78] = 8'b11111111;
    map_test[79] = 8'b11111111;
    map_test[80] = 8'b11111111;
    map_test[81] = 8'b01000000;
    map_test[82] = 8'b01000000;
    map_test[83] = 8'b01000000;
    map_test[84] = 8'b01000000;
    map_test[85] = 8'b01000000;
    map_test[86] = 8'b01000000;
    map_test[87] = 8'b01000000;
    map_test[88] = 8'b01000000;
    map_test[89] = 8'b01000000;
    map_test[90] = 8'b01000000;
    map_test[91] = 8'b01000000;
    map_test[92] = 8'b01000000;
    map_test[93] = 8'b01000000;
    map_test[94] = 8'b01000000;
    map_test[95] = 8'b11111111;
    map_test[96] = 8'b11111111;
    map_test[97] = 8'b01000000;
    map_test[98] = 8'b11111111;
    map_test[99] = 8'b01000000;
    map_test[100] = 8'b11111111;
    map_test[101] = 8'b01000000;
    map_test[102] = 8'b11111111;
    map_test[103] = 8'b01000000;
    map_test[104] = 8'b11111111;
    map_test[105] = 8'b01000000;
    map_test[106] = 8'b11111111;
    map_test[107] = 8'b01000000;
    map_test[108] = 8'b11111111;
    map_test[109] = 8'b00000000;
    map_test[110] = 8'b11111111;
    map_test[111] = 8'b11111111;
    map_test[112] = 8'b11111111;
    map_test[113] = 8'b11111111;
    map_test[114] = 8'b11111111;
    map_test[115] = 8'b11111111;
    map_test[116] = 8'b11111111;
    map_test[117] = 8'b11111111;
    map_test[118] = 8'b11111111;
    map_test[119] = 8'b11111111;
    map_test[120] = 8'b11111111;
    map_test[121] = 8'b11111111;
    map_test[122] = 8'b11111111;
    map_test[123] = 8'b11111111;
    map_test[124] = 8'b11111111;
    map_test[125] = 8'b11111111;
    map_test[126] = 8'b11111111;
    map_test[127] = 8'b11111111;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     out_put_flag <= 1'b0;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     first <= 4'b0000;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     second <= 4'b0000;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     third <= 4'b0000;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     count <= 32'b00000000000000000000000000000000;
end
initial begin
    encode[0] = 8'b00111111;
    encode[1] = 8'b00000110;
    encode[2] = 8'b01011011;
    encode[3] = 8'b01001111;
    encode[4] = 8'b01100110;
    encode[5] = 8'b01101101;
    encode[6] = 8'b01111101;
    encode[7] = 8'b00100111;
    encode[8] = 8'b11111111;
    encode[9] = 8'b01101111;
    encode[10] = 8'b01110111;
    encode[11] = 8'b01111100;
    encode[12] = 8'b00111001;
    encode[13] = 8'b01011110;
    encode[14] = 8'b01111001;
    encode[15] = 8'b01110001;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     end_reg <= 2'b00;
else 
// synthesis translate_off
// synopsys translate_off
if (((~_net_0)&_net_0))   end_reg <= 2'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((~_net_0))
      end_reg <= (end_reg+2'b01);
else if (_net_0)
      end_reg <= 2'b10;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((~_net_0)|_net_0)==1'b1) ||
 (((~_net_0)|_net_0)==1'b0) ) begin
 if (((~_net_0)&_net_0))
 begin $display("Warning: assign collision(test:end_reg) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(test:end_reg) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     _reg_3 <= 1'b0;
else if (_reg_3)
      _reg_3 <= 1'b0;
end
endmodule

/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
