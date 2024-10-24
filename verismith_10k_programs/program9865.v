module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire0[(4'hf):(1'h1)];
  assign wire6 = $unsigned(wire3);
  assign wire7 = wire3;
  assign wire8 = $signed(wire0[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg9 <= $signed((!$unsigned($signed((wire0 ? wire0 : wire6)))));
      reg10 <= ((((^~$signed(wire1)) ^ ((reg9 < wire0) && $signed(wire5))) <= ({(wire4 > wire0)} ?
          (wire0[(4'h8):(4'h8)] && {wire6, wire2}) : wire7)) <= (&wire1));
      reg11 <= ({$unsigned((!wire2))} ?
          {($signed(wire6[(3'h7):(3'h5)]) ?
                  {(wire4 ? wire4 : wire7),
                      (8'ha4)} : $unsigned(wire1))} : wire4[(4'he):(4'he)]);
      reg12 <= ((((wire5 ? (wire3 & reg11) : wire4) ?
          $unsigned(((8'hb6) >> wire4)) : ((!reg10) < (wire8 ?
              reg11 : reg9))) - (reg10 ?
          wire6[(3'h5):(1'h0)] : (!$unsigned(wire2)))) != $unsigned((($unsigned(reg11) ~^ (^~wire4)) ~^ ((!(8'hbb)) ?
          reg10 : {wire5}))));
      reg13 <= reg9[(4'hc):(3'h4)];
    end
  assign wire14 = {$signed({wire0[(4'hb):(2'h2)],
                          $signed(((8'hba) | (8'hb7)))}),
                      $signed($signed((^wire2[(4'ha):(2'h2)])))};
  assign wire15 = (~^reg9);
  assign wire16 = wire15[(3'h5):(1'h0)];
  assign wire17 = (((8'hb7) - (-{(wire15 < wire4)})) < wire4[(1'h1):(1'h0)]);
endmodule
