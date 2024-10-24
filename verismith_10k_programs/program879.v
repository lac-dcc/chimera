module top
#(parameter param117 = (((~|(((8'hb2) ? (7'h40) : (8'hbe)) ^ ((8'h9f) ? (8'hba) : (7'h43)))) ? ((!((8'hb5) | (8'h9c))) << ((^(8'h9f)) ? ((8'hbd) ? (7'h44) : (8'ha3)) : ((8'hba) < (8'ha8)))) : ((((8'hac) ? (8'hb5) : (8'hbd)) <<< ((8'hb9) || (8'h9d))) ? (|(^~(8'hae))) : (((8'hb1) * (7'h42)) <= {(8'hbd), (8'ha2)}))) ? ((~|(((8'h9e) ? (8'ha7) : (7'h41)) ? ((8'hac) >= (8'hb9)) : ((8'hb0) && (8'ha4)))) <<< {(((8'h9c) > (8'hb9)) ? ((8'hae) + (7'h40)) : ((8'ha6) - (8'hac))), {((8'h9e) ? (8'hac) : (8'h9d)), {(8'had), (8'ha6)}}}) : ((&(+((8'hb6) >= (8'hb5)))) ^~ (!(((7'h44) << (8'ha3)) ? ((7'h40) == (8'hb2)) : (~^(8'hb6)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire113;
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire26,
                 wire27,
                 wire28,
                 wire113,
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
  assign wire5 = {($signed(wire2[(1'h0):(1'h0)]) == (+($unsigned(wire4) ?
                         (wire1 ? wire3 : wire2) : wire4[(1'h1):(1'h0)])))};
  assign wire6 = (wire5 ?
                     wire1 : ({$unsigned($unsigned(wire0)),
                         (wire1[(2'h2):(1'h1)] ?
                             wire4 : (8'h9c))} || (($unsigned((8'hba)) ?
                         $unsigned(wire4) : $unsigned(wire0)) == ((wire3 ?
                             wire3 : (8'ha0)) ?
                         ((8'ha1) ? wire3 : wire3) : wire2[(1'h0):(1'h0)]))));
  assign wire7 = wire1;
  assign wire8 = (&wire2[(1'h1):(1'h0)]);
  assign wire9 = wire0;
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg10 <= ($unsigned($unsigned($unsigned((8'hbb)))) ?
              {(|wire2)} : (8'hbe));
          reg11 <= $signed(wire9[(2'h3):(2'h3)]);
          reg12 <= (&($signed((~^$signed(wire7))) << wire9[(5'h13):(3'h7)]));
        end
      else
        begin
          if ($unsigned(reg10[(4'ha):(3'h7)]))
            begin
              reg10 <= (((8'hb2) - wire9[(4'hc):(2'h3)]) * wire2[(1'h1):(1'h1)]);
              reg11 <= (~^$signed(wire4[(1'h1):(1'h0)]));
              reg12 <= (^$signed(((~&$unsigned(wire6)) ?
                  wire2 : ((wire8 != reg11) ? (+wire5) : (8'h9d)))));
              reg13 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg10 <= reg11[(4'hf):(1'h1)];
              reg11 <= (reg10[(2'h2):(1'h0)] >= ((8'hbf) ?
                  {((8'ha0) ? {wire2} : (wire8 == wire3)),
                      $unsigned(reg10)} : (!$signed(((8'hb2) - reg11)))));
            end
          reg14 <= {$unsigned(((reg13[(2'h3):(2'h2)] * (+wire9)) * $unsigned(reg11)))};
          reg15 <= {{reg10[(1'h1):(1'h0)]}, reg11};
          reg16 <= wire9;
          reg17 <= {$unsigned(((~wire7[(4'hf):(4'hd)]) ?
                  (8'ha6) : {{wire0, reg13}, (wire9 >> wire9)}))};
        end
      if (wire9)
        begin
          reg18 <= (((+({reg17, reg15} ? wire0 : wire4)) || $signed((^~(wire3 ?
                  reg17 : (8'hbb))))) ?
              wire5[(2'h2):(1'h0)] : ($signed(wire5) ^~ (wire7 < wire6)));
          reg19 <= $unsigned(($signed({{wire7},
              (reg15 ? wire5 : reg11)}) >> $signed(wire1)));
          reg20 <= $unsigned($signed(reg17));
          reg21 <= wire9[(4'hb):(1'h0)];
        end
      else
        begin
          if ((^$signed(wire6)))
            begin
              reg18 <= ($signed(wire1) <= $signed(((wire9[(3'h6):(2'h2)] ?
                  {(8'hb6)} : (^~reg20)) ^ wire2)));
            end
          else
            begin
              reg18 <= $unsigned((wire7 >= reg21));
              reg19 <= ($unsigned(({$unsigned(wire1)} ?
                      (^$signed(wire2)) : (&reg10))) ?
                  reg12[(2'h3):(2'h3)] : (((&wire9[(4'hc):(2'h2)]) ?
                      ((wire5 & (8'hbc)) * $unsigned(reg18)) : {(wire8 > wire9)}) <<< wire8[(2'h3):(2'h2)]));
              reg20 <= (((7'h43) ?
                  $signed((-$signed(wire3))) : reg12[(4'hb):(2'h2)]) < $signed(reg10[(4'h9):(3'h7)]));
              reg21 <= (|$signed((wire8[(3'h5):(3'h4)] > ((reg18 < wire7) >> reg21))));
              reg22 <= wire4;
            end
          reg23 <= reg13;
          reg24 <= (8'ha2);
        end
      reg25 <= (&(&$unsigned({$signed(reg10), (^~wire5)})));
    end
  assign wire26 = wire8;
  assign wire27 = (reg13 ? (8'h9e) : reg23);
  assign wire28 = {(wire1[(3'h4):(1'h1)] && (!(wire2 - (wire8 ?
                          reg16 : reg21))))};
  module29 #() modinst114 (.wire33(wire2), .wire30(wire8), .wire34(reg21), .wire31(wire9), .y(wire113), .clk(clk), .wire32(reg18));
  assign wire115 = $signed(wire8);
  assign wire116 = reg19;
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  assign y = {wire90,
                 wire85,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg112,
                 reg111,
                 reg110,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire35 = {$unsigned($unsigned(wire31[(2'h3):(2'h2)]))};
  assign wire36 = ((|(($unsigned(wire32) != $unsigned(wire32)) + ({wire31,
                          (8'ha5)} ?
                      {(8'ha8)} : (!(7'h43))))) - ((^$signed(wire31[(5'h10):(4'hf)])) ?
                      (wire34[(3'h4):(2'h2)] ?
                          $signed(wire33[(2'h3):(1'h0)]) : (-$unsigned((8'hae)))) : wire31[(3'h6):(3'h4)]));
  assign wire37 = wire32[(1'h0):(1'h0)];
  assign wire38 = {(wire35 && $signed({wire32, ((8'ha1) ? wire32 : wire31)}))};
  assign wire39 = $unsigned(wire37);
  assign wire40 = $signed((($unsigned(wire33) ?
                      $unsigned($unsigned(wire35)) : wire30[(3'h4):(1'h1)]) << (~|({wire36} ?
                      wire38 : {wire31}))));
  module41 #() modinst86 (.y(wire85), .wire43(wire37), .clk(clk), .wire45(wire34), .wire44(wire35), .wire42(wire40));
  always
    @(posedge clk) begin
      if ($unsigned((wire33 <<< $unsigned((^wire38[(3'h6):(3'h5)])))))
        begin
          reg87 <= wire85[(2'h2):(2'h2)];
          reg88 <= $signed((8'hbe));
        end
      else
        begin
          reg87 <= wire40;
          reg88 <= (reg88 | wire36[(1'h0):(1'h0)]);
        end
      reg89 <= (wire30[(2'h2):(1'h0)] ?
          (wire37[(1'h1):(1'h0)] ?
              wire85 : {$signed($unsigned(wire31)),
                  $signed($signed((8'ha4)))}) : (~^wire35[(3'h6):(3'h5)]));
    end
  assign wire90 = (wire32[(1'h0):(1'h0)] | (wire30[(2'h2):(1'h0)] <<< (~&(!reg88))));
  always
    @(posedge clk) begin
      reg91 <= reg89;
      if ({reg87[(4'hc):(1'h0)], $unsigned(wire36[(1'h1):(1'h1)])})
        begin
          reg92 <= $unsigned(((+reg89[(2'h2):(1'h1)]) ?
              (wire90[(3'h7):(2'h2)] >> $signed((reg87 * wire37))) : (((reg89 * wire30) | wire37) ?
                  ($signed(reg87) || reg89[(3'h6):(2'h3)]) : ($unsigned(wire34) ?
                      wire40 : $unsigned(wire38)))));
          reg93 <= $signed((^~(|$signed($signed(wire90)))));
          reg94 <= $unsigned(wire38[(4'h9):(4'h9)]);
          if (($signed(reg92) >= ((wire39[(3'h5):(3'h5)] < $unsigned((reg89 || wire40))) ?
              $signed(reg94[(2'h3):(1'h1)]) : reg91[(4'hb):(3'h7)])))
            begin
              reg95 <= $signed(((-$unsigned((wire35 ?
                  wire90 : wire32))) <<< $unsigned(((~&wire90) > $signed(reg94)))));
            end
          else
            begin
              reg95 <= {reg95[(3'h7):(3'h5)]};
            end
          if ($unsigned($unsigned((^(wire40[(3'h7):(1'h1)] ^ wire38[(3'h6):(3'h5)])))))
            begin
              reg96 <= (wire35 ?
                  ($unsigned($signed({wire30})) ?
                      (((wire36 >> (7'h41)) ?
                          (reg91 ?
                              wire38 : (8'hab)) : (reg94 <<< wire35)) >> wire34[(4'hb):(3'h6)]) : $signed($unsigned($unsigned(wire30)))) : (~^(((wire33 << reg88) > (wire85 ?
                          reg87 : wire32)) ?
                      reg93 : {(reg87 * (8'ha4)), (~^(8'hae))})));
              reg97 <= reg94;
              reg98 <= ((8'hb9) | (^{$signed((reg94 ? (8'had) : wire32))}));
              reg99 <= reg98[(2'h3):(1'h0)];
              reg100 <= ($signed($unsigned(($signed((8'had)) ?
                      wire30 : {wire34}))) ?
                  (((((8'hbb) && reg99) ?
                          (~&wire38) : (wire37 - reg91)) & $unsigned($signed(wire90))) ?
                      wire34[(5'h10):(2'h2)] : (~^(8'ha8))) : wire35[(3'h5):(1'h0)]);
            end
          else
            begin
              reg96 <= $unsigned((wire36 ?
                  $signed($signed(wire33)) : $signed(reg88)));
              reg97 <= (&reg89[(1'h1):(1'h1)]);
              reg98 <= (-reg92[(4'h9):(4'h8)]);
              reg99 <= $unsigned(wire36[(3'h5):(1'h0)]);
            end
        end
      else
        begin
          if (reg98[(2'h3):(1'h0)])
            begin
              reg92 <= ($unsigned(reg93[(2'h2):(1'h0)]) - (|$signed((-$signed(reg92)))));
              reg93 <= $unsigned($unsigned((((!reg98) - $signed(reg99)) > wire90)));
              reg94 <= (~^$signed(((!(wire33 ?
                  (8'h9f) : wire32)) ^ $unsigned($unsigned(wire36)))));
            end
          else
            begin
              reg92 <= $unsigned(($signed(((wire38 ? reg93 : wire40) ?
                      {wire38} : $unsigned(reg92))) ?
                  reg89 : (-((^(8'hbb)) ? reg97 : reg92[(4'h8):(3'h7)]))));
              reg93 <= (^(!$unsigned((|reg87[(4'hd):(3'h5)]))));
              reg94 <= wire38[(2'h3):(1'h1)];
              reg95 <= $signed($unsigned(((-(reg96 ?
                  (8'h9d) : (8'hae))) ^ ((-reg96) > (-wire34)))));
            end
          reg96 <= $signed(($signed((reg99 ? (^reg91) : $signed(reg88))) ?
              wire30[(1'h1):(1'h0)] : (+(~|$unsigned((8'ha1))))));
          reg97 <= ($unsigned((8'haf)) ?
              $signed(($unsigned((wire31 > reg93)) ?
                  $signed($signed(reg87)) : ((8'h9d) ?
                      $unsigned(reg88) : $signed(wire39)))) : (^~$unsigned(reg89[(4'he):(4'h8)])));
          reg98 <= (7'h44);
        end
      reg101 <= $unsigned(reg87);
      if (reg100)
        begin
          reg102 <= reg93[(5'h12):(4'h9)];
          if (((($unsigned({reg98}) && reg98[(1'h0):(1'h0)]) ?
                  $signed(((&reg100) ?
                      $unsigned(reg87) : (wire38 ?
                          reg99 : wire38))) : $unsigned((reg87[(2'h2):(1'h1)] ?
                      (wire85 ? (8'ha6) : (8'ha3)) : (reg91 ?
                          wire31 : (8'hbb))))) ?
              reg91 : reg91))
            begin
              reg103 <= (|((~|((~(8'hb0)) > $signed(reg97))) + (&$signed({reg99,
                  reg87}))));
              reg104 <= reg101;
              reg105 <= $unsigned($signed(((reg99 - $unsigned(reg102)) ?
                  $unsigned({wire90, wire39}) : $unsigned($signed((8'hb9))))));
            end
          else
            begin
              reg103 <= $signed($unsigned(reg100[(4'hd):(4'ha)]));
            end
          if (reg87[(4'h8):(2'h2)])
            begin
              reg106 <= ($signed((wire30[(1'h0):(1'h0)] | wire38[(3'h5):(1'h0)])) ?
                  (reg100 ?
                      reg101[(3'h4):(1'h1)] : (+($unsigned(reg97) + reg93))) : $unsigned((^~$signed(((8'ha1) + reg101)))));
            end
          else
            begin
              reg106 <= (reg100[(3'h7):(3'h4)] | (($unsigned((reg91 ?
                  reg96 : reg87)) & $signed($unsigned(reg95))) + wire31[(3'h6):(1'h0)]));
              reg107 <= $signed((8'ha2));
              reg108 <= (~^reg106[(1'h0):(1'h0)]);
              reg109 <= (($unsigned(((reg97 != wire90) == (^reg89))) && $unsigned((!(reg104 ?
                      reg96 : reg97)))) ?
                  $unsigned((($signed(reg93) ? {(8'hbe)} : (wire30 != reg88)) ?
                      {wire36[(2'h3):(2'h2)]} : (reg94 << (|reg94)))) : $signed({reg92,
                      (reg99[(4'h8):(1'h1)] <<< wire38)}));
            end
          reg110 <= (&{((reg103 > $unsigned(wire33)) ?
                  {reg88[(3'h4):(2'h3)], wire31[(5'h14):(5'h10)]} : reg95),
              $signed($unsigned(reg97))});
          reg111 <= ($unsigned(($unsigned($unsigned(reg109)) >> $signed((-wire85)))) ?
              wire33 : (((~reg91) <<< ({(8'hb3)} ?
                  $signed(reg93) : $signed(reg101))) && reg88));
        end
      else
        begin
          reg102 <= reg89;
          reg103 <= (reg108 >> reg95[(1'h0):(1'h0)]);
          reg104 <= ((^wire39[(3'h7):(2'h3)]) ?
              $signed(wire37[(1'h0):(1'h0)]) : ((reg110 <<< (~(+reg106))) ?
                  $signed(reg108) : (-((reg107 ^~ reg93) ?
                      $signed(wire40) : (7'h43)))));
        end
      reg112 <= $signed((reg96[(4'ha):(2'h2)] ?
          $unsigned($unsigned(reg99)) : $unsigned(($unsigned((8'haf)) ?
              $signed(reg110) : wire39[(2'h2):(1'h1)]))));
    end
endmodule

module module41
#(parameter param84 = ((&((((8'hac) < (8'ha7)) != ((8'hb5) & (8'hbd))) << (((8'ha7) ? (8'ha6) : (8'hb5)) || (+(8'hbd))))) ? (~{(((8'h9e) != (8'ha5)) ? (^(8'ha8)) : ((8'hb1) ? (8'hbd) : (8'ha8))), (((8'ha9) - (7'h44)) >= (~&(8'h9d)))}) : {{(|{(8'hab), (8'ha0)})}, (((+(8'hb9)) < ((8'ha3) ? (8'ha4) : (8'hb4))) ? (((8'had) ? (8'hba) : (8'ha0)) ^~ {(8'ha4), (8'hb8)}) : (~^((8'ha4) ? (8'hac) : (8'hb6))))}))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire45;
  input wire [(4'hf):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire47,
                 wire46,
                 reg83,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg66,
                 reg63,
                 reg62,
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
                 (1'h0)};
  assign wire46 = $unsigned(wire43);
  assign wire47 = wire46[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= (!($signed(wire44[(3'h7):(3'h5)]) ?
          ($signed($signed(wire43)) ?
              (!wire45[(4'hc):(4'hb)]) : wire43) : wire42));
      if (((8'ha7) >>> $unsigned($signed((wire44 ?
          wire44[(3'h7):(3'h7)] : reg48)))))
        begin
          reg49 <= {(^~wire46[(1'h1):(1'h1)])};
          reg50 <= (reg49 ?
              ($unsigned(($signed(wire43) | $unsigned(reg48))) ?
                  wire42 : (~|((~&wire43) > $signed(wire42)))) : (~|$signed($unsigned((~|wire45)))));
        end
      else
        begin
          reg49 <= $signed(wire46[(4'ha):(4'h9)]);
          reg50 <= {{(reg48 * $unsigned($signed(wire45))),
                  wire47[(1'h1):(1'h1)]},
              (~^$signed((~(^(8'hb4)))))};
          reg51 <= $signed($signed(wire45));
        end
      reg52 <= $unsigned({($signed((wire45 == (8'hb2))) >> (~(~|wire45))),
          $signed({$unsigned(reg50), reg48})});
      if ($signed($signed((($signed(wire46) ?
          wire46 : reg48[(5'h10):(5'h10)]) - $signed(wire42[(4'h8):(3'h5)])))))
        begin
          if ((+{(reg51[(4'h9):(2'h3)] | $unsigned({wire42, reg48}))}))
            begin
              reg53 <= (|$unsigned((^reg49)));
              reg54 <= (((reg48[(5'h10):(4'hd)] ?
                      ($unsigned(wire45) << (wire46 ?
                          wire47 : reg50)) : wire42[(3'h7):(3'h7)]) ?
                  $unsigned($unsigned((wire43 ?
                      wire46 : wire45))) : $signed((reg48[(3'h7):(3'h7)] ?
                      (8'hbf) : $signed((8'hbf))))) << (~(-(^reg53))));
              reg55 <= ((reg54 == (({reg49} <<< reg52[(4'h9):(2'h2)]) << $unsigned((&reg54)))) != $signed(((wire43[(3'h5):(1'h0)] <<< reg50) ^~ wire44)));
              reg56 <= ((&(wire44 ?
                  reg50 : ($unsigned(reg54) * (~|reg49)))) <<< wire46[(3'h4):(3'h4)]);
              reg57 <= wire47[(1'h0):(1'h0)];
            end
          else
            begin
              reg53 <= (|reg57);
              reg54 <= {(reg55 ?
                      wire42[(2'h3):(1'h1)] : $signed({wire46[(2'h3):(2'h3)],
                          {reg49, reg53}})),
                  ($signed(((reg54 ?
                      wire45 : reg56) * wire47)) >= ({$unsigned(reg53)} ?
                      ((reg52 ?
                          wire42 : wire43) >> (8'hbe)) : $unsigned((!reg53))))};
            end
        end
      else
        begin
          reg53 <= $unsigned((reg50[(1'h0):(1'h0)] ?
              (((^~reg48) >>> ((8'hbc) ~^ (8'hb1))) != (8'ha1)) : (wire43[(1'h1):(1'h1)] ?
                  (8'hb2) : $unsigned((+reg52)))));
          reg54 <= reg51;
          reg55 <= ($signed(reg57[(1'h1):(1'h1)]) ?
              $signed(reg54) : (reg57[(4'he):(4'hd)] ?
                  $signed(wire42) : $unsigned((((8'ha1) <<< (8'h9c)) * $signed(reg57)))));
          reg56 <= ((wire46 ?
              $signed($unsigned($signed(reg55))) : (wire43 ?
                  {(wire44 ? wire46 : reg49)} : {(wire42 ?
                          wire44 : wire44)})) || wire42);
          if ((({$unsigned($unsigned(reg52))} & $signed($signed((reg53 ?
                  reg49 : wire45)))) ?
              $signed($signed({(~wire46),
                  (wire43 >>> (8'ha6))})) : wire44[(4'ha):(1'h0)]))
            begin
              reg57 <= {$signed(reg52[(3'h7):(1'h0)])};
              reg58 <= wire47;
              reg59 <= $unsigned(reg58);
              reg60 <= (|$signed(reg49));
              reg61 <= (~&((^~$unsigned((reg59 >>> reg58))) ?
                  (~&(reg51[(4'h9):(3'h6)] * reg50)) : ($signed(reg49[(4'h9):(2'h2)]) < reg52[(4'h9):(4'h8)])));
            end
          else
            begin
              reg57 <= reg55[(3'h6):(2'h2)];
              reg58 <= (reg54 | (~&reg61[(1'h1):(1'h1)]));
              reg59 <= {(-$unsigned(({wire43, wire43} ?
                      wire44[(1'h1):(1'h0)] : $unsigned(wire45))))};
            end
        end
      reg62 <= ($signed(wire42[(2'h2):(1'h1)]) ~^ ((~^$signed((reg59 ?
              wire44 : reg50))) ?
          reg59 : $unsigned(wire42[(3'h7):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg63 <= $signed(wire42);
    end
  assign wire64 = (((^~wire43[(3'h5):(3'h4)]) ? wire43[(1'h0):(1'h0)] : reg56) ?
                      $unsigned(wire45) : ((-(~&(wire44 ? (8'hbd) : reg49))) ?
                          (^~reg61[(1'h1):(1'h0)]) : reg57));
  assign wire65 = $signed(wire64[(5'h11):(3'h4)]);
  always
    @(posedge clk) begin
      reg66 <= wire46[(3'h6):(2'h2)];
    end
  assign wire67 = {{$signed(((reg53 >= reg51) ^ (reg50 * reg56)))}};
  assign wire68 = (~^$signed(({{(8'hb1)}, $signed(reg58)} ?
                      (~^(wire44 ?
                          (8'hbc) : reg52)) : $signed($unsigned(reg62)))));
  assign wire69 = (8'h9c);
  always
    @(posedge clk) begin
      reg70 <= (~(reg62[(5'h13):(3'h4)] < reg66));
      reg71 <= (8'ha8);
      reg72 <= (wire47[(1'h0):(1'h0)] >= reg55);
      reg73 <= ((~&reg57) ?
          $signed({{(|wire45)}}) : (reg56 > (((reg61 * (8'h9d)) ^~ $signed(reg54)) * reg72[(4'hb):(1'h1)])));
      reg74 <= ($unsigned($unsigned($signed(((8'hb5) == reg61)))) ?
          {($signed((reg70 ^ reg62)) | $unsigned(reg72[(2'h3):(2'h2)]))} : (|(+reg61[(3'h6):(1'h1)])));
    end
  assign wire75 = (reg59[(3'h6):(1'h0)] ? reg61 : reg74[(3'h5):(1'h1)]);
  assign wire76 = (~{(~^(|(reg56 * (8'ha1)))), {$signed(wire47), reg59}});
  assign wire77 = reg54[(1'h0):(1'h0)];
  assign wire78 = reg56;
  assign wire79 = (8'h9e);
  assign wire80 = (^wire79[(3'h5):(3'h5)]);
  assign wire81 = $unsigned($unsigned((~^reg73[(2'h3):(2'h2)])));
  assign wire82 = reg51;
  always
    @(posedge clk) begin
      reg83 <= ((!$signed($unsigned(reg66))) || (reg56 ?
          $signed($signed(reg57[(4'hf):(1'h0)])) : wire76[(3'h6):(3'h6)]));
    end
endmodule
