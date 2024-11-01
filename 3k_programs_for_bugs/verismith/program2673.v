module top
#(parameter param8 = (8'h9d), 
parameter param9 = (((((param8 ? param8 : param8) ? (param8 >>> (8'ha6)) : (+param8)) != (^~(param8 * param8))) << (+param8)) > (8'h9f)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (({wire1, wire1[(1'h0):(1'h0)]} ?
                         (^~{$signed((8'ha3))}) : ($unsigned((&wire1)) >= (wire2 << $signed(wire0)))) ?
                     (^~(((wire2 ? wire3 : wire3) == $signed(wire3)) ?
                         wire2 : $unsigned({wire2, wire1}))) : (8'haa));
  assign wire5 = $signed($signed($unsigned($unsigned($signed(wire1)))));
  assign wire6 = (((wire2[(4'hc):(3'h4)] != $signed({wire0, wire5})) ?
                     {(~^$signed(wire3)),
                         {$signed(wire4)}} : (($unsigned(wire0) && wire1) ^~ wire4)) << (^~(~^($unsigned((8'hb4)) | (-wire0)))));
  assign wire7 = $unsigned((wire1[(1'h1):(1'h0)] ?
                     $signed($signed(wire1[(4'h8):(3'h4)])) : wire1));
endmodule
