module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire54;
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire132,
                 wire60,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire54,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire5 = ((^wire1[(3'h4):(3'h4)]) ~^ (wire2 + wire1[(3'h7):(1'h1)]));
  assign wire6 = $unsigned(({(~^(~&wire1))} ?
                     $unsigned((&{wire5, wire1})) : $signed((8'ha3))));
  assign wire7 = (-(-$unsigned(wire2)));
  assign wire8 = $unsigned(wire3);
  module9 #() modinst55 (wire54, clk, wire5, wire4, wire7, wire6, wire8);
  always
    @(posedge clk) begin
      reg56 <= wire2[(1'h1):(1'h1)];
      reg57 <= $unsigned({({$signed(wire6)} ?
              wire5[(3'h7):(3'h5)] : {((7'h43) ? wire6 : (8'hb7)),
                  (~|wire54)})});
      reg58 <= wire4;
      reg59 <= $unsigned((+wire6));
    end
  assign wire60 = (wire8 ^~ wire6[(4'hc):(3'h6)]);
  module61 #() modinst133 (wire132, clk, reg57, reg58, wire0, wire54);
  assign wire134 = $signed($signed(reg58));
  assign wire135 = {(~^$unsigned($signed(((8'hb9) - wire1)))),
                       ((wire6 ?
                               (~^(|wire5)) : {$unsigned(wire5),
                                   (reg56 < wire1)}) ?
                           $signed(((wire7 ?
                               reg57 : wire5) | $unsigned(wire4))) : {((wire0 ?
                                   wire2 : wire0) || (wire134 == (7'h40))),
                               {$unsigned(wire132), (^~wire6)}})};
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire signed [(4'h9):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(4'h8):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire66;
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire88,
                 wire66,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg90,
                 (1'h0)};
  assign wire66 = $signed((wire63 > wire63));
  module67 #() modinst89 (wire88, clk, wire64, wire62, wire65, wire63);
  always
    @(posedge clk) begin
      reg90 <= wire66;
    end
  assign wire91 = wire64;
  assign wire92 = ({(wire66[(2'h2):(1'h0)] != (wire62[(3'h5):(2'h3)] ?
                          reg90[(1'h1):(1'h1)] : (wire91 ? (8'hbe) : wire65))),
                      (8'h9c)} << (($signed((reg90 > reg90)) ?
                      ($unsigned(wire63) >>> {wire66}) : $unsigned(wire88)) == (({(8'ha8)} >> $signed((8'ha3))) ?
                      (!(+wire66)) : (^~wire91))));
  assign wire93 = (+$signed($signed((~^wire64[(3'h5):(2'h2)]))));
  assign wire94 = wire92[(3'h4):(2'h2)];
  assign wire95 = $unsigned(wire94);
  assign wire96 = ((($signed(wire94[(2'h2):(1'h1)]) - ((wire95 ?
                                  (8'hb4) : wire63) ?
                              wire94[(1'h0):(1'h0)] : (^wire93))) ?
                          (wire92[(3'h4):(3'h4)] ?
                              (^~(wire88 ~^ (8'hb7))) : $unsigned((wire91 ?
                                  (8'hba) : wire66))) : (wire95[(1'h0):(1'h0)] * $signed(((8'ha5) << wire63)))) ?
                      $signed($signed((!((8'h9d) ?
                          (8'h9e) : wire64)))) : ((~&$unsigned({(7'h43)})) || ({(wire64 ?
                                  wire88 : reg90)} ?
                          ($unsigned(wire88) ?
                              wire65[(3'h4):(3'h4)] : wire95) : ((wire91 == wire63) ^ {(8'ha9),
                              wire88}))));
  assign wire97 = wire95;
  assign wire98 = wire63[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg99 <= $signed(wire88);
      reg100 <= $unsigned($unsigned(((wire96[(1'h0):(1'h0)] << wire91) ?
          {reg90[(1'h1):(1'h1)]} : $unsigned($signed(wire96)))));
      reg101 <= (~^($signed($signed((wire97 >= reg90))) || ({(&wire65)} > ($signed(wire91) ?
          wire66 : $signed(wire91)))));
      reg102 <= reg90[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      if (wire62)
        begin
          if (((+reg102) ?
              (((wire91 + {wire66}) ~^ ((~^wire62) ^ wire88)) ?
                  $signed({$unsigned(wire65),
                      (wire95 & wire96)}) : (((wire65 | wire88) ?
                          ((8'hb9) > wire88) : wire91) ?
                      ({reg99, reg101} ?
                          wire94 : {reg101}) : wire91[(5'h13):(2'h2)])) : $signed($signed($unsigned((wire64 ?
                  (8'hb7) : reg102))))))
            begin
              reg103 <= $signed(wire63[(5'h11):(2'h3)]);
              reg104 <= ((-reg90[(2'h2):(2'h2)]) > reg100);
              reg105 <= reg103[(1'h0):(1'h0)];
              reg106 <= (&$signed($signed({$unsigned(wire91)})));
              reg107 <= wire95[(1'h1):(1'h0)];
            end
          else
            begin
              reg103 <= reg101;
              reg104 <= $signed(wire93[(4'hc):(4'h9)]);
              reg105 <= wire65[(4'h8):(1'h0)];
              reg106 <= ((~^wire93) && (|$signed((~wire62[(2'h2):(2'h2)]))));
            end
          reg108 <= reg99[(1'h1):(1'h1)];
          reg109 <= (~^(!{(((8'ha3) ? reg103 : reg99) << $unsigned(reg102)),
              wire63[(4'ha):(1'h1)]}));
          if ($signed((~&reg103[(1'h0):(1'h0)])))
            begin
              reg110 <= wire98[(4'h8):(1'h0)];
              reg111 <= reg99;
              reg112 <= $signed((!reg102[(2'h3):(2'h2)]));
              reg113 <= {$unsigned(reg99[(2'h2):(1'h1)]),
                  $signed($signed(wire62[(3'h7):(3'h6)]))};
              reg114 <= reg101;
            end
          else
            begin
              reg110 <= (reg105[(3'h5):(3'h5)] ?
                  (8'h9d) : (($signed($unsigned(reg90)) ?
                      {wire97[(2'h2):(1'h1)],
                          $unsigned(reg100)} : {reg113[(3'h4):(1'h1)]}) - (($signed(reg104) ?
                          ((7'h41) ? reg101 : (8'hba)) : (wire97 ?
                              wire63 : wire88)) ?
                      (~^reg109) : ({wire65} && $unsigned((8'ha7))))));
              reg111 <= $unsigned(reg103);
            end
        end
      else
        begin
          reg103 <= ((($unsigned((reg105 <<< reg110)) >= reg111[(3'h7):(2'h3)]) ?
                  $signed({reg108[(4'hd):(4'ha)]}) : $unsigned({(reg105 | (8'h9c))})) ?
              $signed((~^($unsigned(wire94) || (reg108 ?
                  reg111 : reg110)))) : (&$signed({(wire96 ?
                      (8'ha5) : wire91)})));
          reg104 <= ((&(-reg104[(4'h8):(2'h3)])) >= reg90[(1'h1):(1'h0)]);
        end
      if ({reg110[(3'h4):(3'h4)]})
        begin
          reg115 <= (8'hbd);
        end
      else
        begin
          reg115 <= $signed((7'h42));
          reg116 <= wire95;
          reg117 <= reg111[(1'h1):(1'h1)];
          if (reg99[(3'h4):(3'h4)])
            begin
              reg118 <= (($unsigned((^~$unsigned(reg116))) ?
                      $signed($unsigned((reg103 ?
                          wire64 : wire93))) : $signed(((reg117 ?
                              wire96 : reg104) ?
                          $unsigned((8'ha7)) : $unsigned(wire66)))) ?
                  reg111[(3'h6):(3'h5)] : $signed(wire88));
              reg119 <= $unsigned(reg101);
              reg120 <= (!(wire63 - $signed(((^wire95) >>> {wire98}))));
            end
          else
            begin
              reg118 <= wire98[(2'h3):(2'h3)];
              reg119 <= reg99[(2'h2):(1'h0)];
              reg120 <= (^$unsigned(wire65[(1'h0):(1'h0)]));
              reg121 <= {$signed((8'hb4))};
            end
        end
      reg122 <= ((reg120 || (^~wire97)) ^ wire97[(2'h2):(1'h1)]);
      reg123 <= (!$unsigned(wire94[(1'h0):(1'h0)]));
      reg124 <= (^$signed($unsigned(((~|reg111) ?
          reg116[(2'h2):(1'h1)] : reg90))));
    end
  assign wire125 = ((reg119 ? reg103[(1'h0):(1'h0)] : reg112) ?
                       reg111 : $signed(($unsigned($unsigned(wire65)) ?
                           (((8'hb8) ? reg103 : reg90) ?
                               reg114[(4'hd):(4'hd)] : reg106) : (~&$signed(reg117)))));
  assign wire126 = ($unsigned(({(wire64 - wire88), (^wire62)} || ((-reg118) ?
                       $unsigned(reg122) : wire94))) * reg118);
  assign wire127 = $unsigned(reg111[(2'h2):(1'h1)]);
  assign wire128 = (8'ha4);
  assign wire129 = ($unsigned($signed(((reg90 - reg124) ?
                       wire94[(2'h3):(1'h1)] : (wire128 <= (8'hb1))))) < wire66[(1'h0):(1'h0)]);
  assign wire130 = (~^(7'h41));
  assign wire131 = {$unsigned({reg106[(2'h3):(2'h2)], $unsigned((~|reg105))}),
                       (wire127[(4'hc):(4'hb)] ?
                           $unsigned((~^(~reg118))) : $signed((&(reg99 && wire88))))};
endmodule

module module9
#(parameter param52 = {((((-(8'h9f)) ? ((8'h9f) ? (7'h43) : (8'hbb)) : ((8'ha7) ^ (8'hb8))) == (((8'hbe) ? (8'ha5) : (8'ha4)) >= (~|(8'h9f)))) >> (~^(-(~|(8'ha0)))))}, 
parameter param53 = (param52 ? (param52 ? param52 : ((^param52) < ((param52 ~^ param52) >> (&param52)))) : ((8'h9e) > (param52 ? ({(8'ha1), param52} >>> (param52 ? param52 : param52)) : (^{param52, param52})))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire48,
                 wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg15,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= (((($signed((8'h9f)) ?
          (!wire11) : wire10) != $unsigned((-wire14))) ^~ $signed((~^$unsigned(wire12)))) ^ wire13[(2'h2):(2'h2)]);
    end
  assign wire16 = reg15[(5'h14):(2'h2)];
  assign wire17 = (((~|(^~wire10)) ?
                      $unsigned($unsigned($signed(wire14))) : (~$unsigned($unsigned(wire14)))) + ($unsigned({(~wire11),
                          ((7'h42) ? wire11 : reg15)}) ?
                      $signed(wire16) : (({wire12, wire16} ?
                          ((8'hbe) ?
                              (8'hbe) : wire11) : wire10) ^~ {(~^wire11)})));
  assign wire18 = $signed(((~$signed((wire12 ?
                      (8'h9d) : wire11))) != (-(~|(wire16 << wire10)))));
  assign wire19 = $signed((!$unsigned({$unsigned(wire18),
                      (wire11 ? wire16 : (8'hbe))})));
  assign wire20 = (($signed($unsigned((wire14 ?
                      wire17 : wire19))) ~^ {$signed($unsigned((8'hb8)))}) == (wire11[(3'h5):(2'h2)] & $signed($unsigned($unsigned((8'hb2))))));
  assign wire21 = (~^$signed(reg15[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if ($unsigned((wire11 ? wire11 : $unsigned($signed($signed((8'hab)))))))
        begin
          reg22 <= (wire21[(2'h3):(1'h1)] >>> $signed($signed({(wire19 ^~ wire14)})));
        end
      else
        begin
          reg22 <= $unsigned(wire11);
        end
      reg23 <= reg15;
    end
  assign wire24 = ((+(|(-$unsigned(wire16)))) * $signed(reg22));
  assign wire25 = ($unsigned($signed({$signed(reg22)})) * {wire10[(4'h9):(2'h3)],
                      $unsigned((wire24 - $signed(reg23)))});
  assign wire26 = $unsigned(wire11[(3'h6):(2'h3)]);
  module27 #() modinst49 (wire48, clk, reg23, wire11, wire17, wire10, wire25);
  assign wire50 = $unsigned(wire21[(2'h2):(1'h0)]);
  assign wire51 = (wire25[(4'h9):(1'h1)] ? wire48 : $unsigned(wire12));
endmodule

module module27
#(parameter param47 = (!(+{(((8'ha1) ^ (8'ha2)) | ((8'ha2) << (8'h9c)))})))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  assign y = {wire46,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire33 = (wire29 ?
                      ((^$unsigned(((8'hb0) >>> wire28))) << wire30[(2'h3):(1'h1)]) : ($unsigned(wire32) << {(~^{wire29}),
                          ((wire30 * wire29) - wire32)}));
  assign wire34 = (($signed($signed((^~(8'hac)))) + wire30) && (~{wire33[(1'h0):(1'h0)],
                      ((~^wire30) - wire32[(1'h1):(1'h1)])}));
  assign wire35 = wire31[(4'ha):(1'h0)];
  assign wire36 = wire28;
  assign wire37 = (($signed($signed(wire33[(1'h1):(1'h0)])) >= (~|wire35)) || $signed($unsigned({(wire34 ?
                          (7'h43) : wire29)})));
  assign wire38 = $unsigned(((~|$signed({wire34, wire34})) ?
                      $signed(((wire37 > wire36) ^ $signed(wire34))) : $unsigned((wire28 ?
                          $signed((8'hb6)) : {wire34}))));
  assign wire39 = (~&$signed($signed((wire29[(4'h8):(3'h4)] == (wire31 ?
                      (8'ha6) : wire32)))));
  assign wire40 = $unsigned({wire35[(3'h7):(1'h1)]});
  always
    @(posedge clk) begin
      reg41 <= $signed((({(wire29 ? wire30 : wire32), ((8'ha2) < wire33)} ?
              ({wire36, wire40} || (|wire28)) : (wire28[(1'h0):(1'h0)] ?
                  $unsigned(wire38) : {(8'hbd), wire28})) ?
          $signed(((wire29 ?
              wire31 : (8'ha6)) - $signed(wire32))) : ($unsigned($unsigned(wire36)) ?
              ({wire31, wire36} ? $unsigned(wire39) : wire40) : wire37)));
      reg42 <= wire29;
      reg43 <= wire39;
      reg44 <= (8'hb6);
      reg45 <= $unsigned({$signed(wire34),
          ((!$unsigned(wire28)) ^ {$signed(wire30), (^~wire28)})});
    end
  assign wire46 = ($signed((^~wire33[(2'h3):(2'h3)])) < $unsigned((((wire35 ?
                              wire37 : wire40) ?
                          wire32 : (|wire31)) ?
                      ($unsigned(wire37) * {wire32,
                          wire37}) : wire32[(2'h2):(1'h0)])));
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire signed [(3'h7):(1'h0)] wire70;
  input wire signed [(4'h8):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  assign y = {wire87,
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
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = wire68;
  assign wire73 = (&wire70);
  assign wire74 = $signed($unsigned(($unsigned((~|wire71)) ?
                      wire73[(1'h0):(1'h0)] : wire68[(3'h6):(3'h5)])));
  assign wire75 = ($unsigned((wire70[(3'h5):(1'h0)] * wire68)) ?
                      $signed(($unsigned(wire70[(3'h6):(1'h0)]) ?
                          wire72[(4'h8):(3'h7)] : (^~wire73))) : wire68);
  assign wire76 = $unsigned($signed((^((wire68 ? wire68 : wire69) ?
                      (8'had) : wire69[(3'h4):(3'h4)]))));
  assign wire77 = $signed((~^$signed($unsigned((wire72 ? wire76 : wire68)))));
  assign wire78 = wire75;
  assign wire79 = ({$unsigned(({wire72} ~^ wire69[(4'h8):(2'h2)])),
                          (&($signed(wire69) || (wire68 >= wire68)))} ?
                      (8'hb7) : $signed((($unsigned(wire77) ?
                              $signed(wire71) : ((8'hb3) >> wire70)) ?
                          (-(wire71 >>> wire75)) : ($signed(wire78) > wire69))));
  assign wire80 = wire73;
  assign wire81 = (wire79 ?
                      (wire80 ?
                          $unsigned($signed(wire75)) : wire80[(4'hc):(3'h6)]) : {wire77,
                          wire77[(3'h4):(2'h2)]});
  assign wire82 = ($signed($unsigned(((wire77 ? wire71 : wire73) ?
                          wire78[(2'h2):(1'h0)] : $unsigned(wire68)))) ?
                      (((wire78 & wire76) << (wire78 ^~ $unsigned(wire78))) ?
                          wire74[(4'hb):(4'hb)] : ((wire73 ?
                                  wire72[(4'ha):(2'h2)] : (~|wire73)) ?
                              wire80[(4'hb):(4'ha)] : $signed((8'h9e)))) : ($unsigned(wire71) ?
                          {$signed($unsigned((7'h43)))} : $signed((8'hb2))));
  assign wire83 = $signed((~wire77));
  assign wire84 = (|($unsigned($unsigned({wire83})) < (-{wire75[(2'h3):(2'h2)]})));
  assign wire85 = wire73[(2'h2):(1'h0)];
  assign wire86 = wire68;
  assign wire87 = wire68[(3'h5):(2'h2)];
endmodule
