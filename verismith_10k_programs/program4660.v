module top
#(parameter param8 = ((((((8'ha0) != (8'hb4)) - (~&(8'hb3))) > (((8'hb2) ? (8'hab) : (8'ha0)) >>> ((8'hac) ? (8'ha3) : (8'hae)))) > ({((7'h41) ? (8'hb4) : (8'ha7)), (!(8'hb5))} ? {(8'hbe), ((8'ha2) ? (8'hb3) : (8'hbe))} : (~&((8'ha5) ? (8'haf) : (8'ha0))))) >> (^~(^{((7'h42) - (7'h44))}))), 
parameter param9 = {((^((^~param8) ^ param8)) << (param8 ? ((|param8) << {param8}) : (param8 ? (-param8) : (param8 ? (8'hb1) : param8))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (&{(+wire3[(4'hd):(4'h8)]), wire0});
  assign wire5 = (wire3 ?
                     ((&$signed(((8'hbd) && wire0))) ?
                         wire2 : wire2) : $signed(($signed((^~wire3)) ?
                         $signed({wire3}) : $signed(wire0[(1'h0):(1'h0)]))));
  assign wire6 = wire0;
  assign wire7 = wire6;
endmodule
