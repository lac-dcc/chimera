// Automatically generated Verilog-2001
module SevenSeg_anode_1(ds1_i1
                       ,topLet_o);
  input [1:0] ds1_i1;
  output [3:0] topLet_o;
  reg [3:0] topLet_o_reg;
  always @(*) begin
    case(ds1_i1)
      2'd0 : topLet_o_reg = 4'b1110;
      2'd1 : topLet_o_reg = 4'b1101;
      2'd2 : topLet_o_reg = 4'b1011;
      2'd3 : topLet_o_reg = 4'b0111;
      default : topLet_o_reg = {4 {1'bx}};
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
