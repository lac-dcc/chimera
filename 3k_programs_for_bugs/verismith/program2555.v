module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire24, wire21, wire19, reg23, reg22, (1'h0)};
  module4 #() modinst20 (.wire7(wire2), .clk(clk), .wire5((8'ha2)), .y(wire19), .wire8(wire1), .wire6(wire0), .wire9(wire3));
  assign wire21 = (-(|{((wire3 << (8'ha9)) ?
                          (wire19 & wire19) : {wire19, wire3})}));
  always
    @(posedge clk) begin
      reg22 <= wire0;
      reg23 <= $unsigned($signed(((8'h9d) - wire0)));
    end
  assign wire24 = $unsigned($unsigned($signed(($unsigned(wire2) != $unsigned(wire19)))));
endmodule

module module4
#(parameter param18 = (+(({(^~(8'ha8))} ? ({(8'hbe), (8'had)} < ((8'hbc) >> (8'hb4))) : (((8'h9e) + (8'hb8)) ? ((8'ha7) ? (8'hb9) : (8'ha8)) : (~&(8'hb6)))) & (~^({(8'ha1), (8'ha9)} ? {(8'ha6)} : {(8'had)})))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire12,
                 wire11,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (wire8 - ((&(^~(7'h41))) ?
          wire5[(3'h7):(3'h7)] : ((&(~wire8)) ?
              $signed(wire9[(3'h7):(3'h6)]) : (~&$signed(wire5)))));
    end
  assign wire11 = ($unsigned(wire5[(3'h7):(2'h3)]) | $signed(((~&$unsigned(wire8)) - {wire9})));
  assign wire12 = $signed({wire7});
  always
    @(posedge clk) begin
      reg13 <= wire6;
      reg14 <= (8'ha0);
      reg15 <= $signed($signed(wire7));
      reg16 <= {(+(8'hb3))};
    end
  assign wire17 = wire7;
endmodule
