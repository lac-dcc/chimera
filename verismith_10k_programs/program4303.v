module top
#(parameter param9 = ({(~&{(~(7'h42)), ((8'h9e) ? (8'ha0) : (8'h9f))}), (~((8'hb0) ? {(8'h9e), (8'hbd)} : (!(7'h44))))} ? (^~{{{(8'hb3), (8'hb3)}, ((8'ha2) & (8'hb3))}}) : {(((^~(8'hba)) * (~^(8'ha6))) - (~(8'hb0))), ((~|((8'hbc) >= (8'hab))) ? (((8'ha0) + (8'hb6)) ~^ (|(7'h44))) : (((8'h9d) ? (8'hac) : (8'hb5)) | {(8'hae), (7'h44)}))}), 
parameter param10 = (^~(((+{param9}) ? ((8'ha2) * {param9, param9}) : {(&param9)}) ? (((param9 ~^ param9) ~^ param9) >> ((param9 + param9) & (8'hb1))) : ((^(param9 * (7'h42))) ? ((+(8'ha4)) << (|param9)) : param9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(3'h6):(2'h2)];
  assign wire5 = $signed(wire2);
  assign wire6 = wire0;
  assign wire7 = (wire4 > wire6);
  assign wire8 = (wire0 ?
                     $signed({((wire3 | wire6) ?
                             $signed(wire2) : wire0[(4'he):(4'h8)])}) : ((+{wire7,
                         {wire3, (8'ha9)}}) >= ($signed(wire2) ?
                         wire7 : ($unsigned(wire2) ?
                             (wire2 != (8'ha0)) : wire6[(1'h0):(1'h0)]))));
endmodule
