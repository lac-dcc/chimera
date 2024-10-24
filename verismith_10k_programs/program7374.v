module top
#(parameter param9 = {(~&{(((8'h9d) << (8'hac)) >>> ((8'hb7) ? (8'ha5) : (8'hab)))}), ({(~^((8'hab) ? (7'h44) : (8'h9d)))} > ((8'hbc) ^ {(-(8'hbf))}))}, 
parameter param10 = (param9 - (^~(((param9 ? param9 : (8'ha6)) ? param9 : (param9 < param9)) ? (~|param9) : ((|param9) != param9)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(((wire3 ?
                         ((wire0 > wire1) + wire4) : ((8'hbe) > (!wire1))) ?
                     (^~$signed((~(8'ha8)))) : wire0));
  assign wire6 = $unsigned(((wire1 >> $signed((wire1 ?
                     (8'hb5) : wire3))) & (wire1[(4'h8):(3'h6)] ?
                     wire2[(4'hf):(3'h5)] : {(wire4 <<< (8'hb1)), wire3})));
  assign wire7 = ({wire1, (^wire3[(2'h3):(2'h3)])} <<< wire4);
  assign wire8 = $unsigned(wire5);
endmodule
