// Automatically generated Verilog-2001
module Hardware_service_10(ww_i1
                          ,ww1_i2
                          ,ww2_i3
                          ,ww3_i4
                          ,w_i5
                          ,topLet_o);
  input [64:0] ww_i1;
  input [64:0] ww1_i2;
  input [94:0] ww2_i3;
  input [94:0] ww3_i4;
  input [64:0] w_i5;
  output [319:0] topLet_o;
  wire [319:0] altLet_0;
  wire [62:0] ski_1;
  wire [319:0] altLet_2;
  wire [319:0] altLet_3;
  wire [319:0] bodyVar_4;
  wire [319:0] altLet_5;
  wire [64:0] repANF_6;
  wire [319:0] altLet_7;
  wire [319:0] altLet_8;
  wire [319:0] altLet_9;
  wire [319:0] altLet_10;
  wire [319:0] altLet_11;
  wire [319:0] bodyVar_12;
  reg [319:0] topLet_o_reg;
  always @(*) begin
    case(w_i5[64:63])
      2'b00 : topLet_o_reg = altLet_11;
      2'b01 : topLet_o_reg = bodyVar_12;
      default : topLet_o_reg = altLet_10;
    endcase
  end
  assign topLet_o = topLet_o_reg;
  
  assign altLet_0 = {ww_i1
                    ,ww1_i2
                    ,{2'b10,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                    ,{2'b10,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
  
  assign ski_1 = w_i5[62:0];
  
  reg [319:0] altLet_2_reg;
  always @(*) begin
    case(ww3_i4[94:93])
      2'b01 : altLet_2_reg = altLet_0;
      default : altLet_2_reg = {320 {1'bx}};
    endcase
  end
  assign altLet_2 = altLet_2_reg;
  
  assign altLet_3 = {ww_i1
                    ,ww1_i2
                    ,{2'b10,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                    ,ww3_i4};
  
  reg [319:0] bodyVar_4_reg;
  always @(*) begin
    case(ww2_i3[94:93])
      2'b00 : bodyVar_4_reg = {320 {1'bx}};
      2'b01 : bodyVar_4_reg = altLet_3;
      default : bodyVar_4_reg = altLet_2;
    endcase
  end
  assign bodyVar_4 = bodyVar_4_reg;
  
  assign altLet_5 = {ww_i1
                    ,repANF_6
                    ,ww2_i3
                    ,ww3_i4};
  
  assign repANF_6 = {2'b10,ski_1};
  
  reg [319:0] altLet_7_reg;
  always @(*) begin
    case(ww1_i2[64:63])
      2'b01 : altLet_7_reg = {320 {1'bx}};
      default : altLet_7_reg = bodyVar_4;
    endcase
  end
  assign altLet_7 = altLet_7_reg;
  
  reg [319:0] altLet_8_reg;
  always @(*) begin
    case(ww1_i2[64:63])
      2'b01 : altLet_8_reg = altLet_5;
      default : altLet_8_reg = {320 {1'bx}};
    endcase
  end
  assign altLet_8 = altLet_8_reg;
  
  assign altLet_9 = {repANF_6
                    ,ww1_i2
                    ,ww2_i3
                    ,ww3_i4};
  
  reg [319:0] altLet_10_reg;
  always @(*) begin
    case(ww_i1[64:63])
      2'b01 : altLet_10_reg = {320 {1'bx}};
      default : altLet_10_reg = altLet_7;
    endcase
  end
  assign altLet_10 = altLet_10_reg;
  
  assign altLet_11 = {ww_i1
                     ,ww1_i2
                     ,ww2_i3
                     ,ww3_i4};
  
  reg [319:0] bodyVar_12_reg;
  always @(*) begin
    case(ww_i1[64:63])
      2'b00 : bodyVar_12_reg = {320 {1'bx}};
      2'b01 : bodyVar_12_reg = altLet_9;
      default : bodyVar_12_reg = altLet_8;
    endcase
  end
  assign bodyVar_12 = bodyVar_12_reg;
endmodule
