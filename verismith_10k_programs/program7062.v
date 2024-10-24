module top
#(parameter param80 = ((((~((8'ha4) ~^ (8'ha1))) ? {(~(8'hbe)), ((8'ha2) ? (8'ha6) : (8'ha0))} : ({(7'h43), (8'hbd)} <= (-(8'had)))) ? ((8'hb0) ? (((7'h43) ? (8'hab) : (8'hac)) >> ((8'hac) & (8'ha0))) : (((8'hb5) ? (8'ha9) : (8'hb3)) ? ((8'hbd) ? (7'h43) : (8'hb6)) : (-(8'hb2)))) : ((-(8'ha8)) ? ({(8'ha1), (8'ha7)} << ((8'ha7) ? (8'hb0) : (8'hb5))) : (-(^(7'h40))))) ? ((8'hb5) ? (({(8'ha9), (8'h9f)} ? (+(7'h42)) : (^~(8'h9d))) ? {(~|(8'ha2))} : (((8'hb3) != (8'hb2)) | {(8'hbc), (8'h9e)})) : (~|(((8'hba) ~^ (8'hb8)) ? (~(7'h44)) : ((8'had) ? (8'ha4) : (8'hbf))))) : (+(^(((7'h44) ? (8'ha7) : (8'hbc)) ? ((8'ha5) != (8'ha4)) : {(8'hac)})))), 
parameter param81 = (~^{({param80} ? (param80 ? (!param80) : {param80, param80}) : (-(param80 ? param80 : param80))), param80}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire39;
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire41,
                 wire4,
                 wire5,
                 wire39,
                 reg79,
                 reg78,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire4 = {$signed((|{(~|(8'hae))}))};
  assign wire5 = (~^$unsigned(wire0));
  module6 #() modinst40 (.clk(clk), .wire11(wire2), .wire7(wire4), .wire8(wire5), .wire10(wire1), .wire9(wire0), .y(wire39));
  assign wire41 = (8'hbe);
  always
    @(posedge clk) begin
      if ((($unsigned({(wire2 ?
              wire41 : wire39)}) ^ (^~$unsigned($signed(wire4)))) >= (^$signed({(7'h43),
          $signed(wire41)}))))
        begin
          reg42 <= {wire1};
          reg43 <= $signed((({(8'had), wire3} ? wire39 : {(8'hba)}) ?
              (!($signed((8'had)) ?
                  (-wire0) : (+(8'hbf)))) : $signed($signed(((7'h43) ^~ reg42)))));
          if (wire1[(4'ha):(1'h1)])
            begin
              reg44 <= (!(-reg42[(1'h1):(1'h1)]));
            end
          else
            begin
              reg44 <= ((wire2 ?
                  reg43[(3'h5):(1'h1)] : (~((wire4 || wire3) ?
                      wire41 : (wire0 & wire1)))) << (((reg44 ? wire1 : wire1) ?
                      wire2[(3'h6):(2'h3)] : (wire5[(2'h3):(2'h2)] >= ((8'haa) != wire41))) ?
                  ($unsigned($unsigned(wire3)) ?
                      {(reg42 ^ wire1)} : ((^~reg43) ?
                          $unsigned(wire1) : (wire2 ?
                              wire3 : reg44))) : ((!(reg43 - wire4)) | $signed($signed((8'ha0))))));
              reg45 <= ($unsigned($unsigned((((8'ha9) != (7'h41)) < $signed(reg44)))) < (8'hae));
              reg46 <= $unsigned(((|(&$signed(reg43))) <<< ((~(reg44 && (8'hac))) + ((-wire0) ?
                  (wire39 & (8'haa)) : wire5[(4'hc):(2'h3)]))));
            end
        end
      else
        begin
          reg42 <= (~^$unsigned($signed((((8'hae) ? wire39 : wire41) ?
              (wire5 > (8'ha5)) : reg43))));
        end
      reg47 <= {($unsigned(wire5[(4'hb):(3'h6)]) ~^ ((^~reg44) ?
              (~^(!reg42)) : wire0))};
      reg48 <= $unsigned($signed($signed(((^~(8'ha5)) ? {wire39} : reg46))));
      if ((~^{(((wire0 <<< reg46) ? $signed(reg48) : reg44) ?
              {reg48[(1'h1):(1'h1)]} : (wire0 ?
                  $signed(reg44) : (reg45 >>> (8'h9c)))),
          wire2}))
        begin
          reg49 <= wire1[(3'h7):(3'h5)];
          reg50 <= reg45;
        end
      else
        begin
          reg49 <= ((((+$signed((8'hbf))) ?
                      ((wire39 ? wire4 : wire0) ?
                          $signed(reg50) : {wire2,
                              wire39}) : (+wire41[(4'hb):(4'h8)])) ?
                  {$unsigned($unsigned((8'ha9))), reg42} : reg43) ?
              (~^wire4[(3'h4):(1'h0)]) : $signed(wire0[(4'hc):(1'h0)]));
          if (reg42)
            begin
              reg50 <= (~^reg42);
            end
          else
            begin
              reg50 <= wire5[(4'h9):(3'h7)];
              reg51 <= ($signed(reg42[(1'h1):(1'h0)]) ?
                  wire41 : ((~$signed((~&reg50))) ?
                      reg50 : (-wire39[(2'h2):(1'h0)])));
            end
          reg52 <= (reg46 ? reg45[(1'h1):(1'h0)] : (8'hb8));
        end
      if (reg51[(3'h6):(2'h2)])
        begin
          reg53 <= (-((~^reg42[(3'h6):(3'h4)]) > (wire39 ? reg50 : wire39)));
          if (reg44)
            begin
              reg54 <= {reg49, (~|wire41)};
            end
          else
            begin
              reg54 <= (+(^~$unsigned((&(reg47 ? reg48 : wire1)))));
              reg55 <= wire4[(1'h1):(1'h0)];
              reg56 <= reg49;
              reg57 <= $unsigned(wire41[(4'h9):(2'h2)]);
              reg58 <= $unsigned($signed($unsigned(($unsigned((8'hb6)) << reg47[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          if ((!reg49[(4'hd):(4'h8)]))
            begin
              reg53 <= $signed((reg44 != reg47[(3'h7):(1'h1)]));
              reg54 <= {$unsigned(($unsigned(wire41[(3'h7):(2'h3)]) ?
                      ($signed(reg58) > (reg44 ?
                          reg58 : reg58)) : $signed($signed(wire41)))),
                  {reg52[(4'h9):(1'h0)]}};
            end
          else
            begin
              reg53 <= ($signed({$unsigned($signed(reg58))}) ?
                  $signed($unsigned($signed((reg51 ?
                      reg46 : wire1)))) : $signed((~|(reg57 ?
                      (wire1 == wire2) : $signed(reg53)))));
              reg54 <= reg44[(4'hc):(3'h6)];
              reg55 <= {((reg42[(3'h4):(2'h3)] ? wire2[(3'h6):(3'h4)] : wire5) ?
                      $signed(reg45) : $signed(($unsigned(reg54) ^ reg43)))};
              reg56 <= (wire5 <<< reg51[(4'hd):(4'hc)]);
            end
          if ($signed($unsigned($signed($unsigned($signed(wire2))))))
            begin
              reg57 <= reg42[(1'h0):(1'h0)];
              reg58 <= $signed((($unsigned($unsigned(reg48)) << ($unsigned(reg58) ?
                      wire5[(1'h0):(1'h0)] : (&(8'hb0)))) ?
                  (8'ha5) : (~&wire41[(4'he):(1'h0)])));
            end
          else
            begin
              reg57 <= $unsigned(reg50);
              reg58 <= wire41;
              reg59 <= $unsigned(wire39[(1'h0):(1'h0)]);
              reg60 <= (~($signed($unsigned((-reg45))) ?
                  reg52[(3'h7):(1'h0)] : (~&((-reg45) >> wire2))));
              reg61 <= wire2[(3'h5):(1'h0)];
            end
        end
    end
  assign wire62 = (wire3[(1'h1):(1'h0)] ?
                      $unsigned((reg56[(4'hf):(1'h1)] ?
                          (reg46[(3'h5):(2'h2)] ?
                              (~^(8'ha7)) : $signed((8'ha4))) : $unsigned(reg43))) : $unsigned($signed($unsigned(wire3))));
  assign wire63 = {((~|wire0) ^~ (^wire39[(2'h2):(2'h2)]))};
  assign wire64 = (wire3[(3'h4):(2'h2)] ?
                      ($signed($unsigned(reg42[(2'h3):(2'h2)])) ?
                          (^~($signed(reg54) ?
                              (wire62 << wire1) : (!wire62))) : (reg61 ^ (~(~(8'h9e))))) : $signed(({wire41[(2'h3):(1'h1)],
                              (^wire0)} ?
                          reg50 : $unsigned((reg46 < reg52)))));
  assign wire65 = {(~&reg51[(4'hc):(4'hb)]), (^~(+reg50[(3'h4):(2'h2)]))};
  assign wire66 = (!$signed((^~{(reg51 ? reg47 : reg61)})));
  assign wire67 = (((reg45[(3'h5):(2'h2)] ?
                          ({reg42} ?
                              $unsigned(reg52) : {reg56,
                                  wire66}) : (reg52[(1'h0):(1'h0)] ?
                              (reg45 ?
                                  reg50 : reg55) : (&reg45))) >>> $unsigned({$signed(reg57),
                          (7'h42)})) ?
                      (((8'hbe) ?
                              $signed((|reg56)) : $signed((wire1 * reg50))) ?
                          (reg52 || $signed(reg58)) : $unsigned($signed(((7'h41) ?
                              reg46 : wire66)))) : (reg46[(3'h7):(3'h4)] ?
                          (^~$signed((wire0 ?
                              wire1 : reg48))) : $signed($signed(reg52[(3'h7):(3'h6)]))));
  assign wire68 = wire1;
  assign wire69 = ($unsigned($signed($unsigned($signed((8'haa))))) ?
                      reg60 : reg60);
  assign wire70 = (reg46 >>> {(!reg42[(3'h4):(2'h3)]), wire65});
  assign wire71 = reg42[(3'h4):(2'h3)];
  assign wire72 = (((((-reg44) ?
                          (wire2 ? reg58 : reg48) : {(8'hbf),
                              reg60}) >>> $signed($unsigned(wire41))) == $unsigned($signed((-reg45)))) ?
                      $unsigned(reg56[(1'h1):(1'h0)]) : $signed(((8'hbe) ?
                          {(~^wire3), $signed(wire5)} : reg47)));
  assign wire73 = $signed((((!(reg53 ? wire67 : wire62)) ?
                      ($signed(wire1) ?
                          {(8'hb1)} : wire72[(3'h4):(1'h1)]) : $signed(wire71[(4'hf):(3'h6)])) * {((~|wire4) ?
                          (wire4 ? wire70 : (8'hb2)) : $unsigned(wire62)),
                      $signed(reg54[(2'h2):(1'h0)])}));
  assign wire74 = (((|($unsigned((8'hb2)) - (&reg55))) != (reg44 ?
                      ((reg53 >= reg56) | $signed(reg52)) : reg60)) & (reg54[(5'h12):(4'ha)] ?
                      {wire2} : (^wire1[(2'h2):(1'h0)])));
  assign wire75 = $unsigned($signed($signed({$signed((8'h9d))})));
  assign wire76 = (+((reg46 << ((wire74 * wire0) ? (wire1 == reg46) : reg54)) ?
                      (wire75[(2'h2):(2'h2)] ?
                          {(wire64 ^ reg52),
                              (!(7'h42))} : reg59[(1'h1):(1'h1)]) : $signed((reg55 ?
                          $signed(wire72) : (wire62 ? reg45 : reg46)))));
  assign wire77 = $signed({({$unsigned(reg47), $unsigned(wire73)} || ({wire75,
                          reg47} | (8'ha6))),
                      wire41});
  always
    @(posedge clk) begin
      reg78 <= $signed((|reg52[(4'hc):(3'h6)]));
      reg79 <= (($signed(((reg57 ? reg54 : wire4) ?
                  $unsigned(reg43) : (wire74 >>> reg59))) ?
              $signed(wire75) : reg48[(1'h1):(1'h0)]) ?
          $signed((wire76 ~^ $signed((reg52 > wire66)))) : $signed((~|$signed($signed(wire76)))));
    end
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire38,
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
      reg12 <= $unsigned((^~$signed(((!wire11) ? $unsigned(wire8) : wire10))));
    end
  always
    @(posedge clk) begin
      if ((8'ha3))
        begin
          reg13 <= wire10;
          reg14 <= {wire8};
          if ({(~^$signed(({(8'hb5)} == $unsigned(wire7)))),
              ($signed(wire10[(3'h6):(1'h1)]) << reg13[(3'h5):(3'h5)])})
            begin
              reg15 <= (~$unsigned($unsigned($signed((wire10 ?
                  wire10 : wire11)))));
              reg16 <= ((&($signed(wire9) ?
                      reg12[(1'h0):(1'h0)] : ((reg15 >> wire8) ?
                          (reg14 ? reg13 : reg13) : (wire10 ?
                              wire10 : wire9)))) ?
                  $unsigned({wire10[(4'h8):(2'h2)],
                      $unsigned($unsigned(reg12))}) : wire11[(1'h1):(1'h1)]);
              reg17 <= reg12[(2'h3):(1'h0)];
              reg18 <= (~^$unsigned((&$unsigned(reg16[(3'h6):(3'h4)]))));
            end
          else
            begin
              reg15 <= reg18;
            end
        end
      else
        begin
          if (((&($signed((reg15 ?
              wire9 : wire11)) | reg14[(4'h8):(2'h3)])) << $signed((((~^(8'hba)) ^ {reg13,
              wire7}) ^~ {(8'ha5), reg18[(3'h6):(3'h4)]}))))
            begin
              reg13 <= wire8[(1'h0):(1'h0)];
              reg14 <= (((&(~&$unsigned(wire10))) ~^ wire8[(2'h2):(1'h1)]) >= (wire8[(1'h0):(1'h0)] ?
                  {((wire10 && wire10) ?
                          $signed(wire10) : $signed((8'hb2)))} : (^~wire7[(4'ha):(4'h8)])));
              reg15 <= reg14;
            end
          else
            begin
              reg13 <= wire11[(4'h8):(3'h4)];
              reg14 <= ($unsigned($unsigned({wire10[(3'h6):(1'h1)]})) ?
                  reg17[(5'h12):(2'h2)] : ($signed((^(~&wire11))) >>> ((~{(7'h42),
                      reg17}) * wire11)));
              reg15 <= $signed({($signed($unsigned(reg14)) >> $signed(reg18[(1'h1):(1'h0)])),
                  (reg18[(4'hc):(3'h5)] ?
                      $unsigned((~^reg17)) : reg15[(3'h6):(2'h2)])});
              reg16 <= {((&((wire9 ?
                      wire9 : wire9) <= ((7'h44) ^~ wire10))) ^ reg15[(3'h4):(1'h1)])};
              reg17 <= (wire8 ? wire7 : $signed({wire10}));
            end
          if ((&$unsigned(wire11[(1'h0):(1'h0)])))
            begin
              reg18 <= ({($unsigned(reg13[(2'h3):(1'h1)]) ?
                      reg18[(4'hb):(1'h0)] : wire9[(4'ha):(1'h0)]),
                  ((~^reg16) ?
                      ((wire11 ~^ reg17) + (~|(8'hbb))) : reg16)} - (!(~(-reg14))));
              reg19 <= $signed(reg18[(2'h3):(1'h1)]);
              reg20 <= $unsigned(($signed((-reg13[(4'h8):(3'h7)])) << (-$signed({wire9,
                  (8'hbe)}))));
              reg21 <= $unsigned(({reg15, wire8[(2'h3):(1'h1)]} & wire11));
            end
          else
            begin
              reg18 <= (wire7[(1'h0):(1'h0)] || {reg16[(4'h9):(4'h9)]});
              reg19 <= wire10[(3'h5):(3'h5)];
              reg20 <= reg13[(3'h4):(1'h1)];
              reg21 <= (~|$unsigned((8'ha0)));
              reg22 <= reg17;
            end
          reg23 <= ((($unsigned((reg15 ? (8'ha8) : wire11)) ?
                      $signed($unsigned(reg19)) : reg15) ?
                  reg14[(2'h2):(2'h2)] : $signed(((reg15 & reg15) ?
                      $unsigned(reg21) : (reg15 && reg18)))) ?
              $unsigned(reg15[(3'h4):(2'h3)]) : ({{reg21[(4'hc):(4'hc)]},
                      {wire8}} ?
                  $unsigned($signed($unsigned(reg18))) : $signed((|wire10[(4'hb):(4'h9)]))));
          reg24 <= wire11[(4'h9):(3'h6)];
          reg25 <= reg14;
        end
      if (((~&reg22) ~^ ($signed(reg23) >>> reg23)))
        begin
          reg26 <= {(((~reg15) + reg17[(4'hd):(1'h0)]) ?
                  reg16[(4'hf):(3'h6)] : (reg13 > $signed((wire11 ?
                      (8'hbb) : (8'hb3)))))};
          reg27 <= $signed(reg17);
          reg28 <= (((reg25[(3'h4):(3'h4)] || ($signed(wire11) ?
                  $unsigned(reg13) : $signed(reg13))) & $unsigned((+(reg19 | reg23)))) ?
              reg13 : reg16[(4'h9):(2'h2)]);
          reg29 <= ($signed(((wire10[(2'h3):(1'h0)] + reg22[(3'h7):(3'h5)]) || reg20)) ?
              (~^((reg27[(2'h2):(1'h0)] ~^ $signed(reg21)) ?
                  $signed(reg22) : reg24[(4'hc):(3'h4)])) : $signed(wire9[(4'hc):(4'hb)]));
          reg30 <= (~|{$signed($unsigned($unsigned((7'h42)))),
              $signed($unsigned(reg15))});
        end
      else
        begin
          reg26 <= $signed(wire7[(1'h1):(1'h1)]);
          reg27 <= (!{$signed((^(|reg26)))});
          if (reg25)
            begin
              reg28 <= (^($signed(($signed(reg21) == wire10)) & $signed(wire9[(2'h3):(2'h2)])));
              reg29 <= ((($signed($unsigned(reg16)) ?
                      reg27[(4'hb):(3'h5)] : reg18[(3'h5):(1'h0)]) ?
                  (8'hb9) : ($signed((~&reg13)) ~^ reg19)) ^ ($signed((!reg23[(2'h3):(1'h1)])) ?
                  (({reg16, wire10} ?
                      wire8 : reg17[(1'h1):(1'h0)]) && wire10) : ($unsigned(reg16[(1'h1):(1'h1)]) ?
                      (^~((8'hb0) ? (8'hba) : reg13)) : reg18)));
              reg30 <= $unsigned({{$unsigned($signed(wire8))}});
            end
          else
            begin
              reg28 <= $signed($unsigned({((+reg27) ~^ (^(8'ha1)))}));
              reg29 <= $signed(reg12[(2'h3):(2'h3)]);
              reg30 <= $unsigned((&(&(~$signed(wire7)))));
              reg31 <= ((&$unsigned($unsigned(reg23))) ?
                  (^reg14) : wire8[(2'h3):(2'h3)]);
            end
          reg32 <= reg15[(3'h5):(2'h3)];
        end
      reg33 <= $signed(wire8);
      reg34 <= reg27;
      reg35 <= {$signed((((+(8'ha9)) & ((8'h9e) ? reg23 : wire11)) ?
              $signed($unsigned(reg30)) : ((reg23 - reg28) ^ (8'hb1)))),
          {$signed(reg23[(3'h7):(1'h0)]),
              (~|((~(8'haf)) ? $unsigned(reg21) : (reg33 ~^ reg19)))}};
    end
  assign wire36 = reg16;
  assign wire37 = (((8'ha8) >> (reg14 ?
                      reg21[(4'h8):(1'h1)] : reg22)) != reg15);
  assign wire38 = (reg14 ? reg21 : reg34);
endmodule
