module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (^~wire0);
  assign wire6 = $unsigned(((wire4 ?
                         $signed((wire0 || (8'hb3))) : $unsigned(wire0)) ?
                     wire1 : (((wire2 ? (8'hbc) : wire1) >= {wire1}) ?
                         wire3 : ({wire5} ? (8'hbb) : wire0))));
  assign wire7 = ({(wire5[(4'ha):(1'h0)] ?
                         {wire3[(4'h9):(2'h3)]} : (wire1 ?
                             {wire0,
                                 wire6} : wire0[(1'h1):(1'h0)]))} ^~ (wire6 != wire6[(2'h3):(1'h0)]));
  assign wire8 = (-$unsigned($signed(((wire1 >>> wire1) ?
                     ((8'h9c) + wire0) : (~(8'h9e))))));
endmodule
