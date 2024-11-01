module top
#(parameter param9 = ((~&(+{((8'hba) & (8'ha7)), (-(8'hb1))})) <= ((((8'hb9) ? (^~(8'h9e)) : {(8'ha3), (8'hb4)}) + (8'ha9)) ^ (((|(8'hbb)) ? (~|(8'hb4)) : ((8'hbc) <= (8'h9c))) < (+(+(8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (~({wire3[(3'h4):(2'h2)]} == ($signed((^~wire0)) != $signed(wire0[(1'h1):(1'h0)]))));
  assign wire6 = (wire0[(4'h9):(3'h7)] >> $signed(wire2[(3'h5):(3'h4)]));
  assign wire7 = $unsigned(((~&wire1[(4'hb):(1'h0)]) ?
                     wire0 : wire3[(3'h5):(3'h4)]));
  assign wire8 = wire3;
endmodule
