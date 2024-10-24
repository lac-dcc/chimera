module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire68;
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  assign y = {wire110,
                 wire35,
                 wire45,
                 wire47,
                 wire48,
                 wire68,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg46,
                 (1'h0)};
  module5 #() modinst36 (.wire9(wire2), .clk(clk), .y(wire35), .wire6(wire3), .wire7(wire0), .wire8(wire4));
  always
    @(posedge clk) begin
      reg37 <= (~&(-(wire0 == (wire35[(5'h15):(4'h8)] ?
          (~^wire1) : (wire3 && (7'h41))))));
      if ({$signed({$unsigned((|wire4))})})
        begin
          reg38 <= $signed($signed((((reg37 || (8'hac)) > {wire0}) || {{wire3},
              wire2})));
          reg39 <= (wire35 ?
              {wire35[(3'h7):(3'h5)],
                  $unsigned((|(+wire35)))} : (~&wire1[(3'h4):(1'h1)]));
          if ((~$signed($unsigned(wire1))))
            begin
              reg40 <= $signed((+$unsigned({(reg39 ? wire2 : wire3),
                  $unsigned(reg38)})));
              reg41 <= (~^$unsigned((((wire2 | wire4) ^ (wire35 ^ reg38)) ^ (wire0[(4'hb):(4'h9)] ?
                  reg38[(1'h0):(1'h0)] : (reg38 * wire2)))));
            end
          else
            begin
              reg40 <= (!$signed(($signed(wire0[(3'h7):(2'h3)]) <<< reg40)));
              reg41 <= (reg37 ?
                  (($unsigned(reg39) ?
                          ((reg41 ?
                              wire0 : reg40) >> (^~wire1)) : (^~$signed(reg38))) ?
                      wire35 : $unsigned((-(+wire4)))) : wire3[(1'h0):(1'h0)]);
              reg42 <= (reg38 && ((($unsigned(wire4) ^~ wire4) ?
                      ($signed(wire2) ?
                          wire4[(1'h0):(1'h0)] : wire1[(2'h2):(2'h2)]) : reg40[(3'h4):(1'h0)]) ?
                  ((reg37 ?
                      $signed(reg38) : $unsigned(wire1)) || reg38) : $signed((~(reg37 ?
                      wire35 : wire3)))));
            end
          reg43 <= (reg37[(4'he):(3'h6)] ?
              $signed(($signed((reg41 != wire1)) ?
                  ($signed(reg42) > $signed((8'hac))) : $signed((reg37 ?
                      wire2 : (8'hb6))))) : (($unsigned(reg38[(1'h0):(1'h0)]) ?
                  ((reg39 ?
                      wire0 : wire1) | reg38) : ($signed(wire0) >>> wire1)) & reg41));
        end
      else
        begin
          reg38 <= $signed($unsigned($signed(((reg38 ?
              (8'had) : (8'hbd)) == wire2))));
        end
      reg44 <= ({($unsigned((!reg42)) ^~ (wire35[(5'h14):(5'h14)] ?
                  (reg43 * reg41) : ((8'ha2) | reg38))),
              {$unsigned({reg37})}} ?
          (&($signed($unsigned(wire3)) + $unsigned($unsigned((8'hba))))) : $signed((((wire0 ?
                      reg40 : wire2) ?
                  reg41[(3'h7):(3'h4)] : $unsigned(reg39)) ?
              $signed(reg43[(5'h10):(4'hd)]) : reg40)));
    end
  assign wire45 = (reg43[(4'hd):(3'h5)] >= $signed(reg42));
  always
    @(posedge clk) begin
      reg46 <= $unsigned(($unsigned((wire45[(1'h0):(1'h0)] ?
          $unsigned(reg42) : wire3[(4'ha):(1'h1)])) + wire3[(4'h8):(2'h3)]));
    end
  assign wire47 = $unsigned({(!wire35[(4'h8):(3'h6)]),
                      $unsigned({$unsigned(wire1),
                          (wire45 ? (8'haa) : (8'hbe))})});
  assign wire48 = $unsigned((|reg42[(1'h0):(1'h0)]));
  module49 #() modinst69 (wire68, clk, reg39, wire45, reg40, reg43, reg37);
  module70 #() modinst111 (wire110, clk, wire48, wire4, reg43, reg44, reg39);
  always
    @(posedge clk) begin
      reg112 <= $signed($unsigned(wire3));
    end
  always
    @(posedge clk) begin
      if (reg38)
        begin
          if ((wire2[(2'h3):(1'h0)] >>> (&$unsigned(wire3[(3'h5):(3'h5)]))))
            begin
              reg113 <= wire2[(3'h6):(2'h2)];
              reg114 <= {reg39[(5'h14):(3'h4)], wire35[(3'h6):(2'h3)]};
              reg115 <= ((wire2 ?
                  wire47[(1'h0):(1'h0)] : ((~reg37[(4'ha):(2'h3)]) ?
                      reg114 : reg43[(4'hc):(3'h6)])) & (((wire4 ?
                          (reg44 ? wire48 : reg38) : ((7'h42) - wire68)) ?
                      reg41 : (&((8'haa) ? reg113 : wire3))) ?
                  wire110[(1'h0):(1'h0)] : reg112[(4'ha):(2'h2)]));
              reg116 <= $signed(reg113);
              reg117 <= (^~$unsigned((((wire48 ?
                  reg41 : wire4) & (~&wire45)) * (8'hb1))));
            end
          else
            begin
              reg113 <= reg112[(1'h1):(1'h0)];
              reg114 <= reg40;
            end
          reg118 <= $signed(reg117[(2'h2):(2'h2)]);
        end
      else
        begin
          reg113 <= $signed(($unsigned($unsigned({wire35, reg37})) ?
              (~^reg117[(2'h2):(1'h0)]) : (((reg113 ?
                  reg40 : wire45) <= $unsigned((8'hb8))) != ((wire110 > reg118) <<< $unsigned(reg116)))));
        end
      reg119 <= (8'had);
      reg120 <= $signed($unsigned({$unsigned((wire4 ? (8'hb4) : reg46))}));
    end
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire74;
  input wire signed [(4'h9):(1'h0)] wire73;
  input wire [(4'hf):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  assign y = {wire109,
                 wire103,
                 wire102,
                 wire101,
                 wire93,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg92,
                 reg91,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg76 <= (~^(!wire73[(2'h2):(2'h2)]));
      reg77 <= wire75;
      if (wire72[(4'hc):(4'hb)])
        begin
          reg78 <= (|wire75);
          reg79 <= ($signed((wire75[(1'h0):(1'h0)] ?
                  reg78 : {(reg76 ^ reg78), reg77})) ?
              (($signed(reg78) ?
                  $signed((&wire72)) : $signed(reg76[(1'h0):(1'h0)])) == ((reg76[(1'h0):(1'h0)] ?
                  (wire75 ? wire73 : wire75) : (reg78 ?
                      wire71 : reg78)) >>> $signed((wire72 ?
                  reg77 : wire75)))) : reg76);
          reg80 <= (8'hb9);
        end
      else
        begin
          if ($unsigned($signed($signed(($signed((8'ha3)) ?
              (wire74 ~^ wire74) : reg78)))))
            begin
              reg78 <= (8'hac);
              reg79 <= ((+wire74) <= (~^reg76[(3'h6):(2'h2)]));
              reg80 <= {(reg80 ?
                      $unsigned($signed(((8'hbc) ?
                          (8'ha5) : reg76))) : $unsigned({(-wire74)}))};
              reg81 <= reg78;
              reg82 <= (^~wire75);
            end
          else
            begin
              reg78 <= reg81[(3'h4):(1'h0)];
              reg79 <= (8'hb8);
            end
        end
      reg83 <= (({(reg76[(2'h2):(1'h1)] - reg82)} ?
          (^~($signed((8'hbf)) < (~(8'hb6)))) : $signed((wire74 << (reg76 >> wire73)))) < (($signed(reg77[(4'ha):(3'h4)]) ?
              $signed($signed(wire71)) : $unsigned((reg77 ? (8'hb8) : reg78))) ?
          (~(reg76[(2'h2):(1'h0)] < (reg78 ~^ (8'hba)))) : reg78[(4'h9):(1'h1)]));
      reg84 <= $unsigned((^($unsigned($unsigned(reg79)) ?
          $signed((reg82 || reg77)) : $signed((reg80 > reg77)))));
    end
  assign wire85 = $unsigned(reg79);
  assign wire86 = ($unsigned(reg81) ?
                      ((~|(wire85 >>> (-wire75))) ?
                          (~|((wire71 && wire73) & $signed(reg80))) : ((-((8'haa) != (8'ha8))) <= ((^~wire75) ^~ reg78))) : $unsigned($unsigned($unsigned(reg78[(3'h4):(3'h4)]))));
  assign wire87 = reg83;
  assign wire88 = reg82[(4'h8):(1'h1)];
  assign wire89 = $unsigned((wire71[(3'h5):(2'h2)] ?
                      (wire74 * ((~|reg77) || reg80)) : (~&wire85[(1'h1):(1'h0)])));
  assign wire90 = {(~|reg83), reg82};
  always
    @(posedge clk) begin
      reg91 <= wire71[(3'h5):(3'h4)];
      reg92 <= (({(reg83 < (wire89 ^ reg76)),
              ((^reg82) ? (!wire85) : (wire89 ? (8'ha3) : reg83))} ?
          reg83[(4'hd):(2'h2)] : wire86) ^ ($signed(wire88) * $signed({(reg91 <= wire90),
          (~reg77)})));
    end
  assign wire93 = {{reg80, (-$signed((reg91 ? reg84 : (8'hbc))))}};
  always
    @(posedge clk) begin
      reg94 <= {{$signed(($unsigned(wire75) ~^ (reg79 ? wire72 : reg76)))},
          ((~|$signed((&reg78))) ?
              reg80[(3'h4):(3'h4)] : (^~wire72[(4'h9):(3'h4)]))};
      if ($unsigned(wire88[(1'h0):(1'h0)]))
        begin
          reg95 <= (~^wire73[(3'h7):(1'h1)]);
          reg96 <= ((reg95[(3'h5):(1'h0)] - $signed($unsigned(wire93))) ?
              {(!$unsigned(wire75[(2'h2):(2'h2)])),
                  (reg91[(4'h9):(3'h6)] ?
                      $unsigned(reg95) : $signed($signed((8'haf))))} : ({($unsigned(reg82) && $unsigned(wire85)),
                      $signed((reg94 ^~ wire74))} ?
                  {$signed(reg84[(4'he):(1'h0)])} : (({wire74, reg83} ?
                          $signed(reg77) : (|wire75)) ?
                      $unsigned($signed(reg92)) : (~&$unsigned(reg92)))));
          reg97 <= (($unsigned($unsigned((^wire71))) ^ (((wire72 * (8'ha3)) ?
                      $unsigned(wire72) : reg94) ?
                  wire88[(3'h7):(2'h3)] : $signed($signed(reg76)))) ?
              (((~reg92[(1'h0):(1'h0)]) ? wire71 : reg91) ?
                  $signed(reg84) : {reg92,
                      (reg92 ?
                          (reg77 ?
                              wire85 : wire71) : $unsigned(reg80))}) : ((((wire74 ?
                      wire75 : reg96) >> wire87) >= reg80[(3'h4):(2'h3)]) ?
                  {wire72,
                      (reg81 ?
                          wire75[(1'h0):(1'h0)] : $signed(wire93))} : ((!$unsigned(reg81)) ?
                      reg79 : $signed((reg76 >= reg78)))));
          reg98 <= wire86;
        end
      else
        begin
          reg95 <= reg96;
          reg96 <= reg96;
        end
      reg99 <= $unsigned($signed(reg77));
      reg100 <= $unsigned($signed(((^~reg95[(4'h8):(4'h8)]) ?
          {$signed(wire75), $signed(reg91)} : (wire72 + reg83))));
    end
  assign wire101 = $signed(((reg76 ?
                           (|$unsigned((7'h41))) : {(reg97 ?
                                   (8'ha8) : wire90)}) ?
                       (+{$signed(reg95)}) : (({(8'hbd),
                               wire72} > (reg98 || reg92)) ?
                           wire93 : (reg95[(4'hb):(3'h6)] >= (~|reg78)))));
  assign wire102 = reg83;
  assign wire103 = (!wire93[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire73)
        begin
          reg104 <= {(|(|({reg82, reg77} + (wire75 ? (7'h44) : reg80))))};
          if ((8'ha4))
            begin
              reg105 <= (^~($signed({$signed(wire90),
                      ((8'ha4) ? reg94 : wire74)}) ?
                  reg82[(3'h7):(2'h3)] : $unsigned(reg94)));
              reg106 <= reg96;
              reg107 <= $signed($unsigned(($unsigned((reg94 ?
                  (8'h9c) : (8'hb3))) != $signed(wire102[(4'h9):(3'h7)]))));
              reg108 <= $signed((&(reg92 ? reg82 : reg100)));
            end
          else
            begin
              reg105 <= (reg106 >>> ((($signed(reg99) * (^~(8'haa))) ?
                      reg98 : ($signed(reg106) ?
                          (&reg83) : (wire103 >= reg97))) ?
                  (|(7'h43)) : reg100));
              reg106 <= (reg105 ?
                  wire75[(1'h0):(1'h0)] : {((^~$unsigned(wire73)) ?
                          ($signed((8'hbb)) ?
                              $unsigned(wire74) : reg98[(2'h3):(1'h1)]) : (-$unsigned((8'hbb)))),
                      reg81});
            end
        end
      else
        begin
          reg104 <= (&wire72[(4'hf):(2'h3)]);
          reg105 <= reg97;
        end
    end
  assign wire109 = (wire71 && wire89);
endmodule

module module49
#(parameter param66 = {(({(7'h41), (7'h40)} ? ({(8'hb3)} ? (8'hba) : ((8'hae) ? (8'hb9) : (8'hbf))) : (((8'hb8) ? (8'hba) : (8'hbe)) >> (+(8'hb6)))) & (~(!(~&(8'hbf)))))}, 
parameter param67 = (^((-(&(^param66))) ? ((+{param66}) ? param66 : (~&(param66 ? param66 : param66))) : param66)))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire53;
  input wire [(5'h15):(1'h0)] wire52;
  input wire signed [(4'he):(1'h0)] wire51;
  input wire [(5'h12):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire56,
                 wire55,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire55 = (8'h9f);
  assign wire56 = wire53[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg57 <= wire53;
      reg58 <= $unsigned($unsigned(wire53));
      reg59 <= (-$unsigned(wire51));
      reg60 <= ((~|(($signed(reg57) ?
          (reg59 ? wire50 : wire52) : {reg59,
              wire54}) <<< reg59[(2'h2):(1'h0)])) == {{((&reg57) ?
                  $signed(reg57) : wire53[(4'hd):(4'hb)])},
          wire53[(4'he):(3'h5)]});
      reg61 <= $unsigned(wire53);
    end
  assign wire62 = $unsigned($unsigned({(reg59[(2'h3):(1'h0)] ^~ $unsigned((8'haa)))}));
  assign wire63 = (~|wire52[(4'hc):(1'h0)]);
  assign wire64 = ((~|($signed({wire63}) ?
                      $unsigned($unsigned(reg58)) : $signed($signed(wire55)))) <= reg58);
  assign wire65 = ((wire51 ?
                      (-(+wire56)) : (reg57 <= $unsigned($signed((8'hb5))))) & wire62);
endmodule

module module5
#(parameter param33 = (((((|(8'hbe)) ? (^(8'hbb)) : ((8'hba) > (8'had))) ? ((~&(8'ha6)) == ((8'hb3) ? (7'h41) : (8'had))) : ((~^(8'hbd)) ? ((8'ha0) | (8'hbc)) : (~&(8'ha6)))) ? {{((8'ha3) << (8'hb2))}} : (^(((8'h9d) ? (8'hac) : (8'hbe)) ~^ (~&(8'h9c))))) > (|{((+(8'hab)) <<< ((8'hac) == (7'h40))), (((8'ha8) ? (7'h43) : (8'hbd)) == (~^(8'h9f)))})), 
parameter param34 = (({param33, (((8'ha0) ~^ param33) ? param33 : (+param33))} ? ({(param33 >= param33), (param33 == param33)} > (param33 ? (8'hb6) : (param33 && param33))) : (({(8'h9f), (8'hbe)} < param33) ? param33 : ((+param33) ? (param33 - param33) : (param33 ? param33 : param33)))) >= (^~param33)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = wire8[(5'h10):(4'h8)];
  assign wire11 = (!wire9);
  assign wire12 = (wire7 & $unsigned($signed(((+(8'hb6)) <<< wire7[(1'h0):(1'h0)]))));
  assign wire13 = wire7;
  assign wire14 = ((^~$unsigned(((wire11 << wire9) <<< wire13))) ?
                      (&(+$signed((8'hb0)))) : wire6[(4'hd):(4'h8)]);
  assign wire15 = ((|$signed((wire13 && (wire11 <= wire13)))) ~^ wire7[(4'hf):(4'hb)]);
  assign wire16 = wire8;
  assign wire17 = (~$signed(wire13[(4'hc):(4'h9)]));
  assign wire18 = $unsigned((8'hba));
  assign wire19 = wire13;
  assign wire20 = (wire13 ^~ $unsigned(wire17));
  assign wire21 = ((^(wire9 ?
                          (wire7 <= $signed(wire16)) : {(wire18 ?
                                  wire11 : wire15)})) ?
                      ($signed(wire15) + $signed((8'ha4))) : {$unsigned((wire12[(4'h8):(3'h7)] ?
                              (wire8 | wire13) : (8'ha9)))});
  assign wire22 = $signed(wire9);
  assign wire23 = (wire16[(3'h4):(1'h1)] ?
                      wire21[(4'h8):(3'h5)] : (^{$unsigned($unsigned((8'hb6))),
                          $unsigned(((8'ha0) ? wire10 : (8'ha4)))}));
  assign wire24 = ({wire12,
                          ((wire11 ~^ $signed(wire20)) * {$signed((8'h9f))})} ?
                      {(($signed(wire10) ? (~&wire18) : wire11) - wire7),
                          ($signed((wire17 ?
                              wire21 : wire22)) == $unsigned((wire16 ?
                              wire18 : wire21)))} : wire11[(1'h1):(1'h1)]);
  assign wire25 = ((($signed(wire14[(3'h4):(2'h2)]) ?
                              (wire23 & (8'hbf)) : ((wire8 ~^ (8'ha6)) - $unsigned(wire10))) ?
                          (~^$signed($signed(wire6))) : $signed((|{wire23}))) ?
                      (~|wire12[(4'h9):(2'h3)]) : wire20[(4'h9):(3'h6)]);
  assign wire26 = $signed(wire7[(4'he):(3'h7)]);
  assign wire27 = wire21;
  assign wire28 = (^~(|(8'hab)));
  assign wire29 = ((|wire27[(3'h7):(3'h5)]) << (~|wire27[(1'h1):(1'h0)]));
  assign wire30 = (~^{wire28});
  assign wire31 = wire20;
  assign wire32 = (~^$unsigned(wire13));
endmodule
