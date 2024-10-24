module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire118, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed((~&$signed(wire0))) || wire1) ?
                     $signed((7'h43)) : (-$unsigned((((8'hb3) >= wire2) != (wire1 & wire1)))));
  assign wire5 = wire3[(2'h3):(2'h2)];
  assign wire6 = (~|$signed(($signed((8'hb7)) ^~ ($signed(wire2) ?
                     (~wire3) : {(8'hac)}))));
  module7 #() modinst119 (.y(wire118), .clk(clk), .wire10(wire3), .wire11(wire5), .wire8(wire4), .wire9(wire2));
endmodule

module module7
#(parameter param116 = {((((^(8'ha4)) ? (^~(8'ha5)) : (+(8'haa))) ? (~^((8'hae) ? (8'haa) : (8'hb1))) : (~&{(8'haf)})) ^~ ({((8'hb4) >>> (8'h9f))} && (&((8'hba) <= (8'hae))))), ((&(((8'hb1) ? (8'ha1) : (8'hab)) != ((7'h41) & (8'hb0)))) - ((|((8'ha6) ? (8'hbb) : (8'ha8))) ? {((8'hbb) ^~ (8'ha6))} : (((8'hb8) ? (8'h9f) : (8'hb5)) ? ((8'hb1) ? (8'hbe) : (8'hb5)) : ((8'h9d) ^~ (8'h9d)))))}, 
parameter param117 = param116)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire108;
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire12,
                 wire13,
                 wire34,
                 wire52,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire108,
                 reg111,
                 reg110,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire12 = (8'hbf);
  assign wire13 = (^~$signed(((wire9 ?
                      (wire8 ?
                          wire10 : wire10) : wire11) <= (~|$unsigned(wire9)))));
  module14 #() modinst35 (.wire18(wire13), .wire15(wire11), .y(wire34), .clk(clk), .wire16(wire8), .wire17(wire12));
  module36 #() modinst53 (.wire39(wire10), .y(wire52), .clk(clk), .wire38(wire12), .wire40(wire34), .wire37(wire11));
  always
    @(posedge clk) begin
      reg54 <= wire34[(4'hc):(4'hb)];
      reg55 <= (-$signed(wire8));
      reg56 <= $signed($unsigned($signed((^$signed(reg55)))));
      if ((wire13 ?
          (~^($signed((wire52 && reg54)) ~^ ((wire34 ?
              wire10 : reg56) + $unsigned(wire8)))) : reg54))
        begin
          reg57 <= {$signed(wire9)};
          reg58 <= $signed($unsigned((~|(((8'h9f) ? wire8 : wire52) ?
              (^~wire10) : $unsigned((7'h43))))));
          if (((wire52[(2'h2):(1'h1)] ?
              (|((wire11 ?
                  wire10 : wire11) != $unsigned(wire13))) : ($unsigned((reg56 ~^ wire10)) ~^ ({(8'hbe)} ?
                  reg57 : $unsigned(reg56)))) && {({(wire13 >= wire34),
                      $unsigned(wire12)} ?
                  $unsigned((reg58 && (8'haa))) : reg57[(3'h4):(1'h1)]),
              (&$unsigned((!wire8)))}))
            begin
              reg59 <= $signed($unsigned($unsigned(wire12[(2'h3):(1'h0)])));
            end
          else
            begin
              reg59 <= (^~(~|(reg58[(3'h7):(1'h1)] ?
                  {(reg55 < wire10)} : ((+wire9) ?
                      {wire12, wire9} : {reg54}))));
              reg60 <= $signed((-((-$signed(reg55)) ?
                  $signed($signed(reg56)) : (((8'hb2) < reg54) ?
                      (reg55 ? reg58 : wire9) : reg55[(3'h5):(3'h4)]))));
            end
          reg61 <= $signed(((wire11[(3'h4):(2'h3)] <<< ({(8'hae)} ~^ $signed(wire13))) || (reg56 == wire10[(4'ha):(2'h2)])));
        end
      else
        begin
          reg57 <= reg61;
          reg58 <= {reg58, wire9[(4'h9):(4'h9)]};
        end
    end
  always
    @(posedge clk) begin
      reg62 <= ((8'h9f) ? (&reg57[(3'h4):(1'h1)]) : wire8);
      reg63 <= {$signed($signed((reg55[(4'h9):(2'h3)] ?
              reg56[(4'hc):(4'h8)] : (reg60 ? reg54 : reg59)))),
          $signed({{{reg58}}, reg58})};
    end
  assign wire64 = $signed($signed($unsigned(reg60)));
  assign wire65 = reg62;
  assign wire66 = wire10;
  assign wire67 = ((wire13[(5'h10):(4'hb)] | ({{wire65, wire13}} ?
                      (reg57 >= ((8'haa) + reg54)) : wire52)) ~^ wire65);
  module68 #() modinst109 (.wire73(wire8), .y(wire108), .wire69(wire11), .wire71(wire34), .wire70(reg54), .wire72(reg63), .clk(clk));
  always
    @(posedge clk) begin
      reg110 <= {$unsigned(reg61)};
      reg111 <= {$signed(wire10[(3'h4):(1'h0)]), {wire108[(5'h12):(4'ha)]}};
    end
  assign wire112 = $signed((((~|wire67) > wire65) >>> wire34));
  assign wire113 = $signed((8'ha0));
  assign wire114 = ((reg59[(4'ha):(3'h5)] ?
                       wire12[(2'h2):(1'h1)] : (wire13 ?
                           (wire13[(3'h4):(1'h1)] ?
                               reg58[(3'h7):(3'h6)] : $signed(reg110)) : ($unsigned((7'h42)) && (!reg111)))) <<< (~^wire65));
  assign wire115 = {((~^$unsigned($signed(wire66))) ?
                           reg56[(4'hc):(4'h9)] : wire67[(2'h3):(1'h0)]),
                       wire10};
endmodule

module module68
#(parameter param106 = (^((({(8'ha0), (7'h43)} || (~(8'hab))) >= {(^(8'ha1)), {(8'hb3)}}) ? (({(7'h42), (8'hb9)} ? ((8'ha1) ? (8'hb4) : (8'ha3)) : ((8'ha8) > (8'h9d))) ? (((8'hb9) ? (7'h40) : (8'hb9)) ? ((8'hac) ? (8'hb1) : (8'hb4)) : ((8'hb5) ? (8'hb3) : (8'hb6))) : (((8'hae) ^ (8'ha2)) ? ((8'h9f) == (8'haf)) : {(8'ha0), (7'h41)})) : ((((8'ha0) ? (8'haa) : (8'hb5)) ^ {(7'h44)}) ? ((8'haf) ? ((8'h9c) ? (8'hb1) : (8'ha1)) : ((8'hbb) ? (8'h9c) : (8'ha5))) : (+{(8'hae), (7'h41)})))), 
parameter param107 = (~&{(8'hab), param106}))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire73;
  input wire signed [(4'hc):(1'h0)] wire72;
  input wire [(4'hb):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg101,
                 reg100,
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
                 reg89,
                 reg88,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire74 = $unsigned(wire71[(4'h8):(3'h7)]);
  assign wire75 = wire73[(4'h9):(3'h5)];
  assign wire76 = $unsigned($unsigned(((wire75 >> (wire73 ? wire74 : (8'haf))) ?
                      wire75[(4'h9):(3'h6)] : $unsigned((~&wire69)))));
  assign wire77 = $signed((^~(^(wire71 ^ wire70[(2'h3):(1'h0)]))));
  assign wire78 = $unsigned(wire73[(3'h5):(1'h1)]);
  assign wire79 = $unsigned(wire69[(3'h5):(3'h4)]);
  assign wire80 = $unsigned((8'hbc));
  always
    @(posedge clk) begin
      reg81 <= wire71;
      reg82 <= {{wire80, wire77}};
      reg83 <= ((($signed($unsigned((8'ha8))) ?
          (|{(7'h40),
              wire77}) : (~^(wire77 > wire69))) < reg81[(4'he):(1'h1)]) >>> (8'ha3));
    end
  assign wire84 = {$signed((~^((~reg83) >> $unsigned(wire69))))};
  assign wire85 = $unsigned((~&wire77));
  assign wire86 = $signed(wire71[(1'h0):(1'h0)]);
  assign wire87 = ($signed(((wire71[(3'h6):(2'h2)] + {wire85, reg81}) ?
                      (7'h41) : (wire69[(3'h5):(2'h2)] > wire79))) >= $signed(({$signed(wire85),
                      wire73} == $unsigned((!reg81)))));
  always
    @(posedge clk) begin
      reg88 <= $signed(wire69[(3'h4):(3'h4)]);
      if ((wire80[(2'h2):(1'h1)] ^~ wire72))
        begin
          reg89 <= (+wire73[(1'h1):(1'h1)]);
          reg90 <= $unsigned((({$unsigned(wire71),
              {(8'ha0),
                  reg88}} < wire69[(3'h7):(2'h2)]) >= ((-(8'h9c)) >= wire87[(3'h7):(1'h1)])));
          if ((($unsigned(reg90) <<< (wire80[(1'h0):(1'h0)] ?
                  wire85[(2'h2):(1'h0)] : wire85)) ?
              $signed(((~&wire70) == $signed((wire87 ?
                  wire87 : wire87)))) : (~&wire74[(3'h7):(3'h5)])))
            begin
              reg91 <= wire86;
            end
          else
            begin
              reg91 <= ($unsigned($signed(($unsigned(wire76) || $signed(wire79)))) ?
                  {(wire75 | $signed($unsigned(wire71))),
                      (({wire76} ^~ $signed((8'hb2))) && ($unsigned(reg81) ?
                          wire72 : {wire72, reg90}))} : reg90);
              reg92 <= $unsigned($signed((-reg82)));
              reg93 <= (|(($unsigned({reg90}) ?
                      ({wire69, wire75} ?
                          $signed(wire87) : {reg92, reg82}) : (wire79 ?
                          wire78[(4'hd):(1'h1)] : $signed(reg90))) ?
                  ($signed($signed((8'ha4))) ?
                      reg90 : $signed((~&reg89))) : wire80[(1'h0):(1'h0)]));
            end
          if ((wire72[(3'h7):(1'h1)] ^ $unsigned((~^(~&(^wire71))))))
            begin
              reg94 <= {(~&$signed((wire69[(1'h1):(1'h0)] ?
                      $signed(wire87) : {(8'hab)})))};
              reg95 <= $signed((((^(reg94 ? reg90 : reg92)) ?
                  {((8'hab) ? (8'ha2) : wire76),
                      (-wire76)} : ((&reg81) >>> $signed(wire70))) && $unsigned((!wire74))));
              reg96 <= $signed({($signed((wire74 >>> wire85)) ^~ {(^~wire78)})});
            end
          else
            begin
              reg94 <= reg93;
              reg95 <= $unsigned(({(|$signed((8'hb4))),
                      (~^wire73[(1'h1):(1'h1)])} ?
                  wire79 : wire72));
            end
          if ({(!((-wire72) ? (8'hbb) : $signed($unsigned(wire77))))})
            begin
              reg97 <= (!(|$signed($unsigned($signed((8'had))))));
            end
          else
            begin
              reg97 <= reg92[(3'h4):(2'h2)];
              reg98 <= wire73;
              reg99 <= $unsigned((+reg88));
            end
        end
      else
        begin
          reg89 <= ((({reg99} ?
              $unsigned(wire72[(4'ha):(4'ha)]) : (reg94 ?
                  reg94 : $unsigned(wire77))) + $signed(wire80)) ~^ (&($unsigned((reg83 ?
                  (7'h44) : reg97)) ?
              ($signed((7'h40)) ? reg83 : $signed(reg91)) : reg97)));
          reg90 <= (((($unsigned(wire71) < (wire80 ?
                  reg88 : wire78)) || reg97[(1'h1):(1'h1)]) >= ($signed((reg93 <= wire73)) ?
                  reg92[(4'ha):(3'h5)] : $signed($unsigned((8'hb3))))) ?
              (|(&(wire76[(3'h4):(1'h0)] ?
                  wire70 : ((8'hbd) ?
                      (8'ha3) : wire85)))) : reg88[(3'h6):(2'h3)]);
          reg91 <= ({(-(~$unsigned(reg98)))} ?
              $signed(reg96) : $unsigned((^{$signed(wire77),
                  $unsigned(wire76)})));
        end
      reg100 <= (+wire79);
      reg101 <= wire72[(3'h5):(3'h4)];
    end
  assign wire102 = $unsigned($signed((~^(!(reg97 ? wire75 : (8'h9d))))));
  assign wire103 = reg101;
  assign wire104 = {$unsigned((~^((wire72 < wire86) >> reg91[(4'ha):(4'h8)]))),
                       {{(^~$unsigned(reg91))},
                           {$unsigned(((8'haa) < reg96))}}};
  assign wire105 = $unsigned($signed((wire87 ?
                       {reg93, $signed(reg94)} : {reg88[(4'hc):(3'h5)]})));
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire41 = $signed((~&wire39));
  assign wire42 = $signed((wire38[(1'h1):(1'h1)] ? wire38 : (8'hbc)));
  assign wire43 = $signed($signed($unsigned(wire38[(4'ha):(3'h4)])));
  assign wire44 = $unsigned({(wire40 ?
                          (&$signed(wire37)) : (^(wire43 < wire39))),
                      ((8'hb7) <= $unsigned((wire39 * (8'ha3))))});
  assign wire45 = (($signed(($unsigned(wire42) < (!wire42))) || wire37) ?
                      (wire37[(4'h9):(3'h6)] <<< (((wire43 < (8'hac)) ?
                              $unsigned(wire37) : (^~wire43)) ?
                          $unsigned((wire42 ?
                              wire41 : wire38)) : (8'h9c))) : (wire44 >>> {(~|(7'h43))}));
  assign wire46 = ($signed(wire44[(4'h9):(1'h1)]) ?
                      (((8'ha5) ?
                              $unsigned($signed(wire45)) : $signed(wire42)) ?
                          ($signed({(8'h9f),
                              wire44}) != wire44[(2'h3):(1'h1)]) : {wire40}) : (&(((|(7'h41)) ~^ $unsigned(wire40)) ?
                          ({wire42} != (8'hb2)) : {(wire41 ? wire44 : wire44),
                              (wire39 ? wire38 : wire37)})));
  always
    @(posedge clk) begin
      reg47 <= ($signed($signed(((|wire41) != (~wire39)))) > (((8'ha3) ?
          (^~(~^wire40)) : wire38[(4'hb):(1'h1)]) - wire38[(4'ha):(4'h9)]));
      reg48 <= $unsigned(($signed(wire40) != reg47[(2'h2):(1'h0)]));
    end
  assign wire49 = ($signed(($signed($unsigned(reg48)) ^ reg47[(3'h6):(3'h4)])) == $unsigned(wire37));
  assign wire50 = (8'ha0);
  assign wire51 = ((-$signed(((reg48 ?
                          (8'hbd) : wire41) ^ wire46[(2'h2):(2'h2)]))) ?
                      $signed($signed($unsigned({wire41, wire50}))) : wire40);
endmodule

module module14
#(parameter param32 = (^{((((7'h41) || (8'ha7)) & ((8'ha6) || (8'hb2))) ^~ (((8'hb7) ? (8'hbe) : (8'hb3)) == ((8'hba) | (7'h44)))), (!(^((8'had) == (8'hb3))))}), 
parameter param33 = {((^~({param32} < (|param32))) <<< (((param32 != (8'hbb)) ? (+param32) : (+param32)) >> (param32 ^ (param32 ? param32 : param32))))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  assign y = {wire31,
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
                 (1'h0)};
  assign wire19 = (wire17[(2'h2):(2'h2)] ?
                      {wire17, wire15} : (wire18 ?
                          $unsigned((~&wire17)) : wire17[(1'h0):(1'h0)]));
  assign wire20 = $unsigned(($signed(wire16[(1'h0):(1'h0)]) ?
                      (^~wire17) : wire16[(3'h5):(3'h4)]));
  assign wire21 = (((|$signed($signed(wire20))) & ((wire15[(4'h9):(1'h0)] ^ (wire18 >= wire20)) ?
                      wire20 : $unsigned((^wire16)))) - ((wire17 ?
                      (8'hbb) : ((-wire20) ?
                          $unsigned(wire15) : wire17)) >>> $unsigned(wire19[(2'h3):(1'h0)])));
  assign wire22 = (wire21 ?
                      ((wire21[(3'h4):(2'h3)] * $signed((wire20 ?
                          wire21 : wire19))) & $unsigned($signed($signed(wire17)))) : (!(((wire16 >>> wire16) ?
                              $signed(wire19) : {wire20, wire17}) ?
                          {wire16, $signed((8'hba))} : (((8'ha1) ?
                              wire21 : wire16) | wire20[(4'h8):(1'h1)]))));
  assign wire23 = wire20[(1'h0):(1'h0)];
  assign wire24 = ($unsigned({{$unsigned((8'h9c))}}) ?
                      wire15[(3'h4):(1'h1)] : wire15[(1'h1):(1'h1)]);
  assign wire25 = $unsigned(wire16[(3'h4):(1'h1)]);
  assign wire26 = $signed(wire25);
  assign wire27 = ((~&((wire25[(2'h2):(1'h0)] >= $signed(wire22)) * $signed((8'hac)))) * (wire15 || wire20));
  assign wire28 = ({wire17, $signed((^wire21))} << {($signed({wire15}) ?
                          ({(7'h40)} ?
                              wire21 : wire24[(2'h3):(2'h3)]) : ((wire24 ?
                              wire15 : wire15) <= (wire21 ?
                              wire27 : wire27)))});
  assign wire29 = (8'ha4);
  assign wire30 = wire16[(2'h2):(1'h1)];
  assign wire31 = wire18[(3'h7):(2'h2)];
endmodule
