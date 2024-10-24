module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire32,
                 wire26,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (8'h9e);
  assign wire7 = (+$unsigned($unsigned(wire6[(2'h3):(2'h3)])));
  assign wire8 = (~|wire4);
  assign wire9 = wire5;
  always
    @(posedge clk) begin
      reg10 <= wire3;
      reg11 <= $signed($signed(($unsigned({wire2,
          (8'hab)}) ^ wire4[(4'hf):(4'h8)])));
      reg12 <= wire5[(5'h10):(3'h6)];
      reg13 <= (wire9[(2'h2):(2'h2)] < $signed({{(wire6 >>> wire2)},
          $unsigned($unsigned(reg12))}));
    end
  always
    @(posedge clk) begin
      reg14 <= {$signed((({reg10, reg10} ~^ $signed(wire2)) ?
              (&$signed((8'hbe))) : $signed(wire4[(2'h3):(2'h3)])))};
      if ((&({((~wire0) ? (^~wire6) : (wire1 && wire9)),
          ((wire6 & wire1) ?
              $unsigned(wire3) : (wire6 ^~ (8'h9e)))} <<< (&((wire3 ?
          wire5 : (8'haf)) != wire9[(3'h4):(3'h4)])))))
        begin
          reg15 <= (~^$unsigned(wire9));
          reg16 <= ($unsigned(($signed(reg10) ? reg11 : wire6[(1'h0):(1'h0)])) ?
              wire1[(2'h3):(1'h0)] : $unsigned({wire3}));
          if ($unsigned({(({wire5, reg14} ^~ wire6[(3'h6):(3'h4)]) ?
                  wire2 : reg16),
              (7'h42)}))
            begin
              reg17 <= {(((((8'hbf) ?
                          reg14 : (8'hbe)) <= (reg10 + (8'haa))) ^ ($signed(reg16) == {wire4})) ?
                      ($signed((wire3 ? (8'hb1) : wire5)) ?
                          $signed(((8'ha4) - (8'hb5))) : $unsigned($unsigned(reg11))) : ($unsigned((wire8 ?
                              reg11 : wire1)) ?
                          $unsigned($unsigned(reg10)) : reg15))};
            end
          else
            begin
              reg17 <= (~reg14);
            end
          if ((~^{wire1}))
            begin
              reg18 <= reg11[(4'he):(4'hd)];
              reg19 <= $signed($unsigned(((reg12[(1'h0):(1'h0)] && wire3[(1'h1):(1'h1)]) == $unsigned((reg16 ?
                  wire9 : wire6)))));
              reg20 <= {$unsigned((&$unsigned((reg10 ~^ wire1)))), wire9};
              reg21 <= (&(|$signed((~^(reg15 ? reg12 : wire6)))));
              reg22 <= $signed($unsigned((8'h9e)));
            end
          else
            begin
              reg18 <= $signed(wire1);
              reg19 <= ((reg15 - (!({wire3, wire0} ?
                  $unsigned(wire9) : (wire6 ?
                      wire1 : (8'hb3))))) >> (((((7'h42) - reg16) ?
                      $unsigned(reg10) : reg15[(3'h4):(1'h0)]) * reg12) ?
                  ($unsigned((reg13 == wire9)) ?
                      {(~^reg22), (&wire9)} : $signed((reg14 ?
                          wire6 : reg21))) : {(^~reg12),
                      $unsigned($signed((7'h43)))}));
              reg20 <= reg10;
              reg21 <= (8'haf);
              reg22 <= $signed(reg13[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          reg15 <= wire1[(2'h3):(2'h3)];
          reg16 <= (+reg12);
          reg17 <= $unsigned((&((!$signed(wire4)) << $signed(reg18[(3'h4):(2'h3)]))));
        end
      reg23 <= ($unsigned((reg22[(1'h0):(1'h0)] ?
          (-(wire6 || reg10)) : reg11)) - {$unsigned((((8'hac) + wire4) == (~|reg14)))});
      reg24 <= (~&(((8'hba) || ((!reg18) ?
              (wire3 ? reg12 : reg12) : (reg18 ? wire8 : reg16))) ?
          reg14 : ((-$signed(reg12)) ?
              {reg12, $unsigned(wire0)} : wire2[(3'h4):(3'h4)])));
    end
  always
    @(posedge clk) begin
      reg25 <= wire1[(3'h6):(2'h2)];
    end
  assign wire26 = $signed(((8'hb4) ?
                      $signed($signed(((8'hb9) >> wire0))) : (reg15[(1'h0):(1'h0)] ?
                          $unsigned((~^reg10)) : $signed((reg18 <<< reg20)))));
  always
    @(posedge clk) begin
      reg27 <= ((reg19[(3'h7):(1'h1)] >= $signed((^wire6[(1'h1):(1'h1)]))) ^ (-(+((&wire26) ?
          {reg13, (8'ha7)} : $unsigned(reg10)))));
      reg28 <= (({{reg22[(3'h6):(2'h2)], reg12}, reg11[(4'hf):(4'hf)]} ?
          (8'hac) : (($unsigned(reg14) ?
              (wire7 << wire8) : ((8'hb5) & (7'h42))) + $signed((8'hac)))) < wire9);
      if ((!reg11))
        begin
          reg29 <= reg14;
          reg30 <= ((7'h43) && $signed($unsigned(reg24)));
          reg31 <= (8'hb1);
        end
      else
        begin
          reg29 <= ($unsigned({wire1[(1'h1):(1'h1)]}) ?
              ((reg21 > (^~{reg25})) && $unsigned($unsigned((wire0 <= wire6)))) : (~|(reg30[(1'h1):(1'h1)] > $unsigned(wire6))));
          reg30 <= wire1;
          reg31 <= reg31;
        end
    end
  assign wire32 = ($unsigned((&reg15[(1'h1):(1'h0)])) ?
                      ($signed((reg11[(4'hc):(4'h9)] ?
                          $signed(reg15) : $unsigned(wire0))) ~^ (|(^(8'hb7)))) : ((^~{{wire2}}) ?
                          ($unsigned(wire4[(2'h2):(2'h2)]) < $unsigned(reg13)) : $unsigned(wire6)));
endmodule
