module top
#(parameter param10 = ((^((~(~&(8'ha9))) ? ((8'hb5) ? {(8'hb9)} : ((8'ha7) ? (8'h9e) : (8'hac))) : ((~(7'h42)) & ((7'h41) ~^ (8'hbe))))) ? ((^~({(7'h41)} * {(8'hab)})) > (&(((8'ha9) >= (8'ha3)) << (^~(8'hac))))) : (~^(({(8'ha1)} || ((8'hae) - (8'hb7))) <= (7'h41)))), 
parameter param11 = (((8'hac) >>> ({{(8'h9e)}, {param10}} >= (|param10))) ? (8'hb3) : param10))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = (wire2[(3'h5):(3'h4)] == ({{$unsigned(wire3),
                             $signed(wire3)}} ?
                     $signed(wire3[(4'h9):(1'h1)]) : ($unsigned((wire1 ?
                         wire3 : wire5)) == (wire0[(3'h6):(1'h0)] & ((7'h42) && wire4)))));
  assign wire7 = $signed(wire4[(4'hc):(3'h5)]);
  assign wire8 = (-$unsigned($signed(((-wire1) ?
                     wire3[(1'h1):(1'h1)] : wire3))));
  assign wire9 = $signed(($unsigned(wire6[(4'ha):(2'h3)]) ?
                     $unsigned(wire5[(4'ha):(1'h0)]) : (!wire8[(2'h2):(2'h2)])));
endmodule
