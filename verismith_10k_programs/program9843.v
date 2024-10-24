module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = {(wire2 ?
                         ((&{(8'hb5),
                             wire3}) >>> (~&$unsigned((8'haa)))) : wire5[(4'h9):(2'h2)]),
                     ((wire5 ? wire4[(2'h2):(1'h0)] : (|{wire1, (8'hbf)})) ?
                         (~&wire1) : wire5)};
  always
    @(posedge clk) begin
      reg7 <= $signed($signed($signed((wire2[(1'h0):(1'h0)] ?
          (wire6 + (8'had)) : (^wire0)))));
      reg8 <= $signed((~&({$signed((8'hac))} >= $unsigned($signed(wire3)))));
      reg9 <= {reg8[(2'h2):(1'h1)]};
      reg10 <= wire1[(1'h1):(1'h1)];
    end
  assign wire11 = ($signed({($unsigned(wire1) ?
                          wire6[(3'h5):(1'h1)] : $signed(reg7)),
                      $signed(wire3[(2'h2):(2'h2)])}) | $signed(wire4));
  assign wire12 = ($signed(reg9[(1'h1):(1'h0)]) ?
                      $signed((!(&(reg10 ?
                          wire4 : wire0)))) : ((((reg10 <= wire1) ?
                              $unsigned(wire0) : (wire6 | wire5)) ?
                          (!reg9[(3'h5):(2'h3)]) : {wire0}) || ((wire4[(3'h5):(3'h4)] ?
                          reg9 : wire2) | ((^wire4) | (wire1 ?
                          wire3 : wire6)))));
  assign wire13 = wire2;
endmodule
