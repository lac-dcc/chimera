// This program was cloned from: https://github.com/psychogenic/tt06-analog-wowa
// License: Apache License 2.0

// This is the unpowered netlist.
module wowa_digital (analog_comparator_out,
    calib_enable,
    clk,
    comparator_nen,
    do_calibrate,
    result_ready,
    rst,
    thresh_sel,
    use_ext_thresh,
    user_enable,
    dac_set,
    result);
 input analog_comparator_out;
 input calib_enable;
 input clk;
 output comparator_nen;
 output do_calibrate;
 output result_ready;
 input rst;
 output thresh_sel;
 input use_ext_thresh;
 input user_enable;
 output [7:0] dac_set;
 output [7:0] result;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire \adc.comparator.compres.ffsync.stage0 ;
 wire \adc.comparator.compres.ffsync.stage1 ;
 wire \adc.internalCounter[0] ;
 wire \adc.internalCounter[1] ;
 wire \adc.internalCounter[2] ;
 wire \adc.internalCounter[3] ;
 wire \adc.internalCounter[4] ;
 wire \adc.state[0] ;
 wire \adc.state[1] ;
 wire \adc.state[2] ;
 wire \adc.state[3] ;
 wire \adc.syncroCount[0] ;
 wire \adc.syncroCount[1] ;
 wire clknet_0_clk;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__diode_2 ANTENNA_1 (.DIODE(use_ext_thresh));
 sky130_fd_sc_hd__fill_2 FILLER_0_0_102 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_111 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_12 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_120 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_133 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_16 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_38 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_48 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_57 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_76 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_81 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_0_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_94 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_129 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_43 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_67 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_90 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_98 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_104 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_121 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_136 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_11_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_67 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_90 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11_98 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_100 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_112 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_136 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_56 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_83 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_12_92 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_17 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_26 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_13_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_47 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_7 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_13_88 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_94 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_124 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_136 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_14_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_14_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_14_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_14_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_14_82 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_15_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_113 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_15_129 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_15_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_34 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_38 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_66 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_15_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_15_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_15_89 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_102 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_16_132 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_16_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_33 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_43 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_16_61 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_16_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_16_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_16_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_16_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_100 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_17_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_17_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_17_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_17_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_17_77 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_17_89 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_18_129 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_18_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_18_44 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_18_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18_63 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_18_70 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_18_78 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_18_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_19_122 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_19_134 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_19_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_19_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_19_52 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_19_9 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_1_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_1_35 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_63 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_79 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_1_87 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_20_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_20_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_63 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_20_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_20_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_9 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_20_99 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_21_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_19 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_21_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_21_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_21_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_68 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_21_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_10 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_103 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_111 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_116 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_120 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_124 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_22_136 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_14 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_25 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_22_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_6 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_22_60 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_22_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_22_80 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_22_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_22_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_117 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_129 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_137 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_119 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_136 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_42 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_63 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_3_90 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_104 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_116 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_60 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_72 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_4_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_100 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_108 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_129 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_137 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_5_28 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_61 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_73 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_5_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_122 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_134 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_35 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_68 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_6_80 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_92 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_137 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_72 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_9 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_104 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_132 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_48 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_72 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_90 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_96 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_9_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_53 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_61 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_76 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_9 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_92 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_39 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_40 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_41 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_42 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_43 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_44 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Left_45 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_22_Right_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_22_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_67 ();
 sky130_fd_sc_hd__buf_2 _177_ (.A(\adc.state[1] ),
    .X(_142_));
 sky130_fd_sc_hd__buf_2 _178_ (.A(\adc.state[0] ),
    .X(_143_));
 sky130_fd_sc_hd__nand2_1 _179_ (.A(_142_),
    .B(_143_),
    .Y(_144_));
 sky130_fd_sc_hd__buf_2 _180_ (.A(\adc.state[3] ),
    .X(_145_));
 sky130_fd_sc_hd__or2_1 _181_ (.A(_145_),
    .B(\adc.state[2] ),
    .X(_146_));
 sky130_fd_sc_hd__or2_1 _182_ (.A(_144_),
    .B(_146_),
    .X(_147_));
 sky130_fd_sc_hd__buf_2 _183_ (.A(_147_),
    .X(_148_));
 sky130_fd_sc_hd__inv_2 _184_ (.A(\adc.internalCounter[2] ),
    .Y(_149_));
 sky130_fd_sc_hd__nor2_1 _185_ (.A(\adc.internalCounter[4] ),
    .B(\adc.internalCounter[3] ),
    .Y(_150_));
 sky130_fd_sc_hd__nand4b_4 _186_ (.A_N(_145_),
    .B(\adc.state[2] ),
    .C(_142_),
    .D(\adc.state[0] ),
    .Y(_151_));
 sky130_fd_sc_hd__nor2_1 _187_ (.A(\adc.comparator.compres.ffsync.stage1 ),
    .B(_151_),
    .Y(_152_));
 sky130_fd_sc_hd__buf_2 _188_ (.A(\adc.internalCounter[1] ),
    .X(_153_));
 sky130_fd_sc_hd__inv_2 _189_ (.A(_153_),
    .Y(_154_));
 sky130_fd_sc_hd__buf_2 _190_ (.A(\adc.internalCounter[0] ),
    .X(_155_));
 sky130_fd_sc_hd__nor2_1 _191_ (.A(_154_),
    .B(_155_),
    .Y(_156_));
 sky130_fd_sc_hd__and4_1 _192_ (.A(_149_),
    .B(_150_),
    .C(_152_),
    .D(_156_),
    .X(_157_));
 sky130_fd_sc_hd__or4b_1 _193_ (.A(_145_),
    .B(\adc.state[2] ),
    .C(\adc.state[1] ),
    .D_N(\adc.state[0] ),
    .X(_158_));
 sky130_fd_sc_hd__dlymetal6s2s_1 _194_ (.A(_158_),
    .X(_159_));
 sky130_fd_sc_hd__inv_2 _195_ (.A(net4),
    .Y(_160_));
 sky130_fd_sc_hd__o32ai_1 _196_ (.A1(\adc.comparator.compres.ffsync.stage1 ),
    .A2(_151_),
    .A3(_150_),
    .B1(_159_),
    .B2(_160_),
    .Y(_161_));
 sky130_fd_sc_hd__a41o_1 _197_ (.A1(_149_),
    .A2(_154_),
    .A3(_150_),
    .A4(_152_),
    .B1(_161_),
    .X(_162_));
 sky130_fd_sc_hd__and4bb_1 _198_ (.A_N(_145_),
    .B_N(\adc.state[2] ),
    .C(_142_),
    .D(_143_),
    .X(_163_));
 sky130_fd_sc_hd__nor2_1 _199_ (.A(_142_),
    .B(_143_),
    .Y(_164_));
 sky130_fd_sc_hd__a211o_1 _200_ (.A1(_142_),
    .A2(_143_),
    .B1(_145_),
    .C1(\adc.state[2] ),
    .X(_165_));
 sky130_fd_sc_hd__o21ai_1 _201_ (.A1(_164_),
    .A2(_165_),
    .B1(_151_),
    .Y(_166_));
 sky130_fd_sc_hd__or2_2 _202_ (.A(\adc.internalCounter[4] ),
    .B(\adc.internalCounter[3] ),
    .X(_167_));
 sky130_fd_sc_hd__nand2_1 _203_ (.A(_163_),
    .B(_167_),
    .Y(_168_));
 sky130_fd_sc_hd__and4b_2 _204_ (.A_N(_145_),
    .B(\adc.state[2] ),
    .C(_142_),
    .D(_143_),
    .X(_169_));
 sky130_fd_sc_hd__or4b_1 _205_ (.A(\adc.state[3] ),
    .B(\adc.state[2] ),
    .C(\adc.state[0] ),
    .D_N(\adc.state[1] ),
    .X(_170_));
 sky130_fd_sc_hd__clkbuf_2 _206_ (.A(_170_),
    .X(_171_));
 sky130_fd_sc_hd__and4_2 _207_ (.A(\adc.internalCounter[4] ),
    .B(\adc.internalCounter[3] ),
    .C(\adc.internalCounter[2] ),
    .D(\adc.internalCounter[1] ),
    .X(_172_));
 sky130_fd_sc_hd__o2bb2a_1 _208_ (.A1_N(\adc.comparator.compres.ffsync.stage1 ),
    .A2_N(_169_),
    .B1(_171_),
    .B2(_172_),
    .X(_173_));
 sky130_fd_sc_hd__o211a_1 _209_ (.A1(_163_),
    .A2(_166_),
    .B1(_168_),
    .C1(_173_),
    .X(_174_));
 sky130_fd_sc_hd__nor3b_2 _210_ (.A(_157_),
    .B(_162_),
    .C_N(_174_),
    .Y(_175_));
 sky130_fd_sc_hd__or3_2 _211_ (.A(\adc.internalCounter[4] ),
    .B(\adc.internalCounter[3] ),
    .C(\adc.internalCounter[2] ),
    .X(_176_));
 sky130_fd_sc_hd__nand2_1 _212_ (.A(_153_),
    .B(_155_),
    .Y(_030_));
 sky130_fd_sc_hd__or4_4 _213_ (.A(\adc.comparator.compres.ffsync.stage1 ),
    .B(_151_),
    .C(_176_),
    .D(_030_),
    .X(_031_));
 sky130_fd_sc_hd__and2_1 _214_ (.A(_154_),
    .B(_155_),
    .X(_032_));
 sky130_fd_sc_hd__or3b_1 _215_ (.A(\adc.internalCounter[4] ),
    .B(\adc.internalCounter[3] ),
    .C_N(\adc.internalCounter[2] ),
    .X(_033_));
 sky130_fd_sc_hd__a2111o_2 _216_ (.A1(\adc.state[2] ),
    .A2(\adc.comparator.compres.ffsync.stage1 ),
    .B1(_144_),
    .C1(_033_),
    .D1(_145_),
    .X(_034_));
 sky130_fd_sc_hd__or2_1 _217_ (.A(_032_),
    .B(_034_),
    .X(_035_));
 sky130_fd_sc_hd__clkbuf_4 _218_ (.A(net3),
    .X(_036_));
 sky130_fd_sc_hd__a41o_1 _219_ (.A1(_148_),
    .A2(_175_),
    .A3(_031_),
    .A4(_035_),
    .B1(_036_),
    .X(_037_));
 sky130_fd_sc_hd__or2_2 _220_ (.A(_147_),
    .B(_176_),
    .X(_038_));
 sky130_fd_sc_hd__a41o_1 _221_ (.A1(_175_),
    .A2(_031_),
    .A3(_038_),
    .A4(_035_),
    .B1(net20),
    .X(_039_));
 sky130_fd_sc_hd__and2b_1 _222_ (.A_N(_037_),
    .B(_039_),
    .X(_040_));
 sky130_fd_sc_hd__clkbuf_1 _223_ (.A(_040_),
    .X(_000_));
 sky130_fd_sc_hd__nor2_1 _224_ (.A(_162_),
    .B(_157_),
    .Y(_041_));
 sky130_fd_sc_hd__or3_1 _225_ (.A(\adc.comparator.compres.ffsync.stage1 ),
    .B(_151_),
    .C(_033_),
    .X(_042_));
 sky130_fd_sc_hd__o211a_1 _226_ (.A1(_153_),
    .A2(_042_),
    .B1(_031_),
    .C1(_174_),
    .X(_043_));
 sky130_fd_sc_hd__or3_1 _227_ (.A(_153_),
    .B(_147_),
    .C(_033_),
    .X(_044_));
 sky130_fd_sc_hd__o211a_1 _228_ (.A1(_030_),
    .A2(_034_),
    .B1(_044_),
    .C1(_038_),
    .X(_045_));
 sky130_fd_sc_hd__a41o_1 _229_ (.A1(_148_),
    .A2(_041_),
    .A3(_043_),
    .A4(_045_),
    .B1(_036_),
    .X(_046_));
 sky130_fd_sc_hd__a31o_1 _230_ (.A1(_041_),
    .A2(_043_),
    .A3(_045_),
    .B1(net21),
    .X(_047_));
 sky130_fd_sc_hd__and2b_1 _231_ (.A_N(_046_),
    .B(_047_),
    .X(_048_));
 sky130_fd_sc_hd__clkbuf_1 _232_ (.A(_048_),
    .X(_001_));
 sky130_fd_sc_hd__nor2_1 _233_ (.A(_160_),
    .B(_159_),
    .Y(_049_));
 sky130_fd_sc_hd__a21oi_2 _234_ (.A1(_167_),
    .A2(_152_),
    .B1(_049_),
    .Y(_050_));
 sky130_fd_sc_hd__or3_1 _235_ (.A(_154_),
    .B(_155_),
    .C(_042_),
    .X(_051_));
 sky130_fd_sc_hd__o2111a_2 _236_ (.A1(_153_),
    .A2(_042_),
    .B1(_051_),
    .C1(_174_),
    .D1(_031_),
    .X(_052_));
 sky130_fd_sc_hd__nor2_1 _237_ (.A(_153_),
    .B(_155_),
    .Y(_053_));
 sky130_fd_sc_hd__and2_1 _238_ (.A(_153_),
    .B(_155_),
    .X(_054_));
 sky130_fd_sc_hd__a21o_1 _239_ (.A1(\adc.internalCounter[1] ),
    .A2(\adc.internalCounter[0] ),
    .B1(\adc.internalCounter[2] ),
    .X(_055_));
 sky130_fd_sc_hd__nand3_2 _240_ (.A(\adc.internalCounter[2] ),
    .B(\adc.internalCounter[1] ),
    .C(\adc.internalCounter[0] ),
    .Y(_056_));
 sky130_fd_sc_hd__and4_1 _241_ (.A(_163_),
    .B(_150_),
    .C(_055_),
    .D(_056_),
    .X(_057_));
 sky130_fd_sc_hd__o21ba_1 _242_ (.A1(_030_),
    .A2(_034_),
    .B1_N(_057_),
    .X(_058_));
 sky130_fd_sc_hd__or2_1 _243_ (.A(_153_),
    .B(\adc.internalCounter[0] ),
    .X(_059_));
 sky130_fd_sc_hd__o21ai_2 _244_ (.A1(_176_),
    .A2(_059_),
    .B1(_169_),
    .Y(_060_));
 sky130_fd_sc_hd__o311a_1 _245_ (.A1(_053_),
    .A2(_054_),
    .A3(_038_),
    .B1(_058_),
    .C1(_060_),
    .X(_061_));
 sky130_fd_sc_hd__a41o_1 _246_ (.A1(_148_),
    .A2(_050_),
    .A3(_052_),
    .A4(_061_),
    .B1(_036_),
    .X(_062_));
 sky130_fd_sc_hd__a31o_1 _247_ (.A1(_050_),
    .A2(_052_),
    .A3(_061_),
    .B1(net15),
    .X(_063_));
 sky130_fd_sc_hd__and2b_1 _248_ (.A_N(_062_),
    .B(_063_),
    .X(_064_));
 sky130_fd_sc_hd__clkbuf_1 _249_ (.A(_064_),
    .X(_002_));
 sky130_fd_sc_hd__or2_1 _250_ (.A(_155_),
    .B(_151_),
    .X(_065_));
 sky130_fd_sc_hd__o211a_1 _251_ (.A1(_155_),
    .A2(_038_),
    .B1(_058_),
    .C1(_065_),
    .X(_066_));
 sky130_fd_sc_hd__a41o_1 _252_ (.A1(_148_),
    .A2(_050_),
    .A3(_052_),
    .A4(_066_),
    .B1(net3),
    .X(_067_));
 sky130_fd_sc_hd__a31o_1 _253_ (.A1(_050_),
    .A2(_052_),
    .A3(_066_),
    .B1(net16),
    .X(_068_));
 sky130_fd_sc_hd__and2b_1 _254_ (.A_N(_067_),
    .B(_068_),
    .X(_069_));
 sky130_fd_sc_hd__clkbuf_1 _255_ (.A(_069_),
    .X(_003_));
 sky130_fd_sc_hd__o21ba_1 _256_ (.A1(_153_),
    .A2(_038_),
    .B1_N(_162_),
    .X(_070_));
 sky130_fd_sc_hd__a41o_1 _257_ (.A1(_148_),
    .A2(_052_),
    .A3(_058_),
    .A4(_070_),
    .B1(net3),
    .X(_071_));
 sky130_fd_sc_hd__a31o_1 _258_ (.A1(_052_),
    .A2(_058_),
    .A3(_070_),
    .B1(net17),
    .X(_072_));
 sky130_fd_sc_hd__and2b_1 _259_ (.A_N(_071_),
    .B(_072_),
    .X(_073_));
 sky130_fd_sc_hd__clkbuf_1 _260_ (.A(_073_),
    .X(_004_));
 sky130_fd_sc_hd__inv_2 _261_ (.A(\adc.syncroCount[0] ),
    .Y(_074_));
 sky130_fd_sc_hd__or2b_1 _262_ (.A(_145_),
    .B_N(\adc.state[2] ),
    .X(_075_));
 sky130_fd_sc_hd__or3b_1 _263_ (.A(_143_),
    .B(_075_),
    .C_N(_142_),
    .X(_076_));
 sky130_fd_sc_hd__and2_1 _264_ (.A(_142_),
    .B(_143_),
    .X(_077_));
 sky130_fd_sc_hd__or3_1 _265_ (.A(_077_),
    .B(_075_),
    .C(_164_),
    .X(_078_));
 sky130_fd_sc_hd__nor2_1 _266_ (.A(_074_),
    .B(_078_),
    .Y(_079_));
 sky130_fd_sc_hd__a211oi_1 _267_ (.A1(_074_),
    .A2(_076_),
    .B1(_079_),
    .C1(_036_),
    .Y(_005_));
 sky130_fd_sc_hd__a21oi_1 _268_ (.A1(\adc.syncroCount[1] ),
    .A2(\adc.syncroCount[0] ),
    .B1(_076_),
    .Y(_080_));
 sky130_fd_sc_hd__inv_2 _269_ (.A(net3),
    .Y(_081_));
 sky130_fd_sc_hd__o221a_1 _270_ (.A1(\adc.syncroCount[1] ),
    .A2(_079_),
    .B1(_080_),
    .B2(_078_),
    .C1(_081_),
    .X(_006_));
 sky130_fd_sc_hd__or3_2 _271_ (.A(_151_),
    .B(_176_),
    .C(_059_),
    .X(_082_));
 sky130_fd_sc_hd__inv_2 _272_ (.A(_082_),
    .Y(_083_));
 sky130_fd_sc_hd__clkbuf_4 _273_ (.A(_081_),
    .X(_084_));
 sky130_fd_sc_hd__o211a_1 _274_ (.A1(net23),
    .A2(_083_),
    .B1(_171_),
    .C1(_084_),
    .X(_007_));
 sky130_fd_sc_hd__nor2_1 _275_ (.A(_149_),
    .B(_030_),
    .Y(_085_));
 sky130_fd_sc_hd__o311a_1 _276_ (.A1(_148_),
    .A2(_167_),
    .A3(_085_),
    .B1(_052_),
    .C1(_041_),
    .X(_086_));
 sky130_fd_sc_hd__a31o_1 _277_ (.A1(_148_),
    .A2(_041_),
    .A3(_052_),
    .B1(_036_),
    .X(_087_));
 sky130_fd_sc_hd__o21ba_1 _278_ (.A1(net22),
    .A2(_086_),
    .B1_N(_087_),
    .X(_008_));
 sky130_fd_sc_hd__o211a_2 _279_ (.A1(net4),
    .A2(_159_),
    .B1(_082_),
    .C1(_166_),
    .X(_088_));
 sky130_fd_sc_hd__inv_2 _280_ (.A(_172_),
    .Y(_089_));
 sky130_fd_sc_hd__a22o_1 _281_ (.A1(_155_),
    .A2(_089_),
    .B1(_065_),
    .B2(_171_),
    .X(_090_));
 sky130_fd_sc_hd__nand2_1 _282_ (.A(_088_),
    .B(_090_),
    .Y(_091_));
 sky130_fd_sc_hd__o211a_1 _283_ (.A1(_155_),
    .A2(_088_),
    .B1(_091_),
    .C1(_084_),
    .X(_009_));
 sky130_fd_sc_hd__or3b_1 _284_ (.A(net2),
    .B(_169_),
    .C_N(_171_),
    .X(_092_));
 sky130_fd_sc_hd__nand2_1 _285_ (.A(_088_),
    .B(_092_),
    .Y(_093_));
 sky130_fd_sc_hd__nor3_1 _286_ (.A(_172_),
    .B(_156_),
    .C(_032_),
    .Y(_094_));
 sky130_fd_sc_hd__o32a_1 _287_ (.A1(_151_),
    .A2(_156_),
    .A3(_032_),
    .B1(_094_),
    .B2(_171_),
    .X(_095_));
 sky130_fd_sc_hd__inv_2 _288_ (.A(_095_),
    .Y(_096_));
 sky130_fd_sc_hd__o221a_1 _289_ (.A1(_153_),
    .A2(_088_),
    .B1(_093_),
    .B2(_096_),
    .C1(_081_),
    .X(_010_));
 sky130_fd_sc_hd__a21oi_1 _290_ (.A1(_055_),
    .A2(_056_),
    .B1(_172_),
    .Y(_097_));
 sky130_fd_sc_hd__nand2_1 _291_ (.A(_149_),
    .B(_053_),
    .Y(_098_));
 sky130_fd_sc_hd__nand2_1 _292_ (.A(\adc.internalCounter[2] ),
    .B(_059_),
    .Y(_099_));
 sky130_fd_sc_hd__a21o_1 _293_ (.A1(_098_),
    .A2(_099_),
    .B1(_151_),
    .X(_100_));
 sky130_fd_sc_hd__o21ai_1 _294_ (.A1(_171_),
    .A2(_097_),
    .B1(_100_),
    .Y(_101_));
 sky130_fd_sc_hd__o221a_1 _295_ (.A1(\adc.internalCounter[2] ),
    .A2(_088_),
    .B1(_093_),
    .B2(_101_),
    .C1(_081_),
    .X(_011_));
 sky130_fd_sc_hd__or3_1 _296_ (.A(\adc.internalCounter[3] ),
    .B(_151_),
    .C(_098_),
    .X(_102_));
 sky130_fd_sc_hd__or3_1 _297_ (.A(\adc.internalCounter[3] ),
    .B(_171_),
    .C(_056_),
    .X(_103_));
 sky130_fd_sc_hd__inv_2 _298_ (.A(_088_),
    .Y(_104_));
 sky130_fd_sc_hd__a31o_1 _299_ (.A1(_102_),
    .A2(_092_),
    .A3(_103_),
    .B1(_104_),
    .X(_105_));
 sky130_fd_sc_hd__nor2_1 _300_ (.A(_171_),
    .B(_172_),
    .Y(_106_));
 sky130_fd_sc_hd__a22o_1 _301_ (.A1(_106_),
    .A2(_056_),
    .B1(_098_),
    .B2(_169_),
    .X(_107_));
 sky130_fd_sc_hd__o21ai_1 _302_ (.A1(_104_),
    .A2(_107_),
    .B1(\adc.internalCounter[3] ),
    .Y(_108_));
 sky130_fd_sc_hd__a21oi_1 _303_ (.A1(_105_),
    .A2(_108_),
    .B1(_036_),
    .Y(_012_));
 sky130_fd_sc_hd__or2_1 _304_ (.A(\adc.internalCounter[4] ),
    .B(_085_),
    .X(_109_));
 sky130_fd_sc_hd__o211a_1 _305_ (.A1(\adc.internalCounter[3] ),
    .A2(_098_),
    .B1(_169_),
    .C1(\adc.internalCounter[4] ),
    .X(_110_));
 sky130_fd_sc_hd__a31o_1 _306_ (.A1(_106_),
    .A2(_167_),
    .A3(_109_),
    .B1(_110_),
    .X(_111_));
 sky130_fd_sc_hd__o221a_1 _307_ (.A1(\adc.internalCounter[4] ),
    .A2(_088_),
    .B1(_093_),
    .B2(_111_),
    .C1(_081_),
    .X(_013_));
 sky130_fd_sc_hd__or2_1 _308_ (.A(_142_),
    .B(_143_),
    .X(_112_));
 sky130_fd_sc_hd__or2_1 _309_ (.A(_075_),
    .B(_112_),
    .X(_113_));
 sky130_fd_sc_hd__buf_2 _310_ (.A(_113_),
    .X(_114_));
 sky130_fd_sc_hd__buf_2 _311_ (.A(_159_),
    .X(_115_));
 sky130_fd_sc_hd__nor2_2 _312_ (.A(_075_),
    .B(_112_),
    .Y(_116_));
 sky130_fd_sc_hd__a21o_1 _313_ (.A1(net6),
    .A2(_115_),
    .B1(_116_),
    .X(_117_));
 sky130_fd_sc_hd__o211a_1 _314_ (.A1(net15),
    .A2(_114_),
    .B1(_117_),
    .C1(_084_),
    .X(_014_));
 sky130_fd_sc_hd__a21o_1 _315_ (.A1(net7),
    .A2(_115_),
    .B1(_116_),
    .X(_118_));
 sky130_fd_sc_hd__o211a_1 _316_ (.A1(net16),
    .A2(_114_),
    .B1(_118_),
    .C1(_084_),
    .X(_015_));
 sky130_fd_sc_hd__a21o_1 _317_ (.A1(net8),
    .A2(_115_),
    .B1(_116_),
    .X(_119_));
 sky130_fd_sc_hd__o211a_1 _318_ (.A1(net17),
    .A2(_114_),
    .B1(_119_),
    .C1(_084_),
    .X(_016_));
 sky130_fd_sc_hd__a21o_1 _319_ (.A1(net9),
    .A2(_115_),
    .B1(_116_),
    .X(_120_));
 sky130_fd_sc_hd__o211a_1 _320_ (.A1(net18),
    .A2(_114_),
    .B1(_120_),
    .C1(_084_),
    .X(_017_));
 sky130_fd_sc_hd__a21o_1 _321_ (.A1(net10),
    .A2(_115_),
    .B1(_116_),
    .X(_121_));
 sky130_fd_sc_hd__o211a_1 _322_ (.A1(net19),
    .A2(_114_),
    .B1(_121_),
    .C1(_084_),
    .X(_018_));
 sky130_fd_sc_hd__a21o_1 _323_ (.A1(net11),
    .A2(_115_),
    .B1(_116_),
    .X(_122_));
 sky130_fd_sc_hd__o211a_1 _324_ (.A1(net20),
    .A2(_114_),
    .B1(_122_),
    .C1(_084_),
    .X(_019_));
 sky130_fd_sc_hd__a21o_1 _325_ (.A1(net12),
    .A2(_115_),
    .B1(_116_),
    .X(_123_));
 sky130_fd_sc_hd__o211a_1 _326_ (.A1(net21),
    .A2(_114_),
    .B1(_123_),
    .C1(_084_),
    .X(_020_));
 sky130_fd_sc_hd__a221o_1 _327_ (.A1(net13),
    .A2(_115_),
    .B1(_049_),
    .B2(net2),
    .C1(_116_),
    .X(_124_));
 sky130_fd_sc_hd__o211a_1 _328_ (.A1(net22),
    .A2(_114_),
    .B1(_124_),
    .C1(_084_),
    .X(_021_));
 sky130_fd_sc_hd__nor2_1 _329_ (.A(net4),
    .B(_159_),
    .Y(_125_));
 sky130_fd_sc_hd__nor2_1 _330_ (.A(_106_),
    .B(_125_),
    .Y(_126_));
 sky130_fd_sc_hd__o21a_1 _331_ (.A1(\adc.syncroCount[1] ),
    .A2(_076_),
    .B1(_126_),
    .X(_127_));
 sky130_fd_sc_hd__o221a_1 _332_ (.A1(_145_),
    .A2(_143_),
    .B1(_112_),
    .B2(\adc.state[2] ),
    .C1(_060_),
    .X(_128_));
 sky130_fd_sc_hd__o21ai_1 _333_ (.A1(_127_),
    .A2(_128_),
    .B1(_081_),
    .Y(_129_));
 sky130_fd_sc_hd__a21oi_1 _334_ (.A1(_127_),
    .A2(_128_),
    .B1(_129_),
    .Y(_022_));
 sky130_fd_sc_hd__or3_1 _335_ (.A(_145_),
    .B(_077_),
    .C(_164_),
    .X(_130_));
 sky130_fd_sc_hd__a211oi_1 _336_ (.A1(_060_),
    .A2(_130_),
    .B1(_125_),
    .C1(_036_),
    .Y(_023_));
 sky130_fd_sc_hd__o21a_1 _337_ (.A1(_077_),
    .A2(_075_),
    .B1(_148_),
    .X(_131_));
 sky130_fd_sc_hd__nor2_1 _338_ (.A(_036_),
    .B(_131_),
    .Y(_024_));
 sky130_fd_sc_hd__nor2_1 _339_ (.A(_036_),
    .B(_082_),
    .Y(_025_));
 sky130_fd_sc_hd__nor2_1 _340_ (.A(_142_),
    .B(_146_),
    .Y(_132_));
 sky130_fd_sc_hd__o221a_1 _341_ (.A1(net5),
    .A2(_132_),
    .B1(_115_),
    .B2(_160_),
    .C1(_081_),
    .X(_026_));
 sky130_fd_sc_hd__inv_2 _342_ (.A(_165_),
    .Y(_133_));
 sky130_fd_sc_hd__or3_1 _343_ (.A(_160_),
    .B(net2),
    .C(_115_),
    .X(_134_));
 sky130_fd_sc_hd__a31o_1 _344_ (.A1(_133_),
    .A2(_126_),
    .A3(_134_),
    .B1(net14),
    .X(_135_));
 sky130_fd_sc_hd__o311a_1 _345_ (.A1(_143_),
    .A2(_146_),
    .A3(_106_),
    .B1(_135_),
    .C1(_081_),
    .X(_027_));
 sky130_fd_sc_hd__o211a_1 _346_ (.A1(_054_),
    .A2(_038_),
    .B1(_034_),
    .C1(_175_),
    .X(_136_));
 sky130_fd_sc_hd__a31o_1 _347_ (.A1(_148_),
    .A2(_175_),
    .A3(_034_),
    .B1(_036_),
    .X(_137_));
 sky130_fd_sc_hd__o21ba_1 _348_ (.A1(net18),
    .A2(_136_),
    .B1_N(_137_),
    .X(_028_));
 sky130_fd_sc_hd__or2_1 _349_ (.A(_053_),
    .B(_034_),
    .X(_138_));
 sky130_fd_sc_hd__a41o_1 _350_ (.A1(_148_),
    .A2(_175_),
    .A3(_031_),
    .A4(_138_),
    .B1(net3),
    .X(_139_));
 sky130_fd_sc_hd__a41o_1 _351_ (.A1(_175_),
    .A2(_031_),
    .A3(_038_),
    .A4(_138_),
    .B1(net19),
    .X(_140_));
 sky130_fd_sc_hd__and2b_1 _352_ (.A_N(_139_),
    .B(_140_),
    .X(_141_));
 sky130_fd_sc_hd__clkbuf_1 _353_ (.A(_141_),
    .X(_029_));
 sky130_fd_sc_hd__dfxtp_1 _354_ (.CLK(clknet_2_0__leaf_clk),
    .D(_000_),
    .Q(net20));
 sky130_fd_sc_hd__dfxtp_1 _355_ (.CLK(clknet_2_1__leaf_clk),
    .D(_001_),
    .Q(net21));
 sky130_fd_sc_hd__dfxtp_1 _356_ (.CLK(clknet_2_1__leaf_clk),
    .D(_002_),
    .Q(net15));
 sky130_fd_sc_hd__dfxtp_1 _357_ (.CLK(clknet_2_1__leaf_clk),
    .D(_003_),
    .Q(net16));
 sky130_fd_sc_hd__dfxtp_1 _358_ (.CLK(clknet_2_1__leaf_clk),
    .D(_004_),
    .Q(net17));
 sky130_fd_sc_hd__dfxtp_1 _359_ (.CLK(clknet_2_2__leaf_clk),
    .D(\adc.comparator.compres.ffsync.stage0 ),
    .Q(\adc.comparator.compres.ffsync.stage1 ));
 sky130_fd_sc_hd__dfxtp_1 _360_ (.CLK(clknet_2_2__leaf_clk),
    .D(_005_),
    .Q(\adc.syncroCount[0] ));
 sky130_fd_sc_hd__dfxtp_1 _361_ (.CLK(clknet_2_2__leaf_clk),
    .D(_006_),
    .Q(\adc.syncroCount[1] ));
 sky130_fd_sc_hd__dfxtp_1 _362_ (.CLK(clknet_2_1__leaf_clk),
    .D(_007_),
    .Q(net23));
 sky130_fd_sc_hd__dfxtp_1 _363_ (.CLK(clknet_2_1__leaf_clk),
    .D(_008_),
    .Q(net22));
 sky130_fd_sc_hd__dfxtp_1 _364_ (.CLK(clknet_2_1__leaf_clk),
    .D(_009_),
    .Q(\adc.internalCounter[0] ));
 sky130_fd_sc_hd__dfxtp_1 _365_ (.CLK(clknet_2_3__leaf_clk),
    .D(_010_),
    .Q(\adc.internalCounter[1] ));
 sky130_fd_sc_hd__dfxtp_2 _366_ (.CLK(clknet_2_3__leaf_clk),
    .D(_011_),
    .Q(\adc.internalCounter[2] ));
 sky130_fd_sc_hd__dfxtp_2 _367_ (.CLK(clknet_2_3__leaf_clk),
    .D(_012_),
    .Q(\adc.internalCounter[3] ));
 sky130_fd_sc_hd__dfxtp_1 _368_ (.CLK(clknet_2_3__leaf_clk),
    .D(_013_),
    .Q(\adc.internalCounter[4] ));
 sky130_fd_sc_hd__dfxtp_1 _369_ (.CLK(clknet_2_0__leaf_clk),
    .D(_014_),
    .Q(net6));
 sky130_fd_sc_hd__dfxtp_1 _370_ (.CLK(clknet_2_0__leaf_clk),
    .D(_015_),
    .Q(net7));
 sky130_fd_sc_hd__dfxtp_1 _371_ (.CLK(clknet_2_0__leaf_clk),
    .D(_016_),
    .Q(net8));
 sky130_fd_sc_hd__dfxtp_1 _372_ (.CLK(clknet_2_0__leaf_clk),
    .D(_017_),
    .Q(net9));
 sky130_fd_sc_hd__dfxtp_1 _373_ (.CLK(clknet_2_0__leaf_clk),
    .D(_018_),
    .Q(net10));
 sky130_fd_sc_hd__dfxtp_1 _374_ (.CLK(clknet_2_0__leaf_clk),
    .D(_019_),
    .Q(net11));
 sky130_fd_sc_hd__dfxtp_1 _375_ (.CLK(clknet_2_0__leaf_clk),
    .D(_020_),
    .Q(net12));
 sky130_fd_sc_hd__dfxtp_1 _376_ (.CLK(clknet_2_0__leaf_clk),
    .D(_021_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _377_ (.CLK(clknet_2_2__leaf_clk),
    .D(_022_),
    .Q(\adc.state[0] ));
 sky130_fd_sc_hd__dfxtp_1 _378_ (.CLK(clknet_2_2__leaf_clk),
    .D(_023_),
    .Q(\adc.state[1] ));
 sky130_fd_sc_hd__dfxtp_2 _379_ (.CLK(clknet_2_0__leaf_clk),
    .D(_024_),
    .Q(\adc.state[2] ));
 sky130_fd_sc_hd__dfxtp_1 _380_ (.CLK(clknet_2_3__leaf_clk),
    .D(_025_),
    .Q(\adc.state[3] ));
 sky130_fd_sc_hd__dfxtp_1 _381_ (.CLK(clknet_2_2__leaf_clk),
    .D(_026_),
    .Q(net5));
 sky130_fd_sc_hd__dfxtp_1 _382_ (.CLK(clknet_2_2__leaf_clk),
    .D(_027_),
    .Q(net14));
 sky130_fd_sc_hd__dfxtp_1 _383_ (.CLK(clknet_2_0__leaf_clk),
    .D(_028_),
    .Q(net18));
 sky130_fd_sc_hd__dfxtp_1 _384_ (.CLK(clknet_2_0__leaf_clk),
    .D(_029_),
    .Q(net19));
 sky130_fd_sc_hd__dfxtp_1 _385_ (.CLK(clknet_2_2__leaf_clk),
    .D(net1),
    .Q(\adc.comparator.compres.ffsync.stage0 ));
 sky130_fd_sc_hd__clkbuf_1 _386_ (.A(use_ext_thresh),
    .X(net24));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(analog_comparator_out),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input2 (.A(calib_enable),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_2 input3 (.A(rst),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(user_enable),
    .X(net4));
 sky130_fd_sc_hd__buf_1 output10 (.A(net10),
    .X(dac_set[4]));
 sky130_fd_sc_hd__clkbuf_1 output11 (.A(net11),
    .X(dac_set[5]));
 sky130_fd_sc_hd__clkbuf_1 output12 (.A(net12),
    .X(dac_set[6]));
 sky130_fd_sc_hd__clkbuf_1 output13 (.A(net13),
    .X(dac_set[7]));
 sky130_fd_sc_hd__buf_1 output14 (.A(net14),
    .X(do_calibrate));
 sky130_fd_sc_hd__buf_1 output15 (.A(net15),
    .X(result[0]));
 sky130_fd_sc_hd__clkbuf_1 output16 (.A(net16),
    .X(result[1]));
 sky130_fd_sc_hd__clkbuf_1 output17 (.A(net17),
    .X(result[2]));
 sky130_fd_sc_hd__buf_1 output18 (.A(net18),
    .X(result[3]));
 sky130_fd_sc_hd__clkbuf_1 output19 (.A(net19),
    .X(result[4]));
 sky130_fd_sc_hd__clkbuf_1 output20 (.A(net20),
    .X(result[5]));
 sky130_fd_sc_hd__clkbuf_1 output21 (.A(net21),
    .X(result[6]));
 sky130_fd_sc_hd__buf_1 output22 (.A(net22),
    .X(result[7]));
 sky130_fd_sc_hd__clkbuf_1 output23 (.A(net23),
    .X(result_ready));
 sky130_fd_sc_hd__buf_1 output24 (.A(net24),
    .X(thresh_sel));
 sky130_fd_sc_hd__buf_1 output5 (.A(net5),
    .X(comparator_nen));
 sky130_fd_sc_hd__clkbuf_1 output6 (.A(net6),
    .X(dac_set[0]));
 sky130_fd_sc_hd__buf_1 output7 (.A(net7),
    .X(dac_set[1]));
 sky130_fd_sc_hd__buf_1 output8 (.A(net8),
    .X(dac_set[2]));
 sky130_fd_sc_hd__buf_1 output9 (.A(net9),
    .X(dac_set[3]));
endmodule

