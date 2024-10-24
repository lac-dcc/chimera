module top
#(parameter param13 = (((~(((8'ha6) & (8'ha4)) ~^ {(8'ha7), (8'h9c)})) ? {(((8'h9f) ? (7'h40) : (8'ha4)) || {(8'ha1)})} : (-{(~^(7'h44)), ((7'h40) & (8'hb7))})) - (({((7'h42) >= (8'h9e))} ? ((~^(8'hb9)) || ((8'ha7) * (8'hb6))) : (!((8'hab) ~^ (8'hb5)))) <= ((~|((8'hbd) >> (8'ha1))) ? {((7'h44) ^ (8'haa))} : (((8'ha0) ? (8'hb7) : (8'ha0)) ? (^(8'ha0)) : (8'ha5))))), 
parameter param14 = param13)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (((^~{(wire2 && wire3)}) ?
                     {(wire2[(1'h1):(1'h0)] ?
                             wire2 : wire2)} : $signed(((^~wire2) ~^ (~(8'ha9))))) < wire3);
  assign wire5 = (wire2[(2'h2):(1'h0)] << $signed((8'hb2)));
  assign wire6 = wire3[(1'h1):(1'h0)];
  assign wire7 = wire4[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg8 <= wire3;
      reg9 <= wire7;
      reg10 <= $unsigned(wire1[(3'h4):(2'h3)]);
      reg11 <= ((&((&(wire1 ? wire6 : reg10)) <= wire3)) <= wire7);
      reg12 <= $unsigned($signed(wire7[(4'h8):(3'h7)]));
    end
endmodule
