module top
#(parameter param11 = (~(((((8'hbe) ? (8'hb1) : (8'ha0)) * (-(8'ha8))) && (|((8'haf) ? (8'hb8) : (7'h40)))) ? {(~|((8'hb7) != (8'hb6)))} : ((((7'h42) ^~ (8'hb0)) || ((8'hbd) >= (8'ha1))) ? (((8'haa) ? (8'hbe) : (8'ha2)) ? (-(8'hbc)) : ((8'ha1) ? (8'hb1) : (8'h9c))) : (8'hae)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((^wire2[(1'h0):(1'h0)]) >= {(7'h41)});
  assign wire5 = {$unsigned(({(8'hbd)} > (wire2 ?
                         wire0[(3'h5):(2'h3)] : wire2))),
                     ($signed(((^~wire2) ?
                             $signed((8'hb6)) : (wire0 ? wire1 : wire4))) ?
                         $unsigned($unsigned((wire2 ?
                             wire2 : wire2))) : $signed(wire0))};
  assign wire6 = ($signed(wire5) != $unsigned(wire4));
  assign wire7 = wire1;
  assign wire8 = ((!(!wire5)) ?
                     $signed((((^~wire1) ?
                             ((8'hb8) ^~ wire1) : (wire7 >>> wire0)) ?
                         $signed($unsigned(wire0)) : $signed({wire6,
                             wire0}))) : wire6);
  assign wire9 = (|wire7[(1'h1):(1'h0)]);
  assign wire10 = wire5[(1'h0):(1'h0)];
endmodule
