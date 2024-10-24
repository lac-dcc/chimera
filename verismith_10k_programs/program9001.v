module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire5, reg8, reg7, reg6, (1'h0)};
  assign wire5 = ({$signed(((wire4 ?
                         wire1 : wire0) - (^~wire2)))} || ((($signed(wire2) > {wire3,
                         wire2}) <= (8'h9d)) ?
                     (wire1 + wire0) : $unsigned(wire4)));
  always
    @(posedge clk) begin
      reg6 <= ($signed(({(wire4 ? wire2 : wire0), $signed(wire2)} ?
          wire4 : wire0[(1'h0):(1'h0)])) + {wire0[(4'h8):(3'h6)],
          wire3[(2'h3):(2'h2)]});
      reg7 <= wire3;
      reg8 <= (+(wire1[(1'h1):(1'h1)] ? $unsigned({{wire4}}) : (&wire3)));
    end
  assign wire9 = $unsigned(reg8);
  assign wire10 = $unsigned(wire2[(1'h0):(1'h0)]);
endmodule
