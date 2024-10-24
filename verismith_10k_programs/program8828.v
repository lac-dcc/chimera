module top
#(parameter param9 = (+((~^(|((8'ha2) ^~ (8'hbe)))) || ({{(8'hba)}, (+(8'hb1))} >= {(7'h40)}))), 
parameter param10 = ({(!(^((8'hbb) < (8'hbd)))), param9} ? (^param9) : ((~|((param9 ~^ param9) ? (param9 == param9) : param9)) ? (param9 ? ((param9 ? (8'h9c) : (7'h44)) ? (param9 ? param9 : param9) : (param9 >> param9)) : ((param9 + param9) ? (param9 ? param9 : param9) : ((7'h41) >> param9))) : ({(param9 <<< param9), (param9 ? param9 : param9)} ? ((~param9) <= ((8'hb1) << param9)) : {(8'hbf)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$signed({wire0}), wire4};
  assign wire6 = ($unsigned($signed((8'hb9))) ?
                     ($unsigned($unsigned((+wire0))) ?
                         {((wire5 <<< wire1) ?
                                 $unsigned(wire0) : $unsigned((8'hae)))} : (wire2 ?
                             wire1 : $unsigned((wire1 >>> wire2)))) : (^~(~$unsigned((wire0 != wire1)))));
  assign wire7 = ((|({wire1[(4'hc):(4'hc)]} >> (wire3[(4'h8):(2'h3)] == (~|wire1)))) <= $unsigned($signed((|(wire5 ?
                     wire0 : wire0)))));
  assign wire8 = wire7;
endmodule
