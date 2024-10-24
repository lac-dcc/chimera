module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg26,
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
  assign wire5 = (!wire0);
  assign wire6 = ($signed(wire5) > (^~(|wire2)));
  assign wire7 = (((~&{{wire6, wire0},
                     $signed(wire3)}) && $unsigned(wire5[(3'h6):(3'h4)])) ~^ (^(wire5[(5'h11):(3'h7)] <<< wire3[(4'ha):(4'h9)])));
  assign wire8 = $unsigned(wire3[(2'h2):(1'h0)]);
  assign wire9 = (wire6[(4'hb):(4'hb)] ?
                     wire8[(4'he):(3'h4)] : wire5[(5'h12):(4'he)]);
  always
    @(posedge clk) begin
      if ($unsigned((~&(($signed(wire0) + wire3[(2'h3):(2'h3)]) >> (!wire3[(3'h7):(3'h7)])))))
        begin
          reg10 <= (wire4[(1'h0):(1'h0)] | $signed($signed({(+wire6),
              wire2[(4'hc):(3'h6)]})));
          reg11 <= $signed((^~(!wire4)));
          reg12 <= {{{wire2[(3'h5):(1'h0)], $signed($unsigned(reg10))}},
              (-(($signed((8'hae)) && $unsigned(wire8)) != wire8))};
          if ((~|({$unsigned((wire6 ? wire9 : wire2)),
              wire4} ~^ wire2[(4'hf):(4'ha)])))
            begin
              reg13 <= (wire7[(3'h4):(2'h2)] ?
                  ((^~$unsigned((wire6 - reg11))) * $signed($unsigned($unsigned(wire7)))) : ($signed(($signed(wire6) ?
                      reg12[(1'h1):(1'h1)] : (~^wire0))) <<< wire0));
              reg14 <= (^((-{wire9[(4'h9):(3'h5)],
                  $signed(wire7)}) || {{(reg13 < reg13)}}));
              reg15 <= wire0[(3'h4):(2'h3)];
              reg16 <= $signed($signed($unsigned({reg10[(3'h7):(3'h4)],
                  ((7'h43) * (8'hb5))})));
              reg17 <= wire2[(4'hc):(2'h3)];
            end
          else
            begin
              reg13 <= $signed((reg11[(2'h2):(2'h2)] ?
                  $signed(($signed(wire9) ?
                      ((7'h41) ?
                          reg11 : (8'hb7)) : (wire5 ^~ (8'hb6)))) : $unsigned($unsigned(reg14[(3'h7):(2'h2)]))));
            end
        end
      else
        begin
          reg10 <= ((-(reg17 ?
                  (wire9[(5'h14):(4'hf)] ?
                      $signed(wire1) : wire8[(3'h4):(1'h0)]) : (wire6[(2'h2):(1'h1)] ?
                      $unsigned(reg10) : (reg16 ? wire4 : (8'hbf))))) ?
              reg15 : $signed((({wire5} <= (wire6 ? reg16 : wire4)) ?
                  ((reg17 >> reg11) ? {(8'ha8)} : (wire0 || reg10)) : ((wire9 ?
                          wire1 : (8'hb2)) ?
                      (wire7 ? wire9 : reg13) : (^reg12)))));
          if ($unsigned(wire0[(2'h2):(2'h2)]))
            begin
              reg11 <= reg13;
              reg12 <= $signed((($signed(reg12) ?
                      reg16 : (~&wire9[(4'hd):(4'hd)])) ?
                  $unsigned((8'hb7)) : ((+(+wire5)) < $signed($unsigned(reg17)))));
              reg13 <= ($signed(((8'hbb) ?
                  (~&(wire2 & reg14)) : reg17[(3'h6):(3'h5)])) > ($signed(((wire8 ?
                      reg17 : reg11) << {reg13, wire4})) ?
                  (^~reg15) : $unsigned($signed(wire2[(3'h4):(3'h4)]))));
              reg14 <= $unsigned((+reg10[(2'h2):(2'h2)]));
              reg15 <= (((!$unsigned($unsigned(wire9))) ?
                  {$signed(reg16)} : (~((wire0 ~^ wire3) ^ (wire2 ?
                      reg17 : wire6)))) != $signed((~^(^(^wire8)))));
            end
          else
            begin
              reg11 <= ((~|reg11[(1'h0):(1'h0)]) && $signed($signed((&(wire4 * (8'hbd))))));
              reg12 <= ($signed($unsigned((+(reg12 | reg12)))) >>> $unsigned($signed(({reg13,
                  wire9} <= wire4))));
              reg13 <= ($signed((|((wire0 ?
                  reg15 : wire9) ^ $unsigned(reg16)))) > ((~&($unsigned((8'h9e)) != reg13)) >>> wire8[(3'h5):(3'h5)]));
            end
        end
      reg18 <= reg11[(2'h3):(2'h3)];
      if (((|wire0[(3'h5):(2'h2)]) ^ {reg12[(3'h5):(2'h3)],
          $signed({wire9, (reg14 * reg16)})}))
        begin
          if (($unsigned(reg10[(1'h1):(1'h0)]) + $unsigned($unsigned($signed($unsigned(wire1))))))
            begin
              reg19 <= $unsigned($signed($unsigned($signed($unsigned(wire0)))));
            end
          else
            begin
              reg19 <= reg10;
            end
          reg20 <= $unsigned(reg19[(2'h3):(1'h1)]);
        end
      else
        begin
          reg19 <= wire6;
          reg20 <= wire6[(3'h6):(3'h4)];
          reg21 <= (8'ha3);
          reg22 <= (~^reg11[(3'h5):(2'h2)]);
        end
      if ($signed((($signed((reg18 ? wire4 : reg12)) >> ({reg15} ?
          $signed(reg12) : reg10[(1'h1):(1'h1)])) >>> (reg15[(5'h13):(2'h2)] ?
          reg17[(3'h7):(3'h5)] : ((wire4 ? reg19 : reg19) ?
              $signed(wire5) : (wire7 || reg14))))))
        begin
          reg23 <= (^($unsigned(reg21) >= ($unsigned((reg22 ?
              reg20 : wire2)) ^~ wire9[(4'hf):(4'h8)])));
          reg24 <= $signed((~^{({reg19, (8'hb9)} ?
                  reg19[(1'h0):(1'h0)] : $unsigned(reg22))}));
        end
      else
        begin
          if ($signed(((!$unsigned({reg13})) ?
              ($unsigned(wire3[(3'h5):(3'h4)]) > $unsigned((reg11 ?
                  wire4 : (8'hb8)))) : reg24)))
            begin
              reg23 <= $signed(reg18);
              reg24 <= wire4[(2'h2):(2'h2)];
            end
          else
            begin
              reg23 <= (((~wire2) ?
                  $signed((((8'hbf) ?
                      reg18 : (8'ha8)) ^ (+reg16))) : $signed($signed(wire8[(4'ha):(2'h3)]))) + wire3);
              reg24 <= $unsigned((wire7 ?
                  wire5 : ({((8'h9e) ? wire9 : wire8), $unsigned(reg15)} ?
                      $signed((reg19 ?
                          wire4 : reg24)) : $signed($unsigned(wire6)))));
            end
          reg25 <= ((+$unsigned(reg22[(4'he):(4'he)])) > (wire2[(5'h10):(4'hf)] || ($unsigned((reg21 ?
              (8'haa) : (8'hbc))) ~^ (reg23[(2'h2):(1'h1)] ~^ $signed(reg23)))));
        end
      reg26 <= (~&($unsigned($unsigned($signed((8'hbe)))) ^ $unsigned(reg16)));
    end
  assign wire27 = ((wire0 != $signed({(^~reg22), ((8'hb7) + (8'ha9))})) ?
                      $signed((&($unsigned(wire4) > wire8))) : $signed(((reg16 ?
                          $unsigned(reg19) : $signed(reg14)) && (wire6[(2'h2):(1'h1)] == (+wire0)))));
  assign wire28 = (((8'hb0) ? (~&(~(8'ha9))) : $unsigned(reg26)) ?
                      $signed($signed(wire1[(3'h7):(1'h1)])) : $unsigned((((~|reg14) ?
                          reg26 : (!wire8)) + reg21)));
  assign wire29 = (reg18[(3'h5):(1'h0)] == {(reg17 ?
                          $signed((reg10 >>> reg20)) : $signed(reg14)),
                      $signed(((reg22 ? (8'ha6) : reg17) ?
                          (wire1 >= reg19) : (|reg14)))});
  assign wire30 = reg15;
endmodule
