module top
#(parameter param143 = {(~^((((8'hae) >> (8'haa)) ? {(8'h9e)} : ((7'h42) - (8'h9f))) < {((7'h41) <= (8'hb2)), ((8'hb0) ? (8'haa) : (7'h43))}))}, 
parameter param144 = param143)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire9;
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire142,
                 wire140,
                 wire21,
                 wire9,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (&{$unsigned($signed(((8'hae) ? wire4 : wire3))),
          ($unsigned(wire4) ?
              ((wire0 > wire0) >>> ((8'ha1) >>> (8'ha9))) : (~|$unsigned(wire3)))});
      reg6 <= $signed($unsigned({$signed($signed(wire1))}));
      reg7 <= {$signed($unsigned($unsigned($signed((8'hb4))))),
          {(+$signed((wire2 ? wire0 : wire4)))}};
      reg8 <= ($unsigned((^~(((8'hb7) << reg7) - $signed(wire2)))) != ((((wire0 | reg6) ?
              $signed(wire3) : (wire3 == (8'hbe))) < wire3[(3'h6):(3'h4)]) ?
          (~^reg7[(3'h5):(2'h2)]) : (~|wire0)));
    end
  assign wire9 = ((~|$signed($unsigned({wire2}))) ?
                     (-($signed((wire1 - wire1)) - (reg8 ^~ wire0[(4'he):(4'h8)]))) : (-(reg7[(4'hc):(2'h3)] ?
                         (^(reg5 ^ wire3)) : $unsigned((reg6 == (8'ha6))))));
  always
    @(posedge clk) begin
      reg10 <= ({((wire0[(3'h5):(3'h4)] & wire2) ~^ (!wire3[(4'ha):(2'h3)]))} && $signed({$signed((-wire0)),
          ((reg6 ? wire1 : wire3) | wire4[(4'hb):(4'h9)])}));
      if (($unsigned(wire1) && ($unsigned(wire0[(4'h8):(3'h7)]) ?
          ($unsigned((&wire3)) < reg10[(3'h4):(1'h1)]) : (^$signed((~|wire4))))))
        begin
          reg11 <= (~|wire1[(1'h0):(1'h0)]);
          reg12 <= $signed(reg5[(4'ha):(3'h4)]);
          reg13 <= (reg7[(3'h6):(3'h4)] <= (&reg8));
          reg14 <= $unsigned($unsigned(wire1));
          if (wire1[(1'h0):(1'h0)])
            begin
              reg15 <= (wire0[(4'hc):(3'h6)] ?
                  (~|$unsigned(wire4)) : (({$unsigned(wire0),
                              $unsigned(wire1)} ?
                          $signed({reg11}) : reg14) ?
                      (reg13 ?
                          (reg13 <= (+(8'ha4))) : reg5[(3'h6):(3'h6)]) : (|(^~wire0[(4'hd):(4'ha)]))));
              reg16 <= wire1[(1'h1):(1'h0)];
              reg17 <= $signed(reg5);
              reg18 <= $unsigned($signed({wire2[(2'h3):(1'h1)], wire3}));
              reg19 <= ($signed($signed(((-reg8) ?
                  reg11[(3'h5):(1'h1)] : (~&reg8)))) != (($signed((7'h42)) <= $signed((reg14 ?
                  wire9 : wire1))) + $signed({$unsigned(wire1), {reg15}})));
            end
          else
            begin
              reg15 <= $unsigned($unsigned($signed((reg8[(2'h2):(1'h0)] ?
                  (reg8 == (8'h9f)) : (^~reg15)))));
              reg16 <= $unsigned(((+((wire1 <= reg7) + (&reg14))) << {(!(|reg5)),
                  ($signed(reg5) >= reg12)}));
              reg17 <= ((~(7'h44)) <<< ((({wire1} && ((8'haa) < wire1)) < reg17) & ((~&$unsigned(wire0)) ?
                  $signed((reg7 ? reg6 : (7'h42))) : {{reg14, (8'ha1)},
                      ((8'h9d) ? wire2 : reg10)})));
            end
        end
      else
        begin
          reg11 <= wire2;
          if ($unsigned($unsigned($unsigned((wire0 ?
              $unsigned(wire0) : reg15)))))
            begin
              reg12 <= (~$unsigned($unsigned(($unsigned(wire3) && (+(8'hb3))))));
              reg13 <= $signed(reg18[(3'h6):(3'h6)]);
              reg14 <= ({({{reg18}} != ($signed(wire3) > wire1))} - reg6);
              reg15 <= $unsigned(wire9[(2'h3):(2'h3)]);
            end
          else
            begin
              reg12 <= {($signed(reg6) > $signed((~&reg17))), (8'ha1)};
              reg13 <= ($signed((reg5[(3'h6):(2'h2)] || {(reg11 != wire0),
                      (reg5 ? wire0 : wire4)})) ?
                  (~&$signed(reg17[(3'h4):(2'h2)])) : wire1);
              reg14 <= $unsigned(wire2[(3'h5):(1'h1)]);
            end
          reg16 <= ($signed(reg7[(1'h1):(1'h1)]) << reg7);
        end
      reg20 <= ((reg12 && ((8'h9d) >= ((&reg18) ?
              {reg18} : reg15[(2'h2):(2'h2)]))) ?
          {($signed($unsigned(reg15)) & ($unsigned(reg5) + (!reg13)))} : (reg6 ^~ ((reg15 ?
                  $unsigned(wire1) : (wire4 >> wire0)) ?
              $unsigned(((8'h9e) >>> wire4)) : reg7)));
    end
  assign wire21 = reg7[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg22 <= $unsigned(reg20);
      reg23 <= reg14[(3'h7):(3'h5)];
      reg24 <= {$signed($unsigned((!(reg12 ? reg20 : (8'ha0)))))};
      reg25 <= {$signed({$unsigned($unsigned(reg16))})};
      reg26 <= (~reg23);
    end
  module27 #() modinst141 (wire140, clk, reg25, wire9, wire1, reg14, reg15);
  assign wire142 = $unsigned({{wire9, reg26[(2'h3):(2'h2)]},
                       $unsigned((~&((8'hbe) ? reg25 : reg17)))});
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire33;
  assign y = {wire139, wire138, wire136, wire51, wire49, wire33, (1'h0)};
  assign wire33 = $signed($unsigned(wire32));
  module34 #() modinst50 (.wire37(wire32), .wire36(wire29), .wire35(wire28), .wire38(wire33), .clk(clk), .y(wire49));
  assign wire51 = $unsigned((!({{wire32, wire32}} ?
                      wire28[(4'he):(3'h6)] : $unsigned(wire29[(3'h6):(2'h2)]))));
  module52 #() modinst137 (.y(wire136), .wire54(wire32), .clk(clk), .wire55(wire33), .wire56(wire51), .wire53(wire29));
  assign wire138 = wire30[(1'h0):(1'h0)];
  assign wire139 = (+($signed(($unsigned(wire29) == $unsigned((8'had)))) ?
                       $unsigned($unsigned(wire30)) : (wire30[(4'hb):(2'h3)] ?
                           ($unsigned(wire28) ?
                               wire138[(2'h3):(2'h3)] : wire30[(3'h6):(1'h1)]) : (wire33 ?
                               $signed(wire33) : $unsigned(wire28)))));
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h346):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire56;
  input wire [(3'h5):(1'h0)] wire55;
  input wire [(3'h6):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire135;
  wire [(3'h4):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  assign y = {wire135,
                 wire133,
                 wire132,
                 wire131,
                 wire120,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire58,
                 wire57,
                 reg134,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire57 = {(&{($signed(wire54) ?
                              wire53[(4'hb):(4'ha)] : (wire55 & wire54)),
                          $unsigned(wire56[(4'hc):(4'h8)])})};
  assign wire58 = (+{((^(!wire57)) ?
                          (wire54 ^~ wire55[(2'h3):(1'h0)]) : wire55[(3'h5):(1'h0)]),
                      wire56[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      if ($unsigned(wire57))
        begin
          if ((~&(!$signed({$unsigned(wire53)}))))
            begin
              reg59 <= ($unsigned({wire57[(5'h11):(3'h4)]}) ?
                  $signed({(wire57 ?
                          (|wire57) : $unsigned(wire56))}) : $unsigned((((wire57 ^ wire58) || $unsigned((8'haa))) <= $unsigned($unsigned(wire55)))));
              reg60 <= ($signed(($signed((wire53 | wire56)) ?
                      $unsigned(wire57[(5'h12):(4'h9)]) : ({(8'ha4),
                          wire56} == ((8'ha7) <= wire53)))) ?
                  ($unsigned(((^~wire55) ?
                      (wire54 ?
                          wire58 : wire57) : wire54)) <<< (~|{wire57})) : {wire58,
                      reg59});
              reg61 <= $unsigned(((~|$signed((reg60 ?
                  wire55 : wire53))) | $unsigned($unsigned(reg59[(3'h6):(3'h4)]))));
              reg62 <= (~wire57);
              reg63 <= (|reg61);
            end
          else
            begin
              reg59 <= $unsigned($unsigned(wire57));
              reg60 <= ((8'hb9) ?
                  wire55 : {{reg59[(1'h0):(1'h0)]}, $signed(wire54)});
              reg61 <= {wire54};
            end
          if ({wire58[(1'h0):(1'h0)]})
            begin
              reg64 <= ((~(!(|(reg61 ? reg63 : wire58)))) ?
                  (~$unsigned($signed((wire53 ?
                      reg59 : reg63)))) : (-($unsigned((8'h9f)) ?
                      ((wire55 & (8'hba)) ?
                          wire56 : (~^reg63)) : ((^~reg63) << $signed(wire58)))));
              reg65 <= reg63[(1'h1):(1'h1)];
              reg66 <= (&{(~^reg64)});
              reg67 <= (reg64[(1'h1):(1'h1)] << wire54);
              reg68 <= wire54[(3'h4):(1'h0)];
            end
          else
            begin
              reg64 <= $unsigned(($unsigned($unsigned(reg61)) ?
                  (((~^wire56) ^~ $unsigned(wire54)) < ((reg60 > wire57) || ((8'hbe) >= wire54))) : reg62[(4'hc):(2'h2)]));
              reg65 <= $unsigned((&$signed((|(wire53 ? reg65 : wire58)))));
            end
          reg69 <= $signed(wire56[(4'hb):(3'h6)]);
        end
      else
        begin
          reg59 <= $unsigned($signed((~|$unsigned((wire54 ? reg69 : reg69)))));
        end
      reg70 <= ((7'h41) ?
          (~$unsigned(wire53)) : $unsigned((^reg65[(3'h4):(2'h3)])));
      if (($unsigned((^$unsigned({reg70}))) ?
          wire55 : ((&$unsigned((reg65 ?
              reg69 : reg67))) - ({(reg59 <<< (8'hab)), (&wire55)} ?
              $signed((wire56 ? reg64 : wire53)) : $signed({wire58, reg62})))))
        begin
          reg71 <= reg66[(3'h6):(1'h0)];
          reg72 <= wire58;
          reg73 <= (reg63 + reg65);
        end
      else
        begin
          if (reg63)
            begin
              reg71 <= (~$signed($unsigned($signed(reg71[(1'h0):(1'h0)]))));
              reg72 <= reg59;
              reg73 <= (($signed($unsigned({reg72})) ?
                  $signed(reg63) : (reg59 ~^ (((8'hab) >>> reg61) + (reg68 ?
                      wire53 : reg68)))) == $signed({(~^{(8'ha3), wire53})}));
            end
          else
            begin
              reg71 <= (-((8'h9e) >>> $unsigned($signed(wire53))));
              reg72 <= (8'hb5);
            end
          if (wire54)
            begin
              reg74 <= (+($unsigned(((reg66 | reg71) ?
                      $unsigned(reg64) : (wire57 ? wire58 : reg67))) ?
                  $unsigned($signed(wire53)) : reg63));
              reg75 <= (($unsigned((&$signed((8'ha8)))) ^ (reg70 == (!reg66))) + (($signed(reg68[(1'h0):(1'h0)]) ?
                  ((wire57 ? (8'haa) : (8'hb0)) >= {reg61,
                      reg69}) : {$signed(reg68),
                      reg66}) < ($unsigned(reg62[(2'h3):(1'h1)]) << (+(reg60 >= (8'haf))))));
              reg76 <= $unsigned(({((~reg71) ? (reg69 >> (8'hbf)) : (8'ha2))} ?
                  $unsigned($unsigned((reg62 >= reg68))) : reg74[(4'hf):(4'hb)]));
              reg77 <= ({$unsigned((~^(reg72 ? reg74 : reg68))),
                  reg64[(2'h3):(1'h0)]} ^~ wire57[(1'h1):(1'h0)]);
              reg78 <= reg65;
            end
          else
            begin
              reg74 <= reg66;
            end
          if ({((~^$signed((!wire55))) << (!(+reg73)))})
            begin
              reg79 <= $signed($unsigned(((8'hb7) >>> $unsigned($signed(wire55)))));
              reg80 <= {(wire56 <<< reg64[(2'h2):(1'h0)])};
            end
          else
            begin
              reg79 <= wire53;
              reg80 <= $unsigned($signed($unsigned((^~$signed(reg66)))));
            end
          if ((!wire56[(4'he):(3'h6)]))
            begin
              reg81 <= $unsigned($unsigned(wire54[(2'h2):(1'h1)]));
              reg82 <= (8'ha6);
            end
          else
            begin
              reg81 <= wire56;
            end
        end
      reg83 <= ((-$signed({(!reg73)})) ? (~|$unsigned(reg74)) : reg63);
      reg84 <= (~&reg76[(4'hd):(4'hd)]);
    end
  assign wire85 = {reg78[(2'h3):(2'h2)]};
  assign wire86 = ((~^wire57) ?
                      (^~$signed((reg64 ?
                          $unsigned(reg82) : {reg78, reg71}))) : (7'h44));
  assign wire87 = ($signed($signed(reg67)) ?
                      (reg60[(1'h1):(1'h0)] ~^ (~(reg65 ?
                          (reg81 ?
                              reg84 : (8'hb3)) : $signed(reg72)))) : (reg82[(3'h6):(1'h0)] ?
                          $unsigned($signed((wire56 ?
                              reg65 : reg76))) : ($unsigned((wire57 ?
                                  reg72 : wire55)) ?
                              $signed($unsigned(reg76)) : ($signed(reg62) & reg81[(3'h7):(3'h4)]))));
  assign wire88 = (^~($signed($signed($signed((8'hb7)))) >= reg63));
  assign wire89 = reg80;
  assign wire90 = wire89[(3'h6):(3'h4)];
  assign wire91 = $signed($signed(wire56));
  assign wire92 = $unsigned((&((~^$unsigned((8'hb6))) ?
                      {(~reg68),
                          (reg68 ?
                              reg74 : reg82)} : $unsigned((wire54 & reg66)))));
  assign wire93 = {(~&$unsigned($unsigned(wire87[(3'h4):(2'h2)]))),
                      {(^~((reg64 + reg60) ? (8'h9c) : $signed(reg79))),
                          reg77}};
  assign wire94 = reg74;
  assign wire95 = reg81[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= $unsigned($signed(reg64[(1'h1):(1'h0)]));
      reg97 <= $signed(reg60);
      if (reg97[(4'ha):(3'h5)])
        begin
          if ((~^reg79))
            begin
              reg98 <= reg65;
              reg99 <= $signed(((((-(8'hb9)) ?
                      (reg67 ?
                          reg78 : reg63) : reg72[(3'h7):(2'h3)]) ~^ $signed({(8'hbf),
                      wire91})) ?
                  reg98 : $signed($unsigned((wire91 ? wire88 : reg81)))));
              reg100 <= (~&$unsigned({reg69[(3'h5):(3'h5)]}));
              reg101 <= reg79;
            end
          else
            begin
              reg98 <= $unsigned(wire87[(3'h4):(2'h3)]);
            end
          if ($signed(wire55[(3'h5):(2'h3)]))
            begin
              reg102 <= (^~$signed($signed((^(reg99 ? wire94 : (8'hb9))))));
              reg103 <= $unsigned({$signed(reg62)});
              reg104 <= wire91[(4'hb):(4'h9)];
            end
          else
            begin
              reg102 <= {($unsigned(wire53) - reg65),
                  {($signed(reg79) * ($signed(reg62) - (reg64 ?
                          reg62 : (8'hb6))))}};
              reg103 <= {reg79[(4'hb):(4'ha)]};
              reg104 <= (((((wire95 || reg61) <= (reg82 ?
                      (8'hbe) : reg73)) >= (+{(8'h9e), reg99})) ?
                  reg73[(1'h1):(1'h1)] : (~{$unsigned(wire55),
                      (reg77 <<< reg68)})) * wire87);
            end
          reg105 <= {wire58[(5'h10):(3'h4)]};
          reg106 <= reg62;
          if (((+$unsigned((~&$signed(wire88)))) ?
              (reg102 || $signed(reg81)) : $unsigned((($signed(wire58) ?
                      reg75[(1'h1):(1'h0)] : {reg60, (8'hbf)}) ?
                  {reg61[(4'he):(4'hd)], (~|wire57)} : reg66[(4'h8):(4'h8)]))))
            begin
              reg107 <= (~&$signed((-($unsigned(reg63) ?
                  reg59[(1'h1):(1'h0)] : (&wire58)))));
              reg108 <= wire53;
              reg109 <= (~(~^(($signed((8'ha8)) < wire92) ?
                  reg107[(4'hb):(2'h2)] : ($signed((8'hab)) * {reg62,
                      reg61}))));
            end
          else
            begin
              reg107 <= wire93[(3'h4):(3'h4)];
              reg108 <= (~^$signed(($unsigned((reg61 ? reg80 : (8'h9e))) ?
                  {(~&(7'h43)),
                      (reg81 ?
                          reg73 : (8'hbb))} : ((reg68 & reg100) - ((8'ha7) ?
                      reg107 : (8'ha0))))));
              reg109 <= ($signed({reg80[(1'h1):(1'h0)],
                  (!reg60[(1'h1):(1'h0)])}) || ((^~(~^(~wire90))) >>> (8'hbc)));
            end
        end
      else
        begin
          reg98 <= reg83;
          reg99 <= $signed((reg78 >>> (8'ha3)));
        end
      reg110 <= reg107[(4'hc):(3'h5)];
      if ((-(8'h9f)))
        begin
          if ($unsigned({reg106[(3'h7):(2'h2)],
              $unsigned($signed($signed(reg75)))}))
            begin
              reg111 <= reg99[(2'h3):(1'h0)];
            end
          else
            begin
              reg111 <= wire92[(1'h0):(1'h0)];
              reg112 <= ((8'had) > reg64);
              reg113 <= $signed($unsigned((reg66[(3'h5):(3'h4)] ?
                  $signed(reg77) : reg64[(2'h2):(1'h1)])));
            end
          if ((^~reg110))
            begin
              reg114 <= $unsigned(reg102);
              reg115 <= {((^reg79[(3'h4):(2'h2)]) ?
                      $unsigned((8'hba)) : ($unsigned($unsigned(wire95)) ^ $signed((~^reg74)))),
                  $signed($unsigned($signed((reg63 >> reg114))))};
              reg116 <= (~&$signed({$signed((reg114 ? wire92 : (7'h44)))}));
            end
          else
            begin
              reg114 <= wire91;
            end
          reg117 <= (($signed(($signed(wire57) || {wire85, reg113})) ?
              reg74 : (!(~{reg72}))) <<< ((8'hb0) ^ ({reg66[(3'h6):(2'h2)],
                  (reg73 ? reg97 : reg79)} ?
              reg99 : reg106)));
          reg118 <= (({($signed(reg103) >> wire56[(2'h3):(1'h1)])} * $signed({(reg72 ~^ (7'h40)),
                  $unsigned(reg112)})) ?
              $unsigned($signed($signed(wire54))) : $signed({(~|(reg59 - reg107))}));
          reg119 <= ($signed((reg71[(3'h5):(3'h4)] < {$unsigned((7'h42)),
                  (^~reg106)})) ?
              ((&$unsigned((reg80 ?
                  reg79 : (8'ha7)))) << $signed(reg118)) : (!(wire54[(3'h4):(1'h1)] ?
                  $unsigned(wire90[(3'h4):(2'h2)]) : ((reg82 ?
                      reg96 : wire54) ^ $signed(reg78)))));
        end
      else
        begin
          reg111 <= $unsigned($unsigned(reg62[(5'h10):(3'h4)]));
          reg112 <= reg107[(4'hb):(4'ha)];
        end
    end
  assign wire120 = {$unsigned(reg66)};
  always
    @(posedge clk) begin
      reg121 <= reg96[(4'h8):(3'h5)];
      reg122 <= $unsigned({(reg78[(1'h0):(1'h0)] <<< reg76)});
    end
  always
    @(posedge clk) begin
      reg123 <= $signed(wire58);
      if (wire53)
        begin
          reg124 <= ((&(($unsigned(reg107) ?
                  reg77 : (wire87 + (8'hb5))) == $signed(reg102))) ?
              ((!(~{reg61,
                  reg119})) | wire55[(1'h0):(1'h0)]) : (reg69[(3'h4):(2'h3)] ?
                  ($signed($signed(reg115)) ?
                      $unsigned((~&reg118)) : wire93) : (+reg74)));
          reg125 <= (!reg111);
          reg126 <= ((((&wire85) ?
                  $signed(reg123[(2'h3):(1'h1)]) : (~|(reg69 ?
                      reg106 : (7'h41)))) ?
              {reg61[(1'h0):(1'h0)]} : $unsigned((&$unsigned(reg122)))) & $unsigned($unsigned((8'ha7))));
          reg127 <= $unsigned($signed($unsigned($unsigned(reg74))));
        end
      else
        begin
          reg124 <= (&((!$unsigned(reg80)) || reg123[(5'h10):(2'h2)]));
          reg125 <= {(reg116 ?
                  ({reg116} ?
                      {reg116[(1'h1):(1'h0)],
                          (reg78 ? (7'h41) : (8'hb6))} : (reg68 ?
                          (reg71 ?
                              reg117 : (8'had)) : $unsigned(reg104))) : $signed($unsigned((wire93 ?
                      reg107 : wire93))))};
          reg126 <= (~|{wire90[(1'h0):(1'h0)],
              (wire120[(5'h14):(4'he)] ?
                  {{(8'hb4), wire93},
                      (reg101 << reg102)} : $unsigned(reg74[(5'h12):(3'h4)]))});
          reg127 <= $unsigned((+($signed(reg60) ?
              ($unsigned(reg76) ?
                  $unsigned(reg119) : $signed((8'ha4))) : (+$unsigned(wire85)))));
          reg128 <= (^reg80[(2'h2):(2'h2)]);
        end
      reg129 <= ($signed(reg75[(1'h0):(1'h0)]) <<< ((8'hb9) <= ({(~^(8'hb1))} > (^~$signed(reg83)))));
      reg130 <= (7'h40);
    end
  assign wire131 = $signed((^~{((wire87 >>> wire94) ?
                           (reg102 ~^ wire92) : (~&(7'h42)))}));
  assign wire132 = ((reg124[(3'h4):(2'h2)] * $unsigned(reg80)) & (-(reg130[(2'h2):(1'h0)] >> $unsigned((reg109 ?
                       reg98 : (7'h40))))));
  assign wire133 = reg114[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      reg134 <= $unsigned(wire87[(1'h0):(1'h0)]);
    end
  assign wire135 = ($signed($signed(($signed(reg83) ?
                           (8'hb9) : $unsigned((8'ha5))))) ?
                       reg76[(1'h1):(1'h0)] : $unsigned((8'hbd)));
endmodule

module module34
#(parameter param48 = ((~(({(8'hb5)} ? (+(8'ha0)) : (!(8'hb1))) ? (~&(~^(8'haf))) : ((|(8'h9f)) ? ((8'had) ? (8'hb1) : (8'hb2)) : {(8'ha2)}))) ^ (!(~|(8'had)))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire38;
  input wire signed [(4'ha):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 (1'h0)};
  assign wire39 = $signed($signed(wire37[(2'h2):(1'h0)]));
  assign wire40 = {$signed($unsigned($signed(((8'ha0) ? (7'h41) : wire38)))),
                      wire35[(2'h2):(1'h1)]};
  assign wire41 = {(wire36 == (wire40 ^ {wire35[(4'h8):(3'h6)], wire40}))};
  assign wire42 = wire36;
  assign wire43 = ((+wire40) ^ (+wire36[(1'h0):(1'h0)]));
  assign wire44 = ($signed((((&wire43) != (wire37 ? wire42 : wire36)) ?
                      (wire37[(1'h0):(1'h0)] - (wire35 ?
                          wire43 : wire36)) : wire43[(1'h0):(1'h0)])) >>> $unsigned(((wire35[(4'h9):(2'h3)] ^ $signed(wire35)) ?
                      {{(8'hb5), (8'hbe)}} : {(wire35 ? wire42 : (8'h9f))})));
  assign wire45 = wire40[(3'h7):(3'h4)];
  assign wire46 = wire39[(5'h10):(2'h2)];
  assign wire47 = wire35[(3'h6):(2'h3)];
endmodule
