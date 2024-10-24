module top
#(parameter param11 = {({{((8'hab) >>> (7'h41)), (~|(7'h42))}} ? ({(&(7'h44)), (-(8'hba))} ? ((~(8'hb0)) ? ((8'hb6) >>> (8'hac)) : ((8'ha0) | (8'ha6))) : {((7'h44) ? (8'hb3) : (8'hbe))}) : (~|((|(8'ha2)) ? ((8'h9e) ? (8'hb9) : (8'ha9)) : (!(8'ha4))))), {(((-(8'ha9)) ? ((8'hbf) + (8'ha6)) : ((8'hb1) ? (7'h41) : (8'hab))) ? (8'hbf) : (((8'haf) ? (8'hae) : (8'haf)) == ((8'hbf) ? (7'h42) : (8'ha2))))}}, 
parameter param12 = param11)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((wire1 ? wire3 : wire0) | wire0[(4'hb):(3'h5)]);
  assign wire5 = wire1;
  assign wire6 = $unsigned((~(((wire3 ? wire2 : wire2) ?
                     (wire0 || wire3) : ((7'h40) ? wire0 : wire4)) == wire2)));
  assign wire7 = (($unsigned(wire3) ?
                     {(wire6[(4'h9):(3'h7)] ? (wire2 <<< wire0) : (^wire3)),
                         ((8'hac) ?
                             ((8'hb9) ?
                                 wire1 : wire3) : (+wire4))} : $signed($unsigned((wire2 == wire2)))) && wire3[(5'h14):(5'h14)]);
  assign wire8 = wire5[(5'h11):(3'h6)];
  assign wire9 = $signed($unsigned((wire5 ?
                     ((wire8 | wire3) ^ $signed((8'hba))) : {wire2[(2'h3):(2'h2)]})));
  assign wire10 = $signed(wire1);
endmodule
