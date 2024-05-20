// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:57:00 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module kanwa ( p_reset , m_clock , data_in17 , data_in18 , data_in19 , data_in20 , data_in21 , data_in22 , data_in23 , data_in24 , data_in25 , data_in26 , data_in27 , data_in28 , data_in29 , data_in30 , data_in33 , data_in34 , data_in35 , data_in36 , data_in37 , data_in38 , data_in39 , data_in40 , data_in41 , data_in42 , data_in43 , data_in44 , data_in45 , data_in46 , data_in49 , data_in50 , data_in51 , data_in52 , data_in53 , data_in54 , data_in55 , data_in56 , data_in57 , data_in58 , data_in59 , data_in60 , data_in61 , data_in62 , data_in65 , data_in66 , data_in67 , data_in68 , data_in69 , data_in70 , data_in71 , data_in72 , data_in73 , data_in74 , data_in75 , data_in76 , data_in77 , data_in78 , data_in81 , data_in82 , data_in83 , data_in84 , data_in85 , data_in86 , data_in87 , data_in88 , data_in89 , data_in90 , data_in91 , data_in92 , data_in93 , data_in94 , data_in97 , data_in98 , data_in99 , data_in100 , data_in101 , data_in102 , data_in103 , data_in104 , data_in105 , data_in106 , data_in107 , data_in108 , data_in109 , data_in110 , start , goal , data_out17 , data_out18 , data_out19 , data_out20 , data_out21 , data_out22 , data_out23 , data_out24 , data_out25 , data_out26 , data_out27 , data_out28 , data_out29 , data_out30 , data_out33 , data_out34 , data_out35 , data_out36 , data_out37 , data_out38 , data_out39 , data_out40 , data_out41 , data_out42 , data_out43 , data_out44 , data_out45 , data_out46 , data_out49 , data_out50 , data_out51 , data_out52 , data_out53 , data_out54 , data_out55 , data_out56 , data_out57 , data_out58 , data_out59 , data_out60 , data_out61 , data_out62 , data_out65 , data_out66 , data_out67 , data_out68 , data_out69 , data_out70 , data_out71 , data_out72 , data_out73 , data_out74 , data_out75 , data_out76 , data_out77 , data_out78 , data_out81 , data_out82 , data_out83 , data_out84 , data_out85 , data_out86 , data_out87 , data_out88 , data_out89 , data_out90 , data_out91 , data_out92 , data_out93 , data_out94 , data_out97 , data_out98 , data_out99 , data_out100 , data_out101 , data_out102 , data_out103 , data_out104 , data_out105 , data_out106 , data_out107 , data_out108 , data_out109 , data_out110 , in_do , out_do );
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
  output [7:0] data_out17;
  wire [7:0] data_out17;
  output [7:0] data_out18;
  wire [7:0] data_out18;
  output [7:0] data_out19;
  wire [7:0] data_out19;
  output [7:0] data_out20;
  wire [7:0] data_out20;
  output [7:0] data_out21;
  wire [7:0] data_out21;
  output [7:0] data_out22;
  wire [7:0] data_out22;
  output [7:0] data_out23;
  wire [7:0] data_out23;
  output [7:0] data_out24;
  wire [7:0] data_out24;
  output [7:0] data_out25;
  wire [7:0] data_out25;
  output [7:0] data_out26;
  wire [7:0] data_out26;
  output [7:0] data_out27;
  wire [7:0] data_out27;
  output [7:0] data_out28;
  wire [7:0] data_out28;
  output [7:0] data_out29;
  wire [7:0] data_out29;
  output [7:0] data_out30;
  wire [7:0] data_out30;
  output [7:0] data_out33;
  wire [7:0] data_out33;
  output [7:0] data_out34;
  wire [7:0] data_out34;
  output [7:0] data_out35;
  wire [7:0] data_out35;
  output [7:0] data_out36;
  wire [7:0] data_out36;
  output [7:0] data_out37;
  wire [7:0] data_out37;
  output [7:0] data_out38;
  wire [7:0] data_out38;
  output [7:0] data_out39;
  wire [7:0] data_out39;
  output [7:0] data_out40;
  wire [7:0] data_out40;
  output [7:0] data_out41;
  wire [7:0] data_out41;
  output [7:0] data_out42;
  wire [7:0] data_out42;
  output [7:0] data_out43;
  wire [7:0] data_out43;
  output [7:0] data_out44;
  wire [7:0] data_out44;
  output [7:0] data_out45;
  wire [7:0] data_out45;
  output [7:0] data_out46;
  wire [7:0] data_out46;
  output [7:0] data_out49;
  wire [7:0] data_out49;
  output [7:0] data_out50;
  wire [7:0] data_out50;
  output [7:0] data_out51;
  wire [7:0] data_out51;
  output [7:0] data_out52;
  wire [7:0] data_out52;
  output [7:0] data_out53;
  wire [7:0] data_out53;
  output [7:0] data_out54;
  wire [7:0] data_out54;
  output [7:0] data_out55;
  wire [7:0] data_out55;
  output [7:0] data_out56;
  wire [7:0] data_out56;
  output [7:0] data_out57;
  wire [7:0] data_out57;
  output [7:0] data_out58;
  wire [7:0] data_out58;
  output [7:0] data_out59;
  wire [7:0] data_out59;
  output [7:0] data_out60;
  wire [7:0] data_out60;
  output [7:0] data_out61;
  wire [7:0] data_out61;
  output [7:0] data_out62;
  wire [7:0] data_out62;
  output [7:0] data_out65;
  wire [7:0] data_out65;
  output [7:0] data_out66;
  wire [7:0] data_out66;
  output [7:0] data_out67;
  wire [7:0] data_out67;
  output [7:0] data_out68;
  wire [7:0] data_out68;
  output [7:0] data_out69;
  wire [7:0] data_out69;
  output [7:0] data_out70;
  wire [7:0] data_out70;
  output [7:0] data_out71;
  wire [7:0] data_out71;
  output [7:0] data_out72;
  wire [7:0] data_out72;
  output [7:0] data_out73;
  wire [7:0] data_out73;
  output [7:0] data_out74;
  wire [7:0] data_out74;
  output [7:0] data_out75;
  wire [7:0] data_out75;
  output [7:0] data_out76;
  wire [7:0] data_out76;
  output [7:0] data_out77;
  wire [7:0] data_out77;
  output [7:0] data_out78;
  wire [7:0] data_out78;
  output [7:0] data_out81;
  wire [7:0] data_out81;
  output [7:0] data_out82;
  wire [7:0] data_out82;
  output [7:0] data_out83;
  wire [7:0] data_out83;
  output [7:0] data_out84;
  wire [7:0] data_out84;
  output [7:0] data_out85;
  wire [7:0] data_out85;
  output [7:0] data_out86;
  wire [7:0] data_out86;
  output [7:0] data_out87;
  wire [7:0] data_out87;
  output [7:0] data_out88;
  wire [7:0] data_out88;
  output [7:0] data_out89;
  wire [7:0] data_out89;
  output [7:0] data_out90;
  wire [7:0] data_out90;
  output [7:0] data_out91;
  wire [7:0] data_out91;
  output [7:0] data_out92;
  wire [7:0] data_out92;
  output [7:0] data_out93;
  wire [7:0] data_out93;
  output [7:0] data_out94;
  wire [7:0] data_out94;
  output [7:0] data_out97;
  wire [7:0] data_out97;
  output [7:0] data_out98;
  wire [7:0] data_out98;
  output [7:0] data_out99;
  wire [7:0] data_out99;
  output [7:0] data_out100;
  wire [7:0] data_out100;
  output [7:0] data_out101;
  wire [7:0] data_out101;
  output [7:0] data_out102;
  wire [7:0] data_out102;
  output [7:0] data_out103;
  wire [7:0] data_out103;
  output [7:0] data_out104;
  wire [7:0] data_out104;
  output [7:0] data_out105;
  wire [7:0] data_out105;
  output [7:0] data_out106;
  wire [7:0] data_out106;
  output [7:0] data_out107;
  wire [7:0] data_out107;
  output [7:0] data_out108;
  wire [7:0] data_out108;
  output [7:0] data_out109;
  wire [7:0] data_out109;
  output [7:0] data_out110;
  wire [7:0] data_out110;
  input in_do;
  wire in_do;
  output out_do;
  wire out_do;
  reg [2:0] kanwa_exit;
  reg [7:0] distance_count;
  wire dig_exit;
  reg [7:0] start_reg;
  reg [7:0] goal_reg;
  reg even;
  wire even_w1;
  wire [7:0] start_w;
  wire [7:0] goal_w;
  wire wall_w;
  wire [7:0] data_wire17;
  wire [7:0] data_wire18;
  wire [7:0] data_wire19;
  wire [7:0] data_wire20;
  wire [7:0] data_wire21;
  wire [7:0] data_wire22;
  wire [7:0] data_wire23;
  wire [7:0] data_wire24;
  wire [7:0] data_wire25;
  wire [7:0] data_wire26;
  wire [7:0] data_wire27;
  wire [7:0] data_wire28;
  wire [7:0] data_wire29;
  wire [7:0] data_wire30;
  wire [7:0] data_wire33;
  wire [7:0] data_wire34;
  wire [7:0] data_wire35;
  wire [7:0] data_wire36;
  wire [7:0] data_wire37;
  wire [7:0] data_wire38;
  wire [7:0] data_wire39;
  wire [7:0] data_wire40;
  wire [7:0] data_wire41;
  wire [7:0] data_wire42;
  wire [7:0] data_wire43;
  wire [7:0] data_wire44;
  wire [7:0] data_wire45;
  wire [7:0] data_wire46;
  wire [7:0] data_wire49;
  wire [7:0] data_wire50;
  wire [7:0] data_wire51;
  wire [7:0] data_wire52;
  wire [7:0] data_wire53;
  wire [7:0] data_wire54;
  wire [7:0] data_wire55;
  wire [7:0] data_wire56;
  wire [7:0] data_wire57;
  wire [7:0] data_wire58;
  wire [7:0] data_wire59;
  wire [7:0] data_wire60;
  wire [7:0] data_wire61;
  wire [7:0] data_wire62;
  wire [7:0] data_wire65;
  wire [7:0] data_wire66;
  wire [7:0] data_wire67;
  wire [7:0] data_wire68;
  wire [7:0] data_wire69;
  wire [7:0] data_wire70;
  wire [7:0] data_wire71;
  wire [7:0] data_wire72;
  wire [7:0] data_wire73;
  wire [7:0] data_wire74;
  wire [7:0] data_wire75;
  wire [7:0] data_wire76;
  wire [7:0] data_wire77;
  wire [7:0] data_wire78;
  wire [7:0] data_wire81;
  wire [7:0] data_wire82;
  wire [7:0] data_wire83;
  wire [7:0] data_wire84;
  wire [7:0] data_wire85;
  wire [7:0] data_wire86;
  wire [7:0] data_wire87;
  wire [7:0] data_wire88;
  wire [7:0] data_wire89;
  wire [7:0] data_wire90;
  wire [7:0] data_wire91;
  wire [7:0] data_wire92;
  wire [7:0] data_wire93;
  wire [7:0] data_wire94;
  wire [7:0] data_wire97;
  wire [7:0] data_wire98;
  wire [7:0] data_wire99;
  wire [7:0] data_wire100;
  wire [7:0] data_wire101;
  wire [7:0] data_wire102;
  wire [7:0] data_wire103;
  wire [7:0] data_wire104;
  wire [7:0] data_wire105;
  wire [7:0] data_wire106;
  wire [7:0] data_wire107;
  wire [7:0] data_wire108;
  wire [7:0] data_wire109;
  wire [7:0] data_wire110;
  wire [7:0] org17;
  wire [7:0] org18;
  wire [7:0] org19;
  wire [7:0] org20;
  wire [7:0] org21;
  wire [7:0] org22;
  wire [7:0] org23;
  wire [7:0] org24;
  wire [7:0] org25;
  wire [7:0] org26;
  wire [7:0] org27;
  wire [7:0] org28;
  wire [7:0] org29;
  wire [7:0] org30;
  wire [7:0] org33;
  wire [7:0] org34;
  wire [7:0] org35;
  wire [7:0] org36;
  wire [7:0] org37;
  wire [7:0] org38;
  wire [7:0] org39;
  wire [7:0] org40;
  wire [7:0] org41;
  wire [7:0] org42;
  wire [7:0] org43;
  wire [7:0] org44;
  wire [7:0] org45;
  wire [7:0] org46;
  wire [7:0] org49;
  wire [7:0] org50;
  wire [7:0] org51;
  wire [7:0] org52;
  wire [7:0] org53;
  wire [7:0] org54;
  wire [7:0] org55;
  wire [7:0] org56;
  wire [7:0] org57;
  wire [7:0] org58;
  wire [7:0] org59;
  wire [7:0] org60;
  wire [7:0] org61;
  wire [7:0] org62;
  wire [7:0] org65;
  wire [7:0] org66;
  wire [7:0] org67;
  wire [7:0] org68;
  wire [7:0] org69;
  wire [7:0] org70;
  wire [7:0] org71;
  wire [7:0] org72;
  wire [7:0] org73;
  wire [7:0] org74;
  wire [7:0] org75;
  wire [7:0] org76;
  wire [7:0] org77;
  wire [7:0] org78;
  wire [7:0] org81;
  wire [7:0] org82;
  wire [7:0] org83;
  wire [7:0] org84;
  wire [7:0] org85;
  wire [7:0] org86;
  wire [7:0] org87;
  wire [7:0] org88;
  wire [7:0] org89;
  wire [7:0] org90;
  wire [7:0] org91;
  wire [7:0] org92;
  wire [7:0] org93;
  wire [7:0] org94;
  wire [7:0] org97;
  wire [7:0] org98;
  wire [7:0] org99;
  wire [7:0] org100;
  wire [7:0] org101;
  wire [7:0] org102;
  wire [7:0] org103;
  wire [7:0] org104;
  wire [7:0] org105;
  wire [7:0] org106;
  wire [7:0] org107;
  wire [7:0] org108;
  wire [7:0] org109;
  wire [7:0] org110;
  wire [1:0] sg17;
  wire [1:0] sg18;
  wire [1:0] sg19;
  wire [1:0] sg20;
  wire [1:0] sg21;
  wire [1:0] sg22;
  wire [1:0] sg23;
  wire [1:0] sg24;
  wire [1:0] sg25;
  wire [1:0] sg26;
  wire [1:0] sg27;
  wire [1:0] sg28;
  wire [1:0] sg29;
  wire [1:0] sg30;
  wire [1:0] sg33;
  wire [1:0] sg34;
  wire [1:0] sg35;
  wire [1:0] sg36;
  wire [1:0] sg37;
  wire [1:0] sg38;
  wire [1:0] sg39;
  wire [1:0] sg40;
  wire [1:0] sg41;
  wire [1:0] sg42;
  wire [1:0] sg43;
  wire [1:0] sg44;
  wire [1:0] sg45;
  wire [1:0] sg46;
  wire [1:0] sg49;
  wire [1:0] sg50;
  wire [1:0] sg51;
  wire [1:0] sg52;
  wire [1:0] sg53;
  wire [1:0] sg54;
  wire [1:0] sg55;
  wire [1:0] sg56;
  wire [1:0] sg57;
  wire [1:0] sg58;
  wire [1:0] sg59;
  wire [1:0] sg60;
  wire [1:0] sg61;
  wire [1:0] sg62;
  wire [1:0] sg65;
  wire [1:0] sg66;
  wire [1:0] sg67;
  wire [1:0] sg68;
  wire [1:0] sg69;
  wire [1:0] sg70;
  wire [1:0] sg71;
  wire [1:0] sg72;
  wire [1:0] sg73;
  wire [1:0] sg74;
  wire [1:0] sg75;
  wire [1:0] sg76;
  wire [1:0] sg77;
  wire [1:0] sg78;
  wire [1:0] sg81;
  wire [1:0] sg82;
  wire [1:0] sg83;
  wire [1:0] sg84;
  wire [1:0] sg85;
  wire [1:0] sg86;
  wire [1:0] sg87;
  wire [1:0] sg88;
  wire [1:0] sg89;
  wire [1:0] sg90;
  wire [1:0] sg91;
  wire [1:0] sg92;
  wire [1:0] sg93;
  wire [1:0] sg94;
  wire [1:0] sg97;
  wire [1:0] sg98;
  wire [1:0] sg99;
  wire [1:0] sg100;
  wire [1:0] sg101;
  wire [1:0] sg102;
  wire [1:0] sg103;
  wire [1:0] sg104;
  wire [1:0] sg105;
  wire [1:0] sg106;
  wire [1:0] sg107;
  wire [1:0] sg108;
  wire [1:0] sg109;
  wire [1:0] sg110;
  wire [127:0] wall_end_wire;
  wire [7:0] distance_wire;
  wire [127:0] all_s_g17;
  wire [127:0] all_s_g18;
  wire [127:0] all_s_g19;
  wire [127:0] all_s_g20;
  wire [127:0] all_s_g21;
  wire [127:0] all_s_g22;
  wire [127:0] all_s_g23;
  wire [127:0] all_s_g24;
  wire [127:0] all_s_g25;
  wire [127:0] all_s_g26;
  wire [127:0] all_s_g27;
  wire [127:0] all_s_g28;
  wire [127:0] all_s_g29;
  wire [127:0] all_s_g30;
  wire [127:0] all_s_g33;
  wire [127:0] all_s_g34;
  wire [127:0] all_s_g35;
  wire [127:0] all_s_g36;
  wire [127:0] all_s_g37;
  wire [127:0] all_s_g38;
  wire [127:0] all_s_g39;
  wire [127:0] all_s_g40;
  wire [127:0] all_s_g41;
  wire [127:0] all_s_g42;
  wire [127:0] all_s_g43;
  wire [127:0] all_s_g44;
  wire [127:0] all_s_g45;
  wire [127:0] all_s_g46;
  wire [127:0] all_s_g49;
  wire [127:0] all_s_g50;
  wire [127:0] all_s_g51;
  wire [127:0] all_s_g52;
  wire [127:0] all_s_g53;
  wire [127:0] all_s_g54;
  wire [127:0] all_s_g55;
  wire [127:0] all_s_g56;
  wire [127:0] all_s_g57;
  wire [127:0] all_s_g58;
  wire [127:0] all_s_g59;
  wire [127:0] all_s_g60;
  wire [127:0] all_s_g61;
  wire [127:0] all_s_g62;
  wire [127:0] all_s_g65;
  wire [127:0] all_s_g66;
  wire [127:0] all_s_g67;
  wire [127:0] all_s_g68;
  wire [127:0] all_s_g69;
  wire [127:0] all_s_g70;
  wire [127:0] all_s_g71;
  wire [127:0] all_s_g72;
  wire [127:0] all_s_g73;
  wire [127:0] all_s_g74;
  wire [127:0] all_s_g75;
  wire [127:0] all_s_g76;
  wire [127:0] all_s_g77;
  wire [127:0] all_s_g78;
  wire [127:0] all_s_g81;
  wire [127:0] all_s_g82;
  wire [127:0] all_s_g83;
  wire [127:0] all_s_g84;
  wire [127:0] all_s_g85;
  wire [127:0] all_s_g86;
  wire [127:0] all_s_g87;
  wire [127:0] all_s_g88;
  wire [127:0] all_s_g89;
  wire [127:0] all_s_g90;
  wire [127:0] all_s_g91;
  wire [127:0] all_s_g92;
  wire [127:0] all_s_g93;
  wire [127:0] all_s_g94;
  wire [127:0] all_s_g97;
  wire [127:0] all_s_g98;
  wire [127:0] all_s_g99;
  wire [127:0] all_s_g100;
  wire [127:0] all_s_g101;
  wire [127:0] all_s_g102;
  wire [127:0] all_s_g103;
  wire [127:0] all_s_g104;
  wire [127:0] all_s_g105;
  wire [127:0] all_s_g106;
  wire [127:0] all_s_g107;
  wire [127:0] all_s_g108;
  wire [127:0] all_s_g109;
  wire [127:0] all_s_g110;
  wire kanwa_s;
  wire _add_all_x_sig;
  wire [7:0] _add_all_x_start;
  wire [7:0] _add_all_x_goal;
  wire _add_all_x_dig_w;
  wire _add_all_x_dig_t0;
  wire _add_all_x_dig_t1;
  wire _add_all_x_dig_t2;
  wire _add_all_x_dig_t3;
  wire _add_all_x_dig_t4;
  wire _add_all_x_dig_t5;
  wire _add_all_x_dig_t6;
  wire _add_all_x_dig_t7;
  wire _add_all_x_dig_t8;
  wire _add_all_x_dig_t9;
  wire _add_all_x_dig_t10;
  wire _add_all_x_dig_t11;
  wire _add_all_x_dig_t12;
  wire _add_all_x_dig_t13;
  wire _add_all_x_dig_t14;
  wire _add_all_x_dig_t15;
  wire _add_all_x_dig_t16;
  wire _add_all_x_dig_t17;
  wire _add_all_x_dig_t18;
  wire _add_all_x_dig_t19;
  wire _add_all_x_dig_t20;
  wire _add_all_x_dig_t21;
  wire _add_all_x_dig_t22;
  wire _add_all_x_dig_t23;
  wire _add_all_x_dig_t24;
  wire _add_all_x_dig_t25;
  wire _add_all_x_dig_t26;
  wire _add_all_x_dig_t27;
  wire _add_all_x_dig_t28;
  wire _add_all_x_dig_t29;
  wire _add_all_x_dig_t30;
  wire _add_all_x_dig_t31;
  wire _add_all_x_dig_t32;
  wire _add_all_x_dig_t33;
  wire _add_all_x_dig_t34;
  wire _add_all_x_dig_t35;
  wire _add_all_x_dig_t36;
  wire _add_all_x_dig_t37;
  wire _add_all_x_dig_t38;
  wire _add_all_x_dig_t39;
  wire _add_all_x_dig_t40;
  wire _add_all_x_dig_t41;
  wire [1:0] _add_all_x_sg_in17;
  wire [1:0] _add_all_x_sg_in18;
  wire [1:0] _add_all_x_sg_in19;
  wire [1:0] _add_all_x_sg_in20;
  wire [1:0] _add_all_x_sg_in21;
  wire [1:0] _add_all_x_sg_in22;
  wire [1:0] _add_all_x_sg_in23;
  wire [1:0] _add_all_x_sg_in24;
  wire [1:0] _add_all_x_sg_in25;
  wire [1:0] _add_all_x_sg_in26;
  wire [1:0] _add_all_x_sg_in27;
  wire [1:0] _add_all_x_sg_in28;
  wire [1:0] _add_all_x_sg_in29;
  wire [1:0] _add_all_x_sg_in30;
  wire [1:0] _add_all_x_sg_in33;
  wire [1:0] _add_all_x_sg_in34;
  wire [1:0] _add_all_x_sg_in35;
  wire [1:0] _add_all_x_sg_in36;
  wire [1:0] _add_all_x_sg_in37;
  wire [1:0] _add_all_x_sg_in38;
  wire [1:0] _add_all_x_sg_in39;
  wire [1:0] _add_all_x_sg_in40;
  wire [1:0] _add_all_x_sg_in41;
  wire [1:0] _add_all_x_sg_in42;
  wire [1:0] _add_all_x_sg_in43;
  wire [1:0] _add_all_x_sg_in44;
  wire [1:0] _add_all_x_sg_in45;
  wire [1:0] _add_all_x_sg_in46;
  wire [1:0] _add_all_x_sg_in49;
  wire [1:0] _add_all_x_sg_in50;
  wire [1:0] _add_all_x_sg_in51;
  wire [1:0] _add_all_x_sg_in52;
  wire [1:0] _add_all_x_sg_in53;
  wire [1:0] _add_all_x_sg_in54;
  wire [1:0] _add_all_x_sg_in55;
  wire [1:0] _add_all_x_sg_in56;
  wire [1:0] _add_all_x_sg_in57;
  wire [1:0] _add_all_x_sg_in58;
  wire [1:0] _add_all_x_sg_in59;
  wire [1:0] _add_all_x_sg_in60;
  wire [1:0] _add_all_x_sg_in61;
  wire [1:0] _add_all_x_sg_in62;
  wire [1:0] _add_all_x_sg_in65;
  wire [1:0] _add_all_x_sg_in66;
  wire [1:0] _add_all_x_sg_in67;
  wire [1:0] _add_all_x_sg_in68;
  wire [1:0] _add_all_x_sg_in69;
  wire [1:0] _add_all_x_sg_in70;
  wire [1:0] _add_all_x_sg_in71;
  wire [1:0] _add_all_x_sg_in72;
  wire [1:0] _add_all_x_sg_in73;
  wire [1:0] _add_all_x_sg_in74;
  wire [1:0] _add_all_x_sg_in75;
  wire [1:0] _add_all_x_sg_in76;
  wire [1:0] _add_all_x_sg_in77;
  wire [1:0] _add_all_x_sg_in78;
  wire [1:0] _add_all_x_sg_in81;
  wire [1:0] _add_all_x_sg_in82;
  wire [1:0] _add_all_x_sg_in83;
  wire [1:0] _add_all_x_sg_in84;
  wire [1:0] _add_all_x_sg_in85;
  wire [1:0] _add_all_x_sg_in86;
  wire [1:0] _add_all_x_sg_in87;
  wire [1:0] _add_all_x_sg_in88;
  wire [1:0] _add_all_x_sg_in89;
  wire [1:0] _add_all_x_sg_in90;
  wire [1:0] _add_all_x_sg_in91;
  wire [1:0] _add_all_x_sg_in92;
  wire [1:0] _add_all_x_sg_in93;
  wire [1:0] _add_all_x_sg_in94;
  wire [1:0] _add_all_x_sg_in97;
  wire [1:0] _add_all_x_sg_in98;
  wire [1:0] _add_all_x_sg_in99;
  wire [1:0] _add_all_x_sg_in100;
  wire [1:0] _add_all_x_sg_in101;
  wire [1:0] _add_all_x_sg_in102;
  wire [1:0] _add_all_x_sg_in103;
  wire [1:0] _add_all_x_sg_in104;
  wire [1:0] _add_all_x_sg_in105;
  wire [1:0] _add_all_x_sg_in106;
  wire [1:0] _add_all_x_sg_in107;
  wire [1:0] _add_all_x_sg_in108;
  wire [1:0] _add_all_x_sg_in109;
  wire [1:0] _add_all_x_sg_in110;
  wire [127:0] _add_all_x_wall_end_in;
  wire [127:0] _add_all_x_wall_end;
  wire [127:0] _add_all_x_all_sg_in17;
  wire [127:0] _add_all_x_all_sg_in18;
  wire [127:0] _add_all_x_all_sg_in19;
  wire [127:0] _add_all_x_all_sg_in20;
  wire [127:0] _add_all_x_all_sg_in21;
  wire [127:0] _add_all_x_all_sg_in22;
  wire [127:0] _add_all_x_all_sg_in23;
  wire [127:0] _add_all_x_all_sg_in24;
  wire [127:0] _add_all_x_all_sg_in25;
  wire [127:0] _add_all_x_all_sg_in26;
  wire [127:0] _add_all_x_all_sg_in27;
  wire [127:0] _add_all_x_all_sg_in28;
  wire [127:0] _add_all_x_all_sg_in29;
  wire [127:0] _add_all_x_all_sg_in30;
  wire [127:0] _add_all_x_all_sg_in33;
  wire [127:0] _add_all_x_all_sg_in34;
  wire [127:0] _add_all_x_all_sg_in35;
  wire [127:0] _add_all_x_all_sg_in36;
  wire [127:0] _add_all_x_all_sg_in37;
  wire [127:0] _add_all_x_all_sg_in38;
  wire [127:0] _add_all_x_all_sg_in39;
  wire [127:0] _add_all_x_all_sg_in40;
  wire [127:0] _add_all_x_all_sg_in41;
  wire [127:0] _add_all_x_all_sg_in42;
  wire [127:0] _add_all_x_all_sg_in43;
  wire [127:0] _add_all_x_all_sg_in44;
  wire [127:0] _add_all_x_all_sg_in45;
  wire [127:0] _add_all_x_all_sg_in46;
  wire [127:0] _add_all_x_all_sg_in49;
  wire [127:0] _add_all_x_all_sg_in50;
  wire [127:0] _add_all_x_all_sg_in51;
  wire [127:0] _add_all_x_all_sg_in52;
  wire [127:0] _add_all_x_all_sg_in53;
  wire [127:0] _add_all_x_all_sg_in54;
  wire [127:0] _add_all_x_all_sg_in55;
  wire [127:0] _add_all_x_all_sg_in56;
  wire [127:0] _add_all_x_all_sg_in57;
  wire [127:0] _add_all_x_all_sg_in58;
  wire [127:0] _add_all_x_all_sg_in59;
  wire [127:0] _add_all_x_all_sg_in60;
  wire [127:0] _add_all_x_all_sg_in61;
  wire [127:0] _add_all_x_all_sg_in62;
  wire [127:0] _add_all_x_all_sg_in65;
  wire [127:0] _add_all_x_all_sg_in66;
  wire [127:0] _add_all_x_all_sg_in67;
  wire [127:0] _add_all_x_all_sg_in68;
  wire [127:0] _add_all_x_all_sg_in69;
  wire [127:0] _add_all_x_all_sg_in70;
  wire [127:0] _add_all_x_all_sg_in71;
  wire [127:0] _add_all_x_all_sg_in72;
  wire [127:0] _add_all_x_all_sg_in73;
  wire [127:0] _add_all_x_all_sg_in74;
  wire [127:0] _add_all_x_all_sg_in75;
  wire [127:0] _add_all_x_all_sg_in76;
  wire [127:0] _add_all_x_all_sg_in77;
  wire [127:0] _add_all_x_all_sg_in78;
  wire [127:0] _add_all_x_all_sg_in81;
  wire [127:0] _add_all_x_all_sg_in82;
  wire [127:0] _add_all_x_all_sg_in83;
  wire [127:0] _add_all_x_all_sg_in84;
  wire [127:0] _add_all_x_all_sg_in85;
  wire [127:0] _add_all_x_all_sg_in86;
  wire [127:0] _add_all_x_all_sg_in87;
  wire [127:0] _add_all_x_all_sg_in88;
  wire [127:0] _add_all_x_all_sg_in89;
  wire [127:0] _add_all_x_all_sg_in90;
  wire [127:0] _add_all_x_all_sg_in91;
  wire [127:0] _add_all_x_all_sg_in92;
  wire [127:0] _add_all_x_all_sg_in93;
  wire [127:0] _add_all_x_all_sg_in94;
  wire [127:0] _add_all_x_all_sg_in97;
  wire [127:0] _add_all_x_all_sg_in98;
  wire [127:0] _add_all_x_all_sg_in99;
  wire [127:0] _add_all_x_all_sg_in100;
  wire [127:0] _add_all_x_all_sg_in101;
  wire [127:0] _add_all_x_all_sg_in102;
  wire [127:0] _add_all_x_all_sg_in103;
  wire [127:0] _add_all_x_all_sg_in104;
  wire [127:0] _add_all_x_all_sg_in105;
  wire [127:0] _add_all_x_all_sg_in106;
  wire [127:0] _add_all_x_all_sg_in107;
  wire [127:0] _add_all_x_all_sg_in108;
  wire [127:0] _add_all_x_all_sg_in109;
  wire [127:0] _add_all_x_all_sg_in110;
  wire [7:0] _add_all_x_data_in17;
  wire [7:0] _add_all_x_data_in18;
  wire [7:0] _add_all_x_data_in19;
  wire [7:0] _add_all_x_data_in20;
  wire [7:0] _add_all_x_data_in21;
  wire [7:0] _add_all_x_data_in22;
  wire [7:0] _add_all_x_data_in23;
  wire [7:0] _add_all_x_data_in24;
  wire [7:0] _add_all_x_data_in25;
  wire [7:0] _add_all_x_data_in26;
  wire [7:0] _add_all_x_data_in27;
  wire [7:0] _add_all_x_data_in28;
  wire [7:0] _add_all_x_data_in29;
  wire [7:0] _add_all_x_data_in30;
  wire [7:0] _add_all_x_data_in33;
  wire [7:0] _add_all_x_data_in34;
  wire [7:0] _add_all_x_data_in35;
  wire [7:0] _add_all_x_data_in36;
  wire [7:0] _add_all_x_data_in37;
  wire [7:0] _add_all_x_data_in38;
  wire [7:0] _add_all_x_data_in39;
  wire [7:0] _add_all_x_data_in40;
  wire [7:0] _add_all_x_data_in41;
  wire [7:0] _add_all_x_data_in42;
  wire [7:0] _add_all_x_data_in43;
  wire [7:0] _add_all_x_data_in44;
  wire [7:0] _add_all_x_data_in45;
  wire [7:0] _add_all_x_data_in46;
  wire [7:0] _add_all_x_data_in49;
  wire [7:0] _add_all_x_data_in50;
  wire [7:0] _add_all_x_data_in51;
  wire [7:0] _add_all_x_data_in52;
  wire [7:0] _add_all_x_data_in53;
  wire [7:0] _add_all_x_data_in54;
  wire [7:0] _add_all_x_data_in55;
  wire [7:0] _add_all_x_data_in56;
  wire [7:0] _add_all_x_data_in57;
  wire [7:0] _add_all_x_data_in58;
  wire [7:0] _add_all_x_data_in59;
  wire [7:0] _add_all_x_data_in60;
  wire [7:0] _add_all_x_data_in61;
  wire [7:0] _add_all_x_data_in62;
  wire [7:0] _add_all_x_data_in65;
  wire [7:0] _add_all_x_data_in66;
  wire [7:0] _add_all_x_data_in67;
  wire [7:0] _add_all_x_data_in68;
  wire [7:0] _add_all_x_data_in69;
  wire [7:0] _add_all_x_data_in70;
  wire [7:0] _add_all_x_data_in71;
  wire [7:0] _add_all_x_data_in72;
  wire [7:0] _add_all_x_data_in73;
  wire [7:0] _add_all_x_data_in74;
  wire [7:0] _add_all_x_data_in75;
  wire [7:0] _add_all_x_data_in76;
  wire [7:0] _add_all_x_data_in77;
  wire [7:0] _add_all_x_data_in78;
  wire [7:0] _add_all_x_data_in81;
  wire [7:0] _add_all_x_data_in82;
  wire [7:0] _add_all_x_data_in83;
  wire [7:0] _add_all_x_data_in84;
  wire [7:0] _add_all_x_data_in85;
  wire [7:0] _add_all_x_data_in86;
  wire [7:0] _add_all_x_data_in87;
  wire [7:0] _add_all_x_data_in88;
  wire [7:0] _add_all_x_data_in89;
  wire [7:0] _add_all_x_data_in90;
  wire [7:0] _add_all_x_data_in91;
  wire [7:0] _add_all_x_data_in92;
  wire [7:0] _add_all_x_data_in93;
  wire [7:0] _add_all_x_data_in94;
  wire [7:0] _add_all_x_data_in97;
  wire [7:0] _add_all_x_data_in98;
  wire [7:0] _add_all_x_data_in99;
  wire [7:0] _add_all_x_data_in100;
  wire [7:0] _add_all_x_data_in101;
  wire [7:0] _add_all_x_data_in102;
  wire [7:0] _add_all_x_data_in103;
  wire [7:0] _add_all_x_data_in104;
  wire [7:0] _add_all_x_data_in105;
  wire [7:0] _add_all_x_data_in106;
  wire [7:0] _add_all_x_data_in107;
  wire [7:0] _add_all_x_data_in108;
  wire [7:0] _add_all_x_data_in109;
  wire [7:0] _add_all_x_data_in110;
  wire [7:0] _add_all_x_data_in_org17;
  wire [7:0] _add_all_x_data_in_org18;
  wire [7:0] _add_all_x_data_in_org19;
  wire [7:0] _add_all_x_data_in_org20;
  wire [7:0] _add_all_x_data_in_org21;
  wire [7:0] _add_all_x_data_in_org22;
  wire [7:0] _add_all_x_data_in_org23;
  wire [7:0] _add_all_x_data_in_org24;
  wire [7:0] _add_all_x_data_in_org25;
  wire [7:0] _add_all_x_data_in_org26;
  wire [7:0] _add_all_x_data_in_org27;
  wire [7:0] _add_all_x_data_in_org28;
  wire [7:0] _add_all_x_data_in_org29;
  wire [7:0] _add_all_x_data_in_org30;
  wire [7:0] _add_all_x_data_in_org33;
  wire [7:0] _add_all_x_data_in_org34;
  wire [7:0] _add_all_x_data_in_org35;
  wire [7:0] _add_all_x_data_in_org36;
  wire [7:0] _add_all_x_data_in_org37;
  wire [7:0] _add_all_x_data_in_org38;
  wire [7:0] _add_all_x_data_in_org39;
  wire [7:0] _add_all_x_data_in_org40;
  wire [7:0] _add_all_x_data_in_org41;
  wire [7:0] _add_all_x_data_in_org42;
  wire [7:0] _add_all_x_data_in_org43;
  wire [7:0] _add_all_x_data_in_org44;
  wire [7:0] _add_all_x_data_in_org45;
  wire [7:0] _add_all_x_data_in_org46;
  wire [7:0] _add_all_x_data_in_org49;
  wire [7:0] _add_all_x_data_in_org50;
  wire [7:0] _add_all_x_data_in_org51;
  wire [7:0] _add_all_x_data_in_org52;
  wire [7:0] _add_all_x_data_in_org53;
  wire [7:0] _add_all_x_data_in_org54;
  wire [7:0] _add_all_x_data_in_org55;
  wire [7:0] _add_all_x_data_in_org56;
  wire [7:0] _add_all_x_data_in_org57;
  wire [7:0] _add_all_x_data_in_org58;
  wire [7:0] _add_all_x_data_in_org59;
  wire [7:0] _add_all_x_data_in_org60;
  wire [7:0] _add_all_x_data_in_org61;
  wire [7:0] _add_all_x_data_in_org62;
  wire [7:0] _add_all_x_data_in_org65;
  wire [7:0] _add_all_x_data_in_org66;
  wire [7:0] _add_all_x_data_in_org67;
  wire [7:0] _add_all_x_data_in_org68;
  wire [7:0] _add_all_x_data_in_org69;
  wire [7:0] _add_all_x_data_in_org70;
  wire [7:0] _add_all_x_data_in_org71;
  wire [7:0] _add_all_x_data_in_org72;
  wire [7:0] _add_all_x_data_in_org73;
  wire [7:0] _add_all_x_data_in_org74;
  wire [7:0] _add_all_x_data_in_org75;
  wire [7:0] _add_all_x_data_in_org76;
  wire [7:0] _add_all_x_data_in_org77;
  wire [7:0] _add_all_x_data_in_org78;
  wire [7:0] _add_all_x_data_in_org81;
  wire [7:0] _add_all_x_data_in_org82;
  wire [7:0] _add_all_x_data_in_org83;
  wire [7:0] _add_all_x_data_in_org84;
  wire [7:0] _add_all_x_data_in_org85;
  wire [7:0] _add_all_x_data_in_org86;
  wire [7:0] _add_all_x_data_in_org87;
  wire [7:0] _add_all_x_data_in_org88;
  wire [7:0] _add_all_x_data_in_org89;
  wire [7:0] _add_all_x_data_in_org90;
  wire [7:0] _add_all_x_data_in_org91;
  wire [7:0] _add_all_x_data_in_org92;
  wire [7:0] _add_all_x_data_in_org93;
  wire [7:0] _add_all_x_data_in_org94;
  wire [7:0] _add_all_x_data_in_org97;
  wire [7:0] _add_all_x_data_in_org98;
  wire [7:0] _add_all_x_data_in_org99;
  wire [7:0] _add_all_x_data_in_org100;
  wire [7:0] _add_all_x_data_in_org101;
  wire [7:0] _add_all_x_data_in_org102;
  wire [7:0] _add_all_x_data_in_org103;
  wire [7:0] _add_all_x_data_in_org104;
  wire [7:0] _add_all_x_data_in_org105;
  wire [7:0] _add_all_x_data_in_org106;
  wire [7:0] _add_all_x_data_in_org107;
  wire [7:0] _add_all_x_data_in_org108;
  wire [7:0] _add_all_x_data_in_org109;
  wire [7:0] _add_all_x_data_in_org110;
  wire [7:0] _add_all_x_data_out_org17;
  wire [7:0] _add_all_x_data_out_org18;
  wire [7:0] _add_all_x_data_out_org19;
  wire [7:0] _add_all_x_data_out_org20;
  wire [7:0] _add_all_x_data_out_org21;
  wire [7:0] _add_all_x_data_out_org22;
  wire [7:0] _add_all_x_data_out_org23;
  wire [7:0] _add_all_x_data_out_org24;
  wire [7:0] _add_all_x_data_out_org25;
  wire [7:0] _add_all_x_data_out_org26;
  wire [7:0] _add_all_x_data_out_org27;
  wire [7:0] _add_all_x_data_out_org28;
  wire [7:0] _add_all_x_data_out_org29;
  wire [7:0] _add_all_x_data_out_org30;
  wire [7:0] _add_all_x_data_out_org33;
  wire [7:0] _add_all_x_data_out_org34;
  wire [7:0] _add_all_x_data_out_org35;
  wire [7:0] _add_all_x_data_out_org36;
  wire [7:0] _add_all_x_data_out_org37;
  wire [7:0] _add_all_x_data_out_org38;
  wire [7:0] _add_all_x_data_out_org39;
  wire [7:0] _add_all_x_data_out_org40;
  wire [7:0] _add_all_x_data_out_org41;
  wire [7:0] _add_all_x_data_out_org42;
  wire [7:0] _add_all_x_data_out_org43;
  wire [7:0] _add_all_x_data_out_org44;
  wire [7:0] _add_all_x_data_out_org45;
  wire [7:0] _add_all_x_data_out_org46;
  wire [7:0] _add_all_x_data_out_org49;
  wire [7:0] _add_all_x_data_out_org50;
  wire [7:0] _add_all_x_data_out_org51;
  wire [7:0] _add_all_x_data_out_org52;
  wire [7:0] _add_all_x_data_out_org53;
  wire [7:0] _add_all_x_data_out_org54;
  wire [7:0] _add_all_x_data_out_org55;
  wire [7:0] _add_all_x_data_out_org56;
  wire [7:0] _add_all_x_data_out_org57;
  wire [7:0] _add_all_x_data_out_org58;
  wire [7:0] _add_all_x_data_out_org59;
  wire [7:0] _add_all_x_data_out_org60;
  wire [7:0] _add_all_x_data_out_org61;
  wire [7:0] _add_all_x_data_out_org62;
  wire [7:0] _add_all_x_data_out_org65;
  wire [7:0] _add_all_x_data_out_org66;
  wire [7:0] _add_all_x_data_out_org67;
  wire [7:0] _add_all_x_data_out_org68;
  wire [7:0] _add_all_x_data_out_org69;
  wire [7:0] _add_all_x_data_out_org70;
  wire [7:0] _add_all_x_data_out_org71;
  wire [7:0] _add_all_x_data_out_org72;
  wire [7:0] _add_all_x_data_out_org73;
  wire [7:0] _add_all_x_data_out_org74;
  wire [7:0] _add_all_x_data_out_org75;
  wire [7:0] _add_all_x_data_out_org76;
  wire [7:0] _add_all_x_data_out_org77;
  wire [7:0] _add_all_x_data_out_org78;
  wire [7:0] _add_all_x_data_out_org81;
  wire [7:0] _add_all_x_data_out_org82;
  wire [7:0] _add_all_x_data_out_org83;
  wire [7:0] _add_all_x_data_out_org84;
  wire [7:0] _add_all_x_data_out_org85;
  wire [7:0] _add_all_x_data_out_org86;
  wire [7:0] _add_all_x_data_out_org87;
  wire [7:0] _add_all_x_data_out_org88;
  wire [7:0] _add_all_x_data_out_org89;
  wire [7:0] _add_all_x_data_out_org90;
  wire [7:0] _add_all_x_data_out_org91;
  wire [7:0] _add_all_x_data_out_org92;
  wire [7:0] _add_all_x_data_out_org93;
  wire [7:0] _add_all_x_data_out_org94;
  wire [7:0] _add_all_x_data_out_org97;
  wire [7:0] _add_all_x_data_out_org98;
  wire [7:0] _add_all_x_data_out_org99;
  wire [7:0] _add_all_x_data_out_org100;
  wire [7:0] _add_all_x_data_out_org101;
  wire [7:0] _add_all_x_data_out_org102;
  wire [7:0] _add_all_x_data_out_org103;
  wire [7:0] _add_all_x_data_out_org104;
  wire [7:0] _add_all_x_data_out_org105;
  wire [7:0] _add_all_x_data_out_org106;
  wire [7:0] _add_all_x_data_out_org107;
  wire [7:0] _add_all_x_data_out_org108;
  wire [7:0] _add_all_x_data_out_org109;
  wire [7:0] _add_all_x_data_out_org110;
  wire [1:0] _add_all_x_sg_out17;
  wire [1:0] _add_all_x_sg_out18;
  wire [1:0] _add_all_x_sg_out19;
  wire [1:0] _add_all_x_sg_out20;
  wire [1:0] _add_all_x_sg_out21;
  wire [1:0] _add_all_x_sg_out22;
  wire [1:0] _add_all_x_sg_out23;
  wire [1:0] _add_all_x_sg_out24;
  wire [1:0] _add_all_x_sg_out25;
  wire [1:0] _add_all_x_sg_out26;
  wire [1:0] _add_all_x_sg_out27;
  wire [1:0] _add_all_x_sg_out28;
  wire [1:0] _add_all_x_sg_out29;
  wire [1:0] _add_all_x_sg_out30;
  wire [1:0] _add_all_x_sg_out33;
  wire [1:0] _add_all_x_sg_out34;
  wire [1:0] _add_all_x_sg_out35;
  wire [1:0] _add_all_x_sg_out36;
  wire [1:0] _add_all_x_sg_out37;
  wire [1:0] _add_all_x_sg_out38;
  wire [1:0] _add_all_x_sg_out39;
  wire [1:0] _add_all_x_sg_out40;
  wire [1:0] _add_all_x_sg_out41;
  wire [1:0] _add_all_x_sg_out42;
  wire [1:0] _add_all_x_sg_out43;
  wire [1:0] _add_all_x_sg_out44;
  wire [1:0] _add_all_x_sg_out45;
  wire [1:0] _add_all_x_sg_out46;
  wire [1:0] _add_all_x_sg_out49;
  wire [1:0] _add_all_x_sg_out50;
  wire [1:0] _add_all_x_sg_out51;
  wire [1:0] _add_all_x_sg_out52;
  wire [1:0] _add_all_x_sg_out53;
  wire [1:0] _add_all_x_sg_out54;
  wire [1:0] _add_all_x_sg_out55;
  wire [1:0] _add_all_x_sg_out56;
  wire [1:0] _add_all_x_sg_out57;
  wire [1:0] _add_all_x_sg_out58;
  wire [1:0] _add_all_x_sg_out59;
  wire [1:0] _add_all_x_sg_out60;
  wire [1:0] _add_all_x_sg_out61;
  wire [1:0] _add_all_x_sg_out62;
  wire [1:0] _add_all_x_sg_out65;
  wire [1:0] _add_all_x_sg_out66;
  wire [1:0] _add_all_x_sg_out67;
  wire [1:0] _add_all_x_sg_out68;
  wire [1:0] _add_all_x_sg_out69;
  wire [1:0] _add_all_x_sg_out70;
  wire [1:0] _add_all_x_sg_out71;
  wire [1:0] _add_all_x_sg_out72;
  wire [1:0] _add_all_x_sg_out73;
  wire [1:0] _add_all_x_sg_out74;
  wire [1:0] _add_all_x_sg_out75;
  wire [1:0] _add_all_x_sg_out76;
  wire [1:0] _add_all_x_sg_out77;
  wire [1:0] _add_all_x_sg_out78;
  wire [1:0] _add_all_x_sg_out81;
  wire [1:0] _add_all_x_sg_out82;
  wire [1:0] _add_all_x_sg_out83;
  wire [1:0] _add_all_x_sg_out84;
  wire [1:0] _add_all_x_sg_out85;
  wire [1:0] _add_all_x_sg_out86;
  wire [1:0] _add_all_x_sg_out87;
  wire [1:0] _add_all_x_sg_out88;
  wire [1:0] _add_all_x_sg_out89;
  wire [1:0] _add_all_x_sg_out90;
  wire [1:0] _add_all_x_sg_out91;
  wire [1:0] _add_all_x_sg_out92;
  wire [1:0] _add_all_x_sg_out93;
  wire [1:0] _add_all_x_sg_out94;
  wire [1:0] _add_all_x_sg_out97;
  wire [1:0] _add_all_x_sg_out98;
  wire [1:0] _add_all_x_sg_out99;
  wire [1:0] _add_all_x_sg_out100;
  wire [1:0] _add_all_x_sg_out101;
  wire [1:0] _add_all_x_sg_out102;
  wire [1:0] _add_all_x_sg_out103;
  wire [1:0] _add_all_x_sg_out104;
  wire [1:0] _add_all_x_sg_out105;
  wire [1:0] _add_all_x_sg_out106;
  wire [1:0] _add_all_x_sg_out107;
  wire [1:0] _add_all_x_sg_out108;
  wire [1:0] _add_all_x_sg_out109;
  wire [1:0] _add_all_x_sg_out110;
  wire [7:0] _add_all_x_data_out17;
  wire [7:0] _add_all_x_data_out18;
  wire [7:0] _add_all_x_data_out19;
  wire [7:0] _add_all_x_data_out20;
  wire [7:0] _add_all_x_data_out21;
  wire [7:0] _add_all_x_data_out22;
  wire [7:0] _add_all_x_data_out23;
  wire [7:0] _add_all_x_data_out24;
  wire [7:0] _add_all_x_data_out25;
  wire [7:0] _add_all_x_data_out26;
  wire [7:0] _add_all_x_data_out27;
  wire [7:0] _add_all_x_data_out28;
  wire [7:0] _add_all_x_data_out29;
  wire [7:0] _add_all_x_data_out30;
  wire [7:0] _add_all_x_data_out33;
  wire [7:0] _add_all_x_data_out34;
  wire [7:0] _add_all_x_data_out35;
  wire [7:0] _add_all_x_data_out36;
  wire [7:0] _add_all_x_data_out37;
  wire [7:0] _add_all_x_data_out38;
  wire [7:0] _add_all_x_data_out39;
  wire [7:0] _add_all_x_data_out40;
  wire [7:0] _add_all_x_data_out41;
  wire [7:0] _add_all_x_data_out42;
  wire [7:0] _add_all_x_data_out43;
  wire [7:0] _add_all_x_data_out44;
  wire [7:0] _add_all_x_data_out45;
  wire [7:0] _add_all_x_data_out46;
  wire [7:0] _add_all_x_data_out49;
  wire [7:0] _add_all_x_data_out50;
  wire [7:0] _add_all_x_data_out51;
  wire [7:0] _add_all_x_data_out52;
  wire [7:0] _add_all_x_data_out53;
  wire [7:0] _add_all_x_data_out54;
  wire [7:0] _add_all_x_data_out55;
  wire [7:0] _add_all_x_data_out56;
  wire [7:0] _add_all_x_data_out57;
  wire [7:0] _add_all_x_data_out58;
  wire [7:0] _add_all_x_data_out59;
  wire [7:0] _add_all_x_data_out60;
  wire [7:0] _add_all_x_data_out61;
  wire [7:0] _add_all_x_data_out62;
  wire [7:0] _add_all_x_data_out65;
  wire [7:0] _add_all_x_data_out66;
  wire [7:0] _add_all_x_data_out67;
  wire [7:0] _add_all_x_data_out68;
  wire [7:0] _add_all_x_data_out69;
  wire [7:0] _add_all_x_data_out70;
  wire [7:0] _add_all_x_data_out71;
  wire [7:0] _add_all_x_data_out72;
  wire [7:0] _add_all_x_data_out73;
  wire [7:0] _add_all_x_data_out74;
  wire [7:0] _add_all_x_data_out75;
  wire [7:0] _add_all_x_data_out76;
  wire [7:0] _add_all_x_data_out77;
  wire [7:0] _add_all_x_data_out78;
  wire [7:0] _add_all_x_data_out81;
  wire [7:0] _add_all_x_data_out82;
  wire [7:0] _add_all_x_data_out83;
  wire [7:0] _add_all_x_data_out84;
  wire [7:0] _add_all_x_data_out85;
  wire [7:0] _add_all_x_data_out86;
  wire [7:0] _add_all_x_data_out87;
  wire [7:0] _add_all_x_data_out88;
  wire [7:0] _add_all_x_data_out89;
  wire [7:0] _add_all_x_data_out90;
  wire [7:0] _add_all_x_data_out91;
  wire [7:0] _add_all_x_data_out92;
  wire [7:0] _add_all_x_data_out93;
  wire [7:0] _add_all_x_data_out94;
  wire [7:0] _add_all_x_data_out97;
  wire [7:0] _add_all_x_data_out98;
  wire [7:0] _add_all_x_data_out99;
  wire [7:0] _add_all_x_data_out100;
  wire [7:0] _add_all_x_data_out101;
  wire [7:0] _add_all_x_data_out102;
  wire [7:0] _add_all_x_data_out103;
  wire [7:0] _add_all_x_data_out104;
  wire [7:0] _add_all_x_data_out105;
  wire [7:0] _add_all_x_data_out106;
  wire [7:0] _add_all_x_data_out107;
  wire [7:0] _add_all_x_data_out108;
  wire [7:0] _add_all_x_data_out109;
  wire [7:0] _add_all_x_data_out110;
  wire [7:0] _add_all_x_data_out_index17;
  wire [7:0] _add_all_x_data_out_index18;
  wire [7:0] _add_all_x_data_out_index19;
  wire [7:0] _add_all_x_data_out_index20;
  wire [7:0] _add_all_x_data_out_index21;
  wire [7:0] _add_all_x_data_out_index22;
  wire [7:0] _add_all_x_data_out_index23;
  wire [7:0] _add_all_x_data_out_index24;
  wire [7:0] _add_all_x_data_out_index25;
  wire [7:0] _add_all_x_data_out_index26;
  wire [7:0] _add_all_x_data_out_index27;
  wire [7:0] _add_all_x_data_out_index28;
  wire [7:0] _add_all_x_data_out_index29;
  wire [7:0] _add_all_x_data_out_index30;
  wire [7:0] _add_all_x_data_out_index33;
  wire [7:0] _add_all_x_data_out_index34;
  wire [7:0] _add_all_x_data_out_index35;
  wire [7:0] _add_all_x_data_out_index36;
  wire [7:0] _add_all_x_data_out_index37;
  wire [7:0] _add_all_x_data_out_index38;
  wire [7:0] _add_all_x_data_out_index39;
  wire [7:0] _add_all_x_data_out_index40;
  wire [7:0] _add_all_x_data_out_index41;
  wire [7:0] _add_all_x_data_out_index42;
  wire [7:0] _add_all_x_data_out_index43;
  wire [7:0] _add_all_x_data_out_index44;
  wire [7:0] _add_all_x_data_out_index45;
  wire [7:0] _add_all_x_data_out_index46;
  wire [7:0] _add_all_x_data_out_index49;
  wire [7:0] _add_all_x_data_out_index50;
  wire [7:0] _add_all_x_data_out_index51;
  wire [7:0] _add_all_x_data_out_index52;
  wire [7:0] _add_all_x_data_out_index53;
  wire [7:0] _add_all_x_data_out_index54;
  wire [7:0] _add_all_x_data_out_index55;
  wire [7:0] _add_all_x_data_out_index56;
  wire [7:0] _add_all_x_data_out_index57;
  wire [7:0] _add_all_x_data_out_index58;
  wire [7:0] _add_all_x_data_out_index59;
  wire [7:0] _add_all_x_data_out_index60;
  wire [7:0] _add_all_x_data_out_index61;
  wire [7:0] _add_all_x_data_out_index62;
  wire [7:0] _add_all_x_data_out_index65;
  wire [7:0] _add_all_x_data_out_index66;
  wire [7:0] _add_all_x_data_out_index67;
  wire [7:0] _add_all_x_data_out_index68;
  wire [7:0] _add_all_x_data_out_index69;
  wire [7:0] _add_all_x_data_out_index70;
  wire [7:0] _add_all_x_data_out_index71;
  wire [7:0] _add_all_x_data_out_index72;
  wire [7:0] _add_all_x_data_out_index73;
  wire [7:0] _add_all_x_data_out_index74;
  wire [7:0] _add_all_x_data_out_index75;
  wire [7:0] _add_all_x_data_out_index76;
  wire [7:0] _add_all_x_data_out_index77;
  wire [7:0] _add_all_x_data_out_index78;
  wire [7:0] _add_all_x_data_out_index81;
  wire [7:0] _add_all_x_data_out_index82;
  wire [7:0] _add_all_x_data_out_index83;
  wire [7:0] _add_all_x_data_out_index84;
  wire [7:0] _add_all_x_data_out_index85;
  wire [7:0] _add_all_x_data_out_index86;
  wire [7:0] _add_all_x_data_out_index87;
  wire [7:0] _add_all_x_data_out_index88;
  wire [7:0] _add_all_x_data_out_index89;
  wire [7:0] _add_all_x_data_out_index90;
  wire [7:0] _add_all_x_data_out_index91;
  wire [7:0] _add_all_x_data_out_index92;
  wire [7:0] _add_all_x_data_out_index93;
  wire [7:0] _add_all_x_data_out_index94;
  wire [7:0] _add_all_x_data_out_index97;
  wire [7:0] _add_all_x_data_out_index98;
  wire [7:0] _add_all_x_data_out_index99;
  wire [7:0] _add_all_x_data_out_index100;
  wire [7:0] _add_all_x_data_out_index101;
  wire [7:0] _add_all_x_data_out_index102;
  wire [7:0] _add_all_x_data_out_index103;
  wire [7:0] _add_all_x_data_out_index104;
  wire [7:0] _add_all_x_data_out_index105;
  wire [7:0] _add_all_x_data_out_index106;
  wire [7:0] _add_all_x_data_out_index107;
  wire [7:0] _add_all_x_data_out_index108;
  wire [7:0] _add_all_x_data_out_index109;
  wire [7:0] _add_all_x_data_out_index110;
  wire [7:0] _add_all_x_distance_count_all;
  wire [127:0] _add_all_x_all_sg_out17;
  wire [127:0] _add_all_x_all_sg_out18;
  wire [127:0] _add_all_x_all_sg_out19;
  wire [127:0] _add_all_x_all_sg_out20;
  wire [127:0] _add_all_x_all_sg_out21;
  wire [127:0] _add_all_x_all_sg_out22;
  wire [127:0] _add_all_x_all_sg_out23;
  wire [127:0] _add_all_x_all_sg_out24;
  wire [127:0] _add_all_x_all_sg_out25;
  wire [127:0] _add_all_x_all_sg_out26;
  wire [127:0] _add_all_x_all_sg_out27;
  wire [127:0] _add_all_x_all_sg_out28;
  wire [127:0] _add_all_x_all_sg_out29;
  wire [127:0] _add_all_x_all_sg_out30;
  wire [127:0] _add_all_x_all_sg_out33;
  wire [127:0] _add_all_x_all_sg_out34;
  wire [127:0] _add_all_x_all_sg_out35;
  wire [127:0] _add_all_x_all_sg_out36;
  wire [127:0] _add_all_x_all_sg_out37;
  wire [127:0] _add_all_x_all_sg_out38;
  wire [127:0] _add_all_x_all_sg_out39;
  wire [127:0] _add_all_x_all_sg_out40;
  wire [127:0] _add_all_x_all_sg_out41;
  wire [127:0] _add_all_x_all_sg_out42;
  wire [127:0] _add_all_x_all_sg_out43;
  wire [127:0] _add_all_x_all_sg_out44;
  wire [127:0] _add_all_x_all_sg_out45;
  wire [127:0] _add_all_x_all_sg_out46;
  wire [127:0] _add_all_x_all_sg_out49;
  wire [127:0] _add_all_x_all_sg_out50;
  wire [127:0] _add_all_x_all_sg_out51;
  wire [127:0] _add_all_x_all_sg_out52;
  wire [127:0] _add_all_x_all_sg_out53;
  wire [127:0] _add_all_x_all_sg_out54;
  wire [127:0] _add_all_x_all_sg_out55;
  wire [127:0] _add_all_x_all_sg_out56;
  wire [127:0] _add_all_x_all_sg_out57;
  wire [127:0] _add_all_x_all_sg_out58;
  wire [127:0] _add_all_x_all_sg_out59;
  wire [127:0] _add_all_x_all_sg_out60;
  wire [127:0] _add_all_x_all_sg_out61;
  wire [127:0] _add_all_x_all_sg_out62;
  wire [127:0] _add_all_x_all_sg_out65;
  wire [127:0] _add_all_x_all_sg_out66;
  wire [127:0] _add_all_x_all_sg_out67;
  wire [127:0] _add_all_x_all_sg_out68;
  wire [127:0] _add_all_x_all_sg_out69;
  wire [127:0] _add_all_x_all_sg_out70;
  wire [127:0] _add_all_x_all_sg_out71;
  wire [127:0] _add_all_x_all_sg_out72;
  wire [127:0] _add_all_x_all_sg_out73;
  wire [127:0] _add_all_x_all_sg_out74;
  wire [127:0] _add_all_x_all_sg_out75;
  wire [127:0] _add_all_x_all_sg_out76;
  wire [127:0] _add_all_x_all_sg_out77;
  wire [127:0] _add_all_x_all_sg_out78;
  wire [127:0] _add_all_x_all_sg_out81;
  wire [127:0] _add_all_x_all_sg_out82;
  wire [127:0] _add_all_x_all_sg_out83;
  wire [127:0] _add_all_x_all_sg_out84;
  wire [127:0] _add_all_x_all_sg_out85;
  wire [127:0] _add_all_x_all_sg_out86;
  wire [127:0] _add_all_x_all_sg_out87;
  wire [127:0] _add_all_x_all_sg_out88;
  wire [127:0] _add_all_x_all_sg_out89;
  wire [127:0] _add_all_x_all_sg_out90;
  wire [127:0] _add_all_x_all_sg_out91;
  wire [127:0] _add_all_x_all_sg_out92;
  wire [127:0] _add_all_x_all_sg_out93;
  wire [127:0] _add_all_x_all_sg_out94;
  wire [127:0] _add_all_x_all_sg_out97;
  wire [127:0] _add_all_x_all_sg_out98;
  wire [127:0] _add_all_x_all_sg_out99;
  wire [127:0] _add_all_x_all_sg_out100;
  wire [127:0] _add_all_x_all_sg_out101;
  wire [127:0] _add_all_x_all_sg_out102;
  wire [127:0] _add_all_x_all_sg_out103;
  wire [127:0] _add_all_x_all_sg_out104;
  wire [127:0] _add_all_x_all_sg_out105;
  wire [127:0] _add_all_x_all_sg_out106;
  wire [127:0] _add_all_x_all_sg_out107;
  wire [127:0] _add_all_x_all_sg_out108;
  wire [127:0] _add_all_x_all_sg_out109;
  wire [127:0] _add_all_x_all_sg_out110;
  wire _add_all_x_in_do;
  wire _add_all_x_out_do;
  wire _add_all_x_out_data;
  wire _add_all_x_p_reset;
  wire _add_all_x_m_clock;
  wire [7:0] _sub_x_data_in17;
  wire [7:0] _sub_x_data_in19;
  wire [7:0] _sub_x_data_in21;
  wire [7:0] _sub_x_data_in23;
  wire [7:0] _sub_x_data_in25;
  wire [7:0] _sub_x_data_in27;
  wire [7:0] _sub_x_data_in29;
  wire [7:0] _sub_x_data_in33;
  wire [7:0] _sub_x_data_in35;
  wire [7:0] _sub_x_data_in37;
  wire [7:0] _sub_x_data_in39;
  wire [7:0] _sub_x_data_in41;
  wire [7:0] _sub_x_data_in43;
  wire [7:0] _sub_x_data_in45;
  wire [7:0] _sub_x_data_in49;
  wire [7:0] _sub_x_data_in51;
  wire [7:0] _sub_x_data_in53;
  wire [7:0] _sub_x_data_in55;
  wire [7:0] _sub_x_data_in57;
  wire [7:0] _sub_x_data_in59;
  wire [7:0] _sub_x_data_in61;
  wire [7:0] _sub_x_data_in65;
  wire [7:0] _sub_x_data_in67;
  wire [7:0] _sub_x_data_in69;
  wire [7:0] _sub_x_data_in71;
  wire [7:0] _sub_x_data_in73;
  wire [7:0] _sub_x_data_in75;
  wire [7:0] _sub_x_data_in77;
  wire [7:0] _sub_x_data_in81;
  wire [7:0] _sub_x_data_in83;
  wire [7:0] _sub_x_data_in85;
  wire [7:0] _sub_x_data_in87;
  wire [7:0] _sub_x_data_in89;
  wire [7:0] _sub_x_data_in91;
  wire [7:0] _sub_x_data_in93;
  wire [7:0] _sub_x_data_in97;
  wire [7:0] _sub_x_data_in99;
  wire [7:0] _sub_x_data_in101;
  wire [7:0] _sub_x_data_in103;
  wire [7:0] _sub_x_data_in105;
  wire [7:0] _sub_x_data_in107;
  wire [7:0] _sub_x_data_in109;
  wire [7:0] _sub_x_data_index17;
  wire [7:0] _sub_x_data_index19;
  wire [7:0] _sub_x_data_index21;
  wire [7:0] _sub_x_data_index23;
  wire [7:0] _sub_x_data_index25;
  wire [7:0] _sub_x_data_index27;
  wire [7:0] _sub_x_data_index29;
  wire [7:0] _sub_x_data_index33;
  wire [7:0] _sub_x_data_index35;
  wire [7:0] _sub_x_data_index37;
  wire [7:0] _sub_x_data_index39;
  wire [7:0] _sub_x_data_index41;
  wire [7:0] _sub_x_data_index43;
  wire [7:0] _sub_x_data_index45;
  wire [7:0] _sub_x_data_index49;
  wire [7:0] _sub_x_data_index51;
  wire [7:0] _sub_x_data_index53;
  wire [7:0] _sub_x_data_index55;
  wire [7:0] _sub_x_data_index57;
  wire [7:0] _sub_x_data_index59;
  wire [7:0] _sub_x_data_index61;
  wire [7:0] _sub_x_data_index65;
  wire [7:0] _sub_x_data_index67;
  wire [7:0] _sub_x_data_index69;
  wire [7:0] _sub_x_data_index71;
  wire [7:0] _sub_x_data_index73;
  wire [7:0] _sub_x_data_index75;
  wire [7:0] _sub_x_data_index77;
  wire [7:0] _sub_x_data_index81;
  wire [7:0] _sub_x_data_index83;
  wire [7:0] _sub_x_data_index85;
  wire [7:0] _sub_x_data_index87;
  wire [7:0] _sub_x_data_index89;
  wire [7:0] _sub_x_data_index91;
  wire [7:0] _sub_x_data_index93;
  wire [7:0] _sub_x_data_index97;
  wire [7:0] _sub_x_data_index99;
  wire [7:0] _sub_x_data_index101;
  wire [7:0] _sub_x_data_index103;
  wire [7:0] _sub_x_data_index105;
  wire [7:0] _sub_x_data_index107;
  wire [7:0] _sub_x_data_index109;
  wire [7:0] _sub_x_sub_array_out;
  wire _sub_x_subs_exe;
  wire _sub_x_p_reset;
  wire _sub_x_m_clock;
  reg _reg_0;
  reg _reg_1;
  reg _reg_2;
  reg _reg_3;
  wire _net_4;
  wire _reg_1_goto;
  wire _reg_2_goin;
  wire _net_7;
  reg _reg_8;
  reg _reg_9;
  wire _net_11;
  wire _net_12;
subs sub_x (.m_clock(m_clock), .p_reset( p_reset), .subs_exe(_sub_x_subs_exe), .sub_array_out(_sub_x_sub_array_out), .data_in17(_sub_x_data_in17), .data_in19(_sub_x_data_in19), .data_in21(_sub_x_data_in21), .data_in23(_sub_x_data_in23), .data_in25(_sub_x_data_in25), .data_in27(_sub_x_data_in27), .data_in29(_sub_x_data_in29), .data_in33(_sub_x_data_in33), .data_in35(_sub_x_data_in35), .data_in37(_sub_x_data_in37), .data_in39(_sub_x_data_in39), .data_in41(_sub_x_data_in41), .data_in43(_sub_x_data_in43), .data_in45(_sub_x_data_in45), .data_in49(_sub_x_data_in49), .data_in51(_sub_x_data_in51), .data_in53(_sub_x_data_in53), .data_in55(_sub_x_data_in55), .data_in57(_sub_x_data_in57), .data_in59(_sub_x_data_in59), .data_in61(_sub_x_data_in61), .data_in65(_sub_x_data_in65), .data_in67(_sub_x_data_in67), .data_in69(_sub_x_data_in69), .data_in71(_sub_x_data_in71), .data_in73(_sub_x_data_in73), .data_in75(_sub_x_data_in75), .data_in77(_sub_x_data_in77), .data_in81(_sub_x_data_in81), .data_in83(_sub_x_data_in83), .data_in85(_sub_x_data_in85), .data_in87(_sub_x_data_in87), .data_in89(_sub_x_data_in89), .data_in91(_sub_x_data_in91), .data_in93(_sub_x_data_in93), .data_in97(_sub_x_data_in97), .data_in99(_sub_x_data_in99), .data_in101(_sub_x_data_in101), .data_in103(_sub_x_data_in103), .data_in105(_sub_x_data_in105), .data_in107(_sub_x_data_in107), .data_in109(_sub_x_data_in109), .data_index17(_sub_x_data_index17), .data_index19(_sub_x_data_index19), .data_index21(_sub_x_data_index21), .data_index23(_sub_x_data_index23), .data_index25(_sub_x_data_index25), .data_index27(_sub_x_data_index27), .data_index29(_sub_x_data_index29), .data_index33(_sub_x_data_index33), .data_index35(_sub_x_data_index35), .data_index37(_sub_x_data_index37), .data_index39(_sub_x_data_index39), .data_index41(_sub_x_data_index41), .data_index43(_sub_x_data_index43), .data_index45(_sub_x_data_index45), .data_index49(_sub_x_data_index49), .data_index51(_sub_x_data_index51), .data_index53(_sub_x_data_index53), .data_index55(_sub_x_data_index55), .data_index57(_sub_x_data_index57), .data_index59(_sub_x_data_index59), .data_index61(_sub_x_data_index61), .data_index65(_sub_x_data_index65), .data_index67(_sub_x_data_index67), .data_index69(_sub_x_data_index69), .data_index71(_sub_x_data_index71), .data_index73(_sub_x_data_index73), .data_index75(_sub_x_data_index75), .data_index77(_sub_x_data_index77), .data_index81(_sub_x_data_index81), .data_index83(_sub_x_data_index83), .data_index85(_sub_x_data_index85), .data_index87(_sub_x_data_index87), .data_index89(_sub_x_data_index89), .data_index91(_sub_x_data_index91), .data_index93(_sub_x_data_index93), .data_index97(_sub_x_data_index97), .data_index99(_sub_x_data_index99), .data_index101(_sub_x_data_index101), .data_index103(_sub_x_data_index103), .data_index105(_sub_x_data_index105), .data_index107(_sub_x_data_index107), .data_index109(_sub_x_data_index109));
add_all add_all_x (.m_clock(m_clock), .p_reset( p_reset), .out_data(_add_all_x_out_data), .out_do(_add_all_x_out_do), .in_do(_add_all_x_in_do), .all_sg_out17(_add_all_x_all_sg_out17), .all_sg_out18(_add_all_x_all_sg_out18), .all_sg_out19(_add_all_x_all_sg_out19), .all_sg_out20(_add_all_x_all_sg_out20), .all_sg_out21(_add_all_x_all_sg_out21), .all_sg_out22(_add_all_x_all_sg_out22), .all_sg_out23(_add_all_x_all_sg_out23), .all_sg_out24(_add_all_x_all_sg_out24), .all_sg_out25(_add_all_x_all_sg_out25), .all_sg_out26(_add_all_x_all_sg_out26), .all_sg_out27(_add_all_x_all_sg_out27), .all_sg_out28(_add_all_x_all_sg_out28), .all_sg_out29(_add_all_x_all_sg_out29), .all_sg_out30(_add_all_x_all_sg_out30), .all_sg_out33(_add_all_x_all_sg_out33), .all_sg_out34(_add_all_x_all_sg_out34), .all_sg_out35(_add_all_x_all_sg_out35), .all_sg_out36(_add_all_x_all_sg_out36), .all_sg_out37(_add_all_x_all_sg_out37), .all_sg_out38(_add_all_x_all_sg_out38), .all_sg_out39(_add_all_x_all_sg_out39), .all_sg_out40(_add_all_x_all_sg_out40), .all_sg_out41(_add_all_x_all_sg_out41), .all_sg_out42(_add_all_x_all_sg_out42), .all_sg_out43(_add_all_x_all_sg_out43), .all_sg_out44(_add_all_x_all_sg_out44), .all_sg_out45(_add_all_x_all_sg_out45), .all_sg_out46(_add_all_x_all_sg_out46), .all_sg_out49(_add_all_x_all_sg_out49), .all_sg_out50(_add_all_x_all_sg_out50), .all_sg_out51(_add_all_x_all_sg_out51), .all_sg_out52(_add_all_x_all_sg_out52), .all_sg_out53(_add_all_x_all_sg_out53), .all_sg_out54(_add_all_x_all_sg_out54), .all_sg_out55(_add_all_x_all_sg_out55), .all_sg_out56(_add_all_x_all_sg_out56), .all_sg_out57(_add_all_x_all_sg_out57), .all_sg_out58(_add_all_x_all_sg_out58), .all_sg_out59(_add_all_x_all_sg_out59), .all_sg_out60(_add_all_x_all_sg_out60), .all_sg_out61(_add_all_x_all_sg_out61), .all_sg_out62(_add_all_x_all_sg_out62), .all_sg_out65(_add_all_x_all_sg_out65), .all_sg_out66(_add_all_x_all_sg_out66), .all_sg_out67(_add_all_x_all_sg_out67), .all_sg_out68(_add_all_x_all_sg_out68), .all_sg_out69(_add_all_x_all_sg_out69), .all_sg_out70(_add_all_x_all_sg_out70), .all_sg_out71(_add_all_x_all_sg_out71), .all_sg_out72(_add_all_x_all_sg_out72), .all_sg_out73(_add_all_x_all_sg_out73), .all_sg_out74(_add_all_x_all_sg_out74), .all_sg_out75(_add_all_x_all_sg_out75), .all_sg_out76(_add_all_x_all_sg_out76), .all_sg_out77(_add_all_x_all_sg_out77), .all_sg_out78(_add_all_x_all_sg_out78), .all_sg_out81(_add_all_x_all_sg_out81), .all_sg_out82(_add_all_x_all_sg_out82), .all_sg_out83(_add_all_x_all_sg_out83), .all_sg_out84(_add_all_x_all_sg_out84), .all_sg_out85(_add_all_x_all_sg_out85), .all_sg_out86(_add_all_x_all_sg_out86), .all_sg_out87(_add_all_x_all_sg_out87), .all_sg_out88(_add_all_x_all_sg_out88), .all_sg_out89(_add_all_x_all_sg_out89), .all_sg_out90(_add_all_x_all_sg_out90), .all_sg_out91(_add_all_x_all_sg_out91), .all_sg_out92(_add_all_x_all_sg_out92), .all_sg_out93(_add_all_x_all_sg_out93), .all_sg_out94(_add_all_x_all_sg_out94), .all_sg_out97(_add_all_x_all_sg_out97), .all_sg_out98(_add_all_x_all_sg_out98), .all_sg_out99(_add_all_x_all_sg_out99), .all_sg_out100(_add_all_x_all_sg_out100), .all_sg_out101(_add_all_x_all_sg_out101), .all_sg_out102(_add_all_x_all_sg_out102), .all_sg_out103(_add_all_x_all_sg_out103), .all_sg_out104(_add_all_x_all_sg_out104), .all_sg_out105(_add_all_x_all_sg_out105), .all_sg_out106(_add_all_x_all_sg_out106), .all_sg_out107(_add_all_x_all_sg_out107), .all_sg_out108(_add_all_x_all_sg_out108), .all_sg_out109(_add_all_x_all_sg_out109), .all_sg_out110(_add_all_x_all_sg_out110), .distance_count_all(_add_all_x_distance_count_all), .data_out_index17(_add_all_x_data_out_index17), .data_out_index18(_add_all_x_data_out_index18), .data_out_index19(_add_all_x_data_out_index19), .data_out_index20(_add_all_x_data_out_index20), .data_out_index21(_add_all_x_data_out_index21), .data_out_index22(_add_all_x_data_out_index22), .data_out_index23(_add_all_x_data_out_index23), .data_out_index24(_add_all_x_data_out_index24), .data_out_index25(_add_all_x_data_out_index25), .data_out_index26(_add_all_x_data_out_index26), .data_out_index27(_add_all_x_data_out_index27), .data_out_index28(_add_all_x_data_out_index28), .data_out_index29(_add_all_x_data_out_index29), .data_out_index30(_add_all_x_data_out_index30), .data_out_index33(_add_all_x_data_out_index33), .data_out_index34(_add_all_x_data_out_index34), .data_out_index35(_add_all_x_data_out_index35), .data_out_index36(_add_all_x_data_out_index36), .data_out_index37(_add_all_x_data_out_index37), .data_out_index38(_add_all_x_data_out_index38), .data_out_index39(_add_all_x_data_out_index39), .data_out_index40(_add_all_x_data_out_index40), .data_out_index41(_add_all_x_data_out_index41), .data_out_index42(_add_all_x_data_out_index42), .data_out_index43(_add_all_x_data_out_index43), .data_out_index44(_add_all_x_data_out_index44), .data_out_index45(_add_all_x_data_out_index45), .data_out_index46(_add_all_x_data_out_index46), .data_out_index49(_add_all_x_data_out_index49), .data_out_index50(_add_all_x_data_out_index50), .data_out_index51(_add_all_x_data_out_index51), .data_out_index52(_add_all_x_data_out_index52), .data_out_index53(_add_all_x_data_out_index53), .data_out_index54(_add_all_x_data_out_index54), .data_out_index55(_add_all_x_data_out_index55), .data_out_index56(_add_all_x_data_out_index56), .data_out_index57(_add_all_x_data_out_index57), .data_out_index58(_add_all_x_data_out_index58), .data_out_index59(_add_all_x_data_out_index59), .data_out_index60(_add_all_x_data_out_index60), .data_out_index61(_add_all_x_data_out_index61), .data_out_index62(_add_all_x_data_out_index62), .data_out_index65(_add_all_x_data_out_index65), .data_out_index66(_add_all_x_data_out_index66), .data_out_index67(_add_all_x_data_out_index67), .data_out_index68(_add_all_x_data_out_index68), .data_out_index69(_add_all_x_data_out_index69), .data_out_index70(_add_all_x_data_out_index70), .data_out_index71(_add_all_x_data_out_index71), .data_out_index72(_add_all_x_data_out_index72), .data_out_index73(_add_all_x_data_out_index73), .data_out_index74(_add_all_x_data_out_index74), .data_out_index75(_add_all_x_data_out_index75), .data_out_index76(_add_all_x_data_out_index76), .data_out_index77(_add_all_x_data_out_index77), .data_out_index78(_add_all_x_data_out_index78), .data_out_index81(_add_all_x_data_out_index81), .data_out_index82(_add_all_x_data_out_index82), .data_out_index83(_add_all_x_data_out_index83), .data_out_index84(_add_all_x_data_out_index84), .data_out_index85(_add_all_x_data_out_index85), .data_out_index86(_add_all_x_data_out_index86), .data_out_index87(_add_all_x_data_out_index87), .data_out_index88(_add_all_x_data_out_index88), .data_out_index89(_add_all_x_data_out_index89), .data_out_index90(_add_all_x_data_out_index90), .data_out_index91(_add_all_x_data_out_index91), .data_out_index92(_add_all_x_data_out_index92), .data_out_index93(_add_all_x_data_out_index93), .data_out_index94(_add_all_x_data_out_index94), .data_out_index97(_add_all_x_data_out_index97), .data_out_index98(_add_all_x_data_out_index98), .data_out_index99(_add_all_x_data_out_index99), .data_out_index100(_add_all_x_data_out_index100), .data_out_index101(_add_all_x_data_out_index101), .data_out_index102(_add_all_x_data_out_index102), .data_out_index103(_add_all_x_data_out_index103), .data_out_index104(_add_all_x_data_out_index104), .data_out_index105(_add_all_x_data_out_index105), .data_out_index106(_add_all_x_data_out_index106), .data_out_index107(_add_all_x_data_out_index107), .data_out_index108(_add_all_x_data_out_index108), .data_out_index109(_add_all_x_data_out_index109), .data_out_index110(_add_all_x_data_out_index110), .data_out17(_add_all_x_data_out17), .data_out18(_add_all_x_data_out18), .data_out19(_add_all_x_data_out19), .data_out20(_add_all_x_data_out20), .data_out21(_add_all_x_data_out21), .data_out22(_add_all_x_data_out22), .data_out23(_add_all_x_data_out23), .data_out24(_add_all_x_data_out24), .data_out25(_add_all_x_data_out25), .data_out26(_add_all_x_data_out26), .data_out27(_add_all_x_data_out27), .data_out28(_add_all_x_data_out28), .data_out29(_add_all_x_data_out29), .data_out30(_add_all_x_data_out30), .data_out33(_add_all_x_data_out33), .data_out34(_add_all_x_data_out34), .data_out35(_add_all_x_data_out35), .data_out36(_add_all_x_data_out36), .data_out37(_add_all_x_data_out37), .data_out38(_add_all_x_data_out38), .data_out39(_add_all_x_data_out39), .data_out40(_add_all_x_data_out40), .data_out41(_add_all_x_data_out41), .data_out42(_add_all_x_data_out42), .data_out43(_add_all_x_data_out43), .data_out44(_add_all_x_data_out44), .data_out45(_add_all_x_data_out45), .data_out46(_add_all_x_data_out46), .data_out49(_add_all_x_data_out49), .data_out50(_add_all_x_data_out50), .data_out51(_add_all_x_data_out51), .data_out52(_add_all_x_data_out52), .data_out53(_add_all_x_data_out53), .data_out54(_add_all_x_data_out54), .data_out55(_add_all_x_data_out55), .data_out56(_add_all_x_data_out56), .data_out57(_add_all_x_data_out57), .data_out58(_add_all_x_data_out58), .data_out59(_add_all_x_data_out59), .data_out60(_add_all_x_data_out60), .data_out61(_add_all_x_data_out61), .data_out62(_add_all_x_data_out62), .data_out65(_add_all_x_data_out65), .data_out66(_add_all_x_data_out66), .data_out67(_add_all_x_data_out67), .data_out68(_add_all_x_data_out68), .data_out69(_add_all_x_data_out69), .data_out70(_add_all_x_data_out70), .data_out71(_add_all_x_data_out71), .data_out72(_add_all_x_data_out72), .data_out73(_add_all_x_data_out73), .data_out74(_add_all_x_data_out74), .data_out75(_add_all_x_data_out75), .data_out76(_add_all_x_data_out76), .data_out77(_add_all_x_data_out77), .data_out78(_add_all_x_data_out78), .data_out81(_add_all_x_data_out81), .data_out82(_add_all_x_data_out82), .data_out83(_add_all_x_data_out83), .data_out84(_add_all_x_data_out84), .data_out85(_add_all_x_data_out85), .data_out86(_add_all_x_data_out86), .data_out87(_add_all_x_data_out87), .data_out88(_add_all_x_data_out88), .data_out89(_add_all_x_data_out89), .data_out90(_add_all_x_data_out90), .data_out91(_add_all_x_data_out91), .data_out92(_add_all_x_data_out92), .data_out93(_add_all_x_data_out93), .data_out94(_add_all_x_data_out94), .data_out97(_add_all_x_data_out97), .data_out98(_add_all_x_data_out98), .data_out99(_add_all_x_data_out99), .data_out100(_add_all_x_data_out100), .data_out101(_add_all_x_data_out101), .data_out102(_add_all_x_data_out102), .data_out103(_add_all_x_data_out103), .data_out104(_add_all_x_data_out104), .data_out105(_add_all_x_data_out105), .data_out106(_add_all_x_data_out106), .data_out107(_add_all_x_data_out107), .data_out108(_add_all_x_data_out108), .data_out109(_add_all_x_data_out109), .data_out110(_add_all_x_data_out110), .sg_out17(_add_all_x_sg_out17), .sg_out18(_add_all_x_sg_out18), .sg_out19(_add_all_x_sg_out19), .sg_out20(_add_all_x_sg_out20), .sg_out21(_add_all_x_sg_out21), .sg_out22(_add_all_x_sg_out22), .sg_out23(_add_all_x_sg_out23), .sg_out24(_add_all_x_sg_out24), .sg_out25(_add_all_x_sg_out25), .sg_out26(_add_all_x_sg_out26), .sg_out27(_add_all_x_sg_out27), .sg_out28(_add_all_x_sg_out28), .sg_out29(_add_all_x_sg_out29), .sg_out30(_add_all_x_sg_out30), .sg_out33(_add_all_x_sg_out33), .sg_out34(_add_all_x_sg_out34), .sg_out35(_add_all_x_sg_out35), .sg_out36(_add_all_x_sg_out36), .sg_out37(_add_all_x_sg_out37), .sg_out38(_add_all_x_sg_out38), .sg_out39(_add_all_x_sg_out39), .sg_out40(_add_all_x_sg_out40), .sg_out41(_add_all_x_sg_out41), .sg_out42(_add_all_x_sg_out42), .sg_out43(_add_all_x_sg_out43), .sg_out44(_add_all_x_sg_out44), .sg_out45(_add_all_x_sg_out45), .sg_out46(_add_all_x_sg_out46), .sg_out49(_add_all_x_sg_out49), .sg_out50(_add_all_x_sg_out50), .sg_out51(_add_all_x_sg_out51), .sg_out52(_add_all_x_sg_out52), .sg_out53(_add_all_x_sg_out53), .sg_out54(_add_all_x_sg_out54), .sg_out55(_add_all_x_sg_out55), .sg_out56(_add_all_x_sg_out56), .sg_out57(_add_all_x_sg_out57), .sg_out58(_add_all_x_sg_out58), .sg_out59(_add_all_x_sg_out59), .sg_out60(_add_all_x_sg_out60), .sg_out61(_add_all_x_sg_out61), .sg_out62(_add_all_x_sg_out62), .sg_out65(_add_all_x_sg_out65), .sg_out66(_add_all_x_sg_out66), .sg_out67(_add_all_x_sg_out67), .sg_out68(_add_all_x_sg_out68), .sg_out69(_add_all_x_sg_out69), .sg_out70(_add_all_x_sg_out70), .sg_out71(_add_all_x_sg_out71), .sg_out72(_add_all_x_sg_out72), .sg_out73(_add_all_x_sg_out73), .sg_out74(_add_all_x_sg_out74), .sg_out75(_add_all_x_sg_out75), .sg_out76(_add_all_x_sg_out76), .sg_out77(_add_all_x_sg_out77), .sg_out78(_add_all_x_sg_out78), .sg_out81(_add_all_x_sg_out81), .sg_out82(_add_all_x_sg_out82), .sg_out83(_add_all_x_sg_out83), .sg_out84(_add_all_x_sg_out84), .sg_out85(_add_all_x_sg_out85), .sg_out86(_add_all_x_sg_out86), .sg_out87(_add_all_x_sg_out87), .sg_out88(_add_all_x_sg_out88), .sg_out89(_add_all_x_sg_out89), .sg_out90(_add_all_x_sg_out90), .sg_out91(_add_all_x_sg_out91), .sg_out92(_add_all_x_sg_out92), .sg_out93(_add_all_x_sg_out93), .sg_out94(_add_all_x_sg_out94), .sg_out97(_add_all_x_sg_out97), .sg_out98(_add_all_x_sg_out98), .sg_out99(_add_all_x_sg_out99), .sg_out100(_add_all_x_sg_out100), .sg_out101(_add_all_x_sg_out101), .sg_out102(_add_all_x_sg_out102), .sg_out103(_add_all_x_sg_out103), .sg_out104(_add_all_x_sg_out104), .sg_out105(_add_all_x_sg_out105), .sg_out106(_add_all_x_sg_out106), .sg_out107(_add_all_x_sg_out107), .sg_out108(_add_all_x_sg_out108), .sg_out109(_add_all_x_sg_out109), .sg_out110(_add_all_x_sg_out110), .data_out_org17(_add_all_x_data_out_org17), .data_out_org18(_add_all_x_data_out_org18), .data_out_org19(_add_all_x_data_out_org19), .data_out_org20(_add_all_x_data_out_org20), .data_out_org21(_add_all_x_data_out_org21), .data_out_org22(_add_all_x_data_out_org22), .data_out_org23(_add_all_x_data_out_org23), .data_out_org24(_add_all_x_data_out_org24), .data_out_org25(_add_all_x_data_out_org25), .data_out_org26(_add_all_x_data_out_org26), .data_out_org27(_add_all_x_data_out_org27), .data_out_org28(_add_all_x_data_out_org28), .data_out_org29(_add_all_x_data_out_org29), .data_out_org30(_add_all_x_data_out_org30), .data_out_org33(_add_all_x_data_out_org33), .data_out_org34(_add_all_x_data_out_org34), .data_out_org35(_add_all_x_data_out_org35), .data_out_org36(_add_all_x_data_out_org36), .data_out_org37(_add_all_x_data_out_org37), .data_out_org38(_add_all_x_data_out_org38), .data_out_org39(_add_all_x_data_out_org39), .data_out_org40(_add_all_x_data_out_org40), .data_out_org41(_add_all_x_data_out_org41), .data_out_org42(_add_all_x_data_out_org42), .data_out_org43(_add_all_x_data_out_org43), .data_out_org44(_add_all_x_data_out_org44), .data_out_org45(_add_all_x_data_out_org45), .data_out_org46(_add_all_x_data_out_org46), .data_out_org49(_add_all_x_data_out_org49), .data_out_org50(_add_all_x_data_out_org50), .data_out_org51(_add_all_x_data_out_org51), .data_out_org52(_add_all_x_data_out_org52), .data_out_org53(_add_all_x_data_out_org53), .data_out_org54(_add_all_x_data_out_org54), .data_out_org55(_add_all_x_data_out_org55), .data_out_org56(_add_all_x_data_out_org56), .data_out_org57(_add_all_x_data_out_org57), .data_out_org58(_add_all_x_data_out_org58), .data_out_org59(_add_all_x_data_out_org59), .data_out_org60(_add_all_x_data_out_org60), .data_out_org61(_add_all_x_data_out_org61), .data_out_org62(_add_all_x_data_out_org62), .data_out_org65(_add_all_x_data_out_org65), .data_out_org66(_add_all_x_data_out_org66), .data_out_org67(_add_all_x_data_out_org67), .data_out_org68(_add_all_x_data_out_org68), .data_out_org69(_add_all_x_data_out_org69), .data_out_org70(_add_all_x_data_out_org70), .data_out_org71(_add_all_x_data_out_org71), .data_out_org72(_add_all_x_data_out_org72), .data_out_org73(_add_all_x_data_out_org73), .data_out_org74(_add_all_x_data_out_org74), .data_out_org75(_add_all_x_data_out_org75), .data_out_org76(_add_all_x_data_out_org76), .data_out_org77(_add_all_x_data_out_org77), .data_out_org78(_add_all_x_data_out_org78), .data_out_org81(_add_all_x_data_out_org81), .data_out_org82(_add_all_x_data_out_org82), .data_out_org83(_add_all_x_data_out_org83), .data_out_org84(_add_all_x_data_out_org84), .data_out_org85(_add_all_x_data_out_org85), .data_out_org86(_add_all_x_data_out_org86), .data_out_org87(_add_all_x_data_out_org87), .data_out_org88(_add_all_x_data_out_org88), .data_out_org89(_add_all_x_data_out_org89), .data_out_org90(_add_all_x_data_out_org90), .data_out_org91(_add_all_x_data_out_org91), .data_out_org92(_add_all_x_data_out_org92), .data_out_org93(_add_all_x_data_out_org93), .data_out_org94(_add_all_x_data_out_org94), .data_out_org97(_add_all_x_data_out_org97), .data_out_org98(_add_all_x_data_out_org98), .data_out_org99(_add_all_x_data_out_org99), .data_out_org100(_add_all_x_data_out_org100), .data_out_org101(_add_all_x_data_out_org101), .data_out_org102(_add_all_x_data_out_org102), .data_out_org103(_add_all_x_data_out_org103), .data_out_org104(_add_all_x_data_out_org104), .data_out_org105(_add_all_x_data_out_org105), .data_out_org106(_add_all_x_data_out_org106), .data_out_org107(_add_all_x_data_out_org107), .data_out_org108(_add_all_x_data_out_org108), .data_out_org109(_add_all_x_data_out_org109), .data_out_org110(_add_all_x_data_out_org110), .data_in_org17(_add_all_x_data_in_org17), .data_in_org18(_add_all_x_data_in_org18), .data_in_org19(_add_all_x_data_in_org19), .data_in_org20(_add_all_x_data_in_org20), .data_in_org21(_add_all_x_data_in_org21), .data_in_org22(_add_all_x_data_in_org22), .data_in_org23(_add_all_x_data_in_org23), .data_in_org24(_add_all_x_data_in_org24), .data_in_org25(_add_all_x_data_in_org25), .data_in_org26(_add_all_x_data_in_org26), .data_in_org27(_add_all_x_data_in_org27), .data_in_org28(_add_all_x_data_in_org28), .data_in_org29(_add_all_x_data_in_org29), .data_in_org30(_add_all_x_data_in_org30), .data_in_org33(_add_all_x_data_in_org33), .data_in_org34(_add_all_x_data_in_org34), .data_in_org35(_add_all_x_data_in_org35), .data_in_org36(_add_all_x_data_in_org36), .data_in_org37(_add_all_x_data_in_org37), .data_in_org38(_add_all_x_data_in_org38), .data_in_org39(_add_all_x_data_in_org39), .data_in_org40(_add_all_x_data_in_org40), .data_in_org41(_add_all_x_data_in_org41), .data_in_org42(_add_all_x_data_in_org42), .data_in_org43(_add_all_x_data_in_org43), .data_in_org44(_add_all_x_data_in_org44), .data_in_org45(_add_all_x_data_in_org45), .data_in_org46(_add_all_x_data_in_org46), .data_in_org49(_add_all_x_data_in_org49), .data_in_org50(_add_all_x_data_in_org50), .data_in_org51(_add_all_x_data_in_org51), .data_in_org52(_add_all_x_data_in_org52), .data_in_org53(_add_all_x_data_in_org53), .data_in_org54(_add_all_x_data_in_org54), .data_in_org55(_add_all_x_data_in_org55), .data_in_org56(_add_all_x_data_in_org56), .data_in_org57(_add_all_x_data_in_org57), .data_in_org58(_add_all_x_data_in_org58), .data_in_org59(_add_all_x_data_in_org59), .data_in_org60(_add_all_x_data_in_org60), .data_in_org61(_add_all_x_data_in_org61), .data_in_org62(_add_all_x_data_in_org62), .data_in_org65(_add_all_x_data_in_org65), .data_in_org66(_add_all_x_data_in_org66), .data_in_org67(_add_all_x_data_in_org67), .data_in_org68(_add_all_x_data_in_org68), .data_in_org69(_add_all_x_data_in_org69), .data_in_org70(_add_all_x_data_in_org70), .data_in_org71(_add_all_x_data_in_org71), .data_in_org72(_add_all_x_data_in_org72), .data_in_org73(_add_all_x_data_in_org73), .data_in_org74(_add_all_x_data_in_org74), .data_in_org75(_add_all_x_data_in_org75), .data_in_org76(_add_all_x_data_in_org76), .data_in_org77(_add_all_x_data_in_org77), .data_in_org78(_add_all_x_data_in_org78), .data_in_org81(_add_all_x_data_in_org81), .data_in_org82(_add_all_x_data_in_org82), .data_in_org83(_add_all_x_data_in_org83), .data_in_org84(_add_all_x_data_in_org84), .data_in_org85(_add_all_x_data_in_org85), .data_in_org86(_add_all_x_data_in_org86), .data_in_org87(_add_all_x_data_in_org87), .data_in_org88(_add_all_x_data_in_org88), .data_in_org89(_add_all_x_data_in_org89), .data_in_org90(_add_all_x_data_in_org90), .data_in_org91(_add_all_x_data_in_org91), .data_in_org92(_add_all_x_data_in_org92), .data_in_org93(_add_all_x_data_in_org93), .data_in_org94(_add_all_x_data_in_org94), .data_in_org97(_add_all_x_data_in_org97), .data_in_org98(_add_all_x_data_in_org98), .data_in_org99(_add_all_x_data_in_org99), .data_in_org100(_add_all_x_data_in_org100), .data_in_org101(_add_all_x_data_in_org101), .data_in_org102(_add_all_x_data_in_org102), .data_in_org103(_add_all_x_data_in_org103), .data_in_org104(_add_all_x_data_in_org104), .data_in_org105(_add_all_x_data_in_org105), .data_in_org106(_add_all_x_data_in_org106), .data_in_org107(_add_all_x_data_in_org107), .data_in_org108(_add_all_x_data_in_org108), .data_in_org109(_add_all_x_data_in_org109), .data_in_org110(_add_all_x_data_in_org110), .data_in17(_add_all_x_data_in17), .data_in18(_add_all_x_data_in18), .data_in19(_add_all_x_data_in19), .data_in20(_add_all_x_data_in20), .data_in21(_add_all_x_data_in21), .data_in22(_add_all_x_data_in22), .data_in23(_add_all_x_data_in23), .data_in24(_add_all_x_data_in24), .data_in25(_add_all_x_data_in25), .data_in26(_add_all_x_data_in26), .data_in27(_add_all_x_data_in27), .data_in28(_add_all_x_data_in28), .data_in29(_add_all_x_data_in29), .data_in30(_add_all_x_data_in30), .data_in33(_add_all_x_data_in33), .data_in34(_add_all_x_data_in34), .data_in35(_add_all_x_data_in35), .data_in36(_add_all_x_data_in36), .data_in37(_add_all_x_data_in37), .data_in38(_add_all_x_data_in38), .data_in39(_add_all_x_data_in39), .data_in40(_add_all_x_data_in40), .data_in41(_add_all_x_data_in41), .data_in42(_add_all_x_data_in42), .data_in43(_add_all_x_data_in43), .data_in44(_add_all_x_data_in44), .data_in45(_add_all_x_data_in45), .data_in46(_add_all_x_data_in46), .data_in49(_add_all_x_data_in49), .data_in50(_add_all_x_data_in50), .data_in51(_add_all_x_data_in51), .data_in52(_add_all_x_data_in52), .data_in53(_add_all_x_data_in53), .data_in54(_add_all_x_data_in54), .data_in55(_add_all_x_data_in55), .data_in56(_add_all_x_data_in56), .data_in57(_add_all_x_data_in57), .data_in58(_add_all_x_data_in58), .data_in59(_add_all_x_data_in59), .data_in60(_add_all_x_data_in60), .data_in61(_add_all_x_data_in61), .data_in62(_add_all_x_data_in62), .data_in65(_add_all_x_data_in65), .data_in66(_add_all_x_data_in66), .data_in67(_add_all_x_data_in67), .data_in68(_add_all_x_data_in68), .data_in69(_add_all_x_data_in69), .data_in70(_add_all_x_data_in70), .data_in71(_add_all_x_data_in71), .data_in72(_add_all_x_data_in72), .data_in73(_add_all_x_data_in73), .data_in74(_add_all_x_data_in74), .data_in75(_add_all_x_data_in75), .data_in76(_add_all_x_data_in76), .data_in77(_add_all_x_data_in77), .data_in78(_add_all_x_data_in78), .data_in81(_add_all_x_data_in81), .data_in82(_add_all_x_data_in82), .data_in83(_add_all_x_data_in83), .data_in84(_add_all_x_data_in84), .data_in85(_add_all_x_data_in85), .data_in86(_add_all_x_data_in86), .data_in87(_add_all_x_data_in87), .data_in88(_add_all_x_data_in88), .data_in89(_add_all_x_data_in89), .data_in90(_add_all_x_data_in90), .data_in91(_add_all_x_data_in91), .data_in92(_add_all_x_data_in92), .data_in93(_add_all_x_data_in93), .data_in94(_add_all_x_data_in94), .data_in97(_add_all_x_data_in97), .data_in98(_add_all_x_data_in98), .data_in99(_add_all_x_data_in99), .data_in100(_add_all_x_data_in100), .data_in101(_add_all_x_data_in101), .data_in102(_add_all_x_data_in102), .data_in103(_add_all_x_data_in103), .data_in104(_add_all_x_data_in104), .data_in105(_add_all_x_data_in105), .data_in106(_add_all_x_data_in106), .data_in107(_add_all_x_data_in107), .data_in108(_add_all_x_data_in108), .data_in109(_add_all_x_data_in109), .data_in110(_add_all_x_data_in110), .all_sg_in17(_add_all_x_all_sg_in17), .all_sg_in18(_add_all_x_all_sg_in18), .all_sg_in19(_add_all_x_all_sg_in19), .all_sg_in20(_add_all_x_all_sg_in20), .all_sg_in21(_add_all_x_all_sg_in21), .all_sg_in22(_add_all_x_all_sg_in22), .all_sg_in23(_add_all_x_all_sg_in23), .all_sg_in24(_add_all_x_all_sg_in24), .all_sg_in25(_add_all_x_all_sg_in25), .all_sg_in26(_add_all_x_all_sg_in26), .all_sg_in27(_add_all_x_all_sg_in27), .all_sg_in28(_add_all_x_all_sg_in28), .all_sg_in29(_add_all_x_all_sg_in29), .all_sg_in30(_add_all_x_all_sg_in30), .all_sg_in33(_add_all_x_all_sg_in33), .all_sg_in34(_add_all_x_all_sg_in34), .all_sg_in35(_add_all_x_all_sg_in35), .all_sg_in36(_add_all_x_all_sg_in36), .all_sg_in37(_add_all_x_all_sg_in37), .all_sg_in38(_add_all_x_all_sg_in38), .all_sg_in39(_add_all_x_all_sg_in39), .all_sg_in40(_add_all_x_all_sg_in40), .all_sg_in41(_add_all_x_all_sg_in41), .all_sg_in42(_add_all_x_all_sg_in42), .all_sg_in43(_add_all_x_all_sg_in43), .all_sg_in44(_add_all_x_all_sg_in44), .all_sg_in45(_add_all_x_all_sg_in45), .all_sg_in46(_add_all_x_all_sg_in46), .all_sg_in49(_add_all_x_all_sg_in49), .all_sg_in50(_add_all_x_all_sg_in50), .all_sg_in51(_add_all_x_all_sg_in51), .all_sg_in52(_add_all_x_all_sg_in52), .all_sg_in53(_add_all_x_all_sg_in53), .all_sg_in54(_add_all_x_all_sg_in54), .all_sg_in55(_add_all_x_all_sg_in55), .all_sg_in56(_add_all_x_all_sg_in56), .all_sg_in57(_add_all_x_all_sg_in57), .all_sg_in58(_add_all_x_all_sg_in58), .all_sg_in59(_add_all_x_all_sg_in59), .all_sg_in60(_add_all_x_all_sg_in60), .all_sg_in61(_add_all_x_all_sg_in61), .all_sg_in62(_add_all_x_all_sg_in62), .all_sg_in65(_add_all_x_all_sg_in65), .all_sg_in66(_add_all_x_all_sg_in66), .all_sg_in67(_add_all_x_all_sg_in67), .all_sg_in68(_add_all_x_all_sg_in68), .all_sg_in69(_add_all_x_all_sg_in69), .all_sg_in70(_add_all_x_all_sg_in70), .all_sg_in71(_add_all_x_all_sg_in71), .all_sg_in72(_add_all_x_all_sg_in72), .all_sg_in73(_add_all_x_all_sg_in73), .all_sg_in74(_add_all_x_all_sg_in74), .all_sg_in75(_add_all_x_all_sg_in75), .all_sg_in76(_add_all_x_all_sg_in76), .all_sg_in77(_add_all_x_all_sg_in77), .all_sg_in78(_add_all_x_all_sg_in78), .all_sg_in81(_add_all_x_all_sg_in81), .all_sg_in82(_add_all_x_all_sg_in82), .all_sg_in83(_add_all_x_all_sg_in83), .all_sg_in84(_add_all_x_all_sg_in84), .all_sg_in85(_add_all_x_all_sg_in85), .all_sg_in86(_add_all_x_all_sg_in86), .all_sg_in87(_add_all_x_all_sg_in87), .all_sg_in88(_add_all_x_all_sg_in88), .all_sg_in89(_add_all_x_all_sg_in89), .all_sg_in90(_add_all_x_all_sg_in90), .all_sg_in91(_add_all_x_all_sg_in91), .all_sg_in92(_add_all_x_all_sg_in92), .all_sg_in93(_add_all_x_all_sg_in93), .all_sg_in94(_add_all_x_all_sg_in94), .all_sg_in97(_add_all_x_all_sg_in97), .all_sg_in98(_add_all_x_all_sg_in98), .all_sg_in99(_add_all_x_all_sg_in99), .all_sg_in100(_add_all_x_all_sg_in100), .all_sg_in101(_add_all_x_all_sg_in101), .all_sg_in102(_add_all_x_all_sg_in102), .all_sg_in103(_add_all_x_all_sg_in103), .all_sg_in104(_add_all_x_all_sg_in104), .all_sg_in105(_add_all_x_all_sg_in105), .all_sg_in106(_add_all_x_all_sg_in106), .all_sg_in107(_add_all_x_all_sg_in107), .all_sg_in108(_add_all_x_all_sg_in108), .all_sg_in109(_add_all_x_all_sg_in109), .all_sg_in110(_add_all_x_all_sg_in110), .wall_end(_add_all_x_wall_end), .wall_end_in(_add_all_x_wall_end_in), .sg_in17(_add_all_x_sg_in17), .sg_in18(_add_all_x_sg_in18), .sg_in19(_add_all_x_sg_in19), .sg_in20(_add_all_x_sg_in20), .sg_in21(_add_all_x_sg_in21), .sg_in22(_add_all_x_sg_in22), .sg_in23(_add_all_x_sg_in23), .sg_in24(_add_all_x_sg_in24), .sg_in25(_add_all_x_sg_in25), .sg_in26(_add_all_x_sg_in26), .sg_in27(_add_all_x_sg_in27), .sg_in28(_add_all_x_sg_in28), .sg_in29(_add_all_x_sg_in29), .sg_in30(_add_all_x_sg_in30), .sg_in33(_add_all_x_sg_in33), .sg_in34(_add_all_x_sg_in34), .sg_in35(_add_all_x_sg_in35), .sg_in36(_add_all_x_sg_in36), .sg_in37(_add_all_x_sg_in37), .sg_in38(_add_all_x_sg_in38), .sg_in39(_add_all_x_sg_in39), .sg_in40(_add_all_x_sg_in40), .sg_in41(_add_all_x_sg_in41), .sg_in42(_add_all_x_sg_in42), .sg_in43(_add_all_x_sg_in43), .sg_in44(_add_all_x_sg_in44), .sg_in45(_add_all_x_sg_in45), .sg_in46(_add_all_x_sg_in46), .sg_in49(_add_all_x_sg_in49), .sg_in50(_add_all_x_sg_in50), .sg_in51(_add_all_x_sg_in51), .sg_in52(_add_all_x_sg_in52), .sg_in53(_add_all_x_sg_in53), .sg_in54(_add_all_x_sg_in54), .sg_in55(_add_all_x_sg_in55), .sg_in56(_add_all_x_sg_in56), .sg_in57(_add_all_x_sg_in57), .sg_in58(_add_all_x_sg_in58), .sg_in59(_add_all_x_sg_in59), .sg_in60(_add_all_x_sg_in60), .sg_in61(_add_all_x_sg_in61), .sg_in62(_add_all_x_sg_in62), .sg_in65(_add_all_x_sg_in65), .sg_in66(_add_all_x_sg_in66), .sg_in67(_add_all_x_sg_in67), .sg_in68(_add_all_x_sg_in68), .sg_in69(_add_all_x_sg_in69), .sg_in70(_add_all_x_sg_in70), .sg_in71(_add_all_x_sg_in71), .sg_in72(_add_all_x_sg_in72), .sg_in73(_add_all_x_sg_in73), .sg_in74(_add_all_x_sg_in74), .sg_in75(_add_all_x_sg_in75), .sg_in76(_add_all_x_sg_in76), .sg_in77(_add_all_x_sg_in77), .sg_in78(_add_all_x_sg_in78), .sg_in81(_add_all_x_sg_in81), .sg_in82(_add_all_x_sg_in82), .sg_in83(_add_all_x_sg_in83), .sg_in84(_add_all_x_sg_in84), .sg_in85(_add_all_x_sg_in85), .sg_in86(_add_all_x_sg_in86), .sg_in87(_add_all_x_sg_in87), .sg_in88(_add_all_x_sg_in88), .sg_in89(_add_all_x_sg_in89), .sg_in90(_add_all_x_sg_in90), .sg_in91(_add_all_x_sg_in91), .sg_in92(_add_all_x_sg_in92), .sg_in93(_add_all_x_sg_in93), .sg_in94(_add_all_x_sg_in94), .sg_in97(_add_all_x_sg_in97), .sg_in98(_add_all_x_sg_in98), .sg_in99(_add_all_x_sg_in99), .sg_in100(_add_all_x_sg_in100), .sg_in101(_add_all_x_sg_in101), .sg_in102(_add_all_x_sg_in102), .sg_in103(_add_all_x_sg_in103), .sg_in104(_add_all_x_sg_in104), .sg_in105(_add_all_x_sg_in105), .sg_in106(_add_all_x_sg_in106), .sg_in107(_add_all_x_sg_in107), .sg_in108(_add_all_x_sg_in108), .sg_in109(_add_all_x_sg_in109), .sg_in110(_add_all_x_sg_in110), .dig_t0(_add_all_x_dig_t0), .dig_t1(_add_all_x_dig_t1), .dig_t2(_add_all_x_dig_t2), .dig_t3(_add_all_x_dig_t3), .dig_t4(_add_all_x_dig_t4), .dig_t5(_add_all_x_dig_t5), .dig_t6(_add_all_x_dig_t6), .dig_t7(_add_all_x_dig_t7), .dig_t8(_add_all_x_dig_t8), .dig_t9(_add_all_x_dig_t9), .dig_t10(_add_all_x_dig_t10), .dig_t11(_add_all_x_dig_t11), .dig_t12(_add_all_x_dig_t12), .dig_t13(_add_all_x_dig_t13), .dig_t14(_add_all_x_dig_t14), .dig_t15(_add_all_x_dig_t15), .dig_t16(_add_all_x_dig_t16), .dig_t17(_add_all_x_dig_t17), .dig_t18(_add_all_x_dig_t18), .dig_t19(_add_all_x_dig_t19), .dig_t20(_add_all_x_dig_t20), .dig_t21(_add_all_x_dig_t21), .dig_t22(_add_all_x_dig_t22), .dig_t23(_add_all_x_dig_t23), .dig_t24(_add_all_x_dig_t24), .dig_t25(_add_all_x_dig_t25), .dig_t26(_add_all_x_dig_t26), .dig_t27(_add_all_x_dig_t27), .dig_t28(_add_all_x_dig_t28), .dig_t29(_add_all_x_dig_t29), .dig_t30(_add_all_x_dig_t30), .dig_t31(_add_all_x_dig_t31), .dig_t32(_add_all_x_dig_t32), .dig_t33(_add_all_x_dig_t33), .dig_t34(_add_all_x_dig_t34), .dig_t35(_add_all_x_dig_t35), .dig_t36(_add_all_x_dig_t36), .dig_t37(_add_all_x_dig_t37), .dig_t38(_add_all_x_dig_t38), .dig_t39(_add_all_x_dig_t39), .dig_t40(_add_all_x_dig_t40), .dig_t41(_add_all_x_dig_t41), .sig(_add_all_x_sig), .start(_add_all_x_start), .goal(_add_all_x_goal), .dig_w(_add_all_x_dig_w));

   assign  dig_exit = (((((((((((((((((((((((((((((((((((((((((_add_all_x_dig_t0|_add_all_x_dig_t1)|_add_all_x_dig_t2)|_add_all_x_dig_t3)|_add_all_x_dig_t4)|_add_all_x_dig_t5)|_add_all_x_dig_t6)|_add_all_x_dig_t7)|_add_all_x_dig_t8)|_add_all_x_dig_t9)|_add_all_x_dig_t10)|_add_all_x_dig_t11)|_add_all_x_dig_t12)|_add_all_x_dig_t13)|_add_all_x_dig_t14)|_add_all_x_dig_t15)|_add_all_x_dig_t16)|_add_all_x_dig_t17)|_add_all_x_dig_t18)|_add_all_x_dig_t19)|_add_all_x_dig_t20)|_add_all_x_dig_t21)|_add_all_x_dig_t22)|_add_all_x_dig_t23)|_add_all_x_dig_t24)|_add_all_x_dig_t25)|_add_all_x_dig_t26)|_add_all_x_dig_t27)|_add_all_x_dig_t28)|_add_all_x_dig_t29)|_add_all_x_dig_t30)|_add_all_x_dig_t31)|_add_all_x_dig_t32)|_add_all_x_dig_t33)|_add_all_x_dig_t34)|_add_all_x_dig_t35)|_add_all_x_dig_t36)|_add_all_x_dig_t37)|_add_all_x_dig_t38)|_add_all_x_dig_t39)|_add_all_x_dig_t40)|_add_all_x_dig_t41);

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:even_w1) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  even_w1 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 1'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(in_do|_reg_3)|
    ((_reg_2)?1'b0:1'b0)|
    (((_reg_1&_net_4))?1'b1:1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:start_w) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  start_w = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?start:8'b0)|
    ((_reg_2)?start_reg:8'b0)|
    (((_reg_1&_net_4))?start_reg:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:goal_w) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  goal_w = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?goal:8'b0)|
    ((_reg_2)?goal_reg:8'b0)|
    (((_reg_1&_net_4))?goal_reg:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:wall_w) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  wall_w = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 1'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?1'b0:1'b0)|
    ((_reg_2)?dig_exit:1'b0)|
    (((_reg_1&_net_4))?dig_exit:1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire17) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire17 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out17:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire18) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire18 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out18:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire19) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire19 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out19:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire20) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire20 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out20:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire21) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire21 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out21:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire22) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire22 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out22:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire23) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire23 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out23:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire24) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire24 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out24:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire25) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire25 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out25:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire26) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire26 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out26:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire27) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire27 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out27:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire28) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire28 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out28:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire29) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire29 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out29:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire30) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire30 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out30:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire33) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire33 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out33:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire34) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire34 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out34:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire35) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire35 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out35:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire36) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire36 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out36:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire37) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire37 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out37:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire38) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire38 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out38:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire39) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire39 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out39:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire40) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire40 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out40:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire41) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire41 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out41:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire42) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire42 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out42:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire43) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire43 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out43:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire44) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire44 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out44:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire45) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire45 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out45:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire46) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire46 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out46:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire49) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire49 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out49:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire50) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire50 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out50:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire51) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire51 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out51:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire52) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire52 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out52:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire53) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire53 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out53:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire54) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire54 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out54:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire55) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire55 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out55:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire56) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire56 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out56:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire57) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire57 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out57:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire58) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire58 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out58:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire59) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire59 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out59:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire60) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire60 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out60:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire61) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire61 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out61:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire62) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire62 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out62:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire65) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire65 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out65:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire66) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire66 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out66:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire67) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire67 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out67:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire68) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire68 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out68:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire69) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire69 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out69:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire70) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire70 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out70:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire71) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire71 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out71:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire72) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire72 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out72:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire73) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire73 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out73:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire74) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire74 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out74:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire75) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire75 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out75:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire76) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire76 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out76:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire77) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire77 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out77:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire78) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire78 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out78:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire81) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire81 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out81:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire82) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire82 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out82:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire83) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire83 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out83:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire84) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire84 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out84:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire85) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire85 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out85:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire86) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire86 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out86:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire87) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire87 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out87:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire88) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire88 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out88:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire89) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire89 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out89:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire90) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire90 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out90:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire91) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire91 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out91:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire92) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire92 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out92:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire93) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire93 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out93:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire94) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire94 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out94:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire97) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire97 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out97:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire98) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire98 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out98:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire99) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire99 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out99:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire100) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire100 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out100:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire101) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire101 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out101:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire102) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire102 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out102:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire103) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire103 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out103:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire104) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire104 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out104:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire105) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire105 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out105:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire106) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire106 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out106:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire107) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire107 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out107:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire108) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire108 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out108:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire109) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire109 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out109:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:data_wire110) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  data_wire110 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),1'b1}):8'b0)|
    ((_reg_2)?_add_all_x_data_out110:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org17) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org17 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in17:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org17:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org18) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org18 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in18:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org18:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org19) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org19 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in19:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org19:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org20) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org20 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in20:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org20:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org21) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org21 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in21:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org21:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org22) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org22 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in22:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org22:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org23) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org23 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in23:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org23:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org24) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org24 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in24:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org24:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org25) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org25 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in25:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org25:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org26) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org26 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in26:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org26:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org27) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org27 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in27:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org27:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org28) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org28 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in28:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org28:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org29) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org29 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in29:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org29:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org30) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org30 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in30:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org30:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org33) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org33 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in33:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org33:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org34) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org34 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in34:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org34:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org35) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org35 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in35:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org35:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org36) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org36 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in36:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org36:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org37) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org37 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in37:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org37:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org38) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org38 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in38:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org38:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org39) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org39 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in39:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org39:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org40) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org40 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in40:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org40:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org41) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org41 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in41:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org41:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org42) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org42 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in42:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org42:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org43) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org43 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in43:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org43:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org44) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org44 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in44:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org44:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org45) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org45 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in45:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org45:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org46) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org46 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in46:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org46:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org49) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org49 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in49:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org49:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org50) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org50 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in50:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org50:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org51) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org51 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in51:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org51:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org52) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org52 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in52:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org52:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org53) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org53 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in53:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org53:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org54) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org54 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in54:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org54:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org55) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org55 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in55:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org55:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org56) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org56 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in56:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org56:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org57) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org57 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in57:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org57:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org58) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org58 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in58:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org58:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org59) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org59 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in59:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org59:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org60) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org60 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in60:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org60:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org61) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org61 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in61:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org61:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org62) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org62 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in62:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org62:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org65) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org65 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in65:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org65:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org66) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org66 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in66:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org66:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org67) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org67 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in67:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org67:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org68) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org68 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in68:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org68:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org69) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org69 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in69:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org69:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org70) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org70 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in70:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org70:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org71) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org71 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in71:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org71:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org72) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org72 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in72:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org72:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org73) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org73 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in73:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org73:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org74) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org74 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in74:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org74:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org75) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org75 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in75:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org75:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org76) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org76 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in76:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org76:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org77) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org77 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in77:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org77:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org78) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org78 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in78:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org78:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org81) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org81 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in81:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org81:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org82) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org82 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in82:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org82:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org83) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org83 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in83:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org83:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org84) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org84 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in84:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org84:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org85) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org85 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in85:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org85:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org86) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org86 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in86:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org86:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org87) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org87 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in87:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org87:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org88) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org88 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in88:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org88:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org89) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org89 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in89:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org89:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org90) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org90 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in90:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org90:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org91) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org91 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in91:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org91:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org92) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org92 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in92:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org92:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org93) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org93 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in93:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org93:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org94) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org94 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in94:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org94:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org97) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org97 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in97:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org97:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org98) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org98 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in98:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org98:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org99) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org99 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in99:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org99:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org100) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org100 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in100:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org100:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org101) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org101 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in101:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org101:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org102) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org102 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in102:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org102:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org103) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org103 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in103:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org103:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org104) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org104 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in104:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org104:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org105) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org105 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in105:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org105:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org106) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org106 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in106:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org106:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org107) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org107 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in107:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org107:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org108) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org108 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in108:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org108:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org109) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org109 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in109:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org109:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:org110) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  org110 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?data_in110:8'b0)|
    ((_reg_2)?_add_all_x_data_out_org110:8'b0)|
    (((_reg_1&_net_4))?_add_all_x_data_out_org110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg17) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg17 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out17:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out17:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg18) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg18 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out18:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out18:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg19) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg19 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out19:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out19:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg20) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg20 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out20:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out20:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg21) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg21 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out21:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out21:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg22) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg22 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out22:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out22:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg23) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg23 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out23:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out23:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg24) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg24 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out24:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out24:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg25) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg25 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out25:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out25:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg26) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg26 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out26:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out26:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg27) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg27 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out27:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out27:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg28) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg28 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out28:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out28:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg29) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg29 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out29:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out29:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg30) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg30 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out30:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out30:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg33) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg33 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out33:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out33:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg34) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg34 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out34:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out34:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg35) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg35 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out35:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out35:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg36) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg36 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out36:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out36:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg37) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg37 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out37:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out37:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg38) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg38 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out38:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out38:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg39) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg39 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out39:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out39:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg40) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg40 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out40:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out40:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg41) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg41 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out41:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out41:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg42) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg42 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out42:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out42:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg43) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg43 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out43:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out43:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg44) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg44 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out44:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out44:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg45) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg45 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out45:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out45:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg46) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg46 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out46:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out46:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg49) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg49 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out49:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out49:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg50) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg50 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out50:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out50:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg51) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg51 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out51:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out51:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg52) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg52 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out52:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out52:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg53) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg53 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out53:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out53:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg54) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg54 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out54:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out54:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg55) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg55 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out55:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out55:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg56) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg56 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out56:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out56:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg57) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg57 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out57:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out57:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg58) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg58 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out58:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out58:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg59) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg59 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out59:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out59:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg60) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg60 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out60:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out60:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg61) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg61 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out61:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out61:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg62) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg62 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out62:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out62:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg65) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg65 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out65:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out65:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg66) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg66 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out66:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out66:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg67) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg67 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out67:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out67:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg68) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg68 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out68:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out68:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg69) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg69 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out69:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out69:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg70) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg70 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out70:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out70:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg71) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg71 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out71:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out71:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg72) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg72 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out72:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out72:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg73) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg73 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out73:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out73:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg74) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg74 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out74:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out74:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg75) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg75 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out75:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out75:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg76) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg76 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out76:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out76:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg77) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg77 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out77:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out77:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg78) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg78 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out78:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out78:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg81) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg81 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out81:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out81:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg82) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg82 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out82:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out82:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg83) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg83 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out83:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out83:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg84) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg84 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out84:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out84:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg85) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg85 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out85:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out85:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg86) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg86 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out86:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out86:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg87) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg87 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out87:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out87:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg88) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg88 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out88:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out88:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg89) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg89 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out89:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out89:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg90) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg90 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out90:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out90:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg91) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg91 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out91:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out91:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg92) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg92 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out92:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out92:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg93) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg93 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out93:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out93:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg94) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg94 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out94:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out94:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg97) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg97 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out97:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out97:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg98) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg98 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out98:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out98:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg99) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg99 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out99:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out99:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg100) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg100 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out100:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out100:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg101) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg101 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out101:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out101:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg102) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg102 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out102:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out102:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg103) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg103 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out103:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out103:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg104) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg104 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out104:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out104:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg105) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg105 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out105:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out105:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg106) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg106 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out106:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out106:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg107) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg107 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out107:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out107:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg108) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg108 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out108:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out108:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg109) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg109 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out109:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out109:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:sg110) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  sg110 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 2'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?2'b00:2'b0)|
    ((_reg_2)?_add_all_x_sg_out110:2'b0)|
    (((_reg_1&_net_4))?_add_all_x_sg_out110:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:wall_end_wire) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  wall_end_wire = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_wall_end:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_wall_end:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:distance_wire) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  distance_wire = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 8'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?({7'b0000000,_net_7}):8'b0)|
    ((_reg_2)?distance_count:8'b0)|
    (((_reg_1&_net_4))?distance_count:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g17) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g17 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out17:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out17:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g18) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g18 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out18:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out18:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g19) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g19 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out19:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out19:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g20) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g20 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out20:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out20:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g21) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g21 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out21:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out21:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g22) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g22 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out22:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out22:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g23) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g23 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out23:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out23:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g24) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g24 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out24:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out24:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g25) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g25 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out25:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out25:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g26) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g26 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out26:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out26:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g27) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g27 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out27:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out27:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g28) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g28 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out28:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out28:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g29) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g29 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out29:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out29:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g30) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g30 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out30:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out30:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g33) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g33 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out33:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out33:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g34) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g34 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out34:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out34:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g35) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g35 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out35:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out35:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g36) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g36 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out36:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out36:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g37) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g37 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out37:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out37:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g38) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g38 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out38:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out38:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g39) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g39 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out39:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out39:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g40) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g40 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out40:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out40:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g41) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g41 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out41:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out41:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g42) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g42 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out42:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out42:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g43) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g43 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out43:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out43:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g44) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g44 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out44:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out44:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g45) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g45 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out45:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out45:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g46) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g46 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out46:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out46:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g49) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g49 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out49:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out49:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g50) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g50 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out50:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out50:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g51) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g51 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out51:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out51:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g52) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g52 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out52:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out52:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g53) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g53 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out53:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out53:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g54) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g54 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out54:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out54:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g55) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g55 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out55:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out55:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g56) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g56 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out56:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out56:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g57) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g57 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out57:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out57:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g58) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g58 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out58:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out58:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g59) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g59 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out59:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out59:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g60) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g60 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out60:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out60:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g61) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g61 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out61:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out61:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g62) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g62 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out62:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out62:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g65) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g65 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out65:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out65:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g66) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g66 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out66:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out66:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g67) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g67 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out67:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out67:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g68) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g68 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out68:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out68:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g69) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g69 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out69:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out69:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g70) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g70 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out70:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out70:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g71) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g71 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out71:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out71:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g72) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g72 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out72:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out72:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g73) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g73 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out73:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out73:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g74) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g74 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out74:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out74:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g75) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g75 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out75:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out75:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g76) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g76 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out76:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out76:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g77) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g77 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out77:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out77:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g78) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g78 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out78:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out78:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g81) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g81 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out81:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out81:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g82) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g82 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out82:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out82:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g83) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g83 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out83:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out83:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g84) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g84 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out84:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out84:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g85) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g85 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out85:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out85:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g86) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g86 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out86:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out86:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g87) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g87 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out87:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out87:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g88) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g88 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out88:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out88:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g89) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g89 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out89:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out89:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g90) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g90 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out90:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out90:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g91) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g91 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out91:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out91:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g92) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g92 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out92:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out92:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g93) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g93 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out93:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out93:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g94) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g94 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out94:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out94:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g97) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g97 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out97:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out97:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g98) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g98 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out98:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out98:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g99) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g99 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out99:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out99:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g100) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g100 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out100:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out100:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g101) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g101 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out101:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out101:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g102) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g102 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out102:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out102:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g103) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g103 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out103:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out103:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g104) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g104 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out104:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out104:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g105) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g105 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out105:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out105:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g106) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g106 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out106:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out106:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g107) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g107 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out107:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out107:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g108) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g108 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out108:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out108:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g109) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g109 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out109:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out109:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:all_s_g110) at %d",$time);
if ((in_do|_reg_3)) $display("assert ((in_do|_reg_3)) line 105 at %d\n",$time);
if (_reg_2) $display("assert (_reg_2) line 137 at %d\n",$time);
if ((_reg_1&_net_4)) $display("assert ((_reg_1&_net_4)) line 166 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  all_s_g110 = 
// synthesis translate_off
// synopsys translate_off
((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))? 128'bx :((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4)))? 
// synthesis translate_on
// synopsys translate_on
(((in_do|_reg_3))?128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000:128'b0)|
    ((_reg_2)?_add_all_x_all_sg_out110:128'b0)|
    (((_reg_1&_net_4))?_add_all_x_all_sg_out110:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge kanwa_s)
  begin
#1 if (kanwa_s===1'bx)
 begin
$display("Warning: control hazard(kanwa:kanwa_s) at %d",$time);
 end
#1 if ((((in_do|_reg_3))===1'bx) || (1'b1)===1'bx) $display("hazard ((in_do|_reg_3) || 1'b1) line 105 at %d\n",$time);
#1 if (((_reg_2)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_2 || 1'b1) line 137 at %d\n",$time);
#1 if ((((_reg_1&_net_4))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_1&_net_4) || 1'b1) line 166 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  kanwa_s = (in_do|_reg_3)|
    _reg_2|
    (_reg_1&_net_4);
   assign  _add_all_x_sig = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?even_w1:1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_start = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?start_w:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_goal = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?goal_w:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_dig_w = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?wall_w:1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in17 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg17:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in18 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg18:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in19 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg19:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in20 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg20:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in21 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg21:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in22 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg22:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in23 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg23:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in24 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg24:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in25 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg25:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in26 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg26:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in27 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg27:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in28 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg28:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in29 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg29:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in30 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg30:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in33 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg33:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in34 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg34:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in35 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg35:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in36 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg36:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in37 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg37:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in38 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg38:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in39 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg39:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in40 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg40:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in41 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg41:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in42 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg42:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in43 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg43:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in44 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg44:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in45 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg45:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in46 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg46:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in49 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg49:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in50 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg50:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in51 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg51:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in52 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg52:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in53 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg53:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in54 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg54:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in55 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg55:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in56 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg56:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in57 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg57:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in58 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg58:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in59 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg59:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in60 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg60:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in61 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg61:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in62 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg62:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in65 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg65:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in66 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg66:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in67 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg67:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in68 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg68:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in69 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg69:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in70 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg70:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in71 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg71:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in72 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg72:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in73 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg73:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in74 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg74:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in75 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg75:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in76 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg76:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in77 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg77:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in78 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg78:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in81 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg81:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in82 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg82:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in83 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg83:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in84 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg84:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in85 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg85:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in86 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg86:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in87 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg87:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in88 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg88:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in89 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg89:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in90 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg90:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in91 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg91:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in92 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg92:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in93 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg93:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in94 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg94:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in97 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg97:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in98 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg98:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in99 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg99:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in100 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg100:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in101 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg101:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in102 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg102:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in103 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg103:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in104 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg104:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in105 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg105:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in106 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg106:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in107 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg107:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in108 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg108:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in109 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg109:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_sg_in110 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?sg110:2'b0)
// synthesis translate_off
// synopsys translate_off
:2'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_wall_end_in = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?wall_end_wire:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in17 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g17:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in18 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g18:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in19 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g19:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in20 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g20:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in21 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g21:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in22 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g22:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in23 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g23:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in24 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g24:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in25 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g25:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in26 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g26:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in27 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g27:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in28 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g28:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in29 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g29:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in30 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g30:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in33 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g33:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in34 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g34:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in35 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g35:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in36 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g36:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in37 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g37:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in38 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g38:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in39 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g39:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in40 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g40:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in41 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g41:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in42 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g42:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in43 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g43:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in44 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g44:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in45 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g45:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in46 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g46:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in49 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g49:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in50 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g50:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in51 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g51:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in52 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g52:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in53 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g53:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in54 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g54:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in55 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g55:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in56 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g56:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in57 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g57:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in58 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g58:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in59 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g59:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in60 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g60:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in61 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g61:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in62 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g62:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in65 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g65:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in66 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g66:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in67 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g67:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in68 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g68:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in69 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g69:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in70 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g70:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in71 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g71:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in72 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g72:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in73 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g73:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in74 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g74:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in75 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g75:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in76 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g76:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in77 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g77:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in78 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g78:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in81 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g81:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in82 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g82:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in83 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g83:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in84 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g84:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in85 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g85:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in86 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g86:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in87 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g87:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in88 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g88:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in89 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g89:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in90 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g90:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in91 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g91:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in92 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g92:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in93 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g93:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in94 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g94:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in97 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g97:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in98 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g98:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in99 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g99:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in100 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g100:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in101 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g101:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in102 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g102:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in103 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g103:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in104 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g104:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in105 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g105:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in106 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g106:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in107 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g107:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in108 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g108:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in109 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g109:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_all_sg_in110 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?all_s_g110:128'b0)
// synthesis translate_off
// synopsys translate_off
:128'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in17 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in18 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in19 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in20 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in21 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in22 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in23 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in24 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in25 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in26 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in27 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in28 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in29 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in30 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in33 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in34 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in35 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in36 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in37 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in38 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in39 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in40 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in41 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in42 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in43 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in44 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in45 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in46 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in49 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in50 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in51 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in52 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in53 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in54 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in55 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in56 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in57 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in58 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in59 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in60 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in61 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in62 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in65 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in66 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in67 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in68 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in69 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in70 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in71 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in72 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in73 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in74 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in75 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in76 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in77 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in78 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in81 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in82 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in83 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in84 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in85 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in86 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in87 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in88 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in89 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in90 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in91 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in92 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in93 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in94 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in97 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in98 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in99 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in100 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in101 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in102 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in103 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in104 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in105 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in106 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in107 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in108 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in109 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in110 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?data_wire110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org17 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org18 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org19 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org20 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org21 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org22 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org23 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org24 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org25 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org26 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org27 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org28 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org29 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org30 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org33 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org34 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org35 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org36 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org37 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org38 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org39 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org40 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org41 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org42 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org43 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org44 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org45 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org46 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org49 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org50 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org51 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org52 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org53 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org54 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org55 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org56 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org57 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org58 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org59 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org60 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org61 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org62 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org65 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org66 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org67 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org68 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org69 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org70 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org71 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org72 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org73 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org74 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org75 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org76 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org77 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org78 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org81 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org82 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org83 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org84 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org85 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org86 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org87 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org88 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org89 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org90 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org91 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org92 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org93 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org94 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org97 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org98 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org99 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org100 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org101 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org102 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org103 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org104 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org105 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org106 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org107 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org108 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org109 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_data_in_org110 = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?org110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _add_all_x_distance_count_all = 
// synthesis translate_off
// synopsys translate_off
(kanwa_s)? 
// synthesis translate_on
// synopsys translate_on
((kanwa_s)?distance_wire:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _add_all_x_in_do)
  begin
#1 if (_add_all_x_in_do===1'bx)
 begin
$display("Warning: control hazard(kanwa:_add_all_x_in_do) at %d",$time);
 end
#1 if (((kanwa_s)===1'bx) || (1'b1)===1'bx) $display("hazard (kanwa_s || 1'b1) line 206 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _add_all_x_in_do = kanwa_s;
   assign  _add_all_x_p_reset = p_reset;
   assign  _add_all_x_m_clock = m_clock;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in17) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in17 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index18:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in19) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in19 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index20:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in21) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in21 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index22:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in23) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in23 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index24:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in25) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in25 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index26:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in27) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in27 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index28:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in29) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in29 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index30:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in33) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in33 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index33:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in35) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in35 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index35:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in37) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in37 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index37:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in39) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in39 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index39:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in41) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in41 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index41:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in43) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in43 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index43:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in45) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in45 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index45:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in49) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in49 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index50:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in51) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in51 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index52:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in53) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in53 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index54:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in55) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in55 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index56:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in57) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in57 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index58:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in59) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in59 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index60:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in61) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in61 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index62:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in65) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in65 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index65:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in67) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in67 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index67:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in69) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in69 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index69:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in71) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in71 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index71:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in73) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in73 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index73:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in75) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in75 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index75:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in77) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in77 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index77:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in81) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in81 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index82:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in83) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in83 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index84:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in85) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in85 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index86:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in87) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in87 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index88:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in89) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in89 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index90:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in91) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in91 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index92:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in93) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in93 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index94:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in97) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in97 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index97:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in99) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in99 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index99:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in101) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in101 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index101:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in103) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in103 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index103:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in105) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in105 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index105:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in107) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in107 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index107:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_in109) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_in109 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out_index109:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out_index110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index17) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index17 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out18:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index19) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index19 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out20:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index21) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index21 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out22:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index23) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index23 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out24:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index25) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index25 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out26:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index27) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index27 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out28:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index29) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index29 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out30:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index33) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index33 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out33:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index35) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index35 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out35:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index37) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index37 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out37:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index39) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index39 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out39:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index41) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index41 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out41:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index43) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index43 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out43:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index45) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index45 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out45:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index49) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index49 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out50:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index51) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index51 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out52:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index53) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index53 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out54:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index55) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index55 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out56:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index57) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index57 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out58:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index59) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index59 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out60:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index61) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index61 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out62:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index65) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index65 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out65:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index67) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index67 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out67:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index69) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index69 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out69:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index71) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index71 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out71:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index73) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index73 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out73:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index75) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index75 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out75:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index77) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index77 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out77:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index81) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index81 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out82:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index83) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index83 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out84:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index85) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index85 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out86:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index87) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index87 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out88:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index89) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index89 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out90:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index91) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index91 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out92:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index93) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index93 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out94:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index97) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index97 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out97:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index99) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index99 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out99:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index101) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index101 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out101:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index103) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index103 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out103:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index105) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index105 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out105:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index107) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index107 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out107:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or posedge p_reset)
  begin
if (((_reg_8&(~_net_11))&(_reg_8&_net_11)))
 begin $display("Warning: assign collision(kanwa:_sub_x_data_index109) at %d",$time);
if ((_reg_8&(~_net_11))) $display("assert ((_reg_8&(~_net_11))) line 256 at %d\n",$time);
if ((_reg_8&_net_11)) $display("assert ((_reg_8&_net_11)) line 240 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_data_index109 = 
// synthesis translate_off
// synopsys translate_off
(((_reg_8&(~_net_11))&(_reg_8&_net_11)))? 8'bx :(((_reg_8&(~_net_11))|(_reg_8&_net_11)))? 
// synthesis translate_on
// synopsys translate_on
(((_reg_8&(~_net_11)))?_add_all_x_data_out109:8'b0)|
    (((_reg_8&_net_11))?_add_all_x_data_out110:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_x_subs_exe)
  begin
#1 if (_sub_x_subs_exe===1'bx)
 begin
$display("Warning: control hazard(kanwa:_sub_x_subs_exe) at %d",$time);
 end
#1 if ((((_reg_8&(~_net_11)))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_8&(~_net_11)) || 1'b1) line 256 at %d\n",$time);
#1 if ((((_reg_8&_net_11))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_8&_net_11) || 1'b1) line 240 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_x_subs_exe = (_reg_8&(~_net_11))|
    (_reg_8&_net_11);
   assign  _sub_x_p_reset = p_reset;
   assign  _sub_x_m_clock = m_clock;
   assign  _net_4 = 
// synthesis translate_off
// synopsys translate_off
(_reg_1)? 
// synthesis translate_on
// synopsys translate_on
((_reg_1)?((((((kanwa_exit < 3'b010)|(dig_exit==1'b0))&(start_reg != (goal_reg-8'b00000001)))&(start_reg != (goal_reg+8'b00000001)))&(start_reg != (goal_reg-8'b00010000)))&(start_reg != (goal_reg+8'b00010000))):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if((_reg_1&_net_4))
    begin
    $display("exit %b,dig_exit%b",kanwa_exit,dig_exit);
    end
  end

// synthesis translate_on
// synopsys translate_on

// synthesis translate_off
// synopsys translate_off
always @(posedge _reg_1_goto)
  begin
#1 if (_reg_1_goto===1'bx)
 begin
$display("Warning: control hazard(kanwa:_reg_1_goto) at %d",$time);
 end
#1 if ((((_reg_1&_net_4))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_1&_net_4) || 1'b1) line 169 at %d\n",$time);
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
$display("Warning: control hazard(kanwa:_reg_2_goin) at %d",$time);
 end
#1 if ((((_reg_1&_net_4))===1'bx) || (1'b1)===1'bx) $display("hazard ((_reg_1&_net_4) || 1'b1) line 169 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _reg_2_goin = (_reg_1&_net_4);

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_reg_2)
    begin
    $display("exit %b,dig_exit%b",kanwa_exit,dig_exit);
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  _net_7 = 1'b1;

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
    if(_reg_8)
    begin
    $display("%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,\n",_add_all_x_data_out17,_add_all_x_data_out18,_add_all_x_data_out19,_add_all_x_data_out20,_add_all_x_data_out21,_add_all_x_data_out22,_add_all_x_data_out23,_add_all_x_data_out24,_add_all_x_data_out25,_add_all_x_data_out26,_add_all_x_data_out27,_add_all_x_data_out28,_add_all_x_data_out29,_add_all_x_data_out30,_add_all_x_data_out33,_add_all_x_data_out34,_add_all_x_data_out35,_add_all_x_data_out36,_add_all_x_data_out37,_add_all_x_data_out38,_add_all_x_data_out39,_add_all_x_data_out40,_add_all_x_data_out41,_add_all_x_data_out42,_add_all_x_data_out43,_add_all_x_data_out44,_add_all_x_data_out45,_add_all_x_data_out46,_add_all_x_data_out49,_add_all_x_data_out50,_add_all_x_data_out51,_add_all_x_data_out52,_add_all_x_data_out53,_add_all_x_data_out54,_add_all_x_data_out55,_add_all_x_data_out56,_add_all_x_data_out57,_add_all_x_data_out58,_add_all_x_data_out59,_add_all_x_data_out60,_add_all_x_data_out61,_add_all_x_data_out62,_add_all_x_data_out65,_add_all_x_data_out66,_add_all_x_data_out67,_add_all_x_data_out68,_add_all_x_data_out69,_add_all_x_data_out70,_add_all_x_data_out71,_add_all_x_data_out72,_add_all_x_data_out73,_add_all_x_data_out74,_add_all_x_data_out75,_add_all_x_data_out76,_add_all_x_data_out77,_add_all_x_data_out78,_add_all_x_data_out81,_add_all_x_data_out82,_add_all_x_data_out83,_add_all_x_data_out84,_add_all_x_data_out85,_add_all_x_data_out86,_add_all_x_data_out87,_add_all_x_data_out88,_add_all_x_data_out89,_add_all_x_data_out90,_add_all_x_data_out91,_add_all_x_data_out92,_add_all_x_data_out93,_add_all_x_data_out94,_add_all_x_data_out97,_add_all_x_data_out98,_add_all_x_data_out99,_add_all_x_data_out100,_add_all_x_data_out101,_add_all_x_data_out102,_add_all_x_data_out103,_add_all_x_data_out104,_add_all_x_data_out105,_add_all_x_data_out106,_add_all_x_data_out107,_add_all_x_data_out108,_add_all_x_data_out109,_add_all_x_data_out110);
    end
  end

// synthesis translate_on
// synopsys translate_on
   assign  _net_11 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(~even):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_12 = 
// synthesis translate_off
// synopsys translate_off
(_reg_8)? 
// synthesis translate_on
// synopsys translate_on
((_reg_8)?(dig_exit==1'b0):1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out17 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index17:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out18 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index18:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out19 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index19:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out20 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index20:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out21 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index21:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out22 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index22:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out23 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index23:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out24 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index24:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out25 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index25:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out26 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index26:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out27 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index27:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out28 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index28:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out29 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index29:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out30 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index30:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out33 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index33:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out34 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index34:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out35 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index35:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out36 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index36:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out37 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index37:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out38 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index38:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out39 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index39:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out40 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index40:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out41 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index41:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out42 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index42:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out43 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index43:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out44 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index44:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out45 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index45:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out46 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index46:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out49 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index49:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out50 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index50:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out51 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index51:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out52 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index52:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out53 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index53:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out54 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index54:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out55 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index55:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out56 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index56:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out57 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index57:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out58 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index58:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out59 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index59:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out60 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index60:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out61 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index61:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out62 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index62:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out65 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index65:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out66 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index66:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out67 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index67:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out68 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index68:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out69 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index69:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out70 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index70:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out71 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index71:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out72 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index72:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out73 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index73:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out74 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index74:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out75 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index75:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out76 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index76:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out77 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index77:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out78 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index78:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out81 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index81:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out82 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index82:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out83 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index83:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out84 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index84:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out85 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index85:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out86 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index86:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out87 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index87:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out88 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index88:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out89 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index89:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out90 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index90:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out91 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index91:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out92 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index92:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out93 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index93:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out94 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index94:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out97 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index97:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out98 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index98:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out99 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index99:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out100 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index100:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out101 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index101:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out102 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index102:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out103 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index103:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out104 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index104:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out105 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index105:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out106 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index106:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out107 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index107:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out108 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index108:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out109 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index109:8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  data_out110 = 
// synthesis translate_off
// synopsys translate_off
(_reg_0)? 
// synthesis translate_on
// synopsys translate_on
((_reg_0)?_add_all_x_data_out_index110:8'b0)
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
$display("Warning: control hazard(kanwa:out_do) at %d",$time);
 end
#1 if (((_reg_0)===1'bx) || (1'b1)===1'bx) $display("hazard (_reg_0 || 1'b1) line 177 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  out_do = _reg_0;
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     kanwa_exit <= 3'b000;
else 
// synthesis translate_off
// synopsys translate_off
if (((_reg_8&(~_net_12))&(_reg_8&_net_12)))   kanwa_exit <= 3'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((_reg_8&(~_net_12)))
      kanwa_exit <= (kanwa_exit+3'b001);
else if ((_reg_8&_net_12))
      kanwa_exit <= 3'b000;
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if ((((_reg_8&(~_net_12))|(_reg_8&_net_12))==1'b1) ||
 (((_reg_8&(~_net_12))|(_reg_8&_net_12))==1'b0) ) begin
 if (((_reg_8&(~_net_12))&(_reg_8&_net_12)))
 begin $display("Warning: assign collision(kanwa:kanwa_exit) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(kanwa:kanwa_exit) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     distance_count <= 8'b00000000;
else 
// synthesis translate_off
// synopsys translate_off
if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))   distance_count <= 8'bx; 
  else 
// synthesis translate_on
// synopsys translate_on
if ((in_do|_reg_3))
      distance_count <= 8'b00000010;
else if (_reg_2)
      distance_count <= (distance_count+8'b00000001);
else if ((_reg_1&_net_4))
      distance_count <= (distance_count+8'b00000001);
end

// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock)
  begin
if (((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4))==1'b1) ||
 ((((in_do|_reg_3)|_reg_2)|(_reg_1&_net_4))==1'b0) ) begin
 if ((((in_do|_reg_3)&_reg_2)|(((in_do|_reg_3)|_reg_2)&(_reg_1&_net_4))))
 begin $display("Warning: assign collision(kanwa:distance_count) at %d",$time);

  end
 end
 else 
 $display("Warning: register set hazard(kanwa:distance_count) at %d",$time);

  end

// synthesis translate_on
// synopsys translate_on
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
     even <= 1'b0;
else if (kanwa_s)
      even <= even_w1;
end
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
else if ((_add_all_x_out_do|(_reg_8|_reg_9)))
      _reg_8 <= (_reg_9|_add_all_x_out_do);
end
always @(posedge m_clock or posedge p_reset)
  begin
if (p_reset)
     _reg_9 <= 1'b0;
else if (_reg_9)
      _reg_9 <= 1'b0;
end
endmodule

/*Produced by NSL Core(version=20240424), IP ARCH, Inc. Mon May 20 03:57:00 2024
 Licensed to :EVALUATION USER*/
