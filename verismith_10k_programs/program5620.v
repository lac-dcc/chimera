module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire7, wire5, wire4, reg9, reg8, reg6, (1'h0)};
  assign wire4 = wire0[(3'h7):(3'h5)];
  assign wire5 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= wire3[(1'h0):(1'h0)];
    end
  assign wire7 = {(~|{wire4[(4'hd):(2'h3)]})};
  always
    @(posedge clk) begin
      reg8 <= $unsigned(($unsigned((~(~|wire7))) ?
          $unsigned(($unsigned(wire2) | wire0)) : (|(~&wire1))));
      reg9 <= wire2;
    end
endmodule
