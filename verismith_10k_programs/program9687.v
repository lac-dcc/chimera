module top
#(parameter param10 = (((~|(((8'hbf) ? (8'ha3) : (8'ha4)) ? ((8'h9d) ? (7'h44) : (8'hb9)) : ((8'hbc) && (8'ha3)))) ? {(((8'hb8) != (8'ha8)) ? ((8'hbc) ? (8'hbb) : (8'ha2)) : (&(8'ha5))), (^~((8'ha2) | (8'hbf)))} : ((((8'ha4) * (8'hbb)) ? ((8'haa) ? (8'ha2) : (8'hb0)) : (~^(8'had))) ? (|(|(8'hb4))) : ((8'ha0) ? (-(8'hb5)) : (~|(7'h40))))) - (^((~((8'ha0) << (7'h42))) ? (-((8'ha2) ? (8'h9c) : (8'haf))) : (-(~&(8'hbc)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((~^$unsigned((-(wire1 ?
                     (8'hae) : (8'hac))))) >= ((~^(8'hbe)) ?
                     (-$signed((wire3 | wire4))) : $signed(wire4)));
  assign wire6 = wire2;
  assign wire7 = (8'hba);
  assign wire8 = ((wire7 ? $unsigned(wire3[(1'h1):(1'h0)]) : wire1) ?
                     {{(^(wire4 ?
                                 wire3 : (7'h42)))}} : ($unsigned((wire4 - (wire0 || wire5))) > $signed(wire2)));
  assign wire9 = $unsigned(wire4[(3'h4):(2'h3)]);
endmodule
