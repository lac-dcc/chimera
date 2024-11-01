module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (({wire3[(3'h4):(1'h1)]} ~^ wire2) ?
                     wire2[(2'h2):(2'h2)] : {(wire3[(4'hb):(3'h5)] | $signed((^wire2))),
                         (^~wire4[(4'hf):(4'hd)])});
  always
    @(posedge clk) begin
      reg6 <= wire1[(1'h1):(1'h0)];
      reg7 <= (^~(wire5 ^~ wire4[(5'h11):(4'hf)]));
      reg8 <= $unsigned((!(($unsigned(wire4) >> wire1[(3'h6):(2'h2)]) ?
          wire0[(4'hd):(4'ha)] : ((wire5 ^ wire2) ?
              (wire5 | (8'ha3)) : (wire4 == wire4)))));
      reg9 <= wire1;
      reg10 <= $unsigned(((wire5 ? $signed(reg7) : wire2) ?
          wire3 : ({reg9, $signed(reg7)} + ($signed(wire2) ?
              $unsigned(wire0) : (wire0 >> wire0)))));
    end
  assign wire11 = reg7;
  assign wire12 = wire5[(3'h6):(3'h4)];
  assign wire13 = $signed($signed($signed(({wire5, wire4} ?
                      (reg8 < reg9) : (wire0 << wire0)))));
endmodule
