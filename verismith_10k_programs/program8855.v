module top
#(parameter param10 = (~^(((7'h44) <<< (((8'hb5) ? (8'had) : (8'hb0)) ? ((8'hac) && (8'hb3)) : ((8'hbb) && (8'h9e)))) << (~&(-(|(8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned(wire3[(1'h0):(1'h0)]) ?
                     wire4[(4'ha):(4'ha)] : ((~&$signed((wire2 ?
                             wire2 : wire1))) ?
                         ({wire1} ? wire3 : wire2[(1'h0):(1'h0)]) : wire3));
  assign wire6 = $unsigned($unsigned(((8'h9e) | $signed($signed(wire1)))));
  assign wire7 = wire4[(4'hc):(4'hc)];
  assign wire8 = (wire1[(3'h7):(2'h3)] ?
                     (~^(|((wire0 <= wire2) ?
                         (-wire7) : {wire5}))) : $signed(wire3[(1'h1):(1'h0)]));
  assign wire9 = {$signed(($signed((^~(8'ha4))) ?
                         wire4[(4'h8):(1'h1)] : $unsigned((wire7 ~^ wire6))))};
endmodule
