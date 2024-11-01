module top
#(parameter param174 = (-(^~(({(8'ha5), (8'hb3)} ? {(8'ha4), (8'h9d)} : {(8'ha9), (8'h9c)}) << (((8'hbb) ? (8'haa) : (8'ha9)) * (~&(8'hbf)))))), 
parameter param175 = (((8'hb3) ? (((^param174) ? (^param174) : (param174 >= param174)) ? (^~(param174 < param174)) : (param174 ? (param174 ? param174 : (7'h40)) : param174)) : param174) ~^ ((!(~^(param174 > param174))) >> ((8'h9c) & ((param174 != param174) ? param174 : (param174 >> param174))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire172;
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  assign y = {wire36,
                 wire5,
                 wire4,
                 wire38,
                 wire39,
                 wire40,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire172,
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
                 reg52,
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
  assign wire4 = wire0;
  assign wire5 = wire3;
  module6 #() modinst37 (.y(wire36), .wire11(wire5), .wire7(wire0), .wire10(wire4), .wire8(wire1), .clk(clk), .wire9(wire2));
  assign wire38 = $unsigned(wire4);
  assign wire39 = $signed($signed($unsigned(($signed(wire36) | ((8'hab) ?
                      (8'hbe) : wire3)))));
  assign wire40 = (-(8'h9d));
  always
    @(posedge clk) begin
      reg41 <= (((^(-$signed(wire36))) & (!$unsigned(((8'hb5) & (8'ha7))))) ?
          {{(wire3[(2'h2):(1'h1)] ? {(8'hb2), wire4} : $unsigned(wire39)),
                  wire36[(4'hd):(4'hc)]},
              wire39} : wire36);
      reg42 <= wire1;
      reg43 <= wire1;
      reg44 <= reg41;
    end
  always
    @(posedge clk) begin
      reg45 <= {reg43, wire1[(4'he):(4'he)]};
      reg46 <= wire4;
      reg47 <= $signed($unsigned(reg43));
      if (reg45[(2'h2):(1'h1)])
        begin
          reg48 <= ({reg46[(1'h1):(1'h0)]} ? wire40[(2'h3):(2'h2)] : wire38);
          reg49 <= {(8'ha2), $unsigned($unsigned($unsigned(wire1)))};
          reg50 <= ($unsigned(((~&(~reg43)) ?
              ((^(8'hb4)) ?
                  (wire36 <<< wire3) : ((7'h40) ?
                      (8'ha7) : wire0)) : (reg42[(4'ha):(4'ha)] ?
                  wire2[(2'h2):(2'h2)] : (^~wire40)))) < (8'h9e));
          reg51 <= ((((reg49[(3'h4):(3'h4)] || reg44[(1'h0):(1'h0)]) ?
                  reg44[(4'h9):(3'h5)] : $signed(wire1[(1'h0):(1'h0)])) + $unsigned(wire1[(4'he):(3'h4)])) ?
              wire36 : (-(($unsigned(wire5) >> (~^reg48)) ^ $unsigned({reg41,
                  reg41}))));
          reg52 <= (reg50[(3'h6):(3'h4)] ?
              (8'hba) : ($signed(($unsigned((8'hb9)) << (^reg45))) | ((8'hb1) == (reg44[(3'h5):(2'h3)] >= wire0))));
        end
      else
        begin
          if ((wire3 && $unsigned(reg49[(1'h1):(1'h0)])))
            begin
              reg48 <= ($signed($signed((reg42[(3'h7):(2'h3)] ?
                      $unsigned(wire0) : {(8'hbf)}))) ?
                  reg42[(2'h3):(2'h2)] : ($signed(((reg52 >> reg43) << (reg45 * reg49))) ?
                      $unsigned({reg43[(4'hb):(4'hb)]}) : (^wire5)));
            end
          else
            begin
              reg48 <= $signed((~^reg44[(3'h6):(3'h5)]));
              reg49 <= (-$unsigned(((!(reg43 ?
                  wire2 : wire3)) && $unsigned((reg50 ? (8'ha8) : wire40)))));
              reg50 <= $unsigned($signed($signed({((8'ha7) ? reg43 : wire39),
                  {reg41, wire4}})));
            end
          reg51 <= ((~&$signed({(wire5 ? reg48 : reg45), (8'hae)})) ?
              ($unsigned($unsigned($unsigned((8'h9f)))) ?
                  (~|{(7'h44)}) : {((wire3 ? reg51 : wire3) ?
                          $signed(reg41) : (|reg41))}) : ((reg45 <= $unsigned((~wire39))) ?
                  (~&$signed($signed(wire0))) : $unsigned((~&(reg41 + reg42)))));
        end
      reg53 <= (((~^wire2[(4'h9):(1'h0)]) ?
              $unsigned($signed($signed(wire1))) : $signed(((8'ha8) << wire4[(2'h3):(2'h2)]))) ?
          ($unsigned(({wire5} ?
              $signed(wire36) : $signed(reg41))) > $unsigned(wire40)) : reg50);
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg41[(4'h9):(3'h7)]))
        begin
          reg54 <= (~reg42);
          reg55 <= {(&reg41),
              (($signed(reg42[(4'hb):(4'hb)]) ?
                      ((8'ha3) || (8'ha9)) : ((wire40 ? wire4 : reg45) ?
                          ((8'ha0) ~^ reg44) : (reg50 ? reg50 : wire0))) ?
                  ($signed((reg50 ? (8'hac) : reg42)) ?
                      (~^(reg52 ?
                          reg46 : reg47)) : reg51[(4'he):(4'hc)]) : $signed(wire1))};
          if ((($signed(($unsigned(wire3) ? $signed(wire3) : $signed(reg48))) ?
                  ($signed(reg52) ?
                      reg53[(1'h0):(1'h0)] : $signed($signed(reg51))) : $signed($unsigned(reg42))) ?
              ((-((reg47 ? wire39 : (8'hb0)) + $signed(reg43))) ?
                  wire4[(5'h14):(4'h8)] : ($signed((-wire38)) && ((7'h43) ?
                      $signed((8'hbc)) : reg55))) : (8'ha7)))
            begin
              reg56 <= $unsigned($signed((-{$signed(reg43)})));
            end
          else
            begin
              reg56 <= $unsigned($signed($signed(wire38[(3'h7):(1'h0)])));
              reg57 <= $signed({(^~((wire40 ? wire4 : reg42) ^~ ((8'hb8) ?
                      (8'hb1) : reg51))),
                  {$unsigned((reg54 << wire3))}});
              reg58 <= (^(~|reg46));
              reg59 <= $signed((7'h43));
            end
        end
      else
        begin
          if ((-(-(^~{(wire40 ? reg42 : reg50), $signed(wire39)}))))
            begin
              reg54 <= (reg45[(4'he):(4'ha)] < wire2[(2'h2):(1'h1)]);
              reg55 <= (+(^~reg45[(3'h5):(1'h0)]));
              reg56 <= $unsigned($unsigned(reg45));
              reg57 <= (^wire0);
              reg58 <= (~&(8'hb7));
            end
          else
            begin
              reg54 <= (reg53[(4'hb):(4'h8)] ?
                  $signed(reg53[(5'h10):(5'h10)]) : $signed(((^~(~|reg41)) ?
                      (reg54[(5'h13):(5'h12)] ^~ (reg48 || reg46)) : (!$unsigned((8'hb6))))));
              reg55 <= $unsigned(reg59[(4'hb):(3'h7)]);
            end
          if (reg48[(3'h5):(2'h3)])
            begin
              reg59 <= (-$unsigned((($signed(wire2) | (reg48 ?
                  wire2 : (8'had))) <<< (~|{reg46}))));
              reg60 <= $signed($unsigned((^~reg55)));
              reg61 <= (8'hb2);
              reg62 <= reg42[(3'h5):(2'h2)];
            end
          else
            begin
              reg59 <= (^~$signed(wire40[(3'h7):(1'h1)]));
              reg60 <= $signed(wire40[(4'h9):(3'h4)]);
              reg61 <= (reg57[(2'h3):(2'h2)] | (^~reg55));
              reg62 <= reg41;
            end
        end
    end
  assign wire63 = $unsigned(((($unsigned(reg55) ?
                          wire3 : wire38) && $signed((+(8'h9d)))) ?
                      ($unsigned(reg57) != (8'hbd)) : $signed($unsigned((8'ha2)))));
  assign wire64 = reg48[(2'h3):(2'h2)];
  assign wire65 = (&($unsigned(((wire4 >> reg42) ?
                          wire5[(4'h8):(3'h4)] : (reg42 ? wire2 : reg55))) ?
                      ((|reg60[(4'hc):(4'hb)]) ?
                          ((~reg52) <= {reg43}) : {$unsigned(wire1),
                              (reg41 ~^ wire1)}) : (+$unsigned((|wire3)))));
  assign wire66 = $unsigned($unsigned($unsigned(($unsigned(reg47) >= {reg56,
                      (8'hb7)}))));
  module67 #() modinst173 (.clk(clk), .wire71(wire40), .y(wire172), .wire69(reg56), .wire68(reg57), .wire70(reg48));
endmodule

module module67
#(parameter param170 = ((^{(+((8'hb5) ? (8'hb4) : (8'hbf))), {((8'ha1) ~^ (8'hb1)), (!(8'hb6))}}) ? {({((7'h40) ? (8'hb7) : (8'haf)), ((8'hb5) >> (8'hb0))} ^~ (((8'hab) ? (8'hb2) : (7'h43)) == (~&(7'h40))))} : ((~&{(!(8'ha4)), ((8'ha9) ? (8'hac) : (8'h9e))}) ^ ((((8'hac) >= (8'ha9)) ^ ((8'hba) != (8'h9e))) - {{(8'hb7)}}))), 
parameter param171 = (~^(~&param170)))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire71;
  input wire [(5'h13):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire72;
  assign y = {wire169,
                 wire167,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire72,
                 (1'h0)};
  assign wire72 = (~&$unsigned({({wire71} ?
                          (wire71 ^~ (8'ha4)) : $signed(wire69)),
                      (-wire68)}));
  module73 #() modinst106 (wire105, clk, wire69, wire70, wire71, wire68);
  assign wire107 = wire71;
  assign wire108 = (($unsigned(((&wire72) & $unsigned(wire69))) & $signed($signed((wire72 >> wire69)))) & ($unsigned(wire72) << (wire68 ?
                       ((wire70 < wire72) ?
                           (wire69 ~^ wire68) : $unsigned(wire69)) : wire71)));
  assign wire109 = wire108;
  assign wire110 = $unsigned(wire107);
  assign wire111 = (~|{$signed($unsigned(wire109[(1'h0):(1'h0)])),
                       wire70[(4'ha):(3'h7)]});
  assign wire112 = ({(~&(^wire70[(4'h9):(3'h4)])),
                       (wire110[(5'h12):(3'h7)] ?
                           $signed((wire105 ?
                               wire69 : wire108)) : $unsigned(wire71[(4'h8):(3'h6)]))} < wire68[(4'h9):(3'h5)]);
  module113 #() modinst168 (.clk(clk), .wire114(wire108), .wire116(wire70), .wire115(wire71), .wire117(wire107), .y(wire167));
  assign wire169 = ($signed((($signed(wire105) | $signed(wire69)) << (^~(wire72 >> wire70)))) * {(~^$signed(wire112[(4'h8):(2'h3)]))});
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire18,
                 wire17,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= wire9;
      reg13 <= (&wire10);
      if ({(wire7 ?
              reg13[(5'h12):(2'h2)] : $unsigned($unsigned((reg13 ?
                  wire10 : (8'h9d)))))})
        begin
          if ($signed(((8'hb1) ?
              ($signed($signed(wire10)) || (((8'hbc) ? (8'hb8) : wire8) ?
                  wire8[(4'hf):(1'h0)] : (^wire8))) : (~&$unsigned($unsigned(reg12))))))
            begin
              reg14 <= $unsigned(wire9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg14 <= $signed($signed((($unsigned(wire9) ?
                  ((8'ha4) >= wire8) : (wire8 >= (8'hac))) ^~ $unsigned($signed((8'haa))))));
              reg15 <= reg12[(4'h9):(3'h4)];
              reg16 <= ($signed((!wire8[(3'h7):(3'h4)])) ?
                  (($signed((8'hbd)) ?
                          (-$signed(wire10)) : $unsigned({reg12, reg13})) ?
                      (~{reg14[(2'h3):(1'h1)]}) : (wire8[(4'hd):(3'h6)] + $signed(wire11[(3'h4):(2'h2)]))) : reg15[(4'hf):(4'hc)]);
            end
        end
      else
        begin
          reg14 <= ((~|reg15[(4'hf):(1'h1)]) ^ wire10[(3'h5):(1'h1)]);
          reg15 <= $signed($unsigned($signed(((wire11 ?
              reg13 : wire7) * (8'hbd)))));
        end
    end
  assign wire17 = ($unsigned($signed($signed($unsigned(wire9)))) ?
                      wire11 : {wire7});
  assign wire18 = wire11;
  always
    @(posedge clk) begin
      if ((reg15 ?
          ($signed((^~(wire17 * (8'hbf)))) ~^ $unsigned($signed({reg16,
              wire7}))) : (~(wire7 > (&reg13)))))
        begin
          reg19 <= (reg12 - ((~&$signed(wire7)) != $signed((wire7[(1'h0):(1'h0)] == ((8'ha2) > reg16)))));
          reg20 <= wire7;
        end
      else
        begin
          reg19 <= (((~&(wire7 ?
                      (reg20 ? (8'ha0) : reg13) : (wire10 | reg12))) ?
                  $signed((8'hb7)) : $unsigned(((reg14 ? reg14 : wire10) ?
                      (wire17 >> wire9) : (reg13 >> wire7)))) ?
              reg20 : ((~$signed($signed((8'hb5)))) || $signed(((&wire7) ?
                  reg12[(3'h4):(2'h2)] : wire9[(3'h5):(3'h4)]))));
          reg20 <= $signed(wire18);
          reg21 <= (+{(~|{(wire18 ? reg12 : wire10)}), $signed(wire8)});
        end
      reg22 <= $unsigned(($signed(wire18) ? reg14[(1'h1):(1'h0)] : (~&reg19)));
      if (wire7)
        begin
          reg23 <= reg13[(2'h3):(2'h3)];
          reg24 <= (+(((wire10[(1'h0):(1'h0)] ? $signed(reg19) : (&wire7)) ?
              (wire10 ? wire11[(2'h2):(2'h2)] : $unsigned((8'hb5))) : (&{wire17,
                  wire7})) >>> ((8'had) ? wire8 : reg19[(2'h2):(1'h0)])));
          reg25 <= (~|(($unsigned(reg24) | ((reg20 >> wire9) ?
              $signed(reg20) : (~^wire17))) | reg15[(4'h8):(2'h2)]));
          reg26 <= reg19[(2'h2):(2'h2)];
        end
      else
        begin
          reg23 <= (8'hb4);
          reg24 <= ($signed({({reg23} ? (!reg21) : (reg22 - reg26))}) ?
              reg24[(4'hb):(3'h5)] : ((reg26[(2'h2):(1'h1)] ?
                  (reg13 && (wire9 - wire7)) : $unsigned((reg13 | (8'hae)))) < wire17));
          reg25 <= reg23[(3'h4):(1'h0)];
          if (reg20)
            begin
              reg26 <= (reg12 ? {(-wire11[(3'h6):(1'h1)])} : wire9);
              reg27 <= $unsigned(($unsigned({(reg13 ? (8'ha2) : reg25),
                      wire9}) ?
                  (^~reg16[(1'h1):(1'h1)]) : wire17));
              reg28 <= reg24[(4'hc):(3'h6)];
              reg29 <= $unsigned(($signed($unsigned((~^reg21))) ?
                  $unsigned(reg26) : ({(^~reg16)} || reg21)));
              reg30 <= $unsigned(((wire17[(5'h11):(4'h9)] < $unsigned((reg28 <= reg22))) == reg29));
            end
          else
            begin
              reg26 <= reg28[(3'h6):(3'h6)];
              reg27 <= (((|reg22) ?
                      (wire18 < ((-reg16) + (wire10 != (8'ha1)))) : wire18) ?
                  $unsigned($unsigned({(^reg13),
                      (reg19 < reg16)})) : ($unsigned((7'h41)) ?
                      reg26 : (8'ha9)));
            end
          reg31 <= ((wire18 <= wire8[(1'h1):(1'h0)]) + $signed($unsigned(reg29)));
        end
      reg32 <= reg30;
      reg33 <= $unsigned(($unsigned((^~(wire9 ^~ reg31))) ?
          (reg20 ?
              (|reg29[(2'h2):(1'h1)]) : $unsigned($unsigned(reg23))) : ((-((8'haf) | (8'ha2))) ?
              $unsigned((~&reg28)) : (^~reg19))));
    end
  assign wire34 = ((^(($unsigned(reg15) < (|reg16)) && (8'haf))) ?
                      reg25[(2'h3):(1'h1)] : (({(!wire8)} && reg23) ?
                          reg32[(1'h1):(1'h1)] : (reg23 ^ {$unsigned(reg23),
                              {(8'hb0)}})));
  assign wire35 = $signed($unsigned((8'hb5)));
endmodule

module module113
#(parameter param166 = (~^(&(~((!(8'h9e)) ? ((8'hb0) >>> (8'ha3)) : {(8'hba)})))))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire117;
  input wire [(5'h13):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  input wire [(4'h9):(1'h0)] wire114;
  wire [(5'h10):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire126;
  wire [(5'h11):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire [(4'h9):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire153,
                 wire152,
                 wire145,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
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
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire118 = wire117[(4'hb):(1'h1)];
  assign wire119 = {(^~$unsigned(wire114[(3'h7):(2'h3)])),
                       (^wire115[(4'h9):(2'h3)])};
  assign wire120 = wire116[(1'h0):(1'h0)];
  assign wire121 = wire114[(2'h3):(2'h3)];
  assign wire122 = {((~|($unsigned(wire118) ?
                           wire115[(2'h3):(2'h3)] : ((7'h42) ?
                               wire117 : wire116))) ^~ ((wire114[(4'h9):(1'h1)] ?
                               $signed(wire116) : $signed(wire121)) ?
                           (~((8'h9f) ?
                               (8'hb2) : wire119)) : ((wire119 ^ wire114) == $signed(wire114))))};
  assign wire123 = $unsigned($unsigned((&(~^(~^wire116)))));
  assign wire124 = (8'hb0);
  assign wire125 = wire123[(1'h1):(1'h0)];
  assign wire126 = ({$unsigned(((wire122 != wire122) | $signed(wire123))),
                           {(wire116 >= (wire118 ^~ wire120))}} ?
                       (8'hab) : $unsigned(((~(wire122 != wire120)) >>> $signed((wire115 <<< wire124)))));
  always
    @(posedge clk) begin
      reg127 <= (wire126 ? (wire115[(2'h3):(1'h1)] != {wire115}) : wire119);
      if ($signed(((-wire118) | wire119)))
        begin
          reg128 <= wire126;
          reg129 <= ($unsigned((~$signed(wire116))) == (~&(+$signed($unsigned((8'hba))))));
          reg130 <= $unsigned((|$signed($unsigned((|reg128)))));
        end
      else
        begin
          if ($unsigned((wire114[(4'h8):(1'h1)] >= (wire126 ?
              (~&{wire125}) : reg130))))
            begin
              reg128 <= $unsigned($signed(($signed($signed((8'hb1))) ?
                  $unsigned((reg129 || (8'hb5))) : wire126)));
              reg129 <= (!(~^{(((7'h41) + wire122) ?
                      $unsigned((8'h9f)) : $signed(wire123))}));
            end
          else
            begin
              reg128 <= $unsigned({$signed(((~^wire118) ^~ (~|wire126))),
                  $signed($unsigned(reg127))});
              reg129 <= wire123[(4'h8):(2'h2)];
            end
          reg130 <= ((~$unsigned(wire118)) >> $unsigned(({wire114} ?
              ($unsigned((8'h9f)) ?
                  (reg130 ?
                      (8'hb0) : wire115) : $signed(wire124)) : $unsigned(wire122))));
          if ((+$signed(wire122[(4'hc):(4'hc)])))
            begin
              reg131 <= wire117;
              reg132 <= (wire115[(3'h5):(3'h4)] ?
                  (($unsigned(wire120[(3'h4):(2'h3)]) >= ({wire114,
                          wire125} ^~ (reg129 + reg128))) ?
                      ({wire118} > $unsigned((wire117 ?
                          reg129 : reg127))) : (|wire121)) : wire118[(2'h2):(1'h0)]);
              reg133 <= {wire114[(4'h9):(3'h6)]};
            end
          else
            begin
              reg131 <= (|reg133);
              reg132 <= (8'ha6);
              reg133 <= wire120;
            end
        end
      reg134 <= ($signed($signed(reg131[(3'h5):(2'h3)])) << (((reg131[(2'h2):(2'h2)] >>> reg130[(4'h8):(3'h6)]) ?
              (wire114 ? (~^wire126) : (~&reg130)) : ({reg131, (8'ha7)} ?
                  wire122[(3'h4):(3'h4)] : (8'hb5))) ?
          (wire121 || $unsigned($unsigned(reg129))) : $unsigned(($signed(wire117) | {reg132,
              reg127}))));
      if ((~((reg128 > $unsigned(wire120)) * $signed((((8'ha7) ?
          wire123 : wire125) == $unsigned(wire124))))))
        begin
          reg135 <= $signed((((|wire117) ?
              $signed((reg127 <= wire126)) : wire114) < (((reg131 ?
                  reg130 : wire116) <<< wire126) ?
              $signed($unsigned(reg129)) : (wire121[(4'h8):(3'h7)] << reg127))));
          reg136 <= $unsigned($signed((($unsigned(wire114) || reg132[(2'h3):(1'h1)]) ?
              $signed($unsigned(wire119)) : {(8'ha9), $unsigned(wire114)})));
          reg137 <= ($unsigned(wire119[(4'hc):(4'h8)]) ?
              $unsigned($signed(wire119)) : (wire116 ?
                  wire120[(1'h0):(1'h0)] : $unsigned(((|wire119) ?
                      $unsigned(reg135) : $unsigned(wire118)))));
          reg138 <= wire114;
          if ($unsigned($unsigned($unsigned(reg134))))
            begin
              reg139 <= ($unsigned($unsigned($unsigned((wire122 & reg130)))) > {({(~|reg132)} ?
                      reg129 : reg138)});
              reg140 <= wire118[(1'h1):(1'h1)];
              reg141 <= (reg137[(1'h1):(1'h1)] ?
                  {$signed(($unsigned((8'h9c)) ?
                          reg128[(2'h2):(1'h0)] : reg138[(1'h0):(1'h0)])),
                      {wire120[(3'h5):(3'h4)],
                          ($unsigned(wire124) ~^ $unsigned((8'h9f)))}} : (reg131 ?
                      (&{(|reg138), wire119}) : {wire123,
                          (+$unsigned(wire121))}));
            end
          else
            begin
              reg139 <= {$unsigned(($signed(wire121[(3'h4):(1'h0)]) ~^ (8'ha3)))};
              reg140 <= reg135;
              reg141 <= $signed((wire125[(1'h0):(1'h0)] ?
                  ({((8'h9f) ? (8'ha6) : reg127)} ?
                      wire122 : (&wire119[(1'h0):(1'h0)])) : (wire117[(4'h9):(2'h2)] && ((reg133 != reg139) ?
                      (+wire114) : (wire119 ? reg138 : wire126)))));
              reg142 <= $signed(wire119);
            end
        end
      else
        begin
          reg135 <= wire114[(1'h1):(1'h1)];
          reg136 <= (((reg139 ?
                  ((reg141 ? reg131 : reg128) > (wire126 ?
                      (8'hb0) : reg130)) : wire126[(2'h2):(2'h2)]) ?
              ((^~(reg142 ? wire121 : wire115)) ?
                  ($signed(reg129) || (wire116 ?
                      wire124 : reg140)) : $signed(reg127[(2'h3):(1'h1)])) : (wire116 ?
                  (wire118[(1'h1):(1'h1)] ?
                      (reg137 >> wire123) : $unsigned(wire118)) : $signed($signed(reg140)))) + (reg134[(1'h1):(1'h0)] ?
              wire118 : $unsigned((reg132[(2'h3):(1'h1)] << (wire118 ?
                  reg132 : reg128)))));
        end
      reg143 <= ((|{(~&$signed(reg130))}) ?
          (^($unsigned($signed(wire119)) >> $signed($signed((8'hbd))))) : reg133[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg144 <= ($unsigned((($signed(wire119) <<< {wire121}) >>> (^(-reg142)))) >>> $signed((|$signed(wire122))));
    end
  assign wire145 = reg139[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg146 <= ($unsigned({reg144[(4'h9):(4'h8)]}) > (~$signed($unsigned(reg129[(4'hc):(4'hb)]))));
      reg147 <= reg139;
      reg148 <= ((({(+wire126), (wire145 ? (8'hb5) : reg142)} ?
                  (^~(reg146 ? wire145 : wire124)) : {$signed(reg138)}) ?
              (((wire121 > reg139) ?
                  $unsigned(reg147) : (~wire124)) * (!wire124)) : (^(((8'ha1) ?
                  reg143 : reg141) != (reg127 <= wire122)))) ?
          $signed((^~($signed(wire126) ?
              {reg130} : (|wire114)))) : reg137[(1'h1):(1'h1)]);
      reg149 <= wire116;
      reg150 <= ({({$unsigned(reg129)} ?
              wire117[(4'h8):(3'h7)] : $signed($unsigned(reg134)))} - $unsigned(((wire123[(3'h5):(2'h3)] ?
              {wire118} : {reg139}) ?
          ($signed(reg135) || (~^reg142)) : (!$unsigned((8'had))))));
    end
  always
    @(posedge clk) begin
      reg151 <= $signed($signed(wire119));
    end
  assign wire152 = (reg131 >> $unsigned({$unsigned(reg146),
                       $signed($unsigned(wire122))}));
  assign wire153 = reg148;
  always
    @(posedge clk) begin
      if ({$signed({reg134[(1'h0):(1'h0)],
              ((reg127 ? reg149 : wire125) != (reg144 || reg151))}),
          {reg127,
              (($signed(reg131) == (reg141 ? reg134 : (8'hbb))) > (8'ha0))}})
        begin
          reg154 <= $unsigned((~$signed($signed((~^wire153)))));
          reg155 <= {{(&reg139), wire122}, wire152[(1'h1):(1'h0)]};
          reg156 <= ($unsigned($signed(((reg127 ?
              reg146 : wire126) - $signed(reg144)))) ^ {$signed(wire121[(2'h3):(1'h0)])});
          reg157 <= (reg150[(3'h6):(3'h4)] > (~^$signed(((wire117 != wire121) * (wire153 ?
              reg156 : (8'hb3))))));
          reg158 <= $signed(((wire121 != $signed($signed((8'haf)))) + $signed(wire123[(2'h2):(1'h0)])));
        end
      else
        begin
          if ((8'ha7))
            begin
              reg154 <= (^$unsigned(wire118));
              reg155 <= (8'ha5);
            end
          else
            begin
              reg154 <= reg150[(1'h1):(1'h1)];
              reg155 <= $signed((wire115[(4'ha):(2'h3)] ?
                  (reg149[(2'h2):(2'h2)] ?
                      (reg133[(2'h2):(1'h1)] ?
                          $signed(reg144) : wire145[(2'h3):(2'h3)]) : wire115) : reg156[(3'h5):(1'h1)]));
              reg156 <= {reg149[(4'h8):(3'h4)],
                  (reg151[(3'h6):(3'h6)] ?
                      ($signed((~|reg127)) ?
                          wire114[(2'h2):(1'h1)] : (+reg149[(1'h0):(1'h0)])) : (8'had))};
              reg157 <= (!$signed($unsigned(($signed(reg158) - $signed(reg141)))));
              reg158 <= reg130;
            end
        end
      reg159 <= $unsigned((wire123[(3'h5):(1'h0)] ?
          $unsigned(((7'h44) << wire119)) : ($signed((reg147 - (8'hb0))) ^~ (&{reg144,
              reg157}))));
      if ({$unsigned((~^$unsigned((reg143 < reg151))))})
        begin
          reg160 <= $unsigned(reg135[(2'h3):(1'h0)]);
          reg161 <= (~|wire124);
          reg162 <= ((~^reg137[(3'h6):(1'h0)]) ?
              reg146 : ((((8'ha3) >= (&reg139)) ?
                      {$unsigned((8'hb2)),
                          wire124[(2'h2):(2'h2)]} : $signed((wire124 ?
                          reg158 : reg149))) ?
                  (|((wire123 ? wire125 : reg138) >= (wire124 ?
                      reg133 : reg139))) : (^((reg148 ?
                      reg138 : reg142) ^ $signed(reg129)))));
        end
      else
        begin
          reg160 <= $unsigned($signed(wire124[(1'h1):(1'h0)]));
          reg161 <= reg157[(4'he):(1'h1)];
        end
      reg163 <= (&{$unsigned($signed(((8'hb6) << reg141)))});
    end
  assign wire164 = $unsigned((~^$unsigned({(!(8'h9c))})));
  assign wire165 = $signed((reg129 >> (8'hb1)));
endmodule

module module73
#(parameter param103 = {(8'hbb), (((|(8'haa)) ? (^(~^(8'hbc))) : (~&((8'had) >>> (8'ha9)))) > {(8'h9d)})}, 
parameter param104 = ((|(({(8'hb8)} || (param103 ? param103 : param103)) <<< ((~&param103) != ((8'haa) ? param103 : param103)))) <= param103))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire77;
  input wire signed [(3'h6):(1'h0)] wire76;
  input wire signed [(3'h7):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg78 <= wire74[(1'h1):(1'h0)];
      if ($signed($unsigned(((|(wire74 ? reg78 : (8'ha1))) >> (8'haf)))))
        begin
          reg79 <= (&{$unsigned($unsigned((reg78 ? reg78 : (8'hb0)))),
              $unsigned((wire76 ? wire75 : (!wire76)))});
        end
      else
        begin
          reg79 <= {wire75[(3'h5):(3'h5)], $unsigned(wire77)};
          if (($unsigned((8'h9e)) != $unsigned(({{wire75, wire74},
              $unsigned(reg78)} <<< wire74[(1'h0):(1'h0)]))))
            begin
              reg80 <= wire74;
              reg81 <= $unsigned({(($signed(wire77) ?
                      {reg80,
                          reg80} : wire77[(3'h6):(1'h1)]) && $unsigned(((8'haa) * reg79))),
                  ($signed(wire76[(3'h4):(2'h3)]) | $unsigned({(8'ha6),
                      (8'haa)}))});
              reg82 <= (((~&(8'hb9)) & (reg80[(1'h0):(1'h0)] ?
                  (wire77 ?
                      reg81 : (wire76 ?
                          wire77 : reg81)) : (+(~^wire76)))) | $unsigned((~((8'hb3) ?
                  $unsigned(wire76) : $unsigned(reg80)))));
              reg83 <= reg81;
            end
          else
            begin
              reg80 <= ($signed((reg79[(4'h8):(3'h6)] ^ ({(8'ha7), reg79} ?
                      wire76 : $signed(wire75)))) ?
                  wire76[(3'h6):(1'h1)] : $signed($unsigned($signed((reg83 ?
                      reg78 : wire76)))));
              reg81 <= {({$signed((reg79 ? wire76 : reg82))} ?
                      $unsigned((+(^wire75))) : $unsigned(reg82[(2'h3):(2'h3)])),
                  ((^~$unsigned(reg80[(3'h7):(2'h2)])) >> {(8'hb6)})};
              reg82 <= $unsigned(reg81);
              reg83 <= (($signed(($signed(wire75) ?
                  reg78 : ((8'hbd) ? reg80 : reg80))) <<< (($signed((8'hbf)) ?
                      $unsigned(wire75) : $signed(reg79)) ?
                  $signed((wire77 != reg80)) : ((wire75 ~^ reg78) ?
                      wire74 : $unsigned(reg81)))) || $unsigned(($signed((reg79 ?
                      reg81 : wire74)) ?
                  $unsigned($signed(reg81)) : (~|(wire74 <<< wire76)))));
              reg84 <= ($signed({wire75}) - ($signed(wire76) ?
                  {reg83[(2'h3):(2'h2)]} : $unsigned(wire75[(2'h3):(1'h0)])));
            end
          reg85 <= $unsigned(reg80[(4'hd):(4'hc)]);
        end
      reg86 <= reg84[(3'h5):(2'h2)];
      if (({{((reg81 ? reg85 : (8'ha2)) ^ ((8'hbf) ? (8'hb4) : (8'h9f))),
                  {(wire76 ^ reg78)}},
              reg83[(1'h0):(1'h0)]} ?
          (reg84 ?
              ({{reg81}} - ($unsigned(reg85) + (^reg85))) : $signed($unsigned((reg79 ~^ (8'h9d))))) : reg80))
        begin
          reg87 <= reg81[(4'hb):(3'h7)];
          if ($unsigned($signed(reg86)))
            begin
              reg88 <= reg79[(1'h1):(1'h1)];
              reg89 <= reg88;
            end
          else
            begin
              reg88 <= {wire76[(3'h4):(2'h2)], (8'ha0)};
              reg89 <= (reg89 < reg86);
              reg90 <= $unsigned($signed({reg81[(3'h5):(3'h5)],
                  (reg89[(3'h4):(1'h0)] ?
                      $unsigned((8'h9c)) : $signed(reg87))}));
              reg91 <= reg85;
            end
          reg92 <= {(~$signed({(~|reg91), (8'h9e)}))};
        end
      else
        begin
          if (reg88)
            begin
              reg87 <= ((^((reg79 * (7'h41)) || wire75)) ?
                  $signed(({((8'haf) + (8'h9d)), (reg92 >> reg79)} ?
                      $unsigned((8'hbd)) : wire76)) : ($signed($unsigned((reg81 ^ wire75))) - (((reg83 - (8'h9e)) ?
                          $signed(reg80) : $signed(wire74)) ?
                      {(~^reg88), (8'ha5)} : $signed((reg83 && reg85)))));
              reg88 <= ($unsigned(reg88) ?
                  $unsigned((^(reg87 ?
                      (reg90 ? (8'hb9) : reg89) : {wire76,
                          reg79}))) : (reg81 <<< $signed(wire74)));
            end
          else
            begin
              reg87 <= ((reg90[(5'h12):(4'hc)] + (^~$signed($signed(reg79)))) ?
                  (^$signed(($unsigned(reg82) ?
                      $unsigned((8'hba)) : (reg92 <<< reg81)))) : wire76[(3'h4):(3'h4)]);
              reg88 <= wire76[(2'h2):(1'h0)];
            end
        end
    end
  assign wire93 = ($unsigned($signed((!$signed(reg85)))) ? reg92 : reg82);
  assign wire94 = (+$signed(wire76[(3'h5):(1'h0)]));
  assign wire95 = $signed((~|reg86));
  assign wire96 = $signed(reg83);
  always
    @(posedge clk) begin
      if ((((+{(wire96 ? reg83 : wire74),
              wire94}) << ($unsigned($unsigned(reg87)) ?
              {(reg82 ? reg82 : reg90),
                  wire93[(2'h3):(1'h0)]} : ($signed(reg79) ?
                  reg86[(5'h10):(1'h1)] : $signed(reg83)))) ?
          ($unsigned({(reg85 ? reg79 : reg91)}) ?
              $unsigned((+$unsigned((7'h43)))) : ((reg84[(5'h14):(4'he)] ?
                      $unsigned(reg89) : reg84[(2'h3):(2'h3)]) ?
                  ((reg92 >= reg87) <= {reg79}) : (+wire77[(4'ha):(2'h3)]))) : (reg86 >> reg83)))
        begin
          reg97 <= ($signed($unsigned({wire75[(3'h6):(1'h0)], (~^reg81)})) ?
              wire77[(4'ha):(1'h1)] : $signed($signed(((8'hb2) << $unsigned((8'haa))))));
          reg98 <= $signed($unsigned((reg86[(4'hd):(4'ha)] ?
              $unsigned($unsigned(reg87)) : ($unsigned((8'hab)) >= reg80[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg97 <= (8'hbe);
          reg98 <= ({(wire94 ? $signed(reg79[(4'hb):(4'h8)]) : wire94),
              reg81[(4'he):(1'h1)]} << (~reg98));
          reg99 <= reg78;
          reg100 <= wire95[(1'h1):(1'h1)];
        end
    end
  assign wire101 = $unsigned((^~$unsigned($signed((~reg97)))));
  assign wire102 = $signed(((8'hbb) ?
                       reg79[(4'hb):(2'h2)] : {reg78, (~&{reg99})}));
endmodule
