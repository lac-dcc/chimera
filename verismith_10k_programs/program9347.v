module top
#(parameter param163 = (8'hb5), 
parameter param164 = (param163 <<< param163))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire156;
  wire [(5'h11):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire71,
                 wire43,
                 wire41,
                 wire6,
                 wire5,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 (1'h0)};
  assign wire5 = {wire1, (^~wire3[(2'h3):(1'h1)])};
  assign wire6 = wire5;
  module7 #() modinst42 (wire41, clk, wire2, wire1, wire3, wire6);
  assign wire43 = {wire2,
                      ($unsigned({wire3}) <= $signed(((wire4 ^~ wire4) <= $unsigned(wire5))))};
  always
    @(posedge clk) begin
      if ({(wire5 ? wire2[(3'h7):(3'h6)] : wire41[(3'h4):(3'h4)]),
          wire41[(4'hd):(4'ha)]})
        begin
          if ((&$signed($signed(($signed(wire1) == wire3)))))
            begin
              reg44 <= {{$unsigned($unsigned((~^wire5))),
                      (^$signed($signed(wire0)))},
                  $unsigned($signed(((&wire5) ?
                      (~wire41) : $unsigned(wire3))))};
              reg45 <= ((wire2 ?
                      $unsigned((wire0 ?
                          $signed(wire2) : wire6[(4'ha):(4'ha)])) : ($unsigned(((7'h41) ?
                          wire5 : wire2)) <<< {(~wire43), {(8'haf), wire4}})) ?
                  $signed((reg44[(2'h3):(2'h2)] ?
                      (7'h41) : (^(wire3 == wire43)))) : (~&{(&$signed(wire5))}));
            end
          else
            begin
              reg44 <= $signed({((^{wire3, wire6}) ?
                      $unsigned($signed(wire2)) : $signed((~&wire5)))});
              reg45 <= ({(((wire6 ? wire43 : wire2) ?
                          wire0 : (wire0 ?
                              wire43 : wire43)) ^ ((~reg44) << reg44[(3'h5):(1'h1)])),
                      (($unsigned(wire0) << $unsigned(wire5)) < {(reg44 ?
                              wire4 : wire3)})} ?
                  ($signed((-wire0[(2'h2):(1'h1)])) ?
                      $unsigned(((wire41 < wire43) ?
                          (|(8'ha6)) : {(8'hb7),
                              wire43})) : reg45[(3'h5):(2'h2)]) : $unsigned(reg44[(3'h4):(2'h2)]));
            end
        end
      else
        begin
          reg44 <= wire1[(4'h8):(3'h4)];
          if (($unsigned(((8'hbf) < (~&(reg44 <= wire5)))) ?
              (({$signed((8'hbc)), (8'hb4)} ?
                  $unsigned((wire6 ?
                      (8'haf) : wire0)) : wire43) >>> $signed((-(wire6 >>> reg44)))) : (&($unsigned($unsigned(wire5)) ?
                  ((reg45 ^ (8'hb3)) != wire3) : reg45))))
            begin
              reg45 <= (~|wire43);
            end
          else
            begin
              reg45 <= wire41[(4'hb):(2'h2)];
              reg46 <= (&((8'ha4) ? (7'h43) : $unsigned((~|(wire43 & wire0)))));
              reg47 <= (~wire41[(4'he):(1'h1)]);
              reg48 <= ($unsigned(wire3) && (~|$unsigned({$unsigned((8'ha2)),
                  wire6})));
              reg49 <= wire43[(1'h0):(1'h0)];
            end
          if (wire0)
            begin
              reg50 <= $unsigned($unsigned(((-reg44[(3'h6):(2'h3)]) ?
                  wire6[(3'h5):(3'h5)] : (~&(reg48 != wire0)))));
              reg51 <= (wire43 ?
                  {($unsigned($unsigned(wire2)) ^ {$signed(wire4)}),
                      reg48} : (~^(($unsigned(reg44) ?
                      {wire6, reg50} : $unsigned(wire1)) < $signed(wire3))));
              reg52 <= (~$signed((|(+(wire4 ? reg46 : (8'h9f))))));
              reg53 <= reg51;
            end
          else
            begin
              reg50 <= reg47;
              reg51 <= (!(reg52 >>> $signed($signed((wire6 ^ wire43)))));
              reg52 <= reg44[(3'h4):(2'h2)];
              reg53 <= $unsigned((^~(8'haa)));
            end
          reg54 <= ((~((~$unsigned(reg44)) ?
                  $signed(reg48) : $signed({wire41}))) ?
              reg44 : {(8'hb2), $signed(reg53[(4'hb):(2'h2)])});
          if ($unsigned((({$signed(wire4)} | {(!reg48), (~&reg49)}) ?
              $unsigned(reg45) : (!(^(~^(7'h44)))))))
            begin
              reg55 <= {{((&{(8'hae)}) ? $signed($signed((8'ha2))) : wire1),
                      $unsigned((((7'h42) - (8'hb6)) > reg52))}};
              reg56 <= (+{(~|(&$unsigned((8'hb6)))),
                  (~|$signed(((8'hb1) <<< (8'h9e))))});
            end
          else
            begin
              reg55 <= reg44;
            end
        end
      if ($signed(reg51))
        begin
          reg57 <= (~^$signed((^((+(8'h9d)) >>> wire0))));
          if (wire41)
            begin
              reg58 <= ($signed($signed($signed(wire3))) ?
                  (wire4[(2'h2):(1'h0)] ^ ({reg53[(4'hc):(3'h6)],
                          $unsigned(wire41)} ?
                      reg48[(1'h0):(1'h0)] : reg53)) : (^~($signed($unsigned((8'hbc))) ?
                      ($unsigned(wire6) * wire2[(3'h5):(1'h0)]) : (((8'hb1) ?
                              wire43 : reg56) ?
                          $signed(reg55) : (!reg49)))));
              reg59 <= $signed({reg49[(1'h1):(1'h1)]});
              reg60 <= $unsigned($signed(((!(~reg45)) ?
                  wire1 : ((reg52 ? (8'ha0) : reg57) ^ reg44[(1'h0):(1'h0)]))));
              reg61 <= $signed($signed((reg52[(2'h3):(2'h3)] ?
                  $signed((-reg55)) : reg54[(5'h12):(4'ha)])));
              reg62 <= (7'h41);
            end
          else
            begin
              reg58 <= {($signed($signed(reg62)) - reg45),
                  {(^$unsigned(reg55[(1'h0):(1'h0)]))}};
              reg59 <= reg50;
            end
          reg63 <= $unsigned(wire43[(3'h7):(3'h7)]);
          if ($unsigned(($signed($signed(reg59[(1'h0):(1'h0)])) ^ {reg61})))
            begin
              reg64 <= {(($signed($signed(wire43)) <= $unsigned(reg49)) > $signed(($signed(wire43) == wire3[(2'h2):(1'h1)]))),
                  $signed({reg47[(4'hb):(2'h2)]})};
              reg65 <= (((((reg54 + reg45) ?
                      wire4[(1'h1):(1'h1)] : (wire4 ^ wire0)) < $unsigned(((8'ha4) ?
                      wire6 : reg46))) <<< $unsigned((^(reg63 ?
                      reg49 : wire0)))) ?
                  (~^wire43[(4'h8):(3'h4)]) : ((^~reg45[(2'h2):(1'h0)]) ?
                      $unsigned((^~(+reg44))) : $unsigned(reg49)));
              reg66 <= reg65;
              reg67 <= (^~$signed(reg60));
              reg68 <= $unsigned((!$unsigned(((^~reg66) ?
                  reg59 : wire6[(4'ha):(1'h1)]))));
            end
          else
            begin
              reg64 <= (+$signed($signed((+(~&reg52)))));
              reg65 <= ((+((-$signed(reg60)) << reg52[(4'hb):(4'ha)])) < ((~((reg60 ?
                  reg50 : reg53) ^ $signed(wire0))) ^ $unsigned(reg45[(1'h0):(1'h0)])));
              reg66 <= (-((!((reg61 * reg57) < wire41[(2'h3):(2'h3)])) * reg57[(2'h2):(1'h0)]));
              reg67 <= (~|$signed(($signed(((8'hac) ?
                  wire41 : reg68)) != $signed($signed((8'hac))))));
            end
        end
      else
        begin
          reg57 <= ($unsigned(wire1[(3'h6):(3'h4)]) ^ wire3);
          reg58 <= $unsigned({$unsigned((~|{reg55, reg51}))});
          if ($unsigned(({(8'hae)} ?
              $signed(reg53[(4'h9):(4'h9)]) : {{(reg47 | reg63)}})))
            begin
              reg59 <= ($signed(wire4[(2'h2):(1'h1)]) != reg53);
              reg60 <= (~&(|wire5));
              reg61 <= $signed(((!reg67[(4'h8):(2'h3)]) + wire43[(3'h6):(2'h2)]));
            end
          else
            begin
              reg59 <= ((reg46 ?
                  reg54[(4'h9):(3'h4)] : ($signed(((8'hba) ^~ (8'hbd))) ?
                      $signed(reg67[(3'h5):(2'h3)]) : (-$unsigned(reg56)))) && {(((reg66 ?
                          reg64 : reg60) ?
                      $signed(reg58) : (reg54 ?
                          reg66 : wire43)) || (+$signed((8'haa))))});
              reg60 <= {$signed(wire5[(3'h6):(2'h2)])};
              reg61 <= (&$signed($signed($signed(reg65[(4'h9):(2'h2)]))));
            end
          if ($unsigned(((~(|reg60)) ?
              (~&((reg59 ? reg49 : reg61) ?
                  (reg59 ? reg51 : reg57) : {reg59, (8'ha6)})) : (((reg50 ?
                      reg66 : reg56) >> $unsigned(reg47)) ?
                  (~$signed(wire0)) : (wire5[(3'h6):(1'h1)] ~^ reg54)))))
            begin
              reg62 <= reg63;
              reg63 <= ($signed((((reg57 ? (8'h9e) : reg57) ?
                  (|reg48) : $unsigned(wire41)) <= (&wire41[(4'hc):(3'h5)]))) ^~ $unsigned(($signed(wire0[(2'h2):(2'h2)]) < $unsigned($signed((8'hb9))))));
              reg64 <= ((({(reg63 != reg50)} ?
                      wire3 : $unsigned((reg68 ^ wire43))) ?
                  $unsigned((^~(~^reg47))) : (reg63 == wire43[(2'h2):(1'h0)])) >= (~$signed((|wire41))));
              reg65 <= ($unsigned((^~$signed(reg54))) <<< wire5[(3'h6):(3'h6)]);
            end
          else
            begin
              reg62 <= (reg50[(2'h3):(1'h0)] >>> $signed($signed(reg45)));
              reg63 <= (reg55[(3'h4):(2'h2)] != reg59);
            end
        end
      reg69 <= reg63[(2'h3):(1'h0)];
      reg70 <= (($signed($unsigned(reg61)) ^ $unsigned($unsigned({(8'h9f)}))) < $unsigned(reg56));
    end
  assign wire71 = (~reg69[(4'hb):(1'h1)]);
  module72 #() modinst157 (wire156, clk, reg62, reg60, reg47, reg57, reg53);
  assign wire158 = reg57;
  assign wire159 = ($signed((~|reg59[(1'h0):(1'h0)])) < ($signed(($signed(reg66) << reg45)) ?
                       (~&wire0[(3'h5):(1'h1)]) : (-(reg51[(1'h0):(1'h0)] != wire158))));
  assign wire160 = $signed($unsigned($signed(((+reg61) >>> (reg51 - reg67)))));
  assign wire161 = {((reg62[(2'h2):(2'h2)] && wire1) == (reg52 - (reg53[(4'hd):(3'h4)] <= (reg53 ?
                           (8'ha1) : wire43)))),
                       (($unsigned({wire43}) ?
                               ((8'hbe) - (reg67 ?
                                   reg66 : wire71)) : (~&$unsigned((7'h40)))) ?
                           (~&$signed((^~wire3))) : $signed(wire0))};
  assign wire162 = reg53[(4'hf):(4'ha)];
endmodule

module module72
#(parameter param154 = {(((~((8'hb9) ^~ (7'h40))) ? ((-(8'ha8)) | (&(8'h9d))) : ((~^(8'haa)) ? ((8'hb8) ? (8'hb7) : (8'ha5)) : (&(8'h9e)))) ? (({(7'h44), (8'hb1)} * ((8'h9e) & (8'ha2))) >= ((+(8'hbc)) - (|(8'hb7)))) : {(&((8'hbb) ? (8'haa) : (8'hbd)))}), (((((8'had) ? (8'h9c) : (8'ha0)) << {(8'hbc)}) ? (((8'hbf) & (8'haf)) - ((8'hab) ? (7'h41) : (7'h40))) : ({(8'hae), (8'ha4)} >>> (~(8'haf)))) == (!(((7'h44) <<< (8'hb2)) < (|(8'hb0)))))}, 
parameter param155 = (((+(param154 ? (&param154) : param154)) ^ param154) ? (((^(8'h9f)) != ((~param154) ? (param154 != (8'hb5)) : (!param154))) ? (^({(8'ha7), param154} ? ((8'hb8) >>> param154) : (param154 < param154))) : param154) : (7'h43)))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h300):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire77;
  input wire signed [(5'h10):(1'h0)] wire76;
  input wire [(4'hf):(1'h0)] wire75;
  input wire signed [(4'hc):(1'h0)] wire74;
  input wire signed [(4'h9):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire145;
  wire signed [(3'h7):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire88;
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  assign y = {wire153,
                 wire145,
                 wire143,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire88,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg78 <= (^((~|{(wire76 == wire73), $signed(wire77)}) == (8'haa)));
      if ($signed(((~|wire74) ?
          $unsigned({(7'h44), wire75}) : {($signed(wire75) ?
                  {wire77} : $unsigned(reg78))})))
        begin
          reg79 <= (8'ha7);
        end
      else
        begin
          reg79 <= (-$unsigned($signed((~(|wire73)))));
          if ((!{$signed((&(wire75 ~^ wire77))), wire74[(1'h1):(1'h1)]}))
            begin
              reg80 <= $unsigned(wire73[(3'h7):(3'h4)]);
              reg81 <= wire77[(3'h6):(2'h2)];
            end
          else
            begin
              reg80 <= (~|reg80[(4'hb):(4'h8)]);
              reg81 <= $signed((wire73 ?
                  ({$signed(reg79), wire74} >= reg81) : $unsigned({reg81})));
              reg82 <= reg81[(1'h0):(1'h0)];
              reg83 <= wire77[(4'hd):(4'h9)];
              reg84 <= reg80[(4'ha):(1'h1)];
            end
          if (({reg81[(3'h7):(2'h2)], reg81[(4'ha):(3'h4)]} ?
              ({((reg78 ? (8'hac) : reg78) ? (8'hae) : reg81)} ?
                  $unsigned((~reg82)) : ((wire76[(4'h9):(4'h8)] < $signed(wire75)) >> wire73)) : (~&(^(wire76 ?
                  {(8'hb7)} : (wire76 > (8'hb0)))))))
            begin
              reg85 <= $signed(reg84[(3'h5):(1'h0)]);
            end
          else
            begin
              reg85 <= $unsigned(((^$signed((reg83 >> reg82))) != (($signed(reg84) ?
                      (wire74 < reg82) : (^~reg78)) ?
                  (~(wire73 ? reg79 : wire73)) : reg83)));
            end
          reg86 <= ($unsigned($signed({(reg81 ? (8'hb5) : reg81),
              $unsigned(reg78)})) != $signed({(reg79 ^ reg83),
              $unsigned((reg78 != reg85))}));
          reg87 <= $signed(reg83);
        end
    end
  assign wire88 = (reg78 ?
                      wire75 : (reg84 ^ (~|(reg81[(4'h9):(3'h6)] * $unsigned(wire77)))));
  always
    @(posedge clk) begin
      if (wire76)
        begin
          reg89 <= (^reg86[(3'h4):(3'h4)]);
          reg90 <= {wire76};
          reg91 <= wire74[(2'h2):(2'h2)];
        end
      else
        begin
          reg89 <= $unsigned($signed($unsigned((8'h9e))));
        end
      reg92 <= {(reg90 ~^ $signed(reg81[(4'hd):(4'ha)]))};
      reg93 <= ((^~(^reg92)) ?
          reg92 : (($unsigned((reg89 ?
              reg80 : wire76)) != ((reg82 - wire73) ^~ {wire73,
              reg86})) && $signed($unsigned(reg81[(1'h0):(1'h0)]))));
      reg94 <= ($signed(($signed((~^reg82)) ?
          (~^(wire77 ?
              reg84 : wire73)) : reg93[(3'h4):(1'h0)])) >= (~^(&(7'h44))));
    end
  assign wire95 = ((&reg87) | reg83);
  assign wire96 = (^~reg83[(3'h7):(2'h2)]);
  assign wire97 = (~&wire73);
  assign wire98 = reg94[(3'h6):(2'h2)];
  assign wire99 = reg91[(2'h3):(2'h3)];
  assign wire100 = (reg80 >= $signed($unsigned($signed((wire99 >>> (7'h43))))));
  assign wire101 = (wire100[(4'hb):(4'h8)] ?
                       (-$unsigned(((wire74 ? reg85 : reg82) ?
                           ((8'hba) > wire97) : $unsigned(reg79)))) : {(^~(^(8'hbc)))});
  assign wire102 = ($signed(($signed($unsigned(wire95)) ?
                           (8'haa) : ((reg87 ?
                               reg82 : reg93) & $signed(wire100)))) ?
                       ((-reg84) ?
                           ($signed((reg92 < reg94)) ?
                               (^wire88) : (~^$signed(reg90))) : $unsigned(reg78)) : (wire74 < ((&wire101) ?
                           reg93[(2'h3):(2'h3)] : $unsigned($unsigned(reg93)))));
  always
    @(posedge clk) begin
      if ($unsigned((reg89[(1'h1):(1'h0)] ?
          $signed($signed($signed(wire100))) : $unsigned($signed($signed((8'hb8)))))))
        begin
          reg103 <= (wire99 ? reg90 : wire73[(4'h9):(3'h5)]);
          reg104 <= reg78[(2'h3):(1'h0)];
          reg105 <= ({((^~(wire95 ? reg103 : wire98)) ?
                      $unsigned($unsigned(reg94)) : {(reg83 + (8'hb2))})} ?
              wire88[(2'h3):(1'h1)] : ($signed(wire98[(3'h4):(1'h1)]) ?
                  ($signed($signed(wire96)) >>> {wire98[(2'h2):(2'h2)]}) : $signed($unsigned((|wire76)))));
          if (reg78[(3'h6):(3'h4)])
            begin
              reg106 <= {$signed((($unsigned(reg93) << reg81) ?
                      ((reg94 ^~ wire88) ?
                          ((8'hb5) ?
                              (8'hb5) : wire100) : (+reg80)) : reg105[(3'h7):(3'h7)]))};
            end
          else
            begin
              reg106 <= $unsigned(((8'hae) ?
                  ((!(^~reg103)) ~^ $signed({reg83,
                      wire74})) : (&$unsigned((reg106 - reg80)))));
              reg107 <= $signed(reg89[(1'h1):(1'h0)]);
              reg108 <= (((!$signed($unsigned(reg92))) <= wire97) <<< wire77);
              reg109 <= (7'h43);
            end
        end
      else
        begin
          reg103 <= (|(reg92 ?
              $signed(((wire101 ? wire100 : wire95) ?
                  {(8'haf)} : (wire76 <<< reg91))) : (-$unsigned((&reg108)))));
        end
      reg110 <= (!(|wire75));
    end
  always
    @(posedge clk) begin
      if ({$signed((^~reg93[(2'h2):(1'h1)])),
          $unsigned(($signed((reg89 ~^ wire99)) ^ wire77))})
        begin
          reg111 <= (wire95 ?
              ((8'hb4) * $signed(wire96)) : $signed((reg87 ?
                  ((wire76 <<< reg82) < (^wire97)) : $unsigned((|reg92)))));
          reg112 <= wire97;
          if ({$unsigned($signed((~|(~&reg78))))})
            begin
              reg113 <= (|({$unsigned($signed(reg89))} ?
                  reg91 : {($unsigned(reg86) ? (reg82 > wire96) : reg81)}));
              reg114 <= (|reg79[(1'h0):(1'h0)]);
              reg115 <= {(|{$unsigned(reg83)}),
                  {(^~$signed($unsigned((8'haf))))}};
            end
          else
            begin
              reg113 <= $signed($signed((reg86[(4'hc):(3'h7)] ?
                  reg115 : $unsigned((~&wire88)))));
              reg114 <= reg84[(2'h3):(2'h3)];
              reg115 <= wire99[(2'h2):(1'h0)];
              reg116 <= ((reg114 ?
                  $unsigned(reg114[(2'h2):(2'h2)]) : (({reg84} && (-wire100)) ?
                      (|(wire102 ? wire74 : wire74)) : ((wire99 ^ reg107) ?
                          (reg86 ?
                              reg114 : reg93) : $signed(reg83)))) | ($signed(((^reg112) ?
                      (8'h9d) : (&reg113))) ?
                  reg103[(4'ha):(3'h7)] : reg83));
              reg117 <= (($signed($signed(reg104[(4'hc):(2'h3)])) > {(8'hb4)}) ?
                  ($unsigned(reg110[(2'h2):(1'h0)]) >>> $signed((|(reg83 ?
                      reg109 : (8'h9f))))) : {wire95[(4'h8):(3'h7)]});
            end
          reg118 <= {(~$unsigned((reg113[(1'h1):(1'h0)] ?
                  reg109 : $signed((7'h44))))),
              (|$signed(((wire98 ? reg84 : wire95) ?
                  $signed(reg110) : $unsigned(reg109))))};
          reg119 <= $signed(((reg111 ? reg109[(2'h2):(1'h1)] : reg84) ?
              $unsigned(((reg108 ?
                  reg108 : reg115) >>> (reg85 < (8'hac)))) : $unsigned(reg115[(5'h11):(1'h0)])));
        end
      else
        begin
          if (reg84[(3'h6):(2'h2)])
            begin
              reg111 <= reg108[(1'h1):(1'h1)];
              reg112 <= (~&$signed($signed(((reg80 ?
                  (8'hac) : wire99) + (wire76 >= reg103)))));
              reg113 <= $signed(reg113);
              reg114 <= reg115[(2'h3):(1'h1)];
              reg115 <= $signed(reg107[(1'h0):(1'h0)]);
            end
          else
            begin
              reg111 <= $unsigned($unsigned($signed(((wire96 ?
                  reg92 : reg90) <<< (reg109 ? reg86 : reg109)))));
              reg112 <= $signed($signed((((~wire77) ?
                      $signed(reg118) : (wire101 - (8'ha7))) ?
                  (reg110[(1'h0):(1'h0)] ?
                      reg80[(3'h5):(1'h0)] : (wire76 ?
                          (8'hab) : reg82)) : wire88)));
              reg113 <= (reg81[(3'h6):(2'h2)] <<< $signed((wire96[(4'h8):(3'h6)] + $signed((reg81 || wire88)))));
              reg114 <= reg91;
              reg115 <= (~|$unsigned(wire96));
            end
          if ((reg106 >> {$signed((&$signed(reg89))),
              $unsigned($signed($unsigned(wire76)))}))
            begin
              reg116 <= reg114[(5'h11):(4'hf)];
              reg117 <= $unsigned((!$unsigned($unsigned({reg111, reg80}))));
            end
          else
            begin
              reg116 <= {reg103[(3'h4):(3'h4)]};
              reg117 <= (reg105[(4'hc):(3'h4)] ?
                  (reg119 ?
                      {reg116[(2'h3):(2'h3)],
                          (8'ha0)} : (~^(reg106[(3'h4):(1'h0)] ?
                          $signed(wire75) : (reg111 != wire101)))) : reg117[(4'ha):(4'h9)]);
              reg118 <= $unsigned((reg89 | $signed((reg110 ?
                  (reg114 ? (8'ha8) : reg114) : $unsigned((8'had))))));
              reg119 <= wire101[(4'he):(4'he)];
            end
          reg120 <= $unsigned(wire77);
          reg121 <= $signed(reg109);
        end
    end
  always
    @(posedge clk) begin
      if (wire96[(2'h3):(1'h0)])
        begin
          reg122 <= wire96;
        end
      else
        begin
          reg122 <= (!(~^{($signed(reg92) ?
                  (+reg79) : ((8'ha6) ? reg110 : reg78))}));
          reg123 <= ((8'h9c) ? (|$signed(reg104[(2'h2):(2'h2)])) : reg84);
          if ((~|$unsigned((reg123[(4'hb):(4'ha)] ^~ reg108))))
            begin
              reg124 <= $signed((wire98[(3'h6):(2'h2)] ?
                  (reg123[(3'h6):(2'h3)] & ((reg110 == reg84) ?
                      (-reg103) : (~|wire77))) : reg108[(1'h1):(1'h0)]));
              reg125 <= {$unsigned($signed($signed(reg85[(5'h14):(2'h2)])))};
            end
          else
            begin
              reg124 <= reg86[(1'h1):(1'h0)];
              reg125 <= wire73[(3'h6):(1'h1)];
              reg126 <= ({(reg83[(3'h5):(1'h0)] ?
                          reg115[(5'h11):(1'h1)] : ((wire88 ? wire88 : reg121) ?
                              $signed(reg82) : {reg103}))} ?
                  ({(wire74[(3'h7):(3'h6)] << reg104),
                          $unsigned($signed(reg83))} ?
                      $unsigned({$signed(reg103)}) : ($signed(wire76[(1'h0):(1'h0)]) ?
                          ({reg94} ?
                              reg115[(1'h0):(1'h0)] : (8'hbc)) : ((reg103 - reg92) * (|reg83)))) : {(^~($unsigned(reg118) ?
                          (reg82 ~^ wire73) : $unsigned((8'hbd))))});
            end
          if (((8'hb3) ?
              $signed((reg104[(4'hd):(4'hc)] ?
                  reg122[(1'h0):(1'h0)] : (wire97[(4'ha):(4'h8)] <<< $unsigned(reg110)))) : (wire73[(2'h3):(2'h2)] + $unsigned({(~&reg113),
                  ((8'hab) ? reg83 : reg93)}))))
            begin
              reg127 <= $signed(({(reg89[(2'h3):(2'h2)] ?
                          (reg91 >>> wire75) : (|wire98))} ?
                  (($unsigned(wire75) ?
                          reg103[(1'h1):(1'h1)] : {reg109, wire99}) ?
                      $unsigned($unsigned(reg82)) : (reg89[(1'h1):(1'h0)] <<< ((8'hab) ^~ (7'h44)))) : $signed($unsigned((reg120 ~^ reg125)))));
              reg128 <= (~&(+reg83[(1'h1):(1'h0)]));
            end
          else
            begin
              reg127 <= (($unsigned(wire97[(3'h5):(2'h2)]) ~^ reg110) ?
                  reg120[(4'ha):(3'h5)] : $unsigned((~&(|reg109[(2'h3):(1'h0)]))));
              reg128 <= (($unsigned((reg126[(1'h1):(1'h1)] ^ {(8'hbc)})) != $unsigned({((8'hae) ?
                      reg113 : reg109)})) <= ((~^$unsigned(reg121[(3'h7):(2'h2)])) ?
                  wire98[(3'h4):(1'h0)] : ({$unsigned((8'hb8)),
                      (reg104 ? (8'ha6) : wire100)} << reg119[(2'h2):(1'h0)])));
            end
        end
      reg129 <= reg128;
      reg130 <= {$signed(reg129),
          $signed(((^$unsigned(reg90)) <= reg111[(3'h7):(3'h5)]))};
    end
  module131 #() modinst144 (wire143, clk, reg92, reg87, reg130, reg78);
  assign wire145 = $unsigned($signed($unsigned($signed((reg115 ?
                       reg107 : reg91)))));
  always
    @(posedge clk) begin
      reg146 <= ((8'hb4) ?
          $signed($unsigned($unsigned($unsigned((8'hb5))))) : $signed({$signed(reg124),
              (~$unsigned(reg120))}));
      reg147 <= $signed(reg93[(3'h5):(2'h2)]);
      if (($signed(($signed($unsigned(reg147)) * (|reg106))) + (&(^$unsigned(wire101)))))
        begin
          reg148 <= ((^reg91[(3'h5):(1'h1)]) == ($signed(reg125) >> ($signed($unsigned(reg109)) ^ $signed(wire145))));
          if (wire99)
            begin
              reg149 <= reg93[(4'hb):(2'h2)];
              reg150 <= wire75[(2'h2):(1'h0)];
            end
          else
            begin
              reg149 <= ((!wire99) == $signed((reg148[(4'he):(4'hb)] ?
                  (((8'ha4) < reg118) ?
                      {reg126} : {wire145,
                          reg115}) : $signed((reg149 < wire96)))));
            end
          reg151 <= (~|wire74[(3'h7):(2'h3)]);
          reg152 <= {reg128[(4'h9):(1'h0)],
              ($unsigned((((8'hb4) >= reg86) ^ $unsigned((8'ha7)))) ~^ ((8'hae) + {(wire73 != wire74)}))};
        end
      else
        begin
          reg148 <= $unsigned(($signed({reg109[(1'h0):(1'h0)]}) == ($unsigned($signed(reg105)) ?
              reg116 : $unsigned((reg110 - reg78)))));
        end
    end
  assign wire153 = $unsigned($signed(reg146));
endmodule

module module7
#(parameter param40 = ((~((8'hb1) <<< ((&(8'had)) ? (-(8'hae)) : ((8'haf) ? (8'ha1) : (8'hab))))) ? (((~|((7'h44) ? (8'ha5) : (7'h40))) | ((+(8'hb0)) >>> (^(8'ha2)))) > ((~&((8'h9c) ? (8'hac) : (8'h9e))) ? (8'hbd) : (((7'h40) + (7'h43)) ? ((8'ha9) ? (8'hb9) : (8'hbd)) : (7'h44)))) : ((^(((8'hbf) ^~ (7'h43)) ? {(8'hb5), (8'hae)} : ((8'ha2) ? (8'hb1) : (8'hab)))) || (~^(-((8'had) ? (7'h40) : (8'had)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire12;
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire39,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire12,
                 reg38,
                 reg37,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire12 = ((~&$signed(((+wire11) ^~ (|wire8)))) < $unsigned($unsigned(wire9)));
  always
    @(posedge clk) begin
      reg13 <= $signed((($signed($unsigned(wire10)) ?
          ((^(8'h9d)) ?
              (8'hbb) : {wire10}) : (~&wire8[(4'ha):(2'h2)])) | {((|(8'ha8)) ?
              (wire8 ? wire11 : wire11) : ((8'hb3) && wire10))}));
      reg14 <= (~^$signed(wire11[(5'h11):(3'h7)]));
      if (reg14)
        begin
          if (((|(~|(reg13[(1'h1):(1'h1)] ?
              $unsigned(wire8) : (+wire8)))) == wire12))
            begin
              reg15 <= $unsigned($signed(reg14[(3'h7):(3'h4)]));
            end
          else
            begin
              reg15 <= $unsigned((^~wire10[(2'h3):(1'h0)]));
              reg16 <= $unsigned({(~&wire10)});
            end
          reg17 <= reg14[(3'h5):(2'h2)];
          reg18 <= ($signed(((~^reg15[(3'h6):(2'h2)]) ?
              (8'hb9) : (wire8[(1'h0):(1'h0)] <= $signed(reg15)))) | ($signed($unsigned({reg13,
                  (8'ha9)})) ?
              $unsigned(reg17) : reg16[(2'h3):(1'h1)]));
          reg19 <= $signed($unsigned($signed($signed(reg14))));
        end
      else
        begin
          reg15 <= $unsigned($signed(((^~reg15) ?
              {(reg14 >>> wire11)} : $signed($unsigned(reg18)))));
          reg16 <= {$unsigned(((7'h42) ? (|reg14) : reg17)),
              $unsigned((8'ha9))};
          if ((~|reg16[(3'h5):(1'h0)]))
            begin
              reg17 <= reg19;
              reg18 <= reg18;
              reg19 <= reg16;
            end
          else
            begin
              reg17 <= reg15;
              reg18 <= ($unsigned((&reg16[(3'h6):(3'h5)])) != {{$signed((reg19 * (8'ha5)))}});
            end
          if (($signed(wire10[(3'h5):(1'h0)]) ?
              ($signed({(+wire11),
                  $unsigned(reg13)}) + reg19) : $unsigned(((reg14[(4'hf):(3'h6)] ?
                      reg13[(4'h8):(2'h3)] : (reg19 && reg15)) ?
                  reg19 : (&reg19)))))
            begin
              reg20 <= {{$signed((^$unsigned(reg14)))},
                  $signed((^((!wire8) ?
                      $unsigned(wire11) : (reg17 ? reg18 : reg15))))};
              reg21 <= $unsigned($signed(wire10));
              reg22 <= reg17;
              reg23 <= ({(|$signed($signed(wire10)))} ?
                  $unsigned($signed((reg22[(2'h2):(2'h2)] & (wire12 ?
                      reg17 : (8'ha8))))) : (8'h9f));
            end
          else
            begin
              reg20 <= (reg14[(3'h4):(1'h1)] ?
                  wire11 : ((($signed(reg15) ?
                          (wire9 ?
                              reg15 : (8'hbf)) : ((8'hbd) * reg23)) + $signed($unsigned(reg14))) ?
                      ($signed((|reg17)) ?
                          reg23 : $unsigned($unsigned(reg21))) : $unsigned((~|reg13))));
              reg21 <= ($unsigned($unsigned((-$signed(reg14)))) ?
                  {reg22, $signed(reg18)} : (~&(~($signed(reg14) || (8'ha2)))));
              reg22 <= (!$signed((~&reg15)));
              reg23 <= ($unsigned(reg22[(3'h6):(2'h3)]) ?
                  (-(-(((8'ha9) ? wire9 : reg20) ?
                      $signed((8'haa)) : reg15[(1'h0):(1'h0)]))) : $signed(((^(reg18 ?
                      reg20 : wire12)) + reg19)));
              reg24 <= $unsigned(((reg20 + $signed(wire11)) && (reg13[(1'h1):(1'h1)] ?
                  ((reg19 && (8'hb9)) ?
                      (wire9 ?
                          wire9 : (8'h9d)) : (reg18 <<< wire9)) : (((8'hb7) < (8'haa)) ?
                      (reg21 > (8'hbc)) : $unsigned(reg16)))));
            end
        end
      if ($signed($unsigned(wire10[(4'h9):(4'h8)])))
        begin
          reg25 <= $signed(((((reg18 ? reg13 : wire11) ?
              $unsigned(reg19) : {(8'h9c),
                  wire8}) & reg16[(3'h6):(1'h0)]) <<< $signed($unsigned((wire10 ?
              (8'hb4) : reg16)))));
          reg26 <= wire8[(3'h7):(3'h5)];
          if ({{((((8'ha9) * reg24) ?
                      (reg15 ? reg19 : wire10) : (reg21 ?
                          wire10 : wire10)) <<< {reg17}),
                  reg21[(1'h0):(1'h0)]},
              $signed((((reg21 ? wire10 : reg16) ?
                      $signed(reg16) : (reg18 != reg26)) ?
                  (-((7'h41) ? wire9 : reg13)) : $signed((wire9 ?
                      reg13 : reg24))))})
            begin
              reg27 <= (reg24 ? reg15 : {(reg24 > (^{wire11}))});
              reg28 <= ((((~^(^~reg21)) >> reg25) ?
                      $signed(($signed(reg24) <<< (reg23 >= reg25))) : (^$signed({wire10,
                          reg23}))) ?
                  $unsigned(($unsigned(reg19) <= ($unsigned(reg24) ?
                      (wire12 - reg21) : (wire11 ?
                          (8'hbf) : reg16)))) : ((-(~&reg22)) == $signed($unsigned((reg26 == reg20)))));
              reg29 <= reg24;
              reg30 <= (7'h40);
            end
          else
            begin
              reg27 <= {{$signed(reg25[(1'h0):(1'h0)]),
                      (wire9 ?
                          ($signed((8'ha9)) <= $signed((8'hba))) : $signed($unsigned(reg16)))}};
              reg28 <= $signed(((&((wire11 & reg13) ~^ $signed(wire11))) ?
                  $signed(reg28[(2'h2):(2'h2)]) : (-{$signed(reg17),
                      (^~reg23)})));
              reg29 <= reg19;
            end
        end
      else
        begin
          reg25 <= ($unsigned($signed($signed($signed(reg27)))) && $unsigned((wire8 - (~^(+reg22)))));
        end
      reg31 <= (reg23[(3'h4):(2'h2)] ? (wire12 == reg16) : (8'hb0));
    end
  assign wire32 = ((reg13[(5'h12):(5'h11)] ?
                      $unsigned($unsigned(((8'had) >= (8'hac)))) : wire12[(4'ha):(4'h8)]) - {(&$unsigned($signed(wire10)))});
  assign wire33 = $signed(($unsigned(({reg26, wire10} ?
                          ((8'hb9) < (8'hae)) : $signed(reg22))) ?
                      (8'ha2) : wire10[(4'h9):(2'h3)]));
  assign wire34 = {$unsigned($unsigned((((8'hb0) ? (8'ha3) : reg27) ?
                          (reg30 ? reg31 : reg20) : reg26[(3'h5):(1'h1)])))};
  always
    @(posedge clk) begin
      reg35 <= wire9[(2'h2):(1'h0)];
    end
  assign wire36 = reg21[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg37 <= (((($signed(reg29) * $signed(reg24)) != ((^~(8'ha0)) ?
              wire12 : reg13)) * (($signed(reg22) ?
              $signed((8'hba)) : (8'ha0)) && ($signed(reg26) >> reg30))) ?
          $signed((|$unsigned((~|reg19)))) : (&(~&((|reg25) ~^ wire34[(5'h14):(5'h10)]))));
      reg38 <= $unsigned($signed((~{wire8[(3'h5):(1'h0)]})));
    end
  assign wire39 = $signed((+(reg23[(3'h5):(2'h2)] >>> reg20)));
endmodule

module module131
#(parameter param141 = (|{((-((8'had) < (8'hb5))) ? {(~(8'h9d)), ((8'ha5) << (8'haa))} : (~|(~&(8'ha4)))), ({((8'hb2) | (8'hb8)), ((8'hb7) * (8'hbd))} ? (8'h9e) : (((8'ha3) ? (8'ha4) : (8'ha6)) ? {(8'haf)} : ((8'hbc) || (8'ha8))))}), 
parameter param142 = (param141 + (+(((param141 ? param141 : param141) ? (~^param141) : param141) * {(param141 <= param141)}))))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire135;
  input wire signed [(4'h9):(1'h0)] wire134;
  input wire signed [(2'h3):(1'h0)] wire133;
  input wire signed [(3'h5):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  assign y = {wire140, wire138, wire137, wire136, reg139, (1'h0)};
  assign wire136 = {wire135};
  assign wire137 = $unsigned($signed($signed((^~$unsigned(wire135)))));
  assign wire138 = {((~&$unsigned($signed(wire132))) ?
                           wire137[(4'h9):(1'h0)] : $signed($signed((+wire133))))};
  always
    @(posedge clk) begin
      reg139 <= $unsigned($signed(wire138));
    end
  assign wire140 = {$signed($signed($signed(reg139)))};
endmodule
