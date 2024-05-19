// This program was cloned from: https://github.com/RSPwFPGAs/qemu-hdl-cosim
// License: MIT License

//------------------------------------------------------------
//   Multipliers (number: [bitwidth0, bitwidth1]) 
// //
//   Adders (number: [bitwidth0, bitwidth1])
// //
//   RAMs (number: [words, bits per word])
//       12: [256, 32]
//       4: [128, 1]
//       8: [512, 32]
//       62: [2, 1]
//       36: [4, 32]
//       6: [5, 1]
//       8: [8, 1]
//       28: [16, 32]
//       4: [17, 1]
//       5: [64, 1]
//       6: [32, 1]
//       16: [128, 32]
//       1: [129, 1]
//       10: [0, 1]
//       7: [3, 1]
//       32: [8, 32]
//       5: [9, 1]
//       20: [64, 32]
//       2: [65, 1]
//       3: [256, 1]
//       24: [32, 32]
//       3: [33, 1]
//       55: [1, 1]
//       9: [4, 1]
//       7: [16, 1]
// //
//   ROMs (number: [words, bits per word])
// //------------------------------------------------------------

// Generated on Fri Jun 30 16:24:34 EDT 2017
// Command: splhdl /home/pmilder/sort_tmp/20129/sort_1024_4.spl -o /home/pmilder/sort_tmp/20129/sort_1024_4.v -r -l -fix 32 

// Latency: 1256
// Gap: 256

module sorting_network_core(clk, reset, next, next_out, X0, Y0, X1, Y1, X2, Y2, X3, Y3); 

   input [31:0] X0;
   output [31:0] Y0;
   input [31:0] X1;
   output [31:0] Y1;
   input [31:0] X2;
   output [31:0] Y2;
   input [31:0] X3;
   output [31:0] Y3;
   input clk, reset, next;
   output next_out;

   statementList80057 instList80058 (.clk(clk), .reset(reset), .next(next), .next_out(next_out),
    .X0(X0), .Y0(Y0),
    .X1(X1), .Y1(Y1),
    .X2(X2), .Y2(Y2),
    .X3(X3), .Y3(Y3));

endmodule

// Latency: 1256
// Gap: 256
// module_name_is:statementList80057
module statementList80057(clk, reset, next, next_out,
   X0, Y0,
   X1, Y1,
   X2, Y2,
   X3, Y3);

   output next_out;
   input clk, reset, next;

   input [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   wire [31:0] t0_0;
   wire [31:0] t0_1;
   wire [31:0] t0_2;
   wire [31:0] t0_3;
   wire next_0;
   wire [31:0] t1_0;
   wire [31:0] t1_1;
   wire [31:0] t1_2;
   wire [31:0] t1_3;
   wire next_1;
   wire [31:0] t2_0;
   wire [31:0] t2_1;
   wire [31:0] t2_2;
   wire [31:0] t2_3;
   wire next_2;
   wire [31:0] t3_0;
   wire [31:0] t3_1;
   wire [31:0] t3_2;
   wire [31:0] t3_3;
   wire next_3;
   wire [31:0] t4_0;
   wire [31:0] t4_1;
   wire [31:0] t4_2;
   wire [31:0] t4_3;
   wire next_4;
   wire [31:0] t5_0;
   wire [31:0] t5_1;
   wire [31:0] t5_2;
   wire [31:0] t5_3;
   wire next_5;
   wire [31:0] t6_0;
   wire [31:0] t6_1;
   wire [31:0] t6_2;
   wire [31:0] t6_3;
   wire next_6;
   wire [31:0] t7_0;
   wire [31:0] t7_1;
   wire [31:0] t7_2;
   wire [31:0] t7_3;
   wire next_7;
   wire [31:0] t8_0;
   wire [31:0] t8_1;
   wire [31:0] t8_2;
   wire [31:0] t8_3;
   wire next_8;
   wire [31:0] t9_0;
   wire [31:0] t9_1;
   wire [31:0] t9_2;
   wire [31:0] t9_3;
   wire next_9;
   wire [31:0] t10_0;
   wire [31:0] t10_1;
   wire [31:0] t10_2;
   wire [31:0] t10_3;
   wire next_10;
   wire [31:0] t11_0;
   wire [31:0] t11_1;
   wire [31:0] t11_2;
   wire [31:0] t11_3;
   wire next_11;
   wire [31:0] t12_0;
   wire [31:0] t12_1;
   wire [31:0] t12_2;
   wire [31:0] t12_3;
   wire next_12;
   wire [31:0] t13_0;
   wire [31:0] t13_1;
   wire [31:0] t13_2;
   wire [31:0] t13_3;
   wire next_13;
   wire [31:0] t14_0;
   wire [31:0] t14_1;
   wire [31:0] t14_2;
   wire [31:0] t14_3;
   wire next_14;
   wire [31:0] t15_0;
   wire [31:0] t15_1;
   wire [31:0] t15_2;
   wire [31:0] t15_3;
   wire next_15;
   wire [31:0] t16_0;
   wire [31:0] t16_1;
   wire [31:0] t16_2;
   wire [31:0] t16_3;
   wire next_16;
   wire [31:0] t17_0;
   wire [31:0] t17_1;
   wire [31:0] t17_2;
   wire [31:0] t17_3;
   wire next_17;
   wire [31:0] t18_0;
   wire [31:0] t18_1;
   wire [31:0] t18_2;
   wire [31:0] t18_3;
   wire next_18;
   wire [31:0] t19_0;
   wire [31:0] t19_1;
   wire [31:0] t19_2;
   wire [31:0] t19_3;
   wire next_19;
   wire [31:0] t20_0;
   wire [31:0] t20_1;
   wire [31:0] t20_2;
   wire [31:0] t20_3;
   wire next_20;
   wire [31:0] t21_0;
   wire [31:0] t21_1;
   wire [31:0] t21_2;
   wire [31:0] t21_3;
   wire next_21;
   wire [31:0] t22_0;
   wire [31:0] t22_1;
   wire [31:0] t22_2;
   wire [31:0] t22_3;
   wire next_22;
   wire [31:0] t23_0;
   wire [31:0] t23_1;
   wire [31:0] t23_2;
   wire [31:0] t23_3;
   wire next_23;
   wire [31:0] t24_0;
   wire [31:0] t24_1;
   wire [31:0] t24_2;
   wire [31:0] t24_3;
   wire next_24;
   wire [31:0] t25_0;
   wire [31:0] t25_1;
   wire [31:0] t25_2;
   wire [31:0] t25_3;
   wire next_25;
   wire [31:0] t26_0;
   wire [31:0] t26_1;
   wire [31:0] t26_2;
   wire [31:0] t26_3;
   wire next_26;
   wire [31:0] t27_0;
   wire [31:0] t27_1;
   wire [31:0] t27_2;
   wire [31:0] t27_3;
   wire next_27;
   wire [31:0] t28_0;
   wire [31:0] t28_1;
   wire [31:0] t28_2;
   wire [31:0] t28_3;
   wire next_28;
   wire [31:0] t29_0;
   wire [31:0] t29_1;
   wire [31:0] t29_2;
   wire [31:0] t29_3;
   wire next_29;
   wire [31:0] t30_0;
   wire [31:0] t30_1;
   wire [31:0] t30_2;
   wire [31:0] t30_3;
   wire next_30;
   wire [31:0] t31_0;
   wire [31:0] t31_1;
   wire [31:0] t31_2;
   wire [31:0] t31_3;
   wire next_31;
   wire [31:0] t32_0;
   wire [31:0] t32_1;
   wire [31:0] t32_2;
   wire [31:0] t32_3;
   wire next_32;
   wire [31:0] t33_0;
   wire [31:0] t33_1;
   wire [31:0] t33_2;
   wire [31:0] t33_3;
   wire next_33;
   wire [31:0] t34_0;
   wire [31:0] t34_1;
   wire [31:0] t34_2;
   wire [31:0] t34_3;
   wire next_34;
   wire [31:0] t35_0;
   wire [31:0] t35_1;
   wire [31:0] t35_2;
   wire [31:0] t35_3;
   wire next_35;
   wire [31:0] t36_0;
   wire [31:0] t36_1;
   wire [31:0] t36_2;
   wire [31:0] t36_3;
   wire next_36;
   wire [31:0] t37_0;
   wire [31:0] t37_1;
   wire [31:0] t37_2;
   wire [31:0] t37_3;
   wire next_37;
   wire [31:0] t38_0;
   wire [31:0] t38_1;
   wire [31:0] t38_2;
   wire [31:0] t38_3;
   wire next_38;
   wire [31:0] t39_0;
   wire [31:0] t39_1;
   wire [31:0] t39_2;
   wire [31:0] t39_3;
   wire next_39;
   wire [31:0] t40_0;
   wire [31:0] t40_1;
   wire [31:0] t40_2;
   wire [31:0] t40_3;
   wire next_40;
   wire [31:0] t41_0;
   wire [31:0] t41_1;
   wire [31:0] t41_2;
   wire [31:0] t41_3;
   wire next_41;
   wire [31:0] t42_0;
   wire [31:0] t42_1;
   wire [31:0] t42_2;
   wire [31:0] t42_3;
   wire next_42;
   wire [31:0] t43_0;
   wire [31:0] t43_1;
   wire [31:0] t43_2;
   wire [31:0] t43_3;
   wire next_43;
   wire [31:0] t44_0;
   wire [31:0] t44_1;
   wire [31:0] t44_2;
   wire [31:0] t44_3;
   wire next_44;
   wire [31:0] t45_0;
   wire [31:0] t45_1;
   wire [31:0] t45_2;
   wire [31:0] t45_3;
   wire next_45;
   wire [31:0] t46_0;
   wire [31:0] t46_1;
   wire [31:0] t46_2;
   wire [31:0] t46_3;
   wire next_46;
   wire [31:0] t47_0;
   wire [31:0] t47_1;
   wire [31:0] t47_2;
   wire [31:0] t47_3;
   wire next_47;
   wire [31:0] t48_0;
   wire [31:0] t48_1;
   wire [31:0] t48_2;
   wire [31:0] t48_3;
   wire next_48;
   wire [31:0] t49_0;
   wire [31:0] t49_1;
   wire [31:0] t49_2;
   wire [31:0] t49_3;
   wire next_49;
   wire [31:0] t50_0;
   wire [31:0] t50_1;
   wire [31:0] t50_2;
   wire [31:0] t50_3;
   wire next_50;
   wire [31:0] t51_0;
   wire [31:0] t51_1;
   wire [31:0] t51_2;
   wire [31:0] t51_3;
   wire next_51;
   wire [31:0] t52_0;
   wire [31:0] t52_1;
   wire [31:0] t52_2;
   wire [31:0] t52_3;
   wire next_52;
   wire [31:0] t53_0;
   wire [31:0] t53_1;
   wire [31:0] t53_2;
   wire [31:0] t53_3;
   wire next_53;
   wire [31:0] t54_0;
   wire [31:0] t54_1;
   wire [31:0] t54_2;
   wire [31:0] t54_3;
   wire next_54;
   wire [31:0] t55_0;
   wire [31:0] t55_1;
   wire [31:0] t55_2;
   wire [31:0] t55_3;
   wire next_55;
   wire [31:0] t56_0;
   wire [31:0] t56_1;
   wire [31:0] t56_2;
   wire [31:0] t56_3;
   wire next_56;
   wire [31:0] t57_0;
   wire [31:0] t57_1;
   wire [31:0] t57_2;
   wire [31:0] t57_3;
   wire next_57;
   wire [31:0] t58_0;
   wire [31:0] t58_1;
   wire [31:0] t58_2;
   wire [31:0] t58_3;
   wire next_58;
   wire [31:0] t59_0;
   wire [31:0] t59_1;
   wire [31:0] t59_2;
   wire [31:0] t59_3;
   wire next_59;
   wire [31:0] t60_0;
   wire [31:0] t60_1;
   wire [31:0] t60_2;
   wire [31:0] t60_3;
   wire next_60;
   wire [31:0] t61_0;
   wire [31:0] t61_1;
   wire [31:0] t61_2;
   wire [31:0] t61_3;
   wire next_61;
   wire [31:0] t62_0;
   wire [31:0] t62_1;
   wire [31:0] t62_2;
   wire [31:0] t62_3;
   wire next_62;
   wire [31:0] t63_0;
   wire [31:0] t63_1;
   wire [31:0] t63_2;
   wire [31:0] t63_3;
   wire next_63;
   wire [31:0] t64_0;
   wire [31:0] t64_1;
   wire [31:0] t64_2;
   wire [31:0] t64_3;
   wire next_64;
   wire [31:0] t65_0;
   wire [31:0] t65_1;
   wire [31:0] t65_2;
   wire [31:0] t65_3;
   wire next_65;
   wire [31:0] t66_0;
   wire [31:0] t66_1;
   wire [31:0] t66_2;
   wire [31:0] t66_3;
   wire next_66;
   wire [31:0] t67_0;
   wire [31:0] t67_1;
   wire [31:0] t67_2;
   wire [31:0] t67_3;
   wire next_67;
   wire [31:0] t68_0;
   wire [31:0] t68_1;
   wire [31:0] t68_2;
   wire [31:0] t68_3;
   wire next_68;
   wire [31:0] t69_0;
   wire [31:0] t69_1;
   wire [31:0] t69_2;
   wire [31:0] t69_3;
   wire next_69;
   wire [31:0] t70_0;
   wire [31:0] t70_1;
   wire [31:0] t70_2;
   wire [31:0] t70_3;
   wire next_70;
   wire [31:0] t71_0;
   wire [31:0] t71_1;
   wire [31:0] t71_2;
   wire [31:0] t71_3;
   wire next_71;
   wire [31:0] t72_0;
   wire [31:0] t72_1;
   wire [31:0] t72_2;
   wire [31:0] t72_3;
   wire next_72;
   wire [31:0] t73_0;
   wire [31:0] t73_1;
   wire [31:0] t73_2;
   wire [31:0] t73_3;
   wire next_73;
   wire [31:0] t74_0;
   wire [31:0] t74_1;
   wire [31:0] t74_2;
   wire [31:0] t74_3;
   wire next_74;
   wire [31:0] t75_0;
   wire [31:0] t75_1;
   wire [31:0] t75_2;
   wire [31:0] t75_3;
   wire next_75;
   wire [31:0] t76_0;
   wire [31:0] t76_1;
   wire [31:0] t76_2;
   wire [31:0] t76_3;
   wire next_76;
   wire [31:0] t77_0;
   wire [31:0] t77_1;
   wire [31:0] t77_2;
   wire [31:0] t77_3;
   wire next_77;
   wire [31:0] t78_0;
   wire [31:0] t78_1;
   wire [31:0] t78_2;
   wire [31:0] t78_3;
   wire next_78;
   wire [31:0] t79_0;
   wire [31:0] t79_1;
   wire [31:0] t79_2;
   wire [31:0] t79_3;
   wire next_79;
   wire [31:0] t80_0;
   wire [31:0] t80_1;
   wire [31:0] t80_2;
   wire [31:0] t80_3;
   wire next_80;
   wire [31:0] t81_0;
   wire [31:0] t81_1;
   wire [31:0] t81_2;
   wire [31:0] t81_3;
   wire next_81;
   wire [31:0] t82_0;
   wire [31:0] t82_1;
   wire [31:0] t82_2;
   wire [31:0] t82_3;
   wire next_82;
   wire [31:0] t83_0;
   wire [31:0] t83_1;
   wire [31:0] t83_2;
   wire [31:0] t83_3;
   wire next_83;
   wire [31:0] t84_0;
   wire [31:0] t84_1;
   wire [31:0] t84_2;
   wire [31:0] t84_3;
   wire next_84;
   wire [31:0] t85_0;
   wire [31:0] t85_1;
   wire [31:0] t85_2;
   wire [31:0] t85_3;
   wire next_85;
   wire [31:0] t86_0;
   wire [31:0] t86_1;
   wire [31:0] t86_2;
   wire [31:0] t86_3;
   wire next_86;
   wire [31:0] t87_0;
   wire [31:0] t87_1;
   wire [31:0] t87_2;
   wire [31:0] t87_3;
   wire next_87;
   wire [31:0] t88_0;
   wire [31:0] t88_1;
   wire [31:0] t88_2;
   wire [31:0] t88_3;
   wire next_88;
   wire [31:0] t89_0;
   wire [31:0] t89_1;
   wire [31:0] t89_2;
   wire [31:0] t89_3;
   wire next_89;
   wire [31:0] t90_0;
   wire [31:0] t90_1;
   wire [31:0] t90_2;
   wire [31:0] t90_3;
   wire next_90;
   wire [31:0] t91_0;
   wire [31:0] t91_1;
   wire [31:0] t91_2;
   wire [31:0] t91_3;
   wire next_91;
   wire [31:0] t92_0;
   wire [31:0] t92_1;
   wire [31:0] t92_2;
   wire [31:0] t92_3;
   wire next_92;
   wire [31:0] t93_0;
   wire [31:0] t93_1;
   wire [31:0] t93_2;
   wire [31:0] t93_3;
   wire next_93;
   wire [31:0] t94_0;
   wire [31:0] t94_1;
   wire [31:0] t94_2;
   wire [31:0] t94_3;
   wire next_94;
   wire [31:0] t95_0;
   wire [31:0] t95_1;
   wire [31:0] t95_2;
   wire [31:0] t95_3;
   wire next_95;
   wire [31:0] t96_0;
   wire [31:0] t96_1;
   wire [31:0] t96_2;
   wire [31:0] t96_3;
   wire next_96;
   wire [31:0] t97_0;
   wire [31:0] t97_1;
   wire [31:0] t97_2;
   wire [31:0] t97_3;
   wire next_97;
   wire [31:0] t98_0;
   wire [31:0] t98_1;
   wire [31:0] t98_2;
   wire [31:0] t98_3;
   wire next_98;
   wire [31:0] t99_0;
   wire [31:0] t99_1;
   wire [31:0] t99_2;
   wire [31:0] t99_3;
   wire next_99;
   wire [31:0] t100_0;
   wire [31:0] t100_1;
   wire [31:0] t100_2;
   wire [31:0] t100_3;
   wire next_100;
   wire [31:0] t101_0;
   wire [31:0] t101_1;
   wire [31:0] t101_2;
   wire [31:0] t101_3;
   wire next_101;
   wire [31:0] t102_0;
   wire [31:0] t102_1;
   wire [31:0] t102_2;
   wire [31:0] t102_3;
   wire next_102;
   wire [31:0] t103_0;
   wire [31:0] t103_1;
   wire [31:0] t103_2;
   wire [31:0] t103_3;
   wire next_103;
   wire [31:0] t104_0;
   wire [31:0] t104_1;
   wire [31:0] t104_2;
   wire [31:0] t104_3;
   wire next_104;
   wire [31:0] t105_0;
   wire [31:0] t105_1;
   wire [31:0] t105_2;
   wire [31:0] t105_3;
   wire next_105;
   wire [31:0] t106_0;
   wire [31:0] t106_1;
   wire [31:0] t106_2;
   wire [31:0] t106_3;
   wire next_106;
   wire [31:0] t107_0;
   wire [31:0] t107_1;
   wire [31:0] t107_2;
   wire [31:0] t107_3;
   wire next_107;
   wire [31:0] t108_0;
   wire [31:0] t108_1;
   wire [31:0] t108_2;
   wire [31:0] t108_3;
   wire next_108;
   wire [31:0] t109_0;
   wire [31:0] t109_1;
   wire [31:0] t109_2;
   wire [31:0] t109_3;
   wire next_109;
   assign t0_0 = X0;
   assign Y0 = t109_0;
   assign t0_1 = X1;
   assign Y1 = t109_1;
   assign t0_2 = X2;
   assign Y2 = t109_2;
   assign t0_3 = X3;
   assign Y3 = t109_3;
   assign next_0 = next;
   assign next_out = next_109;

// latency=2, gap=256
   codeBlock73852 stage0(.clk(clk), .reset(reset), .next_in(next_0), .next_out(next_1),
       .X0_in(t0_0), .Y0(t1_0),
       .X1_in(t0_1), .Y1(t1_1),
       .X2_in(t0_2), .Y2(t1_2),
       .X3_in(t0_3), .Y3(t1_3));


// latency=1, gap=256
   codeBlock73959 stage1(.clk(clk), .reset(reset), .next_in(next_1), .next_out(next_2),
       .X0_in(t1_0), .Y0(t2_0),
       .X1_in(t1_1), .Y1(t2_1),
       .X2_in(t1_2), .Y2(t2_2),
       .X3_in(t1_3), .Y3(t2_3));


// latency=2, gap=256
   codeBlock73978 stage2(.clk(clk), .reset(reset), .next_in(next_2), .next_out(next_3),
       .X0_in(t2_0), .Y0(t3_0),
       .X1_in(t2_1), .Y1(t3_1),
       .X2_in(t2_2), .Y2(t3_2),
       .X3_in(t2_3), .Y3(t3_3));


// latency=1, gap=256
   codeBlock74085 stage3(.clk(clk), .reset(reset), .next_in(next_3), .next_out(next_4),
       .X0_in(t3_0), .Y0(t4_0),
       .X1_in(t3_1), .Y1(t4_1),
       .X2_in(t3_2), .Y2(t4_2),
       .X3_in(t3_3), .Y3(t4_3));


// latency=2, gap=256
   codeBlock74104 stage4(.clk(clk), .reset(reset), .next_in(next_4), .next_out(next_5),
       .X0_in(t4_0), .Y0(t5_0),
       .X1_in(t4_1), .Y1(t5_1),
       .X2_in(t4_2), .Y2(t5_2),
       .X3_in(t4_3), .Y3(t5_3));


// latency=4, gap=256
   perm74211 instPerm80059(.x0(t5_0), .y0(t6_0),
    .x1(t5_1), .y1(t6_1),
    .x2(t5_2), .y2(t6_2),
    .x3(t5_3), .y3(t6_3),
   .clk(clk), .next(next_5), .next_out(next_6), .reset(reset)
);


// latency=2, gap=256
   codeBlock74214 stage6(.clk(clk), .reset(reset), .next_in(next_6), .next_out(next_7),
       .X0_in(t6_0), .Y0(t7_0),
       .X1_in(t6_1), .Y1(t7_1),
       .X2_in(t6_2), .Y2(t7_2),
       .X3_in(t6_3), .Y3(t7_3));


// latency=4, gap=256
   perm74321 instPerm80060(.x0(t7_0), .y0(t8_0),
    .x1(t7_1), .y1(t8_1),
    .x2(t7_2), .y2(t8_2),
    .x3(t7_3), .y3(t8_3),
   .clk(clk), .next(next_7), .next_out(next_8), .reset(reset)
);


// latency=2, gap=256
   codeBlock74324 stage8(.clk(clk), .reset(reset), .next_in(next_8), .next_out(next_9),
       .X0_in(t8_0), .Y0(t9_0),
       .X1_in(t8_1), .Y1(t9_1),
       .X2_in(t8_2), .Y2(t9_2),
       .X3_in(t8_3), .Y3(t9_3));


// latency=1, gap=256
   codeBlock74431 stage9(.clk(clk), .reset(reset), .next_in(next_9), .next_out(next_10),
       .X0_in(t9_0), .Y0(t10_0),
       .X1_in(t9_1), .Y1(t10_1),
       .X2_in(t9_2), .Y2(t10_2),
       .X3_in(t9_3), .Y3(t10_3));


// latency=2, gap=256
   codeBlock74450 stage10(.clk(clk), .reset(reset), .next_in(next_10), .next_out(next_11),
       .X0_in(t10_0), .Y0(t11_0),
       .X1_in(t10_1), .Y1(t11_1),
       .X2_in(t10_2), .Y2(t11_2),
       .X3_in(t10_3), .Y3(t11_3));


// latency=6, gap=256
   perm74557 instPerm80061(.x0(t11_0), .y0(t12_0),
    .x1(t11_1), .y1(t12_1),
    .x2(t11_2), .y2(t12_2),
    .x3(t11_3), .y3(t12_3),
   .clk(clk), .next(next_11), .next_out(next_12), .reset(reset)
);


// latency=2, gap=256
   codeBlock74560 stage12(.clk(clk), .reset(reset), .next_in(next_12), .next_out(next_13),
       .X0_in(t12_0), .Y0(t13_0),
       .X1_in(t12_1), .Y1(t13_1),
       .X2_in(t12_2), .Y2(t13_2),
       .X3_in(t12_3), .Y3(t13_3));


// latency=5, gap=256
   perm74667 instPerm80062(.x0(t13_0), .y0(t14_0),
    .x1(t13_1), .y1(t14_1),
    .x2(t13_2), .y2(t14_2),
    .x3(t13_3), .y3(t14_3),
   .clk(clk), .next(next_13), .next_out(next_14), .reset(reset)
);


// latency=2, gap=256
   codeBlock74670 stage14(.clk(clk), .reset(reset), .next_in(next_14), .next_out(next_15),
       .X0_in(t14_0), .Y0(t15_0),
       .X1_in(t14_1), .Y1(t15_1),
       .X2_in(t14_2), .Y2(t15_2),
       .X3_in(t14_3), .Y3(t15_3));


// latency=4, gap=256
   perm74777 instPerm80063(.x0(t15_0), .y0(t16_0),
    .x1(t15_1), .y1(t16_1),
    .x2(t15_2), .y2(t16_2),
    .x3(t15_3), .y3(t16_3),
   .clk(clk), .next(next_15), .next_out(next_16), .reset(reset)
);


// latency=2, gap=256
   codeBlock74780 stage16(.clk(clk), .reset(reset), .next_in(next_16), .next_out(next_17),
       .X0_in(t16_0), .Y0(t17_0),
       .X1_in(t16_1), .Y1(t17_1),
       .X2_in(t16_2), .Y2(t17_2),
       .X3_in(t16_3), .Y3(t17_3));


// latency=1, gap=256
   codeBlock74887 stage17(.clk(clk), .reset(reset), .next_in(next_17), .next_out(next_18),
       .X0_in(t17_0), .Y0(t18_0),
       .X1_in(t17_1), .Y1(t18_1),
       .X2_in(t17_2), .Y2(t18_2),
       .X3_in(t17_3), .Y3(t18_3));


// latency=2, gap=256
   codeBlock74906 stage18(.clk(clk), .reset(reset), .next_in(next_18), .next_out(next_19),
       .X0_in(t18_0), .Y0(t19_0),
       .X1_in(t18_1), .Y1(t19_1),
       .X2_in(t18_2), .Y2(t19_2),
       .X3_in(t18_3), .Y3(t19_3));


// latency=10, gap=256
   perm75013 instPerm80064(.x0(t19_0), .y0(t20_0),
    .x1(t19_1), .y1(t20_1),
    .x2(t19_2), .y2(t20_2),
    .x3(t19_3), .y3(t20_3),
   .clk(clk), .next(next_19), .next_out(next_20), .reset(reset)
);


// latency=2, gap=256
   codeBlock75016 stage20(.clk(clk), .reset(reset), .next_in(next_20), .next_out(next_21),
       .X0_in(t20_0), .Y0(t21_0),
       .X1_in(t20_1), .Y1(t21_1),
       .X2_in(t20_2), .Y2(t21_2),
       .X3_in(t20_3), .Y3(t21_3));


// latency=7, gap=256
   perm75123 instPerm80065(.x0(t21_0), .y0(t22_0),
    .x1(t21_1), .y1(t22_1),
    .x2(t21_2), .y2(t22_2),
    .x3(t21_3), .y3(t22_3),
   .clk(clk), .next(next_21), .next_out(next_22), .reset(reset)
);


// latency=2, gap=256
   codeBlock75126 stage22(.clk(clk), .reset(reset), .next_in(next_22), .next_out(next_23),
       .X0_in(t22_0), .Y0(t23_0),
       .X1_in(t22_1), .Y1(t23_1),
       .X2_in(t22_2), .Y2(t23_2),
       .X3_in(t22_3), .Y3(t23_3));


// latency=5, gap=256
   perm75233 instPerm80066(.x0(t23_0), .y0(t24_0),
    .x1(t23_1), .y1(t24_1),
    .x2(t23_2), .y2(t24_2),
    .x3(t23_3), .y3(t24_3),
   .clk(clk), .next(next_23), .next_out(next_24), .reset(reset)
);


// latency=2, gap=256
   codeBlock75236 stage24(.clk(clk), .reset(reset), .next_in(next_24), .next_out(next_25),
       .X0_in(t24_0), .Y0(t25_0),
       .X1_in(t24_1), .Y1(t25_1),
       .X2_in(t24_2), .Y2(t25_2),
       .X3_in(t24_3), .Y3(t25_3));


// latency=4, gap=256
   perm75343 instPerm80067(.x0(t25_0), .y0(t26_0),
    .x1(t25_1), .y1(t26_1),
    .x2(t25_2), .y2(t26_2),
    .x3(t25_3), .y3(t26_3),
   .clk(clk), .next(next_25), .next_out(next_26), .reset(reset)
);


// latency=2, gap=256
   codeBlock75346 stage26(.clk(clk), .reset(reset), .next_in(next_26), .next_out(next_27),
       .X0_in(t26_0), .Y0(t27_0),
       .X1_in(t26_1), .Y1(t27_1),
       .X2_in(t26_2), .Y2(t27_2),
       .X3_in(t26_3), .Y3(t27_3));


// latency=1, gap=256
   codeBlock75453 stage27(.clk(clk), .reset(reset), .next_in(next_27), .next_out(next_28),
       .X0_in(t27_0), .Y0(t28_0),
       .X1_in(t27_1), .Y1(t28_1),
       .X2_in(t27_2), .Y2(t28_2),
       .X3_in(t27_3), .Y3(t28_3));


// latency=2, gap=256
   codeBlock75472 stage28(.clk(clk), .reset(reset), .next_in(next_28), .next_out(next_29),
       .X0_in(t28_0), .Y0(t29_0),
       .X1_in(t28_1), .Y1(t29_1),
       .X2_in(t28_2), .Y2(t29_2),
       .X3_in(t28_3), .Y3(t29_3));


// latency=18, gap=256
   perm75579 instPerm80068(.x0(t29_0), .y0(t30_0),
    .x1(t29_1), .y1(t30_1),
    .x2(t29_2), .y2(t30_2),
    .x3(t29_3), .y3(t30_3),
   .clk(clk), .next(next_29), .next_out(next_30), .reset(reset)
);


// latency=2, gap=256
   codeBlock75582 stage30(.clk(clk), .reset(reset), .next_in(next_30), .next_out(next_31),
       .X0_in(t30_0), .Y0(t31_0),
       .X1_in(t30_1), .Y1(t31_1),
       .X2_in(t30_2), .Y2(t31_2),
       .X3_in(t30_3), .Y3(t31_3));


// latency=11, gap=256
   perm75689 instPerm80069(.x0(t31_0), .y0(t32_0),
    .x1(t31_1), .y1(t32_1),
    .x2(t31_2), .y2(t32_2),
    .x3(t31_3), .y3(t32_3),
   .clk(clk), .next(next_31), .next_out(next_32), .reset(reset)
);


// latency=2, gap=256
   codeBlock75692 stage32(.clk(clk), .reset(reset), .next_in(next_32), .next_out(next_33),
       .X0_in(t32_0), .Y0(t33_0),
       .X1_in(t32_1), .Y1(t33_1),
       .X2_in(t32_2), .Y2(t33_2),
       .X3_in(t32_3), .Y3(t33_3));


// latency=7, gap=256
   perm75799 instPerm80070(.x0(t33_0), .y0(t34_0),
    .x1(t33_1), .y1(t34_1),
    .x2(t33_2), .y2(t34_2),
    .x3(t33_3), .y3(t34_3),
   .clk(clk), .next(next_33), .next_out(next_34), .reset(reset)
);


// latency=2, gap=256
   codeBlock75802 stage34(.clk(clk), .reset(reset), .next_in(next_34), .next_out(next_35),
       .X0_in(t34_0), .Y0(t35_0),
       .X1_in(t34_1), .Y1(t35_1),
       .X2_in(t34_2), .Y2(t35_2),
       .X3_in(t34_3), .Y3(t35_3));


// latency=5, gap=256
   perm75909 instPerm80071(.x0(t35_0), .y0(t36_0),
    .x1(t35_1), .y1(t36_1),
    .x2(t35_2), .y2(t36_2),
    .x3(t35_3), .y3(t36_3),
   .clk(clk), .next(next_35), .next_out(next_36), .reset(reset)
);


// latency=2, gap=256
   codeBlock75912 stage36(.clk(clk), .reset(reset), .next_in(next_36), .next_out(next_37),
       .X0_in(t36_0), .Y0(t37_0),
       .X1_in(t36_1), .Y1(t37_1),
       .X2_in(t36_2), .Y2(t37_2),
       .X3_in(t36_3), .Y3(t37_3));


// latency=4, gap=256
   perm76019 instPerm80072(.x0(t37_0), .y0(t38_0),
    .x1(t37_1), .y1(t38_1),
    .x2(t37_2), .y2(t38_2),
    .x3(t37_3), .y3(t38_3),
   .clk(clk), .next(next_37), .next_out(next_38), .reset(reset)
);


// latency=2, gap=256
   codeBlock76022 stage38(.clk(clk), .reset(reset), .next_in(next_38), .next_out(next_39),
       .X0_in(t38_0), .Y0(t39_0),
       .X1_in(t38_1), .Y1(t39_1),
       .X2_in(t38_2), .Y2(t39_2),
       .X3_in(t38_3), .Y3(t39_3));


// latency=1, gap=256
   codeBlock76129 stage39(.clk(clk), .reset(reset), .next_in(next_39), .next_out(next_40),
       .X0_in(t39_0), .Y0(t40_0),
       .X1_in(t39_1), .Y1(t40_1),
       .X2_in(t39_2), .Y2(t40_2),
       .X3_in(t39_3), .Y3(t40_3));


// latency=2, gap=256
   codeBlock76148 stage40(.clk(clk), .reset(reset), .next_in(next_40), .next_out(next_41),
       .X0_in(t40_0), .Y0(t41_0),
       .X1_in(t40_1), .Y1(t41_1),
       .X2_in(t40_2), .Y2(t41_2),
       .X3_in(t40_3), .Y3(t41_3));


// latency=34, gap=256
   perm76255 instPerm80073(.x0(t41_0), .y0(t42_0),
    .x1(t41_1), .y1(t42_1),
    .x2(t41_2), .y2(t42_2),
    .x3(t41_3), .y3(t42_3),
   .clk(clk), .next(next_41), .next_out(next_42), .reset(reset)
);


// latency=2, gap=256
   codeBlock76258 stage42(.clk(clk), .reset(reset), .next_in(next_42), .next_out(next_43),
       .X0_in(t42_0), .Y0(t43_0),
       .X1_in(t42_1), .Y1(t43_1),
       .X2_in(t42_2), .Y2(t43_2),
       .X3_in(t42_3), .Y3(t43_3));


// latency=19, gap=256
   perm76365 instPerm80074(.x0(t43_0), .y0(t44_0),
    .x1(t43_1), .y1(t44_1),
    .x2(t43_2), .y2(t44_2),
    .x3(t43_3), .y3(t44_3),
   .clk(clk), .next(next_43), .next_out(next_44), .reset(reset)
);


// latency=2, gap=256
   codeBlock76368 stage44(.clk(clk), .reset(reset), .next_in(next_44), .next_out(next_45),
       .X0_in(t44_0), .Y0(t45_0),
       .X1_in(t44_1), .Y1(t45_1),
       .X2_in(t44_2), .Y2(t45_2),
       .X3_in(t44_3), .Y3(t45_3));


// latency=11, gap=256
   perm76475 instPerm80075(.x0(t45_0), .y0(t46_0),
    .x1(t45_1), .y1(t46_1),
    .x2(t45_2), .y2(t46_2),
    .x3(t45_3), .y3(t46_3),
   .clk(clk), .next(next_45), .next_out(next_46), .reset(reset)
);


// latency=2, gap=256
   codeBlock76478 stage46(.clk(clk), .reset(reset), .next_in(next_46), .next_out(next_47),
       .X0_in(t46_0), .Y0(t47_0),
       .X1_in(t46_1), .Y1(t47_1),
       .X2_in(t46_2), .Y2(t47_2),
       .X3_in(t46_3), .Y3(t47_3));


// latency=7, gap=256
   perm76585 instPerm80076(.x0(t47_0), .y0(t48_0),
    .x1(t47_1), .y1(t48_1),
    .x2(t47_2), .y2(t48_2),
    .x3(t47_3), .y3(t48_3),
   .clk(clk), .next(next_47), .next_out(next_48), .reset(reset)
);


// latency=2, gap=256
   codeBlock76588 stage48(.clk(clk), .reset(reset), .next_in(next_48), .next_out(next_49),
       .X0_in(t48_0), .Y0(t49_0),
       .X1_in(t48_1), .Y1(t49_1),
       .X2_in(t48_2), .Y2(t49_2),
       .X3_in(t48_3), .Y3(t49_3));


// latency=5, gap=256
   perm76695 instPerm80077(.x0(t49_0), .y0(t50_0),
    .x1(t49_1), .y1(t50_1),
    .x2(t49_2), .y2(t50_2),
    .x3(t49_3), .y3(t50_3),
   .clk(clk), .next(next_49), .next_out(next_50), .reset(reset)
);


// latency=2, gap=256
   codeBlock76698 stage50(.clk(clk), .reset(reset), .next_in(next_50), .next_out(next_51),
       .X0_in(t50_0), .Y0(t51_0),
       .X1_in(t50_1), .Y1(t51_1),
       .X2_in(t50_2), .Y2(t51_2),
       .X3_in(t50_3), .Y3(t51_3));


// latency=4, gap=256
   perm76805 instPerm80078(.x0(t51_0), .y0(t52_0),
    .x1(t51_1), .y1(t52_1),
    .x2(t51_2), .y2(t52_2),
    .x3(t51_3), .y3(t52_3),
   .clk(clk), .next(next_51), .next_out(next_52), .reset(reset)
);


// latency=2, gap=256
   codeBlock76808 stage52(.clk(clk), .reset(reset), .next_in(next_52), .next_out(next_53),
       .X0_in(t52_0), .Y0(t53_0),
       .X1_in(t52_1), .Y1(t53_1),
       .X2_in(t52_2), .Y2(t53_2),
       .X3_in(t52_3), .Y3(t53_3));


// latency=1, gap=256
   codeBlock76915 stage53(.clk(clk), .reset(reset), .next_in(next_53), .next_out(next_54),
       .X0_in(t53_0), .Y0(t54_0),
       .X1_in(t53_1), .Y1(t54_1),
       .X2_in(t53_2), .Y2(t54_2),
       .X3_in(t53_3), .Y3(t54_3));


// latency=2, gap=256
   codeBlock76934 stage54(.clk(clk), .reset(reset), .next_in(next_54), .next_out(next_55),
       .X0_in(t54_0), .Y0(t55_0),
       .X1_in(t54_1), .Y1(t55_1),
       .X2_in(t54_2), .Y2(t55_2),
       .X3_in(t54_3), .Y3(t55_3));


// latency=66, gap=256
   perm77041 instPerm80079(.x0(t55_0), .y0(t56_0),
    .x1(t55_1), .y1(t56_1),
    .x2(t55_2), .y2(t56_2),
    .x3(t55_3), .y3(t56_3),
   .clk(clk), .next(next_55), .next_out(next_56), .reset(reset)
);


// latency=2, gap=256
   codeBlock77044 stage56(.clk(clk), .reset(reset), .next_in(next_56), .next_out(next_57),
       .X0_in(t56_0), .Y0(t57_0),
       .X1_in(t56_1), .Y1(t57_1),
       .X2_in(t56_2), .Y2(t57_2),
       .X3_in(t56_3), .Y3(t57_3));


// latency=35, gap=256
   perm77151 instPerm80080(.x0(t57_0), .y0(t58_0),
    .x1(t57_1), .y1(t58_1),
    .x2(t57_2), .y2(t58_2),
    .x3(t57_3), .y3(t58_3),
   .clk(clk), .next(next_57), .next_out(next_58), .reset(reset)
);


// latency=2, gap=256
   codeBlock77154 stage58(.clk(clk), .reset(reset), .next_in(next_58), .next_out(next_59),
       .X0_in(t58_0), .Y0(t59_0),
       .X1_in(t58_1), .Y1(t59_1),
       .X2_in(t58_2), .Y2(t59_2),
       .X3_in(t58_3), .Y3(t59_3));


// latency=19, gap=256
   perm77261 instPerm80081(.x0(t59_0), .y0(t60_0),
    .x1(t59_1), .y1(t60_1),
    .x2(t59_2), .y2(t60_2),
    .x3(t59_3), .y3(t60_3),
   .clk(clk), .next(next_59), .next_out(next_60), .reset(reset)
);


// latency=2, gap=256
   codeBlock77264 stage60(.clk(clk), .reset(reset), .next_in(next_60), .next_out(next_61),
       .X0_in(t60_0), .Y0(t61_0),
       .X1_in(t60_1), .Y1(t61_1),
       .X2_in(t60_2), .Y2(t61_2),
       .X3_in(t60_3), .Y3(t61_3));


// latency=11, gap=256
   perm77371 instPerm80082(.x0(t61_0), .y0(t62_0),
    .x1(t61_1), .y1(t62_1),
    .x2(t61_2), .y2(t62_2),
    .x3(t61_3), .y3(t62_3),
   .clk(clk), .next(next_61), .next_out(next_62), .reset(reset)
);


// latency=2, gap=256
   codeBlock77374 stage62(.clk(clk), .reset(reset), .next_in(next_62), .next_out(next_63),
       .X0_in(t62_0), .Y0(t63_0),
       .X1_in(t62_1), .Y1(t63_1),
       .X2_in(t62_2), .Y2(t63_2),
       .X3_in(t62_3), .Y3(t63_3));


// latency=7, gap=256
   perm77481 instPerm80083(.x0(t63_0), .y0(t64_0),
    .x1(t63_1), .y1(t64_1),
    .x2(t63_2), .y2(t64_2),
    .x3(t63_3), .y3(t64_3),
   .clk(clk), .next(next_63), .next_out(next_64), .reset(reset)
);


// latency=2, gap=256
   codeBlock77484 stage64(.clk(clk), .reset(reset), .next_in(next_64), .next_out(next_65),
       .X0_in(t64_0), .Y0(t65_0),
       .X1_in(t64_1), .Y1(t65_1),
       .X2_in(t64_2), .Y2(t65_2),
       .X3_in(t64_3), .Y3(t65_3));


// latency=5, gap=256
   perm77591 instPerm80084(.x0(t65_0), .y0(t66_0),
    .x1(t65_1), .y1(t66_1),
    .x2(t65_2), .y2(t66_2),
    .x3(t65_3), .y3(t66_3),
   .clk(clk), .next(next_65), .next_out(next_66), .reset(reset)
);


// latency=2, gap=256
   codeBlock77594 stage66(.clk(clk), .reset(reset), .next_in(next_66), .next_out(next_67),
       .X0_in(t66_0), .Y0(t67_0),
       .X1_in(t66_1), .Y1(t67_1),
       .X2_in(t66_2), .Y2(t67_2),
       .X3_in(t66_3), .Y3(t67_3));


// latency=4, gap=256
   perm77701 instPerm80085(.x0(t67_0), .y0(t68_0),
    .x1(t67_1), .y1(t68_1),
    .x2(t67_2), .y2(t68_2),
    .x3(t67_3), .y3(t68_3),
   .clk(clk), .next(next_67), .next_out(next_68), .reset(reset)
);


// latency=2, gap=256
   codeBlock77704 stage68(.clk(clk), .reset(reset), .next_in(next_68), .next_out(next_69),
       .X0_in(t68_0), .Y0(t69_0),
       .X1_in(t68_1), .Y1(t69_1),
       .X2_in(t68_2), .Y2(t69_2),
       .X3_in(t68_3), .Y3(t69_3));


// latency=1, gap=256
   codeBlock77811 stage69(.clk(clk), .reset(reset), .next_in(next_69), .next_out(next_70),
       .X0_in(t69_0), .Y0(t70_0),
       .X1_in(t69_1), .Y1(t70_1),
       .X2_in(t69_2), .Y2(t70_2),
       .X3_in(t69_3), .Y3(t70_3));


// latency=2, gap=256
   codeBlock77830 stage70(.clk(clk), .reset(reset), .next_in(next_70), .next_out(next_71),
       .X0_in(t70_0), .Y0(t71_0),
       .X1_in(t70_1), .Y1(t71_1),
       .X2_in(t70_2), .Y2(t71_2),
       .X3_in(t70_3), .Y3(t71_3));


// latency=130, gap=256
   perm77937 instPerm80086(.x0(t71_0), .y0(t72_0),
    .x1(t71_1), .y1(t72_1),
    .x2(t71_2), .y2(t72_2),
    .x3(t71_3), .y3(t72_3),
   .clk(clk), .next(next_71), .next_out(next_72), .reset(reset)
);


// latency=2, gap=256
   codeBlock77940 stage72(.clk(clk), .reset(reset), .next_in(next_72), .next_out(next_73),
       .X0_in(t72_0), .Y0(t73_0),
       .X1_in(t72_1), .Y1(t73_1),
       .X2_in(t72_2), .Y2(t73_2),
       .X3_in(t72_3), .Y3(t73_3));


// latency=67, gap=256
   perm78047 instPerm80087(.x0(t73_0), .y0(t74_0),
    .x1(t73_1), .y1(t74_1),
    .x2(t73_2), .y2(t74_2),
    .x3(t73_3), .y3(t74_3),
   .clk(clk), .next(next_73), .next_out(next_74), .reset(reset)
);


// latency=2, gap=256
   codeBlock78050 stage74(.clk(clk), .reset(reset), .next_in(next_74), .next_out(next_75),
       .X0_in(t74_0), .Y0(t75_0),
       .X1_in(t74_1), .Y1(t75_1),
       .X2_in(t74_2), .Y2(t75_2),
       .X3_in(t74_3), .Y3(t75_3));


// latency=35, gap=256
   perm78157 instPerm80088(.x0(t75_0), .y0(t76_0),
    .x1(t75_1), .y1(t76_1),
    .x2(t75_2), .y2(t76_2),
    .x3(t75_3), .y3(t76_3),
   .clk(clk), .next(next_75), .next_out(next_76), .reset(reset)
);


// latency=2, gap=256
   codeBlock78160 stage76(.clk(clk), .reset(reset), .next_in(next_76), .next_out(next_77),
       .X0_in(t76_0), .Y0(t77_0),
       .X1_in(t76_1), .Y1(t77_1),
       .X2_in(t76_2), .Y2(t77_2),
       .X3_in(t76_3), .Y3(t77_3));


// latency=19, gap=256
   perm78267 instPerm80089(.x0(t77_0), .y0(t78_0),
    .x1(t77_1), .y1(t78_1),
    .x2(t77_2), .y2(t78_2),
    .x3(t77_3), .y3(t78_3),
   .clk(clk), .next(next_77), .next_out(next_78), .reset(reset)
);


// latency=2, gap=256
   codeBlock78270 stage78(.clk(clk), .reset(reset), .next_in(next_78), .next_out(next_79),
       .X0_in(t78_0), .Y0(t79_0),
       .X1_in(t78_1), .Y1(t79_1),
       .X2_in(t78_2), .Y2(t79_2),
       .X3_in(t78_3), .Y3(t79_3));


// latency=11, gap=256
   perm78377 instPerm80090(.x0(t79_0), .y0(t80_0),
    .x1(t79_1), .y1(t80_1),
    .x2(t79_2), .y2(t80_2),
    .x3(t79_3), .y3(t80_3),
   .clk(clk), .next(next_79), .next_out(next_80), .reset(reset)
);


// latency=2, gap=256
   codeBlock78380 stage80(.clk(clk), .reset(reset), .next_in(next_80), .next_out(next_81),
       .X0_in(t80_0), .Y0(t81_0),
       .X1_in(t80_1), .Y1(t81_1),
       .X2_in(t80_2), .Y2(t81_2),
       .X3_in(t80_3), .Y3(t81_3));


// latency=7, gap=256
   perm78487 instPerm80091(.x0(t81_0), .y0(t82_0),
    .x1(t81_1), .y1(t82_1),
    .x2(t81_2), .y2(t82_2),
    .x3(t81_3), .y3(t82_3),
   .clk(clk), .next(next_81), .next_out(next_82), .reset(reset)
);


// latency=2, gap=256
   codeBlock78490 stage82(.clk(clk), .reset(reset), .next_in(next_82), .next_out(next_83),
       .X0_in(t82_0), .Y0(t83_0),
       .X1_in(t82_1), .Y1(t83_1),
       .X2_in(t82_2), .Y2(t83_2),
       .X3_in(t82_3), .Y3(t83_3));


// latency=5, gap=256
   perm78597 instPerm80092(.x0(t83_0), .y0(t84_0),
    .x1(t83_1), .y1(t84_1),
    .x2(t83_2), .y2(t84_2),
    .x3(t83_3), .y3(t84_3),
   .clk(clk), .next(next_83), .next_out(next_84), .reset(reset)
);


// latency=2, gap=256
   codeBlock78600 stage84(.clk(clk), .reset(reset), .next_in(next_84), .next_out(next_85),
       .X0_in(t84_0), .Y0(t85_0),
       .X1_in(t84_1), .Y1(t85_1),
       .X2_in(t84_2), .Y2(t85_2),
       .X3_in(t84_3), .Y3(t85_3));


// latency=4, gap=256
   perm78707 instPerm80093(.x0(t85_0), .y0(t86_0),
    .x1(t85_1), .y1(t86_1),
    .x2(t85_2), .y2(t86_2),
    .x3(t85_3), .y3(t86_3),
   .clk(clk), .next(next_85), .next_out(next_86), .reset(reset)
);


// latency=2, gap=256
   codeBlock78710 stage86(.clk(clk), .reset(reset), .next_in(next_86), .next_out(next_87),
       .X0_in(t86_0), .Y0(t87_0),
       .X1_in(t86_1), .Y1(t87_1),
       .X2_in(t86_2), .Y2(t87_2),
       .X3_in(t86_3), .Y3(t87_3));


// latency=1, gap=256
   codeBlock78817 stage87(.clk(clk), .reset(reset), .next_in(next_87), .next_out(next_88),
       .X0_in(t87_0), .Y0(t88_0),
       .X1_in(t87_1), .Y1(t88_1),
       .X2_in(t87_2), .Y2(t88_2),
       .X3_in(t87_3), .Y3(t88_3));


// latency=2, gap=256
   codeBlock78836 stage88(.clk(clk), .reset(reset), .next_in(next_88), .next_out(next_89),
       .X0_in(t88_0), .Y0(t89_0),
       .X1_in(t88_1), .Y1(t89_1),
       .X2_in(t88_2), .Y2(t89_2),
       .X3_in(t88_3), .Y3(t89_3));


// latency=258, gap=256
   perm78943 instPerm80094(.x0(t89_0), .y0(t90_0),
    .x1(t89_1), .y1(t90_1),
    .x2(t89_2), .y2(t90_2),
    .x3(t89_3), .y3(t90_3),
   .clk(clk), .next(next_89), .next_out(next_90), .reset(reset)
);


// latency=2, gap=256
   codeBlock78945 stage90(.clk(clk), .reset(reset), .next_in(next_90), .next_out(next_91),
       .X0_in(t90_0), .Y0(t91_0),
       .X1_in(t90_1), .Y1(t91_1),
       .X2_in(t90_2), .Y2(t91_2),
       .X3_in(t90_3), .Y3(t91_3));


// latency=131, gap=256
   perm79052 instPerm80095(.x0(t91_0), .y0(t92_0),
    .x1(t91_1), .y1(t92_1),
    .x2(t91_2), .y2(t92_2),
    .x3(t91_3), .y3(t92_3),
   .clk(clk), .next(next_91), .next_out(next_92), .reset(reset)
);


// latency=2, gap=256
   codeBlock79054 stage92(.clk(clk), .reset(reset), .next_in(next_92), .next_out(next_93),
       .X0_in(t92_0), .Y0(t93_0),
       .X1_in(t92_1), .Y1(t93_1),
       .X2_in(t92_2), .Y2(t93_2),
       .X3_in(t92_3), .Y3(t93_3));


// latency=67, gap=256
   perm79161 instPerm80096(.x0(t93_0), .y0(t94_0),
    .x1(t93_1), .y1(t94_1),
    .x2(t93_2), .y2(t94_2),
    .x3(t93_3), .y3(t94_3),
   .clk(clk), .next(next_93), .next_out(next_94), .reset(reset)
);


// latency=2, gap=256
   codeBlock79164 stage94(.clk(clk), .reset(reset), .next_in(next_94), .next_out(next_95),
       .X0_in(t94_0), .Y0(t95_0),
       .X1_in(t94_1), .Y1(t95_1),
       .X2_in(t94_2), .Y2(t95_2),
       .X3_in(t94_3), .Y3(t95_3));


// latency=35, gap=256
   perm79271 instPerm80097(.x0(t95_0), .y0(t96_0),
    .x1(t95_1), .y1(t96_1),
    .x2(t95_2), .y2(t96_2),
    .x3(t95_3), .y3(t96_3),
   .clk(clk), .next(next_95), .next_out(next_96), .reset(reset)
);


// latency=2, gap=256
   codeBlock79274 stage96(.clk(clk), .reset(reset), .next_in(next_96), .next_out(next_97),
       .X0_in(t96_0), .Y0(t97_0),
       .X1_in(t96_1), .Y1(t97_1),
       .X2_in(t96_2), .Y2(t97_2),
       .X3_in(t96_3), .Y3(t97_3));


// latency=19, gap=256
   perm79381 instPerm80098(.x0(t97_0), .y0(t98_0),
    .x1(t97_1), .y1(t98_1),
    .x2(t97_2), .y2(t98_2),
    .x3(t97_3), .y3(t98_3),
   .clk(clk), .next(next_97), .next_out(next_98), .reset(reset)
);


// latency=2, gap=256
   codeBlock79384 stage98(.clk(clk), .reset(reset), .next_in(next_98), .next_out(next_99),
       .X0_in(t98_0), .Y0(t99_0),
       .X1_in(t98_1), .Y1(t99_1),
       .X2_in(t98_2), .Y2(t99_2),
       .X3_in(t98_3), .Y3(t99_3));


// latency=11, gap=256
   perm79491 instPerm80099(.x0(t99_0), .y0(t100_0),
    .x1(t99_1), .y1(t100_1),
    .x2(t99_2), .y2(t100_2),
    .x3(t99_3), .y3(t100_3),
   .clk(clk), .next(next_99), .next_out(next_100), .reset(reset)
);


// latency=2, gap=256
   codeBlock79494 stage100(.clk(clk), .reset(reset), .next_in(next_100), .next_out(next_101),
       .X0_in(t100_0), .Y0(t101_0),
       .X1_in(t100_1), .Y1(t101_1),
       .X2_in(t100_2), .Y2(t101_2),
       .X3_in(t100_3), .Y3(t101_3));


// latency=7, gap=256
   perm79601 instPerm80100(.x0(t101_0), .y0(t102_0),
    .x1(t101_1), .y1(t102_1),
    .x2(t101_2), .y2(t102_2),
    .x3(t101_3), .y3(t102_3),
   .clk(clk), .next(next_101), .next_out(next_102), .reset(reset)
);


// latency=2, gap=256
   codeBlock79604 stage102(.clk(clk), .reset(reset), .next_in(next_102), .next_out(next_103),
       .X0_in(t102_0), .Y0(t103_0),
       .X1_in(t102_1), .Y1(t103_1),
       .X2_in(t102_2), .Y2(t103_2),
       .X3_in(t102_3), .Y3(t103_3));


// latency=5, gap=256
   perm79711 instPerm80101(.x0(t103_0), .y0(t104_0),
    .x1(t103_1), .y1(t104_1),
    .x2(t103_2), .y2(t104_2),
    .x3(t103_3), .y3(t104_3),
   .clk(clk), .next(next_103), .next_out(next_104), .reset(reset)
);


// latency=2, gap=256
   codeBlock79714 stage104(.clk(clk), .reset(reset), .next_in(next_104), .next_out(next_105),
       .X0_in(t104_0), .Y0(t105_0),
       .X1_in(t104_1), .Y1(t105_1),
       .X2_in(t104_2), .Y2(t105_2),
       .X3_in(t104_3), .Y3(t105_3));


// latency=4, gap=256
   perm79821 instPerm80102(.x0(t105_0), .y0(t106_0),
    .x1(t105_1), .y1(t106_1),
    .x2(t105_2), .y2(t106_2),
    .x3(t105_3), .y3(t106_3),
   .clk(clk), .next(next_105), .next_out(next_106), .reset(reset)
);


// latency=2, gap=256
   codeBlock79824 stage106(.clk(clk), .reset(reset), .next_in(next_106), .next_out(next_107),
       .X0_in(t106_0), .Y0(t107_0),
       .X1_in(t106_1), .Y1(t107_1),
       .X2_in(t106_2), .Y2(t107_2),
       .X3_in(t106_3), .Y3(t107_3));


// latency=1, gap=256
   codeBlock79931 stage107(.clk(clk), .reset(reset), .next_in(next_107), .next_out(next_108),
       .X0_in(t107_0), .Y0(t108_0),
       .X1_in(t107_1), .Y1(t108_1),
       .X2_in(t107_2), .Y2(t108_2),
       .X3_in(t107_3), .Y3(t108_3));


// latency=2, gap=256
   codeBlock79950 stage108(.clk(clk), .reset(reset), .next_in(next_108), .next_out(next_109),
       .X0_in(t108_0), .Y0(t109_0),
       .X1_in(t108_1), .Y1(t109_1),
       .X2_in(t108_2), .Y2(t109_2),
       .X3_in(t108_3), .Y3(t109_3));


endmodule

// Latency: 2
// Gap: 1
module codeBlock73852(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80105(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6450;
   wire signed [31:0] a6451;
   wire  [0:0] a6448;
   wire signed [31:0] a6456;
   wire signed [31:0] a6457;
   wire  [0:0] a6449;
   reg signed [31:0] t3038;
   reg signed [31:0] t3039;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t3040;
   reg signed [31:0] t3041;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6450 = X0;
   assign a6451 = X1;
   assign a6448 = (a6450 <= a6451)  ? 1 : 0

;
   assign a6456 = X2;
   assign a6457 = X3;
   assign a6449 = (a6456 <= a6457)  ? 1 : 0

;
   assign Y0 = t3038;
   assign Y1 = t3039;
   assign Y2 = t3040;
   assign Y3 = t3041;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t3038 <= (a6448 == 1) ? a6450 : a6451;
         t3039 <= (a6448 == 1) ? a6451 : a6450;
         t3040 <= (a6449 == 1) ? a6456 : a6457;
         t3041 <= (a6449 == 1) ? a6457 : a6456;
      end
   end
endmodule

module shiftRegFIFO(X, Y, clk);
   parameter depth=1, width=1;

   output [width-1:0] Y;
   input  [width-1:0] X;
   input              clk;

   reg [width-1:0]    mem [depth-1:0];
   integer            index;

   assign Y = mem[depth-1];

   always @ (posedge clk) begin
      for(index=1;index<depth;index=index+1) begin
         mem[index] <= mem[index-1];
      end
      mem[0]<=X;
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock73959(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X3;
   assign Y2 = X1;
   assign Y3 = X2;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock73978(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80110(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6416;
   wire signed [31:0] a6417;
   wire  [0:0] a6414;
   wire signed [31:0] a6422;
   wire signed [31:0] a6423;
   wire  [0:0] a6415;
   reg signed [31:0] t3022;
   reg signed [31:0] t3023;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t3024;
   reg signed [31:0] t3025;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6416 = X0;
   assign a6417 = X1;
   assign a6414 = (a6416 <= a6417)  ? 1 : 0

;
   assign a6422 = X2;
   assign a6423 = X3;
   assign a6415 = (a6422 <= a6423)  ? 1 : 0

;
   assign Y0 = t3022;
   assign Y1 = t3023;
   assign Y2 = t3024;
   assign Y3 = t3025;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t3022 <= (a6414 == 1) ? a6416 : a6417;
         t3023 <= (a6414 == 1) ? a6417 : a6416;
         t3024 <= (a6415 == 1) ? a6422 : a6423;
         t3025 <= (a6415 == 1) ? a6423 : a6422;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock74085(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock74104(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80115(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6382;
   wire signed [31:0] a6383;
   wire  [0:0] a6380;
   wire signed [31:0] a6388;
   wire signed [31:0] a6389;
   wire  [0:0] a6381;
   reg signed [31:0] t3006;
   reg signed [31:0] t3007;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t3008;
   reg signed [31:0] t3009;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6382 = X0;
   assign a6383 = X1;
   assign a6380 = (a6382 <= a6383)  ? 1 : 0

;
   assign a6388 = X2;
   assign a6389 = X3;
   assign a6381 = (a6388 <= a6389)  ? 1 : 0

;
   assign Y0 = t3006;
   assign Y1 = t3007;
   assign Y2 = t3008;
   assign Y3 = t3009;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t3006 <= (a6380 == 1) ? a6382 : a6383;
         t3007 <= (a6380 == 1) ? a6383 : a6382;
         t3008 <= (a6381 == 1) ? a6388 : a6389;
         t3009 <= (a6381 == 1) ? a6389 : a6388;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm74211(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[2] ^ addr0[0];
   assign inAddr0[0] = addr0[2] ^ addr0[1];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[2] ^ addr1[0];
   assign inAddr1[0] = addr1[2] ^ addr1[1];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[2] ^ addr2[0];
   assign inAddr2[0] = addr2[2] ^ addr2[1];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[2] ^ addr3[0];
   assign inAddr3[0] = addr3[2] ^ addr3[1];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80118(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80121(.X(next0), .Y(next_out), .clk(clk));


   memArray8_74211 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_74211(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80124(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule


module memMod(in, out, inAddr, outAddr, writeSel, clk);
   
   parameter depth=1024, width=16, logDepth=10;
   
   input [width-1:0]    in;
   input [logDepth-1:0] inAddr, outAddr;
   input 	        writeSel, clk;
   output [width-1:0] 	out;
   reg [width-1:0] 	out;
   
   // synthesis attribute ram_style of mem is block

   reg [width-1:0] 	mem[depth-1:0]; 
   
   always @(posedge clk) begin
      out <= mem[outAddr];
      
      if (writeSel)
        mem[inAddr] <= in;
   end
endmodule 



module memMod_dist(in, out, inAddr, outAddr, writeSel, clk);
   
   parameter depth=1024, width=16, logDepth=10;
   
   input [width-1:0]    in;
   input [logDepth-1:0] inAddr, outAddr;
   input 	        writeSel, clk;
   output [width-1:0] 	out;
   reg [width-1:0] 	out;
   
   // synthesis attribute ram_style of mem is distributed

   reg [width-1:0] 	mem[depth-1:0]; 
   
   always @(posedge clk) begin
      out <= mem[outAddr];
      
      if (writeSel)
        mem[inAddr] <= in;
   end
endmodule 

module switch(ctrl, x0, x1, y0, y1);
    parameter width = 16;
    input [width-1:0] x0, x1;
    output [width-1:0] y0, y1;
    input ctrl;
    assign y0 = (ctrl == 0) ? x0 : x1;
    assign y1 = (ctrl == 0) ? x1 : x0;
endmodule

// Latency: 2
// Gap: 1
module codeBlock74214(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80127(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6348;
   wire signed [31:0] a6349;
   wire  [0:0] a6346;
   wire signed [31:0] a6354;
   wire signed [31:0] a6355;
   wire  [0:0] a6347;
   reg signed [31:0] t2990;
   reg signed [31:0] t2991;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2992;
   reg signed [31:0] t2993;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6348 = X0;
   assign a6349 = X1;
   assign a6346 = (a6348 <= a6349)  ? 1 : 0

;
   assign a6354 = X2;
   assign a6355 = X3;
   assign a6347 = (a6354 <= a6355)  ? 1 : 0

;
   assign Y0 = t2990;
   assign Y1 = t2991;
   assign Y2 = t2992;
   assign Y3 = t2993;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2990 <= (a6346 == 1) ? a6348 : a6349;
         t2991 <= (a6346 == 1) ? a6349 : a6348;
         t2992 <= (a6347 == 1) ? a6354 : a6355;
         t2993 <= (a6347 == 1) ? a6355 : a6354;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm74321(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80130(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80133(.X(next0), .Y(next_out), .clk(clk));


   memArray8_74321 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_74321(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80136(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock74324(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80139(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6314;
   wire signed [31:0] a6315;
   wire  [0:0] a6312;
   wire signed [31:0] a6320;
   wire signed [31:0] a6321;
   wire  [0:0] a6313;
   reg signed [31:0] t2974;
   reg signed [31:0] t2975;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2976;
   reg signed [31:0] t2977;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6314 = X0;
   assign a6315 = X1;
   assign a6312 = (a6314 <= a6315)  ? 1 : 0

;
   assign a6320 = X2;
   assign a6321 = X3;
   assign a6313 = (a6320 <= a6321)  ? 1 : 0

;
   assign Y0 = t2974;
   assign Y1 = t2975;
   assign Y2 = t2976;
   assign Y3 = t2977;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2974 <= (a6312 == 1) ? a6314 : a6315;
         t2975 <= (a6312 == 1) ? a6315 : a6314;
         t2976 <= (a6313 == 1) ? a6320 : a6321;
         t2977 <= (a6313 == 1) ? a6321 : a6320;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock74431(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock74450(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80144(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6280;
   wire signed [31:0] a6281;
   wire  [0:0] a6278;
   wire signed [31:0] a6286;
   wire signed [31:0] a6287;
   wire  [0:0] a6279;
   reg signed [31:0] t2958;
   reg signed [31:0] t2959;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2960;
   reg signed [31:0] t2961;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6280 = X0;
   assign a6281 = X1;
   assign a6278 = (a6280 <= a6281)  ? 1 : 0

;
   assign a6286 = X2;
   assign a6287 = X3;
   assign a6279 = (a6286 <= a6287)  ? 1 : 0

;
   assign Y0 = t2958;
   assign Y1 = t2959;
   assign Y2 = t2960;
   assign Y3 = t2961;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2958 <= (a6278 == 1) ? a6280 : a6281;
         t2959 <= (a6278 == 1) ? a6281 : a6280;
         t2960 <= (a6279 == 1) ? a6286 : a6287;
         t2961 <= (a6279 == 1) ? a6287 : a6286;
      end
   end
endmodule

// Latency: 6
// Gap: 4
module perm74557(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[3] ^ addr0[0];
   assign inAddr0[0] = addr0[3] ^ addr0[1];
   assign inAddr0[1] = addr0[3] ^ addr0[2];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[3] ^ addr1[0];
   assign inAddr1[0] = addr1[3] ^ addr1[1];
   assign inAddr1[1] = addr1[3] ^ addr1[2];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[3] ^ addr2[0];
   assign inAddr2[0] = addr2[3] ^ addr2[1];
   assign inAddr2[1] = addr2[3] ^ addr2[2];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[3] ^ addr3[0];
   assign inAddr3[0] = addr3[3] ^ addr3[1];
   assign inAddr3[1] = addr3[3] ^ addr3[2];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(4, 1) shiftFIFO_80147(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80150(.X(next0), .Y(next_out), .clk(clk));


   memArray16_74557 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;
    reg resetOutCountRd2_5;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
            resetOutCountRd2_5 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            resetOutCountRd2_5 <= resetOutCountRd2_4;
            if (resetOutCountRd2_5 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 3)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 3) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 3)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_74557(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80153(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock74560(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80156(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6246;
   wire signed [31:0] a6247;
   wire  [0:0] a6244;
   wire signed [31:0] a6252;
   wire signed [31:0] a6253;
   wire  [0:0] a6245;
   reg signed [31:0] t2942;
   reg signed [31:0] t2943;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2944;
   reg signed [31:0] t2945;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6246 = X0;
   assign a6247 = X1;
   assign a6244 = (a6246 <= a6247)  ? 1 : 0

;
   assign a6252 = X2;
   assign a6253 = X3;
   assign a6245 = (a6252 <= a6253)  ? 1 : 0

;
   assign Y0 = t2942;
   assign Y1 = t2943;
   assign Y2 = t2944;
   assign Y3 = t2945;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2942 <= (a6244 == 1) ? a6246 : a6247;
         t2943 <= (a6244 == 1) ? a6247 : a6246;
         t2944 <= (a6245 == 1) ? a6252 : a6253;
         t2945 <= (a6245 == 1) ? a6253 : a6252;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm74667(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80159(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80162(.X(next0), .Y(next_out), .clk(clk));


   memArray16_74667 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_74667(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80165(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock74670(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80168(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6212;
   wire signed [31:0] a6213;
   wire  [0:0] a6210;
   wire signed [31:0] a6218;
   wire signed [31:0] a6219;
   wire  [0:0] a6211;
   reg signed [31:0] t2926;
   reg signed [31:0] t2927;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2928;
   reg signed [31:0] t2929;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6212 = X0;
   assign a6213 = X1;
   assign a6210 = (a6212 <= a6213)  ? 1 : 0

;
   assign a6218 = X2;
   assign a6219 = X3;
   assign a6211 = (a6218 <= a6219)  ? 1 : 0

;
   assign Y0 = t2926;
   assign Y1 = t2927;
   assign Y2 = t2928;
   assign Y3 = t2929;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2926 <= (a6210 == 1) ? a6212 : a6213;
         t2927 <= (a6210 == 1) ? a6213 : a6212;
         t2928 <= (a6211 == 1) ? a6218 : a6219;
         t2929 <= (a6211 == 1) ? a6219 : a6218;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm74777(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80171(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80174(.X(next0), .Y(next_out), .clk(clk));


   memArray8_74777 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_74777(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80177(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock74780(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80180(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6178;
   wire signed [31:0] a6179;
   wire  [0:0] a6176;
   wire signed [31:0] a6184;
   wire signed [31:0] a6185;
   wire  [0:0] a6177;
   reg signed [31:0] t2910;
   reg signed [31:0] t2911;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2912;
   reg signed [31:0] t2913;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6178 = X0;
   assign a6179 = X1;
   assign a6176 = (a6178 <= a6179)  ? 1 : 0

;
   assign a6184 = X2;
   assign a6185 = X3;
   assign a6177 = (a6184 <= a6185)  ? 1 : 0

;
   assign Y0 = t2910;
   assign Y1 = t2911;
   assign Y2 = t2912;
   assign Y3 = t2913;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2910 <= (a6176 == 1) ? a6178 : a6179;
         t2911 <= (a6176 == 1) ? a6179 : a6178;
         t2912 <= (a6177 == 1) ? a6184 : a6185;
         t2913 <= (a6177 == 1) ? a6185 : a6184;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock74887(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock74906(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80185(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6144;
   wire signed [31:0] a6145;
   wire  [0:0] a6142;
   wire signed [31:0] a6150;
   wire signed [31:0] a6151;
   wire  [0:0] a6143;
   reg signed [31:0] t2894;
   reg signed [31:0] t2895;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2896;
   reg signed [31:0] t2897;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6144 = X0;
   assign a6145 = X1;
   assign a6142 = (a6144 <= a6145)  ? 1 : 0

;
   assign a6150 = X2;
   assign a6151 = X3;
   assign a6143 = (a6150 <= a6151)  ? 1 : 0

;
   assign Y0 = t2894;
   assign Y1 = t2895;
   assign Y2 = t2896;
   assign Y3 = t2897;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2894 <= (a6142 == 1) ? a6144 : a6145;
         t2895 <= (a6142 == 1) ? a6145 : a6144;
         t2896 <= (a6143 == 1) ? a6150 : a6151;
         t2897 <= (a6143 == 1) ? a6151 : a6150;
      end
   end
endmodule

// Latency: 10
// Gap: 8
module perm75013(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[4] ^ addr0[0];
   assign inAddr0[0] = addr0[4] ^ addr0[1];
   assign inAddr0[1] = addr0[4] ^ addr0[2];
   assign inAddr0[2] = addr0[4] ^ addr0[3];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[4] ^ addr1[0];
   assign inAddr1[0] = addr1[4] ^ addr1[1];
   assign inAddr1[1] = addr1[4] ^ addr1[2];
   assign inAddr1[2] = addr1[4] ^ addr1[3];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[4] ^ addr2[0];
   assign inAddr2[0] = addr2[4] ^ addr2[1];
   assign inAddr2[1] = addr2[4] ^ addr2[2];
   assign inAddr2[2] = addr2[4] ^ addr2[3];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[4] ^ addr3[0];
   assign inAddr3[0] = addr3[4] ^ addr3[1];
   assign inAddr3[1] = addr3[4] ^ addr3[2];
   assign inAddr3[2] = addr3[4] ^ addr3[3];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(8, 1) shiftFIFO_80188(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80191(.X(next0), .Y(next_out), .clk(clk));


   memArray32_75013 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_8;
    reg resetOutCountRd2_9;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_8 <= 0;
            resetOutCountRd2_9 <= 0;
        end
        else begin
            resetOutCountRd2_8 <= (inCount == 7) ? 1'b1 : 1'b0;
            resetOutCountRd2_9 <= resetOutCountRd2_8;
            if (resetOutCountRd2_9 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 7)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 7) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 7)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_75013(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80194(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75016(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80197(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6110;
   wire signed [31:0] a6111;
   wire  [0:0] a6108;
   wire signed [31:0] a6116;
   wire signed [31:0] a6117;
   wire  [0:0] a6109;
   reg signed [31:0] t2878;
   reg signed [31:0] t2879;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2880;
   reg signed [31:0] t2881;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6110 = X0;
   assign a6111 = X1;
   assign a6108 = (a6110 <= a6111)  ? 1 : 0

;
   assign a6116 = X2;
   assign a6117 = X3;
   assign a6109 = (a6116 <= a6117)  ? 1 : 0

;
   assign Y0 = t2878;
   assign Y1 = t2879;
   assign Y2 = t2880;
   assign Y3 = t2881;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2878 <= (a6108 == 1) ? a6110 : a6111;
         t2879 <= (a6108 == 1) ? a6111 : a6110;
         t2880 <= (a6109 == 1) ? a6116 : a6117;
         t2881 <= (a6109 == 1) ? a6117 : a6116;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm75123(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80200(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80203(.X(next0), .Y(next_out), .clk(clk));


   memArray32_75123 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_75123(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80206(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75126(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80209(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6076;
   wire signed [31:0] a6077;
   wire  [0:0] a6074;
   wire signed [31:0] a6082;
   wire signed [31:0] a6083;
   wire  [0:0] a6075;
   reg signed [31:0] t2862;
   reg signed [31:0] t2863;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2864;
   reg signed [31:0] t2865;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6076 = X0;
   assign a6077 = X1;
   assign a6074 = (a6076 <= a6077)  ? 1 : 0

;
   assign a6082 = X2;
   assign a6083 = X3;
   assign a6075 = (a6082 <= a6083)  ? 1 : 0

;
   assign Y0 = t2862;
   assign Y1 = t2863;
   assign Y2 = t2864;
   assign Y3 = t2865;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2862 <= (a6074 == 1) ? a6076 : a6077;
         t2863 <= (a6074 == 1) ? a6077 : a6076;
         t2864 <= (a6075 == 1) ? a6082 : a6083;
         t2865 <= (a6075 == 1) ? a6083 : a6082;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm75233(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80212(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80215(.X(next0), .Y(next_out), .clk(clk));


   memArray16_75233 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_75233(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80218(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75236(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80221(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6042;
   wire signed [31:0] a6043;
   wire  [0:0] a6040;
   wire signed [31:0] a6048;
   wire signed [31:0] a6049;
   wire  [0:0] a6041;
   reg signed [31:0] t2846;
   reg signed [31:0] t2847;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2848;
   reg signed [31:0] t2849;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6042 = X0;
   assign a6043 = X1;
   assign a6040 = (a6042 <= a6043)  ? 1 : 0

;
   assign a6048 = X2;
   assign a6049 = X3;
   assign a6041 = (a6048 <= a6049)  ? 1 : 0

;
   assign Y0 = t2846;
   assign Y1 = t2847;
   assign Y2 = t2848;
   assign Y3 = t2849;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2846 <= (a6040 == 1) ? a6042 : a6043;
         t2847 <= (a6040 == 1) ? a6043 : a6042;
         t2848 <= (a6041 == 1) ? a6048 : a6049;
         t2849 <= (a6041 == 1) ? a6049 : a6048;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm75343(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80224(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80227(.X(next0), .Y(next_out), .clk(clk));


   memArray8_75343 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_75343(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80230(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75346(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80233(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a6008;
   wire signed [31:0] a6009;
   wire  [0:0] a6006;
   wire signed [31:0] a6014;
   wire signed [31:0] a6015;
   wire  [0:0] a6007;
   reg signed [31:0] t2830;
   reg signed [31:0] t2831;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2832;
   reg signed [31:0] t2833;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a6008 = X0;
   assign a6009 = X1;
   assign a6006 = (a6008 <= a6009)  ? 1 : 0

;
   assign a6014 = X2;
   assign a6015 = X3;
   assign a6007 = (a6014 <= a6015)  ? 1 : 0

;
   assign Y0 = t2830;
   assign Y1 = t2831;
   assign Y2 = t2832;
   assign Y3 = t2833;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2830 <= (a6006 == 1) ? a6008 : a6009;
         t2831 <= (a6006 == 1) ? a6009 : a6008;
         t2832 <= (a6007 == 1) ? a6014 : a6015;
         t2833 <= (a6007 == 1) ? a6015 : a6014;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock75453(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock75472(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80238(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5974;
   wire signed [31:0] a5975;
   wire  [0:0] a5972;
   wire signed [31:0] a5980;
   wire signed [31:0] a5981;
   wire  [0:0] a5973;
   reg signed [31:0] t2814;
   reg signed [31:0] t2815;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2816;
   reg signed [31:0] t2817;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5974 = X0;
   assign a5975 = X1;
   assign a5972 = (a5974 <= a5975)  ? 1 : 0

;
   assign a5980 = X2;
   assign a5981 = X3;
   assign a5973 = (a5980 <= a5981)  ? 1 : 0

;
   assign Y0 = t2814;
   assign Y1 = t2815;
   assign Y2 = t2816;
   assign Y3 = t2817;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2814 <= (a5972 == 1) ? a5974 : a5975;
         t2815 <= (a5972 == 1) ? a5975 : a5974;
         t2816 <= (a5973 == 1) ? a5980 : a5981;
         t2817 <= (a5973 == 1) ? a5981 : a5980;
      end
   end
endmodule

// Latency: 18
// Gap: 16
module perm75579(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[5] ^ addr0[0];
   assign inAddr0[0] = addr0[5] ^ addr0[1];
   assign inAddr0[1] = addr0[5] ^ addr0[2];
   assign inAddr0[2] = addr0[5] ^ addr0[3];
   assign inAddr0[3] = addr0[5] ^ addr0[4];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[5] ^ addr1[0];
   assign inAddr1[0] = addr1[5] ^ addr1[1];
   assign inAddr1[1] = addr1[5] ^ addr1[2];
   assign inAddr1[2] = addr1[5] ^ addr1[3];
   assign inAddr1[3] = addr1[5] ^ addr1[4];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[5] ^ addr2[0];
   assign inAddr2[0] = addr2[5] ^ addr2[1];
   assign inAddr2[1] = addr2[5] ^ addr2[2];
   assign inAddr2[2] = addr2[5] ^ addr2[3];
   assign inAddr2[3] = addr2[5] ^ addr2[4];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[5] ^ addr3[0];
   assign inAddr3[0] = addr3[5] ^ addr3[1];
   assign inAddr3[1] = addr3[5] ^ addr3[2];
   assign inAddr3[2] = addr3[5] ^ addr3[3];
   assign inAddr3[3] = addr3[5] ^ addr3[4];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(16, 4) nextReg_80243(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80246(.X(next0), .Y(next_out), .clk(clk));


   memArray64_75579 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_16;
    reg resetOutCountRd2_17;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_16 <= 0;
            resetOutCountRd2_17 <= 0;
        end
        else begin
            resetOutCountRd2_16 <= (inCount == 15) ? 1'b1 : 1'b0;
            resetOutCountRd2_17 <= resetOutCountRd2_16;
            if (resetOutCountRd2_17 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 15)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 15) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 15)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_75579(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80251(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

module nextReg(X, Y, reset, clk);
   parameter depth=2, logDepth=1;

   output Y;
   input X;
   input              clk, reset;
   reg [logDepth:0] count;
   reg                active;

   assign Y = (count == depth) ? 1 : 0;

   always @ (posedge clk) begin
      if (reset == 1) begin
         count <= 0;
         active <= 0;
      end
      else if (X == 1) begin
         active <= 1;
         count <= 1;
      end
      else if (count == depth) begin
         count <= 0;
         active <= 0;
      end
      else if (active)
         count <= count+1;
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock75582(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80258(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5940;
   wire signed [31:0] a5941;
   wire  [0:0] a5938;
   wire signed [31:0] a5946;
   wire signed [31:0] a5947;
   wire  [0:0] a5939;
   reg signed [31:0] t2798;
   reg signed [31:0] t2799;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2800;
   reg signed [31:0] t2801;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5940 = X0;
   assign a5941 = X1;
   assign a5938 = (a5940 <= a5941)  ? 1 : 0

;
   assign a5946 = X2;
   assign a5947 = X3;
   assign a5939 = (a5946 <= a5947)  ? 1 : 0

;
   assign Y0 = t2798;
   assign Y1 = t2799;
   assign Y2 = t2800;
   assign Y3 = t2801;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2798 <= (a5938 == 1) ? a5940 : a5941;
         t2799 <= (a5938 == 1) ? a5941 : a5940;
         t2800 <= (a5939 == 1) ? a5946 : a5947;
         t2801 <= (a5939 == 1) ? a5947 : a5946;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module perm75689(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[5] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[0];
   assign outBank2[0] = addr2b[5] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[5] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[5] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[0];
   assign outBank3[0] = addr3b[5] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[5] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(9, 4) nextReg_80263(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80266(.X(next0), .Y(next_out), .clk(clk));


   memArray64_75689 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_75689(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80271(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75692(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80278(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5906;
   wire signed [31:0] a5907;
   wire  [0:0] a5904;
   wire signed [31:0] a5912;
   wire signed [31:0] a5913;
   wire  [0:0] a5905;
   reg signed [31:0] t2782;
   reg signed [31:0] t2783;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2784;
   reg signed [31:0] t2785;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5906 = X0;
   assign a5907 = X1;
   assign a5904 = (a5906 <= a5907)  ? 1 : 0

;
   assign a5912 = X2;
   assign a5913 = X3;
   assign a5905 = (a5912 <= a5913)  ? 1 : 0

;
   assign Y0 = t2782;
   assign Y1 = t2783;
   assign Y2 = t2784;
   assign Y3 = t2785;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2782 <= (a5904 == 1) ? a5906 : a5907;
         t2783 <= (a5904 == 1) ? a5907 : a5906;
         t2784 <= (a5905 == 1) ? a5912 : a5913;
         t2785 <= (a5905 == 1) ? a5913 : a5912;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm75799(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80281(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80284(.X(next0), .Y(next_out), .clk(clk));


   memArray32_75799 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_75799(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80287(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75802(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80290(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5872;
   wire signed [31:0] a5873;
   wire  [0:0] a5870;
   wire signed [31:0] a5878;
   wire signed [31:0] a5879;
   wire  [0:0] a5871;
   reg signed [31:0] t2766;
   reg signed [31:0] t2767;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2768;
   reg signed [31:0] t2769;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5872 = X0;
   assign a5873 = X1;
   assign a5870 = (a5872 <= a5873)  ? 1 : 0

;
   assign a5878 = X2;
   assign a5879 = X3;
   assign a5871 = (a5878 <= a5879)  ? 1 : 0

;
   assign Y0 = t2766;
   assign Y1 = t2767;
   assign Y2 = t2768;
   assign Y3 = t2769;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2766 <= (a5870 == 1) ? a5872 : a5873;
         t2767 <= (a5870 == 1) ? a5873 : a5872;
         t2768 <= (a5871 == 1) ? a5878 : a5879;
         t2769 <= (a5871 == 1) ? a5879 : a5878;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm75909(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80293(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80296(.X(next0), .Y(next_out), .clk(clk));


   memArray16_75909 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_75909(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80299(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock75912(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80302(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5838;
   wire signed [31:0] a5839;
   wire  [0:0] a5836;
   wire signed [31:0] a5844;
   wire signed [31:0] a5845;
   wire  [0:0] a5837;
   reg signed [31:0] t2750;
   reg signed [31:0] t2751;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2752;
   reg signed [31:0] t2753;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5838 = X0;
   assign a5839 = X1;
   assign a5836 = (a5838 <= a5839)  ? 1 : 0

;
   assign a5844 = X2;
   assign a5845 = X3;
   assign a5837 = (a5844 <= a5845)  ? 1 : 0

;
   assign Y0 = t2750;
   assign Y1 = t2751;
   assign Y2 = t2752;
   assign Y3 = t2753;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2750 <= (a5836 == 1) ? a5838 : a5839;
         t2751 <= (a5836 == 1) ? a5839 : a5838;
         t2752 <= (a5837 == 1) ? a5844 : a5845;
         t2753 <= (a5837 == 1) ? a5845 : a5844;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm76019(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80305(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80308(.X(next0), .Y(next_out), .clk(clk));


   memArray8_76019 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_76019(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80311(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76022(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80314(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5804;
   wire signed [31:0] a5805;
   wire  [0:0] a5802;
   wire signed [31:0] a5810;
   wire signed [31:0] a5811;
   wire  [0:0] a5803;
   reg signed [31:0] t2734;
   reg signed [31:0] t2735;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2736;
   reg signed [31:0] t2737;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5804 = X0;
   assign a5805 = X1;
   assign a5802 = (a5804 <= a5805)  ? 1 : 0

;
   assign a5810 = X2;
   assign a5811 = X3;
   assign a5803 = (a5810 <= a5811)  ? 1 : 0

;
   assign Y0 = t2734;
   assign Y1 = t2735;
   assign Y2 = t2736;
   assign Y3 = t2737;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2734 <= (a5802 == 1) ? a5804 : a5805;
         t2735 <= (a5802 == 1) ? a5805 : a5804;
         t2736 <= (a5803 == 1) ? a5810 : a5811;
         t2737 <= (a5803 == 1) ? a5811 : a5810;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock76129(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock76148(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80319(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5770;
   wire signed [31:0] a5771;
   wire  [0:0] a5768;
   wire signed [31:0] a5776;
   wire signed [31:0] a5777;
   wire  [0:0] a5769;
   reg signed [31:0] t2718;
   reg signed [31:0] t2719;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2720;
   reg signed [31:0] t2721;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5770 = X0;
   assign a5771 = X1;
   assign a5768 = (a5770 <= a5771)  ? 1 : 0

;
   assign a5776 = X2;
   assign a5777 = X3;
   assign a5769 = (a5776 <= a5777)  ? 1 : 0

;
   assign Y0 = t2718;
   assign Y1 = t2719;
   assign Y2 = t2720;
   assign Y3 = t2721;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2718 <= (a5768 == 1) ? a5770 : a5771;
         t2719 <= (a5768 == 1) ? a5771 : a5770;
         t2720 <= (a5769 == 1) ? a5776 : a5777;
         t2721 <= (a5769 == 1) ? a5777 : a5776;
      end
   end
endmodule

// Latency: 34
// Gap: 32
module perm76255(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[6] ^ addr0[0];
   assign inAddr0[0] = addr0[6] ^ addr0[1];
   assign inAddr0[1] = addr0[6] ^ addr0[2];
   assign inAddr0[2] = addr0[6] ^ addr0[3];
   assign inAddr0[3] = addr0[6] ^ addr0[4];
   assign inAddr0[4] = addr0[6] ^ addr0[5];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[6] ^ addr1[0];
   assign inAddr1[0] = addr1[6] ^ addr1[1];
   assign inAddr1[1] = addr1[6] ^ addr1[2];
   assign inAddr1[2] = addr1[6] ^ addr1[3];
   assign inAddr1[3] = addr1[6] ^ addr1[4];
   assign inAddr1[4] = addr1[6] ^ addr1[5];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[6] ^ addr2[0];
   assign inAddr2[0] = addr2[6] ^ addr2[1];
   assign inAddr2[1] = addr2[6] ^ addr2[2];
   assign inAddr2[2] = addr2[6] ^ addr2[3];
   assign inAddr2[3] = addr2[6] ^ addr2[4];
   assign inAddr2[4] = addr2[6] ^ addr2[5];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[6] ^ addr3[0];
   assign inAddr3[0] = addr3[6] ^ addr3[1];
   assign inAddr3[1] = addr3[6] ^ addr3[2];
   assign inAddr3[2] = addr3[6] ^ addr3[3];
   assign inAddr3[3] = addr3[6] ^ addr3[4];
   assign inAddr3[4] = addr3[6] ^ addr3[5];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];

   nextReg #(32, 5) nextReg_80324(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80327(.X(next0), .Y(next_out), .clk(clk));


   memArray128_76255 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_32;
    reg resetOutCountRd2_33;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_32 <= 0;
            resetOutCountRd2_33 <= 0;
        end
        else begin
            resetOutCountRd2_32 <= (inCount == 31) ? 1'b1 : 1'b0;
            resetOutCountRd2_33 <= resetOutCountRd2_32;
            if (resetOutCountRd2_33 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 31)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 31) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 31)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_76255(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(32, 5) nextReg_80332(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76258(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80339(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5736;
   wire signed [31:0] a5737;
   wire  [0:0] a5734;
   wire signed [31:0] a5742;
   wire signed [31:0] a5743;
   wire  [0:0] a5735;
   reg signed [31:0] t2702;
   reg signed [31:0] t2703;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2704;
   reg signed [31:0] t2705;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5736 = X0;
   assign a5737 = X1;
   assign a5734 = (a5736 <= a5737)  ? 1 : 0

;
   assign a5742 = X2;
   assign a5743 = X3;
   assign a5735 = (a5742 <= a5743)  ? 1 : 0

;
   assign Y0 = t2702;
   assign Y1 = t2703;
   assign Y2 = t2704;
   assign Y3 = t2705;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2702 <= (a5734 == 1) ? a5736 : a5737;
         t2703 <= (a5734 == 1) ? a5737 : a5736;
         t2704 <= (a5735 == 1) ? a5742 : a5743;
         t2705 <= (a5735 == 1) ? a5743 : a5742;
      end
   end
endmodule

// Latency: 19
// Gap: 32
module perm76365(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[6] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[0];
   assign outBank0[0] = addr0b[6] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outBank_a0[0] = addr0c[6] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];

   assign inBank1[0] = addr1[6] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[0];
   assign outBank1[0] = addr1b[6] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outBank_a1[0] = addr1c[6] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];

   assign inBank2[0] = addr2[6] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[0];
   assign outBank2[0] = addr2b[6] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outBank_a2[0] = addr2c[6] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];

   assign inBank3[0] = addr3[6] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[0];
   assign outBank3[0] = addr3b[6] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outBank_a3[0] = addr3c[6] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];

   nextReg #(17, 5) nextReg_80344(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80347(.X(next0), .Y(next_out), .clk(clk));


   memArray128_76365 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 16)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 18)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 16) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 16)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[4];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[4];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_76365(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(32, 5) nextReg_80352(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76368(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80359(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5702;
   wire signed [31:0] a5703;
   wire  [0:0] a5700;
   wire signed [31:0] a5708;
   wire signed [31:0] a5709;
   wire  [0:0] a5701;
   reg signed [31:0] t2686;
   reg signed [31:0] t2687;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2688;
   reg signed [31:0] t2689;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5702 = X0;
   assign a5703 = X1;
   assign a5700 = (a5702 <= a5703)  ? 1 : 0

;
   assign a5708 = X2;
   assign a5709 = X3;
   assign a5701 = (a5708 <= a5709)  ? 1 : 0

;
   assign Y0 = t2686;
   assign Y1 = t2687;
   assign Y2 = t2688;
   assign Y3 = t2689;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2686 <= (a5700 == 1) ? a5702 : a5703;
         t2687 <= (a5700 == 1) ? a5703 : a5702;
         t2688 <= (a5701 == 1) ? a5708 : a5709;
         t2689 <= (a5701 == 1) ? a5709 : a5708;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module perm76475(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[5] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[0];
   assign outBank2[0] = addr2b[5] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[5] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[5] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[0];
   assign outBank3[0] = addr3b[5] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[5] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(9, 4) nextReg_80364(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80367(.X(next0), .Y(next_out), .clk(clk));


   memArray64_76475 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_76475(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80372(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76478(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80379(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5668;
   wire signed [31:0] a5669;
   wire  [0:0] a5666;
   wire signed [31:0] a5674;
   wire signed [31:0] a5675;
   wire  [0:0] a5667;
   reg signed [31:0] t2670;
   reg signed [31:0] t2671;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2672;
   reg signed [31:0] t2673;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5668 = X0;
   assign a5669 = X1;
   assign a5666 = (a5668 <= a5669)  ? 1 : 0

;
   assign a5674 = X2;
   assign a5675 = X3;
   assign a5667 = (a5674 <= a5675)  ? 1 : 0

;
   assign Y0 = t2670;
   assign Y1 = t2671;
   assign Y2 = t2672;
   assign Y3 = t2673;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2670 <= (a5666 == 1) ? a5668 : a5669;
         t2671 <= (a5666 == 1) ? a5669 : a5668;
         t2672 <= (a5667 == 1) ? a5674 : a5675;
         t2673 <= (a5667 == 1) ? a5675 : a5674;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm76585(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80382(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80385(.X(next0), .Y(next_out), .clk(clk));


   memArray32_76585 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_76585(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80388(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76588(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80391(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5634;
   wire signed [31:0] a5635;
   wire  [0:0] a5632;
   wire signed [31:0] a5640;
   wire signed [31:0] a5641;
   wire  [0:0] a5633;
   reg signed [31:0] t2654;
   reg signed [31:0] t2655;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2656;
   reg signed [31:0] t2657;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5634 = X0;
   assign a5635 = X1;
   assign a5632 = (a5634 <= a5635)  ? 1 : 0

;
   assign a5640 = X2;
   assign a5641 = X3;
   assign a5633 = (a5640 <= a5641)  ? 1 : 0

;
   assign Y0 = t2654;
   assign Y1 = t2655;
   assign Y2 = t2656;
   assign Y3 = t2657;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2654 <= (a5632 == 1) ? a5634 : a5635;
         t2655 <= (a5632 == 1) ? a5635 : a5634;
         t2656 <= (a5633 == 1) ? a5640 : a5641;
         t2657 <= (a5633 == 1) ? a5641 : a5640;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm76695(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80394(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80397(.X(next0), .Y(next_out), .clk(clk));


   memArray16_76695 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_76695(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80400(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76698(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80403(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5600;
   wire signed [31:0] a5601;
   wire  [0:0] a5598;
   wire signed [31:0] a5606;
   wire signed [31:0] a5607;
   wire  [0:0] a5599;
   reg signed [31:0] t2638;
   reg signed [31:0] t2639;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2640;
   reg signed [31:0] t2641;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5600 = X0;
   assign a5601 = X1;
   assign a5598 = (a5600 <= a5601)  ? 1 : 0

;
   assign a5606 = X2;
   assign a5607 = X3;
   assign a5599 = (a5606 <= a5607)  ? 1 : 0

;
   assign Y0 = t2638;
   assign Y1 = t2639;
   assign Y2 = t2640;
   assign Y3 = t2641;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2638 <= (a5598 == 1) ? a5600 : a5601;
         t2639 <= (a5598 == 1) ? a5601 : a5600;
         t2640 <= (a5599 == 1) ? a5606 : a5607;
         t2641 <= (a5599 == 1) ? a5607 : a5606;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm76805(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80406(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80409(.X(next0), .Y(next_out), .clk(clk));


   memArray8_76805 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_76805(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80412(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock76808(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80415(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5566;
   wire signed [31:0] a5567;
   wire  [0:0] a5564;
   wire signed [31:0] a5572;
   wire signed [31:0] a5573;
   wire  [0:0] a5565;
   reg signed [31:0] t2622;
   reg signed [31:0] t2623;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2624;
   reg signed [31:0] t2625;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5566 = X0;
   assign a5567 = X1;
   assign a5564 = (a5566 <= a5567)  ? 1 : 0

;
   assign a5572 = X2;
   assign a5573 = X3;
   assign a5565 = (a5572 <= a5573)  ? 1 : 0

;
   assign Y0 = t2622;
   assign Y1 = t2623;
   assign Y2 = t2624;
   assign Y3 = t2625;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2622 <= (a5564 == 1) ? a5566 : a5567;
         t2623 <= (a5564 == 1) ? a5567 : a5566;
         t2624 <= (a5565 == 1) ? a5572 : a5573;
         t2625 <= (a5565 == 1) ? a5573 : a5572;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock76915(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock76934(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80420(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5532;
   wire signed [31:0] a5533;
   wire  [0:0] a5530;
   wire signed [31:0] a5538;
   wire signed [31:0] a5539;
   wire  [0:0] a5531;
   reg signed [31:0] t2606;
   reg signed [31:0] t2607;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2608;
   reg signed [31:0] t2609;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5532 = X0;
   assign a5533 = X1;
   assign a5530 = (a5532 <= a5533)  ? 1 : 0

;
   assign a5538 = X2;
   assign a5539 = X3;
   assign a5531 = (a5538 <= a5539)  ? 1 : 0

;
   assign Y0 = t2606;
   assign Y1 = t2607;
   assign Y2 = t2608;
   assign Y3 = t2609;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2606 <= (a5530 == 1) ? a5532 : a5533;
         t2607 <= (a5530 == 1) ? a5533 : a5532;
         t2608 <= (a5531 == 1) ? a5538 : a5539;
         t2609 <= (a5531 == 1) ? a5539 : a5538;
      end
   end
endmodule

// Latency: 66
// Gap: 64
module perm77041(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[7] ^ addr0[0];
   assign inAddr0[0] = addr0[7] ^ addr0[1];
   assign inAddr0[1] = addr0[7] ^ addr0[2];
   assign inAddr0[2] = addr0[7] ^ addr0[3];
   assign inAddr0[3] = addr0[7] ^ addr0[4];
   assign inAddr0[4] = addr0[7] ^ addr0[5];
   assign inAddr0[5] = addr0[7] ^ addr0[6];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[7] ^ addr1[0];
   assign inAddr1[0] = addr1[7] ^ addr1[1];
   assign inAddr1[1] = addr1[7] ^ addr1[2];
   assign inAddr1[2] = addr1[7] ^ addr1[3];
   assign inAddr1[3] = addr1[7] ^ addr1[4];
   assign inAddr1[4] = addr1[7] ^ addr1[5];
   assign inAddr1[5] = addr1[7] ^ addr1[6];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[7] ^ addr2[0];
   assign inAddr2[0] = addr2[7] ^ addr2[1];
   assign inAddr2[1] = addr2[7] ^ addr2[2];
   assign inAddr2[2] = addr2[7] ^ addr2[3];
   assign inAddr2[3] = addr2[7] ^ addr2[4];
   assign inAddr2[4] = addr2[7] ^ addr2[5];
   assign inAddr2[5] = addr2[7] ^ addr2[6];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[7] ^ addr3[0];
   assign inAddr3[0] = addr3[7] ^ addr3[1];
   assign inAddr3[1] = addr3[7] ^ addr3[2];
   assign inAddr3[2] = addr3[7] ^ addr3[3];
   assign inAddr3[3] = addr3[7] ^ addr3[4];
   assign inAddr3[4] = addr3[7] ^ addr3[5];
   assign inAddr3[5] = addr3[7] ^ addr3[6];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];

   nextReg #(64, 6) nextReg_80425(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80428(.X(next0), .Y(next_out), .clk(clk));


   memArray256_77041 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_64;
    reg resetOutCountRd2_65;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_64 <= 0;
            resetOutCountRd2_65 <= 0;
        end
        else begin
            resetOutCountRd2_64 <= (inCount == 63) ? 1'b1 : 1'b0;
            resetOutCountRd2_65 <= resetOutCountRd2_64;
            if (resetOutCountRd2_65 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 63)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 63) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 63) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 63)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[5];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray256_77041(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(64, 6) nextReg_80433(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77044(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80440(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5498;
   wire signed [31:0] a5499;
   wire  [0:0] a5496;
   wire signed [31:0] a5504;
   wire signed [31:0] a5505;
   wire  [0:0] a5497;
   reg signed [31:0] t2590;
   reg signed [31:0] t2591;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2592;
   reg signed [31:0] t2593;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5498 = X0;
   assign a5499 = X1;
   assign a5496 = (a5498 <= a5499)  ? 1 : 0

;
   assign a5504 = X2;
   assign a5505 = X3;
   assign a5497 = (a5504 <= a5505)  ? 1 : 0

;
   assign Y0 = t2590;
   assign Y1 = t2591;
   assign Y2 = t2592;
   assign Y3 = t2593;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2590 <= (a5496 == 1) ? a5498 : a5499;
         t2591 <= (a5496 == 1) ? a5499 : a5498;
         t2592 <= (a5497 == 1) ? a5504 : a5505;
         t2593 <= (a5497 == 1) ? a5505 : a5504;
      end
   end
endmodule

// Latency: 35
// Gap: 64
module perm77151(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[7] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[0];
   assign outBank0[0] = addr0b[7] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outBank_a0[0] = addr0c[7] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];

   assign inBank1[0] = addr1[7] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[0];
   assign outBank1[0] = addr1b[7] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outBank_a1[0] = addr1c[7] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];

   assign inBank2[0] = addr2[7] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[0];
   assign outBank2[0] = addr2b[7] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outBank_a2[0] = addr2c[7] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];

   assign inBank3[0] = addr3[7] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[0];
   assign outBank3[0] = addr3b[7] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outBank_a3[0] = addr3c[7] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];

   nextReg #(33, 6) nextReg_80445(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80448(.X(next0), .Y(next_out), .clk(clk));


   memArray256_77151 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 32)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 34)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 32) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 63) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 32)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[5];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[5];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[5];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray256_77151(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(64, 6) nextReg_80453(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77154(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80460(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5464;
   wire signed [31:0] a5465;
   wire  [0:0] a5462;
   wire signed [31:0] a5470;
   wire signed [31:0] a5471;
   wire  [0:0] a5463;
   reg signed [31:0] t2574;
   reg signed [31:0] t2575;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2576;
   reg signed [31:0] t2577;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5464 = X0;
   assign a5465 = X1;
   assign a5462 = (a5464 <= a5465)  ? 1 : 0

;
   assign a5470 = X2;
   assign a5471 = X3;
   assign a5463 = (a5470 <= a5471)  ? 1 : 0

;
   assign Y0 = t2574;
   assign Y1 = t2575;
   assign Y2 = t2576;
   assign Y3 = t2577;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2574 <= (a5462 == 1) ? a5464 : a5465;
         t2575 <= (a5462 == 1) ? a5465 : a5464;
         t2576 <= (a5463 == 1) ? a5470 : a5471;
         t2577 <= (a5463 == 1) ? a5471 : a5470;
      end
   end
endmodule

// Latency: 19
// Gap: 32
module perm77261(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[6] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[0];
   assign outBank0[0] = addr0b[6] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outBank_a0[0] = addr0c[6] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];

   assign inBank1[0] = addr1[6] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[0];
   assign outBank1[0] = addr1b[6] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outBank_a1[0] = addr1c[6] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];

   assign inBank2[0] = addr2[6] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[0];
   assign outBank2[0] = addr2b[6] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outBank_a2[0] = addr2c[6] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];

   assign inBank3[0] = addr3[6] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[0];
   assign outBank3[0] = addr3b[6] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outBank_a3[0] = addr3c[6] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];

   nextReg #(17, 5) nextReg_80465(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80468(.X(next0), .Y(next_out), .clk(clk));


   memArray128_77261 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 16)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 18)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 16) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 16)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[4];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[4];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_77261(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(32, 5) nextReg_80473(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77264(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80480(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5430;
   wire signed [31:0] a5431;
   wire  [0:0] a5428;
   wire signed [31:0] a5436;
   wire signed [31:0] a5437;
   wire  [0:0] a5429;
   reg signed [31:0] t2558;
   reg signed [31:0] t2559;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2560;
   reg signed [31:0] t2561;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5430 = X0;
   assign a5431 = X1;
   assign a5428 = (a5430 <= a5431)  ? 1 : 0

;
   assign a5436 = X2;
   assign a5437 = X3;
   assign a5429 = (a5436 <= a5437)  ? 1 : 0

;
   assign Y0 = t2558;
   assign Y1 = t2559;
   assign Y2 = t2560;
   assign Y3 = t2561;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2558 <= (a5428 == 1) ? a5430 : a5431;
         t2559 <= (a5428 == 1) ? a5431 : a5430;
         t2560 <= (a5429 == 1) ? a5436 : a5437;
         t2561 <= (a5429 == 1) ? a5437 : a5436;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module perm77371(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[5] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[0];
   assign outBank2[0] = addr2b[5] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[5] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[5] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[0];
   assign outBank3[0] = addr3b[5] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[5] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(9, 4) nextReg_80485(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80488(.X(next0), .Y(next_out), .clk(clk));


   memArray64_77371 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_77371(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80493(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77374(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80500(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5396;
   wire signed [31:0] a5397;
   wire  [0:0] a5394;
   wire signed [31:0] a5402;
   wire signed [31:0] a5403;
   wire  [0:0] a5395;
   reg signed [31:0] t2542;
   reg signed [31:0] t2543;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2544;
   reg signed [31:0] t2545;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5396 = X0;
   assign a5397 = X1;
   assign a5394 = (a5396 <= a5397)  ? 1 : 0

;
   assign a5402 = X2;
   assign a5403 = X3;
   assign a5395 = (a5402 <= a5403)  ? 1 : 0

;
   assign Y0 = t2542;
   assign Y1 = t2543;
   assign Y2 = t2544;
   assign Y3 = t2545;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2542 <= (a5394 == 1) ? a5396 : a5397;
         t2543 <= (a5394 == 1) ? a5397 : a5396;
         t2544 <= (a5395 == 1) ? a5402 : a5403;
         t2545 <= (a5395 == 1) ? a5403 : a5402;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm77481(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80503(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80506(.X(next0), .Y(next_out), .clk(clk));


   memArray32_77481 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_77481(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80509(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77484(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80512(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5362;
   wire signed [31:0] a5363;
   wire  [0:0] a5360;
   wire signed [31:0] a5368;
   wire signed [31:0] a5369;
   wire  [0:0] a5361;
   reg signed [31:0] t2526;
   reg signed [31:0] t2527;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2528;
   reg signed [31:0] t2529;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5362 = X0;
   assign a5363 = X1;
   assign a5360 = (a5362 <= a5363)  ? 1 : 0

;
   assign a5368 = X2;
   assign a5369 = X3;
   assign a5361 = (a5368 <= a5369)  ? 1 : 0

;
   assign Y0 = t2526;
   assign Y1 = t2527;
   assign Y2 = t2528;
   assign Y3 = t2529;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2526 <= (a5360 == 1) ? a5362 : a5363;
         t2527 <= (a5360 == 1) ? a5363 : a5362;
         t2528 <= (a5361 == 1) ? a5368 : a5369;
         t2529 <= (a5361 == 1) ? a5369 : a5368;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm77591(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80515(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80518(.X(next0), .Y(next_out), .clk(clk));


   memArray16_77591 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_77591(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80521(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77594(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80524(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5328;
   wire signed [31:0] a5329;
   wire  [0:0] a5326;
   wire signed [31:0] a5334;
   wire signed [31:0] a5335;
   wire  [0:0] a5327;
   reg signed [31:0] t2510;
   reg signed [31:0] t2511;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2512;
   reg signed [31:0] t2513;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5328 = X0;
   assign a5329 = X1;
   assign a5326 = (a5328 <= a5329)  ? 1 : 0

;
   assign a5334 = X2;
   assign a5335 = X3;
   assign a5327 = (a5334 <= a5335)  ? 1 : 0

;
   assign Y0 = t2510;
   assign Y1 = t2511;
   assign Y2 = t2512;
   assign Y3 = t2513;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2510 <= (a5326 == 1) ? a5328 : a5329;
         t2511 <= (a5326 == 1) ? a5329 : a5328;
         t2512 <= (a5327 == 1) ? a5334 : a5335;
         t2513 <= (a5327 == 1) ? a5335 : a5334;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm77701(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80527(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80530(.X(next0), .Y(next_out), .clk(clk));


   memArray8_77701 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_77701(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80533(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77704(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80536(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5294;
   wire signed [31:0] a5295;
   wire  [0:0] a5292;
   wire signed [31:0] a5300;
   wire signed [31:0] a5301;
   wire  [0:0] a5293;
   reg signed [31:0] t2494;
   reg signed [31:0] t2495;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2496;
   reg signed [31:0] t2497;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5294 = X0;
   assign a5295 = X1;
   assign a5292 = (a5294 <= a5295)  ? 1 : 0

;
   assign a5300 = X2;
   assign a5301 = X3;
   assign a5293 = (a5300 <= a5301)  ? 1 : 0

;
   assign Y0 = t2494;
   assign Y1 = t2495;
   assign Y2 = t2496;
   assign Y3 = t2497;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2494 <= (a5292 == 1) ? a5294 : a5295;
         t2495 <= (a5292 == 1) ? a5295 : a5294;
         t2496 <= (a5293 == 1) ? a5300 : a5301;
         t2497 <= (a5293 == 1) ? a5301 : a5300;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock77811(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock77830(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80541(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5260;
   wire signed [31:0] a5261;
   wire  [0:0] a5258;
   wire signed [31:0] a5266;
   wire signed [31:0] a5267;
   wire  [0:0] a5259;
   reg signed [31:0] t2478;
   reg signed [31:0] t2479;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2480;
   reg signed [31:0] t2481;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5260 = X0;
   assign a5261 = X1;
   assign a5258 = (a5260 <= a5261)  ? 1 : 0

;
   assign a5266 = X2;
   assign a5267 = X3;
   assign a5259 = (a5266 <= a5267)  ? 1 : 0

;
   assign Y0 = t2478;
   assign Y1 = t2479;
   assign Y2 = t2480;
   assign Y3 = t2481;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2478 <= (a5258 == 1) ? a5260 : a5261;
         t2479 <= (a5258 == 1) ? a5261 : a5260;
         t2480 <= (a5259 == 1) ? a5266 : a5267;
         t2481 <= (a5259 == 1) ? a5267 : a5266;
      end
   end
endmodule

// Latency: 130
// Gap: 128
module perm77937(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[8] ^ addr0[0];
   assign inAddr0[0] = addr0[8] ^ addr0[1];
   assign inAddr0[1] = addr0[8] ^ addr0[2];
   assign inAddr0[2] = addr0[8] ^ addr0[3];
   assign inAddr0[3] = addr0[8] ^ addr0[4];
   assign inAddr0[4] = addr0[8] ^ addr0[5];
   assign inAddr0[5] = addr0[8] ^ addr0[6];
   assign inAddr0[6] = addr0[8] ^ addr0[7];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outAddr0[6] = addr0b[8];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];
   assign outAddr_a0[6] = addr0c[8];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[8] ^ addr1[0];
   assign inAddr1[0] = addr1[8] ^ addr1[1];
   assign inAddr1[1] = addr1[8] ^ addr1[2];
   assign inAddr1[2] = addr1[8] ^ addr1[3];
   assign inAddr1[3] = addr1[8] ^ addr1[4];
   assign inAddr1[4] = addr1[8] ^ addr1[5];
   assign inAddr1[5] = addr1[8] ^ addr1[6];
   assign inAddr1[6] = addr1[8] ^ addr1[7];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outAddr1[6] = addr1b[8];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];
   assign outAddr_a1[6] = addr1c[8];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[8] ^ addr2[0];
   assign inAddr2[0] = addr2[8] ^ addr2[1];
   assign inAddr2[1] = addr2[8] ^ addr2[2];
   assign inAddr2[2] = addr2[8] ^ addr2[3];
   assign inAddr2[3] = addr2[8] ^ addr2[4];
   assign inAddr2[4] = addr2[8] ^ addr2[5];
   assign inAddr2[5] = addr2[8] ^ addr2[6];
   assign inAddr2[6] = addr2[8] ^ addr2[7];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outAddr2[6] = addr2b[8];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];
   assign outAddr_a2[6] = addr2c[8];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[8] ^ addr3[0];
   assign inAddr3[0] = addr3[8] ^ addr3[1];
   assign inAddr3[1] = addr3[8] ^ addr3[2];
   assign inAddr3[2] = addr3[8] ^ addr3[3];
   assign inAddr3[3] = addr3[8] ^ addr3[4];
   assign inAddr3[4] = addr3[8] ^ addr3[5];
   assign inAddr3[5] = addr3[8] ^ addr3[6];
   assign inAddr3[6] = addr3[8] ^ addr3[7];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outAddr3[6] = addr3b[8];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];
   assign outAddr_a3[6] = addr3c[8];

   nextReg #(128, 7) nextReg_80546(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80549(.X(next0), .Y(next_out), .clk(clk));


   memArray512_77937 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_128;
    reg resetOutCountRd2_129;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_128 <= 0;
            resetOutCountRd2_129 <= 0;
        end
        else begin
            resetOutCountRd2_128 <= (inCount == 127) ? 1'b1 : 1'b0;
            resetOutCountRd2_129 <= resetOutCountRd2_128;
            if (resetOutCountRd2_129 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 127)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 127) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 127) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 127)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[6];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray512_77937(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(128, 7) nextReg_80554(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock77940(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80561(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5226;
   wire signed [31:0] a5227;
   wire  [0:0] a5224;
   wire signed [31:0] a5232;
   wire signed [31:0] a5233;
   wire  [0:0] a5225;
   reg signed [31:0] t2462;
   reg signed [31:0] t2463;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2464;
   reg signed [31:0] t2465;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5226 = X0;
   assign a5227 = X1;
   assign a5224 = (a5226 <= a5227)  ? 1 : 0

;
   assign a5232 = X2;
   assign a5233 = X3;
   assign a5225 = (a5232 <= a5233)  ? 1 : 0

;
   assign Y0 = t2462;
   assign Y1 = t2463;
   assign Y2 = t2464;
   assign Y3 = t2465;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2462 <= (a5224 == 1) ? a5226 : a5227;
         t2463 <= (a5224 == 1) ? a5227 : a5226;
         t2464 <= (a5225 == 1) ? a5232 : a5233;
         t2465 <= (a5225 == 1) ? a5233 : a5232;
      end
   end
endmodule

// Latency: 67
// Gap: 128
module perm78047(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[8] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[7];
   assign inAddr0[6] = addr0[0];
   assign outBank0[0] = addr0b[8] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outAddr0[6] = addr0b[8];
   assign outBank_a0[0] = addr0c[8] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];
   assign outAddr_a0[6] = addr0c[8];

   assign inBank1[0] = addr1[8] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[7];
   assign inAddr1[6] = addr1[0];
   assign outBank1[0] = addr1b[8] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outAddr1[6] = addr1b[8];
   assign outBank_a1[0] = addr1c[8] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];
   assign outAddr_a1[6] = addr1c[8];

   assign inBank2[0] = addr2[8] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[7];
   assign inAddr2[6] = addr2[0];
   assign outBank2[0] = addr2b[8] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outAddr2[6] = addr2b[8];
   assign outBank_a2[0] = addr2c[8] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];
   assign outAddr_a2[6] = addr2c[8];

   assign inBank3[0] = addr3[8] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[7];
   assign inAddr3[6] = addr3[0];
   assign outBank3[0] = addr3b[8] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outAddr3[6] = addr3b[8];
   assign outBank_a3[0] = addr3c[8] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];
   assign outAddr_a3[6] = addr3c[8];

   nextReg #(65, 7) nextReg_80566(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80569(.X(next0), .Y(next_out), .clk(clk));


   memArray512_78047 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 64)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 66)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 64) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 127) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 64)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[6];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[6];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[6];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray512_78047(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(128, 7) nextReg_80574(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78050(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80581(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5192;
   wire signed [31:0] a5193;
   wire  [0:0] a5190;
   wire signed [31:0] a5198;
   wire signed [31:0] a5199;
   wire  [0:0] a5191;
   reg signed [31:0] t2446;
   reg signed [31:0] t2447;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2448;
   reg signed [31:0] t2449;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5192 = X0;
   assign a5193 = X1;
   assign a5190 = (a5192 <= a5193)  ? 1 : 0

;
   assign a5198 = X2;
   assign a5199 = X3;
   assign a5191 = (a5198 <= a5199)  ? 1 : 0

;
   assign Y0 = t2446;
   assign Y1 = t2447;
   assign Y2 = t2448;
   assign Y3 = t2449;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2446 <= (a5190 == 1) ? a5192 : a5193;
         t2447 <= (a5190 == 1) ? a5193 : a5192;
         t2448 <= (a5191 == 1) ? a5198 : a5199;
         t2449 <= (a5191 == 1) ? a5199 : a5198;
      end
   end
endmodule

// Latency: 35
// Gap: 64
module perm78157(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[7] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[0];
   assign outBank0[0] = addr0b[7] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outBank_a0[0] = addr0c[7] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];

   assign inBank1[0] = addr1[7] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[0];
   assign outBank1[0] = addr1b[7] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outBank_a1[0] = addr1c[7] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];

   assign inBank2[0] = addr2[7] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[0];
   assign outBank2[0] = addr2b[7] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outBank_a2[0] = addr2c[7] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];

   assign inBank3[0] = addr3[7] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[0];
   assign outBank3[0] = addr3b[7] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outBank_a3[0] = addr3c[7] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];

   nextReg #(33, 6) nextReg_80586(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80589(.X(next0), .Y(next_out), .clk(clk));


   memArray256_78157 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 32)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 34)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 32) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 63) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 32)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[5];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[5];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[5];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray256_78157(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(64, 6) nextReg_80594(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78160(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80601(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5158;
   wire signed [31:0] a5159;
   wire  [0:0] a5156;
   wire signed [31:0] a5164;
   wire signed [31:0] a5165;
   wire  [0:0] a5157;
   reg signed [31:0] t2430;
   reg signed [31:0] t2431;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2432;
   reg signed [31:0] t2433;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5158 = X0;
   assign a5159 = X1;
   assign a5156 = (a5158 <= a5159)  ? 1 : 0

;
   assign a5164 = X2;
   assign a5165 = X3;
   assign a5157 = (a5164 <= a5165)  ? 1 : 0

;
   assign Y0 = t2430;
   assign Y1 = t2431;
   assign Y2 = t2432;
   assign Y3 = t2433;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2430 <= (a5156 == 1) ? a5158 : a5159;
         t2431 <= (a5156 == 1) ? a5159 : a5158;
         t2432 <= (a5157 == 1) ? a5164 : a5165;
         t2433 <= (a5157 == 1) ? a5165 : a5164;
      end
   end
endmodule

// Latency: 19
// Gap: 32
module perm78267(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[6] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[0];
   assign outBank0[0] = addr0b[6] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outBank_a0[0] = addr0c[6] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];

   assign inBank1[0] = addr1[6] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[0];
   assign outBank1[0] = addr1b[6] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outBank_a1[0] = addr1c[6] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];

   assign inBank2[0] = addr2[6] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[0];
   assign outBank2[0] = addr2b[6] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outBank_a2[0] = addr2c[6] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];

   assign inBank3[0] = addr3[6] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[0];
   assign outBank3[0] = addr3b[6] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outBank_a3[0] = addr3c[6] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];

   nextReg #(17, 5) nextReg_80606(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80609(.X(next0), .Y(next_out), .clk(clk));


   memArray128_78267 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 16)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 18)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 16) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 16)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[4];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[4];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_78267(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(32, 5) nextReg_80614(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78270(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80621(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5124;
   wire signed [31:0] a5125;
   wire  [0:0] a5122;
   wire signed [31:0] a5130;
   wire signed [31:0] a5131;
   wire  [0:0] a5123;
   reg signed [31:0] t2414;
   reg signed [31:0] t2415;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2416;
   reg signed [31:0] t2417;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5124 = X0;
   assign a5125 = X1;
   assign a5122 = (a5124 <= a5125)  ? 1 : 0

;
   assign a5130 = X2;
   assign a5131 = X3;
   assign a5123 = (a5130 <= a5131)  ? 1 : 0

;
   assign Y0 = t2414;
   assign Y1 = t2415;
   assign Y2 = t2416;
   assign Y3 = t2417;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2414 <= (a5122 == 1) ? a5124 : a5125;
         t2415 <= (a5122 == 1) ? a5125 : a5124;
         t2416 <= (a5123 == 1) ? a5130 : a5131;
         t2417 <= (a5123 == 1) ? a5131 : a5130;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module perm78377(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[5] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[0];
   assign outBank2[0] = addr2b[5] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[5] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[5] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[0];
   assign outBank3[0] = addr3b[5] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[5] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(9, 4) nextReg_80626(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80629(.X(next0), .Y(next_out), .clk(clk));


   memArray64_78377 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_78377(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80634(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78380(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80641(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5090;
   wire signed [31:0] a5091;
   wire  [0:0] a5088;
   wire signed [31:0] a5096;
   wire signed [31:0] a5097;
   wire  [0:0] a5089;
   reg signed [31:0] t2398;
   reg signed [31:0] t2399;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2400;
   reg signed [31:0] t2401;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5090 = X0;
   assign a5091 = X1;
   assign a5088 = (a5090 <= a5091)  ? 1 : 0

;
   assign a5096 = X2;
   assign a5097 = X3;
   assign a5089 = (a5096 <= a5097)  ? 1 : 0

;
   assign Y0 = t2398;
   assign Y1 = t2399;
   assign Y2 = t2400;
   assign Y3 = t2401;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2398 <= (a5088 == 1) ? a5090 : a5091;
         t2399 <= (a5088 == 1) ? a5091 : a5090;
         t2400 <= (a5089 == 1) ? a5096 : a5097;
         t2401 <= (a5089 == 1) ? a5097 : a5096;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm78487(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80644(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80647(.X(next0), .Y(next_out), .clk(clk));


   memArray32_78487 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_78487(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80650(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78490(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80653(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5056;
   wire signed [31:0] a5057;
   wire  [0:0] a5054;
   wire signed [31:0] a5062;
   wire signed [31:0] a5063;
   wire  [0:0] a5055;
   reg signed [31:0] t2382;
   reg signed [31:0] t2383;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2384;
   reg signed [31:0] t2385;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5056 = X0;
   assign a5057 = X1;
   assign a5054 = (a5056 <= a5057)  ? 1 : 0

;
   assign a5062 = X2;
   assign a5063 = X3;
   assign a5055 = (a5062 <= a5063)  ? 1 : 0

;
   assign Y0 = t2382;
   assign Y1 = t2383;
   assign Y2 = t2384;
   assign Y3 = t2385;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2382 <= (a5054 == 1) ? a5056 : a5057;
         t2383 <= (a5054 == 1) ? a5057 : a5056;
         t2384 <= (a5055 == 1) ? a5062 : a5063;
         t2385 <= (a5055 == 1) ? a5063 : a5062;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm78597(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80656(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80659(.X(next0), .Y(next_out), .clk(clk));


   memArray16_78597 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_78597(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80662(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78600(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80665(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a5022;
   wire signed [31:0] a5023;
   wire  [0:0] a5020;
   wire signed [31:0] a5028;
   wire signed [31:0] a5029;
   wire  [0:0] a5021;
   reg signed [31:0] t2366;
   reg signed [31:0] t2367;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2368;
   reg signed [31:0] t2369;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a5022 = X0;
   assign a5023 = X1;
   assign a5020 = (a5022 <= a5023)  ? 1 : 0

;
   assign a5028 = X2;
   assign a5029 = X3;
   assign a5021 = (a5028 <= a5029)  ? 1 : 0

;
   assign Y0 = t2366;
   assign Y1 = t2367;
   assign Y2 = t2368;
   assign Y3 = t2369;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2366 <= (a5020 == 1) ? a5022 : a5023;
         t2367 <= (a5020 == 1) ? a5023 : a5022;
         t2368 <= (a5021 == 1) ? a5028 : a5029;
         t2369 <= (a5021 == 1) ? a5029 : a5028;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm78707(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80668(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80671(.X(next0), .Y(next_out), .clk(clk));


   memArray8_78707 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_78707(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80674(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78710(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80677(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4988;
   wire signed [31:0] a4989;
   wire  [0:0] a4986;
   wire signed [31:0] a4994;
   wire signed [31:0] a4995;
   wire  [0:0] a4987;
   reg signed [31:0] t2350;
   reg signed [31:0] t2351;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2352;
   reg signed [31:0] t2353;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4988 = X0;
   assign a4989 = X1;
   assign a4986 = (a4988 <= a4989)  ? 1 : 0

;
   assign a4994 = X2;
   assign a4995 = X3;
   assign a4987 = (a4994 <= a4995)  ? 1 : 0

;
   assign Y0 = t2350;
   assign Y1 = t2351;
   assign Y2 = t2352;
   assign Y3 = t2353;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2350 <= (a4986 == 1) ? a4988 : a4989;
         t2351 <= (a4986 == 1) ? a4989 : a4988;
         t2352 <= (a4987 == 1) ? a4994 : a4995;
         t2353 <= (a4987 == 1) ? a4995 : a4994;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock78817(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock78836(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80682(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4954;
   wire signed [31:0] a4955;
   wire  [0:0] a4952;
   wire signed [31:0] a4960;
   wire signed [31:0] a4961;
   wire  [0:0] a4953;
   reg signed [31:0] t2334;
   reg signed [31:0] t2335;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2336;
   reg signed [31:0] t2337;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4954 = X0;
   assign a4955 = X1;
   assign a4952 = (a4954 <= a4955)  ? 1 : 0

;
   assign a4960 = X2;
   assign a4961 = X3;
   assign a4953 = (a4960 <= a4961)  ? 1 : 0

;
   assign Y0 = t2334;
   assign Y1 = t2335;
   assign Y2 = t2336;
   assign Y3 = t2337;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2334 <= (a4952 == 1) ? a4954 : a4955;
         t2335 <= (a4952 == 1) ? a4955 : a4954;
         t2336 <= (a4953 == 1) ? a4960 : a4961;
         t2337 <= (a4953 == 1) ? a4961 : a4960;
      end
   end
endmodule

// Latency: 258
// Gap: 256
module perm78943(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[1];
   assign inBank0[1] = addr0[9] ^ addr0[0];
   assign inAddr0[0] = addr0[9] ^ addr0[1];
   assign inAddr0[1] = addr0[9] ^ addr0[2];
   assign inAddr0[2] = addr0[9] ^ addr0[3];
   assign inAddr0[3] = addr0[9] ^ addr0[4];
   assign inAddr0[4] = addr0[9] ^ addr0[5];
   assign inAddr0[5] = addr0[9] ^ addr0[6];
   assign inAddr0[6] = addr0[9] ^ addr0[7];
   assign inAddr0[7] = addr0[9] ^ addr0[8];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outAddr0[6] = addr0b[8];
   assign outAddr0[7] = addr0b[9];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];
   assign outAddr_a0[6] = addr0c[8];
   assign outAddr_a0[7] = addr0c[9];

   assign inBank1[0] = addr1[1];
   assign inBank1[1] = addr1[9] ^ addr1[0];
   assign inAddr1[0] = addr1[9] ^ addr1[1];
   assign inAddr1[1] = addr1[9] ^ addr1[2];
   assign inAddr1[2] = addr1[9] ^ addr1[3];
   assign inAddr1[3] = addr1[9] ^ addr1[4];
   assign inAddr1[4] = addr1[9] ^ addr1[5];
   assign inAddr1[5] = addr1[9] ^ addr1[6];
   assign inAddr1[6] = addr1[9] ^ addr1[7];
   assign inAddr1[7] = addr1[9] ^ addr1[8];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outAddr1[6] = addr1b[8];
   assign outAddr1[7] = addr1b[9];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];
   assign outAddr_a1[6] = addr1c[8];
   assign outAddr_a1[7] = addr1c[9];

   assign inBank2[0] = addr2[1];
   assign inBank2[1] = addr2[9] ^ addr2[0];
   assign inAddr2[0] = addr2[9] ^ addr2[1];
   assign inAddr2[1] = addr2[9] ^ addr2[2];
   assign inAddr2[2] = addr2[9] ^ addr2[3];
   assign inAddr2[3] = addr2[9] ^ addr2[4];
   assign inAddr2[4] = addr2[9] ^ addr2[5];
   assign inAddr2[5] = addr2[9] ^ addr2[6];
   assign inAddr2[6] = addr2[9] ^ addr2[7];
   assign inAddr2[7] = addr2[9] ^ addr2[8];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outAddr2[6] = addr2b[8];
   assign outAddr2[7] = addr2b[9];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];
   assign outAddr_a2[6] = addr2c[8];
   assign outAddr_a2[7] = addr2c[9];

   assign inBank3[0] = addr3[1];
   assign inBank3[1] = addr3[9] ^ addr3[0];
   assign inAddr3[0] = addr3[9] ^ addr3[1];
   assign inAddr3[1] = addr3[9] ^ addr3[2];
   assign inAddr3[2] = addr3[9] ^ addr3[3];
   assign inAddr3[3] = addr3[9] ^ addr3[4];
   assign inAddr3[4] = addr3[9] ^ addr3[5];
   assign inAddr3[5] = addr3[9] ^ addr3[6];
   assign inAddr3[6] = addr3[9] ^ addr3[7];
   assign inAddr3[7] = addr3[9] ^ addr3[8];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outAddr3[6] = addr3b[8];
   assign outAddr3[7] = addr3b[9];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];
   assign outAddr_a3[6] = addr3c[8];
   assign outAddr_a3[7] = addr3c[9];

   nextReg #(256, 8) nextReg_80687(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80690(.X(next0), .Y(next_out), .clk(clk));


   memArray1024_78943 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_256;
    reg resetOutCountRd2_257;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_256 <= 0;
            resetOutCountRd2_257 <= 0;
        end
        else begin
            resetOutCountRd2_256 <= (inCount == 255) ? 1'b1 : 1'b0;
            resetOutCountRd2_257 <= resetOutCountRd2_256;
            if (resetOutCountRd2_257 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 255)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 255) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 255) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 255)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_2 = {x1, inAddr1};
    assign w_0_1 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[7];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_2), .y0(w_1_0), .y1(w_1_2), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_1), .x1(w_0_3), .y0(w_1_1), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray1024_78943(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(256, 8) nextReg_80695(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock78945(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80702(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4920;
   wire signed [31:0] a4921;
   wire  [0:0] a4918;
   wire signed [31:0] a4926;
   wire signed [31:0] a4927;
   wire  [0:0] a4919;
   reg signed [31:0] t2318;
   reg signed [31:0] t2319;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2320;
   reg signed [31:0] t2321;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4920 = X0;
   assign a4921 = X1;
   assign a4918 = (a4920 <= a4921)  ? 1 : 0

;
   assign a4926 = X2;
   assign a4927 = X3;
   assign a4919 = (a4926 <= a4927)  ? 1 : 0

;
   assign Y0 = t2318;
   assign Y1 = t2319;
   assign Y2 = t2320;
   assign Y3 = t2321;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2318 <= (a4918 == 1) ? a4920 : a4921;
         t2319 <= (a4918 == 1) ? a4921 : a4920;
         t2320 <= (a4919 == 1) ? a4926 : a4927;
         t2321 <= (a4919 == 1) ? a4927 : a4926;
      end
   end
endmodule

// Latency: 131
// Gap: 256
module perm79052(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[9] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[7];
   assign inAddr0[6] = addr0[8];
   assign inAddr0[7] = addr0[0];
   assign outBank0[0] = addr0b[9] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outAddr0[6] = addr0b[8];
   assign outAddr0[7] = addr0b[9];
   assign outBank_a0[0] = addr0c[9] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];
   assign outAddr_a0[6] = addr0c[8];
   assign outAddr_a0[7] = addr0c[9];

   assign inBank1[0] = addr1[9] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[7];
   assign inAddr1[6] = addr1[8];
   assign inAddr1[7] = addr1[0];
   assign outBank1[0] = addr1b[9] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outAddr1[6] = addr1b[8];
   assign outAddr1[7] = addr1b[9];
   assign outBank_a1[0] = addr1c[9] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];
   assign outAddr_a1[6] = addr1c[8];
   assign outAddr_a1[7] = addr1c[9];

   assign inBank2[0] = addr2[9] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[7];
   assign inAddr2[6] = addr2[8];
   assign inAddr2[7] = addr2[0];
   assign outBank2[0] = addr2b[9] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outAddr2[6] = addr2b[8];
   assign outAddr2[7] = addr2b[9];
   assign outBank_a2[0] = addr2c[9] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];
   assign outAddr_a2[6] = addr2c[8];
   assign outAddr_a2[7] = addr2c[9];

   assign inBank3[0] = addr3[9] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[7];
   assign inAddr3[6] = addr3[8];
   assign inAddr3[7] = addr3[0];
   assign outBank3[0] = addr3b[9] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outAddr3[6] = addr3b[8];
   assign outAddr3[7] = addr3b[9];
   assign outBank_a3[0] = addr3c[9] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];
   assign outAddr_a3[6] = addr3c[8];
   assign outAddr_a3[7] = addr3c[9];

   nextReg #(129, 8) nextReg_80707(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80710(.X(next0), .Y(next_out), .clk(clk));


   memArray1024_79052 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 128)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 130)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 128) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 255) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 128)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[7];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[7];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[7];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray1024_79052(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 256;
   parameter logDepth = 8;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(256, 8) nextReg_80715(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79054(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80722(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4886;
   wire signed [31:0] a4887;
   wire  [0:0] a4884;
   wire signed [31:0] a4892;
   wire signed [31:0] a4893;
   wire  [0:0] a4885;
   reg signed [31:0] t2302;
   reg signed [31:0] t2303;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2304;
   reg signed [31:0] t2305;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4886 = X0;
   assign a4887 = X1;
   assign a4884 = (a4886 <= a4887)  ? 1 : 0

;
   assign a4892 = X2;
   assign a4893 = X3;
   assign a4885 = (a4892 <= a4893)  ? 1 : 0

;
   assign Y0 = t2302;
   assign Y1 = t2303;
   assign Y2 = t2304;
   assign Y3 = t2305;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2302 <= (a4884 == 1) ? a4886 : a4887;
         t2303 <= (a4884 == 1) ? a4887 : a4886;
         t2304 <= (a4885 == 1) ? a4892 : a4893;
         t2305 <= (a4885 == 1) ? a4893 : a4892;
      end
   end
endmodule

// Latency: 67
// Gap: 128
module perm79161(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[8] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[7];
   assign inAddr0[6] = addr0[0];
   assign outBank0[0] = addr0b[8] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outAddr0[6] = addr0b[8];
   assign outBank_a0[0] = addr0c[8] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];
   assign outAddr_a0[6] = addr0c[8];

   assign inBank1[0] = addr1[8] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[7];
   assign inAddr1[6] = addr1[0];
   assign outBank1[0] = addr1b[8] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outAddr1[6] = addr1b[8];
   assign outBank_a1[0] = addr1c[8] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];
   assign outAddr_a1[6] = addr1c[8];

   assign inBank2[0] = addr2[8] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[7];
   assign inAddr2[6] = addr2[0];
   assign outBank2[0] = addr2b[8] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outAddr2[6] = addr2b[8];
   assign outBank_a2[0] = addr2c[8] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];
   assign outAddr_a2[6] = addr2c[8];

   assign inBank3[0] = addr3[8] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[7];
   assign inAddr3[6] = addr3[0];
   assign outBank3[0] = addr3b[8] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outAddr3[6] = addr3b[8];
   assign outBank_a3[0] = addr3c[8] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];
   assign outAddr_a3[6] = addr3c[8];

   nextReg #(65, 7) nextReg_80727(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80730(.X(next0), .Y(next_out), .clk(clk));


   memArray512_79161 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 64)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 66)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 64) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 127) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 64)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[6];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[6];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[6];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray512_79161(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 128;
   parameter logDepth = 7;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(128, 7) nextReg_80735(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79164(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80742(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4852;
   wire signed [31:0] a4853;
   wire  [0:0] a4850;
   wire signed [31:0] a4858;
   wire signed [31:0] a4859;
   wire  [0:0] a4851;
   reg signed [31:0] t2286;
   reg signed [31:0] t2287;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2288;
   reg signed [31:0] t2289;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4852 = X0;
   assign a4853 = X1;
   assign a4850 = (a4852 <= a4853)  ? 1 : 0

;
   assign a4858 = X2;
   assign a4859 = X3;
   assign a4851 = (a4858 <= a4859)  ? 1 : 0

;
   assign Y0 = t2286;
   assign Y1 = t2287;
   assign Y2 = t2288;
   assign Y3 = t2289;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2286 <= (a4850 == 1) ? a4852 : a4853;
         t2287 <= (a4850 == 1) ? a4853 : a4852;
         t2288 <= (a4851 == 1) ? a4858 : a4859;
         t2289 <= (a4851 == 1) ? a4859 : a4858;
      end
   end
endmodule

// Latency: 35
// Gap: 64
module perm79271(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[7] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[6];
   assign inAddr0[5] = addr0[0];
   assign outBank0[0] = addr0b[7] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outAddr0[5] = addr0b[7];
   assign outBank_a0[0] = addr0c[7] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];
   assign outAddr_a0[5] = addr0c[7];

   assign inBank1[0] = addr1[7] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[6];
   assign inAddr1[5] = addr1[0];
   assign outBank1[0] = addr1b[7] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outAddr1[5] = addr1b[7];
   assign outBank_a1[0] = addr1c[7] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];
   assign outAddr_a1[5] = addr1c[7];

   assign inBank2[0] = addr2[7] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[6];
   assign inAddr2[5] = addr2[0];
   assign outBank2[0] = addr2b[7] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outAddr2[5] = addr2b[7];
   assign outBank_a2[0] = addr2c[7] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];
   assign outAddr_a2[5] = addr2c[7];

   assign inBank3[0] = addr3[7] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[6];
   assign inAddr3[5] = addr3[0];
   assign outBank3[0] = addr3b[7] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outAddr3[5] = addr3b[7];
   assign outBank_a3[0] = addr3c[7] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];
   assign outAddr_a3[5] = addr3c[7];

   nextReg #(33, 6) nextReg_80747(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80750(.X(next0), .Y(next_out), .clk(clk));


   memArray256_79271 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 32)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 34)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 32) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 63) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 32)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[5];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[5];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[5];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray256_79271(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 64;
   parameter logDepth = 6;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(64, 6) nextReg_80755(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79274(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80762(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4818;
   wire signed [31:0] a4819;
   wire  [0:0] a4816;
   wire signed [31:0] a4824;
   wire signed [31:0] a4825;
   wire  [0:0] a4817;
   reg signed [31:0] t2270;
   reg signed [31:0] t2271;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2272;
   reg signed [31:0] t2273;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4818 = X0;
   assign a4819 = X1;
   assign a4816 = (a4818 <= a4819)  ? 1 : 0

;
   assign a4824 = X2;
   assign a4825 = X3;
   assign a4817 = (a4824 <= a4825)  ? 1 : 0

;
   assign Y0 = t2270;
   assign Y1 = t2271;
   assign Y2 = t2272;
   assign Y3 = t2273;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2270 <= (a4816 == 1) ? a4818 : a4819;
         t2271 <= (a4816 == 1) ? a4819 : a4818;
         t2272 <= (a4817 == 1) ? a4824 : a4825;
         t2273 <= (a4817 == 1) ? a4825 : a4824;
      end
   end
endmodule

// Latency: 19
// Gap: 32
module perm79381(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[6] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[5];
   assign inAddr0[4] = addr0[0];
   assign outBank0[0] = addr0b[6] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outAddr0[4] = addr0b[6];
   assign outBank_a0[0] = addr0c[6] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];
   assign outAddr_a0[4] = addr0c[6];

   assign inBank1[0] = addr1[6] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[5];
   assign inAddr1[4] = addr1[0];
   assign outBank1[0] = addr1b[6] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outAddr1[4] = addr1b[6];
   assign outBank_a1[0] = addr1c[6] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];
   assign outAddr_a1[4] = addr1c[6];

   assign inBank2[0] = addr2[6] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[5];
   assign inAddr2[4] = addr2[0];
   assign outBank2[0] = addr2b[6] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outAddr2[4] = addr2b[6];
   assign outBank_a2[0] = addr2c[6] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];
   assign outAddr_a2[4] = addr2c[6];

   assign inBank3[0] = addr3[6] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[5];
   assign inAddr3[4] = addr3[0];
   assign outBank3[0] = addr3b[6] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outAddr3[4] = addr3b[6];
   assign outBank_a3[0] = addr3c[6] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];
   assign outAddr_a3[4] = addr3c[6];

   nextReg #(17, 5) nextReg_80767(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80770(.X(next0), .Y(next_out), .clk(clk));


   memArray128_79381 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 16)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 18)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 16) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 31) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 16)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[4];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[4];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[4];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray128_79381(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 32;
   parameter logDepth = 5;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(32, 5) nextReg_80775(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79384(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80782(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4784;
   wire signed [31:0] a4785;
   wire  [0:0] a4782;
   wire signed [31:0] a4790;
   wire signed [31:0] a4791;
   wire  [0:0] a4783;
   reg signed [31:0] t2254;
   reg signed [31:0] t2255;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2256;
   reg signed [31:0] t2257;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4784 = X0;
   assign a4785 = X1;
   assign a4782 = (a4784 <= a4785)  ? 1 : 0

;
   assign a4790 = X2;
   assign a4791 = X3;
   assign a4783 = (a4790 <= a4791)  ? 1 : 0

;
   assign Y0 = t2254;
   assign Y1 = t2255;
   assign Y2 = t2256;
   assign Y3 = t2257;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2254 <= (a4782 == 1) ? a4784 : a4785;
         t2255 <= (a4782 == 1) ? a4785 : a4784;
         t2256 <= (a4783 == 1) ? a4790 : a4791;
         t2257 <= (a4783 == 1) ? a4791 : a4790;
      end
   end
endmodule

// Latency: 11
// Gap: 16
module perm79491(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[5] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[4];
   assign inAddr0[3] = addr0[0];
   assign outBank0[0] = addr0b[5] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outAddr0[3] = addr0b[5];
   assign outBank_a0[0] = addr0c[5] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];
   assign outAddr_a0[3] = addr0c[5];

   assign inBank1[0] = addr1[5] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[4];
   assign inAddr1[3] = addr1[0];
   assign outBank1[0] = addr1b[5] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outAddr1[3] = addr1b[5];
   assign outBank_a1[0] = addr1c[5] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];
   assign outAddr_a1[3] = addr1c[5];

   assign inBank2[0] = addr2[5] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[4];
   assign inAddr2[3] = addr2[0];
   assign outBank2[0] = addr2b[5] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outAddr2[3] = addr2b[5];
   assign outBank_a2[0] = addr2c[5] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];
   assign outAddr_a2[3] = addr2c[5];

   assign inBank3[0] = addr3[5] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[4];
   assign inAddr3[3] = addr3[0];
   assign outBank3[0] = addr3b[5] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outAddr3[3] = addr3b[5];
   assign outBank_a3[0] = addr3c[5] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];
   assign outAddr_a3[3] = addr3c[5];

   nextReg #(9, 4) nextReg_80787(.X(next), .Y(next0), .reset(reset), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80790(.X(next0), .Y(next_out), .clk(clk));


   memArray64_79491 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 8)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 10)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 8) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 15) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 8)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[3];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[3];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[3];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray64_79491(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 16;
   parameter logDepth = 4;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   nextReg #(16, 4) nextReg_80795(.X(next), .Y(next0), .reset(reset), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79494(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80802(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4750;
   wire signed [31:0] a4751;
   wire  [0:0] a4748;
   wire signed [31:0] a4756;
   wire signed [31:0] a4757;
   wire  [0:0] a4749;
   reg signed [31:0] t2238;
   reg signed [31:0] t2239;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2240;
   reg signed [31:0] t2241;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4750 = X0;
   assign a4751 = X1;
   assign a4748 = (a4750 <= a4751)  ? 1 : 0

;
   assign a4756 = X2;
   assign a4757 = X3;
   assign a4749 = (a4756 <= a4757)  ? 1 : 0

;
   assign Y0 = t2238;
   assign Y1 = t2239;
   assign Y2 = t2240;
   assign Y3 = t2241;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2238 <= (a4748 == 1) ? a4750 : a4751;
         t2239 <= (a4748 == 1) ? a4751 : a4750;
         t2240 <= (a4749 == 1) ? a4756 : a4757;
         t2241 <= (a4749 == 1) ? a4757 : a4756;
      end
   end
endmodule

// Latency: 7
// Gap: 8
module perm79601(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[4] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[3];
   assign inAddr0[2] = addr0[0];
   assign outBank0[0] = addr0b[4] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outAddr0[2] = addr0b[4];
   assign outBank_a0[0] = addr0c[4] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];
   assign outAddr_a0[2] = addr0c[4];

   assign inBank1[0] = addr1[4] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[3];
   assign inAddr1[2] = addr1[0];
   assign outBank1[0] = addr1b[4] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outAddr1[2] = addr1b[4];
   assign outBank_a1[0] = addr1c[4] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];
   assign outAddr_a1[2] = addr1c[4];

   assign inBank2[0] = addr2[4] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[3];
   assign inAddr2[2] = addr2[0];
   assign outBank2[0] = addr2b[4] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outAddr2[2] = addr2b[4];
   assign outBank_a2[0] = addr2c[4] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];
   assign outAddr_a2[2] = addr2c[4];

   assign inBank3[0] = addr3[4] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[3];
   assign inAddr3[2] = addr3[0];
   assign outBank3[0] = addr3b[4] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outAddr3[2] = addr3b[4];
   assign outBank_a3[0] = addr3c[4] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];
   assign outAddr_a3[2] = addr3c[4];

   shiftRegFIFO #(5, 1) shiftFIFO_80805(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80808(.X(next0), .Y(next_out), .clk(clk));


   memArray32_79601 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
        outCount_for_rd_data <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 4)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
         if (inCount == 6)
            outCount_for_rd_data <= 0;
         else
            outCount_for_rd_data <= outCount_for_rd_data+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 4) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 7) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 4)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[2];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[2];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[2];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray32_79601(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 8;
   parameter logDepth = 3;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(8, 1) shiftFIFO_80811(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79604(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80814(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4716;
   wire signed [31:0] a4717;
   wire  [0:0] a4714;
   wire signed [31:0] a4722;
   wire signed [31:0] a4723;
   wire  [0:0] a4715;
   reg signed [31:0] t2222;
   reg signed [31:0] t2223;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2224;
   reg signed [31:0] t2225;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4716 = X0;
   assign a4717 = X1;
   assign a4714 = (a4716 <= a4717)  ? 1 : 0

;
   assign a4722 = X2;
   assign a4723 = X3;
   assign a4715 = (a4722 <= a4723)  ? 1 : 0

;
   assign Y0 = t2222;
   assign Y1 = t2223;
   assign Y2 = t2224;
   assign Y3 = t2225;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2222 <= (a4714 == 1) ? a4716 : a4717;
         t2223 <= (a4714 == 1) ? a4717 : a4716;
         t2224 <= (a4715 == 1) ? a4722 : a4723;
         t2225 <= (a4715 == 1) ? a4723 : a4722;
      end
   end
endmodule

// Latency: 5
// Gap: 4
module perm79711(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[3] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[2];
   assign inAddr0[1] = addr0[0];
   assign outBank0[0] = addr0b[3] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outAddr0[1] = addr0b[3];
   assign outBank_a0[0] = addr0c[3] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];
   assign outAddr_a0[1] = addr0c[3];

   assign inBank1[0] = addr1[3] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[2];
   assign inAddr1[1] = addr1[0];
   assign outBank1[0] = addr1b[3] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outAddr1[1] = addr1b[3];
   assign outBank_a1[0] = addr1c[3] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];
   assign outAddr_a1[1] = addr1c[3];

   assign inBank2[0] = addr2[3] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[2];
   assign inAddr2[1] = addr2[0];
   assign outBank2[0] = addr2b[3] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outAddr2[1] = addr2b[3];
   assign outBank_a2[0] = addr2c[3] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];
   assign outAddr_a2[1] = addr2c[3];

   assign inBank3[0] = addr3[3] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[2];
   assign inAddr3[1] = addr3[0];
   assign outBank3[0] = addr3b[3] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outAddr3[1] = addr3b[3];
   assign outBank_a3[0] = addr3c[3] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];
   assign outAddr_a3[1] = addr3c[3];

   shiftRegFIFO #(3, 1) shiftFIFO_80817(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80820(.X(next0), .Y(next_out), .clk(clk));


   memArray16_79711 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_4;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_4 <= 0;
        end
        else begin
            resetOutCountRd2_4 <= (inCount == 3) ? 1'b1 : 1'b0;
            if (resetOutCountRd2_4 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 2)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 2) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 3) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 2)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[1];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[1];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[1];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray16_79711(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 4;
   parameter logDepth = 2;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(4, 1) shiftFIFO_80823(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79714(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80826(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4682;
   wire signed [31:0] a4683;
   wire  [0:0] a4680;
   wire signed [31:0] a4688;
   wire signed [31:0] a4689;
   wire  [0:0] a4681;
   reg signed [31:0] t2206;
   reg signed [31:0] t2207;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2208;
   reg signed [31:0] t2209;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4682 = X0;
   assign a4683 = X1;
   assign a4680 = (a4682 <= a4683)  ? 1 : 0

;
   assign a4688 = X2;
   assign a4689 = X3;
   assign a4681 = (a4688 <= a4689)  ? 1 : 0

;
   assign Y0 = t2206;
   assign Y1 = t2207;
   assign Y2 = t2208;
   assign Y3 = t2209;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2206 <= (a4680 == 1) ? a4682 : a4683;
         t2207 <= (a4680 == 1) ? a4683 : a4682;
         t2208 <= (a4681 == 1) ? a4688 : a4689;
         t2209 <= (a4681 == 1) ? a4689 : a4688;
      end
   end
endmodule

// Latency: 4
// Gap: 2
module perm79821(clk, next, reset, next_out,
   x0, y0,
   x1, y1,
   x2, y2,
   x3, y3);
   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;

   input [width-1:0]  x0;
   output [width-1:0]  y0;
   wire [width-1:0]  ybuff0;
   input [width-1:0]  x1;
   output [width-1:0]  y1;
   wire [width-1:0]  ybuff1;
   input [width-1:0]  x2;
   output [width-1:0]  y2;
   wire [width-1:0]  ybuff2;
   input [width-1:0]  x3;
   output [width-1:0]  y3;
   wire [width-1:0]  ybuff3;
   input 	      clk, next, reset;
   output 	     next_out;

   wire    	     next0;

   reg              inFlip0, outFlip0;
   reg              inActive, outActive;

   wire [logBanks-1:0] inBank0, outBank0;
   wire [logDepth-1:0] inAddr0, outAddr0;
   wire [logBanks-1:0] outBank_a0;
   wire [logDepth-1:0] outAddr_a0;
   wire [logDepth+logBanks-1:0] addr0, addr0b, addr0c;
   wire [logBanks-1:0] inBank1, outBank1;
   wire [logDepth-1:0] inAddr1, outAddr1;
   wire [logBanks-1:0] outBank_a1;
   wire [logDepth-1:0] outAddr_a1;
   wire [logDepth+logBanks-1:0] addr1, addr1b, addr1c;
   wire [logBanks-1:0] inBank2, outBank2;
   wire [logDepth-1:0] inAddr2, outAddr2;
   wire [logBanks-1:0] outBank_a2;
   wire [logDepth-1:0] outAddr_a2;
   wire [logDepth+logBanks-1:0] addr2, addr2b, addr2c;
   wire [logBanks-1:0] inBank3, outBank3;
   wire [logDepth-1:0] inAddr3, outAddr3;
   wire [logBanks-1:0] outBank_a3;
   wire [logDepth-1:0] outAddr_a3;
   wire [logDepth+logBanks-1:0] addr3, addr3b, addr3c;


   reg [logDepth-1:0]  inCount, outCount, outCount_d, outCount_dd, outCount_for_rd_addr, outCount_for_rd_data;  

   assign    addr0 = {inCount, 2'd0};
   assign    addr0b = {outCount, 2'd0};
   assign    addr0c = {outCount_for_rd_addr, 2'd0};
   assign    addr1 = {inCount, 2'd1};
   assign    addr1b = {outCount, 2'd1};
   assign    addr1c = {outCount_for_rd_addr, 2'd1};
   assign    addr2 = {inCount, 2'd2};
   assign    addr2b = {outCount, 2'd2};
   assign    addr2c = {outCount_for_rd_addr, 2'd2};
   assign    addr3 = {inCount, 2'd3};
   assign    addr3b = {outCount, 2'd3};
   assign    addr3c = {outCount_for_rd_addr, 2'd3};
    wire [width+logDepth-1:0] w_0_0, w_0_1, w_0_2, w_0_3, w_1_0, w_1_1, w_1_2, w_1_3;

    reg [width-1:0] z_0_0;
    reg [width-1:0] z_0_1;
    reg [width-1:0] z_0_2;
    reg [width-1:0] z_0_3;
    wire [width-1:0] z_1_0, z_1_1, z_1_2, z_1_3;

    wire [logDepth-1:0] u_0_0, u_0_1, u_0_2, u_0_3, u_1_0, u_1_1, u_1_2, u_1_3;

    always @(posedge clk) begin
    end

   assign inBank0[0] = addr0[2] ^ addr0[0];
   assign inBank0[1] = addr0[1];
   assign inAddr0[0] = addr0[0];
   assign outBank0[0] = addr0b[2] ^ addr0b[0];
   assign outBank0[1] = addr0b[1];
   assign outAddr0[0] = addr0b[2];
   assign outBank_a0[0] = addr0c[2] ^ addr0c[0];
   assign outBank_a0[1] = addr0c[1];
   assign outAddr_a0[0] = addr0c[2];

   assign inBank1[0] = addr1[2] ^ addr1[0];
   assign inBank1[1] = addr1[1];
   assign inAddr1[0] = addr1[0];
   assign outBank1[0] = addr1b[2] ^ addr1b[0];
   assign outBank1[1] = addr1b[1];
   assign outAddr1[0] = addr1b[2];
   assign outBank_a1[0] = addr1c[2] ^ addr1c[0];
   assign outBank_a1[1] = addr1c[1];
   assign outAddr_a1[0] = addr1c[2];

   assign inBank2[0] = addr2[2] ^ addr2[0];
   assign inBank2[1] = addr2[1];
   assign inAddr2[0] = addr2[0];
   assign outBank2[0] = addr2b[2] ^ addr2b[0];
   assign outBank2[1] = addr2b[1];
   assign outAddr2[0] = addr2b[2];
   assign outBank_a2[0] = addr2c[2] ^ addr2c[0];
   assign outBank_a2[1] = addr2c[1];
   assign outAddr_a2[0] = addr2c[2];

   assign inBank3[0] = addr3[2] ^ addr3[0];
   assign inBank3[1] = addr3[1];
   assign inAddr3[0] = addr3[0];
   assign outBank3[0] = addr3b[2] ^ addr3b[0];
   assign outBank3[1] = addr3b[1];
   assign outAddr3[0] = addr3b[2];
   assign outBank_a3[0] = addr3c[2] ^ addr3c[0];
   assign outBank_a3[1] = addr3c[1];
   assign outAddr_a3[0] = addr3c[2];

   shiftRegFIFO #(2, 1) shiftFIFO_80829(.X(next), .Y(next0), .clk(clk));


   shiftRegFIFO #(2, 1) shiftFIFO_80832(.X(next0), .Y(next_out), .clk(clk));


   memArray8_79821 #(numBanks, logBanks, depth, logDepth, width)
     memSys(.inFlip(inFlip0), .outFlip(outFlip0), .next(next), .reset(reset),
        .x0(w_1_0[width+logDepth-1:logDepth]), .y0(ybuff0),
        .inAddr0(w_1_0[logDepth-1:0]),
        .outAddr0(u_1_0), 
        .x1(w_1_1[width+logDepth-1:logDepth]), .y1(ybuff1),
        .inAddr1(w_1_1[logDepth-1:0]),
        .outAddr1(u_1_1), 
        .x2(w_1_2[width+logDepth-1:logDepth]), .y2(ybuff2),
        .inAddr2(w_1_2[logDepth-1:0]),
        .outAddr2(u_1_2), 
        .x3(w_1_3[width+logDepth-1:logDepth]), .y3(ybuff3),
        .inAddr3(w_1_3[logDepth-1:0]),
        .outAddr3(u_1_3), 
        .clk(clk));

    reg resetOutCountRd2_2;
    reg resetOutCountRd2_3;

    always @(posedge clk) begin
        if (reset == 1) begin
            resetOutCountRd2_2 <= 0;
            resetOutCountRd2_3 <= 0;
        end
        else begin
            resetOutCountRd2_2 <= (inCount == 1) ? 1'b1 : 1'b0;
            resetOutCountRd2_3 <= resetOutCountRd2_2;
            if (resetOutCountRd2_3 == 1'b1)
                outCount_for_rd_data <= 0;
            else
                outCount_for_rd_data <= outCount_for_rd_data+1;
        end
    end
   always @(posedge clk) begin
      if (reset == 1) begin
      z_0_0 <= 0;
      z_0_1 <= 0;
      z_0_2 <= 0;
      z_0_3 <= 0;
         inFlip0 <= 0; outFlip0 <= 1; outCount <= 0; inCount <= 0;
        outCount_for_rd_addr <= 0;
      end
      else begin
          outCount_d <= outCount;
          outCount_dd <= outCount_d;
         if (inCount == 1)
            outCount_for_rd_addr <= 0;
         else
            outCount_for_rd_addr <= outCount_for_rd_addr+1;
      z_0_0 <= ybuff0;
      z_0_1 <= ybuff1;
      z_0_2 <= ybuff2;
      z_0_3 <= ybuff3;
         if (inCount == 1) begin
            outFlip0 <= ~outFlip0;
            outCount <= 0;
         end
         else
            outCount <= outCount+1;
         if (inCount == 1) begin
            inFlip0 <= ~inFlip0;
         end
         if (next == 1) begin
            if (inCount >= 1)
               inFlip0 <= ~inFlip0;
            inCount <= 0;
         end
         else
            inCount <= inCount + 1;
      end
   end
    assign w_0_0 = {x0, inAddr0};
    assign w_0_1 = {x1, inAddr1};
    assign w_0_2 = {x2, inAddr2};
    assign w_0_3 = {x3, inAddr3};
    assign y0 = z_1_0;
    assign y1 = z_1_1;
    assign y2 = z_1_2;
    assign y3 = z_1_3;
    assign u_0_0 = outAddr_a0;
    assign u_0_1 = outAddr_a1;
    assign u_0_2 = outAddr_a2;
    assign u_0_3 = outAddr_a3;
    wire wr_ctrl_st_0;
    assign wr_ctrl_st_0 = inCount[0];

    switch #(logDepth+width) in_sw_0_0(.x0(w_0_0), .x1(w_0_1), .y0(w_1_0), .y1(w_1_1), .ctrl(wr_ctrl_st_0));
    switch #(logDepth+width) in_sw_0_1(.x0(w_0_2), .x1(w_0_3), .y0(w_1_2), .y1(w_1_3), .ctrl(wr_ctrl_st_0));
    wire rdd_ctrl_st_0;
    assign rdd_ctrl_st_0 = outCount_for_rd_data[0];

    switch #(width) out_sw_0_0(.x0(z_0_0), .x1(z_0_1), .y0(z_1_0), .y1(z_1_1), .ctrl(rdd_ctrl_st_0));
    switch #(width) out_sw_0_1(.x0(z_0_2), .x1(z_0_3), .y0(z_1_2), .y1(z_1_3), .ctrl(rdd_ctrl_st_0));
    wire rda_ctrl_st_0;
    assign rda_ctrl_st_0 = outCount_for_rd_addr[0];

    switch #(logDepth) rdaddr_sw_0_0(.x0(u_0_0), .x1(u_0_1), .y0(u_1_0), .y1(u_1_1), .ctrl(rda_ctrl_st_0));
    switch #(logDepth) rdaddr_sw_0_1(.x0(u_0_2), .x1(u_0_3), .y0(u_1_2), .y1(u_1_3), .ctrl(rda_ctrl_st_0));
endmodule

module memArray8_79821(next, reset,
                x0, y0,
                inAddr0,
                outAddr0,
                x1, y1,
                inAddr1,
                outAddr1,
                x2, y2,
                inAddr2,
                outAddr2,
                x3, y3,
                inAddr3,
                outAddr3,
                clk, inFlip, outFlip);

   parameter numBanks = 4;
   parameter logBanks = 2;
   parameter depth = 2;
   parameter logDepth = 1;
   parameter width = 32;
         
   input     clk, next, reset;
   input    inFlip, outFlip;
   wire    next0;
   
   input [width-1:0]   x0;
   output [width-1:0]  y0;
   input [logDepth-1:0] inAddr0, outAddr0;
   input [width-1:0]   x1;
   output [width-1:0]  y1;
   input [logDepth-1:0] inAddr1, outAddr1;
   input [width-1:0]   x2;
   output [width-1:0]  y2;
   input [logDepth-1:0] inAddr2, outAddr2;
   input [width-1:0]   x3;
   output [width-1:0]  y3;
   input [logDepth-1:0] inAddr3, outAddr3;
   shiftRegFIFO #(2, 1) shiftFIFO_80835(.X(next), .Y(next0), .clk(clk));


   memMod_dist #(depth*2, width, logDepth+1) 
     memMod0(.in(x0), .out(y0), .inAddr({inFlip, inAddr0}),
	   .outAddr({outFlip, outAddr0}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod1(.in(x1), .out(y1), .inAddr({inFlip, inAddr1}),
	   .outAddr({outFlip, outAddr1}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod2(.in(x2), .out(y2), .inAddr({inFlip, inAddr2}),
	   .outAddr({outFlip, outAddr2}), .writeSel(1'b1), .clk(clk));   
   memMod_dist #(depth*2, width, logDepth+1) 
     memMod3(.in(x3), .out(y3), .inAddr({inFlip, inAddr3}),
	   .outAddr({outFlip, outAddr3}), .writeSel(1'b1), .clk(clk));   
endmodule

// Latency: 2
// Gap: 1
module codeBlock79824(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80838(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4648;
   wire signed [31:0] a4649;
   wire  [0:0] a4646;
   wire signed [31:0] a4654;
   wire signed [31:0] a4655;
   wire  [0:0] a4647;
   reg signed [31:0] t2190;
   reg signed [31:0] t2191;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2192;
   reg signed [31:0] t2193;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4648 = X0;
   assign a4649 = X1;
   assign a4646 = (a4648 <= a4649)  ? 1 : 0

;
   assign a4654 = X2;
   assign a4655 = X3;
   assign a4647 = (a4654 <= a4655)  ? 1 : 0

;
   assign Y0 = t2190;
   assign Y1 = t2191;
   assign Y2 = t2192;
   assign Y3 = t2193;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2190 <= (a4646 == 1) ? a4648 : a4649;
         t2191 <= (a4646 == 1) ? a4649 : a4648;
         t2192 <= (a4647 == 1) ? a4654 : a4655;
         t2193 <= (a4647 == 1) ? a4655 : a4654;
      end
   end
endmodule

// Latency: 1
// Gap: 1
module codeBlock79931(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   assign next_out = next;


   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign Y0 = X0;
   assign Y1 = X2;
   assign Y2 = X1;
   assign Y3 = X3;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
      end
   end
endmodule

// Latency: 2
// Gap: 1
module codeBlock79950(clk, reset, next_in, next_out,
   X0_in, Y0,
   X1_in, Y1,
   X2_in, Y2,
   X3_in, Y3);

   output next_out;
   input clk, reset, next_in;

   reg next;

   input [31:0] X0_in,
      X1_in,
      X2_in,
      X3_in;

   reg   [31:0] X0,
      X1,
      X2,
      X3;

   output [31:0] Y0,
      Y1,
      Y2,
      Y3;

   shiftRegFIFO #(1, 1) shiftFIFO_80843(.X(next), .Y(next_out), .clk(clk));


   wire signed [31:0] a4614;
   wire signed [31:0] a4615;
   wire  [0:0] a4612;
   wire signed [31:0] a4620;
   wire signed [31:0] a4621;
   wire  [0:0] a4613;
   reg signed [31:0] t2174;
   reg signed [31:0] t2175;
   wire signed [31:0] Y0;
   wire signed [31:0] Y1;
   reg signed [31:0] t2176;
   reg signed [31:0] t2177;
   wire signed [31:0] Y2;
   wire signed [31:0] Y3;


   assign a4614 = X0;
   assign a4615 = X1;
   assign a4612 = (a4614 <= a4615)  ? 1 : 0

;
   assign a4620 = X2;
   assign a4621 = X3;
   assign a4613 = (a4620 <= a4621)  ? 1 : 0

;
   assign Y0 = t2174;
   assign Y1 = t2175;
   assign Y2 = t2176;
   assign Y3 = t2177;



   always @(posedge clk) begin
      if (reset == 1) begin
      end
      else begin
         X0 <= X0_in;
         X1 <= X1_in;
         X2 <= X2_in;
         X3 <= X3_in;
         next <= next_in;
         t2174 <= (a4612 == 1) ? a4614 : a4615;
         t2175 <= (a4612 == 1) ? a4615 : a4614;
         t2176 <= (a4613 == 1) ? a4620 : a4621;
         t2177 <= (a4613 == 1) ? a4621 : a4620;
      end
   end
endmodule


