module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  assign y = {wire118,
                 wire116,
                 wire115,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire5,
                 reg117,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire5 = (wire4[(3'h4):(1'h1)] ?
                     (wire3 ?
                         {wire2[(4'h8):(2'h2)]} : {(-{(8'hb2)}),
                             ((-wire0) - (wire2 ?
                                 wire1 : wire2))}) : (((!(!wire1)) && ((wire3 < wire1) == wire2[(4'h8):(2'h3)])) ?
                         {{$signed((8'ha8)), wire2[(3'h4):(2'h2)]},
                             $signed($signed(wire0))} : (+(wire4[(1'h0):(1'h0)] >= wire3[(5'h12):(4'hb)]))));
  module6 #() modinst101 (.wire10(wire3), .wire8(wire4), .wire7(wire2), .clk(clk), .y(wire100), .wire9(wire0));
  assign wire102 = $unsigned(($signed($signed({wire0,
                       wire4})) << (-wire2[(5'h13):(5'h10)])));
  assign wire103 = wire5;
  assign wire104 = ($unsigned((~&(wire103[(4'h8):(2'h2)] ?
                           wire3[(1'h0):(1'h0)] : (~wire102)))) ?
                       {((-(|wire100)) ?
                               (wire103 ?
                                   (wire100 ?
                                       wire5 : wire1) : $signed(wire3)) : $signed((~&wire4))),
                           wire5[(3'h5):(2'h3)]} : $signed(($signed((wire103 ?
                               wire3 : wire4)) ?
                           ({wire102} ?
                               (wire4 != wire2) : wire102[(4'hc):(2'h2)]) : (+$unsigned(wire5)))));
  assign wire105 = $unsigned((({$unsigned(wire102),
                       wire103} ~^ $unsigned(((8'h9d) ?
                       wire1 : wire2))) > ((wire5 ?
                       $signed(wire5) : $unsigned(wire103)) < $unsigned((|wire104)))));
  assign wire106 = {$signed((8'haa)),
                       ($signed(wire1) ?
                           wire104[(1'h0):(1'h0)] : wire100[(4'he):(2'h2)])};
  assign wire107 = ({{$unsigned((^~wire103)), wire106},
                       $unsigned(wire3)} - wire104);
  always
    @(posedge clk) begin
      reg108 <= wire0;
      reg109 <= $unsigned($unsigned((wire1 ?
          wire103 : {reg108, (wire1 || wire107)})));
    end
  always
    @(posedge clk) begin
      if ((~|((({wire100} & (wire4 ^~ reg108)) ?
              ($unsigned(wire1) > $unsigned(wire102)) : {$signed(wire3),
                  ((7'h44) ? reg109 : wire4)}) ?
          wire100[(4'hd):(4'h9)] : wire100[(4'ha):(4'h8)])))
        begin
          if (reg109)
            begin
              reg110 <= $signed($signed(((reg109 >> $unsigned(reg108)) >> wire4)));
              reg111 <= $unsigned((((~(wire3 ?
                  wire0 : wire105)) | {reg109[(3'h6):(1'h0)],
                  ((8'ha4) ?
                      wire5 : wire106)}) >> $unsigned(($signed(reg110) ^ wire3[(3'h6):(1'h1)]))));
              reg112 <= ((^~($signed((8'hb5)) ?
                      ($signed(wire3) ?
                          (!reg109) : wire2) : $signed((reg109 ^~ wire107)))) ?
                  reg108 : (wire3 ?
                      ($unsigned(wire103[(4'ha):(4'h9)]) ?
                          wire5[(1'h1):(1'h1)] : $signed($signed((8'ha9)))) : $unsigned($unsigned((~|wire5)))));
            end
          else
            begin
              reg110 <= wire5;
              reg111 <= wire103;
              reg112 <= ($signed((8'hb7)) >>> wire4);
            end
        end
      else
        begin
          reg110 <= reg111;
          reg111 <= (^~$signed((reg110[(5'h15):(5'h14)] & (wire104[(4'h8):(3'h7)] > $signed(wire102)))));
          reg112 <= wire5;
          reg113 <= ({(&$unsigned($signed(wire0)))} ~^ {wire107[(1'h1):(1'h0)]});
        end
      reg114 <= $unsigned(((($unsigned(wire2) ?
          {wire100} : (wire102 ?
              wire106 : reg112)) ^ ($unsigned(reg110) <<< {wire3})) || (^~wire3)));
    end
  assign wire115 = (((((reg108 <= wire1) ?
                               (wire0 ^~ wire104) : $unsigned(wire0)) < {{wire103,
                                   wire100}}) ?
                           ((wire1 >= wire103) ?
                               $unsigned(wire104) : {wire102[(3'h7):(1'h1)],
                                   (wire100 >>> (8'hbc))}) : wire105[(4'h9):(2'h3)]) ?
                       {(~&(^~$unsigned(wire4))), wire2} : wire100);
  assign wire116 = $unsigned({$unsigned(((reg108 >> wire103) | (8'had)))});
  always
    @(posedge clk) begin
      reg117 <= reg110[(5'h15):(1'h0)];
    end
  assign wire118 = (^~$unsigned(wire107));
endmodule

module module6
#(parameter param99 = ({((((8'ha3) > (8'hbd)) ? {(7'h41), (8'h9c)} : {(7'h40), (8'ha9)}) ? (((8'ha2) ? (8'hac) : (8'ha3)) ? ((8'haf) | (8'haa)) : ((8'ha1) ^~ (8'hb5))) : {(~(7'h41))})} ? (8'hbc) : (+(~(+((7'h44) & (8'hbc)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire62;
  assign y = {wire98,
                 wire96,
                 wire66,
                 wire65,
                 wire64,
                 wire11,
                 wire12,
                 wire62,
                 (1'h0)};
  assign wire11 = $unsigned($signed((wire9 ?
                      (|((8'hba) ? wire8 : wire9)) : {((7'h43) ?
                              (8'had) : wire8),
                          ((8'haa) & wire7)})));
  assign wire12 = (^wire9[(3'h4):(2'h2)]);
  module13 #() modinst63 (.wire15(wire12), .wire18(wire8), .clk(clk), .wire16(wire7), .wire17(wire9), .wire14(wire10), .y(wire62));
  assign wire64 = (!($unsigned((~&$signed((8'had)))) ^ (((wire11 ?
                      wire7 : wire9) >>> (-wire11)) * ((~&wire62) >> {wire7,
                      (8'hac)}))));
  assign wire65 = wire62;
  assign wire66 = ($signed(wire10[(4'hb):(4'h8)]) ?
                      wire8 : (wire12[(2'h3):(1'h0)] ~^ (($unsigned(wire11) ?
                          wire7 : $signed((8'h9f))) <= wire7)));
  module67 #() modinst97 (.wire70(wire62), .wire69(wire8), .wire71(wire9), .wire68(wire7), .y(wire96), .clk(clk));
  assign wire98 = wire96;
endmodule

module module67
#(parameter param94 = (~^(+((|(^~(8'ha1))) != ((-(8'ha5)) < {(8'hba)})))), 
parameter param95 = (param94 >>> {{(param94 || (param94 >>> param94)), (|(param94 <= param94))}, ((param94 ? {param94, param94} : (param94 ? param94 : param94)) ? (param94 ? (param94 << param94) : {param94}) : param94)}))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire71;
  input wire [(3'h6):(1'h0)] wire70;
  input wire [(5'h12):(1'h0)] wire69;
  input wire [(4'hb):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg86,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire72 = (~|$unsigned((8'ha8)));
  assign wire73 = wire72[(2'h3):(1'h0)];
  assign wire74 = wire70[(2'h3):(1'h0)];
  assign wire75 = wire74;
  assign wire76 = $signed($signed($signed(((^wire75) << (wire73 ?
                      (8'ha0) : wire74)))));
  assign wire77 = (&{(^~{$unsigned(wire68), wire68})});
  always
    @(posedge clk) begin
      reg78 <= $signed((-(((wire71 ? wire75 : wire71) != $unsigned(wire74)) ?
          $unsigned((~^wire68)) : ((+wire76) ?
              $unsigned(wire76) : wire75[(2'h2):(2'h2)]))));
      reg79 <= wire70;
      if (wire68[(4'hb):(3'h5)])
        begin
          if (reg79)
            begin
              reg80 <= (($unsigned(((reg78 ? wire70 : wire70) ?
                      reg79[(2'h2):(1'h1)] : wire71[(3'h6):(2'h3)])) >> wire68) ?
                  wire68[(3'h4):(1'h0)] : $signed((wire72[(3'h6):(2'h2)] ?
                      $signed((wire72 ? (8'h9c) : reg79)) : (~((8'ha3) ?
                          wire75 : reg78)))));
            end
          else
            begin
              reg80 <= reg80[(1'h1):(1'h0)];
            end
          reg81 <= (($signed(((wire72 ?
                  wire73 : (8'ha5)) && $signed(wire74))) | wire73) ?
              ((~&$unsigned(wire71)) | $unsigned(reg78[(4'h8):(3'h6)])) : wire75[(4'hb):(4'h8)]);
          reg82 <= {wire77[(2'h3):(2'h3)], (-(wire69[(4'h9):(4'h9)] < wire71))};
          reg83 <= (wire69 ? wire76[(2'h2):(1'h1)] : reg80);
          reg84 <= wire69[(4'ha):(1'h1)];
        end
      else
        begin
          reg80 <= (({(+wire69),
                      ($signed(wire77) ? (~(7'h42)) : reg79[(1'h1):(1'h1)])} ?
                  $unsigned(reg82) : (~^reg81)) ?
              ((reg82 ^~ (~wire72)) ?
                  reg79[(1'h0):(1'h0)] : (+($unsigned(reg82) ?
                      reg78 : (&reg84)))) : ((8'ha0) ?
                  {(~|$signed(wire73)),
                      (^~(reg81 == (7'h44)))} : ((reg83[(3'h5):(1'h0)] ?
                      $signed(wire70) : {(8'hbf),
                          reg82}) >>> $unsigned((^(8'h9c))))));
        end
    end
  assign wire85 = (~&wire69[(4'he):(4'ha)]);
  always
    @(posedge clk) begin
      reg86 <= (wire72[(3'h4):(1'h0)] <<< ($signed(wire76) != $unsigned((wire73 ~^ $unsigned(wire72)))));
    end
  assign wire87 = reg79;
  assign wire88 = wire70[(3'h6):(1'h0)];
  assign wire89 = (~&$signed($unsigned(reg79)));
  assign wire90 = $unsigned(wire71);
  assign wire91 = $unsigned((^$unsigned(($signed(wire74) ?
                      (!wire75) : ((8'hb9) ? reg79 : reg83)))));
  assign wire92 = (reg78[(4'hc):(3'h7)] ?
                      ($unsigned(reg83[(3'h5):(2'h3)]) >>> $unsigned(wire75[(4'h8):(4'h8)])) : $signed((8'ha3)));
  assign wire93 = (wire87 ?
                      (((~|{(8'ha5), wire76}) + ($unsigned(reg83) ?
                              (|wire69) : $signed(wire87))) ?
                          wire74[(3'h6):(2'h2)] : (7'h41)) : (^~wire91[(1'h0):(1'h0)]));
endmodule

module module13
#(parameter param60 = (((-(~((8'hb3) ? (8'ha7) : (8'ha7)))) ? (^~(~((8'ha3) ? (8'hb6) : (8'hb7)))) : (+(+(!(7'h42))))) << ((((~(8'hba)) ? ((8'ha8) >= (8'hbb)) : (~(8'hb0))) ? (((8'hbc) != (7'h43)) * ((8'hb1) >>> (7'h41))) : ((+(8'hb5)) ? ((8'h9f) ? (8'hae) : (8'haf)) : (~^(8'haf)))) ? (+(7'h41)) : (8'hab))), 
parameter param61 = (param60 ? {param60} : ((-{(param60 ? param60 : param60)}) < (param60 ? {param60} : param60))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h214):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire20,
                 wire19,
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
                 reg47,
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
                 (1'h0)};
  assign wire19 = wire18;
  assign wire20 = (^~((({wire18, wire19} ?
                      {wire17, wire19} : (8'hb8)) ^ ($signed(wire18) ?
                      (^~wire14) : {(8'hb7)})) * ($signed((~&wire16)) << wire18[(3'h5):(3'h4)])));
  always
    @(posedge clk) begin
      if (wire18)
        begin
          reg21 <= wire15[(3'h7):(1'h0)];
          if ($unsigned((+(-wire17[(3'h6):(2'h2)]))))
            begin
              reg22 <= reg21[(1'h0):(1'h0)];
              reg23 <= (wire16[(5'h13):(3'h4)] >= (wire14[(3'h4):(3'h4)] ^~ ({wire14} ?
                  (reg21[(2'h3):(1'h0)] == (^wire20)) : (8'ha1))));
              reg24 <= $unsigned(($unsigned(((-reg22) >> (wire20 && wire20))) ?
                  wire15 : (+$signed(reg21))));
              reg25 <= $signed(reg22);
            end
          else
            begin
              reg22 <= (reg21 ?
                  (&$unsigned({(wire17 ^~ wire14)})) : reg21[(5'h14):(4'h8)]);
              reg23 <= (^~(wire15 ?
                  $signed((8'hb1)) : (~^((reg21 + reg24) ?
                      $signed(wire16) : wire19))));
            end
          reg26 <= $signed($unsigned((^$signed($unsigned((8'hac))))));
          reg27 <= $unsigned(((!wire14) << reg23));
        end
      else
        begin
          reg21 <= reg26;
          reg22 <= (-((|{(reg26 ?
                  wire15 : wire16)}) + (~^$unsigned((reg27 - wire15)))));
          reg23 <= $unsigned($signed(wire19[(2'h3):(1'h1)]));
          reg24 <= (^~reg25[(3'h6):(3'h6)]);
        end
      if ((^reg21))
        begin
          if (wire18)
            begin
              reg28 <= {(!(reg21 ? $signed(reg27) : reg23[(2'h3):(1'h1)])),
                  $signed($signed(wire16[(5'h11):(3'h7)]))};
              reg29 <= ($unsigned($signed((~&wire19))) <= reg28[(3'h4):(1'h0)]);
              reg30 <= (reg29 ?
                  $unsigned((~(+(&wire15)))) : reg22[(3'h5):(2'h3)]);
              reg31 <= ({(reg28[(1'h0):(1'h0)] & {reg22[(4'he):(4'hc)],
                          (reg28 > reg25)}),
                      (wire19[(1'h1):(1'h0)] ?
                          {$unsigned(wire20)} : wire20[(3'h5):(2'h2)])} ?
                  reg28[(1'h0):(1'h0)] : $unsigned(({(wire14 <<< reg28)} ?
                      $signed({reg27,
                          (7'h43)}) : $unsigned(wire14[(3'h7):(2'h2)]))));
              reg32 <= wire16[(5'h12):(1'h1)];
            end
          else
            begin
              reg28 <= reg29[(3'h4):(1'h1)];
              reg29 <= ((($signed($unsigned((8'ha9))) ?
                          $unsigned(reg29[(2'h3):(1'h1)]) : $unsigned((~|reg28))) ?
                      reg28 : wire17[(3'h7):(1'h1)]) ?
                  $signed((($signed(reg26) ?
                          (reg25 ? reg26 : reg21) : (8'h9f)) ?
                      reg22 : ($unsigned(reg24) > reg31[(3'h6):(1'h0)]))) : (reg24[(3'h6):(2'h2)] ?
                      $unsigned((reg30[(4'he):(2'h3)] ?
                          $signed(wire15) : wire20[(1'h0):(1'h0)])) : (({reg21,
                          reg32} >= wire14[(3'h7):(1'h1)]) ^~ ((wire15 ^ wire19) == wire18))));
              reg30 <= (^($signed($unsigned(((8'had) && reg23))) & (-wire16)));
              reg31 <= wire15[(1'h1):(1'h0)];
            end
          reg33 <= $signed($unsigned(($unsigned(reg21) >> $signed(reg31))));
        end
      else
        begin
          reg28 <= $signed((wire15[(2'h2):(1'h1)] ?
              ((&$signed((8'ha1))) >> wire20) : {reg22[(3'h5):(3'h5)],
                  ($unsigned(wire16) >= wire17)}));
        end
      if (((wire18 | $unsigned($unsigned(reg26))) ?
          ((~$signed((wire20 ? reg21 : reg29))) ?
              {(-$unsigned(reg33)),
                  wire18[(4'hd):(3'h6)]} : (^~($signed(wire20) * $unsigned(reg24)))) : ((~&(8'ha0)) ^~ (^~($unsigned(wire17) ?
              wire17[(1'h1):(1'h0)] : $unsigned((8'ha1)))))))
        begin
          reg34 <= (^~$signed(({wire19[(3'h4):(2'h2)]} ?
              ($unsigned(wire18) ?
                  (wire18 ?
                      wire19 : reg23) : $unsigned(wire15)) : (~&(~&reg24)))));
        end
      else
        begin
          reg34 <= $unsigned($signed((-wire17[(2'h3):(1'h0)])));
          if (reg31[(3'h7):(1'h0)])
            begin
              reg35 <= $unsigned($signed(($signed($unsigned(reg34)) ?
                  $unsigned((reg26 ? wire16 : (8'hbd))) : $unsigned(reg33))));
              reg36 <= reg25[(3'h5):(1'h1)];
              reg37 <= (+wire16[(3'h5):(1'h1)]);
            end
          else
            begin
              reg35 <= ($unsigned((wire16[(5'h13):(4'hf)] ?
                  (~reg34) : wire14)) ^ $unsigned($unsigned(((reg22 * (8'hb0)) <<< reg37[(1'h0):(1'h0)]))));
              reg36 <= reg35;
            end
          reg38 <= $unsigned($signed(reg31[(1'h1):(1'h1)]));
          reg39 <= reg26;
        end
      reg40 <= ((reg37 ^ (~&$unsigned({reg23}))) && ({$signed((reg33 ?
              (8'h9c) : reg26)),
          wire19[(1'h1):(1'h1)]} | (reg37 ? reg23[(4'h9):(4'h9)] : (~^reg25))));
    end
  assign wire41 = (-(reg30 ?
                      $unsigned(reg28) : (((wire19 >= wire16) ~^ (wire14 ?
                          (8'hbb) : (8'hb5))) && ($unsigned(reg39) ?
                          $signed(reg39) : (reg24 & reg21)))));
  assign wire42 = (~&(!(&((~^(8'ha7)) ? {(7'h43)} : (reg33 + reg27)))));
  assign wire43 = $signed($signed(reg25));
  assign wire44 = $unsigned($unsigned($signed($unsigned($unsigned(reg22)))));
  assign wire45 = wire14[(2'h3):(2'h3)];
  assign wire46 = $signed(reg32[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      if (((8'hb8) | ($unsigned(((wire19 ? reg36 : reg38) ?
              {wire46} : (reg39 ? (7'h44) : reg25))) ?
          (reg23 ?
              (((7'h40) ^~ wire19) >> $signed(wire42)) : reg40) : (~{(8'haf),
              (~&reg32)}))))
        begin
          reg47 <= ($signed(reg38) ^ $signed(reg28));
        end
      else
        begin
          reg47 <= (8'hb6);
          reg48 <= ($unsigned((|$unsigned(reg37))) != $unsigned(reg21));
          if (reg37[(1'h0):(1'h0)])
            begin
              reg49 <= (((reg28[(1'h0):(1'h0)] || (^((8'hb9) ?
                      wire14 : reg39))) == $signed((!(-wire19)))) ?
                  (!$unsigned((^~reg31[(2'h3):(1'h1)]))) : ($signed(((8'hbe) ?
                      {wire15, reg36} : (reg37 ?
                          wire18 : (8'hb6)))) >> ($signed($signed((8'h9f))) ?
                      ((wire17 ?
                          reg23 : reg25) <<< (-reg31)) : (reg39[(5'h10):(1'h0)] >>> $signed((8'ha6))))));
              reg50 <= ($signed($unsigned(reg36[(1'h1):(1'h1)])) == wire17);
              reg51 <= reg22;
            end
          else
            begin
              reg49 <= (((^(reg27 ?
                  $signed(reg35) : reg50[(4'hf):(4'hd)])) << wire44) ~^ reg47);
            end
          reg52 <= $unsigned(wire44);
        end
      if (reg25[(3'h4):(1'h1)])
        begin
          reg53 <= $signed($signed($signed(((reg38 >= wire46) ?
              wire14[(4'h8):(1'h1)] : $unsigned(wire16)))));
        end
      else
        begin
          reg53 <= {{(reg36[(2'h3):(2'h3)] ?
                      wire18[(4'hc):(3'h7)] : ($unsigned(reg30) ?
                          ((8'h9f) ? reg29 : reg28) : $signed(reg32))),
                  reg38[(2'h3):(2'h3)]}};
          reg54 <= ((8'hb4) > $unsigned($signed(reg30[(4'ha):(1'h1)])));
          reg55 <= reg31;
        end
      reg56 <= wire16[(3'h6):(1'h0)];
      reg57 <= $unsigned({{(^~$signed(reg21))},
          ((~|$unsigned(wire44)) ? reg22[(3'h7):(1'h0)] : $signed(wire15))});
    end
  assign wire58 = $unsigned((wire45[(3'h7):(1'h0)] ?
                      $signed($signed(wire41[(2'h2):(1'h0)])) : $signed((!(reg21 << reg34)))));
  assign wire59 = $unsigned($unsigned(reg25[(2'h2):(1'h0)]));
endmodule
