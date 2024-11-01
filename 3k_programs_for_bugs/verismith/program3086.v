module top
#(parameter param131 = ((((-(!(8'ha6))) ? {(8'hb7), ((8'hb9) <= (8'hbe))} : (8'hbf)) && ((!((8'hb1) >= (8'hb3))) ? (^{(8'ha8), (8'hbe)}) : (~((8'hbe) != (8'hbf))))) ? (((~&((8'hbe) ? (7'h44) : (8'hbd))) ? (~^((8'hbe) & (8'hb2))) : ({(8'ha3)} ^~ ((8'hbd) ? (8'ha2) : (8'h9c)))) && (({(8'hae), (8'ha1)} >> (&(8'hb1))) ? (((8'hbd) ^~ (8'hb0)) ? ((8'h9d) ? (8'hb4) : (8'ha5)) : {(8'ha9), (8'h9f)}) : {(~^(7'h42)), (~^(8'haf))})) : ((-((8'hb2) + {(8'hba), (8'hb1)})) ? (+(-((8'ha3) ? (8'hae) : (8'haf)))) : (&(8'hb9)))), 
parameter param132 = {(|(7'h42))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire129;
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  assign y = {wire120,
                 wire117,
                 wire115,
                 wire83,
                 wire81,
                 wire65,
                 wire7,
                 wire6,
                 wire5,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 reg84,
                 reg85,
                 reg86,
                 reg119,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h1)];
  assign wire6 = ($signed(wire4[(2'h2):(1'h1)]) << (8'ha6));
  assign wire7 = (wire2[(2'h2):(2'h2)] ?
                     {(7'h44), (wire3 | (~(wire1 <= wire3)))} : $signed(wire3));
  module8 #() modinst66 (.wire12(wire3), .y(wire65), .wire9(wire6), .wire11(wire5), .clk(clk), .wire10(wire0));
  module67 #() modinst82 (.wire69(wire6), .wire71(wire0), .clk(clk), .wire68(wire5), .y(wire81), .wire70(wire7));
  assign wire83 = $signed($unsigned((~|wire65[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg84 <= ((wire81 ?
              {(|wire3[(4'h9):(3'h6)])} : $unsigned((wire0 ~^ ((8'ha9) ?
                  wire6 : wire2)))) ?
          wire83[(2'h2):(2'h2)] : $signed($unsigned($signed((~|wire83)))));
      reg85 <= wire2[(2'h2):(1'h0)];
      reg86 <= wire65[(4'hb):(3'h6)];
    end
  module87 #() modinst116 (wire115, clk, wire65, wire2, wire81, reg84, wire4);
  module15 #() modinst118 (wire117, clk, wire65, wire0, wire5, wire81, reg86);
  always
    @(posedge clk) begin
      reg119 <= (wire2[(1'h0):(1'h0)] ?
          $unsigned(({(|reg84),
              wire115} != (wire81 <<< $signed(wire81)))) : (wire2 ?
              (|$signed($unsigned(wire3))) : ((~&$unsigned((8'hac))) ?
                  $unsigned($unsigned(wire2)) : (&(wire7 ? reg85 : wire5)))));
    end
  module87 #() modinst121 (wire120, clk, wire3, wire115, wire117, wire7, wire65);
  assign wire122 = $signed((($unsigned((wire1 || (8'hac))) | wire120) ?
                       {wire120} : wire7));
  assign wire123 = (wire7[(1'h0):(1'h0)] - (7'h41));
  assign wire124 = $signed((-($signed(((8'hb6) ?
                       (8'hb2) : wire122)) ~^ $unsigned(reg119[(2'h3):(2'h2)]))));
  assign wire125 = reg84[(1'h0):(1'h0)];
  assign wire126 = wire115;
  assign wire127 = $unsigned($unsigned(($signed(wire5) ?
                       ((~reg86) ?
                           $signed((8'ha3)) : (wire81 ?
                               wire2 : (8'hb9))) : $signed($unsigned(wire125)))));
  assign wire128 = {(8'h9d)};
  module39 #() modinst130 (.wire40(wire115), .wire42(wire65), .wire41(wire127), .clk(clk), .y(wire129), .wire43(reg86));
endmodule

module module87
#(parameter param113 = {((!(8'hbe)) ? ((((8'hbf) ? (8'hbc) : (8'ha1)) ? ((8'hb0) == (8'ha6)) : {(8'ha0), (8'h9c)}) || (((8'hb8) && (8'hb8)) <<< ((8'h9d) ? (7'h41) : (8'ha5)))) : (((!(8'ha6)) ^ ((8'ha0) ? (8'ha1) : (8'h9f))) ? ((8'hb9) >= (|(8'hb0))) : (!(7'h41)))), {(!(((8'hb3) ? (8'ha8) : (8'haf)) ? ((8'hbf) == (8'hb2)) : (^(8'hac))))}}, 
parameter param114 = ((^(param113 ? {{param113, param113}} : ((param113 ? param113 : (8'hb1)) ? (!param113) : (~^param113)))) < (|(|(~((8'ha2) <= param113))))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  input wire signed [(3'h6):(1'h0)] wire90;
  input wire [(3'h6):(1'h0)] wire89;
  input wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
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
                 (1'h0)};
  assign wire93 = (wire89 || ($signed(($unsigned(wire88) ?
                      wire89[(2'h2):(1'h0)] : (wire89 ?
                          wire92 : wire89))) >= (+((wire89 ?
                      wire90 : wire88) >> $unsigned(wire91)))));
  assign wire94 = wire91;
  assign wire95 = {wire93[(3'h6):(2'h2)], wire94[(4'h9):(4'h8)]};
  always
    @(posedge clk) begin
      reg96 <= wire95[(3'h5):(1'h1)];
      reg97 <= reg96[(3'h6):(3'h6)];
      if ((!wire92[(4'hb):(1'h1)]))
        begin
          reg98 <= $signed($unsigned((~&$signed($signed(wire92)))));
          reg99 <= ((7'h40) ?
              reg98 : $signed(((&$signed(wire89)) ?
                  ({(8'ha7), reg97} ?
                      wire91 : ((8'had) != (8'ha2))) : ($unsigned(wire92) ?
                      $unsigned(reg97) : $signed(wire90)))));
          if ($signed(($signed((wire93[(3'h5):(2'h3)] | $signed(reg96))) <<< (wire91 >>> (~|(~&wire90))))))
            begin
              reg100 <= (wire90[(2'h3):(2'h2)] <<< (8'ha2));
              reg101 <= ($unsigned((~^wire95[(3'h6):(3'h5)])) ?
                  (8'hb7) : (8'hab));
              reg102 <= reg100;
            end
          else
            begin
              reg100 <= wire93[(3'h7):(3'h4)];
              reg101 <= ($signed(((!$unsigned(reg96)) * {(^~wire89)})) >> wire91[(1'h0):(1'h0)]);
              reg102 <= {(reg102 ?
                      (reg97 < (+(reg101 < reg101))) : wire93[(3'h5):(2'h2)])};
            end
          reg103 <= (wire88 <<< reg97[(1'h0):(1'h0)]);
          reg104 <= (&(-{reg102[(3'h5):(2'h2)]}));
        end
      else
        begin
          reg98 <= (8'h9d);
          reg99 <= ((($signed($unsigned(reg97)) <= (~(8'hbe))) ?
                  {{(8'hb8), {(8'hba), reg96}},
                      {$unsigned(reg100)}} : $signed($signed((8'hb4)))) ?
              $signed($signed(reg103[(5'h10):(2'h2)])) : ($unsigned($unsigned(reg98)) & $unsigned(($unsigned((8'hae)) * {wire92,
                  reg98}))));
        end
      if ($unsigned($unsigned({reg96})))
        begin
          if (reg104[(2'h3):(1'h1)])
            begin
              reg105 <= wire89;
              reg106 <= (^reg101[(3'h7):(2'h2)]);
              reg107 <= reg104[(2'h2):(1'h1)];
              reg108 <= reg101;
            end
          else
            begin
              reg105 <= (wire94[(1'h1):(1'h0)] >> ($signed(((wire91 ?
                      reg106 : reg98) <<< {reg107})) ?
                  (+(!$unsigned(reg100))) : wire95));
              reg106 <= $unsigned((|(~&$signed($signed(reg105)))));
              reg107 <= ((wire89 << $unsigned($unsigned($signed(wire93)))) ?
                  ((~|{(wire94 ? reg97 : reg105)}) ?
                      ({$signed((8'hb0)), {wire88, reg103}} * (&{reg102,
                          wire89})) : ($signed(reg106) ?
                          (~&$signed(reg108)) : wire88)) : (($unsigned(((8'hac) >= (8'hb6))) < (8'hba)) ?
                      (reg98[(1'h1):(1'h1)] ?
                          wire91[(1'h0):(1'h0)] : $signed($signed(reg107))) : (+$unsigned({reg106}))));
            end
          reg109 <= $unsigned($unsigned((((8'h9c) ?
              {(8'had)} : (8'hb9)) <= {(&reg96)})));
          reg110 <= {$unsigned(($signed($unsigned((8'hac))) ?
                  (8'hb7) : (|$unsigned(reg97))))};
          reg111 <= reg102;
        end
      else
        begin
          reg105 <= ($signed(($unsigned((reg111 ?
                  (8'hba) : wire89)) >> {(reg107 ? wire94 : reg96),
                  (^~(8'hbe))})) ?
              $signed($unsigned(((reg105 != reg111) - (|reg104)))) : reg100);
        end
      reg112 <= $unsigned((^{$signed(((8'hbb) ? wire93 : (8'h9f))),
          ((^~reg104) + (~reg98))}));
    end
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire signed [(5'h13):(1'h0)] wire69;
  input wire signed [(5'h11):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = (~^(wire71 & $signed($unsigned(((8'hae) ?
                      wire71 : wire68)))));
  assign wire73 = $unsigned((-(^~wire71)));
  assign wire74 = wire70[(2'h2):(2'h2)];
  assign wire75 = (($signed(wire70[(2'h3):(2'h3)]) ? wire71 : $signed(wire69)) ?
                      ((wire70[(2'h2):(1'h0)] + (|(wire69 - wire68))) * (~(((8'hb4) ?
                              wire69 : wire74) ?
                          $unsigned(wire69) : wire74[(3'h4):(1'h1)]))) : ((^~wire74[(3'h5):(3'h5)]) >>> $signed(((~|wire68) ?
                          $unsigned(wire72) : $signed(wire69)))));
  assign wire76 = wire68;
  assign wire77 = wire70[(1'h0):(1'h0)];
  assign wire78 = wire72;
  assign wire79 = $unsigned((((&wire77[(1'h1):(1'h1)]) ?
                      (((8'ha4) | wire76) < (wire76 ?
                          wire76 : wire78)) : ((wire70 * wire71) << wire74)) >= wire76[(2'h3):(2'h3)]));
  assign wire80 = $signed((wire78[(1'h0):(1'h0)] ?
                      ((wire68 ~^ $unsigned(wire69)) || (wire69 ?
                          wire74[(1'h0):(1'h0)] : (wire79 ?
                              wire75 : (8'hb0)))) : (wire79[(1'h1):(1'h0)] + $unsigned((-(8'hbd))))));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire32;
  assign y = {wire64,
                 wire63,
                 wire61,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire13,
                 wire14,
                 wire32,
                 (1'h0)};
  assign wire13 = $unsigned(wire10);
  assign wire14 = (^$unsigned($unsigned(wire11)));
  module15 #() modinst33 (wire32, clk, wire12, wire11, wire10, wire13, wire14);
  assign wire34 = $signed((+(wire12[(1'h0):(1'h0)] ?
                      wire10 : wire10[(4'hf):(3'h4)])));
  assign wire35 = $unsigned(({{$unsigned(wire10)},
                      (+wire11)} ^ ($unsigned(wire32) ?
                      wire9[(2'h2):(2'h2)] : $signed(wire34))));
  assign wire36 = $signed((+{$signed((|wire34)), $signed({wire13, (8'hb5)})}));
  assign wire37 = ((^(wire12 ? (~(^~wire12)) : $unsigned($signed(wire35)))) ?
                      $signed(((-((8'hbb) ? wire12 : wire11)) ?
                          $unsigned(wire36) : wire35[(1'h0):(1'h0)])) : wire9);
  assign wire38 = wire10[(3'h5):(3'h5)];
  module39 #() modinst62 (.clk(clk), .wire42(wire32), .y(wire61), .wire40(wire37), .wire43(wire13), .wire41(wire9));
  assign wire63 = (8'hbd);
  assign wire64 = (^wire13[(3'h5):(3'h5)]);
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire [(4'hb):(1'h0)] wire42;
  input wire signed [(3'h6):(1'h0)] wire41;
  input wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire44,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg46,
                 (1'h0)};
  assign wire44 = wire41;
  assign wire45 = $signed(($unsigned(((^wire43) ?
                          (&(8'h9c)) : wire44[(4'he):(4'ha)])) ?
                      ($unsigned($signed((8'ha5))) == $signed(wire42[(4'ha):(2'h3)])) : (7'h41)));
  always
    @(posedge clk) begin
      reg46 <= (8'hba);
    end
  assign wire47 = (wire43[(1'h0):(1'h0)] ?
                      {$signed(((wire42 ? wire42 : reg46) * (wire42 ?
                              (8'ha4) : reg46)))} : {$signed($unsigned((wire44 ?
                              wire45 : wire41)))});
  assign wire48 = ((~|$signed($unsigned($unsigned(wire47)))) || wire41);
  assign wire49 = (|((+$unsigned((wire44 > wire40))) ?
                      (!wire47[(4'h8):(3'h6)]) : wire45[(2'h2):(1'h1)]));
  assign wire50 = (wire41[(1'h0):(1'h0)] || $signed((|$signed($unsigned(wire42)))));
  always
    @(posedge clk) begin
      reg51 <= (reg46 ?
          $unsigned((8'hbe)) : ({$signed($signed(wire49))} ?
              $signed(($unsigned(wire45) && (8'hb1))) : {$unsigned((wire43 ?
                      (8'ha6) : (8'ha2))),
                  wire40[(4'hc):(3'h5)]}));
      reg52 <= $unsigned($unsigned(((reg51[(4'h9):(2'h3)] - $unsigned(wire42)) <<< wire50[(4'ha):(4'ha)])));
      reg53 <= (+$signed(($unsigned({(8'h9c)}) ?
          ({(8'hbd), wire42} ?
              (wire41 ? wire42 : wire43) : $unsigned(wire45)) : wire48)));
      reg54 <= ($signed((reg51[(4'h8):(2'h3)] + (^(^~reg51)))) ?
          ($signed($signed(wire49)) >= {((reg51 - wire49) ?
                  ((8'hae) ?
                      (8'had) : (8'ha7)) : reg46[(2'h3):(1'h0)])}) : ({wire43,
                  $signed((wire44 < wire50))} ?
              (wire42 ^ {$signed((8'hbf))}) : {wire44[(4'hf):(2'h2)]}));
      reg55 <= ($unsigned((&({wire40} ?
          wire47 : ((8'hb2) ? wire40 : wire43)))) ^~ wire50[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg56 <= ((8'hb1) ? wire45 : wire47);
      reg57 <= {wire49, (8'h9c)};
      reg58 <= (((((reg54 <= wire40) >>> (-reg52)) << $signed({reg51})) == wire44) ?
          $signed(reg57) : (^(reg57[(2'h2):(2'h2)] << wire44)));
      reg59 <= reg51;
      reg60 <= ({(~^wire50)} ?
          (~&(({wire48, (7'h40)} ? reg54[(1'h0):(1'h0)] : (wire48 << wire44)) ?
              $signed((wire48 ?
                  wire44 : wire42)) : $unsigned($signed(wire50)))) : (|$unsigned((7'h42))));
    end
endmodule

module module15
#(parameter param31 = (((((-(8'hbf)) + ((8'hb9) ? (8'hae) : (7'h43))) ? {((8'hbf) * (7'h44)), ((8'ha2) << (8'ha6))} : (((8'h9c) <<< (8'hb3)) ? ((8'ha0) ? (7'h40) : (8'hb8)) : ((8'hb1) | (7'h40)))) ? (+(~^(~(8'hbe)))) : (8'hb9)) ? (((&(~(8'ha0))) ? ({(8'h9c)} ? {(7'h40), (8'hb9)} : (~^(8'hb6))) : (((8'hb9) ~^ (8'hb9)) <= {(8'ha1), (8'hab)})) ? ((~&((8'ha5) >> (8'h9d))) <= {(+(8'haa)), (~&(7'h44))}) : (|((^~(7'h44)) == {(8'hb7), (8'hba)}))) : (({((8'hbb) ? (8'hb6) : (8'ha5)), ((8'hab) - (8'ha3))} ^ ((^(8'ha1)) ? (-(8'hbe)) : (~^(8'haf)))) ? ((((8'hb8) >> (8'hb5)) ? ((8'hb1) - (8'ha4)) : (|(8'ha0))) < {(~(8'ha3))}) : ((((8'hac) >= (8'hb4)) != (8'hbc)) & ({(8'ha5)} ? ((8'hb3) < (7'h43)) : (^(8'hb6)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg30,
                 reg29,
                 reg28,
                 reg25,
                 (1'h0)};
  assign wire21 = wire16[(2'h2):(1'h1)];
  assign wire22 = (8'hbe);
  assign wire23 = $unsigned(wire19[(3'h4):(2'h3)]);
  assign wire24 = $signed(((8'hb4) ?
                      $unsigned(($signed(wire23) <= ((8'ha6) & (8'hb5)))) : wire17));
  always
    @(posedge clk) begin
      reg25 <= wire20[(3'h5):(3'h4)];
    end
  assign wire26 = $signed(wire23[(4'hb):(4'hb)]);
  assign wire27 = (^$unsigned((!(wire20 ?
                      (~wire19) : (wire26 ? wire16 : wire24)))));
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire23);
      reg29 <= wire17[(3'h4):(1'h0)];
      reg30 <= ((wire22[(2'h2):(1'h0)] ?
          $signed(($signed(wire21) ? (+wire18) : {reg29})) : (wire23 ?
              reg28 : ((wire23 ? reg29 : wire21) ?
                  wire24[(2'h2):(2'h2)] : (wire18 << wire27)))) >= ((wire19[(4'h9):(3'h6)] <= wire24) ?
          (wire24 ?
              $unsigned((wire22 == wire22)) : $unsigned($unsigned(wire24))) : (reg28 ?
              ((wire21 ?
                  reg25 : wire24) || $unsigned(wire22)) : (^~$unsigned(wire21)))));
    end
endmodule
