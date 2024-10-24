module top
#(parameter param127 = {(~|((((8'hb6) ? (7'h40) : (8'h9d)) >> ((8'ha1) - (8'hb7))) ~^ (((7'h41) ? (8'ha1) : (8'h9d)) ? {(7'h40), (8'h9d)} : (^~(8'hb4))))), ((((&(8'hb8)) >> (8'hbb)) ? ((8'ha8) == (~&(8'hbe))) : ({(8'hba)} ? (~(8'hb3)) : ((8'hbd) <= (8'ha5)))) ^ (({(8'hb3), (7'h42)} >> (~^(8'ha5))) + (((8'hbd) ? (8'hb6) : (8'hb2)) ? ((8'hb8) >> (8'had)) : ((7'h40) <<< (8'ha1)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  assign y = {wire126,
                 wire113,
                 wire55,
                 wire54,
                 wire52,
                 wire32,
                 wire28,
                 wire27,
                 wire21,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg29,
                 reg30,
                 reg31,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg53,
                 (1'h0)};
  assign wire5 = (&{{((wire3 ? wire1 : wire1) ?
                             $unsigned(wire2) : $unsigned(wire3))}});
  assign wire6 = wire3[(3'h5):(2'h2)];
  assign wire7 = ($unsigned(((wire0 ? $signed(wire3) : (wire6 ^ wire0)) ?
                         ($signed(wire3) >> wire3[(3'h6):(3'h6)]) : $unsigned($signed(wire6)))) ?
                     $signed(wire5) : ($signed(wire3[(4'hc):(4'hc)]) ?
                         (wire3 ?
                             wire6 : (wire6 ?
                                 (~wire4) : wire0[(4'h8):(3'h7)])) : wire6[(3'h6):(1'h1)]));
  assign wire8 = $unsigned($signed(wire1));
  assign wire9 = {wire5};
  assign wire10 = wire4;
  assign wire11 = wire7;
  always
    @(posedge clk) begin
      reg12 <= wire0;
      if ({$unsigned(wire6[(2'h2):(1'h0)]),
          $unsigned((~^($unsigned(wire8) || (^wire9))))})
        begin
          if ((wire5 ?
              {(((wire5 + wire1) ?
                          wire4[(3'h4):(2'h2)] : (wire6 ? wire6 : wire7)) ?
                      $signed(wire3[(4'hc):(3'h7)]) : wire10[(2'h3):(2'h3)]),
                  ({$unsigned(wire3)} <= (wire4[(2'h3):(2'h2)] + wire2))} : (((wire11[(4'ha):(3'h7)] ?
                      (~|wire10) : $unsigned(wire11)) == wire3) ?
                  ($signed($unsigned(reg12)) ?
                      (~|(wire9 & wire6)) : $signed(((8'hae) ?
                          wire6 : wire8))) : {$unsigned((wire4 != wire7))})))
            begin
              reg13 <= $unsigned($signed((wire7[(4'h8):(1'h1)] - (wire9 ?
                  $signed(wire9) : (~&wire11)))));
              reg14 <= $unsigned(wire11[(1'h1):(1'h1)]);
              reg15 <= $signed({wire7[(5'h10):(2'h3)]});
              reg16 <= $unsigned({(wire7[(5'h11):(3'h4)] <<< ((reg12 ?
                      wire11 : reg13) | (~^reg14))),
                  $signed((^~(wire5 >> reg14)))});
              reg17 <= ({wire11, (~(~|wire11))} >>> wire2);
            end
          else
            begin
              reg13 <= wire2[(4'h9):(2'h3)];
              reg14 <= ($unsigned(reg12[(3'h4):(1'h0)]) * $signed(wire5));
              reg15 <= (8'hbb);
              reg16 <= (!($unsigned(wire9[(4'hc):(2'h3)]) << (~((~|wire7) >= $signed(wire3)))));
              reg17 <= $signed(reg15[(3'h4):(2'h2)]);
            end
          reg18 <= wire11;
          reg19 <= ($unsigned((!$unsigned((^~reg15)))) ?
              wire9[(1'h1):(1'h0)] : ($signed({(^~wire9),
                  (8'hb7)}) && wire0[(5'h12):(4'hc)]));
          reg20 <= ((~|wire3) <= ((wire4[(3'h4):(3'h4)] - $signed(wire7[(4'h9):(3'h7)])) == (!((-wire7) + (8'h9e)))));
        end
      else
        begin
          reg13 <= (wire5 >>> reg19);
          reg14 <= (((+(8'hbc)) >> $signed((wire7 & wire1[(2'h2):(2'h2)]))) * $signed((!(wire9 ?
              wire3 : (wire3 ? wire10 : wire6)))));
          reg15 <= wire2;
          if ($unsigned(wire5))
            begin
              reg16 <= $unsigned(wire1[(3'h4):(2'h2)]);
              reg17 <= $signed(wire5);
            end
          else
            begin
              reg16 <= $signed($signed((((&wire6) != (reg18 >> wire10)) >= {(wire0 ?
                      reg12 : wire9)})));
              reg17 <= $unsigned((wire9[(1'h0):(1'h0)] <= ((reg19[(4'hd):(2'h2)] ?
                  reg16 : ((8'h9d) >= reg16)) - wire1)));
            end
          if (wire8)
            begin
              reg18 <= ($unsigned(($signed((^wire11)) < {{wire11, reg17},
                  $signed((8'had))})) == $unsigned(((~&reg12[(3'h5):(3'h4)]) ?
                  ((+wire10) ?
                      {wire0} : $signed(wire8)) : (wire4 + $signed(reg15)))));
              reg19 <= wire4;
              reg20 <= reg14;
            end
          else
            begin
              reg18 <= reg13[(4'hd):(4'ha)];
              reg19 <= reg18[(4'h9):(1'h1)];
            end
        end
    end
  assign wire21 = wire0[(5'h10):(5'h10)];
  always
    @(posedge clk) begin
      reg22 <= wire9;
      if ((wire8[(2'h3):(2'h3)] ? {(8'ha3)} : $unsigned(wire2[(4'h8):(3'h4)])))
        begin
          reg23 <= $signed(reg16[(1'h0):(1'h0)]);
          if (({(~^(8'ha0))} >>> (~reg14[(2'h2):(2'h2)])))
            begin
              reg24 <= reg13[(3'h7):(3'h4)];
            end
          else
            begin
              reg24 <= $unsigned($signed((wire10 << $signed($signed(reg14)))));
            end
          reg25 <= {($signed((^~(wire5 ?
                  wire0 : reg23))) != $signed(reg12[(3'h4):(3'h4)]))};
          reg26 <= reg18;
        end
      else
        begin
          reg23 <= ((reg25[(1'h0):(1'h0)] * (!((^~reg26) ^~ $unsigned((7'h43))))) ?
              $signed({$unsigned(wire9),
                  ($unsigned(reg22) ?
                      (reg14 ^~ reg23) : {(8'ha3),
                          wire8})}) : $signed($signed(((!reg16) << $unsigned(wire1)))));
          reg24 <= $unsigned({$unsigned(((wire0 ? reg24 : reg24) ?
                  (^reg14) : reg12))});
          reg25 <= $unsigned({(((reg26 - reg16) ?
                  (wire0 & reg17) : {wire9,
                      (8'hb3)}) >> ($signed((8'h9c)) | ((8'h9e) | reg13)))});
          reg26 <= ((8'hac) ?
              {$signed(reg15[(3'h7):(3'h5)])} : $unsigned((~&{(&wire5)})));
        end
    end
  assign wire27 = (((($unsigned(reg20) ?
                          reg18 : (~&(8'ha6))) < $unsigned((reg19 ?
                          (8'ha9) : wire4))) ?
                      {(((8'hb9) ? wire21 : reg17) ?
                              $unsigned(wire10) : $signed(reg15)),
                          (reg17 ?
                              (^reg14) : wire3)} : ($signed((wire7 == wire9)) ?
                          (^~(wire1 ?
                              wire9 : reg22)) : wire11[(4'hb):(3'h5)])) != $unsigned(reg12[(3'h5):(1'h1)]));
  assign wire28 = $unsigned({($unsigned(reg20[(3'h5):(3'h4)]) ?
                          wire7 : $unsigned(wire27[(4'ha):(4'h9)]))});
  always
    @(posedge clk) begin
      reg29 <= (~&($signed(((wire10 ? reg15 : reg22) != $signed((8'h9d)))) ?
          {(^~(+wire3))} : reg25[(1'h0):(1'h0)]));
      reg30 <= (wire6 != ($signed(wire8[(2'h2):(1'h0)]) ?
          reg23 : ($signed((wire11 >>> reg12)) ?
              wire10 : {reg23, reg18[(3'h4):(1'h1)]})));
      reg31 <= $signed((reg24[(4'hf):(3'h4)] ?
          (wire0 ? $unsigned((~wire3)) : {(wire3 >= reg30)}) : reg30));
    end
  assign wire32 = {wire1[(1'h0):(1'h0)],
                      $signed((reg14[(2'h2):(1'h1)] ?
                          ($signed((8'hbf)) ?
                              wire8 : (reg12 & reg12)) : $signed($signed(wire2))))};
  always
    @(posedge clk) begin
      reg33 <= $unsigned((8'hac));
      reg34 <= $signed($signed(reg24));
      reg35 <= $unsigned({$unsigned(wire4)});
      if (($unsigned($signed(reg29[(2'h3):(2'h3)])) ?
          wire3[(4'he):(1'h1)] : $unsigned(reg35)))
        begin
          reg36 <= reg19[(4'ha):(3'h5)];
          if (reg34)
            begin
              reg37 <= $signed(wire11);
              reg38 <= (^~{({wire4[(2'h2):(1'h1)], $unsigned(wire28)} ?
                      {{reg34}, (reg22 >>> reg35)} : (!$signed(wire0)))});
              reg39 <= (+(+wire21));
            end
          else
            begin
              reg37 <= $signed((~^$unsigned(((-reg24) || $signed(reg19)))));
              reg38 <= $signed(($signed(reg33) > ({wire0} < (reg22 ?
                  (&reg22) : (~wire21)))));
              reg39 <= {reg19};
              reg40 <= $unsigned((reg25 ?
                  (reg19 ? reg35 : $unsigned((8'ha1))) : {$unsigned(wire9),
                      ({wire2, wire4} ? (7'h44) : (~^reg25))}));
            end
          if (((~|(($signed((8'hb2)) && wire0) != ($signed(reg40) & wire2))) ^ $unsigned($signed((wire0 ?
              (8'hb3) : (~wire28))))))
            begin
              reg41 <= ($signed((($unsigned((8'hbf)) >= $unsigned(reg26)) ?
                  (~|(8'hb1)) : $signed((!wire21)))) ^~ reg33);
              reg42 <= reg41;
              reg43 <= (wire21[(4'hf):(1'h0)] ?
                  $signed(wire3) : $unsigned(reg17[(4'hd):(3'h6)]));
              reg44 <= reg31;
              reg45 <= (!$unsigned($signed(((reg20 * reg29) >>> (reg38 ?
                  (8'hbe) : wire32)))));
            end
          else
            begin
              reg41 <= (^~$signed(wire6[(4'hb):(3'h6)]));
              reg42 <= ((reg35 ?
                  $signed(reg30) : $unsigned((reg17 || {wire28,
                      wire3}))) >= (^$signed((reg30[(2'h2):(1'h1)] ?
                  (reg40 ? (8'hb6) : reg17) : reg35[(2'h3):(2'h3)]))));
              reg43 <= reg18;
              reg44 <= (-$signed((+reg19[(3'h7):(3'h7)])));
              reg45 <= ((^$unsigned(wire9[(1'h1):(1'h0)])) || $signed(reg33));
            end
          if ($unsigned((reg24[(4'hd):(3'h6)] ^~ $unsigned((^$signed(reg20))))))
            begin
              reg46 <= wire21[(2'h2):(2'h2)];
            end
          else
            begin
              reg46 <= reg18[(3'h7):(1'h0)];
              reg47 <= $signed($unsigned((wire11[(4'ha):(3'h7)] ~^ wire3[(4'hd):(2'h2)])));
              reg48 <= reg34;
              reg49 <= reg24;
              reg50 <= {($signed((wire7 ? reg43[(1'h0):(1'h0)] : reg45)) ?
                      (8'ha4) : reg12),
                  (^~wire21)};
            end
          reg51 <= reg14[(3'h5):(1'h1)];
        end
      else
        begin
          reg36 <= $unsigned(($signed($unsigned(wire21)) ^~ (|$unsigned($unsigned(reg30)))));
          reg37 <= $signed((($signed($signed(reg33)) ?
                  ($signed((8'had)) >= $signed(wire28)) : $unsigned((reg20 && wire9))) ?
              (reg38 ^ $signed((wire1 >>> reg12))) : wire3));
          if (reg48[(2'h3):(1'h1)])
            begin
              reg38 <= (^~({reg50[(3'h6):(1'h0)]} >>> {(^~reg49[(2'h3):(1'h1)]),
                  ((~^wire28) < reg22[(3'h7):(3'h7)])}));
              reg39 <= (~(-((!(wire3 != reg46)) ?
                  reg23[(4'hd):(4'h9)] : $signed({(8'hb9), wire7}))));
              reg40 <= (~&reg36);
              reg41 <= $unsigned(((~|reg23) * $signed(wire6)));
              reg42 <= $signed((reg47[(4'hc):(4'h9)] ?
                  $unsigned(reg33) : ($signed((reg30 > wire11)) ?
                      $signed($signed(wire8)) : {$signed(reg44)})));
            end
          else
            begin
              reg38 <= (~&((~(reg19 ~^ (wire7 + wire9))) || reg44[(4'he):(4'hc)]));
              reg39 <= reg12;
              reg40 <= reg26[(3'h7):(3'h7)];
              reg41 <= ((8'hb6) <<< reg34);
            end
          reg43 <= ($unsigned(reg16) ?
              $unsigned(reg43) : (~&reg23[(4'hc):(3'h6)]));
          if ((8'h9c))
            begin
              reg44 <= (&wire7[(5'h12):(3'h5)]);
              reg45 <= $signed(($signed((^reg42)) ?
                  $unsigned(reg29) : wire7[(3'h6):(1'h1)]));
              reg46 <= (($unsigned(($signed((8'ha2)) < {reg12})) & ($unsigned((reg15 || reg45)) || (reg45[(4'he):(3'h4)] <<< (wire32 << (8'hb7))))) ?
                  (^(|(reg19 ?
                      ((8'ha2) <<< reg50) : (wire6 + (8'hbb))))) : {$unsigned($signed((reg25 ?
                          wire7 : reg31))),
                      $unsigned((|reg29))});
            end
          else
            begin
              reg44 <= $unsigned($signed({reg20[(2'h2):(2'h2)]}));
              reg45 <= (~^$unsigned((&reg45[(1'h1):(1'h0)])));
              reg46 <= reg37;
            end
        end
    end
  assign wire52 = (-(~wire7[(5'h10):(5'h10)]));
  always
    @(posedge clk) begin
      reg53 <= (reg15 || (8'haa));
    end
  assign wire54 = (~({reg19} | wire0[(4'h9):(2'h2)]));
  assign wire55 = reg14[(2'h2):(2'h2)];
  module56 #() modinst114 (wire113, clk, reg38, wire52, reg42, reg18, wire2);
  always
    @(posedge clk) begin
      reg115 <= ((reg20[(1'h1):(1'h1)] ?
              reg29[(2'h2):(1'h0)] : (|$signed($unsigned((8'hab))))) ?
          $signed(reg14) : (~^(reg38 ?
              reg38[(4'h8):(1'h1)] : wire28[(3'h7):(2'h2)])));
      reg116 <= (&(-(({reg25} ? (|reg53) : (wire2 ? reg31 : (8'hb2))) ?
          wire52 : (reg20 >> (wire4 ? wire32 : reg44)))));
      if (((($signed(reg14[(2'h3):(2'h3)]) | (!(~reg29))) ?
              (((~&wire3) ? reg23 : (wire4 >> reg24)) ?
                  wire1 : {$signed(reg115), wire3}) : reg34) ?
          wire11 : (reg17 | ((~|(&reg20)) >= ({reg49} ? wire2 : (~|wire10))))))
        begin
          if ($unsigned((reg51[(1'h0):(1'h0)] >= $unsigned(((wire54 ?
              reg49 : reg16) ^~ $signed(reg116))))))
            begin
              reg117 <= (7'h41);
              reg118 <= {$unsigned($unsigned(wire113)), reg49};
              reg119 <= reg117;
              reg120 <= $signed((reg48 ?
                  (wire2 ?
                      (wire8 ?
                          (reg19 < (7'h43)) : (reg119 ?
                              (8'ha1) : (8'ha8))) : reg48[(4'hc):(4'h8)]) : ((reg22[(4'hd):(3'h7)] | (reg38 <= reg16)) >> (&wire3[(4'ha):(3'h5)]))));
            end
          else
            begin
              reg117 <= (&reg116);
              reg118 <= wire7;
              reg119 <= $signed($signed(((-$signed(wire7)) <= (|{(8'hae)}))));
            end
          if (((^(^~wire32[(3'h4):(2'h2)])) * reg115))
            begin
              reg121 <= ({($signed($unsigned((8'h9e))) < reg16)} && (($unsigned($signed(reg117)) ?
                  reg29[(3'h4):(1'h0)] : wire8[(2'h2):(2'h2)]) * ({(reg120 > reg49),
                  wire27} > $unsigned($signed((7'h44))))));
              reg122 <= wire3[(4'hd):(2'h3)];
              reg123 <= (|(~&$signed((~&reg116[(4'h8):(4'h8)]))));
              reg124 <= {wire1[(3'h5):(3'h4)], $signed(reg40[(1'h1):(1'h1)])};
            end
          else
            begin
              reg121 <= $unsigned(reg123);
              reg122 <= ($unsigned((~reg50[(1'h0):(1'h0)])) | reg22[(1'h1):(1'h1)]);
              reg123 <= wire6;
              reg124 <= $unsigned(reg44[(3'h4):(1'h0)]);
              reg125 <= ((~&((-(&reg39)) ?
                      {$signed(wire3)} : reg44[(2'h3):(2'h3)])) ?
                  ((~|($signed(reg33) ? {reg20} : {reg24})) ?
                      $signed($unsigned($signed(wire6))) : reg41[(2'h2):(1'h0)]) : (reg51 | wire28));
            end
        end
      else
        begin
          reg117 <= wire6[(4'hb):(4'h8)];
          if ($unsigned((^~(|((^reg44) * (wire52 != (8'ha5)))))))
            begin
              reg118 <= {{wire6,
                      ((reg17 ? {wire8} : (8'hac)) ?
                          (|(!(8'haf))) : $unsigned({reg26, reg24}))},
                  $signed(($unsigned((!reg48)) ?
                      wire11 : {$signed(reg29), (reg125 ? reg120 : reg24)}))};
              reg119 <= (^reg12);
            end
          else
            begin
              reg118 <= (8'ha5);
            end
          if (wire113)
            begin
              reg120 <= (8'h9c);
              reg121 <= reg36;
            end
          else
            begin
              reg120 <= (^~reg43[(4'h8):(3'h4)]);
              reg121 <= (reg34 ?
                  ($unsigned(reg23) * reg43) : $unsigned($signed($signed($unsigned(reg33)))));
              reg122 <= {{reg42}, reg13};
              reg123 <= (wire7[(1'h0):(1'h0)] && $signed({(|$signed(reg30)),
                  ((~&wire28) << reg33[(4'h9):(3'h6)])}));
            end
        end
    end
  assign wire126 = $unsigned(((7'h40) ^ $signed({(&(8'hb2))})));
endmodule

module module56
#(parameter param111 = (|(((((8'hbd) ? (8'ha5) : (8'ha8)) && (&(8'ha3))) ? {((8'h9c) << (8'ha0)), (+(8'hab))} : ((!(8'hb3)) ? ((8'hbc) <= (8'h9d)) : (|(8'ha0)))) ? {(~|(~&(8'ha6))), (((8'hbd) ? (8'hb6) : (8'hbe)) ? ((8'ha6) ? (8'ha7) : (8'ha7)) : (~^(8'hb1)))} : (8'ha6))), 
parameter param112 = (~|((~((!param111) ? (param111 | param111) : param111)) > (~^(~(param111 ? param111 : (8'hb0)))))))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire signed [(4'hb):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(4'hd):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire62;
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire107,
                 wire82,
                 wire62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 (1'h0)};
  assign wire62 = $unsigned(wire60[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire60)
        begin
          reg63 <= wire58[(4'h8):(2'h3)];
          reg64 <= $unsigned((8'ha6));
          reg65 <= ($signed($unsigned(wire61[(2'h3):(1'h0)])) ?
              ((reg63 ? (~&(!wire62)) : $signed(wire60)) && (^~{{(8'h9f)},
                  (+wire57)})) : $signed($unsigned($signed($unsigned(wire62)))));
          reg66 <= ($unsigned(reg63) ?
              {({$signed(wire60)} >= wire62),
                  $signed(wire61[(1'h1):(1'h0)])} : {$signed(((reg65 ?
                      (8'h9f) : wire57) || (~^wire62)))});
          reg67 <= (8'hb1);
        end
      else
        begin
          reg63 <= (wire62[(3'h5):(1'h1)] ?
              $signed((^~reg64[(4'hd):(2'h2)])) : wire58);
          reg64 <= wire61;
          reg65 <= (~^reg66);
        end
      reg68 <= $unsigned(wire62);
      if ($signed($signed((~^(8'haf)))))
        begin
          if (reg68[(3'h4):(1'h1)])
            begin
              reg69 <= (7'h43);
            end
          else
            begin
              reg69 <= wire61[(3'h4):(2'h2)];
              reg70 <= reg64;
              reg71 <= $signed((wire57[(1'h1):(1'h0)] == reg65[(3'h6):(3'h6)]));
              reg72 <= (~&wire61[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg69 <= (reg65 & $unsigned((~^((~wire58) ^~ reg69))));
        end
      if ({(($signed(reg70[(3'h5):(2'h3)]) ?
                  (~&$signed(wire60)) : $unsigned({wire58})) ?
              (8'ha1) : $signed((~|{reg64}))),
          ($unsigned($signed(reg68)) - (reg66 ^ $unsigned($unsigned(wire61))))})
        begin
          reg73 <= ((^~wire59[(3'h4):(1'h0)]) > reg71);
        end
      else
        begin
          reg73 <= reg68[(2'h3):(1'h0)];
          if (reg70)
            begin
              reg74 <= ((reg73 >>> $unsigned($unsigned(reg68))) ?
                  (($unsigned(reg63[(1'h1):(1'h1)]) ^~ $signed((reg69 == wire60))) ?
                      wire60[(3'h7):(2'h3)] : wire61) : $signed(reg65));
              reg75 <= (wire58[(4'hb):(2'h2)] <<< ((((wire60 ?
                          (8'h9f) : (8'ha8)) << {wire62}) ?
                      ((reg64 ? wire61 : reg72) ?
                          {reg72, reg68} : $unsigned(reg63)) : reg72) ?
                  (&reg67) : $signed(($unsigned(wire57) + $signed(reg68)))));
            end
          else
            begin
              reg74 <= (8'hb1);
              reg75 <= wire61;
              reg76 <= ({$unsigned($signed((reg69 ? reg74 : reg63)))} ?
                  reg66 : $unsigned((~&($signed(reg75) ?
                      {wire62, wire57} : ((8'h9f) ? wire57 : wire57)))));
              reg77 <= wire61[(2'h2):(2'h2)];
              reg78 <= $unsigned((-(($signed(reg71) ?
                  (8'ha3) : $signed(wire62)) >>> (-(reg68 == (7'h44))))));
            end
          reg79 <= reg78;
          reg80 <= reg78;
        end
      reg81 <= ((((8'ha7) ? {(|reg65)} : (+(8'h9f))) ?
              $unsigned({$signed(reg63),
                  $signed(wire60)}) : $signed((~&$unsigned(reg64)))) ?
          $signed({reg69}) : (((!wire60) ^~ {$unsigned(reg69)}) + ({(wire59 >> (8'hbf)),
              reg69} * (~|$unsigned(reg65)))));
    end
  assign wire82 = reg77;
  module83 #() modinst108 (.wire88(reg78), .wire86(wire57), .wire85(wire60), .wire84(reg75), .clk(clk), .y(wire107), .wire87(reg71));
  assign wire109 = (reg63[(4'h9):(3'h4)] ?
                       (~^({(+reg78)} ?
                           reg81 : (wire107 || (reg80 || wire62)))) : (($unsigned(wire60[(4'h8):(3'h5)]) ~^ (8'hbe)) ^ {$signed({reg73,
                               (8'hb5)}),
                           wire61}));
  assign wire110 = $signed(reg81[(3'h5):(2'h2)]);
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire [(4'hb):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire102;
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= $unsigned((~^(~^(-wire85[(3'h5):(3'h4)]))));
      if ($signed($unsigned($signed(wire86[(1'h1):(1'h1)]))))
        begin
          reg90 <= (+($unsigned(wire87[(4'h9):(2'h2)]) ^ (8'ha0)));
          reg91 <= ({(~&wire86[(4'hf):(4'hd)])} >>> $signed((!$signed($unsigned((8'hae))))));
          if ((-(8'ha5)))
            begin
              reg92 <= (((~^(8'ha4)) <= $signed({(^~(8'haa)), wire86})) ?
                  (~&$unsigned($signed($unsigned(wire88)))) : wire84[(1'h0):(1'h0)]);
              reg93 <= ({({$signed(wire86)} ?
                      (!wire85) : {$unsigned(wire85),
                          (wire87 < wire84)})} && $signed(reg92[(3'h6):(1'h1)]));
              reg94 <= ($unsigned($signed((wire87[(3'h7):(3'h5)] >= (reg93 > wire85)))) >>> (^reg89));
            end
          else
            begin
              reg92 <= reg91[(3'h5):(3'h5)];
              reg93 <= $unsigned((7'h44));
              reg94 <= (8'hb4);
              reg95 <= (reg92[(3'h6):(3'h6)] ?
                  ((7'h42) != $signed($unsigned((&wire85)))) : reg90);
              reg96 <= $signed(wire88[(3'h4):(2'h3)]);
            end
          reg97 <= $signed((reg94 ^ $unsigned(((^~reg91) != $signed(wire86)))));
        end
      else
        begin
          reg90 <= (+$signed(reg90[(4'hf):(1'h1)]));
          if (((wire85[(2'h3):(1'h1)] >>> $signed((~^$unsigned((8'hb6))))) >>> {(~reg94)}))
            begin
              reg91 <= (wire87[(3'h5):(1'h0)] ^ $signed($unsigned((8'hae))));
              reg92 <= (wire86[(4'he):(4'hc)] ? $signed(reg95) : wire88);
            end
          else
            begin
              reg91 <= ({{reg95, wire88[(2'h3):(1'h0)]}} != (8'hbe));
              reg92 <= reg97[(3'h7):(3'h6)];
            end
        end
      if ($signed($unsigned({wire84[(4'h8):(1'h1)]})))
        begin
          reg98 <= (~(|((reg97[(3'h6):(2'h3)] ?
              {wire86} : (reg94 ~^ reg93)) ^ reg97)));
          reg99 <= $unsigned($unsigned((+(8'hbf))));
          reg100 <= $unsigned(({(8'h9e)} == {(~^reg96[(5'h15):(4'hb)])}));
        end
      else
        begin
          reg98 <= ((-$signed(((wire84 ? wire88 : reg91) == (reg96 ?
              (8'h9c) : reg89)))) + $signed($unsigned($signed($signed((8'hba))))));
          reg99 <= $signed(reg99);
        end
      reg101 <= (reg93[(2'h2):(1'h0)] ? wire88 : reg90);
    end
  assign wire102 = (reg91[(2'h2):(1'h1)] ?
                       $signed((reg92 ?
                           reg93[(1'h1):(1'h1)] : $unsigned($signed(reg95)))) : (reg100[(2'h2):(1'h1)] >= reg101[(4'h8):(2'h3)]));
  assign wire103 = $signed($unsigned($signed(wire87)));
  assign wire104 = wire85;
  assign wire105 = (8'hbc);
  assign wire106 = wire105;
endmodule
