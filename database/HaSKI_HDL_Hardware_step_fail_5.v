// Automatically generated Verilog-2001
module Hardware_step_fail_5(pTS_i1
                           ,pTS_i2
                           ,pTS_i3
                           ,bodyVar_o);
  input [319:0] pTS_i1;
  input [64:0] pTS_i2;
  input [345:0] pTS_i3;
  output [794:0] bodyVar_o;
  wire [666:0] repANF_0;
  wire [32:0] repANF_1;
  wire [94:0] action_2;
  wire [0:0] repANF_3;
  wire [32:0] altLet_4;
  wire [94:0] altLet_5;
  wire [319:0] pendingzmzm_6;
  wire [345:0] statezm_7;
  wire [128:0] result_8;
  wire [32:0] altLet_9;
  wire [94:0] altLet_10;
  wire [94:0] altLet_11;
  wire [64:0] ww4_12;
  wire [319:0] altLet_13;
  wire [345:0] altLet_14;
  wire [128:0] altLet_15;
  wire [319:0] pendingzm_16;
  wire [32:0] altLet_17;
  wire [62:0] ds3_18;
  wire [94:0] altLet_19;
  wire [94:0] altLet_20;
  wire [29:0] ptr_21;
  wire [64:0] ww5_22;
  wire [249:0] subjLet_23;
  wire [319:0] altLet_24;
  wire [127:0] result1_25;
  wire [64:0] ww4_26;
  wire [64:0] ww5_27;
  wire [94:0] ww6_28;
  wire [94:0] ww7_29;
  wire [319:0] altLet_30;
  wire [31:0] o_31;
  wire [94:0] altLet_32;
  wire [94:0] altLet_33;
  wire [29:0] ptr_34;
  wire [94:0] ww6_35;
  wire [61:0] ww4_36;
  wire [187:0] ww5_37;
  wire [64:0] ww4_38;
  wire [64:0] ww5_39;
  wire [94:0] ww6_40;
  wire [94:0] ww7_41;
  wire [94:0] altLet_42;
  wire [29:0] p_43;
  wire [62:0] x_44;
  wire [94:0] ww7_45;
  wire [29:0] p_46;
  wire [62:0] x_47;
  assign bodyVar_o = {repANF_0
                     ,action_2
                     ,repANF_1};
  
  assign repANF_0 = {statezm_7
                    ,pendingzmzm_6
                    ,repANF_3};
  
  reg [32:0] repANF_1_reg;
  always @(*) begin
    case(result_8[128:128])
      1'b0 : repANF_1_reg = {1'b0,32'b00000000000000000000000000000000};
      default : repANF_1_reg = altLet_4;
    endcase
  end
  assign repANF_1 = repANF_1_reg;
  
  assign action_2 = altLet_5;
  
  reg [0:0] repANF_3_reg;
  always @(*) begin
    case(action_2[94:93])
      2'b10 : repANF_3_reg = 1'd0;
      default : repANF_3_reg = 1'd1;
    endcase
  end
  assign repANF_3 = repANF_3_reg;
  
  reg [32:0] altLet_4_reg;
  always @(*) begin
    case(statezm_7[345:344])
      2'b01 : altLet_4_reg = altLet_9;
      default : altLet_4_reg = {1'b0,32'b00000000000000000000000000000000};
    endcase
  end
  assign altLet_4 = altLet_4_reg;
  
  reg [94:0] altLet_5_reg;
  always @(*) begin
    case(ww4_12[64:63])
      2'b01 : altLet_5_reg = altLet_11;
      default : altLet_5_reg = altLet_10;
    endcase
  end
  assign altLet_5 = altLet_5_reg;
  
  reg [319:0] pendingzmzm_6_reg;
  always @(*) begin
    case(result_8[128:128])
      1'b0 : pendingzmzm_6_reg = pendingzm_16;
      default : pendingzmzm_6_reg = altLet_13;
    endcase
  end
  assign pendingzmzm_6 = pendingzmzm_6_reg;
  
  reg [345:0] statezm_7_reg;
  always @(*) begin
    case(result_8[128:128])
      1'b0 : statezm_7_reg = pTS_i3;
      default : statezm_7_reg = altLet_14;
    endcase
  end
  assign statezm_7 = statezm_7_reg;
  
  assign result_8 = altLet_15;
  
  reg [32:0] altLet_9_reg;
  always @(*) begin
    case(ds3_18[62:60])
      3'b100 : altLet_9_reg = altLet_17;
      default : altLet_9_reg = {1'b0,32'b00000000000000000000000000000000};
    endcase
  end
  assign altLet_9 = altLet_9_reg;
  
  reg [94:0] altLet_10_reg;
  always @(*) begin
    case(ww5_22[64:63])
      2'b01 : altLet_10_reg = altLet_20;
      default : altLet_10_reg = altLet_19;
    endcase
  end
  assign altLet_10 = altLet_10_reg;
  
  assign altLet_11 = {2'b00,ptr_21,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign ww4_12 = pendingzmzm_6[319:255];
  
  assign altLet_13 = altLet_24;
  
  Hardware_step2_6 Hardware_step2_6_altLet_14
  (.bodyVar_o (altLet_14)
  ,.ds_i1 (pTS_i3)
  ,.ds1_i2 (result1_25));
  
  Hardware_check_7 Hardware_check_7_altLet_15
  (.topLet_o (altLet_15)
  ,.ww_i1 (ww4_26)
  ,.ww1_i2 (ww5_27)
  ,.ww2_i3 (ww6_28)
  ,.ww3_i4 (ww7_29));
  
  assign pendingzm_16 = altLet_30;
  
  assign altLet_17 = {1'b1,o_31};
  
  assign ds3_18 = statezm_7[62:0];
  
  reg [94:0] altLet_19_reg;
  always @(*) begin
    case(ww6_35[94:93])
      2'b01 : altLet_19_reg = altLet_33;
      default : altLet_19_reg = altLet_32;
    endcase
  end
  assign altLet_19 = altLet_19_reg;
  
  assign altLet_20 = {2'b00,ptr_34,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign ptr_21 = ww4_12[62:33];
  
  assign ww5_22 = pendingzmzm_6[254:190];
  
  Hardware_step1_8 Hardware_step1_8_subjLet_23
  (.topLet_o (subjLet_23)
  ,.ds_i1 (statezm_7));
  
  Hardware_initiate_9 Hardware_initiate_9_altLet_24
  (.bodyVar_o (altLet_24)
  ,.ww_i1 (ww4_36)
  ,.ww1_i2 (ww5_37));
  
  assign result1_25 = result_8[127:0];
  
  assign ww4_26 = pendingzm_16[319:255];
  
  assign ww5_27 = pendingzm_16[254:190];
  
  assign ww6_28 = pendingzm_16[189:95];
  
  assign ww7_29 = pendingzm_16[94:0];
  
  Hardware_service_10 Hardware_service_10_altLet_30
  (.topLet_o (altLet_30)
  ,.ww_i1 (ww4_38)
  ,.ww1_i2 (ww5_39)
  ,.ww2_i3 (ww6_40)
  ,.ww3_i4 (ww7_41)
  ,.w_i5 (pTS_i2));
  
  assign o_31 = ds3_18[59:28];
  
  reg [94:0] altLet_32_reg;
  always @(*) begin
    case(ww7_45[94:93])
      2'b01 : altLet_32_reg = altLet_42;
      default : altLet_32_reg = {2'b10,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
    endcase
  end
  assign altLet_32 = altLet_32_reg;
  
  assign altLet_33 = {2'b01,p_43,x_44};
  
  assign ptr_34 = ww5_22[62:33];
  
  assign ww6_35 = pendingzmzm_6[189:95];
  
  assign ww4_36 = subjLet_23[249:188];
  
  assign ww5_37 = subjLet_23[187:0];
  
  assign ww4_38 = pTS_i1[319:255];
  
  assign ww5_39 = pTS_i1[254:190];
  
  assign ww6_40 = pTS_i1[189:95];
  
  assign ww7_41 = pTS_i1[94:0];
  
  assign altLet_42 = {2'b01,p_46,x_47};
  
  assign p_43 = ww6_35[92:63];
  
  assign x_44 = ww6_35[62:0];
  
  assign ww7_45 = pendingzmzm_6[94:0];
  
  assign p_46 = ww7_45[92:63];
  
  assign x_47 = ww7_45[62:0];
endmodule
