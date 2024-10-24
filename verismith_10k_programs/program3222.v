module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire113;
  assign y = {wire115,
                 wire72,
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
                 wire4,
                 wire74,
                 wire113,
                 (1'h0)};
  assign wire4 = $unsigned($signed(((wire1[(2'h3):(2'h3)] & $unsigned(wire1)) >> wire1)));
  assign wire5 = (wire4 ?
                     $unsigned($unsigned(wire0[(3'h5):(1'h0)])) : (~^$signed(((wire4 ^ wire2) ?
                         ((8'ha6) ^~ wire0) : $signed(wire2)))));
  assign wire6 = {wire1, (^$signed((8'ha8)))};
  assign wire7 = (wire3[(3'h5):(2'h3)] <<< wire0);
  assign wire8 = (wire5[(3'h6):(3'h4)] >> (wire5[(1'h0):(1'h0)] || (+wire5)));
  assign wire9 = $unsigned(($signed(wire0) ^ (wire0[(2'h3):(1'h1)] - wire6[(5'h14):(5'h14)])));
  assign wire10 = {$unsigned((wire8[(4'h9):(3'h5)] != $signed($unsigned(wire2)))),
                      wire1};
  assign wire11 = (((((wire1 ? wire1 : wire0) <<< $signed(wire1)) ?
                          wire2 : ((^(8'ha5)) && wire7[(3'h7):(2'h3)])) ?
                      wire6[(4'h9):(1'h0)] : (^wire4)) ^ (((wire0[(3'h5):(3'h4)] ?
                      $signed(wire8) : {wire10}) ~^ (&wire9)) && (8'ha4)));
  assign wire12 = (~|wire10);
  assign wire13 = ($unsigned(wire8) > (($signed((wire11 >>> wire11)) >> (~{wire4})) < $unsigned(($signed((8'hb8)) ?
                      wire4[(3'h7):(3'h5)] : wire7))));
  assign wire14 = wire9[(4'h9):(3'h7)];
  assign wire15 = wire14[(4'ha):(3'h5)];
  module16 #() modinst73 (wire72, clk, wire8, wire0, wire1, wire14, wire15);
  assign wire74 = wire10[(4'h9):(2'h2)];
  module75 #() modinst114 (wire113, clk, wire3, wire5, wire2, wire0, wire13);
  assign wire115 = {wire0[(3'h4):(2'h3)]};
endmodule

module module75
#(parameter param112 = ((!{{(~(8'h9e))}, (((8'hb8) << (8'ha3)) | (^~(8'hb5)))}) ? (!{(((8'ha5) ~^ (8'hb0)) >= ((8'hab) < (8'ha2)))}) : (((((8'hbf) ? (8'ha6) : (8'hb9)) ~^ ((8'hb9) ? (8'had) : (8'hb7))) ? ((|(8'hb3)) || ((8'ha4) ? (8'haa) : (7'h44))) : (((8'hbc) ^~ (8'hba)) || {(8'hb2), (8'hb2)})) ~^ {({(8'ha9), (8'hbe)} <<< (!(8'haa))), (~|((8'h9f) ? (7'h44) : (8'hb7)))})))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire80;
  input wire [(4'h9):(1'h0)] wire79;
  input wire signed [(4'h9):(1'h0)] wire78;
  input wire signed [(5'h13):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire82,
                 wire81,
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
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire81 = (~&$unsigned(wire77));
  assign wire82 = (($signed(((wire80 ? wire77 : wire81) ?
                          wire77 : (~|wire76))) != wire77[(4'hf):(4'ha)]) ?
                      ({wire80[(1'h1):(1'h1)]} && (($signed(wire80) ?
                          (wire76 ?
                              wire78 : wire78) : $unsigned(wire80)) & (~&(wire81 >> wire76)))) : (~^wire76[(4'h8):(2'h3)]));
  always
    @(posedge clk) begin
      if ((($signed(wire78) >> $signed((^~$unsigned(wire77)))) ?
          wire81 : $signed(wire78[(2'h2):(1'h1)])))
        begin
          if ((wire82[(4'hd):(1'h0)] ?
              ($unsigned((~^$unsigned(wire82))) ?
                  wire79[(1'h0):(1'h0)] : ($unsigned($signed(wire80)) & (^wire80))) : {{((wire78 ?
                          wire76 : wire79) ^~ (wire80 ? wire76 : wire82))},
                  $unsigned((~^(wire80 ? wire81 : wire81)))}))
            begin
              reg83 <= ($unsigned(((-$signed(wire77)) ?
                      wire79[(1'h1):(1'h1)] : $signed($unsigned(wire79)))) ?
                  (^wire81) : $unsigned((wire77[(1'h1):(1'h1)] ?
                      ((~|(8'ha0)) ?
                          ((8'hbb) ?
                              wire82 : wire81) : wire78) : {(wire80 < wire82)})));
              reg84 <= $unsigned($signed((~((~|wire82) || $unsigned(wire78)))));
              reg85 <= $signed(wire78[(3'h7):(1'h1)]);
              reg86 <= $signed((&$unsigned(wire77)));
            end
          else
            begin
              reg83 <= wire80;
              reg84 <= $signed((($unsigned($signed((8'ha6))) >> ((reg84 * wire76) <= wire76)) - reg86[(3'h6):(3'h6)]));
            end
          if (reg84[(4'ha):(1'h0)])
            begin
              reg87 <= $unsigned({(~^$signed((-reg86)))});
              reg88 <= ((~&wire77[(1'h1):(1'h0)]) ? reg84 : wire81);
            end
          else
            begin
              reg87 <= reg85;
            end
          reg89 <= (&reg83[(1'h1):(1'h0)]);
          if ($signed({{{$signed(wire78), reg89}}}))
            begin
              reg90 <= reg88;
              reg91 <= $signed($signed(reg87[(1'h0):(1'h0)]));
              reg92 <= {(((wire81 ?
                          (wire81 + wire77) : {reg87,
                              reg89}) <= ((reg88 ^ wire80) ?
                          reg86 : (~|wire81))) ?
                      ((reg86 <= reg87) ?
                          ($unsigned(reg85) || reg90[(4'hd):(4'h8)]) : $unsigned($unsigned(reg86))) : (~$signed($signed(wire82)))),
                  (wire80[(4'he):(2'h2)] || reg86[(4'h9):(4'h9)])};
              reg93 <= $unsigned(reg85);
              reg94 <= $signed((8'hae));
            end
          else
            begin
              reg90 <= (^$unsigned(wire76[(4'h8):(3'h7)]));
              reg91 <= wire79;
              reg92 <= (($signed((wire81[(1'h0):(1'h0)] ?
                      {wire81,
                          wire79} : $signed(reg87))) >>> $signed((&reg86))) ?
                  (!(reg94 ? (~&(|reg94)) : reg88[(1'h1):(1'h0)])) : (+(reg94 ?
                      (~$unsigned(wire79)) : (+$signed(wire76)))));
            end
        end
      else
        begin
          reg83 <= (!((^$unsigned(((7'h41) ? (7'h42) : reg91))) ?
              reg94 : (($signed((8'hbf)) ?
                      reg87[(3'h5):(3'h5)] : (reg92 >= wire78)) ?
                  (reg91 >>> (|(7'h40))) : (^$unsigned(reg89)))));
          reg84 <= $unsigned($signed($unsigned($unsigned($unsigned(wire78)))));
          reg85 <= reg86;
          reg86 <= $unsigned({(|$signed($unsigned(reg85)))});
        end
      if ((((^~reg83) ?
              ($signed($unsigned(reg84)) ?
                  (wire80[(4'hd):(1'h1)] & reg94[(2'h2):(2'h2)]) : reg90[(4'hb):(4'hb)]) : ($signed({wire78,
                  reg93}) & reg83[(1'h0):(1'h0)])) ?
          (reg93 && reg84) : $signed((^(wire76 ?
              ((8'ha9) ? reg84 : reg84) : (wire79 ? reg90 : reg90))))))
        begin
          reg95 <= (reg92[(1'h1):(1'h0)] ?
              (wire76[(3'h6):(3'h5)] ?
                  (8'ha6) : wire80[(4'hd):(3'h6)]) : {((reg92 ?
                          $unsigned(reg92) : wire82) ?
                      ($signed(wire79) | {reg90}) : wire79)});
          reg96 <= (+(8'hb6));
          if ($signed((-(reg87 ^ $unsigned($unsigned(reg91))))))
            begin
              reg97 <= $unsigned(wire80);
              reg98 <= reg90[(5'h11):(2'h2)];
              reg99 <= $signed((($unsigned(reg84[(3'h4):(1'h1)]) && ($unsigned(reg93) << (reg89 >> (8'hb0)))) ?
                  reg90 : reg94[(1'h1):(1'h0)]));
              reg100 <= reg99;
            end
          else
            begin
              reg97 <= (($unsigned(((reg90 ?
                      reg99 : wire79) <= reg97[(2'h2):(2'h2)])) ?
                  reg89 : (~&{reg99[(2'h3):(2'h2)],
                      wire79})) == reg90[(4'h8):(3'h5)]);
              reg98 <= reg88;
              reg99 <= (-(|$signed((reg91 ? {(8'h9e)} : $unsigned(reg84)))));
              reg100 <= $signed(wire76);
            end
          reg101 <= (!(~&((!(8'ha8)) ?
              reg98 : ($unsigned(reg85) ? (wire76 >>> reg99) : wire79))));
        end
      else
        begin
          if (($unsigned($signed({(reg95 != reg99), $unsigned(reg87)})) ?
              reg85[(1'h0):(1'h0)] : reg86[(3'h6):(1'h0)]))
            begin
              reg95 <= reg94[(1'h0):(1'h0)];
              reg96 <= reg87;
              reg97 <= reg95;
            end
          else
            begin
              reg95 <= (wire82 | ({({wire79} >> (8'ha3))} ?
                  wire82 : wire79[(4'h8):(3'h5)]));
              reg96 <= (({reg89[(5'h10):(5'h10)]} < $signed((((7'h44) + reg92) || ((8'hb8) ?
                      wire82 : reg88)))) ?
                  $unsigned($signed(reg96)) : wire78);
            end
          reg98 <= {(((!$signed(wire81)) ?
                  wire77[(4'ha):(3'h4)] : $signed($unsigned(wire82))) ^ ({(reg93 ^ reg101)} >>> $unsigned(wire76))),
              (wire80[(4'hb):(1'h1)] ?
                  ((wire77[(3'h4):(1'h0)] << $unsigned(reg94)) ?
                      (~&$unsigned(wire81)) : {reg94[(2'h2):(1'h0)],
                          wire80}) : ((-{reg99,
                      reg93}) - $unsigned((~^(7'h40)))))};
          if ((~^(^~$unsigned(wire78))))
            begin
              reg99 <= (reg88 ?
                  $unsigned((((reg85 ? wire80 : reg101) || (reg83 ?
                          (8'hab) : (8'ha5))) ?
                      wire79[(2'h2):(2'h2)] : ((wire76 ^ (8'hb4)) <<< $signed(reg86)))) : (reg90 ?
                      $signed({wire77[(3'h4):(3'h4)],
                          $unsigned(reg96)}) : {$signed(wire79[(1'h0):(1'h0)]),
                          ((reg86 ? (8'hbe) : reg100) ?
                              (&reg84) : (wire80 ? reg101 : reg94))}));
              reg100 <= $signed($unsigned($unsigned(((8'ha5) <<< (!reg94)))));
              reg101 <= reg96[(4'he):(3'h5)];
              reg102 <= reg98;
              reg103 <= {(~|$signed($signed((reg85 <= reg89))))};
            end
          else
            begin
              reg99 <= ($unsigned($unsigned($unsigned((reg92 ?
                      (8'hbf) : reg93)))) ?
                  reg90[(4'hb):(3'h4)] : (8'hb4));
              reg100 <= reg92;
              reg101 <= wire79[(1'h1):(1'h0)];
              reg102 <= $signed($signed((wire77[(4'he):(3'h7)] - (~|{reg99,
                  reg94}))));
            end
          reg104 <= ((reg101[(3'h5):(1'h0)] | ($signed((wire82 ~^ wire82)) ~^ (reg88[(3'h5):(3'h4)] + {reg99,
                  (8'ha0)}))) ?
              $signed($unsigned(reg92[(4'h9):(1'h1)])) : $signed({{((7'h42) ~^ reg85),
                      (^reg98)},
                  ((|reg103) ? $signed(reg91) : reg95)}));
        end
      reg105 <= $unsigned(({(^reg83[(2'h2):(2'h2)])} ?
          (!reg104) : {$unsigned((wire82 ^ reg85)), $signed({wire79})}));
    end
  assign wire106 = ((8'hbb) == ({$signed((reg88 > (8'h9d))),
                       $signed(wire76)} >= (!$unsigned((-(8'hbe))))));
  assign wire107 = $unsigned(reg98);
  assign wire108 = (~^wire76);
  assign wire109 = $signed((!(wire76[(2'h3):(1'h0)] ?
                       $signed(wire78) : ($signed(reg101) ~^ (-reg85)))));
  assign wire110 = $signed($signed((8'ha2)));
  assign wire111 = (reg98 >= (~&(reg95[(1'h1):(1'h1)] ?
                       ($unsigned(reg92) ^ $unsigned(reg99)) : (wire107 ?
                           {wire81, wire80} : (~(7'h42))))));
endmodule

module module16
#(parameter param70 = ((~|(((|(8'ha3)) ^~ ((8'haf) ? (7'h44) : (8'hbb))) ? (^~((8'ha0) ^~ (7'h41))) : (8'hb0))) == (~|{{{(8'ha7), (8'hb0)}, {(8'ha5)}}, (((8'hb4) ? (8'hbe) : (8'hac)) != (^~(8'hba)))})), 
parameter param71 = ((param70 * (+(^{param70, param70}))) <= (^((^~(~&param70)) <= {(param70 ~^ param70)}))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire69,
                 wire67,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = wire19;
  assign wire23 = wire22;
  assign wire24 = ((|$unsigned(((wire17 ? wire21 : wire17) ?
                          (wire18 ^ wire17) : (~wire20)))) ?
                      $signed((~&(!wire23))) : (^wire23));
  always
    @(posedge clk) begin
      reg25 <= (8'hb5);
      reg26 <= (7'h41);
      reg27 <= {($signed($signed(wire22)) ?
              $signed(((wire22 | (8'ha3)) ?
                  {wire19,
                      reg25} : $signed(wire17))) : (wire22[(3'h4):(2'h2)] ^~ wire21[(3'h4):(1'h0)])),
          ($signed((^wire24)) & ($unsigned((~|wire23)) > {(wire24 ?
                  wire23 : wire18),
              $signed(wire19)}))};
    end
  assign wire28 = ((~^(($signed(reg26) < wire22) ?
                          ($signed(wire22) + $unsigned(wire21)) : ((reg26 + wire18) * $unsigned(wire21)))) ?
                      $signed((($signed((8'ha7)) ?
                          wire19 : wire20) > wire23)) : $signed(wire21[(1'h0):(1'h0)]));
  module29 #() modinst50 (.y(wire49), .wire31(wire18), .wire30(wire24), .clk(clk), .wire32(wire19), .wire33(wire20), .wire34(reg25));
  assign wire51 = (+$unsigned($signed(($unsigned(wire49) < (reg26 ?
                      wire49 : reg25)))));
  assign wire52 = wire23;
  assign wire53 = (^(($signed(wire17) ?
                          wire17[(3'h6):(1'h0)] : $signed((wire49 ?
                              wire23 : (8'hbb)))) ?
                      (^~reg26[(3'h6):(2'h3)]) : $signed(wire22[(4'ha):(2'h3)])));
  assign wire54 = wire51;
  assign wire55 = $signed($unsigned((8'hb7)));
  assign wire56 = $unsigned(reg27);
  module57 #() modinst68 (wire67, clk, reg26, reg27, reg25, wire17, wire52);
  assign wire69 = $signed(wire18[(4'hb):(4'h8)]);
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(4'h9):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire signed [(3'h5):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  assign y = {wire66, wire65, wire64, wire63, (1'h0)};
  assign wire63 = (^~wire61);
  assign wire64 = wire61;
  assign wire65 = $signed(wire63[(4'ha):(2'h3)]);
  assign wire66 = (((wire63[(4'ha):(3'h6)] <<< $unsigned(wire61)) ?
                          $unsigned($signed((&(8'hbf)))) : wire62[(3'h5):(2'h2)]) ?
                      wire63[(2'h2):(1'h0)] : $signed(($signed((-wire59)) & wire59)));
endmodule

module module29
#(parameter param47 = ((({(^(8'hb1))} + (-((7'h41) ? (8'had) : (8'h9d)))) << ((!(8'hb7)) ? {((8'hb8) ^ (8'hb1)), {(8'ha7)}} : (((8'hba) ? (8'ha9) : (8'hbe)) ? ((8'ha1) <= (8'hb7)) : ((8'haa) || (8'ha3))))) ? ({{{(8'hb2), (7'h44)}}, (7'h42)} <= (~^(((8'hb7) ? (8'hb7) : (8'hae)) ? ((8'hb1) ? (8'hb1) : (8'ha9)) : (!(8'ha5))))) : {(^(((8'hba) != (8'ha6)) >= ((8'hbd) | (8'ha4))))}), 
parameter param48 = param47)
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg40,
                 (1'h0)};
  assign wire35 = $signed({{($signed(wire31) ? (~wire34) : $unsigned(wire30)),
                          {(wire30 >= wire34)}}});
  assign wire36 = $unsigned($unsigned($signed((((8'hb2) && wire35) ^~ $signed(wire34)))));
  assign wire37 = (({$unsigned(wire35),
                      $signed($unsigned(wire32))} < ({$signed(wire35)} ?
                      $unsigned(wire34[(5'h11):(4'h9)]) : (~|(-wire33)))) - {$signed(((wire30 ?
                          wire33 : wire31) > (wire33 == wire36))),
                      wire35[(4'hf):(3'h7)]});
  assign wire38 = (^~$signed((((wire36 ? wire30 : (8'ha5)) ?
                      wire33 : (wire36 * wire33)) * ((~wire32) - wire37))));
  assign wire39 = $signed($unsigned($signed($signed((~wire36)))));
  always
    @(posedge clk) begin
      reg40 <= $unsigned(wire30);
    end
  assign wire41 = {{$unsigned((wire35[(3'h5):(2'h3)] ?
                              wire32 : $unsigned(wire36))),
                          (((-(8'ha3)) ? $unsigned(wire33) : (!wire37)) ?
                              ((~^reg40) ?
                                  (wire30 <= wire38) : $unsigned(wire33)) : ((8'haf) < (wire30 <= (8'hb7))))},
                      ((-($unsigned((8'hab)) + $unsigned(wire32))) >>> {(8'ha5)})};
  assign wire42 = wire36;
  assign wire43 = wire32[(5'h11):(2'h2)];
  assign wire44 = wire30;
  assign wire45 = ($signed((+$unsigned($signed(wire44)))) ? reg40 : wire42);
  assign wire46 = {(~&$unsigned(wire35[(2'h3):(2'h2)]))};
endmodule
