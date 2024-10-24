module top
#(parameter param9 = (({(8'hbc), (((7'h41) == (8'had)) | (~^(8'ha5)))} ? (~^(((7'h40) ? (8'ha1) : (8'h9f)) >= ((8'haa) ? (7'h43) : (8'ha7)))) : (~((~(7'h41)) ? (~|(8'hb2)) : ((7'h44) == (8'ha9))))) ? {(({(8'h9d), (8'hbb)} ? ((8'hb0) ? (7'h44) : (8'hb1)) : ((8'h9d) - (7'h40))) & {(~|(8'ha9))})} : ({{((7'h43) && (8'hb2))}, (!(-(8'h9c)))} ? ((^~((8'ha6) ? (8'hb0) : (8'hbb))) < (^((8'h9f) ? (8'hb5) : (7'h41)))) : ((7'h40) != (((8'ha0) ^~ (8'hbd)) ~^ ((8'ha1) == (8'hb3)))))), 
parameter param10 = (!{(^(((8'hbf) > (7'h40)) | (param9 | param9))), param9}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {wire0,
                     ($unsigned($signed((wire3 ? wire1 : wire0))) ~^ {{{wire0},
                             {wire1, wire2}},
                         wire0})};
  assign wire5 = $unsigned($signed(wire2));
  assign wire6 = ($unsigned((wire4[(3'h4):(3'h4)] != wire2)) ?
                     wire1[(2'h3):(2'h3)] : wire1);
  assign wire7 = wire0[(2'h2):(1'h1)];
  assign wire8 = (wire0 ?
                     (((|(wire3 ? wire5 : (8'hb6))) ? wire4 : (^wire2)) ?
                         wire5 : (((wire7 << wire7) || (wire5 ?
                             (8'hbc) : (8'h9c))) || wire7[(2'h3):(1'h0)])) : (8'had));
endmodule
