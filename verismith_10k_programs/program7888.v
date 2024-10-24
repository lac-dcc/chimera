module top
#(parameter param9 = ((8'hb3) | (((((8'hb4) ? (8'hb0) : (8'hb5)) ? ((8'ha0) || (8'hb0)) : ((8'h9d) >> (8'hac))) ? (~((8'hae) ? (8'ha0) : (7'h44))) : ((-(8'hb2)) | (~|(8'ha9)))) || ((((8'hbb) <<< (8'hb0)) | ((8'hbe) >>> (7'h40))) ? (((8'h9e) ? (7'h40) : (8'ha1)) ^ {(8'hb9), (8'h9f)}) : ((8'ha9) ? ((8'hbd) <<< (8'ha2)) : (+(8'ha0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (((wire2[(2'h3):(2'h2)] ?
                         wire4 : $signed((wire4 >> wire0))) << wire1[(3'h6):(1'h0)]) ?
                     wire0 : (~&$unsigned(wire2)));
  assign wire6 = $signed(($signed(($signed((8'hb7)) ?
                         (wire5 - wire1) : (~^(8'hbe)))) ?
                     $unsigned((wire3[(4'h8):(3'h7)] || wire5)) : (wire1[(4'hc):(1'h0)] ?
                         $signed($signed(wire4)) : $signed($unsigned(wire2)))));
  assign wire7 = $signed({(8'hb5), (wire6 << $unsigned(wire3))});
  assign wire8 = {$unsigned(({((8'ha2) ? wire3 : (8'hb1)),
                         {wire5, wire2}} < $unsigned((wire3 ?
                         wire1 : wire1))))};
endmodule
