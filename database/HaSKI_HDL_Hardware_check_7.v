// Automatically generated Verilog-2001
module Hardware_check_7(ww_i1
                       ,ww1_i2
                       ,ww2_i3
                       ,ww3_i4
                       ,topLet_o);
  input [64:0] ww_i1;
  input [64:0] ww1_i2;
  input [94:0] ww2_i3;
  input [94:0] ww3_i4;
  output [128:0] topLet_o;
  wire [128:0] altLet_0;
  wire [128:0] altLet_1;
  wire [128:0] altLet_2;
  wire [128:0] altLet_3;
  wire [128:0] altLet_4;
  wire [128:0] altLet_5;
  wire [127:0] repANF_6;
  wire [127:0] repANF_7;
  wire [127:0] repANF_8;
  wire [127:0] repANF_9;
  wire [62:0] v2_10;
  wire [62:0] v1_11;
  reg [128:0] altLet_0_reg;
  always @(*) begin
    case(ww3_i4[94:93])
      2'b01 : altLet_0_reg = {1'b0,128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
      default : altLet_0_reg = altLet_1;
    endcase
  end
  assign altLet_0 = altLet_0_reg;
  
  reg [128:0] altLet_1_reg;
  always @(*) begin
    case(ww_i1[64:63])
      2'b00 : altLet_1_reg = altLet_2;
      2'b01 : altLet_1_reg = {1'b0,128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
      default : altLet_1_reg = altLet_3;
    endcase
  end
  assign altLet_1 = altLet_1_reg;
  
  reg [128:0] altLet_2_reg;
  always @(*) begin
    case(ww1_i2[64:63])
      2'b00 : altLet_2_reg = {1'b1,{2'b00,126'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}};
      default : altLet_2_reg = {1'b0,128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
    endcase
  end
  assign altLet_2 = altLet_2_reg;
  
  reg [128:0] altLet_3_reg;
  always @(*) begin
    case(ww1_i2[64:63])
      2'b00 : altLet_3_reg = altLet_4;
      2'b01 : altLet_3_reg = {1'b0,128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
      default : altLet_3_reg = altLet_5;
    endcase
  end
  assign altLet_3 = altLet_3_reg;
  
  assign altLet_4 = {1'b1,repANF_6};
  
  assign altLet_5 = {1'b1,repANF_7};
  
  assign repANF_6 = repANF_8;
  
  assign repANF_7 = repANF_9;
  
  assign repANF_8 = {2'b01,v1_11,63'b000000000000000000000000000000000000000000000000000000000000000};
  
  assign repANF_9 = {2'b10,v1_11,v2_10};
  
  assign v2_10 = ww1_i2[62:0];
  
  assign v1_11 = ww_i1[62:0];
  
  reg [128:0] topLet_o_reg;
  always @(*) begin
    case(ww2_i3[94:93])
      2'b01 : topLet_o_reg = {1'b0,128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000};
      default : topLet_o_reg = altLet_0;
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
