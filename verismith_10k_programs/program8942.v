module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg12,
                 (1'h0)};
  assign wire5 = (8'hb6);
  assign wire6 = (~wire5[(2'h2):(1'h0)]);
  assign wire7 = wire6;
  assign wire8 = $signed((wire2[(2'h2):(1'h0)] * $unsigned(wire7)));
  assign wire9 = wire0[(1'h1):(1'h1)];
  assign wire10 = (wire4 & (~($signed((~|wire6)) ?
                      wire8 : {wire3[(5'h13):(4'ha)]})));
  assign wire11 = wire3;
  always
    @(posedge clk) begin
      reg12 <= {(wire4[(5'h10):(4'h9)] < (($unsigned(wire2) ?
                  wire2[(2'h2):(1'h0)] : {wire9}) ?
              wire1 : (^$unsigned(wire10)))),
          ($unsigned($unsigned(wire4[(3'h7):(3'h6)])) ?
              $unsigned(wire5[(1'h0):(1'h0)]) : wire3[(1'h0):(1'h0)])};
    end
  assign wire13 = {((wire2[(2'h2):(1'h0)] ?
                          ((!(7'h41)) || (wire6 ? reg12 : (7'h42))) : ({(8'hb7),
                              wire7} >>> $unsigned(wire8))) >= $unsigned(((wire5 >> wire0) != wire6)))};
  assign wire14 = (&$signed($unsigned(wire7[(3'h7):(1'h0)])));
  assign wire15 = ((wire2[(1'h0):(1'h0)] ?
                          $signed({(wire6 ? wire13 : wire7),
                              $signed(wire6)}) : $signed((!$signed(wire10)))) ?
                      $signed({wire9[(3'h5):(1'h0)]}) : $signed($signed((wire14 && $signed(wire1)))));
endmodule
