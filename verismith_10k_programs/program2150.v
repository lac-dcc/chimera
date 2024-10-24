module top
#(parameter param129 = (({(((8'hbc) ? (8'h9f) : (8'had)) ? (~|(8'hae)) : ((8'h9d) ? (7'h43) : (8'ha8)))} ? ((&((8'ha5) ? (7'h43) : (8'hb4))) ? {{(7'h40)}, ((8'hb7) <<< (8'hb4))} : (^{(7'h44), (8'ha1)})) : {(((8'hbe) ? (8'hb4) : (8'ha5)) ? ((8'ha3) ? (7'h44) : (8'hb7)) : ((8'hbb) <<< (7'h40)))}) ^ (((((8'ha4) ? (7'h40) : (8'hbf)) ? {(8'hb7)} : ((8'hae) ? (8'ha9) : (8'ha8))) ? (^~((7'h43) ? (8'hb0) : (8'haf))) : ({(8'hb1)} >> ((8'ha3) - (7'h41)))) ? ((8'had) >>> (|(~(8'hb9)))) : {(&((8'ha4) + (8'hae))), ({(8'hac)} ? {(8'ha6)} : ((8'hb4) >> (8'h9c)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire124;
  assign y = {wire128, wire127, wire126, wire124, (1'h0)};
  module5 #() modinst125 (.wire9(wire0), .wire8(wire4), .wire7(wire1), .wire6(wire2), .clk(clk), .y(wire124));
  assign wire126 = $signed((wire1 && wire2));
  assign wire127 = wire0;
  assign wire128 = $unsigned(wire4[(4'h8):(2'h3)]);
endmodule

module module5
#(parameter param122 = ((8'ha1) ? {((8'haa) == ((~|(8'ha0)) | ((8'ha4) ^~ (8'hae))))} : (({(+(8'hb3))} ? (^~(8'ha7)) : (((8'hb8) ? (8'hbf) : (8'hab)) ? {(8'ha6), (7'h40)} : ((8'ha0) & (8'ha2)))) - (^~((7'h43) ? (!(7'h41)) : ((8'hbd) ? (8'hbe) : (8'hbc)))))), 
parameter param123 = ((({(param122 ^ param122)} ? (-param122) : ({param122} > (param122 < param122))) == ((((8'hb0) && param122) >>> (^param122)) != (param122 >> param122))) ? param122 : (((((8'ha9) == param122) <<< {param122, (7'h42)}) ? param122 : {(param122 ? param122 : param122), (param122 ? param122 : (8'ha0))}) ? param122 : {(~^(param122 | param122))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire71,
                 wire17,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= wire7;
    end
  always
    @(posedge clk) begin
      reg11 <= wire6[(2'h2):(1'h1)];
      reg12 <= ((~|reg11[(2'h3):(1'h0)]) >>> ($signed(wire6[(2'h3):(1'h1)]) << $unsigned($unsigned((8'ha7)))));
      reg13 <= {(~|(wire9[(4'h9):(4'h9)] ?
              (&{wire9}) : $unsigned(((8'haa) <<< reg12)))),
          {(((wire9 ? reg10 : reg11) ? (wire8 | reg11) : (~^(8'h9f))) ?
                  $unsigned(reg11) : {{wire9, wire7}})}};
      if ($unsigned((wire9 ?
          (((reg13 & reg10) ?
              wire7[(1'h1):(1'h1)] : ((8'had) == (8'ha2))) <= (wire7[(1'h0):(1'h0)] <= wire6[(1'h0):(1'h0)])) : (&($signed((8'hb8)) ?
              reg11 : {reg11, (7'h42)})))))
        begin
          reg14 <= $signed(((~{(!reg10)}) | reg13));
        end
      else
        begin
          reg14 <= $unsigned(((|(!reg10[(3'h7):(1'h0)])) ?
              (8'haa) : {wire8[(4'h9):(3'h5)], reg13}));
          reg15 <= {reg13[(2'h3):(1'h1)], wire7};
        end
      reg16 <= (&(reg14[(3'h6):(3'h5)] ?
          reg11 : ({wire7[(1'h0):(1'h0)], wire9} ? reg14 : (+{reg12}))));
    end
  assign wire17 = ((!$signed(reg10[(4'hc):(2'h2)])) ^~ $signed(reg14[(3'h6):(1'h1)]));
  always
    @(posedge clk) begin
      reg18 <= reg13[(2'h3):(1'h1)];
      reg19 <= $signed($signed($unsigned((~|(^wire8)))));
      if ({$signed(wire17)})
        begin
          reg20 <= reg18;
          if (($unsigned($signed($signed(wire17[(2'h2):(2'h2)]))) >>> $signed(((8'haa) > reg12[(1'h1):(1'h1)]))))
            begin
              reg21 <= {{(reg15[(2'h3):(2'h3)] ?
                          {(~^wire8)} : reg14[(3'h7):(1'h0)])}};
              reg22 <= ($signed($unsigned(reg10[(1'h0):(1'h0)])) && (+$unsigned(($unsigned(reg18) ?
                  $unsigned(wire17) : (reg10 - reg15)))));
              reg23 <= {reg11};
            end
          else
            begin
              reg21 <= ($unsigned((($unsigned(wire6) ~^ reg19) ^ $signed($signed(reg22)))) <= ((+reg21) << {{$unsigned((8'hbe)),
                      $unsigned(reg14)},
                  ($signed(reg16) ? {reg14, (7'h40)} : ((8'hbb) * reg18))}));
              reg22 <= (reg10[(4'hf):(4'hf)] ?
                  $signed(((reg22[(4'he):(4'hd)] ? (~|reg12) : (~&reg14)) ?
                      (reg12 - {wire9}) : $unsigned(reg23))) : $signed((wire6[(1'h1):(1'h1)] <<< wire9)));
              reg23 <= $signed($unsigned(wire9));
              reg24 <= reg20[(3'h7):(1'h1)];
            end
        end
      else
        begin
          reg20 <= (reg13 ?
              $unsigned($signed((reg23[(3'h4):(1'h0)] - wire8[(4'h9):(2'h3)]))) : (+wire6));
          if ((&$signed(reg24[(1'h1):(1'h1)])))
            begin
              reg21 <= (8'h9f);
              reg22 <= reg16;
              reg23 <= (!(reg15[(4'h8):(2'h2)] >= (^($signed(reg13) ?
                  {reg22, wire6} : $signed(reg22)))));
            end
          else
            begin
              reg21 <= reg12;
              reg22 <= (((({reg14} ?
                      $unsigned(reg20) : reg23) == reg14[(1'h0):(1'h0)]) >= {$signed(((8'hb5) ?
                          (8'had) : reg22)),
                      ((8'hb3) ? wire7 : (reg23 ? wire6 : reg11))}) ?
                  wire8[(1'h1):(1'h0)] : ($signed({((7'h43) >> reg14)}) ?
                      $signed(({reg12} << (-reg15))) : wire9));
              reg23 <= $signed($unsigned(((reg22[(4'hf):(2'h3)] ?
                  reg16 : (+reg10)) <= {{reg14}})));
              reg24 <= $signed($signed(reg16[(1'h0):(1'h0)]));
            end
          if ($signed(reg15))
            begin
              reg25 <= {(reg10[(5'h14):(4'he)] ?
                      {(~reg23), (|(!reg22))} : $signed($unsigned((!wire7))))};
              reg26 <= $unsigned($unsigned((^(~&(wire8 ? reg11 : reg23)))));
              reg27 <= ((-$unsigned(wire9[(2'h3):(2'h3)])) ?
                  $unsigned(reg25[(1'h0):(1'h0)]) : $signed($unsigned(reg16[(4'h9):(1'h0)])));
            end
          else
            begin
              reg25 <= $unsigned(((~$unsigned(reg15)) ?
                  $signed((^~reg12)) : reg16[(2'h2):(2'h2)]));
              reg26 <= (((~$signed({(8'hb7), reg22})) & (((reg13 ?
                          wire9 : reg11) ?
                      reg18[(2'h2):(1'h1)] : $signed(reg16)) - reg21[(4'h8):(4'h8)])) ?
                  reg12[(4'ha):(3'h4)] : $signed($unsigned(wire9[(2'h2):(1'h1)])));
              reg27 <= (wire9[(1'h1):(1'h0)] ?
                  $signed($signed(wire17)) : $signed({(|(reg21 ?
                          wire7 : wire7))}));
              reg28 <= reg20[(2'h2):(1'h1)];
            end
          if ((8'hae))
            begin
              reg29 <= $unsigned((wire6[(2'h3):(2'h3)] != ($unsigned((reg16 ?
                      reg26 : reg11)) ?
                  (wire17[(1'h1):(1'h1)] ?
                      $unsigned(reg15) : {reg15}) : $signed((reg26 ?
                      wire7 : reg10)))));
              reg30 <= reg28[(2'h2):(1'h1)];
              reg31 <= (~(&(|(&(~|reg18)))));
              reg32 <= (reg22 ? reg15 : reg25);
              reg33 <= (wire8 - $signed($signed((7'h43))));
            end
          else
            begin
              reg29 <= (^~($unsigned(((|reg30) ?
                  (!wire7) : $unsigned(reg31))) ^~ $unsigned((|reg25[(1'h1):(1'h0)]))));
            end
        end
    end
  module34 #() modinst72 (wire71, clk, wire8, reg20, reg19, wire6, reg16);
  always
    @(posedge clk) begin
      reg73 <= reg11[(3'h5):(3'h4)];
      if ({reg27})
        begin
          reg74 <= $signed($unsigned($unsigned({$unsigned(reg33),
              (wire17 < reg19)})));
          reg75 <= ($signed($signed(reg29)) ?
              (|$signed($signed($signed(wire8)))) : ((((^~reg33) * $unsigned(reg26)) != reg20) ~^ (-($signed(reg30) ?
                  (reg20 ? reg31 : (7'h44)) : $unsigned(reg30)))));
          reg76 <= ($unsigned($signed(((8'hb8) ?
                  $unsigned((8'hbb)) : $unsigned(reg20)))) ?
              (+{(reg20 <<< {reg27})}) : (~&$unsigned($unsigned({reg75,
                  reg12}))));
          reg77 <= {reg28[(3'h4):(1'h0)]};
        end
      else
        begin
          reg74 <= wire71[(3'h6):(2'h3)];
          reg75 <= (+$signed(wire9[(3'h6):(1'h1)]));
          if (($signed({$signed((wire71 & reg26))}) - reg16))
            begin
              reg76 <= reg75[(4'he):(2'h2)];
              reg77 <= ($unsigned(wire8) ?
                  reg24[(1'h0):(1'h0)] : reg25[(2'h3):(2'h3)]);
              reg78 <= (8'hb3);
              reg79 <= reg27;
              reg80 <= {$unsigned($signed(reg18[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg76 <= (+reg28[(1'h0):(1'h0)]);
              reg77 <= reg10[(5'h10):(4'ha)];
              reg78 <= ($signed((-(^~$signed(reg28)))) ?
                  $signed(($signed((wire8 ?
                      (8'hb5) : reg28)) << reg22[(3'h4):(2'h3)])) : $signed((^~$signed((^wire17)))));
              reg79 <= (-(^{(~^(reg15 ? wire7 : reg20))}));
              reg80 <= ((8'hb4) ?
                  (~^{((7'h41) ? (reg29 ? reg79 : reg27) : $signed((8'hb9))),
                      $signed(reg28[(1'h0):(1'h0)])}) : reg20);
            end
          reg81 <= reg15;
        end
    end
  assign wire82 = (^reg75[(4'hb):(4'ha)]);
  assign wire83 = ($unsigned(reg32) >= $unsigned(reg19[(3'h6):(1'h0)]));
  assign wire84 = (wire9 < (8'h9d));
  assign wire85 = $unsigned(($signed(((reg81 ^~ reg75) ~^ reg75)) != reg79));
  module86 #() modinst118 (wire117, clk, reg75, reg27, reg25, reg29);
  assign wire119 = {$signed(reg25),
                       (&$signed(((wire117 ?
                           reg32 : reg81) < (reg79 ^~ reg31))))};
  assign wire120 = ({{{(!reg15)}}} ?
                       (&reg28) : ($signed(($signed(reg28) ?
                               $signed(wire119) : reg28[(1'h0):(1'h0)])) ?
                           wire83[(3'h6):(2'h2)] : ((reg29 != wire71) < reg75)));
  assign wire121 = reg11;
endmodule

module module86
#(parameter param115 = ((^~((8'haa) || ((~&(8'had)) ? (~(8'hb8)) : ((7'h41) ? (7'h44) : (8'had))))) >>> {{{((8'ha9) >= (8'ha7))}, ((^~(8'hb7)) - ((8'h9e) || (8'hb4)))}}), 
parameter param116 = (~|{(^~(!(8'hb7)))}))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire [(5'h11):(1'h0)] wire88;
  input wire [(5'h12):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire102;
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  assign y = {wire114,
                 wire102,
                 reg113,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg91 <= $unsigned(wire88);
      if ((~(~$signed({(wire88 | wire87)}))))
        begin
          reg92 <= $unsigned(($unsigned((^~(wire89 <<< wire90))) >= reg91));
          reg93 <= (((&reg91[(1'h1):(1'h1)]) == (wire87 <<< $signed(((8'ha0) || wire90)))) && $signed(((~&wire88) ?
              (~&(~^reg91)) : ((reg92 || wire89) ?
                  $unsigned(wire88) : (|wire90)))));
          reg94 <= ($unsigned($unsigned($signed(reg93[(1'h1):(1'h0)]))) < $unsigned(({$signed((8'ha1)),
              $signed(reg92)} * $unsigned($unsigned(reg92)))));
          if ({(&($signed($signed(wire87)) < ((!reg93) ?
                  {reg93} : {(8'hb1)})))})
            begin
              reg95 <= reg94[(1'h0):(1'h0)];
              reg96 <= (reg94[(4'h8):(3'h4)] >>> ((((^reg95) == $unsigned(wire87)) >= reg93) * wire89[(5'h13):(1'h0)]));
              reg97 <= reg93;
              reg98 <= (~^reg96);
              reg99 <= (reg96[(3'h4):(2'h2)] & (~$unsigned(reg93[(3'h5):(3'h5)])));
            end
          else
            begin
              reg95 <= $signed((~^(((reg95 <<< reg97) ?
                      $unsigned((7'h40)) : $unsigned(wire90)) ?
                  $unsigned($unsigned(wire90)) : reg97[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if ($signed({reg91[(3'h7):(2'h3)],
              (($unsigned(reg94) * (!reg95)) - wire90[(2'h3):(1'h1)])}))
            begin
              reg92 <= (^~({(^~$unsigned(wire90))} == (8'hac)));
              reg93 <= (reg92 < reg98[(4'hd):(2'h2)]);
              reg94 <= $signed($signed(reg96));
            end
          else
            begin
              reg92 <= reg97[(2'h2):(1'h1)];
            end
          if ((($signed($unsigned($signed(reg97))) ?
                  reg95[(4'hb):(3'h7)] : ($signed((wire88 ?
                      reg95 : reg92)) << ($unsigned(reg92) <<< (8'hb9)))) ?
              $unsigned(reg97) : $signed((|{(~^wire87),
                  wire88[(3'h6):(3'h6)]}))))
            begin
              reg95 <= $unsigned({reg98});
              reg96 <= (|reg92[(2'h2):(2'h2)]);
              reg97 <= (-{(~^wire90[(3'h5):(3'h5)]),
                  $signed((|$unsigned(reg97)))});
              reg98 <= (wire89 ?
                  (8'hb2) : $signed((reg98[(3'h5):(2'h3)] <= $signed({reg97,
                      reg95}))));
            end
          else
            begin
              reg95 <= ((~^(reg91 >> ($signed(reg97) > $unsigned(reg93)))) <= reg97);
              reg96 <= reg98[(5'h12):(3'h7)];
            end
          reg99 <= ((($signed(((8'ha6) && reg95)) ?
                  ((reg91 ? reg93 : reg92) != (wire90 ?
                      reg95 : reg95)) : $signed({wire89, reg99})) ?
              $unsigned(wire89[(4'h8):(1'h1)]) : (^$signed((wire90 ?
                  reg91 : (7'h40))))) || (reg91 ?
              {$unsigned($signed(wire87)), (8'ha4)} : ($unsigned((reg95 ?
                  wire90 : reg94)) && ((wire88 ?
                  reg99 : reg94) ^~ reg92[(1'h1):(1'h1)]))));
          reg100 <= $unsigned(((~(reg95 <= (wire87 ^~ wire89))) > (~&($signed(reg96) ?
              wire89 : (wire90 >= wire87)))));
        end
      reg101 <= $unsigned((reg99[(5'h10):(4'hd)] ~^ $signed($unsigned($signed(wire87)))));
    end
  assign wire102 = reg95[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg103 <= reg97[(1'h0):(1'h0)];
      reg104 <= ({(reg98[(2'h2):(1'h0)] || $signed(((8'ha5) ?
              reg101 : (8'hab))))} | (((8'had) ?
              $signed($unsigned(reg95)) : $unsigned({reg96})) ?
          $signed((^~$unsigned(reg99))) : ($signed((~|reg99)) ?
              $unsigned((reg103 ^ wire102)) : {$unsigned((8'ha4))})));
    end
  always
    @(posedge clk) begin
      reg105 <= {wire90[(1'h1):(1'h0)]};
      if ($unsigned($signed((($signed(reg101) ?
          (wire90 ? reg101 : wire90) : (+reg91)) ^ reg97[(2'h3):(2'h3)]))))
        begin
          if ((|wire87[(4'h8):(3'h6)]))
            begin
              reg106 <= (($signed($unsigned(reg103[(5'h11):(3'h6)])) ?
                  (^~$signed(reg97)) : reg104[(4'hf):(2'h2)]) <<< (!$unsigned(wire88)));
              reg107 <= $unsigned($signed(reg101));
              reg108 <= reg92[(1'h0):(1'h0)];
            end
          else
            begin
              reg106 <= $signed(($signed((((8'had) && (8'h9e)) ~^ (reg101 ?
                  wire87 : reg105))) == (((8'hac) ?
                  $signed(reg108) : $signed(reg95)) - ({(8'ha8),
                  reg106} | (~|reg104)))));
              reg107 <= wire102;
              reg108 <= ($signed(reg96[(2'h2):(1'h0)]) ?
                  reg101 : ($signed((~(reg99 != reg91))) ? reg92 : (8'hba)));
            end
          if (reg91[(3'h7):(3'h5)])
            begin
              reg109 <= ($signed($unsigned(($signed(reg104) ?
                  $unsigned(wire89) : $signed(reg108)))) << wire102[(2'h2):(2'h2)]);
              reg110 <= $unsigned($unsigned(reg91));
            end
          else
            begin
              reg109 <= reg97;
            end
          reg111 <= $signed(reg103[(3'h4):(1'h1)]);
          reg112 <= $signed(wire87[(4'hb):(1'h0)]);
        end
      else
        begin
          reg106 <= ($unsigned((($signed(reg100) && {wire88, reg103}) ?
                  wire87[(3'h4):(1'h0)] : ($signed(reg108) && ((8'hbb) ^~ (8'ha6))))) ?
              ((reg94 - $unsigned(reg94[(3'h4):(3'h4)])) & (reg108 << (reg107[(4'ha):(4'h9)] ?
                  reg108[(4'hc):(2'h2)] : (wire87 ?
                      reg109 : reg111)))) : $unsigned($signed($unsigned(reg104))));
          reg107 <= reg91;
          if ($signed($unsigned((($unsigned(wire90) * (|reg107)) ?
              {{wire89}, (reg91 <= wire87)} : ($unsigned(reg108) ?
                  reg91[(1'h1):(1'h1)] : {reg106})))))
            begin
              reg108 <= $signed((reg97[(4'h9):(3'h6)] ?
                  (+{(^~reg107),
                      (wire89 ?
                          reg96 : wire90)}) : $unsigned((reg105 >>> {(8'ha5)}))));
              reg109 <= reg101[(1'h0):(1'h0)];
              reg110 <= ($unsigned((8'h9d)) ?
                  reg108 : (-(-((8'h9e) ? (8'hbc) : (~^reg95)))));
              reg111 <= reg92;
              reg112 <= (~^$signed($signed(((reg107 && (8'hb4)) ?
                  $signed(reg107) : (~|(8'hb0))))));
            end
          else
            begin
              reg108 <= (~|wire90[(3'h5):(1'h1)]);
              reg109 <= ($unsigned((reg106[(1'h0):(1'h0)] ?
                      (~|{(8'hbb)}) : {reg109, (8'hbb)})) ?
                  (wire102 < {$unsigned((wire88 ~^ (8'ha3))),
                      reg101}) : reg112);
              reg110 <= {reg110,
                  (wire89 << ((^((8'ha2) ? (8'ha2) : reg108)) ?
                      reg93[(2'h3):(2'h2)] : reg100))};
            end
        end
      reg113 <= $unsigned($unsigned((~|($unsigned(reg95) ?
          $unsigned(reg110) : ((8'hab) ? reg109 : (8'h9c))))));
    end
  assign wire114 = reg101;
endmodule

module module34
#(parameter param70 = ((((((8'ha5) + (7'h42)) ? {(8'ha9)} : {(8'hbd), (8'ha4)}) ^ (((7'h41) | (8'hbc)) << {(8'hb9)})) ? ((-{(8'hbb), (8'ha9)}) ? {((8'haf) & (8'hb6)), ((8'hbd) ^ (8'ha5))} : (~|((7'h40) ? (8'ha1) : (8'hb4)))) : (^(~((7'h41) ? (8'hb5) : (8'hb5))))) ? (^((((8'ha4) == (8'haa)) ? {(8'hb4)} : (^(7'h43))) ^~ {{(8'h9f), (8'ha4)}})) : ((8'ha1) ? ({(!(7'h41)), (&(8'ha2))} ~^ {(&(8'hb2))}) : ((~^(^(8'hbf))) == (((8'hb2) << (8'haf)) || ((8'ha2) ~^ (8'hb2)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire69,
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
                 wire49,
                 wire42,
                 wire41,
                 reg68,
                 reg67,
                 reg66,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= wire37;
    end
  assign wire41 = $signed(reg40);
  assign wire42 = wire37;
  always
    @(posedge clk) begin
      if ((~|reg40))
        begin
          reg43 <= $unsigned($unsigned((8'hb5)));
          reg44 <= {(wire37 ~^ (wire41 ?
                  $unsigned($unsigned(wire38)) : (~&$unsigned(wire42))))};
          reg45 <= $unsigned({(~wire36[(1'h0):(1'h0)])});
          if (reg45[(1'h0):(1'h0)])
            begin
              reg46 <= reg43;
              reg47 <= (^(wire35[(2'h3):(2'h3)] ?
                  reg40[(3'h7):(3'h6)] : wire37[(2'h3):(1'h0)]));
            end
          else
            begin
              reg46 <= (wire42[(2'h2):(1'h1)] ?
                  {$signed((8'ha9)),
                      $unsigned(((^~wire41) ?
                          $signed(reg44) : (^~reg46)))} : (wire41 < $unsigned(((wire42 + reg43) < reg44))));
              reg47 <= (+$signed({(-(~wire38)),
                  $unsigned(reg44[(1'h1):(1'h0)])}));
            end
        end
      else
        begin
          reg43 <= reg40;
          reg44 <= (!{($unsigned($unsigned(reg45)) ?
                  (8'hb1) : (((8'haa) >= reg43) & $unsigned((8'ha1)))),
              wire42});
        end
      reg48 <= $unsigned(($unsigned((^(+wire39))) >> $unsigned(($unsigned((8'hb7)) + (reg47 ?
          wire41 : wire42)))));
    end
  assign wire49 = (|$unsigned($unsigned($unsigned($unsigned(wire39)))));
  assign wire50 = (wire36[(1'h0):(1'h0)] ?
                      $unsigned($unsigned($unsigned({reg48}))) : (&$signed(((wire38 ?
                          reg48 : reg47) && wire49[(3'h5):(3'h4)]))));
  assign wire51 = (wire35 ?
                      $signed(((reg44 + (reg43 >>> wire39)) - wire38[(5'h13):(3'h5)])) : $unsigned(reg40));
  assign wire52 = reg47;
  assign wire53 = $unsigned((($signed((reg40 ? reg43 : (8'h9c))) ^~ ((|reg43) ?
                          (8'ha0) : (wire35 ? wire41 : reg48))) ?
                      (&{$signed(wire52)}) : {($signed(reg40) ?
                              reg47 : wire38)}));
  assign wire54 = (+reg40[(4'hc):(4'h9)]);
  assign wire55 = wire50;
  assign wire56 = reg47;
  assign wire57 = (reg48 >> ((^~(!reg47)) == $signed($unsigned((wire54 >> reg45)))));
  assign wire58 = (~^wire54[(3'h4):(3'h4)]);
  assign wire59 = (wire51 ^~ {($signed(wire57[(5'h10):(4'he)]) ^ reg45[(3'h4):(2'h2)]),
                      reg40[(3'h6):(3'h4)]});
  assign wire60 = $signed(($signed(($signed(wire42) < {wire58})) ?
                      $signed($unsigned((wire55 > reg44))) : ((^~wire39[(1'h0):(1'h0)]) ?
                          (7'h43) : $signed(reg43))));
  assign wire61 = ((wire38[(1'h0):(1'h0)] | wire53[(3'h4):(3'h4)]) & wire59);
  assign wire62 = $signed(wire35[(3'h6):(3'h4)]);
  assign wire63 = $signed($unsigned(reg46));
  assign wire64 = $signed(wire63[(2'h2):(2'h2)]);
  assign wire65 = $unsigned(($signed({reg45[(1'h0):(1'h0)],
                      $signed(wire58)}) >> (~^wire56[(4'hd):(4'hc)])));
  always
    @(posedge clk) begin
      reg66 <= wire63;
      reg67 <= wire62;
      reg68 <= (~({wire42} ?
          {({reg48} ? reg43 : $signed(wire36)),
              (!{(7'h40), wire51})} : ($signed(reg66) ?
              ($unsigned(reg67) ?
                  $unsigned(wire49) : wire39[(1'h1):(1'h1)]) : $unsigned(reg67))));
    end
  assign wire69 = wire50[(4'hc):(1'h1)];
endmodule
