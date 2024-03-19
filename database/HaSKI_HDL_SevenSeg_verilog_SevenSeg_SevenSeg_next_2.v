// Automatically generated Verilog-2001
module SevenSeg_next_2(ds1_i1
                      ,topLet_o);
  input [1:0] ds1_i1;
  output [1:0] topLet_o;
  wire [1:0] altLet_0;
  assign altLet_0 = ds1_i1 + 2'd1;
  
  reg [1:0] topLet_o_reg;
  always @(*) begin
    case(ds1_i1)
      2'd3 : topLet_o_reg = 2'd0;
      default : topLet_o_reg = altLet_0;
    endcase
  end
  assign topLet_o = topLet_o_reg;
endmodule
