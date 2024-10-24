module top
#(parameter param10 = (&(^~(-(~((8'haa) ^ (8'ha8)))))), 
parameter param11 = (param10 ? (-((param10 != {(8'hb7), param10}) ? (8'ha4) : (&(param10 ? param10 : param10)))) : (param10 ? {(8'hac), {param10, {param10}}} : ({(~^param10), param10} ? ((&param10) ? (~&param10) : param10) : ((param10 ? param10 : param10) ~^ param10)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed($unsigned(wire3[(4'ha):(4'ha)])));
  assign wire5 = $unsigned((wire2 + $signed((+$unsigned(wire2)))));
  assign wire6 = ((~&(|((+wire4) <<< wire2[(3'h4):(1'h1)]))) - ($unsigned($signed({(8'hbc),
                     wire3})) + (((wire3 >= wire3) ?
                     wire1[(4'h8):(3'h6)] : $signed(wire0)) < wire3)));
  assign wire7 = (((wire0 && $signed(wire1)) > (~|(~|(8'h9f)))) ?
                     wire1[(4'hd):(3'h4)] : $unsigned(wire1));
  assign wire8 = $signed($signed(($unsigned($signed(wire4)) - ($unsigned((8'ha1)) ~^ wire3))));
  assign wire9 = $signed((wire2[(4'h9):(4'h9)] ?
                     (~($signed(wire6) ?
                         wire4 : (^wire7))) : wire0[(1'h1):(1'h0)]));
endmodule
