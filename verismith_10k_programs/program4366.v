module top
#(parameter param126 = (({{((8'h9c) << (8'hab)), (~&(8'ha3))}, ((8'hb2) ? ((8'h9c) >>> (8'h9e)) : {(8'ha3), (7'h41)})} ? (-(~^((8'hab) ? (8'hbb) : (8'ha6)))) : (({(7'h40), (8'hae)} ? ((8'hb0) || (8'hb7)) : ((8'hae) != (8'ha7))) ? (((8'ha0) - (8'h9d)) >>> ((8'haa) < (8'hbd))) : ((8'ha8) ? ((8'h9c) >= (8'hba)) : {(8'hbd), (8'hb5)}))) + (((((8'ha6) >= (8'hbf)) && {(8'hba), (7'h41)}) ? (((8'hb1) >>> (8'hbe)) ? ((8'ha6) ? (8'ha9) : (8'hb0)) : ((8'hac) >= (7'h44))) : {((8'ha3) ? (7'h40) : (7'h43))}) ? (-(|(8'ha2))) : (({(8'hb8)} ? (-(8'hb1)) : ((8'hb6) * (7'h41))) ? {(&(8'ha6))} : (~^((8'hb3) - (8'hbb)))))), 
parameter param127 = (~&(param126 ? ((&(+param126)) != {(param126 + param126)}) : ((8'ha4) > param126))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire97;
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire110,
                 wire109,
                 wire106,
                 wire105,
                 wire100,
                 wire99,
                 wire4,
                 wire97,
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
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h1)];
  module5 #() modinst98 (wire97, clk, wire2, wire1, wire4, wire3, wire0);
  assign wire99 = $unsigned($signed({wire97[(1'h0):(1'h0)], wire4}));
  assign wire100 = {(^$unsigned(wire0[(3'h7):(3'h7)]))};
  always
    @(posedge clk) begin
      reg101 <= (($unsigned(wire100) == $signed(wire2)) ~^ $unsigned($unsigned({(wire97 ?
              wire99 : wire2)})));
      reg102 <= {({(wire4[(1'h1):(1'h1)] ?
                      ((8'ha7) > wire100) : $signed(wire1))} ?
              (8'hb1) : ((wire97[(1'h1):(1'h0)] >>> (reg101 ?
                  wire100 : wire97)) & wire97)),
          (^{wire4})};
      reg103 <= (({wire4[(4'h9):(2'h3)],
          (((8'ha5) < wire2) <= ((8'ha6) ?
              wire1 : wire99))} ^ $unsigned(wire100)) != $signed($signed(wire100)));
      reg104 <= $unsigned($signed(reg103));
    end
  assign wire105 = ($unsigned(wire100) == reg104);
  assign wire106 = wire97[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg107 <= reg102;
      reg108 <= $unsigned({$signed(reg102)});
    end
  assign wire109 = (8'hb8);
  assign wire110 = ({$unsigned((~&$signed(wire97)))} << (($unsigned(reg104[(4'hd):(3'h6)]) + $unsigned((wire2 ?
                           wire99 : reg108))) ?
                       wire100 : $signed(wire100)));
  always
    @(posedge clk) begin
      if ((~(((8'hbc) ?
          (~^wire97[(1'h1):(1'h1)]) : $unsigned((wire110 + wire100))) <= reg108)))
        begin
          reg111 <= wire4[(1'h0):(1'h0)];
        end
      else
        begin
          reg111 <= (-$unsigned(reg103));
          reg112 <= wire3[(1'h1):(1'h1)];
          reg113 <= $unsigned((~|(wire106[(2'h2):(1'h1)] <<< reg108[(3'h6):(2'h3)])));
          if ($signed($unsigned((((reg103 ? wire99 : wire2) ?
                  (+(8'ha8)) : reg108[(2'h2):(1'h1)]) ?
              ((reg108 ^ wire109) == (wire4 - wire3)) : wire106[(1'h1):(1'h0)]))))
            begin
              reg114 <= (($signed(wire3[(3'h7):(3'h5)]) ?
                  reg108[(3'h4):(2'h2)] : ($unsigned(wire99) != wire4)) < reg107);
              reg115 <= {($signed($unsigned((wire3 ?
                      wire99 : wire97))) ~^ $signed(wire109[(2'h2):(1'h1)])),
                  (8'hae)};
              reg116 <= $signed(wire100[(1'h0):(1'h0)]);
              reg117 <= ((($unsigned(((8'hac) ?
                      reg112 : reg107)) <= $unsigned((wire3 ?
                      reg107 : wire2))) >> {{$signed(wire0)}}) ?
                  $signed(({wire0, (wire97 ? (8'hbc) : wire0)} ?
                      (^~reg102[(5'h11):(4'hb)]) : {{wire106}})) : $signed($unsigned($signed(reg113[(1'h0):(1'h0)]))));
              reg118 <= (~^$signed((wire2 ?
                  ($signed(wire0) <<< ((7'h44) ?
                      wire109 : wire109)) : $signed(wire106[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg114 <= $unsigned((wire105 ?
                  {($unsigned(wire0) ? {reg107} : wire99),
                      $signed((~&reg102))} : {$unsigned((!wire2)),
                      $signed((reg114 <<< (8'hae)))}));
              reg115 <= (+((((wire105 ? wire110 : wire2) ?
                      (!reg103) : $signed(wire99)) || ((wire110 <= reg112) ~^ {wire106})) ?
                  {reg115, reg113[(3'h4):(2'h2)]} : (wire97[(3'h5):(1'h0)] ?
                      reg116 : wire100)));
            end
          reg119 <= wire105[(1'h0):(1'h0)];
        end
      reg120 <= $signed(reg107[(1'h1):(1'h1)]);
      reg121 <= reg102[(5'h11):(3'h7)];
    end
  assign wire122 = wire106;
  assign wire123 = (!reg121);
  assign wire124 = wire97;
  assign wire125 = reg121;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire95;
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire54,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire95,
                 (1'h0)};
  assign wire11 = (~|(8'ha6));
  assign wire12 = ($unsigned((wire8[(4'h8):(3'h4)] ^ {(|wire11)})) ?
                      $signed(wire8) : {($unsigned((+wire10)) <<< wire7)});
  assign wire13 = $unsigned($signed((-(wire9[(5'h11):(1'h1)] ?
                      wire8[(2'h3):(1'h0)] : {wire8, (8'ha4)}))));
  assign wire14 = wire7[(4'hc):(4'h8)];
  assign wire15 = (|({$signed(wire14[(4'h9):(2'h2)])} ?
                      (~^($signed(wire10) != $unsigned((8'hbc)))) : wire12[(3'h6):(2'h3)]));
  assign wire16 = $unsigned(wire13);
  assign wire17 = ((wire12[(2'h2):(2'h2)] ?
                      (($unsigned(wire8) ? $unsigned(wire10) : $signed(wire6)) ?
                          ((wire7 >>> wire11) ?
                              $unsigned(wire6) : wire6) : wire8) : $signed(wire12[(3'h7):(2'h3)])) >> (+$signed((~|(+wire14)))));
  assign wire18 = $signed($signed(wire16));
  assign wire19 = (((wire18 == wire11[(4'he):(1'h0)]) - wire9) ?
                      (wire14[(4'h8):(1'h1)] ?
                          wire16 : wire16[(3'h4):(2'h2)]) : (wire12[(2'h2):(1'h1)] ?
                          ($signed((~^wire10)) | {wire14[(4'h9):(4'h9)]}) : wire8[(5'h11):(4'h8)]));
  assign wire20 = wire15;
  module21 #() modinst55 (wire54, clk, wire10, wire12, wire14, wire16);
  assign wire56 = wire20;
  assign wire57 = {$unsigned($unsigned(wire14))};
  assign wire58 = ($signed((&$unsigned((wire10 ? (7'h42) : (8'hbc))))) ?
                      {{((wire14 ? wire13 : wire13) ?
                                  $unsigned(wire15) : (wire14 ?
                                      wire7 : wire12)),
                              ((wire20 ? wire57 : (8'haa)) == {(8'hb7),
                                  wire9})}} : $unsigned((wire9 ?
                          $unsigned(wire10[(3'h5):(1'h0)]) : $signed({wire56,
                              wire14}))));
  assign wire59 = {wire54};
  assign wire60 = wire58;
  assign wire61 = $unsigned($unsigned((($signed(wire58) >= ((8'hab) ?
                          wire6 : wire9)) ?
                      ($unsigned(wire18) ?
                          {wire58,
                              wire60} : $signed(wire19)) : wire12[(4'he):(3'h6)])));
  assign wire62 = ((wire19 ?
                          (~($unsigned(wire18) ?
                              (wire12 ?
                                  wire54 : wire15) : wire56)) : (~|{(wire60 & wire18)})) ?
                      ($signed(wire8) ? wire13 : wire11) : $unsigned(wire7));
  module63 #() modinst96 (wire95, clk, wire15, wire10, wire14, wire8, wire17);
endmodule

module module63
#(parameter param93 = ((((~^((8'hb9) ? (8'hb9) : (8'hac))) * (((8'haf) < (8'ha3)) ? {(7'h40), (8'ha5)} : ((8'ha3) ? (8'hbb) : (7'h42)))) ? (({(8'hb0), (8'h9f)} && ((8'haa) ? (8'hbd) : (8'ha9))) ? ((8'hab) <= ((8'hb0) ? (8'hb2) : (8'hbd))) : (~&((8'hb0) - (8'hb0)))) : ({((8'hb2) ? (8'hae) : (7'h43))} >> ({(8'hb8), (7'h40)} <<< ((8'hb7) == (8'hbf))))) ? {(|(|((8'haf) ? (8'hbc) : (8'haa)))), ((!((8'hbe) ^ (8'h9d))) ? ((^(8'ha0)) ? (^~(8'hb2)) : (|(7'h43))) : (((8'hab) ? (8'ha8) : (8'hbf)) ? ((8'haf) ? (8'hba) : (8'hb3)) : ((8'haf) & (8'hbf))))} : (((!((8'hbd) | (8'hbb))) << (+((7'h40) ? (8'ha2) : (7'h42)))) != ((-((8'h9d) - (8'hb4))) ^~ (^~((8'haa) ? (8'had) : (7'h40)))))), 
parameter param94 = (param93 & ((((param93 ? param93 : param93) ^~ (~^param93)) ? ((param93 - param93) ? ((7'h40) ~^ param93) : (8'hac)) : {(param93 | param93), (param93 + param93)}) <= {(param93 >> ((8'h9c) ? param93 : (8'hbf))), (param93 || {param93})})))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire68;
  input wire signed [(5'h13):(1'h0)] wire67;
  input wire signed [(5'h15):(1'h0)] wire66;
  input wire [(3'h6):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
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
                 wire71,
                 wire70,
                 wire69,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire69 = $signed((~($signed({(8'ha5), wire64}) ?
                      $unsigned((wire64 >= wire68)) : wire66)));
  assign wire70 = (wire64[(1'h0):(1'h0)] ? wire67[(5'h10):(1'h1)] : wire65);
  assign wire71 = wire64[(3'h4):(3'h4)];
  assign wire72 = (^~{$signed($signed(wire64))});
  assign wire73 = $signed(((-$signed(wire72[(4'hc):(1'h0)])) >> (~^(wire71 ?
                      wire67 : wire71))));
  assign wire74 = $signed({wire71[(3'h6):(1'h0)],
                      ($unsigned($signed((8'ha8))) ?
                          ((-wire64) ?
                              (wire66 && (8'ha8)) : (wire66 < wire67)) : {$unsigned(wire68),
                              wire67})});
  assign wire75 = (+((($signed((8'ha6)) ? (^wire71) : $signed(wire69)) ?
                          $unsigned($unsigned(wire73)) : $unsigned((wire74 ?
                              wire70 : (7'h42)))) ?
                      {wire74[(4'hc):(2'h3)]} : {{(wire66 >= wire68), wire74},
                          (~^(wire74 ? wire72 : wire73))}));
  assign wire76 = (wire74 && (8'hb1));
  assign wire77 = $unsigned($signed((((~^(8'h9d)) + {wire69}) || wire70)));
  assign wire78 = (($signed((wire65 ? {wire70, wire69} : (wire75 & wire77))) ?
                      $unsigned((^{wire72,
                          wire73})) : $unsigned(wire72[(1'h0):(1'h0)])) + (~^wire74[(4'h8):(1'h1)]));
  assign wire79 = {$signed(wire69)};
  assign wire80 = wire65[(1'h0):(1'h0)];
  assign wire81 = (($signed(($unsigned(wire74) ^~ wire73)) >= (+$unsigned($signed(wire78)))) << {wire69,
                      $unsigned(wire79)});
  assign wire82 = $unsigned($signed($signed(wire69[(4'ha):(2'h3)])));
  assign wire83 = {((8'hb1) | wire71),
                      ((|wire82) ?
                          (~wire73) : $signed((!wire68[(4'h8):(2'h3)])))};
  assign wire84 = wire73;
  assign wire85 = ({((wire80 ? (|wire67) : $signed(wire72)) >>> wire84)} ?
                      (~^{wire76[(2'h2):(1'h1)],
                          (~&$signed((7'h40)))}) : $unsigned($unsigned(wire83[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg86 <= ((wire69[(4'h8):(3'h7)] << ($signed(wire79) ?
          ($unsigned(wire77) + ((7'h41) ?
              wire67 : (8'hbd))) : $unsigned((8'hb7)))) ~^ wire74);
      reg87 <= (~^$unsigned(wire76));
      reg88 <= $signed($unsigned((-$unsigned(wire83[(3'h6):(3'h6)]))));
      reg89 <= ($unsigned({(8'ha8),
              (wire73[(1'h1):(1'h0)] ?
                  (wire82 >>> (8'hb2)) : wire79[(1'h1):(1'h0)])}) ?
          $signed(({wire76[(1'h0):(1'h0)],
              wire64} ~^ (&$signed(wire84)))) : wire82[(4'h9):(4'h9)]);
    end
  assign wire90 = ((-(^{(~|wire66)})) ?
                      $unsigned(wire66[(3'h4):(2'h3)]) : ($unsigned({$signed(reg88)}) ?
                          (8'had) : {((|wire66) >= wire67)}));
  assign wire91 = (~&$signed((wire82[(2'h3):(2'h3)] ?
                      (wire83 ?
                          $signed(wire77) : (reg87 != wire68)) : (~$signed(wire82)))));
  assign wire92 = wire79;
endmodule

module module21
#(parameter param52 = (~|{(8'ha3), ({((8'hb7) == (7'h43))} << ({(7'h42), (8'ha7)} ? (+(8'ha2)) : ((8'hbe) ? (8'hb5) : (8'hb8))))}), 
parameter param53 = {(~^(({(8'had), param52} ? (param52 ? param52 : param52) : (param52 ^~ param52)) ? ((param52 - param52) ? param52 : (~|param52)) : param52))})
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire51,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg50,
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
                 (1'h0)};
  assign wire26 = $unsigned(wire24[(4'h9):(1'h0)]);
  assign wire27 = $unsigned((^$signed((|(wire22 & wire24)))));
  assign wire28 = wire23[(4'hd):(3'h6)];
  assign wire29 = (!$signed($signed($signed((wire23 ? (8'hae) : wire28)))));
  assign wire30 = {(^~{wire27[(4'he):(4'ha)]}), $unsigned(wire24)};
  assign wire31 = (+($unsigned((^~wire29[(2'h2):(1'h1)])) >= $signed({{wire24}})));
  assign wire32 = wire29;
  assign wire33 = wire22[(3'h4):(2'h3)];
  assign wire34 = ($signed((wire29 ?
                      (8'h9e) : wire33[(4'hc):(2'h2)])) != ({((wire24 >= wire23) > ((8'h9f) || (7'h40))),
                          $signed($signed(wire25))} ?
                      ({{(8'h9f), wire25}} ?
                          ((+(8'hb9)) == (wire26 >>> wire22)) : ({wire22,
                                  wire30} ?
                              $unsigned(wire28) : (wire25 >> (8'haf)))) : wire30[(4'ha):(1'h0)]));
  assign wire35 = ((wire22 ?
                          $signed(((wire23 ?
                              wire25 : wire34) + wire29)) : wire26) ?
                      (|wire33[(3'h5):(2'h2)]) : ((~&{(wire29 ?
                              wire34 : wire24)}) != {$unsigned($signed(wire24))}));
  always
    @(posedge clk) begin
      reg36 <= wire23;
      if ((wire23[(4'ha):(4'h8)] & wire28))
        begin
          reg37 <= (~^$unsigned((wire26[(2'h2):(2'h2)] || ((wire25 ?
              wire30 : wire33) != wire22[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg37 <= {{$unsigned(wire29),
                  $unsigned($signed((wire28 ? (8'h9d) : reg36)))},
              $unsigned({$unsigned($unsigned(wire28)),
                  ($unsigned(wire23) ? (!wire32) : reg36)})};
          reg38 <= (($signed((~|(wire24 || wire29))) ?
                  {{(-wire30), wire23}} : ($unsigned(wire32) ?
                      (~|(8'ha3)) : ({wire30, wire24} ?
                          wire29 : (wire27 > (8'hbb))))) ?
              {$signed((^$unsigned(reg37)))} : $unsigned((8'ha8)));
        end
      if (wire33)
        begin
          reg39 <= {$signed((7'h44))};
        end
      else
        begin
          reg39 <= (reg36 ?
              (reg36[(1'h0):(1'h0)] && {wire31[(2'h3):(2'h3)]}) : (^wire28[(2'h3):(1'h1)]));
          if (({(wire27 ? (&wire27) : (~wire35))} & {$signed(({wire22, wire23} ?
                  wire35 : wire30))}))
            begin
              reg40 <= ((~(!wire23[(4'hb):(4'h9)])) ?
                  (^$signed(reg37[(2'h2):(2'h2)])) : ((8'hb4) ?
                      {(reg38 ?
                              (wire28 << wire23) : $signed(wire29))} : {$unsigned((&wire31))}));
              reg41 <= (({$unsigned($unsigned(wire35))} >> $signed((|$unsigned((8'hbb))))) * $unsigned(wire30));
              reg42 <= ((reg38 >>> {((!wire27) ? $unsigned(wire23) : wire33)}) ?
                  ($signed((^~(8'hb7))) ?
                      {((~reg40) ? reg40 : $unsigned(reg38)),
                          {$signed(wire34)}} : wire29) : wire26[(3'h6):(3'h6)]);
              reg43 <= reg40;
            end
          else
            begin
              reg40 <= $signed(wire34);
              reg41 <= ((wire25[(1'h1):(1'h1)] < (~^{{(8'had)}, (^reg38)})) ?
                  $unsigned({reg43[(2'h2):(1'h1)]}) : (wire31[(1'h0):(1'h0)] && reg36[(1'h1):(1'h1)]));
              reg42 <= reg42;
              reg43 <= (wire33 && $unsigned((wire27 ?
                  (|(wire32 ? reg42 : wire35)) : wire32)));
              reg44 <= wire31;
            end
          reg45 <= $signed(((|{wire32[(5'h11):(5'h11)],
              $unsigned(wire31)}) == $signed((^(wire33 <<< reg38)))));
          reg46 <= (&((&(^$signed((8'hba)))) >>> {$unsigned((reg40 & wire32))}));
          if (wire25[(1'h1):(1'h0)])
            begin
              reg47 <= $signed((|$signed(reg43[(3'h4):(2'h2)])));
              reg48 <= (+$signed(reg37));
              reg49 <= $unsigned(reg36);
            end
          else
            begin
              reg47 <= (~$signed((reg43 ?
                  $unsigned($signed((8'ha7))) : $unsigned($signed(wire35)))));
              reg48 <= wire26[(4'he):(3'h6)];
              reg49 <= $signed(wire22);
            end
        end
      reg50 <= (reg48[(4'hf):(4'hc)] ?
          $unsigned($unsigned(wire28[(3'h5):(1'h0)])) : $signed({({wire29,
                      wire32} ?
                  {wire24} : reg41[(3'h4):(1'h1)]),
              ((!reg38) ? $unsigned(wire33) : reg40[(2'h3):(1'h1)])}));
    end
  assign wire51 = (&wire30);
endmodule
