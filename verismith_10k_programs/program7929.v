module top
#(parameter param119 = ((&{(~(^~(8'ha6))), {((8'hb2) ? (8'hb4) : (8'h9e))}}) ? ((|(-(8'hae))) ? ((((8'hb2) ? (8'ha9) : (8'ha5)) ? ((8'hbb) ? (8'ha4) : (7'h42)) : ((8'h9c) && (8'hbd))) ? (8'hba) : (((8'hb0) == (8'hb3)) ? (-(8'hbf)) : ((8'ha6) ? (8'hb1) : (8'ha3)))) : (~&({(8'hb8)} ? ((8'ha8) ~^ (8'hba)) : {(8'hb6), (8'ha4)}))) : (~|(({(8'hb8), (8'h9d)} ~^ {(8'hac), (8'hb3)}) ? (((8'ha9) ? (8'ha0) : (8'hac)) >= ((8'h9d) >= (7'h42))) : {((8'hb9) ^~ (7'h40)), (8'hab)}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire117;
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire24,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire47,
                 wire49,
                 wire50,
                 wire51,
                 wire117,
                 reg6,
                 reg10,
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
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $unsigned(({wire1} ?
                     {({wire2} >= (~&wire2)),
                         (wire1 * (&wire2))} : (-wire3[(3'h6):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= (wire5 ^ $unsigned((wire3 > wire1[(3'h6):(2'h2)])));
    end
  assign wire7 = (((((wire1 ? wire2 : wire3) <<< (~wire0)) ?
                             {(-wire4)} : reg6[(4'h9):(4'h9)]) ?
                         (($unsigned(wire4) ?
                             $unsigned(wire1) : wire3[(2'h3):(1'h1)]) ^ (wire2[(4'h9):(2'h3)] ^ wire5[(4'h8):(1'h0)])) : wire1[(2'h2):(1'h1)]) ?
                     {$signed(wire1[(3'h7):(2'h2)])} : wire4[(1'h0):(1'h0)]);
  assign wire8 = {({$unsigned(reg6[(1'h1):(1'h0)])} * (!$signed((wire2 ^ wire7)))),
                     wire1};
  assign wire9 = (-($unsigned($signed($signed(wire5))) ?
                     (($unsigned(wire7) ?
                         (wire0 == wire3) : {wire3}) * reg6[(3'h5):(3'h4)]) : wire0));
  always
    @(posedge clk) begin
      reg10 <= $unsigned($unsigned($unsigned(wire3[(3'h6):(3'h6)])));
      reg11 <= $unsigned((8'hb7));
      if (reg6)
        begin
          if ($signed(wire8))
            begin
              reg12 <= (!wire7[(4'he):(4'hd)]);
              reg13 <= $unsigned((8'ha7));
            end
          else
            begin
              reg12 <= ($unsigned(wire4[(2'h2):(1'h0)]) ? (!reg13) : wire0);
              reg13 <= ((+wire9[(4'hc):(4'h8)]) ?
                  (-wire0) : reg12[(3'h6):(2'h3)]);
              reg14 <= (&(wire4[(1'h1):(1'h0)] ?
                  (wire2 * (^~(reg10 ? (8'ha8) : reg11))) : wire7));
            end
          reg15 <= $unsigned(reg11);
          reg16 <= $signed((wire0[(4'he):(4'hc)] ?
              (wire0[(2'h3):(1'h1)] ?
                  wire2[(4'hd):(3'h7)] : $signed($unsigned((8'hb1)))) : reg15));
          reg17 <= ($unsigned((((~wire8) >= (reg12 ? (8'ha7) : wire9)) ?
              ((reg14 <= wire9) != $unsigned(wire8)) : $signed((wire3 <<< wire4)))) == wire1);
          reg18 <= (wire5 ?
              ($unsigned($signed((!reg13))) ?
                  wire8[(4'hb):(4'h8)] : $signed((^$signed(wire7)))) : ($signed(wire9[(3'h6):(1'h1)]) < (wire5 ?
                  wire0 : wire1)));
        end
      else
        begin
          if ((8'haa))
            begin
              reg12 <= (wire2[(1'h0):(1'h0)] | $signed((($unsigned(reg6) ?
                  $signed(reg13) : (~^wire9)) ^ (reg18[(4'h9):(4'h8)] ?
                  reg14[(3'h6):(3'h4)] : {reg6}))));
              reg13 <= $signed({reg12, $signed(wire3)});
              reg14 <= $unsigned($unsigned(((reg11 + wire7[(3'h7):(3'h5)]) ?
                  $signed($unsigned(wire3)) : ((wire3 ? wire9 : (8'hbd)) ?
                      wire7 : (wire5 * reg12)))));
            end
          else
            begin
              reg12 <= $unsigned(({(8'ha9)} ?
                  $unsigned(wire5[(4'h8):(3'h6)]) : {{(!reg13)}}));
              reg13 <= (|$unsigned(((reg16[(4'hb):(3'h7)] ?
                      reg18 : {wire4, reg15}) ?
                  ({reg14} ? (~&reg10) : $unsigned(reg10)) : {(^reg15),
                      ((8'ha5) ? reg13 : reg18)})));
              reg14 <= reg17;
              reg15 <= {reg13[(3'h4):(2'h2)], reg17[(4'h8):(2'h2)]};
              reg16 <= reg10[(1'h0):(1'h0)];
            end
          reg17 <= $unsigned((($signed((wire9 & reg10)) ?
              $unsigned($unsigned(reg15)) : wire9) && $unsigned(wire5[(4'hb):(3'h4)])));
          if ($unsigned(($unsigned(($signed(wire1) == ((8'hbf) <= wire4))) ?
              reg13 : wire2[(3'h5):(1'h0)])))
            begin
              reg18 <= (^~(reg16[(4'h9):(3'h5)] ? reg15 : {$signed(reg13)}));
            end
          else
            begin
              reg18 <= ($unsigned(($signed((-reg15)) ?
                  ((&(8'hba)) ?
                      (wire3 == (8'hb4)) : (!(8'hb0))) : reg6[(3'h6):(1'h0)])) >>> $signed((^~((-reg14) ?
                  (reg6 ? (8'hac) : reg14) : $signed(wire0)))));
              reg19 <= ($unsigned(((((8'hae) ?
                  wire9 : wire0) < wire7[(3'h5):(2'h2)]) >>> {reg11})) ^ (wire7 ~^ (~&($unsigned(reg18) ?
                  {(8'h9d)} : $signed(wire9)))));
              reg20 <= (~|$signed(reg6[(4'hb):(1'h0)]));
            end
          reg21 <= $signed($signed((+reg14[(1'h1):(1'h1)])));
          reg22 <= ($signed($unsigned((((7'h44) ? wire4 : wire8) ?
                  (+reg17) : $unsigned(reg20)))) ?
              $signed(wire2) : reg14);
        end
      reg23 <= (8'ha6);
    end
  assign wire24 = reg18;
  always
    @(posedge clk) begin
      reg25 <= reg20[(1'h1):(1'h1)];
      reg26 <= reg6;
      reg27 <= ((^(($unsigned(reg21) ?
              (~|reg15) : $signed(reg11)) && (&((7'h41) + reg6)))) ?
          reg21[(3'h5):(3'h4)] : $signed(reg16));
    end
  assign wire28 = reg16;
  assign wire29 = $unsigned(reg13);
  assign wire30 = (reg23[(2'h2):(1'h1)] ?
                      (reg15[(4'hf):(3'h7)] >> {(^~$unsigned(reg26)),
                          $unsigned($unsigned((8'haa)))}) : reg27);
  assign wire31 = $unsigned((^reg18));
  module32 #() modinst48 (.y(wire47), .wire34(reg18), .wire35(wire7), .clk(clk), .wire33(wire30), .wire36(reg15));
  assign wire49 = $unsigned(((~&(wire8[(4'ha):(1'h1)] ?
                          ((8'ha8) == reg10) : (reg23 > wire28))) ?
                      ((8'hbb) << wire28) : (wire28[(5'h10):(3'h5)] ?
                          (reg19 | wire3) : $signed((reg16 >= (8'haa))))));
  assign wire50 = $unsigned({$unsigned(reg19[(1'h0):(1'h0)])});
  assign wire51 = $signed(wire1);
  module52 #() modinst118 (.wire55(wire2), .wire56(wire8), .wire54(reg10), .clk(clk), .y(wire117), .wire53(wire49));
endmodule

module module52
#(parameter param116 = (^(((-((8'ha8) ^ (8'ha8))) ? (8'haa) : (|{(8'hb4)})) >>> ((((8'hbe) ? (8'hb3) : (7'h41)) ? (!(8'h9e)) : ((8'hb8) ? (8'hb1) : (8'hae))) ? {(~|(8'ha7))} : (((8'ha0) * (8'ha2)) && ((8'ha1) ? (7'h43) : (8'haa)))))))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire [(4'ha):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  assign y = {wire115,
                 wire113,
                 wire78,
                 wire77,
                 wire76,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg63,
                 (1'h0)};
  assign wire57 = wire53;
  assign wire58 = wire56[(3'h6):(1'h1)];
  assign wire59 = wire55;
  assign wire60 = wire54;
  assign wire61 = wire57[(4'hb):(3'h7)];
  assign wire62 = $unsigned((wire60[(3'h6):(2'h2)] + $signed($unsigned(wire60))));
  always
    @(posedge clk) begin
      reg63 <= ((wire58[(4'hc):(4'h8)] ^~ {(wire59[(1'h0):(1'h0)] ?
              (-(8'h9f)) : $signed(wire57)),
          (wire56[(1'h1):(1'h1)] != (wire62 ?
              (8'h9e) : wire57))}) && ({{wire59[(2'h3):(2'h3)]},
          ((wire62 ? wire60 : wire55) ?
              {wire57} : (wire61 * wire57))} >> (wire54 >= wire61)));
    end
  assign wire64 = $signed($signed(wire61[(2'h3):(1'h0)]));
  assign wire65 = $signed((wire55 & ((wire58[(1'h0):(1'h0)] == (wire54 ?
                      wire54 : wire55)) >>> wire58[(3'h4):(1'h0)])));
  assign wire66 = wire65[(3'h5):(3'h5)];
  assign wire67 = ($signed($signed(($unsigned(wire64) ?
                      (reg63 ?
                          wire61 : wire62) : $unsigned(wire66)))) >>> (wire59 & (wire56[(1'h1):(1'h0)] ?
                      $signed((wire60 ? (8'ha3) : wire64)) : wire61)));
  assign wire68 = (7'h42);
  assign wire69 = ((($signed((wire68 || wire53)) ?
                          (|(~wire60)) : wire64[(3'h5):(1'h1)]) ?
                      (~|wire61[(4'h9):(4'h8)]) : (wire59[(1'h0):(1'h0)] | (|wire59))) << ((^~wire55[(3'h4):(2'h2)]) ?
                      wire67[(1'h1):(1'h0)] : ($signed(wire62) ?
                          wire54 : {wire53[(4'h8):(3'h5)]})));
  assign wire70 = ($unsigned($signed($signed($signed(wire59)))) << wire54[(3'h5):(1'h1)]);
  assign wire71 = $signed(wire65);
  always
    @(posedge clk) begin
      reg72 <= $signed($unsigned((^~(~|(wire54 ? wire68 : wire64)))));
      reg73 <= $signed(wire64);
      reg74 <= wire67[(3'h5):(2'h3)];
      reg75 <= ((~|(({wire65} ? $signed((8'ha8)) : reg72) ?
              wire57[(4'ha):(1'h0)] : wire68[(4'hc):(4'h8)])) ?
          (wire54 ?
              $signed(wire53[(3'h5):(2'h3)]) : $signed((8'ha7))) : (wire59[(2'h2):(2'h2)] + $unsigned(wire60[(1'h0):(1'h0)])));
    end
  assign wire76 = wire54[(3'h4):(2'h2)];
  assign wire77 = ($unsigned(wire53[(4'ha):(3'h4)]) ?
                      wire65[(4'hd):(4'hd)] : $signed((8'hbc)));
  assign wire78 = (reg63[(5'h10):(4'hd)] ?
                      ({$unsigned(wire61),
                          (+((8'hb1) | wire62))} | wire66[(1'h0):(1'h0)]) : wire67[(4'h8):(2'h3)]);
  module79 #() modinst114 (wire113, clk, wire67, reg73, wire54, reg72);
  assign wire115 = {$unsigned(((+(wire62 ? reg74 : (8'h9e))) == wire58))};
endmodule

module module32
#(parameter param46 = {((~&({(8'ha3)} ^~ (^(8'hac)))) ? {(((8'hba) < (8'h9c)) ? {(8'haa), (8'ha0)} : ((8'hb6) ? (8'hba) : (8'hbd)))} : ((((8'hbc) <<< (8'ha9)) ~^ (~|(8'hb4))) ? {((7'h44) ? (8'hae) : (8'hab)), ((7'h41) ? (8'had) : (8'h9c))} : (-((8'hb4) ^ (8'ha0))))), ((7'h42) > ((|((8'hb3) + (8'hbe))) ? {{(8'haf), (8'ha8)}, ((8'hb5) - (8'had))} : {((8'ha5) ^ (8'had))}))})
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire34;
  input wire [(4'hb):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 reg39,
                 (1'h0)};
  assign wire37 = ($unsigned({{wire35[(4'hc):(3'h6)]}}) ?
                      $unsigned(($signed(wire35[(2'h2):(1'h0)]) ?
                          wire35[(4'hd):(3'h7)] : $unsigned($signed(wire33)))) : (8'h9d));
  assign wire38 = $signed({wire36});
  always
    @(posedge clk) begin
      reg39 <= (^~$signed((^$signed($signed(wire34)))));
    end
  assign wire40 = $unsigned($unsigned({(8'hbc),
                      ($signed(wire35) <= (wire36 ? wire37 : wire36))}));
  assign wire41 = (^~(|$unsigned(wire37[(1'h0):(1'h0)])));
  assign wire42 = wire35[(4'h8):(3'h5)];
  assign wire43 = (wire38 + ((reg39 << ((wire36 ?
                      reg39 : wire41) | $unsigned((7'h43)))) | (($signed(wire35) <<< wire40[(4'h8):(3'h6)]) >>> (&$signed(wire38)))));
  assign wire44 = $unsigned($unsigned(wire42[(2'h2):(1'h0)]));
  assign wire45 = ((8'h9e) ? {reg39[(4'ha):(1'h1)]} : wire36[(1'h1):(1'h1)]);
endmodule

module module79
#(parameter param112 = (+{(!(((8'hb5) ? (8'hb2) : (8'ha1)) ? (^~(8'h9f)) : ((8'hac) ? (7'h43) : (8'h9d))))}))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire83;
  input wire signed [(5'h15):(1'h0)] wire82;
  input wire [(4'ha):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  assign y = {wire111,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire85,
                 wire84,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
  assign wire84 = ((({$signed(wire80), wire81[(4'ha):(3'h6)]} ?
                          {wire83,
                              wire82} : $signed({(8'hae)})) && $unsigned(wire81[(4'h8):(2'h2)])) ?
                      $signed(wire83) : wire83);
  assign wire85 = $signed(((wire84 ? wire80[(3'h6):(2'h3)] : wire84) ?
                      $signed((|((7'h42) ?
                          wire82 : (8'hb0)))) : $unsigned(wire83[(4'h8):(3'h4)])));
  always
    @(posedge clk) begin
      reg86 <= $signed((~$signed(wire84)));
      reg87 <= wire82[(4'hc):(3'h4)];
      reg88 <= (((+(~reg87)) ?
              $unsigned($signed($unsigned(wire81))) : (-wire85[(1'h1):(1'h0)])) ?
          reg87[(3'h4):(2'h2)] : (~|(~^($signed(wire83) || $unsigned(wire85)))));
      if (($unsigned($unsigned($signed(wire81))) <= (^~wire83)))
        begin
          if ((!wire83))
            begin
              reg89 <= wire85;
            end
          else
            begin
              reg89 <= $signed($unsigned($unsigned(wire81)));
              reg90 <= reg86;
              reg91 <= ((((8'hbf) ?
                      $signed((reg89 ? wire84 : reg89)) : $signed((&reg86))) ?
                  reg87 : reg90[(1'h1):(1'h1)]) >= (~&wire81[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg89 <= wire84[(3'h7):(1'h0)];
          reg90 <= {(wire82 <= (~|(|(8'h9d))))};
          if (($signed((((reg91 ? wire83 : wire83) ?
                  (reg86 * wire82) : (&reg88)) * wire81[(2'h3):(2'h3)])) ?
              $unsigned((^~$unsigned((&(8'hb4))))) : $signed((reg91[(2'h2):(1'h0)] ?
                  $unsigned(wire83[(3'h4):(2'h3)]) : ((reg91 ? reg87 : wire84) ?
                      $unsigned(reg87) : (wire83 < (8'h9c)))))))
            begin
              reg91 <= wire81[(4'h9):(4'h9)];
              reg92 <= $signed((reg89[(3'h6):(1'h1)] ?
                  ((reg87[(4'ha):(2'h3)] ? wire80 : $unsigned((8'h9e))) ?
                      (~^reg87) : reg87) : ((wire85 ?
                      $unsigned(wire85) : ((8'hbb) ^ wire80)) ^~ $signed(reg87[(2'h2):(1'h1)]))));
              reg93 <= (^wire82);
            end
          else
            begin
              reg91 <= wire81[(1'h0):(1'h0)];
              reg92 <= (wire83[(4'hc):(4'h9)] ?
                  $unsigned({reg87,
                      $signed((reg93 || wire83))}) : (|(~&$signed($signed(wire83)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg94 <= $signed(reg86);
      reg95 <= reg88[(1'h1):(1'h1)];
      reg96 <= {((^~($signed(wire81) ?
              (reg91 == wire83) : (wire84 ?
                  reg88 : reg94))) > ($unsigned((~|reg89)) > ((reg88 ?
              wire81 : reg95) << $unsigned(reg93)))),
          ((^~(((8'h9e) ? reg89 : reg91) ?
              $unsigned((8'hb6)) : $signed((8'hbc)))) <= reg92)};
    end
  assign wire97 = wire80[(3'h5):(2'h2)];
  assign wire98 = $signed(reg95);
  assign wire99 = wire85[(3'h5):(2'h3)];
  assign wire100 = $signed((wire80 ?
                       $signed($unsigned($signed((8'ha1)))) : $signed(wire97)));
  assign wire101 = {$unsigned((wire81[(1'h0):(1'h0)] ?
                           $signed(wire98[(2'h3):(2'h3)]) : wire99[(2'h3):(1'h0)])),
                       reg88};
  assign wire102 = $unsigned(reg95);
  assign wire103 = (reg95 < $signed($signed($unsigned({(8'hbd)}))));
  assign wire104 = wire103;
  assign wire105 = reg92[(3'h6):(2'h2)];
  assign wire106 = reg93;
  always
    @(posedge clk) begin
      reg107 <= (($unsigned((8'h9f)) | reg86[(4'hb):(4'hb)]) ?
          {((&(~^(8'hb7))) * reg88[(1'h0):(1'h0)])} : $unsigned((^wire83)));
      reg108 <= $signed(wire83);
      reg109 <= wire80[(3'h6):(2'h2)];
      reg110 <= ((reg94[(1'h1):(1'h1)] ?
          reg89[(3'h5):(2'h3)] : reg107[(3'h6):(3'h5)]) < $unsigned($signed(reg94)));
    end
  assign wire111 = {(^$signed(wire83)),
                       (wire101 >>> ((((8'hb8) ?
                           reg110 : (8'ha8)) && wire106) || reg87[(4'hb):(1'h1)]))};
endmodule
