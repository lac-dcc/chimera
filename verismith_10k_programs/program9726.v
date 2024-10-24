module top
#(parameter param212 = ((~^((~^((8'hb5) ? (8'ha0) : (8'hbd))) ? (!((8'hbf) << (7'h42))) : ((~^(8'hbb)) ? (+(8'hb7)) : ((8'ha3) ? (8'ha3) : (8'hb6))))) ? ((~^(^{(8'ha2), (7'h43)})) ? ((((8'hae) ? (8'had) : (8'hab)) != ((8'haf) < (8'haa))) >> (~^((8'hb7) ? (8'hbd) : (8'hb6)))) : {((+(8'hab)) ? ((8'h9d) == (8'hbd)) : ((7'h41) || (8'hb4)))}) : (^~{(~&{(8'hb5)}), (((8'haf) == (8'ha6)) ? ((8'hb2) < (8'hb0)) : ((8'hb5) == (8'h9f)))})), 
parameter param213 = param212)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire190;
  wire signed [(5'h11):(1'h0)] wire191;
  wire signed [(4'hc):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire201;
  wire [(4'he):(1'h0)] wire202;
  wire signed [(4'hb):(1'h0)] wire203;
  wire [(5'h13):(1'h0)] wire206;
  wire [(4'he):(1'h0)] wire207;
  wire [(2'h2):(1'h0)] wire208;
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg198 = (1'h0);
  reg [(5'h13):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg195 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg signed [(4'he):(1'h0)] reg192 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire210,
                 wire5,
                 wire6,
                 wire7,
                 wire10,
                 wire27,
                 wire28,
                 wire188,
                 wire190,
                 wire191,
                 wire199,
                 wire200,
                 wire201,
                 wire202,
                 wire203,
                 wire206,
                 wire207,
                 wire208,
                 reg205,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg8,
                 reg9,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire5 = (&wire2[(1'h0):(1'h0)]);
  assign wire6 = (wire0 ?
                     wire3[(3'h4):(1'h1)] : (wire5 ^ (wire3 < ((wire0 ~^ wire3) ?
                         {wire3} : wire0))));
  assign wire7 = (~|$signed(wire3[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      reg8 <= ((7'h41) ?
          (wire7 ?
              $unsigned(wire0) : ((~^(wire1 << wire5)) << wire3)) : wire2[(1'h0):(1'h0)]);
      reg9 <= wire5[(3'h6):(2'h2)];
    end
  assign wire10 = wire7[(5'h11):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned({{(((8'hb3) + wire2) ? $unsigned(wire10) : wire10)}}))
        begin
          reg11 <= {(reg8 != (8'hae)), $unsigned(wire6[(4'he):(4'hd)])};
          if (wire6)
            begin
              reg12 <= {($unsigned($signed(((8'ha2) == wire4))) ?
                      (&wire7) : (+{wire7}))};
              reg13 <= wire3;
              reg14 <= ($signed(reg13[(4'h8):(3'h5)]) ?
                  (reg13[(4'hc):(4'ha)] ?
                      ($signed((|reg8)) | $signed(reg11)) : wire10) : $unsigned(reg13[(4'h8):(3'h6)]));
              reg15 <= {((wire6 ?
                      (~^{reg9, reg12}) : (wire1[(4'ha):(2'h3)] ?
                          (~&reg8) : {reg13, wire3})) ~^ reg9),
                  ($unsigned((~&{wire2})) ?
                      ($signed(reg12) >>> wire5) : wire5)};
              reg16 <= {reg15};
            end
          else
            begin
              reg12 <= $signed(wire3);
              reg13 <= $unsigned((^~((+wire5) ?
                  reg9 : $signed(wire10[(5'h12):(4'hf)]))));
            end
        end
      else
        begin
          reg11 <= {($unsigned(wire2) ?
                  $unsigned(((wire3 ? (8'hb8) : (8'hb0)) ?
                      $signed(reg12) : (reg15 < (8'hb0)))) : wire10[(4'h8):(4'h8)]),
              ((!(8'hb2)) ?
                  $signed({(~&wire3)}) : (~^$unsigned(((7'h42) > reg8))))};
          reg12 <= reg8[(4'h8):(2'h2)];
          reg13 <= (~|(|(|$unsigned(reg9))));
          reg14 <= (~|wire3);
          reg15 <= {(wire10[(5'h10):(3'h7)] << reg11)};
        end
      reg17 <= ((($unsigned((wire4 ? reg14 : wire7)) ?
                  $unsigned(reg12[(4'hc):(3'h6)]) : ((wire2 ?
                      wire10 : (8'hba)) * $signed(reg13))) ?
              $unsigned($unsigned(wire0[(3'h6):(1'h0)])) : (+(wire6 ?
                  (8'hb8) : reg14[(1'h1):(1'h1)]))) ?
          {$unsigned(($signed(wire10) ? (~^reg14) : $signed(wire2)))} : {wire7,
              wire7[(1'h0):(1'h0)]});
      reg18 <= wire0;
      if ($unsigned($signed((wire6[(3'h7):(3'h7)] ?
          (+$unsigned(wire4)) : {$unsigned(wire2), $signed(reg12)}))))
        begin
          reg19 <= ($signed(reg13) + ((wire5 >= ((wire6 ^~ reg17) ?
                  $unsigned(wire1) : {reg16})) ?
              reg18 : wire6[(2'h3):(2'h2)]));
          reg20 <= ($unsigned((~^(-wire3[(3'h6):(2'h3)]))) ^ $unsigned((~^reg12[(4'ha):(2'h3)])));
          reg21 <= (&wire1[(3'h6):(2'h3)]);
          reg22 <= reg17[(1'h0):(1'h0)];
          reg23 <= (^~(~|$signed((^~(|reg13)))));
        end
      else
        begin
          if ((reg11 ? $signed($signed(((7'h42) <= $signed((8'ha5))))) : reg15))
            begin
              reg19 <= (($signed({(reg13 ? reg20 : reg20), wire7}) ?
                      (^~({reg23, reg17} ?
                          (7'h44) : (wire2 <= reg23))) : wire10[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(reg14)) : $unsigned({(((7'h44) ?
                          reg11 : wire0) >= reg11[(4'ha):(3'h5)]),
                      {(wire10 ? wire3 : reg11), (reg17 ? (8'h9f) : wire5)}}));
              reg20 <= wire3;
              reg21 <= $signed($unsigned(($unsigned($unsigned((8'h9e))) ?
                  $unsigned(reg9) : (&((8'ha4) ~^ reg20)))));
            end
          else
            begin
              reg19 <= wire5;
            end
          reg22 <= (+((((|reg11) ?
                  (^wire6) : (reg20 ?
                      reg9 : reg18)) <= ($unsigned((8'hab)) <<< {reg19})) ?
              (((reg16 ?
                  wire1 : wire6) ^~ $signed(wire3)) && $unsigned(reg12)) : (~&$signed((8'hb1)))));
          if (((&((8'ha7) ^~ $unsigned((reg16 >> wire2)))) ?
              ((|$unsigned($unsigned(reg23))) + (reg14[(3'h4):(2'h2)] != ($unsigned(reg18) ?
                  wire7 : ((8'hb8) ? wire3 : wire7)))) : wire6))
            begin
              reg23 <= ($signed(($signed(reg18) | $signed((|(8'hbe))))) ?
                  $unsigned((((^~reg14) ?
                      (reg11 - reg11) : $unsigned(reg16)) - wire1[(4'hd):(2'h3)])) : reg23);
              reg24 <= $unsigned(wire2);
              reg25 <= {wire10, wire10};
              reg26 <= reg17;
            end
          else
            begin
              reg23 <= (!(reg11 ? reg18[(3'h6):(3'h6)] : wire2));
              reg24 <= wire1;
              reg25 <= ((8'h9d) ?
                  {reg8[(3'h6):(1'h0)]} : $unsigned(reg18[(4'h9):(1'h0)]));
            end
        end
    end
  assign wire27 = ($signed((~&$unsigned($unsigned(reg17)))) == ((|reg25) ?
                      (reg21[(1'h0):(1'h0)] ?
                          (reg22 >> reg22) : ((|reg22) - ((8'hbc) | reg24))) : reg26));
  assign wire28 = (+$unsigned(wire7[(4'h9):(1'h0)]));
  module29 #() modinst189 (.y(wire188), .wire31(reg18), .wire30(wire2), .clk(clk), .wire32(reg23), .wire34(wire7), .wire33(reg22));
  assign wire190 = (wire3 >= (|(reg8[(1'h1):(1'h0)] ?
                       wire3[(1'h1):(1'h0)] : reg17[(1'h0):(1'h0)])));
  assign wire191 = (~|reg22[(4'hb):(3'h5)]);
  always
    @(posedge clk) begin
      reg192 <= reg9;
      reg193 <= reg21;
      reg194 <= $unsigned((~((~^{reg21, reg9}) ?
          {reg9[(4'hd):(2'h3)]} : $unsigned($signed(reg8)))));
      if ($unsigned({$signed(reg21[(3'h4):(1'h0)]),
          ($signed(((8'hbd) && reg21)) <= ((8'hb9) != wire3[(2'h2):(1'h1)]))}))
        begin
          if ((+$signed(reg16[(4'hc):(4'hc)])))
            begin
              reg195 <= $signed(reg194);
              reg196 <= (~^wire0[(4'ha):(2'h3)]);
              reg197 <= (+reg14);
              reg198 <= $signed((reg12[(1'h1):(1'h1)] & $signed(wire191)));
            end
          else
            begin
              reg195 <= wire188;
            end
        end
      else
        begin
          reg195 <= ($signed($signed((&{reg24}))) ?
              (wire191[(4'ha):(3'h4)] ?
                  (~&reg196) : reg25[(1'h0):(1'h0)]) : $unsigned((|($unsigned(wire191) > wire10[(4'ha):(2'h2)]))));
          reg196 <= $unsigned((&$unsigned((wire4 <<< reg196[(3'h4):(2'h3)]))));
          reg197 <= (wire5 ?
              $signed($signed(reg25[(2'h3):(2'h2)])) : ((-((wire7 <= reg13) ?
                  $unsigned(reg17) : (reg22 & reg12))) <= wire5[(1'h1):(1'h0)]));
        end
    end
  assign wire199 = $signed(wire0);
  assign wire200 = $unsigned(wire7);
  assign wire201 = $unsigned($signed($signed(wire0)));
  assign wire202 = wire190[(4'h9):(2'h2)];
  module38 #() modinst204 (.y(wire203), .wire41(reg14), .clk(clk), .wire40(reg17), .wire42(reg25), .wire39(reg192));
  always
    @(posedge clk) begin
      reg205 <= wire5;
    end
  assign wire206 = (((8'hb6) == wire190) >> (wire27 | $unsigned((reg192 >= (reg11 ?
                       reg194 : reg198)))));
  assign wire207 = ($signed(reg13) ?
                       $signed($unsigned($signed($unsigned((7'h41))))) : reg22[(2'h2):(2'h2)]);
  module38 #() modinst209 (wire208, clk, wire202, reg16, wire1, wire207);
  module161 #() modinst211 (.clk(clk), .wire162(wire200), .wire164(wire1), .wire166(reg194), .wire165(reg21), .wire163(reg24), .y(wire210));
endmodule

module module29
#(parameter param187 = (8'haf))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire [(4'h9):(1'h0)] wire33;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  assign y = {wire186,
                 wire184,
                 wire160,
                 wire158,
                 wire120,
                 wire119,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire52,
                 wire51,
                 wire49,
                 wire37,
                 wire36,
                 wire35,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire35 = $unsigned((&wire30));
  assign wire36 = ($signed($signed((^~(wire31 & (8'ha5))))) ?
                      $unsigned((!{(wire34 == wire34)})) : {$signed($unsigned((!wire32))),
                          $signed(($signed(wire34) & $unsigned(wire34)))});
  assign wire37 = wire34;
  module38 #() modinst50 (wire49, clk, wire30, wire35, wire36, wire34);
  assign wire51 = $unsigned(wire30);
  assign wire52 = (wire36 ? $signed(wire49) : wire32[(4'hd):(2'h2)]);
  always
    @(posedge clk) begin
      if (((|(wire35 ~^ ({wire49, (8'ha3)} ? $unsigned(wire36) : {wire51}))) ?
          wire52[(4'hf):(3'h6)] : ((wire31 + $signed({wire33,
              wire37})) != {(~^wire35[(4'h8):(3'h5)])})))
        begin
          reg53 <= ((wire49 ?
              (^~$signed((~^wire31))) : $signed(((~|wire37) ?
                  (~&wire31) : $signed(wire30)))) <<< wire52);
        end
      else
        begin
          reg53 <= ({(wire35[(3'h5):(3'h5)] | $signed({wire51})),
              $signed(wire34[(2'h2):(1'h0)])} <= wire35);
          reg54 <= (($unsigned(((-wire33) ?
                  (&wire30) : (wire35 ?
                      wire32 : wire34))) >>> $unsigned($unsigned((wire51 ?
                  wire33 : wire37)))) ?
              {$signed({$signed(wire36), $signed((8'hbd))}),
                  $unsigned($unsigned((+wire30)))} : {((&(wire32 ?
                      (8'hb2) : wire30)) * wire51[(2'h2):(1'h0)]),
                  $signed($unsigned((wire33 < wire49)))});
          if ((-$unsigned($signed((8'ha9)))))
            begin
              reg55 <= reg54[(3'h5):(2'h3)];
            end
          else
            begin
              reg55 <= $unsigned($unsigned((-wire34[(4'hd):(4'ha)])));
              reg56 <= ((wire51[(2'h2):(1'h0)] * reg55) ?
                  (8'hb6) : $unsigned(wire32[(2'h3):(1'h1)]));
              reg57 <= ($signed((^~$signed((wire33 << (7'h41))))) * (wire32 ^~ (^$signed($unsigned(wire52)))));
            end
        end
      reg58 <= $signed($unsigned((((reg57 ? reg55 : wire51) ?
              $unsigned(wire30) : (wire32 != reg53)) ?
          $unsigned(wire37) : reg55[(4'hc):(1'h0)])));
      reg59 <= wire49;
      if (reg59[(4'hb):(4'hb)])
        begin
          reg60 <= ((8'ha4) << (!$signed($unsigned((^~wire37)))));
          reg61 <= $unsigned(wire35);
          reg62 <= $unsigned({($signed((wire52 ? wire31 : wire31)) ?
                  {(|reg61)} : $unsigned((wire31 >= wire36))),
              (wire32[(4'h9):(1'h1)] || wire35)});
        end
      else
        begin
          reg60 <= {reg58,
              ($unsigned(((~^wire49) >> reg61)) ? $signed((8'hbd)) : reg54)};
        end
    end
  module63 #() modinst109 (wire108, clk, wire31, wire37, reg53, reg61, reg57);
  assign wire110 = $unsigned(reg59[(4'hb):(3'h6)]);
  assign wire111 = {({(((8'hb2) != wire34) ?
                                   $signed(reg58) : (reg56 != wire33))} ?
                           reg62 : (8'hbb))};
  assign wire112 = (!($signed((((8'hbc) << reg57) ?
                           (wire31 && reg57) : (wire52 <= wire37))) ?
                       (-((~&reg54) ?
                           (&reg57) : (wire34 * wire110))) : (((reg57 ?
                                   wire36 : wire35) ?
                               $unsigned(reg59) : $signed(reg54)) ?
                           ((^wire108) ? $signed(wire36) : wire30) : (reg62 ?
                               reg59[(4'h9):(3'h5)] : ((8'hab) ?
                                   wire52 : wire31)))));
  assign wire113 = wire35;
  assign wire114 = ($unsigned(reg60[(1'h0):(1'h0)]) ?
                       (8'hb3) : wire49[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((~&(8'hbd)))
        begin
          reg115 <= wire34[(4'hb):(4'h8)];
        end
      else
        begin
          reg115 <= wire52[(4'hf):(2'h2)];
        end
      if ($signed($signed(reg60[(2'h2):(1'h0)])))
        begin
          reg116 <= (((reg53[(2'h3):(1'h1)] ?
                  (reg56 ? wire30 : (wire114 ? wire36 : (8'ha0))) : (^{(8'h9f),
                      reg115})) ?
              ((((8'ha1) + reg57) ?
                  wire113 : (8'hbb)) ^ $unsigned(reg55[(2'h2):(1'h1)])) : reg57) > $unsigned(wire30));
        end
      else
        begin
          reg116 <= (!$unsigned(wire52));
        end
      reg117 <= (~|(wire108[(1'h1):(1'h1)] >> wire114));
      reg118 <= ($unsigned((((^wire52) > $unsigned(reg53)) ?
              ((reg117 == wire33) >> {reg59, reg62}) : reg117)) ?
          $unsigned($signed($unsigned($signed(wire112)))) : {(~^((reg56 ?
                      wire111 : wire31) ?
                  reg58 : $signed(wire35))),
              $unsigned(wire36)});
    end
  assign wire119 = (reg60 << {wire37[(4'ha):(4'h9)],
                       ({(wire31 ? wire35 : reg118), $unsigned(reg60)} ?
                           $signed(reg117[(4'ha):(4'h8)]) : (~^((8'hb8) && wire113)))});
  assign wire120 = $unsigned((^~wire37));
  module121 #() modinst159 (.wire122(wire120), .y(wire158), .wire126(wire33), .wire123(wire110), .wire124(wire31), .clk(clk), .wire125(reg56));
  assign wire160 = wire120;
  module161 #() modinst185 (.wire162(wire111), .wire163(wire31), .wire164(wire114), .clk(clk), .y(wire184), .wire165(wire112), .wire166(reg53));
  assign wire186 = reg60;
endmodule

module module161  (y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire166;
  input wire signed [(2'h2):(1'h0)] wire165;
  input wire [(4'hc):(1'h0)] wire164;
  input wire [(4'hc):(1'h0)] wire163;
  input wire [(4'hb):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire183;
  wire [(2'h3):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire168;
  wire signed [(3'h6):(1'h0)] wire167;
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire168,
                 wire167,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire167 = $unsigned($signed((wire163 && wire165)));
  assign wire168 = wire163[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (($signed((($unsigned(wire168) ?
          $signed(wire166) : wire165[(1'h0):(1'h0)]) - ((|wire167) > (wire165 ~^ wire164)))) ~^ (^(^wire167))))
        begin
          reg169 <= $unsigned($signed((8'hbd)));
          reg170 <= $unsigned($unsigned(wire162));
          if ((-(~&{$unsigned($signed(reg170))})))
            begin
              reg171 <= (~wire162[(3'h4):(1'h0)]);
              reg172 <= $signed((-$unsigned((~$unsigned(wire163)))));
              reg173 <= (~$unsigned((+(+$unsigned(wire165)))));
              reg174 <= (~|($signed(wire167) ?
                  {$unsigned((wire165 <= wire165)),
                      $unsigned((wire167 < wire163))} : (((^reg170) != $signed(wire164)) ?
                      $unsigned(reg170) : ($unsigned(reg169) ^ (~|reg172)))));
            end
          else
            begin
              reg171 <= reg171;
              reg172 <= (wire165 ?
                  {(~|reg173)} : ($signed(((~|reg174) ?
                      $unsigned(reg169) : {(8'hb2),
                          wire167})) | reg171[(3'h7):(2'h3)]));
              reg173 <= $signed(reg174);
              reg174 <= ((^~{reg173[(2'h2):(1'h1)],
                  $unsigned(wire165[(1'h1):(1'h0)])}) ~^ reg169);
            end
        end
      else
        begin
          reg169 <= ((($unsigned(((7'h42) <<< reg174)) ?
                  reg172 : wire166) | wire162) ?
              reg174 : (reg173 * (wire164[(4'h9):(4'h9)] ?
                  ($signed(wire167) ~^ reg170) : wire167[(2'h2):(1'h0)])));
          reg170 <= $signed($signed(reg169));
          reg171 <= ($signed($unsigned(($unsigned(wire163) && (wire163 ?
              reg172 : reg171)))) >> wire166);
          reg172 <= $unsigned({{(^reg173[(4'ha):(4'ha)]),
                  wire162[(2'h2):(2'h2)]},
              ($signed(reg172) ?
                  wire165[(1'h0):(1'h0)] : ($signed(reg169) ?
                      $unsigned(reg170) : $signed(reg171)))});
          reg173 <= (reg174[(1'h0):(1'h0)] ?
              (((reg170[(4'hd):(4'hd)] ?
                      (wire163 ?
                          wire165 : (7'h42)) : $unsigned((8'h9d))) | {reg174,
                      (reg169 ? (8'hac) : wire165)}) ?
                  reg174 : reg174[(3'h4):(1'h0)]) : ((wire165[(2'h2):(1'h0)] | ((!wire165) ?
                      (reg170 & (8'hb2)) : reg171[(1'h0):(1'h0)])) ?
                  $unsigned($unsigned(wire164)) : $signed($signed($signed((8'ha5))))));
        end
      reg175 <= $unsigned((-reg171[(3'h6):(3'h5)]));
      reg176 <= (&(+(~(|(-reg173)))));
      reg177 <= ($signed($signed({((8'ha7) ? reg169 : reg170)})) | reg173);
      reg178 <= $unsigned(reg169[(5'h13):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg179 <= {$unsigned(wire168[(2'h3):(2'h3)])};
    end
  assign wire180 = ({((reg172[(4'hb):(3'h6)] ? $signed(wire165) : (&wire167)) ?
                               wire163 : ($unsigned(reg177) ?
                                   $signed(reg175) : ((8'hbc) <<< reg178)))} ?
                       (reg172[(4'ha):(4'ha)] ^ reg179) : $unsigned(reg175));
  assign wire181 = wire164;
  assign wire182 = (8'h9d);
  assign wire183 = (&(~&{wire163[(3'h4):(2'h3)],
                       ((reg177 ? reg175 : (8'ha5)) ?
                           (wire180 << reg169) : wire162[(3'h7):(1'h1)])}));
endmodule

module module121
#(parameter param156 = (({(7'h40), {((8'h9c) && (8'hab))}} ? ((&{(8'had)}) <= (~(&(8'ha3)))) : ((((8'hb6) ? (8'hb2) : (8'ha2)) ? ((8'hb4) | (8'h9d)) : ((7'h41) ? (8'h9e) : (8'ha4))) ? (+((7'h40) ^ (8'h9e))) : {{(7'h43), (8'ha4)}, {(8'hb0)}})) ^~ {(~(~|(+(8'ha2))))}), 
parameter param157 = (8'hbd))
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire126;
  input wire signed [(4'hc):(1'h0)] wire125;
  input wire signed [(5'h11):(1'h0)] wire124;
  input wire [(4'hf):(1'h0)] wire123;
  input wire [(3'h7):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire154;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(4'he):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire127 = ((+wire122) < $signed($unsigned($signed($signed(wire122)))));
  assign wire128 = $signed(wire126[(2'h2):(2'h2)]);
  assign wire129 = $signed({wire126[(2'h2):(2'h2)],
                       $signed($unsigned((-wire125)))});
  assign wire130 = $signed(((((wire126 ?
                           wire122 : wire124) & wire124[(4'ha):(4'h8)]) < wire123[(4'he):(3'h5)]) ?
                       (wire124[(4'hd):(2'h2)] >= wire129) : $unsigned({{wire128,
                               wire128},
                           (wire125 | wire129)})));
  assign wire131 = wire122[(3'h4):(3'h4)];
  assign wire132 = wire123[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg133 <= ((-{wire122[(3'h5):(2'h3)]}) >> ({wire132,
          wire124[(4'hb):(4'ha)]} & $signed(wire131[(2'h3):(2'h2)])));
      reg134 <= ((~|(|((~wire129) * (wire125 & (8'hae))))) >= ((+(&wire123[(4'hd):(4'ha)])) ?
          wire128 : $unsigned(({wire127} > $unsigned(wire124)))));
      if ((^$unsigned({wire126[(2'h2):(1'h1)], $unsigned(wire123)})))
        begin
          reg135 <= ((wire123 ^ $signed((^~{wire130, wire123}))) - ({(wire128 ?
                      (reg134 >= wire126) : (wire124 > wire130))} ?
              wire131[(1'h1):(1'h0)] : wire131));
          reg136 <= {(wire125[(1'h1):(1'h0)] ^ (|wire132[(4'he):(4'h8)])),
              $signed(reg134)};
          reg137 <= ((7'h43) ?
              (wire131 ?
                  wire126[(2'h2):(1'h1)] : (!{(wire124 ^ wire131)})) : (~$signed($unsigned((wire131 ?
                  reg134 : wire130)))));
          if (($signed(($unsigned(wire130) ?
              $signed((wire122 >= wire122)) : $signed(reg137))) * ({{wire132[(2'h2):(1'h1)]}} ?
              (8'ha9) : ($signed($unsigned(wire128)) << (^$unsigned(wire128))))))
            begin
              reg138 <= (~|$signed(((wire122[(2'h2):(2'h2)] || (wire130 ?
                      reg137 : wire124)) ?
                  (~$unsigned(wire132)) : (((8'h9c) ?
                      wire130 : wire125) != (reg137 != wire127)))));
              reg139 <= wire125[(3'h7):(3'h5)];
              reg140 <= (^(~^(reg135 ?
                  (^$unsigned(reg137)) : ((8'hb8) > (reg136 == reg135)))));
              reg141 <= $signed((reg139 ?
                  reg138[(2'h3):(2'h2)] : {{(&reg140)}}));
            end
          else
            begin
              reg138 <= ($unsigned((8'hbd)) ?
                  (8'ha0) : ({(wire125 + wire128), reg133[(1'h1):(1'h0)]} ?
                      ({$signed((8'ha0))} ?
                          reg135 : ($signed(wire129) ?
                              (reg134 <<< wire122) : (~^wire127))) : (~|$unsigned($signed(wire122)))));
              reg139 <= (wire126[(2'h2):(1'h1)] ?
                  (^~$unsigned({$unsigned(wire122)})) : wire123[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          reg135 <= ((8'hb1) + $signed((wire131[(3'h6):(3'h6)] ?
              (|wire130) : {reg134, reg135[(1'h1):(1'h0)]})));
          reg136 <= reg133[(3'h6):(2'h3)];
          reg137 <= $signed((^~(wire126[(1'h1):(1'h0)] ?
              wire123 : reg138[(2'h3):(1'h0)])));
        end
      if ($unsigned(($signed({wire131}) ?
          reg138[(4'h8):(1'h0)] : (^(~^$signed(reg139))))))
        begin
          if (((-wire125[(4'hc):(2'h3)]) ?
              {(reg141 <= reg140)} : $unsigned((reg138[(2'h2):(2'h2)] != ({wire124} <= reg140[(5'h13):(2'h2)])))))
            begin
              reg142 <= {(wire126 ?
                      (8'haa) : ((+$signed((8'ha8))) & (~&wire125)))};
              reg143 <= (~wire131);
              reg144 <= $unsigned(((wire130[(4'h9):(1'h1)] <<< reg143) ?
                  wire129[(2'h3):(2'h2)] : (~wire131)));
            end
          else
            begin
              reg142 <= $unsigned(reg139[(2'h3):(2'h3)]);
              reg143 <= $unsigned($signed((wire132 ?
                  wire131 : ((wire123 ? (8'hbb) : (8'hb3)) ?
                      $signed(reg143) : (reg135 ? wire130 : wire129)))));
            end
          reg145 <= $signed({($unsigned((+wire131)) ?
                  (~wire131) : $signed(((8'h9e) != reg134)))});
          reg146 <= $unsigned(({((reg144 ? wire123 : reg144) ?
                      (~|wire126) : $signed(reg137)),
                  ($unsigned(reg140) ? reg139 : $unsigned(wire127))} ?
              (reg144 != reg143) : (+(|wire131))));
          reg147 <= {{$unsigned(((reg138 ^ reg143) <<< (reg141 > reg145)))}};
          reg148 <= $signed((~&reg136));
        end
      else
        begin
          reg142 <= wire124[(1'h0):(1'h0)];
        end
    end
  assign wire149 = $unsigned($unsigned(($unsigned(wire126) ?
                       reg134[(2'h2):(2'h2)] : (8'hae))));
  assign wire150 = reg142;
  assign wire151 = wire128;
  assign wire152 = $unsigned(reg147[(2'h3):(1'h0)]);
  assign wire153 = reg142[(4'hb):(1'h1)];
  assign wire154 = ($signed($unsigned((wire153[(3'h6):(3'h6)] ?
                       {(8'haf), reg143} : (reg148 ?
                           reg148 : reg137)))) & ((reg148 >= $unsigned((reg138 ?
                           wire122 : reg147))) ?
                       (wire152[(4'h9):(1'h1)] && (-(8'hb3))) : (reg145[(1'h0):(1'h0)] ?
                           reg140 : $signed(reg136))));
  assign wire155 = $unsigned((($unsigned(wire122) + {$unsigned(reg134),
                       {reg139, reg143}}) - wire127));
endmodule

module module63
#(parameter param107 = ((~(((~(8'hb1)) ~^ (8'hac)) ^~ ({(7'h42), (8'ha3)} ? ((8'hbb) ? (7'h44) : (8'ha3)) : {(8'hb3), (8'hb3)}))) ~^ (~((8'ha1) ? ((~|(8'ha0)) << (^(7'h41))) : (((8'h9d) < (8'ha8)) ? {(8'hb9), (8'h9d)} : {(8'ha3), (8'hb4)})))))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(3'h7):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire [(4'he):(1'h0)] wire65;
  input wire [(5'h12):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire signed [(3'h7):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire69;
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire69,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = wire67;
  always
    @(posedge clk) begin
      reg70 <= $unsigned(((|$signed((wire69 || (7'h41)))) ?
          ($unsigned($unsigned(wire67)) <= (8'hb7)) : wire68));
      reg71 <= wire69[(2'h2):(2'h2)];
      reg72 <= $unsigned({((^(wire68 >>> (8'ha6))) ?
              $signed((wire67 ^~ wire68)) : (~(&(8'hbb))))});
      if ({reg70,
          (((|(wire66 * wire64)) >>> wire67[(1'h0):(1'h0)]) ?
              $unsigned(wire64) : reg70)})
        begin
          reg73 <= (wire69[(2'h2):(1'h1)] ?
              $signed((^($unsigned(wire67) << $unsigned(wire64)))) : $signed($signed(((7'h41) == $unsigned(wire64)))));
          if ($signed(((($unsigned(wire67) ?
                  (^~wire67) : (wire66 ? wire68 : reg71)) ?
              (reg71 ? $unsigned(wire68) : $signed(wire66)) : ({wire66} ?
                  reg71 : reg72[(4'h9):(3'h4)])) ~^ (((wire69 ?
                      (8'hae) : reg70) ?
                  (reg73 + wire64) : $signed(reg73)) ?
              ((7'h42) | wire65) : {reg72, $signed((8'h9f))}))))
            begin
              reg74 <= reg72;
            end
          else
            begin
              reg74 <= $unsigned(wire68);
            end
        end
      else
        begin
          reg73 <= (wire66[(3'h5):(1'h1)] ?
              reg72[(2'h3):(2'h2)] : reg71[(4'he):(3'h6)]);
          reg74 <= $unsigned($signed($signed((-(~^wire65)))));
          reg75 <= $unsigned(($signed(({(8'hbf)} << $signed(wire68))) <= ($signed({reg71}) >> ($unsigned(wire68) ?
              $unsigned((7'h42)) : {wire67, (8'hb4)}))));
          reg76 <= (reg74 - wire67[(2'h3):(1'h0)]);
          if (($unsigned((-reg70)) ^ wire69[(2'h3):(1'h1)]))
            begin
              reg77 <= reg73[(1'h1):(1'h1)];
              reg78 <= ($signed($unsigned((~^$signed((8'hb4))))) == (-$signed(reg74)));
              reg79 <= $unsigned(($signed((-reg76)) ?
                  $signed((~&reg70[(4'h9):(3'h5)])) : (8'ha5)));
            end
          else
            begin
              reg77 <= (($signed($signed((+wire66))) | (~^($unsigned((8'h9d)) ?
                      $unsigned(reg72) : $signed((7'h43))))) ?
                  (($signed(wire65) ? reg78 : ((!wire69) <<< wire67)) ?
                      ((~{reg77, wire69}) ?
                          reg79 : (~^(wire65 ?
                              wire64 : reg70))) : ($signed(((7'h42) <= reg74)) ?
                          ((^reg75) ^ wire68) : reg74[(3'h7):(3'h6)])) : $signed({(&reg77)}));
              reg78 <= (^$signed(reg79[(3'h5):(2'h3)]));
            end
        end
      reg80 <= (8'haa);
    end
  assign wire81 = ($unsigned($signed(((-(8'ha9)) >>> wire67[(3'h7):(3'h5)]))) == (8'hb1));
  assign wire82 = wire64[(4'h9):(3'h7)];
  assign wire83 = (wire64 ?
                      ((^~reg73[(1'h1):(1'h0)]) == reg77) : ((^~(&{(8'ha1),
                          reg70})) - (((reg74 ? reg70 : wire67) ?
                          (reg73 >> (8'hb7)) : wire66) << wire67)));
  assign wire84 = (^~(((^(^reg75)) <= ($signed(wire67) || $signed((8'ha7)))) >>> $signed((|$unsigned(reg73)))));
  always
    @(posedge clk) begin
      if ((|$unsigned(reg77[(2'h3):(1'h1)])))
        begin
          reg85 <= $signed({{((wire64 + reg73) >> (wire83 ? wire65 : (8'ha1))),
                  (-(wire83 + reg73))},
              (((wire84 ? (8'hae) : reg76) == (wire64 ?
                  reg79 : wire81)) || $signed($unsigned(reg80)))});
        end
      else
        begin
          reg85 <= {(wire67 ^~ {{reg85[(1'h1):(1'h0)], ((8'hb9) < wire82)}})};
        end
      if (reg76[(4'hc):(4'hc)])
        begin
          reg86 <= $signed($signed(reg80));
          reg87 <= (($unsigned(reg70[(2'h2):(2'h2)]) ?
              reg75[(4'ha):(3'h4)] : $unsigned(reg77)) + ({((reg80 * reg80) >> $signed(reg75))} ?
              $unsigned(reg70[(4'ha):(4'h8)]) : reg72));
        end
      else
        begin
          if (wire82)
            begin
              reg86 <= $unsigned(reg85[(4'h9):(2'h3)]);
            end
          else
            begin
              reg86 <= $signed($unsigned(({(wire81 ^~ wire69),
                  (~|wire68)} && {((8'haa) || reg70)})));
              reg87 <= (-wire68[(3'h6):(3'h5)]);
            end
          reg88 <= $unsigned(reg73);
        end
      reg89 <= {(~^reg87[(1'h0):(1'h0)])};
      reg90 <= (-(8'h9f));
    end
  assign wire91 = (((wire64 ?
                          ($unsigned(wire68) ?
                              wire66[(1'h0):(1'h0)] : $signed((8'ha7))) : {(reg77 ?
                                  wire64 : reg71)}) ?
                      ($unsigned($unsigned(wire84)) == (8'hbd)) : $signed((^~$signed(reg74)))) - reg70[(2'h3):(1'h0)]);
  assign wire92 = wire68[(3'h4):(1'h1)];
  assign wire93 = {$unsigned($unsigned($unsigned((^reg70)))),
                      ((~^((8'hb8) != reg87[(1'h1):(1'h1)])) ?
                          (8'hac) : {$unsigned($signed(wire66)),
                              ((reg89 ^ wire64) <= {reg73, wire67})})};
  assign wire94 = (-wire84);
  assign wire95 = ({reg79, reg77} ^~ $unsigned(wire64));
  assign wire96 = {reg90[(4'hc):(3'h6)]};
  assign wire97 = ($signed(wire91[(2'h2):(1'h0)]) ?
                      $unsigned((8'h9d)) : (~&$signed($signed($unsigned(wire96)))));
  assign wire98 = wire84;
  assign wire99 = wire68[(4'hd):(3'h7)];
  assign wire100 = wire65;
  assign wire101 = (^wire66);
  assign wire102 = {$signed(reg71)};
  assign wire103 = wire95[(3'h5):(1'h0)];
  assign wire104 = $unsigned($unsigned((((reg72 ? reg90 : reg89) < wire101) ?
                       $unsigned((wire94 ? (7'h42) : reg88)) : {(reg75 ?
                               wire69 : reg80),
                           wire100})));
  assign wire105 = reg88;
  assign wire106 = $signed(($signed((~&$signed(wire82))) ?
                       (^reg72) : wire65[(4'h9):(3'h7)]));
endmodule

module module38
#(parameter param47 = ((((((8'ha7) & (8'h9e)) ? ((8'hb4) ? (8'hb7) : (8'haf)) : ((8'ha7) ? (8'hb0) : (8'hbb))) ^ (|(-(8'hb7)))) ? ((((8'ha5) << (8'ha8)) ? (~^(8'ha6)) : ((8'hb7) ? (8'hb2) : (8'hb3))) ? (~|{(7'h41), (8'h9c)}) : {((8'hb6) <<< (8'hb5))}) : ((((8'hb9) ? (8'ha3) : (8'ha8)) < {(8'ha7), (8'ha1)}) ? (!((8'ha7) ? (8'ha7) : (7'h43))) : ((&(8'hba)) ? (~^(8'hb5)) : {(8'hbd)}))) ? (~|((((8'hb8) == (8'hb2)) ^~ ((8'hb0) ? (8'haf) : (8'h9d))) != {(~|(8'ha3)), {(8'ha7), (8'hb1)}})) : (|{((&(8'haf)) ? {(8'hae)} : ((8'hbb) & (8'hbe))), ({(8'hb8)} ? (|(7'h44)) : ((8'ha9) != (8'h9d)))})), 
parameter param48 = (!param47))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  assign y = {wire46, wire44, wire43, reg45, (1'h0)};
  assign wire43 = wire42;
  assign wire44 = (wire39[(3'h5):(1'h1)] ?
                      $signed(wire41[(3'h4):(1'h0)]) : wire42);
  always
    @(posedge clk) begin
      reg45 <= {($signed($signed($signed(wire41))) != (~^((wire40 < wire40) ?
              wire41 : wire40[(1'h1):(1'h0)]))),
          $unsigned((((wire40 + wire42) ?
              wire40[(2'h3):(1'h0)] : (wire43 ~^ wire41)) >= ((~&wire42) ?
              $signed(wire40) : {(8'ha7)})))};
    end
  assign wire46 = (~&((($unsigned(reg45) && $unsigned(wire40)) < wire41[(3'h7):(3'h4)]) ?
                      $signed(reg45) : $signed({$signed(wire40), wire44})));
endmodule
