module top
#(parameter param167 = (^(((^~(~(8'hb0))) ? (^~(~&(8'ha2))) : (((8'h9c) >= (8'ha8)) * (~&(8'hab)))) <= (^({(8'hb7)} != ((8'hb3) ? (8'h9c) : (8'ha4)))))), 
parameter param168 = (((((~|param167) ? param167 : ((8'ha3) ? param167 : param167)) << (^~param167)) == {{{param167, param167}}}) >= (8'ha7)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire165;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire80,
                 wire35,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire165,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire4 = {(wire2 ?
                         $unsigned($signed({wire2,
                             (8'hab)})) : ($unsigned((^wire0)) && wire1))};
  assign wire5 = wire3;
  assign wire6 = (8'hb6);
  assign wire7 = (wire0 ?
                     {($signed((wire1 ? wire3 : wire0)) ?
                             ((wire5 >= wire0) ?
                                 (^wire4) : (~&(8'had))) : $unsigned({wire0})),
                         $signed(((~wire5) <= $signed((8'hbe))))} : $unsigned(wire0));
  assign wire8 = (~&($unsigned(wire5[(4'h9):(4'h9)]) - {$unsigned($unsigned(wire3)),
                     wire1[(3'h6):(1'h0)]}));
  assign wire9 = $signed($unsigned(($signed(((8'h9d) <<< (8'hb4))) ?
                     (~|$unsigned(wire5)) : $unsigned(((8'h9f) || (8'ha1))))));
  assign wire10 = (^~(8'ha8));
  assign wire11 = {(~&(~|{(-wire7)}))};
  assign wire12 = (~&wire10);
  assign wire13 = $unsigned($signed((wire1[(4'h8):(2'h2)] ? wire9 : wire11)));
  assign wire14 = wire1;
  always
    @(posedge clk) begin
      if (($signed({$signed((wire10 ? wire10 : wire8)),
          wire6[(4'h8):(1'h0)]}) && (wire12 ? wire2[(4'hd):(3'h7)] : (-wire0))))
        begin
          reg15 <= $signed($unsigned({wire10[(1'h0):(1'h0)],
              {wire2, $unsigned(wire4)}}));
          if ($unsigned($signed($unsigned(((-wire14) ?
              wire9 : ((8'ha3) << (8'hba)))))))
            begin
              reg16 <= wire13[(4'he):(3'h4)];
              reg17 <= (~^{$unsigned((~$unsigned(wire5))),
                  wire4[(1'h1):(1'h0)]});
            end
          else
            begin
              reg16 <= $signed($signed($signed({((7'h41) ? (8'hbb) : wire10),
                  $signed(wire11)})));
            end
          if ({wire9[(1'h0):(1'h0)],
              ($unsigned($unsigned(reg16)) ^ $signed(wire7))})
            begin
              reg18 <= wire12;
              reg19 <= {$signed(({(^(8'hae)),
                      wire10[(2'h3):(2'h2)]} != $signed(wire3))),
                  $signed($signed($signed((~wire2))))};
              reg20 <= {$unsigned($unsigned($signed($signed(wire1))))};
              reg21 <= ({(wire13[(2'h2):(1'h1)] ? wire3 : (+{(8'ha2)}))} ?
                  reg20[(3'h7):(3'h7)] : reg18[(4'hd):(4'hc)]);
            end
          else
            begin
              reg18 <= wire14[(3'h4):(1'h0)];
              reg19 <= $signed($unsigned(wire6));
              reg20 <= (+((-$signed($unsigned(wire13))) || (((^~wire7) ?
                      ((8'hb1) ? reg18 : wire8) : $signed(reg21)) ?
                  $unsigned((wire6 >= wire9)) : ((8'ha5) + (!(7'h42))))));
              reg21 <= $signed((8'ha0));
              reg22 <= wire9;
            end
          reg23 <= (($unsigned(reg20) ?
              wire8 : (((reg17 || wire3) >= wire10) ?
                  {(~^wire9), wire2} : {(~|reg22),
                      {wire2}})) + wire3[(2'h3):(2'h3)]);
          reg24 <= {wire10[(1'h0):(1'h0)], reg20[(3'h7):(2'h3)]};
        end
      else
        begin
          reg15 <= wire10;
          reg16 <= (&(wire14 - $signed((^wire0[(3'h6):(3'h5)]))));
          reg17 <= $signed((wire1 ?
              $signed(($unsigned(wire4) > (reg16 == wire5))) : ((&wire8[(1'h1):(1'h1)]) - (~^{(8'ha8),
                  wire8}))));
          reg18 <= reg20;
        end
      reg25 <= reg18[(4'h9):(2'h2)];
      reg26 <= $signed(reg24[(1'h1):(1'h0)]);
      if ({(-(~^((reg22 ? wire4 : wire8) ?
              wire12[(4'hd):(2'h3)] : $signed(wire13))))})
        begin
          if (($signed(($signed(reg18[(3'h6):(3'h4)]) ?
              reg17[(4'ha):(3'h7)] : ((^(8'hba)) ?
                  (+(8'ha9)) : ((7'h40) ?
                      (8'ha3) : reg16)))) < ((wire13 >= $signed((^~reg15))) & $unsigned((-reg25[(4'hd):(3'h7)])))))
            begin
              reg27 <= wire2;
              reg28 <= (~|(|($unsigned($signed(reg20)) ?
                  (reg18 ? wire5[(2'h3):(1'h1)] : reg21) : (8'hb0))));
              reg29 <= ($unsigned({wire11, reg23}) ?
                  reg21 : $unsigned((~&(((8'hbf) ?
                      reg21 : wire11) || $signed(reg19)))));
            end
          else
            begin
              reg27 <= reg26;
              reg28 <= reg18[(3'h6):(2'h3)];
              reg29 <= wire12[(4'ha):(4'h8)];
            end
          reg30 <= ((^~reg17) ? reg26 : reg26);
        end
      else
        begin
          reg27 <= $signed((reg26[(3'h6):(3'h4)] ?
              $signed(($unsigned(wire1) ?
                  $signed((8'hac)) : (&reg19))) : $unsigned($unsigned((reg27 < wire4)))));
          if (wire14[(4'hc):(3'h4)])
            begin
              reg28 <= {(~^$unsigned(wire12[(1'h1):(1'h0)]))};
              reg29 <= {(+(wire5[(3'h5):(1'h1)] ?
                      (~$unsigned(reg30)) : (!(wire3 || wire2)))),
                  (+$unsigned(reg18[(4'hd):(3'h4)]))};
            end
          else
            begin
              reg28 <= $signed(reg17[(2'h3):(1'h1)]);
            end
          if ($unsigned($signed($unsigned((^(wire14 ? wire12 : (7'h44)))))))
            begin
              reg30 <= (~|wire0[(2'h3):(2'h2)]);
              reg31 <= (($unsigned(((reg28 ^~ reg20) || wire8[(3'h4):(3'h4)])) + reg28[(2'h3):(1'h1)]) ?
                  ((($unsigned(reg20) << ((8'hab) ? (8'hb0) : wire8)) ?
                      (((8'had) ?
                          reg27 : (8'haf)) ^~ $unsigned(reg20)) : wire5[(3'h4):(2'h2)]) < (!wire6)) : (-$unsigned(reg24[(1'h1):(1'h1)])));
            end
          else
            begin
              reg30 <= (8'hb3);
              reg31 <= (|reg25[(4'ha):(4'h8)]);
              reg32 <= $signed((($signed((~(8'ha2))) ?
                      $signed((~^reg29)) : (~&(-reg25))) ?
                  (^~wire8) : ($signed($signed(reg26)) <= $signed((reg19 ?
                      (7'h43) : wire4)))));
              reg33 <= (-$unsigned({$unsigned(wire11[(1'h0):(1'h0)]),
                  wire9[(3'h5):(3'h5)]}));
            end
          reg34 <= $signed($unsigned(reg23[(4'h8):(2'h2)]));
        end
    end
  assign wire35 = {(|$signed($unsigned(reg16)))};
  module36 #() modinst81 (.y(wire80), .wire38(wire13), .clk(clk), .wire40(reg27), .wire37(wire4), .wire39(reg17), .wire41(wire10));
  module82 #() modinst166 (.y(wire165), .wire85(reg27), .clk(clk), .wire84(reg20), .wire86(wire13), .wire83(reg24));
endmodule

module module82
#(parameter param163 = (((+(((8'hb2) ? (8'hbb) : (7'h41)) ? (^(8'h9c)) : {(8'hba), (8'ha8)})) ? {(((8'hac) ? (8'ha6) : (8'hbf)) ^ (~(8'hac)))} : ({((8'hba) ? (8'haa) : (8'haf)), {(8'hbe), (8'hbb)}} <<< (((8'hb1) * (8'ha1)) * (~(7'h44))))) ? (-{{((8'hbd) << (8'ha7)), ((7'h43) ? (8'hbe) : (8'hb1))}, ((~^(8'hb3)) & (~^(8'hba)))}) : ({((|(8'hb3)) ? ((8'hae) + (8'h9d)) : (|(8'ha7))), ((8'hb0) ? (~&(8'hb7)) : ((7'h43) ^ (8'hb0)))} ? ((((8'ha1) * (8'hb9)) < (8'hb4)) << (((8'hb5) ? (8'had) : (8'hb9)) || ((8'hb0) && (8'hb6)))) : ((((8'ha6) ? (8'hac) : (8'ha3)) ^~ ((8'hbd) ? (8'hb6) : (7'h44))) ? (((8'hab) ? (8'hb1) : (8'h9e)) ? ((8'hb1) ^ (8'ha3)) : ((8'ha0) ? (7'h40) : (8'hb5))) : (8'ha2)))), 
parameter param164 = ((~|param163) * {(8'ha5), (^((param163 >>> (8'ha4)) << (param163 < param163)))}))
(y, clk, wire83, wire84, wire85, wire86);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire83;
  input wire [(4'hd):(1'h0)] wire84;
  input wire signed [(5'h12):(1'h0)] wire85;
  input wire [(4'hb):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire161;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire151;
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire96,
                 wire97,
                 wire98,
                 wire101,
                 wire102,
                 wire132,
                 wire151,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire87 = $unsigned($signed($signed((!(wire83 ? wire84 : wire86)))));
  assign wire88 = (~|wire83);
  assign wire89 = $unsigned(((~((wire86 <<< wire88) || wire83)) ?
                      ((wire83 != (~|wire85)) & wire84) : wire88));
  assign wire90 = wire89[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg91 <= wire84[(1'h1):(1'h0)];
      reg92 <= ((|wire86[(3'h6):(3'h6)]) ?
          ($signed($signed((~wire90))) << (+(wire89 < ((8'h9d) != reg91)))) : wire89[(2'h3):(1'h1)]);
      reg93 <= wire85[(5'h10):(4'ha)];
      reg94 <= (^~(($unsigned(((8'hbc) ? (7'h43) : reg91)) ?
              {reg92,
                  ((8'ha3) != wire84)} : (wire87[(2'h3):(2'h2)] >> $unsigned(wire86))) ?
          (|wire83) : wire89));
      reg95 <= $unsigned($signed(wire84));
    end
  assign wire96 = (reg91 ?
                      reg91[(4'h8):(1'h1)] : $unsigned($unsigned($unsigned(wire86))));
  assign wire97 = ($signed((($unsigned(wire89) ?
                      (wire83 ? wire84 : (8'ha5)) : {reg95}) ~^ (+(reg94 ?
                      wire86 : reg93)))) - $signed((wire85[(4'h9):(4'h8)] && (+(wire86 ?
                      wire88 : wire86)))));
  assign wire98 = (|$signed(($signed((wire83 | wire83)) << ((wire86 <= wire96) ?
                      (wire87 ? (8'ha3) : wire90) : wire86[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg99 <= (wire90 ?
          $signed((7'h43)) : ((^~((+reg95) >> $unsigned(reg93))) ?
              reg93[(4'ha):(1'h0)] : (((8'hbd) == {wire88}) * ((+wire84) ?
                  wire88 : (wire97 ~^ wire88)))));
      reg100 <= (($signed(wire98[(3'h6):(1'h0)]) ?
              wire98 : ($signed($signed(reg94)) ?
                  $signed((wire87 >>> wire97)) : (~&(wire85 ^ reg92)))) ?
          $unsigned($unsigned({$unsigned(wire85)})) : reg99[(3'h7):(1'h0)]);
    end
  assign wire101 = (|reg100);
  assign wire102 = {($unsigned((&(wire86 > wire85))) << (+((reg99 ?
                               reg92 : wire88) ?
                           (wire89 >>> wire87) : $signed(wire101))))};
  module103 #() modinst133 (.clk(clk), .wire104(wire86), .wire106(wire87), .y(wire132), .wire105(wire85), .wire108(reg93), .wire107(wire101));
  module134 #() modinst152 (wire151, clk, reg92, reg99, reg95, reg94, wire85);
  assign wire153 = wire102;
  assign wire154 = $unsigned({((8'hae) < ($signed((8'hb1)) ?
                           (wire87 ? wire132 : reg100) : $signed(wire132)))});
  assign wire155 = (-$signed((~^({(8'hb3), wire153} & (wire98 ?
                       reg93 : reg99)))));
  assign wire156 = ((8'ha7) <= ((reg92 ^~ $signed((~wire151))) <= ((wire97 ?
                           $unsigned((8'hb3)) : $signed(reg100)) ?
                       (8'hb9) : $signed($signed(wire132)))));
  assign wire157 = (({($unsigned(wire89) ?
                                   (reg93 <<< reg91) : (reg91 ?
                                       wire87 : (8'hac)))} ?
                           reg99[(4'h8):(2'h3)] : {(~|(reg92 ?
                                   (8'hb6) : reg94)),
                               {(reg93 | wire151), $unsigned(wire86)}}) ?
                       $unsigned($signed(reg99[(3'h5):(1'h1)])) : (wire96 != (8'hbd)));
  assign wire158 = (~&(((^(8'hb8)) - (reg99[(4'h8):(1'h1)] ?
                       wire132 : {reg99, wire153})) || $unsigned(reg95)));
  assign wire159 = ((wire85 + $signed((reg100 < wire88))) == ({wire156[(3'h4):(1'h1)],
                           $unsigned((8'hac))} ?
                       {$unsigned(wire156),
                           {$unsigned(wire151)}} : (wire158 < wire101[(4'h8):(1'h0)])));
  assign wire160 = wire154;
  assign wire161 = {$unsigned($unsigned(reg93)),
                       ((reg94[(4'ha):(2'h2)] || $signed((wire160 ?
                               wire84 : reg100))) ?
                           wire102 : ($unsigned((|reg95)) ?
                               (|wire85) : (!$signed(wire157))))};
  assign wire162 = ($signed(((+(+wire154)) ?
                       $unsigned((7'h40)) : ($signed(wire85) - $unsigned(reg95)))) > (wire84 >= $unsigned($unsigned((|wire159)))));
endmodule

module module36
#(parameter param79 = ({((((8'hb1) == (8'hb7)) ? (8'hbe) : (|(8'hbd))) ? (((8'hab) >> (8'ha2)) ^~ (-(8'h9e))) : {{(8'hb7), (8'ha4)}, {(8'ha5), (8'hb1)}})} > (~&((~&{(7'h44)}) || ((-(8'hb2)) ? (|(8'hbd)) : ((8'h9f) == (8'hb9)))))))
(y, clk, wire37, wire38, wire39, wire40, wire41);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire64;
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  module42 #() modinst65 (.wire45(wire41), .wire46(wire37), .wire43(wire39), .clk(clk), .y(wire64), .wire47(wire38), .wire44(wire40));
  assign wire66 = $unsigned($signed((wire64 == ((wire38 << wire64) ?
                      wire41[(2'h3):(1'h1)] : $unsigned(wire41)))));
  assign wire67 = wire37[(3'h6):(1'h0)];
  assign wire68 = $signed(($unsigned(((~|wire64) ?
                      ((8'h9e) ?
                          wire66 : (8'ha1)) : wire37[(2'h2):(1'h0)])) != $signed((wire41 ?
                      {wire64} : (wire66 ? wire38 : (8'ha3))))));
  assign wire69 = {(wire37[(3'h6):(2'h2)] ?
                          ($unsigned((&wire39)) ?
                              {(wire67 <= wire40)} : {{wire37},
                                  wire38}) : (wire39 ?
                              ($unsigned(wire66) != (wire40 >>> wire66)) : $signed($unsigned(wire41)))),
                      $signed($unsigned(wire40))};
  assign wire70 = (8'hba);
  assign wire71 = (~|wire67);
  assign wire72 = $signed(wire64[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg73 <= wire70[(2'h2):(2'h2)];
      if (wire37[(3'h6):(3'h4)])
        begin
          reg74 <= wire68;
          reg75 <= (~|((!wire38) ?
              wire37[(4'ha):(3'h4)] : (({wire40, wire38} ?
                      $unsigned(wire71) : $unsigned((8'hbd))) ?
                  $unsigned((wire37 ? wire41 : wire66)) : (&reg74))));
        end
      else
        begin
          reg74 <= (~$signed((wire70[(2'h3):(1'h0)] && $unsigned((~&reg74)))));
        end
      reg76 <= wire71[(3'h4):(2'h2)];
      reg77 <= wire38;
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned({{wire72}});
    end
endmodule

module module42
#(parameter param62 = ((|(^~(8'had))) ? (((((8'hbf) << (8'hbe)) ? (8'ha0) : (|(8'hac))) <= ((+(8'hbd)) >= ((8'hb0) ? (8'ha3) : (8'hb0)))) != ((+((8'ha7) != (8'h9e))) ? ((!(8'ha9)) - (8'ha5)) : (((8'ha3) ? (8'hbc) : (8'h9f)) << (~(8'hbc))))) : (!(7'h40))), 
parameter param63 = ((&param62) < ((8'h9c) ? {param62} : param62)))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  input wire [(5'h14):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire48 = $signed($signed((((wire44 ? wire44 : wire47) ?
                          (wire43 ? wire45 : wire46) : $signed((8'haa))) ?
                      $signed($signed(wire45)) : ({(8'hb2)} ?
                          $unsigned(wire44) : (&wire47)))));
  assign wire49 = wire48;
  assign wire50 = wire47[(3'h5):(3'h5)];
  assign wire51 = (-$signed((wire50[(3'h5):(1'h1)] ?
                      $signed((|(8'haa))) : wire45)));
  assign wire52 = wire45[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($signed((&($unsigned((8'hab)) ? (^~wire52) : (-wire44)))) ?
          wire46[(4'ha):(3'h7)] : wire44))
        begin
          reg53 <= ($unsigned(wire43[(1'h1):(1'h0)]) ?
              $signed(({wire49[(2'h3):(1'h0)],
                  (~wire44)} || (8'haa))) : $signed((wire46 & $unsigned((wire44 ?
                  wire44 : wire52)))));
        end
      else
        begin
          reg53 <= wire45[(1'h0):(1'h0)];
          reg54 <= ((~((~&(!wire48)) || (wire43[(2'h3):(1'h1)] ?
              wire45[(1'h0):(1'h0)] : ((8'hbe) ? reg53 : (8'ha8))))) * (wire50 ?
              (8'ha6) : {($signed(wire51) || wire52[(2'h3):(1'h0)])}));
          reg55 <= wire44[(4'hc):(4'hc)];
        end
      reg56 <= $signed((8'hb6));
      reg57 <= {(-{{((8'had) <= reg54)}, wire49[(1'h0):(1'h0)]}),
          (!(|(wire52[(2'h3):(2'h3)] > (~^wire51))))};
      reg58 <= {$signed(reg55)};
    end
  assign wire59 = ($unsigned(wire49) ?
                      (!wire51) : {wire46[(3'h4):(3'h4)], (8'had)});
  assign wire60 = {(~&(&($signed(wire59) | wire51))),
                      {($unsigned($signed(wire50)) ?
                              ($unsigned(wire46) ?
                                  $signed(reg54) : $signed(reg56)) : wire44[(4'hc):(1'h0)])}};
  assign wire61 = $unsigned($signed(wire52[(2'h3):(2'h3)]));
endmodule

module module134  (y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire139;
  input wire signed [(4'h9):(1'h0)] wire138;
  input wire signed [(3'h6):(1'h0)] wire137;
  input wire signed [(4'he):(1'h0)] wire136;
  input wire signed [(3'h6):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg140 <= wire135;
      if ((&(^~({(~|wire135), $unsigned((7'h42))} ?
          {$unsigned(reg140), $unsigned(wire139)} : wire135))))
        begin
          reg141 <= $unsigned($signed(wire135[(2'h3):(1'h1)]));
          reg142 <= wire137;
        end
      else
        begin
          reg141 <= reg140;
        end
      reg143 <= ((($unsigned(wire136) ?
              ((wire139 + wire136) != (~reg140)) : reg142) ?
          reg141[(1'h0):(1'h0)] : ({wire139, (&(8'hbd))} ?
              $unsigned((&wire139)) : (^~(~^(8'ha9))))) ~^ wire135);
      reg144 <= $signed($unsigned(((^$signed((8'hbf))) ^ ($signed((8'ha4)) && $unsigned(wire136)))));
    end
  assign wire145 = $unsigned((+wire139));
  assign wire146 = (!({(8'hbf)} > ($signed((wire135 ? wire135 : reg143)) ?
                       (-reg141[(1'h0):(1'h0)]) : $unsigned(((8'hac) ?
                           (8'haf) : wire145)))));
  assign wire147 = reg141;
  assign wire148 = {(|((((8'hbb) ? wire147 : wire135) ? (8'hae) : (^~wire139)) ?
                           wire147 : wire139[(3'h6):(1'h1)])),
                       $unsigned($unsigned(($signed(reg142) >>> $signed((8'hbb)))))};
  assign wire149 = (~&(((~(~&wire135)) || $signed((reg142 ~^ reg144))) <<< ({{reg140}} == $signed((-wire145)))));
  assign wire150 = $signed((reg143[(1'h0):(1'h0)] | (~^(+$unsigned(wire149)))));
endmodule

module module103
#(parameter param130 = (~(~&((((8'hb7) + (7'h42)) || ((8'hac) == (8'ha9))) + {{(8'h9c), (8'hb2)}, ((8'h9c) == (8'had))}))), 
parameter param131 = (&({((param130 ? param130 : param130) || param130)} ? (~^{(param130 ? param130 : param130), param130}) : ((param130 == (8'haa)) ? ((param130 - param130) == (&param130)) : param130))))
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  input wire [(4'h8):(1'h0)] wire106;
  input wire signed [(5'h12):(1'h0)] wire105;
  input wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire110,
                 wire109,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire109 = wire107;
  assign wire110 = ((-(wire106 > $unsigned($unsigned(wire105)))) ?
                       (-wire108) : (wire105[(3'h5):(1'h1)] ?
                           wire106 : ($unsigned($signed(wire106)) > ((^~(8'hbf)) | wire108[(3'h6):(1'h1)]))));
  always
    @(posedge clk) begin
      reg111 <= {$signed((8'h9e))};
      reg112 <= $unsigned((^~$unsigned(wire105)));
      if ({wire105})
        begin
          reg113 <= {wire104[(2'h3):(1'h1)]};
        end
      else
        begin
          reg113 <= $signed(wire106[(2'h2):(2'h2)]);
        end
      reg114 <= $signed($signed(wire110[(1'h0):(1'h0)]));
      reg115 <= wire104;
    end
  assign wire116 = $signed((({(wire104 ? wire105 : wire109),
                           (wire107 && wire109)} < (^~{reg114, reg113})) ?
                       reg111[(4'ha):(3'h4)] : ($signed((reg111 ~^ reg111)) ~^ $unsigned(wire105))));
  assign wire117 = $unsigned(((^(~$signed(wire109))) ?
                       reg111 : ((-(~wire107)) ?
                           wire105[(3'h6):(3'h5)] : wire107[(4'ha):(2'h2)])));
  assign wire118 = wire109;
  assign wire119 = wire109[(3'h5):(1'h0)];
  assign wire120 = reg112[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg121 <= $unsigned($signed((({(8'h9d)} ? $unsigned(reg111) : wire110) ?
          (reg114 ?
              (wire119 <= wire117) : $unsigned((8'hb5))) : ($unsigned(wire116) ?
              $signed((8'hb4)) : $signed(wire109)))));
      if ({wire118[(4'hb):(4'hb)]})
        begin
          reg122 <= ({(~|$signed($unsigned(wire105))),
              $unsigned(((wire106 ? reg114 : wire104) ?
                  ((8'hbd) * wire108) : (wire106 ?
                      wire117 : reg114)))} && reg111);
          if (wire119[(2'h2):(1'h1)])
            begin
              reg123 <= ((^($signed(wire116) ~^ ({(8'ha0), wire106} ?
                      $unsigned(wire118) : (wire110 << wire109)))) ?
                  wire119 : wire120[(3'h5):(1'h1)]);
              reg124 <= (wire116[(1'h0):(1'h0)] ?
                  (($signed($unsigned(wire109)) >>> (~^wire117)) | ((+$unsigned(wire116)) ^~ $unsigned((~|wire116)))) : reg114);
              reg125 <= ($signed((!(~reg111[(4'h9):(3'h6)]))) ?
                  ({$unsigned($signed(wire107)),
                      wire105[(5'h11):(4'h8)]} << $unsigned((reg115[(3'h6):(2'h2)] ?
                      $signed(reg114) : (!(8'hb2))))) : ($unsigned($unsigned((7'h43))) != $unsigned(($signed(reg122) || $signed(reg122)))));
              reg126 <= ((^{reg114[(4'hc):(4'hb)]}) ? wire104 : wire117);
            end
          else
            begin
              reg123 <= (reg124 && wire119);
            end
          reg127 <= $signed($signed(($signed(reg112[(3'h6):(3'h4)]) <<< reg115)));
        end
      else
        begin
          reg122 <= (&(!$signed((~$signed(wire107)))));
        end
      reg128 <= reg127[(1'h0):(1'h0)];
      reg129 <= reg125;
    end
endmodule
