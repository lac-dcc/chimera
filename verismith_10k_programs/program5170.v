module top
#(parameter param9 = ((({(~|(8'had)), (^(8'ha7))} << (((8'h9e) ? (8'hb2) : (7'h41)) ? (~(7'h44)) : ((8'ha0) ^ (8'ha6)))) ? (((&(8'hb7)) ? (~&(8'ha4)) : ((8'hb8) <<< (8'h9c))) && ({(8'ha8)} << {(8'hb2)})) : (^(((8'h9c) || (8'ha1)) | (~|(8'hab))))) ? (((((8'haa) ? (8'hbb) : (8'haa)) + ((8'hb5) + (8'haf))) ? ((~|(8'ha9)) == ((8'ha0) ? (8'ha4) : (8'ha2))) : (((7'h44) ? (8'hb5) : (8'hb5)) ? (^~(8'hb6)) : ((8'ha9) ^ (8'hb7)))) ? {(~|((8'hb5) != (8'hb3)))} : ((&((8'ha0) <= (8'h9f))) <<< (^~(7'h44)))) : ((~&(((8'hb6) ? (8'hac) : (7'h44)) ? ((8'hab) ? (8'haa) : (8'hb7)) : ((8'ha6) << (8'hb3)))) ? (-(!((8'h9e) ^~ (8'ha6)))) : (((8'h9f) ? ((8'hb8) <= (8'hae)) : (!(8'h9d))) ? {((8'hba) + (8'hb4)), {(7'h42)}} : (((8'hae) ? (8'hbf) : (7'h44)) ? ((8'hba) >>> (8'hbc)) : ((8'haa) ? (8'haa) : (8'hac)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned($unsigned($unsigned($unsigned(wire1)))) ?
                     wire4[(5'h10):(4'he)] : wire1[(1'h0):(1'h0)]);
  assign wire6 = $unsigned($unsigned(($signed($signed(wire1)) << (wire3[(1'h1):(1'h1)] >= (wire2 - wire3)))));
  assign wire7 = $signed(wire2[(1'h0):(1'h0)]);
  assign wire8 = $unsigned($unsigned(wire3));
endmodule
