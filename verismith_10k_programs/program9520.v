module top
#(parameter param10 = (&{((8'hae) >>> {((7'h40) > (8'hbc)), {(8'hb5)}})}), 
parameter param11 = (^(((((7'h44) != param10) ? param10 : ((8'ha9) ? param10 : param10)) ? (!{param10, param10}) : (-((8'hb2) ? (8'hac) : param10))) ? param10 : (((param10 < param10) ? param10 : param10) >= ((param10 ? param10 : param10) * (param10 ? param10 : param10))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($unsigned((wire1[(2'h2):(1'h0)] - ((wire1 ?
                         wire1 : (8'ha9)) ?
                     wire4 : $unsigned(wire4)))));
  assign wire6 = wire0[(3'h7):(1'h1)];
  assign wire7 = ((~^$unsigned(($signed(wire4) >= {(8'ha1),
                     wire4}))) ~^ $unsigned($unsigned(wire6[(4'h9):(3'h7)])));
  assign wire8 = $unsigned(wire0);
  assign wire9 = wire8;
endmodule
