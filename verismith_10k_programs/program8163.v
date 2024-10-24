module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (({$unsigned((wire5 ? wire1 : wire1)),
                         ((&wire4) ? (8'ha6) : wire4)} ?
                     {wire3[(2'h2):(1'h1)], wire3} : ((~|(wire1 || wire4)) ?
                         ((wire5 ? wire5 : wire5) ?
                             $signed((8'hba)) : (wire4 >>> wire4)) : ($signed(wire4) ?
                             (wire4 ?
                                 wire5 : wire2) : wire5[(2'h3):(2'h2)]))) & {((((8'had) ?
                             wire2 : wire1) - ((8'hb8) ~^ wire3)) ?
                         wire4 : (wire1 ? $unsigned(wire1) : wire0)),
                     wire5});
  assign wire7 = ((8'ha4) ? (^~wire5) : $unsigned((+{(~|wire4), wire2})));
  assign wire8 = wire7[(1'h0):(1'h0)];
endmodule
