module top
#(parameter param134 = ((~{((|(8'had)) ^ ((8'hba) ? (8'hb0) : (8'hb9))), (((8'ha0) ? (8'ha4) : (7'h44)) ? ((8'hbb) | (8'hb6)) : ((8'ha7) & (8'hbd)))}) * (^~((((8'hbf) ? (8'hb8) : (8'h9d)) | (^(8'haa))) > (((8'ha7) & (8'ha3)) ? (!(8'hb8)) : (|(8'had)))))), 
parameter param135 = (~(|(~^{(~|param134)}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire129;
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire129,
                 (1'h0)};
  assign wire4 = (|((~|(~(8'hb3))) >= ((~&(wire0 >> (8'hae))) ?
                     $unsigned((^wire3)) : (8'hb3))));
  assign wire5 = (wire1 ?
                     wire0 : (wire0[(3'h4):(2'h3)] | wire0[(1'h0):(1'h0)]));
  assign wire6 = (wire0 | ({{(wire1 == wire4)}} ?
                     wire2[(5'h10):(4'h9)] : $unsigned((8'hb5))));
  assign wire7 = $signed($signed(wire5[(2'h2):(1'h1)]));
  assign wire8 = $signed($unsigned($unsigned($unsigned(wire5))));
  assign wire9 = (8'ha1);
  assign wire10 = $unsigned({(8'hbf), wire7[(4'ha):(3'h4)]});
  assign wire11 = (wire4[(1'h0):(1'h0)] ^ $unsigned(wire9[(4'h8):(1'h0)]));
  assign wire12 = (&wire3[(1'h0):(1'h0)]);
  module13 #() modinst130 (wire129, clk, wire8, wire2, wire12, wire9, wire4);
  assign wire131 = wire8;
  assign wire132 = (((wire129[(1'h1):(1'h1)] <<< (wire2 >= (!wire12))) ?
                           $unsigned((^$unsigned(wire9))) : (wire2 ?
                               wire1[(1'h1):(1'h1)] : ((wire2 + (8'haf)) * (!(8'hae))))) ?
                       (-$unsigned($unsigned(wire3))) : (~|((wire2 + (wire7 ?
                               wire0 : wire6)) ?
                           ($signed(wire5) ?
                               (wire9 ?
                                   wire129 : wire3) : (wire10 <<< wire4)) : $unsigned((wire5 ?
                               wire7 : wire6)))));
  assign wire133 = $unsigned((8'hbb));
endmodule

module module13
#(parameter param127 = ((&{((^~(8'h9f)) ? ((8'haa) ~^ (8'ha2)) : ((8'ha5) > (8'h9d)))}) & (((((8'hbd) ? (8'ha0) : (8'haa)) & (!(8'h9c))) ? (((8'hbd) | (8'h9f)) ? ((8'ha7) >= (8'hbf)) : ((8'hb5) ? (8'hb3) : (7'h43))) : ((-(8'ha1)) ? ((8'hbe) != (8'ha1)) : ((8'ha4) << (8'hb8)))) ? (!((~^(8'had)) ~^ ((8'hb3) ? (8'hbc) : (8'hbe)))) : (+({(8'hb0), (8'ha6)} ? ((8'hb7) >> (8'hbe)) : ((8'hb3) < (8'hb3)))))), 
parameter param128 = (param127 ? (8'ha4) : param127))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire116;
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire91,
                 wire56,
                 wire22,
                 wire19,
                 wire93,
                 wire116,
                 reg124,
                 reg123,
                 reg60,
                 reg59,
                 reg58,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire19 = $signed((&$signed(($unsigned(wire15) ?
                      {wire15, wire18} : $signed(wire16)))));
  always
    @(posedge clk) begin
      reg20 <= {wire18};
      reg21 <= ($signed(wire16) ?
          (~({$unsigned((8'hae)), wire18} ?
              wire14 : {{wire15}, (8'hb0)})) : (wire14 ?
              $signed((wire18[(5'h10):(4'hd)] ?
                  (&wire14) : $unsigned(wire17))) : (!$signed(wire16[(3'h6):(2'h2)]))));
    end
  assign wire22 = $unsigned($signed($unsigned(reg20[(3'h4):(1'h0)])));
  module23 #() modinst57 (wire56, clk, wire16, reg21, wire22, wire19, wire17);
  always
    @(posedge clk) begin
      if ($unsigned((~&($unsigned($unsigned(reg21)) ?
          wire22[(2'h3):(2'h2)] : $unsigned((wire56 ? wire15 : (8'hb9)))))))
        begin
          reg58 <= (8'hbd);
          reg59 <= $unsigned(($unsigned(((~&reg21) ?
                  (wire56 ? (7'h43) : reg21) : (wire56 ? (8'ha4) : reg20))) ?
              reg20 : (|reg58)));
        end
      else
        begin
          reg58 <= $unsigned((~|(wire18 ?
              $signed(wire19) : $unsigned(((8'hb4) < reg59)))));
          reg59 <= $signed($unsigned(($unsigned(reg21[(4'h8):(2'h3)]) ?
              (reg59 && {wire14, wire15}) : ((reg59 ? wire17 : wire56) ?
                  (wire15 ? reg21 : (8'haf)) : $signed(wire22)))));
          reg60 <= ($unsigned((&wire19)) || (wire15[(5'h15):(4'hb)] ?
              ({(wire56 ? reg20 : reg59),
                  (+wire22)} == $unsigned((wire19 >>> reg58))) : (($signed(reg59) ~^ ((8'ha5) ?
                      wire19 : (8'ha4))) ?
                  wire16 : reg58)));
        end
    end
  module61 #() modinst92 (.wire64(wire15), .y(wire91), .clk(clk), .wire65(wire18), .wire63(wire17), .wire62(reg20));
  assign wire93 = $signed((($signed({wire91}) ?
                          ({reg21} >> ((8'ha7) ?
                              reg60 : wire16)) : $signed(wire16)) ?
                      $signed((|(wire16 ? reg20 : wire22))) : (~wire22)));
  module94 #() modinst117 (.wire97(reg20), .wire98(wire15), .wire95(wire19), .wire96(wire22), .y(wire116), .clk(clk));
  assign wire118 = reg21[(4'hb):(1'h1)];
  assign wire119 = (((~$signed($unsigned(wire15))) ?
                       (|(8'hb1)) : (wire22 ?
                           (wire56 ?
                               {wire91} : (&wire56)) : reg58[(4'h9):(4'h8)])) < wire19);
  assign wire120 = $signed(($unsigned(wire116[(3'h6):(1'h0)]) <<< (~$signed((wire56 + wire116)))));
  assign wire121 = (8'ha3);
  assign wire122 = ($signed(wire16[(2'h2):(2'h2)]) ?
                       wire119 : ((8'hb6) << wire16));
  always
    @(posedge clk) begin
      reg123 <= (wire122 ?
          (wire15 ?
              (+(~&{reg20})) : (wire56 ?
                  (+wire120[(5'h10):(3'h7)]) : reg21)) : $signed({({wire118,
                  wire91} <<< wire16[(4'h8):(2'h3)]),
              wire120[(4'h9):(2'h2)]}));
      reg124 <= (!(($signed((wire19 || reg60)) ?
              ((~|wire19) ? wire17 : wire19) : (~&$signed(wire14))) ?
          reg59[(4'hf):(4'hf)] : (wire18[(2'h3):(2'h3)] ?
              wire118[(1'h0):(1'h0)] : $signed(reg123[(4'ha):(3'h6)]))));
    end
  assign wire125 = ((~(((wire14 ^~ wire17) >= $unsigned(reg123)) || ((reg59 ?
                           wire119 : wire14) ^~ reg58[(1'h1):(1'h1)]))) ?
                       {reg123,
                           ($unsigned($unsigned(wire121)) >= wire91[(1'h0):(1'h0)])} : reg123);
  assign wire126 = $signed($signed(($signed(wire56) ^~ ((!reg21) >> {wire18,
                       reg60}))));
endmodule

module module94  (y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire98;
  input wire signed [(4'ha):(1'h0)] wire97;
  input wire [(4'he):(1'h0)] wire96;
  input wire signed [(5'h12):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire112;
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg99 <= $unsigned(($signed(wire96[(3'h4):(2'h3)]) ?
          (^~(wire97[(4'h8):(3'h4)] | wire98[(1'h1):(1'h0)])) : (~$signed((-wire97)))));
      reg100 <= $signed($unsigned((wire96[(1'h1):(1'h1)] ?
          $signed((wire98 + wire96)) : ({wire97} ?
              (-wire97) : $signed(reg99)))));
      if ((reg100[(1'h0):(1'h0)] + ($signed(($signed(wire96) ?
          ((8'ha4) || (8'hb2)) : wire98)) >> $signed(wire97))))
        begin
          if ($unsigned($unsigned($signed({(reg100 ? reg99 : wire98)}))))
            begin
              reg101 <= $unsigned((reg100[(2'h3):(2'h3)] + (reg100[(1'h1):(1'h1)] ?
                  wire98 : ({wire97, reg100} << wire97))));
              reg102 <= (wire97[(4'ha):(1'h0)] ?
                  reg99[(3'h5):(3'h4)] : wire95[(3'h5):(1'h1)]);
              reg103 <= ((~^reg102) ?
                  $signed((wire96 ?
                      (~&$signed(wire95)) : wire98[(1'h0):(1'h0)])) : reg101);
              reg104 <= $signed(wire95);
            end
          else
            begin
              reg101 <= reg102;
              reg102 <= $unsigned((reg102 ?
                  (~|($signed(wire97) ^ (wire97 - wire97))) : ((reg104[(4'h9):(3'h5)] ^~ (+reg101)) ?
                      $signed((reg99 - wire95)) : {$unsigned(reg104)})));
              reg103 <= (wire95 ?
                  reg99[(4'hd):(1'h0)] : ((~|{reg99[(3'h5):(1'h0)]}) ?
                      reg100 : ($signed($signed((7'h40))) ?
                          (wire95 | (~wire95)) : (wire97 ~^ (wire97 - reg101)))));
            end
          reg105 <= {$unsigned($unsigned(wire96)),
              ((((wire96 ? reg101 : wire97) ?
                      reg99 : (reg102 <= reg104)) || $signed(wire96)) ?
                  (~&($signed((8'hb2)) ?
                      (^(8'h9f)) : {wire96})) : $signed((~&(wire95 >> wire95))))};
          if (((((+reg104) ?
              ($unsigned(reg104) | $unsigned(wire96)) : $signed($unsigned(reg105))) ^~ ($unsigned(reg103[(1'h1):(1'h0)]) ~^ (~wire96))) << $signed((wire96[(4'he):(3'h7)] ?
              reg103[(3'h7):(3'h7)] : reg102))))
            begin
              reg106 <= ((!wire95) * $unsigned(reg99[(3'h6):(2'h2)]));
              reg107 <= (|({reg99[(3'h7):(3'h6)]} ?
                  reg100 : (+($unsigned(reg106) ?
                      wire96 : $unsigned((8'hb9))))));
              reg108 <= reg104;
              reg109 <= ((!((-(reg106 < wire98)) << (reg103[(3'h6):(3'h5)] ?
                      reg104[(4'h8):(3'h5)] : (!reg104)))) ?
                  $unsigned(wire98[(1'h1):(1'h1)]) : ($signed(((8'h9c) && {(8'haf),
                          wire95})) ?
                      (((reg107 ? wire97 : reg101) ?
                          $unsigned((7'h41)) : $unsigned(reg101)) != ((8'hb9) ?
                          (reg102 * reg99) : (wire97 < wire96))) : $signed(wire97[(3'h5):(2'h2)])));
            end
          else
            begin
              reg106 <= wire98;
              reg107 <= ($unsigned(reg109[(3'h4):(2'h2)]) < (!$unsigned(reg102)));
              reg108 <= {((reg109[(2'h3):(2'h2)] >> ($signed(reg108) ?
                      $unsigned(wire96) : (reg101 ?
                          reg108 : reg102))) <= ((7'h43) > {$signed((8'hb3))}))};
              reg109 <= $unsigned(reg107[(5'h12):(3'h4)]);
              reg110 <= reg99[(3'h6):(1'h0)];
            end
        end
      else
        begin
          if ({$unsigned((({(7'h41)} & ((7'h41) ?
                  reg107 : (8'hbe))) >>> (reg104[(4'h8):(3'h6)] ?
                  (reg99 ? reg108 : reg99) : $unsigned((8'ha7)))))})
            begin
              reg101 <= {wire96};
              reg102 <= {($signed((((8'ha9) >= reg101) ?
                          ((8'ha5) ? reg101 : reg103) : (reg110 ?
                              reg107 : wire95))) ?
                      reg103 : (+$unsigned((reg108 ? (8'ha0) : wire96))))};
              reg103 <= $unsigned((wire97 * $unsigned($signed($unsigned(reg100)))));
              reg104 <= reg110[(1'h1):(1'h1)];
            end
          else
            begin
              reg101 <= $unsigned($unsigned($signed((reg106 ?
                  (+wire98) : (~reg106)))));
              reg102 <= (^~wire98[(1'h0):(1'h0)]);
              reg103 <= $signed(reg106[(1'h1):(1'h1)]);
            end
          reg105 <= (8'hbd);
          reg106 <= $unsigned(((^~($signed(reg99) ?
                  (&reg99) : (reg102 ? reg107 : (7'h44)))) ?
              (wire98 == (~(~|reg106))) : reg109[(4'h8):(4'h8)]));
        end
    end
  always
    @(posedge clk) begin
      reg111 <= reg110;
    end
  assign wire112 = {(8'ha9)};
  assign wire113 = ((({(wire98 ? wire112 : wire96)} ?
                           {$unsigned(reg111)} : $signed(reg111[(1'h1):(1'h1)])) > $signed(reg106[(3'h4):(1'h1)])) ?
                       reg103 : $unsigned(wire112));
  assign wire114 = $signed((($signed((reg104 | reg109)) >> reg106) ?
                       ($signed(reg104[(4'hd):(4'hd)]) ?
                           $signed(reg111[(3'h6):(2'h3)]) : (wire97 * wire113[(4'hc):(4'h8)])) : wire113[(2'h3):(1'h0)]));
  assign wire115 = ($unsigned(reg106) ?
                       $signed((|$unsigned($signed(reg102)))) : $unsigned(wire114));
endmodule

module module61
#(parameter param89 = ((~|((^~{(8'hb9)}) < (^(-(8'hab))))) << ({(((7'h41) != (7'h44)) ? (~&(8'hae)) : {(8'ha6), (8'hb1)})} <<< (8'ha7))), 
parameter param90 = (~param89))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire65;
  input wire [(5'h15):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire [(5'h14):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg88,
                 reg87,
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
                 (1'h0)};
  assign wire66 = ((wire64 ^~ wire64[(1'h0):(1'h0)]) ~^ wire62[(5'h13):(5'h12)]);
  assign wire67 = $unsigned({(({wire63, wire66} * $unsigned(wire62)) ?
                          {$signed(wire62)} : $signed((wire63 ?
                              wire64 : wire63)))});
  assign wire68 = wire66[(2'h2):(1'h0)];
  assign wire69 = $signed($unsigned($signed(wire68)));
  assign wire70 = wire67;
  always
    @(posedge clk) begin
      if ($unsigned((wire69[(3'h7):(1'h1)] && wire63[(2'h2):(2'h2)])))
        begin
          reg71 <= wire62;
          reg72 <= {wire68,
              ($unsigned($unsigned($signed((8'ha0)))) >= $signed(((wire67 < wire65) ?
                  (wire64 ^ wire64) : wire67)))};
          if (wire66)
            begin
              reg73 <= $signed(($unsigned((|(^wire63))) ?
                  (&({reg71} ?
                      $signed((8'hbe)) : wire69[(1'h0):(1'h0)])) : $signed(wire69)));
              reg74 <= {(&{reg71[(1'h1):(1'h0)]})};
              reg75 <= (!(wire66[(4'hb):(3'h5)] & wire63));
              reg76 <= (~^($unsigned((^~(wire64 ?
                  wire65 : reg71))) < (~&wire67)));
            end
          else
            begin
              reg73 <= $unsigned(wire67);
              reg74 <= wire64[(3'h6):(2'h3)];
            end
        end
      else
        begin
          reg71 <= reg74;
          reg72 <= {($unsigned($signed((|wire69))) >> $unsigned($unsigned($signed(wire64)))),
              $signed(wire63[(3'h6):(3'h6)])};
          reg73 <= wire68[(3'h4):(2'h2)];
        end
      reg77 <= $unsigned($signed((!((wire67 ?
          wire70 : wire68) >= (wire67 - wire65)))));
      reg78 <= (~^{(!wire70[(2'h2):(2'h2)])});
    end
  always
    @(posedge clk) begin
      reg79 <= $signed({($unsigned((wire65 && reg73)) - (&$signed(reg78))),
          ($unsigned((!wire62)) ?
              $signed(wire63) : ($unsigned(wire65) ?
                  reg74[(4'hb):(3'h4)] : wire64[(5'h12):(4'h9)]))});
      reg80 <= reg71[(1'h0):(1'h0)];
    end
  assign wire81 = reg76[(3'h6):(1'h0)];
  assign wire82 = ((reg72[(2'h2):(1'h1)] ?
                      (~$signed((~^reg73))) : $signed((wire81[(2'h2):(1'h1)] ?
                          wire62 : wire62))) | wire68);
  assign wire83 = {(reg74 ? (~wire63) : $signed($signed($signed(wire63))))};
  assign wire84 = wire62;
  assign wire85 = {$signed(($unsigned(reg79[(3'h5):(1'h0)]) == $unsigned(wire64))),
                      $signed((({(8'hb2), wire84} ?
                          ((8'hac) ?
                              reg74 : wire84) : wire65[(4'h9):(1'h0)]) < ((wire84 - (8'hae)) ~^ (wire64 > wire64))))};
  assign wire86 = {(^~($signed((reg79 ? wire64 : wire62)) ?
                          (7'h44) : $signed($unsigned(wire81)))),
                      wire81};
  always
    @(posedge clk) begin
      reg87 <= {reg75[(2'h2):(1'h0)]};
      reg88 <= {(reg80 ? wire82[(4'h9):(1'h0)] : reg78[(3'h4):(1'h0)]),
          ($unsigned((8'hb0)) ?
              $signed((wire84 - reg74)) : ((!{reg72,
                  wire69}) || $unsigned($signed(reg80))))};
    end
endmodule

module module23
#(parameter param55 = {(((((8'hb0) ? (8'hb6) : (8'ha7)) ? ((8'hb7) && (8'haf)) : (^(8'had))) ? ((~^(8'hb6)) < ((8'hbf) ? (8'hb6) : (8'h9e))) : {(-(8'ha5)), (~&(8'h9f))}) ? {((+(8'ha7)) ? (^~(8'hb7)) : {(8'hbe), (8'hb4)}), (((8'hae) ? (8'hab) : (8'hbb)) ? {(8'hb5), (8'ha9)} : (-(8'ha6)))} : (~&((~|(8'hab)) == (-(8'ha2))))), ((8'ha7) ? (((~|(8'ha9)) ? ((8'hbb) ? (8'hba) : (8'hb3)) : ((8'ha6) ^~ (8'h9e))) ? {((8'hb5) >>> (8'ha3)), ((8'hb1) ? (7'h43) : (8'hb8))} : {((8'haa) ? (8'hb3) : (8'ha7))}) : ((~((8'ha9) ? (8'hae) : (8'haa))) - {{(8'hb0)}, ((7'h41) ? (8'haf) : (8'hbd))}))})
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire29 = $signed($signed($unsigned(wire24)));
  assign wire30 = {wire29, (!$signed(wire28[(4'hd):(4'ha)]))};
  assign wire31 = wire29;
  assign wire32 = (!$signed((-$unsigned((wire30 ? wire25 : wire29)))));
  assign wire33 = ((wire28 ?
                      wire28[(4'h8):(2'h3)] : wire25[(4'h8):(2'h2)]) ^~ (8'ha0));
  assign wire34 = ((wire25 ?
                      wire29 : wire30[(4'h8):(3'h5)]) >> (+{$signed($unsigned(wire27))}));
  assign wire35 = $unsigned(wire34);
  assign wire36 = wire29;
  assign wire37 = $unsigned((wire31[(4'ha):(3'h4)] ? wire33 : wire28));
  always
    @(posedge clk) begin
      if ((~&wire36))
        begin
          reg38 <= $unsigned($signed((~&wire29[(2'h2):(1'h1)])));
          reg39 <= (reg38[(5'h15):(3'h4)] ? (8'ha1) : (~^wire24));
          if ($unsigned(((8'hb0) & $signed($signed($signed(wire37))))))
            begin
              reg40 <= (-($signed(($signed(wire25) ?
                      (wire29 ? wire27 : (8'haf)) : wire27)) ?
                  wire35[(5'h14):(2'h2)] : $signed($unsigned($unsigned((8'ha7))))));
              reg41 <= {$unsigned($unsigned((reg39[(1'h1):(1'h0)] ?
                      (wire29 ^ wire29) : $signed(wire37))))};
              reg42 <= $signed({wire34[(4'h8):(3'h7)]});
            end
          else
            begin
              reg40 <= wire24[(2'h2):(1'h0)];
              reg41 <= (reg42 + {$unsigned(((wire28 || wire33) ?
                      (!reg40) : ((8'h9e) ? wire29 : wire27))),
                  wire25});
              reg42 <= $signed(($unsigned((8'hb2)) ?
                  ({reg40[(4'he):(4'hd)], wire28[(2'h2):(1'h1)]} ?
                      {reg38} : {wire36[(5'h10):(4'hf)]}) : $unsigned(wire30)));
            end
          reg43 <= wire26[(1'h0):(1'h0)];
          if (wire26)
            begin
              reg44 <= $signed(wire34[(1'h0):(1'h0)]);
              reg45 <= wire26;
              reg46 <= ($signed($signed(reg39)) ?
                  wire36[(4'h8):(1'h0)] : (({(reg44 ? (8'haa) : reg40),
                      (reg38 ^~ wire27)} >= $signed((~&wire32))) > wire26[(2'h2):(1'h0)]));
              reg47 <= reg42[(1'h1):(1'h1)];
              reg48 <= $unsigned((wire27 + wire29[(1'h0):(1'h0)]));
            end
          else
            begin
              reg44 <= {(-reg39[(4'h8):(2'h2)]),
                  ((reg45 > ($signed(wire32) ?
                          (reg39 <<< reg48) : (wire34 ? reg41 : wire28))) ?
                      wire34[(4'h8):(2'h2)] : (((wire32 << (8'hb2)) ?
                              reg40[(4'hf):(4'ha)] : wire26[(2'h3):(2'h2)]) ?
                          wire32 : reg46[(2'h2):(1'h1)]))};
              reg45 <= {(~|$unsigned((wire29 ? {wire30} : (wire27 && wire35)))),
                  $signed($signed((-(^reg43))))};
              reg46 <= (~&((reg38 ?
                      wire25[(4'h9):(3'h5)] : ({wire33, reg43} ?
                          reg42[(2'h3):(1'h0)] : (reg42 || wire24))) ?
                  (-$signed($unsigned(reg48))) : (+$unsigned((wire28 << wire31)))));
            end
        end
      else
        begin
          if ((wire32[(3'h4):(2'h3)] <= $unsigned((($signed(wire35) ?
                  ((8'hbc) ? reg40 : reg38) : $unsigned(wire29)) ?
              {wire32} : $unsigned($signed(reg44))))))
            begin
              reg38 <= {$unsigned(reg47[(4'ha):(4'h8)])};
              reg39 <= (wire26[(2'h2):(1'h0)] ?
                  (-{$signed((!wire27)), {(8'hb1)}}) : wire24);
              reg40 <= reg38;
              reg41 <= (^~(($unsigned({wire34, reg41}) ?
                      (&wire26) : reg41[(1'h0):(1'h0)]) ?
                  ($signed($unsigned((8'h9d))) - wire34) : ($signed(reg46[(3'h6):(3'h6)]) ?
                      ((wire30 ? reg48 : wire34) ?
                          (!wire25) : reg42[(2'h2):(2'h2)]) : (~(^~(8'h9f))))));
              reg42 <= $signed((($signed($unsigned(wire25)) >> wire31) <<< {((^~wire37) >> reg43)}));
            end
          else
            begin
              reg38 <= (!(8'ha4));
              reg39 <= wire28;
            end
          reg43 <= reg48;
        end
      reg49 <= wire30;
    end
  assign wire50 = $unsigned(wire31);
  assign wire51 = wire35;
  assign wire52 = wire26;
  assign wire53 = wire24;
  assign wire54 = (reg47 ?
                      $signed(($unsigned($unsigned(reg45)) ?
                          reg49 : (&(reg41 ?
                              (7'h40) : reg49)))) : (wire33[(4'ha):(4'h9)] ?
                          reg43 : (~(!wire26))));
endmodule
