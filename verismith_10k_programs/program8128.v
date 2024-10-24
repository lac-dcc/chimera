module top
#(parameter param133 = (({(((8'ha0) ? (8'had) : (8'hba)) << {(8'h9e)})} - ({{(8'hbb), (8'hb3)}} ? ((&(8'hb4)) ? ((8'hb6) ? (8'h9f) : (8'hb7)) : ((8'had) - (8'ha0))) : ((^~(8'hb7)) ? (|(8'ha7)) : (8'haf)))) < (^{{((8'hb9) ? (8'hba) : (8'ha7))}, (~&((8'ha6) == (8'hb7)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire131;
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire13,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire28,
                 wire131,
                 reg10,
                 reg11,
                 reg12,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire5 = $signed(wire4[(4'hb):(3'h5)]);
  assign wire6 = {$unsigned(wire4)};
  assign wire7 = wire5;
  assign wire8 = wire1[(4'hf):(4'hc)];
  assign wire9 = wire8[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg10 <= $unsigned(($unsigned(((wire9 ? wire9 : wire1) ?
          $signed(wire9) : wire8)) >= wire3[(3'h6):(3'h5)]));
      reg11 <= (!{{wire7}, $signed((8'ha8))});
      reg12 <= $unsigned($unsigned(wire7[(1'h1):(1'h0)]));
    end
  assign wire13 = ((((^~wire4) ? wire1 : $unsigned((reg12 ? (8'hbf) : wire9))) ?
                          reg10 : $unsigned({wire6[(3'h6):(3'h5)]})) ?
                      $unsigned($signed((~$signed(reg11)))) : ($signed(($unsigned(reg11) != (reg12 + wire9))) <= (((wire2 && wire5) && $signed(wire7)) ?
                          $signed(wire7) : $signed($signed((8'hb1))))));
  always
    @(posedge clk) begin
      if (reg12)
        begin
          reg14 <= wire8;
          reg15 <= ($signed(wire5[(3'h6):(3'h4)]) ?
              wire8[(3'h6):(3'h5)] : $signed((!(!((8'hac) ? wire4 : wire8)))));
          reg16 <= ((&reg10) ?
              (~($unsigned((^~wire1)) ?
                  reg12 : ({wire8,
                      (8'ha4)} == ((8'ha3) ^ wire8)))) : $unsigned(wire8));
        end
      else
        begin
          if (($signed((^(reg16[(4'h9):(2'h3)] ?
                  (reg14 ? wire7 : reg14) : $signed((8'hb2))))) ?
              $signed((wire3 ^~ ({wire2} ~^ reg14[(3'h6):(2'h2)]))) : $unsigned(wire6)))
            begin
              reg14 <= (reg16 ?
                  ($unsigned((~|(reg12 ?
                      wire5 : wire7))) | $signed({$unsigned(wire9)})) : ($signed(wire7[(2'h2):(1'h1)]) ?
                      $signed($unsigned(wire9)) : ((-wire9) ?
                          wire0[(1'h0):(1'h0)] : (reg15[(5'h13):(3'h5)] && wire0))));
              reg15 <= $signed(wire6[(3'h6):(2'h3)]);
              reg16 <= {$signed($signed($unsigned((reg12 ? wire1 : wire4)))),
                  $signed((wire8 >> (~^(wire4 * wire2))))};
              reg17 <= (wire6 ?
                  {{(^~$unsigned(reg12))}} : ({(+wire0[(1'h1):(1'h0)])} ^ reg14));
              reg18 <= {$signed((-(-(+(8'hac))))), (^~{reg16})};
            end
          else
            begin
              reg14 <= $signed((~&$signed(($unsigned(wire1) ?
                  (~&reg14) : (wire2 ? wire8 : wire0)))));
            end
        end
      reg19 <= ($signed($unsigned(((^reg11) > (|(8'hbd))))) ^~ wire7);
      reg20 <= wire6[(3'h7):(3'h7)];
      reg21 <= {((^$unsigned(((8'hae) ? reg18 : reg10))) ?
              $unsigned(reg11) : reg11[(5'h12):(3'h6)])};
    end
  assign wire22 = ($signed(reg14[(2'h2):(1'h1)]) ?
                      ({wire3[(4'ha):(3'h7)],
                              ($unsigned(reg19) >>> (reg10 <= reg11))} ?
                          {(|$signed(wire2))} : reg17) : reg11[(4'hf):(3'h4)]);
  assign wire23 = wire22[(3'h4):(2'h3)];
  assign wire24 = (^(reg21 - $signed(wire22)));
  assign wire25 = ((((^$unsigned(reg14)) ?
                          (wire3 - (8'hab)) : wire22) * {wire4}) ?
                      (reg20 ?
                          {$unsigned($unsigned(reg19))} : $unsigned($unsigned((wire6 | reg14)))) : $unsigned((reg17 != ((!(8'hb8)) ?
                          (wire6 ? wire4 : wire0) : (wire24 ?
                              reg14 : wire5)))));
  always
    @(posedge clk) begin
      reg26 <= reg14[(1'h1):(1'h0)];
      reg27 <= $unsigned((8'haa));
    end
  assign wire28 = reg26;
  module29 #() modinst132 (.y(wire131), .wire32(reg18), .wire30(wire4), .wire33(reg14), .wire31(reg15), .clk(clk));
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire33;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire128;
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  assign y = {wire130,
                 wire74,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire35,
                 wire34,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire112,
                 wire128,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire34 = (((|wire33[(4'hf):(3'h7)]) ?
                      (~|((+wire30) ?
                          (wire30 ?
                              wire31 : wire33) : wire32[(2'h3):(2'h3)])) : $signed($signed((wire32 ?
                          (8'h9e) : wire32)))) ^ (7'h43));
  assign wire35 = wire32[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned(wire33))
        begin
          reg36 <= wire35[(3'h4):(2'h3)];
          reg37 <= {($signed((reg36 || (wire30 ? (8'hb7) : wire35))) ?
                  (wire31 >> $signed((~&(8'hb8)))) : reg36),
              {wire35[(4'hc):(4'hb)],
                  $unsigned(((wire33 | wire32) ?
                      (wire32 & wire30) : (wire33 ? wire33 : wire31)))}};
        end
      else
        begin
          reg36 <= (wire30 ~^ (wire32[(1'h1):(1'h0)] == ((-{reg36}) | {{wire35,
                  wire34}})));
          if (wire35)
            begin
              reg37 <= $unsigned((wire35[(1'h0):(1'h0)] ?
                  reg36[(2'h3):(2'h3)] : (wire32 <<< {(!wire35)})));
              reg38 <= $signed(wire34);
              reg39 <= (|$unsigned((((reg38 < reg36) ?
                  wire34 : (~&wire34)) >> {reg38, $unsigned(reg36)})));
              reg40 <= reg38;
            end
          else
            begin
              reg37 <= wire34[(4'h8):(3'h5)];
              reg38 <= $signed(wire32);
              reg39 <= (^$unsigned($signed(($signed(wire34) ?
                  (wire33 * wire35) : (reg37 ? wire32 : reg40)))));
            end
          reg41 <= wire35[(1'h0):(1'h0)];
        end
      reg42 <= wire30;
      if ((^(|wire31)))
        begin
          reg43 <= {wire30, (wire35 && wire30)};
          if ($unsigned($unsigned((($signed(reg43) <= $signed(reg41)) + reg41[(2'h3):(1'h0)]))))
            begin
              reg44 <= reg38;
              reg45 <= (^reg37);
              reg46 <= $unsigned(reg45);
              reg47 <= ({$signed((reg45 > (reg46 <= reg39)))} ?
                  ((({reg37} >= $signed(reg40)) ?
                      ((reg38 == wire32) & reg46[(1'h0):(1'h0)]) : reg38) && $signed((8'hbb))) : $unsigned((({reg39} | wire33[(4'h8):(4'h8)]) ?
                      $unsigned($unsigned(wire35)) : (^(8'ha6)))));
              reg48 <= wire30;
            end
          else
            begin
              reg44 <= $signed((+$unsigned(({reg47, wire34} ?
                  reg39[(2'h2):(1'h1)] : reg37))));
              reg45 <= {(($unsigned($unsigned(reg38)) ?
                          reg36[(4'hb):(1'h0)] : (8'hb8)) ?
                      reg48 : reg47)};
              reg46 <= $signed(($signed(reg41) ?
                  (~|((^~reg38) ^ reg40[(2'h3):(2'h3)])) : $signed($unsigned((reg36 | wire35)))));
              reg47 <= (wire35[(3'h4):(1'h0)] && (^~reg46));
              reg48 <= $unsigned($signed(($signed((reg37 & reg47)) || ((reg40 >>> (8'hbd)) + $unsigned(reg36)))));
            end
          reg49 <= (reg46[(2'h2):(2'h2)] != ($unsigned((^~$unsigned(reg41))) ~^ (+($unsigned((8'hb4)) != (reg36 ?
              reg37 : reg48)))));
        end
      else
        begin
          reg43 <= (((8'hbf) ?
                  wire34[(2'h2):(1'h1)] : (((wire30 ?
                      reg39 : reg44) | $unsigned(reg39)) <<< (^(reg49 ?
                      (8'hab) : wire30)))) ?
              {reg42[(2'h2):(2'h2)], reg36[(4'h9):(2'h2)]} : $unsigned(reg41));
        end
    end
  assign wire50 = reg44;
  always
    @(posedge clk) begin
      reg51 <= reg38[(4'he):(4'h8)];
      reg52 <= $signed(((reg40 ?
          ($unsigned(reg38) ?
              $signed(reg49) : (~reg47)) : $signed((reg43 + wire31))) ~^ (reg41 ?
          (wire31 != {reg37}) : ((^~reg47) & $unsigned(reg36)))));
      reg53 <= $signed(reg47[(4'he):(2'h3)]);
      reg54 <= ($unsigned(((reg37[(4'he):(1'h0)] <<< $unsigned(wire34)) || ((&wire34) ?
          $unsigned(reg49) : (reg47 != reg45)))) | (wire32[(2'h2):(1'h0)] ?
          reg44 : ((reg39 & wire30) <<< reg44[(3'h6):(3'h6)])));
      reg55 <= (~^({reg47[(3'h6):(3'h5)]} ?
          reg47 : $unsigned(((wire33 ? reg36 : wire31) + reg42))));
    end
  assign wire56 = $signed(reg54);
  assign wire57 = (~reg45[(4'h9):(1'h0)]);
  assign wire58 = (~|(({(reg46 << reg41),
                          (reg42 ? wire34 : reg43)} != $unsigned({(8'ha4),
                          wire50})) ?
                      ((^$unsigned(reg44)) + (8'hbc)) : ($unsigned(wire35) + (~|$unsigned((8'h9c))))));
  assign wire59 = reg39;
  assign wire60 = (~(!(((|wire32) == (+(8'ha5))) ?
                      $unsigned({wire32, wire56}) : wire59)));
  module61 #() modinst75 (.wire62(reg42), .wire65(wire60), .y(wire74), .wire63(wire56), .clk(clk), .wire64(wire31));
  assign wire76 = $signed($unsigned($signed($signed($unsigned(reg45)))));
  assign wire77 = (reg43 << reg49[(3'h4):(2'h3)]);
  assign wire78 = ($unsigned(((wire31[(4'h9):(2'h3)] ~^ (wire32 && reg44)) != $signed($signed((7'h44))))) ?
                      $unsigned((&(|$signed(wire31)))) : {$signed((wire34 ?
                              (8'hb5) : (-wire50))),
                          $unsigned(((~^wire32) ^~ wire31))});
  assign wire79 = $unsigned($signed($signed(reg43)));
  assign wire80 = $unsigned((((8'hb2) ? wire35[(1'h0):(1'h0)] : wire79) ?
                      wire58 : $signed((reg49 ? (|(8'hb2)) : (|wire34)))));
  module81 #() modinst113 (.y(wire112), .clk(clk), .wire85(reg42), .wire84(reg48), .wire83(reg38), .wire82(reg44));
  module114 #() modinst129 (wire128, clk, wire50, wire58, wire80, reg44);
  assign wire130 = $unsigned(reg36[(4'h9):(2'h2)]);
endmodule

module module114  (y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire118;
  input wire [(4'hf):(1'h0)] wire117;
  input wire [(5'h15):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg127,
                 (1'h0)};
  assign wire119 = wire115;
  assign wire120 = $signed($unsigned(wire115[(1'h0):(1'h0)]));
  assign wire121 = ((wire116 & (({wire116,
                           wire120} ^ $unsigned(wire117)) ^ (wire116 ?
                           (wire119 ?
                               wire116 : wire116) : $unsigned(wire116)))) ?
                       (($signed(wire118[(1'h1):(1'h0)]) ?
                               ($signed(wire118) > wire116[(2'h2):(1'h0)]) : ((+wire120) ?
                                   (wire119 ?
                                       wire118 : wire115) : (-(8'hac)))) ?
                           $signed($signed((wire116 ?
                               wire115 : wire117))) : {(~|$signed(wire116)),
                               $signed(wire116[(4'h9):(1'h1)])}) : wire115[(1'h0):(1'h0)]);
  assign wire122 = $signed((($signed($unsigned(wire117)) ?
                           wire121 : $unsigned((wire118 ? wire118 : wire121))) ?
                       $signed($signed((8'hb7))) : wire121[(1'h1):(1'h1)]));
  assign wire123 = (!(-(&((wire115 ? wire122 : (8'hb6)) ^ (wire115 ?
                       wire120 : wire118)))));
  assign wire124 = $unsigned((^~$unsigned($signed((wire121 + (8'hba))))));
  assign wire125 = wire119;
  assign wire126 = ({(wire115[(4'ha):(2'h3)] ^ wire124[(1'h1):(1'h1)])} ?
                       (($unsigned(wire120[(4'hd):(3'h4)]) ^~ wire115) ?
                           ($signed($unsigned(wire123)) > (wire116 | $signed((8'had)))) : $signed(({wire120,
                               wire115} | wire125[(3'h4):(1'h0)]))) : $signed((^~$unsigned(wire121[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg127 <= $unsigned(((!$unsigned(wire120[(1'h0):(1'h0)])) ?
          ($unsigned($signed((8'hac))) ?
              {$signed(wire120)} : {(wire125 ~^ wire122)}) : wire115));
    end
endmodule

module module81
#(parameter param111 = ((~^(-((^(8'h9d)) && {(8'hb2), (7'h44)}))) >> ((({(8'h9e), (8'ha0)} >= ((8'hb6) ~^ (8'haa))) && (|{(8'hb4), (8'hb4)})) >> (-{{(8'hb7), (8'h9e)}, (8'ha0)}))))
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire85;
  input wire [(2'h3):(1'h0)] wire84;
  input wire [(3'h4):(1'h0)] wire83;
  input wire signed [(4'hf):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  assign y = {wire110,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg94,
                 (1'h0)};
  assign wire86 = (wire83 != (~^wire83[(2'h3):(1'h0)]));
  assign wire87 = (8'ha6);
  assign wire88 = wire82;
  assign wire89 = $signed(({$signed((|wire85))} >= (-$signed(((8'haa) && wire82)))));
  assign wire90 = $signed(wire89[(2'h3):(2'h3)]);
  assign wire91 = {(-wire82)};
  assign wire92 = (wire91 != $unsigned(wire83[(1'h0):(1'h0)]));
  assign wire93 = {(~^wire89[(3'h7):(1'h1)]), ($signed(wire89) < (8'hbe))};
  always
    @(posedge clk) begin
      reg94 <= (wire89 << (wire88[(4'ha):(1'h0)] >= ($unsigned($unsigned((8'hb1))) ?
          ({wire88, wire82} ?
              $unsigned(wire88) : {wire91}) : $unsigned($signed(wire93)))));
    end
  assign wire95 = (|wire86);
  assign wire96 = (wire92 ?
                      wire90 : $signed($signed($signed($unsigned(wire86)))));
  assign wire97 = wire95[(1'h1):(1'h0)];
  assign wire98 = $signed($unsigned($signed(wire86[(2'h2):(1'h1)])));
  assign wire99 = ({($unsigned($signed(wire85)) + $signed((wire90 ^ (8'hb4))))} >>> ($signed((&$signed(wire96))) ?
                      {$signed(wire98),
                          $signed({wire96,
                              wire98})} : $unsigned($signed($signed(reg94)))));
  always
    @(posedge clk) begin
      if ({wire84, (-wire87[(1'h0):(1'h0)])})
        begin
          reg100 <= (8'hb5);
        end
      else
        begin
          reg100 <= wire84[(1'h1):(1'h1)];
          if ((8'hb8))
            begin
              reg101 <= (~|(({{reg100}, {wire93, wire99}} == {$signed(wire92),
                  $unsigned(wire87)}) ^~ (wire84[(2'h2):(1'h1)] ?
                  $unsigned(((8'hac) ?
                      wire98 : reg94)) : $signed($unsigned(wire82)))));
              reg102 <= $unsigned((wire83 ?
                  (($signed(wire91) ^~ wire83) ?
                      (wire82 ?
                          ((8'hb5) << (8'hb3)) : wire90) : {(|wire89)}) : $signed({(wire97 ?
                          wire90 : (7'h41)),
                      (wire89 ? wire87 : wire88)})));
            end
          else
            begin
              reg101 <= $unsigned($signed(reg100));
              reg102 <= (8'ha0);
              reg103 <= (&wire86[(1'h1):(1'h1)]);
              reg104 <= {(^$unsigned($signed((|wire92))))};
              reg105 <= (8'hbb);
            end
          reg106 <= $unsigned(((&(^~$unsigned(wire84))) > wire88));
        end
      reg107 <= wire82;
      reg108 <= (!wire83);
      reg109 <= {wire93};
    end
  assign wire110 = $signed(reg104[(3'h7):(3'h7)]);
endmodule

module module61
#(parameter param72 = {(|((|(~(8'ha0))) ? (((8'haf) - (8'hac)) ? (^(8'hb0)) : (+(8'hb1))) : (((8'hbd) ? (8'hb2) : (8'hbe)) ? {(8'had), (8'had)} : (8'ha8))))}, 
parameter param73 = (({((param72 - param72) >> (param72 ? param72 : param72))} ? (-(((8'hb4) == param72) + {param72, param72})) : {(~(param72 ? (8'hbe) : param72))}) ^~ (param72 ? (^~param72) : (~^(param72 ? (+param72) : (param72 ? (7'h44) : param72))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire65;
  input wire [(3'h4):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  assign y = {wire71, wire67, wire66, reg70, reg69, reg68, (1'h0)};
  assign wire66 = ($signed($unsigned($unsigned(wire62[(5'h11):(2'h3)]))) ?
                      ($unsigned($unsigned(wire63)) ?
                          wire64 : (wire63[(4'hb):(4'h9)] ?
                              (~|{wire63,
                                  wire62}) : wire62[(4'hc):(3'h5)])) : wire62);
  assign wire67 = $signed(wire64);
  always
    @(posedge clk) begin
      reg68 <= ((($unsigned(((8'hab) ? wire67 : wire66)) ?
                  (8'ha5) : (+(wire65 != (8'hba)))) ?
              ((^wire65) ?
                  (~^$unsigned(wire63)) : (!(wire65 ?
                      wire65 : wire62))) : wire66[(1'h0):(1'h0)]) ?
          ($signed({(wire67 ? wire64 : wire65),
              wire63[(5'h13):(1'h1)]}) >> {wire66}) : ($unsigned(((~^wire65) << wire66)) || wire63));
      reg69 <= $signed(reg68[(4'h9):(4'h8)]);
      reg70 <= wire67;
    end
  assign wire71 = wire66[(1'h1):(1'h1)];
endmodule
