module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire152;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(3'h5):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  assign y = {wire152,
                 wire134,
                 wire58,
                 wire56,
                 reg151,
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
                 (1'h0)};
  module5 #() modinst57 (wire56, clk, wire3, wire2, wire0, wire4, wire1);
  assign wire58 = (($signed(($unsigned(wire2) ?
                          (wire56 | (8'hb8)) : wire3[(2'h2):(1'h1)])) < (!(wire3 ^ $unsigned((8'hab))))) ?
                      wire0[(1'h0):(1'h0)] : (wire0[(3'h6):(1'h0)] != (wire1[(4'hc):(4'hb)] == (~&(wire3 >> wire1)))));
  module59 #() modinst135 (wire134, clk, wire58, wire56, wire3, wire1);
  always
    @(posedge clk) begin
      reg136 <= wire134[(4'hc):(3'h7)];
      reg137 <= wire134[(4'h8):(3'h7)];
      if ($signed($signed((-wire0))))
        begin
          if ($unsigned((~&$unsigned(({reg137, wire1} ?
              $unsigned(wire58) : $signed(wire58))))))
            begin
              reg138 <= {$signed(wire0[(5'h13):(2'h3)]),
                  ((wire4 ~^ (~|(wire58 >= wire56))) ?
                      (~|wire1) : $signed($signed(wire58[(4'h9):(3'h5)])))};
              reg139 <= (^~(~(($unsigned(wire1) ?
                  wire2[(4'hb):(3'h5)] : (wire134 ?
                      wire4 : wire4)) - $unsigned($signed(reg138)))));
              reg140 <= ((({wire3[(3'h7):(3'h6)]} < $signed(((8'hb7) ?
                      (8'haf) : (8'haa)))) ?
                  (reg136[(2'h2):(1'h1)] ?
                      $unsigned((8'hb5)) : $signed($unsigned(wire4))) : (~^$unsigned(((7'h44) - wire3)))) || wire134);
            end
          else
            begin
              reg138 <= ((~|{wire0}) ?
                  $signed($signed(wire56[(3'h4):(2'h2)])) : reg140[(3'h7):(3'h5)]);
              reg139 <= (~^((wire4[(2'h2):(2'h2)] >> (reg136 ?
                      $signed(wire2) : wire56[(4'hc):(4'h8)])) ?
                  wire2 : $unsigned($unsigned(wire134))));
              reg140 <= ((($unsigned(((8'hb2) ? reg140 : wire58)) < (|wire1)) ?
                  wire4 : (reg137 ?
                      ($unsigned(reg138) ?
                          $unsigned(wire0) : $signed(wire1)) : wire2[(2'h2):(1'h1)])) ~^ wire4);
              reg141 <= $signed(((reg136[(1'h0):(1'h0)] ?
                  (&wire3) : (-reg139[(3'h5):(1'h0)])) | (((&wire2) | (wire0 ?
                      reg137 : reg139)) ?
                  $signed(wire0) : wire0[(4'he):(3'h4)])));
            end
          reg142 <= $unsigned((wire4 ?
              reg138[(5'h12):(4'he)] : $signed((&(~|reg138)))));
        end
      else
        begin
          reg138 <= ($signed((~&{$signed(wire0)})) ?
              $signed(wire4[(3'h4):(1'h0)]) : {$unsigned({wire4,
                      {(8'had), reg138}}),
                  $signed((^$unsigned((8'h9d))))});
          reg139 <= wire4[(3'h6):(2'h2)];
          if ($signed((~&wire1[(3'h4):(2'h3)])))
            begin
              reg140 <= reg137[(4'hd):(3'h7)];
              reg141 <= ({$signed((wire3 && (reg136 ? wire134 : reg141))),
                  $unsigned((8'haf))} << (!$unsigned(($signed(wire58) != (~^reg141)))));
              reg142 <= ($unsigned({((wire2 ? wire0 : wire1) >>> (~&wire4)),
                      (wire58[(3'h4):(1'h1)] || {wire0, reg139})}) ?
                  ($unsigned(({(8'ha0), wire1} ?
                      $unsigned(wire134) : $unsigned(wire4))) * (reg142[(1'h0):(1'h0)] ^~ wire2)) : (~^(^(-$signed(wire58)))));
              reg143 <= (~wire4);
              reg144 <= (+(^~((reg139[(4'hd):(4'hc)] ?
                  wire1[(4'h8):(4'h8)] : $signed(wire134)) == wire1)));
            end
          else
            begin
              reg140 <= $unsigned(($signed($signed(reg143)) ?
                  wire134[(5'h11):(2'h2)] : $unsigned(($signed(reg137) < ((8'hba) ?
                      wire3 : reg141)))));
              reg141 <= ((($unsigned((-(8'had))) ?
                      {$unsigned(wire4),
                          (wire56 >= wire56)} : (wire56[(4'hd):(3'h5)] ?
                          (reg138 < wire134) : reg136[(1'h1):(1'h1)])) ?
                  ({(8'ha4)} >>> wire3[(4'hd):(2'h3)]) : (~^((reg140 ?
                          reg136 : wire1) ?
                      reg136[(1'h0):(1'h0)] : reg140[(1'h1):(1'h1)]))) | wire0);
              reg142 <= $signed(wire1);
              reg143 <= (reg141[(3'h4):(2'h2)] != (+($unsigned((reg143 != wire3)) ?
                  ((7'h44) ?
                      (wire56 + reg144) : wire3[(5'h15):(5'h15)]) : wire1[(4'h8):(4'h8)])));
            end
          reg145 <= $signed(($signed(((wire4 >> (8'hbf)) * {reg140})) ?
              $signed(((wire3 ? wire56 : reg139) ?
                  reg143[(3'h5):(3'h5)] : reg143)) : (~(^~reg144[(1'h0):(1'h0)]))));
          if ((((&(wire2 <= wire2)) ?
                  wire3[(4'hf):(4'ha)] : $signed($unsigned({wire58, reg136}))) ?
              (~&(!(+reg137[(4'h9):(2'h2)]))) : wire134))
            begin
              reg146 <= $unsigned($signed(((wire134[(5'h10):(4'hb)] ?
                  $signed(reg142) : wire56[(4'h9):(2'h3)]) == $unsigned({reg138}))));
              reg147 <= reg146;
              reg148 <= (($signed({(wire1 > reg140)}) ?
                      (wire1[(5'h11):(5'h11)] ?
                          $unsigned(reg144) : (~|$unsigned(wire2))) : ((-(reg139 | reg136)) >>> $signed({(8'ha3),
                          reg141}))) ?
                  $unsigned((({(8'hae), wire3} || $unsigned(reg140)) ?
                      ({wire3, wire2} >>> $unsigned(wire1)) : ({wire1, wire4} ?
                          {wire0} : $signed(wire56)))) : $signed($signed((^reg142))));
              reg149 <= $signed(((($unsigned(reg147) ?
                      reg138[(3'h6):(3'h6)] : reg136) ?
                  wire56 : $unsigned($unsigned(wire58))) <<< (((8'hab) || {wire4,
                      (7'h42)}) ?
                  {reg143} : wire58)));
              reg150 <= (reg139[(2'h2):(1'h1)] ?
                  reg139[(2'h2):(1'h0)] : reg149[(1'h1):(1'h1)]);
            end
          else
            begin
              reg146 <= wire134;
              reg147 <= {$unsigned((|$unsigned({(7'h42), (8'hb8)}))),
                  ($signed(wire4[(3'h4):(1'h1)]) ^ (-(~&((8'ha5) ?
                      (8'ha6) : reg144))))};
              reg148 <= (!reg150[(3'h7):(2'h3)]);
            end
        end
      reg151 <= $unsigned($unsigned(reg142));
    end
  assign wire152 = ({reg150[(4'hb):(2'h3)]} ?
                       reg139[(3'h6):(3'h6)] : reg151[(4'h9):(2'h2)]);
endmodule

module module59  (y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h323):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire signed [(4'he):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire102,
                 wire101,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 reg90,
                 reg89,
                 reg88,
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
                 (1'h0)};
  assign wire64 = wire61[(2'h3):(1'h1)];
  assign wire65 = (&wire62);
  assign wire66 = (((((wire63 ? wire64 : wire63) ?
                          $signed(wire65) : wire63) ~^ ((8'h9d) ?
                          (wire60 ?
                              wire62 : (8'hba)) : (|(8'h9e)))) != (8'haf)) ?
                      wire61 : {(+(wire61 | $unsigned(wire65)))});
  assign wire67 = {(~|wire62[(3'h6):(2'h2)]), wire60[(4'ha):(4'h8)]};
  always
    @(posedge clk) begin
      reg68 <= wire61;
      reg69 <= (~&$unsigned((~^({reg68, wire64} ?
          (^wire66) : wire65[(3'h6):(2'h3)]))));
      if ((wire67 ? wire67 : wire65[(5'h10):(2'h2)]))
        begin
          reg70 <= wire66[(2'h3):(2'h3)];
          reg71 <= wire67;
          reg72 <= (wire60 ?
              (^~reg69) : ((((wire66 ? wire61 : wire63) ?
                      $unsigned(wire60) : reg70[(3'h4):(2'h2)]) ?
                  $signed(((8'ha2) ? reg69 : wire64)) : {((7'h40) ?
                          wire64 : wire63),
                      (!reg69)}) >>> {$unsigned((~|wire64))}));
        end
      else
        begin
          reg70 <= (|wire67);
          if ($signed($unsigned((($unsigned(reg71) ?
              (wire61 <<< reg68) : $unsigned(wire60)) << $signed($signed(wire64))))))
            begin
              reg71 <= ((reg71[(2'h2):(1'h1)] ?
                      wire64 : $signed($signed((7'h42)))) ?
                  ($unsigned((+$unsigned(wire64))) ?
                      ($unsigned(reg68) ?
                          $signed((8'ha7)) : $unsigned($unsigned(wire66))) : $signed({wire65[(2'h2):(2'h2)],
                          $unsigned(wire61)})) : $signed(wire61[(1'h0):(1'h0)]));
              reg72 <= wire67[(4'hb):(3'h6)];
            end
          else
            begin
              reg71 <= (wire60[(4'ha):(4'ha)] ?
                  wire66 : {$unsigned($signed(reg72[(4'ha):(4'h8)]))});
              reg72 <= wire64;
              reg73 <= (reg70 | (|(~$unsigned({reg68}))));
              reg74 <= $unsigned((wire65 >>> (reg69 & $signed((wire66 >= reg68)))));
            end
        end
      if ({{$unsigned((|(wire63 >= (8'ha0)))),
              ((8'hb9) ?
                  (wire65 ? (|(7'h44)) : {(8'ha2)}) : (&$signed(wire67)))},
          $signed(reg71)})
        begin
          if (reg71[(3'h4):(2'h3)])
            begin
              reg75 <= reg72;
            end
          else
            begin
              reg75 <= $unsigned((8'hb1));
              reg76 <= ({reg69[(3'h6):(2'h3)]} ?
                  {wire60,
                      $unsigned(reg72[(2'h3):(1'h1)])} : $signed(wire61[(3'h5):(2'h2)]));
              reg77 <= $signed($unsigned(wire62));
            end
        end
      else
        begin
          reg75 <= (((reg68 | wire67) ^~ $signed($unsigned($unsigned((7'h44))))) <= ($unsigned(($signed(reg70) < ((8'h9d) < reg72))) >> {(wire61 ^~ reg71[(4'hc):(3'h5)])}));
          reg76 <= $unsigned($signed((((reg75 ? (8'hae) : (8'ha5)) - reg69) ?
              reg68[(4'hc):(1'h1)] : ((reg74 ?
                  (8'hbe) : wire62) != (^wire60)))));
          if (((8'ha1) ?
              (((^(wire65 + wire65)) ?
                      $unsigned(reg73) : ((wire66 & reg72) >> $signed(reg77))) ?
                  $signed(reg77[(3'h5):(1'h1)]) : wire64[(3'h5):(3'h5)]) : {$unsigned((wire64 ?
                      reg70 : wire64[(3'h6):(1'h1)]))}))
            begin
              reg77 <= (~|$signed((wire61 ?
                  {wire66, (+reg74)} : reg70[(4'hb):(4'hb)])));
              reg78 <= (reg74 * {wire66});
            end
          else
            begin
              reg77 <= reg72[(4'h9):(1'h1)];
              reg78 <= ($signed($signed(((reg75 | reg73) ?
                  (^reg76) : $signed(reg69)))) + ($unsigned({(~|wire64)}) != reg77[(1'h1):(1'h1)]));
              reg79 <= {$unsigned(reg75[(2'h2):(2'h2)]), (7'h44)};
            end
        end
      reg80 <= {$signed((+((wire61 * reg79) >>> (reg76 & reg74)))),
          wire66[(1'h1):(1'h1)]};
    end
  always
    @(posedge clk) begin
      if ((reg75[(2'h3):(1'h1)] >> {($unsigned(((8'ha7) ? reg75 : reg72)) ?
              $signed((reg78 <= reg76)) : wire60)}))
        begin
          reg81 <= {$signed({({reg73} ?
                      $signed(reg74) : (reg77 ? reg70 : reg74))}),
              (((((8'ha9) ? (8'ha6) : reg72) ?
                      (wire65 ?
                          (7'h41) : reg69) : (wire61 + wire62)) ^ wire61) ?
                  wire66[(1'h0):(1'h0)] : reg74)};
          reg82 <= $signed({{$unsigned(reg77[(3'h6):(1'h1)]),
                  wire67[(3'h7):(1'h0)]}});
          reg83 <= reg78[(2'h3):(1'h0)];
          reg84 <= ((^~reg78) ?
              ((~&(^~{reg68, wire61})) | ((reg68 ?
                      (reg82 ? reg73 : reg76) : reg79) ?
                  ($unsigned(reg78) * (!(8'h9e))) : reg79)) : $signed($signed($signed($unsigned(reg73)))));
          reg85 <= reg71[(4'h8):(3'h6)];
        end
      else
        begin
          if ((wire66 ? $signed(wire66[(2'h3):(2'h2)]) : $signed(wire61)))
            begin
              reg81 <= ($unsigned(((~|{wire66, reg83}) ?
                  wire61[(1'h1):(1'h1)] : wire63)) < (reg79 ?
                  (&reg73) : (-(((8'ha4) ? reg69 : reg68) || {reg73}))));
              reg82 <= (!$signed(reg73[(3'h6):(2'h2)]));
              reg83 <= (reg83[(4'h8):(4'h8)] ?
                  reg74[(1'h1):(1'h1)] : (reg80[(3'h4):(3'h4)] ?
                      ((+(~&wire65)) > reg80[(3'h7):(2'h3)]) : reg81[(3'h7):(2'h3)]));
            end
          else
            begin
              reg81 <= ($unsigned((reg79[(3'h4):(3'h4)] ?
                      $signed((reg83 ? (8'hbf) : wire66)) : $signed(wire66))) ?
                  (($signed((wire62 + (8'hb7))) ?
                          ($unsigned(reg69) ?
                              (~&reg72) : reg83[(2'h3):(2'h2)]) : $signed($unsigned(reg68))) ?
                      ($signed(reg78[(1'h1):(1'h1)]) == $signed($signed(wire61))) : reg68) : ((~^reg72) & ((+wire60[(1'h1):(1'h0)]) ?
                      reg69[(2'h2):(1'h1)] : $signed(reg85))));
            end
          reg84 <= reg83;
          reg85 <= (reg77[(5'h11):(2'h3)] <<< (!$unsigned(($signed(reg73) ?
              $signed(wire65) : reg75))));
          reg86 <= (~^(({(8'hbb)} ^~ (!(&reg68))) ?
              reg73 : (|{((8'ha4) ? reg81 : (8'haa))})));
          if ($unsigned({(~^reg85)}))
            begin
              reg87 <= (((~^(~^$signed(reg75))) ?
                      reg77 : {reg70[(1'h1):(1'h1)],
                          (((8'hab) >= reg74) >> $unsigned(reg80))}) ?
                  wire60[(4'h9):(4'h9)] : (reg78[(2'h3):(2'h3)] ?
                      $signed((&(&reg77))) : $signed((+(reg82 ?
                          wire61 : reg79)))));
              reg88 <= (!((((!reg69) ^~ $unsigned(wire64)) <<< reg71[(1'h0):(1'h0)]) ?
                  reg72 : (reg68 ? reg70 : $unsigned($unsigned((8'hbf))))));
              reg89 <= reg85[(2'h2):(2'h2)];
              reg90 <= ((reg87 << $unsigned($unsigned((reg77 ?
                      reg88 : wire67)))) ?
                  $signed((^~wire60)) : $unsigned((reg76 ?
                      (+$signed(wire67)) : ($unsigned((8'hae)) * $unsigned(reg86)))));
              reg91 <= reg83[(5'h15):(5'h15)];
            end
          else
            begin
              reg87 <= reg81;
              reg88 <= ((wire62[(4'h9):(2'h2)] - (^~{wire62,
                      $signed(wire64)})) ?
                  (|reg74) : wire67);
            end
        end
      if ((8'hb8))
        begin
          reg92 <= ({$signed(reg79),
                  (((7'h42) < (reg80 & (8'h9f))) >> wire63[(1'h1):(1'h0)])} ?
              $unsigned($unsigned((reg70[(3'h7):(3'h6)] ?
                  $signed(wire60) : (8'hb0)))) : (|(8'haf)));
        end
      else
        begin
          reg92 <= $signed($unsigned(reg70[(3'h6):(1'h0)]));
          reg93 <= ($signed(reg75) >= ($signed($unsigned($signed(reg85))) ?
              $signed($signed((~(7'h40)))) : (reg82 ?
                  $unsigned(reg72) : reg77)));
          if ((($unsigned(({wire63} ? (~wire64) : $signed(reg82))) ?
              reg88[(3'h5):(3'h4)] : $unsigned(reg83)) + $signed(($signed(((8'ha3) >= wire60)) ?
              ((!(7'h42)) && (reg89 ? reg71 : reg76)) : $signed(reg90)))))
            begin
              reg94 <= reg72;
              reg95 <= (^~(({(reg74 >> reg90), {reg82, reg87}} ?
                  $signed($unsigned(reg84)) : wire60[(1'h0):(1'h0)]) ^~ $unsigned(wire63[(3'h6):(1'h1)])));
              reg96 <= $signed(((|$signed(reg81)) ?
                  $unsigned(wire62[(3'h4):(1'h1)]) : ((reg78[(3'h4):(2'h3)] ^ (^reg72)) ?
                      wire64[(2'h3):(2'h3)] : {reg95, (|reg87)})));
              reg97 <= ((~&(($unsigned((8'ha8)) << $unsigned(reg80)) >= $signed($unsigned(reg76)))) ?
                  reg80 : (&reg74[(4'hc):(4'ha)]));
            end
          else
            begin
              reg94 <= $unsigned(($signed(reg87[(2'h2):(2'h2)]) && ($unsigned($signed((8'ha8))) ?
                  {{wire67, reg71}, $signed((7'h42))} : $unsigned((reg96 ?
                      reg91 : reg70)))));
              reg95 <= $signed(reg77[(3'h4):(1'h0)]);
              reg96 <= reg92;
            end
          reg98 <= {(($signed(wire60) * {$unsigned(wire65), (~&reg91)}) ?
                  (^~$signed($signed(reg94))) : {(-{reg82}), $signed({reg83})}),
              wire65[(4'ha):(4'h9)]};
          reg99 <= (^~$signed({$unsigned($unsigned(reg85)),
              (~&$unsigned(reg89))}));
        end
      reg100 <= reg85;
    end
  assign wire101 = reg81;
  assign wire102 = ((~|$unsigned($signed(reg72))) ?
                       (^~$unsigned($signed((~|reg98)))) : $signed(reg71));
  always
    @(posedge clk) begin
      if ($unsigned((^reg88[(2'h2):(1'h0)])))
        begin
          reg103 <= (reg99 ?
              {{($unsigned(reg80) ~^ (-reg100))}} : $signed(($signed($signed(wire101)) - {(wire63 ?
                      (8'hbc) : reg90)})));
          reg104 <= ($signed(((reg95 ?
                  (reg100 ^ reg88) : reg75) + $unsigned(reg68))) ?
              {$signed(reg97[(2'h3):(1'h1)])} : ($signed((!(~^(8'h9c)))) ?
                  ($signed(reg85[(2'h2):(1'h1)]) ?
                      $signed((|(8'ha4))) : (|$signed(reg88))) : reg93));
          reg105 <= $unsigned(reg93[(2'h2):(1'h0)]);
          reg106 <= ((^reg95) >>> $signed(({(~&reg95)} ?
              $unsigned((~&reg100)) : reg93)));
        end
      else
        begin
          reg103 <= $unsigned(($unsigned({(^~reg97),
              ((8'hb4) ? reg72 : reg76)}) * {wire63[(2'h3):(2'h2)],
              wire61[(2'h2):(1'h0)]}));
          reg104 <= $signed(wire67[(3'h7):(2'h2)]);
          reg105 <= (8'ha0);
          reg106 <= reg104;
          reg107 <= $signed(((+((reg80 < reg106) == $unsigned(reg72))) ?
              wire60[(4'ha):(4'ha)] : {(!reg96)}));
        end
      reg108 <= ($unsigned($unsigned((reg95[(4'hb):(4'hb)] ~^ $signed(reg91)))) ?
          $signed(wire65[(3'h6):(3'h4)]) : $unsigned($unsigned($signed($unsigned(reg73)))));
      if (($unsigned($signed(((&reg75) ?
          (reg95 ?
              (8'hb5) : reg89) : (reg78 > reg75)))) ~^ $unsigned(reg103[(5'h10):(2'h2)])))
        begin
          reg109 <= $signed((reg88 ?
              $signed({$signed(reg84),
                  (wire64 ?
                      wire64 : reg81)}) : $unsigned(((wire67 - reg81) != $signed((8'h9f))))));
          if ((^~wire65))
            begin
              reg110 <= reg107;
              reg111 <= $signed((+reg89));
              reg112 <= reg88[(4'hb):(2'h3)];
            end
          else
            begin
              reg110 <= reg92;
              reg111 <= $signed({reg80[(3'h5):(3'h5)]});
              reg112 <= (((&($unsigned(reg105) ?
                  wire67 : {reg89})) ^~ (reg68[(3'h7):(1'h1)] ?
                  $unsigned((wire62 ? reg69 : (8'ha2))) : {wire61,
                      (reg82 <= wire62)})) >>> ($signed((wire66 ?
                  {reg107} : (reg69 * wire62))) | $unsigned((((8'hac) - reg90) ?
                  (~reg97) : (wire102 ? reg71 : wire62)))));
              reg113 <= reg80;
            end
          reg114 <= wire62;
        end
      else
        begin
          reg109 <= reg97[(3'h7):(3'h7)];
          if ($signed(reg104))
            begin
              reg110 <= ((reg97[(1'h1):(1'h0)] >= (reg97[(3'h7):(3'h6)] ?
                  (~(-reg95)) : (reg111[(3'h5):(2'h2)] == reg97))) * (wire64[(5'h12):(3'h6)] - wire102));
            end
          else
            begin
              reg110 <= reg85;
            end
          reg111 <= reg82[(4'h8):(1'h1)];
          if (reg89[(4'hb):(3'h4)])
            begin
              reg112 <= reg106[(4'ha):(3'h5)];
              reg113 <= ((|$signed(reg91)) ^~ (8'hbb));
              reg114 <= reg69;
            end
          else
            begin
              reg112 <= ($signed($signed($unsigned((wire62 >> reg93)))) <<< (((~^(reg80 ?
                      reg114 : reg70)) >> $unsigned(((7'h43) >= reg78))) ?
                  reg82 : {{reg79[(3'h4):(1'h1)]}, reg68}));
              reg113 <= $unsigned({($unsigned({wire66}) ?
                      reg74 : $unsigned((~wire101))),
                  {(reg93[(3'h4):(3'h4)] < reg72[(1'h1):(1'h0)]),
                      ((reg69 ? (8'hb1) : reg109) ?
                          (reg114 ? reg92 : reg77) : (reg84 << reg68))}});
              reg114 <= $unsigned(reg79);
              reg115 <= ($unsigned(($signed($signed(reg75)) ?
                  (^~$signed(reg71)) : (!$unsigned((8'hb8))))) == $signed(($signed((~|reg108)) || reg90)));
            end
          reg116 <= (~|reg82[(3'h7):(3'h7)]);
        end
    end
  assign wire117 = $signed(({(|(reg97 ? reg80 : reg107))} ?
                       (reg80 - ((reg92 ?
                           reg85 : (8'hb5)) <= (+(8'hb1)))) : $signed(((reg104 && reg72) ?
                           (wire102 ? reg108 : wire67) : (reg90 <= reg72)))));
  assign wire118 = ((reg79 || $signed($unsigned(reg80[(3'h7):(2'h3)]))) ?
                       $signed($signed(((reg71 > reg73) * (wire63 >= reg85)))) : wire63[(2'h2):(1'h1)]);
  assign wire119 = reg79[(3'h6):(1'h0)];
  assign wire120 = (reg106 << (&{$signed({(7'h41)}), (+(|reg108))}));
  always
    @(posedge clk) begin
      if ($unsigned({(~$signed($signed(wire119))), reg79[(4'h9):(3'h4)]}))
        begin
          reg121 <= ((reg109[(4'h9):(2'h2)] ?
                  $unsigned(reg86) : wire118[(5'h11):(1'h0)]) ?
              ((+reg104) ?
                  (wire102 ?
                      ((|reg94) ?
                          reg85[(5'h12):(5'h10)] : ((8'h9e) == wire102)) : reg72) : wire66[(2'h2):(2'h2)]) : ((~((reg88 ?
                      reg76 : wire65) ?
                  $unsigned(reg76) : (|(8'hb9)))) != ($unsigned($signed(reg81)) ?
                  $signed($signed(wire60)) : (+(wire63 ? wire66 : reg76)))));
          if ((($unsigned((~^(wire62 ?
              reg103 : wire120))) >> reg82[(4'hf):(4'hb)]) <= (!{{(reg112 && (8'ha3)),
                  $unsigned((8'hb7))}})))
            begin
              reg122 <= $unsigned($unsigned((((reg71 ?
                      reg99 : (8'hb4)) >= (reg87 << wire65)) ?
                  $unsigned({reg89}) : (8'hb9))));
            end
          else
            begin
              reg122 <= ({$signed($signed(reg116))} ?
                  $unsigned((($unsigned((8'hb5)) ?
                          $unsigned((8'hbe)) : {reg87, reg78}) ?
                      $signed({wire67}) : (~^wire120))) : (($unsigned($unsigned(reg82)) ?
                          wire102[(1'h0):(1'h0)] : $signed({(8'ha5),
                              (8'hb7)})) ?
                      reg95 : (reg111[(2'h2):(1'h0)] <<< {(reg89 > reg90),
                          (7'h42)})));
              reg123 <= $signed((~&($signed((^reg98)) ?
                  ({reg121, reg92} ?
                      reg70 : {(8'hbf), reg98}) : $signed({wire64}))));
            end
          reg124 <= $signed(reg104[(1'h1):(1'h1)]);
          reg125 <= ((wire118 <<< wire118) < ($signed(reg108) >= ({reg107,
              ((8'hbc) <<< reg73)} - reg87)));
        end
      else
        begin
          reg121 <= ($signed({(wire61 ? reg94 : wire118[(5'h13):(2'h3)])}) ?
              (~^(((reg93 & wire120) ?
                  (reg88 < (8'h9d)) : (-wire120)) - (reg94[(2'h3):(1'h0)] * wire61[(2'h3):(2'h3)]))) : $unsigned(({$signed(wire67),
                      (~|reg74)} ?
                  reg111[(3'h4):(1'h1)] : $signed($signed(wire119)))));
          if (reg91[(3'h4):(2'h3)])
            begin
              reg122 <= ((((reg114 ~^ (wire120 || reg103)) != $unsigned(((8'hbb) ?
                          reg80 : reg79))) ?
                      {{reg80[(3'h7):(2'h3)]},
                          reg108[(3'h6):(3'h4)]} : reg110[(2'h2):(1'h0)]) ?
                  (!reg103) : $unsigned((~^$unsigned(reg108[(2'h2):(1'h1)]))));
              reg123 <= $signed(reg121[(2'h2):(1'h0)]);
              reg124 <= (8'hb6);
            end
          else
            begin
              reg122 <= ($unsigned(($unsigned($unsigned(reg77)) ?
                  {$unsigned((8'ha7)),
                      $unsigned(reg86)} : $signed((reg79 - (8'hb1))))) + $signed(reg107[(2'h2):(2'h2)]));
            end
        end
      reg126 <= (~|$signed($signed((7'h41))));
      reg127 <= wire67;
      reg128 <= (((!{{reg106, wire66}, reg91[(2'h2):(1'h1)]}) ?
          {reg95,
              $unsigned(((7'h43) ?
                  reg100 : reg114))} : reg122) != (~^(~&{reg77})));
    end
  assign wire129 = $unsigned({$unsigned((~wire120))});
  assign wire130 = (~&{$unsigned($unsigned($signed(reg98)))});
  assign wire131 = $signed(({wire67[(1'h0):(1'h0)]} * (((+reg121) ?
                       $unsigned(reg109) : wire130[(1'h0):(1'h0)]) ~^ $unsigned(reg106[(2'h3):(1'h0)]))));
  assign wire132 = $signed({((~|$unsigned(reg94)) ?
                           $signed(wire129) : $signed((reg103 ^~ reg128)))});
  assign wire133 = $unsigned(wire101);
endmodule

module module5
#(parameter param55 = {(~^((8'hb4) ? ({(7'h40), (8'ha7)} ? (+(8'hba)) : ((8'hac) ? (8'hb8) : (8'hbf))) : (((7'h40) ? (8'ha6) : (8'hb4)) ? ((8'hb2) > (8'hb1)) : ((8'ha8) * (8'hb9))))), (-(~&(~^((8'ha8) ? (8'h9c) : (8'hb0)))))})
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire47;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire11,
                 wire12,
                 wire47,
                 (1'h0)};
  assign wire11 = (wire10 ?
                      (wire10 > ((|(wire10 <<< wire8)) ?
                          wire10[(2'h2):(2'h2)] : $unsigned($signed(wire8)))) : ((-$signed(wire9[(1'h1):(1'h0)])) + ({(~|wire8),
                              wire7[(2'h2):(1'h0)]} ?
                          (wire10[(2'h2):(1'h0)] * (8'ha1)) : $unsigned((wire7 >> wire7)))));
  assign wire12 = wire9[(1'h1):(1'h1)];
  module13 #() modinst48 (.wire17(wire10), .wire15(wire9), .wire14(wire12), .wire18(wire8), .y(wire47), .wire16(wire6), .clk(clk));
  assign wire49 = ((!(8'hbc)) ?
                      (wire8[(4'hf):(1'h1)] | wire10) : (($unsigned((+wire7)) ?
                          (~&(wire8 ?
                              wire6 : (8'hb6))) : $unsigned((wire11 == (8'h9d)))) < ({(wire47 ?
                                  wire11 : (8'hb1)),
                              $signed((8'ha0))} ?
                          wire8 : wire10[(2'h3):(2'h3)])));
  assign wire50 = $signed((((~^wire49[(5'h13):(4'hb)]) & (~^$unsigned(wire8))) ^~ wire47[(1'h1):(1'h0)]));
  assign wire51 = (8'hb7);
  assign wire52 = wire11[(4'hf):(2'h2)];
  assign wire53 = ($signed(wire50) >> $unsigned(wire11[(1'h1):(1'h1)]));
  assign wire54 = wire6;
endmodule

module module13
#(parameter param45 = (((8'had) * (&{((8'ha1) ? (7'h40) : (8'hbf))})) + (({(~&(8'hb8))} ? ((^~(8'hb0)) >> {(8'h9e), (8'hbd)}) : {(~&(8'ha5)), (-(8'ha7))}) ? ({{(8'ha1)}} < ((^~(8'ha5)) >>> (-(8'hb2)))) : (&(^~{(7'h40)})))), 
parameter param46 = (param45 ? (-param45) : {param45}))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire19 = $unsigned({$unsigned(wire16)});
  assign wire20 = wire18;
  assign wire21 = (($signed(wire17) >> (wire19[(4'ha):(3'h7)] && (wire19 ?
                      wire14[(4'hc):(4'h8)] : $unsigned((8'ha1))))) <= wire17);
  assign wire22 = (^$signed(wire18[(5'h10):(2'h3)]));
  assign wire23 = ($signed((8'hae)) ?
                      $signed((wire22 ?
                          (+wire18[(5'h11):(4'he)]) : {(|wire19)})) : ($unsigned($signed({wire15,
                              wire22})) ?
                          (wire18 & $unsigned((wire16 ^~ wire22))) : $signed((wire21 ?
                              wire19 : $signed(wire19)))));
  assign wire24 = $signed($unsigned((!(^~(wire23 ^ wire19)))));
  assign wire25 = {($unsigned(($unsigned(wire18) - (&wire16))) ?
                          ($unsigned({wire23, wire16}) ?
                              $unsigned($signed(wire16)) : ($unsigned(wire16) > wire14[(2'h2):(1'h1)])) : {{((8'h9c) ?
                                      wire19 : wire22),
                                  (wire22 ? (7'h44) : wire16)}}),
                      $signed($signed((((8'hb2) + wire23) ^~ $signed(wire19))))};
  assign wire26 = (+$signed(((~&wire19[(4'hb):(3'h6)]) > wire17[(3'h6):(2'h3)])));
  assign wire27 = wire22;
  assign wire28 = $signed($unsigned(wire14[(3'h6):(1'h1)]));
  assign wire29 = ($unsigned($unsigned(($unsigned(wire19) ?
                          ((8'hb5) >> wire25) : $signed(wire20)))) ?
                      $signed({wire27[(3'h6):(3'h6)]}) : wire22);
  assign wire30 = $signed(((^$signed((8'hb2))) | (^~($unsigned(wire15) ?
                      $signed(wire28) : (|wire28)))));
  always
    @(posedge clk) begin
      reg31 <= wire20[(4'hc):(1'h0)];
      reg32 <= ((~|(wire25 >= $signed((wire24 ^ wire22)))) - ((~wire28[(3'h6):(3'h5)]) < (~(wire18 > wire16))));
      if (((wire18 * {(~&(^wire29))}) ?
          ((~$signed(wire27)) == ($unsigned(wire19) >= $unsigned((reg32 ?
              wire14 : (8'hb0))))) : (wire30 ?
              $unsigned($unsigned({wire19})) : $unsigned($signed(wire17)))))
        begin
          reg33 <= ($unsigned(wire17) >= ($signed((-(wire24 ?
                  (8'h9c) : wire25))) ?
              (-{wire28[(2'h2):(1'h1)], wire25[(1'h1):(1'h1)]}) : wire17));
          reg34 <= $unsigned((wire17[(3'h4):(1'h1)] ?
              {$unsigned(((8'haa) << wire19))} : (+(|(wire22 ?
                  wire30 : wire16)))));
          reg35 <= $unsigned((&(wire30 ?
              $signed($signed(wire14)) : (!reg32[(2'h2):(1'h1)]))));
        end
      else
        begin
          if (wire30)
            begin
              reg33 <= (|(reg35 & (((wire27 ? wire28 : reg32) ?
                  $signed(wire30) : wire27[(2'h3):(2'h3)]) + wire28[(2'h2):(2'h2)])));
              reg34 <= (-reg32);
              reg35 <= (8'ha4);
            end
          else
            begin
              reg33 <= wire15;
              reg34 <= {wire14[(4'ha):(1'h1)], wire30[(1'h1):(1'h1)]};
              reg35 <= {(~|wire29)};
            end
          reg36 <= wire30[(2'h3):(2'h2)];
          reg37 <= $unsigned($unsigned((8'ha6)));
        end
    end
  assign wire38 = ($signed($unsigned($signed($unsigned(wire23)))) ?
                      wire23 : (wire22 & {$signed($signed(reg34)), (7'h43)}));
  assign wire39 = $signed(wire27[(4'hb):(4'ha)]);
  assign wire40 = wire28;
  assign wire41 = wire14[(4'hc):(3'h7)];
  assign wire42 = $signed(wire14[(3'h4):(2'h3)]);
  assign wire43 = $signed((&({$signed(wire26),
                      (wire14 ^~ wire28)} ^ (wire21[(3'h7):(2'h3)] <= (wire29 << wire29)))));
  assign wire44 = wire27;
endmodule
