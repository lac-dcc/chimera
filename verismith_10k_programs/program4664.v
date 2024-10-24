module top
#(parameter param120 = {(|((((8'ha3) ^~ (8'h9f)) == {(8'ha4)}) ? ((~|(8'hb4)) ? {(8'ha0)} : ((8'had) | (8'h9d))) : (~^((7'h42) & (8'hb5)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire102;
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  assign y = {wire119,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 wire5,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire102,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = $signed((^~(~|$signed($unsigned(wire1)))));
  always
    @(posedge clk) begin
      reg6 <= (wire1 >>> $unsigned(wire5[(4'h9):(2'h2)]));
      reg7 <= $unsigned(({$unsigned(wire5)} & ($signed(wire3) ?
          ($unsigned(wire4) ?
              $signed(reg6) : (+wire5)) : wire4[(1'h0):(1'h0)])));
      reg8 <= (-wire3);
      reg9 <= wire3;
      if ($unsigned({((~&(^reg8)) || ((wire1 ? wire4 : wire5) ?
              (reg8 ? wire3 : reg7) : (reg7 ? wire4 : reg6)))}))
        begin
          reg10 <= $signed((^(wire5 * $unsigned(wire1))));
          reg11 <= ((!((reg6[(3'h6):(1'h0)] ~^ (reg7 ?
              wire2 : wire0)) != $unsigned(wire3))) * (+(|(&wire3[(2'h2):(1'h0)]))));
          reg12 <= $signed(($signed($unsigned($signed(reg9))) ?
              reg6 : ({wire5[(4'hb):(3'h5)]} ^ $signed((~^wire2)))));
          reg13 <= wire2[(3'h4):(2'h3)];
          if ((^~($signed((&reg8)) ? reg12 : ($signed((-reg11)) * reg9))))
            begin
              reg14 <= (7'h43);
              reg15 <= reg12[(3'h5):(1'h0)];
              reg16 <= reg13[(1'h1):(1'h0)];
              reg17 <= (reg6[(3'h7):(3'h4)] ? (~^wire5) : (!wire4));
            end
          else
            begin
              reg14 <= (($signed($unsigned($signed(reg14))) >> ($signed((reg10 && wire3)) + (~|(|wire0)))) >>> wire4[(5'h12):(4'hd)]);
              reg15 <= $signed(((+reg8[(1'h1):(1'h0)]) - wire0));
              reg16 <= (~{{($unsigned(reg10) ? $unsigned(reg14) : (&reg16)),
                      ($signed(reg6) ? (wire0 == wire2) : reg13)}});
              reg17 <= reg6;
            end
        end
      else
        begin
          reg10 <= $signed(($signed(reg15) << (^reg17[(3'h7):(2'h3)])));
          reg11 <= {(8'hb5)};
          reg12 <= {((^~{(reg6 ? (7'h44) : wire4),
                  {reg16,
                      reg7}}) || (wire2[(3'h4):(1'h0)] <= $unsigned((~&wire4)))),
              reg8[(1'h1):(1'h0)]};
          if ($unsigned($unsigned({reg11})))
            begin
              reg13 <= (((~|reg6) ? $signed((!(wire4 ^ (8'hb4)))) : reg15) ?
                  wire5 : reg10);
              reg14 <= wire0;
            end
          else
            begin
              reg13 <= wire4[(4'h9):(2'h2)];
              reg14 <= wire2;
              reg15 <= $signed($signed(reg10));
            end
          reg16 <= (^~$signed({reg16}));
        end
    end
  assign wire18 = (-reg13[(3'h6):(3'h5)]);
  assign wire19 = (|$unsigned((+$signed(reg8))));
  assign wire20 = ($unsigned({($unsigned(reg8) ?
                          reg6[(1'h0):(1'h0)] : $unsigned(reg15))}) <= {reg14,
                      $signed($signed($unsigned(reg11)))});
  assign wire21 = {(~^(((&reg6) ?
                          $signed(wire20) : $unsigned((8'hb2))) <= (^(^~reg14))))};
  module22 #() modinst103 (.wire26(wire0), .wire25(wire2), .wire24(reg13), .y(wire102), .clk(clk), .wire23(wire21));
  assign wire104 = $signed((reg16 ? reg7 : reg11));
  always
    @(posedge clk) begin
      if ((((((reg12 ^ reg11) >> $signed((8'hb2))) + {reg7}) ?
          (((!reg16) ?
              (wire20 ?
                  reg6 : (8'ha8)) : $unsigned((8'h9e))) >= (!reg16)) : ($signed((reg12 ?
                  reg11 : reg17)) ?
              {wire2, $signed(reg9)} : ((wire102 && wire19) ?
                  reg8 : $unsigned(reg11)))) || (-($unsigned($signed(reg15)) ^~ (~|$signed(reg9))))))
        begin
          reg105 <= wire104;
          reg106 <= $unsigned($signed(wire19));
          reg107 <= $unsigned(wire0[(5'h10):(3'h6)]);
          reg108 <= (reg14[(1'h0):(1'h0)] ?
              $unsigned(((wire20 << wire18) + $unsigned(reg106[(4'ha):(1'h1)]))) : ({(8'ha1),
                  $unsigned((reg10 - reg17))} * (|((reg15 ? wire4 : reg14) ?
                  wire19[(4'h9):(3'h7)] : {reg105, wire4}))));
          reg109 <= ((reg16 ? $signed((~^(+reg17))) : (8'hb7)) ?
              ($unsigned(reg11) ?
                  {$signed($unsigned((8'ha0))),
                      (^(reg106 & wire2))} : (&(&$signed(reg14)))) : $signed(wire4[(4'hb):(4'ha)]));
        end
      else
        begin
          if ((wire4[(1'h0):(1'h0)] ?
              $signed(wire20[(3'h4):(2'h2)]) : (~^($unsigned((^~reg16)) ~^ (wire21[(1'h0):(1'h0)] ?
                  (~|wire5) : (-(7'h43)))))))
            begin
              reg105 <= (-wire18);
              reg106 <= (8'hb1);
              reg107 <= $signed(reg106[(2'h2):(1'h0)]);
              reg108 <= ({wire5} > reg109[(2'h2):(2'h2)]);
            end
          else
            begin
              reg105 <= ($signed(wire2) ?
                  {$signed((wire21 ? wire104 : (reg13 || (8'ha8)))),
                      $unsigned($unsigned((reg10 ^~ wire102)))} : $signed((&$signed((reg17 != reg8)))));
              reg106 <= ($signed((&wire5[(3'h4):(2'h3)])) ?
                  wire21[(4'h9):(1'h0)] : wire21[(3'h4):(1'h0)]);
              reg107 <= (~&reg14);
              reg108 <= $unsigned($unsigned($signed((((8'ha8) == wire104) ?
                  wire19 : $signed(reg15)))));
            end
        end
    end
  assign wire110 = $unsigned(reg107[(1'h0):(1'h0)]);
  assign wire111 = (~reg8);
  assign wire112 = ((({(^~reg15), $signed(wire19)} ?
                       (~^wire3[(2'h2):(1'h1)]) : reg11[(2'h2):(1'h0)]) * (~^(wire3[(1'h1):(1'h1)] - (reg11 ?
                       (8'hbf) : (8'had))))) ^~ (reg7 ?
                       ((~^reg9[(3'h5):(3'h4)]) ?
                           $unsigned({reg108}) : (^(^~(8'hbd)))) : {wire18}));
  assign wire113 = (~|(~&(~((!wire1) ? wire4 : reg109))));
  always
    @(posedge clk) begin
      reg114 <= wire5;
      reg115 <= (8'h9d);
      reg116 <= reg17;
      reg117 <= ({$unsigned(wire18[(1'h1):(1'h0)]),
          wire3[(2'h3):(2'h2)]} >>> (((!(8'hb0)) ?
          {wire110[(3'h7):(1'h1)],
              reg11} : reg105) >= $signed((reg107 * (reg109 - reg108)))));
      reg118 <= (((~$signed((~^(8'hbd)))) ?
              $unsigned(($unsigned(wire102) ?
                  {wire21} : {reg116})) : reg117[(2'h2):(1'h0)]) ?
          reg116 : $unsigned($unsigned(((^wire20) ?
              (wire112 > wire18) : $unsigned(wire111)))));
    end
  assign wire119 = ($signed((wire1 ~^ ({wire4, wire113} ?
                       reg14[(3'h4):(1'h0)] : reg13))) & $signed($signed({$unsigned((8'h9d)),
                       {reg14}})));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire27;
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  assign y = {wire100,
                 wire74,
                 wire73,
                 wire71,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire30,
                 wire27,
                 reg28,
                 reg29,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire27 = $unsigned((wire23[(2'h3):(1'h1)] > (($unsigned(wire25) ?
                          (8'hb9) : {wire25}) ?
                      (wire26 ?
                          ((8'h9c) ?
                              wire23 : wire26) : (^~wire26)) : (8'h9d))));
  always
    @(posedge clk) begin
      reg28 <= ($unsigned(((+wire27) ?
          ($signed(wire24) < (wire24 ? wire25 : wire27)) : $signed({wire27,
              wire24}))) >> wire26[(2'h2):(1'h0)]);
      reg29 <= ({{$unsigned($unsigned(wire24))}} ?
          wire27 : wire25[(5'h10):(4'h9)]);
    end
  assign wire30 = $unsigned(reg28[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg31 <= wire23;
      reg32 <= (($signed(reg29[(1'h1):(1'h1)]) != ($unsigned((~&reg29)) > $unsigned((~reg31)))) & (7'h42));
      reg33 <= ((wire26[(4'hc):(3'h4)] ?
              ((reg32[(4'h8):(2'h3)] || reg32) ?
                  wire25[(4'hd):(4'ha)] : (8'ha3)) : $signed($unsigned({wire24}))) ?
          reg29[(1'h0):(1'h0)] : (reg31 >>> ($unsigned((~&(8'hb0))) ?
              ((reg31 * reg32) ? {(8'h9e)} : (8'hbc)) : ($unsigned(wire23) ?
                  $unsigned(wire30) : $unsigned(reg32)))));
      reg34 <= (-(~&$unsigned($unsigned($unsigned(wire25)))));
    end
  assign wire35 = $unsigned($unsigned($unsigned((~^reg31[(2'h2):(1'h1)]))));
  assign wire36 = ($signed($unsigned({{reg33, wire30},
                      wire35})) <<< (~&((8'hb9) ?
                      (-(reg32 < (8'hba))) : {((8'hac) ? reg33 : reg28)})));
  assign wire37 = reg34[(4'hb):(2'h3)];
  assign wire38 = wire23;
  assign wire39 = (^wire30);
  module40 #() modinst72 (.y(wire71), .wire44(wire38), .wire42(reg33), .wire43(reg31), .clk(clk), .wire41(wire37));
  assign wire73 = $unsigned($signed((~^({(8'hbe), reg33} ?
                      wire30 : reg32[(5'h12):(5'h10)]))));
  assign wire74 = {wire23,
                      ((wire73[(3'h7):(2'h3)] ?
                              {$unsigned(reg31), wire25} : ((wire71 ?
                                  wire37 : (8'ha0)) || {reg32, wire35})) ?
                          $signed((wire23 + wire26[(3'h5):(3'h4)])) : reg32[(3'h7):(1'h1)])};
  always
    @(posedge clk) begin
      reg75 <= {wire26[(3'h4):(2'h2)]};
      reg76 <= ((|(8'ha3)) ?
          wire71[(1'h0):(1'h0)] : (reg33 ?
              (wire73[(4'h8):(1'h0)] | {((8'hae) & wire23),
                  $unsigned(wire38)}) : wire24[(2'h2):(1'h1)]));
      reg77 <= (|(-{reg34[(4'ha):(4'h8)], reg75}));
      reg78 <= reg76;
    end
  module79 #() modinst101 (.wire83(wire27), .wire81(wire25), .wire84(wire35), .y(wire100), .clk(clk), .wire82(wire37), .wire80(reg78));
endmodule

module module79
#(parameter param98 = (&(((!{(8'ha4), (8'hb8)}) & ({(8'haf)} ~^ ((8'hb2) ? (8'hab) : (8'hb8)))) ? ((^((8'hb5) || (8'haf))) ? (~{(8'hbf), (8'hb9)}) : ({(8'hb7)} ? ((7'h44) ? (8'hbd) : (8'ha0)) : {(8'hbb), (8'hae)})) : (({(7'h42), (8'haf)} != (^~(7'h40))) ? (+((8'ha3) ? (8'ha5) : (8'hb8))) : ({(7'h40)} ? ((8'ha7) != (8'hb3)) : (|(7'h44)))))), 
parameter param99 = {(~|param98)})
(y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(5'h12):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  input wire signed [(5'h12):(1'h0)] wire81;
  input wire [(5'h15):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire85;
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  assign y = {wire97,
                 wire85,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire85 = $signed(wire83);
  always
    @(posedge clk) begin
      reg86 <= $signed($unsigned(wire83[(4'h8):(3'h5)]));
      if (($signed($signed($unsigned($signed((8'hb9))))) & reg86[(3'h7):(3'h6)]))
        begin
          reg87 <= $unsigned($unsigned((((reg86 ? wire80 : reg86) ?
              ((8'ha6) <<< wire83) : {wire84}) <= wire83)));
          reg88 <= $unsigned((8'hbd));
          reg89 <= {wire80[(5'h12):(2'h2)],
              $unsigned({wire84, (^((8'ha8) ? wire84 : reg88))})};
          if ($signed(reg88))
            begin
              reg90 <= $signed({({(!reg86), (wire83 ? wire85 : wire81)} ?
                      ({wire84, (8'hbb)} ?
                          (reg86 ?
                              wire85 : wire82) : (reg87 <= wire84)) : (wire80 ?
                          wire81 : reg89[(3'h7):(1'h1)]))});
              reg91 <= $unsigned(wire84[(5'h12):(2'h3)]);
            end
          else
            begin
              reg90 <= (+(&$unsigned(wire82)));
              reg91 <= $unsigned({$signed(((reg91 ?
                      wire85 : (8'hb6)) <<< wire82)),
                  wire80[(1'h1):(1'h1)]});
              reg92 <= ((wire83 * reg91) || $signed(wire83));
              reg93 <= (~&reg90[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg87 <= $unsigned($unsigned(($unsigned($signed(wire82)) && (~|$signed(reg90)))));
          reg88 <= ({{{reg86[(2'h3):(1'h0)]}}} + $signed((8'hba)));
          reg89 <= wire80[(5'h11):(3'h7)];
          reg90 <= $unsigned($signed((((|wire85) * wire80) ?
              reg86[(2'h2):(1'h0)] : reg90[(3'h5):(3'h5)])));
        end
      reg94 <= wire81[(4'hf):(4'h8)];
      reg95 <= $signed(reg92[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg96 <= $signed(reg88);
    end
  assign wire97 = {(((+(wire81 ? wire82 : (8'hb2))) ?
                              (reg94[(1'h0):(1'h0)] <<< $unsigned(wire85)) : (~$unsigned(wire83))) ?
                          $signed({reg87[(2'h2):(1'h1)],
                              reg89}) : reg94[(2'h2):(1'h0)]),
                      (~^(reg94 >= $unsigned((~wire81))))};
endmodule

module module40
#(parameter param69 = ((((((8'ha1) ? (8'h9d) : (8'h9c)) ? ((8'hb2) ? (8'haf) : (8'haa)) : (8'had)) ? (((8'hbb) < (8'hbf)) ? ((8'hbc) ? (8'ha9) : (8'ha4)) : {(8'hb1), (8'h9e)}) : (~&((8'haf) >>> (8'hb0)))) >>> (~(((8'h9e) ? (8'ha7) : (8'hae)) != (|(8'had))))) ? (-{(8'hb1)}) : ((({(8'hbc), (8'ha6)} ? (-(8'hb9)) : {(8'ha5)}) ? ({(8'hac)} ? ((8'ha3) | (8'hbc)) : ((8'hb8) == (8'ha9))) : ((~(8'hab)) ? {(7'h44), (8'ha0)} : {(8'h9f), (8'hb3)})) ? ((((8'hae) >> (8'ha5)) ? ((8'ha1) * (8'ha3)) : (8'ha0)) | (8'h9f)) : ((((8'haf) >= (8'hb8)) ? (+(8'hbc)) : ((8'ha8) ^~ (8'hb9))) ? ((~|(8'hb7)) | (&(8'hb3))) : ({(8'haa), (8'hb5)} ? ((8'hb7) * (8'h9c)) : ((8'hae) << (8'hac)))))), 
parameter param70 = (~^(!(!(!param69)))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire signed [(3'h5):(1'h0)] wire42;
  input wire [(5'h11):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire45;
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire45,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire45 = {((+(~&$signed(wire41))) ?
                          (wire43[(3'h6):(3'h4)] >>> $unsigned((~|wire42))) : (^{(wire44 <<< wire43),
                              {wire44}}))};
  always
    @(posedge clk) begin
      reg46 <= ($signed(wire43) || (8'h9e));
      reg47 <= wire42[(1'h0):(1'h0)];
      if (((~&(|((wire45 ? wire43 : wire45) ?
          (&wire41) : (~wire42)))) ^ $unsigned((&reg46))))
        begin
          reg48 <= {wire43[(2'h2):(1'h1)]};
          reg49 <= (^(((wire42 + reg46) ?
              reg47[(2'h2):(2'h2)] : $signed((wire42 ?
                  wire45 : (7'h42)))) + wire43[(3'h4):(1'h0)]));
        end
      else
        begin
          reg48 <= $signed((reg46[(3'h4):(3'h4)] * wire42[(2'h2):(2'h2)]));
          reg49 <= $signed({(($signed(reg49) ?
                  $signed(reg49) : (wire44 * reg49)) == $signed($signed(wire42)))});
        end
    end
  assign wire50 = (((~^(~|(wire42 ?
                      reg47 : (8'hb4)))) || reg48) >>> wire41[(2'h2):(1'h1)]);
  assign wire51 = (|{wire50});
  assign wire52 = ((+{$unsigned((wire45 >>> wire45))}) ?
                      reg46[(3'h4):(2'h3)] : $unsigned(reg48));
  assign wire53 = $unsigned($signed((reg49[(1'h1):(1'h0)] ^~ wire44)));
  assign wire54 = $unsigned($unsigned({wire52}));
  assign wire55 = (~|$signed(reg49[(4'h8):(2'h3)]));
  assign wire56 = {$unsigned($signed(wire41[(3'h7):(2'h3)]))};
  assign wire57 = $signed($unsigned(wire42));
  assign wire58 = $unsigned((wire56 ?
                      wire42[(3'h4):(1'h0)] : {(+$unsigned(wire52))}));
  assign wire59 = (|(wire42 ? wire52 : (wire58 <<< (-reg47[(3'h5):(1'h0)]))));
  assign wire60 = ({(~wire51[(2'h3):(2'h3)]), wire55} ?
                      $unsigned((wire55[(1'h1):(1'h0)] ?
                          wire44[(1'h0):(1'h0)] : ((wire54 ?
                              wire53 : wire56) == (|wire53)))) : {$unsigned($unsigned((reg49 >= wire45))),
                          (wire42 >> $unsigned((8'ha2)))});
  assign wire61 = $unsigned(((((wire44 ?
                          wire41 : reg48) + reg47[(1'h1):(1'h0)]) ?
                      wire54 : wire59) >> reg49));
  assign wire62 = $signed($unsigned($unsigned($unsigned((reg48 ?
                      reg47 : reg49)))));
  assign wire63 = $signed((wire41[(3'h7):(3'h5)] * (wire50 & $unsigned($unsigned(wire43)))));
  assign wire64 = wire55;
  assign wire65 = ((8'hb5) | (((wire43 ?
                              (wire41 < (8'ha7)) : (wire51 == wire42)) ?
                          (!$signed(wire62)) : (reg49 ?
                              $unsigned(wire45) : wire60[(3'h4):(2'h2)])) ?
                      ((!(~wire53)) ^ reg48[(4'hd):(4'h8)]) : ((wire42[(3'h5):(1'h0)] ?
                          ((7'h43) < reg47) : reg47) + (^~wire44))));
  assign wire66 = wire43[(1'h1):(1'h0)];
  assign wire67 = ({(($unsigned(wire57) | $signed((8'ha7))) >> wire66)} - wire44[(1'h1):(1'h0)]);
  assign wire68 = (^((($unsigned(wire44) ^~ $signed(wire50)) != ((wire44 ?
                          wire56 : wire64) ?
                      (wire67 ?
                          wire64 : wire60) : wire62)) != ($signed((wire59 ?
                      wire51 : wire42)) > wire67)));
endmodule
