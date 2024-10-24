module top
#(parameter param9 = (~^({(((8'had) & (8'h9e)) ? ((7'h43) ? (7'h40) : (8'h9f)) : (~&(8'hbb)))} - ((((8'hb3) < (8'haf)) ? ((8'ha3) ? (8'haa) : (8'ha7)) : (&(8'hbf))) ? (((8'ha4) ^ (8'ha8)) ? (^(8'hae)) : ((8'hb0) << (8'h9f))) : (|{(8'hb8), (8'hb3)})))), 
parameter param10 = ((param9 * (8'ha1)) >> param9))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2[(2'h3):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = (($unsigned((|$unsigned(wire3))) ^~ (~^{(8'ha1),
                     (wire5 & wire3)})) <= ($unsigned(($signed(wire1) >> (wire0 != (8'hb1)))) ?
                     {{$signed(wire0), (8'had)}} : (((wire2 ? wire1 : wire3) ?
                             $signed(wire3) : ((8'hb8) ? wire0 : wire1)) ?
                         (7'h43) : {$unsigned(wire1)})));
  assign wire7 = {(((~(wire3 ? wire2 : wire1)) ?
                             ($unsigned((8'haf)) + $unsigned((8'ha8))) : (wire2[(3'h4):(3'h4)] ?
                                 wire0 : {wire6})) ?
                         (wire1[(1'h1):(1'h0)] ?
                             wire3 : ($signed((8'ha4)) ?
                                 {wire4,
                                     wire0} : wire5[(1'h0):(1'h0)])) : (~&wire6[(2'h2):(2'h2)])),
                     wire1[(2'h2):(2'h2)]};
  assign wire8 = wire0;
endmodule
