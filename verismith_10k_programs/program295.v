module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((~&{wire1[(2'h2):(1'h1)]}) ?
                     $signed({(^~{wire3})}) : wire3[(4'ha):(2'h2)]);
  assign wire6 = (&$signed((((wire3 ? wire5 : wire3) <<< $signed((8'h9f))) ?
                     $unsigned($unsigned(wire5)) : $unsigned({wire3}))));
  assign wire7 = ((!$signed(wire5[(1'h1):(1'h1)])) >> wire2);
  assign wire8 = wire1;
  assign wire9 = {$signed(wire1[(4'he):(3'h6)]),
                     $unsigned((($signed((8'hab)) == $signed((8'ha5))) ?
                         (wire7 ? (~|wire6) : $signed(wire2)) : (8'h9d)))};
  assign wire10 = $unsigned($signed(($unsigned((wire4 > wire3)) != (wire3 ?
                      wire1 : (wire2 <= wire5)))));
endmodule
