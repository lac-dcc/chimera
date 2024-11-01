module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire26;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire5,
                 wire6,
                 wire26,
                 (1'h0)};
  assign wire5 = wire4[(3'h7):(3'h6)];
  assign wire6 = wire2;
  module7 #() modinst27 (wire26, clk, wire6, wire1, wire2, wire4, wire5);
  assign wire28 = (~&wire3[(3'h7):(3'h4)]);
  assign wire29 = (+wire3);
  assign wire30 = wire26[(3'h5):(2'h3)];
  assign wire31 = $signed(wire26);
  assign wire32 = $unsigned(wire31[(2'h3):(2'h2)]);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire13 = (wire11[(3'h4):(3'h4)] >= (~$unsigned({((8'ha5) | wire11),
                      $unsigned(wire9)})));
  assign wire14 = (|(((wire10 + (wire12 ?
                          (8'hbc) : (7'h42))) & ($signed((8'h9d)) ?
                          wire11 : $signed(wire11))) ?
                      ((~&(7'h40)) << (&$signed((8'h9f)))) : (({wire10, wire8} ?
                              {(8'ha8), (8'ha1)} : (8'ha9)) ?
                          $unsigned((&wire12)) : (8'ha8))));
  assign wire15 = wire13[(3'h6):(3'h6)];
  assign wire16 = (wire8 ?
                      ($unsigned(wire10[(3'h4):(3'h4)]) ?
                          wire10[(2'h2):(1'h1)] : wire13) : wire15);
  assign wire17 = wire8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg18 <= wire14[(1'h0):(1'h0)];
      reg19 <= (($unsigned($unsigned($signed(wire11))) ?
              (((wire10 ~^ reg18) && (wire9 * (8'haa))) ?
                  ((wire13 ^~ wire15) > (-wire8)) : $signed($unsigned(wire12))) : reg18) ?
          $unsigned((wire15 ?
              $unsigned(wire10) : $signed($signed(wire13)))) : $unsigned(wire15));
      reg20 <= (7'h42);
      reg21 <= $signed((&{$signed($unsigned(wire13))}));
      reg22 <= $signed((($unsigned($signed(reg19)) ~^ wire8) == wire15));
    end
  assign wire23 = ((|(($unsigned(wire14) ?
                      wire14 : reg18) > (((8'hbd) ~^ wire9) && (|wire10)))) | wire14);
  assign wire24 = $unsigned(wire11[(2'h3):(2'h2)]);
  assign wire25 = wire8[(1'h1):(1'h0)];
endmodule
