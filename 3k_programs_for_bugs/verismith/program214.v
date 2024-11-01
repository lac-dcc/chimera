module top
#(parameter param137 = (7'h43), 
parameter param138 = (param137 ? (+(((8'ha7) ? (param137 ~^ param137) : param137) >= (param137 ~^ (param137 ^~ param137)))) : (((param137 ? (param137 ? param137 : (8'hbf)) : param137) == (param137 ? (~&param137) : (param137 ^~ param137))) >> ((~|(~|param137)) != ((param137 == param137) ? param137 : (param137 ? param137 : param137))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire117;
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  assign y = {wire132,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  module4 #() modinst118 (wire117, clk, wire1, wire2, wire0, wire3);
  assign wire119 = ($unsigned((~|wire3)) ?
                       $signed(($signed((wire3 & wire2)) ?
                           ((wire3 << wire0) ?
                               wire0[(4'ha):(4'h9)] : (wire0 ?
                                   wire2 : wire0)) : $signed(((8'hae) ?
                               (7'h42) : wire117)))) : $unsigned((((wire1 ?
                               wire3 : wire3) ?
                           $signed(wire0) : (~&wire3)) ^~ wire0)));
  assign wire120 = ((!$unsigned((8'hae))) ?
                       {{((!wire117) <<< (wire119 ? (8'h9f) : wire2)),
                               $signed((wire3 ? wire0 : wire0))},
                           (+{$unsigned(wire0),
                               (wire0 ?
                                   wire2 : wire3)})} : (~$signed(($signed(wire0) != wire0[(3'h5):(2'h2)]))));
  assign wire121 = (wire3 ^~ wire119);
  assign wire122 = wire117;
  assign wire123 = (~^(|wire122));
  assign wire124 = ({wire119, wire123[(3'h5):(3'h5)]} ?
                       (~^$unsigned(((wire3 ?
                           wire2 : wire3) <<< wire121))) : (({(wire121 ?
                                   wire119 : wire3),
                               wire117} - wire121) ?
                           ($signed((~^wire120)) ?
                               $signed({wire122, wire3}) : {(wire120 ^ wire123),
                                   $unsigned(wire2)}) : $unsigned(((~|wire1) ?
                               (&wire121) : $signed(wire1)))));
  always
    @(posedge clk) begin
      if (wire117[(1'h0):(1'h0)])
        begin
          reg125 <= $unsigned(($signed({$signed((8'ha9)),
              (wire121 ? wire117 : wire123)}) | ((wire123[(4'hb):(3'h4)] ?
                  ((8'h9f) ? wire121 : wire117) : (wire117 + wire1)) ?
              $unsigned(wire3[(3'h6):(1'h1)]) : wire117)));
          reg126 <= $signed((8'hbc));
          reg127 <= $unsigned(($signed(((~wire2) || wire3[(2'h3):(1'h0)])) ?
              $unsigned($signed(wire0)) : (((wire1 < wire122) ?
                  ((8'hba) >= wire120) : (wire121 > wire0)) != wire3[(3'h5):(3'h5)])));
          reg128 <= (~|$signed({$unsigned($unsigned(wire3))}));
        end
      else
        begin
          reg125 <= wire117;
          reg126 <= wire121;
          reg127 <= (~^reg125);
        end
      if ({reg125[(4'ha):(3'h6)]})
        begin
          if (wire2[(3'h7):(1'h0)])
            begin
              reg129 <= $unsigned((~^(((wire2 | (8'ha4)) != (wire120 ?
                  (8'h9f) : (8'hb9))) ^ wire124[(2'h2):(1'h1)])));
              reg130 <= $signed((8'hba));
              reg131 <= {{reg129[(5'h11):(4'hc)],
                      (!{{wire117}, wire2[(3'h4):(2'h3)]})}};
            end
          else
            begin
              reg129 <= (|($signed(wire119[(3'h5):(2'h2)]) ?
                  (^~{$signed(wire123),
                      (reg129 - reg127)}) : $unsigned($unsigned(reg130[(4'hf):(3'h4)]))));
            end
        end
      else
        begin
          reg129 <= wire2[(3'h5):(1'h1)];
        end
    end
  assign wire132 = wire3[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg133 <= $signed(((~(+$signed((8'ha4)))) * wire1[(2'h2):(2'h2)]));
      reg134 <= wire123;
      reg135 <= reg125[(2'h2):(2'h2)];
      reg136 <= $unsigned(((wire123 ? wire3 : $unsigned((|wire132))) ?
          $unsigned(reg131) : (~&$signed($signed((7'h44))))));
    end
endmodule

module module4
#(parameter param115 = (|{({(^~(8'ha6)), (^(8'ha3))} ? (8'ha0) : ({(8'ha0)} ? (~|(7'h41)) : {(7'h41)}))}), 
parameter param116 = (!param115))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire111;
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire68,
                 wire30,
                 wire111,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  module9 #() modinst31 (wire30, clk, wire8, wire7, wire6, wire5, (8'ha6));
  always
    @(posedge clk) begin
      reg32 <= wire30;
      if ((wire30 ?
          wire30[(2'h2):(1'h0)] : ($signed((wire30[(1'h1):(1'h0)] ?
                  (wire7 ? (8'ha0) : wire5) : (wire30 ~^ wire5))) ?
              ({(~wire7),
                  $unsigned(wire30)} + $unsigned(wire30[(3'h4):(1'h0)])) : (~|$signed(wire5[(3'h6):(3'h5)])))))
        begin
          reg33 <= (reg32[(1'h0):(1'h0)] ?
              wire8 : ((reg32[(4'hf):(2'h2)] ?
                  ((wire8 | wire7) < (wire6 <<< wire7)) : (wire30[(2'h3):(1'h0)] ?
                      (!reg32) : {reg32,
                          (8'hb0)})) || (~|($unsigned(wire30) > reg32[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg33 <= ($signed(($signed(wire7[(2'h3):(2'h3)]) ? wire7 : (7'h44))) ?
              $signed(((reg32[(5'h12):(5'h12)] <<< (|wire30)) < (wire30[(2'h2):(1'h1)] >>> reg33))) : reg33[(4'h8):(3'h4)]);
          reg34 <= wire7;
        end
      reg35 <= (wire7 ?
          ($signed($signed($signed(wire30))) != $signed({(wire6 >= wire5),
              (wire6 || wire6)})) : $signed((!$signed((&(7'h42))))));
    end
  module36 #() modinst69 (.y(wire68), .wire41(wire30), .wire39(wire6), .clk(clk), .wire40(reg32), .wire37(reg34), .wire38(wire8));
  module70 #() modinst112 (wire111, clk, reg35, wire8, wire6, wire30, reg32);
  assign wire113 = (~^(8'ha2));
  assign wire114 = ((8'ha3) ?
                       $signed((((reg35 ? wire7 : wire7) ?
                           wire8 : $unsigned((8'h9e))) == (+(~wire8)))) : wire8[(3'h6):(3'h5)]);
endmodule

module module70
#(parameter param110 = (8'hb0))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire75;
  input wire [(3'h7):(1'h0)] wire74;
  input wire signed [(4'ha):(1'h0)] wire73;
  input wire [(5'h13):(1'h0)] wire72;
  input wire [(4'hd):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire104,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire77,
                 wire76,
                 reg106,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire76 = $signed((($signed(wire72[(4'hf):(4'hd)]) ?
                          $signed((&wire74)) : {{wire71}, $unsigned(wire73)}) ?
                      {wire73} : ($unsigned(wire72[(1'h0):(1'h0)]) ^ ($unsigned(wire74) ?
                          wire71[(4'h9):(4'h9)] : (wire71 ?
                              wire71 : wire74)))));
  assign wire77 = (-((wire73 ^~ $unsigned({(8'hb5)})) ?
                      ($unsigned(wire76) ?
                          $signed((^~wire75)) : {(wire73 ? wire72 : wire71),
                              ((8'hb2) >>> wire71)}) : ({(~|(8'ha7)),
                          wire71} >= $signed($unsigned(wire72)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire73[(1'h1):(1'h1)])))
        begin
          reg78 <= $signed((((~&wire72) == (~{wire72,
              wire74})) & wire76[(5'h10):(2'h2)]));
        end
      else
        begin
          reg78 <= (($unsigned((wire77[(1'h0):(1'h0)] >> wire76[(4'ha):(3'h5)])) ?
                  $unsigned(((wire75 ? wire73 : wire75) != (reg78 ?
                      wire73 : wire77))) : $signed(((reg78 ?
                      wire71 : wire75) < (wire75 != reg78)))) ?
              $signed({((wire74 && wire76) ?
                      {(8'hab), wire77} : $unsigned((8'hac))),
                  wire76}) : {$signed({wire73[(2'h3):(2'h2)]})});
        end
      reg79 <= (|wire73);
      reg80 <= ((wire71[(4'hb):(3'h5)] << wire71[(4'h8):(3'h6)]) ?
          (&$unsigned(($signed(wire77) - (^~wire74)))) : wire73);
      reg81 <= wire73[(3'h6):(1'h1)];
    end
  assign wire82 = ($signed($unsigned((8'hab))) <= reg81[(4'hb):(1'h1)]);
  assign wire83 = wire82[(1'h1):(1'h1)];
  assign wire84 = (((($signed(reg79) ?
                          (reg79 ? reg81 : (8'had)) : (wire77 ?
                              wire82 : wire77)) ?
                      ($signed(wire73) ?
                          wire71[(4'h8):(3'h6)] : $unsigned(wire83)) : ({(7'h41)} ?
                          (~&wire77) : {wire72})) ^ {(reg80 ?
                          wire76[(5'h10):(4'he)] : (~wire83))}) > (8'ha9));
  assign wire85 = $signed(wire82);
  assign wire86 = $unsigned(reg80);
  assign wire87 = wire83;
  assign wire88 = $unsigned($signed((^wire71[(4'ha):(1'h1)])));
  always
    @(posedge clk) begin
      reg89 <= reg78;
      if ((~$signed(({{wire84, (8'ha8)}} & ((!wire76) ?
          wire88 : reg89[(4'hf):(4'hd)])))))
        begin
          reg90 <= $signed((reg79 ?
              ((-wire87[(4'hc):(3'h7)]) >> (wire84[(1'h1):(1'h1)] << wire73)) : ((~$unsigned(wire84)) ?
                  $unsigned((reg79 | wire72)) : ((wire74 ?
                      reg78 : wire74) ^~ ((7'h42) == (7'h41))))));
          reg91 <= wire83;
        end
      else
        begin
          reg90 <= (wire73[(3'h4):(2'h3)] ^ ((~|wire75[(4'hb):(3'h5)]) ?
              ($signed((reg79 - wire84)) >> ((wire71 & reg81) ?
                  (wire87 ?
                      wire75 : wire85) : reg81)) : ((^(-reg78)) << reg81[(4'hb):(3'h6)])));
          reg91 <= reg90[(2'h3):(2'h3)];
          reg92 <= $signed(wire85[(1'h0):(1'h0)]);
          reg93 <= reg79;
          if ($unsigned($unsigned($signed(wire83))))
            begin
              reg94 <= ($unsigned($unsigned((~&reg81))) && (($unsigned((8'ha7)) ?
                      reg80 : wire71[(3'h6):(3'h5)]) ?
                  $signed(reg89) : (^~$signed($signed(reg90)))));
              reg95 <= ({{$signed((reg89 <= wire85)), (~$signed(wire74))},
                  $unsigned($signed({wire76,
                      wire87}))} && ($signed($unsigned(wire76[(3'h7):(2'h2)])) < wire71[(4'ha):(4'ha)]));
            end
          else
            begin
              reg94 <= $unsigned(((!(((7'h43) ? wire82 : reg80) ?
                  $unsigned(reg80) : $signed((8'ha5)))) - (^wire85)));
              reg95 <= wire74[(3'h5):(2'h2)];
              reg96 <= wire87;
              reg97 <= $signed({((~|wire87[(5'h11):(4'he)]) ?
                      ((~&reg95) ?
                          {wire72} : (wire73 ?
                              reg91 : reg96)) : $signed($signed(reg81)))});
            end
        end
      reg98 <= $signed((+wire82[(3'h5):(3'h5)]));
      if ((^(reg89 ? (8'ha1) : wire73)))
        begin
          reg99 <= $signed(reg97[(2'h2):(1'h0)]);
          reg100 <= ((reg79[(2'h2):(1'h1)] & wire72) <= (!wire73));
          reg101 <= (^$signed($signed(wire71[(4'ha):(4'h9)])));
          if (wire83[(1'h1):(1'h0)])
            begin
              reg102 <= $signed(reg93[(3'h5):(1'h0)]);
              reg103 <= wire88;
            end
          else
            begin
              reg102 <= wire88[(4'hb):(3'h4)];
              reg103 <= ($signed($signed($signed($signed(reg101)))) ?
                  (~^reg81) : ({{{reg79}},
                          $unsigned(((8'ha6) ? reg95 : reg103))} ?
                      $unsigned(($signed(reg98) ?
                          $unsigned(wire72) : $unsigned(wire71))) : (~^$unsigned(wire74[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          reg99 <= (~|reg79[(1'h1):(1'h0)]);
          reg100 <= reg95[(2'h2):(1'h1)];
          reg101 <= wire82[(1'h1):(1'h0)];
          reg102 <= $unsigned(wire82[(1'h0):(1'h0)]);
          reg103 <= (^~$unsigned($unsigned((+(^~wire74)))));
        end
    end
  assign wire104 = (&$signed((~|((wire72 << wire87) ?
                       (reg102 & reg102) : (wire86 ^~ wire74)))));
  assign wire105 = (wire71 & (8'hbc));
  always
    @(posedge clk) begin
      reg106 <= ({((wire86[(2'h2):(1'h1)] >>> (reg101 ? reg94 : wire82)) ?
                  wire77 : ($signed(wire104) ? wire88 : (8'h9e)))} ?
          (~^((~&(8'ha7)) < $signed({reg95,
              (8'hb5)}))) : wire72[(5'h13):(3'h7)]);
    end
  assign wire107 = reg98;
  assign wire108 = reg90;
  assign wire109 = (wire76[(4'h9):(3'h7)] & (reg90 <= (^~$signed($signed((8'ha5))))));
endmodule

module module36
#(parameter param66 = (~&(((^((7'h40) ? (8'hbd) : (8'hac))) + (|((8'hbc) ? (7'h43) : (8'ha0)))) << {(+((8'hb1) ? (8'ha0) : (8'ha1)))})), 
parameter param67 = (({({param66, param66} ? ((8'hb7) | param66) : (~&param66)), {(~param66)}} ? (^~((!param66) ? (param66 | param66) : (param66 ? param66 : param66))) : (&param66)) || ((param66 << (~^{param66})) ? (param66 ^ param66) : {((param66 >= param66) ? param66 : param66), param66})))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg55,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire42 = $unsigned(wire38[(4'he):(4'ha)]);
  assign wire43 = $signed(wire39[(3'h6):(2'h2)]);
  assign wire44 = wire40[(1'h0):(1'h0)];
  assign wire45 = wire43;
  always
    @(posedge clk) begin
      reg46 <= $signed({(-$signed(wire45))});
      if ($signed(wire44))
        begin
          reg47 <= wire42;
          reg48 <= ($unsigned(($unsigned($unsigned(wire37)) ?
                  $signed($unsigned(wire38)) : (|$unsigned(wire42)))) ?
              reg47[(3'h6):(3'h6)] : wire38);
          reg49 <= wire45[(4'ha):(2'h3)];
        end
      else
        begin
          reg47 <= $signed(({wire43, wire38[(1'h0):(1'h0)]} ?
              ((wire42[(4'hd):(2'h2)] - $unsigned(wire45)) <= ((reg47 && wire40) ?
                  (wire41 ?
                      reg46 : wire40) : (~&wire45))) : $unsigned(wire42)));
          reg48 <= $unsigned(wire42);
        end
      reg50 <= ((wire40 & $signed(reg49[(2'h3):(2'h2)])) ~^ ($signed((8'hb5)) * $unsigned($unsigned((^~wire45)))));
    end
  assign wire51 = $signed($signed({$signed((wire39 ^~ wire44)),
                      ($signed(wire41) != (wire37 > (8'hba)))}));
  assign wire52 = $unsigned((&(wire38 <<< $unsigned({wire45}))));
  assign wire53 = {wire44[(3'h5):(1'h1)],
                      $signed(($unsigned($unsigned(wire40)) + {(~wire39),
                          (wire44 && wire39)}))};
  assign wire54 = reg46[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg55 <= ($signed((-$unsigned($unsigned(reg50)))) - ((|wire42[(5'h10):(3'h5)]) + wire38));
    end
  assign wire56 = (reg47 ?
                      $signed(($signed((-reg46)) | $unsigned($signed(wire53)))) : (8'hbc));
  assign wire57 = (&$signed($signed({$signed(wire52)})));
  assign wire58 = (wire54[(5'h12):(3'h7)] <<< ($unsigned(reg50) ~^ reg50[(1'h1):(1'h1)]));
  assign wire59 = reg48[(3'h4):(3'h4)];
  assign wire60 = $signed((^({$signed(wire37)} + reg55[(1'h0):(1'h0)])));
  assign wire61 = wire58[(3'h4):(3'h4)];
  assign wire62 = reg55[(3'h4):(2'h2)];
  assign wire63 = ({{reg49, wire41[(5'h14):(4'hb)]},
                      {$unsigned(reg55),
                          {$signed(wire57),
                              wire39[(3'h7):(2'h3)]}}} >> reg50[(2'h2):(1'h0)]);
  assign wire64 = (((~|(((8'ha9) && wire63) + wire42)) ?
                          (~^{$unsigned((8'haf)), wire51}) : (7'h41)) ?
                      wire43[(2'h2):(2'h2)] : $signed(reg48[(3'h4):(2'h3)]));
  assign wire65 = reg48[(3'h4):(2'h2)];
endmodule

module module9
#(parameter param29 = (((((&(7'h43)) ? ((8'haa) * (8'hac)) : ((8'hb3) ^~ (8'h9e))) ? ((8'hb8) ? ((8'hbe) << (8'haa)) : ((8'h9e) ~^ (8'hae))) : (((8'ha4) != (8'ha7)) + (&(8'hb6)))) & {((^(8'hbb)) | ((8'ha6) >>> (8'hae)))}) >>> ((8'hb2) * ((~|(~|(8'hbe))) && ((!(8'hb1)) && ((8'hb8) ? (8'h9d) : (8'hb8)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg25,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire15 = $unsigned($signed(wire10));
  assign wire16 = $unsigned({(wire12 ?
                          ($signed(wire11) >= (wire10 ?
                              (8'h9e) : wire14)) : ((wire10 - wire11) <= (wire11 ?
                              wire11 : wire13)))});
  assign wire17 = $signed(((wire12[(1'h0):(1'h0)] != (&(~&wire10))) <= $signed(((wire10 | wire13) ?
                      $unsigned(wire11) : (^wire13)))));
  assign wire18 = {wire16[(1'h0):(1'h0)]};
  assign wire19 = $signed(($signed(({wire16, wire16} ?
                          $signed(wire10) : wire11[(3'h5):(2'h2)])) ?
                      $signed((wire14[(3'h7):(3'h5)] ?
                          $unsigned(wire15) : (wire15 ?
                              wire15 : wire17))) : $unsigned({(wire14 ?
                              wire11 : wire12)})));
  always
    @(posedge clk) begin
      reg20 <= wire10;
      reg21 <= wire19[(3'h5):(1'h1)];
      reg22 <= $unsigned(wire17[(4'hf):(4'ha)]);
    end
  assign wire23 = (8'haa);
  assign wire24 = (($signed(((^wire11) ?
                          $unsigned((7'h40)) : wire15)) && wire11) ?
                      wire23 : wire23);
  always
    @(posedge clk) begin
      reg25 <= wire14;
    end
  assign wire26 = ((-(~^($unsigned(wire16) ? (~|wire16) : $signed(wire11)))) ?
                      $unsigned((wire12 >> {(^wire24),
                          wire19[(3'h7):(2'h3)]})) : $unsigned((((reg25 - reg21) > wire12) ?
                          reg22[(3'h7):(3'h5)] : $signed(wire12))));
  assign wire27 = $unsigned(wire26);
  assign wire28 = wire19;
endmodule
