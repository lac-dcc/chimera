module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed(({(8'ha4)} ?
                     (-wire0) : (~|wire3)))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned($signed(wire0[(4'h8):(1'h0)]));
      reg7 <= (wire5[(4'ha):(3'h7)] ?
          (-wire4) : $unsigned(wire4[(3'h4):(1'h1)]));
      reg8 <= $signed($signed({{reg7[(4'ha):(4'h9)]},
          $unsigned((reg6 < wire4))}));
    end
  assign wire9 = reg6[(2'h3):(2'h2)];
  assign wire10 = $unsigned($signed($signed($signed($signed(wire9)))));
  assign wire11 = wire1[(2'h2):(1'h1)];
  assign wire12 = reg7;
  assign wire13 = wire10[(3'h7):(3'h6)];
  assign wire14 = $signed((^{(wire13[(2'h2):(2'h2)] ? (7'h42) : wire11),
                      wire9[(1'h1):(1'h0)]}));
  assign wire15 = $unsigned($signed($signed(((&wire13) ?
                      $unsigned(reg6) : ((8'hb4) ? wire10 : reg7)))));
endmodule
