module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire128;
  wire [(3'h7):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(3'h4):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire25;
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire25,
                 reg5,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(2'h2):(2'h2)];
      reg6 <= ({wire3[(3'h6):(3'h5)]} | ({$signed(wire1)} ?
          ($signed({wire4}) > ($signed(wire2) > (+wire3))) : ($unsigned(wire1) >= wire0[(3'h7):(3'h7)])));
      if ((wire4[(3'h4):(1'h1)] ?
          (reg5 ?
              ($unsigned((wire4 ? (8'h9d) : (8'ha9))) ?
                  ((^reg5) + (~|wire4)) : wire1) : {(~&(wire2 <= (8'ha0))),
                  wire0}) : $unsigned(($unsigned(wire0[(4'h8):(3'h7)]) || ({wire0,
              reg5} == (^~wire4))))))
        begin
          reg7 <= wire0;
          reg8 <= (8'hb8);
          if ($unsigned((~|($unsigned((8'ha1)) > $signed($unsigned(reg7))))))
            begin
              reg9 <= reg5[(3'h7):(2'h2)];
              reg10 <= $signed($unsigned(reg5[(1'h1):(1'h0)]));
            end
          else
            begin
              reg9 <= wire1;
              reg10 <= ({($signed((wire0 > wire0)) ?
                      $unsigned(reg5[(3'h5):(1'h1)]) : $unsigned(reg5))} & (reg10 ?
                  reg8[(2'h2):(1'h0)] : (~^(&(|reg6)))));
              reg11 <= (&reg9[(3'h4):(1'h0)]);
            end
          if (wire4[(2'h2):(1'h0)])
            begin
              reg12 <= $signed($signed((|(~&(8'hb1)))));
            end
          else
            begin
              reg12 <= wire1;
              reg13 <= wire1;
              reg14 <= ((&wire1[(2'h2):(1'h1)]) <= ((reg7 ?
                  {(reg12 ? (8'ha3) : reg7),
                      $unsigned(wire4)} : reg12[(2'h2):(1'h1)]) ^~ ($unsigned((reg13 ?
                  reg13 : wire2)) >>> (!reg8[(1'h0):(1'h0)]))));
              reg15 <= ($signed(wire1) >= (reg12[(2'h2):(1'h1)] + reg5[(3'h4):(1'h1)]));
            end
          reg16 <= $signed((wire1[(1'h1):(1'h0)] >>> $unsigned($unsigned({reg6,
              (8'haa)}))));
        end
      else
        begin
          reg7 <= wire0[(3'h6):(2'h2)];
          reg8 <= (~|($unsigned((reg5 ?
                  reg14[(1'h0):(1'h0)] : $signed(wire2))) ?
              reg15 : $unsigned(reg16[(3'h4):(3'h4)])));
          if ($signed($unsigned({(8'ha9)})))
            begin
              reg9 <= ((wire2 ?
                  reg6 : $unsigned(((|reg14) ?
                      (~reg8) : {reg5, wire1}))) >= reg15);
              reg10 <= reg14;
              reg11 <= reg6;
              reg12 <= (((!{$unsigned(wire0),
                      reg6}) != $unsigned(reg14[(1'h1):(1'h0)])) ?
                  (wire1 > reg13[(5'h14):(3'h4)]) : $unsigned($signed((reg6 ?
                      (8'h9e) : reg9[(3'h4):(3'h4)]))));
            end
          else
            begin
              reg9 <= $unsigned(($unsigned(reg8[(1'h0):(1'h0)]) ?
                  {(~&$signed(wire0)), {reg6, $unsigned(reg10)}} : wire2));
              reg10 <= (|$unsigned((reg14[(1'h1):(1'h0)] ?
                  $signed((reg9 ? wire0 : reg11)) : (reg10 ?
                      reg16[(2'h2):(1'h0)] : $signed(reg10)))));
              reg11 <= reg13;
              reg12 <= (~|$signed({$signed(reg8),
                  ($unsigned(reg8) ? (~reg6) : (reg10 ? reg8 : reg11))}));
            end
          reg13 <= reg12;
        end
      if (reg5[(1'h0):(1'h0)])
        begin
          reg17 <= (|$signed(wire1));
        end
      else
        begin
          reg17 <= $signed($unsigned((~^((reg7 * (7'h43)) >= $unsigned(reg14)))));
          reg18 <= reg9;
          reg19 <= ((-reg15[(3'h6):(2'h2)]) ?
              reg8 : (~&{($signed(wire1) ? (~|reg5) : $unsigned(reg11))}));
          reg20 <= $unsigned({$signed($signed((|reg11))),
              $signed((^~{reg17}))});
          if ((~|reg19))
            begin
              reg21 <= wire4[(3'h6):(1'h0)];
              reg22 <= (-(reg16[(1'h1):(1'h0)] ?
                  ($unsigned((wire4 <= wire3)) > $signed($unsigned((8'hb6)))) : wire3));
              reg23 <= reg13;
              reg24 <= $signed((reg8 < (((reg23 ^ (8'h9c)) | ((8'ha9) ?
                      wire3 : reg10)) ?
                  $signed((8'hae)) : ((reg17 ^~ (8'ha6)) && $signed(reg14)))));
            end
          else
            begin
              reg21 <= $signed({wire0,
                  $signed(($signed(wire4) ? (reg15 ~^ reg5) : (~&reg5)))});
              reg22 <= $signed({$unsigned($unsigned((reg21 ? (8'haa) : wire4))),
                  (-(8'haf))});
            end
        end
    end
  assign wire25 = reg24;
  module26 #() modinst121 (wire120, clk, reg24, reg7, reg21, reg6, reg16);
  assign wire122 = $unsigned(((&$unsigned(reg19[(1'h1):(1'h1)])) * ($signed({reg15}) >= reg16)));
  assign wire123 = ($signed((8'hb0)) ?
                       (~^((~$unsigned(reg10)) || $signed($unsigned(wire25)))) : $signed(reg22[(2'h3):(2'h2)]));
  assign wire124 = $unsigned({({$signed(wire3), $signed(reg10)} ?
                           (8'h9f) : reg8[(1'h1):(1'h0)])});
  assign wire125 = $unsigned(((~|$unsigned((^~reg10))) < $unsigned((reg7 ?
                       wire4 : reg17[(3'h4):(1'h1)]))));
  assign wire126 = $signed(($signed({$signed(wire120),
                       (wire3 ?
                           wire120 : reg10)}) | ($unsigned(wire122) >= ((|wire4) ?
                       (8'hba) : wire120))));
  assign wire127 = reg23;
  assign wire128 = (reg13[(2'h3):(1'h1)] && reg5[(2'h3):(2'h2)]);
endmodule

module module26
#(parameter param119 = (~|((((~|(8'ha6)) ? ((8'haa) > (8'haa)) : ((8'ha3) ^ (8'h9e))) >> {(~(8'hb7)), ((7'h43) ? (8'hac) : (8'hbf))}) & ((|((8'hbf) * (7'h43))) ? (~|((8'hbf) < (8'hb5))) : ({(8'hb5)} ? ((8'ha3) + (8'hbb)) : ((8'ha9) | (8'ha3)))))))
(y, clk, wire27, wire28, wire29, wire30, wire31);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire117;
  assign y = {wire32, wire33, wire65, wire67, wire68, wire117, (1'h0)};
  assign wire32 = ({wire31} ? wire28[(1'h1):(1'h1)] : (8'hb7));
  assign wire33 = (wire27[(1'h1):(1'h0)] ?
                      ($unsigned($unsigned(wire30[(2'h3):(2'h3)])) ?
                          (-$signed((wire31 != (8'hb1)))) : (~|$signed({wire31}))) : wire30);
  module34 #() modinst66 (wire65, clk, wire31, wire32, wire27, wire29);
  assign wire67 = $signed(wire30);
  assign wire68 = wire31;
  module69 #() modinst118 (wire117, clk, wire31, wire33, wire32, wire27, wire28);
endmodule

module module69
#(parameter param116 = ((((((8'h9d) ? (8'hbf) : (7'h41)) ? {(8'had)} : (^(8'hab))) || (|{(8'hb6), (8'ha7)})) ? ((~&(+(8'h9c))) == ((~(8'hb7)) ? ((8'hb3) <= (8'ha6)) : (7'h44))) : ((((8'ha3) ? (8'h9f) : (7'h44)) ? {(7'h41), (8'hb9)} : {(8'hb5), (8'hb8)}) ? ({(8'hab)} ? {(8'hb6), (8'hbf)} : (~|(8'hb3))) : {((8'hbc) ? (8'hb1) : (8'ha9)), ((7'h44) << (8'ha5))})) & ((((~&(8'hb7)) << ((8'ha6) ? (8'hab) : (8'hba))) ? (|{(8'hb0), (8'hab)}) : (~&{(8'hba)})) || ((((8'hb6) ? (8'h9d) : (8'hb1)) <<< (~&(8'ha0))) != ({(8'hb0), (8'ha9)} ? {(8'hb4)} : ((8'hba) ? (8'haa) : (8'hbb)))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire74;
  input wire [(2'h3):(1'h0)] wire73;
  input wire signed [(4'ha):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire [(4'hc):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire100,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
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
                 (1'h0)};
  assign wire75 = ($signed((&$unsigned($unsigned(wire70)))) >>> $unsigned(wire70));
  assign wire76 = (wire73[(2'h3):(2'h2)] | wire75[(4'h9):(3'h6)]);
  assign wire77 = (8'hb7);
  assign wire78 = (|(~|$signed(wire73)));
  assign wire79 = $signed(($signed($signed((-wire77))) >>> ({(wire73 ?
                          wire76 : wire73),
                      wire75} >>> {(-wire71), wire78})));
  assign wire80 = (wire76 ^~ wire75);
  assign wire81 = wire78;
  assign wire82 = wire72[(2'h2):(1'h1)];
  assign wire83 = (wire79[(4'h8):(3'h7)] < $signed($unsigned(wire78[(4'h8):(3'h4)])));
  assign wire84 = (~&((((|wire75) ? ((8'hac) <= wire82) : (+(8'h9e))) ?
                          $unsigned((^(7'h40))) : wire70) ?
                      wire78 : $signed(wire77)));
  assign wire85 = $signed((8'hb2));
  assign wire86 = wire70;
  assign wire87 = wire72;
  assign wire88 = ({(8'ha8)} >= wire81);
  assign wire89 = (^~(^~wire74[(4'hb):(3'h4)]));
  always
    @(posedge clk) begin
      if (((|$unsigned(wire84[(4'hb):(4'h8)])) > (!(wire76 ?
          {wire78, (|(8'hbe))} : wire76))))
        begin
          if ($signed($unsigned(wire83)))
            begin
              reg90 <= wire78[(1'h0):(1'h0)];
              reg91 <= (8'hae);
              reg92 <= $signed((-($signed(((8'hbf) + wire80)) ?
                  ((wire86 ^ (8'hb2)) > $signed((8'ha4))) : reg90)));
            end
          else
            begin
              reg90 <= wire72;
              reg91 <= $unsigned(wire77[(2'h3):(2'h2)]);
              reg92 <= {(8'hab)};
              reg93 <= (((wire72 ?
                      wire77[(4'ha):(2'h2)] : ($signed(wire79) ?
                          $signed(wire73) : (8'hb5))) >> $unsigned(({wire80,
                          wire80} ?
                      (wire72 ~^ wire75) : $unsigned(wire72)))) ?
                  ($unsigned(wire85[(2'h2):(1'h0)]) & $signed($signed($signed(wire80)))) : wire88);
              reg94 <= ((^~$signed((((7'h43) ^ wire86) < $unsigned(wire70)))) ~^ wire76[(4'h9):(2'h3)]);
            end
          reg95 <= wire89;
          if ({{reg94,
                  ($unsigned((reg95 ? wire82 : wire81)) ?
                      $signed($unsigned(wire74)) : ((wire80 ?
                          (8'hb7) : wire73) > (wire79 ? (7'h40) : reg94)))},
              $signed($unsigned(((~&reg93) ^~ $unsigned(wire83))))})
            begin
              reg96 <= wire81;
              reg97 <= $signed((((^~wire86[(4'h8):(3'h7)]) ?
                  (wire73 || wire83[(4'hd):(2'h3)]) : wire80[(2'h2):(2'h2)]) * ($signed({(8'hbb),
                  wire74}) & (7'h41))));
              reg98 <= (wire88 * wire85[(2'h3):(1'h0)]);
            end
          else
            begin
              reg96 <= $unsigned(reg96);
              reg97 <= $signed({(^~(wire87[(2'h3):(1'h0)] ?
                      $unsigned(reg98) : (8'hb9)))});
              reg98 <= ($signed(wire76[(4'h8):(3'h4)]) ?
                  (8'ha2) : ((~^(^reg93[(1'h1):(1'h1)])) == ({(wire89 != wire73),
                          (!reg97)} ?
                      (reg96[(2'h2):(2'h2)] ?
                          (~&reg98) : (wire76 ?
                              reg92 : wire83)) : $unsigned({wire89}))));
            end
          reg99 <= (wire79[(4'ha):(1'h1)] ?
              $unsigned($signed((!$signed(wire84)))) : $unsigned((~&$signed($unsigned(reg98)))));
        end
      else
        begin
          reg90 <= wire80[(2'h2):(1'h1)];
        end
    end
  assign wire100 = reg91;
  always
    @(posedge clk) begin
      if ($unsigned(reg91[(3'h6):(1'h1)]))
        begin
          reg101 <= ((^$signed((reg96 ?
                  ((8'h9d) ? wire70 : wire87) : (-reg98)))) ?
              wire73 : ((^~($signed(wire72) ?
                  reg91[(3'h7):(1'h1)] : wire79)) == $unsigned(($signed(wire86) ?
                  wire73[(2'h3):(1'h0)] : (wire83 >= (8'ha9))))));
        end
      else
        begin
          reg101 <= reg92;
          reg102 <= $signed(reg96);
          reg103 <= reg99;
          reg104 <= reg95;
          reg105 <= (((~&wire81) >>> $unsigned((&(reg102 && reg104)))) ?
              wire76[(4'hb):(4'h8)] : $unsigned(wire84));
        end
      reg106 <= reg101[(2'h3):(1'h0)];
      reg107 <= wire88[(4'h9):(3'h4)];
      reg108 <= (8'haa);
      if (($signed(($unsigned(wire79[(3'h4):(1'h1)]) ?
              (reg91 < $signed(wire87)) : ((reg91 > wire74) ?
                  {wire72} : reg106[(2'h3):(2'h3)]))) ?
          (reg93[(3'h5):(3'h4)] ?
              ((reg94[(3'h5):(3'h5)] >= (^~wire75)) <= ((reg108 >= (7'h41)) <= $signed(reg97))) : $unsigned((wire81[(2'h3):(2'h2)] ?
                  reg105[(1'h0):(1'h0)] : reg91))) : {$unsigned(((wire72 ?
                      (8'hb5) : wire82) ?
                  {wire84, reg108} : (wire78 || wire78)))}))
        begin
          reg109 <= (^($signed($signed((&wire75))) ?
              wire89 : (&$signed((reg96 && reg97)))));
          reg110 <= wire80;
          reg111 <= wire100;
          reg112 <= (&(~^(-reg90[(5'h15):(3'h5)])));
          reg113 <= reg101[(2'h3):(2'h3)];
        end
      else
        begin
          reg109 <= $signed(reg112[(5'h12):(4'ha)]);
          reg110 <= $unsigned($unsigned($unsigned(($unsigned(wire83) ?
              $signed(wire82) : $unsigned(reg99)))));
        end
    end
  assign wire114 = (8'hae);
  assign wire115 = {((~^(~&$signed(wire88))) ?
                           (($unsigned(wire71) ? $signed(wire77) : wire79) ?
                               $unsigned($signed((8'hb8))) : reg104) : {$unsigned((8'haa))}),
                       $signed(wire86[(4'he):(4'ha)])};
endmodule

module module34
#(parameter param63 = ({(((~(7'h43)) ? ((8'ha7) ? (8'hb6) : (8'ha0)) : ((8'had) <<< (8'ha8))) << ((~(8'hb7)) <= {(8'hb6)})), (|(((8'hbe) ? (8'h9e) : (8'hba)) ? (|(8'hbe)) : ((8'haa) ? (8'hac) : (8'had))))} ? (((((8'hb3) ? (8'ha8) : (8'h9d)) + (~(8'ha0))) * (((8'hac) <<< (8'hb2)) + ((8'h9d) ? (8'h9d) : (8'ha9)))) ? (-{(^~(8'hb7))}) : (((+(8'hb2)) >= ((7'h41) ? (8'hbc) : (8'ha1))) > {((8'ha8) | (8'ha1)), {(8'hbe)}})) : ((-(((8'ha0) ? (8'ha8) : (8'ha1)) <<< ((8'haf) ? (8'ha3) : (7'h40)))) >>> ((((8'hb2) ? (8'haf) : (8'hbc)) != ((8'ha8) & (8'hbf))) ? (((7'h44) & (8'hb4)) ? (^(8'ha3)) : {(8'hba), (8'ha6)}) : (((8'ha9) ~^ (8'ha0)) ? (~&(8'ha3)) : (~&(8'h9f)))))), 
parameter param64 = ({((7'h43) ? param63 : (~(^param63)))} >> ((^~(^~(param63 ? param63 : param63))) == (8'h9f))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire41,
                 wire40,
                 wire39,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire39 = $signed((^~(~|wire38)));
  assign wire40 = ($unsigned(wire35[(3'h6):(1'h0)]) ?
                      {wire35,
                          $unsigned((wire39[(2'h3):(1'h0)] ?
                              wire36[(1'h1):(1'h1)] : wire37))} : (~^(8'ha2)));
  assign wire41 = ($unsigned({(wire40 <<< (~(8'ha5)))}) ?
                      (&$signed(wire36[(1'h0):(1'h0)])) : $unsigned((({wire38} ?
                          ((8'hb0) ?
                              wire35 : wire40) : (^wire40)) | ($signed(wire40) >> {wire35,
                          wire40}))));
  always
    @(posedge clk) begin
      reg42 <= $unsigned((({(wire40 ? wire36 : wire38)} ?
              $signed((8'hb9)) : (^(+wire35))) ?
          $signed(wire36[(3'h6):(2'h2)]) : (+((wire37 ? wire35 : wire41) ?
              (wire40 <<< (8'hb9)) : ((8'hbe) >> (8'ha0))))));
    end
  always
    @(posedge clk) begin
      reg43 <= (($unsigned(($unsigned(wire39) ^~ $signed(wire41))) ?
          $unsigned((~^(wire37 & reg42))) : {$unsigned((wire35 & wire37))}) > (($unsigned({(8'ha8),
                  wire36}) ?
              $unsigned(wire39[(1'h1):(1'h1)]) : {wire38[(4'hc):(4'ha)]}) ?
          $signed(((~&wire37) ?
              (reg42 ~^ wire40) : $unsigned(wire36))) : wire35));
      if ((($unsigned(($unsigned(wire40) ^ (wire40 ?
          wire37 : wire35))) << (8'ha1)) ^~ ($unsigned($unsigned((+reg43))) ?
          reg42 : (-$unsigned((wire36 ? wire40 : reg42))))))
        begin
          reg44 <= $signed({wire37[(3'h7):(2'h3)]});
          reg45 <= (~|$signed(wire41));
          if (wire38)
            begin
              reg46 <= $signed(wire36);
            end
          else
            begin
              reg46 <= $unsigned((8'hb8));
            end
          if (reg46)
            begin
              reg47 <= wire35[(2'h2):(1'h0)];
              reg48 <= (8'hb1);
              reg49 <= $signed((({(^reg47)} <= {$signed(reg46),
                      (reg46 || (8'h9f))}) ?
                  (~^(wire38[(4'ha):(3'h5)] ?
                      reg42 : $unsigned(reg47))) : ($unsigned((wire36 <<< reg46)) ?
                      $signed((~^wire36)) : wire37)));
              reg50 <= $signed($unsigned({wire39}));
              reg51 <= wire41;
            end
          else
            begin
              reg47 <= ($unsigned($unsigned(wire37)) < ((^~(^~(wire40 ?
                      wire39 : wire39))) ?
                  reg51 : wire35[(1'h1):(1'h0)]));
              reg48 <= wire38;
              reg49 <= reg46[(4'h9):(3'h5)];
              reg50 <= ($unsigned(wire41[(4'h9):(3'h4)]) ?
                  wire36[(2'h2):(2'h2)] : (&wire35[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg44 <= reg44;
          reg45 <= ($signed(wire36[(1'h0):(1'h0)]) > reg50[(3'h4):(2'h3)]);
          reg46 <= wire37;
        end
      reg52 <= ($signed(($signed($unsigned(reg50)) >= ($unsigned(wire37) ?
          (~^(8'hb0)) : $unsigned(reg45)))) == ($unsigned($unsigned((wire39 <<< (8'ha9)))) > (($signed((8'hb6)) ~^ (reg44 ?
              reg49 : wire38)) ?
          ((^reg49) ? wire40[(3'h4):(1'h0)] : (~reg45)) : (reg46 <= wire38))));
    end
  assign wire53 = {wire40[(1'h0):(1'h0)], $signed((&reg42))};
  assign wire54 = reg52[(2'h2):(2'h2)];
  assign wire55 = $signed({({(|(8'haa)), reg45} <<< {reg48[(2'h3):(2'h2)],
                          (~&(8'ha6))}),
                      $signed({reg42, reg48[(3'h7):(1'h0)]})});
  assign wire56 = reg52;
  assign wire57 = {$unsigned((($unsigned(wire36) ?
                              (wire36 ?
                                  (8'hb9) : wire53) : wire37[(2'h3):(1'h0)]) ?
                          $unsigned((reg42 ?
                              reg49 : (8'hb7))) : (wire41 < $unsigned(wire53))))};
  assign wire58 = (8'hba);
  assign wire59 = (wire39 != reg42);
  assign wire60 = $signed((wire37 || (wire59 - ((wire38 ?
                      reg47 : wire58) <<< (^~(8'hb0))))));
  assign wire61 = ($unsigned((wire39[(2'h3):(2'h2)] ?
                          $unsigned((~&wire41)) : $unsigned({wire35,
                              wire54}))) ?
                      (wire58 >>> $unsigned(wire55)) : (wire59[(2'h2):(2'h2)] ?
                          reg44[(5'h11):(2'h2)] : {(reg52 ?
                                  (wire35 < reg51) : (-(8'hbb))),
                              $unsigned(reg45[(4'ha):(1'h0)])}));
  assign wire62 = $signed(wire60);
endmodule
