module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire94;
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  assign y = {wire96,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire94,
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
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h1)];
  assign wire5 = (wire4[(4'h9):(1'h1)] >>> (^~(((wire2 ?
                     wire3 : wire4) < (~&wire2)) + ((~^wire3) <= (wire2 ?
                     wire3 : wire4)))));
  assign wire6 = ((~wire1) ?
                     $unsigned({(wire3[(2'h2):(2'h2)] ?
                             (+wire4) : {wire4})}) : $unsigned(wire1));
  assign wire7 = $signed(((wire0[(2'h2):(1'h1)] ?
                     (wire4[(3'h4):(2'h3)] & (wire2 ?
                         wire5 : wire6)) : $unsigned($unsigned(wire6))) & (~|wire0)));
  assign wire8 = ((((-(~|wire6)) ? wire4[(4'hd):(4'h8)] : (~^wire0)) ?
                     (+{wire0,
                         $signed(wire7)}) : (!(wire0[(2'h2):(1'h0)] >>> $unsigned(wire4)))) != (-$unsigned($signed($signed(wire2)))));
  assign wire9 = ((8'ha9) ? (8'hae) : $signed(wire7));
  assign wire10 = wire9[(3'h6):(1'h0)];
  assign wire11 = (~&$signed($unsigned(wire1[(1'h0):(1'h0)])));
  assign wire12 = (wire10 >> ($unsigned({$signed(wire3),
                      (!wire1)}) ^~ ((~^(wire6 <= wire0)) ?
                      $unsigned((wire10 ?
                          wire3 : wire1)) : wire2[(1'h0):(1'h0)])));
  module13 #() modinst95 (.wire17(wire11), .clk(clk), .wire15(wire3), .wire14(wire5), .wire16(wire1), .wire18(wire6), .y(wire94));
  assign wire96 = (-($signed($signed($signed((8'hae)))) ?
                      (~^{wire1[(3'h4):(2'h3)],
                          (wire0 ?
                              wire0 : (8'hb6))}) : ((^~$signed(wire2)) >>> ((&(8'ha9)) > wire7))));
  always
    @(posedge clk) begin
      reg97 <= {{(~&(wire4[(5'h10):(3'h6)] == (wire0 ? wire12 : wire9)))},
          ((^$signed({wire1, wire94})) ?
              ((wire10 ^~ (wire94 ? wire10 : (7'h43))) ?
                  ((~wire7) && (^~(8'had))) : wire96[(1'h0):(1'h0)]) : (!$signed({wire94,
                  wire1})))};
      if (wire96[(2'h2):(1'h0)])
        begin
          reg98 <= {(^wire6)};
          reg99 <= (|wire12);
        end
      else
        begin
          reg98 <= wire9[(4'h9):(2'h2)];
          if (($signed(wire94[(1'h1):(1'h1)]) << ((^~wire5[(2'h2):(1'h0)]) >> $signed($signed({wire94})))))
            begin
              reg99 <= reg99[(3'h5):(2'h2)];
              reg100 <= (((&($unsigned(wire94) ?
                      {(8'hbe)} : (wire94 ? (8'ha5) : wire12))) ?
                  $unsigned($signed((reg99 ? reg99 : wire12))) : {wire11,
                      $unsigned((wire7 ?
                          wire6 : wire7))}) > (^~$signed($unsigned((wire5 && wire0)))));
              reg101 <= {$signed((^~wire2[(1'h1):(1'h1)])),
                  wire3[(4'h9):(3'h4)]};
            end
          else
            begin
              reg99 <= $unsigned({wire2, wire94[(1'h1):(1'h1)]});
              reg100 <= ((~&$unsigned((wire11 ?
                  $unsigned(wire6) : $signed((8'ha9))))) | $signed(wire5[(5'h15):(2'h3)]));
            end
          reg102 <= ($signed($signed($unsigned((reg98 + wire11)))) ?
              ((8'haf) ?
                  $unsigned($signed($signed(reg98))) : $unsigned(wire2[(2'h2):(1'h0)])) : $signed((8'hba)));
          if (wire4)
            begin
              reg103 <= ($unsigned(((!wire9) ?
                  $signed($unsigned((8'hb4))) : ({(8'ha2), reg97} ?
                      (wire0 >>> wire10) : {wire0,
                          wire10}))) > ({$signed($unsigned(reg97))} ?
                  $signed(((7'h43) == {(8'hb0),
                      (8'ha3)})) : wire3[(4'hf):(2'h2)]));
              reg104 <= wire7;
              reg105 <= (((~&$unsigned(((8'hb2) ? (8'haf) : wire1))) ?
                      reg102[(2'h2):(2'h2)] : (((reg99 ? reg97 : reg98) ?
                              $signed((7'h43)) : (wire0 > wire9)) ?
                          $unsigned((~wire0)) : (!wire1[(4'h9):(1'h1)]))) ?
                  reg98[(3'h5):(2'h2)] : {reg98[(4'h8):(2'h2)],
                      ($signed((reg102 ? reg103 : (8'hbf))) ?
                          (^reg102) : ($unsigned((8'hba)) >>> (wire96 ?
                              wire9 : reg103)))});
              reg106 <= wire0;
              reg107 <= wire12[(2'h2):(1'h1)];
            end
          else
            begin
              reg103 <= reg102;
              reg104 <= wire2[(2'h3):(2'h2)];
            end
          if ($signed(reg97))
            begin
              reg108 <= ($signed($unsigned($unsigned({reg105}))) ?
                  ($unsigned(((reg100 && wire10) ?
                          (~^reg100) : (wire1 - wire2))) ?
                      ($unsigned((!wire2)) >> {(wire8 >= (8'hb6)),
                          ((8'hb8) || wire11)}) : reg104) : reg98);
            end
          else
            begin
              reg108 <= $signed(wire96[(1'h1):(1'h1)]);
              reg109 <= (($signed(wire11) ?
                      ((8'hb1) ?
                          wire0[(1'h0):(1'h0)] : $signed($signed(wire0))) : (((8'ha4) >= (~&(8'hbe))) ?
                          wire12[(4'h8):(3'h4)] : wire12[(1'h1):(1'h1)])) ?
                  (~($signed(((8'ha7) ? (8'hbe) : wire5)) ?
                      $signed($signed(reg100)) : {$signed(reg102),
                          (wire1 >>> reg100)})) : $signed(((^(wire6 ^ wire8)) * $signed((^wire8)))));
              reg110 <= {$unsigned((-$unsigned((reg107 ? (8'hbe) : (7'h40))))),
                  $signed(wire0[(1'h1):(1'h0)])};
            end
        end
    end
  always
    @(posedge clk) begin
      reg111 <= $signed(reg104[(1'h1):(1'h0)]);
      if (reg105[(3'h7):(3'h5)])
        begin
          reg112 <= reg103;
          reg113 <= ($unsigned($signed(((reg107 | reg110) ^~ {reg107,
              reg111}))) + (wire96[(2'h3):(1'h1)] == (8'hb5)));
          reg114 <= (~^$signed($signed(((reg112 ~^ wire12) < $signed(wire6)))));
          reg115 <= wire94;
        end
      else
        begin
          if ((wire5 || $unsigned(((&$signed(wire10)) ?
              (^~$unsigned(reg107)) : (8'h9e)))))
            begin
              reg112 <= wire3;
            end
          else
            begin
              reg112 <= wire1[(1'h0):(1'h0)];
              reg113 <= reg109[(3'h6):(1'h1)];
              reg114 <= (~($signed($unsigned((reg107 != reg104))) > (({reg98,
                      reg98} ?
                  $signed(reg100) : (wire9 == wire96)) <<< (~&(reg107 == wire7)))));
              reg115 <= (&reg105[(4'h9):(3'h4)]);
            end
          reg116 <= reg109[(2'h3):(2'h3)];
          reg117 <= (-reg112);
          reg118 <= (~$signed(reg107));
          reg119 <= (^reg108[(3'h5):(1'h0)]);
        end
      reg120 <= (~^(8'hb0));
      reg121 <= (reg110 || $unsigned((reg101[(3'h4):(2'h3)] ?
          (^(|reg97)) : ($unsigned((8'hab)) + reg109))));
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg93,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&$signed(wire15)))
        begin
          reg19 <= (((wire17 <<< (-(~wire15))) ?
                  wire16[(4'hd):(4'hb)] : wire16) ?
              $signed((!$signed(((8'ha2) ?
                  wire17 : wire16)))) : (($unsigned($signed(wire15)) << ($signed(wire15) & (8'hb2))) > wire17[(3'h6):(3'h5)]));
          if (wire18)
            begin
              reg20 <= wire15;
              reg21 <= wire16[(1'h1):(1'h0)];
              reg22 <= {wire16[(2'h2):(2'h2)]};
            end
          else
            begin
              reg20 <= $unsigned(wire15[(4'he):(4'ha)]);
              reg21 <= wire15;
              reg22 <= $unsigned((($unsigned((wire18 ?
                      wire17 : wire14)) ^~ $unsigned((wire18 ?
                      wire18 : reg20))) ?
                  $signed((^~((8'hba) - reg20))) : (+({reg22, (8'hbb)} ?
                      reg20 : $signed(reg19)))));
              reg23 <= $signed(wire15);
              reg24 <= {$unsigned($unsigned(wire17[(2'h2):(1'h0)])),
                  ((-wire16[(3'h4):(1'h0)]) ?
                      $unsigned($signed((reg19 ?
                          reg23 : wire14))) : {($unsigned(reg20) ?
                              (-reg21) : reg20[(1'h1):(1'h1)]),
                          reg21})};
            end
        end
      else
        begin
          if ((|reg24))
            begin
              reg19 <= wire14;
              reg20 <= (~^(+(reg23[(3'h5):(2'h3)] & $unsigned($unsigned(reg21)))));
              reg21 <= $signed((~&wire15));
              reg22 <= $signed((reg19[(3'h7):(1'h0)] ?
                  $signed(((reg21 <<< wire14) ?
                      $signed(reg23) : (reg21 < wire15))) : {$unsigned(reg21[(4'h8):(3'h5)]),
                      $unsigned(((7'h43) >> (8'hb7)))}));
              reg23 <= wire14;
            end
          else
            begin
              reg19 <= (reg20 ?
                  (+(~^($unsigned(reg24) ?
                      $signed(reg22) : (wire14 ^~ wire17)))) : wire18[(1'h0):(1'h0)]);
              reg20 <= reg19[(4'h8):(3'h7)];
            end
          reg24 <= reg20;
          if (wire18[(2'h2):(1'h1)])
            begin
              reg25 <= ($unsigned((((wire18 || reg24) || (~^wire16)) ?
                      $unsigned((wire14 ? wire17 : reg19)) : reg24)) ?
                  (wire17 ?
                      $signed((reg20 && reg24)) : ($unsigned((~&reg20)) ?
                          $signed(((7'h42) & (8'h9c))) : ((&(8'hb2)) ?
                              reg21[(3'h4):(1'h0)] : reg22))) : {reg23[(4'h8):(1'h0)]});
            end
          else
            begin
              reg25 <= $signed(($signed($signed(wire16)) ^~ {reg20[(2'h2):(1'h1)]}));
            end
          reg26 <= reg23[(3'h4):(1'h0)];
        end
      reg27 <= (~&wire18);
      reg28 <= (~&({(~^$unsigned(reg20))} > (|({(8'haf)} >= {wire15}))));
      reg29 <= ((~|$signed((-reg28[(4'h8):(3'h4)]))) ?
          (-($signed($signed(reg23)) ?
              reg23[(3'h5):(3'h5)] : $unsigned((reg26 ?
                  (8'h9e) : reg23)))) : (($unsigned((reg24 & reg28)) ^~ {reg26,
                  (^reg23)}) ?
              reg25 : reg23));
      reg30 <= reg24;
    end
  assign wire31 = (8'ha5);
  assign wire32 = (($signed(($unsigned(reg24) >>> $unsigned(wire15))) ?
                      $unsigned(reg30[(5'h11):(4'hb)]) : (8'ha0)) <<< (reg23[(4'h8):(3'h6)] >= $unsigned((wire14 ^ reg29[(4'ha):(3'h5)]))));
  assign wire33 = (!($unsigned(($unsigned(reg29) * (wire32 ?
                          (8'ha3) : reg22))) ?
                      ((!(&reg24)) ^~ (^~wire16)) : ($signed($unsigned(reg22)) >>> (reg19[(3'h7):(3'h5)] != (&reg27)))));
  assign wire34 = wire15;
  assign wire35 = ($signed(($unsigned($signed(reg30)) ?
                      (-$signed((8'hb1))) : wire33)) >> (wire34 ?
                      ($unsigned((-wire15)) && ($signed((8'hbc)) ?
                          $signed((8'hbc)) : $unsigned(reg29))) : {(reg26[(2'h3):(2'h3)] == reg30),
                          (wire15 || (reg20 >> reg26))}));
  module36 #() modinst87 (wire86, clk, reg29, wire33, wire18, reg22, reg21);
  assign wire88 = wire16[(4'hf):(4'h8)];
  assign wire89 = $signed(reg27[(4'hd):(4'hd)]);
  assign wire90 = (wire89[(5'h14):(1'h1)] ?
                      $signed((((reg26 ? reg24 : wire32) ?
                          (~^wire33) : reg26[(2'h3):(1'h0)]) != reg25[(1'h0):(1'h0)])) : $signed($signed((+(wire14 ?
                          wire86 : (7'h43))))));
  assign wire91 = (((~$signed(wire34)) ^ (reg24 ~^ {((8'hb4) ? wire88 : reg25),
                      $unsigned(reg28)})) + (($unsigned(wire35[(1'h0):(1'h0)]) || ((reg27 <= reg22) ?
                      $signed(reg20) : (wire31 == reg21))) >> wire89));
  assign wire92 = reg26;
  always
    @(posedge clk) begin
      reg93 <= (($unsigned(((reg22 <<< wire15) == reg25)) ?
          wire91[(4'hc):(3'h7)] : $signed((+(reg29 << (8'haf))))) || (reg29 ?
          wire89[(4'h9):(4'h8)] : reg26));
    end
endmodule

module module36
#(parameter param84 = {(({((8'hb2) ~^ (8'hb1)), (+(8'h9f))} > {((8'hb3) ? (8'ha0) : (8'h9d))}) ? ((((7'h44) | (8'ha9)) ? (8'hbd) : {(8'h9d), (8'haf)}) | (((8'ha0) ? (8'hbd) : (8'ha9)) ? (8'hbf) : ((8'hb6) > (8'h9f)))) : (+(((7'h43) != (8'ha7)) ? ((8'hba) + (8'ha6)) : ((8'hb9) ? (8'ha9) : (7'h40)))))}, 
parameter param85 = (|((^~(param84 ? param84 : (param84 ^~ param84))) <<< (param84 ? {{(8'hb7), param84}, (param84 << (8'hbe))} : (^~(-param84))))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire56;
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 reg63,
                 reg55,
                 reg54,
                 reg53,
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
  always
    @(posedge clk) begin
      reg42 <= (|$signed($signed(($signed(wire39) ?
          (-wire39) : $signed(wire41)))));
      if ($unsigned(reg42))
        begin
          reg43 <= {$unsigned((8'hb0))};
          reg44 <= $unsigned((~(!$signed((wire39 < reg42)))));
        end
      else
        begin
          reg43 <= $unsigned((!($signed(wire38) <<< $unsigned((wire37 ?
              reg43 : reg43)))));
          if ($signed(wire41))
            begin
              reg44 <= $signed({(reg44 == ($signed(wire40) ?
                      {reg43, wire41} : wire38[(4'he):(4'he)])),
                  (^{$signed(wire39), (~^wire38)})});
              reg45 <= $unsigned(reg42[(4'hf):(3'h7)]);
              reg46 <= {(|(^~(7'h42))), $signed((8'h9d))};
              reg47 <= $unsigned(wire37[(1'h1):(1'h1)]);
              reg48 <= reg44[(4'he):(4'h9)];
            end
          else
            begin
              reg44 <= {$unsigned($signed((!wire38[(1'h0):(1'h0)]))), wire39};
              reg45 <= ((7'h43) - ((&(+{(8'ha6), wire38})) ?
                  reg45 : reg46[(3'h5):(3'h5)]));
              reg46 <= ($unsigned(reg45) & (wire39[(4'h8):(1'h1)] ?
                  (($unsigned((8'hb2)) ?
                      reg44 : $signed(wire38)) - wire38) : wire41[(1'h0):(1'h0)]));
            end
          if (wire37[(4'hb):(3'h6)])
            begin
              reg49 <= (wire39 ?
                  {$signed($signed($unsigned(wire38)))} : reg45[(1'h0):(1'h0)]);
              reg50 <= ((((~|$signed(reg46)) == $signed({(8'hbd),
                      reg48})) & (!(&$unsigned(wire38)))) ?
                  $unsigned((wire40[(4'h8):(2'h2)] != reg47[(3'h5):(3'h5)])) : (^$signed(reg47)));
              reg51 <= ((reg44 ?
                      (((|reg50) <<< reg50[(3'h6):(3'h4)]) ?
                          $signed((reg45 > reg43)) : $unsigned((reg44 ?
                              reg48 : wire39))) : wire40[(2'h2):(1'h1)]) ?
                  ((8'hb6) ?
                      $signed($unsigned((~reg42))) : $signed(wire41)) : (((reg50 ?
                              $signed(reg49) : reg43[(2'h3):(1'h0)]) ?
                          $unsigned((~^wire38)) : {(~&wire40), (^reg43)}) ?
                      $unsigned($unsigned({reg48})) : reg48));
              reg52 <= (wire40 ?
                  {wire38,
                      ((~$signed(wire40)) >>> $unsigned($signed((8'haa))))} : reg42[(5'h10):(3'h5)]);
            end
          else
            begin
              reg49 <= $signed($unsigned($signed(reg45[(2'h2):(2'h2)])));
            end
        end
      reg53 <= {(+$unsigned({$unsigned(wire41), (reg45 || reg45)})),
          (+reg46[(3'h5):(1'h0)])};
      reg54 <= (reg50[(2'h2):(2'h2)] << ($signed(wire40) > (^~reg49[(3'h6):(2'h2)])));
      reg55 <= (-((!{$signed(reg50)}) ?
          (&(|wire38[(4'h9):(3'h6)])) : ({(reg52 ? reg46 : (8'hae)),
              (reg46 ? wire41 : (8'haf))} <<< $signed($unsigned(wire41)))));
    end
  assign wire56 = (~&$signed($unsigned(($signed(reg43) ?
                      wire39[(4'h8):(3'h4)] : (reg42 ? reg45 : (8'hb3))))));
  assign wire57 = reg42;
  assign wire58 = wire57;
  assign wire59 = {$signed((($unsigned(wire38) < wire40[(1'h1):(1'h0)]) + (~(reg54 ?
                          wire37 : wire41))))};
  assign wire60 = ((8'hb3) ?
                      $unsigned((reg47[(2'h2):(1'h0)] << $unsigned({wire37,
                          reg44}))) : (reg53 ^ (($unsigned(reg54) ?
                              wire37 : (wire38 >>> wire39)) ?
                          ($signed((8'hbc)) ?
                              reg55 : reg45[(1'h0):(1'h0)]) : $unsigned({reg54,
                              reg48}))));
  assign wire61 = (!wire60);
  assign wire62 = ((wire56 > reg49) != (8'hbe));
  always
    @(posedge clk) begin
      reg63 <= ($signed((7'h43)) ?
          ($signed($signed(reg49)) ?
              $signed((+(reg54 ?
                  (8'ha7) : wire37))) : reg44[(4'hc):(3'h7)]) : (+$unsigned((8'hae))));
    end
  assign wire64 = ($signed((({reg46} ?
                              (reg54 - (8'h9d)) : reg50[(3'h6):(2'h2)]) ?
                          $signed((reg63 >>> wire38)) : (8'ha9))) ?
                      reg48 : wire62[(2'h3):(1'h0)]);
  assign wire65 = ((wire62[(3'h6):(3'h4)] & ($signed(reg54[(4'ha):(2'h2)]) || reg63[(4'hc):(4'h8)])) ?
                      $signed(wire57) : $unsigned({$signed($unsigned(wire56))}));
  assign wire66 = wire41[(1'h1):(1'h1)];
  assign wire67 = reg50[(3'h4):(3'h4)];
  assign wire68 = (wire37 ?
                      reg45[(1'h0):(1'h0)] : {(^(-wire62[(4'h9):(1'h0)])),
                          $unsigned(reg53[(2'h2):(1'h0)])});
  assign wire69 = {(|(reg48[(1'h1):(1'h1)] == reg55[(3'h7):(1'h0)])),
                      $unsigned(((!(wire60 == (8'hb6))) ?
                          $unsigned((reg44 & wire67)) : $signed(((8'ha9) ?
                              reg52 : wire58))))};
  assign wire70 = (reg54 >> {$unsigned(((wire39 | wire65) <= {wire66})),
                      (($signed(wire38) ?
                          wire64 : (&reg52)) - $unsigned(wire58[(4'hf):(2'h2)]))});
  always
    @(posedge clk) begin
      reg71 <= $unsigned((~(~^$signed($unsigned((8'h9e))))));
      reg72 <= (8'hb4);
      if ($signed($signed((8'haf))))
        begin
          reg73 <= $signed(reg47[(3'h4):(1'h1)]);
          reg74 <= {(+{reg43[(3'h5):(2'h3)], wire57}), reg53[(3'h5):(3'h4)]};
          if ({$unsigned(reg42)})
            begin
              reg75 <= (+(&(reg55[(3'h7):(3'h4)] ?
                  (reg46 ?
                      (wire58 ?
                          wire41 : wire62) : (^wire65)) : $signed($signed(reg74)))));
              reg76 <= {wire40};
              reg77 <= $signed(((reg53[(2'h3):(2'h3)] ?
                      ((reg50 ^ wire68) ?
                          wire41[(2'h2):(1'h1)] : (wire68 ?
                              wire66 : reg74)) : $unsigned((wire60 + reg54))) ?
                  $signed({{wire40}}) : ($signed((~^reg44)) >>> ({wire56,
                          reg43} ?
                      $signed(reg49) : (wire40 ? reg52 : reg54)))));
              reg78 <= wire69[(1'h1):(1'h0)];
            end
          else
            begin
              reg75 <= wire41[(1'h0):(1'h0)];
              reg76 <= reg78;
              reg77 <= $unsigned({$signed(reg45[(2'h2):(1'h1)]),
                  $unsigned(reg43[(4'he):(3'h7)])});
              reg78 <= (^~(wire61 ?
                  (+$signed((8'h9d))) : (^~(&reg47[(3'h5):(3'h4)]))));
            end
          reg79 <= (|(8'hba));
          reg80 <= $unsigned(($signed($unsigned((wire70 ? reg43 : (8'hb8)))) ?
              reg74 : $signed(($unsigned(reg72) && wire64))));
        end
      else
        begin
          reg73 <= (^((^$unsigned({wire58})) >> $unsigned({(reg53 - wire41),
              reg80})));
          if ((+$unsigned(reg50[(2'h2):(1'h0)])))
            begin
              reg74 <= (8'hae);
            end
          else
            begin
              reg74 <= ($unsigned((({reg79, (8'ha4)} == (reg51 ?
                          reg53 : reg72)) ?
                      $signed($unsigned(wire41)) : reg79[(3'h7):(3'h5)])) ?
                  $signed($unsigned(((wire37 >> reg78) < (8'ha2)))) : (|((~|$signed(reg54)) ?
                      (8'had) : $unsigned($unsigned((8'hab))))));
              reg75 <= reg71;
              reg76 <= (~^$unsigned(({$signed(reg45)} ?
                  (reg51 & (+reg71)) : reg71[(1'h1):(1'h0)])));
              reg77 <= reg44;
            end
          reg78 <= (reg50[(3'h6):(3'h6)] + {$unsigned((8'hb3)),
              $signed((~|wire65[(4'hd):(1'h1)]))});
          if (reg54[(1'h1):(1'h1)])
            begin
              reg79 <= wire66;
            end
          else
            begin
              reg79 <= reg50[(1'h0):(1'h0)];
            end
          reg80 <= reg51[(2'h3):(2'h2)];
        end
    end
  assign wire81 = $signed($unsigned(wire56));
  assign wire82 = $signed({reg47, reg45});
  assign wire83 = (~&wire61[(3'h4):(3'h4)]);
endmodule
