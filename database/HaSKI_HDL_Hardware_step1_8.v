// Automatically generated Verilog-2001
module Hardware_step1_8(ds_i1
                       ,topLet_o);
  input [345:0] ds_i1;
  output [249:0] topLet_o;
  wire [249:0] bodyVar_0;
  wire [250:0] ds1_1;
  wire [249:0] altLet_2;
  wire [249:0] altLet_3;
  wire [249:0] altLet_4;
  wire [249:0] altLet_5;
  wire [190:0] ds3_6;
  wire [249:0] altLet_7;
  wire [249:0] altLet_8;
  wire [249:0] altLet_9;
  wire [249:0] altLet_10;
  wire [249:0] altLet_11;
  wire [249:0] altLet_12;
  wire [29:0] ds5_13;
  wire [249:0] altLet_14;
  wire [249:0] altLet_15;
  wire [249:0] altLet_16;
  wire [249:0] altLet_17;
  wire [249:0] altLet_18;
  wire [249:0] altLet_19;
  wire [62:0] current1_20;
  wire [61:0] bodyVar_21;
  wire [187:0] repANF_22;
  wire [61:0] repANF_23;
  wire [187:0] repANF_24;
  wire [61:0] repANF_25;
  wire [29:0] repANF_26;
  wire [92:0] repANF_27;
  wire [92:0] repANF_28;
  wire [92:0] repANF_29;
  wire [29:0] repANF_30;
  wire [29:0] repANF_31;
  wire [29:0] repANF_32;
  wire [29:0] ap_33;
  wire [29:0] bp_34;
  wire [29:0] repANF_35;
  wire [29:0] repANF_36;
  wire [62:0] y_37;
  wire [62:0] z_38;
  wire [29:0] ds4_39;
  wire [29:0] altLet_40;
  wire [29:0] ds2_41;
  wire [29:0] ds5_42;
  reg [249:0] bodyVar_0_reg;
  always @(*) begin
    case(ds3_6[190:189])
      2'b00 : bodyVar_0_reg = altLet_2;
      2'b01 : bodyVar_0_reg = altLet_3;
      2'b10 : bodyVar_0_reg = altLet_4;
      default : bodyVar_0_reg = altLet_5;
    endcase
  end
  assign bodyVar_0 = bodyVar_0_reg;
  
  assign ds1_1 = ds_i1[343:93];
  
  reg [249:0] altLet_2_reg;
  always @(*) begin
    case(ds5_13)
      30'd0 : altLet_2_reg = altLet_7;
      default : altLet_2_reg = {250 {1'bx}};
    endcase
  end
  assign altLet_2 = altLet_2_reg;
  
  reg [249:0] altLet_3_reg;
  always @(*) begin
    case(ds5_13)
      30'd0 : altLet_3_reg = altLet_8;
      default : altLet_3_reg = {250 {1'bx}};
    endcase
  end
  assign altLet_3 = altLet_3_reg;
  
  reg [249:0] altLet_4_reg;
  always @(*) begin
    case(ds5_13)
      30'd0 : altLet_4_reg = altLet_9;
      default : altLet_4_reg = {250 {1'bx}};
    endcase
  end
  assign altLet_4 = altLet_4_reg;
  
  reg [249:0] altLet_5_reg;
  always @(*) begin
    case(ds5_13)
      30'd0 : altLet_5_reg = altLet_11;
      30'd1 : altLet_5_reg = altLet_12;
      default : altLet_5_reg = altLet_10;
    endcase
  end
  assign altLet_5 = altLet_5_reg;
  
  assign ds3_6 = ds1_1[250:60];
  
  reg [249:0] altLet_7_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_7_reg = {250 {1'bx}};
      3'b001 : altLet_7_reg = {250 {1'bx}};
      3'b010 : altLet_7_reg = {250 {1'bx}};
      3'b011 : altLet_7_reg = altLet_14;
      default : altLet_7_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
    endcase
  end
  assign altLet_7 = altLet_7_reg;
  
  reg [249:0] altLet_8_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_8_reg = {250 {1'bx}};
      3'b001 : altLet_8_reg = {250 {1'bx}};
      3'b010 : altLet_8_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                              ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      3'b011 : altLet_8_reg = altLet_14;
      default : altLet_8_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
    endcase
  end
  assign altLet_8 = altLet_8_reg;
  
  reg [249:0] altLet_9_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_9_reg = {250 {1'bx}};
      3'b001 : altLet_9_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                              ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      3'b010 : altLet_9_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                              ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      3'b011 : altLet_9_reg = altLet_14;
      default : altLet_9_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
    endcase
  end
  assign altLet_9 = altLet_9_reg;
  
  reg [249:0] altLet_10_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_10_reg = altLet_17;
      3'b001 : altLet_10_reg = altLet_15;
      3'b010 : altLet_10_reg = altLet_19;
      3'b011 : altLet_10_reg = altLet_18;
      default : altLet_10_reg = altLet_19;
    endcase
  end
  assign altLet_10 = altLet_10_reg;
  
  reg [249:0] altLet_11_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_11_reg = altLet_16;
      3'b001 : altLet_11_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      3'b010 : altLet_11_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      3'b011 : altLet_11_reg = altLet_18;
      default : altLet_11_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                                ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
    endcase
  end
  assign altLet_11 = altLet_11_reg;
  
  reg [249:0] altLet_12_reg;
  always @(*) begin
    case(current1_20[62:60])
      3'b000 : altLet_12_reg = altLet_17;
      3'b001 : altLet_12_reg = altLet_19;
      3'b010 : altLet_12_reg = altLet_19;
      3'b011 : altLet_12_reg = altLet_18;
      default : altLet_12_reg = altLet_19;
    endcase
  end
  assign altLet_12 = altLet_12_reg;
  
  assign ds5_13 = ds1_1[29:0];
  
  assign altLet_14 = {repANF_23
                     ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
  
  assign altLet_15 = {bodyVar_21
                     ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
  
  assign altLet_16 = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                     ,repANF_22};
  
  assign altLet_17 = {repANF_25
                     ,repANF_22};
  
  assign altLet_18 = {repANF_23
                     ,repANF_24};
  
  assign altLet_19 = {repANF_25
                     ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
  
  assign current1_20 = ds_i1[62:0];
  
  assign bodyVar_21 = {2'b10,repANF_32,repANF_26};
  
  assign repANF_22 = {2'b10,repANF_28,repANF_29};
  
  assign repANF_23 = {2'b10,repANF_30,repANF_31};
  
  assign repANF_24 = {2'b01,repANF_27,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_25 = {2'b01,repANF_32,30'b000000000000000000000000000000};
  
  assign repANF_26 = repANF_36;
  
  assign repANF_27 = {z_38
                     ,ds4_39};
  
  assign repANF_28 = {y_37
                     ,ds5_42};
  
  assign repANF_29 = {z_38
                     ,altLet_40};
  
  assign repANF_30 = ap_33;
  
  assign repANF_31 = bp_34;
  
  assign repANF_32 = repANF_35;
  
  assign ap_33 = current1_20[59:30];
  
  assign bp_34 = current1_20[29:0];
  
  assign repANF_35 = ds4_39 - 30'd1;
  
  assign repANF_36 = repANF_35 - 30'd1;
  
  assign y_37 = ds3_6[125:63];
  
  assign z_38 = ds3_6[62:0];
  
  assign ds4_39 = ds1_1[59:30];
  
  assign altLet_40 = ds5_42 - 30'd1;
  
  assign ds2_41 = ds_i1[92:63];
  
  assign ds5_42 = ds2_41;
  
  reg [249:0] topLet_o_reg;
  always @(*) begin
    case(ds_i1[345:344])
      2'b00 : topLet_o_reg = {{2'b01,30'd0,30'b000000000000000000000000000000}
                             ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      2'b01 : topLet_o_reg = bodyVar_0;
      default : topLet_o_reg = {{2'b00,60'b000000000000000000000000000000000000000000000000000000000000}
                               ,{2'b00,186'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
