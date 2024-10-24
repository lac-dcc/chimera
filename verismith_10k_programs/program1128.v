module top
#(parameter param10 = (((((|(8'hac)) ? ((8'hbe) ? (8'h9c) : (8'ha4)) : (|(8'had))) ^ ((&(8'ha0)) >>> ((8'ha1) ? (7'h40) : (8'h9e)))) ? ((8'hbd) ~^ ({(8'hbd)} ? ((8'hb6) + (8'hbc)) : ((8'ha6) > (8'hb1)))) : ((!(~(8'hbc))) ? (!(|(8'hac))) : (!((8'hb2) ? (8'h9e) : (8'haf))))) == (^~((((8'ha3) ? (7'h44) : (7'h44)) ? ((8'ha8) >= (8'h9d)) : ((8'ha4) + (7'h40))) ? ((&(8'hb0)) ^ {(8'ha7), (8'ha5)}) : (+((8'ha1) ? (8'hbe) : (8'hbf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ({((~^(wire1 ? wire4 : wire1)) ?
                         (wire4 ?
                             {wire3} : $signed(wire2)) : (wire0[(1'h0):(1'h0)] ?
                             $signed((8'ha2)) : {wire4, wire0})),
                     $signed(wire0)} & $unsigned(wire2[(4'h8):(2'h2)]));
  assign wire6 = $signed(((wire5 ?
                     (!wire0[(2'h3):(1'h1)]) : ((wire4 ?
                         wire0 : wire2) == (&wire1))) < wire4));
  assign wire7 = wire2;
  assign wire8 = wire7;
  assign wire9 = wire7[(3'h7):(3'h7)];
endmodule
