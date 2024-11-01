module top
#(parameter param9 = ((|({(~&(8'h9f))} * (((8'haf) <<< (8'hb8)) ? ((8'hab) ? (8'hae) : (8'ha0)) : ((8'ha1) ? (8'hb8) : (8'hb2))))) ^~ ({{{(8'ha6)}}} <= {(8'hb3), (((8'hbb) != (8'ha8)) ? (-(8'ha5)) : {(8'hb3), (8'hb5)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed((^(8'ha8)));
  assign wire6 = ((wire3[(3'h7):(3'h6)] >= ($unsigned(wire2[(1'h0):(1'h0)]) ?
                         wire1[(1'h0):(1'h0)] : ((!wire4) ?
                             wire5[(4'h9):(3'h7)] : $signed((8'h9d))))) ?
                     ($unsigned($signed(wire0[(3'h6):(2'h3)])) >>> wire0) : {((8'h9c) + (8'ha4))});
  assign wire7 = {(-$unsigned((wire4 ? {wire6} : (~&wire2)))),
                     $signed($signed((wire5 ?
                         ((7'h43) >= wire2) : $signed(wire2))))};
  assign wire8 = (wire7[(3'h7):(3'h7)] <<< (^~$signed(wire5)));
endmodule
