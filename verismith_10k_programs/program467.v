module top
#(parameter param9 = (!({((8'had) || ((8'h9e) <<< (8'haa))), ({(8'hb2)} <<< {(8'h9d), (8'ha1)})} ? (&(((8'hb2) > (8'ha5)) << ((8'hb7) ? (8'hb7) : (8'hb3)))) : ((~|(+(7'h42))) ? ({(7'h44), (8'hbd)} ? (^~(8'ha8)) : ((8'ha8) ? (8'ha4) : (8'hb7))) : (8'hb6)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned((((wire3 != (8'hb3)) ?
                     (wire3 > (8'ha8)) : (wire2 ?
                         wire2 : wire0)) * (wire1 != $unsigned(wire0)))));
  assign wire5 = wire0[(3'h4):(1'h0)];
  assign wire6 = wire2[(1'h0):(1'h0)];
  assign wire7 = (wire5 == $signed($unsigned($unsigned((8'haa)))));
  assign wire8 = (((~|wire0[(2'h3):(2'h2)]) ?
                     $unsigned($signed(wire5[(3'h4):(3'h4)])) : $signed(wire7)) <= ($unsigned($unsigned((8'hbf))) <= ((^~((8'ha2) ?
                     wire4 : wire1)) * (~wire5[(3'h5):(3'h5)]))));
endmodule
