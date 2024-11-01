module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire113;
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  assign y = {wire121,
                 wire115,
                 wire21,
                 wire5,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire100,
                 wire113,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire5 = (8'ha0);
  module6 #() modinst22 (.clk(clk), .wire10(wire2), .wire8(wire0), .wire7(wire4), .wire11(wire1), .y(wire21), .wire9(wire3));
  assign wire23 = (wire21[(3'h5):(3'h4)] ?
                      $signed({wire2,
                          ((!(8'ha9)) ~^ {wire3,
                              wire1})}) : $signed($unsigned(wire3)));
  assign wire24 = (~&(((wire21 ? wire2[(3'h7):(3'h7)] : (~^wire1)) ^ (&{wire23,
                      wire5})) ^ $unsigned(wire3[(3'h7):(2'h2)])));
  assign wire25 = $signed((&((7'h40) & (|(&wire21)))));
  assign wire26 = (~$signed(($unsigned(wire23[(3'h7):(1'h1)]) ?
                      {(7'h43)} : $signed($signed(wire2)))));
  assign wire27 = wire21;
  assign wire28 = (~^((&wire27[(1'h1):(1'h1)]) != (($unsigned(wire0) ?
                          $signed(wire21) : (~&wire24)) ?
                      wire21[(2'h2):(1'h0)] : (~|{wire27}))));
  assign wire29 = wire2[(5'h14):(3'h7)];
  assign wire30 = (~^wire23[(4'hb):(4'ha)]);
  assign wire31 = ($unsigned($signed(((wire24 ?
                          wire1 : (8'hae)) & $signed(wire23)))) ?
                      (wire26[(1'h1):(1'h1)] ?
                          ($signed(wire0[(1'h1):(1'h1)]) ?
                              wire28 : wire25) : $signed((~&(wire3 ?
                              wire21 : wire28)))) : wire1);
  module32 #() modinst101 (.wire35(wire3), .clk(clk), .wire36(wire24), .y(wire100), .wire34(wire1), .wire33(wire28));
  module102 #() modinst114 (.wire104(wire29), .wire103(wire30), .y(wire113), .clk(clk), .wire106(wire100), .wire105(wire5), .wire107(wire26));
  assign wire115 = {($unsigned(wire23) ? wire23 : wire3)};
  always
    @(posedge clk) begin
      reg116 <= $unsigned($signed($signed((&(wire23 ? (8'haf) : wire100)))));
      reg117 <= wire25[(5'h10):(4'he)];
      reg118 <= $unsigned($signed($signed({{wire113},
          (wire21 ? wire25 : wire28)})));
      reg119 <= ($unsigned(($unsigned($signed(wire21)) ?
          $signed((!wire5)) : reg117)) & (^~$unsigned(reg117)));
      reg120 <= (^$unsigned({(~$unsigned(wire113))}));
    end
  assign wire121 = (~|wire1);
endmodule

module module102
#(parameter param112 = ((|((8'ha9) ^~ (~|(&(8'hbd))))) << (&((((8'hb4) - (8'h9c)) == ((8'hb9) ? (8'hb7) : (8'ha1))) ? (((8'hae) - (8'ha6)) ? {(8'hbe)} : (^(8'hb1))) : (((8'h9c) ? (8'hb7) : (7'h41)) ? (~(7'h44)) : ((8'hba) ~^ (8'haa)))))))
(y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire107;
  input wire [(5'h13):(1'h0)] wire106;
  input wire [(5'h10):(1'h0)] wire105;
  input wire signed [(5'h13):(1'h0)] wire104;
  input wire signed [(4'h9):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  assign y = {wire111, wire110, wire109, wire108, (1'h0)};
  assign wire108 = $unsigned({$unsigned($signed(wire103))});
  assign wire109 = ($unsigned(((^(wire107 - wire106)) ?
                           $unsigned((wire106 ?
                               wire107 : wire104)) : (wire105[(3'h7):(3'h4)] ?
                               wire105 : (~&wire103)))) ?
                       ((wire105 ^ wire106[(4'he):(2'h3)]) ?
                           (8'hb0) : $unsigned({wire105,
                               (wire108 ?
                                   (8'hb3) : wire106)})) : (~|((|wire105[(1'h0):(1'h0)]) ?
                           $unsigned((wire104 ?
                               wire108 : (8'hb2))) : (8'hbc))));
  assign wire110 = $signed((((!(wire109 || wire105)) ?
                       (+wire107[(4'h9):(3'h4)]) : wire107) >= wire109));
  assign wire111 = wire106;
endmodule

module module32
#(parameter param99 = (((({(8'hbb)} >= (~&(8'hb8))) << (+(!(8'hb4)))) | ({((8'hb0) ^~ (8'haa))} <= (((8'ha7) << (8'hbc)) ? {(8'hb5)} : ((8'h9e) ? (8'hb5) : (8'h9f))))) ? {(7'h41)} : ((((&(8'hae)) ? (^~(8'ha8)) : (~&(8'ha0))) - ({(8'haa), (8'ha8)} ? ((8'hb0) ? (8'hb4) : (8'ha2)) : ((8'hbe) != (8'h9d)))) ^~ ((~^(-(8'hab))) + (&((8'hb0) ? (8'hba) : (8'haf)))))))
(y, clk, wire33, wire34, wire35, wire36);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire35;
  input wire signed [(5'h15):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire89;
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire98,
                 wire96,
                 wire93,
                 wire92,
                 wire91,
                 wire37,
                 wire38,
                 wire39,
                 wire89,
                 reg97,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire37 = $unsigned((wire33[(3'h4):(2'h2)] ?
                      (-(^~{wire33})) : (({(8'hb5)} ?
                              (8'hb5) : wire34[(1'h1):(1'h0)]) ?
                          {$unsigned(wire34)} : {(^~wire35)})));
  assign wire38 = $unsigned($signed($signed($signed(wire37))));
  assign wire39 = (wire34 < {($signed($unsigned(wire34)) ?
                          wire37 : (-{wire33})),
                      (8'had)});
  module40 #() modinst90 (wire89, clk, wire33, wire36, wire35, wire38, wire37);
  assign wire91 = $unsigned(($unsigned($unsigned(wire89)) < {(wire35[(4'he):(4'hc)] ?
                          (wire36 ? (8'ha7) : wire33) : (~wire37))}));
  assign wire92 = $signed({$unsigned(((~^wire33) + (~|wire38))),
                      $signed(wire36[(5'h11):(1'h0)])});
  assign wire93 = $signed({((wire36 > $unsigned(wire35)) ?
                          wire38 : ($signed(wire34) <= ((8'hb7) ?
                              wire89 : wire39))),
                      (wire92 ? wire36[(5'h12):(3'h5)] : wire35)});
  always
    @(posedge clk) begin
      if ({((^((~wire91) ? (wire33 ? wire34 : wire35) : (^wire89))) + wire91),
          wire39})
        begin
          reg94 <= (wire38 >= $unsigned(($unsigned($unsigned(wire39)) ?
              (-(~&wire36)) : $unsigned(((8'haf) || wire35)))));
          reg95 <= $signed(wire91);
        end
      else
        begin
          reg94 <= (8'ha6);
        end
    end
  assign wire96 = $signed(($unsigned(((~|(7'h44)) ?
                          (wire38 & wire89) : $signed(reg95))) ?
                      ($unsigned(wire34[(3'h4):(2'h2)]) ?
                          wire33[(2'h3):(2'h3)] : (^(wire37 * wire38))) : reg95[(4'ha):(2'h3)]));
  always
    @(posedge clk) begin
      reg97 <= (wire33[(3'h7):(3'h7)] <= $unsigned({((wire39 >> wire37) ?
              (~|wire92) : {(8'hba), wire38})}));
    end
  assign wire98 = {wire38, (^~$unsigned($signed((-wire35))))};
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire20,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = wire11[(4'h9):(3'h4)];
  assign wire13 = $unsigned(wire9);
  assign wire14 = (wire12 ? wire8 : ((&{wire12}) * wire11));
  assign wire15 = ($unsigned($unsigned((^~(~^wire14)))) <<< wire7);
  always
    @(posedge clk) begin
      reg16 <= wire10[(3'h7):(3'h4)];
      reg17 <= $unsigned(wire11);
      reg18 <= $unsigned($signed(((~((8'hb0) ?
          reg16 : wire11)) ~^ (|(~wire14)))));
      reg19 <= $unsigned(wire11[(4'hb):(1'h1)]);
    end
  assign wire20 = reg18;
endmodule

module module40
#(parameter param87 = {((!{(-(8'h9e)), ((7'h42) ? (8'hb8) : (8'hb2))}) && (((-(7'h42)) ^~ (~^(8'hb9))) << ((^(8'h9f)) ? (8'hb1) : ((8'hbb) || (8'hae)))))}, 
parameter param88 = (7'h40))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire45;
  input wire [(5'h15):(1'h0)] wire44;
  input wire signed [(3'h4):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire [(5'h10):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire46 = (+($unsigned(wire42) ?
                      ((^~wire41[(4'ha):(1'h1)]) ?
                          (-(wire41 ?
                              wire44 : wire41)) : $signed($unsigned(wire41))) : wire42[(4'hb):(3'h5)]));
  assign wire47 = (~&(~|(~|($signed(wire44) ?
                      wire41[(4'hf):(3'h7)] : {wire42, wire45}))));
  assign wire48 = ({$signed(wire44),
                      {wire43,
                          (wire45 ?
                              ((8'h9e) || wire47) : $unsigned(wire41))}} - {$unsigned(((~|wire47) ?
                          $signed(wire44) : (wire41 << wire42))),
                      ((wire44[(4'h8):(3'h6)] < wire47) * (7'h43))});
  assign wire49 = (^$signed($signed(wire42)));
  assign wire50 = wire49;
  always
    @(posedge clk) begin
      reg51 <= (wire50 ~^ ((&wire42) << wire42[(3'h5):(1'h0)]));
      reg52 <= (+(wire43 ? (7'h41) : (+{(&wire46), $unsigned((8'ha2))})));
    end
  assign wire53 = wire46;
  assign wire54 = (+wire45[(4'hd):(4'h8)]);
  always
    @(posedge clk) begin
      if ((!wire50))
        begin
          reg55 <= wire49[(2'h3):(2'h2)];
          reg56 <= ($unsigned(reg55[(1'h1):(1'h1)]) ^~ ((($signed((8'ha4)) - (wire48 <= (8'hb2))) >> wire53[(1'h0):(1'h0)]) ?
              ($signed(reg55[(1'h1):(1'h1)]) < $signed({wire41})) : wire44));
          reg57 <= (wire45[(4'hc):(3'h4)] - $unsigned(((wire47 ?
              (~&wire46) : ((8'ha8) ?
                  (8'ha1) : (8'hae))) != $unsigned(((8'h9c) ?
              reg51 : reg56)))));
          reg58 <= $signed((~&(({wire43, wire44} ?
              (wire44 - wire47) : wire54[(3'h4):(3'h4)]) << $unsigned(reg57))));
        end
      else
        begin
          reg55 <= (^$unsigned(wire47[(4'h9):(4'h9)]));
          reg56 <= {($unsigned(wire48) ^ reg52[(3'h4):(2'h3)]), (8'hb9)};
          reg57 <= wire48[(4'he):(4'h8)];
          reg58 <= reg57;
        end
      if (wire43[(1'h1):(1'h0)])
        begin
          reg59 <= (~^((!(-wire50)) && ($signed($unsigned(reg52)) ?
              (reg55[(1'h1):(1'h0)] ? (8'hb3) : wire49) : reg52)));
          reg60 <= $signed(wire43[(1'h1):(1'h1)]);
          if (($unsigned($signed((^~$signed(reg55)))) ^~ (((|{(8'had), reg58}) ?
              reg56 : reg51) >>> reg56)))
            begin
              reg61 <= ($unsigned((^(((8'ha4) ? (8'hb1) : reg59) ?
                      (wire46 <<< reg60) : {wire42, reg58}))) ?
                  $signed(wire50) : $signed($signed($unsigned(wire54))));
            end
          else
            begin
              reg61 <= {((reg52 ~^ reg57) ~^ (reg52 & wire47[(3'h4):(1'h0)]))};
              reg62 <= (~|reg60);
            end
          if ((($signed((~wire47[(3'h4):(2'h3)])) ~^ (reg62 & (&(reg55 << wire45)))) >>> $signed(wire53)))
            begin
              reg63 <= ($signed((|reg59[(5'h14):(3'h6)])) ?
                  (($signed((8'hab)) ^ $signed($unsigned(reg58))) ?
                      (((&wire41) << (&wire50)) ?
                          $signed((^wire46)) : wire54) : {(reg62 <<< (reg59 ?
                              wire47 : wire49))}) : reg60[(3'h6):(3'h5)]);
              reg64 <= wire54[(1'h0):(1'h0)];
              reg65 <= wire46[(4'ha):(3'h7)];
            end
          else
            begin
              reg63 <= {$unsigned(reg55),
                  ($unsigned((8'hb6)) ?
                      $unsigned($signed((reg62 >>> wire42))) : ({(^~wire43)} | (-reg56)))};
              reg64 <= (reg51 | reg58[(3'h5):(1'h0)]);
              reg65 <= ((~|wire44) ?
                  $unsigned(($unsigned(wire54[(3'h4):(2'h3)]) ?
                      (((8'hac) ?
                          reg56 : reg51) == $unsigned(reg51)) : (~^(^~wire46)))) : ((&($signed(reg61) ?
                          (^~wire53) : (wire46 | reg56))) ?
                      ($unsigned($signed(reg51)) ?
                          reg52[(3'h7):(1'h1)] : (reg57[(3'h7):(3'h5)] ?
                              $unsigned(wire43) : reg64[(4'hb):(3'h4)])) : reg56));
            end
          reg66 <= reg57;
        end
      else
        begin
          reg59 <= $signed($unsigned((-reg56[(3'h7):(3'h6)])));
          reg60 <= (8'ha9);
          reg61 <= $unsigned((~^wire50[(4'hc):(1'h0)]));
          reg62 <= $unsigned($signed((wire46 ?
              ($signed(wire44) ?
                  $unsigned((7'h44)) : {wire49, reg58}) : {reg59[(2'h2):(2'h2)],
                  (!reg56)})));
          if ((reg62 ? (~|(8'hbb)) : (~wire50[(1'h0):(1'h0)])))
            begin
              reg63 <= $unsigned(($signed($unsigned((reg65 == reg58))) ?
                  ((~$signed(wire48)) ~^ ($signed(wire41) ?
                      (7'h43) : (reg66 ? reg65 : (8'ha7)))) : wire53));
              reg64 <= $signed($unsigned($unsigned((^~$signed(wire48)))));
              reg65 <= $unsigned((((~|(reg64 || reg55)) ?
                  ((wire53 - reg60) | ((8'hb9) & reg64)) : ((~|wire47) ?
                      ((8'ha2) * reg61) : reg61)) <= (wire42[(4'hb):(4'h8)] ?
                  (((8'haa) ? wire54 : wire42) ?
                      $signed(reg65) : (wire42 * reg66)) : (|(8'hb2)))));
              reg66 <= (($unsigned((wire47[(4'h9):(1'h0)] << $signed(wire54))) ~^ (~($unsigned(wire49) ?
                      wire53 : $unsigned(reg66)))) ?
                  reg63[(4'h9):(1'h0)] : ({wire42,
                      wire42[(3'h4):(2'h3)]} > (wire48[(5'h12):(3'h5)] != wire48)));
            end
          else
            begin
              reg63 <= $unsigned(({wire53,
                  wire53} == $signed($signed(wire49[(2'h2):(1'h1)]))));
              reg64 <= {($signed($unsigned((wire53 || reg57))) <<< (^($unsigned(wire47) ?
                      (~wire49) : $signed((8'h9d))))),
                  reg63};
              reg65 <= $signed($unsigned($signed(wire50)));
              reg66 <= (8'had);
            end
        end
      reg67 <= (|{$unsigned(reg60), wire48});
      reg68 <= wire43[(2'h2):(2'h2)];
      if ($signed(($unsigned($signed(reg68[(4'ha):(2'h2)])) | wire50)))
        begin
          reg69 <= (^~$signed((~|$signed(wire43[(1'h1):(1'h1)]))));
          reg70 <= reg65[(3'h7):(2'h2)];
          reg71 <= ({(~(~&(reg61 ? wire50 : (8'hb7))))} ?
              (((~$unsigned(wire45)) ?
                      (~|(~^wire44)) : ($unsigned((8'ha0)) >= $signed(reg66))) ?
                  wire53 : ({(~^reg65),
                      $signed(reg68)} ^~ (&reg60))) : $signed($unsigned(($unsigned(wire53) ?
                  $unsigned(reg51) : {wire43, (8'hbc)}))));
          reg72 <= ((-$unsigned(((wire47 >> (8'hba)) ?
              (wire45 ?
                  wire43 : reg71) : wire42[(2'h3):(1'h0)]))) <<< $signed((!{(reg59 && reg67)})));
          if ($signed($signed(((reg69[(3'h5):(2'h2)] == (~&reg57)) >> reg62[(4'hc):(2'h3)]))))
            begin
              reg73 <= (|(~^(&$signed((reg72 ? reg51 : wire50)))));
              reg74 <= $signed((((reg58[(3'h4):(2'h3)] ?
                  $unsigned(reg73) : $signed(wire49)) == $unsigned(reg67)) * {({reg69} == reg61),
                  $unsigned((reg62 ^~ wire46))}));
              reg75 <= (~&(((-$unsigned(wire48)) << ($unsigned((8'h9e)) == reg68[(3'h6):(2'h2)])) >> (!$unsigned(reg60))));
            end
          else
            begin
              reg73 <= wire50;
              reg74 <= (!(8'hbf));
              reg75 <= wire50[(3'h6):(1'h0)];
            end
        end
      else
        begin
          reg69 <= $signed((wire43 == reg64[(4'ha):(2'h3)]));
        end
    end
  assign wire76 = $signed(wire49[(4'h9):(4'h8)]);
  assign wire77 = ((((reg71[(2'h3):(2'h3)] + reg52[(2'h2):(1'h0)]) ?
                      (~|{reg66}) : ($unsigned((8'h9e)) ?
                          {wire53} : reg57)) <= $signed((wire50[(4'hd):(2'h3)] ?
                      (wire48 > reg64) : wire45[(4'h8):(1'h1)]))) <= wire46[(1'h1):(1'h0)]);
  assign wire78 = (&(^~$unsigned((wire54 ? wire77 : $signed(wire45)))));
  assign wire79 = wire76[(3'h5):(2'h3)];
  assign wire80 = (((($signed((7'h44)) ?
                      {(8'hb5)} : (reg56 ?
                          reg63 : reg62)) <<< $signed(reg72)) == $signed(reg59)) << reg62[(1'h1):(1'h0)]);
  assign wire81 = ((~^wire48) * ({(8'hb2)} + (&((wire77 | wire47) * (!reg69)))));
  assign wire82 = $unsigned($unsigned({wire54}));
  assign wire83 = $unsigned((~&(((reg68 ? wire50 : (8'ha2)) ?
                          ((7'h43) ? reg62 : wire78) : (-reg56)) ?
                      ($unsigned(reg67) & (wire80 ~^ reg57)) : (~&(reg59 ?
                          reg65 : (8'hb8))))));
  assign wire84 = $unsigned($signed(($unsigned(wire50) ~^ reg69[(4'h9):(3'h4)])));
  assign wire85 = $signed((-wire76[(4'ha):(1'h0)]));
  assign wire86 = ((-wire82) > (wire84[(3'h7):(3'h7)] ?
                      wire82 : (~^wire44[(3'h5):(3'h4)])));
endmodule
