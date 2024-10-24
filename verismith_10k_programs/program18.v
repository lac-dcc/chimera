module top
#(parameter param9 = {(((((8'hba) <<< (8'hb4)) ? ((8'hb4) * (8'ha4)) : (^(7'h40))) ? (((8'ha5) ? (8'hb9) : (8'hb3)) ? ((8'ha4) ? (8'hb4) : (8'hb9)) : {(8'ha9), (8'hb7)}) : (((8'ha4) ? (8'h9f) : (8'haa)) * ((8'hbf) ? (8'hac) : (8'had)))) <= (~|(((7'h44) ? (8'hbb) : (8'hb6)) ? ((8'hbc) ? (8'hbb) : (8'hbc)) : {(7'h41)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(($unsigned($signed(wire3)) <= $unsigned(((wire0 * wire3) ~^ $unsigned(wire1)))));
  assign wire5 = $signed((~(!$unsigned(((8'hb9) ? wire1 : wire2)))));
  assign wire6 = (((((wire0 << wire2) ? wire0 : (wire0 | (8'hb7))) ?
                             (~&(wire3 | wire0)) : $unsigned(((8'hb6) ?
                                 wire0 : wire5))) ?
                         $signed(((wire2 ?
                             wire2 : wire4) <<< (~|wire4))) : $signed(wire0[(2'h2):(1'h1)])) ?
                     wire0[(2'h2):(1'h0)] : $unsigned(wire0));
  assign wire7 = ({({$signed(wire6)} <= wire0), $unsigned((wire4 * {wire3}))} ?
                     ($signed({wire0[(1'h0):(1'h0)],
                         wire0}) ^~ (8'hbc)) : ((&(wire0 ?
                             wire2 : ((8'hac) ? wire1 : wire1))) ?
                         wire5 : ((~&(~(8'h9d))) ?
                             (8'ha7) : ((^~wire1) ?
                                 $signed(wire5) : (8'ha8)))));
  assign wire8 = (!wire4[(1'h1):(1'h1)]);
endmodule
