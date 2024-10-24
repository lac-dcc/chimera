module top
#(parameter param10 = ((8'hb4) ? (((~&((8'hbb) | (8'hb4))) ? {{(8'hb0), (8'hba)}} : (((7'h42) <<< (8'ha3)) << ((8'hb9) - (8'hbd)))) ^~ (~^(+((8'ha9) >>> (8'ha6))))) : {((&((8'ha1) ? (7'h40) : (8'hbe))) * (((8'ha3) ? (7'h44) : (7'h42)) ? ((8'ha2) * (8'ha6)) : (|(8'hb4))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire3[(4'h9):(2'h3)];
  assign wire6 = (wire3[(1'h1):(1'h1)] || (8'hb8));
  assign wire7 = ($signed($unsigned($signed((7'h41)))) <= ($unsigned((wire0[(4'h8):(2'h2)] ?
                     $signed(wire1) : $unsigned(wire3))) && wire5[(2'h3):(1'h0)]));
  assign wire8 = ({($unsigned(wire5[(2'h2):(1'h0)]) ?
                         wire7[(2'h3):(2'h3)] : $unsigned(wire2[(4'hd):(3'h4)])),
                     wire6[(4'hc):(4'h8)]} ~^ wire0[(2'h2):(2'h2)]);
  assign wire9 = wire8;
endmodule
