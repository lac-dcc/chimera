module top
#(parameter param167 = ((((&{(8'hba)}) ? (!((8'haf) ? (8'hb0) : (8'ha8))) : {((8'h9c) ^~ (8'ha7))}) > {{(^~(8'ha4))}, ({(8'hb0)} >>> (&(8'ha4)))}) ? (((((8'haa) ^~ (8'had)) ? ((8'ha7) * (7'h42)) : ((8'ha2) && (7'h41))) ~^ ((8'ha3) <<< (!(7'h43)))) | ((((8'hbb) << (8'hb5)) | (!(8'hb6))) >= (((8'hbe) == (8'ha4)) ? ((8'haa) ? (8'hb3) : (8'hb7)) : (8'ha8)))) : (((|{(8'h9e), (8'hbe)}) ? {{(8'hb7), (8'ha2)}} : (-{(7'h40)})) >= ((~{(8'hbf), (8'ha7)}) + (+((8'ha1) > (8'haf)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire165;
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  assign y = {wire162,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire61,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire5,
                 wire6,
                 wire7,
                 wire34,
                 wire164,
                 wire165,
                 reg63,
                 reg39,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = wire1;
  assign wire7 = $unsigned((~|(^((wire6 | wire4) ^~ $unsigned(wire6)))));
  module8 #() modinst35 (.wire12(wire4), .wire11(wire2), .y(wire34), .clk(clk), .wire10(wire3), .wire9(wire6), .wire13(wire1));
  assign wire36 = {$signed({wire34[(2'h2):(1'h0)]}),
                      (wire5[(1'h1):(1'h0)] <= $unsigned((wire6[(1'h0):(1'h0)] >= ((8'hb3) ?
                          wire34 : wire5))))};
  assign wire37 = $unsigned($signed((wire0 ?
                      {$signed(wire0), (!wire2)} : wire5[(1'h0):(1'h0)])));
  assign wire38 = {wire34};
  always
    @(posedge clk) begin
      reg39 <= wire37[(2'h2):(2'h2)];
    end
  assign wire40 = (~|{wire1[(4'h9):(3'h5)],
                      (({(8'ha2)} & wire37[(4'h9):(4'h8)]) >>> wire4[(1'h1):(1'h0)])});
  assign wire41 = ({(wire40 > wire6)} ~^ ((($unsigned(wire34) <<< wire3) ?
                          (-(wire36 ? wire6 : wire1)) : {$unsigned((8'hab))}) ?
                      wire5 : $unsigned(wire38[(1'h1):(1'h0)])));
  module42 #() modinst62 (wire61, clk, wire40, wire36, reg39, wire38, wire0);
  always
    @(posedge clk) begin
      reg63 <= $unsigned((~&(wire4[(4'ha):(3'h6)] ?
          {wire7} : $unsigned($unsigned((8'hab))))));
    end
  assign wire64 = ({{(!$unsigned(wire38))},
                      ($unsigned((&wire0)) ?
                          $unsigned((|wire40)) : wire6[(3'h5):(2'h3)])} & {{wire41[(1'h0):(1'h0)]},
                      $unsigned(((wire3 ? wire4 : reg39) != (wire1 ?
                          wire6 : wire36)))});
  assign wire65 = $signed(wire37);
  assign wire66 = ((8'ha1) ?
                      (wire37 << (+(wire61[(4'h9):(1'h0)] ?
                          wire5[(1'h0):(1'h0)] : (reg39 & wire36)))) : wire5);
  assign wire67 = $unsigned(wire61);
  assign wire68 = (-(-$signed({(^~wire38), wire40})));
  module69 #() modinst163 (wire162, clk, wire61, wire40, wire38, wire67, wire64);
  assign wire164 = $signed($unsigned($signed(((8'hb8) ^~ $unsigned(wire5)))));
  module76 #() modinst166 (wire165, clk, wire68, wire0, wire67, wire164, wire64);
endmodule

module module69
#(parameter param160 = (^~(((((8'hab) + (8'hbf)) == {(8'h9d)}) ? {((8'ha2) ? (8'ha2) : (8'h9f)), ((8'hbd) >= (7'h41))} : {(8'hab)}) && {((~|(8'hbf)) && ((8'hbb) ^ (8'h9d)))})), 
parameter param161 = (~|(!(((param160 ^~ param160) ^~ (param160 ? param160 : (8'hac))) ? param160 : ({param160} ^ (~param160))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire [(5'h14):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'ha):(1'h0)] wire157;
  wire [(4'h9):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire155;
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire105,
                 wire75,
                 wire107,
                 wire108,
                 wire109,
                 wire155,
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
                 (1'h0)};
  assign wire75 = $unsigned(((-(-((8'hb9) ?
                      wire71 : (8'ha7)))) || $signed(wire72)));
  module76 #() modinst106 (wire105, clk, wire72, wire73, wire75, wire71, wire74);
  assign wire107 = wire74;
  assign wire108 = ($unsigned({wire72[(4'he):(2'h3)]}) ?
                       (({wire107} ?
                           wire72 : wire74) <= wire75[(4'hf):(4'h9)]) : wire75[(5'h11):(3'h5)]);
  assign wire109 = (((($signed(wire74) == (~|wire70)) ?
                           ($signed((8'ha4)) << $signed(wire70)) : {(7'h42),
                               $signed(wire75)}) >= $unsigned(((wire108 & wire70) ?
                           wire107 : (wire75 ? wire105 : (8'hb7))))) ?
                       $unsigned($unsigned(((wire70 ?
                           wire72 : wire70) - $signed(wire75)))) : wire71);
  always
    @(posedge clk) begin
      reg110 <= wire73[(2'h3):(1'h1)];
      if ({$signed(reg110[(4'ha):(4'h9)]),
          ($unsigned(($signed(reg110) & {wire73})) ^ $unsigned($unsigned((wire70 ?
              wire71 : wire74))))})
        begin
          if ((($signed((^wire74[(4'ha):(2'h2)])) ?
                  (^wire109[(1'h1):(1'h1)]) : wire109) ?
              ($signed($unsigned((&wire73))) >>> (wire70 ?
                  $unsigned(((8'ha3) ?
                      wire108 : (8'hb8))) : ($unsigned(wire108) >= (wire71 ?
                      (8'h9c) : wire74)))) : (((wire75 ?
                          (~&(7'h42)) : reg110[(3'h7):(3'h6)]) ?
                      (-(-wire109)) : (|wire70[(4'hb):(3'h6)])) ?
                  $signed((^~{wire109})) : (-(~|wire73[(4'hc):(3'h5)])))))
            begin
              reg111 <= (((wire75[(3'h7):(3'h7)] ?
                          $unsigned((-(8'hb6))) : wire75) ?
                      $unsigned($unsigned(wire75[(4'hc):(2'h2)])) : (wire74[(4'h8):(1'h1)] ?
                          $signed($signed(wire109)) : {(~|wire107)})) ?
                  ($signed(wire107) ?
                      wire71[(2'h3):(1'h0)] : wire105[(3'h4):(2'h3)]) : (~^(~&(wire105[(1'h0):(1'h0)] ~^ wire72))));
            end
          else
            begin
              reg111 <= wire108[(3'h7):(2'h3)];
              reg112 <= $signed(((|wire109) == wire107));
            end
          reg113 <= $unsigned({(~$unsigned((wire70 - reg112))),
              (wire71 != (~wire74[(2'h3):(2'h2)]))});
        end
      else
        begin
          reg111 <= ($signed((((wire71 ? wire108 : reg113) ?
              wire74[(4'hf):(1'h0)] : $unsigned(reg113)) < {(wire107 ?
                  reg111 : wire109),
              $signed(wire74)})) >> ((wire109 ?
              ($signed((8'ha3)) ? wire70 : (~^(7'h40))) : $unsigned((wire105 ?
                  wire72 : wire105))) < $signed(((wire73 ~^ wire74) ?
              wire72 : reg113[(4'h9):(1'h1)]))));
          if ({wire75[(3'h7):(3'h6)]})
            begin
              reg112 <= (8'hb8);
              reg113 <= ({(~^$signed((reg113 ? wire70 : wire75))),
                  (~|wire75)} << $signed(((+{wire72}) ?
                  $signed((^wire71)) : ((~^wire108) - (wire75 ?
                      wire72 : wire74)))));
              reg114 <= ((&({$signed(wire109), (wire75 ~^ (8'hb2))} ?
                      wire75 : $signed((wire108 > (8'hb0))))) ?
                  ($signed((~^wire72[(4'he):(4'he)])) ?
                      wire107[(4'ha):(4'h8)] : (~&$unsigned((~^wire107)))) : wire109);
              reg115 <= (+{(^reg112)});
            end
          else
            begin
              reg112 <= $unsigned($unsigned(reg113));
              reg113 <= $signed(wire71);
              reg114 <= (reg114[(2'h2):(1'h1)] ? (8'ha1) : wire105);
              reg115 <= ($unsigned(($unsigned((~&reg114)) <<< $unsigned($signed(reg115)))) ~^ (reg111 ?
                  (((wire70 ?
                      wire109 : wire74) >>> (^~reg111)) > wire74) : wire108));
              reg116 <= wire73[(3'h5):(3'h4)];
            end
          reg117 <= $signed((^~$unsigned($unsigned((wire74 ?
              (8'hab) : wire107)))));
          reg118 <= ((~|wire105[(3'h4):(3'h4)]) ?
              wire107[(1'h0):(1'h0)] : ($signed((~(reg110 & wire71))) ?
                  $signed(($unsigned(wire72) || wire71[(3'h7):(2'h2)])) : $signed($unsigned($signed(wire72)))));
        end
      reg119 <= (((^$signed($signed(reg111))) ^~ ($signed(reg113[(5'h10):(4'h9)]) ?
              ((8'hb7) ?
                  wire73[(3'h4):(1'h1)] : reg116[(3'h6):(3'h6)]) : $signed(((8'haa) ?
                  wire72 : wire105)))) ?
          (&reg117) : ($signed($signed(wire73[(5'h11):(4'hc)])) ?
              (wire71 ?
                  reg110 : $unsigned({(8'h9c), reg111})) : $signed((7'h40))));
      reg120 <= $unsigned((!$signed({$signed(reg114), {wire71}})));
      reg121 <= {(&$signed((~&$unsigned(reg119)))),
          (({$unsigned(reg114), wire107[(3'h6):(3'h4)]} ?
                  $unsigned(reg117[(1'h1):(1'h0)]) : $unsigned((|reg116))) ?
              wire74 : wire105)};
    end
  module122 #() modinst156 (wire155, clk, reg113, wire71, wire109, reg118, wire73);
  assign wire157 = $unsigned(reg112);
  assign wire158 = (!(+(!reg116[(2'h3):(1'h0)])));
  assign wire159 = (({((+wire105) ?
                               wire109 : $signed(wire70))} ^~ $unsigned($signed($unsigned(wire75)))) ?
                       wire71[(3'h5):(1'h1)] : {{{(reg110 ?
                                       reg117 : (7'h41))}}});
endmodule

module module42
#(parameter param59 = (((^~((!(7'h43)) <= (~(8'hba)))) ? ((((8'hb6) * (8'hab)) && ((8'ha8) >>> (7'h42))) ^~ ((|(7'h42)) ? (+(7'h41)) : ((8'hac) == (8'hbe)))) : (((7'h40) == ((8'hb8) >> (8'hb1))) ? (&((7'h43) | (8'hba))) : ((~(8'h9f)) ? (+(8'h9f)) : ((7'h42) ? (7'h44) : (8'hac))))) ? ({({(8'hb9), (8'ha5)} ? {(8'hbf), (8'hb1)} : (!(8'hb3)))} ? (({(8'ha6)} ? (~&(7'h42)) : (!(8'h9e))) ? ((+(7'h41)) <= ((8'hbc) ? (8'hba) : (8'hb3))) : (((8'hac) ? (7'h43) : (7'h41)) ? (~&(8'ha6)) : ((8'hb0) >= (8'hb5)))) : {(((8'ha1) + (8'hb4)) ? (!(8'haa)) : ((8'hbf) <= (8'hbc)))}) : {(^((^(8'ha1)) ? (8'hab) : ((7'h43) ? (8'ha1) : (8'ha8)))), {(((8'hab) ? (7'h42) : (8'hbf)) ~^ ((8'hbc) < (8'hb5)))}}), 
parameter param60 = (!(~|(-(param59 ? (param59 ? param59 : param59) : (!param59))))))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire signed [(2'h3):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = $unsigned($signed(((!((7'h41) ? wire45 : wire46)) ?
                      wire43 : wire45[(3'h6):(3'h6)])));
  assign wire49 = ((wire46 ? wire48[(4'hd):(2'h2)] : wire44) ?
                      ((~|((8'ha0) >> (-wire43))) & $signed(($signed(wire43) ?
                          $unsigned(wire48) : {wire43,
                              (8'hb3)}))) : ($signed((((8'ha5) ^~ wire43) & $signed(wire44))) * ($signed($unsigned((8'hb2))) >>> $unsigned(wire47))));
  assign wire50 = wire49[(2'h3):(2'h3)];
  assign wire51 = ((^~($unsigned((wire50 <<< wire46)) ?
                          wire50 : ($signed(wire44) ?
                              $unsigned(wire44) : ((8'hb8) ?
                                  (8'hb3) : (7'h40))))) ?
                      $signed({{wire43}}) : wire45);
  assign wire52 = wire47[(4'h8):(1'h0)];
  assign wire53 = (wire48[(4'h9):(1'h1)] >= $unsigned(($signed(wire49[(2'h3):(1'h1)]) ?
                      wire44[(3'h4):(3'h4)] : wire47[(2'h3):(1'h1)])));
  assign wire54 = $unsigned(wire53[(2'h3):(1'h1)]);
  assign wire55 = (($unsigned(({wire53} ^~ ((8'h9c) ?
                          (8'ha9) : wire49))) - (((wire48 << wire50) ?
                          (!wire45) : wire51[(1'h0):(1'h0)]) >= ($signed(wire49) ?
                          $signed(wire49) : ((8'hb8) ? wire53 : wire53)))) ?
                      $unsigned(((!{(8'hbb)}) != wire54[(1'h1):(1'h0)])) : wire52);
  assign wire56 = (8'hb5);
  assign wire57 = wire46;
  assign wire58 = (8'ha7);
endmodule

module module8
#(parameter param32 = (~|(((((7'h40) ? (8'hb9) : (8'hb2)) ^~ ((8'hb8) * (8'ha3))) ? ((+(8'hb9)) ? (!(8'h9c)) : ((8'ha8) == (7'h43))) : ((~|(8'hbf)) + (~&(7'h41)))) >= ((((8'hbd) >> (8'ha8)) ? {(8'hab)} : (&(7'h42))) ? (&{(8'ha6), (8'hba)}) : (((7'h41) ? (8'hbd) : (8'haa)) ? ((8'hbf) == (8'hb7)) : ((8'hb0) ? (8'ha8) : (8'h9c)))))), 
parameter param33 = (|(((param32 && (param32 & param32)) != param32) ? {(~{param32, param32})} : {((8'h9e) <<< param32)})))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
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
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = $unsigned(wire11[(4'he):(4'hc)]);
  assign wire15 = $unsigned(wire9);
  assign wire16 = (((~^(~^wire11)) ?
                      wire11 : $signed($unsigned({(8'hb5),
                          wire11}))) & (~$signed((8'h9d))));
  assign wire17 = ((+{$unsigned((!wire9))}) & (8'hb1));
  assign wire18 = ($unsigned((($signed(wire15) ?
                          (wire13 <<< (8'ha5)) : (wire13 ? wire16 : wire17)) ?
                      ($unsigned(wire12) ?
                          $unsigned(wire16) : $unsigned(wire10)) : wire14)) <= wire13[(1'h1):(1'h1)]);
  assign wire19 = wire11;
  assign wire20 = (wire14[(3'h6):(2'h2)] ?
                      wire9 : $signed({{((8'h9d) ^~ (8'ha5))}}));
  assign wire21 = ($unsigned($unsigned((wire18 ?
                          {wire17} : $unsigned(wire16)))) ?
                      wire15 : $unsigned((((8'hb1) ~^ {wire14, wire13}) ?
                          wire12 : ((~^wire17) ?
                              $signed(wire13) : (~wire14)))));
  assign wire22 = wire9;
  assign wire23 = $signed($unsigned({((^~(8'h9c)) ?
                          wire15[(4'h9):(1'h0)] : (wire12 == wire22)),
                      wire21[(2'h3):(2'h2)]}));
  assign wire24 = ($signed((-(&$unsigned(wire23)))) >>> {$signed(wire19)});
  assign wire25 = ($signed({$signed((wire9 ? (8'hb1) : (8'ha3))),
                      $unsigned((^(8'ha6)))}) - (~|$signed(((wire16 ?
                      wire21 : wire20) | {wire11, wire24}))));
  assign wire26 = {$unsigned($unsigned(($signed(wire10) ?
                          $signed(wire16) : (wire9 ? wire13 : wire10))))};
  assign wire27 = $unsigned(wire16[(1'h0):(1'h0)]);
  assign wire28 = wire10;
  assign wire29 = ({{((wire22 >>> wire12) - ((8'haf) ? wire20 : wire16)),
                          wire26},
                      wire23[(5'h10):(4'hd)]} == (+$unsigned($unsigned(((8'hbd) ?
                      wire23 : wire18)))));
  assign wire30 = (wire29[(4'h8):(2'h3)] + wire12[(4'h9):(3'h5)]);
  assign wire31 = ($signed($unsigned(wire18)) ?
                      (|(wire9[(4'h9):(3'h5)] >>> ((8'ha4) ?
                          wire20[(3'h7):(1'h1)] : $signed(wire15)))) : (~^wire9[(3'h4):(2'h3)]));
endmodule

module module122  (y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire127;
  input wire [(2'h2):(1'h0)] wire126;
  input wire [(4'h8):(1'h0)] wire125;
  input wire signed [(2'h3):(1'h0)] wire124;
  input wire signed [(5'h13):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  wire [(5'h12):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire134;
  wire [(4'hc):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire128 = $signed((wire127[(4'h8):(3'h5)] <<< $signed({$signed(wire124),
                       wire125})));
  assign wire129 = $signed((^(wire128 ?
                       wire127[(1'h1):(1'h0)] : (^~(|wire126)))));
  assign wire130 = $signed($signed($unsigned(($unsigned((8'ha7)) ?
                       $unsigned(wire127) : (wire124 <<< (8'hae))))));
  assign wire131 = wire123[(5'h11):(4'hb)];
  assign wire132 = (~&(8'hbb));
  assign wire133 = wire125[(2'h3):(2'h3)];
  assign wire134 = $unsigned((({$unsigned((8'ha4)), $signed(wire127)} ?
                           ((wire126 ?
                               wire127 : wire131) > wire131) : $unsigned(wire123[(5'h13):(3'h7)])) ?
                       $unsigned(($signed(wire125) ?
                           (wire123 ? wire125 : wire128) : (wire130 ?
                               wire125 : wire128))) : wire132));
  assign wire135 = $unsigned((($unsigned(wire123) ?
                       wire128[(1'h0):(1'h0)] : wire130[(4'hb):(3'h7)]) > (&$signed((wire131 ?
                       wire127 : wire124)))));
  assign wire136 = ((~(&{wire133})) >>> wire126);
  assign wire137 = wire128[(4'ha):(4'h8)];
  assign wire138 = wire127;
  assign wire139 = (wire133[(3'h7):(3'h5)] ? wire128 : wire138);
  assign wire140 = (&wire133[(4'hb):(4'hb)]);
  assign wire141 = (($unsigned((((8'hbd) ? wire128 : (8'ha6)) ?
                           wire123[(4'hc):(4'h8)] : (wire123 < wire124))) ^~ (^~$unsigned(wire129[(3'h7):(1'h0)]))) ?
                       (wire132 ?
                           wire124[(2'h3):(2'h3)] : wire140[(2'h3):(2'h3)]) : {$unsigned($unsigned(wire124))});
  assign wire142 = wire130[(4'ha):(3'h6)];
  assign wire143 = $unsigned((wire132 ?
                       $signed(((wire136 ? (8'hbc) : wire138) ?
                           wire140 : wire138[(2'h3):(1'h0)])) : $signed(wire127[(4'h9):(3'h4)])));
  assign wire144 = wire143[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg145 <= wire126[(1'h1):(1'h0)];
      reg146 <= (!((wire142 != wire129) ?
          (~{wire128}) : (((8'h9f) ? $unsigned((8'ha5)) : $unsigned(wire138)) ?
              (!wire140) : $unsigned((&wire133)))));
      if ($unsigned($signed({wire138})))
        begin
          if ($signed(wire131))
            begin
              reg147 <= $signed(wire125);
              reg148 <= {$unsigned((8'h9d)),
                  $unsigned($unsigned(($unsigned(wire129) ?
                      $signed((8'hb3)) : ((7'h43) ? (8'hac) : wire123))))};
            end
          else
            begin
              reg147 <= $unsigned(reg146[(4'he):(4'h9)]);
              reg148 <= ((~(|$unsigned((wire125 & wire143)))) ?
                  (((wire134[(3'h5):(2'h2)] ?
                              (wire143 + wire141) : $signed(wire141)) ?
                          $unsigned((wire136 ?
                              wire141 : wire139)) : ($signed(wire136) <<< $unsigned(wire139))) ?
                      (wire138 ?
                          (~^$unsigned((8'hbb))) : $signed(wire143)) : wire134) : $signed(reg147));
              reg149 <= ($signed($signed($signed((wire144 ?
                      wire132 : wire123)))) ?
                  (wire131 * (-(!wire136[(4'hc):(4'h8)]))) : (~(!$unsigned(wire139[(5'h10):(2'h2)]))));
            end
        end
      else
        begin
          reg147 <= (({(~&$unsigned(wire140))} ?
                  ((!(wire128 | wire143)) ?
                      (~&$unsigned(wire139)) : (wire135 >= $unsigned(wire125))) : wire124[(2'h3):(2'h3)]) ?
              $unsigned($unsigned($unsigned($unsigned(wire144)))) : $unsigned($signed($unsigned({wire132,
                  reg147}))));
          reg148 <= wire128;
          reg149 <= (|wire134);
        end
      reg150 <= $signed($signed(wire141[(3'h5):(1'h0)]));
    end
  assign wire151 = wire133[(1'h0):(1'h0)];
  assign wire152 = ((8'hb7) ? wire142[(3'h6):(3'h4)] : wire138);
  assign wire153 = (8'hb9);
  assign wire154 = (&$signed((8'h9d)));
endmodule

module module76
#(parameter param103 = {({(8'h9f), ((+(7'h40)) ? (~(7'h43)) : ((8'h9f) ^~ (8'hb6)))} ? ((((8'ha4) << (8'ha9)) && ((8'ha9) & (8'ha5))) ? ((8'hbb) ? (|(8'hbe)) : ((8'hb6) ^~ (7'h43))) : (~^((8'h9e) >= (7'h42)))) : (~|(((8'ha1) >= (8'ha8)) ? (!(8'hbb)) : (~&(8'ha5))))), (~|(~^(((8'had) == (8'hb4)) & (!(8'hb8)))))}, 
parameter param104 = param103)
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire81;
  input wire signed [(3'h5):(1'h0)] wire80;
  input wire [(3'h6):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg97,
                 reg96,
                 reg95,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire82 = ($unsigned(wire77[(3'h4):(1'h1)]) ?
                      $unsigned($unsigned($signed($signed((8'haa))))) : (((8'haa) ?
                          $unsigned(wire80[(3'h4):(2'h2)]) : $unsigned(wire79)) < $signed(wire78[(2'h3):(2'h2)])));
  assign wire83 = ({(~&$signed(wire82)), wire78} > (8'hac));
  assign wire84 = (+($signed(wire80) ?
                      ((8'ha4) <= ((wire83 <<< wire82) & $signed(wire77))) : {$signed((wire79 <<< wire81))}));
  assign wire85 = $signed((((^~(wire78 ? wire79 : wire82)) ?
                          (~|$unsigned(wire77)) : wire79[(1'h1):(1'h0)]) ?
                      $signed((+(~&wire82))) : ((~^$signed(wire78)) ?
                          $unsigned($unsigned(wire81)) : (^~$unsigned((8'ha9))))));
  always
    @(posedge clk) begin
      reg86 <= wire81[(3'h4):(2'h3)];
      reg87 <= reg86;
    end
  assign wire88 = ((~&($unsigned($unsigned(wire80)) >> (8'hac))) ?
                      (-reg86) : $unsigned($signed($unsigned({wire79,
                          wire81}))));
  assign wire89 = wire77;
  assign wire90 = (!wire82);
  assign wire91 = $unsigned(((7'h44) ^~ $unsigned($unsigned($unsigned(wire77)))));
  assign wire92 = wire79;
  assign wire93 = (~wire81);
  assign wire94 = ($signed(($signed($unsigned(wire81)) ?
                          $signed((wire90 ? wire78 : wire81)) : (~|{reg87,
                              wire92}))) ?
                      wire83 : wire90[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg95 <= (($unsigned($signed((wire78 ? reg86 : wire91))) ?
          ($signed({wire81}) ?
              wire83 : wire88) : (~$unsigned($unsigned(wire92)))) ^~ ($unsigned({(wire77 ?
              wire81 : wire93),
          (wire92 + wire79)}) || wire83[(1'h1):(1'h1)]));
      reg96 <= ($signed((!$signed(reg87))) < (wire93 ?
          wire85 : {$signed(wire81)}));
      reg97 <= $signed((~&$unsigned(wire91[(2'h2):(2'h2)])));
    end
  assign wire98 = wire88[(4'hd):(2'h2)];
  assign wire99 = wire89;
  assign wire100 = (wire92[(3'h7):(2'h3)] ?
                       {(8'hbe)} : $unsigned((+$signed((reg87 << wire79)))));
  assign wire101 = reg97;
  assign wire102 = wire91[(2'h3):(1'h0)];
endmodule
