module top
#(parameter param9 = ((+(~&(!(|(8'hb7))))) ? {((((8'hb6) || (8'h9d)) >= {(8'hb0), (8'hb1)}) ? (8'hb1) : (&{(8'had)}))} : ((8'hae) > ((((8'h9c) != (8'ha2)) ? ((8'h9e) > (7'h44)) : (~^(7'h44))) ? (-(8'hb8)) : (((8'ha5) ? (8'ha3) : (8'had)) ? {(7'h43)} : ((8'hb0) ? (8'hb1) : (7'h44)))))), 
parameter param10 = (^param9))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (-(($unsigned($signed((8'hbf))) ? wire3 : wire3) ?
                     ((wire1[(1'h0):(1'h0)] ? $signed(wire2) : wire1) ?
                         {(wire0 ? wire3 : wire1)} : ((wire2 ^ wire2) ?
                             (wire1 ? wire3 : wire0) : {wire1,
                                 wire0})) : wire3[(4'hd):(1'h1)]));
  assign wire5 = ((({wire3} ?
                         (~^$signed(wire4)) : wire3[(5'h10):(1'h1)]) == wire0) ?
                     wire1 : ($unsigned((^~wire2[(1'h0):(1'h0)])) <<< $unsigned($unsigned(wire0))));
  assign wire6 = $unsigned(wire5);
  assign wire7 = {{$unsigned(((|wire3) ?
                             $signed(wire4) : ((8'hbd) ? wire2 : wire3))),
                         (~^wire1)}};
  assign wire8 = $signed($signed($signed((wire7 ?
                     $unsigned(wire3) : $signed(wire2)))));
endmodule
