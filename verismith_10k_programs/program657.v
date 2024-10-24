module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire144;
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire83,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire20,
                 wire6,
                 wire5,
                 wire85,
                 wire144,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (~&$unsigned($signed($unsigned(((8'hb4) >= wire2)))));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire6);
      reg8 <= (~|(~^(~|((!wire2) ? $unsigned(reg7) : $unsigned(wire0)))));
      if ($signed((~(wire5[(2'h2):(1'h0)] < wire1))))
        begin
          if ((~&((($signed(wire2) <<< $unsigned(wire5)) && (8'ha7)) ?
              (^wire3) : wire6[(4'ha):(4'h8)])))
            begin
              reg9 <= ((wire0 >>> $unsigned(wire6[(4'hd):(3'h7)])) + wire0[(1'h0):(1'h0)]);
              reg10 <= $signed(wire4[(1'h1):(1'h0)]);
            end
          else
            begin
              reg9 <= {($signed(((reg9 << wire3) <<< (reg8 ?
                      reg7 : wire3))) < (~$unsigned(wire6)))};
              reg10 <= reg7;
              reg11 <= reg8;
              reg12 <= (8'hb5);
              reg13 <= ({$signed(($unsigned(reg10) & (-wire4)))} > wire5);
            end
          reg14 <= ($signed($signed(wire4)) ?
              reg10 : ((~|({wire5, wire1} || (8'h9f))) ?
                  reg10 : $unsigned((reg11 >> (8'hbc)))));
          if (wire4[(3'h4):(2'h3)])
            begin
              reg15 <= ((!(~&$unsigned($unsigned(reg12)))) < (+((~&wire4[(3'h7):(3'h5)]) | $unsigned($signed(wire1)))));
              reg16 <= $signed($signed({{(reg10 * wire0)},
                  (reg11[(4'hc):(3'h4)] << $signed(wire4))}));
              reg17 <= (~|(~|$unsigned((&(^reg12)))));
            end
          else
            begin
              reg15 <= $unsigned((!reg10));
            end
          reg18 <= (^~(reg17 ?
              $unsigned(($unsigned(wire5) ?
                  {reg7} : $unsigned(wire0))) : {$unsigned(((8'hb9) ?
                      wire0 : reg17)),
                  wire0}));
          reg19 <= wire4;
        end
      else
        begin
          reg9 <= reg9;
        end
    end
  assign wire20 = {(&$unsigned((+reg18))), wire0};
  always
    @(posedge clk) begin
      reg21 <= ((reg14[(1'h1):(1'h0)] ?
          (~&(^~(&wire6))) : ({{(8'hbe),
                  wire2}} >> wire4[(3'h4):(2'h2)])) >>> (|((-(reg10 << reg17)) ^ reg12[(2'h2):(2'h2)])));
      if ($signed({$signed($unsigned({wire6})),
          (((reg19 >>> reg13) ?
              reg13[(1'h0):(1'h0)] : $unsigned(reg12)) & reg8)}))
        begin
          if (reg18)
            begin
              reg22 <= (~{($signed((reg7 | wire1)) & {reg10,
                      $unsigned(wire3)})});
              reg23 <= ((reg19 * reg11[(2'h2):(2'h2)]) >> ((~(-$unsigned(reg18))) <= ($unsigned(reg12[(4'h8):(1'h0)]) ?
                  ({wire4} ?
                      (reg12 ?
                          reg9 : reg19) : reg14) : $unsigned($signed(reg8)))));
            end
          else
            begin
              reg22 <= reg14[(1'h1):(1'h0)];
              reg23 <= ((reg9 ?
                      $unsigned($unsigned($signed(reg22))) : ($signed(reg16[(1'h1):(1'h0)]) ?
                          reg11 : $signed($signed(reg15)))) ?
                  wire20[(1'h1):(1'h1)] : {wire6});
            end
          if (($signed(($signed({(8'hb8)}) ?
                  $signed((wire1 ? (8'hbe) : reg12)) : reg14)) ?
              $signed($signed((wire6[(4'hb):(4'ha)] ?
                  $signed(wire1) : $signed((8'hb7))))) : wire20))
            begin
              reg24 <= $unsigned((~^(~|((8'ha7) + $unsigned(reg14)))));
              reg25 <= $unsigned($signed((|$unsigned($signed(wire5)))));
              reg26 <= ($unsigned((wire3[(3'h5):(1'h1)] | (!$signed((8'hb0))))) ?
                  wire6 : $signed((+$signed((wire5 ? reg10 : reg9)))));
              reg27 <= (wire0 != (!reg15));
              reg28 <= reg13[(2'h3):(1'h0)];
            end
          else
            begin
              reg24 <= {((+$signed(wire5)) ?
                      reg9[(4'hb):(2'h3)] : $unsigned(({reg24,
                          (8'hb9)} << $signed(reg12)))),
                  reg23[(3'h4):(2'h2)]};
            end
        end
      else
        begin
          reg22 <= (-wire1);
          reg23 <= (((^($signed(reg7) ?
              {reg7, wire0} : (7'h43))) | (((8'hb8) < {reg8, (8'ha9)}) ?
              reg7 : ((wire0 || reg24) != wire1))) & ({wire1, reg12} ?
              ($signed(reg27[(4'h8):(3'h4)]) * wire0) : ($unsigned(((7'h43) ?
                  reg24 : wire20)) | reg25[(5'h11):(3'h4)])));
          reg24 <= (-$unsigned(wire20[(1'h1):(1'h1)]));
          reg25 <= ($signed({$unsigned(reg26)}) >= $unsigned($signed((((8'h9e) + reg8) * (~wire5)))));
        end
    end
  assign wire29 = $signed((reg24[(3'h6):(2'h2)] ?
                      reg10[(2'h3):(2'h3)] : (8'hab)));
  assign wire30 = $unsigned({$unsigned($signed(reg14[(3'h6):(3'h6)]))});
  assign wire31 = wire30;
  assign wire32 = wire0;
  module33 #() modinst84 (wire83, clk, reg25, reg7, reg17, wire20);
  assign wire85 = $signed($unsigned({$signed((wire0 ~^ wire32))}));
  module86 #() modinst145 (wire144, clk, reg15, reg21, reg7, wire6);
endmodule

module module86
#(parameter param143 = ((&(((~&(8'ha2)) ? {(8'ha7)} : (~^(8'ha2))) ? (((8'h9c) ? (8'ha1) : (8'ha3)) ? (8'hb6) : (~&(8'hb1))) : {(8'hb2)})) ? ({{((8'hac) ? (8'ha9) : (8'h9e))}} ? (~|((&(7'h42)) <<< {(8'had)})) : ((7'h41) | (8'hba))) : (~^(((~(8'hb1)) ? ((8'hb8) ? (8'ha8) : (8'hbc)) : (!(8'hbb))) == {((8'h9d) ? (8'hb8) : (8'h9c))}))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire92,
                 wire91,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire91 = (^$signed($unsigned((~$unsigned(wire88)))));
  assign wire92 = wire88;
  module93 #() modinst114 (.wire96(wire87), .wire94(wire88), .wire97(wire90), .y(wire113), .clk(clk), .wire95(wire92));
  assign wire115 = $unsigned(wire90[(2'h3):(1'h1)]);
  assign wire116 = wire91[(4'hb):(2'h3)];
  assign wire117 = (wire89[(4'h9):(2'h3)] ?
                       $signed($signed({wire113})) : ($unsigned(wire92) ?
                           (+((!(8'had)) ?
                               (wire92 - wire116) : wire115)) : $unsigned(wire113[(5'h11):(5'h11)])));
  assign wire118 = (({($signed(wire116) || {(8'hae), wire87}),
                       ($unsigned(wire89) >>> (wire91 && wire91))} < {($unsigned(wire88) ?
                           (8'hb5) : wire116[(2'h3):(1'h1)]),
                       $signed((-wire87))}) >= ($unsigned(wire87[(4'hb):(3'h5)]) >>> wire91[(3'h4):(2'h3)]));
  assign wire119 = (8'hb0);
  assign wire120 = (wire119[(3'h4):(1'h1)] ?
                       (wire113[(4'hb):(3'h7)] || ($unsigned($signed(wire90)) ?
                           wire89[(1'h1):(1'h0)] : $signed((wire116 ?
                               wire115 : wire89)))) : ($unsigned((^wire115[(1'h0):(1'h0)])) - wire87));
  always
    @(posedge clk) begin
      if ((8'hbe))
        begin
          reg121 <= ($signed((~((wire113 <= wire115) >>> ((8'ha5) ?
                  wire88 : (8'h9c))))) ?
              (wire115 ?
                  wire90 : $unsigned(($unsigned(wire92) ?
                      (wire119 ? wire118 : wire90) : (~&wire89)))) : wire116);
          reg122 <= wire115[(1'h1):(1'h0)];
          reg123 <= {wire120[(5'h11):(2'h3)],
              (wire89 | ((~|{wire92}) ~^ $unsigned($unsigned(wire118))))};
          reg124 <= (wire92[(4'hf):(4'hd)] ? (8'hb9) : wire116[(1'h0):(1'h0)]);
        end
      else
        begin
          reg121 <= $signed($unsigned((($unsigned(wire90) ?
                  wire119[(2'h2):(2'h2)] : $signed(reg124)) ?
              $unsigned((~wire120)) : (^$unsigned(wire119)))));
          reg122 <= $unsigned({{{$signed((8'hbb))}},
              {(|(!wire113)), (|$unsigned(wire87))}});
          if (($unsigned(reg121[(2'h2):(1'h1)]) << $unsigned($unsigned((wire91 || wire92)))))
            begin
              reg123 <= $signed({reg124});
              reg124 <= wire116[(3'h6):(2'h3)];
              reg125 <= $unsigned((|(8'h9c)));
              reg126 <= $signed(wire119[(2'h3):(2'h2)]);
              reg127 <= {$unsigned((~^wire117)), wire118[(1'h1):(1'h0)]};
            end
          else
            begin
              reg123 <= $unsigned((reg121[(4'h9):(2'h3)] + (((-wire117) != (reg122 || wire92)) <<< (reg124[(3'h5):(3'h5)] && $signed((8'hb4))))));
            end
          if (reg122)
            begin
              reg128 <= reg126[(1'h1):(1'h1)];
            end
          else
            begin
              reg128 <= {({(|(wire113 & reg121)), $unsigned((-reg123))} ?
                      $unsigned(((|(8'hb0)) ^ wire87)) : (^$unsigned((wire120 >> wire87)))),
                  $unsigned((((~&reg122) ? (^reg124) : wire118) ?
                      (wire119 ?
                          (~wire91) : wire120[(4'hd):(1'h1)]) : reg126[(2'h2):(1'h0)]))};
              reg129 <= wire91[(4'h8):(3'h5)];
            end
          reg130 <= wire119;
        end
      reg131 <= $unsigned((({(wire88 ? reg123 : reg129), (wire113 && reg121)} ?
          $signed(reg129) : (reg123[(2'h3):(2'h2)] == $signed(reg126))) == ({$unsigned(wire92),
          wire87} >>> reg130[(2'h2):(1'h0)])));
      reg132 <= reg122;
      if (reg128)
        begin
          if ($signed((^~reg127)))
            begin
              reg133 <= reg124[(1'h0):(1'h0)];
              reg134 <= (&{(+$signed((reg124 >> reg122)))});
              reg135 <= (wire120[(2'h3):(1'h1)] != wire90[(2'h3):(2'h3)]);
              reg136 <= $signed({$unsigned((!$signed(wire115)))});
              reg137 <= {((^({wire115,
                      wire92} & reg126[(2'h2):(2'h2)])) >>> wire90[(3'h5):(2'h3)])};
            end
          else
            begin
              reg133 <= (&reg123);
              reg134 <= ($signed(wire90[(4'hc):(3'h5)]) ?
                  reg126 : ((^~wire113[(1'h1):(1'h0)]) ?
                      (((wire88 >> (8'ha3)) ?
                          $unsigned(reg137) : (wire88 >>> reg125)) == (&$unsigned(reg121))) : ((~{reg133}) ?
                          $signed($signed((8'hab))) : wire92[(2'h2):(1'h0)])));
              reg135 <= wire120[(4'hb):(3'h6)];
              reg136 <= (reg134 != (+reg131[(2'h3):(2'h2)]));
            end
          reg138 <= (!(~^reg128[(2'h2):(2'h2)]));
          reg139 <= (+($unsigned(reg121[(2'h2):(2'h2)]) ?
              (({(8'hb0)} ^ $unsigned((8'hb5))) ~^ (|(wire120 ?
                  reg136 : (8'hbe)))) : (!($signed(wire115) >= reg132))));
        end
      else
        begin
          reg133 <= reg125;
          reg134 <= ((^($unsigned(reg127[(3'h6):(2'h2)]) * {$signed((8'hbb))})) ?
              (reg124 <= (reg121[(3'h7):(3'h5)] ?
                  $signed((&wire115)) : (~|(reg132 == (8'hab))))) : wire117[(3'h6):(3'h5)]);
          reg135 <= reg139[(4'h8):(2'h3)];
          if (($signed((~^$signed((wire115 ?
              reg128 : wire89)))) << wire115[(2'h2):(1'h1)]))
            begin
              reg136 <= ((wire119[(4'hc):(1'h0)] ?
                  reg136 : {(wire117 <= (+(8'hbe))),
                      (wire113[(2'h3):(2'h2)] & reg129[(1'h1):(1'h1)])}) == wire115);
              reg137 <= (reg129 ?
                  $unsigned(((8'h9f) << ($signed(wire118) ?
                      (wire89 && (8'hba)) : (wire115 ?
                          wire91 : (7'h40))))) : (-reg134[(3'h4):(2'h3)]));
              reg138 <= ((reg124[(2'h2):(1'h0)] ?
                  (reg127 == (~^reg134[(1'h0):(1'h0)])) : {reg128[(2'h3):(1'h1)],
                      (!(wire117 && wire87))}) > ({((wire92 ?
                          reg137 : reg131) > (~&wire113))} ?
                  $signed(((reg123 * wire89) * reg136)) : reg138));
              reg139 <= ($signed((~|reg123[(1'h0):(1'h0)])) ?
                  (~^wire113[(4'hc):(1'h0)]) : ((+$unsigned((wire117 ?
                          wire118 : reg129))) ?
                      $signed((reg129 == {wire113,
                          (8'had)})) : $unsigned($signed(((8'ha0) != (8'had))))));
              reg140 <= wire116;
            end
          else
            begin
              reg136 <= wire113;
            end
          reg141 <= reg131;
        end
      reg142 <= (wire115 ? reg124 : (|wire115[(2'h3):(1'h0)]));
    end
endmodule

module module33
#(parameter param82 = (!((~^(((8'h9d) ? (8'hbe) : (8'hb7)) ? (~|(8'hb8)) : ((8'hb7) < (8'ha4)))) ~^ ((&{(8'hab), (8'hac)}) ? (^~((8'hbb) * (8'ha2))) : (8'h9c)))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  input wire signed [(4'ha):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire40,
                 wire39,
                 wire38,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire38 = $signed((&{(-(wire37 ^ wire34)), wire35}));
  assign wire39 = wire35[(2'h3):(1'h0)];
  assign wire40 = (8'hb8);
  module41 #() modinst72 (wire71, clk, wire35, wire36, wire34, wire40);
  assign wire73 = ((wire35[(1'h1):(1'h1)] ~^ $unsigned(($unsigned(wire71) + $unsigned(wire37)))) ?
                      {(wire40[(3'h6):(3'h4)] ~^ (8'ha5))} : wire37);
  assign wire74 = wire73[(2'h2):(2'h2)];
  assign wire75 = $signed(($signed((~^((8'hb9) <<< wire39))) ?
                      ((&(wire38 ? (8'haf) : wire36)) != (((8'h9c) ?
                          wire36 : wire34) != wire73)) : {$unsigned($signed(wire40))}));
  always
    @(posedge clk) begin
      reg76 <= wire34;
      reg77 <= $signed((~^((!$unsigned(wire73)) - {$signed(wire34),
          (wire71 > wire40)})));
    end
  assign wire78 = wire75;
  assign wire79 = ({(~({wire39} ? wire38[(3'h6):(1'h1)] : (^~wire71))),
                      (($signed(wire35) ^ (wire78 < wire74)) ?
                          wire74 : {$unsigned(wire40),
                              {wire35,
                                  (8'hbd)}})} << $signed($signed(((wire71 <= wire35) ?
                      wire39 : (~wire73)))));
  assign wire80 = {{reg76, wire35[(2'h3):(1'h0)]}, wire40[(3'h5):(2'h2)]};
  assign wire81 = wire38[(4'he):(4'he)];
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(3'h5):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg64,
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
  assign wire46 = (wire45[(3'h6):(2'h2)] << wire45);
  assign wire47 = $unsigned($unsigned((wire42[(1'h0):(1'h0)] ^ ((^~wire42) ?
                      $unsigned(wire43) : $unsigned(wire45)))));
  assign wire48 = wire44;
  assign wire49 = wire43[(2'h3):(2'h2)];
  assign wire50 = wire42[(2'h2):(1'h0)];
  assign wire51 = $unsigned((((&(~wire45)) ^~ wire46) >> wire43));
  assign wire52 = wire43[(2'h2):(1'h0)];
  assign wire53 = $signed({$signed((~|(wire48 ? wire44 : wire52))),
                      $signed((~$signed(wire49)))});
  always
    @(posedge clk) begin
      reg54 <= $signed(($unsigned(((wire51 ?
              wire45 : wire42) << $unsigned(wire43))) ?
          ($unsigned((wire46 ^ wire51)) ?
              {$unsigned(wire52)} : (wire52[(1'h0):(1'h0)] * wire47)) : (+(~^{wire50}))));
      reg55 <= (^~$unsigned(wire51[(2'h3):(1'h1)]));
      if ((|(($signed((wire44 ? (8'hba) : wire52)) == ($unsigned(wire42) ?
          $unsigned(reg54) : $signed(wire45))) - $unsigned(($signed(wire53) == wire50)))))
        begin
          reg56 <= ((~|wire46) | $signed((~|(wire51 ?
              (wire48 ? wire50 : wire45) : (wire52 >> wire43)))));
          reg57 <= $signed((^reg56));
          reg58 <= (wire43[(1'h1):(1'h1)] >> $unsigned(($signed(reg57[(3'h7):(1'h1)]) < (+$unsigned(reg55)))));
          if ((((reg58[(5'h13):(4'hc)] ^ ((~^wire44) ?
                      (wire43 ? reg57 : reg54) : ((8'h9f) | wire42))) ?
                  (wire53 ?
                      $signed(reg57) : wire53) : (~|reg58[(5'h11):(2'h3)])) ?
              (&$signed((8'hb0))) : $signed(((wire51[(4'hb):(4'ha)] ?
                      (wire51 > wire42) : (wire53 | (7'h43))) ?
                  $unsigned($signed(reg58)) : (^wire49[(2'h2):(1'h1)])))))
            begin
              reg59 <= ($unsigned($unsigned({wire47[(2'h3):(2'h3)]})) & (+wire43[(1'h1):(1'h1)]));
              reg60 <= (^reg59[(4'hd):(3'h5)]);
              reg61 <= $unsigned($signed(wire48[(3'h5):(2'h3)]));
              reg62 <= wire50[(3'h6):(2'h2)];
            end
          else
            begin
              reg59 <= {wire43[(2'h3):(1'h1)]};
              reg60 <= {$unsigned(wire45)};
              reg61 <= $unsigned(((~^wire47[(1'h0):(1'h0)]) ^~ $signed(wire46[(2'h2):(1'h1)])));
            end
          reg63 <= (~&(reg54 && $signed($signed((~&reg54)))));
        end
      else
        begin
          reg56 <= ((~&(reg63 ?
                  {(8'hbb),
                      (wire43 ?
                          wire47 : (8'hae))} : (((8'haa) > wire46) && {reg55}))) ?
              (reg55 ?
                  $unsigned(((wire46 >> (8'h9e)) ~^ {reg59})) : (^~(|(wire53 ?
                      reg59 : reg57)))) : wire42);
          reg57 <= $signed($unsigned($unsigned(({reg61, reg54} ?
              $unsigned(wire50) : {(8'hbd)}))));
          reg58 <= (^((($unsigned(reg63) ? wire43 : $signed(wire42)) ?
              {(&reg56),
                  ((8'h9e) ?
                      (8'h9d) : wire47)} : (reg56 ~^ (reg56 == wire45))) || ((^~$unsigned((8'hbd))) <<< $unsigned((~reg62)))));
        end
      reg64 <= (wire52 < {wire43});
    end
  assign wire65 = wire44[(3'h5):(1'h0)];
  assign wire66 = wire45[(4'h9):(3'h5)];
  assign wire67 = (reg56 << $unsigned(((-((8'hac) != (8'ha0))) ~^ $unsigned(wire43))));
  assign wire68 = ((^$unsigned($unsigned((wire67 + wire43)))) ?
                      $unsigned($signed($unsigned($signed(reg60)))) : wire49);
  assign wire69 = $signed((|$signed(((wire67 < reg58) ^ (wire47 ?
                      wire67 : reg58)))));
  assign wire70 = $unsigned(($signed(((8'had) & (reg54 ?
                      wire49 : wire48))) <<< reg60[(3'h5):(1'h0)]));
endmodule

module module93
#(parameter param112 = (&(!({((8'haa) ? (8'ha7) : (8'haf)), ((8'hb0) < (7'h42))} ? {(+(8'hae)), ((8'hbc) ? (8'hb6) : (8'hb1))} : ((8'ha7) ^~ ((8'hbb) ^~ (8'hb2)))))))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire97;
  input wire [(4'hb):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire98;
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  assign y = {wire111,
                 wire109,
                 wire108,
                 wire99,
                 wire98,
                 reg110,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire98 = $signed((8'ha6));
  assign wire99 = ((($unsigned((wire95 - wire95)) ^ {$unsigned(wire97),
                              $unsigned(wire98)}) ?
                          (~(8'hab)) : (8'ha4)) ?
                      $signed({(wire95[(1'h0):(1'h0)] ?
                              wire98 : $signed((8'hba)))}) : ({{$signed(wire97)},
                          {(wire96 ? wire98 : wire95), wire95}} + wire95));
  always
    @(posedge clk) begin
      if ((~&(wire98[(5'h10):(5'h10)] ?
          (~(wire95[(2'h3):(2'h2)] ?
              (wire94 ? wire95 : wire99) : (wire99 ?
                  wire99 : wire97))) : (($unsigned(wire94) && $unsigned(wire98)) ^ wire95[(2'h3):(2'h3)]))))
        begin
          reg100 <= wire98[(5'h10):(3'h4)];
          if ($unsigned(wire94[(2'h2):(1'h0)]))
            begin
              reg101 <= wire96;
              reg102 <= wire94[(3'h4):(2'h3)];
              reg103 <= wire97;
              reg104 <= wire98;
              reg105 <= $signed(wire95);
            end
          else
            begin
              reg101 <= reg102;
              reg102 <= reg104;
              reg103 <= reg103;
              reg104 <= {(^~(&(wire99[(4'h9):(3'h4)] ?
                      {reg103} : $signed(reg104)))),
                  (($signed($signed((8'ha6))) <<< (wire99[(3'h4):(3'h4)] != (8'ha6))) & (8'hb0))};
            end
          reg106 <= $unsigned($signed((!reg104[(5'h13):(3'h4)])));
        end
      else
        begin
          reg100 <= ({reg102} ~^ (^{((-wire95) ? (~wire97) : $signed((8'hb8))),
              (-$unsigned(reg100))}));
          reg101 <= reg100[(2'h3):(2'h2)];
          reg102 <= wire97[(1'h0):(1'h0)];
        end
      reg107 <= (^(wire95 ?
          {$unsigned($unsigned(wire96)),
              wire95} : ((-(7'h40)) >> (!wire94[(5'h12):(3'h6)]))));
    end
  assign wire108 = ($unsigned((8'h9f)) >>> $signed($unsigned(reg106[(3'h6):(2'h2)])));
  assign wire109 = (~|$signed($unsigned((reg106[(3'h7):(1'h0)] ?
                       wire94[(4'hc):(4'hb)] : {(8'hbd)}))));
  always
    @(posedge clk) begin
      reg110 <= $signed($unsigned(reg104));
    end
  assign wire111 = $signed(($signed(reg101) >>> reg100));
endmodule
