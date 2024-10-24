module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire11,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ((~^wire0) ?
                     ($unsigned(($unsigned(wire1) ^~ $signed(wire1))) ?
                         $signed({(wire2 ~^ wire0),
                             wire1[(4'hc):(3'h7)]}) : $unsigned(wire0[(1'h1):(1'h1)])) : {($signed(wire1) ?
                             wire1 : wire1[(4'hb):(3'h5)]),
                         wire3});
  assign wire5 = (~($unsigned(($signed(wire1) ?
                     {(8'hab)} : $unsigned(wire2))) >> {$unsigned(wire2[(4'ha):(3'h6)]),
                     wire3[(1'h1):(1'h1)]}));
  always
    @(posedge clk) begin
      reg6 <= $unsigned($signed((wire0[(3'h5):(3'h5)] ?
          $signed($unsigned(wire4)) : {$unsigned(wire2), (wire3 && wire2)})));
      reg7 <= $unsigned(wire3);
      reg8 <= wire2[(4'ha):(3'h7)];
      reg9 <= (|(({wire3, (~^wire0)} ? wire0 : wire2) ?
          {(wire2 ? wire2 : (+reg6)),
              (reg6[(4'h8):(3'h5)] == (8'had))} : ((~&reg6) ?
              $signed($signed((8'hb0))) : (+(wire3 & (8'hb2))))));
      reg10 <= {reg7[(1'h1):(1'h0)]};
    end
  assign wire11 = $signed((((-(wire0 * wire3)) - ((~|wire4) ?
                          {reg10, wire1} : ((7'h44) ? reg7 : reg8))) ?
                      wire5[(2'h3):(1'h1)] : ($signed($signed(wire0)) >> ((reg7 ~^ (8'ha3)) >= (-wire1)))));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire2);
      reg13 <= wire4;
      reg14 <= (!(($signed((8'hac)) >>> wire3[(2'h2):(1'h0)]) ? reg10 : reg10));
      reg15 <= $signed(wire5[(3'h6):(3'h4)]);
      reg16 <= $unsigned($unsigned($unsigned((reg10[(4'h8):(1'h0)] <<< (reg15 ?
          reg15 : reg15)))));
    end
endmodule
