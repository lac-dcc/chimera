module top
#(parameter param9 = ({(~^(8'h9f))} >> {({((8'ha5) ? (8'haf) : (8'ha0))} ? ((~^(8'hb7)) ~^ (-(8'ha1))) : (8'haf))}), 
parameter param10 = param9)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned((~&(!(wire4 != wire2)))) ?
                     wire0[(1'h1):(1'h0)] : $unsigned($unsigned($signed((wire0 ~^ wire4)))));
  assign wire6 = ({(wire1[(2'h2):(2'h2)] ?
                         wire3[(3'h6):(3'h6)] : $signed((wire0 << wire0)))} >= wire2);
  assign wire7 = wire5[(2'h3):(2'h2)];
  assign wire8 = wire5[(3'h5):(1'h1)];
endmodule
