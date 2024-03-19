// Automatically generated Verilog-2001
module Hardware_step_4(ww_i1
                      ,ww1_i2
                      ,ww2_i3
                      ,w_i4
                      ,bodyVar_o);
  input [345:0] ww_i1;
  input [319:0] ww1_i2;
  input [0:0] ww2_i3;
  input [64:0] w_i4;
  output [794:0] bodyVar_o;
  wire [666:0] repANF_0;
  wire [794:0] altLet_1;
  wire [794:0] altLet_2;
  wire [794:0] failOut_3;
  assign repANF_0 = {ww_i1
                    ,ww1_i2
                    ,1'd1};
  
  assign altLet_1 = {repANF_0
                    ,{2'b10,93'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000}
                    ,{1'b0,32'b00000000000000000000000000000000}};
  
  reg [794:0] altLet_2_reg;
  always @(*) begin
    case(w_i4[64:63])
      2'b00 : altLet_2_reg = altLet_1;
      default : altLet_2_reg = failOut_3;
    endcase
  end
  assign altLet_2 = altLet_2_reg;
  
  Hardware_step_fail_5 Hardware_step_fail_5_failOut_3
  (.bodyVar_o (failOut_3)
  ,.pTS_i1 (ww1_i2)
  ,.pTS_i2 (w_i4)
  ,.pTS_i3 (ww_i1));
  
  reg [794:0] bodyVar_o_reg;
  always @(*) begin
    case(ww2_i3)
      1'b0 : bodyVar_o_reg = failOut_3;
      default : bodyVar_o_reg = altLet_2;
    endcase
  end
  assign bodyVar_o = bodyVar_o_reg;
endmodule
