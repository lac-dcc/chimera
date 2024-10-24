module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h286):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(3'h7):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(5'h12):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire121;
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire5,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire121,
                 reg150,
                 reg149,
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
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = $signed(((($unsigned(wire1) || wire1) ^~ (+$signed(wire4))) ?
                     wire4[(5'h10):(3'h6)] : wire3));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($signed(((8'ha7) ? (8'hbb) : wire3)))) ?
          (^(wire4[(4'hd):(3'h4)] ?
              $unsigned($signed(wire5)) : $unsigned((~^wire3)))) : {(|((wire4 ?
                  wire2 : wire5) > (wire0 || wire1)))}))
        begin
          if (wire5)
            begin
              reg6 <= wire4;
              reg7 <= ((^$signed(((wire3 && (8'hb2)) == $signed(wire3)))) && $signed((^reg6[(3'h4):(3'h4)])));
              reg8 <= (((($signed(wire2) >> (8'hbb)) ^~ $unsigned($unsigned(wire5))) > wire0[(4'h8):(1'h0)]) ?
                  reg6[(4'ha):(3'h4)] : $unsigned({$signed((wire2 + wire1))}));
            end
          else
            begin
              reg6 <= $signed($signed((($unsigned(wire2) << $signed(reg6)) ?
                  wire0[(3'h5):(1'h1)] : (wire2[(3'h6):(3'h4)] ?
                      $unsigned((8'ha1)) : (wire5 ? reg6 : reg8)))));
              reg7 <= {{({(reg8 ? wire0 : reg7), $unsigned(wire0)} ?
                          $unsigned($unsigned(wire4)) : ((wire5 ?
                                  (8'h9e) : (8'ha0)) ?
                              ((8'haa) + reg8) : (7'h43))),
                      wire1[(1'h0):(1'h0)]}};
            end
        end
      else
        begin
          reg6 <= reg7[(5'h15):(4'h9)];
          if ($signed($unsigned({$unsigned(reg8[(1'h0):(1'h0)])})))
            begin
              reg7 <= $unsigned((8'h9e));
              reg8 <= reg7[(5'h11):(5'h10)];
            end
          else
            begin
              reg7 <= ($unsigned(wire3) && ({{$signed(wire0)},
                  wire2[(3'h6):(2'h2)]} + wire2[(2'h3):(1'h0)]));
              reg8 <= wire4;
            end
          reg9 <= (8'ha8);
          reg10 <= $unsigned(wire3[(1'h0):(1'h0)]);
        end
      if ((wire0[(2'h2):(2'h2)] <<< $unsigned($signed($signed(wire4[(3'h6):(1'h0)])))))
        begin
          if ($unsigned(wire0))
            begin
              reg11 <= ((|reg9[(1'h1):(1'h1)]) ?
                  reg10[(4'h8):(2'h3)] : (8'hbb));
            end
          else
            begin
              reg11 <= $signed(((&(reg11 << $signed(wire5))) * (wire5 ?
                  wire2[(3'h4):(2'h2)] : $signed((wire5 ? reg6 : wire3)))));
              reg12 <= ((((((7'h41) - wire5) < $unsigned((8'hbd))) & ({reg9} ?
                      (~|wire5) : reg8[(1'h0):(1'h0)])) != (((wire0 ^ reg8) ~^ (^~reg7)) ~^ $unsigned(wire1[(2'h2):(1'h1)]))) ?
                  $signed((8'had)) : (($signed((7'h44)) ?
                          wire1[(2'h2):(1'h1)] : wire1[(1'h1):(1'h0)]) ?
                      $signed($signed(wire4[(4'hb):(2'h2)])) : $unsigned((wire2[(2'h3):(1'h0)] ~^ wire0))));
              reg13 <= ($unsigned(reg10[(2'h2):(1'h0)]) + (&({(reg10 > reg8)} >= $unsigned(reg8[(2'h3):(1'h1)]))));
              reg14 <= reg8[(2'h2):(1'h0)];
            end
          if ({$signed($signed($unsigned(reg14[(2'h2):(2'h2)]))),
              (^~$unsigned((reg12[(4'hb):(4'ha)] * reg6[(4'h9):(4'h8)])))})
            begin
              reg15 <= (8'had);
              reg16 <= (reg13 ^ (reg8 + (($signed(reg6) ?
                      (wire5 - wire5) : wire5[(4'hc):(4'h8)]) ?
                  (~$signed((8'hb3))) : ((reg8 ? reg7 : wire5) ?
                      $signed(reg12) : reg15))));
              reg17 <= ((reg10 + reg14[(2'h2):(1'h0)]) > (reg6[(1'h1):(1'h0)] ?
                  $unsigned(((^~reg11) + $unsigned(reg7))) : reg15));
              reg18 <= ($unsigned($signed((+(!reg11)))) > (wire0[(1'h1):(1'h0)] ^ (~&$signed((reg13 ?
                  (8'ha3) : reg10)))));
            end
          else
            begin
              reg15 <= (|(+$unsigned(wire5[(4'hc):(4'ha)])));
              reg16 <= (8'hbc);
            end
          reg19 <= (8'ha4);
        end
      else
        begin
          if ($unsigned(wire1))
            begin
              reg11 <= $unsigned((~^((+(8'had)) ?
                  (~&wire4) : ((wire2 ? (7'h41) : (8'hbb)) | (wire1 ?
                      reg11 : wire5)))));
              reg12 <= reg12;
              reg13 <= (~(8'hb7));
            end
          else
            begin
              reg11 <= (~&(!wire2[(3'h6):(2'h2)]));
              reg12 <= (reg10 ?
                  $signed({(^$signed(reg11)),
                      (&(reg7 ^ reg18))}) : (^$signed((~reg12[(4'h8):(1'h1)]))));
            end
        end
      reg20 <= (&$unsigned((~(!reg12[(4'he):(1'h1)]))));
      if (($unsigned({$unsigned($unsigned(reg6)),
          wire3}) * ((^(~^$unsigned(reg12))) ?
          ($signed((&(8'hae))) ~^ (8'hbb)) : ($unsigned(wire5[(4'hb):(3'h4)]) >> reg13))))
        begin
          reg21 <= (8'ha5);
          reg22 <= reg13;
          reg23 <= (($signed(($signed(reg9) >>> $unsigned((8'hb9)))) && (wire3 >> (8'ha1))) ?
              ($signed((reg8[(3'h5):(1'h1)] * $signed(reg10))) ?
                  wire2[(3'h7):(1'h0)] : $signed(wire3[(1'h0):(1'h0)])) : (wire4 ?
                  (7'h42) : reg9[(2'h2):(1'h0)]));
          reg24 <= $signed((!reg7[(3'h4):(1'h0)]));
          reg25 <= {(((8'hbe) ?
                  (reg15[(4'hc):(3'h6)] ?
                      reg13 : wire1) : $signed($signed(wire2))) << (-(((7'h40) ?
                  reg24 : reg18) <<< {reg19, (8'haa)})))};
        end
      else
        begin
          reg21 <= $unsigned(reg11[(2'h2):(1'h1)]);
          reg22 <= reg25[(3'h6):(3'h4)];
        end
    end
  assign wire26 = $signed($signed((wire3[(2'h2):(1'h0)] && ((reg24 ?
                      reg19 : reg21) > (8'ha0)))));
  assign wire27 = $signed($signed(reg25));
  assign wire28 = (reg25 > $unsigned((((~^reg14) ?
                      $unsigned((7'h42)) : wire1) != reg18[(4'hd):(4'ha)])));
  assign wire29 = $unsigned($unsigned($unsigned($signed(reg25))));
  assign wire30 = (wire29 >> (({$unsigned((8'h9d))} ?
                      $signed({wire1, reg17}) : reg6) | wire5));
  module31 #() modinst122 (wire121, clk, reg24, reg8, wire1, reg14);
  assign wire123 = reg10[(3'h6):(2'h2)];
  assign wire124 = $signed(wire28[(2'h2):(1'h0)]);
  assign wire125 = $unsigned($signed($signed(wire121)));
  assign wire126 = {reg7};
  assign wire127 = $unsigned((wire124 < {$signed(reg15[(3'h4):(1'h0)]),
                       wire121}));
  assign wire128 = $unsigned((((wire3 ?
                           $unsigned(reg12) : (reg25 ?
                               reg17 : wire121)) + $signed(wire125)) ?
                       wire0 : ($unsigned($unsigned(wire4)) || $unsigned(wire124))));
  assign wire129 = ({$signed((8'ha0)),
                           $unsigned((^~(reg24 ? (8'ha7) : reg23)))} ?
                       ((~&$signed(reg9)) ?
                           $unsigned(wire124[(5'h13):(3'h5)]) : wire1) : (($signed((!(8'had))) ?
                               $signed({wire127}) : ({reg19,
                                   reg16} ^ (+wire1))) ?
                           $signed(reg21) : wire123[(2'h3):(1'h0)]));
  assign wire130 = wire1;
  assign wire131 = reg13;
  assign wire132 = {$signed(reg6), $signed($signed(reg6))};
  assign wire133 = $signed((((wire3[(1'h0):(1'h0)] ?
                       {(8'ha2)} : (reg21 ?
                           wire132 : reg14)) + ($unsigned(reg17) ?
                       reg7 : (^~reg17))) >= $signed(wire30[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg134 <= (+(~|(^~$unsigned($signed(wire29)))));
      reg135 <= (((^wire27) < $signed((reg10[(3'h6):(1'h1)] ?
          ((8'hb2) ?
              wire28 : reg16) : $signed((8'ha7))))) != ($signed(($unsigned(wire26) ?
          reg12[(4'hc):(4'h8)] : reg19[(3'h4):(2'h2)])) - (&$unsigned(reg8))));
      if (reg9)
        begin
          reg136 <= $signed({reg25[(3'h5):(1'h1)],
              $signed((reg23[(3'h6):(3'h6)] * (reg16 ? (8'ha5) : reg9)))});
          reg137 <= wire130;
          reg138 <= {((+reg136[(3'h7):(3'h5)]) ? wire130 : reg24)};
        end
      else
        begin
          if ((reg135[(3'h5):(2'h2)] != wire128))
            begin
              reg136 <= (!(7'h42));
              reg137 <= $signed($signed(wire130[(2'h3):(2'h3)]));
              reg138 <= wire130;
              reg139 <= reg20;
              reg140 <= $signed((^$signed($signed({(8'hb7), (7'h43)}))));
            end
          else
            begin
              reg136 <= $signed({($unsigned((~^wire121)) && $signed($signed(wire121)))});
              reg137 <= (wire123 ?
                  reg8 : (((+reg19) ? {$signed((8'had))} : reg139) ?
                      (|wire28[(2'h2):(1'h1)]) : (&(reg23[(4'hf):(4'h9)] ~^ $signed(reg17)))));
              reg138 <= ((7'h42) ?
                  ((~&{(wire1 ? wire26 : wire127),
                      wire30[(2'h3):(1'h1)]}) <<< {wire127[(1'h1):(1'h1)]}) : reg139);
              reg139 <= ((~($signed(((8'ha9) ?
                      reg11 : reg8)) && (~$signed(reg24)))) ?
                  (^$signed($unsigned((^reg16)))) : reg135[(1'h0):(1'h0)]);
              reg140 <= $signed(reg138);
            end
          if ($unsigned((&($signed((&(7'h40))) ? (8'ha4) : wire2))))
            begin
              reg141 <= reg24[(5'h11):(3'h6)];
              reg142 <= (+$unsigned($signed(($signed(wire2) >> $unsigned(wire131)))));
              reg143 <= (8'hbd);
              reg144 <= ((-(^~(reg143 ? reg7 : (~wire121)))) ~^ wire28);
            end
          else
            begin
              reg141 <= reg15[(4'h8):(3'h5)];
              reg142 <= reg15[(4'h8):(3'h5)];
              reg143 <= ((reg16 || $signed($unsigned(reg144[(4'he):(1'h0)]))) ?
                  wire124[(5'h15):(5'h12)] : reg135[(1'h0):(1'h0)]);
              reg144 <= reg13[(3'h4):(1'h0)];
            end
          reg145 <= (~^($signed((|(reg22 | reg14))) ?
              $unsigned(((reg143 ? wire27 : reg139) ?
                  {(8'ha2)} : (8'hb1))) : $unsigned(($unsigned(reg13) ?
                  wire28[(1'h1):(1'h1)] : (!wire131)))));
          reg146 <= (reg22 ? reg136 : $unsigned($signed((^reg14))));
          reg147 <= ((^reg141[(4'hd):(1'h1)]) | reg135);
        end
      reg148 <= $signed((~&$unsigned($unsigned((reg8 <<< (8'hb6))))));
      if ($signed((^reg9)))
        begin
          reg149 <= $signed($unsigned(reg22[(4'hc):(3'h5)]));
        end
      else
        begin
          reg149 <= ((~^((!reg6) == $unsigned(wire5[(1'h0):(1'h0)]))) < reg145[(3'h5):(3'h4)]);
          reg150 <= $unsigned((^~(|$signed(reg11[(1'h1):(1'h0)]))));
        end
    end
  assign wire151 = ((~|(((reg139 >= wire133) >> ((7'h40) ? reg148 : wire29)) ?
                       ((wire124 ? reg20 : wire26) ?
                           wire1[(3'h7):(1'h0)] : (|wire30)) : $signed(reg17))) | {wire125,
                       ($signed($signed((8'hb0))) ?
                           $unsigned(reg141[(3'h4):(3'h4)]) : reg150[(4'hb):(3'h6)])});
  assign wire152 = reg16[(4'h9):(2'h2)];
endmodule

module module31
#(parameter param119 = (({((|(8'ha3)) ? (8'ha6) : (^~(8'ha3)))} >= ({((8'hb9) + (8'hac)), ((8'hae) ~^ (8'haa))} >> (^(-(8'hae))))) >= (8'hac)), 
parameter param120 = ({param119} ~^ ((~^param119) ? (~|(param119 ~^ (8'ha2))) : (^((!param119) & (^~param119))))))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire37,
                 wire36,
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
                 (1'h0)};
  assign wire36 = wire34;
  assign wire37 = {(-($unsigned(wire34) ?
                          $signed((+wire36)) : wire33[(4'ha):(2'h2)])),
                      ((~^$unsigned((wire32 ? wire33 : (7'h41)))) ?
                          (!wire33[(4'ha):(3'h6)]) : ((-{(8'haa),
                              wire34}) & $signed((~^wire33))))};
  always
    @(posedge clk) begin
      reg38 <= (wire37 >>> (($signed($signed((8'haf))) >>> ($signed(wire37) ?
          (!wire36) : $unsigned((7'h41)))) + $unsigned({(wire35 ?
              wire35 : (8'hb2)),
          wire35})));
      if ((wire33[(4'ha):(3'h6)] ?
          ({reg38,
              $unsigned((wire34 ?
                  wire32 : reg38))} ^ (^(wire34[(4'hf):(3'h5)] >> (wire35 + wire35)))) : $unsigned(($signed((^~(7'h44))) ?
              $signed({wire36}) : {(!wire34), $signed(wire34)}))))
        begin
          reg39 <= (&(8'h9f));
          reg40 <= wire34;
        end
      else
        begin
          reg39 <= (&reg39[(1'h1):(1'h0)]);
          reg40 <= (+$unsigned({(wire32 ~^ (~wire37)), reg40}));
          reg41 <= (8'hb3);
          if ($signed($signed({reg40})))
            begin
              reg42 <= ($unsigned(((((8'hae) <= wire37) ^ wire37) >>> ((~^reg40) - wire32))) ?
                  (+$signed(((+reg38) ?
                      wire34 : ((8'hb6) <= (8'hbf))))) : (((!$signed((8'hb1))) ?
                      $unsigned(((8'hac) <<< (8'hb1))) : wire34[(3'h6):(3'h6)]) && (((+reg41) >>> reg38) ?
                      ({wire36} ?
                          $unsigned(reg40) : $unsigned(wire35)) : ($unsigned(reg41) & {(8'hb1)}))));
            end
          else
            begin
              reg42 <= (^~($signed($unsigned($signed(wire37))) ~^ ((wire37 && $unsigned((8'hae))) >= ((8'hb0) <<< (^~reg41)))));
              reg43 <= ($unsigned($unsigned($unsigned(wire33[(3'h6):(1'h1)]))) || wire37[(3'h4):(2'h3)]);
              reg44 <= $unsigned($unsigned(((((8'hb0) ? reg42 : (8'h9c)) ?
                  (8'ha6) : (reg40 ? wire37 : (8'hab))) > wire33)));
              reg45 <= wire33[(4'hb):(1'h1)];
            end
          reg46 <= {$unsigned((!$unsigned($signed(wire32)))), reg39};
        end
      reg47 <= (|$signed(wire35));
      reg48 <= (8'ha1);
      reg49 <= ($signed(wire32) ~^ (^reg43));
    end
  module50 #() modinst85 (wire84, clk, wire32, reg39, reg40, wire37);
  assign wire86 = (({wire36} ? wire34[(3'h7):(2'h3)] : reg49) ?
                      (~|reg45[(2'h2):(1'h1)]) : ($signed($signed((reg41 + wire34))) ?
                          reg47 : $signed((!{reg41}))));
  assign wire87 = $signed(reg49[(3'h6):(3'h5)]);
  assign wire88 = reg48;
  assign wire89 = $unsigned(reg46[(1'h1):(1'h1)]);
  assign wire90 = $signed(wire87[(3'h4):(2'h2)]);
  assign wire91 = ((8'ha8) <= $signed($unsigned($signed((wire89 ~^ (8'ha2))))));
  module92 #() modinst111 (wire110, clk, wire32, wire89, reg39, reg42);
  assign wire112 = $signed($unsigned($signed($signed(wire35))));
  assign wire113 = $signed({$signed(wire36[(4'he):(1'h1)])});
  assign wire114 = $unsigned($signed($unsigned((wire112 ?
                       {wire89, wire89} : wire32))));
  assign wire115 = ({reg48, wire113[(1'h1):(1'h1)]} == wire91);
  assign wire116 = $unsigned(((8'hb6) < reg40));
  assign wire117 = $unsigned(wire110);
  assign wire118 = wire110;
endmodule

module module92
#(parameter param108 = (~&(8'hab)), 
parameter param109 = {(+(({param108} ? {param108} : (param108 ? param108 : param108)) ? ((param108 ? param108 : param108) > (param108 - param108)) : {(~param108)}))})
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire96;
  input wire signed [(2'h2):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  input wire [(4'h9):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire97 = wire93;
  assign wire98 = {wire94};
  assign wire99 = wire97[(5'h12):(3'h7)];
  always
    @(posedge clk) begin
      reg100 <= (^~{((wire95[(1'h1):(1'h1)] & wire96) * ((wire97 ^ wire96) >> wire93)),
          ((wire94 > wire93[(4'h8):(3'h6)]) ?
              (|$unsigned((7'h41))) : ((wire97 ?
                  (8'hb1) : wire94) - wire99[(2'h2):(2'h2)]))});
      reg101 <= (((|$unsigned((wire96 >= wire99))) ?
          {((wire99 >= wire95) && (~&wire94)),
              $signed($signed(wire99))} : ($signed((wire97 > wire97)) == (~$signed(reg100)))) || (($signed(((7'h40) ?
              wire96 : reg100)) ~^ wire99[(1'h0):(1'h0)]) ?
          {wire93[(3'h5):(3'h5)],
              reg100[(4'h8):(2'h3)]} : wire98[(4'he):(4'hd)]));
      if ($signed($unsigned((+wire94[(3'h4):(1'h1)]))))
        begin
          reg102 <= ({$signed(reg101)} ?
              {({$signed(wire93),
                      reg101[(2'h3):(2'h2)]} && $unsigned(wire97[(3'h4):(1'h0)])),
                  wire97[(5'h10):(1'h0)]} : (-wire96));
          reg103 <= ((({$unsigned(wire99), $unsigned(reg101)} ?
                  $unsigned({wire96}) : {reg101[(1'h0):(1'h0)],
                      (wire99 ? (8'hb4) : wire93)}) & wire98[(3'h5):(1'h0)]) ?
              wire94 : (&$signed($signed(reg101))));
          if ((((~^reg102) ^ wire94) ?
              wire98 : $signed((+$unsigned((-(8'hb9)))))))
            begin
              reg104 <= ($signed($unsigned($unsigned(wire98[(2'h2):(2'h2)]))) != (wire93[(3'h6):(2'h3)] || $unsigned($signed((reg103 ?
                  wire94 : reg100)))));
              reg105 <= (7'h41);
            end
          else
            begin
              reg104 <= $signed(((|(((7'h41) ^~ wire93) ?
                  (wire99 && reg105) : wire97)) && $signed($signed((wire98 - reg102)))));
              reg105 <= reg105[(4'hf):(4'hf)];
            end
          reg106 <= (wire93[(4'h8):(3'h7)] | $signed(((wire95[(1'h1):(1'h1)] != (wire93 ?
              wire98 : wire95)) + wire97)));
        end
      else
        begin
          reg102 <= reg104;
          if ($unsigned({$signed(($signed(wire94) << $signed((8'haa))))}))
            begin
              reg103 <= {reg103,
                  $unsigned($unsigned(((^wire98) && (wire95 ?
                      wire96 : reg102))))};
              reg104 <= (!reg104);
            end
          else
            begin
              reg103 <= wire99;
              reg104 <= $unsigned(wire96[(1'h0):(1'h0)]);
            end
          reg105 <= (^(wire96 > wire99));
          reg106 <= ((7'h42) ? reg105 : reg103[(1'h1):(1'h0)]);
        end
      reg107 <= {$signed({(-$signed(reg102)), (-$unsigned(wire99))})};
    end
endmodule

module module50
#(parameter param82 = (!(((~^{(7'h40)}) >>> ((~^(8'hb2)) >>> (^(8'ha7)))) ^ (8'hbd))), 
parameter param83 = (|{param82}))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire54;
  input wire [(4'hc):(1'h0)] wire53;
  input wire signed [(4'hc):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire55;
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire55,
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
                 (1'h0)};
  assign wire55 = wire52;
  always
    @(posedge clk) begin
      if ((((|wire54[(4'h9):(2'h3)]) != (wire51 >> (-(~&wire53)))) <<< (~((~|(wire52 != wire53)) ?
          (-$unsigned(wire55)) : ((wire53 ?
              wire53 : wire52) || $unsigned(wire54))))))
        begin
          reg56 <= $unsigned($signed(($unsigned((wire52 ?
              wire54 : wire52)) >= (wire55[(1'h0):(1'h0)] ?
              wire52 : wire53[(4'h8):(3'h7)]))));
          reg57 <= wire53[(4'h8):(2'h3)];
          reg58 <= {($unsigned(reg56) & wire53),
              ($signed(({wire54} ?
                  (wire52 ?
                      (8'ha2) : wire52) : reg56[(2'h3):(1'h0)])) && reg56)};
          reg59 <= {$unsigned(($signed($unsigned(wire55)) ?
                  $unsigned(reg56[(4'h9):(4'h9)]) : wire53[(3'h7):(3'h5)]))};
        end
      else
        begin
          if (wire54[(5'h12):(4'hf)])
            begin
              reg56 <= $unsigned($signed((8'ha5)));
              reg57 <= (((~|reg58[(4'hd):(4'hd)]) * ((~&wire55[(1'h1):(1'h1)]) ?
                  $unsigned((wire51 ?
                      wire51 : (8'h9e))) : (|$signed(reg58)))) ~^ ((((wire54 ?
                          (8'hb1) : wire54) ?
                      $signed((8'haf)) : {reg56}) ?
                  (~|wire54[(3'h4):(3'h4)]) : $signed((reg56 ?
                      reg58 : reg57))) | ($unsigned({reg59, wire53}) ?
                  reg57[(5'h12):(3'h4)] : ((reg59 | (8'hb3)) ?
                      wire55 : (!reg57)))));
              reg58 <= ((~{wire51,
                      ((reg57 || wire51) ? reg58[(4'h9):(3'h5)] : (&reg58))}) ?
                  (&(wire52[(4'h9):(3'h4)] ?
                      (~^{wire54}) : (~|(~^wire51)))) : (wire54[(5'h14):(4'hb)] >= ((~^(wire52 <= reg56)) == reg57)));
              reg59 <= {(&$unsigned(wire53[(4'hb):(4'h9)]))};
              reg60 <= (7'h41);
            end
          else
            begin
              reg56 <= $unsigned(reg59);
              reg57 <= ((^~wire53) >> $signed(($signed((+wire52)) < (~&$signed(wire53)))));
            end
          reg61 <= (wire52[(2'h3):(2'h3)] ?
              ($signed((~|(reg58 ?
                  wire55 : reg60))) * $signed(((reg57 << wire55) == wire51))) : (reg58 ?
                  $unsigned(((|reg60) >> {wire53,
                      reg57})) : $signed($unsigned((+wire54)))));
          if (wire51)
            begin
              reg62 <= (~((+$unsigned($unsigned((7'h41)))) <<< ((-$signed((8'hab))) << reg60[(4'hb):(3'h7)])));
            end
          else
            begin
              reg62 <= $signed(reg61[(3'h6):(2'h2)]);
              reg63 <= (-(&reg61[(1'h1):(1'h1)]));
              reg64 <= ({($unsigned(reg56) ?
                      reg60[(4'hb):(4'h8)] : $signed((wire53 <<< wire52))),
                  {((&wire55) ? $signed(reg61) : ((8'hbd) ? reg56 : wire52)),
                      wire53[(4'h9):(1'h1)]}} ^~ (wire54 ?
                  ((^~(wire54 ?
                      reg62 : wire51)) | wire53[(2'h3):(2'h2)]) : reg62));
              reg65 <= ($signed((wire54 <<< reg61[(3'h4):(2'h2)])) ?
                  $unsigned(reg56) : reg62[(4'h9):(1'h0)]);
              reg66 <= $unsigned((8'hb2));
            end
        end
      reg67 <= wire55;
      reg68 <= {$unsigned(wire55[(1'h1):(1'h1)])};
      reg69 <= reg64;
      reg70 <= $signed((reg56 < reg63[(2'h2):(2'h2)]));
    end
  assign wire71 = $unsigned($signed($unsigned(wire55[(1'h0):(1'h0)])));
  assign wire72 = (((wire53[(2'h3):(1'h1)] && $unsigned(reg56[(3'h6):(1'h1)])) ?
                      reg65 : reg56[(1'h1):(1'h0)]) ^ (|(((~&wire54) ?
                      reg64[(2'h3):(1'h1)] : reg61) >> reg70[(4'h9):(1'h1)])));
  assign wire73 = $signed((~|(reg62 << $signed(reg62[(4'ha):(3'h6)]))));
  assign wire74 = $signed({$signed(($unsigned(reg70) ?
                          {wire72, reg64} : wire51[(4'hc):(4'h9)]))});
  assign wire75 = reg68[(2'h2):(1'h0)];
  assign wire76 = ({($signed((!reg62)) ~^ $unsigned((reg59 ?
                          reg64 : (8'ha4))))} < wire75[(3'h6):(3'h5)]);
  assign wire77 = $signed(wire74);
  assign wire78 = $unsigned((((~&reg60) ?
                          ((wire53 ? reg59 : wire53) >> ((8'hac) ?
                              wire51 : wire51)) : $signed(wire53[(4'h9):(1'h0)])) ?
                      $unsigned($signed((~reg69))) : (+$unsigned((-wire72)))));
  assign wire79 = (|$unsigned($unsigned(wire52)));
  assign wire80 = ($signed({reg63[(2'h2):(1'h1)]}) != reg66);
  assign wire81 = $signed((reg62[(4'hd):(1'h1)] ?
                      (({reg66} ?
                          reg64 : (reg68 & wire77)) <<< wire51[(4'hb):(3'h6)]) : (+({wire80} ?
                          $signed(wire75) : wire75))));
endmodule
