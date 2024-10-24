module top
#(parameter param12 = (!(({(!(8'haf)), ((8'hbf) ? (8'h9d) : (8'hb8))} ? ((~^(8'ha7)) ? (!(8'ha7)) : ((8'hb5) + (8'ha0))) : (((7'h44) <<< (8'hac)) <= ((8'had) ? (8'hb1) : (8'ha1)))) ? (~|(&((8'ha6) | (8'ha0)))) : ((^~((8'hb8) ? (8'ha1) : (8'hbc))) ? ({(8'h9f), (7'h44)} == ((8'hb0) ? (8'hb9) : (8'ha2))) : ((8'ha9) - ((8'h9d) ? (7'h44) : (8'hbb)))))), 
parameter param13 = ((((&(+param12)) ? {(|param12)} : (~(param12 + param12))) - ((param12 ? (^~param12) : param12) || (~(~^param12)))) ? param12 : ((-((param12 - param12) != param12)) || ((~&((8'ha2) ? param12 : (8'ha9))) - ((param12 ^ param12) ? (param12 > param12) : param12)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire2[(3'h4):(1'h1)] ?
                     $signed($signed($unsigned((wire2 ?
                         wire2 : wire4)))) : $unsigned($signed(((~(8'hb0)) > wire1))));
  assign wire6 = ($unsigned(wire2) ? wire0 : wire2[(3'h5):(2'h2)]);
  assign wire7 = wire4[(3'h6):(1'h1)];
  assign wire8 = {(wire7 + $unsigned(wire2[(2'h3):(1'h1)]))};
  assign wire9 = (+$signed($signed(((wire8 > wire8) ?
                     (wire3 < wire0) : wire2[(1'h0):(1'h0)]))));
  assign wire10 = {{(!$signed((wire5 & wire0)))},
                      (wire3[(1'h1):(1'h0)] >>> (&(+(-wire2))))};
  assign wire11 = ((((+$signed(wire6)) ?
                      {$signed(wire7)} : ($signed(wire3) <= ((7'h43) + wire2))) - (-$signed((+wire5)))) || ($signed((~&(&(8'h9d)))) ?
                      (^~$unsigned($unsigned((8'hb5)))) : wire0));
endmodule
