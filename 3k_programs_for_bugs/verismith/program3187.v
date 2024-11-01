module top
#(parameter param128 = ((((((8'hb0) ? (8'ha0) : (8'ha0)) ? (8'ha1) : ((7'h43) ? (7'h41) : (8'h9d))) ? (~|((8'hb4) ? (8'ha1) : (8'h9c))) : {{(8'hbe)}, (+(8'h9f))}) != {((~|(8'ha6)) & ((7'h42) ? (8'hb2) : (8'hbe))), (((8'h9d) >= (7'h42)) ~^ (~|(8'ha0)))}) ? (((~&(8'ha6)) ? ((^(8'hb9)) ? ((7'h42) ? (8'h9f) : (7'h44)) : ((8'ha3) ? (8'hbb) : (8'had))) : (((8'hb7) ? (7'h40) : (7'h40)) * ((8'hb4) ? (7'h43) : (8'ha8)))) & ({{(8'ha2), (8'hb8)}, ((8'ha5) ? (8'hab) : (8'ha5))} << {((8'hba) ? (8'ha7) : (8'hae)), ((8'h9e) + (8'ha7))})) : (((-((8'hb2) >>> (8'hb7))) ? ((&(7'h44)) >= {(7'h44)}) : (~((8'hb5) & (8'hac)))) ? (((8'haf) | ((8'haa) ^ (7'h43))) ? (+{(8'ha3)}) : (((7'h42) || (8'ha6)) ~^ ((8'hbc) ? (8'hbd) : (8'hae)))) : ((((8'hac) ? (8'hb6) : (8'hb2)) ? {(8'hb0), (8'hac)} : ((8'hb3) ? (7'h44) : (8'h9f))) != ((8'hbb) >>> (^(8'had)))))), 
parameter param129 = (~|{(({param128} ^ (!param128)) + ({param128, param128} ? {(8'ha9), param128} : {param128})), ((param128 ~^ param128) != ((-(8'h9d)) || (-param128)))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire86;
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire100,
                 wire4,
                 wire86,
                 reg122,
                 reg121,
                 reg120,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire4 = $signed((8'ha9));
  module5 #() modinst87 (wire86, clk, wire2, wire3, wire0, wire1, wire4);
  always
    @(posedge clk) begin
      reg88 <= (wire1 && ($signed(wire86) >= wire86[(1'h1):(1'h1)]));
      if ($signed(wire4))
        begin
          reg89 <= $unsigned(reg88[(1'h0):(1'h0)]);
          reg90 <= {$unsigned(reg88)};
          reg91 <= wire86[(3'h6):(3'h4)];
        end
      else
        begin
          if ($signed((wire86 ^ (wire2 ^~ {{reg89}}))))
            begin
              reg89 <= (&($signed(((wire0 || reg88) > reg91[(3'h6):(3'h6)])) <<< wire1[(4'hd):(3'h5)]));
              reg90 <= $signed(reg91[(4'h9):(1'h0)]);
              reg91 <= {$signed(wire3), wire3};
              reg92 <= ($signed(($signed((wire0 * wire86)) ?
                      $unsigned((+reg89)) : wire1[(3'h6):(3'h5)])) ?
                  wire86[(3'h6):(3'h5)] : (~((~^wire4) ?
                      wire3[(1'h1):(1'h1)] : ((wire86 ? wire1 : reg90) ?
                          (~|(8'h9f)) : (wire0 > wire4)))));
            end
          else
            begin
              reg89 <= ($unsigned(reg91) ? wire3[(4'h9):(1'h1)] : reg92);
              reg90 <= reg89[(2'h3):(2'h3)];
              reg91 <= $signed($signed((reg92[(2'h2):(1'h0)] ~^ reg90)));
            end
          reg93 <= $unsigned($unsigned({($signed(reg91) || {reg90, wire3}),
              reg89[(1'h1):(1'h0)]}));
          reg94 <= wire86[(3'h4):(1'h1)];
          reg95 <= (reg91 > ((reg91 ~^ ((~|wire0) <<< $signed(reg92))) <= wire4));
          reg96 <= (((~|(-(wire1 ? reg90 : reg92))) ?
                  wire86[(3'h6):(1'h1)] : (~|(!(wire0 ? reg89 : wire1)))) ?
              $signed((reg90 ?
                  {$unsigned(wire2)} : (reg89 <= reg90[(1'h1):(1'h1)]))) : (reg88 | {wire4,
                  ($signed(reg92) ? $signed(wire1) : $signed(wire2))}));
        end
      reg97 <= $unsigned(wire1);
      reg98 <= (((!{$signed(reg97)}) >>> {(&wire2),
          $unsigned($signed(reg96))}) < ($unsigned(wire0[(3'h7):(1'h0)]) <<< $signed(reg95[(4'hc):(2'h2)])));
      reg99 <= $unsigned(reg96);
    end
  assign wire100 = ({wire0[(4'h8):(3'h4)]} ?
                       $signed({wire4[(2'h2):(1'h1)]}) : ((~|$signed((reg95 ?
                               reg92 : reg91))) ?
                           wire1[(1'h0):(1'h0)] : $signed($unsigned(((8'h9e) ?
                               reg94 : wire2)))));
  always
    @(posedge clk) begin
      reg101 <= ({(8'hbe)} ^ $unsigned((~wire86[(2'h2):(1'h1)])));
      reg102 <= reg94;
      reg103 <= ((-((+(wire4 ? reg92 : reg97)) ?
          ({(8'hb1)} >= (reg88 + wire86)) : (^$unsigned((8'hbc))))) == $unsigned(($signed(reg98[(3'h4):(2'h3)]) != ((+wire100) >= reg95))));
      if (reg96)
        begin
          reg104 <= (~reg98);
          if ((~^(wire1 ? reg95 : wire100)))
            begin
              reg105 <= reg96;
              reg106 <= (!(($signed((~(7'h44))) ?
                      {reg93} : reg91[(2'h3):(1'h0)]) ?
                  {($unsigned((8'hbb)) * $unsigned(reg94)),
                      $signed($unsigned(reg88))} : {{$signed(reg88)},
                      $unsigned({wire4})}));
              reg107 <= (~((&$signed((reg105 < reg103))) ?
                  $unsigned($unsigned(reg90)) : reg91[(1'h0):(1'h0)]));
              reg108 <= ({($signed((wire3 ? (8'haf) : wire3)) ?
                          $unsigned({wire4, reg89}) : (~|(reg96 ?
                              (8'hae) : (8'ha7)))),
                      (~|(-(~&(8'hb6))))} ?
                  reg103[(4'h9):(4'h8)] : ($unsigned($unsigned((+reg99))) ?
                      {(wire4[(2'h2):(2'h2)] ? $unsigned(wire0) : (8'ha9)),
                          $unsigned(reg101)} : reg92[(1'h0):(1'h0)]));
              reg109 <= (+reg103);
            end
          else
            begin
              reg105 <= {$unsigned($unsigned(wire1[(5'h10):(3'h6)]))};
              reg106 <= $signed(($signed(reg91) ?
                  (!$signed((reg105 ? reg95 : wire3))) : $signed(reg88)));
              reg107 <= $unsigned(reg104);
            end
        end
      else
        begin
          reg104 <= $signed((+(!(reg104[(2'h3):(1'h0)] ?
              $unsigned(reg103) : (~reg95)))));
          reg105 <= (!reg88[(1'h0):(1'h0)]);
          reg106 <= $signed($unsigned((reg107[(3'h7):(2'h2)] ?
              (~(8'hbf)) : {$unsigned((8'hbb))})));
          reg107 <= reg91;
        end
      reg110 <= reg88;
    end
  always
    @(posedge clk) begin
      if (reg96[(3'h4):(1'h0)])
        begin
          reg111 <= (^$unsigned(reg94));
          reg112 <= (^~($unsigned($unsigned(wire86[(1'h1):(1'h1)])) << reg109[(5'h10):(4'he)]));
        end
      else
        begin
          reg111 <= reg89[(4'ha):(4'h9)];
          reg112 <= $signed((8'ha1));
          if ((({$unsigned((^~reg89))} ^~ $signed(({reg108} ?
              (&(8'ha6)) : (-reg97)))) >>> (wire100 >> $unsigned(reg94))))
            begin
              reg113 <= $signed(reg110);
              reg114 <= $signed((-$unsigned((~|$signed(reg99)))));
            end
          else
            begin
              reg113 <= (!(^~({(+reg95), (^reg103)} ?
                  $signed(reg114[(3'h4):(2'h3)]) : (-$signed(reg96)))));
              reg114 <= $unsigned($signed(reg90[(1'h1):(1'h0)]));
            end
          if (((($unsigned((!wire3)) ? reg108 : (!(7'h41))) ?
              {((reg105 ? reg111 : wire1) ?
                      (reg114 ?
                          reg105 : wire2) : $signed(reg105))} : reg98) != wire4))
            begin
              reg115 <= (~|(($signed((&reg112)) >> ((^reg113) <= reg94[(3'h5):(1'h1)])) ?
                  {((reg91 >> (8'hbd)) >> {reg104, reg103}),
                      (reg90 >>> (reg111 ?
                          reg102 : wire4))} : ($signed($signed((8'ha9))) ?
                      {$unsigned(wire4),
                          (wire100 > reg110)} : (reg108[(5'h12):(3'h4)] + (reg110 ?
                          reg89 : reg102)))));
            end
          else
            begin
              reg115 <= $signed(reg107[(2'h3):(2'h3)]);
              reg116 <= reg114;
              reg117 <= $unsigned($unsigned((wire3[(4'hd):(4'hd)] ?
                  reg113 : wire1[(5'h13):(4'hd)])));
              reg118 <= reg99[(4'hb):(3'h4)];
            end
          reg119 <= $signed((wire2[(1'h1):(1'h1)] ?
              $signed((~|(reg108 ^~ reg117))) : {reg108[(5'h14):(5'h14)],
                  (~^((7'h44) ? reg116 : (8'haf)))}));
        end
      reg120 <= $unsigned((((~^$unsigned(reg107)) * $unsigned(reg101[(1'h0):(1'h0)])) * wire3[(3'h5):(2'h3)]));
      reg121 <= ((reg95 <<< ({(reg101 <<< reg120), (+reg106)} ?
              reg119 : reg115)) ?
          reg89[(4'h8):(2'h2)] : (~|(8'hb5)));
      reg122 <= {reg111, reg88};
    end
  assign wire123 = wire1[(5'h13):(3'h7)];
  assign wire124 = reg95[(4'hb):(3'h5)];
  assign wire125 = {reg115[(4'ha):(1'h1)], reg108};
  assign wire126 = (reg90[(1'h0):(1'h0)] <<< $unsigned($unsigned($signed($signed(reg93)))));
  assign wire127 = (~&reg111);
endmodule

module module5
#(parameter param84 = ((&((((8'haf) ? (8'hab) : (8'ha4)) == ((8'ha3) || (8'ha9))) ? (((8'ha8) < (8'hbb)) ? (~(8'ha2)) : (+(7'h43))) : {(8'h9f), ((8'ha7) ? (8'ha5) : (8'ha5))})) ? (((-((8'hb1) ? (8'ha8) : (8'hb2))) ? (((8'h9c) || (8'hba)) ? (|(8'hb1)) : ((8'hb2) ? (8'h9f) : (7'h41))) : ((+(8'ha4)) ? ((7'h43) != (8'hab)) : (~&(8'ha2)))) >= (({(8'hb9), (8'h9d)} + (|(8'ha3))) ? {(~^(8'hb9))} : (((8'ha8) ? (8'had) : (7'h44)) ? ((8'hb7) & (8'h9d)) : ((8'ha7) ? (8'hb2) : (7'h44))))) : (((((7'h44) ? (8'hb4) : (8'had)) ? (&(8'hb2)) : ((8'ha3) && (8'hb7))) != (~|{(7'h44), (8'ha2)})) ? ((((8'hbe) == (8'ha2)) >= (+(8'ha8))) == {{(8'hb3), (8'ha1)}}) : ((((8'hbf) ? (8'h9d) : (8'hb1)) ? ((8'hb5) ? (8'hb6) : (8'hbc)) : (&(8'hb9))) << (((8'ha6) ? (8'had) : (7'h41)) + ((7'h43) | (8'hb3)))))), 
parameter param85 = (param84 ? ((~(~|(+param84))) ? ((~^(param84 >= param84)) ? ((param84 ~^ param84) ? param84 : param84) : (~(!(8'ha1)))) : (~param84)) : ((8'hb3) ? {({param84, param84} ? (param84 - param84) : (param84 >= param84)), {{param84}}} : (param84 + ((param84 ? param84 : param84) || (param84 ? param84 : param84))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h243):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire11;
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire63,
                 wire61,
                 wire35,
                 wire34,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire11,
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
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
  assign wire11 = wire10[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= (wire9 <= (-$signed({$signed(wire11), wire11[(2'h2):(2'h2)]})));
      reg13 <= {{{$unsigned($unsigned(wire9)), wire8}, wire9},
          $signed((^{$signed(reg12), {wire8, wire9}}))};
      if ($signed($unsigned(reg12[(3'h5):(1'h1)])))
        begin
          reg14 <= reg12;
          reg15 <= (~$unsigned($signed(((-wire6) ?
              $signed(wire11) : reg14[(4'h8):(1'h1)]))));
        end
      else
        begin
          reg14 <= {reg15[(2'h3):(2'h2)]};
        end
    end
  assign wire16 = (8'hac);
  assign wire17 = ((|$signed($signed((~|wire9)))) & wire9);
  assign wire18 = reg15[(3'h6):(1'h1)];
  assign wire19 = $unsigned((!$signed({{wire16, reg15},
                      reg14[(3'h7):(1'h0)]})));
  assign wire20 = wire7[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned({reg13,
          ((wire16 ?
              wire19 : (8'hb3)) != $signed(wire9))}) >= (&($signed(wire7[(1'h1):(1'h0)]) ?
          $signed(reg13) : $unsigned((reg12 ? wire9 : wire6))))))
        begin
          reg21 <= (~wire18);
        end
      else
        begin
          reg21 <= (({($signed(wire18) ?
                      (wire11 || (8'hb9)) : ((8'hba) & reg13))} * (reg12 > ((wire19 <= wire16) != ((8'ha5) ^~ wire8)))) ?
              ($signed(wire17) ^~ ((~wire9) <= $signed(((7'h43) <= reg12)))) : wire18[(2'h3):(1'h0)]);
        end
      reg22 <= $unsigned($unsigned(($unsigned(wire19) ?
          wire8 : $signed($signed(reg12)))));
      if (reg21[(3'h6):(1'h0)])
        begin
          reg23 <= ($signed(wire20[(4'h8):(3'h4)]) ?
              ($unsigned(reg21[(2'h2):(1'h0)]) ?
                  ((wire16 ? $signed(wire18) : wire18) & $unsigned(((8'hae) ?
                      wire6 : reg12))) : $unsigned($signed($signed(wire16)))) : $unsigned($unsigned($unsigned((wire18 == wire17)))));
          reg24 <= wire17[(4'hc):(4'hc)];
          reg25 <= (reg14[(2'h3):(1'h0)] ?
              wire11[(4'hb):(1'h1)] : $signed((^~{(~&reg15)})));
          if ((-$signed((reg24 ?
              (+{wire19}) : $unsigned(reg24[(1'h0):(1'h0)])))))
            begin
              reg26 <= $unsigned(((~^$signed((wire19 ?
                  wire8 : wire9))) < wire17[(3'h6):(1'h1)]));
              reg27 <= $unsigned(reg21[(4'hf):(4'h8)]);
              reg28 <= $unsigned($unsigned(($unsigned($signed(reg26)) ?
                  wire9 : $unsigned(((8'ha4) >= wire16)))));
            end
          else
            begin
              reg26 <= (|((~&(8'hb6)) <<< wire7));
              reg27 <= $signed(reg14);
            end
        end
      else
        begin
          if ($signed((8'hb5)))
            begin
              reg23 <= ($signed((8'hb4)) << wire10);
              reg24 <= ((((|(8'hbb)) ?
                          wire8[(4'ha):(4'h8)] : {reg22[(1'h1):(1'h1)]}) ?
                      {(!((8'hbb) || reg22)),
                          $unsigned($signed(reg25))} : reg21) ?
                  $signed((!{(7'h40)})) : wire10[(3'h4):(1'h1)]);
            end
          else
            begin
              reg23 <= wire11;
              reg24 <= ((((|(wire11 != reg12)) ?
                          (-wire16[(4'h9):(1'h1)]) : ({reg15} >> wire10)) ?
                      ((!((8'hbd) ^ wire10)) ?
                          $signed(reg12[(3'h5):(3'h4)]) : wire19[(2'h3):(1'h1)]) : $signed((^(wire9 ?
                          wire10 : wire17)))) ?
                  (({{wire19, reg25}, ((7'h42) ? wire11 : wire16)} ?
                          reg24[(1'h0):(1'h0)] : (wire11 ?
                              (wire9 <= reg12) : (reg13 ? (8'ha6) : (8'hbe)))) ?
                      $unsigned(wire20[(4'h8):(2'h2)]) : (~&reg26)) : (~(!(^wire10[(2'h2):(2'h2)]))));
              reg25 <= reg13;
              reg26 <= $unsigned((^~($unsigned({wire11, wire9}) ?
                  {(wire8 ? (8'h9c) : reg27),
                      (reg22 ? wire17 : reg26)} : $unsigned({wire6, reg28}))));
            end
        end
      reg29 <= (^~reg15[(3'h7):(1'h0)]);
      if (((!((((8'hba) ? reg15 : wire20) <= (wire9 ? reg14 : wire10)) ?
              ((8'haf) >>> $signed(reg27)) : (reg24[(1'h1):(1'h1)] ?
                  wire17 : (reg23 ? wire10 : reg26)))) ?
          ($signed(({reg13} ?
              (wire17 == wire10) : (reg15 < reg13))) ^~ (~^($unsigned(reg29) <= $signed(reg23)))) : (-($unsigned(reg12[(1'h1):(1'h1)]) ?
              wire6 : ((~^(8'ha2)) >>> $unsigned(reg29))))))
        begin
          if ({({reg14[(2'h2):(1'h0)]} ?
                  ($unsigned((~&(8'hbe))) && (+$unsigned(wire10))) : (wire19[(4'h9):(4'h8)] | reg12[(2'h3):(2'h2)])),
              (($unsigned((+reg23)) ?
                      ((reg21 > (8'hb5)) ?
                          reg12[(2'h3):(2'h3)] : (wire16 <= wire18)) : reg24[(2'h2):(1'h1)]) ?
                  $unsigned(wire7) : (reg26[(1'h1):(1'h1)] ?
                      (-(wire6 <= wire20)) : $signed((^~reg14))))})
            begin
              reg30 <= wire9;
              reg31 <= reg15;
              reg32 <= wire16[(4'he):(4'hb)];
              reg33 <= ($unsigned((^~wire11)) | (wire11 - $signed(((~&(8'hbd)) ?
                  (wire10 ? wire16 : reg23) : (wire16 ? reg25 : reg28)))));
            end
          else
            begin
              reg30 <= $unsigned(reg30);
              reg31 <= $signed($unsigned({wire16,
                  (wire7[(2'h3):(1'h0)] >= (reg30 || (8'ha8)))}));
              reg32 <= (reg28 ?
                  (({(-reg21)} ?
                      reg31 : (8'h9e)) ^ $unsigned($unsigned(wire7[(1'h0):(1'h0)]))) : (($signed(reg30[(2'h2):(1'h0)]) <= $signed((^(8'hb0)))) ?
                      {(-$unsigned(wire9)),
                          reg14[(4'hb):(2'h3)]} : (wire17[(5'h10):(2'h3)] ?
                          $unsigned(reg14) : ($signed(wire18) | (reg12 ?
                              wire19 : (8'hb8))))));
            end
        end
      else
        begin
          reg30 <= {(+{(-((8'hbe) <<< reg24))})};
          reg31 <= reg25[(1'h1):(1'h1)];
        end
    end
  assign wire34 = ((($signed(wire19) ?
                          $signed(wire11) : ($unsigned(reg14) << reg23[(4'ha):(4'ha)])) ?
                      (8'hb1) : $signed($signed((~^wire20)))) != reg12[(3'h5):(1'h0)]);
  assign wire35 = {({(+reg25[(1'h1):(1'h0)]),
                              (wire10[(2'h3):(2'h2)] ?
                                  ((8'ha4) + (8'hb0)) : (&wire34))} ?
                          ((!(reg13 ? wire8 : wire6)) + {$signed((8'hb2)),
                              reg25}) : ({reg25[(1'h0):(1'h0)]} == $signed((wire20 != (8'h9d)))))};
  module36 #() modinst62 (wire61, clk, reg33, reg22, wire9, reg13, wire7);
  assign wire63 = {(!$unsigned({(reg21 * wire6)})), reg30[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      if ((~&$unsigned(reg15[(3'h6):(2'h3)])))
        begin
          reg64 <= (^~$signed(reg30));
          reg65 <= (((~&$signed($signed((8'h9f)))) ?
              $signed(((^~wire16) ?
                  wire11 : $unsigned(wire35))) : (((reg14 == reg14) ?
                      wire17[(4'hc):(3'h6)] : $signed(wire7)) ?
                  reg26 : $unsigned(reg29[(2'h2):(1'h0)]))) || reg32);
          reg66 <= (!reg29);
          reg67 <= ($signed((~$signed((~&reg22)))) ?
              reg65[(4'h8):(2'h2)] : (8'ha1));
          reg68 <= $unsigned((-$unsigned((|wire18[(4'h9):(4'h9)]))));
        end
      else
        begin
          reg64 <= $unsigned((($unsigned($signed(wire63)) <<< ($signed((8'h9d)) ?
                  (reg68 ? wire9 : wire20) : $signed(wire61))) ?
              wire18[(5'h12):(4'h9)] : ($signed((!wire61)) >> reg26[(2'h2):(2'h2)])));
          if (((reg13[(3'h7):(3'h4)] ?
                  ($signed($signed(wire61)) ?
                      $unsigned((reg24 ? (8'hbc) : wire9)) : wire6) : wire11) ?
              wire20[(1'h0):(1'h0)] : $signed(reg66[(2'h3):(2'h2)])))
            begin
              reg65 <= (8'hbd);
              reg66 <= ({{reg32, ((!(8'hb9)) || (~|wire7))},
                      ((!{wire8, wire10}) < $signed((&wire10)))} ?
                  reg23[(5'h12):(5'h10)] : ($signed($unsigned((reg26 ?
                          reg29 : reg33))) ?
                      wire8 : reg64));
              reg67 <= reg32;
            end
          else
            begin
              reg65 <= wire16[(4'hc):(4'ha)];
              reg66 <= $signed(reg26);
              reg67 <= $signed((^$signed($unsigned($unsigned(reg28)))));
            end
          reg68 <= (((|{$signed(reg24), (wire35 > (8'h9d))}) ?
              ($unsigned(reg33) - (((8'hac) ^~ wire63) && (wire35 ?
                  reg28 : wire18))) : (^~(reg21[(3'h6):(3'h4)] >= (reg67 <<< (8'hb8))))) && wire18[(2'h3):(1'h0)]);
          reg69 <= wire16;
        end
      reg70 <= (7'h42);
      if (reg33[(3'h6):(1'h1)])
        begin
          if ($signed(reg27[(2'h3):(2'h2)]))
            begin
              reg71 <= reg24;
              reg72 <= $unsigned((~reg23));
            end
          else
            begin
              reg71 <= $unsigned($unsigned((&($signed(wire9) ^~ (reg28 <= (8'hab))))));
            end
          if ($unsigned(((+$unsigned($signed(reg64))) ?
              $unsigned($unsigned(reg15[(3'h7):(3'h4)])) : reg29[(1'h1):(1'h1)])))
            begin
              reg73 <= $signed({(^{reg22[(5'h10):(4'hc)],
                      reg22[(5'h11):(4'hd)]})});
              reg74 <= $signed(($unsigned($unsigned({reg33})) ?
                  (wire20 ?
                      (+$signed(reg12)) : ($unsigned(reg66) ?
                          wire11 : $signed(reg21))) : (8'hb8)));
            end
          else
            begin
              reg73 <= reg32;
              reg74 <= ((+$unsigned($unsigned((reg32 >>> reg15)))) ?
                  wire35[(3'h5):(2'h2)] : ($unsigned($unsigned((wire17 - reg25))) ?
                      $signed((wire16[(4'hc):(4'hb)] ?
                          wire35[(1'h1):(1'h1)] : $unsigned(reg69))) : reg26[(1'h1):(1'h1)]));
            end
          reg75 <= $signed(($signed(((8'h9f) > (~(8'hb8)))) ?
              reg64[(4'hd):(4'ha)] : wire17));
          if (wire35)
            begin
              reg76 <= $unsigned((~&wire34));
              reg77 <= wire34;
            end
          else
            begin
              reg76 <= (&(reg31 & (8'hb6)));
              reg77 <= $unsigned((wire19 ?
                  (({reg22} ? {reg67} : $signed(reg74)) + ($unsigned((8'ha5)) ?
                      ((8'hbc) ?
                          (7'h44) : reg21) : $unsigned((7'h42)))) : (~^$signed(((8'had) ?
                      reg14 : (8'h9d))))));
              reg78 <= $signed(reg23[(5'h12):(3'h5)]);
              reg79 <= (reg27 > ((7'h44) ?
                  (^~$unsigned($unsigned(reg14))) : ((reg73[(3'h4):(3'h4)] + reg30[(1'h1):(1'h0)]) || (-$unsigned(reg71)))));
            end
        end
      else
        begin
          reg71 <= wire16;
          reg72 <= $unsigned(((!reg73) != ((-$unsigned(reg78)) == $unsigned((wire9 ?
              reg75 : reg69)))));
        end
      reg80 <= (wire34 && $signed(reg21));
      reg81 <= (^~reg21);
    end
  assign wire82 = wire34;
  assign wire83 = ((reg22 >= $unsigned((((8'ha1) & (8'hb0)) && (&reg70)))) - $unsigned(wire8));
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg56,
                 reg55,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = wire38;
  assign wire43 = ($signed($unsigned($unsigned(wire38))) <= $unsigned(($signed(wire39[(1'h0):(1'h0)]) ?
                      $signed((^wire42)) : ((wire37 + wire37) && (wire37 ?
                          wire39 : wire42)))));
  assign wire44 = ($signed($signed(wire37[(2'h3):(1'h1)])) < ((wire39[(4'hf):(1'h0)] || ((|(8'hbb)) ^~ (~&wire43))) ?
                      ((^{wire37}) ^~ wire38[(2'h3):(1'h0)]) : (8'ha4)));
  assign wire45 = wire37[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      reg46 <= wire44;
      reg47 <= (((wire42 || (~|$unsigned(wire39))) ?
          {(wire37 | $signed(wire45)),
              $signed((wire39 ?
                  wire40 : wire37))} : (^~wire41[(3'h4):(3'h4)])) + wire40);
    end
  assign wire48 = (-{wire37, $unsigned($signed((&reg47)))});
  assign wire49 = wire45;
  assign wire50 = (($unsigned(((wire45 == wire38) - $signed(wire49))) ^~ wire49[(3'h4):(1'h1)]) <= ((~|(!(~wire48))) ^ (wire43 - wire38)));
  assign wire51 = $signed(wire41[(3'h4):(3'h4)]);
  assign wire52 = reg47;
  assign wire53 = (((^~$signed($unsigned(wire39))) ?
                          {wire50} : wire43[(3'h4):(1'h1)]) ?
                      $signed($signed({(8'hb0)})) : $signed($signed((|$unsigned(wire45)))));
  assign wire54 = wire48;
  always
    @(posedge clk) begin
      reg55 <= wire48[(1'h0):(1'h0)];
      reg56 <= wire52[(4'h8):(1'h0)];
    end
  assign wire57 = ({($signed((8'ha3)) && reg56)} ?
                      $signed($signed(wire50)) : $unsigned($unsigned((+$signed(wire37)))));
  assign wire58 = wire52[(4'ha):(2'h3)];
  assign wire59 = (((wire43[(4'hc):(4'h8)] >= $unsigned((wire42 && wire49))) & ({reg56[(1'h1):(1'h1)]} ^~ wire44[(3'h5):(3'h5)])) * wire43[(4'ha):(4'h8)]);
  assign wire60 = wire45[(1'h0):(1'h0)];
endmodule
