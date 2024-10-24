module top
#(parameter param204 = (^~((~&{{(8'hb0), (8'hb2)}, ((8'ha9) >= (8'ha6))}) ? ((~^(~^(7'h41))) <= {((8'h9f) && (8'hac)), ((8'ha3) ? (7'h42) : (8'ha4))}) : (^~(((8'ha4) ? (7'h42) : (8'hb3)) ? ((8'hb2) ? (8'ha6) : (8'hb1)) : {(8'hb4)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire191;
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  reg [(3'h7):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(5'h14):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire203,
                 wire185,
                 wire62,
                 wire61,
                 wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire7,
                 wire6,
                 wire5,
                 wire187,
                 wire188,
                 wire189,
                 wire190,
                 wire191,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed($signed((wire3 ~^ (-$unsigned(wire2)))));
  assign wire6 = ($unsigned((($signed(wire3) >> $signed((8'hb6))) ?
                     $unsigned(wire5[(3'h7):(3'h4)]) : $signed(wire5))) & $signed(wire5[(3'h7):(3'h4)]));
  assign wire7 = (wire5 >= (-((~|wire6[(2'h3):(1'h0)]) <<< ($unsigned((8'hb2)) ^ wire1))));
  always
    @(posedge clk) begin
      reg8 <= (+((8'hbb) ?
          (^wire0) : (wire1[(5'h12):(4'h8)] & {$signed(wire1)})));
    end
  module9 #() modinst48 (wire47, clk, wire6, wire1, wire3, wire7, reg8);
  assign wire49 = ({wire2[(4'h8):(3'h4)],
                      ({(+wire0)} <<< $signed((^~wire4)))} || ((~&$unsigned({wire2,
                      reg8})) + reg8));
  assign wire50 = $unsigned((~^((&(7'h40)) == wire6)));
  assign wire51 = (($signed(((wire4 ~^ wire0) >> (wire50 ?
                          wire0 : wire47))) ^ {($unsigned(wire1) ?
                              {wire49} : (wire50 & wire47))}) ?
                      $unsigned($unsigned(wire5)) : (&(wire4[(3'h7):(2'h3)] ?
                          $unsigned($unsigned(wire1)) : wire49[(2'h2):(2'h2)])));
  assign wire52 = wire4[(4'h8):(3'h6)];
  assign wire53 = $signed({((((8'hbb) != (8'ha0)) - (+wire7)) ~^ {$unsigned(wire2)}),
                      ($signed(((7'h43) ? wire50 : wire5)) ?
                          {(8'ha9)} : {wire49[(1'h0):(1'h0)]})});
  always
    @(posedge clk) begin
      if ({{((~|(~&wire6)) != $signed(((8'hac) >= wire50)))}})
        begin
          if ($signed($signed(wire53[(1'h1):(1'h1)])))
            begin
              reg54 <= (((~&(~&wire50)) ?
                  wire47 : (~|(~&(wire1 ? (8'had) : wire53)))) - wire1);
              reg55 <= ((|{($signed(wire51) ?
                      {wire6} : (reg54 || wire4))}) << $unsigned(($unsigned((wire5 != wire52)) ?
                  $signed($signed(wire6)) : $signed(wire53[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg54 <= ($signed(((8'ha4) != $unsigned(wire1[(5'h10):(3'h6)]))) ^ ($unsigned(($signed(wire0) <= $signed((7'h41)))) + (~^(|(wire50 ?
                  wire7 : wire53)))));
              reg55 <= $unsigned(wire52[(1'h0):(1'h0)]);
              reg56 <= wire4;
              reg57 <= wire7;
            end
          reg58 <= (~^(reg57 || {(+wire6), $signed($unsigned(wire47))}));
          reg59 <= wire53[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned((~|(reg59 && wire52[(1'h0):(1'h0)]))))
            begin
              reg54 <= wire50;
              reg55 <= (({{$unsigned((7'h40)), reg58},
                      reg54} - $signed((&{wire50}))) ?
                  $unsigned(((|(reg55 >= reg58)) ?
                      $signed((wire53 ? reg8 : reg59)) : $signed({wire5,
                          reg58}))) : $unsigned(wire3));
              reg56 <= (8'hae);
            end
          else
            begin
              reg54 <= (^~{{(~^$signed(reg56))}, (reg59 ^~ {wire0})});
              reg55 <= wire2[(3'h7):(2'h3)];
              reg56 <= (wire49 >>> ($unsigned(reg8[(5'h10):(2'h2)]) ?
                  (~|$unsigned((&(8'hb7)))) : wire47));
              reg57 <= (reg55[(2'h3):(2'h3)] ?
                  wire5[(4'hb):(2'h3)] : reg56[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire60 = $signed($unsigned(($signed($unsigned((8'hba))) ^~ reg59)));
  assign wire61 = $unsigned(((reg56[(2'h2):(2'h2)] ~^ (8'hb3)) ?
                      $signed($unsigned((wire51 << reg54))) : (($unsigned(reg55) ?
                              $signed(reg58) : (wire52 > wire1)) ?
                          wire60 : reg8[(4'he):(4'hb)])));
  assign wire62 = $unsigned(($signed(((wire5 ? wire0 : reg55) * (reg55 ?
                          wire7 : (8'hbd)))) ?
                      $signed((&wire2[(3'h4):(1'h1)])) : $unsigned(((reg54 < wire61) & reg57[(2'h2):(1'h0)]))));
  module63 #() modinst186 (wire185, clk, wire2, reg55, wire61, wire0);
  assign wire187 = (~$unsigned(wire4[(5'h14):(4'he)]));
  assign wire188 = wire53;
  assign wire189 = ($signed($unsigned(({wire53} ?
                           (-wire6) : $unsigned(wire62)))) ?
                       ({wire187} ?
                           {wire5[(4'h8):(3'h4)],
                               $signed($unsigned((7'h42)))} : ((^~(-reg56)) <<< wire61[(3'h5):(1'h1)])) : $signed(reg8[(2'h3):(2'h2)]));
  assign wire190 = $unsigned((reg55[(4'hb):(4'h9)] + (wire49[(2'h3):(2'h2)] <= wire7)));
  module68 #() modinst192 (.wire69(wire4), .wire72(wire51), .wire71(wire189), .wire70(reg58), .y(wire191), .clk(clk));
  always
    @(posedge clk) begin
      reg193 <= $signed((reg56[(2'h3):(2'h3)] ?
          ($signed((+wire53)) <= $signed((~&wire61))) : (reg54[(4'he):(3'h6)] ?
              (~|((8'hb9) ? wire1 : wire62)) : {(wire49 ? wire49 : reg54),
                  wire190[(5'h10):(1'h1)]})));
      if (wire7)
        begin
          reg194 <= {(((^~(~wire49)) << wire188) || (~&(8'hab)))};
          reg195 <= (((^~$signed($signed(wire5))) << $unsigned($signed(reg58))) == ((!(~{wire191,
              wire61})) - {$signed((wire3 ? wire62 : (7'h43)))}));
          if ({wire51[(5'h11):(4'h8)]})
            begin
              reg196 <= (!(&$unsigned(wire190[(5'h12):(2'h3)])));
              reg197 <= reg59;
            end
          else
            begin
              reg196 <= reg194[(1'h1):(1'h0)];
              reg197 <= (reg57 ?
                  $signed(((~^$signed(wire5)) << ($signed(wire4) ?
                      $unsigned(wire52) : (!wire4)))) : {$signed({$signed(wire49),
                          $signed((8'ha8))}),
                      {reg8}});
            end
          reg198 <= wire189[(2'h3):(2'h2)];
        end
      else
        begin
          if (({(!reg57)} ? (^~reg59) : wire0[(3'h4):(1'h1)]))
            begin
              reg194 <= $signed(($signed(($unsigned(reg57) ?
                      $signed(wire47) : wire7)) ?
                  (wire4[(4'hd):(4'h8)] <<< reg194) : ((wire60 >= (+wire1)) ?
                      wire47 : ((-wire189) ? $signed(wire191) : (|reg57)))));
              reg195 <= $unsigned($unsigned((^~(((7'h40) ? (8'ha9) : wire190) ?
                  (^~wire4) : $signed(wire7)))));
              reg196 <= ($unsigned((!(wire2[(3'h4):(1'h0)] ?
                  reg59[(2'h2):(1'h1)] : $signed(wire61)))) << $signed($unsigned($signed($unsigned((8'hae))))));
              reg197 <= wire190[(5'h12):(4'hb)];
            end
          else
            begin
              reg194 <= ($signed(((reg56 ? $signed(wire4) : (~^reg58)) ?
                  $unsigned((reg57 | wire4)) : $unsigned((wire0 ?
                      reg58 : reg55)))) || reg8);
              reg195 <= $unsigned($unsigned(reg55[(5'h10):(1'h1)]));
              reg196 <= wire51[(5'h11):(4'h9)];
              reg197 <= reg193;
              reg198 <= (wire1 | {$signed({$unsigned(reg195)}),
                  $unsigned(((^(8'haa)) ^~ reg58[(4'hd):(3'h4)]))});
            end
          reg199 <= wire1[(3'h5):(1'h0)];
          if (wire6)
            begin
              reg200 <= $signed(wire7);
              reg201 <= (^((8'hb1) == wire6));
              reg202 <= $signed((^$unsigned($signed(((8'haf) ?
                  wire190 : reg58)))));
            end
          else
            begin
              reg200 <= (+$signed($unsigned($signed(((8'hb2) ?
                  reg200 : wire47)))));
            end
        end
    end
  assign wire203 = (&$unsigned(wire6[(3'h6):(2'h3)]));
endmodule

module module63  (y, clk, wire64, wire65, wire66, wire67);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire65;
  input wire signed [(5'h14):(1'h0)] wire66;
  input wire [(4'hb):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire184;
  wire [(3'h6):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire139;
  wire signed [(5'h13):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire156;
  reg signed [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  assign y = {wire184,
                 wire182,
                 wire161,
                 wire158,
                 wire89,
                 wire91,
                 wire92,
                 wire93,
                 wire115,
                 wire124,
                 wire139,
                 wire140,
                 wire156,
                 reg160,
                 reg159,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 (1'h0)};
  module68 #() modinst90 (wire89, clk, wire67, wire64, wire66, wire65);
  assign wire91 = wire89[(4'h9):(4'h8)];
  assign wire92 = (!wire89[(4'h8):(2'h2)]);
  assign wire93 = wire92;
  always
    @(posedge clk) begin
      reg94 <= {wire92};
      if ({((8'ha6) ?
              (~^wire65) : (($unsigned((8'hab)) <<< (wire91 ?
                  reg94 : wire91)) || ($signed(wire64) ?
                  wire89[(3'h6):(1'h1)] : (reg94 << (8'hb9))))),
          ($signed({$signed(reg94)}) ~^ reg94)})
        begin
          reg95 <= (^~wire92[(2'h3):(2'h2)]);
          reg96 <= $unsigned(((-$unsigned(wire66[(4'he):(2'h2)])) >> (wire89[(2'h2):(1'h1)] ?
              wire89[(3'h7):(3'h5)] : wire93[(2'h2):(2'h2)])));
          reg97 <= ((|$unsigned((^~(7'h44)))) ?
              wire89 : (wire92 | ($signed((wire92 >>> wire89)) ?
                  (wire64[(3'h6):(2'h2)] >> $signed(wire92)) : wire64)));
          reg98 <= $unsigned(wire92);
          if ({wire65})
            begin
              reg99 <= (8'ha1);
              reg100 <= ($unsigned((7'h41)) ?
                  $signed(reg96[(4'hd):(4'hb)]) : $unsigned((wire91 ?
                      (+wire91) : ($signed(reg99) > (wire93 ?
                          reg99 : reg94)))));
            end
          else
            begin
              reg99 <= wire66[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg95 <= wire66;
          if (wire66)
            begin
              reg96 <= reg95;
              reg97 <= (wire92 ?
                  reg94[(1'h1):(1'h1)] : ($signed($unsigned((reg98 ?
                      (8'h9d) : reg96))) || reg95));
              reg98 <= reg99[(3'h6):(2'h3)];
              reg99 <= $signed(((($signed(wire64) + $unsigned(reg99)) ?
                  ($unsigned(reg95) && (wire66 ~^ reg95)) : reg99[(3'h4):(3'h4)]) + (((&(8'hb1)) < (reg97 ^~ (8'haf))) <= ((~&(8'ha2)) != $unsigned(reg100)))));
              reg100 <= (reg97 ? wire89 : (~$signed($signed((|wire91)))));
            end
          else
            begin
              reg96 <= ($signed((+($unsigned(wire66) ?
                  reg98 : (wire92 ? wire91 : (8'hba))))) >= wire65);
              reg97 <= (~|(($signed(wire89[(3'h7):(1'h1)]) << $unsigned((^wire89))) <<< $signed({(wire66 ^ wire91),
                  ((7'h44) ? (8'ha2) : reg98)})));
            end
        end
      if ((($signed({(wire93 ? reg95 : wire67)}) ?
          reg95[(4'h8):(2'h3)] : (!((wire65 ~^ reg97) << {reg95}))) << $signed({(reg99[(3'h5):(2'h3)] != $unsigned((8'ha0))),
          $signed(((8'hb7) ~^ (8'hb8)))})))
        begin
          if ($signed((~^(8'haa))))
            begin
              reg101 <= $unsigned((~^(((^reg96) >> (wire65 ?
                  wire65 : wire91)) ^ $signed($signed(reg97)))));
              reg102 <= $signed((wire67[(1'h1):(1'h1)] ~^ {$unsigned($signed(wire65))}));
              reg103 <= wire64[(4'hb):(4'ha)];
              reg104 <= $signed((({$signed(reg102), (!(8'hbf))} ?
                      $signed(((8'hb7) ^ reg98)) : ($unsigned(reg96) ?
                          wire89 : ((8'ha2) ^ wire65))) ?
                  $unsigned(((wire65 ? wire91 : wire65) ?
                      (reg96 - (8'hbf)) : (reg103 ?
                          reg99 : wire64))) : wire89));
            end
          else
            begin
              reg101 <= (reg100 != wire66[(3'h5):(1'h0)]);
              reg102 <= {((|wire65) >= {(^(&wire65))})};
              reg103 <= (wire91[(3'h7):(2'h3)] ? $signed((8'hbd)) : reg96);
            end
          if ($unsigned(reg102[(2'h2):(2'h2)]))
            begin
              reg105 <= (((reg102 - $signed(reg96[(4'hc):(3'h6)])) >>> (reg102[(1'h1):(1'h0)] <<< $signed(wire65[(3'h5):(1'h1)]))) ?
                  {(^~(8'hb2))} : (wire67 && $unsigned($unsigned((reg99 - reg95)))));
              reg106 <= reg95[(1'h0):(1'h0)];
              reg107 <= $unsigned((^(((~&wire91) ?
                  ((8'ha1) + reg105) : (reg101 || reg102)) <= {((8'hb8) ?
                      wire65 : (8'hbf))})));
              reg108 <= $signed(($unsigned($unsigned(reg96[(4'ha):(3'h5)])) != ($unsigned((~^wire65)) >= (~|{wire93,
                  reg99}))));
              reg109 <= (8'ha3);
            end
          else
            begin
              reg105 <= (8'ha8);
              reg106 <= {reg97};
              reg107 <= $signed(reg109[(1'h0):(1'h0)]);
              reg108 <= $unsigned(($unsigned((~&(8'ha7))) + (($signed((7'h44)) <= $unsigned(reg107)) < (wire89[(3'h6):(1'h0)] < (reg102 ?
                  (7'h41) : reg102)))));
              reg109 <= $signed(reg108[(2'h2):(1'h0)]);
            end
          if ((&$unsigned($unsigned($signed((7'h41))))))
            begin
              reg110 <= (-($signed($unsigned(reg107[(3'h6):(3'h4)])) ?
                  ({(~reg102), (^reg105)} ?
                      (reg109 ?
                          (reg102 ?
                              reg108 : reg100) : ((8'h9f) && reg99)) : reg105) : {($unsigned(reg98) ?
                          $signed(reg102) : wire92)}));
              reg111 <= (&((($signed(reg109) | (~^reg94)) ~^ (-$unsigned(reg101))) ^~ $unsigned(reg94)));
              reg112 <= wire66[(4'h9):(4'h9)];
              reg113 <= $signed($signed($signed(({wire93} >> $unsigned(reg111)))));
              reg114 <= (|(8'hbe));
            end
          else
            begin
              reg110 <= $signed(({reg106[(4'hf):(3'h6)]} >= reg110[(3'h4):(1'h0)]));
              reg111 <= reg102[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg101 <= $signed($unsigned(wire65[(1'h0):(1'h0)]));
          reg102 <= $unsigned(((((wire89 ? reg109 : (8'hac)) ?
                      $signed(reg104) : wire91[(4'hb):(3'h5)]) ?
                  reg106 : $unsigned((&wire64))) ?
              reg102[(2'h2):(2'h2)] : ($unsigned({reg103, reg111}) ?
                  $unsigned($signed(wire66)) : $signed(reg111[(1'h0):(1'h0)]))));
          reg103 <= $unsigned((~^(wire89 + $unsigned(reg95[(4'hd):(4'h9)]))));
          reg104 <= (wire65[(4'h9):(3'h6)] & (~^$unsigned(wire66[(4'hd):(3'h6)])));
          reg105 <= reg106;
        end
    end
  assign wire115 = (({reg114[(2'h3):(1'h0)], {$signed(reg95)}} ?
                           reg111 : $unsigned(wire67[(4'hb):(4'h8)])) ?
                       reg109 : reg107);
  always
    @(posedge clk) begin
      if ((8'ha3))
        begin
          reg116 <= reg105[(1'h1):(1'h0)];
          reg117 <= (|$unsigned((reg108 + {reg114[(3'h5):(3'h5)]})));
          reg118 <= wire65;
          reg119 <= ((({(8'hbf)} ?
                  (((8'haf) * reg117) * (reg112 ^~ reg116)) : $signed($signed((8'ha0)))) >> (|(reg111[(4'hb):(4'h9)] ?
                  reg109 : (~&reg101)))) ?
              $unsigned((~(reg103 ?
                  (-(8'h9f)) : $unsigned(reg100)))) : (reg107 < (({wire64,
                          wire89} ?
                      $signed(wire92) : {wire115}) ?
                  $unsigned($unsigned(reg104)) : ((reg112 << reg94) ?
                      (~reg100) : reg107))));
          if (wire66)
            begin
              reg120 <= reg113;
              reg121 <= reg114[(1'h0):(1'h0)];
              reg122 <= ((~^$unsigned(((reg98 ? (8'h9d) : reg108) ?
                  reg97[(4'hb):(3'h4)] : wire67[(1'h1):(1'h0)]))) | ((wire92[(3'h6):(1'h1)] ?
                      reg109[(1'h0):(1'h0)] : reg121) ?
                  (~^{$signed(reg119)}) : $unsigned($signed($unsigned(wire89)))));
              reg123 <= $unsigned(($signed(($unsigned(reg105) * wire67)) < $signed(reg108[(3'h6):(2'h2)])));
            end
          else
            begin
              reg120 <= $signed(reg107[(1'h1):(1'h0)]);
              reg121 <= ((^~(((^reg101) ?
                  $unsigned(wire64) : {wire89,
                      (8'hba)}) && $unsigned(wire91))) >= ($signed({(^~(8'hb6))}) ^ (~&(~(8'hbb)))));
            end
        end
      else
        begin
          reg116 <= reg108[(2'h2):(2'h2)];
        end
    end
  assign wire124 = ({(($signed(reg112) ?
                           reg98 : (reg122 >= reg99)) || ((&reg119) ?
                           reg96[(4'hb):(3'h6)] : reg111)),
                       (wire65 - $unsigned((+reg94)))} ^~ reg95[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg125 <= ((wire66[(4'hf):(4'hc)] ?
          {wire124,
              (~^(reg100 ?
                  reg119 : (8'ha7)))} : reg103) != {$signed($signed($signed(reg123))),
          {(8'hb1), $unsigned(reg99[(3'h4):(2'h2)])}});
      reg126 <= reg107[(3'h6):(2'h2)];
      if (reg110[(3'h4):(2'h2)])
        begin
          if ($unsigned((^(reg113 == ({(8'hbb), wire64} ~^ (~reg123))))))
            begin
              reg127 <= {$signed(((reg97[(2'h2):(1'h1)] ?
                      (!wire92) : $unsigned((7'h42))) * (reg109[(1'h0):(1'h0)] ?
                      (~&reg111) : $unsigned(wire67)))),
                  reg110};
              reg128 <= reg104[(3'h5):(2'h2)];
            end
          else
            begin
              reg127 <= ((^~($signed(reg104) ?
                  reg106[(4'h9):(3'h4)] : reg117)) ^~ (reg99 - wire67));
              reg128 <= ((~^$unsigned((reg122 != $unsigned(reg126)))) ?
                  $unsigned(({{(8'ha0)}} ?
                      (!{wire93,
                          reg111}) : $unsigned($signed(reg112)))) : (reg100[(2'h3):(1'h1)] > $signed($unsigned(((8'ha8) & (8'had))))));
              reg129 <= {$signed(($signed((reg94 | reg109)) * (&(reg120 ?
                      reg116 : (8'hbd)))))};
              reg130 <= {{(reg110 & ($unsigned(reg98) >> (reg101 ^ reg127))),
                      (({(7'h40), wire124} >>> (reg116 ? reg102 : reg127)) ?
                          (~$unsigned(wire65)) : (8'hb8))},
                  (7'h42)};
              reg131 <= (+reg108);
            end
          if (reg117[(2'h3):(1'h0)])
            begin
              reg132 <= reg111;
              reg133 <= reg119;
              reg134 <= {$unsigned((($unsigned(reg112) > reg119[(2'h2):(2'h2)]) ?
                      $signed((+reg121)) : {reg126}))};
              reg135 <= (8'hbd);
              reg136 <= reg94[(2'h2):(2'h2)];
            end
          else
            begin
              reg132 <= ({reg128} >>> $unsigned((reg126 ?
                  (!reg121[(3'h4):(1'h0)]) : {(reg119 >= reg106)})));
              reg133 <= $unsigned(reg119);
              reg134 <= (reg112[(3'h7):(3'h4)] > reg135);
              reg135 <= reg120;
              reg136 <= {(8'hab)};
            end
          reg137 <= ((^(|(reg114[(3'h5):(1'h0)] + ((8'hb2) ?
                  reg121 : reg121)))) ?
              $signed({reg113[(3'h4):(3'h4)]}) : $unsigned(({reg135,
                      {reg113, (8'hbd)}} ?
                  reg95 : reg98[(4'h9):(3'h7)])));
        end
      else
        begin
          reg127 <= reg128[(3'h6):(2'h3)];
          reg128 <= reg135;
        end
      reg138 <= $unsigned(reg133[(4'ha):(4'h8)]);
    end
  assign wire139 = ((|$unsigned((~(reg113 >= reg126)))) || (wire91[(3'h7):(3'h5)] - $signed(((reg131 ?
                       reg134 : reg131) && (^~wire92)))));
  assign wire140 = ({{(~&reg136), $signed((wire139 | reg114))},
                           ({(+reg104)} ^ reg131)} ?
                       reg105 : reg121[(2'h3):(2'h3)]);
  module141 #() modinst157 (.y(wire156), .wire144(reg106), .clk(clk), .wire145(reg129), .wire143(reg95), .wire142(wire92));
  assign wire158 = reg132[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg159 <= wire66[(4'ha):(1'h0)];
      reg160 <= $signed($signed((((reg159 >= reg110) >>> (reg129 ?
          (8'hbb) : reg100)) >> $unsigned($signed(reg116)))));
    end
  assign wire161 = reg100[(4'hb):(3'h6)];
  module162 #() modinst183 (.wire166(reg123), .clk(clk), .y(wire182), .wire165(reg96), .wire163(reg94), .wire164(reg128));
  assign wire184 = ($unsigned((|reg101)) <= reg95);
endmodule

module module9
#(parameter param46 = {(((&((8'ha0) ? (8'ha5) : (7'h42))) ? {((8'ha2) ~^ (8'ha1))} : (((8'ha6) - (8'hb7)) ? ((8'ha8) | (8'haf)) : (-(8'ha1)))) ? ((|(^~(8'ha9))) || (((8'hb5) ? (8'ha3) : (8'haf)) ^ ((8'ha7) ? (7'h43) : (8'hb1)))) : (~^((~(8'h9e)) ? (^(7'h43)) : ((7'h42) + (8'ha1))))), (^((((8'hb0) ? (8'hb9) : (8'hb5)) ? ((8'hbe) * (7'h44)) : ((8'h9d) >= (8'hbf))) << (!(&(8'ha8)))))})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire15 = wire12;
  assign wire16 = wire13[(3'h4):(1'h0)];
  assign wire17 = wire16;
  assign wire18 = $signed((!$unsigned($unsigned({wire17}))));
  assign wire19 = (((-((wire16 + wire14) ~^ (+wire12))) ?
                      {((~|wire13) << (wire13 ? wire16 : wire10)),
                          $unsigned((wire10 <= wire17))} : $signed($unsigned((!wire17)))) <= (7'h41));
  assign wire20 = ($signed($unsigned(($signed(wire17) ^~ (wire10 <<< (8'ha3))))) - $signed((8'hab)));
  always
    @(posedge clk) begin
      reg21 <= wire19;
      reg22 <= (+{wire14, $signed($unsigned($signed(wire12)))});
      reg23 <= ((&(({(8'hb9)} ^ wire17) ^~ ($unsigned(wire16) ?
          (wire14 ?
              wire14 : wire14) : wire18[(3'h5):(2'h2)]))) + (~|(wire20[(1'h1):(1'h0)] << (~^(reg21 > wire11)))));
      reg24 <= $signed(reg23);
    end
  assign wire25 = {(($unsigned((wire15 ? (8'hbb) : (8'ha7))) ?
                          ($signed((8'h9c)) ?
                              $signed(wire10) : $unsigned(wire14)) : (~^reg23)) ~^ wire17[(2'h3):(1'h0)]),
                      wire15[(3'h4):(2'h3)]};
  assign wire26 = wire11;
  assign wire27 = $unsigned($unsigned($signed($unsigned($signed(wire19)))));
  assign wire28 = ((!{(|reg23[(1'h0):(1'h0)])}) || reg24[(1'h1):(1'h0)]);
  assign wire29 = wire13[(1'h1):(1'h0)];
  assign wire30 = ({(($signed(reg21) ^ (~^wire25)) ?
                              (~$unsigned((8'hab))) : $signed(reg23))} ?
                      (|wire19) : (reg22[(4'hd):(4'hb)] ?
                          {((wire25 << wire18) == reg21[(1'h0):(1'h0)])} : wire27));
  always
    @(posedge clk) begin
      reg31 <= $signed({(|wire15[(2'h3):(1'h1)])});
      if ({wire16})
        begin
          reg32 <= {({(~&(reg31 <= wire14)),
                      ((reg31 ^~ wire15) ? $signed(wire19) : wire19)} ?
                  wire29 : wire27),
              ((($unsigned((8'hbb)) < (wire13 ? (8'had) : wire11)) ?
                  ((~|(8'hb4)) | (reg23 ?
                      wire15 : wire11)) : $unsigned(wire13[(1'h0):(1'h0)])) ~^ (7'h41))};
          if ($unsigned((+$unsigned(($signed((8'h9d)) ?
              $unsigned(wire25) : $unsigned(wire27))))))
            begin
              reg33 <= (wire16 ?
                  ((8'h9d) + $signed({$unsigned(wire25)})) : {(((wire27 >> wire16) ?
                          wire14 : {wire29,
                              wire30}) ^ (wire13[(3'h4):(2'h2)] || $unsigned((7'h42))))});
              reg34 <= ($signed($unsigned((^~reg33))) ^ ((wire14 || (((8'ha3) ?
                  wire14 : wire29) >> (&reg21))) >= $signed(((reg33 <= wire19) - {wire26,
                  wire26}))));
            end
          else
            begin
              reg33 <= $signed(wire19);
              reg34 <= (|($unsigned($unsigned((wire30 ? reg34 : wire29))) ?
                  $signed((-(|wire17))) : $signed($signed(wire10))));
            end
          reg35 <= {$signed($unsigned((wire12 && (+reg22)))),
              wire28[(1'h1):(1'h0)]};
          reg36 <= $signed($unsigned(wire20));
        end
      else
        begin
          reg32 <= (~reg23);
        end
      reg37 <= ($signed(reg23) <= (-reg36[(2'h3):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg38 <= reg23[(4'ha):(3'h4)];
      reg39 <= {(-$signed(((wire27 && wire19) ? $signed(wire26) : (8'hb7)))),
          $unsigned($unsigned($signed((reg35 ~^ wire20))))};
      reg40 <= $signed((~^(^((!reg35) ?
          (reg36 * wire30) : (reg39 <<< (8'ha7))))));
      reg41 <= $unsigned((wire10 ?
          (&reg35[(4'ha):(4'h8)]) : $unsigned($unsigned(wire17))));
      reg42 <= wire15;
    end
  assign wire43 = (reg21 ?
                      ($signed($unsigned((reg41 <<< wire17))) ?
                          wire19[(1'h0):(1'h0)] : $unsigned(wire13)) : wire16);
  assign wire44 = $unsigned(wire11[(1'h0):(1'h0)]);
  assign wire45 = reg42;
endmodule

module module162
#(parameter param181 = (+((8'ha4) || (-(((8'hb8) && (8'h9f)) ? {(8'hb7), (8'ha3)} : {(8'hb1), (8'hb9)})))))
(y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire166;
  input wire signed [(3'h4):(1'h0)] wire165;
  input wire [(2'h2):(1'h0)] wire164;
  input wire [(4'he):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire signed [(3'h7):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  reg signed [(4'hb):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg176 = (1'h0);
  reg [(3'h6):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire168,
                 wire167,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire167 = wire163;
  assign wire168 = wire164;
  always
    @(posedge clk) begin
      if ({{wire165, wire167}})
        begin
          reg169 <= (8'h9e);
          reg170 <= ($signed((((reg169 ? wire163 : wire164) ?
                  {wire168} : (wire167 ?
                      wire163 : wire166)) | {$unsigned(wire165), (&wire163)})) ?
              wire168 : reg169);
          reg171 <= {$signed($unsigned(reg170))};
        end
      else
        begin
          reg169 <= ($unsigned((^(&(wire163 ?
              wire167 : (8'h9c))))) - (~$signed($unsigned(wire167[(3'h4):(2'h2)]))));
          reg170 <= (~&$signed($unsigned((!(reg171 ~^ wire164)))));
          reg171 <= $unsigned(wire167[(2'h2):(2'h2)]);
          reg172 <= (+(8'hbf));
          if ((reg170[(3'h4):(3'h4)] ^~ (|(wire165 ?
              wire166[(2'h3):(1'h0)] : $signed(wire167)))))
            begin
              reg173 <= $unsigned(reg172);
              reg174 <= (~$signed($unsigned($signed((wire166 <= wire167)))));
            end
          else
            begin
              reg173 <= $unsigned($unsigned((-{$signed(wire164), (~|reg172)})));
            end
        end
      reg175 <= (wire164 ^~ $unsigned($signed(((wire165 ?
          wire166 : (8'hb4)) <= $signed(wire163)))));
      reg176 <= $signed({$unsigned((~|reg172[(3'h4):(3'h4)])), (8'ha5)});
      reg177 <= ({wire165,
              ($unsigned(wire168[(2'h3):(1'h0)]) ?
                  (~&$signed(wire166)) : $signed((+(8'hb7))))} ?
          (~($unsigned($signed(wire168)) ?
              $signed($unsigned(reg176)) : (^~{wire168,
                  reg175}))) : $signed(wire165[(2'h3):(2'h2)]));
    end
  assign wire178 = (8'hb3);
  assign wire179 = wire167;
  assign wire180 = $signed(($unsigned($signed((reg177 >>> reg177))) ?
                       $unsigned($signed($unsigned(wire167))) : ((8'ha3) == $signed(reg174))));
endmodule

module module141
#(parameter param155 = (~{(|({(7'h41), (8'ha3)} + {(8'ha9)})), (!(^{(8'hb1), (8'hbc)}))}))
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire145;
  input wire signed [(5'h11):(1'h0)] wire144;
  input wire signed [(4'h9):(1'h0)] wire143;
  input wire [(5'h10):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire148,
                 wire147,
                 wire146,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire146 = wire142;
  assign wire147 = $unsigned($unsigned(wire146));
  assign wire148 = {wire144};
  always
    @(posedge clk) begin
      reg149 <= wire147;
      reg150 <= $unsigned(((($unsigned((8'ha5)) ?
                  (^wire144) : (wire146 >= wire145)) ?
              {(~|(8'hb2)), $signed((8'hb5))} : wire147[(2'h3):(1'h1)]) ?
          wire142[(4'ha):(2'h3)] : (~^wire145[(2'h2):(2'h2)])));
      reg151 <= $signed(((((|wire143) ? {(8'hac), wire143} : {wire145}) ?
              (~|(wire145 >>> reg150)) : {(wire144 == wire144)}) ?
          (&($signed((8'ha0)) > (wire147 ? wire142 : reg150))) : (|(((8'hb5) ?
                  reg150 : wire143) ?
              {(8'hb1)} : {wire143, wire142}))));
      reg152 <= ((^({$unsigned(wire143)} ?
          (reg150 ?
              wire143[(4'h8):(3'h7)] : {reg149}) : {{wire142}})) ~^ wire147);
    end
  assign wire153 = reg150[(1'h1):(1'h1)];
  assign wire154 = (+$unsigned((^wire153[(4'hb):(4'ha)])));
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  input wire [(5'h13):(1'h0)] wire70;
  input wire signed [(4'h8):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire74,
                 wire73,
                 reg83,
                 reg82,
                 reg76,
                 (1'h0)};
  assign wire73 = $unsigned((+$signed(((8'ha4) + $signed(wire71)))));
  assign wire74 = $signed($unsigned(wire70));
  assign wire75 = {$signed($signed((&wire74[(1'h1):(1'h0)]))),
                      (((wire70 | (wire70 != wire74)) ?
                          {((7'h40) ~^ wire73)} : ((wire73 ~^ (8'hbb)) ?
                              {wire69} : $unsigned(wire73))) >>> $signed(((wire73 ?
                              wire73 : wire71) ?
                          $unsigned(wire71) : (wire71 ^~ wire69))))};
  always
    @(posedge clk) begin
      reg76 <= (^~$unsigned(({wire69[(4'h8):(2'h2)]} ?
          ($signed(wire69) & $signed(wire73)) : wire72[(1'h1):(1'h1)])));
    end
  assign wire77 = $unsigned(($unsigned({$signed(wire74),
                      $unsigned(reg76)}) < $unsigned({wire74[(1'h0):(1'h0)]})));
  assign wire78 = $signed($signed((({wire69} ? (&wire73) : {wire73, wire72}) ?
                      $unsigned((wire73 <= wire69)) : {(^~wire72),
                          (~(8'hba))})));
  assign wire79 = ({{(&reg76)}} >> wire73);
  assign wire80 = (wire73 >>> $unsigned(({(wire78 ? reg76 : reg76),
                          (wire79 ? wire70 : wire69)} ?
                      $unsigned($unsigned(wire79)) : ($signed(wire70) + $signed(wire74)))));
  assign wire81 = wire74[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg82 <= wire71;
      reg83 <= reg76[(2'h2):(1'h0)];
    end
  assign wire84 = (^$unsigned((({wire69, wire74} ^~ $unsigned(wire70)) ?
                      $unsigned($signed(wire70)) : ((wire72 ?
                          wire81 : wire73) >>> wire72))));
  assign wire85 = wire79;
  assign wire86 = wire79;
  assign wire87 = ({$signed(((wire80 != wire81) ?
                              wire70[(4'ha):(2'h2)] : (reg76 > (8'hae))))} ?
                      wire85[(3'h4):(1'h0)] : {(^$unsigned($signed(reg76))),
                          ((-(~reg76)) ?
                              {(reg76 ?
                                      (8'hbc) : (8'hb6))} : wire70[(5'h12):(4'h9)])});
  assign wire88 = ((reg83 ?
                      $signed($unsigned($unsigned(reg83))) : $signed((!wire69[(2'h2):(2'h2)]))) << {{{$signed(wire85),
                              $unsigned(wire81)}},
                      (($unsigned(wire70) >> (wire81 ?
                          (8'hb8) : wire79)) != (wire80[(4'h8):(3'h6)] ?
                          $signed(wire84) : wire84))});
endmodule
