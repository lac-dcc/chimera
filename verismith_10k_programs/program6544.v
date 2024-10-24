module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire128;
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire16,
                 wire18,
                 wire128,
                 (1'h0)};
  module4 #() modinst17 (wire16, clk, wire3, wire0, wire1, wire2, (8'ha4));
  assign wire18 = $unsigned((!(wire2 ?
                      $signed((wire1 ? wire0 : (8'h9e))) : wire2)));
  module19 #() modinst129 (.wire22(wire0), .y(wire128), .wire23(wire3), .wire24(wire2), .wire21(wire1), .clk(clk), .wire20(wire16));
  assign wire130 = $signed((wire128[(1'h0):(1'h0)] ?
                       wire3[(4'hc):(3'h5)] : wire2[(4'hf):(3'h7)]));
  assign wire131 = $unsigned(($signed((((8'ha2) <<< wire0) * (wire128 ?
                       (7'h44) : wire18))) > $unsigned($unsigned(wire130[(1'h0):(1'h0)]))));
  assign wire132 = (($unsigned({$signed(wire1)}) <<< $signed($signed($unsigned(wire3)))) ?
                       wire2 : wire128);
  assign wire133 = $signed((&(-wire1[(1'h0):(1'h0)])));
  assign wire134 = (~&wire18[(4'hc):(3'h6)]);
  assign wire135 = wire130;
  assign wire136 = ((wire18 ?
                       (-$unsigned(wire135)) : $signed(wire128)) == {(+wire16[(4'ha):(4'h8)]),
                       (!wire1[(4'h8):(2'h3)])});
  assign wire137 = $unsigned((wire131[(1'h0):(1'h0)] >> (+((wire133 ?
                           wire133 : wire130) ?
                       $signed(wire0) : wire128[(5'h10):(3'h6)]))));
  assign wire138 = wire134[(2'h3):(2'h2)];
  assign wire139 = $signed($unsigned($unsigned(wire16[(4'hd):(4'hc)])));
  assign wire140 = wire2;
  assign wire141 = $signed({{wire3[(3'h4):(1'h1)]}, wire18[(3'h4):(2'h3)]});
  assign wire142 = wire139;
endmodule

module module19
#(parameter param126 = {((({(7'h41)} >= ((8'ha4) ~^ (8'h9d))) ? (&((8'hb1) ? (8'ha0) : (8'ha1))) : (((8'had) ? (8'ha2) : (7'h41)) < {(8'ha1), (8'haf)})) * {(~|(|(8'haf))), (((8'h9e) ? (8'hb9) : (8'hb8)) | ((7'h41) | (8'hb9)))})}, 
parameter param127 = {((param126 ? param126 : (^(&param126))) ? {((param126 - param126) * (param126 ? param126 : param126))} : (param126 ? param126 : (((8'hba) ? param126 : param126) >= (~&param126)))), (param126 & (~{(param126 < param126)}))})
(y, clk, wire20, wire21, wire22, wire23, wire24);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire125;
  wire [(3'h7):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire122;
  assign y = {wire125,
                 wire124,
                 wire25,
                 wire55,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire122,
                 (1'h0)};
  assign wire25 = $unsigned(wire22);
  module26 #() modinst56 (.wire29(wire21), .clk(clk), .wire28(wire22), .y(wire55), .wire27(wire24), .wire30(wire23));
  assign wire57 = (8'ha8);
  assign wire58 = wire55;
  assign wire59 = $signed(((wire22 >= (wire23[(1'h0):(1'h0)] + (~^wire58))) < wire22));
  assign wire60 = $signed(wire57);
  assign wire61 = (~|wire20[(1'h1):(1'h1)]);
  assign wire62 = ((+wire58[(2'h2):(1'h0)]) << (!$unsigned(((wire55 >= (8'ha3)) ?
                      $unsigned(wire61) : {wire24}))));
  module63 #() modinst123 (wire122, clk, wire60, wire23, wire57, wire25, wire61);
  assign wire124 = $unsigned(((wire61 ?
                       wire25[(3'h5):(3'h5)] : ($signed(wire24) && $unsigned(wire60))) - wire57[(4'hb):(3'h5)]));
  assign wire125 = wire23;
endmodule

module module4
#(parameter param14 = {((((^(8'hb4)) ? ((8'h9f) ~^ (8'ha3)) : (&(8'ha4))) ? (~^(7'h42)) : (|((8'ha2) ? (8'ha3) : (8'ha4)))) ~^ {(+(~|(8'haa)))})}, 
parameter param15 = (-{{param14, (param14 | (param14 < param14))}, (((param14 || (8'h9f)) ~^ {param14, param14}) == (~^(param14 ? (8'hbe) : param14)))}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire5;
  assign wire11 = (~|wire5[(1'h0):(1'h0)]);
  assign wire12 = (&wire11);
  assign wire13 = $unsigned((^~wire11[(1'h1):(1'h1)]));
endmodule

module module63
#(parameter param121 = {((+((!(8'h9f)) < (|(7'h44)))) == ({((8'hbe) ^ (8'ha6)), ((8'ha4) ? (7'h40) : (8'hbb))} >> (((8'hbb) ? (8'hb0) : (8'hb2)) - (&(8'hbb)))))})
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire [(5'h12):(1'h0)] wire65;
  input wire [(4'hf):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire102,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 reg120,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 (1'h0)};
  assign wire69 = (wire65[(5'h12):(4'he)] == wire64);
  assign wire70 = ($unsigned(wire64[(2'h3):(1'h1)]) ?
                      {{$signed((wire69 ? wire68 : (8'hb5))),
                              (+(!wire66))}} : wire64[(3'h4):(1'h0)]);
  assign wire71 = $signed(wire66);
  assign wire72 = {$signed((&((wire67 ?
                          wire70 : (7'h42)) ~^ wire71[(3'h7):(2'h3)])))};
  assign wire73 = (-wire67);
  assign wire74 = (~^$unsigned((~|wire67)));
  always
    @(posedge clk) begin
      reg75 <= $signed(wire74[(3'h7):(3'h6)]);
      if ($unsigned($unsigned(wire70[(5'h13):(3'h6)])))
        begin
          reg76 <= (({wire74,
              {(~&wire71),
                  wire73[(4'hd):(4'hb)]}} >>> wire70[(4'hd):(2'h2)]) <= (wire69 < (wire70[(4'hc):(1'h0)] > (((8'had) ?
              wire72 : wire64) ^ wire72[(1'h1):(1'h1)]))));
          if ({reg76[(5'h12):(4'hb)]})
            begin
              reg77 <= (^~$unsigned(wire74));
              reg78 <= ($signed($unsigned({((8'hbe) | wire73), (~|wire65)})) ?
                  ($signed($signed(wire64[(1'h1):(1'h1)])) ?
                      $signed($unsigned($unsigned(wire67))) : reg76[(4'h8):(1'h0)]) : (~($signed(wire68) ?
                      (((8'ha3) ? wire73 : wire72) | (wire72 ?
                          wire70 : reg77)) : (7'h44))));
              reg79 <= {(~&$signed(wire72)),
                  (wire70[(5'h13):(4'h8)] ^~ (~^($signed(reg77) + reg76[(1'h1):(1'h1)])))};
              reg80 <= $signed((($unsigned((~|wire70)) ?
                      (-{(8'h9d)}) : $signed(((8'hb3) - wire67))) ?
                  wire69[(2'h2):(1'h1)] : wire68[(1'h0):(1'h0)]));
              reg81 <= $signed($unsigned(wire67));
            end
          else
            begin
              reg77 <= (wire72 & $signed((wire68 ^~ $signed((wire69 & wire65)))));
              reg78 <= (~|(((wire69 + reg77) ?
                      wire72[(4'hf):(4'hb)] : reg77[(5'h13):(5'h11)]) ?
                  (wire67[(4'ha):(4'h9)] >>> reg75[(4'hc):(4'h8)]) : (~^wire73[(3'h7):(1'h1)])));
              reg79 <= reg79;
              reg80 <= wire64;
              reg81 <= {(($signed((wire69 ? wire73 : wire74)) ^ wire66) ?
                      $unsigned((~|{wire71, wire66})) : (reg77[(4'h8):(2'h3)] ?
                          (~^{(7'h40)}) : wire66[(1'h0):(1'h0)]))};
            end
          if (($signed((!{wire72[(3'h4):(2'h3)], $signed((7'h40))})) ?
              {{wire64[(4'hd):(4'hc)]},
                  $unsigned({((8'hb4) ? wire70 : wire71),
                      wire72[(3'h5):(1'h1)]})} : ($signed((!{wire71,
                  wire69})) * (wire69 <= (wire70 >>> (reg75 >>> wire68))))))
            begin
              reg82 <= $unsigned((|reg77[(5'h14):(4'h9)]));
              reg83 <= reg77;
              reg84 <= wire71[(3'h7):(3'h4)];
              reg85 <= (wire71[(3'h7):(1'h1)] ?
                  $signed((wire74 ?
                      $signed(reg82) : reg75)) : wire73[(3'h4):(1'h1)]);
              reg86 <= wire70;
            end
          else
            begin
              reg82 <= (^(wire70[(4'he):(4'ha)] ^ (reg86[(1'h0):(1'h0)] ~^ $signed((wire71 <<< wire71)))));
              reg83 <= (~|wire73[(2'h3):(1'h1)]);
            end
          if ((^wire73))
            begin
              reg87 <= $unsigned($signed(wire74[(2'h3):(1'h0)]));
            end
          else
            begin
              reg87 <= wire71[(3'h7):(1'h0)];
              reg88 <= (wire67 ?
                  (~^reg84) : {(~wire72), (!$unsigned((reg82 >>> (8'hb2))))});
              reg89 <= $signed($signed($signed($unsigned(reg83))));
              reg90 <= {((8'h9d) ?
                      (((reg87 ? reg78 : reg79) + (wire66 ?
                          wire72 : wire74)) ~^ ((!reg86) ?
                          $unsigned((8'hb9)) : wire67)) : reg83),
                  ($unsigned($unsigned(wire66[(3'h4):(2'h3)])) & wire74[(4'hd):(4'h8)])};
            end
          reg91 <= reg86[(2'h2):(2'h2)];
        end
      else
        begin
          reg76 <= (({($unsigned(reg76) ?
                  $unsigned(reg86) : $signed(reg89))} <<< $unsigned(reg82)) < {(8'hb7)});
          reg77 <= (-{(|((reg75 ? wire69 : wire69) >= reg89)), reg81});
          reg78 <= (wire72[(4'hf):(4'hf)] ?
              (8'h9e) : ((^$signed((+(8'hb2)))) ?
                  ({$signed(wire65)} ?
                      {$signed(wire65),
                          wire64} : $unsigned(reg83)) : ((reg77 < $unsigned(wire65)) ?
                      ((8'had) ?
                          (~^reg83) : $unsigned(wire69)) : wire64[(1'h0):(1'h0)])));
          reg79 <= wire72;
        end
    end
  assign wire92 = {($signed((^~wire65)) ?
                          (&($signed(wire68) ?
                              reg91 : $unsigned(wire65))) : (^(wire71 ?
                              $signed(reg90) : $unsigned(wire73))))};
  assign wire93 = (^$signed((&({reg76, reg90} ?
                      ((8'ha4) ? reg86 : wire72) : {reg82, reg91}))));
  assign wire94 = wire70;
  assign wire95 = ({reg91} ?
                      ($signed($unsigned(reg90)) ?
                          (-((!wire67) ?
                              (reg85 - wire74) : $unsigned(wire66))) : {((reg76 ?
                                      (8'hbf) : wire72) ?
                                  $unsigned(wire67) : reg82),
                              (~^(wire72 ?
                                  wire92 : reg89))}) : wire93[(1'h1):(1'h1)]);
  assign wire96 = ($signed((~&($unsigned((8'haa)) >= (reg82 * reg80)))) | $unsigned((+(~^{wire64,
                      (7'h41)}))));
  always
    @(posedge clk) begin
      reg97 <= $unsigned(($signed({reg87}) ?
          $signed($unsigned(reg81)) : ($unsigned($unsigned(wire94)) >= reg88[(2'h2):(2'h2)])));
      if ($unsigned(($unsigned(reg87) * wire94)))
        begin
          reg98 <= reg78[(2'h2):(2'h2)];
        end
      else
        begin
          reg98 <= (~^{$signed(((wire92 ? reg77 : reg75) ?
                  (reg91 ? wire68 : reg98) : (~&reg83))),
              $unsigned((&reg75))});
        end
      reg99 <= (wire96 < $unsigned(wire93[(5'h10):(2'h3)]));
      reg100 <= $unsigned(reg75);
      reg101 <= ((7'h43) ?
          (&(~&{wire65,
              wire67[(3'h7):(2'h3)]})) : ((((^~wire73) != (reg87 * wire64)) ?
                  (wire66 <<< {wire68, (8'hab)}) : reg86[(2'h2):(1'h0)]) ?
              $signed(($signed(reg99) >> wire65[(3'h4):(1'h0)])) : $signed(($unsigned(reg89) >= wire96[(1'h0):(1'h0)]))));
    end
  assign wire102 = ($unsigned(reg76) >> $signed((!$signed(wire65[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned(wire74))
        begin
          reg103 <= {wire66};
          if (wire95[(3'h6):(2'h3)])
            begin
              reg104 <= (((reg87[(4'h9):(3'h5)] + wire66[(1'h1):(1'h0)]) ?
                      wire64[(1'h0):(1'h0)] : wire93) ?
                  (reg86[(3'h4):(1'h1)] ?
                      reg79 : reg81[(3'h5):(1'h0)]) : (((reg86 ?
                          $signed(reg78) : {wire94}) ?
                      {(wire74 ? reg97 : reg103),
                          $unsigned(wire69)} : ($unsigned(reg100) ?
                          reg103[(1'h0):(1'h0)] : reg89)) <= ($unsigned((+reg87)) * wire74[(5'h11):(4'hd)])));
              reg105 <= $unsigned((({wire93[(3'h7):(2'h2)], {reg88, (8'hba)}} ?
                      $unsigned((reg77 >>> reg87)) : wire68[(1'h1):(1'h1)]) ?
                  $unsigned(wire66) : $unsigned({(wire65 + wire73),
                      (reg82 - wire102)})));
              reg106 <= $unsigned((($signed((reg76 ? reg85 : reg89)) ?
                  reg90 : $unsigned((&wire74))) != ((wire93[(1'h1):(1'h1)] ?
                  wire72[(3'h6):(1'h0)] : (!wire65)) >= ((wire67 ?
                      reg89 : reg87) ?
                  (reg100 ? reg91 : wire70) : $signed(wire72)))));
              reg107 <= (reg89[(4'h9):(1'h0)] * (~$signed((+wire72[(4'hf):(3'h4)]))));
            end
          else
            begin
              reg104 <= ($signed(($unsigned((reg100 + wire70)) ?
                  $unsigned($unsigned((8'hbe))) : (wire73[(3'h6):(3'h5)] <<< wire102))) & wire67[(1'h0):(1'h0)]);
              reg105 <= (reg90 != reg105);
              reg106 <= reg105;
              reg107 <= $unsigned($signed((~reg87[(4'he):(4'h9)])));
              reg108 <= $signed((wire69[(3'h7):(2'h3)] >= $unsigned(reg83[(4'h8):(1'h0)])));
            end
        end
      else
        begin
          reg103 <= reg106;
          reg104 <= (reg85 - (^~reg75[(4'hd):(2'h2)]));
          reg105 <= (wire74 ^~ $unsigned(((8'hb9) < $unsigned(wire69))));
          if (wire73[(4'hb):(4'hb)])
            begin
              reg106 <= ($signed((($signed((8'ha3)) == {(8'had)}) >>> (^reg104))) ^~ (^wire66));
              reg107 <= wire67;
              reg108 <= ($signed($unsigned((wire66 >= $unsigned(reg107)))) ?
                  ((!reg89) ?
                      wire95 : ($unsigned(reg88) ?
                          ((wire102 ? reg97 : wire72) ?
                              reg83 : (~&(8'haf))) : $unsigned($signed(reg97)))) : {(reg77[(4'h9):(3'h5)] ?
                          ($unsigned(reg85) ?
                              (~reg81) : $signed(wire74)) : (-(&reg107)))});
            end
          else
            begin
              reg106 <= {(reg76[(4'h8):(3'h5)] ^~ (reg78[(2'h3):(1'h1)] >>> (~^wire64[(4'ha):(4'ha)])))};
              reg107 <= ($signed($unsigned(reg101)) ?
                  wire74[(5'h11):(1'h0)] : (+$unsigned(wire65[(4'he):(2'h2)])));
              reg108 <= reg100;
              reg109 <= (8'hb7);
            end
        end
      reg110 <= {$unsigned(wire94), reg80[(4'h8):(1'h0)]};
      reg111 <= reg82[(3'h5):(2'h3)];
      reg112 <= $unsigned((-(({reg81,
          wire64} && $unsigned(wire72)) || ((reg107 >= wire93) ?
          wire73[(4'ha):(4'h8)] : reg106[(4'he):(1'h1)]))));
    end
  assign wire113 = (|{wire69, (-{$unsigned(reg80), wire72[(3'h7):(3'h7)]})});
  assign wire114 = (|reg110[(1'h1):(1'h1)]);
  assign wire115 = (wire65 ?
                       $signed(($signed((wire94 ? (8'hb7) : wire70)) ?
                           ($unsigned(reg90) << reg98) : $signed(wire74))) : (-(!reg81)));
  assign wire116 = (wire69[(3'h4):(1'h1)] ? reg111[(3'h4):(1'h1)] : (8'hb2));
  assign wire117 = (~^wire65);
  assign wire118 = (wire69[(1'h1):(1'h0)] ?
                       $unsigned($unsigned($signed((reg110 + wire71)))) : (-($unsigned((!reg82)) ?
                           ({wire92, wire116} ?
                               (reg109 * wire66) : $unsigned((8'ha2))) : (7'h44))));
  assign wire119 = $unsigned($signed($signed($unsigned((8'had)))));
  always
    @(posedge clk) begin
      reg120 <= reg84;
    end
endmodule

module module26
#(parameter param54 = ((((-(~(8'hb8))) < (-{(7'h41)})) ^~ (~&(((8'hbd) << (7'h43)) <<< ((8'haf) ? (8'hb0) : (8'had))))) | (((((8'h9f) >= (8'hb1)) ? (~(8'ha9)) : ((8'hb8) ? (8'hac) : (8'hbd))) ? (((8'hbd) + (8'ha1)) ? (^(8'h9f)) : {(7'h41)}) : (~|(+(8'ha4)))) ? ((~^(~(8'hb5))) >= {((8'ha0) & (8'ha4)), ((8'hb7) ? (8'h9d) : (8'h9f))}) : (((~(8'hb0)) ? ((8'hba) > (8'haa)) : ((8'h9e) ? (8'ha2) : (8'hab))) ? (8'ha5) : {{(8'hb5), (7'h43)}}))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire31 = (((wire30 || ((wire28 ? wire29 : wire28) ?
                              (wire27 ? wire29 : wire29) : (8'ha0))) ?
                          wire29[(4'h8):(2'h3)] : $signed({wire28})) ?
                      $unsigned((&(7'h43))) : $unsigned($signed(wire28)));
  assign wire32 = $signed({(wire29 || wire31)});
  assign wire33 = $unsigned($signed(wire27));
  assign wire34 = wire33[(2'h3):(2'h3)];
  assign wire35 = ((~wire27) ?
                      $signed((~(~|(wire27 || wire28)))) : (&$signed($signed(wire34[(2'h2):(2'h2)]))));
  assign wire36 = $signed(wire27);
  assign wire37 = wire28;
  assign wire38 = {wire34};
  always
    @(posedge clk) begin
      reg39 <= wire29;
      reg40 <= (wire35 + $signed(((8'hbd) ?
          {(wire31 ? wire28 : wire37), (wire30 + wire28)} : ({wire32} ?
              wire29 : wire27))));
      reg41 <= {{{(&wire29)}, wire29[(1'h0):(1'h0)]},
          $unsigned(reg39[(2'h3):(2'h3)])};
    end
  assign wire42 = {(~(((wire35 >= reg40) <<< {reg40}) ?
                          (reg39 ?
                              $unsigned(wire32) : (wire38 ^~ (8'ha9))) : (~$signed(wire27))))};
  assign wire43 = $unsigned($signed((-((-(8'hb5)) ?
                      (wire27 ? wire31 : (8'h9d)) : $unsigned(reg41)))));
  assign wire44 = ($unsigned((wire27 ?
                          ($signed(wire36) + (wire32 ?
                              wire35 : (7'h43))) : {wire37[(1'h1):(1'h0)],
                              (~wire29)})) ?
                      $signed((wire42[(2'h2):(1'h0)] <<< {wire27})) : (wire28 << $unsigned(((wire43 >>> wire34) == wire29))));
  assign wire45 = $signed(wire43[(4'hb):(4'h8)]);
  assign wire46 = wire28[(3'h5):(3'h5)];
  assign wire47 = wire45[(2'h2):(2'h2)];
  assign wire48 = (^$signed($unsigned(($unsigned((8'h9e)) ?
                      $signed(wire47) : {reg39}))));
  assign wire49 = ((-wire44[(3'h7):(2'h2)]) != wire28);
  assign wire50 = $unsigned(wire31[(5'h11):(4'hc)]);
  assign wire51 = wire32;
  assign wire52 = wire33;
  assign wire53 = (^~($unsigned(wire50[(5'h10):(4'h8)]) & wire44));
endmodule
