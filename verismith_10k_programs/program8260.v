module top
#(parameter param9 = ((((^~(-(8'hb0))) && ({(8'hae), (8'hb8)} ? (^~(7'h42)) : (!(8'ha0)))) ? {(8'hb1)} : ({(!(7'h40)), (~^(7'h42))} * ({(8'ha9), (8'haf)} == ((7'h42) ? (8'hbd) : (8'haa))))) >= ((~|(((7'h42) || (7'h42)) ? (^~(8'h9e)) : ((8'hbf) ? (8'hac) : (8'hb3)))) ? {(^~((7'h41) ? (8'ha1) : (8'ha7)))} : ({((8'hbc) && (8'haa))} ? (((7'h44) ~^ (8'hb2)) << {(8'ha0), (8'hae)}) : (((7'h44) < (8'hbe)) ? ((8'hb6) ^ (8'hab)) : (7'h43))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(1'h0):(1'h0)];
  assign wire6 = ((^(~&$signed(((7'h43) ? wire4 : wire0)))) ? wire0 : wire4);
  assign wire7 = (~&$unsigned(($signed((7'h44)) & {wire4[(1'h0):(1'h0)]})));
  assign wire8 = $unsigned($signed($unsigned(((~wire3) ?
                     (~|(8'h9f)) : (wire6 ? wire1 : wire0)))));
endmodule
