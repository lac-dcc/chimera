// This program was cloned from: https://github.com/shun7b/bidirectional-search
// License: GNU General Public License v3.0


/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module subs ( p_reset , m_clock , data_in17 , data_in19 , data_in21 , data_in23 , data_in25 , data_in27 , data_in29 , data_in33 , data_in35 , data_in37 , data_in39 , data_in41 , data_in43 , data_in45 , data_in49 , data_in51 , data_in53 , data_in55 , data_in57 , data_in59 , data_in61 , data_in65 , data_in67 , data_in69 , data_in71 , data_in73 , data_in75 , data_in77 , data_in81 , data_in83 , data_in85 , data_in87 , data_in89 , data_in91 , data_in93 , data_in97 , data_in99 , data_in101 , data_in103 , data_in105 , data_in107 , data_in109 , data_index17 , data_index19 , data_index21 , data_index23 , data_index25 , data_index27 , data_index29 , data_index33 , data_index35 , data_index37 , data_index39 , data_index41 , data_index43 , data_index45 , data_index49 , data_index51 , data_index53 , data_index55 , data_index57 , data_index59 , data_index61 , data_index65 , data_index67 , data_index69 , data_index71 , data_index73 , data_index75 , data_index77 , data_index81 , data_index83 , data_index85 , data_index87 , data_index89 , data_index91 , data_index93 , data_index97 , data_index99 , data_index101 , data_index103 , data_index105 , data_index107 , data_index109 , sub_array_out , subs_exe );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] data_in17;
  wire [7:0] data_in17;
  input [7:0] data_in19;
  wire [7:0] data_in19;
  input [7:0] data_in21;
  wire [7:0] data_in21;
  input [7:0] data_in23;
  wire [7:0] data_in23;
  input [7:0] data_in25;
  wire [7:0] data_in25;
  input [7:0] data_in27;
  wire [7:0] data_in27;
  input [7:0] data_in29;
  wire [7:0] data_in29;
  input [7:0] data_in33;
  wire [7:0] data_in33;
  input [7:0] data_in35;
  wire [7:0] data_in35;
  input [7:0] data_in37;
  wire [7:0] data_in37;
  input [7:0] data_in39;
  wire [7:0] data_in39;
  input [7:0] data_in41;
  wire [7:0] data_in41;
  input [7:0] data_in43;
  wire [7:0] data_in43;
  input [7:0] data_in45;
  wire [7:0] data_in45;
  input [7:0] data_in49;
  wire [7:0] data_in49;
  input [7:0] data_in51;
  wire [7:0] data_in51;
  input [7:0] data_in53;
  wire [7:0] data_in53;
  input [7:0] data_in55;
  wire [7:0] data_in55;
  input [7:0] data_in57;
  wire [7:0] data_in57;
  input [7:0] data_in59;
  wire [7:0] data_in59;
  input [7:0] data_in61;
  wire [7:0] data_in61;
  input [7:0] data_in65;
  wire [7:0] data_in65;
  input [7:0] data_in67;
  wire [7:0] data_in67;
  input [7:0] data_in69;
  wire [7:0] data_in69;
  input [7:0] data_in71;
  wire [7:0] data_in71;
  input [7:0] data_in73;
  wire [7:0] data_in73;
  input [7:0] data_in75;
  wire [7:0] data_in75;
  input [7:0] data_in77;
  wire [7:0] data_in77;
  input [7:0] data_in81;
  wire [7:0] data_in81;
  input [7:0] data_in83;
  wire [7:0] data_in83;
  input [7:0] data_in85;
  wire [7:0] data_in85;
  input [7:0] data_in87;
  wire [7:0] data_in87;
  input [7:0] data_in89;
  wire [7:0] data_in89;
  input [7:0] data_in91;
  wire [7:0] data_in91;
  input [7:0] data_in93;
  wire [7:0] data_in93;
  input [7:0] data_in97;
  wire [7:0] data_in97;
  input [7:0] data_in99;
  wire [7:0] data_in99;
  input [7:0] data_in101;
  wire [7:0] data_in101;
  input [7:0] data_in103;
  wire [7:0] data_in103;
  input [7:0] data_in105;
  wire [7:0] data_in105;
  input [7:0] data_in107;
  wire [7:0] data_in107;
  input [7:0] data_in109;
  wire [7:0] data_in109;
  input [7:0] data_index17;
  wire [7:0] data_index17;
  input [7:0] data_index19;
  wire [7:0] data_index19;
  input [7:0] data_index21;
  wire [7:0] data_index21;
  input [7:0] data_index23;
  wire [7:0] data_index23;
  input [7:0] data_index25;
  wire [7:0] data_index25;
  input [7:0] data_index27;
  wire [7:0] data_index27;
  input [7:0] data_index29;
  wire [7:0] data_index29;
  input [7:0] data_index33;
  wire [7:0] data_index33;
  input [7:0] data_index35;
  wire [7:0] data_index35;
  input [7:0] data_index37;
  wire [7:0] data_index37;
  input [7:0] data_index39;
  wire [7:0] data_index39;
  input [7:0] data_index41;
  wire [7:0] data_index41;
  input [7:0] data_index43;
  wire [7:0] data_index43;
  input [7:0] data_index45;
  wire [7:0] data_index45;
  input [7:0] data_index49;
  wire [7:0] data_index49;
  input [7:0] data_index51;
  wire [7:0] data_index51;
  input [7:0] data_index53;
  wire [7:0] data_index53;
  input [7:0] data_index55;
  wire [7:0] data_index55;
  input [7:0] data_index57;
  wire [7:0] data_index57;
  input [7:0] data_index59;
  wire [7:0] data_index59;
  input [7:0] data_index61;
  wire [7:0] data_index61;
  input [7:0] data_index65;
  wire [7:0] data_index65;
  input [7:0] data_index67;
  wire [7:0] data_index67;
  input [7:0] data_index69;
  wire [7:0] data_index69;
  input [7:0] data_index71;
  wire [7:0] data_index71;
  input [7:0] data_index73;
  wire [7:0] data_index73;
  input [7:0] data_index75;
  wire [7:0] data_index75;
  input [7:0] data_index77;
  wire [7:0] data_index77;
  input [7:0] data_index81;
  wire [7:0] data_index81;
  input [7:0] data_index83;
  wire [7:0] data_index83;
  input [7:0] data_index85;
  wire [7:0] data_index85;
  input [7:0] data_index87;
  wire [7:0] data_index87;
  input [7:0] data_index89;
  wire [7:0] data_index89;
  input [7:0] data_index91;
  wire [7:0] data_index91;
  input [7:0] data_index93;
  wire [7:0] data_index93;
  input [7:0] data_index97;
  wire [7:0] data_index97;
  input [7:0] data_index99;
  wire [7:0] data_index99;
  input [7:0] data_index101;
  wire [7:0] data_index101;
  input [7:0] data_index103;
  wire [7:0] data_index103;
  input [7:0] data_index105;
  wire [7:0] data_index105;
  input [7:0] data_index107;
  wire [7:0] data_index107;
  input [7:0] data_index109;
  wire [7:0] data_index109;
  output [7:0] sub_array_out;
  wire [7:0] sub_array_out;
  input subs_exe;
  wire subs_exe;
  reg [7:0] sub_reg;
  wire [9:0] _sub_plot_x_hikareru;
  wire [9:0] _sub_plot_x_moto;
  wire [9:0] _sub_plot_x_sa;
  wire _sub_plot_x_in_do;
  wire _sub_plot_x_p_reset;
  wire _sub_plot_x_m_clock;
  wire [9:0] _sub_plot_x_97_hikareru;
  wire [9:0] _sub_plot_x_97_moto;
  wire [9:0] _sub_plot_x_97_sa;
  wire _sub_plot_x_97_in_do;
  wire _sub_plot_x_97_p_reset;
  wire _sub_plot_x_97_m_clock;
  wire [9:0] _sub_plot_x_96_hikareru;
  wire [9:0] _sub_plot_x_96_moto;
  wire [9:0] _sub_plot_x_96_sa;
  wire _sub_plot_x_96_in_do;
  wire _sub_plot_x_96_p_reset;
  wire _sub_plot_x_96_m_clock;
  wire [9:0] _sub_plot_x_95_hikareru;
  wire [9:0] _sub_plot_x_95_moto;
  wire [9:0] _sub_plot_x_95_sa;
  wire _sub_plot_x_95_in_do;
  wire _sub_plot_x_95_p_reset;
  wire _sub_plot_x_95_m_clock;
  wire [9:0] _sub_plot_x_94_hikareru;
  wire [9:0] _sub_plot_x_94_moto;
  wire [9:0] _sub_plot_x_94_sa;
  wire _sub_plot_x_94_in_do;
  wire _sub_plot_x_94_p_reset;
  wire _sub_plot_x_94_m_clock;
  wire [9:0] _sub_plot_x_93_hikareru;
  wire [9:0] _sub_plot_x_93_moto;
  wire [9:0] _sub_plot_x_93_sa;
  wire _sub_plot_x_93_in_do;
  wire _sub_plot_x_93_p_reset;
  wire _sub_plot_x_93_m_clock;
  wire [9:0] _sub_plot_x_92_hikareru;
  wire [9:0] _sub_plot_x_92_moto;
  wire [9:0] _sub_plot_x_92_sa;
  wire _sub_plot_x_92_in_do;
  wire _sub_plot_x_92_p_reset;
  wire _sub_plot_x_92_m_clock;
  wire [9:0] _sub_plot_x_91_hikareru;
  wire [9:0] _sub_plot_x_91_moto;
  wire [9:0] _sub_plot_x_91_sa;
  wire _sub_plot_x_91_in_do;
  wire _sub_plot_x_91_p_reset;
  wire _sub_plot_x_91_m_clock;
  wire [9:0] _sub_plot_x_90_hikareru;
  wire [9:0] _sub_plot_x_90_moto;
  wire [9:0] _sub_plot_x_90_sa;
  wire _sub_plot_x_90_in_do;
  wire _sub_plot_x_90_p_reset;
  wire _sub_plot_x_90_m_clock;
  wire [9:0] _sub_plot_x_89_hikareru;
  wire [9:0] _sub_plot_x_89_moto;
  wire [9:0] _sub_plot_x_89_sa;
  wire _sub_plot_x_89_in_do;
  wire _sub_plot_x_89_p_reset;
  wire _sub_plot_x_89_m_clock;
  wire [9:0] _sub_plot_x_88_hikareru;
  wire [9:0] _sub_plot_x_88_moto;
  wire [9:0] _sub_plot_x_88_sa;
  wire _sub_plot_x_88_in_do;
  wire _sub_plot_x_88_p_reset;
  wire _sub_plot_x_88_m_clock;
  wire [9:0] _sub_plot_x_87_hikareru;
  wire [9:0] _sub_plot_x_87_moto;
  wire [9:0] _sub_plot_x_87_sa;
  wire _sub_plot_x_87_in_do;
  wire _sub_plot_x_87_p_reset;
  wire _sub_plot_x_87_m_clock;
  wire [9:0] _sub_plot_x_86_hikareru;
  wire [9:0] _sub_plot_x_86_moto;
  wire [9:0] _sub_plot_x_86_sa;
  wire _sub_plot_x_86_in_do;
  wire _sub_plot_x_86_p_reset;
  wire _sub_plot_x_86_m_clock;
  wire [9:0] _sub_plot_x_85_hikareru;
  wire [9:0] _sub_plot_x_85_moto;
  wire [9:0] _sub_plot_x_85_sa;
  wire _sub_plot_x_85_in_do;
  wire _sub_plot_x_85_p_reset;
  wire _sub_plot_x_85_m_clock;
  wire [9:0] _sub_plot_x_84_hikareru;
  wire [9:0] _sub_plot_x_84_moto;
  wire [9:0] _sub_plot_x_84_sa;
  wire _sub_plot_x_84_in_do;
  wire _sub_plot_x_84_p_reset;
  wire _sub_plot_x_84_m_clock;
  wire [9:0] _sub_plot_x_83_hikareru;
  wire [9:0] _sub_plot_x_83_moto;
  wire [9:0] _sub_plot_x_83_sa;
  wire _sub_plot_x_83_in_do;
  wire _sub_plot_x_83_p_reset;
  wire _sub_plot_x_83_m_clock;
  wire [9:0] _sub_plot_x_82_hikareru;
  wire [9:0] _sub_plot_x_82_moto;
  wire [9:0] _sub_plot_x_82_sa;
  wire _sub_plot_x_82_in_do;
  wire _sub_plot_x_82_p_reset;
  wire _sub_plot_x_82_m_clock;
  wire [9:0] _sub_plot_x_81_hikareru;
  wire [9:0] _sub_plot_x_81_moto;
  wire [9:0] _sub_plot_x_81_sa;
  wire _sub_plot_x_81_in_do;
  wire _sub_plot_x_81_p_reset;
  wire _sub_plot_x_81_m_clock;
  wire [9:0] _sub_plot_x_80_hikareru;
  wire [9:0] _sub_plot_x_80_moto;
  wire [9:0] _sub_plot_x_80_sa;
  wire _sub_plot_x_80_in_do;
  wire _sub_plot_x_80_p_reset;
  wire _sub_plot_x_80_m_clock;
  wire [9:0] _sub_plot_x_79_hikareru;
  wire [9:0] _sub_plot_x_79_moto;
  wire [9:0] _sub_plot_x_79_sa;
  wire _sub_plot_x_79_in_do;
  wire _sub_plot_x_79_p_reset;
  wire _sub_plot_x_79_m_clock;
  wire [9:0] _sub_plot_x_78_hikareru;
  wire [9:0] _sub_plot_x_78_moto;
  wire [9:0] _sub_plot_x_78_sa;
  wire _sub_plot_x_78_in_do;
  wire _sub_plot_x_78_p_reset;
  wire _sub_plot_x_78_m_clock;
  wire [9:0] _sub_plot_x_77_hikareru;
  wire [9:0] _sub_plot_x_77_moto;
  wire [9:0] _sub_plot_x_77_sa;
  wire _sub_plot_x_77_in_do;
  wire _sub_plot_x_77_p_reset;
  wire _sub_plot_x_77_m_clock;
  wire [9:0] _sub_plot_x_76_hikareru;
  wire [9:0] _sub_plot_x_76_moto;
  wire [9:0] _sub_plot_x_76_sa;
  wire _sub_plot_x_76_in_do;
  wire _sub_plot_x_76_p_reset;
  wire _sub_plot_x_76_m_clock;
  wire [9:0] _sub_plot_x_75_hikareru;
  wire [9:0] _sub_plot_x_75_moto;
  wire [9:0] _sub_plot_x_75_sa;
  wire _sub_plot_x_75_in_do;
  wire _sub_plot_x_75_p_reset;
  wire _sub_plot_x_75_m_clock;
  wire [9:0] _sub_plot_x_74_hikareru;
  wire [9:0] _sub_plot_x_74_moto;
  wire [9:0] _sub_plot_x_74_sa;
  wire _sub_plot_x_74_in_do;
  wire _sub_plot_x_74_p_reset;
  wire _sub_plot_x_74_m_clock;
  wire [9:0] _sub_plot_x_73_hikareru;
  wire [9:0] _sub_plot_x_73_moto;
  wire [9:0] _sub_plot_x_73_sa;
  wire _sub_plot_x_73_in_do;
  wire _sub_plot_x_73_p_reset;
  wire _sub_plot_x_73_m_clock;
  wire [9:0] _sub_plot_x_72_hikareru;
  wire [9:0] _sub_plot_x_72_moto;
  wire [9:0] _sub_plot_x_72_sa;
  wire _sub_plot_x_72_in_do;
  wire _sub_plot_x_72_p_reset;
  wire _sub_plot_x_72_m_clock;
  wire [9:0] _sub_plot_x_71_hikareru;
  wire [9:0] _sub_plot_x_71_moto;
  wire [9:0] _sub_plot_x_71_sa;
  wire _sub_plot_x_71_in_do;
  wire _sub_plot_x_71_p_reset;
  wire _sub_plot_x_71_m_clock;
  wire [9:0] _sub_plot_x_70_hikareru;
  wire [9:0] _sub_plot_x_70_moto;
  wire [9:0] _sub_plot_x_70_sa;
  wire _sub_plot_x_70_in_do;
  wire _sub_plot_x_70_p_reset;
  wire _sub_plot_x_70_m_clock;
  wire [9:0] _sub_plot_x_69_hikareru;
  wire [9:0] _sub_plot_x_69_moto;
  wire [9:0] _sub_plot_x_69_sa;
  wire _sub_plot_x_69_in_do;
  wire _sub_plot_x_69_p_reset;
  wire _sub_plot_x_69_m_clock;
  wire [9:0] _sub_plot_x_68_hikareru;
  wire [9:0] _sub_plot_x_68_moto;
  wire [9:0] _sub_plot_x_68_sa;
  wire _sub_plot_x_68_in_do;
  wire _sub_plot_x_68_p_reset;
  wire _sub_plot_x_68_m_clock;
  wire [9:0] _sub_plot_x_67_hikareru;
  wire [9:0] _sub_plot_x_67_moto;
  wire [9:0] _sub_plot_x_67_sa;
  wire _sub_plot_x_67_in_do;
  wire _sub_plot_x_67_p_reset;
  wire _sub_plot_x_67_m_clock;
  wire [9:0] _sub_plot_x_66_hikareru;
  wire [9:0] _sub_plot_x_66_moto;
  wire [9:0] _sub_plot_x_66_sa;
  wire _sub_plot_x_66_in_do;
  wire _sub_plot_x_66_p_reset;
  wire _sub_plot_x_66_m_clock;
  wire [9:0] _sub_plot_x_65_hikareru;
  wire [9:0] _sub_plot_x_65_moto;
  wire [9:0] _sub_plot_x_65_sa;
  wire _sub_plot_x_65_in_do;
  wire _sub_plot_x_65_p_reset;
  wire _sub_plot_x_65_m_clock;
  wire [9:0] _sub_plot_x_64_hikareru;
  wire [9:0] _sub_plot_x_64_moto;
  wire [9:0] _sub_plot_x_64_sa;
  wire _sub_plot_x_64_in_do;
  wire _sub_plot_x_64_p_reset;
  wire _sub_plot_x_64_m_clock;
  wire [9:0] _sub_plot_x_63_hikareru;
  wire [9:0] _sub_plot_x_63_moto;
  wire [9:0] _sub_plot_x_63_sa;
  wire _sub_plot_x_63_in_do;
  wire _sub_plot_x_63_p_reset;
  wire _sub_plot_x_63_m_clock;
  wire [9:0] _sub_plot_x_62_hikareru;
  wire [9:0] _sub_plot_x_62_moto;
  wire [9:0] _sub_plot_x_62_sa;
  wire _sub_plot_x_62_in_do;
  wire _sub_plot_x_62_p_reset;
  wire _sub_plot_x_62_m_clock;
  wire [9:0] _sub_plot_x_61_hikareru;
  wire [9:0] _sub_plot_x_61_moto;
  wire [9:0] _sub_plot_x_61_sa;
  wire _sub_plot_x_61_in_do;
  wire _sub_plot_x_61_p_reset;
  wire _sub_plot_x_61_m_clock;
  wire [9:0] _sub_plot_x_60_hikareru;
  wire [9:0] _sub_plot_x_60_moto;
  wire [9:0] _sub_plot_x_60_sa;
  wire _sub_plot_x_60_in_do;
  wire _sub_plot_x_60_p_reset;
  wire _sub_plot_x_60_m_clock;
  wire [9:0] _sub_plot_x_59_hikareru;
  wire [9:0] _sub_plot_x_59_moto;
  wire [9:0] _sub_plot_x_59_sa;
  wire _sub_plot_x_59_in_do;
  wire _sub_plot_x_59_p_reset;
  wire _sub_plot_x_59_m_clock;
  wire [9:0] _sub_plot_x_58_hikareru;
  wire [9:0] _sub_plot_x_58_moto;
  wire [9:0] _sub_plot_x_58_sa;
  wire _sub_plot_x_58_in_do;
  wire _sub_plot_x_58_p_reset;
  wire _sub_plot_x_58_m_clock;
  wire [9:0] _sub_plot_x_57_hikareru;
  wire [9:0] _sub_plot_x_57_moto;
  wire [9:0] _sub_plot_x_57_sa;
  wire _sub_plot_x_57_in_do;
  wire _sub_plot_x_57_p_reset;
  wire _sub_plot_x_57_m_clock;
  wire [9:0] _sub_plot_x_56_hikareru;
  wire [9:0] _sub_plot_x_56_moto;
  wire [9:0] _sub_plot_x_56_sa;
  wire _sub_plot_x_56_in_do;
  wire _sub_plot_x_56_p_reset;
  wire _sub_plot_x_56_m_clock;
  wire [9:0] _sub_plot_x_55_hikareru;
  wire [9:0] _sub_plot_x_55_moto;
  wire [9:0] _sub_plot_x_55_sa;
  wire _sub_plot_x_55_in_do;
  wire _sub_plot_x_55_p_reset;
  wire _sub_plot_x_55_m_clock;
  wire [9:0] _sub_plot_x_54_hikareru;
  wire [9:0] _sub_plot_x_54_moto;
  wire [9:0] _sub_plot_x_54_sa;
  wire _sub_plot_x_54_in_do;
  wire _sub_plot_x_54_p_reset;
  wire _sub_plot_x_54_m_clock;
  wire [9:0] _sub_plot_x_53_hikareru;
  wire [9:0] _sub_plot_x_53_moto;
  wire [9:0] _sub_plot_x_53_sa;
  wire _sub_plot_x_53_in_do;
  wire _sub_plot_x_53_p_reset;
  wire _sub_plot_x_53_m_clock;
  wire [9:0] _sub_plot_x_52_hikareru;
  wire [9:0] _sub_plot_x_52_moto;
  wire [9:0] _sub_plot_x_52_sa;
  wire _sub_plot_x_52_in_do;
  wire _sub_plot_x_52_p_reset;
  wire _sub_plot_x_52_m_clock;
  wire [9:0] _sub_plot_x_51_hikareru;
  wire [9:0] _sub_plot_x_51_moto;
  wire [9:0] _sub_plot_x_51_sa;
  wire _sub_plot_x_51_in_do;
  wire _sub_plot_x_51_p_reset;
  wire _sub_plot_x_51_m_clock;
  wire [9:0] _sub_plot_x_50_hikareru;
  wire [9:0] _sub_plot_x_50_moto;
  wire [9:0] _sub_plot_x_50_sa;
  wire _sub_plot_x_50_in_do;
  wire _sub_plot_x_50_p_reset;
  wire _sub_plot_x_50_m_clock;
  wire [9:0] _sub_plot_x_49_hikareru;
  wire [9:0] _sub_plot_x_49_moto;
  wire [9:0] _sub_plot_x_49_sa;
  wire _sub_plot_x_49_in_do;
  wire _sub_plot_x_49_p_reset;
  wire _sub_plot_x_49_m_clock;
  wire [9:0] _sub_plot_x_48_hikareru;
  wire [9:0] _sub_plot_x_48_moto;
  wire [9:0] _sub_plot_x_48_sa;
  wire _sub_plot_x_48_in_do;
  wire _sub_plot_x_48_p_reset;
  wire _sub_plot_x_48_m_clock;
  wire [9:0] _sub_plot_x_47_hikareru;
  wire [9:0] _sub_plot_x_47_moto;
  wire [9:0] _sub_plot_x_47_sa;
  wire _sub_plot_x_47_in_do;
  wire _sub_plot_x_47_p_reset;
  wire _sub_plot_x_47_m_clock;
  wire [9:0] _sub_plot_x_46_hikareru;
  wire [9:0] _sub_plot_x_46_moto;
  wire [9:0] _sub_plot_x_46_sa;
  wire _sub_plot_x_46_in_do;
  wire _sub_plot_x_46_p_reset;
  wire _sub_plot_x_46_m_clock;
  wire [9:0] _sub_plot_x_45_hikareru;
  wire [9:0] _sub_plot_x_45_moto;
  wire [9:0] _sub_plot_x_45_sa;
  wire _sub_plot_x_45_in_do;
  wire _sub_plot_x_45_p_reset;
  wire _sub_plot_x_45_m_clock;
  wire [9:0] _sub_plot_x_44_hikareru;
  wire [9:0] _sub_plot_x_44_moto;
  wire [9:0] _sub_plot_x_44_sa;
  wire _sub_plot_x_44_in_do;
  wire _sub_plot_x_44_p_reset;
  wire _sub_plot_x_44_m_clock;
  wire [9:0] _sub_plot_x_43_hikareru;
  wire [9:0] _sub_plot_x_43_moto;
  wire [9:0] _sub_plot_x_43_sa;
  wire _sub_plot_x_43_in_do;
  wire _sub_plot_x_43_p_reset;
  wire _sub_plot_x_43_m_clock;
  wire [9:0] _sub_plot_x_42_hikareru;
  wire [9:0] _sub_plot_x_42_moto;
  wire [9:0] _sub_plot_x_42_sa;
  wire _sub_plot_x_42_in_do;
  wire _sub_plot_x_42_p_reset;
  wire _sub_plot_x_42_m_clock;
  wire [9:0] _sub_plot_x_41_hikareru;
  wire [9:0] _sub_plot_x_41_moto;
  wire [9:0] _sub_plot_x_41_sa;
  wire _sub_plot_x_41_in_do;
  wire _sub_plot_x_41_p_reset;
  wire _sub_plot_x_41_m_clock;
  wire [9:0] _sub_plot_x_40_hikareru;
  wire [9:0] _sub_plot_x_40_moto;
  wire [9:0] _sub_plot_x_40_sa;
  wire _sub_plot_x_40_in_do;
  wire _sub_plot_x_40_p_reset;
  wire _sub_plot_x_40_m_clock;
  wire [9:0] _sub_plot_x_39_hikareru;
  wire [9:0] _sub_plot_x_39_moto;
  wire [9:0] _sub_plot_x_39_sa;
  wire _sub_plot_x_39_in_do;
  wire _sub_plot_x_39_p_reset;
  wire _sub_plot_x_39_m_clock;
  wire [9:0] _sub_plot_x_38_hikareru;
  wire [9:0] _sub_plot_x_38_moto;
  wire [9:0] _sub_plot_x_38_sa;
  wire _sub_plot_x_38_in_do;
  wire _sub_plot_x_38_p_reset;
  wire _sub_plot_x_38_m_clock;
  wire [9:0] _sub_plot_x_37_hikareru;
  wire [9:0] _sub_plot_x_37_moto;
  wire [9:0] _sub_plot_x_37_sa;
  wire _sub_plot_x_37_in_do;
  wire _sub_plot_x_37_p_reset;
  wire _sub_plot_x_37_m_clock;
  wire [9:0] _sub_plot_x_36_hikareru;
  wire [9:0] _sub_plot_x_36_moto;
  wire [9:0] _sub_plot_x_36_sa;
  wire _sub_plot_x_36_in_do;
  wire _sub_plot_x_36_p_reset;
  wire _sub_plot_x_36_m_clock;
  wire [9:0] _sub_plot_x_35_hikareru;
  wire [9:0] _sub_plot_x_35_moto;
  wire [9:0] _sub_plot_x_35_sa;
  wire _sub_plot_x_35_in_do;
  wire _sub_plot_x_35_p_reset;
  wire _sub_plot_x_35_m_clock;
  wire [9:0] _sub_plot_x_34_hikareru;
  wire [9:0] _sub_plot_x_34_moto;
  wire [9:0] _sub_plot_x_34_sa;
  wire _sub_plot_x_34_in_do;
  wire _sub_plot_x_34_p_reset;
  wire _sub_plot_x_34_m_clock;
  wire [9:0] _sub_plot_x_33_hikareru;
  wire [9:0] _sub_plot_x_33_moto;
  wire [9:0] _sub_plot_x_33_sa;
  wire _sub_plot_x_33_in_do;
  wire _sub_plot_x_33_p_reset;
  wire _sub_plot_x_33_m_clock;
  wire [9:0] _sub_plot_x_32_hikareru;
  wire [9:0] _sub_plot_x_32_moto;
  wire [9:0] _sub_plot_x_32_sa;
  wire _sub_plot_x_32_in_do;
  wire _sub_plot_x_32_p_reset;
  wire _sub_plot_x_32_m_clock;
  wire [9:0] _sub_plot_x_31_hikareru;
  wire [9:0] _sub_plot_x_31_moto;
  wire [9:0] _sub_plot_x_31_sa;
  wire _sub_plot_x_31_in_do;
  wire _sub_plot_x_31_p_reset;
  wire _sub_plot_x_31_m_clock;
  wire [9:0] _sub_plot_x_30_hikareru;
  wire [9:0] _sub_plot_x_30_moto;
  wire [9:0] _sub_plot_x_30_sa;
  wire _sub_plot_x_30_in_do;
  wire _sub_plot_x_30_p_reset;
  wire _sub_plot_x_30_m_clock;
  wire [9:0] _sub_plot_x_29_hikareru;
  wire [9:0] _sub_plot_x_29_moto;
  wire [9:0] _sub_plot_x_29_sa;
  wire _sub_plot_x_29_in_do;
  wire _sub_plot_x_29_p_reset;
  wire _sub_plot_x_29_m_clock;
  wire [9:0] _sub_plot_x_28_hikareru;
  wire [9:0] _sub_plot_x_28_moto;
  wire [9:0] _sub_plot_x_28_sa;
  wire _sub_plot_x_28_in_do;
  wire _sub_plot_x_28_p_reset;
  wire _sub_plot_x_28_m_clock;
  wire [9:0] _sub_plot_x_27_hikareru;
  wire [9:0] _sub_plot_x_27_moto;
  wire [9:0] _sub_plot_x_27_sa;
  wire _sub_plot_x_27_in_do;
  wire _sub_plot_x_27_p_reset;
  wire _sub_plot_x_27_m_clock;
  wire [9:0] _sub_plot_x_26_hikareru;
  wire [9:0] _sub_plot_x_26_moto;
  wire [9:0] _sub_plot_x_26_sa;
  wire _sub_plot_x_26_in_do;
  wire _sub_plot_x_26_p_reset;
  wire _sub_plot_x_26_m_clock;
  wire [9:0] _sub_plot_x_25_hikareru;
  wire [9:0] _sub_plot_x_25_moto;
  wire [9:0] _sub_plot_x_25_sa;
  wire _sub_plot_x_25_in_do;
  wire _sub_plot_x_25_p_reset;
  wire _sub_plot_x_25_m_clock;
  wire [9:0] _sub_plot_x_24_hikareru;
  wire [9:0] _sub_plot_x_24_moto;
  wire [9:0] _sub_plot_x_24_sa;
  wire _sub_plot_x_24_in_do;
  wire _sub_plot_x_24_p_reset;
  wire _sub_plot_x_24_m_clock;
  wire [9:0] _sub_plot_x_23_hikareru;
  wire [9:0] _sub_plot_x_23_moto;
  wire [9:0] _sub_plot_x_23_sa;
  wire _sub_plot_x_23_in_do;
  wire _sub_plot_x_23_p_reset;
  wire _sub_plot_x_23_m_clock;
  wire [9:0] _sub_plot_x_22_hikareru;
  wire [9:0] _sub_plot_x_22_moto;
  wire [9:0] _sub_plot_x_22_sa;
  wire _sub_plot_x_22_in_do;
  wire _sub_plot_x_22_p_reset;
  wire _sub_plot_x_22_m_clock;
  wire [9:0] _sub_plot_x_21_hikareru;
  wire [9:0] _sub_plot_x_21_moto;
  wire [9:0] _sub_plot_x_21_sa;
  wire _sub_plot_x_21_in_do;
  wire _sub_plot_x_21_p_reset;
  wire _sub_plot_x_21_m_clock;
  wire [9:0] _sub_plot_x_20_hikareru;
  wire [9:0] _sub_plot_x_20_moto;
  wire [9:0] _sub_plot_x_20_sa;
  wire _sub_plot_x_20_in_do;
  wire _sub_plot_x_20_p_reset;
  wire _sub_plot_x_20_m_clock;
  wire [9:0] _sub_plot_x_19_hikareru;
  wire [9:0] _sub_plot_x_19_moto;
  wire [9:0] _sub_plot_x_19_sa;
  wire _sub_plot_x_19_in_do;
  wire _sub_plot_x_19_p_reset;
  wire _sub_plot_x_19_m_clock;
  wire [9:0] _sub_plot_x_18_hikareru;
  wire [9:0] _sub_plot_x_18_moto;
  wire [9:0] _sub_plot_x_18_sa;
  wire _sub_plot_x_18_in_do;
  wire _sub_plot_x_18_p_reset;
  wire _sub_plot_x_18_m_clock;
  wire [9:0] _sub_plot_x_17_hikareru;
  wire [9:0] _sub_plot_x_17_moto;
  wire [9:0] _sub_plot_x_17_sa;
  wire _sub_plot_x_17_in_do;
  wire _sub_plot_x_17_p_reset;
  wire _sub_plot_x_17_m_clock;
  wire [9:0] _sub_plot_x_16_hikareru;
  wire [9:0] _sub_plot_x_16_moto;
  wire [9:0] _sub_plot_x_16_sa;
  wire _sub_plot_x_16_in_do;
  wire _sub_plot_x_16_p_reset;
  wire _sub_plot_x_16_m_clock;
  wire [9:0] _sub_plot_x_15_hikareru;
  wire [9:0] _sub_plot_x_15_moto;
  wire [9:0] _sub_plot_x_15_sa;
  wire _sub_plot_x_15_in_do;
  wire _sub_plot_x_15_p_reset;
  wire _sub_plot_x_15_m_clock;
  wire [9:0] _sub_plot_x_14_hikareru;
  wire [9:0] _sub_plot_x_14_moto;
  wire [9:0] _sub_plot_x_14_sa;
  wire _sub_plot_x_14_in_do;
  wire _sub_plot_x_14_p_reset;
  wire _sub_plot_x_14_m_clock;
  wire [9:0] _sub_plot_x_13_hikareru;
  wire [9:0] _sub_plot_x_13_moto;
  wire [9:0] _sub_plot_x_13_sa;
  wire _sub_plot_x_13_in_do;
  wire _sub_plot_x_13_p_reset;
  wire _sub_plot_x_13_m_clock;
  wire [9:0] _sub_plot_x_12_hikareru;
  wire [9:0] _sub_plot_x_12_moto;
  wire [9:0] _sub_plot_x_12_sa;
  wire _sub_plot_x_12_in_do;
  wire _sub_plot_x_12_p_reset;
  wire _sub_plot_x_12_m_clock;
  wire [9:0] _sub_plot_x_11_hikareru;
  wire [9:0] _sub_plot_x_11_moto;
  wire [9:0] _sub_plot_x_11_sa;
  wire _sub_plot_x_11_in_do;
  wire _sub_plot_x_11_p_reset;
  wire _sub_plot_x_11_m_clock;
  wire [9:0] _sub_plot_x_10_hikareru;
  wire [9:0] _sub_plot_x_10_moto;
  wire [9:0] _sub_plot_x_10_sa;
  wire _sub_plot_x_10_in_do;
  wire _sub_plot_x_10_p_reset;
  wire _sub_plot_x_10_m_clock;
  wire [9:0] _sub_plot_x_9_hikareru;
  wire [9:0] _sub_plot_x_9_moto;
  wire [9:0] _sub_plot_x_9_sa;
  wire _sub_plot_x_9_in_do;
  wire _sub_plot_x_9_p_reset;
  wire _sub_plot_x_9_m_clock;
  wire [9:0] _sub_plot_x_8_hikareru;
  wire [9:0] _sub_plot_x_8_moto;
  wire [9:0] _sub_plot_x_8_sa;
  wire _sub_plot_x_8_in_do;
  wire _sub_plot_x_8_p_reset;
  wire _sub_plot_x_8_m_clock;
  wire [9:0] _sub_plot_x_7_hikareru;
  wire [9:0] _sub_plot_x_7_moto;
  wire [9:0] _sub_plot_x_7_sa;
  wire _sub_plot_x_7_in_do;
  wire _sub_plot_x_7_p_reset;
  wire _sub_plot_x_7_m_clock;
  wire [9:0] _sub_plot_x_6_hikareru;
  wire [9:0] _sub_plot_x_6_moto;
  wire [9:0] _sub_plot_x_6_sa;
  wire _sub_plot_x_6_in_do;
  wire _sub_plot_x_6_p_reset;
  wire _sub_plot_x_6_m_clock;
  wire [9:0] _sub_plot_x_5_hikareru;
  wire [9:0] _sub_plot_x_5_moto;
  wire [9:0] _sub_plot_x_5_sa;
  wire _sub_plot_x_5_in_do;
  wire _sub_plot_x_5_p_reset;
  wire _sub_plot_x_5_m_clock;
  wire [9:0] _sub_plot_x_4_hikareru;
  wire [9:0] _sub_plot_x_4_moto;
  wire [9:0] _sub_plot_x_4_sa;
  wire _sub_plot_x_4_in_do;
  wire _sub_plot_x_4_p_reset;
  wire _sub_plot_x_4_m_clock;
  wire [9:0] _sub_plot_x_3_hikareru;
  wire [9:0] _sub_plot_x_3_moto;
  wire [9:0] _sub_plot_x_3_sa;
  wire _sub_plot_x_3_in_do;
  wire _sub_plot_x_3_p_reset;
  wire _sub_plot_x_3_m_clock;
  wire [9:0] _sub_plot_x_2_hikareru;
  wire [9:0] _sub_plot_x_2_moto;
  wire [9:0] _sub_plot_x_2_sa;
  wire _sub_plot_x_2_in_do;
  wire _sub_plot_x_2_p_reset;
  wire _sub_plot_x_2_m_clock;
  wire [9:0] _sub_plot_x_1_hikareru;
  wire [9:0] _sub_plot_x_1_moto;
  wire [9:0] _sub_plot_x_1_sa;
  wire _sub_plot_x_1_in_do;
  wire _sub_plot_x_1_p_reset;
  wire _sub_plot_x_1_m_clock;
sub_plot sub_plot_x (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_in_do), .sa(_sub_plot_x_sa), .hikareru(_sub_plot_x_hikareru), .moto(_sub_plot_x_moto));
sub_plot sub_plot_x_97 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_97_in_do), .sa(_sub_plot_x_97_sa), .hikareru(_sub_plot_x_97_hikareru), .moto(_sub_plot_x_97_moto));
sub_plot sub_plot_x_96 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_96_in_do), .sa(_sub_plot_x_96_sa), .hikareru(_sub_plot_x_96_hikareru), .moto(_sub_plot_x_96_moto));
sub_plot sub_plot_x_95 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_95_in_do), .sa(_sub_plot_x_95_sa), .hikareru(_sub_plot_x_95_hikareru), .moto(_sub_plot_x_95_moto));
sub_plot sub_plot_x_94 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_94_in_do), .sa(_sub_plot_x_94_sa), .hikareru(_sub_plot_x_94_hikareru), .moto(_sub_plot_x_94_moto));
sub_plot sub_plot_x_93 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_93_in_do), .sa(_sub_plot_x_93_sa), .hikareru(_sub_plot_x_93_hikareru), .moto(_sub_plot_x_93_moto));
sub_plot sub_plot_x_92 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_92_in_do), .sa(_sub_plot_x_92_sa), .hikareru(_sub_plot_x_92_hikareru), .moto(_sub_plot_x_92_moto));
sub_plot sub_plot_x_91 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_91_in_do), .sa(_sub_plot_x_91_sa), .hikareru(_sub_plot_x_91_hikareru), .moto(_sub_plot_x_91_moto));
sub_plot sub_plot_x_90 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_90_in_do), .sa(_sub_plot_x_90_sa), .hikareru(_sub_plot_x_90_hikareru), .moto(_sub_plot_x_90_moto));
sub_plot sub_plot_x_89 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_89_in_do), .sa(_sub_plot_x_89_sa), .hikareru(_sub_plot_x_89_hikareru), .moto(_sub_plot_x_89_moto));
sub_plot sub_plot_x_88 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_88_in_do), .sa(_sub_plot_x_88_sa), .hikareru(_sub_plot_x_88_hikareru), .moto(_sub_plot_x_88_moto));
sub_plot sub_plot_x_87 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_87_in_do), .sa(_sub_plot_x_87_sa), .hikareru(_sub_plot_x_87_hikareru), .moto(_sub_plot_x_87_moto));
sub_plot sub_plot_x_86 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_86_in_do), .sa(_sub_plot_x_86_sa), .hikareru(_sub_plot_x_86_hikareru), .moto(_sub_plot_x_86_moto));
sub_plot sub_plot_x_85 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_85_in_do), .sa(_sub_plot_x_85_sa), .hikareru(_sub_plot_x_85_hikareru), .moto(_sub_plot_x_85_moto));
sub_plot sub_plot_x_84 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_84_in_do), .sa(_sub_plot_x_84_sa), .hikareru(_sub_plot_x_84_hikareru), .moto(_sub_plot_x_84_moto));
sub_plot sub_plot_x_83 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_83_in_do), .sa(_sub_plot_x_83_sa), .hikareru(_sub_plot_x_83_hikareru), .moto(_sub_plot_x_83_moto));
sub_plot sub_plot_x_82 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_82_in_do), .sa(_sub_plot_x_82_sa), .hikareru(_sub_plot_x_82_hikareru), .moto(_sub_plot_x_82_moto));
sub_plot sub_plot_x_81 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_81_in_do), .sa(_sub_plot_x_81_sa), .hikareru(_sub_plot_x_81_hikareru), .moto(_sub_plot_x_81_moto));
sub_plot sub_plot_x_80 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_80_in_do), .sa(_sub_plot_x_80_sa), .hikareru(_sub_plot_x_80_hikareru), .moto(_sub_plot_x_80_moto));
sub_plot sub_plot_x_79 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_79_in_do), .sa(_sub_plot_x_79_sa), .hikareru(_sub_plot_x_79_hikareru), .moto(_sub_plot_x_79_moto));
sub_plot sub_plot_x_78 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_78_in_do), .sa(_sub_plot_x_78_sa), .hikareru(_sub_plot_x_78_hikareru), .moto(_sub_plot_x_78_moto));
sub_plot sub_plot_x_77 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_77_in_do), .sa(_sub_plot_x_77_sa), .hikareru(_sub_plot_x_77_hikareru), .moto(_sub_plot_x_77_moto));
sub_plot sub_plot_x_76 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_76_in_do), .sa(_sub_plot_x_76_sa), .hikareru(_sub_plot_x_76_hikareru), .moto(_sub_plot_x_76_moto));
sub_plot sub_plot_x_75 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_75_in_do), .sa(_sub_plot_x_75_sa), .hikareru(_sub_plot_x_75_hikareru), .moto(_sub_plot_x_75_moto));
sub_plot sub_plot_x_74 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_74_in_do), .sa(_sub_plot_x_74_sa), .hikareru(_sub_plot_x_74_hikareru), .moto(_sub_plot_x_74_moto));
sub_plot sub_plot_x_73 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_73_in_do), .sa(_sub_plot_x_73_sa), .hikareru(_sub_plot_x_73_hikareru), .moto(_sub_plot_x_73_moto));
sub_plot sub_plot_x_72 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_72_in_do), .sa(_sub_plot_x_72_sa), .hikareru(_sub_plot_x_72_hikareru), .moto(_sub_plot_x_72_moto));
sub_plot sub_plot_x_71 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_71_in_do), .sa(_sub_plot_x_71_sa), .hikareru(_sub_plot_x_71_hikareru), .moto(_sub_plot_x_71_moto));
sub_plot sub_plot_x_70 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_70_in_do), .sa(_sub_plot_x_70_sa), .hikareru(_sub_plot_x_70_hikareru), .moto(_sub_plot_x_70_moto));
sub_plot sub_plot_x_69 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_69_in_do), .sa(_sub_plot_x_69_sa), .hikareru(_sub_plot_x_69_hikareru), .moto(_sub_plot_x_69_moto));
sub_plot sub_plot_x_68 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_68_in_do), .sa(_sub_plot_x_68_sa), .hikareru(_sub_plot_x_68_hikareru), .moto(_sub_plot_x_68_moto));
sub_plot sub_plot_x_67 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_67_in_do), .sa(_sub_plot_x_67_sa), .hikareru(_sub_plot_x_67_hikareru), .moto(_sub_plot_x_67_moto));
sub_plot sub_plot_x_66 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_66_in_do), .sa(_sub_plot_x_66_sa), .hikareru(_sub_plot_x_66_hikareru), .moto(_sub_plot_x_66_moto));
sub_plot sub_plot_x_65 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_65_in_do), .sa(_sub_plot_x_65_sa), .hikareru(_sub_plot_x_65_hikareru), .moto(_sub_plot_x_65_moto));
sub_plot sub_plot_x_64 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_64_in_do), .sa(_sub_plot_x_64_sa), .hikareru(_sub_plot_x_64_hikareru), .moto(_sub_plot_x_64_moto));
sub_plot sub_plot_x_63 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_63_in_do), .sa(_sub_plot_x_63_sa), .hikareru(_sub_plot_x_63_hikareru), .moto(_sub_plot_x_63_moto));
sub_plot sub_plot_x_62 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_62_in_do), .sa(_sub_plot_x_62_sa), .hikareru(_sub_plot_x_62_hikareru), .moto(_sub_plot_x_62_moto));
sub_plot sub_plot_x_61 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_61_in_do), .sa(_sub_plot_x_61_sa), .hikareru(_sub_plot_x_61_hikareru), .moto(_sub_plot_x_61_moto));
sub_plot sub_plot_x_60 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_60_in_do), .sa(_sub_plot_x_60_sa), .hikareru(_sub_plot_x_60_hikareru), .moto(_sub_plot_x_60_moto));
sub_plot sub_plot_x_59 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_59_in_do), .sa(_sub_plot_x_59_sa), .hikareru(_sub_plot_x_59_hikareru), .moto(_sub_plot_x_59_moto));
sub_plot sub_plot_x_58 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_58_in_do), .sa(_sub_plot_x_58_sa), .hikareru(_sub_plot_x_58_hikareru), .moto(_sub_plot_x_58_moto));
sub_plot sub_plot_x_57 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_57_in_do), .sa(_sub_plot_x_57_sa), .hikareru(_sub_plot_x_57_hikareru), .moto(_sub_plot_x_57_moto));
sub_plot sub_plot_x_56 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_56_in_do), .sa(_sub_plot_x_56_sa), .hikareru(_sub_plot_x_56_hikareru), .moto(_sub_plot_x_56_moto));
sub_plot sub_plot_x_55 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_55_in_do), .sa(_sub_plot_x_55_sa), .hikareru(_sub_plot_x_55_hikareru), .moto(_sub_plot_x_55_moto));
sub_plot sub_plot_x_54 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_54_in_do), .sa(_sub_plot_x_54_sa), .hikareru(_sub_plot_x_54_hikareru), .moto(_sub_plot_x_54_moto));
sub_plot sub_plot_x_53 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_53_in_do), .sa(_sub_plot_x_53_sa), .hikareru(_sub_plot_x_53_hikareru), .moto(_sub_plot_x_53_moto));
sub_plot sub_plot_x_52 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_52_in_do), .sa(_sub_plot_x_52_sa), .hikareru(_sub_plot_x_52_hikareru), .moto(_sub_plot_x_52_moto));
sub_plot sub_plot_x_51 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_51_in_do), .sa(_sub_plot_x_51_sa), .hikareru(_sub_plot_x_51_hikareru), .moto(_sub_plot_x_51_moto));
sub_plot sub_plot_x_50 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_50_in_do), .sa(_sub_plot_x_50_sa), .hikareru(_sub_plot_x_50_hikareru), .moto(_sub_plot_x_50_moto));
sub_plot sub_plot_x_49 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_49_in_do), .sa(_sub_plot_x_49_sa), .hikareru(_sub_plot_x_49_hikareru), .moto(_sub_plot_x_49_moto));
sub_plot sub_plot_x_48 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_48_in_do), .sa(_sub_plot_x_48_sa), .hikareru(_sub_plot_x_48_hikareru), .moto(_sub_plot_x_48_moto));
sub_plot sub_plot_x_47 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_47_in_do), .sa(_sub_plot_x_47_sa), .hikareru(_sub_plot_x_47_hikareru), .moto(_sub_plot_x_47_moto));
sub_plot sub_plot_x_46 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_46_in_do), .sa(_sub_plot_x_46_sa), .hikareru(_sub_plot_x_46_hikareru), .moto(_sub_plot_x_46_moto));
sub_plot sub_plot_x_45 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_45_in_do), .sa(_sub_plot_x_45_sa), .hikareru(_sub_plot_x_45_hikareru), .moto(_sub_plot_x_45_moto));
sub_plot sub_plot_x_44 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_44_in_do), .sa(_sub_plot_x_44_sa), .hikareru(_sub_plot_x_44_hikareru), .moto(_sub_plot_x_44_moto));
sub_plot sub_plot_x_43 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_43_in_do), .sa(_sub_plot_x_43_sa), .hikareru(_sub_plot_x_43_hikareru), .moto(_sub_plot_x_43_moto));
sub_plot sub_plot_x_42 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_42_in_do), .sa(_sub_plot_x_42_sa), .hikareru(_sub_plot_x_42_hikareru), .moto(_sub_plot_x_42_moto));
sub_plot sub_plot_x_41 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_41_in_do), .sa(_sub_plot_x_41_sa), .hikareru(_sub_plot_x_41_hikareru), .moto(_sub_plot_x_41_moto));
sub_plot sub_plot_x_40 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_40_in_do), .sa(_sub_plot_x_40_sa), .hikareru(_sub_plot_x_40_hikareru), .moto(_sub_plot_x_40_moto));
sub_plot sub_plot_x_39 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_39_in_do), .sa(_sub_plot_x_39_sa), .hikareru(_sub_plot_x_39_hikareru), .moto(_sub_plot_x_39_moto));
sub_plot sub_plot_x_38 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_38_in_do), .sa(_sub_plot_x_38_sa), .hikareru(_sub_plot_x_38_hikareru), .moto(_sub_plot_x_38_moto));
sub_plot sub_plot_x_37 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_37_in_do), .sa(_sub_plot_x_37_sa), .hikareru(_sub_plot_x_37_hikareru), .moto(_sub_plot_x_37_moto));
sub_plot sub_plot_x_36 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_36_in_do), .sa(_sub_plot_x_36_sa), .hikareru(_sub_plot_x_36_hikareru), .moto(_sub_plot_x_36_moto));
sub_plot sub_plot_x_35 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_35_in_do), .sa(_sub_plot_x_35_sa), .hikareru(_sub_plot_x_35_hikareru), .moto(_sub_plot_x_35_moto));
sub_plot sub_plot_x_34 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_34_in_do), .sa(_sub_plot_x_34_sa), .hikareru(_sub_plot_x_34_hikareru), .moto(_sub_plot_x_34_moto));
sub_plot sub_plot_x_33 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_33_in_do), .sa(_sub_plot_x_33_sa), .hikareru(_sub_plot_x_33_hikareru), .moto(_sub_plot_x_33_moto));
sub_plot sub_plot_x_32 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_32_in_do), .sa(_sub_plot_x_32_sa), .hikareru(_sub_plot_x_32_hikareru), .moto(_sub_plot_x_32_moto));
sub_plot sub_plot_x_31 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_31_in_do), .sa(_sub_plot_x_31_sa), .hikareru(_sub_plot_x_31_hikareru), .moto(_sub_plot_x_31_moto));
sub_plot sub_plot_x_30 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_30_in_do), .sa(_sub_plot_x_30_sa), .hikareru(_sub_plot_x_30_hikareru), .moto(_sub_plot_x_30_moto));
sub_plot sub_plot_x_29 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_29_in_do), .sa(_sub_plot_x_29_sa), .hikareru(_sub_plot_x_29_hikareru), .moto(_sub_plot_x_29_moto));
sub_plot sub_plot_x_28 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_28_in_do), .sa(_sub_plot_x_28_sa), .hikareru(_sub_plot_x_28_hikareru), .moto(_sub_plot_x_28_moto));
sub_plot sub_plot_x_27 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_27_in_do), .sa(_sub_plot_x_27_sa), .hikareru(_sub_plot_x_27_hikareru), .moto(_sub_plot_x_27_moto));
sub_plot sub_plot_x_26 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_26_in_do), .sa(_sub_plot_x_26_sa), .hikareru(_sub_plot_x_26_hikareru), .moto(_sub_plot_x_26_moto));
sub_plot sub_plot_x_25 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_25_in_do), .sa(_sub_plot_x_25_sa), .hikareru(_sub_plot_x_25_hikareru), .moto(_sub_plot_x_25_moto));
sub_plot sub_plot_x_24 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_24_in_do), .sa(_sub_plot_x_24_sa), .hikareru(_sub_plot_x_24_hikareru), .moto(_sub_plot_x_24_moto));
sub_plot sub_plot_x_23 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_23_in_do), .sa(_sub_plot_x_23_sa), .hikareru(_sub_plot_x_23_hikareru), .moto(_sub_plot_x_23_moto));
sub_plot sub_plot_x_22 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_22_in_do), .sa(_sub_plot_x_22_sa), .hikareru(_sub_plot_x_22_hikareru), .moto(_sub_plot_x_22_moto));
sub_plot sub_plot_x_21 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_21_in_do), .sa(_sub_plot_x_21_sa), .hikareru(_sub_plot_x_21_hikareru), .moto(_sub_plot_x_21_moto));
sub_plot sub_plot_x_20 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_20_in_do), .sa(_sub_plot_x_20_sa), .hikareru(_sub_plot_x_20_hikareru), .moto(_sub_plot_x_20_moto));
sub_plot sub_plot_x_19 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_19_in_do), .sa(_sub_plot_x_19_sa), .hikareru(_sub_plot_x_19_hikareru), .moto(_sub_plot_x_19_moto));
sub_plot sub_plot_x_18 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_18_in_do), .sa(_sub_plot_x_18_sa), .hikareru(_sub_plot_x_18_hikareru), .moto(_sub_plot_x_18_moto));
sub_plot sub_plot_x_17 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_17_in_do), .sa(_sub_plot_x_17_sa), .hikareru(_sub_plot_x_17_hikareru), .moto(_sub_plot_x_17_moto));
sub_plot sub_plot_x_16 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_16_in_do), .sa(_sub_plot_x_16_sa), .hikareru(_sub_plot_x_16_hikareru), .moto(_sub_plot_x_16_moto));
sub_plot sub_plot_x_15 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_15_in_do), .sa(_sub_plot_x_15_sa), .hikareru(_sub_plot_x_15_hikareru), .moto(_sub_plot_x_15_moto));
sub_plot sub_plot_x_14 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_14_in_do), .sa(_sub_plot_x_14_sa), .hikareru(_sub_plot_x_14_hikareru), .moto(_sub_plot_x_14_moto));
sub_plot sub_plot_x_13 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_13_in_do), .sa(_sub_plot_x_13_sa), .hikareru(_sub_plot_x_13_hikareru), .moto(_sub_plot_x_13_moto));
sub_plot sub_plot_x_12 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_12_in_do), .sa(_sub_plot_x_12_sa), .hikareru(_sub_plot_x_12_hikareru), .moto(_sub_plot_x_12_moto));
sub_plot sub_plot_x_11 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_11_in_do), .sa(_sub_plot_x_11_sa), .hikareru(_sub_plot_x_11_hikareru), .moto(_sub_plot_x_11_moto));
sub_plot sub_plot_x_10 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_10_in_do), .sa(_sub_plot_x_10_sa), .hikareru(_sub_plot_x_10_hikareru), .moto(_sub_plot_x_10_moto));
sub_plot sub_plot_x_9 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_9_in_do), .sa(_sub_plot_x_9_sa), .hikareru(_sub_plot_x_9_hikareru), .moto(_sub_plot_x_9_moto));
sub_plot sub_plot_x_8 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_8_in_do), .sa(_sub_plot_x_8_sa), .hikareru(_sub_plot_x_8_hikareru), .moto(_sub_plot_x_8_moto));
sub_plot sub_plot_x_7 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_7_in_do), .sa(_sub_plot_x_7_sa), .hikareru(_sub_plot_x_7_hikareru), .moto(_sub_plot_x_7_moto));
sub_plot sub_plot_x_6 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_6_in_do), .sa(_sub_plot_x_6_sa), .hikareru(_sub_plot_x_6_hikareru), .moto(_sub_plot_x_6_moto));
sub_plot sub_plot_x_5 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_5_in_do), .sa(_sub_plot_x_5_sa), .hikareru(_sub_plot_x_5_hikareru), .moto(_sub_plot_x_5_moto));
sub_plot sub_plot_x_4 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_4_in_do), .sa(_sub_plot_x_4_sa), .hikareru(_sub_plot_x_4_hikareru), .moto(_sub_plot_x_4_moto));
sub_plot sub_plot_x_3 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_3_in_do), .sa(_sub_plot_x_3_sa), .hikareru(_sub_plot_x_3_hikareru), .moto(_sub_plot_x_3_moto));
sub_plot sub_plot_x_2 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_2_in_do), .sa(_sub_plot_x_2_sa), .hikareru(_sub_plot_x_2_hikareru), .moto(_sub_plot_x_2_moto));
sub_plot sub_plot_x_1 (.m_clock(m_clock), .p_reset( p_reset), .in_do(_sub_plot_x_1_in_do), .sa(_sub_plot_x_1_sa), .hikareru(_sub_plot_x_1_hikareru), .moto(_sub_plot_x_1_moto));

   assign  _sub_plot_x_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in17:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index17:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_in_do)
  begin
#1 if (_sub_plot_x_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 15 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_in_do = subs_exe;
   assign  _sub_plot_x_p_reset = p_reset;
   assign  _sub_plot_x_m_clock = m_clock;
   assign  _sub_plot_x_97_in_do = 1'b0;
   assign  _sub_plot_x_97_p_reset = p_reset;
   assign  _sub_plot_x_97_m_clock = m_clock;
   assign  _sub_plot_x_96_in_do = 1'b0;
   assign  _sub_plot_x_96_p_reset = p_reset;
   assign  _sub_plot_x_96_m_clock = m_clock;
   assign  _sub_plot_x_95_in_do = 1'b0;
   assign  _sub_plot_x_95_p_reset = p_reset;
   assign  _sub_plot_x_95_m_clock = m_clock;
   assign  _sub_plot_x_94_in_do = 1'b0;
   assign  _sub_plot_x_94_p_reset = p_reset;
   assign  _sub_plot_x_94_m_clock = m_clock;
   assign  _sub_plot_x_93_in_do = 1'b0;
   assign  _sub_plot_x_93_p_reset = p_reset;
   assign  _sub_plot_x_93_m_clock = m_clock;
   assign  _sub_plot_x_92_in_do = 1'b0;
   assign  _sub_plot_x_92_p_reset = p_reset;
   assign  _sub_plot_x_92_m_clock = m_clock;
   assign  _sub_plot_x_91_in_do = 1'b0;
   assign  _sub_plot_x_91_p_reset = p_reset;
   assign  _sub_plot_x_91_m_clock = m_clock;
   assign  _sub_plot_x_90_in_do = 1'b0;
   assign  _sub_plot_x_90_p_reset = p_reset;
   assign  _sub_plot_x_90_m_clock = m_clock;
   assign  _sub_plot_x_89_in_do = 1'b0;
   assign  _sub_plot_x_89_p_reset = p_reset;
   assign  _sub_plot_x_89_m_clock = m_clock;
   assign  _sub_plot_x_88_in_do = 1'b0;
   assign  _sub_plot_x_88_p_reset = p_reset;
   assign  _sub_plot_x_88_m_clock = m_clock;
   assign  _sub_plot_x_87_in_do = 1'b0;
   assign  _sub_plot_x_87_p_reset = p_reset;
   assign  _sub_plot_x_87_m_clock = m_clock;
   assign  _sub_plot_x_86_in_do = 1'b0;
   assign  _sub_plot_x_86_p_reset = p_reset;
   assign  _sub_plot_x_86_m_clock = m_clock;
   assign  _sub_plot_x_85_in_do = 1'b0;
   assign  _sub_plot_x_85_p_reset = p_reset;
   assign  _sub_plot_x_85_m_clock = m_clock;
   assign  _sub_plot_x_84_in_do = 1'b0;
   assign  _sub_plot_x_84_p_reset = p_reset;
   assign  _sub_plot_x_84_m_clock = m_clock;
   assign  _sub_plot_x_83_in_do = 1'b0;
   assign  _sub_plot_x_83_p_reset = p_reset;
   assign  _sub_plot_x_83_m_clock = m_clock;
   assign  _sub_plot_x_82_in_do = 1'b0;
   assign  _sub_plot_x_82_p_reset = p_reset;
   assign  _sub_plot_x_82_m_clock = m_clock;
   assign  _sub_plot_x_81_in_do = 1'b0;
   assign  _sub_plot_x_81_p_reset = p_reset;
   assign  _sub_plot_x_81_m_clock = m_clock;
   assign  _sub_plot_x_80_in_do = 1'b0;
   assign  _sub_plot_x_80_p_reset = p_reset;
   assign  _sub_plot_x_80_m_clock = m_clock;
   assign  _sub_plot_x_79_in_do = 1'b0;
   assign  _sub_plot_x_79_p_reset = p_reset;
   assign  _sub_plot_x_79_m_clock = m_clock;
   assign  _sub_plot_x_78_in_do = 1'b0;
   assign  _sub_plot_x_78_p_reset = p_reset;
   assign  _sub_plot_x_78_m_clock = m_clock;
   assign  _sub_plot_x_77_in_do = 1'b0;
   assign  _sub_plot_x_77_p_reset = p_reset;
   assign  _sub_plot_x_77_m_clock = m_clock;
   assign  _sub_plot_x_76_in_do = 1'b0;
   assign  _sub_plot_x_76_p_reset = p_reset;
   assign  _sub_plot_x_76_m_clock = m_clock;
   assign  _sub_plot_x_75_in_do = 1'b0;
   assign  _sub_plot_x_75_p_reset = p_reset;
   assign  _sub_plot_x_75_m_clock = m_clock;
   assign  _sub_plot_x_74_in_do = 1'b0;
   assign  _sub_plot_x_74_p_reset = p_reset;
   assign  _sub_plot_x_74_m_clock = m_clock;
   assign  _sub_plot_x_73_in_do = 1'b0;
   assign  _sub_plot_x_73_p_reset = p_reset;
   assign  _sub_plot_x_73_m_clock = m_clock;
   assign  _sub_plot_x_72_in_do = 1'b0;
   assign  _sub_plot_x_72_p_reset = p_reset;
   assign  _sub_plot_x_72_m_clock = m_clock;
   assign  _sub_plot_x_71_in_do = 1'b0;
   assign  _sub_plot_x_71_p_reset = p_reset;
   assign  _sub_plot_x_71_m_clock = m_clock;
   assign  _sub_plot_x_70_in_do = 1'b0;
   assign  _sub_plot_x_70_p_reset = p_reset;
   assign  _sub_plot_x_70_m_clock = m_clock;
   assign  _sub_plot_x_69_in_do = 1'b0;
   assign  _sub_plot_x_69_p_reset = p_reset;
   assign  _sub_plot_x_69_m_clock = m_clock;
   assign  _sub_plot_x_68_in_do = 1'b0;
   assign  _sub_plot_x_68_p_reset = p_reset;
   assign  _sub_plot_x_68_m_clock = m_clock;
   assign  _sub_plot_x_67_in_do = 1'b0;
   assign  _sub_plot_x_67_p_reset = p_reset;
   assign  _sub_plot_x_67_m_clock = m_clock;
   assign  _sub_plot_x_66_in_do = 1'b0;
   assign  _sub_plot_x_66_p_reset = p_reset;
   assign  _sub_plot_x_66_m_clock = m_clock;
   assign  _sub_plot_x_65_in_do = 1'b0;
   assign  _sub_plot_x_65_p_reset = p_reset;
   assign  _sub_plot_x_65_m_clock = m_clock;
   assign  _sub_plot_x_64_in_do = 1'b0;
   assign  _sub_plot_x_64_p_reset = p_reset;
   assign  _sub_plot_x_64_m_clock = m_clock;
   assign  _sub_plot_x_63_in_do = 1'b0;
   assign  _sub_plot_x_63_p_reset = p_reset;
   assign  _sub_plot_x_63_m_clock = m_clock;
   assign  _sub_plot_x_62_in_do = 1'b0;
   assign  _sub_plot_x_62_p_reset = p_reset;
   assign  _sub_plot_x_62_m_clock = m_clock;
   assign  _sub_plot_x_61_in_do = 1'b0;
   assign  _sub_plot_x_61_p_reset = p_reset;
   assign  _sub_plot_x_61_m_clock = m_clock;
   assign  _sub_plot_x_60_in_do = 1'b0;
   assign  _sub_plot_x_60_p_reset = p_reset;
   assign  _sub_plot_x_60_m_clock = m_clock;
   assign  _sub_plot_x_59_in_do = 1'b0;
   assign  _sub_plot_x_59_p_reset = p_reset;
   assign  _sub_plot_x_59_m_clock = m_clock;
   assign  _sub_plot_x_58_in_do = 1'b0;
   assign  _sub_plot_x_58_p_reset = p_reset;
   assign  _sub_plot_x_58_m_clock = m_clock;
   assign  _sub_plot_x_57_in_do = 1'b0;
   assign  _sub_plot_x_57_p_reset = p_reset;
   assign  _sub_plot_x_57_m_clock = m_clock;
   assign  _sub_plot_x_56_in_do = 1'b0;
   assign  _sub_plot_x_56_p_reset = p_reset;
   assign  _sub_plot_x_56_m_clock = m_clock;
   assign  _sub_plot_x_55_in_do = 1'b0;
   assign  _sub_plot_x_55_p_reset = p_reset;
   assign  _sub_plot_x_55_m_clock = m_clock;
   assign  _sub_plot_x_54_in_do = 1'b0;
   assign  _sub_plot_x_54_p_reset = p_reset;
   assign  _sub_plot_x_54_m_clock = m_clock;
   assign  _sub_plot_x_53_in_do = 1'b0;
   assign  _sub_plot_x_53_p_reset = p_reset;
   assign  _sub_plot_x_53_m_clock = m_clock;
   assign  _sub_plot_x_52_in_do = 1'b0;
   assign  _sub_plot_x_52_p_reset = p_reset;
   assign  _sub_plot_x_52_m_clock = m_clock;
   assign  _sub_plot_x_51_in_do = 1'b0;
   assign  _sub_plot_x_51_p_reset = p_reset;
   assign  _sub_plot_x_51_m_clock = m_clock;
   assign  _sub_plot_x_50_in_do = 1'b0;
   assign  _sub_plot_x_50_p_reset = p_reset;
   assign  _sub_plot_x_50_m_clock = m_clock;
   assign  _sub_plot_x_49_in_do = 1'b0;
   assign  _sub_plot_x_49_p_reset = p_reset;
   assign  _sub_plot_x_49_m_clock = m_clock;
   assign  _sub_plot_x_48_in_do = 1'b0;
   assign  _sub_plot_x_48_p_reset = p_reset;
   assign  _sub_plot_x_48_m_clock = m_clock;
   assign  _sub_plot_x_47_in_do = 1'b0;
   assign  _sub_plot_x_47_p_reset = p_reset;
   assign  _sub_plot_x_47_m_clock = m_clock;
   assign  _sub_plot_x_46_in_do = 1'b0;
   assign  _sub_plot_x_46_p_reset = p_reset;
   assign  _sub_plot_x_46_m_clock = m_clock;
   assign  _sub_plot_x_45_in_do = 1'b0;
   assign  _sub_plot_x_45_p_reset = p_reset;
   assign  _sub_plot_x_45_m_clock = m_clock;
   assign  _sub_plot_x_44_in_do = 1'b0;
   assign  _sub_plot_x_44_p_reset = p_reset;
   assign  _sub_plot_x_44_m_clock = m_clock;
   assign  _sub_plot_x_43_in_do = 1'b0;
   assign  _sub_plot_x_43_p_reset = p_reset;
   assign  _sub_plot_x_43_m_clock = m_clock;
   assign  _sub_plot_x_42_in_do = 1'b0;
   assign  _sub_plot_x_42_p_reset = p_reset;
   assign  _sub_plot_x_42_m_clock = m_clock;
   assign  _sub_plot_x_41_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in109:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_41_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index109:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_41_in_do)
  begin
#1 if (_sub_plot_x_41_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_41_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 56 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_41_in_do = subs_exe;
   assign  _sub_plot_x_41_p_reset = p_reset;
   assign  _sub_plot_x_41_m_clock = m_clock;
   assign  _sub_plot_x_40_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in107:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_40_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index107:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_40_in_do)
  begin
#1 if (_sub_plot_x_40_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_40_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 55 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_40_in_do = subs_exe;
   assign  _sub_plot_x_40_p_reset = p_reset;
   assign  _sub_plot_x_40_m_clock = m_clock;
   assign  _sub_plot_x_39_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in105:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_39_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index105:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_39_in_do)
  begin
#1 if (_sub_plot_x_39_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_39_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 54 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_39_in_do = subs_exe;
   assign  _sub_plot_x_39_p_reset = p_reset;
   assign  _sub_plot_x_39_m_clock = m_clock;
   assign  _sub_plot_x_38_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in103:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_38_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index103:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_38_in_do)
  begin
#1 if (_sub_plot_x_38_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_38_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 53 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_38_in_do = subs_exe;
   assign  _sub_plot_x_38_p_reset = p_reset;
   assign  _sub_plot_x_38_m_clock = m_clock;
   assign  _sub_plot_x_37_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in101:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_37_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index101:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_37_in_do)
  begin
#1 if (_sub_plot_x_37_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_37_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 52 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_37_in_do = subs_exe;
   assign  _sub_plot_x_37_p_reset = p_reset;
   assign  _sub_plot_x_37_m_clock = m_clock;
   assign  _sub_plot_x_36_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in99:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_36_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index99:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_36_in_do)
  begin
#1 if (_sub_plot_x_36_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_36_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 51 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_36_in_do = subs_exe;
   assign  _sub_plot_x_36_p_reset = p_reset;
   assign  _sub_plot_x_36_m_clock = m_clock;
   assign  _sub_plot_x_35_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in97:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_35_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index97:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_35_in_do)
  begin
#1 if (_sub_plot_x_35_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_35_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 50 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_35_in_do = subs_exe;
   assign  _sub_plot_x_35_p_reset = p_reset;
   assign  _sub_plot_x_35_m_clock = m_clock;
   assign  _sub_plot_x_34_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in93:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_34_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index93:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_34_in_do)
  begin
#1 if (_sub_plot_x_34_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_34_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 49 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_34_in_do = subs_exe;
   assign  _sub_plot_x_34_p_reset = p_reset;
   assign  _sub_plot_x_34_m_clock = m_clock;
   assign  _sub_plot_x_33_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in91:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_33_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index91:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_33_in_do)
  begin
#1 if (_sub_plot_x_33_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_33_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 48 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_33_in_do = subs_exe;
   assign  _sub_plot_x_33_p_reset = p_reset;
   assign  _sub_plot_x_33_m_clock = m_clock;
   assign  _sub_plot_x_32_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in89:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_32_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index89:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_32_in_do)
  begin
#1 if (_sub_plot_x_32_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_32_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 47 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_32_in_do = subs_exe;
   assign  _sub_plot_x_32_p_reset = p_reset;
   assign  _sub_plot_x_32_m_clock = m_clock;
   assign  _sub_plot_x_31_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in87:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_31_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index87:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_31_in_do)
  begin
#1 if (_sub_plot_x_31_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_31_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 46 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_31_in_do = subs_exe;
   assign  _sub_plot_x_31_p_reset = p_reset;
   assign  _sub_plot_x_31_m_clock = m_clock;
   assign  _sub_plot_x_30_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in85:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_30_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index85:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_30_in_do)
  begin
#1 if (_sub_plot_x_30_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_30_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 45 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_30_in_do = subs_exe;
   assign  _sub_plot_x_30_p_reset = p_reset;
   assign  _sub_plot_x_30_m_clock = m_clock;
   assign  _sub_plot_x_29_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in83:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_29_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index83:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_29_in_do)
  begin
#1 if (_sub_plot_x_29_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_29_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 44 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_29_in_do = subs_exe;
   assign  _sub_plot_x_29_p_reset = p_reset;
   assign  _sub_plot_x_29_m_clock = m_clock;
   assign  _sub_plot_x_28_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in81:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_28_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index81:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_28_in_do)
  begin
#1 if (_sub_plot_x_28_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_28_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 43 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_28_in_do = subs_exe;
   assign  _sub_plot_x_28_p_reset = p_reset;
   assign  _sub_plot_x_28_m_clock = m_clock;
   assign  _sub_plot_x_27_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in77:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_27_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index77:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_27_in_do)
  begin
#1 if (_sub_plot_x_27_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_27_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 42 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_27_in_do = subs_exe;
   assign  _sub_plot_x_27_p_reset = p_reset;
   assign  _sub_plot_x_27_m_clock = m_clock;
   assign  _sub_plot_x_26_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in75:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_26_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index75:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_26_in_do)
  begin
#1 if (_sub_plot_x_26_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_26_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 41 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_26_in_do = subs_exe;
   assign  _sub_plot_x_26_p_reset = p_reset;
   assign  _sub_plot_x_26_m_clock = m_clock;
   assign  _sub_plot_x_25_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in73:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_25_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index73:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_25_in_do)
  begin
#1 if (_sub_plot_x_25_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_25_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 40 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_25_in_do = subs_exe;
   assign  _sub_plot_x_25_p_reset = p_reset;
   assign  _sub_plot_x_25_m_clock = m_clock;
   assign  _sub_plot_x_24_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in71:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_24_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index71:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_24_in_do)
  begin
#1 if (_sub_plot_x_24_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_24_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 39 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_24_in_do = subs_exe;
   assign  _sub_plot_x_24_p_reset = p_reset;
   assign  _sub_plot_x_24_m_clock = m_clock;
   assign  _sub_plot_x_23_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in69:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_23_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index69:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_23_in_do)
  begin
#1 if (_sub_plot_x_23_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_23_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 38 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_23_in_do = subs_exe;
   assign  _sub_plot_x_23_p_reset = p_reset;
   assign  _sub_plot_x_23_m_clock = m_clock;
   assign  _sub_plot_x_22_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in67:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_22_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index67:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_22_in_do)
  begin
#1 if (_sub_plot_x_22_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_22_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 37 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_22_in_do = subs_exe;
   assign  _sub_plot_x_22_p_reset = p_reset;
   assign  _sub_plot_x_22_m_clock = m_clock;
   assign  _sub_plot_x_21_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in65:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_21_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index65:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_21_in_do)
  begin
#1 if (_sub_plot_x_21_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_21_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 36 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_21_in_do = subs_exe;
   assign  _sub_plot_x_21_p_reset = p_reset;
   assign  _sub_plot_x_21_m_clock = m_clock;
   assign  _sub_plot_x_20_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in61:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_20_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index61:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_20_in_do)
  begin
#1 if (_sub_plot_x_20_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_20_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 35 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_20_in_do = subs_exe;
   assign  _sub_plot_x_20_p_reset = p_reset;
   assign  _sub_plot_x_20_m_clock = m_clock;
   assign  _sub_plot_x_19_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in59:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_19_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index59:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_19_in_do)
  begin
#1 if (_sub_plot_x_19_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_19_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 34 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_19_in_do = subs_exe;
   assign  _sub_plot_x_19_p_reset = p_reset;
   assign  _sub_plot_x_19_m_clock = m_clock;
   assign  _sub_plot_x_18_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in57:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_18_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index57:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_18_in_do)
  begin
#1 if (_sub_plot_x_18_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_18_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 33 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_18_in_do = subs_exe;
   assign  _sub_plot_x_18_p_reset = p_reset;
   assign  _sub_plot_x_18_m_clock = m_clock;
   assign  _sub_plot_x_17_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in55:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_17_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index55:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_17_in_do)
  begin
#1 if (_sub_plot_x_17_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_17_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 32 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_17_in_do = subs_exe;
   assign  _sub_plot_x_17_p_reset = p_reset;
   assign  _sub_plot_x_17_m_clock = m_clock;
   assign  _sub_plot_x_16_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in53:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_16_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index53:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_16_in_do)
  begin
#1 if (_sub_plot_x_16_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_16_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 31 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_16_in_do = subs_exe;
   assign  _sub_plot_x_16_p_reset = p_reset;
   assign  _sub_plot_x_16_m_clock = m_clock;
   assign  _sub_plot_x_15_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in51:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_15_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index51:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_15_in_do)
  begin
#1 if (_sub_plot_x_15_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_15_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 30 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_15_in_do = subs_exe;
   assign  _sub_plot_x_15_p_reset = p_reset;
   assign  _sub_plot_x_15_m_clock = m_clock;
   assign  _sub_plot_x_14_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in49:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_14_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index49:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_14_in_do)
  begin
#1 if (_sub_plot_x_14_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_14_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 29 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_14_in_do = subs_exe;
   assign  _sub_plot_x_14_p_reset = p_reset;
   assign  _sub_plot_x_14_m_clock = m_clock;
   assign  _sub_plot_x_13_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in45:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_13_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index45:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_13_in_do)
  begin
#1 if (_sub_plot_x_13_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_13_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 28 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_13_in_do = subs_exe;
   assign  _sub_plot_x_13_p_reset = p_reset;
   assign  _sub_plot_x_13_m_clock = m_clock;
   assign  _sub_plot_x_12_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in43:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_12_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index43:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_12_in_do)
  begin
#1 if (_sub_plot_x_12_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_12_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 27 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_12_in_do = subs_exe;
   assign  _sub_plot_x_12_p_reset = p_reset;
   assign  _sub_plot_x_12_m_clock = m_clock;
   assign  _sub_plot_x_11_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in41:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_11_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index41:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_11_in_do)
  begin
#1 if (_sub_plot_x_11_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_11_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 26 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_11_in_do = subs_exe;
   assign  _sub_plot_x_11_p_reset = p_reset;
   assign  _sub_plot_x_11_m_clock = m_clock;
   assign  _sub_plot_x_10_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in39:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_10_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index39:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_10_in_do)
  begin
#1 if (_sub_plot_x_10_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_10_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 25 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_10_in_do = subs_exe;
   assign  _sub_plot_x_10_p_reset = p_reset;
   assign  _sub_plot_x_10_m_clock = m_clock;
   assign  _sub_plot_x_9_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in37:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_9_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index37:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_9_in_do)
  begin
#1 if (_sub_plot_x_9_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_9_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 24 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_9_in_do = subs_exe;
   assign  _sub_plot_x_9_p_reset = p_reset;
   assign  _sub_plot_x_9_m_clock = m_clock;
   assign  _sub_plot_x_8_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in35:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_8_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index35:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_8_in_do)
  begin
#1 if (_sub_plot_x_8_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_8_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 23 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_8_in_do = subs_exe;
   assign  _sub_plot_x_8_p_reset = p_reset;
   assign  _sub_plot_x_8_m_clock = m_clock;
   assign  _sub_plot_x_7_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in33:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_7_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index33:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_7_in_do)
  begin
#1 if (_sub_plot_x_7_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_7_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 22 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_7_in_do = subs_exe;
   assign  _sub_plot_x_7_p_reset = p_reset;
   assign  _sub_plot_x_7_m_clock = m_clock;
   assign  _sub_plot_x_6_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in29:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_6_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index29:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_6_in_do)
  begin
#1 if (_sub_plot_x_6_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_6_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 21 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_6_in_do = subs_exe;
   assign  _sub_plot_x_6_p_reset = p_reset;
   assign  _sub_plot_x_6_m_clock = m_clock;
   assign  _sub_plot_x_5_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in27:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_5_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index27:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_5_in_do)
  begin
#1 if (_sub_plot_x_5_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_5_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 20 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_5_in_do = subs_exe;
   assign  _sub_plot_x_5_p_reset = p_reset;
   assign  _sub_plot_x_5_m_clock = m_clock;
   assign  _sub_plot_x_4_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in25:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_4_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index25:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_4_in_do)
  begin
#1 if (_sub_plot_x_4_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_4_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 19 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_4_in_do = subs_exe;
   assign  _sub_plot_x_4_p_reset = p_reset;
   assign  _sub_plot_x_4_m_clock = m_clock;
   assign  _sub_plot_x_3_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in23:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_3_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index23:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_3_in_do)
  begin
#1 if (_sub_plot_x_3_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_3_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 18 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_3_in_do = subs_exe;
   assign  _sub_plot_x_3_p_reset = p_reset;
   assign  _sub_plot_x_3_m_clock = m_clock;
   assign  _sub_plot_x_2_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in21:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_2_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index21:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_2_in_do)
  begin
#1 if (_sub_plot_x_2_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_2_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 17 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_2_in_do = subs_exe;
   assign  _sub_plot_x_2_p_reset = p_reset;
   assign  _sub_plot_x_2_m_clock = m_clock;
   assign  _sub_plot_x_1_hikareru = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_in19:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _sub_plot_x_1_moto = 
// synthesis translate_off
// synopsys translate_off
(subs_exe)? 
// synthesis translate_on
// synopsys translate_on
((subs_exe)?data_index19:10'b0)
// synthesis translate_off
// synopsys translate_off
:10'bx
// synthesis translate_on
// synopsys translate_on
;

// synthesis translate_off
// synopsys translate_off
always @(posedge _sub_plot_x_1_in_do)
  begin
#1 if (_sub_plot_x_1_in_do===1'bx)
 begin
$display("Warning: control hazard(subs:_sub_plot_x_1_in_do) at %d",$time);
 end
#1 if (((subs_exe)===1'bx) || (1'b1)===1'bx) $display("hazard (subs_exe || 1'b1) line 16 at %d\n",$time);
 end

// synthesis translate_on
// synopsys translate_on
   assign  _sub_plot_x_1_in_do = subs_exe;
   assign  _sub_plot_x_1_p_reset = p_reset;
   assign  _sub_plot_x_1_m_clock = m_clock;
   assign  sub_array_out = sub_reg;
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     sub_reg <= 8'b00000000;
else if (subs_exe)
      sub_reg <= (((((((((((((((((((((((((((((((((((((((((_sub_plot_x_sa|_sub_plot_x_1_sa)|_sub_plot_x_2_sa)|_sub_plot_x_3_sa)|_sub_plot_x_4_sa)|_sub_plot_x_5_sa)|_sub_plot_x_6_sa)|_sub_plot_x_7_sa)|_sub_plot_x_8_sa)|_sub_plot_x_9_sa)|_sub_plot_x_10_sa)|_sub_plot_x_11_sa)|_sub_plot_x_12_sa)|_sub_plot_x_13_sa)|_sub_plot_x_14_sa)|_sub_plot_x_15_sa)|_sub_plot_x_16_sa)|_sub_plot_x_17_sa)|_sub_plot_x_18_sa)|_sub_plot_x_19_sa)|_sub_plot_x_20_sa)|_sub_plot_x_21_sa)|_sub_plot_x_22_sa)|_sub_plot_x_23_sa)|_sub_plot_x_24_sa)|_sub_plot_x_25_sa)|_sub_plot_x_26_sa)|_sub_plot_x_27_sa)|_sub_plot_x_28_sa)|_sub_plot_x_29_sa)|_sub_plot_x_30_sa)|_sub_plot_x_31_sa)|_sub_plot_x_32_sa)|_sub_plot_x_33_sa)|_sub_plot_x_34_sa)|_sub_plot_x_35_sa)|_sub_plot_x_36_sa)|_sub_plot_x_37_sa)|_sub_plot_x_38_sa)|_sub_plot_x_39_sa)|_sub_plot_x_40_sa)|_sub_plot_x_41_sa);
end
endmodule

/*Produced by NSL Core(version=20221225), IP ARCH, Inc. Sat Apr 27 08:50:05 2024
 Licensed to :EVALUATION USER*/
