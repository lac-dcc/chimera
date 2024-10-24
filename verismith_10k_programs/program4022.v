module top
#(parameter param11 = (({(((8'hb2) <= (8'hb7)) ? ((8'hbe) ? (8'hb2) : (8'ha0)) : ((8'ha8) >= (8'ha4)))} ? {((~&(8'ha8)) ? (|(8'hbc)) : (!(8'ha3))), ((!(7'h43)) ~^ ((8'h9f) ? (8'hbd) : (8'hb1)))} : (^(((8'hb0) ? (8'ha5) : (8'ha1)) | ((8'hb4) ? (7'h43) : (7'h43))))) + ((8'hbd) ? (({(7'h43), (8'hb9)} ? ((8'had) ? (8'hb0) : (8'hae)) : (-(8'hbc))) ? {{(8'hb0)}, ((8'hbb) | (8'hae))} : {((7'h40) || (8'h9f)), ((8'hbf) && (8'hb8))}) : (^(((8'hbd) ? (8'had) : (8'ha1)) ? {(8'h9e), (7'h40)} : (~|(8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire10, wire7, wire6, wire5, reg9, reg8, (1'h0)};
  assign wire5 = (~^wire3);
  assign wire6 = {$unsigned((~(&{wire0, wire2})))};
  assign wire7 = ($unsigned(((&(^wire5)) - {wire2[(4'h9):(1'h0)]})) != (wire0[(3'h7):(3'h7)] ^~ {((~^wire1) ?
                         (wire6 >> (8'hb8)) : $unsigned(wire3)),
                     $signed({wire2, wire3})}));
  always
    @(posedge clk) begin
      reg8 <= wire4;
      reg9 <= $unsigned(wire4);
    end
  assign wire10 = reg9;
endmodule
