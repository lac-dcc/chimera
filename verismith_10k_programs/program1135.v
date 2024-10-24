module top
#(parameter param12 = (~|({((^~(8'hb3)) & ((8'h9c) ? (8'hbf) : (8'hb3)))} ? (|((~&(8'h9c)) - ((8'hb9) ~^ (7'h41)))) : ((!((8'hb8) ? (8'hb9) : (8'haf))) ? ({(8'hab), (8'hb4)} ? {(8'ha1), (8'hb8)} : ((8'ha6) ? (8'hbc) : (8'haa))) : (((8'h9c) == (8'h9f)) ? (8'hb1) : (8'hbb))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((($signed((^~wire4)) ? {(wire2 ^~ wire1)} : wire1) ?
                     $unsigned($unsigned(wire2)) : (($unsigned((8'h9d)) ?
                         wire1 : wire1) >>> {((8'hae) & wire1)})));
  assign wire6 = {((^$unsigned((wire0 ? wire1 : wire2))) <= ((wire4 << (wire4 ?
                         wire2 : wire3)) != wire0[(3'h7):(3'h5)]))};
  assign wire7 = wire5[(3'h5):(1'h0)];
  assign wire8 = wire2[(3'h7):(3'h4)];
  assign wire9 = $signed(({$unsigned($signed((7'h41))), wire4} ?
                     {wire7} : wire7[(1'h1):(1'h1)]));
  assign wire10 = wire6;
  assign wire11 = wire8[(3'h5):(1'h0)];
endmodule
