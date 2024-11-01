module top
#(parameter param10 = ((((~|((8'hb1) | (8'ha3))) - (((8'h9f) ? (8'haf) : (8'hb5)) ? {(8'h9d)} : ((8'ha6) ? (8'hb4) : (8'ha2)))) ? (8'h9e) : ((+(-(8'ha9))) >= {((8'ha6) ^ (8'hb2)), {(8'h9e)}})) | (({(&(7'h41))} ? {((8'haf) < (8'had)), ((8'hbd) <= (8'hb7))} : (8'hb6)) & ((((8'hbb) + (8'haa)) >= (~|(7'h42))) ? ({(8'ha7), (8'hb7)} & ((8'ha8) >= (8'hae))) : (-((8'ha7) ? (8'ha9) : (8'ha4)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ({(~^($unsigned((8'haa)) ? (^~wire0) : (wire3 && wire0))),
                     wire2[(2'h2):(2'h2)]} <= {$signed(wire2[(1'h0):(1'h0)])});
  assign wire5 = $signed(wire1[(2'h2):(1'h1)]);
  assign wire6 = (wire2 >>> wire5);
  assign wire7 = $signed($signed((wire2 ?
                     wire0[(3'h5):(2'h3)] : $signed((wire3 >= wire1)))));
  assign wire8 = $unsigned($unsigned((-$signed($signed(wire0)))));
  assign wire9 = (-(!$unsigned(((wire3 ?
                     wire3 : wire0) <= wire8[(4'hf):(1'h0)]))));
endmodule
