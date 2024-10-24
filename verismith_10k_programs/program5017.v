module top
#(parameter param10 = (((&(~(!(8'hb5)))) ? ((~&((8'hbe) ? (8'ha0) : (8'haf))) || ((~^(8'hb1)) ? ((7'h43) >= (8'hb2)) : ((8'ha4) ? (8'h9d) : (8'hb7)))) : {{{(8'hb9), (8'had)}, ((7'h42) ? (8'ha0) : (8'ha9))}}) >> ((^(~&{(8'hac), (8'hbb)})) << (~{(7'h41), {(8'ha6), (8'hb9)}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (-((^~wire4[(2'h3):(1'h0)]) && ($signed({wire2,
                     wire0}) ^ {(wire3 * wire2), wire4})));
  assign wire6 = ((&($signed((~|wire2)) ^ {(wire3 < wire2)})) | ($unsigned({$signed(wire5)}) ?
                     (~&$signed($unsigned(wire2))) : ($unsigned((8'hae)) & wire4)));
  assign wire7 = {($signed($signed((wire3 ? wire0 : wire3))) == (((^~wire3) ?
                             wire0 : (wire3 ? wire3 : wire2)) ?
                         wire3[(5'h10):(4'hd)] : wire3))};
  assign wire8 = $unsigned($unsigned($unsigned($signed({wire6}))));
  assign wire9 = ((~^{(((8'hac) != (8'hb7)) ^ $signed(wire7)),
                         wire0[(2'h2):(2'h2)]}) ?
                     (-$unsigned($unsigned((!wire0)))) : ((wire6[(4'h8):(2'h3)] && $unsigned(wire3)) << ({wire5[(1'h1):(1'h1)],
                             wire3[(1'h1):(1'h0)]} ?
                         $signed((wire6 & wire8)) : $unsigned($signed(wire5)))));
endmodule
