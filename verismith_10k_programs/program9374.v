module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (($unsigned((|wire2)) << ($signed((wire1 ?
                         (8'hbd) : wire2)) > (~&wire0[(2'h3):(1'h0)]))) ?
                     $signed($unsigned(wire3[(1'h0):(1'h0)])) : $unsigned($signed(wire3)));
  assign wire5 = wire3[(3'h5):(1'h0)];
  assign wire6 = {(($signed((wire0 - wire1)) ?
                             ((wire0 > wire2) | {(8'hb3),
                                 wire5}) : wire0[(3'h6):(1'h1)]) ?
                         (!($unsigned(wire5) ?
                             {wire2} : $signed((8'h9c)))) : $unsigned(wire4[(4'h9):(2'h3)])),
                     $unsigned(wire0[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg7 <= wire1;
    end
  always
    @(posedge clk) begin
      reg8 <= $signed(wire5[(1'h1):(1'h0)]);
    end
  assign wire9 = wire4;
  assign wire10 = $signed((({(wire3 ? (8'hb6) : wire1), $signed(reg7)} ?
                      (wire3 ? {wire3, wire4} : wire2) : $signed({wire0,
                          wire3})) == ((^((8'haf) ~^ wire5)) ?
                      (wire9[(1'h1):(1'h0)] ?
                          reg7 : (wire1 ? reg7 : wire9)) : wire2)));
  assign wire11 = (8'h9f);
  assign wire12 = reg7[(3'h7):(3'h5)];
  assign wire13 = ($signed($unsigned($unsigned(wire1[(4'h8):(2'h2)]))) ?
                      ((8'hbf) | wire4) : wire10[(4'hf):(4'h8)]);
  assign wire14 = (~wire6);
endmodule
