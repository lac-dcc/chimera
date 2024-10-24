module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((+wire0[(1'h0):(1'h0)]) >= ((({wire3} ?
                         wire0 : wire1[(2'h2):(1'h1)]) ?
                     (+$unsigned(wire2)) : (~((8'ha9) - wire0))) <<< wire2));
  assign wire5 = wire1;
  assign wire6 = $unsigned(((~^$unsigned((~&wire3))) < $unsigned((~&(~&wire0)))));
  assign wire7 = wire5;
  assign wire8 = {$unsigned(((!$signed((8'ha9))) ?
                         ({wire1, (7'h44)} <= ((8'h9e) ?
                             wire3 : wire3)) : ((wire1 ? wire7 : wire2) ?
                             (wire6 ? wire3 : wire5) : (wire2 ?
                                 wire7 : wire1)))),
                     $signed({((wire0 == wire5) ? $signed(wire5) : wire2)})};
endmodule
