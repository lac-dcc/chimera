// Automatically generated Verilog-2001
module Hardware_unbinarize_14(w_i1
                             ,bodyVar_o);
  input [63:0] w_i1;
  output [62:0] bodyVar_o;
  wire [29:0] repANF_0;
  wire [29:0] repANF_1;
  wire [29:0] repANF_2;
  wire [29:0] repANF_3;
  wire [31:0] repANF_4;
  wire [31:0] repANF_5;
  wire [31:0] repANF_6;
  wire [62:0] altLet_7;
  wire [62:0] altLet_8;
  wire [3:0] a33_9;
  wire [29:0] tmp_10;
  wire [29:0] tmp_15;
  wire [31:0] tmp_20;
  wire [3:0] tmp_25;
  // slice begin
  wire [63:0] n_13;
  assign n_13 = w_i1;
  assign tmp_10 = n_13[(59) : (30)];
  // slice end
  
  assign repANF_0 = tmp_10;
  
  assign repANF_1 = repANF_0;
  
  // slice begin
  wire [63:0] n_18;
  assign n_18 = w_i1;
  assign tmp_15 = n_18[(29) : (0)];
  // slice end
  
  assign repANF_2 = tmp_15;
  
  assign repANF_3 = repANF_2;
  
  // slice begin
  wire [63:0] n_23;
  assign n_23 = w_i1;
  assign tmp_20 = n_23[(31) : (0)];
  // slice end
  
  assign repANF_4 = tmp_20;
  
  assign repANF_5 = repANF_4;
  
  assign repANF_6 = repANF_5;
  
  assign altLet_7 = {3'b011,repANF_1,repANF_3};
  
  assign altLet_8 = {3'b100,repANF_6,28'b0000000000000000000000000000};
  
  // slice begin
  wire [63:0] n_28;
  assign n_28 = w_i1;
  assign tmp_25 = n_28[(63) : (60)];
  // slice end
  
  assign a33_9 = tmp_25;
  
  reg [62:0] bodyVar_o_reg;
  always @(*) begin
    case(a33_9)
      4'b0000 : bodyVar_o_reg = {3'b000,60'b000000000000000000000000000000000000000000000000000000000000};
      4'b0001 : bodyVar_o_reg = {3'b001,60'b000000000000000000000000000000000000000000000000000000000000};
      4'b0010 : bodyVar_o_reg = {3'b010,60'b000000000000000000000000000000000000000000000000000000000000};
      4'b0011 : bodyVar_o_reg = altLet_7;
      4'b0100 : bodyVar_o_reg = altLet_8;
      default : bodyVar_o_reg = {63 {1'bx}};
    endcase
  end
  assign bodyVar_o = bodyVar_o_reg;
endmodule
