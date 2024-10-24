module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire1[(5'h10):(2'h2)]));
  assign wire5 = $unsigned(wire2[(4'hb):(1'h0)]);
  assign wire6 = $signed($unsigned((|$unsigned((wire2 ? wire3 : wire5)))));
  assign wire7 = (-$unsigned(((((8'ha0) ^~ wire3) - (wire5 <<< wire2)) ?
                     $signed((wire3 ?
                         wire3 : (8'ha8))) : (+wire3[(4'ha):(1'h0)]))));
  assign wire8 = {{(!($unsigned(wire3) <<< {(8'ha1), wire6})),
                         {(~|$unsigned((7'h41))), $unsigned((~&wire4))}}};
  assign wire9 = $signed(((wire1[(4'h8):(4'h8)] ?
                     $signed((wire3 && wire6)) : (wire4[(4'h8):(1'h0)] ?
                         $unsigned(wire4) : $signed(wire5))) << ((8'ha8) ?
                     {(~^wire0), wire3[(3'h6):(3'h6)]} : (^~(wire8 + wire4)))));
  assign wire10 = wire3;
  assign wire11 = wire7[(3'h7):(1'h1)];
  assign wire12 = wire3[(4'ha):(3'h7)];
  assign wire13 = ((((wire11 * $signed(wire5)) <<< wire4[(3'h5):(3'h4)]) != wire3[(4'ha):(3'h5)]) ?
                      (&wire8[(1'h1):(1'h1)]) : wire0[(1'h0):(1'h0)]);
endmodule
