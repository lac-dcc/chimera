// Automatically generated Verilog-2001
module Hardware_ram1_12(ds1_i1
                       ,topLet_o);
  input [0:0] ds1_i1;
  output [0:0] topLet_o;
  reg [0:0] topLet_o_reg;
  always @(*) begin
    case(ds1_i1)
      1'b1 : topLet_o_reg = 1'b1;
      1'b0 : topLet_o_reg = 1'b0;
      default : topLet_o_reg = {1 {1'bx}};
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
