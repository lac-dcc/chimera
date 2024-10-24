module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire45;
  assign y = {wire49, wire48, wire47, wire4, wire5, wire45, (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = $signed((~&{($unsigned(wire1) ? (~^wire4) : (wire1 < wire2)),
                     ({(8'hbd), wire1} ?
                         (wire4 | wire0) : ((8'hb9) ^ (7'h40)))}));
  module6 #() modinst46 (wire45, clk, wire0, wire4, wire2, wire1, wire3);
  assign wire47 = ($unsigned($signed($signed((wire45 >> wire0)))) ?
                      wire5[(2'h2):(1'h1)] : (wire5[(4'h8):(3'h5)] ?
                          ($unsigned({wire45}) > (+(wire3 | (8'hac)))) : ($unsigned({(7'h44)}) | $unsigned((wire1 ^ wire3)))));
  assign wire48 = ((|$unsigned({(~&wire47)})) < (wire45 ?
                      ($unsigned($unsigned((8'ha9))) == (^~(&wire2))) : (~|((wire1 < wire45) ?
                          wire45 : wire1))));
  assign wire49 = wire1[(4'h8):(3'h4)];
endmodule

module module6
#(parameter param43 = (((((~(7'h43)) ? (+(8'hab)) : (+(8'ha2))) ? (((8'hab) ? (8'ha4) : (8'ha9)) ? ((8'hb3) < (8'hb8)) : ((7'h44) ? (8'ha2) : (8'hbb))) : {{(8'hb6)}}) + (((~^(8'ha1)) ? ((7'h41) == (8'ha1)) : ((8'hbb) ? (8'ha7) : (8'had))) ? ({(8'ha1)} ? ((7'h44) != (8'hbe)) : {(8'hbd), (8'haf)}) : (7'h40))) ? {(~|(8'haa)), ({((8'hb6) ? (8'h9d) : (8'ha5)), ((7'h44) ? (8'ha9) : (7'h42))} ? (-((8'hb8) ^~ (8'hb9))) : ((8'hbe) >> {(8'ha5), (8'hb8)}))} : (((-((8'h9f) ? (8'h9f) : (7'h43))) <= (^(~^(8'hb4)))) ? {(^((8'hb6) - (8'hb8)))} : (({(8'ha5), (8'ha1)} >>> ((8'haa) >= (8'hb0))) ? ({(8'haf), (8'hb0)} && (~(8'hbe))) : {((8'hb1) ? (8'hb8) : (8'h9f))}))), 
parameter param44 = param43)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (~{$unsigned((~&wire10[(1'h0):(1'h0)]))});
      reg13 <= (~|$signed({(wire9 ? (^wire10) : {wire10, wire7})}));
      if (($signed((((~|reg13) ? $signed((8'hb0)) : ((8'ha4) - (8'ha7))) ?
          {wire8} : (wire9 && (wire9 >> (8'hb0))))) < ($signed($signed($unsigned((8'hb3)))) >> {$unsigned($signed(wire10)),
          reg13[(1'h0):(1'h0)]})))
        begin
          reg14 <= (wire8 || ($signed((8'h9c)) ?
              wire10[(1'h1):(1'h0)] : {{wire8, {(8'hba), (8'hbc)}},
                  ((reg13 ? reg13 : (8'h9c)) <= wire8)}));
        end
      else
        begin
          reg14 <= wire9[(1'h0):(1'h0)];
          reg15 <= $signed($unsigned(($signed($unsigned(reg12)) == $unsigned((reg13 ?
              wire7 : wire9)))));
        end
      if ((~^($signed(($unsigned(reg14) ? {(8'hb2)} : ((8'haf) << wire11))) ?
          ((reg15[(1'h0):(1'h0)] >= reg14[(3'h7):(2'h2)]) != {(wire7 & wire9)}) : $signed(wire11[(2'h3):(2'h2)]))))
        begin
          reg16 <= $unsigned($unsigned(wire11));
          reg17 <= $signed((((!(~&(8'ha0))) ?
                  (^reg12) : $signed(wire7[(2'h2):(1'h1)])) ?
              reg16[(5'h10):(3'h4)] : {wire10}));
        end
      else
        begin
          reg16 <= reg15[(1'h0):(1'h0)];
          reg17 <= (|(wire7[(1'h0):(1'h0)] != $unsigned((!(|reg13)))));
          reg18 <= {($unsigned($signed(wire8)) <<< $unsigned(($signed(reg13) ?
                  (~^reg14) : reg12[(4'ha):(2'h2)]))),
              reg17[(2'h2):(1'h1)]};
          reg19 <= wire7;
          reg20 <= {($unsigned($signed($signed(reg16))) ?
                  ($signed(reg12) >>> $signed(((7'h42) || wire10))) : ((reg14[(3'h6):(1'h1)] * $signed(wire10)) ?
                      {(wire11 ? reg19 : reg14)} : wire9))};
        end
    end
  always
    @(posedge clk) begin
      if ($signed((!($signed(reg16) ? reg14 : wire7))))
        begin
          if ($signed({(|$unsigned(reg19))}))
            begin
              reg21 <= reg12[(3'h7):(1'h1)];
              reg22 <= $unsigned(reg13[(2'h3):(1'h0)]);
              reg23 <= $signed(({(((8'ha7) >= reg21) >> (reg12 & wire10)),
                      $signed((^(8'hbe)))} ?
                  reg19[(3'h7):(2'h2)] : (wire11[(1'h0):(1'h0)] ^ ((wire10 < reg12) ?
                      $signed(wire9) : (~&reg13)))));
              reg24 <= ((|$signed(($unsigned(wire10) * ((8'hb4) != (8'haa))))) ?
                  ($unsigned((|reg19[(4'hb):(2'h3)])) ?
                      wire9[(4'hc):(3'h7)] : $signed(reg19)) : $unsigned((8'hb5)));
            end
          else
            begin
              reg21 <= $signed($unsigned($unsigned($unsigned($unsigned(wire11)))));
              reg22 <= $signed((~($signed({reg21}) ?
                  wire8 : (&$signed(wire10)))));
              reg23 <= {((reg21[(1'h1):(1'h1)] ?
                          ($unsigned(reg19) ?
                              (8'hbe) : (~reg13)) : ((8'ha1) >= reg19)) ?
                      (reg14[(3'h6):(3'h5)] ?
                          $signed(reg15[(2'h3):(2'h3)]) : $unsigned(reg16[(4'ha):(3'h6)])) : (+((reg14 ?
                          wire10 : reg22) && wire9[(4'hc):(4'hb)])))};
              reg24 <= $unsigned(reg20);
            end
          reg25 <= reg15;
          reg26 <= {(8'h9f),
              $unsigned((((wire8 <= (8'h9e)) + $unsigned(reg19)) ?
                  ((^wire9) ?
                      $signed((8'ha0)) : reg17) : (~&reg15[(1'h1):(1'h0)])))};
        end
      else
        begin
          if ((wire7 ?
              (wire11 <<< $signed(wire9[(4'h9):(1'h1)])) : (reg20[(4'h8):(4'h8)] ?
                  {(wire8[(4'hd):(4'h9)] ~^ wire11[(3'h4):(2'h2)])} : reg13)))
            begin
              reg21 <= $unsigned((reg16 ?
                  (~(reg25[(4'ha):(3'h4)] & ((7'h42) * (8'hae)))) : wire9[(4'hf):(4'hf)]));
              reg22 <= (^~reg16[(1'h0):(1'h0)]);
              reg23 <= reg17;
              reg24 <= ($signed((~(&$unsigned(reg25)))) ?
                  (|wire7[(4'h9):(3'h4)]) : $unsigned((reg19[(3'h7):(1'h0)] && $signed(reg18[(1'h0):(1'h0)]))));
              reg25 <= $unsigned(reg18);
            end
          else
            begin
              reg21 <= (wire7 ?
                  ((^~{reg22[(2'h2):(1'h1)], wire9}) ?
                      reg16 : {($signed(reg18) ? wire10 : $signed(wire9)),
                          $signed($unsigned(wire8))}) : ((~|{reg16[(4'hc):(4'hc)]}) ?
                      ({(^reg16)} ? wire8 : reg12) : $unsigned(($signed(wire8) ?
                          (reg12 + (8'haf)) : (reg25 ? wire8 : (8'hbe))))));
              reg22 <= wire7[(4'ha):(4'h9)];
            end
          reg26 <= (((!(8'ha7)) ^ reg21) ^ reg17);
          if (wire11)
            begin
              reg27 <= $unsigned((7'h43));
            end
          else
            begin
              reg27 <= $unsigned(reg26);
              reg28 <= ($signed($unsigned((reg13[(4'hb):(3'h5)] ?
                      reg15 : ((8'hb4) ? wire9 : reg26)))) ?
                  (8'hb0) : (^(reg12 || $unsigned((wire9 ? reg22 : reg22)))));
              reg29 <= reg19[(4'hb):(1'h1)];
            end
          reg30 <= {($signed(((reg18 - (8'hbc)) ?
                      {wire7, reg12} : (wire10 ? reg25 : reg27))) ?
                  $signed(((reg16 < reg24) ?
                      $unsigned((8'hbd)) : $unsigned(reg20))) : ($signed((|reg19)) - $signed($unsigned(wire8))))};
        end
      reg31 <= ({reg21[(1'h0):(1'h0)]} ?
          (reg29[(4'h8):(4'h8)] || $unsigned({(reg15 == reg21),
              wire10[(2'h2):(1'h0)]})) : (!$signed($signed(reg30[(4'hf):(3'h6)]))));
      reg32 <= (&(~(~((wire7 - reg15) ? (^reg14) : {reg21}))));
      reg33 <= (((reg29[(3'h6):(3'h5)] <= (~|$signed(wire8))) || $signed((reg13[(4'h9):(3'h6)] || (reg19 ?
              reg31 : reg12)))) ?
          {$unsigned(($signed(wire7) ?
                  $signed((8'ha0)) : $unsigned(reg21)))} : $unsigned(($unsigned((+reg26)) ?
              ($signed(wire11) & reg17[(4'he):(4'he)]) : reg30[(5'h13):(3'h4)])));
      reg34 <= ((({wire7, reg26[(3'h5):(3'h5)]} ? wire8 : reg29) ?
          $unsigned($unsigned(wire10[(2'h2):(1'h0)])) : (^~reg20[(4'hd):(3'h4)])) > (^(reg18 > reg16)));
    end
  always
    @(posedge clk) begin
      reg35 <= $signed((-reg12[(5'h12):(3'h7)]));
    end
  assign wire36 = reg23[(1'h1):(1'h1)];
  assign wire37 = ((^(&(^{reg18, reg18}))) ?
                      (reg35 ?
                          $unsigned((~^(^~reg24))) : (reg12[(4'hb):(4'h9)] - {$unsigned(wire36),
                              reg16})) : (+reg15[(2'h2):(1'h1)]));
  assign wire38 = $unsigned($signed((^(8'hb1))));
  assign wire39 = reg23[(4'h8):(3'h4)];
  assign wire40 = $unsigned((|reg24[(4'hb):(3'h4)]));
  assign wire41 = ((({$unsigned(wire37),
                              wire40[(1'h1):(1'h1)]} && reg21[(3'h4):(2'h2)]) ?
                          (|(~|wire9[(4'hf):(1'h1)])) : $unsigned((reg28[(1'h1):(1'h1)] != (8'hb6)))) ?
                      (|($unsigned(reg18) <= {$unsigned(reg30)})) : reg12);
  assign wire42 = $unsigned(reg22[(2'h2):(2'h2)]);
endmodule
