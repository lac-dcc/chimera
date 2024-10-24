module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire34;
  assign y = {wire104, wire38, wire37, wire36, wire34, (1'h0)};
  module5 #() modinst35 (wire34, clk, wire1, wire0, wire2, wire4);
  assign wire36 = wire34;
  assign wire37 = $signed((wire0 ?
                      $signed($unsigned((&wire4))) : wire3[(1'h0):(1'h0)]));
  assign wire38 = ($signed(((&$unsigned(wire37)) >= $unsigned(wire34))) << {$signed($signed((wire34 ?
                          wire34 : wire34))),
                      $signed($signed(wire34[(4'h9):(1'h0)]))});
  module39 #() modinst105 (wire104, clk, wire38, wire4, wire3, wire37);
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  input wire [(4'h8):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire77,
                 wire76,
                 wire74,
                 wire54,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire44 = $signed(wire43);
  assign wire45 = {(wire42[(4'h9):(3'h4)] ?
                          $signed($signed(wire44)) : {$signed(wire41[(4'h8):(2'h3)]),
                              (+$signed((8'haf)))})};
  assign wire46 = ((!(!$signed(wire42[(2'h3):(1'h0)]))) ?
                      {wire41[(3'h4):(1'h1)]} : {wire41,
                          ({(+wire45), $signed(wire44)} ?
                              {$signed((8'hbe)),
                                  (wire40 ? wire42 : wire43)} : ((wire44 ?
                                      wire45 : (8'ha7)) ?
                                  wire41 : (wire45 ? wire40 : wire44)))});
  assign wire47 = wire46[(2'h2):(1'h1)];
  assign wire48 = $unsigned(wire42[(4'he):(4'ha)]);
  assign wire49 = {{wire47}};
  always
    @(posedge clk) begin
      if (wire42)
        begin
          reg50 <= wire40;
          if (wire48)
            begin
              reg51 <= $unsigned(((&wire41) ?
                  {(!(wire47 & wire40)), (~&wire40[(2'h3):(1'h1)])} : wire41));
            end
          else
            begin
              reg51 <= (wire46 ? (wire48 - wire43) : $unsigned(wire44));
              reg52 <= wire43[(2'h3):(2'h3)];
            end
          reg53 <= (({$signed((wire41 > wire43))} ?
              {$signed({(8'ha5),
                      wire49})} : wire44) & ($unsigned((((8'ha2) >= (8'ha5)) < $unsigned(reg51))) ?
              (wire45 ?
                  {$signed(reg52),
                      (wire40 << wire40)} : $signed($signed(wire43))) : wire49[(4'h8):(2'h2)]));
        end
      else
        begin
          reg50 <= ($unsigned($signed(($unsigned((8'hb8)) == (reg51 ?
              wire41 : wire44)))) >> ($unsigned(reg51[(2'h2):(2'h2)]) ?
              (|wire43[(2'h2):(1'h1)]) : wire41));
        end
    end
  assign wire54 = $signed(($signed(($unsigned(wire46) ?
                          (reg53 - wire42) : (wire46 ? reg51 : reg52))) ?
                      wire42 : (((-wire42) >>> $signed(wire48)) >> ({reg52,
                              wire41} ?
                          $signed(wire41) : {reg53}))));
  module55 #() modinst75 (wire74, clk, reg51, wire48, reg53, wire46);
  assign wire76 = wire43;
  assign wire77 = $signed((-(+$unsigned(wire74))));
  always
    @(posedge clk) begin
      if ((~|$signed(wire49[(1'h1):(1'h0)])))
        begin
          reg78 <= $unsigned($unsigned($unsigned($unsigned((reg51 ?
              wire40 : wire49)))));
          if ($unsigned(wire49))
            begin
              reg79 <= $signed((~{(wire41[(1'h0):(1'h0)] | $unsigned(wire76))}));
              reg80 <= ((wire46 ? reg51 : reg79[(3'h4):(1'h0)]) ?
                  (~^((~$unsigned((8'hbc))) ?
                      $unsigned((wire41 ?
                          wire46 : reg51)) : ((!wire45) * wire42))) : reg51);
              reg81 <= ($signed($signed((-(|wire77)))) ?
                  wire44[(3'h5):(2'h2)] : $unsigned($signed({(reg78 > (8'h9c))})));
            end
          else
            begin
              reg79 <= ($unsigned($unsigned(reg81[(1'h0):(1'h0)])) != (-({$signed((8'hbc))} ?
                  (+reg78) : (|wire48[(1'h1):(1'h1)]))));
              reg80 <= $signed(wire49[(2'h3):(1'h0)]);
              reg81 <= (({(+wire46)} <= wire46[(1'h1):(1'h0)]) != (wire40 ?
                  (reg81[(1'h0):(1'h0)] ?
                      wire54[(5'h14):(4'he)] : ((reg78 >>> reg80) ?
                          (~&reg79) : (reg79 || wire40))) : (($unsigned(wire76) ?
                      wire43 : {reg52}) & ((wire42 && reg80) <= wire48))));
            end
        end
      else
        begin
          reg78 <= (wire40 ?
              ($signed($unsigned($signed(reg81))) << $signed(wire42)) : (&wire77));
          reg79 <= $unsigned(($unsigned(($unsigned(reg51) ^~ reg50)) | $signed(wire76)));
          if ((($signed((|((8'hae) ?
                  wire77 : wire76))) ^ reg53[(2'h3):(2'h3)]) ?
              ((8'hb2) ?
                  wire45[(1'h0):(1'h0)] : {$signed(wire43),
                      (-$unsigned(wire48))}) : (~&(((reg79 * reg80) ~^ (reg81 <<< reg80)) | (reg81[(2'h3):(2'h2)] ?
                  $signed(wire49) : (reg78 ? reg51 : reg78))))))
            begin
              reg80 <= reg80[(1'h1):(1'h1)];
              reg81 <= reg51[(3'h5):(3'h5)];
              reg82 <= $signed(wire44[(1'h0):(1'h0)]);
              reg83 <= reg52;
              reg84 <= reg52[(2'h2):(1'h1)];
            end
          else
            begin
              reg80 <= wire42;
            end
        end
      reg85 <= reg78;
      reg86 <= wire45[(1'h0):(1'h0)];
      reg87 <= {($signed(reg86[(4'hb):(4'h9)]) | $signed((wire41[(2'h2):(1'h0)] != $unsigned((8'h9c))))),
          $unsigned($unsigned(($signed(reg52) && $signed(reg53))))};
      reg88 <= (reg85[(1'h1):(1'h1)] <= $signed({reg85[(4'ha):(1'h0)],
          (~|reg78[(1'h0):(1'h0)])}));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(({(reg80 <= reg52)} ?
          reg85[(2'h2):(1'h0)] : $signed((-wire77))))))
        begin
          reg89 <= {wire77[(3'h5):(2'h2)], wire48};
          reg90 <= reg81[(1'h0):(1'h0)];
          reg91 <= wire43;
        end
      else
        begin
          reg89 <= $unsigned(((-wire44) > reg85));
          reg90 <= $signed((~&$unsigned({(!reg80), wire40[(3'h7):(3'h7)]})));
          reg91 <= {reg83};
        end
      if ($unsigned({$unsigned($signed((reg83 <<< wire49)))}))
        begin
          reg92 <= (((~|(~^reg82)) ?
              $unsigned(reg87[(4'hb):(2'h2)]) : $unsigned(((8'haf) ?
                  $unsigned(reg91) : (&wire40)))) != ({wire49} * $unsigned($unsigned((reg80 ?
              wire41 : reg91)))));
          reg93 <= ((wire77[(2'h3):(1'h1)] || $signed(reg81)) >= (reg50 && (+$signed((reg52 - wire44)))));
          reg94 <= {reg50[(4'hb):(3'h4)], reg52};
          reg95 <= wire54;
          if (wire46)
            begin
              reg96 <= $signed(reg78);
              reg97 <= ($unsigned(reg50) >= (+((-$signed(reg83)) ?
                  reg81[(2'h3):(1'h1)] : $signed((7'h40)))));
              reg98 <= (((~|reg50[(1'h1):(1'h1)]) && (((+wire45) ?
                  $unsigned(reg86) : (!reg89)) <= (7'h44))) ~^ $signed(((^$unsigned(reg83)) & reg91[(1'h1):(1'h1)])));
              reg99 <= (reg86[(1'h1):(1'h0)] ?
                  (8'ha6) : (($signed({reg87, reg89}) ?
                      reg96 : $unsigned((reg90 || reg84))) != $signed($signed(reg86))));
            end
          else
            begin
              reg96 <= reg93[(3'h4):(2'h3)];
            end
        end
      else
        begin
          if (($signed(((~|$signed(wire47)) ?
                  (wire45 >> (+(7'h41))) : wire47[(4'h8):(3'h7)])) ?
              (({$unsigned((8'haa))} ?
                  {reg91[(1'h1):(1'h0)], ((8'hbf) ? reg97 : reg95)} : (reg99 ?
                      (reg98 > wire40) : reg51)) == (wire49[(1'h1):(1'h1)] ~^ $signed({reg86}))) : $unsigned((8'hbe))))
            begin
              reg92 <= (($signed($signed(reg99)) + (+(reg99 ?
                  (+(8'haa)) : (reg80 || wire41)))) >>> ((~wire40) ?
                  $unsigned(reg95[(3'h7):(3'h7)]) : (|(^{reg79}))));
            end
          else
            begin
              reg92 <= (reg99[(3'h6):(2'h3)] ?
                  reg93 : $signed({((+reg79) ? {reg86, (8'ha1)} : (!reg82))}));
              reg93 <= wire43;
              reg94 <= wire77[(1'h0):(1'h0)];
            end
          reg95 <= ($signed(reg99) ?
              ($unsigned((-((8'hb3) ? reg84 : reg99))) ?
                  (^(^~(wire76 << reg53))) : $unsigned((reg51 * reg81[(1'h1):(1'h1)]))) : $unsigned(wire54[(2'h2):(2'h2)]));
        end
      reg100 <= wire48;
      reg101 <= $signed(reg100);
    end
  assign wire102 = $signed($unsigned((7'h41)));
  assign wire103 = reg53[(1'h1):(1'h0)];
endmodule

module module5
#(parameter param32 = ((8'ha7) || ({(((8'had) ? (8'ha1) : (8'haa)) ^ (+(8'ha2))), (((7'h43) << (8'hb6)) ? ((8'hb2) >>> (8'hb3)) : (8'hb8))} ? (8'haf) : ((~(&(8'ha9))) ? (((7'h44) ? (8'ha2) : (8'hb0)) ? {(8'ha2), (8'hb1)} : (^~(7'h43))) : ({(8'ha1), (8'hb6)} & ((8'had) ? (8'hb8) : (8'hb9)))))), 
parameter param33 = (+((|param32) && (param32 | (~|{param32, param32})))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire22;
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire10,
                 wire22,
                 reg27,
                 (1'h0)};
  assign wire10 = ({($signed((-wire7)) - (&wire9[(2'h3):(1'h0)]))} ~^ wire9[(2'h3):(1'h1)]);
  module11 #() modinst23 (wire22, clk, wire9, wire10, wire6, wire7, wire8);
  assign wire24 = wire10;
  assign wire25 = ((wire10 ?
                      wire22[(3'h4):(2'h2)] : (8'hbe)) < (~wire8[(2'h2):(1'h1)]));
  assign wire26 = (8'haa);
  always
    @(posedge clk) begin
      reg27 <= {wire6};
    end
  assign wire28 = $signed($signed({$signed((reg27 <= reg27))}));
  assign wire29 = ($unsigned((8'hb0)) ? $unsigned(wire26) : wire28);
  assign wire30 = ({(((-wire8) ?
                              (|wire28) : ((8'ha7) ^ wire26)) > (-((8'ha8) != (8'ha8)))),
                          ((reg27 ?
                              wire9[(4'h9):(3'h7)] : wire9) >>> wire8[(2'h3):(2'h2)])} ?
                      ((((wire29 == wire22) < reg27[(1'h1):(1'h0)]) ^~ ((^~wire24) > $unsigned(wire25))) | $unsigned(wire28)) : wire10[(3'h6):(2'h3)]);
  assign wire31 = $unsigned({$unsigned(($signed(wire8) ?
                          $unsigned(wire24) : $unsigned(wire22))),
                      (~wire29)});
endmodule

module module11
#(parameter param21 = ((8'ha9) ? (~&{({(8'h9c), (8'hb0)} << ((8'haf) ? (8'hb9) : (8'hb9)))}) : {(({(8'hb5), (8'hb7)} ? (-(7'h40)) : ((8'hb9) ? (7'h40) : (8'hae))) && (((8'hb0) ? (8'hb4) : (8'hb8)) ? (~(7'h43)) : {(8'hb0)}))}))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire17;
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire20, wire19, wire17, reg18, (1'h0)};
  assign wire17 = ($unsigned(((wire12 ? $signed((8'hbf)) : wire12) ?
                          ({wire13} <<< $signed(wire12)) : ((wire16 < wire16) | $unsigned(wire16)))) ?
                      wire15[(2'h2):(2'h2)] : (^~{wire14}));
  always
    @(posedge clk) begin
      reg18 <= $unsigned({$signed(wire16),
          ($signed(wire15) - $unsigned(((8'hbc) ? wire17 : wire12)))});
    end
  assign wire19 = $unsigned(((~^($unsigned(wire16) <= $signed(wire12))) >>> (^wire12[(3'h4):(2'h2)])));
  assign wire20 = wire17;
endmodule

module module55
#(parameter param72 = {({(((8'h9c) <<< (8'hae)) | ((8'hbd) ? (8'hb6) : (8'hb8)))} ? ((~|((8'ha2) < (8'hb5))) ? ({(8'haf), (8'ha0)} ? ((8'ha8) ? (8'hbb) : (8'hb4)) : ((8'ha9) ^~ (8'ha8))) : ((~(7'h44)) != ((8'hab) ? (8'ha3) : (8'h9c)))) : {{((7'h44) ? (7'h43) : (8'h9e)), ((8'hbb) ? (8'hba) : (8'hb9))}}), (+(~&{{(8'ha6), (8'ha5)}, ((8'ha7) ? (7'h43) : (8'ha4))}))}, 
parameter param73 = param72)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire59;
  input wire [(2'h2):(1'h0)] wire58;
  input wire [(4'hc):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire60;
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire61,
                 wire60,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire60 = $unsigned($unsigned((+$unsigned($unsigned(wire56)))));
  assign wire61 = wire57[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg62 <= wire59;
      reg63 <= wire59;
    end
  always
    @(posedge clk) begin
      reg64 <= (~|(reg62 - {(+wire57[(1'h1):(1'h0)]), $unsigned((!wire61))}));
    end
  assign wire65 = $signed(((^~$signed({reg64, reg62})) <<< (^~(8'haf))));
  assign wire66 = (reg63 - wire59[(1'h1):(1'h1)]);
  assign wire67 = $signed(wire60[(2'h2):(1'h1)]);
  assign wire68 = $signed(wire56[(2'h2):(1'h1)]);
  assign wire69 = {$signed(reg64[(2'h2):(1'h1)]), $signed(wire68)};
  assign wire70 = (8'hb3);
  assign wire71 = wire67[(1'h1):(1'h0)];
endmodule
