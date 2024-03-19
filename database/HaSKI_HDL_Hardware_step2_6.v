// Automatically generated Verilog-2001
module Hardware_step2_6(ds_i1
                       ,ds1_i2
                       ,bodyVar_o);
  input [345:0] ds_i1;
  input [127:0] ds1_i2;
  output [345:0] bodyVar_o;
  wire [345:0] altLet_0;
  wire [345:0] altLet_1;
  wire [250:0] ds2_2;
  wire [345:0] altLet_3;
  wire [127:0] ds2_4;
  wire [345:0] altLet_5;
  wire [345:0] altLet_6;
  wire [345:0] altLet_7;
  wire [345:0] altLet_8;
  wire [190:0] ds3_9;
  wire [62:0] ski_10;
  wire [29:0] ds4_11;
  wire [345:0] altLet_12;
  wire [345:0] altLet_13;
  wire [345:0] altLet_14;
  wire [345:0] bodyVar_15;
  wire [345:0] altLet_16;
  wire [345:0] bodyVar_17;
  wire [345:0] altLet_18;
  wire [345:0] altLet_19;
  wire [345:0] altLet_20;
  wire [345:0] altLet_21;
  wire [345:0] altLet_22;
  wire [345:0] altLet_23;
  wire [345:0] altLet_24;
  wire [345:0] altLet_25;
  wire [345:0] altLet_26;
  wire [345:0] altLet_27;
  wire [345:0] bodyVar_28;
  wire [345:0] altLet_29;
  wire [345:0] altLet_30;
  wire [345:0] altLet_31;
  wire [345:0] altLet_32;
  wire [345:0] altLet_33;
  wire [345:0] altLet_34;
  wire [345:0] altLet_35;
  wire [62:0] current1_36;
  wire [345:0] altLet_37;
  wire [250:0] repANF_38;
  wire [345:0] altLet_39;
  wire [345:0] altLet_40;
  wire [250:0] repANF_41;
  wire [345:0] bodyVar_42;
  wire [345:0] altLet_43;
  wire [345:0] altLet_44;
  wire [345:0] altLet_45;
  wire [250:0] repANF_46;
  wire [250:0] repANF_47;
  wire [345:0] altLet_48;
  wire [250:0] repANF_49;
  wire [345:0] bodyVar_50;
  wire [345:0] altLet_51;
  wire [345:0] altLet_52;
  wire [345:0] altLet_53;
  wire [62:0] x_54;
  wire [62:0] x_55;
  wire [62:0] x_56;
  wire [29:0] heap1_57;
  wire [250:0] repANF_58;
  wire [62:0] a1_59;
  wire [250:0] repANF_60;
  wire [190:0] repANF_61;
  wire [250:0] repANF_62;
  wire [250:0] repANF_63;
  wire [250:0] repANF_64;
  wire [250:0] repANF_65;
  wire [250:0] repANF_66;
  wire [190:0] repANF_67;
  wire [190:0] repANF_68;
  wire [190:0] repANF_69;
  wire [250:0] repANF_70;
  wire [250:0] repANF_71;
  wire [29:0] repANF_72;
  wire [250:0] repANF_73;
  wire [250:0] repANF_74;
  wire [250:0] repANF_75;
  wire [29:0] base1_76;
  wire [190:0] repANF_77;
  wire [190:0] repANF_78;
  wire [190:0] repANF_79;
  wire [29:0] repANF_80;
  wire [190:0] repANF_81;
  wire [29:0] repANF_82;
  wire [29:0] repANF_83;
  wire [29:0] repANF_84;
  wire [29:0] repANF_85;
  wire [29:0] dec_86;
  wire [190:0] repANF_87;
  wire [29:0] repANF_88;
  wire [190:0] repANF_89;
  wire [190:0] repANF_90;
  wire [190:0] repANF_91;
  wire [62:0] y_92;
  wire [62:0] y_93;
  wire [62:0] z_94;
  wire [62:0] b_95;
  wire [62:0] repANF_96;
  wire [29:0] a1_97;
  wire [29:0] ds5_98;
  reg [345:0] bodyVar_o_reg;
  always @(*) begin
    case(ds_i1[345:344])
      2'b00 : bodyVar_o_reg = altLet_0;
      2'b01 : bodyVar_o_reg = altLet_1;
      default : bodyVar_o_reg = {2'b10,344'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
    endcase
  end
  assign bodyVar_o = bodyVar_o_reg;
  
  reg [345:0] altLet_0_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_0_reg = altLet_3;
      default : altLet_0_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_0 = altLet_0_reg;
  
  reg [345:0] altLet_1_reg;
  always @(*) begin
    case(ds3_9[190:189])
      2'b00 : altLet_1_reg = altLet_5;
      2'b01 : altLet_1_reg = altLet_6;
      2'b10 : altLet_1_reg = altLet_7;
      default : altLet_1_reg = altLet_8;
    endcase
  end
  assign altLet_1 = altLet_1_reg;
  
  assign ds2_2 = ds_i1[343:93];
  
  assign altLet_3 = {2'b01,{{2'b00,189'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                           ,30'd256
                           ,30'd0},30'd1279,ski_10};
  
  assign ds2_4 = ds1_i2;
  
  reg [345:0] altLet_5_reg;
  always @(*) begin
    case(ds4_11)
      30'd0 : altLet_5_reg = altLet_12;
      default : altLet_5_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_5 = altLet_5_reg;
  
  reg [345:0] altLet_6_reg;
  always @(*) begin
    case(ds4_11)
      30'd0 : altLet_6_reg = altLet_13;
      default : altLet_6_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_6 = altLet_6_reg;
  
  reg [345:0] altLet_7_reg;
  always @(*) begin
    case(ds4_11)
      30'd0 : altLet_7_reg = altLet_14;
      default : altLet_7_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_7 = altLet_7_reg;
  
  reg [345:0] altLet_8_reg;
  always @(*) begin
    case(ds4_11)
      30'd0 : altLet_8_reg = altLet_16;
      30'd1 : altLet_8_reg = bodyVar_17;
      default : altLet_8_reg = bodyVar_15;
    endcase
  end
  assign altLet_8 = altLet_8_reg;
  
  assign ds3_9 = ds2_2[250:60];
  
  assign ski_10 = ds2_4[125:63];
  
  assign ds4_11 = ds2_2[29:0];
  
  reg [345:0] altLet_12_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : altLet_12_reg = {346 {1'bx}};
      3'b001 : altLet_12_reg = {346 {1'bx}};
      3'b010 : altLet_12_reg = {346 {1'bx}};
      3'b011 : altLet_12_reg = altLet_18;
      default : altLet_12_reg = {2'b10,344'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
    endcase
  end
  assign altLet_12 = altLet_12_reg;
  
  reg [345:0] altLet_13_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : altLet_13_reg = {346 {1'bx}};
      3'b001 : altLet_13_reg = {346 {1'bx}};
      3'b010 : altLet_13_reg = altLet_20;
      3'b011 : altLet_13_reg = altLet_19;
      default : altLet_13_reg = altLet_20;
    endcase
  end
  assign altLet_13 = altLet_13_reg;
  
  reg [345:0] altLet_14_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : altLet_14_reg = {346 {1'bx}};
      3'b001 : altLet_14_reg = altLet_21;
      3'b010 : altLet_14_reg = altLet_23;
      3'b011 : altLet_14_reg = altLet_22;
      default : altLet_14_reg = altLet_23;
    endcase
  end
  assign altLet_14 = altLet_14_reg;
  
  reg [345:0] bodyVar_15_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : bodyVar_15_reg = altLet_24;
      3'b001 : bodyVar_15_reg = altLet_25;
      3'b010 : bodyVar_15_reg = altLet_27;
      3'b011 : bodyVar_15_reg = altLet_26;
      default : bodyVar_15_reg = altLet_27;
    endcase
  end
  assign bodyVar_15 = bodyVar_15_reg;
  
  reg [345:0] altLet_16_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : altLet_16_reg = bodyVar_28;
      3'b001 : altLet_16_reg = altLet_29;
      3'b010 : altLet_16_reg = altLet_31;
      3'b011 : altLet_16_reg = altLet_30;
      default : altLet_16_reg = altLet_31;
    endcase
  end
  assign altLet_16 = altLet_16_reg;
  
  reg [345:0] bodyVar_17_reg;
  always @(*) begin
    case(current1_36[62:60])
      3'b000 : bodyVar_17_reg = altLet_32;
      3'b001 : bodyVar_17_reg = altLet_33;
      3'b010 : bodyVar_17_reg = altLet_35;
      3'b011 : bodyVar_17_reg = altLet_34;
      default : bodyVar_17_reg = altLet_35;
    endcase
  end
  assign bodyVar_17 = bodyVar_17_reg;
  
  reg [345:0] altLet_18_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_18_reg = altLet_37;
      default : altLet_18_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_18 = altLet_18_reg;
  
  reg [345:0] altLet_19_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_19_reg = altLet_39;
      default : altLet_19_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_19 = altLet_19_reg;
  
  assign altLet_20 = {2'b01,repANF_38,heap1_57,x_54};
  
  assign altLet_21 = {2'b01,repANF_38,heap1_57,x_55};
  
  reg [345:0] altLet_22_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_22_reg = altLet_40;
      default : altLet_22_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_22 = altLet_22_reg;
  
  assign altLet_23 = {2'b01,repANF_41,heap1_57,x_55};
  
  reg [345:0] altLet_24_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_24_reg = bodyVar_42;
      default : altLet_24_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_24 = altLet_24_reg;
  
  reg [345:0] altLet_25_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_25_reg = altLet_43;
      default : altLet_25_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_25 = altLet_25_reg;
  
  reg [345:0] altLet_26_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_26_reg = altLet_44;
      default : altLet_26_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_26 = altLet_26_reg;
  
  reg [345:0] altLet_27_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_27_reg = altLet_45;
      default : altLet_27_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_27 = altLet_27_reg;
  
  assign bodyVar_28 = {2'b01,repANF_46,repANF_72,x_56};
  
  assign altLet_29 = {2'b01,repANF_47,heap1_57,x_56};
  
  reg [345:0] altLet_30_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_30_reg = altLet_48;
      default : altLet_30_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_30 = altLet_30_reg;
  
  assign altLet_31 = {2'b01,repANF_49,heap1_57,x_56};
  
  reg [345:0] altLet_32_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_32_reg = bodyVar_50;
      default : altLet_32_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_32 = altLet_32_reg;
  
  reg [345:0] altLet_33_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_33_reg = altLet_51;
      default : altLet_33_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_33 = altLet_33_reg;
  
  reg [345:0] altLet_34_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b10 : altLet_34_reg = altLet_52;
      default : altLet_34_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_34 = altLet_34_reg;
  
  reg [345:0] altLet_35_reg;
  always @(*) begin
    case(ds2_4[127:126])
      2'b01 : altLet_35_reg = altLet_53;
      default : altLet_35_reg = {346 {1'bx}};
    endcase
  end
  assign altLet_35 = altLet_35_reg;
  
  assign current1_36 = ds_i1[62:0];
  
  assign altLet_37 = {2'b01,repANF_58,heap1_57,a1_59};
  
  assign repANF_38 = {{2'b00,189'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                     ,base1_76
                     ,30'd0};
  
  assign altLet_39 = {2'b01,repANF_60,heap1_57,a1_59};
  
  assign altLet_40 = {2'b01,repANF_62,heap1_57,a1_59};
  
  assign repANF_41 = {repANF_61
                     ,base1_76
                     ,30'd0};
  
  assign bodyVar_42 = {2'b01,repANF_63,repANF_72,x_56};
  
  assign altLet_43 = {2'b01,repANF_64,heap1_57,x_56};
  
  assign altLet_44 = {2'b01,repANF_65,heap1_57,a1_59};
  
  assign altLet_45 = {2'b01,repANF_66,heap1_57,x_56};
  
  assign repANF_46 = {repANF_67
                     ,base1_76
                     ,30'd0};
  
  assign repANF_47 = {repANF_68
                     ,base1_76
                     ,30'd0};
  
  assign altLet_48 = {2'b01,repANF_70,heap1_57,a1_59};
  
  assign repANF_49 = {repANF_69
                     ,base1_76
                     ,30'd0};
  
  assign bodyVar_50 = {2'b01,repANF_71,repANF_72,x_56};
  
  assign altLet_51 = {2'b01,repANF_73,heap1_57,x_56};
  
  assign altLet_52 = {2'b01,repANF_74,heap1_57,a1_59};
  
  assign altLet_53 = {2'b01,repANF_75,heap1_57,x_56};
  
  assign x_54 = ds3_9[188:126];
  
  assign x_55 = ds3_9[188:126];
  
  assign x_56 = ds3_9[188:126];
  
  assign heap1_57 = ds_i1[92:63];
  
  assign repANF_58 = {repANF_77
                     ,base1_76
                     ,30'd0};
  
  assign a1_59 = ds2_4[125:63];
  
  assign repANF_60 = {repANF_78
                     ,base1_76
                     ,30'd0};
  
  assign repANF_61 = {2'b01,y_92,126'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_62 = {repANF_79
                     ,base1_76
                     ,30'd0};
  
  assign repANF_63 = {repANF_87
                     ,repANF_80
                     ,dec_86};
  
  assign repANF_64 = {repANF_81
                     ,repANF_82
                     ,repANF_83};
  
  assign repANF_65 = {repANF_90
                     ,repANF_84
                     ,repANF_85};
  
  assign repANF_66 = {repANF_91
                     ,repANF_80
                     ,dec_86};
  
  assign repANF_67 = {2'b10,z_94,repANF_96,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_68 = {2'b01,z_94,126'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_69 = {2'b10,y_93,z_94,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_70 = {repANF_90
                     ,repANF_84
                     ,30'd1};
  
  assign repANF_71 = {repANF_87
                     ,repANF_80
                     ,30'd0};
  
  assign repANF_72 = repANF_88;
  
  assign repANF_73 = {repANF_89
                     ,repANF_80
                     ,30'd0};
  
  assign repANF_74 = {repANF_90
                     ,repANF_84
                     ,30'd2};
  
  assign repANF_75 = {repANF_91
                     ,repANF_80
                     ,30'd0};
  
  assign base1_76 = ds2_2[59:30];
  
  assign repANF_77 = {2'b01,b_95,126'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_78 = {2'b10,b_95,x_54,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_79 = {2'b11,b_95,x_55,y_92};
  
  assign repANF_80 = base1_76 - 30'd1;
  
  assign repANF_81 = {2'b11,z_94,a1_59,b_95};
  
  assign repANF_82 = repANF_80 - 30'd1;
  
  assign repANF_83 = dec_86 - 30'd1;
  
  assign repANF_84 = base1_76 + 30'd1;
  
  assign repANF_85 = ds4_11 + 30'd1;
  
  assign dec_86 = ds4_11 - 30'd1;
  
  assign repANF_87 = {2'b11,z_94,repANF_96,ski_10};
  
  assign repANF_88 = a1_97 - 30'd1;
  
  assign repANF_89 = {2'b10,z_94,ski_10,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_90 = {2'b11,b_95,x_56,y_93};
  
  assign repANF_91 = {2'b11,y_93,z_94,ski_10};
  
  assign y_92 = ds3_9[125:63];
  
  assign y_93 = ds3_9[125:63];
  
  assign z_94 = ds3_9[62:0];
  
  assign b_95 = ds2_4[62:0];
  
  assign repANF_96 = {3'b011,ds5_98,a1_97};
  
  assign a1_97 = ds5_98 - 30'd1;
  
  assign ds5_98 = heap1_57;
endmodule
