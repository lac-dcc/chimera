module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, reg9, reg8, reg7, (1'h0)};
  assign wire5 = {$unsigned((wire0[(3'h5):(2'h3)] & wire2[(2'h3):(2'h3)])),
                     (+$unsigned($signed((wire2 ? wire3 : wire0))))};
  assign wire6 = (^$unsigned(wire1));
  always
    @(posedge clk) begin
      reg7 <= ($unsigned($signed({$unsigned(wire1),
          $unsigned(wire5)})) ~^ (!$unsigned(({wire3, wire0} ?
          $unsigned(wire3) : $unsigned(wire0)))));
    end
  always
    @(posedge clk) begin
      reg8 <= (~&reg7);
      reg9 <= wire1[(1'h0):(1'h0)];
    end
endmodule
