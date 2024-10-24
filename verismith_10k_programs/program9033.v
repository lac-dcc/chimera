module top
#(parameter param12 = (((((~|(8'haf)) ? ((8'ha8) ? (8'ha1) : (8'hb5)) : ((8'hb3) ? (8'ha1) : (8'hb8))) ? (~|((8'hac) ? (8'ha6) : (8'ha7))) : (&((8'h9c) * (8'hbb)))) ? (!{(^~(8'hbe))}) : ((((8'ha4) ? (8'hbc) : (8'ha8)) ? ((8'ha6) * (8'hb7)) : ((8'hae) ? (7'h40) : (8'had))) < ((8'ha0) <<< (8'hb4)))) || {(|({(8'hb4), (7'h41)} ? ((8'hbe) ? (8'ha5) : (8'hab)) : ((8'hb4) ? (8'ha9) : (8'hbf))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($signed($signed((wire0 ?
                     (wire1 ? wire2 : wire1) : $signed(wire0)))));
  assign wire5 = (~wire4);
  assign wire6 = (^wire2);
  assign wire7 = $unsigned($unsigned($unsigned($signed((~wire3)))));
  assign wire8 = ((wire5 + (~&(wire5 ?
                     (8'ha0) : (|(8'ha9))))) >>> (~&((wire4 - $signed(wire2)) - $signed($signed(wire5)))));
  assign wire9 = (~&(^{wire7[(4'h8):(1'h1)]}));
  assign wire10 = ({({{wire1},
                              (wire6 ?
                                  wire2 : wire3)} + $unsigned(wire4[(4'h9):(3'h4)])),
                          $unsigned(((!wire3) ^ $signed(wire7)))} ?
                      $signed(wire4) : ((wire5 != wire7[(3'h6):(1'h0)]) >> wire1[(2'h3):(1'h0)]));
  assign wire11 = $unsigned(wire5[(3'h5):(3'h4)]);
endmodule
