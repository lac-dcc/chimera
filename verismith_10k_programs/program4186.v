module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire128;
  wire [(4'h9):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire120;
  wire [(5'h15):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire126;
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  assign y = {wire128,
                 wire123,
                 wire39,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire41,
                 wire42,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire125,
                 wire126,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  assign wire5 = ({$unsigned($unsigned((~&wire4)))} ?
                     (+wire4) : $unsigned((((wire3 || (8'hba)) ?
                         {(8'hb6),
                             wire0} : wire4) ^~ ($unsigned(wire4) || wire4))));
  assign wire6 = (({{(wire4 ? wire3 : wire0)}, wire5} ? wire1 : wire0) ?
                     $unsigned(($signed(wire5) ?
                         $unsigned($unsigned(wire4)) : (8'ha8))) : wire3[(4'hb):(4'h8)]);
  assign wire7 = $unsigned(wire5[(3'h7):(3'h5)]);
  assign wire8 = wire6;
  assign wire9 = (wire2[(2'h2):(2'h2)] ?
                     $signed($signed(wire8)) : wire5[(4'h8):(2'h3)]);
  assign wire10 = {((wire4 ? (-wire4) : wire8) ? wire7[(2'h2):(2'h2)] : wire5),
                      $signed((($signed(wire3) < wire4[(2'h2):(1'h1)]) ?
                          (8'hab) : (~|$unsigned(wire7))))};
  assign wire11 = wire7[(2'h2):(2'h2)];
  module12 #() modinst40 (wire39, clk, wire1, wire9, wire6, wire0, wire11);
  assign wire41 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire42 = (-$signed(wire0[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg43 <= $unsigned(wire2[(3'h6):(3'h4)]);
      reg44 <= (+$signed($unsigned($unsigned((wire7 ? wire5 : wire6)))));
      reg45 <= (&(|$signed(wire1)));
    end
  module46 #() modinst118 (wire117, clk, wire9, wire5, wire39, reg44, wire6);
  assign wire119 = {{(&wire0[(2'h3):(2'h3)]), (~|(wire2 | wire42))}, wire3};
  assign wire120 = ((~(!$signed($unsigned(wire11)))) ?
                       (+(~$unsigned((~^wire0)))) : (($signed(wire0[(4'h8):(1'h0)]) ?
                           ((wire3 ?
                               wire2 : wire42) & (~|(8'haa))) : ($unsigned(wire10) * wire10)) | reg43));
  module12 #() modinst122 (wire121, clk, wire3, wire42, wire4, wire119, wire11);
  module46 #() modinst124 (.wire51(wire120), .y(wire123), .wire50(wire117), .wire48(wire1), .wire49(wire2), .wire47(wire11), .clk(clk));
  assign wire125 = ((|($signed((wire3 && (8'hbf))) - (+(wire7 ?
                       wire7 : (8'h9c))))) ~^ $signed($signed($unsigned($unsigned(wire5)))));
  module19 #() modinst127 (wire126, clk, wire5, wire6, wire119, wire41, wire42);
  assign wire128 = $unsigned(wire123[(4'h9):(3'h5)]);
endmodule

module module46
#(parameter param115 = ((((((8'hb6) == (7'h44)) ? ((8'ha6) + (7'h40)) : {(8'hb6)}) ? (((7'h44) ^ (8'hac)) < {(8'ha5)}) : ((8'h9d) ? ((8'hb4) ? (8'haa) : (8'hb5)) : (~(8'hbf)))) > (((8'haf) ~^ (|(8'ha7))) ? ((&(8'haa)) ? ((8'hbe) ? (8'hbc) : (8'hbd)) : (|(8'ha4))) : (~^((8'haf) ? (8'ha1) : (8'hb5))))) ? (^~{(~((8'h9c) ? (7'h44) : (8'ha3)))}) : ((-(~&(&(8'hbe)))) ? {{((7'h44) ? (8'ha6) : (8'ha1)), ((8'hb4) ? (8'ha5) : (8'ha7))}, ({(8'hbc), (8'hb7)} - ((8'ha9) && (8'ha5)))} : (7'h42))), 
parameter param116 = param115)
(y, clk, wire47, wire48, wire49, wire50, wire51);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire47;
  input wire [(2'h2):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire88;
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  assign y = {wire113,
                 wire52,
                 wire53,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire88,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire52 = $unsigned((wire49 >= wire47[(3'h5):(3'h4)]));
  assign wire53 = $signed(wire51[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg54 <= $unsigned((^$unsigned((~^wire50[(1'h1):(1'h0)]))));
      reg55 <= wire49;
      reg56 <= {$unsigned($unsigned(((wire51 ? wire52 : (8'hb8)) << (wire51 ?
              reg54 : reg55))))};
      reg57 <= $signed((($unsigned($signed(reg54)) != ((wire51 ?
              wire53 : wire50) != $signed(wire47))) ?
          reg56 : wire49));
    end
  assign wire58 = ((wire52 ?
                      wire53 : $signed($unsigned((wire53 * wire52)))) ^~ $signed((+$signed((reg54 ?
                      reg57 : reg56)))));
  assign wire59 = ({{wire58[(3'h5):(1'h0)], (!wire48)}} ?
                      wire48 : ($unsigned(reg57) ?
                          $signed((~|$signed(reg56))) : (($signed(wire53) ?
                              $unsigned(reg54) : $signed(wire50)) && wire53)));
  assign wire60 = wire59;
  assign wire61 = $signed($signed(reg54[(4'ha):(4'ha)]));
  assign wire62 = (8'ha0);
  assign wire63 = (({(~^{reg54, reg57})} <= (wire59 ~^ ((~|reg54) <= ((8'had) ?
                          wire59 : wire58)))) ?
                      ({((wire59 | reg55) ?
                                  (wire47 ? wire61 : reg55) : $signed(wire58)),
                              $signed($signed(reg55))} ?
                          (wire60 ?
                              wire48[(1'h1):(1'h1)] : (~^{wire48,
                                  wire47})) : (8'hbc)) : (8'hbb));
  assign wire64 = $signed((wire47[(3'h5):(3'h5)] * $unsigned($signed((wire58 ?
                      (8'ha7) : wire60)))));
  always
    @(posedge clk) begin
      reg65 <= $signed((!(~|wire47)));
      reg66 <= wire59[(1'h1):(1'h1)];
    end
  module67 #() modinst89 (.clk(clk), .y(wire88), .wire70(reg56), .wire71(reg57), .wire69(wire52), .wire72(wire51), .wire68(wire53));
  module90 #() modinst114 (.clk(clk), .y(wire113), .wire94(wire59), .wire95(wire53), .wire92(reg56), .wire91(wire60), .wire93(wire50));
endmodule

module module12
#(parameter param37 = ({(!(~^((8'ha1) && (8'hbc))))} ? (~|(^~(&(|(8'hbc))))) : (8'ha0)), 
parameter param38 = (^~param37))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire33;
  assign y = {wire36, wire35, wire18, wire33, (1'h0)};
  assign wire18 = ({$signed({(wire17 ? wire13 : (8'hac)), (~^wire13)})} ?
                      ($signed((^~wire17)) ?
                          wire14[(2'h3):(2'h2)] : wire14[(2'h3):(2'h2)]) : ({$signed(wire15[(4'ha):(3'h6)]),
                              (!wire13[(4'he):(4'he)])} ?
                          $signed(wire13) : ($signed(((8'hb8) ?
                                  wire15 : wire14)) ?
                              wire16[(4'ha):(1'h1)] : {$signed(wire15)})));
  module19 #() modinst34 (.wire22(wire17), .wire21(wire13), .y(wire33), .wire24(wire16), .wire20(wire15), .wire23(wire18), .clk(clk));
  assign wire35 = ((-($unsigned((wire13 <<< wire14)) ^~ wire17)) && $unsigned($signed(wire18)));
  assign wire36 = $signed($signed($signed($unsigned($unsigned(wire14)))));
endmodule

module module19
#(parameter param31 = ((((~((8'h9e) ? (8'haf) : (8'hac))) >= (^~((8'hb7) << (8'ha9)))) << (((+(8'hae)) > (|(8'hbd))) >> {(|(8'ha7))})) ? ({(~&((8'ha0) != (8'hba)))} ? ((((8'ha7) == (8'hbe)) ? ((8'hb1) ? (8'hb7) : (8'hba)) : ((8'ha1) - (8'hb4))) ~^ ((|(8'ha9)) ? {(8'hbf), (8'ha4)} : (~&(8'haa)))) : (|(-{(8'hb2), (8'hbb)}))) : (~{(~^((7'h42) ? (8'hae) : (8'hb4)))})), 
parameter param32 = (~^param31))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  assign y = {wire30, wire29, wire28, wire27, wire26, wire25, (1'h0)};
  assign wire25 = $signed((({(~(8'hb2)), wire22} ?
                      (~&$signed(wire20)) : {(^wire22),
                          (wire23 > wire24)}) >>> $signed(wire21)));
  assign wire26 = (8'ha6);
  assign wire27 = wire25;
  assign wire28 = $unsigned($unsigned({((wire23 << wire26) ?
                          (wire23 >>> (8'hbf)) : wire21[(2'h3):(1'h0)])}));
  assign wire29 = (wire22 > {{($unsigned((8'haf)) ?
                              {wire20, wire28} : (wire22 != wire23)),
                          $unsigned($unsigned(wire21))},
                      ($unsigned(wire21) * wire28)});
  assign wire30 = $unsigned(wire27[(4'h9):(4'h8)]);
endmodule

module module90  (y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire [(5'h12):(1'h0)] wire94;
  input wire [(4'hd):(1'h0)] wire93;
  input wire signed [(3'h4):(1'h0)] wire92;
  input wire [(4'h9):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire109,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg110,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg96,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg96 <= wire91[(1'h0):(1'h0)];
    end
  assign wire97 = wire93;
  assign wire98 = (~|wire95[(2'h3):(2'h3)]);
  assign wire99 = $signed(wire97[(1'h0):(1'h0)]);
  assign wire100 = $signed($signed(((~|(wire93 ? wire91 : wire99)) ?
                       ((wire98 ? wire98 : wire99) ?
                           wire92 : $signed(reg96)) : $signed($signed((8'hae))))));
  assign wire101 = (wire91 <= $unsigned({(((7'h44) ? reg96 : (8'haa)) ?
                           (wire97 >> reg96) : $unsigned(wire94)),
                       ($unsigned(reg96) ~^ (wire99 ^ wire97))}));
  always
    @(posedge clk) begin
      reg102 <= wire95[(2'h3):(1'h0)];
      reg103 <= (~&reg96[(4'h9):(4'h8)]);
      if ((wire95[(2'h3):(2'h3)] + (wire100 ?
          $unsigned(({reg102,
              reg102} ~^ (8'hb9))) : (~|wire92[(2'h2):(1'h0)]))))
        begin
          reg104 <= ((wire93[(3'h4):(3'h4)] ?
              {$unsigned((reg102 || reg103))} : {wire95[(2'h3):(2'h3)],
                  $signed($unsigned(wire97))}) * wire101[(3'h6):(3'h5)]);
          reg105 <= (wire101 ?
              reg102 : (($unsigned($signed(wire95)) | $signed($unsigned(reg102))) ?
                  (((!wire101) <= reg96[(4'he):(3'h6)]) ?
                      (((8'h9f) ? wire92 : wire98) ?
                          (wire97 ?
                              reg96 : wire98) : $unsigned(reg103)) : wire100[(3'h7):(2'h3)]) : (wire99[(4'h8):(4'h8)] + $signed($signed(reg103)))));
          reg106 <= {(+$signed($signed($signed(wire91)))),
              {$signed($unsigned((reg96 * wire93))),
                  ($signed(reg105) ?
                      (^(wire94 ? (8'hb4) : wire94)) : $signed(((8'haa) ?
                          wire92 : wire94)))}};
        end
      else
        begin
          reg104 <= wire98;
          reg105 <= (reg105[(3'h4):(1'h0)] | wire92[(1'h1):(1'h0)]);
          reg106 <= ({(((~|wire98) ? $signed(wire100) : $unsigned((8'hb9))) ?
                  $signed($signed(wire99)) : reg96)} ~^ ($unsigned((&{wire98,
                  wire93})) ?
              (8'hbc) : $unsigned((wire97[(3'h6):(3'h6)] ?
                  $signed(wire101) : wire92))));
          reg107 <= $signed($signed($unsigned({(wire99 >= wire100)})));
          reg108 <= ((~&($signed($unsigned(wire91)) ?
                  wire95 : reg102[(2'h2):(1'h0)])) ?
              $unsigned({($unsigned(wire93) ?
                      {reg102, (8'hbc)} : (wire98 ?
                          reg106 : (8'haf)))}) : (~|reg102[(3'h7):(1'h0)]));
        end
    end
  assign wire109 = (wire92 ?
                       $unsigned(((reg108[(3'h5):(2'h3)] + reg107) + $signed($signed((8'ha7))))) : (((~^wire92) ?
                               $signed(reg104[(4'h8):(4'h8)]) : (&$unsigned(reg102))) ?
                           {wire98[(1'h0):(1'h0)]} : (reg96 ?
                               $unsigned((wire98 << (8'hb5))) : wire94)));
  always
    @(posedge clk) begin
      reg110 <= $unsigned((^~wire109[(4'ha):(4'h8)]));
    end
  assign wire111 = (((&(reg108[(3'h4):(3'h4)] ?
                       $unsigned(reg110) : (wire93 ?
                           reg108 : wire100))) << ((!(-wire99)) ?
                       wire91[(2'h2):(2'h2)] : wire98[(4'hb):(3'h4)])) >>> {$signed((wire91 ?
                           (^~wire92) : wire109))});
  assign wire112 = reg106[(5'h10):(4'hc)];
endmodule

module module67
#(parameter param86 = {(~|{(((8'hb2) <<< (8'h9e)) ? (~&(8'h9e)) : (|(8'hb3)))})}, 
parameter param87 = (!(8'ha3)))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire72;
  input wire [(4'hc):(1'h0)] wire71;
  input wire [(4'h8):(1'h0)] wire70;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire [(4'hc):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg85,
                 reg74,
                 reg73,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg73 <= wire69;
      reg74 <= (|(~&$unsigned(wire71[(3'h6):(1'h1)])));
    end
  assign wire75 = (wire71 ? reg73 : (8'hb6));
  assign wire76 = reg73;
  assign wire77 = $signed({(~|((^~wire70) ? {wire68} : {wire71, wire76})),
                      {{(!reg73)}}});
  assign wire78 = $signed((-(+((wire72 + wire77) ?
                      (wire69 >= (8'hb8)) : wire76[(2'h3):(2'h3)]))));
  assign wire79 = $signed(((~^wire68) ?
                      reg74[(3'h4):(3'h4)] : reg73[(3'h6):(3'h5)]));
  assign wire80 = (^~{{$unsigned((wire75 - wire72)),
                          ((wire68 && reg74) ^~ (&wire78))}});
  assign wire81 = (!(8'hb7));
  assign wire82 = $unsigned(wire72[(3'h6):(1'h1)]);
  assign wire83 = ((((~|{wire77, wire76}) ? wire70 : {((8'hb1) <<< wire78)}) ?
                          (&wire75[(3'h6):(3'h5)]) : (wire81 ?
                              ((wire75 & wire82) ?
                                  {reg74} : $unsigned(reg74)) : wire69)) ?
                      (wire70 ?
                          (($unsigned(reg74) ? (wire70 && wire69) : wire80) ?
                              ((wire81 < wire81) != $unsigned(wire77)) : ((^wire68) ?
                                  (wire80 | wire78) : $signed(wire79))) : {reg74}) : (~$signed(((-reg74) ?
                          wire82 : (8'h9e)))));
  assign wire84 = ($signed($unsigned(wire77)) ?
                      (7'h44) : wire72[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg85 <= ((!$signed($unsigned((wire83 > wire71)))) < (((~^{wire77,
          (8'ha2)}) & ((wire75 | wire83) & $unsigned(wire78))) == wire82));
    end
endmodule
