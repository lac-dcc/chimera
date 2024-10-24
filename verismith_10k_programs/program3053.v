module top
#(parameter param9 = (~^(((((8'hb0) ? (8'hac) : (8'ha2)) <= ((8'hb4) >>> (8'hb4))) ? (^((8'hac) ? (7'h40) : (8'ha3))) : (8'ha0)) ? ((((8'ha8) ^~ (8'ha6)) || (!(8'haa))) ? {((8'hb8) ? (8'hb2) : (8'hb8)), (8'ha8)} : (^(|(8'hba)))) : (|{((8'hbc) << (8'hb5)), ((8'ha6) ? (8'ha5) : (8'ha8))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ({$signed((wire2[(2'h2):(1'h0)] * {wire1})), wire3} == wire1);
  assign wire5 = $unsigned(wire2);
  assign wire6 = wire1;
  assign wire7 = (~&(7'h41));
  assign wire8 = wire1;
endmodule
