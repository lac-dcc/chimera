module top
#(parameter param8 = ((~((|((7'h44) + (8'ha7))) ? (((8'hab) == (8'hb0)) << ((8'ha8) ? (8'hb7) : (8'ha5))) : ((^~(8'ha2)) ? (-(8'ha1)) : (7'h44)))) >> (((((8'hb2) ? (8'hba) : (8'hb9)) * {(8'hb1), (8'hba)}) ? (&(~(8'haf))) : ({(8'hbf)} ? ((8'hba) < (8'hb7)) : ((8'hbe) ? (8'ha9) : (8'hb3)))) <<< {{((8'hb7) ? (8'ha1) : (8'hba))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {wire1[(3'h4):(1'h1)], (^$signed((^wire2[(4'h8):(1'h0)])))};
  assign wire5 = wire0;
  assign wire6 = (!(^{wire1}));
  assign wire7 = $signed(wire4);
endmodule
