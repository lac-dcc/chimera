module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = wire3[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg6 <= $signed($signed(wire3[(4'h9):(3'h7)]));
    end
  assign wire7 = wire2[(2'h3):(1'h0)];
  assign wire8 = (^~(&(+wire5[(2'h3):(2'h3)])));
  assign wire9 = (($unsigned(($unsigned(reg6) && (^~(8'hb1)))) ?
                     $unsigned(wire7[(4'hb):(1'h0)]) : (wire8[(4'hc):(4'ha)] * wire0[(1'h0):(1'h0)])) && $unsigned((|(|(wire0 == wire4)))));
  assign wire10 = wire0;
endmodule
