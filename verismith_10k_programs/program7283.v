module top
#(parameter param10 = (((^~(^((8'h9f) | (8'ha4)))) ? (((~(8'hbb)) ^~ ((8'hba) >> (8'hab))) | (&((8'hac) ? (8'hb7) : (8'haf)))) : ((~|((8'hb8) ? (8'ha1) : (8'hbb))) < (((8'ha6) ? (8'ha9) : (8'hbb)) <<< ((8'hb3) ? (7'h43) : (8'hb7))))) ^ (({{(8'hb1)}} * ((8'ha7) ? ((8'hb9) ^ (8'ha5)) : ((8'hb1) ? (7'h40) : (8'hb0)))) != ((((8'ha8) ? (8'h9d) : (8'ha4)) >>> ((8'ha9) ~^ (8'hbc))) ? (((8'hb8) ? (8'haa) : (8'ha0)) ~^ (|(8'ha5))) : (((8'hae) ^~ (8'hae)) >> (8'ha3))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(1'h0):(1'h0)];
  assign wire5 = $unsigned(wire0[(3'h5):(2'h3)]);
  assign wire6 = (^~$signed($signed($unsigned(((7'h44) & (8'hbb))))));
  assign wire7 = $signed(wire1[(2'h2):(1'h1)]);
  assign wire8 = {$unsigned($signed($unsigned($signed(wire5)))), wire0};
  assign wire9 = (^{(((|wire7) ?
                         $unsigned(wire3) : $signed(wire7)) <= wire4[(2'h2):(1'h0)]),
                     (wire0[(4'he):(3'h7)] == wire4[(1'h0):(1'h0)])});
endmodule
