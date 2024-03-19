// Automatically generated Verilog-2001
module Hardware_initiate_9(ww_i1
                          ,ww1_i2
                          ,bodyVar_o);
  input [61:0] ww_i1;
  input [187:0] ww1_i2;
  output [319:0] bodyVar_o;
  wire [64:0] repANF_0;
  wire [64:0] repANF_1;
  wire [94:0] repANF_2;
  wire [94:0] repANF_3;
  wire [129:0] ds1_4;
  wire [189:0] ds_5;
  wire [64:0] r1_6;
  wire [64:0] r1_7;
  wire [94:0] w1_8;
  wire [94:0] w1_9;
  wire [129:0] altLet_10;
  wire [129:0] altLet_11;
  wire [189:0] altLet_12;
  wire [189:0] altLet_13;
  wire [129:0] altLet_14;
  wire [129:0] altLet_15;
  wire [29:0] ds2_16;
  wire [29:0] ds2_17;
  wire [189:0] altLet_18;
  wire [189:0] altLet_19;
  wire [92:0] ds1_20;
  wire [92:0] ds1_21;
  wire [64:0] repANF_22;
  wire [129:0] altLet_23;
  wire [29:0] ds3_24;
  wire [94:0] repANF_25;
  wire [189:0] altLet_26;
  wire [92:0] ds2_27;
  wire [29:0] pa_28;
  wire [64:0] repANF_29;
  wire [64:0] repANF_30;
  wire [62:0] va_31;
  wire [29:0] pa_32;
  wire [94:0] repANF_33;
  wire [94:0] repANF_34;
  wire [29:0] pb_35;
  wire [29:0] pa_36;
  wire [62:0] vb_37;
  wire [29:0] pb_38;
  wire [62:0] va_39;
  wire [29:0] pa_40;
  assign bodyVar_o = {repANF_0
                     ,repANF_1
                     ,repANF_2
                     ,repANF_3};
  
  assign repANF_0 = r1_6;
  
  assign repANF_1 = r1_7;
  
  assign repANF_2 = w1_8;
  
  assign repANF_3 = w1_9;
  
  reg [129:0] ds1_4_reg;
  always @(*) begin
    case(ww_i1[61:60])
      2'b00 : ds1_4_reg = {{2'b00,63'b000000000000000000000000000000000000000000000000000000000000000}
                          ,{2'b00,63'b000000000000000000000000000000000000000000000000000000000000000}};
      2'b01 : ds1_4_reg = altLet_10;
      default : ds1_4_reg = altLet_11;
    endcase
  end
  assign ds1_4 = ds1_4_reg;
  
  reg [189:0] ds_5_reg;
  always @(*) begin
    case(ww1_i2[187:186])
      2'b00 : ds_5_reg = {{2'b00,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                         ,{2'b00,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      2'b01 : ds_5_reg = altLet_12;
      default : ds_5_reg = altLet_13;
    endcase
  end
  assign ds_5 = ds_5_reg;
  
  assign r1_6 = ds1_4[129:65];
  
  assign r1_7 = ds1_4[64:0];
  
  assign w1_8 = ds_5[189:95];
  
  assign w1_9 = ds_5[94:0];
  
  assign altLet_10 = altLet_14;
  
  assign altLet_11 = altLet_15;
  
  assign altLet_12 = altLet_18;
  
  assign altLet_13 = altLet_19;
  
  assign altLet_14 = {repANF_22
                     ,{2'b00,63'b000000000000000000000000000000000000000000000000000000000000000}};
  
  assign altLet_15 = altLet_23;
  
  assign ds2_16 = ww_i1[59:30];
  
  assign ds2_17 = ww_i1[59:30];
  
  assign altLet_18 = {repANF_25
                     ,{2'b00,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
  
  assign altLet_19 = altLet_26;
  
  assign ds1_20 = ww1_i2[185:93];
  
  assign ds1_21 = ww1_i2[185:93];
  
  assign repANF_22 = {2'b01,pa_28,33'b000000000000000000000000000000000};
  
  assign altLet_23 = {repANF_29
                     ,repANF_30};
  
  assign ds3_24 = ww_i1[29:0];
  
  assign repANF_25 = {2'b01,pa_32,va_31};
  
  assign altLet_26 = {repANF_33
                     ,repANF_34};
  
  assign ds2_27 = ww1_i2[92:0];
  
  assign pa_28 = ds2_16;
  
  assign repANF_29 = {2'b01,pa_36,33'b000000000000000000000000000000000};
  
  assign repANF_30 = {2'b01,pb_35,33'b000000000000000000000000000000000};
  
  assign va_31 = ds1_20[92:30];
  
  assign pa_32 = ds1_20[29:0];
  
  assign repANF_33 = {2'b01,pa_40,va_39};
  
  assign repANF_34 = {2'b01,pb_38,vb_37};
  
  assign pb_35 = ds3_24;
  
  assign pa_36 = ds2_17;
  
  assign vb_37 = ds2_27[92:30];
  
  assign pb_38 = ds2_27[29:0];
  
  assign va_39 = ds1_21[92:30];
  
  assign pa_40 = ds1_21[29:0];
endmodule
