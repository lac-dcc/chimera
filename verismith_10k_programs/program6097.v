module top
#(parameter param10 = ((-({((8'hb7) != (7'h41))} ^~ ({(8'ha6), (7'h41)} ? (~^(8'ha0)) : ((8'hb3) >= (8'hba))))) ? (8'ha2) : (~|((8'ha1) <= ((8'hb7) ^ (8'ha8))))), 
parameter param11 = param10)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(1'h1):(1'h1)];
  assign wire6 = (^~(-$signed(wire2)));
  assign wire7 = $signed((wire0[(3'h5):(3'h4)] >= $unsigned((~^$unsigned(wire3)))));
  assign wire8 = (+wire6[(5'h10):(1'h1)]);
  assign wire9 = wire5;
endmodule
