module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire7,
                 wire6,
                 wire5,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire5 = wire1[(3'h6):(1'h1)];
  assign wire6 = $signed(wire1[(3'h6):(2'h3)]);
  assign wire7 = {($unsigned($signed((&wire2))) ^ $signed(wire3))};
  module8 #() modinst123 (.wire11(wire2), .y(wire122), .wire10(wire7), .clk(clk), .wire9(wire6), .wire12(wire4));
  assign wire124 = $unsigned($unsigned((!$unsigned((wire4 ? wire3 : wire3)))));
  assign wire125 = wire4;
  assign wire126 = ($signed((~|($unsigned(wire7) ?
                       {wire122} : wire122[(5'h13):(4'ha)]))) * $signed(wire122[(4'h8):(3'h4)]));
  assign wire127 = $signed(wire2[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg128 <= wire4[(4'h9):(1'h0)];
      reg129 <= {((((wire0 ^~ wire7) ?
                  $unsigned(wire4) : wire127[(3'h5):(3'h5)]) ?
              wire6 : ($signed(wire125) & wire126[(1'h0):(1'h0)])) - (({wire6} ?
                  {(8'hbe)} : (wire126 <= wire0)) ?
              ((reg128 ? wire3 : wire124) ?
                  {wire2} : (wire122 ? (8'h9c) : wire127)) : (((8'ha8) ?
                      wire4 : wire126) ?
                  (wire4 ? wire4 : wire4) : (8'hbf))))};
    end
endmodule

module module8
#(parameter param120 = ((((~{(8'hb7)}) + (((8'ha6) ^~ (8'hb7)) ? ((8'hb9) ? (8'ha3) : (8'hb7)) : (-(8'hb2)))) < (^~(^~((8'ha4) ? (8'hba) : (8'ha5))))) ^~ ({(((8'hb0) ? (8'ha3) : (8'had)) ? {(8'ha1)} : ((8'hb4) >>> (8'ha7))), ((8'had) ? (~^(8'haa)) : {(7'h40), (7'h41)})} * (^~((8'ha6) ? ((8'hb6) & (8'hbc)) : ((8'hb7) < (8'hba)))))), 
parameter param121 = (((param120 ^~ ((param120 >> param120) | (~&param120))) ? param120 : {({param120, param120} ~^ (~&(8'ha3)))}) ? (~^param120) : param120))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire115;
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  assign y = {wire119,
                 wire117,
                 wire51,
                 wire38,
                 wire37,
                 wire36,
                 wire31,
                 wire30,
                 wire13,
                 wire14,
                 wire28,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire115,
                 reg118,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire13 = wire11[(3'h4):(2'h3)];
  assign wire14 = wire9;
  module15 #() modinst29 (.wire17(wire11), .wire18(wire14), .wire20(wire9), .y(wire28), .wire19(wire13), .wire16(wire10), .clk(clk));
  assign wire30 = (($unsigned(wire13[(2'h3):(2'h2)]) || (wire11 ?
                          (wire28[(4'hc):(4'hc)] ?
                              (wire11 ^ wire28) : (wire11 ~^ wire28)) : wire12)) ?
                      $unsigned(wire13[(3'h5):(2'h3)]) : ((!($signed(wire12) ?
                              (wire9 ? wire12 : wire14) : wire10)) ?
                          wire9 : ((+(wire10 ?
                              wire11 : wire10)) ^ {(wire28 < wire14)})));
  assign wire31 = {$signed(($signed(((8'hbf) ?
                          wire28 : wire30)) || $unsigned((wire28 <<< wire30))))};
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed(wire10[(1'h0):(1'h0)]));
      reg33 <= ((($signed(wire10[(5'h10):(2'h2)]) != $unsigned((wire28 >> wire31))) ?
          $signed((-$unsigned(wire13))) : wire13) >= wire11);
      reg34 <= (~{{wire9, (wire31 & $unsigned(wire11))}});
      reg35 <= (wire28 ?
          wire12[(3'h6):(1'h1)] : (($signed($unsigned((7'h41))) <<< wire30[(4'h8):(3'h7)]) | {$signed(wire14[(1'h1):(1'h1)])}));
    end
  assign wire36 = $unsigned((~|wire31[(2'h2):(1'h1)]));
  assign wire37 = (~&wire13[(1'h1):(1'h0)]);
  assign wire38 = {(|$signed($unsigned($signed((8'hb7))))),
                      {$unsigned(wire9[(1'h1):(1'h0)])}};
  module39 #() modinst52 (.wire41(reg35), .wire43(wire31), .wire42(wire9), .clk(clk), .wire40(wire10), .y(wire51));
  assign wire53 = $unsigned((reg33 ? $signed($unsigned({wire12})) : reg34));
  assign wire54 = $unsigned((|$signed((!reg33))));
  assign wire55 = (((wire54[(1'h0):(1'h0)] == wire31) || (|$signed((wire51 && wire28)))) << ({wire11[(3'h6):(2'h3)],
                          wire9[(3'h4):(3'h4)]} ?
                      wire36 : (8'hac)));
  assign wire56 = (|$signed((~|wire28[(4'ha):(1'h1)])));
  assign wire57 = (~&reg34);
  assign wire58 = $unsigned((wire54[(2'h3):(2'h3)] ?
                      (reg35 - wire30) : ({((7'h41) >> wire14), wire51} ?
                          (!$unsigned(wire31)) : {(+reg33),
                              wire57[(4'hc):(3'h6)]})));
  assign wire59 = $signed((8'hb7));
  module60 #() modinst116 (wire115, clk, reg32, wire14, reg33, wire37, wire12);
  assign wire117 = ((($unsigned($signed(wire38)) ?
                           wire9 : {(wire36 ?
                                   wire31 : wire36)}) < ($unsigned($signed(wire56)) ?
                           (~&((8'ha8) || reg33)) : reg33)) ?
                       (~wire56) : {(&$unsigned((wire28 << wire51))), wire9});
  always
    @(posedge clk) begin
      reg118 <= (~|(8'ha8));
    end
  assign wire119 = reg118;
endmodule

module module60
#(parameter param113 = {(~^(((!(8'hb7)) ? {(7'h44)} : ((8'hbf) ? (8'hb2) : (7'h43))) >>> (!{(8'had)}))), (((((8'ha1) ~^ (7'h41)) || ((8'ha2) ? (8'hb9) : (8'hbc))) ? (7'h41) : (~&((8'ha2) | (8'ha8)))) ? ((((8'hac) - (8'ha2)) ? ((8'ha1) - (8'hb6)) : (8'ha3)) != {{(8'hab)}}) : ({((8'haa) ? (7'h44) : (7'h42))} ? (!(~|(8'hb0))) : {{(8'h9d), (8'hbd)}, ((8'hba) ? (8'hac) : (8'ha5))}))}, 
parameter param114 = (~^param113))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(4'hf):(1'h0)] wire64;
  input wire [(5'h14):(1'h0)] wire63;
  input wire signed [(4'h8):(1'h0)] wire62;
  input wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire107,
                 wire106,
                 wire103,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg110,
                 reg109,
                 reg108,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= wire61;
      reg67 <= (reg66[(1'h0):(1'h0)] > $unsigned(wire63));
    end
  assign wire68 = (wire61[(2'h3):(1'h0)] >> $unsigned(wire61));
  assign wire69 = $signed(reg67);
  assign wire70 = $signed(($signed(wire65[(4'hb):(4'h9)]) ?
                      (((wire61 ?
                          wire65 : wire64) == reg67[(1'h1):(1'h0)]) | (~^reg67)) : $unsigned($signed({wire64}))));
  assign wire71 = (^~wire63[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg72 <= $signed(wire69);
      reg73 <= wire70[(2'h3):(1'h1)];
      reg74 <= (reg72[(4'ha):(4'h8)] ?
          wire65[(4'ha):(3'h4)] : (wire62[(3'h5):(2'h3)] <<< reg67));
    end
  always
    @(posedge clk) begin
      reg75 <= reg73[(4'hd):(4'hc)];
      reg76 <= $signed($signed(reg75[(4'hf):(1'h1)]));
      reg77 <= wire63;
      if (((^wire65[(4'hd):(4'hc)]) ?
          $signed((~&(~$signed(reg67)))) : {$signed($unsigned(reg67[(3'h4):(2'h2)]))}))
        begin
          reg78 <= ((wire61 ?
              wire69[(3'h4):(1'h0)] : {wire68,
                  ((wire70 >= reg72) ?
                      (reg74 ^~ wire65) : (|wire68))}) == reg77[(4'ha):(3'h4)]);
          reg79 <= reg75;
          if (wire70[(3'h4):(2'h2)])
            begin
              reg80 <= $signed(($signed((+$signed((7'h40)))) > wire64[(3'h4):(2'h3)]));
            end
          else
            begin
              reg80 <= ((~&$unsigned(($unsigned(wire64) ?
                  $unsigned(reg76) : $signed((7'h44))))) >> $signed($signed(reg78)));
              reg81 <= (wire71[(1'h1):(1'h1)] ?
                  (wire63 ?
                      reg78[(2'h2):(1'h0)] : (($signed(wire68) | reg75[(4'hc):(3'h5)]) && reg76)) : reg78[(1'h0):(1'h0)]);
            end
          reg82 <= {reg72[(3'h6):(1'h0)], reg76};
          reg83 <= wire61;
        end
      else
        begin
          reg78 <= (~wire68[(2'h2):(2'h2)]);
          if (wire61[(4'h8):(3'h7)])
            begin
              reg79 <= reg72;
              reg80 <= (+(|wire64));
              reg81 <= reg72;
              reg82 <= $signed((^(~|(~^(wire61 ? reg80 : wire68)))));
              reg83 <= ($unsigned(reg75[(3'h6):(2'h2)]) ?
                  {reg67, (+wire69[(2'h3):(2'h2)])} : wire69);
            end
          else
            begin
              reg79 <= (!$unsigned(((^~(~(8'had))) ?
                  $signed($unsigned(wire64)) : reg74)));
              reg80 <= wire69[(1'h0):(1'h0)];
              reg81 <= (^~wire65);
            end
          reg84 <= $unsigned(((!(~(reg73 ? wire68 : reg72))) ?
              ((|(reg72 + wire68)) <<< {(|reg67)}) : ((wire64[(3'h5):(2'h2)] ?
                      (8'hae) : wire64) ?
                  $unsigned($signed(wire62)) : reg74)));
        end
      if (((+(^~wire62[(3'h7):(3'h5)])) ?
          {$unsigned(reg82[(1'h0):(1'h0)]),
              $signed((^~$signed(reg75)))} : $signed($signed((!(reg78 * (8'hbb)))))))
        begin
          reg85 <= $unsigned((|wire70[(3'h6):(2'h2)]));
          if (($signed((8'hb4)) ?
              (|(~^({(8'hae)} + reg77[(4'h8):(3'h7)]))) : (-(&$signed(reg72[(3'h4):(2'h3)])))))
            begin
              reg86 <= $unsigned({$signed(reg75[(4'hc):(3'h6)])});
            end
          else
            begin
              reg86 <= $unsigned(((+{(reg79 ? reg83 : reg84),
                      {reg73, wire65}}) ?
                  $unsigned($signed(wire69)) : (({reg73, reg86} ~^ {reg79,
                      (8'hb4)}) > ({wire61} ?
                      (reg75 ? reg72 : wire70) : (reg66 ? reg82 : (8'hac))))));
              reg87 <= ($signed((reg86 ~^ $signed($unsigned(reg77)))) ?
                  (&wire68[(5'h11):(4'hf)]) : reg82);
              reg88 <= $unsigned((~(^~reg82)));
              reg89 <= (~&(8'hbe));
              reg90 <= reg89;
            end
          reg91 <= $signed($signed(({$signed(reg84)} || reg67)));
        end
      else
        begin
          reg85 <= $signed(wire68[(4'hd):(1'h0)]);
          reg86 <= (wire71[(1'h0):(1'h0)] ?
              $signed(reg86) : (^$signed($unsigned(reg76[(4'hd):(4'ha)]))));
          reg87 <= $unsigned((($unsigned($signed(reg82)) * (wire70 >> wire64)) >> ({(reg89 & reg79)} ?
              (-{wire64}) : $signed({(8'ha1)}))));
          reg88 <= ($unsigned((-$signed((!(8'ha3))))) ?
              (-wire70) : reg80[(1'h1):(1'h1)]);
        end
    end
  assign wire92 = $unsigned(reg87);
  assign wire93 = $unsigned((-reg75));
  assign wire94 = $signed({($unsigned($unsigned(reg72)) > reg86[(5'h11):(4'hf)]),
                      {({reg67} <<< ((8'hb0) ^ (8'hb2))), reg77}});
  assign wire95 = $unsigned((reg88[(4'hb):(3'h4)] ?
                      ((+reg80[(1'h0):(1'h0)]) ?
                          wire63[(3'h5):(3'h5)] : $signed((&reg82))) : wire63));
  assign wire96 = $unsigned(wire61);
  assign wire97 = $signed(reg80);
  always
    @(posedge clk) begin
      reg98 <= (({(^~$unsigned((8'hb2)))} ~^ (~&((reg88 ? reg91 : wire62) ?
          (reg79 ^ (8'hba)) : (reg81 ?
              reg86 : reg76)))) | wire93[(1'h0):(1'h0)]);
      reg99 <= $signed($unsigned($unsigned((~&reg67))));
      reg100 <= reg78;
      reg101 <= reg79[(2'h2):(1'h1)];
      reg102 <= ($signed((reg80 & $unsigned((wire71 ? (8'h9e) : reg67)))) ?
          {$signed($unsigned((8'had))),
              ((8'ha3) ?
                  ((wire70 ? reg86 : reg101) ?
                      {(7'h42),
                          (8'ha6)} : wire96[(1'h1):(1'h0)]) : ((~^reg87) >= reg79))} : {(wire65 ?
                  (((8'hb1) | (8'hbc)) ?
                      (|reg99) : $signed(reg67)) : (~^((8'hbf) <<< wire96))),
              wire70});
    end
  assign wire103 = $unsigned($unsigned($signed((reg83[(1'h0):(1'h0)] && reg101))));
  always
    @(posedge clk) begin
      reg104 <= (8'hb7);
      reg105 <= ((~^(^~$unsigned($signed((8'haa))))) ?
          {reg73[(4'hb):(1'h1)],
              (~|((reg83 ^ reg66) ?
                  wire62 : (reg67 ? reg90 : wire70)))} : (8'ha6));
    end
  assign wire106 = reg75;
  assign wire107 = (reg83 ? reg89 : (~|$unsigned(reg104[(4'he):(4'hb)])));
  always
    @(posedge clk) begin
      reg108 <= $unsigned($signed(reg90));
      reg109 <= $signed(((($unsigned(reg73) ?
                  (reg108 ? wire68 : (7'h44)) : wire69) ?
              wire95[(2'h3):(1'h0)] : reg76) ?
          ((|wire61[(4'h8):(3'h7)]) ?
              reg72[(1'h0):(1'h0)] : {(-(8'hb5)),
                  reg88}) : ($unsigned(reg73[(2'h3):(1'h0)]) ?
              (7'h44) : reg77)));
      reg110 <= $signed({$unsigned(((8'hb6) ? reg100 : (|wire95)))});
    end
  assign wire111 = $signed(($unsigned(wire65[(1'h0):(1'h0)]) + (!((reg99 ?
                           reg86 : reg102) ?
                       (|(8'hb3)) : reg89))));
  assign wire112 = (-(^$unsigned((~|{reg79, reg89}))));
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  input wire [(4'hd):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire50;
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  assign y = {wire50, reg49, reg48, reg47, reg46, reg45, reg44, (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= $signed(wire43[(4'hb):(1'h0)]);
      reg45 <= ((wire42[(1'h0):(1'h0)] ?
              (~&$signed($signed(wire41))) : (($signed(wire42) >> $unsigned(wire42)) ?
                  {((8'ha3) ? wire42 : wire40),
                      wire43[(4'he):(3'h7)]} : $unsigned((-wire40)))) ?
          ($unsigned(($unsigned((8'ha4)) ?
              $unsigned(wire41) : (!reg44))) << (($signed(wire43) ?
              $signed((8'h9e)) : {wire42,
                  wire43}) << $unsigned((~|reg44)))) : $unsigned($unsigned(wire42[(3'h5):(1'h0)])));
      reg46 <= (({wire40} && reg45[(4'h8):(3'h5)]) ^ $signed((wire41[(1'h0):(1'h0)] ?
          (~|$signed(wire40)) : $unsigned(wire41[(4'ha):(3'h6)]))));
    end
  always
    @(posedge clk) begin
      reg47 <= $unsigned(wire40[(3'h4):(2'h2)]);
      reg48 <= reg46;
    end
  always
    @(posedge clk) begin
      reg49 <= (!{reg45});
    end
  assign wire50 = (($signed(reg44[(4'h9):(3'h5)]) ?
                          $unsigned({reg46[(2'h3):(2'h2)],
                              (wire40 ?
                                  reg44 : reg47)}) : $signed(wire40[(2'h3):(2'h2)])) ?
                      wire41[(3'h6):(3'h4)] : ((~&reg49[(4'hc):(4'hb)]) ^ wire43[(5'h10):(4'h8)]));
endmodule

module module15
#(parameter param26 = (~^(-{(|((8'haa) && (8'hb9))), {((8'hb4) == (8'hae)), ((8'hb9) ? (8'ha5) : (8'haa))}})), 
parameter param27 = ({param26} * param26))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire25, wire23, wire22, wire21, reg24, (1'h0)};
  assign wire21 = $signed(wire17[(3'h4):(2'h2)]);
  assign wire22 = wire18;
  assign wire23 = {((^(~&wire22[(1'h1):(1'h0)])) ?
                          wire17[(1'h1):(1'h1)] : wire16)};
  always
    @(posedge clk) begin
      reg24 <= (~$signed($unsigned(wire22[(1'h1):(1'h1)])));
    end
  assign wire25 = $unsigned($unsigned($signed(wire20)));
endmodule
