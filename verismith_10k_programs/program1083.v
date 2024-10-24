module top
#(parameter param136 = ((~^{{((8'had) < (8'hba)), ((8'hac) ? (8'h9f) : (8'hb6))}}) ^~ (~^(8'hb4))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire134,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire4[(4'h8):(2'h2)];
  assign wire6 = wire2[(4'hc):(3'h5)];
  assign wire7 = $signed((~&$signed((~&$signed(wire0)))));
  assign wire8 = (((8'hb5) ? $signed(wire3) : (~&wire2[(5'h13):(3'h4)])) ?
                     wire0[(3'h4):(2'h3)] : (wire1[(1'h0):(1'h0)] + (wire2 ^~ ($signed(wire7) == (wire4 ^ wire2)))));
  assign wire9 = $unsigned($signed(((|(-wire4)) > ((8'ha9) ?
                     (wire6 ~^ wire4) : wire1))));
  assign wire10 = {$unsigned($unsigned($signed(wire6[(1'h1):(1'h0)]))), wire4};
  assign wire11 = (|(|($signed(wire8[(4'ha):(2'h2)]) ?
                      (~(&wire9)) : (&wire8[(4'hc):(1'h0)]))));
  assign wire12 = wire1[(4'hb):(2'h2)];
  assign wire13 = (wire11[(3'h5):(1'h1)] ?
                      ({(^~(wire3 ? wire5 : wire3)),
                          (~$unsigned(wire4))} << ($signed((+wire9)) ^ (8'ha5))) : {$unsigned((wire7 ?
                              wire12 : (!(7'h41))))});
  assign wire14 = ((&wire6) ?
                      {(|((^wire3) == wire13))} : $unsigned(($unsigned($unsigned(wire9)) - (wire5 ?
                          wire10[(4'hc):(3'h6)] : wire4))));
  assign wire15 = ((wire11 > wire4) <= ($unsigned(($signed(wire4) ?
                      (8'hbd) : (^~wire4))) >= (&$signed((wire8 ?
                      wire5 : wire0)))));
  assign wire16 = (|$signed(wire9[(3'h4):(2'h3)]));
  module17 #() modinst135 (.wire21(wire14), .wire18(wire11), .y(wire134), .wire19(wire10), .clk(clk), .wire20(wire12));
endmodule

module module17
#(parameter param132 = ((~(^~(^((8'hba) <<< (8'hbe))))) && ((((8'hbc) < ((8'ha0) ? (8'hb5) : (8'hba))) == ({(8'hba)} && (7'h43))) >= (((~|(8'ha4)) >> ((8'haa) ? (8'ha8) : (8'haf))) ^ (^(8'hb1))))), 
parameter param133 = ((~(~&(param132 + param132))) ? (~&(~|(8'hbe))) : (~^{((^param132) ^~ param132), (param132 <= (param132 << param132))})))
(y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire59;
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire71,
                 wire70,
                 wire63,
                 wire62,
                 wire61,
                 wire22,
                 wire59,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 (1'h0)};
  assign wire22 = (wire19 > (8'hb0));
  module23 #() modinst60 (wire59, clk, wire22, wire19, wire20, wire21, wire18);
  assign wire61 = wire19[(3'h7):(2'h3)];
  assign wire62 = (wire18 == $signed((+{(+wire22)})));
  assign wire63 = $signed(wire59[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg64 <= ((~^(wire18[(5'h12):(5'h11)] >> (wire61[(3'h6):(3'h4)] * $unsigned(wire61)))) ?
          (($signed((wire22 <= (7'h43))) ?
              ($unsigned(wire22) - $unsigned(wire63)) : wire61) <<< (~|wire22[(2'h2):(1'h1)])) : (((~$unsigned(wire18)) || ((&(8'hb0)) ?
                  wire59[(3'h4):(1'h0)] : wire62)) ?
              wire63 : (-$unsigned((wire19 | wire62)))));
      reg65 <= ((7'h44) ^ $signed({wire62[(1'h1):(1'h0)]}));
      if (($signed((8'hb1)) ?
          (+((~&wire62[(1'h1):(1'h0)]) ?
              $unsigned((^(8'ha8))) : wire19[(4'h9):(3'h6)])) : ((-((wire63 ?
                  wire62 : wire62) <= $signed(wire63))) ?
              (^~$unsigned(wire59)) : $signed(((-wire61) ?
                  $signed(wire63) : $signed((8'hb1)))))))
        begin
          reg66 <= wire21[(2'h3):(2'h2)];
          reg67 <= (8'haf);
          reg68 <= {$unsigned((!$signed($signed(reg64))))};
          reg69 <= (+(!reg66[(2'h2):(2'h2)]));
        end
      else
        begin
          reg66 <= reg69;
        end
    end
  assign wire70 = (reg64[(4'h8):(1'h0)] ?
                      (^(|$unsigned($unsigned(wire63)))) : (wire21 & (8'hb2)));
  assign wire71 = (wire63 ?
                      ({(~((7'h41) ? reg66 : reg67)),
                          wire61} >>> $unsigned($unsigned((~^reg68)))) : $signed($signed({reg64})));
  module72 #() modinst128 (wire127, clk, wire20, reg64, reg67, reg66, wire61);
  assign wire129 = wire62;
  assign wire130 = reg64;
  assign wire131 = (!reg66);
endmodule

module module72
#(parameter param125 = ((&{(((8'hb6) ? (8'hb4) : (8'ha2)) ? (~|(7'h44)) : {(8'h9c)})}) >>> {(^~(~|(~&(8'h9f))))}), 
parameter param126 = (+(8'ha5)))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire77;
  input wire [(2'h3):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire [(4'hc):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire78 = wire74[(4'ha):(1'h1)];
  assign wire79 = (8'hb7);
  assign wire80 = $signed($unsigned({($signed(wire76) ?
                          (wire75 & wire76) : $unsigned(wire73)),
                      (wire76 ^ wire75)}));
  assign wire81 = $signed(($unsigned($unsigned(wire77[(2'h3):(2'h2)])) ?
                      $unsigned((8'ha6)) : wire80[(1'h1):(1'h1)]));
  assign wire82 = $signed(($unsigned($signed(wire80[(1'h1):(1'h0)])) || {wire74[(4'hc):(3'h6)],
                      (!(|wire80))}));
  assign wire83 = $unsigned($signed(wire73[(4'hc):(4'hc)]));
  assign wire84 = (wire75 + $signed((wire82 ? wire73 : (|{wire77, wire82}))));
  always
    @(posedge clk) begin
      reg85 <= $signed(($signed(($unsigned(wire76) ? (8'ha7) : (~&wire80))) ?
          $signed(($unsigned((8'hb0)) ?
              wire75[(4'h8):(3'h5)] : $signed(wire78))) : wire84));
      reg86 <= wire78;
      if ((~^(&reg85)))
        begin
          reg87 <= wire74[(1'h1):(1'h1)];
          if (reg85[(1'h1):(1'h0)])
            begin
              reg88 <= $unsigned($unsigned(wire83[(4'h9):(3'h7)]));
              reg89 <= {($unsigned((|$signed(wire81))) ?
                      wire83[(4'hd):(4'hc)] : (wire84[(2'h3):(1'h1)] && $signed($unsigned(wire76)))),
                  $unsigned({reg85,
                      ((wire74 ? (8'ha1) : wire78) - {(8'hb0)})})};
            end
          else
            begin
              reg88 <= wire74[(3'h5):(3'h4)];
              reg89 <= wire75[(3'h4):(2'h2)];
              reg90 <= (-reg85[(1'h1):(1'h1)]);
            end
          reg91 <= reg85[(2'h2):(1'h1)];
          reg92 <= ($unsigned(wire79) & reg86[(3'h5):(2'h3)]);
        end
      else
        begin
          reg87 <= (((&(|(~^reg89))) | $unsigned({$unsigned(wire76),
                  $unsigned(wire76)})) ?
              {($signed($signed((7'h44))) ?
                      ((reg88 <<< wire81) ~^ (-wire81)) : (reg91 > $unsigned(wire78)))} : {(~^(!reg85[(1'h1):(1'h1)]))});
          reg88 <= $signed($signed((!wire76[(2'h3):(1'h1)])));
          reg89 <= ((wire75[(2'h2):(1'h1)] - ({(reg91 != wire75),
                  (reg88 == wire73)} & $signed((wire73 << (8'ha1))))) ?
              wire81[(5'h10):(1'h1)] : reg88);
          reg90 <= reg86[(1'h0):(1'h0)];
          reg91 <= {reg89, (^((reg89 * wire81) || reg87[(4'h9):(3'h7)]))};
        end
    end
  always
    @(posedge clk) begin
      if ((reg91 | reg88))
        begin
          reg93 <= {$unsigned(($signed($unsigned(wire80)) ?
                  ({wire77,
                      wire73} & (reg89 + reg89)) : ((~|wire80) == (wire78 - (8'hba))))),
              {(-(wire73 >> wire77))}};
          reg94 <= {$unsigned($signed($unsigned(wire77[(4'hb):(1'h0)]))),
              ($signed($signed(((8'hb1) ~^ (8'ha5)))) << $signed($signed(wire82)))};
        end
      else
        begin
          reg93 <= (wire83[(4'he):(1'h1)] > $signed({$signed((~&wire75))}));
          reg94 <= reg86;
          reg95 <= ($unsigned(wire80) ?
              wire82[(4'h8):(3'h5)] : (+(^~$signed(reg93))));
          if ((($unsigned((reg91 << wire76[(2'h3):(1'h0)])) ?
              wire78 : ($signed(reg95) ?
                  (reg95[(3'h5):(2'h3)] ?
                      (wire75 | wire77) : (|wire82)) : wire83)) >> ((!{(wire76 >= reg93),
              wire73}) >= {(reg92[(4'hc):(3'h6)] >> $unsigned(reg94))})))
            begin
              reg96 <= (8'had);
              reg97 <= $signed((~^$signed(reg93[(2'h3):(2'h3)])));
            end
          else
            begin
              reg96 <= {(({$signed(wire80)} >>> (|wire81)) ?
                      wire75[(3'h6):(2'h2)] : reg93),
                  (|wire80[(2'h2):(2'h2)])};
              reg97 <= ($signed(wire73[(4'ha):(3'h7)]) ?
                  (((~&(reg96 ? wire80 : (8'ha6))) <= reg93[(5'h15):(5'h11)]) ?
                      $signed($unsigned($unsigned(reg89))) : ($unsigned((reg90 == reg93)) || $unsigned($signed((8'hbd))))) : $unsigned($signed(reg87[(3'h6):(2'h2)])));
              reg98 <= $unsigned(($unsigned(wire78) ^~ ({reg93,
                      {(8'hb5), reg87}} ?
                  wire84 : (~(reg85 > reg92)))));
              reg99 <= (((((reg89 <= wire79) ?
                      $signed(wire84) : (~|reg98)) & ($unsigned(wire76) ?
                      {wire79} : $signed(reg88))) ?
                  (reg88[(4'hb):(4'h9)] ?
                      wire74[(3'h4):(1'h0)] : $signed((reg93 << (8'hb0)))) : ($unsigned($signed(wire73)) >= (+(reg96 ?
                      wire78 : wire80)))) & {reg90[(1'h0):(1'h0)]});
            end
          if (({$signed(reg88)} < reg94))
            begin
              reg100 <= reg91[(2'h3):(2'h2)];
              reg101 <= (($unsigned({$signed(wire73), wire80}) * (+((~&wire81) ?
                  reg89[(2'h3):(2'h3)] : reg86[(2'h3):(1'h0)]))) ^~ {$unsigned(((!wire84) | $signed((8'hb2))))});
              reg102 <= {reg96[(2'h2):(2'h2)],
                  $signed((({reg87} ^ reg88[(4'h9):(1'h1)]) ?
                      (~{reg97}) : $unsigned((+reg93))))};
              reg103 <= wire75;
              reg104 <= reg86;
            end
          else
            begin
              reg100 <= wire77[(3'h5):(2'h3)];
              reg101 <= $signed((&reg99));
              reg102 <= {$signed(wire76[(1'h1):(1'h0)])};
              reg103 <= (^~{((^~(reg87 ? reg86 : reg87)) ?
                      $unsigned((reg102 ?
                          wire79 : wire76)) : (reg93[(1'h0):(1'h0)] < (reg102 ?
                          wire73 : reg102)))});
            end
        end
      if ($unsigned(wire82[(4'hd):(2'h2)]))
        begin
          reg105 <= reg93;
          reg106 <= $signed(reg89);
        end
      else
        begin
          reg105 <= ((~&$unsigned(($unsigned(reg101) != $unsigned(wire82)))) ?
              (8'h9c) : wire82);
          if ($signed($signed($signed(($signed(wire76) <<< (~reg90))))))
            begin
              reg106 <= ($unsigned($unsigned(reg97)) ?
                  {{$signed((&wire78)), reg92[(3'h6):(2'h3)]},
                      reg91} : {{wire83[(3'h6):(1'h0)]}});
              reg107 <= $signed(wire83[(4'ha):(3'h5)]);
              reg108 <= wire84;
              reg109 <= ($signed(reg106[(4'h8):(1'h1)]) * (8'hbd));
              reg110 <= reg89[(3'h5):(3'h5)];
            end
          else
            begin
              reg106 <= $unsigned($signed(($signed((reg98 ?
                  (8'hb5) : (8'hb1))) >>> ($unsigned((8'hab)) | $signed(wire73)))));
              reg107 <= wire73[(3'h6):(3'h5)];
            end
        end
      if (({(wire80 ?
              (((8'hac) != wire84) ? $signed(reg85) : wire82) : (~{reg107,
                  reg91})),
          (|(wire75 ?
              reg94 : (reg91 ? reg95 : reg85)))} <= $signed($unsigned(reg98))))
        begin
          reg111 <= ((^reg106) < (reg89 ?
              (~reg92[(4'hf):(4'he)]) : (($signed(wire84) ?
                      (|(8'ha4)) : $unsigned(reg107)) ?
                  $signed((wire77 || reg88)) : reg102)));
          reg112 <= reg109[(3'h4):(2'h3)];
          reg113 <= (~((reg108[(3'h4):(2'h3)] == {{(8'hb7)}}) ?
              (((reg110 * reg111) >= (reg109 == wire78)) | $unsigned($unsigned((7'h43)))) : $unsigned((wire73[(3'h7):(1'h0)] ?
                  $signed(reg103) : $unsigned(reg94)))));
          reg114 <= reg91[(1'h0):(1'h0)];
          reg115 <= ((reg104 ?
                  reg102[(1'h0):(1'h0)] : ((8'hb3) && $signed(reg101))) ?
              {reg88,
                  (wire84[(3'h7):(3'h4)] * ((^wire75) || reg93[(4'hd):(3'h4)]))} : reg89[(2'h2):(1'h0)]);
        end
      else
        begin
          reg111 <= (~&wire82);
        end
      reg116 <= (8'hb6);
      if ((reg104 ? (+reg88) : reg104[(3'h4):(2'h2)]))
        begin
          if ($unsigned($unsigned({(reg109[(1'h0):(1'h0)] ? wire79 : (8'hb0)),
              (~&$signed(reg105))})))
            begin
              reg117 <= reg97[(2'h3):(2'h3)];
              reg118 <= reg111[(2'h3):(2'h3)];
            end
          else
            begin
              reg117 <= {reg113[(4'hd):(4'ha)],
                  {$signed($signed($unsigned((8'ha1)))),
                      wire84[(4'h8):(3'h6)]}};
              reg118 <= ((~&{((reg88 ? wire78 : wire80) | (reg106 ?
                      reg108 : (8'ha7))),
                  (-(~^wire78))}) | $signed(($unsigned((reg110 * reg89)) ^~ ($signed(reg101) != (~(8'ha5))))));
              reg119 <= (~|((reg118[(3'h4):(2'h3)] >>> (!reg96[(3'h6):(2'h2)])) ?
                  (reg96 ?
                      reg103 : (reg106 ?
                          $unsigned(wire73) : reg106[(1'h1):(1'h0)])) : {(~|reg93[(4'ha):(4'h8)])}));
            end
        end
      else
        begin
          reg117 <= (~wire83[(4'hf):(4'ha)]);
          reg118 <= $unsigned(wire82);
          reg119 <= (($unsigned(((~|(8'ha1)) <= $unsigned(wire81))) < {reg113[(4'h8):(1'h1)]}) ^ reg92);
          reg120 <= (wire80 ?
              ($unsigned($unsigned((reg115 > reg85))) && $signed($unsigned((-reg117)))) : ($signed((8'ha3)) ?
                  wire84[(1'h1):(1'h1)] : $unsigned((~(reg115 ?
                      reg86 : reg99)))));
        end
    end
  assign wire121 = wire75[(1'h0):(1'h0)];
  assign wire122 = ($signed(wire121) ?
                       reg96 : (~|(wire84 ?
                           (^~(reg101 ?
                               (8'hb6) : wire79)) : $signed(reg88[(4'h9):(3'h4)]))));
  assign wire123 = {({reg109, $unsigned($unsigned(wire81))} ?
                           (reg85[(1'h0):(1'h0)] < ((reg86 ? reg91 : reg89) ?
                               $signed(reg89) : reg116)) : (wire79[(1'h1):(1'h0)] ^ (8'hb0))),
                       {{wire74[(3'h7):(1'h1)]}}};
  assign wire124 = ((((wire76 - wire73) <<< ($signed(reg94) ?
                           wire83 : $signed(reg87))) <<< (^~reg111)) ?
                       (^(^~wire73[(3'h4):(2'h3)])) : (~&{((~&wire76) ^ $unsigned(reg115)),
                           reg100}));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire51,
                 wire50,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((((+wire25) << $signed((wire25 <= wire26))) ?
          wire24 : ((!(wire28 ^ wire24)) ?
              wire27[(3'h5):(3'h5)] : wire25[(2'h3):(2'h3)]))))
        begin
          if ((wire26[(2'h3):(1'h0)] >> wire24[(5'h14):(2'h2)]))
            begin
              reg29 <= (~^wire27[(4'h8):(2'h3)]);
              reg30 <= $signed($unsigned(((+(wire25 * wire26)) ?
                  $unsigned((wire27 >> wire28)) : wire26[(4'hb):(3'h4)])));
            end
          else
            begin
              reg29 <= (wire28 ~^ wire24[(3'h6):(2'h3)]);
              reg30 <= ($unsigned((reg29 >= ((!(7'h43)) ?
                  ((8'h9c) ~^ (8'hbb)) : (-wire27)))) >= (^~reg30[(3'h4):(2'h3)]));
            end
        end
      else
        begin
          reg29 <= wire25;
          reg30 <= (7'h43);
        end
      if ($unsigned($unsigned((wire25 > $unsigned($signed(wire28))))))
        begin
          reg31 <= wire28;
          if ($signed($unsigned($unsigned(wire27[(3'h4):(1'h0)]))))
            begin
              reg32 <= reg31[(2'h3):(1'h0)];
              reg33 <= $unsigned({wire28[(5'h11):(3'h6)],
                  wire26[(4'h8):(1'h1)]});
              reg34 <= reg30;
              reg35 <= (|(&($unsigned($unsigned(reg31)) ?
                  $signed($signed(wire27)) : reg29)));
            end
          else
            begin
              reg32 <= $signed($signed(((reg29 * wire25) ?
                  $signed(reg35[(3'h6):(1'h0)]) : (^~reg34[(3'h6):(3'h6)]))));
              reg33 <= (&(+$unsigned($unsigned({reg30, wire24}))));
            end
          reg36 <= wire24;
          if (((~&{((reg35 ? wire26 : wire27) > ((8'ha2) ? wire25 : (8'had))),
                  $unsigned($signed(reg34))}) ?
              ((~&$unsigned((-wire26))) ~^ $unsigned((wire28[(3'h5):(2'h3)] ?
                  wire28[(4'hb):(4'ha)] : $unsigned(reg33)))) : {(($unsigned(reg36) ?
                      (reg34 >>> wire28) : (^(8'hb8))) > ($unsigned((8'ha0)) >>> (7'h42)))}))
            begin
              reg37 <= (((&(reg30 ?
                  (wire25 != wire27) : ((8'hba) ?
                      reg31 : (8'ha1)))) ^~ (!wire27[(4'hf):(1'h0)])) == wire28);
            end
          else
            begin
              reg37 <= reg37;
              reg38 <= $signed((~|wire25[(3'h6):(3'h5)]));
              reg39 <= ({((~^(~wire28)) ?
                          wire25[(4'h9):(2'h2)] : ((reg36 > reg30) ?
                              {reg30, reg31} : wire27)),
                      $signed((!(+wire24)))} ?
                  {$signed(reg31[(3'h7):(1'h1)])} : (!reg37[(1'h1):(1'h1)]));
              reg40 <= ({(+$unsigned(reg31[(5'h11):(2'h2)]))} ?
                  (+{$signed((^(8'h9c)))}) : reg30);
              reg41 <= $unsigned(($signed(wire24) ?
                  ((((7'h41) || wire25) && reg37[(3'h4):(1'h0)]) & reg38[(4'he):(3'h4)]) : $signed(reg33)));
            end
          reg42 <= $signed((((+$unsigned(reg32)) ?
              wire27 : (^(|reg35))) >> $signed({(reg36 * reg39)})));
        end
      else
        begin
          reg31 <= (8'ha7);
          reg32 <= $signed((~|($unsigned((wire27 ?
              reg31 : wire27)) >> (&(reg38 ? reg40 : wire28)))));
        end
      reg43 <= (~|(8'hb6));
      if ((+(~&(!($signed(wire28) ? $signed(reg32) : $signed((8'hbe)))))))
        begin
          reg44 <= reg35;
          reg45 <= (~^reg34);
        end
      else
        begin
          reg44 <= (($unsigned(($unsigned(reg31) ?
                  {reg40} : (-reg33))) <<< $signed(reg33[(4'hd):(3'h5)])) ?
              $signed({$unsigned((~|wire27))}) : $unsigned((reg32[(3'h4):(2'h2)] == (-wire27[(4'h9):(3'h5)]))));
          reg45 <= reg42[(3'h7):(1'h1)];
          if (({reg41[(1'h1):(1'h1)],
              ((reg30[(4'h9):(3'h7)] ?
                      (reg42 <<< (8'h9f)) : reg44[(1'h1):(1'h0)]) ?
                  wire24 : {reg34[(5'h10):(5'h10)],
                      (reg30 ? reg36 : (8'hbe))})} >= (|reg43)))
            begin
              reg46 <= reg32[(3'h5):(2'h2)];
              reg47 <= {reg36,
                  $signed($signed((reg42 ? ((7'h40) * wire25) : (7'h42))))};
              reg48 <= $signed($unsigned($signed((~$unsigned(wire24)))));
              reg49 <= $signed((!$unsigned(((reg31 | reg29) * (~^reg35)))));
            end
          else
            begin
              reg46 <= ((+(($signed((8'had)) ?
                  (reg35 != reg36) : wire26) != {(-reg34)})) > ((~|$unsigned($signed(reg45))) ^ $signed((8'had))));
              reg47 <= (~(($signed(wire25) + $signed($signed(reg32))) <= $signed($unsigned($signed(reg30)))));
              reg48 <= (8'ha5);
            end
        end
    end
  assign wire50 = (~|$signed($unsigned($signed((reg44 ? reg47 : wire28)))));
  assign wire51 = (|$unsigned((wire50 ?
                      $signed($unsigned((8'hbd))) : reg42[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg52 <= reg29[(4'hb):(4'hb)];
      reg53 <= reg42[(2'h2):(1'h1)];
      reg54 <= (~^wire26[(2'h3):(1'h0)]);
      reg55 <= (-reg33);
    end
  assign wire56 = (~(^~$signed(reg52)));
  assign wire57 = $unsigned(reg41);
  assign wire58 = (~&$signed(wire24));
endmodule
