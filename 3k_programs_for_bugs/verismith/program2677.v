module top
#(parameter param11 = (({(-(|(8'hbe))), (~|((8'had) << (8'hba)))} * {(((8'hbf) ? (8'hbd) : (8'haf)) ? ((8'h9f) ? (8'hbe) : (8'had)) : ((8'hb7) ? (8'hbd) : (7'h42))), {((8'h9d) && (8'haa)), (~(8'h9e))}}) ? {({{(7'h44), (8'ha6)}, {(7'h41)}} ? ((~^(8'hbd)) ? (7'h43) : ((8'hbe) ? (8'hac) : (8'hac))) : {((7'h43) & (8'hb5))}), ((((8'hac) != (8'hbb)) * (+(8'h9f))) || ({(7'h41), (7'h43)} ? (+(8'ha9)) : {(8'ha4)}))} : ((|(((7'h44) ? (8'h9e) : (7'h44)) ? (~|(8'hab)) : ((8'hb2) * (8'hb0)))) ? (~^(~((8'hb2) ? (7'h42) : (7'h43)))) : (~(^((8'ha7) && (8'hba)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((!{$signed((~^wire1)), (wire3 - {wire2})}) - wire2);
  assign wire6 = wire3;
  assign wire7 = $unsigned(((~^{wire2[(3'h6):(3'h4)]}) || ($signed($unsigned(wire4)) ?
                     (wire5[(1'h0):(1'h0)] + $signed(wire3)) : $signed(wire2[(3'h4):(1'h0)]))));
  assign wire8 = ($unsigned({wire4[(1'h1):(1'h0)]}) || (^~({(~wire4),
                         wire0[(3'h5):(2'h3)]} ?
                     $signed((^wire2)) : $signed((wire7 > wire6)))));
  assign wire9 = ((-({{wire1, wire1}, (wire7 ? wire6 : wire4)} ?
                         ((~&wire2) ?
                             wire2[(3'h7):(3'h7)] : (wire3 & wire5)) : wire4[(1'h0):(1'h0)])) ?
                     $unsigned(((wire2[(1'h1):(1'h0)] ?
                         (wire6 ^~ wire7) : ((8'had) * wire5)) >= $signed((wire4 <= (8'ha2))))) : {(8'hac),
                         $signed(wire4[(3'h5):(3'h5)])});
  assign wire10 = $signed((wire9[(3'h7):(1'h0)] ^ ((wire3[(1'h1):(1'h0)] ?
                          (~^wire6) : (~|wire7)) ?
                      {(~|wire6), (^wire7)} : wire7[(3'h7):(2'h2)])));
endmodule
