// Automatically generated Verilog-2001
module Hardware_binarize_13(ski_i1
                           ,topLet_o);
  input [62:0] ski_i1;
  output [63:0] topLet_o;
  wire [29:0] repANF_0;
  wire [33:0] repANF_1;
  wire [29:0] repANF_2;
  wire [31:0] repANF_3;
  wire [63:0] altLet_4;
  wire [31:0] o1_5;
  wire [63:0] altLet_6;
  wire [29:0] a33_7;
  wire [29:0] b_8;
  wire [63:0] altLet_9;
  wire [31:0] o_10;
  assign repANF_0 = a33_7;
  
  assign repANF_1 = {4'b0011,repANF_0};
  
  assign repANF_2 = b_8;
  
  assign repANF_3 = o1_5;
  
  assign altLet_4 = {({4'b0100,28'b0000000000000000000000000000}),repANF_3};
  
  assign o1_5 = o_10;
  
  assign altLet_6 = {repANF_1,repANF_2};
  
  assign a33_7 = ski_i1[59:30];
  
  assign b_8 = ski_i1[29:0];
  
  assign altLet_9 = altLet_4;
  
  assign o_10 = ski_i1[59:28];
  
  reg [63:0] topLet_o_reg;
  always @(*) begin
    case(ski_i1[62:60])
      3'b000 : topLet_o_reg = {4'b0000,60'b000000000000000000000000000000000000000000000000000000000000};
      3'b001 : topLet_o_reg = {4'b0001,60'b000000000000000000000000000000000000000000000000000000000000};
      3'b010 : topLet_o_reg = {4'b0010,60'b000000000000000000000000000000000000000000000000000000000000};
      3'b011 : topLet_o_reg = altLet_6;
      default : topLet_o_reg = altLet_9;
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
