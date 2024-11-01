module top
#(parameter param11 = ((&((((8'hb4) ? (8'hba) : (8'hb9)) ? (&(8'hb0)) : ((8'ha7) ? (8'hb7) : (8'haf))) >= {((8'hb1) ? (8'ha7) : (8'hb6))})) >= (((-((8'ha4) ? (7'h42) : (8'ha6))) ? (~&(8'haa)) : (^~(~|(8'ha7)))) ? {((^~(8'hbc)) - {(7'h41), (8'hbe)})} : (~&(((8'h9c) << (8'ha2)) - ((8'ha8) ? (7'h43) : (8'hbd)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2 * $unsigned($unsigned($unsigned(wire2[(1'h0):(1'h0)]))));
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = wire2[(1'h1):(1'h1)];
  assign wire7 = (((^$signed({wire5})) ?
                         $unsigned(($signed(wire4) ?
                             {wire1,
                                 (7'h43)} : $unsigned(wire6))) : $signed({{(8'hac),
                                 wire6}})) ?
                     (wire4[(4'hb):(3'h4)] ?
                         (~^(~|$signed(wire6))) : $signed($signed($signed(wire3)))) : $unsigned(wire1[(1'h1):(1'h0)]));
  assign wire8 = $unsigned(((wire5 ?
                     ((|wire0) ?
                         (wire6 != wire6) : wire6[(2'h3):(1'h1)]) : (^~(7'h41))) >= ($unsigned((|wire5)) ?
                     wire3 : {(~wire3), ((8'ha6) ? wire4 : wire1)})));
  assign wire9 = (&($signed({(wire8 <<< wire2)}) == {({wire1} ?
                         wire1 : wire8)}));
  assign wire10 = $unsigned($unsigned($signed(wire5)));
endmodule
