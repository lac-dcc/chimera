module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 (1'h0)};
  assign wire5 = {(+($signed((8'hb7)) >= (~|(wire1 <<< (8'hb2)))))};
  assign wire6 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= {$signed($signed(wire1[(2'h3):(2'h3)])), wire4};
    end
  assign wire8 = wire6;
  assign wire9 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg10 <= $signed($signed(wire9[(4'hc):(3'h4)]));
      reg11 <= {(wire6 ?
              $signed((+$unsigned(wire8))) : ((^wire8) < {reg10[(3'h5):(1'h0)],
                  (^~wire9)}))};
      reg12 <= wire4;
      reg13 <= wire3;
      reg14 <= reg12[(2'h2):(1'h0)];
    end
  assign wire15 = $signed((wire5[(4'h8):(3'h5)] ~^ $unsigned((~|$signed(wire8)))));
  assign wire16 = wire4;
  assign wire17 = wire1[(1'h1):(1'h0)];
  assign wire18 = (~&(reg11 ~^ wire15));
  assign wire19 = ($signed(wire5) <= reg10[(2'h2):(2'h2)]);
  assign wire20 = ({$unsigned($unsigned((8'h9e)))} ?
                      (wire16[(2'h2):(2'h2)] & $unsigned((!((8'h9f) ?
                          wire8 : (7'h44))))) : $unsigned($signed(($signed((8'ha5)) ~^ (wire3 & reg13)))));
  assign wire21 = $signed($unsigned((($unsigned((8'hbc)) >>> (|wire8)) ?
                      $unsigned($unsigned(reg13)) : ((wire5 > wire17) & (reg10 >= reg7)))));
  assign wire22 = wire4;
  assign wire23 = $unsigned(($signed((8'haf)) ?
                      ({$unsigned((8'ha1)), reg7[(1'h0):(1'h0)]} ?
                          $signed(wire16[(1'h1):(1'h1)]) : (~(&wire15))) : (|(!$unsigned(wire2)))));
endmodule
