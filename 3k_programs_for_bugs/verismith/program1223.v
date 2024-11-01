module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 (1'h0)};
  assign wire4 = ((^~((!$unsigned(wire1)) ~^ $signed($unsigned(wire2)))) && $signed(wire1[(5'h10):(4'ha)]));
  assign wire5 = $unsigned(wire3);
  assign wire6 = $signed((((wire5 ? (^wire3) : wire3[(5'h11):(2'h2)]) ?
                     (&$signed(wire3)) : ((+wire2) == wire4[(4'h8):(1'h0)])) == {wire5[(2'h2):(1'h1)],
                     (+wire0[(1'h0):(1'h0)])}));
  assign wire7 = $unsigned(((wire3 ?
                         $signed((wire6 > wire0)) : $unsigned(((8'hb5) * wire4))) ?
                     ((wire5[(3'h6):(2'h2)] ?
                         (wire1 || wire4) : ((8'h9f) ?
                             (8'hb6) : wire0)) ~^ $unsigned((7'h41))) : wire5));
  always
    @(posedge clk) begin
      reg8 <= $signed(wire4);
    end
  assign wire9 = wire6[(3'h4):(2'h3)];
  assign wire10 = $unsigned(wire0);
  assign wire11 = $unsigned(reg8);
  always
    @(posedge clk) begin
      reg12 <= wire2[(4'he):(4'hc)];
      reg13 <= {$signed($unsigned($signed(reg8))), reg12[(5'h12):(4'ha)]};
      reg14 <= wire11[(1'h0):(1'h0)];
    end
  assign wire15 = $signed({(!(^~$unsigned((8'hab))))});
  assign wire16 = $signed(((~^reg14) ?
                      ((8'h9e) ?
                          ($unsigned((7'h44)) & (wire11 < reg14)) : reg14) : $unsigned(((wire1 ?
                          (8'hb8) : wire7) != {wire11}))));
  assign wire17 = $signed(reg12);
  assign wire18 = ((((8'h9c) + (~&$unsigned(wire15))) == $unsigned(((wire11 ?
                          wire17 : wire1) ?
                      (wire6 ?
                          wire16 : reg14) : wire4[(4'hc):(2'h2)]))) & $unsigned(wire6[(1'h1):(1'h1)]));
  assign wire19 = wire4;
  assign wire20 = ({$signed($unsigned((8'haa)))} ?
                      $signed(wire11) : {$unsigned(wire16[(3'h7):(3'h7)])});
endmodule
