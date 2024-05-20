// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:03 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module kouka ( p_reset , m_clock , data_in17 , data_in18 , data_in19 , data_in20 , data_in21 , data_in22 , data_in23 , data_in24 , data_in25 , data_in26 , data_in27 , data_in28 , data_in29 , data_in30 , data_in33 , data_in34 , data_in35 , data_in36 , data_in37 , data_in38 , data_in39 , data_in40 , data_in41 , data_in42 , data_in43 , data_in44 , data_in45 , data_in46 , data_in49 , data_in50 , data_in51 , data_in52 , data_in53 , data_in54 , data_in55 , data_in56 , data_in57 , data_in58 , data_in59 , data_in60 , data_in61 , data_in62 , data_in65 , data_in66 , data_in67 , data_in68 , data_in69 , data_in70 , data_in71 , data_in72 , data_in73 , data_in74 , data_in75 , data_in76 , data_in77 , data_in78 , data_in81 , data_in82 , data_in83 , data_in84 , data_in85 , data_in86 , data_in87 , data_in88 , data_in89 , data_in90 , data_in91 , data_in92 , data_in93 , data_in94 , data_in97 , data_in98 , data_in99 , data_in100 , data_in101 , data_in102 , data_in103 , data_in104 , data_in105 , data_in106 , data_in107 , data_in108 , data_in109 , data_in110 , start , goal , loot_out0 , loot_out1 , loot_out2 , loot_out3 , loot_out4 , loot_out5 , loot_out6 , loot_out7 , loot_out8 , loot_out9 , loot_out10 , loot_out11 , loot_out12 , loot_out13 , loot_out14 , loot_out15 , loot_out16 , loot_out17 , loot_out18 , loot_out19 , loot_out20 , loot_out21 , loot_out22 , loot_out23 , loot_out24 , loot_out25 , loot_out26 , loot_out27 , loot_out28 , loot_out29 , loot_out30 , loot_out31 , loot_out32 , loot_out33 , loot_out34 , loot_out35 , loot_out36 , loot_out37 , loot_out38 , loot_out39 , loot_out40 , loot_out41 , loot_out42 , loot_out43 , loot_out44 , loot_out45 , loot_out46 , loot_out47 , loot_out48 , loot_out49 , loot_out50 , loot_out51 , loot_out52 , loot_out53 , loot_out54 , loot_out55 , loot_out56 , loot_out57 , loot_out58 , loot_out59 , loot_out60 , loot_out61 , loot_out62 , loot_out63 , loot_out64 , loot_out65 , loot_out66 , loot_out67 , loot_out68 , loot_out69 , loot_out70 , loot_out71 , loot_out72 , loot_out73 , loot_out74 , loot_out75 , loot_out76 , loot_out77 , loot_out78 , loot_out79 , loot_out80 , loot_out81 , loot_out82 , loot_out83 , loot_out84 , loot_out85 , loot_out86 , loot_out87 , loot_out88 , loot_out89 , loot_out90 , loot_out91 , loot_out92 , loot_out93 , loot_out94 , loot_out95 , loot_out96 , loot_out97 , loot_out98 , loot_out99 , loot_out100 , loot_out101 , loot_out102 , loot_out103 , loot_out104 , loot_out105 , loot_out106 , loot_out107 , loot_out108 , loot_out109 , loot_out110 , in_do , out_do );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] data_in17;
  wire [7:0] data_in17;
  input [7:0] data_in18;
  wire [7:0] data_in18;
  input [7:0] data_in19;
  wire [7:0] data_in19;
  input [7:0] data_in20;
  wire [7:0] data_in20;
  input [7:0] data_in21;
  wire [7:0] data_in21;
  input [7:0] data_in22;
  wire [7:0] data_in22;
  input [7:0] data_in23;
  wire [7:0] data_in23;
  input [7:0] data_in24;
  wire [7:0] data_in24;
  input [7:0] data_in25;
  wire [7:0] data_in25;
  input [7:0] data_in26;
  wire [7:0] data_in26;
  input [7:0] data_in27;
  wire [7:0] data_in27;
  input [7:0] data_in28;
  wire [7:0] data_in28;
  input [7:0] data_in29;
  wire [7:0] data_in29;
  input [7:0] data_in30;
  wire [7:0] data_in30;
  input [7:0] data_in33;
  wire [7:0] data_in33;
  input [7:0] data_in34;
  wire [7:0] data_in34;
  input [7:0] data_in35;
  wire [7:0] data_in35;
  input [7:0] data_in36;
  wire [7:0] data_in36;
  input [7:0] data_in37;
  wire [7:0] data_in37;
  input [7:0] data_in38;
  wire [7:0] data_in38;
  input [7:0] data_in39;
  wire [7:0] data_in39;
  input [7:0] data_in40;
  wire [7:0] data_in40;
  input [7:0] data_in41;
  wire [7:0] data_in41;
  input [7:0] data_in42;
  wire [7:0] data_in42;
  input [7:0] data_in43;
  wire [7:0] data_in43;
  input [7:0] data_in44;
  wire [7:0] data_in44;
  input [7:0] data_in45;
  wire [7:0] data_in45;
  input [7:0] data_in46;
  wire [7:0] data_in46;
  input [7:0] data_in49;
  wire [7:0] data_in49;
  input [7:0] data_in50;
  wire [7:0] data_in50;
  input [7:0] data_in51;
  wire [7:0] data_in51;
  input [7:0] data_in52;
  wire [7:0] data_in52;
  input [7:0] data_in53;
  wire [7:0] data_in53;
  input [7:0] data_in54;
  wire [7:0] data_in54;
  input [7:0] data_in55;
  wire [7:0] data_in55;
  input [7:0] data_in56;
  wire [7:0] data_in56;
  input [7:0] data_in57;
  wire [7:0] data_in57;
  input [7:0] data_in58;
  wire [7:0] data_in58;
  input [7:0] data_in59;
  wire [7:0] data_in59;
  input [7:0] data_in60;
  wire [7:0] data_in60;
  input [7:0] data_in61;
  wire [7:0] data_in61;
  input [7:0] data_in62;
  wire [7:0] data_in62;
  input [7:0] data_in65;
  wire [7:0] data_in65;
  input [7:0] data_in66;
  wire [7:0] data_in66;
  input [7:0] data_in67;
  wire [7:0] data_in67;
  input [7:0] data_in68;
  wire [7:0] data_in68;
  input [7:0] data_in69;
  wire [7:0] data_in69;
  input [7:0] data_in70;
  wire [7:0] data_in70;
  input [7:0] data_in71;
  wire [7:0] data_in71;
  input [7:0] data_in72;
  wire [7:0] data_in72;
  input [7:0] data_in73;
  wire [7:0] data_in73;
  input [7:0] data_in74;
  wire [7:0] data_in74;
  input [7:0] data_in75;
  wire [7:0] data_in75;
  input [7:0] data_in76;
  wire [7:0] data_in76;
  input [7:0] data_in77;
  wire [7:0] data_in77;
  input [7:0] data_in78;
  wire [7:0] data_in78;
  input [7:0] data_in81;
  wire [7:0] data_in81;
  input [7:0] data_in82;
  wire [7:0] data_in82;
  input [7:0] data_in83;
  wire [7:0] data_in83;
  input [7:0] data_in84;
  wire [7:0] data_in84;
  input [7:0] data_in85;
  wire [7:0] data_in85;
  input [7:0] data_in86;
  wire [7:0] data_in86;
  input [7:0] data_in87;
  wire [7:0] data_in87;
  input [7:0] data_in88;
  wire [7:0] data_in88;
  input [7:0] data_in89;
  wire [7:0] data_in89;
  input [7:0] data_in90;
  wire [7:0] data_in90;
  input [7:0] data_in91;
  wire [7:0] data_in91;
  input [7:0] data_in92;
  wire [7:0] data_in92;
  input [7:0] data_in93;
  wire [7:0] data_in93;
  input [7:0] data_in94;
  wire [7:0] data_in94;
  input [7:0] data_in97;
  wire [7:0] data_in97;
  input [7:0] data_in98;
  wire [7:0] data_in98;
  input [7:0] data_in99;
  wire [7:0] data_in99;
  input [7:0] data_in100;
  wire [7:0] data_in100;
  input [7:0] data_in101;
  wire [7:0] data_in101;
  input [7:0] data_in102;
  wire [7:0] data_in102;
  input [7:0] data_in103;
  wire [7:0] data_in103;
  input [7:0] data_in104;
  wire [7:0] data_in104;
  input [7:0] data_in105;
  wire [7:0] data_in105;
  input [7:0] data_in106;
  wire [7:0] data_in106;
  input [7:0] data_in107;
  wire [7:0] data_in107;
  input [7:0] data_in108;
  wire [7:0] data_in108;
  input [7:0] data_in109;
  wire [7:0] data_in109;
  input [7:0] data_in110;
  wire [7:0] data_in110;
  input [7:0] start;
  wire [7:0] start;
  input [7:0] goal;
  wire [7:0] goal;
  output [7:0] loot_out0;
  wire [7:0] loot_out0;
  output [7:0] loot_out1;
  wire [7:0] loot_out1;
  output [7:0] loot_out2;
  wire [7:0] loot_out2;
  output [7:0] loot_out3;
  wire [7:0] loot_out3;
  output [7:0] loot_out4;
  wire [7:0] loot_out4;
  output [7:0] loot_out5;
  wire [7:0] loot_out5;
  output [7:0] loot_out6;
  wire [7:0] loot_out6;
  output [7:0] loot_out7;
  wire [7:0] loot_out7;
  output [7:0] loot_out8;
  wire [7:0] loot_out8;
  output [7:0] loot_out9;
  wire [7:0] loot_out9;
  output [7:0] loot_out10;
  wire [7:0] loot_out10;
  output [7:0] loot_out11;
  wire [7:0] loot_out11;
  output [7:0] loot_out12;
  wire [7:0] loot_out12;
  output [7:0] loot_out13;
  wire [7:0] loot_out13;
  output [7:0] loot_out14;
  wire [7:0] loot_out14;
  output [7:0] loot_out15;
  wire [7:0] loot_out15;
  output [7:0] loot_out16;
  wire [7:0] loot_out16;
  output [7:0] loot_out17;
  wire [7:0] loot_out17;
  output [7:0] loot_out18;
  wire [7:0] loot_out18;
  output [7:0] loot_out19;
  wire [7:0] loot_out19;
  output [7:0] loot_out20;
  wire [7:0] loot_out20;
  output [7:0] loot_out21;
  wire [7:0] loot_out21;
  output [7:0] loot_out22;
  wire [7:0] loot_out22;
  output [7:0] loot_out23;
  wire [7:0] loot_out23;
  output [7:0] loot_out24;
  wire [7:0] loot_out24;
  output [7:0] loot_out25;
  wire [7:0] loot_out25;
  output [7:0] loot_out26;
  wire [7:0] loot_out26;
  output [7:0] loot_out27;
  wire [7:0] loot_out27;
  output [7:0] loot_out28;
  wire [7:0] loot_out28;
  output [7:0] loot_out29;
  wire [7:0] loot_out29;
  output [7:0] loot_out30;
  wire [7:0] loot_out30;
  output [7:0] loot_out31;
  wire [7:0] loot_out31;
  output [7:0] loot_out32;
  wire [7:0] loot_out32;
  output [7:0] loot_out33;
  wire [7:0] loot_out33;
  output [7:0] loot_out34;
  wire [7:0] loot_out34;
  output [7:0] loot_out35;
  wire [7:0] loot_out35;
  output [7:0] loot_out36;
  wire [7:0] loot_out36;
  output [7:0] loot_out37;
  wire [7:0] loot_out37;
  output [7:0] loot_out38;
  wire [7:0] loot_out38;
  output [7:0] loot_out39;
  wire [7:0] loot_out39;
  output [7:0] loot_out40;
  wire [7:0] loot_out40;
  output [7:0] loot_out41;
  wire [7:0] loot_out41;
  output [7:0] loot_out42;
  wire [7:0] loot_out42;
  output [7:0] loot_out43;
  wire [7:0] loot_out43;
  output [7:0] loot_out44;
  wire [7:0] loot_out44;
  output [7:0] loot_out45;
  wire [7:0] loot_out45;
  output [7:0] loot_out46;
  wire [7:0] loot_out46;
  output [7:0] loot_out47;
  wire [7:0] loot_out47;
  output [7:0] loot_out48;
  wire [7:0] loot_out48;
  output [7:0] loot_out49;
  wire [7:0] loot_out49;
  output [7:0] loot_out50;
  wire [7:0] loot_out50;
  output [7:0] loot_out51;
  wire [7:0] loot_out51;
  output [7:0] loot_out52;
  wire [7:0] loot_out52;
  output [7:0] loot_out53;
  wire [7:0] loot_out53;
  output [7:0] loot_out54;
  wire [7:0] loot_out54;
  output [7:0] loot_out55;
  wire [7:0] loot_out55;
  output [7:0] loot_out56;
  wire [7:0] loot_out56;
  output [7:0] loot_out57;
  wire [7:0] loot_out57;
  output [7:0] loot_out58;
  wire [7:0] loot_out58;
  output [7:0] loot_out59;
  wire [7:0] loot_out59;
  output [7:0] loot_out60;
  wire [7:0] loot_out60;
  output [7:0] loot_out61;
  wire [7:0] loot_out61;
  output [7:0] loot_out62;
  wire [7:0] loot_out62;
  output [7:0] loot_out63;
  wire [7:0] loot_out63;
  output [7:0] loot_out64;
  wire [7:0] loot_out64;
  output [7:0] loot_out65;
  wire [7:0] loot_out65;
  output [7:0] loot_out66;
  wire [7:0] loot_out66;
  output [7:0] loot_out67;
  wire [7:0] loot_out67;
  output [7:0] loot_out68;
  wire [7:0] loot_out68;
  output [7:0] loot_out69;
  wire [7:0] loot_out69;
  output [7:0] loot_out70;
  wire [7:0] loot_out70;
  output [7:0] loot_out71;
  wire [7:0] loot_out71;
  output [7:0] loot_out72;
  wire [7:0] loot_out72;
  output [7:0] loot_out73;
  wire [7:0] loot_out73;
  output [7:0] loot_out74;
  wire [7:0] loot_out74;
  output [7:0] loot_out75;
  wire [7:0] loot_out75;
  output [7:0] loot_out76;
  wire [7:0] loot_out76;
  output [7:0] loot_out77;
  wire [7:0] loot_out77;
  output [7:0] loot_out78;
  wire [7:0] loot_out78;
  output [7:0] loot_out79;
  wire [7:0] loot_out79;
  output [7:0] loot_out80;
  wire [7:0] loot_out80;
  output [7:0] loot_out81;
  wire [7:0] loot_out81;
  output [7:0] loot_out82;
  wire [7:0] loot_out82;
  output [7:0] loot_out83;
  wire [7:0] loot_out83;
  output [7:0] loot_out84;
  wire [7:0] loot_out84;
  output [7:0] loot_out85;
  wire [7:0] loot_out85;
  output [7:0] loot_out86;
  wire [7:0] loot_out86;
  output [7:0] loot_out87;
  wire [7:0] loot_out87;
  output [7:0] loot_out88;
  wire [7:0] loot_out88;
  output [7:0] loot_out89;
  wire [7:0] loot_out89;
  output [7:0] loot_out90;
  wire [7:0] loot_out90;
  output [7:0] loot_out91;
  wire [7:0] loot_out91;
  output [7:0] loot_out92;
  wire [7:0] loot_out92;
  output [7:0] loot_out93;
  wire [7:0] loot_out93;
  output [7:0] loot_out94;
  wire [7:0] loot_out94;
  output [7:0] loot_out95;
  wire [7:0] loot_out95;
  output [7:0] loot_out96;
  wire [7:0] loot_out96;
  output [7:0] loot_out97;
  wire [7:0] loot_out97;
  output [7:0] loot_out98;
  wire [7:0] loot_out98;
  output [7:0] loot_out99;
  wire [7:0] loot_out99;
  output [7:0] loot_out100;
  wire [7:0] loot_out100;
  output [7:0] loot_out101;
  wire [7:0] loot_out101;
  output [7:0] loot_out102;
  wire [7:0] loot_out102;
  output [7:0] loot_out103;
  wire [7:0] loot_out103;
  output [7:0] loot_out104;
  wire [7:0] loot_out104;
  output [7:0] loot_out105;
  wire [7:0] loot_out105;
  output [7:0] loot_out106;
  wire [7:0] loot_out106;
  output [7:0] loot_out107;
  wire [7:0] loot_out107;
  output [7:0] loot_out108;
  wire [7:0] loot_out108;
  output [7:0] loot_out109;
  wire [7:0] loot_out109;
  output [7:0] loot_out110;
  wire [7:0] loot_out110;
  input in_do;
  wire in_do;
  output out_do;
  wire out_do;
  reg [7:0] cost [0:59];
  reg [7:0] map [0:127];
  wire loot;
  reg [9:0] start_reg;
  reg [9:0] goal_reg;
  reg [9:0] count;
  wire [9:0] move_out;
  reg [9:0] nowplot;
  wire [7:0] move_1;
  wire [7:0] move_2;
  wire [7:0] enelgy_1;
  wire [7:0] enelgy_2;
  wire [7:0] _min_select_x_inene1;
  wire [7:0] _min_select_x_inene2;
  wire [7:0] _min_select_x_ud_lr1;
  wire [7:0] _min_select_x_ud_lr2;
  wire [7:0] _min_select_x_outene;
  wire [7:0] _min_select_x_outplot;
  wire _min_select_x_min_select_exe;
  wire _min_select_x_p_reset;
  wire _min_select_x_m_clock;
  wire [7:0] _min_select_x_2_inene1;
  wire [7:0] _min_select_x_2_inene2;
  wire [7:0] _min_select_x_2_ud_lr1;
  wire [7:0] _min_select_x_2_ud_lr2;
  wire [7:0] _min_select_x_2_outene;
  wire [7:0] _min_select_x_2_outplot;
  wire _min_select_x_2_min_select_exe;
  wire _min_select_x_2_p_reset;
  wire _min_select_x_2_m_clock;
  wire [7:0] _min_select_x_1_inene1;
  wire [7:0] _min_select_x_1_inene2;
  wire [7:0] _min_select_x_1_ud_lr1;
  wire [7:0] _min_select_x_1_ud_lr2;
  wire [7:0] _min_select_x_1_outene;
  wire [7:0] _min_select_x_1_outplot;
  wire _min_select_x_1_min_select_exe;
  wire _min_select_x_1_p_reset;
  wire _min_select_x_1_m_clock;
  reg _reg_0;
  reg _reg_1;
  reg _reg_2;
  reg _reg_3;
  wire _net_4;
  wire _reg_1_goto;
  wire _reg_2_goin;
  reg _reg_8;
  reg _reg_9;
  wire [6:0] _net_10;
  wire [7:0] _net_11;
  wire [6:0] _net_12;
  wire [7:0] _net_13;
  wire [6:0] _net_14;
  wire [7:0] _net_15;
  wire [6:0] _net_16;
  wire [7:0] _net_17;
  wire [5:0] _net_18;
  wire [9:0] _net_19;
min_select min_select_x (.m_clock(m_clock), .p_reset( p_reset), .min_select_exe(_min_select_x_min_select_exe), .outene(_min_select_x_outene), .outplot(_min_select_x_outplot), .inene1(_min_select_x_inene1), .inene2(_min_select_x_inene2), .ud_lr1(_min_select_x_ud_lr1), .ud_lr2(_min_select_x_ud_lr2));
min_select min_select_x_2 (.m_clock(m_clock), .p_reset( p_reset), .min_select_exe(_min_select_x_2_min_select_exe), .outene(_min_select_x_2_outene), .outplot(_min_select_x_2_outplot), .inene1(_min_select_x_2_inene1), .inene2(_min_select_x_2_inene2), .ud_lr1(_min_select_x_2_ud_lr1), .ud_lr2(_min_select_x_2_ud_lr2));
min_select min_select_x_1 (.m_clock(m_clock), .p_reset( p_reset), .min_select_exe(_min_select_x_1_min_select_exe), .outene(_min_select_x_1_outene), .outplot(_min_select_x_1_outplot), .inene1(_min_select_x_1_inene1), .inene2(_min_select_x_1_inene2), .ud_lr1(_min_select_x_1_ud_lr1), .ud_lr2(_min_select_x_1_ud_lr2));


// synthesis translate_off
// synopsys translate_off
always @(posedge loot)
  begin
#1 if (loot===1'bx)
 begin
$display("Warning: control hazard(kouka:loot) at %d",$time);
 end
#1 if (((_reg_2)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_2 || 1'b1) line 178 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  loot = _reg_2;
   assign  move_out = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_min_select_x_2_outplot:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  move_1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_min_select_x_outplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  move_2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_min_select_x_1_outplot:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  enelgy_1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_min_select_x_outene:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  enelgy_2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_min_select_x_1_outene:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_inene1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_net_11:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_inene2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_net_13:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_ud_lr1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot-10'b0000000001):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_ud_lr2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot+10'b0000000001):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _min_select_x_min_select_exe)
  begin
#1 if (_min_select_x_min_select_exe===1'bx)
 begin
$display("Warning: control hazard(kouka:_min_select_x_min_select_exe) at %d",$time);
 end
#1 if (((_reg_8)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_8 || 1'b1) line 211 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _min_select_x_min_select_exe = _reg_8;
   assign  _min_select_x_p_reset = p_reset;
   assign  _min_select_x_m_clock = m_clock;
   assign  _min_select_x_2_inene1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?enelgy_1:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_2_inene2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?enelgy_2:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_2_ud_lr1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?move_1:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_2_ud_lr2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?move_2:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _min_select_x_2_min_select_exe)
  begin
#1 if (_min_select_x_2_min_select_exe===1'bx)
 begin
$display("Warning: control hazard(kouka:_min_select_x_2_min_select_exe) at %d",$time);
 end
#1 if (((_reg_8)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_8 || 1'b1) line 215 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _min_select_x_2_min_select_exe = _reg_8;
   assign  _min_select_x_2_p_reset = p_reset;
   assign  _min_select_x_2_m_clock = m_clock;
   assign  _min_select_x_1_inene1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_net_15:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_1_inene2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?_net_17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_1_ud_lr1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot-10'b0000010000):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _min_select_x_1_ud_lr2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot+10'b0000010000):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _min_select_x_1_min_select_exe)
  begin
#1 if (_min_select_x_1_min_select_exe===1'bx)
 begin
$display("Warning: control hazard(kouka:_min_select_x_1_min_select_exe) at %d",$time);
 end
#1 if (((_reg_8)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_8 || 1'b1) line 213 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _min_select_x_1_min_select_exe = _reg_8;
   assign  _min_select_x_1_p_reset = p_reset;
   assign  _min_select_x_1_m_clock = m_clock;
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(_reg_1)? 
// synthesis translate_on
// synopsys translate_on
((_reg_1)?(nowplot != goal_reg):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _reg_1_goto)
  begin
#1 if (_reg_1_goto===1'bx)
 begin
$display("Warning: control hazard(kouka:_reg_1_goto) at %d",$time);
 end
#1 if ((((_reg_1&_net_4))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_1&_net_4) || 1'b1) line 183 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _reg_1_goto = (_reg_1&_net_4);

// synthesis translate_off
// synopsys translate_off
always @(posedge _reg_2_goin)
  begin
#1 if (_reg_2_goin===1'bx)
 begin
$display("Warning: control hazard(kouka:_reg_2_goin) at %d",$time);
 end
#1 if ((((_reg_1&_net_4))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_1&_net_4) || 1'b1) line 183 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _reg_2_goin = (_reg_1&_net_4);

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if((_reg_1&_net_4))
    begin
    $display("move_out %d",move_out);
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_reg_1)
    begin
    $display("inout %b",(nowplot != goal_reg));
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_reg_2)
    begin
    $display("start %d goal %d",start_reg,goal_reg);
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  _net_10 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot-10'b0000000001):7'b0)
// synthesis translate_off
// synopsys translate_off
:7'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(map[_net_10]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_12 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot+10'b0000000001):7'b0)
// synthesis translate_off
// synopsys translate_off
:7'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_13 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(map[_net_12]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_14 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot-10'b0000010000):7'b0)
// synthesis translate_off
// synopsys translate_off
:7'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_15 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(map[_net_14]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_16 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(nowplot+10'b0000010000):7'b0)
// synthesis translate_off
// synopsys translate_off
:7'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_17 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(map[_net_16]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_18 = 
// synthesis translate_off
// synopsys translate_off
((loot|_reg_9))? 
// synthesis translate_on
// synopsys translate_on
(((loot|_reg_9))?(_net_19[5:0]):6'b0)
// synthesis translate_off
// synopsys translate_off
:6'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_19 = count;
   assign  loot_out0 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out1 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out2 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out3 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out4 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out5 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out6 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out7 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b000111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out8 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out9 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out10 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out11 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out12 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out13 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out14 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out15 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b001111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out16 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out17 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out18 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out19 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out20 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out21 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out22 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out23 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b010111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out24 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out25 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out26 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out27 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out28 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out29 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out30 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out31 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b011111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out32 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out33 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out34 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out35 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out36 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out37 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out38 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out39 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b100111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out40 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out41 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out42 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out43 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out44 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out45 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out46 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out47 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b101111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out48 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out49 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out50 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out51 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out52 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110100]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out53 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110101]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out54 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110110]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out55 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b110111]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out56 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b111000]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out57 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b111001]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out58 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b111010]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  loot_out59 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?(cost[6'b111011]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge out_do)
  begin
#1 if (out_do===1'bx)
 begin
$display("Warning: control hazard(kouka:out_do) at %d",$time);
 end
#1 if (((_reg_0)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_0 || 1'b1) line 195 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  out_do = _reg_0;
initial begin
    cost[0] = 8'b00000000;
    cost[1] = 8'b00000000;
    cost[2] = 8'b00000000;
    cost[3] = 8'b00000000;
    cost[4] = 8'b00000000;
    cost[5] = 8'b00000000;
    cost[6] = 8'b00000000;
    cost[7] = 8'b00000000;
    cost[8] = 8'b00000000;
    cost[9] = 8'b00000000;
    cost[10] = 8'b00000000;
    cost[11] = 8'b00000000;
    cost[12] = 8'b00000000;
    cost[13] = 8'b00000000;
    cost[14] = 8'b00000000;
    cost[15] = 8'b00000000;
    cost[16] = 8'b00000000;
    cost[17] = 8'b00000000;
    cost[18] = 8'b00000000;
    cost[19] = 8'b00000000;
    cost[20] = 8'b00000000;
    cost[21] = 8'b00000000;
    cost[22] = 8'b00000000;
    cost[23] = 8'b00000000;
    cost[24] = 8'b00000000;
    cost[25] = 8'b00000000;
    cost[26] = 8'b00000000;
    cost[27] = 8'b00000000;
    cost[28] = 8'b00000000;
    cost[29] = 8'b00000000;
    cost[30] = 8'b00000000;
    cost[31] = 8'b00000000;
    cost[32] = 8'b00000000;
    cost[33] = 8'b00000000;
    cost[34] = 8'b00000000;
    cost[35] = 8'b00000000;
    cost[36] = 8'b00000000;
    cost[37] = 8'b00000000;
    cost[38] = 8'b00000000;
    cost[39] = 8'b00000000;
    cost[40] = 8'b00000000;
    cost[41] = 8'b00000000;
    cost[42] = 8'b00000000;
    cost[43] = 8'b00000000;
    cost[44] = 8'b00000000;
    cost[45] = 8'b00000000;
    cost[46] = 8'b00000000;
    cost[47] = 8'b00000000;
    cost[48] = 8'b00000000;
    cost[49] = 8'b00000000;
    cost[50] = 8'b00000000;
    cost[51] = 8'b00000000;
    cost[52] = 8'b00000000;
    cost[53] = 8'b00000000;
    cost[54] = 8'b00000000;
    cost[55] = 8'b00000000;
    cost[56] = 8'b00000000;
    cost[57] = 8'b00000000;
    cost[58] = 8'b00000000;
    cost[59] = 8'b00000000;
end
always @(posedge m_clock)
  begin
   if ((loot|_reg_9) )
     cost[_net_18] <= nowplot;
end
initial begin
    map[0] = 8'b00000000;
    map[1] = 8'b00000000;
    map[2] = 8'b00000000;
    map[3] = 8'b00000000;
    map[4] = 8'b00000000;
    map[5] = 8'b00000000;
    map[6] = 8'b00000000;
    map[7] = 8'b00000000;
    map[8] = 8'b00000000;
    map[9] = 8'b00000000;
    map[10] = 8'b00000000;
    map[11] = 8'b00000000;
    map[12] = 8'b00000000;
    map[13] = 8'b00000000;
    map[14] = 8'b00000000;
    map[15] = 8'b00000000;
    map[16] = 8'b00000000;
    map[17] = 8'b00000000;
    map[18] = 8'b00000000;
    map[19] = 8'b00000000;
    map[20] = 8'b00000000;
    map[21] = 8'b00000000;
    map[22] = 8'b00000000;
    map[23] = 8'b00000000;
    map[24] = 8'b00000000;
    map[25] = 8'b00000000;
    map[26] = 8'b00000000;
    map[27] = 8'b00000000;
    map[28] = 8'b00000000;
    map[29] = 8'b00000000;
    map[30] = 8'b00000000;
    map[31] = 8'b00000000;
    map[32] = 8'b00000000;
    map[33] = 8'b00000000;
    map[34] = 8'b00000000;
    map[35] = 8'b00000000;
    map[36] = 8'b00000000;
    map[37] = 8'b00000000;
    map[38] = 8'b00000000;
    map[39] = 8'b00000000;
    map[40] = 8'b00000000;
    map[41] = 8'b00000000;
    map[42] = 8'b00000000;
    map[43] = 8'b00000000;
    map[44] = 8'b00000000;
    map[45] = 8'b00000000;
    map[46] = 8'b00000000;
    map[47] = 8'b00000000;
    map[48] = 8'b00000000;
    map[49] = 8'b00000000;
    map[50] = 8'b00000000;
    map[51] = 8'b00000000;
    map[52] = 8'b00000000;
    map[53] = 8'b00000000;
    map[54] = 8'b00000000;
    map[55] = 8'b00000000;
    map[56] = 8'b00000000;
    map[57] = 8'b00000000;
    map[58] = 8'b00000000;
    map[59] = 8'b00000000;
    map[60] = 8'b00000000;
    map[61] = 8'b00000000;
    map[62] = 8'b00000000;
    map[63] = 8'b00000000;
    map[64] = 8'b00000000;
    map[65] = 8'b00000000;
    map[66] = 8'b00000000;
    map[67] = 8'b00000000;
    map[68] = 8'b00000000;
    map[69] = 8'b00000000;
    map[70] = 8'b00000000;
    map[71] = 8'b00000000;
    map[72] = 8'b00000000;
    map[73] = 8'b00000000;
    map[74] = 8'b00000000;
    map[75] = 8'b00000000;
    map[76] = 8'b00000000;
    map[77] = 8'b00000000;
    map[78] = 8'b00000000;
    map[79] = 8'b00000000;
    map[80] = 8'b00000000;
    map[81] = 8'b00000000;
    map[82] = 8'b00000000;
    map[83] = 8'b00000000;
    map[84] = 8'b00000000;
    map[85] = 8'b00000000;
    map[86] = 8'b00000000;
    map[87] = 8'b00000000;
    map[88] = 8'b00000000;
    map[89] = 8'b00000000;
    map[90] = 8'b00000000;
    map[91] = 8'b00000000;
    map[92] = 8'b00000000;
    map[93] = 8'b00000000;
    map[94] = 8'b00000000;
    map[95] = 8'b00000000;
    map[96] = 8'b00000000;
    map[97] = 8'b00000000;
    map[98] = 8'b00000000;
    map[99] = 8'b00000000;
    map[100] = 8'b00000000;
    map[101] = 8'b00000000;
    map[102] = 8'b00000000;
    map[103] = 8'b00000000;
    map[104] = 8'b00000000;
    map[105] = 8'b00000000;
    map[106] = 8'b00000000;
    map[107] = 8'b00000000;
    map[108] = 8'b00000000;
    map[109] = 8'b00000000;
    map[110] = 8'b00000000;
    map[111] = 8'b00000000;
    map[112] = 8'b00000000;
    map[113] = 8'b00000000;
    map[114] = 8'b00000000;
    map[115] = 8'b00000000;
    map[116] = 8'b00000000;
    map[117] = 8'b00000000;
    map[118] = 8'b00000000;
    map[119] = 8'b00000000;
    map[120] = 8'b00000000;
    map[121] = 8'b00000000;
    map[122] = 8'b00000000;
    map[123] = 8'b00000000;
    map[124] = 8'b00000000;
    map[125] = 8'b00000000;
    map[126] = 8'b00000000;
    map[127] = 8'b00000000;
end
always @(posedge m_clock)
  begin
   if ((in_do|_reg_3) )
     map[7'b0000000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111110] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111101] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111100] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111011] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111010] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111001] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1111000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110110] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110101] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110100] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110011] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110010] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110001] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1110000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1101111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1101110] <= data_in110;
   if ((in_do|_reg_3) )
     map[7'b1101101] <= data_in109;
   if ((in_do|_reg_3) )
     map[7'b1101100] <= data_in108;
   if ((in_do|_reg_3) )
     map[7'b1101011] <= data_in107;
   if ((in_do|_reg_3) )
     map[7'b1101010] <= data_in106;
   if ((in_do|_reg_3) )
     map[7'b1101001] <= data_in105;
   if ((in_do|_reg_3) )
     map[7'b1101000] <= data_in104;
   if ((in_do|_reg_3) )
     map[7'b1100111] <= data_in103;
   if ((in_do|_reg_3) )
     map[7'b1100110] <= data_in102;
   if ((in_do|_reg_3) )
     map[7'b1100101] <= data_in101;
   if ((in_do|_reg_3) )
     map[7'b1100100] <= data_in100;
   if ((in_do|_reg_3) )
     map[7'b1100011] <= data_in99;
   if ((in_do|_reg_3) )
     map[7'b1100010] <= data_in98;
   if ((in_do|_reg_3) )
     map[7'b1100001] <= data_in97;
   if ((in_do|_reg_3) )
     map[7'b1100000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1011111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1011110] <= data_in94;
   if ((in_do|_reg_3) )
     map[7'b1011101] <= data_in93;
   if ((in_do|_reg_3) )
     map[7'b1011100] <= data_in92;
   if ((in_do|_reg_3) )
     map[7'b1011011] <= data_in91;
   if ((in_do|_reg_3) )
     map[7'b1011010] <= data_in90;
   if ((in_do|_reg_3) )
     map[7'b1011001] <= data_in89;
   if ((in_do|_reg_3) )
     map[7'b1011000] <= data_in88;
   if ((in_do|_reg_3) )
     map[7'b1010111] <= data_in87;
   if ((in_do|_reg_3) )
     map[7'b1010110] <= data_in86;
   if ((in_do|_reg_3) )
     map[7'b1010101] <= data_in85;
   if ((in_do|_reg_3) )
     map[7'b1010100] <= data_in84;
   if ((in_do|_reg_3) )
     map[7'b1010011] <= data_in83;
   if ((in_do|_reg_3) )
     map[7'b1010010] <= data_in82;
   if ((in_do|_reg_3) )
     map[7'b1010001] <= data_in81;
   if ((in_do|_reg_3) )
     map[7'b1010000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1001111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b1001110] <= data_in78;
   if ((in_do|_reg_3) )
     map[7'b1001101] <= data_in77;
   if ((in_do|_reg_3) )
     map[7'b1001100] <= data_in76;
   if ((in_do|_reg_3) )
     map[7'b1001011] <= data_in75;
   if ((in_do|_reg_3) )
     map[7'b1001010] <= data_in74;
   if ((in_do|_reg_3) )
     map[7'b1001001] <= data_in73;
   if ((in_do|_reg_3) )
     map[7'b1001000] <= data_in72;
   if ((in_do|_reg_3) )
     map[7'b1000111] <= data_in71;
   if ((in_do|_reg_3) )
     map[7'b1000110] <= data_in70;
   if ((in_do|_reg_3) )
     map[7'b1000101] <= data_in69;
   if ((in_do|_reg_3) )
     map[7'b1000100] <= data_in68;
   if ((in_do|_reg_3) )
     map[7'b1000011] <= data_in67;
   if ((in_do|_reg_3) )
     map[7'b1000010] <= data_in66;
   if ((in_do|_reg_3) )
     map[7'b1000001] <= data_in65;
   if ((in_do|_reg_3) )
     map[7'b1000000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0111111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0111110] <= data_in62;
   if ((in_do|_reg_3) )
     map[7'b0111101] <= data_in61;
   if ((in_do|_reg_3) )
     map[7'b0111100] <= data_in60;
   if ((in_do|_reg_3) )
     map[7'b0111011] <= data_in59;
   if ((in_do|_reg_3) )
     map[7'b0111010] <= data_in58;
   if ((in_do|_reg_3) )
     map[7'b0111001] <= data_in57;
   if ((in_do|_reg_3) )
     map[7'b0111000] <= data_in56;
   if ((in_do|_reg_3) )
     map[7'b0110111] <= data_in55;
   if ((in_do|_reg_3) )
     map[7'b0110110] <= data_in54;
   if ((in_do|_reg_3) )
     map[7'b0110101] <= data_in53;
   if ((in_do|_reg_3) )
     map[7'b0110100] <= data_in52;
   if ((in_do|_reg_3) )
     map[7'b0110011] <= data_in51;
   if ((in_do|_reg_3) )
     map[7'b0110010] <= data_in50;
   if ((in_do|_reg_3) )
     map[7'b0110001] <= data_in49;
   if ((in_do|_reg_3) )
     map[7'b0110000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0101111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0101110] <= data_in46;
   if ((in_do|_reg_3) )
     map[7'b0101101] <= data_in45;
   if ((in_do|_reg_3) )
     map[7'b0101100] <= data_in44;
   if ((in_do|_reg_3) )
     map[7'b0101011] <= data_in43;
   if ((in_do|_reg_3) )
     map[7'b0101010] <= data_in42;
   if ((in_do|_reg_3) )
     map[7'b0101001] <= data_in41;
   if ((in_do|_reg_3) )
     map[7'b0101000] <= data_in40;
   if ((in_do|_reg_3) )
     map[7'b0100111] <= data_in39;
   if ((in_do|_reg_3) )
     map[7'b0100110] <= data_in38;
   if ((in_do|_reg_3) )
     map[7'b0100101] <= data_in37;
   if ((in_do|_reg_3) )
     map[7'b0100100] <= data_in36;
   if ((in_do|_reg_3) )
     map[7'b0100011] <= data_in35;
   if ((in_do|_reg_3) )
     map[7'b0100010] <= data_in34;
   if ((in_do|_reg_3) )
     map[7'b0100001] <= data_in33;
   if ((in_do|_reg_3) )
     map[7'b0100000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0011111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0011110] <= data_in30;
   if ((in_do|_reg_3) )
     map[7'b0011101] <= data_in29;
   if ((in_do|_reg_3) )
     map[7'b0011100] <= data_in28;
   if ((in_do|_reg_3) )
     map[7'b0011011] <= data_in27;
   if ((in_do|_reg_3) )
     map[7'b0011010] <= data_in26;
   if ((in_do|_reg_3) )
     map[7'b0011001] <= data_in25;
   if ((in_do|_reg_3) )
     map[7'b0011000] <= data_in24;
   if ((in_do|_reg_3) )
     map[7'b0010111] <= data_in23;
   if ((in_do|_reg_3) )
     map[7'b0010110] <= data_in22;
   if ((in_do|_reg_3) )
     map[7'b0010101] <= data_in21;
   if ((in_do|_reg_3) )
     map[7'b0010100] <= data_in20;
   if ((in_do|_reg_3) )
     map[7'b0010011] <= data_in19;
   if ((in_do|_reg_3) )
     map[7'b0010010] <= data_in18;
   if ((in_do|_reg_3) )
     map[7'b0010001] <= data_in17;
   if ((in_do|_reg_3) )
     map[7'b0010000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001110] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001101] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001100] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001011] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001010] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001001] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0001000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000111] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000110] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000101] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000100] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000011] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000010] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000001] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
   if ((in_do|_reg_3) )
     map[7'b0000000] <= ({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1});
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     start_reg <= 8'b00000000;
else if ((in_do|_reg_3))
      start_reg <= start;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     goal_reg <= 8'b00000000;
else if ((in_do|_reg_3))
      goal_reg <= goal;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     count <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((_reg_8&(in_do|_reg_3)))   count <= 10'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (_reg_8)
      count <= (count+10'b0000000001);
else if ((in_do|_reg_3))
      count <= 8'b00000000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((_reg_8|(in_do|_reg_3))==1'b1) ||
 ((_reg_8|(in_do|_reg_3))==1'b0) ) begin
 if ((_reg_8&(in_do|_reg_3)))
 begin $display("Warning: assign collision(kouka:count) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(kouka:count) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     nowplot <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((_reg_8&(in_do|_reg_3)))   nowplot <= 10'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if (_reg_8)
      nowplot <= move_out;
else if ((in_do|_reg_3))
      nowplot <= start;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((_reg_8|(in_do|_reg_3))==1'b1) ||
 ((_reg_8|(in_do|_reg_3))==1'b0) ) begin
 if ((_reg_8&(in_do|_reg_3)))
 begin $display("Warning: assign collision(kouka:nowplot) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(kouka:nowplot) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_0 <= 1'b0;
else if ((_reg_0|_reg_1))
      _reg_0 <= (_reg_1&(~_reg_1_goto));
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_1 <= 1'b0;
else if ((_reg_1|_reg_2))
      _reg_1 <= _reg_2;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_2 <= 1'b0;
else if ((((_reg_1&_net_4)|in_do)|(_reg_2|_reg_3)))
      _reg_2 <= (((_reg_1&_net_4)|_reg_3)|in_do);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_3 <= 1'b0;
else if (_reg_3)
      _reg_3 <= 1'b0;
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_8 <= 1'b0;
else if ((loot|(_reg_8|_reg_9)))
      _reg_8 <= (_reg_9|loot);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_9 <= 1'b0;
else if (_reg_9)
      _reg_9 <= 1'b0;
end
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:44:03 2024
 Licensed to :EVALUATION USER*/
