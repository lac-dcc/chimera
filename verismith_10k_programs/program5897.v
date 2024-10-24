module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed($unsigned($signed((^wire3))));
  assign wire6 = ((~&$unsigned(((&wire5) | wire0[(3'h7):(3'h6)]))) || ((^$signed(wire5)) ?
                     $signed(($unsigned(wire5) ?
                         (wire3 ?
                             (8'hbd) : wire0) : $signed(wire2))) : (($signed(wire1) ?
                         $signed(wire1) : wire0) || (((8'ha5) ?
                         wire1 : wire5) & $signed(wire2)))));
  assign wire7 = $unsigned({$unsigned($unsigned(wire1))});
  assign wire8 = wire7[(4'h9):(3'h6)];
  assign wire9 = (wire2 ?
                     {$unsigned((~wire8[(2'h2):(2'h2)])),
                         ((^~(wire2 < wire3)) < wire4[(5'h13):(3'h6)])} : $signed((^{wire4,
                         wire6[(1'h0):(1'h0)]})));
  assign wire10 = (wire7 ? wire8[(3'h4):(1'h0)] : (~&wire4));
  assign wire11 = (($signed(((8'ha2) ?
                          $signed(wire4) : wire2[(1'h0):(1'h0)])) < (($signed((8'hbb)) ^ wire4[(5'h15):(1'h0)]) < (-(|wire5)))) ?
                      $signed(($unsigned((~&wire8)) > (wire1[(4'hb):(1'h0)] ?
                          (&wire5) : {(8'hb6),
                              wire8}))) : $unsigned(wire6[(2'h3):(1'h0)]));
  assign wire12 = {$unsigned(wire1), wire3[(2'h2):(1'h1)]};
  assign wire13 = wire10;
endmodule
