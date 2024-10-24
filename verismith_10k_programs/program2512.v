module top
#(parameter param119 = (!(~|((^~(~|(8'hab))) <<< (8'ha6)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire107;
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire4,
                 wire107,
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
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire4 = {(((wire1[(3'h5):(1'h0)] >> (wire3 ? wire3 : wire0)) ?
                         wire0[(3'h5):(2'h2)] : ({wire3,
                             (8'ha3)} || $signed(wire0))) <<< (wire2[(3'h4):(2'h2)] ?
                         (((8'hba) >= wire2) ?
                             $unsigned(wire3) : wire3) : (-(~|wire0)))),
                     $unsigned(($signed((~|wire2)) ?
                         $signed((wire2 && wire2)) : (^~((8'h9f) <= (8'hba)))))};
  always
    @(posedge clk) begin
      if ($unsigned({$signed((^(~&wire0)))}))
        begin
          reg5 <= wire0[(2'h3):(2'h3)];
          if ((((~&($unsigned((7'h44)) ? (wire4 + wire1) : $signed(wire2))) ?
                  ((wire0[(3'h5):(1'h1)] ^ wire4[(3'h5):(1'h0)]) >> $signed((~&(7'h42)))) : reg5[(3'h4):(2'h2)]) ?
              wire2[(2'h3):(2'h2)] : (~(({reg5} ?
                      $unsigned((8'hb2)) : wire4[(2'h3):(1'h0)]) ?
                  $signed($signed(wire3)) : ({reg5} ~^ wire3[(4'hf):(4'hd)])))))
            begin
              reg6 <= (wire2[(1'h0):(1'h0)] && wire0[(3'h5):(3'h4)]);
            end
          else
            begin
              reg6 <= $signed($signed($unsigned(({wire1} == {wire0}))));
              reg7 <= $signed({$signed((~^$unsigned(wire4))),
                  $signed(((reg5 - wire1) ? wire0 : $signed(wire1)))});
              reg8 <= reg7;
            end
          reg9 <= wire0;
          if ((^{{$signed((reg6 ? reg5 : reg7))}}))
            begin
              reg10 <= $unsigned(reg8[(4'he):(4'hc)]);
              reg11 <= (wire1[(1'h1):(1'h0)] - (&{$unsigned(wire4)}));
              reg12 <= (^$unsigned(wire0));
              reg13 <= $signed($signed($unsigned(reg10[(5'h11):(1'h1)])));
            end
          else
            begin
              reg10 <= reg5[(2'h2):(1'h1)];
              reg11 <= (8'ha3);
              reg12 <= ((({{reg13}, reg13[(4'hb):(3'h6)]} ?
                      wire4[(2'h2):(1'h0)] : ($signed(reg9) ?
                          reg13 : $signed(reg5))) ~^ reg9[(4'hc):(4'hb)]) ?
                  (~reg8[(4'h9):(3'h7)]) : wire4[(3'h5):(3'h5)]);
            end
        end
      else
        begin
          if (($unsigned({(8'hb6), $unsigned((8'had))}) != $signed(reg5)))
            begin
              reg5 <= (^((($signed(wire2) ?
                      (wire0 ?
                          reg11 : reg9) : wire2) ~^ $unsigned((reg12 == wire1))) ?
                  ($signed($signed(reg8)) ?
                      reg10[(2'h2):(1'h0)] : (reg9[(4'hd):(2'h3)] ^ (^reg7))) : wire1));
              reg6 <= (!reg10);
              reg7 <= (wire0 ? reg10 : {wire0});
              reg8 <= (($signed($signed({wire0})) ?
                  {(&$unsigned(reg6)),
                      (wire1[(3'h5):(1'h0)] || ((8'h9c) << reg9))} : (^~reg6)) + reg5);
            end
          else
            begin
              reg5 <= ((reg11 - $signed($signed(wire3[(4'he):(4'h8)]))) ?
                  ((reg13 ?
                      $unsigned($unsigned(reg11)) : reg10) || reg12[(2'h3):(1'h0)]) : wire0[(2'h3):(1'h0)]);
              reg6 <= (8'ha3);
              reg7 <= (!reg13[(3'h7):(3'h7)]);
            end
          reg9 <= (reg7 ~^ (wire4[(1'h1):(1'h0)] ?
              (wire3 ?
                  (~|reg13[(4'h9):(4'h9)]) : (-(-wire4))) : $signed((~&(wire4 < (8'ha3))))));
        end
      reg14 <= ($unsigned((wire4[(2'h3):(2'h3)] ?
          {reg5} : {$unsigned((8'h9d))})) & reg8[(4'hb):(4'hb)]);
      reg15 <= (8'had);
      reg16 <= (^~$unsigned(({(&reg11)} & reg7)));
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned(reg10[(1'h1):(1'h1)]);
      reg18 <= wire2;
      reg19 <= (wire2[(1'h1):(1'h0)] ?
          ((~|(&(reg14 ? reg8 : reg18))) ?
              (((8'hbc) != $signed(reg14)) ?
                  ((reg17 || reg11) >>> $unsigned(wire0)) : ((reg9 | reg9) ^~ (&reg15))) : ({(reg17 ?
                      reg16 : (8'hbb))} == (^~(reg17 + wire0)))) : (reg17[(4'h9):(4'h9)] & (($signed(reg18) && ((7'h42) | reg12)) ?
              $signed(reg17) : ($unsigned(wire2) ~^ ((8'hbd) << (7'h40))))));
      reg20 <= ((({$signed((7'h42))} ? reg9 : $unsigned(reg6)) ?
              $unsigned(((~|reg15) || reg9)) : reg18[(3'h7):(2'h3)]) ?
          $unsigned(reg11) : (reg18 << {reg7, $unsigned(reg7)}));
      if (reg15)
        begin
          reg21 <= {$signed(reg15[(2'h2):(2'h2)]), reg6[(3'h6):(2'h2)]};
          reg22 <= $unsigned(reg9[(3'h6):(2'h2)]);
          if ($unsigned({reg22}))
            begin
              reg23 <= reg19;
              reg24 <= (~|{reg20, $unsigned((!$unsigned(reg14)))});
            end
          else
            begin
              reg23 <= (^~reg23[(2'h3):(2'h2)]);
              reg24 <= reg7;
              reg25 <= $unsigned((~|reg15[(1'h1):(1'h1)]));
              reg26 <= ((($unsigned({reg24}) | wire1[(3'h4):(1'h0)]) ?
                      $unsigned(reg18) : ((^~reg21[(5'h10):(4'ha)]) == wire1[(1'h1):(1'h0)])) ?
                  $signed(((+$signed(reg15)) | $signed((~&reg24)))) : {reg25[(4'h9):(2'h3)]});
            end
          reg27 <= reg22;
        end
      else
        begin
          reg21 <= {reg16};
          reg22 <= ($unsigned($signed(reg14)) >>> ($signed((8'h9e)) >>> $signed((8'hb5))));
          reg23 <= {$unsigned((&((^wire0) ? (^~reg21) : (!reg9)))),
              $unsigned($signed(reg24))};
          if ({{{reg27, {$unsigned((8'ha1)), ((8'had) == wire3)}}}})
            begin
              reg24 <= ({{wire1},
                  (reg20[(2'h2):(1'h0)] ?
                      $signed(reg11[(3'h4):(1'h0)]) : (wire0 ?
                          (+wire2) : {reg18}))} ^ $signed(reg5));
              reg25 <= {reg25[(3'h4):(1'h1)], (^~$unsigned($signed(wire1)))};
              reg26 <= $unsigned($signed(reg17[(1'h1):(1'h0)]));
              reg27 <= {($unsigned($signed(((7'h40) ?
                      reg14 : reg17))) <<< (~^wire2)),
                  $signed((reg16[(4'h8):(3'h7)] ?
                      wire4 : ((~&reg18) ?
                          $unsigned(reg16) : reg11[(3'h5):(3'h5)])))};
            end
          else
            begin
              reg24 <= ((8'hbe) >> ($signed(((reg6 ? reg13 : wire3) ?
                      $signed(reg6) : $unsigned(reg7))) ?
                  reg25 : $signed({(reg18 ? reg19 : reg8), (reg12 <<< reg6)})));
              reg25 <= (~|$unsigned($unsigned($signed($unsigned(wire3)))));
              reg26 <= reg12[(1'h1):(1'h1)];
              reg27 <= reg18[(2'h2):(1'h0)];
            end
          reg28 <= (((wire3[(3'h4):(3'h4)] ?
                      $signed(reg10[(1'h0):(1'h0)]) : $signed((reg10 ?
                          reg23 : (8'hb8)))) ?
                  reg7[(4'ha):(2'h2)] : reg13) ?
              $signed($unsigned($signed(((8'hb2) ^~ reg26)))) : (reg6 != reg20[(2'h2):(1'h1)]));
        end
    end
  module29 #() modinst108 (wire107, clk, reg20, wire4, reg21, reg17);
  assign wire109 = reg28[(4'hf):(4'hd)];
  assign wire110 = ((reg16 & $signed($signed((~|reg24)))) == reg26);
  assign wire111 = ((^~(($unsigned(wire4) <<< $signed(reg13)) < (reg18 < {(8'hb7)}))) >> {((reg22 == {reg21,
                               reg14}) ?
                           {$signed(wire107),
                               (reg6 ? reg20 : reg10)} : wire1[(1'h1):(1'h1)]),
                       wire0});
  assign wire112 = $signed(reg25);
  assign wire113 = $unsigned(wire109);
  assign wire114 = (~^$unsigned($signed($unsigned(wire110[(4'h8):(4'h8)]))));
  assign wire115 = reg20[(4'hc):(3'h4)];
  assign wire116 = ((+$unsigned(wire115)) ?
                       (~^wire0) : ((+((|wire0) ?
                           reg18 : reg28[(1'h0):(1'h0)])) >>> reg10));
  assign wire117 = (^$unsigned(reg21));
  assign wire118 = ((~|wire113[(4'h9):(2'h3)]) | (wire115 ^~ $unsigned($unsigned($unsigned(reg12)))));
endmodule

module module29  (y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire88;
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire91,
                 wire90,
                 wire61,
                 wire63,
                 wire88,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module34 #() modinst62 (wire61, clk, wire31, wire30, wire32, wire33, (8'hbc));
  assign wire63 = ((((8'ha2) ?
                          (wire30 ?
                              wire33[(3'h5):(1'h1)] : $signed(wire61)) : wire61) ?
                      (^(wire61[(2'h2):(2'h2)] ^~ wire32)) : $signed(wire31[(2'h2):(1'h1)])) != wire31);
  module64 #() modinst89 (.wire69(wire33), .clk(clk), .wire65(wire30), .wire66(wire63), .y(wire88), .wire68(wire61), .wire67(wire32));
  assign wire90 = $signed(((({wire63} ?
                          (!(7'h43)) : (|wire61)) && $unsigned(wire30[(4'hb):(2'h3)])) ?
                      wire88 : wire88));
  assign wire91 = wire88;
  always
    @(posedge clk) begin
      reg92 <= (7'h40);
      reg93 <= wire33[(5'h10):(3'h4)];
      if ((8'hac))
        begin
          if (wire90)
            begin
              reg94 <= wire30;
              reg95 <= $signed((8'hab));
            end
          else
            begin
              reg94 <= ($signed(wire33[(5'h13):(4'hd)]) || $unsigned(($unsigned($signed((8'ha3))) << wire33[(4'h8):(1'h1)])));
              reg95 <= ((|reg94[(2'h3):(2'h2)]) && wire90[(3'h5):(3'h4)]);
              reg96 <= ((((~&reg92[(4'hb):(4'h8)]) ?
                      (wire33[(5'h13):(4'hb)] ?
                          (wire30 > wire61) : $signed(wire31)) : $signed((~wire63))) << reg94) ?
                  (wire31[(3'h4):(3'h4)] ?
                      wire32[(1'h1):(1'h1)] : (~|(^(wire33 ^~ wire30)))) : wire30);
            end
          reg97 <= $signed({reg95,
              ($signed($signed(wire63)) || $unsigned((wire91 >= wire61)))});
          reg98 <= (($signed(wire32[(4'ha):(3'h6)]) ?
              (($signed(reg95) - (8'hae)) ?
                  (wire33 ?
                      (^~(8'hbb)) : wire90) : ($signed(reg97) >>> $signed(wire90))) : wire88[(1'h1):(1'h0)]) <= (&($unsigned(wire33) ?
              (~wire32) : ((wire91 ? wire31 : wire31) ?
                  wire61[(2'h2):(2'h2)] : reg92[(4'hb):(4'ha)]))));
          reg99 <= wire32[(3'h5):(2'h3)];
        end
      else
        begin
          if (($signed({{(&(7'h43)), reg92[(4'he):(1'h0)]}}) >>> reg92))
            begin
              reg94 <= reg93[(3'h7):(3'h6)];
              reg95 <= $unsigned($signed((~^wire91)));
              reg96 <= (&reg96[(2'h3):(2'h3)]);
            end
          else
            begin
              reg94 <= ((8'haf) > $unsigned($signed(wire32[(3'h6):(3'h6)])));
              reg95 <= (-$signed($unsigned(($unsigned(wire88) ?
                  (~^wire61) : (8'ha7)))));
              reg96 <= reg93;
              reg97 <= $signed((((~wire31) ?
                      (reg94[(4'h8):(3'h5)] ?
                          $signed(reg99) : (wire61 <<< wire30)) : $unsigned(reg96[(4'hc):(3'h6)])) ?
                  reg97 : (8'ha5)));
            end
          reg98 <= wire33[(2'h3):(1'h0)];
          if ((~|(wire30[(4'h8):(3'h7)] * wire63)))
            begin
              reg99 <= $unsigned(wire33[(4'h9):(3'h4)]);
            end
          else
            begin
              reg99 <= wire63[(4'ha):(4'ha)];
            end
          reg100 <= $signed($signed(wire30[(4'hc):(3'h4)]));
        end
    end
  assign wire101 = (~^((($signed(wire61) != (reg96 < (8'ha6))) ?
                       reg100 : ($signed(wire30) ?
                           $unsigned(reg98) : (~wire30))) * (($signed(reg94) ?
                       ((8'ha8) ?
                           reg95 : wire32) : $signed(wire91)) ~^ $unsigned(reg96))));
  assign wire102 = ($unsigned((7'h44)) < wire31[(1'h1):(1'h1)]);
  assign wire103 = reg95[(2'h2):(1'h0)];
  assign wire104 = $signed({wire88, (&(|$signed(wire91)))});
  assign wire105 = (reg96[(3'h4):(1'h0)] ? wire104 : wire102);
  assign wire106 = $signed((&wire33[(3'h7):(2'h3)]));
endmodule

module module64  (y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire [(4'h9):(1'h0)] wire68;
  input wire signed [(3'h5):(1'h0)] wire67;
  input wire [(3'h4):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire70 = (wire68[(3'h7):(3'h4)] ~^ (+$unsigned($unsigned((wire67 || wire68)))));
  assign wire71 = (((8'ha4) ?
                          wire70 : (wire70[(5'h11):(3'h5)] >>> ((wire69 >= wire68) ?
                              (wire70 ^ wire66) : wire70[(5'h13):(4'he)]))) ?
                      $unsigned((~|(~|((8'ha5) ^~ wire68)))) : (^~$unsigned($signed({wire69}))));
  assign wire72 = wire66;
  assign wire73 = wire68[(1'h0):(1'h0)];
  assign wire74 = ($unsigned(wire67[(2'h2):(1'h1)]) ?
                      (($unsigned((wire70 ?
                              wire67 : wire68)) && wire70[(5'h11):(3'h7)]) ?
                          ($unsigned($unsigned(wire71)) <= wire66) : (!wire68)) : {(((wire68 >= wire69) || (wire70 ?
                              wire68 : wire68)) > $signed(wire69[(4'h8):(3'h7)])),
                          $unsigned({(wire68 >= wire65), (^wire67)})});
  assign wire75 = wire74;
  assign wire76 = $unsigned({($unsigned(wire75) == $signed($unsigned(wire73)))});
  always
    @(posedge clk) begin
      if ((~|(^(wire70[(4'hc):(2'h3)] == (^$signed(wire72))))))
        begin
          reg77 <= wire69;
          reg78 <= (^(!(wire70 + ((wire66 ? (8'hb2) : (8'hbd)) > {(8'hac),
              wire66}))));
          reg79 <= wire66[(2'h3):(2'h2)];
          reg80 <= $unsigned(($unsigned($signed(((8'hbc) ?
              wire65 : wire71))) & $signed(((wire73 ? (8'hb8) : wire73) ?
              wire76 : $unsigned(reg79)))));
          reg81 <= $unsigned($signed(wire72));
        end
      else
        begin
          reg77 <= ($signed(wire67) ?
              $unsigned((~|{((8'hbf) & (8'hb3)),
                  $signed(reg77)})) : (reg77[(4'hd):(4'hd)] ?
                  {(~wire68)} : $unsigned($unsigned((wire69 << wire72)))));
          reg78 <= $signed((~&$signed(wire71)));
        end
      reg82 <= wire67;
      reg83 <= wire75[(4'h8):(2'h2)];
    end
  assign wire84 = $unsigned(wire71[(3'h6):(2'h2)]);
  assign wire85 = (~&$unsigned({($unsigned(wire65) ?
                          reg82[(3'h6):(3'h5)] : wire72),
                      ((wire67 ? (8'h9e) : wire72) * $unsigned(wire65))}));
  assign wire86 = ($unsigned(wire70) ?
                      (+(8'hbd)) : $signed((((~|wire72) >>> (~reg82)) << ((wire68 ?
                              wire71 : wire76) ?
                          $signed(wire74) : (8'ha1)))));
  assign wire87 = (^~$signed(($unsigned(wire84[(1'h1):(1'h0)]) ?
                      wire69 : ($signed(wire68) <<< wire66))));
endmodule

module module34
#(parameter param60 = (((~^({(8'hb3), (8'hb6)} | (~|(8'hbe)))) << ((^~(8'ha3)) ? {((8'hb7) == (8'ha4)), ((8'hbf) ^ (8'ha9))} : {{(7'h44), (8'hb7)}, ((8'ha2) | (8'hae))})) & ((^((~|(8'h9e)) ~^ ((7'h42) ? (8'had) : (8'hbe)))) > {(|((8'hbc) * (8'ha9))), (((8'ha9) ? (8'ha4) : (8'haf)) & (-(8'hbe)))})))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire40 = wire37[(4'hc):(2'h3)];
  assign wire41 = wire40;
  assign wire42 = (({{$signed(wire40)},
                          ($signed(wire35) ?
                              (wire40 ?
                                  wire36 : wire37) : wire38[(4'he):(3'h5)])} ?
                      wire38[(1'h1):(1'h1)] : (((wire38 ?
                          wire39 : wire39) * $unsigned(wire38)) | (~|(wire36 ?
                          wire38 : wire39)))) < (^wire40));
  assign wire43 = ((wire39 ?
                      $unsigned({wire41[(3'h4):(1'h1)],
                          $signed(wire36)}) : wire36[(3'h4):(2'h3)]) + wire39[(3'h5):(3'h4)]);
  assign wire44 = $unsigned((wire40 >= ($unsigned((wire36 >>> wire37)) == {wire37,
                      $signed(wire35)})));
  assign wire45 = (8'hbd);
  assign wire46 = $signed($signed(wire43));
  assign wire47 = ($signed($unsigned(((8'ha2) <<< {wire35,
                      wire40}))) ^~ $signed({(^~$unsigned(wire40)),
                      ((wire35 && (8'ha7)) ?
                          $signed(wire40) : $signed(wire38))}));
  assign wire48 = wire42[(5'h14):(3'h7)];
  assign wire49 = ($unsigned((8'hae)) <<< {wire47[(1'h1):(1'h0)],
                      $signed($unsigned(wire47))});
  assign wire50 = (($unsigned($signed((wire38 || wire37))) ?
                      wire44 : ({(wire41 >= wire46)} >>> wire37[(4'he):(4'he)])) != $signed(wire45[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg51 <= wire35[(2'h2):(1'h1)];
      reg52 <= ($unsigned(wire39[(2'h2):(1'h1)]) ? $unsigned((8'hab)) : wire41);
    end
  always
    @(posedge clk) begin
      reg53 <= wire35[(2'h2):(2'h2)];
      reg54 <= $unsigned($unsigned(reg51[(2'h3):(2'h3)]));
      reg55 <= (~|reg52);
      reg56 <= $unsigned(($unsigned(($unsigned((8'hb2)) * {wire41})) * {$signed((|wire45))}));
    end
  assign wire57 = $unsigned((($unsigned((wire41 && wire39)) * ((wire49 ?
                      reg55 : (7'h41)) + (wire41 + wire35))) << ((8'ha4) ?
                      ((~^reg53) ?
                          ((8'hbf) ?
                              wire41 : reg51) : (wire42 > wire40)) : reg56)));
  assign wire58 = wire35;
  assign wire59 = wire39;
endmodule
