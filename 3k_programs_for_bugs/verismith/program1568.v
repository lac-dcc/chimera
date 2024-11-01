module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1cf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire113;
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  assign y = {wire136,
                 wire123,
                 wire122,
                 wire117,
                 wire116,
                 wire115,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire76,
                 wire113,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 (1'h0)};
  assign wire5 = ($unsigned($unsigned(wire3)) * $signed(wire4));
  assign wire6 = wire5;
  assign wire7 = ($signed({$signed(((8'hbb) ? wire0 : wire0)),
                     (~$signed(wire2))}) || wire6);
  assign wire8 = wire7;
  module9 #() modinst77 (wire76, clk, wire8, wire0, wire2, wire4);
  always
    @(posedge clk) begin
      reg78 <= (((~(~(wire3 ? wire5 : wire4))) ?
              $signed((~(~wire8))) : ($signed((^~wire0)) ?
                  {{(8'hb0), (8'ha1)}} : (8'ha0))) ?
          (-(&$unsigned(wire8))) : ($unsigned({$unsigned((8'had)),
                  $signed((8'ha0))}) ?
              ($unsigned(wire3[(2'h3):(1'h0)]) ^ ($signed(wire76) > wire5[(3'h4):(2'h2)])) : (~|wire8[(3'h6):(3'h6)])));
      if ($signed((wire0[(1'h1):(1'h1)] || $signed($signed((wire1 ?
          (8'ha9) : wire6))))))
        begin
          reg79 <= {($unsigned((wire8 + (wire3 >= wire4))) ?
                  $unsigned(($unsigned(wire7) ?
                      wire7 : (wire2 ? wire6 : wire0))) : (^~{wire8})),
              wire8[(5'h10):(1'h0)]};
          reg80 <= reg79[(5'h12):(3'h7)];
          if (wire3)
            begin
              reg81 <= $unsigned({$signed(($signed(reg78) != {reg78}))});
              reg82 <= wire76;
            end
          else
            begin
              reg81 <= (8'h9f);
              reg82 <= ({wire76[(2'h3):(1'h0)], reg81[(2'h2):(1'h0)]} < wire4);
              reg83 <= $signed((({$signed(wire4)} ~^ (|(&wire2))) << $signed($signed($signed((8'hb6))))));
              reg84 <= ((&$unsigned($unsigned({(8'hb2)}))) && (~|$unsigned(wire3)));
            end
          reg85 <= wire7[(4'h8):(2'h2)];
        end
      else
        begin
          if ((&$signed(($signed((~^reg78)) ?
              ($unsigned(reg84) ?
                  (wire5 <<< reg85) : reg81) : {$unsigned(reg81)}))))
            begin
              reg79 <= (wire1 > ($unsigned(($unsigned(wire2) ~^ $signed(reg81))) ~^ (wire3 ?
                  (7'h43) : $signed((reg79 ? wire4 : reg80)))));
              reg80 <= $signed(wire3);
              reg81 <= wire2[(2'h3):(2'h2)];
              reg82 <= reg81;
              reg83 <= ((~&$signed((8'hb6))) ? (~&reg79) : wire6);
            end
          else
            begin
              reg79 <= reg81;
              reg80 <= ((~^wire4[(2'h3):(1'h1)]) ?
                  (($unsigned((wire3 ? (8'ha8) : reg85)) ?
                          $signed($unsigned(wire5)) : (~^{wire76})) ?
                      ((-{reg78,
                          wire0}) ^ {$signed(wire4)}) : (~|(~(~reg80)))) : ($unsigned(reg78) + reg83));
              reg81 <= $unsigned((wire5 - wire0[(1'h1):(1'h1)]));
            end
          reg84 <= $unsigned(((^$signed(wire76)) ?
              (~&wire2) : (wire6[(2'h3):(2'h3)] & $signed(reg81[(2'h3):(1'h1)]))));
          if ({$unsigned($signed(reg83[(3'h6):(3'h6)])),
              (reg80 ?
                  {($unsigned(reg83) | (^~reg85)),
                      (8'hbc)} : $unsigned({$signed(wire5)}))})
            begin
              reg85 <= wire4[(1'h0):(1'h0)];
              reg86 <= reg83;
            end
          else
            begin
              reg85 <= $unsigned(wire5);
              reg86 <= (wire4 >= reg78[(4'hc):(4'hb)]);
              reg87 <= reg84;
            end
          reg88 <= $signed(wire1);
        end
      reg89 <= wire6[(3'h6):(3'h5)];
      reg90 <= ((~wire8) & {$unsigned({$unsigned(reg80), (~wire0)}),
          ({$signed(reg85)} <= reg80)});
      reg91 <= (wire7[(3'h7):(3'h6)] ?
          (^~{(~^reg80), wire1[(4'hc):(4'h9)]}) : ((~&$signed(reg78)) ?
              ($signed(((8'ha7) <<< (8'h9c))) ?
                  ((&reg78) ?
                      $unsigned(reg79) : reg82[(2'h3):(1'h1)]) : (&$unsigned(reg86))) : ($signed((wire2 ?
                      wire5 : wire5)) ?
                  wire7[(4'hc):(4'hc)] : (&reg81[(2'h3):(1'h1)]))));
    end
  module92 #() modinst114 (wire113, clk, wire3, wire1, reg84, wire5);
  assign wire115 = ($signed({($signed((8'h9c)) ? {reg78} : $signed(reg91)),
                       $signed((wire6 ~^ (8'hb7)))}) << $unsigned(wire76));
  assign wire116 = $signed((~^($signed((wire76 == wire7)) ?
                       ($signed(reg84) ?
                           (~reg86) : $signed((8'hb3))) : (wire113[(3'h4):(1'h1)] ~^ (reg83 ?
                           reg87 : reg86)))));
  assign wire117 = wire3[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      reg118 <= $signed($signed((wire1[(3'h6):(1'h0)] & ({reg80, wire5} ?
          reg87 : $unsigned(wire8)))));
      reg119 <= {wire3[(3'h4):(1'h1)], wire117[(1'h0):(1'h0)]};
      reg120 <= ($signed((((~|reg118) ? (!wire6) : reg87) ?
              (~|(reg118 >>> wire7)) : (wire6[(4'h9):(3'h7)] ^~ wire6))) ?
          wire3[(3'h5):(1'h1)] : ((wire6 ?
                  wire113[(1'h0):(1'h0)] : ((^~wire115) ?
                      wire2[(2'h3):(1'h1)] : reg88[(2'h3):(1'h0)])) ?
              reg81[(2'h2):(2'h2)] : ((8'hb8) ^~ (!{reg80}))));
      reg121 <= $unsigned(($signed(wire113[(1'h1):(1'h0)]) == wire4));
    end
  assign wire122 = $signed($unsigned({wire115[(4'hd):(3'h5)]}));
  assign wire123 = $signed((reg119 ? $signed(wire7[(4'hd):(2'h2)]) : (7'h42)));
  always
    @(posedge clk) begin
      reg124 <= ((7'h42) || (~|((^(~&wire3)) & wire122[(2'h2):(2'h2)])));
    end
  always
    @(posedge clk) begin
      reg125 <= ((!$unsigned((reg82 ?
          reg88 : ((8'ha8) ?
              wire122 : reg118)))) ^ $unsigned((wire122[(4'h9):(3'h6)] ?
          ($unsigned(reg85) < (reg124 ? reg88 : reg84)) : $signed(wire116))));
      if ($unsigned((reg88 && (reg121 ?
          (reg89[(2'h3):(2'h3)] ? reg81 : (!wire5)) : (^~(reg120 ?
              reg124 : wire6))))))
        begin
          reg126 <= (reg90[(1'h1):(1'h1)] ?
              (wire3 ? reg85[(4'ha):(4'h8)] : wire3) : $signed((reg82 ?
                  (|wire4) : $unsigned((reg84 ? reg83 : reg79)))));
          reg127 <= ({$signed(((+wire123) << wire123[(5'h13):(1'h1)])),
                  $signed(((~reg125) ? {reg121, reg87} : (8'ha2)))} ?
              (-{$signed({reg126})}) : $signed($signed((-(wire115 ?
                  wire5 : wire115)))));
          reg128 <= wire1[(4'hd):(1'h1)];
          reg129 <= wire116[(2'h3):(2'h3)];
          reg130 <= (8'ha2);
        end
      else
        begin
          reg126 <= wire1[(1'h0):(1'h0)];
          reg127 <= $signed({($unsigned((^reg125)) ?
                  ((^~reg80) ^~ (^reg119)) : ($signed(reg84) ?
                      $unsigned(wire115) : {reg86}))});
          reg128 <= (~|(-$unsigned(reg88)));
          if (((8'hb9) ^~ wire8))
            begin
              reg129 <= {((reg85 ?
                      $signed((reg126 ?
                          reg128 : wire113)) : ($unsigned(wire113) != $signed(wire113))) >= wire115)};
            end
          else
            begin
              reg129 <= {(-wire7)};
              reg130 <= (^~reg89[(2'h3):(1'h0)]);
              reg131 <= {{$unsigned($unsigned(reg119[(3'h7):(2'h3)]))}};
              reg132 <= (&(^reg78[(1'h0):(1'h0)]));
              reg133 <= reg90;
            end
          reg134 <= ((+(reg84 ?
                  reg124[(5'h11):(5'h10)] : (~^$unsigned(reg124)))) ?
              (reg83[(4'h8):(2'h2)] ?
                  reg89 : reg79[(4'h9):(3'h5)]) : $signed(wire4[(4'hb):(1'h0)]));
        end
      reg135 <= (($signed((~|$unsigned((8'h9f)))) ?
          $unsigned(wire76) : {reg128[(1'h0):(1'h0)]}) || (&$unsigned(reg128)));
    end
  assign wire136 = $signed($unsigned(reg121[(2'h2):(1'h1)]));
endmodule

module module92
#(parameter param112 = ((((((8'haa) == (8'ha4)) >= (!(8'ha6))) != ((|(8'hab)) >>> (~|(8'h9f)))) && (((-(8'hbc)) ? ((7'h40) ^ (8'hb4)) : (~^(8'ha7))) ? (|((8'ha8) ? (7'h44) : (8'hb7))) : (!{(8'ha4), (8'hb9)}))) != (({((8'ha8) ? (8'hb0) : (8'haa)), (~^(8'ha7))} && {((8'h9f) ^ (8'hba))}) ? (!(-((8'ha3) ? (8'hba) : (8'h9d)))) : {(^((8'hb1) ^ (8'ha2))), (((7'h42) != (8'hae)) ? ((8'hb7) ? (7'h40) : (8'hb1)) : (|(8'hbd)))})))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire96;
  input wire [(2'h2):(1'h0)] wire95;
  input wire signed [(4'hd):(1'h0)] wire94;
  input wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg97 <= (wire95[(2'h2):(1'h1)] ?
          wire93[(4'h9):(3'h5)] : (|wire93[(4'hc):(4'hc)]));
      reg98 <= ((!(wire96[(2'h2):(1'h0)] ?
          ((wire96 ? (8'haa) : wire96) ^~ (reg97 != wire96)) : {(~wire94),
              wire94[(4'h9):(1'h0)]})) || $unsigned(wire93[(5'h13):(4'h8)]));
      reg99 <= wire95;
      reg100 <= (({(reg98 || ((8'hb8) << reg97))} ?
          wire93 : (((wire94 ? reg99 : reg97) != (reg97 <<< wire93)) ?
              {(reg98 ? wire94 : wire96),
                  wire95} : $signed($signed(reg99)))) && (8'ha3));
    end
  assign wire101 = $unsigned($signed((reg97[(4'hb):(3'h6)] != $unsigned((7'h43)))));
  assign wire102 = wire95[(2'h2):(1'h1)];
  assign wire103 = $signed($signed($signed($unsigned(reg98))));
  assign wire104 = $signed((~^{wire102, reg100}));
  assign wire105 = $unsigned({wire96[(1'h0):(1'h0)],
                       ({(reg100 ? wire103 : wire93),
                           (8'hb1)} == {(wire102 || reg100)})});
  assign wire106 = {$unsigned((({wire102} ?
                           (reg99 ?
                               wire104 : reg98) : $unsigned(reg99)) & (-wire101[(2'h3):(2'h3)])))};
  assign wire107 = (!$unsigned(({$unsigned(reg99)} - ((-wire104) ?
                       wire103[(1'h0):(1'h0)] : (^~reg97)))));
  assign wire108 = {{({wire106[(5'h10):(1'h0)]} != $signed(wire95)),
                           (wire101[(1'h0):(1'h0)] >>> (wire103 ?
                               reg97 : (7'h43)))}};
  assign wire109 = $unsigned($unsigned($unsigned(($unsigned(reg99) <= (8'ha6)))));
  assign wire110 = ($unsigned($signed(wire109)) || ((wire102 ?
                           wire109[(4'h8):(1'h1)] : wire93) ?
                       $signed((+$signed(wire96))) : ((wire101[(3'h4):(3'h4)] ?
                               (wire106 ? wire107 : reg97) : $unsigned(reg98)) ?
                           reg97[(3'h7):(3'h4)] : $unsigned($unsigned(wire102)))));
  assign wire111 = $unsigned((^~$unsigned(($signed(wire95) << (wire107 ?
                       reg100 : wire109)))));
endmodule

module module9
#(parameter param75 = ((((~^(~(8'hb7))) >= (8'haa)) ^~ ({((8'ha7) + (8'hb6)), ((8'hbd) != (8'haf))} ? {(&(8'hab))} : (((8'hb3) ? (8'hb1) : (8'hb5)) + ((8'hb6) ? (8'ha4) : (8'h9f))))) & (+(((~^(8'haa)) ? (~^(8'hbe)) : (~^(8'hab))) ? (~((8'hac) | (8'ha9))) : {(^~(8'hb1))}))))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire73;
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire14,
                 wire37,
                 wire73,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire14 = {wire11[(3'h7):(2'h2)]};
  always
    @(posedge clk) begin
      reg15 <= (8'hb1);
      reg16 <= wire14[(1'h0):(1'h0)];
    end
  module17 #() modinst38 (.wire20(wire10), .wire22(wire13), .wire21(wire11), .wire19(reg16), .clk(clk), .y(wire37), .wire18(wire14));
  always
    @(posedge clk) begin
      reg39 <= wire12;
      if (($unsigned($unsigned(wire14)) ?
          wire37[(4'h9):(3'h6)] : $signed($unsigned(((wire10 <<< wire12) && ((8'ha8) >> reg16))))))
        begin
          reg40 <= (8'hae);
          reg41 <= ($unsigned(reg40) >>> wire11[(4'he):(4'h8)]);
        end
      else
        begin
          reg40 <= {$unsigned((!reg41[(1'h1):(1'h1)])),
              (wire12 >> reg40[(3'h6):(2'h3)])};
          reg41 <= (-wire10);
          if (wire10[(4'h8):(3'h5)])
            begin
              reg42 <= $unsigned(($signed((reg15[(2'h3):(2'h3)] ?
                  $signed((8'h9e)) : wire10[(2'h2):(1'h0)])) < (+((wire12 ?
                  wire10 : reg40) < (wire10 ? reg15 : reg16)))));
              reg43 <= $unsigned(($unsigned((reg40[(3'h5):(2'h3)] ?
                  ((7'h44) == wire13) : (reg39 != (8'hbc)))) >>> (~^((wire10 ?
                  reg16 : reg39) >>> $signed(wire37)))));
              reg44 <= (&wire37);
              reg45 <= (^reg42);
              reg46 <= $unsigned(reg40[(3'h6):(3'h6)]);
            end
          else
            begin
              reg42 <= $signed((!{(~|$signed((8'hb6))), $signed(reg16)}));
              reg43 <= $signed($signed($signed(($unsigned(reg16) ?
                  (reg39 - reg40) : $signed(wire13)))));
              reg44 <= (&wire14);
              reg45 <= $unsigned({((((8'hbc) ? (8'hbe) : reg43) ?
                      $signed(wire37) : $signed((8'hbb))) << $signed((reg40 ?
                      reg39 : wire10))),
                  (&reg41[(2'h2):(1'h0)])});
              reg46 <= $signed(($signed((~|wire13[(2'h3):(2'h3)])) > (((8'haa) ?
                  wire37 : $signed((8'hb9))) - {(^~wire13)})));
            end
          reg47 <= {(8'hac)};
        end
    end
  module48 #() modinst74 (.y(wire73), .wire51(reg42), .clk(clk), .wire53(reg43), .wire50(reg16), .wire49(reg15), .wire52(wire10));
endmodule

module module48
#(parameter param71 = (!((|(&((8'hab) && (8'hb7)))) * (((~&(8'hbe)) ? ((8'ha6) ^~ (8'hbe)) : (~&(8'ha4))) ? {((7'h44) < (8'ha5)), ((7'h42) <= (8'ha9))} : (~^((8'hbe) ? (8'ha7) : (8'ha2)))))), 
parameter param72 = (param71 ? ((~^({param71, param71} < ((8'hb5) ^~ param71))) ? (^((~&(8'h9c)) << (7'h42))) : {param71, ((^~param71) != param71)}) : param71))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire53;
  input wire [(4'hb):(1'h0)] wire52;
  input wire [(5'h10):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire62,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire54 = (wire53[(1'h0):(1'h0)] ?
                      $unsigned({wire53[(2'h3):(1'h1)]}) : (((wire50 ?
                              $unsigned(wire52) : {wire53}) ?
                          (wire50 ?
                              $unsigned(wire49) : $unsigned(wire51)) : $signed(((7'h41) ?
                              wire49 : wire51))) == ((~^(wire49 ?
                          wire52 : wire53)) == wire51)));
  assign wire55 = $unsigned(((~^$signed({wire54})) ?
                      (($unsigned(wire54) ?
                          (wire51 ?
                              wire54 : wire50) : wire53[(1'h0):(1'h0)]) | wire51[(4'hf):(4'hd)]) : (7'h41)));
  assign wire56 = ((8'h9e) ?
                      {$signed(((~^wire50) > $signed(wire54)))} : $signed($unsigned((~$signed(wire55)))));
  assign wire57 = ((($unsigned((wire52 ? (8'hb3) : wire54)) ?
                      (8'hb6) : {$signed(wire54)}) != ((((8'haf) ?
                          wire50 : wire56) & (~^wire55)) ?
                      $unsigned(wire53[(1'h0):(1'h0)]) : $signed((~|wire49)))) <= {(8'had)});
  assign wire58 = wire56;
  assign wire59 = $unsigned($signed((^~{$signed(wire53), wire58})));
  always
    @(posedge clk) begin
      reg60 <= wire55[(2'h3):(2'h2)];
      reg61 <= $unsigned(((wire51[(3'h5):(1'h1)] ?
          $unsigned(wire54) : {(wire51 != wire49),
              (reg60 ? wire55 : wire59)}) <<< (+(8'hbe))));
    end
  assign wire62 = ((wire57 ?
                      wire57 : wire57) & ($unsigned(wire53[(2'h2):(1'h0)]) ?
                      {wire59, wire56[(2'h2):(1'h0)]} : {(reg60 >= wire50)}));
  always
    @(posedge clk) begin
      reg63 <= (wire52[(3'h5):(1'h1)] ?
          ((^((!wire55) ?
              (|wire58) : $unsigned(wire56))) || wire56[(3'h6):(2'h3)]) : (~&$unsigned($signed($unsigned(reg61)))));
      reg64 <= wire51[(1'h1):(1'h1)];
      reg65 <= wire56;
    end
  assign wire66 = wire52[(3'h7):(3'h7)];
  assign wire67 = $signed(wire59[(1'h1):(1'h1)]);
  assign wire68 = reg61;
  assign wire69 = (((^wire53[(1'h1):(1'h0)]) ^ (^~(8'hbd))) ~^ $unsigned((((!wire66) ^~ {wire51,
                      wire55}) + {(8'ha2)})));
  assign wire70 = ((wire50 ^ (&(wire59 | (8'ha6)))) ^ $unsigned(wire59[(4'h9):(3'h4)]));
endmodule

module module17
#(parameter param36 = {(-(&((&(7'h44)) == (!(8'ha2)))))})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire25,
                 wire23,
                 reg35,
                 reg34,
                 reg28,
                 reg27,
                 reg26,
                 reg24,
                 (1'h0)};
  assign wire23 = (wire21[(4'hc):(2'h2)] || {(8'haa)});
  always
    @(posedge clk) begin
      reg24 <= ({(({wire19, wire18} ?
              $unsigned(wire20) : $signed(wire22)) == {(~&wire20),
              $signed(wire22)}),
          wire21} ~^ ($signed({(wire20 ?
              wire23 : wire19)}) >>> (-$signed((8'hb6)))));
    end
  assign wire25 = (wire20[(1'h1):(1'h1)] ~^ $signed((!$signed(((8'ha6) ^ wire21)))));
  always
    @(posedge clk) begin
      reg26 <= (((+(~(wire23 & wire23))) ?
              (((-wire25) ?
                  wire21 : $signed(wire18)) - wire21[(3'h5):(3'h4)]) : $signed(wire25)) ?
          $unsigned((~|((wire20 ? (8'ha2) : wire18) ?
              $unsigned(wire25) : (^~wire19)))) : wire25[(4'h9):(3'h5)]);
      reg27 <= {$signed(wire25),
          $signed($unsigned((~&(reg26 ? wire22 : (8'hb5)))))};
      reg28 <= $signed(wire19[(2'h2):(1'h1)]);
    end
  assign wire29 = ((!$unsigned(wire20)) ?
                      ((!reg28[(4'h8):(2'h2)]) < (((^~(7'h40)) >= $unsigned(wire19)) ?
                          (8'hb6) : {$unsigned(reg26)})) : $signed(($unsigned($unsigned((8'haa))) ?
                          (8'hba) : ((reg28 & reg26) ?
                              (wire18 ? reg24 : wire22) : (wire19 - wire18)))));
  assign wire30 = reg27;
  assign wire31 = reg24[(4'hd):(2'h2)];
  assign wire32 = $signed(wire21[(5'h11):(3'h4)]);
  assign wire33 = (^($signed(($unsigned(wire29) ?
                          (wire19 >>> wire21) : $signed(wire23))) ?
                      (|$signed($unsigned((8'ha1)))) : (wire20[(1'h1):(1'h0)] * $unsigned((wire31 ?
                          wire18 : wire29)))));
  always
    @(posedge clk) begin
      reg34 <= (($signed(wire30[(2'h2):(1'h0)]) ?
          wire32[(2'h2):(1'h0)] : reg26[(2'h2):(1'h0)]) >= ((|(wire20[(2'h3):(2'h2)] ?
              wire33 : (wire25 ? reg28 : wire19))) ?
          wire29[(3'h6):(3'h6)] : $signed({$signed(reg26)})));
      reg35 <= (reg34 ?
          (wire29 ^ (+((8'hba) && $unsigned(reg34)))) : (^~($unsigned((wire29 ?
              wire33 : wire20)) ~^ ((wire31 ? wire20 : reg26) > (wire31 ?
              wire19 : reg28)))));
    end
endmodule
