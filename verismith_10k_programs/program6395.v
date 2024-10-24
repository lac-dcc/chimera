module top
#(parameter param125 = (((7'h43) ~^ (((!(8'hb6)) ? ((8'hb8) ? (8'h9c) : (8'ha5)) : {(8'hbe)}) ? {((8'hae) >= (8'ha3))} : {((8'hba) ? (8'hb8) : (8'hac)), (|(7'h43))})) ? ((~^(^((8'had) ? (8'ha9) : (8'ha8)))) ? {(((8'h9f) ? (8'hb1) : (8'h9e)) > (~|(8'hb0))), (((8'hb1) <= (8'hbc)) ^~ {(8'hac)})} : {{((7'h42) ^~ (8'hb8)), ((8'ha4) <= (8'hbc))}}) : (!(((~^(8'ha0)) || (^~(8'hb1))) & ({(8'hb3)} ? {(8'hb9), (8'ha3)} : (+(8'hbd)))))), 
parameter param126 = ({param125, (param125 ? param125 : (param125 ? (-param125) : (&param125)))} ? {((~(-param125)) ? (((8'hb0) ? param125 : (8'ha3)) > param125) : ((param125 ? param125 : param125) << {param125, param125}))} : ({({param125, param125} ? (+param125) : (param125 ~^ param125)), (&param125)} >>> param125)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  assign y = {wire123,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (wire1 >= (-wire0[(4'h9):(3'h6)]));
  assign wire5 = $unsigned((!(8'hbb)));
  assign wire6 = (^$unsigned($signed(wire0)));
  always
    @(posedge clk) begin
      reg7 <= (($signed(wire4) > $unsigned((^~(~^wire5)))) ?
          $unsigned((wire1[(1'h1):(1'h0)] ?
              $signed({wire2}) : (8'ha8))) : $unsigned(({$signed(wire1),
              wire1[(1'h1):(1'h0)]} >> (^(wire4 ? (8'hb8) : wire2)))));
      reg8 <= $unsigned(wire3);
      if (wire6[(4'h8):(2'h3)])
        begin
          reg9 <= (reg8[(1'h1):(1'h0)] == $unsigned({(~|$signed((8'ha8)))}));
          reg10 <= $unsigned(wire1[(1'h1):(1'h0)]);
          reg11 <= {wire0[(4'hb):(4'ha)]};
          reg12 <= (reg9 || (~(reg10 >= $unsigned($signed(wire1)))));
        end
      else
        begin
          reg9 <= (((reg10[(4'h9):(3'h4)] >>> $unsigned((8'hb9))) & ((~^(reg12 | reg8)) * $unsigned((~&wire0)))) ?
              (~&(~&((reg10 < reg11) && $signed(wire6)))) : $unsigned(wire3[(2'h3):(1'h0)]));
          reg10 <= (~^$unsigned($signed({(wire0 ? reg9 : reg8)})));
          reg11 <= (&reg8);
        end
      if ({(-wire2[(2'h3):(1'h0)])})
        begin
          reg13 <= wire0;
          reg14 <= (+((($unsigned(wire2) && {wire6}) ?
                  $unsigned((~|reg8)) : ({reg9, wire1} ?
                      $signed(wire6) : (reg12 & wire1))) ?
              (wire5 ? wire4 : wire4) : $signed({$signed(reg13)})));
          if ($unsigned(wire3))
            begin
              reg15 <= (8'ha6);
              reg16 <= reg15;
            end
          else
            begin
              reg15 <= $signed((~^(|(+(reg14 ? reg10 : wire3)))));
              reg16 <= (reg15[(2'h3):(2'h2)] + reg13[(4'ha):(3'h5)]);
              reg17 <= $unsigned($signed({($unsigned(reg9) ?
                      $signed(wire5) : (wire0 <= reg7)),
                  $signed((~&reg7))}));
            end
        end
      else
        begin
          reg13 <= {{(~&{$unsigned(reg11), (~wire5)})}, reg17[(2'h2):(1'h1)]};
          if (($signed(wire0) ?
              $signed((~&$signed($signed((8'had))))) : $signed(wire1[(1'h0):(1'h0)])))
            begin
              reg14 <= (reg17[(3'h7):(3'h4)] ?
                  $unsigned((|$unsigned($signed(wire5)))) : (wire5[(3'h6):(3'h6)] + (8'hb0)));
              reg15 <= (~^$unsigned((~&((&wire5) ?
                  wire4[(2'h3):(2'h2)] : wire5))));
              reg16 <= {($unsigned(((-(8'hb2)) ?
                          {reg7, reg9} : $signed(reg9))) ?
                      wire2 : (~^$unsigned(wire1))),
                  {$signed(((8'hae) ? reg9[(4'ha):(3'h6)] : (reg8 * wire3))),
                      (reg7 ? ($signed(wire1) >>> (~reg15)) : $signed(reg9))}};
              reg17 <= $signed((reg12[(4'hb):(4'h9)] ?
                  ($signed($unsigned(wire4)) ?
                      reg15 : (wire5[(1'h0):(1'h0)] <<< (+wire2))) : reg7));
              reg18 <= ((-$unsigned($signed($signed(reg10)))) < (^$signed(reg9)));
            end
          else
            begin
              reg14 <= wire2[(2'h2):(1'h1)];
            end
          reg19 <= (&(($unsigned((~^reg15)) | wire4) ^~ reg12[(4'hc):(4'h9)]));
          reg20 <= reg15[(4'h8):(3'h4)];
        end
    end
  module21 #() modinst124 (.wire26(wire2), .wire22(wire5), .y(wire123), .wire25(wire3), .clk(clk), .wire24(wire0), .wire23(reg16));
endmodule

module module21
#(parameter param121 = {(8'hb4)}, 
parameter param122 = {(^(~|param121))})
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire115;
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire57,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire59,
                 wire60,
                 wire61,
                 wire115,
                 (1'h0)};
  assign wire27 = {$unsigned(($unsigned((8'hab)) + (&$unsigned(wire25))))};
  assign wire28 = (^$unsigned($unsigned(wire23)));
  assign wire29 = (({wire24[(2'h3):(2'h3)], wire27} ?
                          (((wire22 ?
                              wire23 : wire23) || $signed(wire22)) * wire26) : {wire25[(3'h5):(2'h3)],
                              $unsigned((~wire25))}) ?
                      $unsigned($unsigned($unsigned({wire28}))) : (~&$signed($unsigned((wire24 + wire23)))));
  assign wire30 = (wire28[(3'h5):(3'h5)] ?
                      {wire23} : ($signed(((~(8'h9f)) - $unsigned(wire26))) > wire22));
  assign wire31 = $unsigned($unsigned(wire22));
  assign wire32 = ($signed({(7'h41)}) ~^ wire28);
  module33 #() modinst58 (.y(wire57), .wire38(wire23), .wire37(wire25), .wire34(wire28), .wire36(wire32), .wire35(wire24), .clk(clk));
  assign wire59 = (8'hbb);
  assign wire60 = wire22;
  assign wire61 = ($signed((wire23 <<< ($unsigned((8'ha4)) < (^~wire22)))) ?
                      $unsigned(wire28[(3'h4):(1'h1)]) : $unsigned((((&(8'ha6)) ?
                          $signed(wire26) : wire32[(1'h1):(1'h0)]) - ((~^wire59) ?
                          wire26[(4'h8):(3'h6)] : $signed(wire22)))));
  module62 #() modinst116 (.y(wire115), .wire66(wire59), .wire67(wire60), .clk(clk), .wire63(wire25), .wire65(wire24), .wire64(wire57));
  assign wire117 = ((8'haa) & wire27);
  assign wire118 = ({{(wire25 * (wire28 <<< wire27))},
                       (+(~|wire32))} < wire27[(4'h8):(3'h6)]);
  assign wire119 = (^$unsigned(((wire28[(3'h6):(2'h2)] + wire24) ?
                       (~&(wire23 <= (8'hbc))) : ((|wire32) < $unsigned(wire31)))));
  assign wire120 = (^$unsigned((!{{wire25, wire117},
                       (wire29 ? (8'hbc) : wire115)})));
endmodule

module module62
#(parameter param114 = ((~{(((8'ha1) & (8'hb4)) | {(8'hb3)}), (~^((8'hb7) ? (8'hbb) : (8'hac)))}) ? (^((((8'haf) ? (8'h9e) : (7'h44)) != ((8'hb3) == (8'hbe))) << (+((7'h40) ? (8'ha4) : (8'hab))))) : (-((((8'haa) >> (8'haf)) ? ((8'hbb) << (8'ha5)) : ((8'ha5) ? (8'h9c) : (8'h9c))) ? (((8'hbc) >= (8'ha2)) ~^ ((7'h42) ~^ (7'h40))) : {(~|(8'hac)), ((8'hb6) > (8'had))}))))
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire [(3'h6):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire113,
                 wire92,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
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
                 reg95,
                 reg94,
                 reg93,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire68 = ($signed(wire65) ? wire63[(4'hb):(3'h5)] : wire64);
  assign wire69 = $unsigned({(~&(~^(wire67 ? wire67 : wire67))),
                      (~$signed(wire68))});
  assign wire70 = (~|((~^wire63[(5'h10):(4'hb)]) ?
                      (^wire63[(1'h0):(1'h0)]) : wire65[(3'h5):(3'h5)]));
  assign wire71 = $unsigned((|$signed($signed(((8'hb8) ? (8'ha5) : wire66)))));
  assign wire72 = $signed((((+(wire65 ? wire63 : wire63)) ^ $signed({wire68,
                      wire69})) ^ wire71[(4'h9):(2'h2)]));
  assign wire73 = (((^wire64[(4'h9):(4'h9)]) ?
                      ({(wire69 ? wire63 : wire70),
                              (wire63 ? wire72 : wire69)} ?
                          wire67[(4'hc):(3'h5)] : ($signed((8'hb4)) ?
                              $signed(wire72) : (&wire70))) : ({(+(8'hb6))} >>> ((wire72 ?
                              wire64 : wire65) ?
                          $unsigned((7'h44)) : (wire63 >> wire65)))) >> $unsigned(({{(8'ha2),
                              (8'hb5)}} ?
                      {(~wire65)} : (~&(&wire63)))));
  assign wire74 = $signed((({wire70[(4'hd):(3'h6)]} != (~&$signed(wire64))) >> (~^wire73[(1'h0):(1'h0)])));
  assign wire75 = ((8'ha4) >> (wire65[(2'h3):(2'h3)] ?
                      $unsigned(($unsigned(wire74) ?
                          (wire63 ?
                              wire68 : wire70) : wire71)) : $signed(wire70)));
  always
    @(posedge clk) begin
      reg76 <= $signed((wire64[(1'h0):(1'h0)] * (&({(8'ha7), wire75} ?
          $signed(wire68) : {wire66}))));
      reg77 <= {$signed({$signed(wire69[(1'h0):(1'h0)])})};
      reg78 <= wire65[(2'h2):(1'h0)];
      reg79 <= $signed(wire75);
      reg80 <= wire71[(5'h10):(3'h6)];
    end
  assign wire81 = (8'hb0);
  assign wire82 = reg76[(4'h8):(2'h3)];
  assign wire83 = (reg79 + (^~{$signed({reg78, wire67}),
                      (-(wire69 ? wire73 : wire69))}));
  assign wire84 = wire66;
  assign wire85 = $signed((^(+wire75[(3'h6):(2'h3)])));
  assign wire86 = $signed($signed(((~&(wire83 >= wire82)) + wire66)));
  always
    @(posedge clk) begin
      if (wire84)
        begin
          reg87 <= $signed(reg77);
        end
      else
        begin
          reg87 <= {(~(((8'hae) + (reg76 ~^ (8'hab))) >>> wire65))};
        end
      reg88 <= (|wire83);
      reg89 <= $unsigned($signed(reg87));
      reg90 <= ($unsigned({(wire65 ? $signed(wire73) : {(8'ha1)})}) ~^ wire75);
      reg91 <= wire66;
    end
  assign wire92 = (&((((wire84 * wire65) ?
                      wire74[(2'h2):(2'h2)] : reg76[(4'h9):(4'h8)]) >>> $unsigned((|(8'hbb)))) <= ((~&$signed((8'hb8))) != $signed($signed(reg90)))));
  always
    @(posedge clk) begin
      if (wire84)
        begin
          if ((8'ha0))
            begin
              reg93 <= wire64;
              reg94 <= wire71[(4'hd):(3'h5)];
              reg95 <= $unsigned($signed(wire74[(1'h0):(1'h0)]));
              reg96 <= {$signed(wire82)};
              reg97 <= (((~(((8'ha1) ~^ wire64) || wire73)) ?
                      {$signed($unsigned(wire86))} : $signed(reg80)) ?
                  (8'hb0) : ($unsigned($signed({(7'h43)})) ?
                      $unsigned(reg96) : reg91));
            end
          else
            begin
              reg93 <= reg80[(3'h6):(1'h1)];
              reg94 <= $unsigned((-((~(^~reg78)) >> wire63)));
              reg95 <= (~&(|(reg95 ?
                  {$unsigned(reg79),
                      ((8'hab) << wire83)} : (wire63[(4'hf):(1'h1)] ?
                      (!wire65) : $signed(reg77)))));
            end
          reg98 <= wire72[(1'h0):(1'h0)];
          reg99 <= reg94[(4'hf):(4'hd)];
        end
      else
        begin
          reg93 <= ($unsigned(wire72[(4'h9):(4'h8)]) ?
              ($unsigned(reg76[(3'h7):(1'h0)]) | (((wire66 ?
                      reg91 : wire63) >>> reg79) ?
                  $unsigned((wire63 == (8'hb8))) : (+(~|reg88)))) : reg88);
        end
      if ($signed($signed(wire83[(1'h0):(1'h0)])))
        begin
          if ((+$unsigned((-(+(~&reg94))))))
            begin
              reg100 <= (wire75 ?
                  $unsigned($signed(reg76[(4'h8):(3'h7)])) : ((-wire73) ?
                      wire65 : (($signed(reg77) || $unsigned(wire70)) < (~|$unsigned(wire92)))));
              reg101 <= $unsigned((&(~(^~reg78[(3'h7):(2'h3)]))));
              reg102 <= wire68[(3'h7):(1'h0)];
              reg103 <= $unsigned($signed(reg95));
              reg104 <= wire85;
            end
          else
            begin
              reg100 <= {(8'hbf)};
              reg101 <= (~^($unsigned((-reg76[(4'h8):(2'h2)])) ?
                  (wire63[(5'h15):(4'hc)] ?
                      ((-reg76) - (wire85 ?
                          wire71 : reg80)) : (+reg76[(2'h2):(2'h2)])) : (|($signed(reg95) ?
                      $signed(reg88) : reg89))));
            end
          if ({{$signed(wire84)}})
            begin
              reg105 <= (8'hb0);
              reg106 <= ((^~reg104) ?
                  (+$signed(wire64)) : {((^$signed(reg76)) ?
                          wire72 : {(wire74 + reg76), (~^wire86)}),
                      (reg91[(4'h9):(2'h2)] ?
                          (!wire71[(3'h7):(1'h0)]) : $unsigned(((8'hba) > reg94)))});
              reg107 <= (+(^$signed((reg93 ? $signed(wire86) : reg90))));
            end
          else
            begin
              reg105 <= (-(&{reg106[(4'hb):(2'h2)], $unsigned((8'hb0))}));
              reg106 <= (|((((reg106 ? (8'h9f) : reg96) >> (-wire92)) ?
                  $signed((wire84 << (8'hb8))) : reg101) <<< (reg105 <= wire85)));
              reg107 <= {reg96};
              reg108 <= {((($unsigned((8'hbd)) ?
                          $unsigned(wire69) : (reg104 * wire64)) << $signed((~|reg98))) ?
                      ($unsigned(reg90[(1'h0):(1'h0)]) < reg87) : reg93[(3'h6):(2'h3)])};
            end
          reg109 <= $unsigned($unsigned(wire70[(4'ha):(4'h8)]));
        end
      else
        begin
          reg100 <= wire70[(5'h13):(4'hc)];
          reg101 <= $signed({((^~wire84[(4'h8):(2'h3)]) ^ reg105)});
          reg102 <= ({{reg108, reg107[(4'hd):(3'h4)]},
              ((~&(reg104 * wire68)) ?
                  wire86[(3'h5):(2'h3)] : wire64[(3'h7):(2'h3)])} || (8'hb7));
        end
      reg110 <= wire71[(4'hd):(2'h3)];
      reg111 <= ($unsigned(wire69) ~^ (($unsigned(reg91[(4'hc):(4'h9)]) ^~ ((reg95 + wire83) >> {reg105,
          reg94})) >>> {{{reg110}}, $unsigned((wire85 + wire82))}));
      reg112 <= reg91;
    end
  assign wire113 = $signed((~^($signed($signed(reg109)) <= (((8'ha3) ~^ (8'haf)) ?
                       wire67[(2'h3):(2'h2)] : $unsigned(reg80)))));
endmodule

module module33
#(parameter param55 = (|({(((8'h9c) - (8'ha9)) * (~|(8'had)))} & (((~(8'hb3)) ? ((8'haf) ? (8'ha4) : (8'ha7)) : ((8'hbd) >= (8'ha4))) ? (((8'h9f) ~^ (8'hb1)) + ((8'hb0) ? (8'haa) : (8'ha6))) : (^~{(8'ha4), (8'had)})))), 
parameter param56 = param55)
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire38;
  input wire [(3'h6):(1'h0)] wire37;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire42,
                 wire41,
                 wire40,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= (~^$unsigned(((wire34 || ((8'ha6) ~^ wire38)) || {(wire37 ?
              wire35 : wire36),
          wire37[(2'h2):(1'h1)]})));
    end
  assign wire40 = wire37[(3'h4):(3'h4)];
  assign wire41 = ((!wire37[(1'h0):(1'h0)]) ?
                      ((((~(8'had)) && wire37) ?
                              reg39[(2'h2):(1'h0)] : $signed(wire36)) ?
                          wire40[(1'h1):(1'h0)] : (wire40[(1'h1):(1'h1)] != $unsigned($signed(reg39)))) : $signed($unsigned(((~wire35) ?
                          wire38[(4'ha):(3'h4)] : (8'hac)))));
  assign wire42 = (~&($signed($unsigned((+wire41))) < (8'hb9)));
  always
    @(posedge clk) begin
      reg43 <= wire42[(2'h2):(1'h0)];
      reg44 <= ((^({(^~(8'hbc))} & (wire41 & (wire34 <= (7'h40))))) - wire42[(2'h2):(1'h1)]);
      reg45 <= wire35[(1'h0):(1'h0)];
      reg46 <= wire41[(4'ha):(2'h3)];
    end
  assign wire47 = wire40[(2'h2):(1'h0)];
  assign wire48 = (!$unsigned((~(~&$signed(wire41)))));
  assign wire49 = {$unsigned(reg43),
                      ((($signed(wire36) ?
                          {wire41} : reg39) << wire41[(3'h5):(3'h5)]) > wire38[(1'h0):(1'h0)])};
  assign wire50 = wire49;
  assign wire51 = (^wire40[(1'h1):(1'h0)]);
  assign wire52 = (&(((~|$unsigned(wire50)) ^ $signed($signed(wire40))) <= (reg39[(1'h1):(1'h0)] ?
                      ((8'ha0) - wire38) : reg43[(4'hd):(4'hc)])));
  assign wire53 = wire48;
  assign wire54 = (+wire50[(1'h1):(1'h1)]);
endmodule
