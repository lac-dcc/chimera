module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((($unsigned($signed(wire0)) ?
                             ({wire2} ? (wire2 | wire0) : wire1) : (wire1 ?
                                 {wire0, wire0} : (~wire3))) ?
                         ((~(wire2 != wire3)) ?
                             ($signed(wire2) && $signed(wire1)) : ((wire1 ?
                                 wire3 : wire0) > wire3)) : $signed({((8'ha4) ?
                                 wire1 : wire2),
                             $signed((8'hb3))})) ?
                     $unsigned(wire0) : (wire2[(2'h2):(1'h1)] ^~ wire2));
  assign wire5 = $signed(((|wire0[(3'h7):(3'h5)]) ^ (~^(8'hb0))));
  assign wire6 = $signed($unsigned((((+wire0) ?
                         {wire4} : (wire4 ? (8'hb5) : wire3)) ?
                     ((~^wire3) ? wire3 : wire3) : (wire1[(2'h3):(1'h0)] ?
                         (~wire1) : $unsigned(wire0)))));
  assign wire7 = {$unsigned($unsigned($unsigned((wire3 ? wire0 : wire0)))),
                     ((|($signed(wire5) ? (wire5 <= wire5) : wire3)) ?
                         {$signed((8'ha7))} : (+(^~wire4[(4'h8):(2'h3)])))};
  assign wire8 = wire3;
  assign wire9 = wire3[(2'h3):(2'h2)];
endmodule
