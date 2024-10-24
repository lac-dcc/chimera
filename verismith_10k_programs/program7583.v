module top
#(parameter param9 = ((!((~&((8'hb3) ? (8'ha0) : (8'hb7))) >= (((8'ha1) ? (8'hbf) : (7'h42)) ? ((8'ha5) ? (7'h44) : (8'h9d)) : ((7'h44) & (7'h44))))) ? ((~(((7'h41) > (7'h40)) ? ((8'hb3) < (8'hb2)) : {(8'had), (8'ha4)})) ? (~^{(~&(8'hb7))}) : {{(~&(8'ha0))}}) : (~&{(^~(8'hb7)), ((-(8'ha6)) <= {(8'hab)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire3;
  assign wire6 = $unsigned($signed(wire3[(3'h7):(3'h5)]));
  assign wire7 = (wire1 ? wire2[(3'h4):(2'h2)] : wire6[(1'h0):(1'h0)]);
  assign wire8 = (+$signed($signed({wire3})));
endmodule
