module top
#(parameter param9 = {((8'hb2) || (({(8'h9f)} + (~&(8'h9d))) ? (^((8'h9f) | (8'ha5))) : (8'ha7)))}, 
parameter param10 = (((~(^param9)) ~^ {param9}) && ((-{(param9 ? param9 : param9), param9}) ? (+(8'ha8)) : ((8'h9c) ? (param9 ? (~|(8'hb9)) : {param9, param9}) : ((param9 ^ param9) && (~param9))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$unsigned(((7'h44) * (wire0[(1'h0):(1'h0)] ~^ wire2)))};
  assign wire6 = $signed(($signed(((wire2 ?
                         wire1 : (8'hbd)) > $signed(wire0))) ?
                     (8'hab) : wire4));
  assign wire7 = (^~$unsigned({($signed(wire5) < $signed(wire6)),
                     $signed((wire1 >> wire6))}));
  assign wire8 = ((8'hb6) ? (~|(|$unsigned(wire0))) : $signed((~&wire3)));
endmodule
