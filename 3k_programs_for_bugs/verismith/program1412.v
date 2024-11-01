module top
#(parameter param9 = {{(((|(8'hb8)) ? {(8'ha8)} : (^~(8'hac))) >> {{(8'ha5)}}), ((((8'haf) ? (7'h42) : (8'hb2)) < {(8'hac)}) ? (((7'h44) - (8'hb7)) | (+(8'hb6))) : (~|(^~(8'haa))))}, ((+(((8'ha5) <= (8'hb3)) ? ((8'hbd) ? (8'hb1) : (7'h43)) : ((8'hb3) ^~ (8'hbf)))) ? ((7'h42) ? (((8'hb6) ? (8'haa) : (8'haa)) ? (8'hb7) : ((8'ha9) >= (8'had))) : (+(^~(8'ha5)))) : ({((7'h44) == (8'haa))} | (((8'ha9) ? (8'ha7) : (8'hb5)) || (^(8'hb3)))))}, 
parameter param10 = {(&(~&(&((8'hb2) <= param9))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire4 != wire4[(4'hf):(4'ha)]);
  assign wire6 = $unsigned($unsigned(wire0[(2'h2):(2'h2)]));
  assign wire7 = $signed($unsigned({wire2,
                     (wire2[(4'hf):(1'h0)] ?
                         (wire1 ^ wire1) : (wire6 ^ wire6))}));
  assign wire8 = $signed(((^wire4) + wire5));
endmodule
