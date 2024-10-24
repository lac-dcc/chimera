module top
#(parameter param142 = (~|(((((8'hb5) ~^ (8'h9c)) >= (&(8'hbe))) + ((7'h41) ? ((7'h41) ? (8'hb0) : (8'hb1)) : (~^(8'hac)))) ? {(~&((8'hbd) > (8'hb0)))} : (8'hbb))), 
parameter param143 = param142)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire141;
  wire [(3'h6):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire141, wire139, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed(($signed((wire2 ?
                     wire4 : $unsigned(wire3))) ^ ($signed(wire3) && (~^wire0[(1'h0):(1'h0)]))));
  assign wire6 = wire4;
  assign wire7 = (!wire5[(5'h14):(4'he)]);
  assign wire8 = wire6[(4'hb):(3'h5)];
  module9 #() modinst140 (.wire11(wire6), .clk(clk), .wire10(wire7), .wire12(wire2), .wire13(wire4), .y(wire139));
  assign wire141 = (!$unsigned((7'h44)));
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire49;
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire119,
                 wire117,
                 wire116,
                 wire115,
                 wire113,
                 wire73,
                 wire72,
                 wire70,
                 wire14,
                 wire15,
                 wire16,
                 wire49,
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
                 reg120,
                 reg118,
                 (1'h0)};
  assign wire14 = $unsigned($signed((~wire13[(1'h0):(1'h0)])));
  assign wire15 = $signed(((((!wire11) ?
                      (~|wire12) : (wire12 ? wire12 : wire10)) + ((wire12 ?
                          wire11 : (8'ha4)) ?
                      $unsigned(wire13) : (wire13 ?
                          wire11 : wire13))) >> (($unsigned(wire12) ?
                      $unsigned(wire13) : (wire13 ?
                          (8'hb5) : (8'hbd))) << $signed((wire13 ?
                      wire14 : wire13)))));
  assign wire16 = (~|{$signed($signed((-wire14)))});
  module17 #() modinst50 (wire49, clk, wire16, wire10, wire13, wire12, wire11);
  module51 #() modinst71 (.clk(clk), .wire52(wire16), .wire55(wire49), .wire54(wire14), .y(wire70), .wire53(wire11));
  assign wire72 = ($signed(((wire12 <= wire14) ?
                      $signed(wire70[(3'h6):(3'h4)]) : $signed(wire12))) < $signed({wire49[(2'h2):(2'h2)]}));
  assign wire73 = $signed($signed($unsigned(wire12[(2'h3):(1'h0)])));
  module74 #() modinst114 (.wire76(wire16), .wire78(wire70), .wire77(wire10), .y(wire113), .wire75(wire13), .clk(clk));
  assign wire115 = wire49[(1'h0):(1'h0)];
  assign wire116 = (8'h9e);
  assign wire117 = ($unsigned(((wire49 <<< $unsigned(wire10)) << (wire16 * wire113))) && (~|(~(~|$unsigned((8'hb0))))));
  always
    @(posedge clk) begin
      reg118 <= (-(~$signed(wire116[(2'h2):(1'h0)])));
    end
  assign wire119 = (wire13 & $unsigned((((^~reg118) ?
                       (7'h41) : (wire72 + (8'hbc))) * wire12)));
  always
    @(posedge clk) begin
      if (((wire15 << wire16) ?
          ((wire73[(3'h7):(3'h4)] * ($unsigned(wire12) ?
                  reg118 : (wire15 ? wire11 : wire11))) ?
              wire117[(2'h3):(1'h0)] : $signed((^~wire12[(4'hf):(4'hd)]))) : (^$unsigned(({(8'hab),
                  wire12} ?
              ((8'ha2) == wire113) : wire73)))))
        begin
          if (wire116)
            begin
              reg120 <= ((($unsigned($signed(wire117)) ?
                      $unsigned((wire14 ?
                          (8'hbb) : wire13)) : {(wire12 ^ wire13)}) ?
                  ($signed((7'h43)) ?
                      reg118 : $signed((~^wire72))) : (&$signed(wire117))) + $signed(((-(~&wire15)) ?
                  (!(wire10 ? wire16 : (8'ha1))) : $signed((~wire16)))));
              reg121 <= wire14[(3'h4):(3'h4)];
              reg122 <= (&($unsigned(wire10[(4'hc):(3'h7)]) <<< ($signed($unsigned(reg121)) >>> {wire119[(3'h6):(1'h0)]})));
            end
          else
            begin
              reg120 <= wire14;
              reg121 <= $signed($signed($signed(wire14)));
              reg122 <= ((8'hb1) ?
                  ($unsigned(reg120[(4'h8):(2'h3)]) ^~ (reg121 ?
                      reg120 : wire11[(4'hc):(4'hb)])) : wire10);
            end
          reg123 <= (&wire49);
        end
      else
        begin
          reg120 <= $unsigned(wire14);
          reg121 <= reg118;
          if (wire119[(3'h4):(2'h2)])
            begin
              reg122 <= {(~^((wire70[(2'h3):(2'h2)] <<< (~&reg121)) - (~$signed((8'hbe))))),
                  (!(((~^reg122) ?
                      wire115 : wire11[(2'h2):(2'h2)]) <= (reg121[(3'h4):(2'h2)] > wire117[(3'h4):(2'h2)])))};
              reg123 <= reg121[(3'h6):(2'h3)];
              reg124 <= (+(7'h42));
              reg125 <= wire113[(1'h1):(1'h1)];
              reg126 <= (^~$unsigned($signed($signed($unsigned(wire115)))));
            end
          else
            begin
              reg122 <= $signed({wire16, $signed($unsigned($signed(wire16)))});
              reg123 <= wire16;
              reg124 <= wire116[(3'h6):(1'h1)];
            end
          reg127 <= wire119[(1'h1):(1'h0)];
          reg128 <= {wire13,
              ((~wire14) ? wire13[(4'h8):(3'h5)] : $signed(wire14))};
        end
      reg129 <= (~&(~^reg123));
      reg130 <= wire116;
      reg131 <= ((((8'ha6) <= $signed(wire49[(3'h4):(1'h0)])) - (({reg127,
              reg126} ^ reg128) != (wire73[(5'h10):(4'h9)] ?
              (8'ha3) : {wire16, wire113}))) ?
          reg120 : $signed(reg121[(3'h4):(2'h2)]));
      if ($signed(reg129))
        begin
          if ($unsigned(reg130))
            begin
              reg132 <= (reg120 ?
                  (({$signed(wire116)} >>> $signed({(8'hb0)})) ?
                      $signed(reg126) : (~{(~|wire113)})) : (7'h40));
              reg133 <= $unsigned($unsigned((($signed(wire14) ?
                      (8'h9f) : (wire113 * wire115)) ?
                  ($unsigned(wire116) ?
                      $signed(wire15) : $unsigned(wire10)) : wire11)));
            end
          else
            begin
              reg132 <= reg131[(1'h0):(1'h0)];
              reg133 <= (^~{(wire13 ? wire117 : {$signed((8'h9d))})});
              reg134 <= (reg130 > {(!{wire115[(4'h9):(3'h4)], {(8'ha0)}}),
                  wire73});
              reg135 <= reg130[(2'h2):(2'h2)];
            end
          reg136 <= $signed((reg134 > $unsigned($unsigned($signed(wire49)))));
        end
      else
        begin
          reg132 <= reg121[(2'h2):(2'h2)];
        end
    end
  assign wire137 = wire119;
  assign wire138 = (reg133 << (($signed(((8'ha7) ? wire15 : wire14)) ?
                       reg121[(3'h6):(3'h6)] : {{reg125},
                           (wire73 == reg123)}) == wire119));
endmodule

module module74
#(parameter param111 = (&{(|(((8'hb1) ? (8'ha4) : (8'hb8)) ? {(8'hae)} : ((8'ha0) ? (8'hb3) : (8'ha0)))), (~&(~(8'ha9)))}), 
parameter param112 = param111)
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  input wire signed [(5'h10):(1'h0)] wire76;
  input wire [(4'h8):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire79;
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  assign y = {wire110,
                 wire107,
                 wire106,
                 wire97,
                 wire79,
                 reg109,
                 reg108,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 (1'h0)};
  assign wire79 = (8'hac);
  always
    @(posedge clk) begin
      reg80 <= (|($signed(wire76[(5'h10):(3'h7)]) | wire78));
      if ($signed(((!(wire78 ?
          (wire77 ?
              wire76 : reg80) : $signed(wire75))) ^~ $signed($unsigned((~&(8'hb7)))))))
        begin
          reg81 <= {$unsigned({$unsigned(wire77[(4'h8):(4'h8)]),
                  $signed($signed((7'h41)))}),
              wire76[(4'hb):(2'h2)]};
          reg82 <= $signed(wire79[(1'h0):(1'h0)]);
          reg83 <= $unsigned(reg82[(3'h4):(2'h3)]);
          if ((wire77[(1'h0):(1'h0)] == wire77))
            begin
              reg84 <= $unsigned((~|$signed((wire75[(2'h3):(2'h3)] - (wire79 ?
                  wire78 : reg80)))));
              reg85 <= wire76[(5'h10):(4'ha)];
              reg86 <= wire75[(3'h7):(2'h2)];
              reg87 <= ({reg81[(3'h7):(3'h7)]} <<< ((+$unsigned(reg84[(4'h9):(1'h1)])) ?
                  reg84[(4'hc):(4'ha)] : $unsigned((^$signed((8'ha8))))));
            end
          else
            begin
              reg84 <= ($unsigned(wire75) != $unsigned(($signed(reg84) ?
                  $unsigned(reg86) : reg85)));
              reg85 <= (-($unsigned({$signed((8'ha0))}) ?
                  {$signed((wire77 ? wire78 : wire75)),
                      {$signed(reg80), {reg82, reg85}}} : (&((reg83 ?
                          reg86 : wire76) ?
                      $signed(reg85) : reg85))));
              reg86 <= (wire76 ?
                  $signed((&($unsigned(reg87) ~^ $unsigned(reg82)))) : $signed((+(~&(+wire79)))));
            end
        end
      else
        begin
          reg81 <= {({((wire75 > (8'hb8)) == (reg80 | reg83)),
                      ((~^wire75) ?
                          wire79[(3'h4):(1'h1)] : (wire78 ? reg87 : reg84))} ?
                  $signed(reg82[(3'h6):(3'h6)]) : (^~{reg80[(3'h5):(3'h5)]})),
              ((((8'hac) ?
                      (7'h40) : reg80[(5'h12):(3'h6)]) << $signed($signed(wire78))) ?
                  (^{(wire78 >>> reg81)}) : $signed((~^$unsigned(reg80))))};
          if ($unsigned(wire79))
            begin
              reg82 <= $signed(((wire75 || {reg84, (^~wire76)}) ?
                  reg82[(3'h5):(1'h0)] : $signed(wire76)));
              reg83 <= ($signed(wire78) ^~ (reg86 <= reg84));
            end
          else
            begin
              reg82 <= $signed($signed((7'h41)));
            end
        end
      reg88 <= $signed(($signed({$signed(wire77), $signed(wire76)}) ?
          $unsigned(wire77[(3'h7):(2'h2)]) : ((^~reg87[(2'h2):(2'h2)]) ?
              ($signed(wire76) ?
                  $unsigned(reg83) : {reg86, wire77}) : wire77)));
      if ($signed($signed({reg86[(4'hf):(3'h7)]})))
        begin
          if ($unsigned({(+$unsigned(reg82))}))
            begin
              reg89 <= wire75;
              reg90 <= {wire77};
              reg91 <= ((~|$signed(reg80)) ? wire79[(2'h3):(2'h2)] : (8'hbd));
            end
          else
            begin
              reg89 <= (reg80 == ((reg91[(5'h10):(4'h8)] ?
                      (~&reg84) : $unsigned((reg80 ? reg84 : (8'hb9)))) ?
                  {reg86} : reg81));
            end
          reg92 <= (reg90 >> {$unsigned({wire77[(1'h1):(1'h1)],
                  reg81[(4'hd):(2'h3)]}),
              (~&($unsigned(wire79) ? reg88 : $signed(wire75)))});
          reg93 <= (reg89 * (!(~(((7'h43) >>> reg89) && {wire76}))));
        end
      else
        begin
          reg89 <= reg87[(1'h0):(1'h0)];
          if ((~^$signed(((~&$signed(wire76)) >>> reg86))))
            begin
              reg90 <= wire79[(1'h0):(1'h0)];
              reg91 <= $signed((+(^(^~{reg83}))));
              reg92 <= (|wire75);
              reg93 <= $unsigned(wire75);
            end
          else
            begin
              reg90 <= reg90[(2'h2):(1'h1)];
              reg91 <= (wire79[(4'h9):(1'h1)] ?
                  (reg89 ?
                      ((((8'hb5) ~^ reg83) ?
                              $signed(reg85) : (reg93 ? wire76 : (8'had))) ?
                          $signed({reg83}) : $signed($signed(reg84))) : (reg85[(1'h0):(1'h0)] <= reg80)) : $unsigned($signed($unsigned(reg87[(2'h3):(2'h2)]))));
              reg92 <= $signed((8'ha2));
            end
          reg94 <= reg90[(1'h1):(1'h1)];
        end
      if (($unsigned($unsigned(reg83[(4'hb):(4'h8)])) | ((~^(!$unsigned(reg85))) ?
          {reg87,
              reg85[(4'hb):(2'h2)]} : $signed($unsigned((reg82 << reg91))))))
        begin
          reg95 <= $unsigned((($unsigned((reg90 ?
                  (8'ha4) : reg89)) * {reg85[(2'h3):(2'h2)]}) ?
              reg88[(4'h9):(3'h5)] : {reg91[(5'h13):(4'hb)],
                  (reg93[(2'h3):(1'h1)] | {reg88, reg85})}));
        end
      else
        begin
          reg95 <= ((~^(^(reg94 >= reg92[(1'h0):(1'h0)]))) ?
              reg87[(2'h3):(1'h1)] : ($signed(reg94[(1'h1):(1'h0)]) >= ($unsigned((reg85 ?
                      reg81 : reg85)) ?
                  (|(!reg81)) : $signed(wire75[(2'h2):(1'h1)]))));
          reg96 <= $signed((~|(+reg92[(2'h2):(1'h0)])));
        end
    end
  assign wire97 = (reg91[(2'h2):(1'h1)] ?
                      ((reg92 ? wire78 : (reg80 >> (+reg94))) >= (|(~&(wire79 ?
                          reg81 : (7'h40))))) : wire77);
  always
    @(posedge clk) begin
      if ((reg89[(1'h1):(1'h0)] * $unsigned($signed(wire75))))
        begin
          reg98 <= reg95;
          reg99 <= $unsigned((8'ha7));
          reg100 <= $unsigned((reg89[(2'h3):(1'h1)] ?
              $unsigned(reg83[(4'h9):(2'h3)]) : reg94[(3'h4):(2'h2)]));
        end
      else
        begin
          reg98 <= (($signed($unsigned((^reg88))) ^ $signed((reg100 ?
                  (wire97 != reg89) : $signed(reg90)))) ?
              reg88[(1'h1):(1'h1)] : reg100[(2'h2):(1'h1)]);
          reg99 <= $signed({((-(~^(8'hac))) != $signed($signed(reg89))),
              $signed(reg93[(3'h6):(2'h2)])});
          if ($unsigned((reg83[(5'h10):(4'hd)] << (|$signed((reg88 ?
              wire75 : reg86))))))
            begin
              reg100 <= $unsigned(reg93[(3'h5):(1'h0)]);
              reg101 <= (!((reg85[(4'ha):(4'h9)] ?
                  reg88 : (reg90 + (-reg83))) * reg92[(1'h1):(1'h0)]));
              reg102 <= wire75[(2'h2):(2'h2)];
              reg103 <= $unsigned(((((|reg96) || (reg96 <= reg82)) ?
                      reg88 : reg96) ?
                  reg102 : {reg101}));
              reg104 <= $signed($unsigned((!reg93[(1'h1):(1'h0)])));
            end
          else
            begin
              reg100 <= $signed(((~|reg93) | ((~(wire78 <<< reg104)) ?
                  $signed(reg91) : {reg101, $signed(reg91)})));
              reg101 <= (({{(reg94 | reg93)}, reg103} <= ({(reg87 && reg99)} ?
                  $unsigned($unsigned((8'haf))) : reg101[(4'h8):(3'h7)])) >>> $unsigned($unsigned({reg87[(3'h4):(2'h3)]})));
              reg102 <= reg85[(4'h8):(1'h0)];
            end
        end
      reg105 <= $unsigned(($signed(reg85) - reg100[(1'h0):(1'h0)]));
    end
  assign wire106 = (!$unsigned($signed(reg91)));
  assign wire107 = reg95[(4'h9):(1'h0)];
  always
    @(posedge clk) begin
      reg108 <= (^(((8'ha6) || (^(~|wire79))) >>> reg82[(3'h5):(1'h1)]));
      reg109 <= {($signed((reg83 ?
              reg90[(1'h1):(1'h1)] : (reg100 ?
                  reg101 : wire79))) >>> ((+reg89[(2'h2):(2'h2)]) < (reg95[(4'he):(2'h3)] ?
              $unsigned(wire77) : $unsigned((8'ha0)))))};
    end
  assign wire110 = reg109;
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire signed [(5'h14):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire56;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 (1'h0)};
  assign wire56 = $signed($unsigned(({wire53} ?
                      wire54 : wire53[(3'h4):(2'h3)])));
  assign wire57 = (((~|wire53) || (~|$unsigned((~^wire52)))) ?
                      $unsigned((8'hb6)) : $unsigned({({wire54} ?
                              $unsigned(wire55) : {wire56, wire54}),
                          wire54}));
  assign wire58 = ((+(~&wire56)) ?
                      $unsigned($unsigned(wire56[(2'h2):(1'h1)])) : $unsigned((8'haf)));
  assign wire59 = ($signed($signed((+wire52[(2'h2):(1'h1)]))) ?
                      $unsigned((wire55 && $signed($unsigned(wire56)))) : $signed(wire56[(4'he):(4'hd)]));
  assign wire60 = (!(+({wire52} << wire53[(3'h4):(1'h1)])));
  assign wire61 = $signed(wire59[(4'ha):(4'ha)]);
  assign wire62 = wire55[(1'h0):(1'h0)];
  assign wire63 = wire53;
  assign wire64 = (~&$unsigned({(wire52[(1'h1):(1'h0)] > (wire55 >>> wire54)),
                      (wire63[(4'ha):(3'h5)] >> wire59)}));
  assign wire65 = $signed(($unsigned((~^{wire53, (8'ha8)})) ?
                      (^(^~{wire60})) : ($unsigned(wire53) ?
                          (+{wire54}) : ((!(8'hbe)) ?
                              $unsigned(wire58) : (wire60 << wire61)))));
  assign wire66 = wire57;
  assign wire67 = $signed((+{($signed(wire53) ?
                          (wire64 - wire53) : (wire54 >>> wire55))}));
  assign wire68 = (-$unsigned($signed(($signed((8'hba)) || (wire55 ^~ wire63)))));
  assign wire69 = $unsigned(wire63);
endmodule

module module17
#(parameter param48 = {{(^~(((8'ha5) ? (8'hae) : (8'ha2)) ? ((8'hba) > (8'ha3)) : (8'hb4)))}})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire23 = (~&(~&(($unsigned(wire18) ? {wire18} : $signed(wire20)) ?
                      (~^(~^wire22)) : ((wire21 ? (8'hac) : wire20) ?
                          wire22[(4'ha):(4'h8)] : wire20[(2'h2):(2'h2)]))));
  assign wire24 = $signed($signed($signed((~&$signed(wire18)))));
  assign wire25 = $signed(wire19);
  assign wire26 = ($unsigned((((^wire24) ?
                          (^~wire24) : $unsigned(wire21)) >> wire19)) ?
                      (^wire25) : $signed($unsigned((wire21[(1'h0):(1'h0)] ?
                          wire18[(3'h6):(2'h3)] : (8'ha1)))));
  always
    @(posedge clk) begin
      if ((((|wire26[(1'h1):(1'h0)]) && wire19) ?
          (wire21[(2'h3):(2'h2)] & (($unsigned((8'hb3)) ?
              (+wire18) : $signed(wire20)) != wire21)) : ((&$signed((wire18 << wire18))) > {(&(8'hb8)),
              wire25[(2'h2):(2'h2)]})))
        begin
          reg27 <= ($signed({wire20, $signed(wire22)}) > wire22);
          reg28 <= wire18;
          if (wire23[(4'h8):(2'h3)])
            begin
              reg29 <= $signed(((reg27 >>> ((wire25 ?
                      wire19 : (8'hbd)) <= wire21)) ?
                  (8'ha3) : wire24[(3'h4):(1'h1)]));
              reg30 <= (!$signed($unsigned((wire24 ? reg28 : reg27))));
              reg31 <= wire24;
              reg32 <= $signed(wire24);
            end
          else
            begin
              reg29 <= {($signed(((wire22 >= (8'ha7)) ?
                      (wire21 >> reg30) : {(8'haf)})) >= (^(~|$unsigned(reg28)))),
                  $signed((-$unsigned((8'hb3))))};
              reg30 <= wire24[(1'h1):(1'h1)];
              reg31 <= (reg27 ?
                  $signed(reg30[(3'h5):(1'h0)]) : reg31[(2'h2):(1'h0)]);
              reg32 <= reg31;
            end
        end
      else
        begin
          reg27 <= ($signed(wire20) - $unsigned({$unsigned($signed(reg28))}));
          if ($signed((~|reg30)))
            begin
              reg28 <= wire23[(3'h6):(2'h2)];
              reg29 <= ((~&((reg32[(1'h1):(1'h1)] & (wire19 * (7'h44))) ?
                      ($signed(reg28) ?
                          reg28[(3'h7):(1'h1)] : (wire22 ?
                              wire23 : wire19)) : $signed(((8'hba) ?
                          (8'hae) : wire21)))) ?
                  (($unsigned(reg32) ? $unsigned($signed((8'hb4))) : (8'haa)) ?
                      ((^~wire18[(4'he):(2'h2)]) + wire20) : (^wire25)) : wire26);
              reg30 <= wire19;
            end
          else
            begin
              reg28 <= (~^$signed(reg28));
            end
          reg31 <= {(-{wire23[(3'h4):(2'h3)], wire18[(1'h0):(1'h0)]})};
          reg32 <= $unsigned(wire18[(4'h9):(4'h9)]);
          reg33 <= reg30[(3'h7):(1'h1)];
        end
      reg34 <= $signed($signed(wire24));
      reg35 <= ($signed((((~|(8'hb8)) ?
          (wire24 ? reg34 : wire21) : (wire20 ?
              reg33 : wire25)) > wire26)) ~^ (wire19 <= (7'h42)));
      reg36 <= $unsigned($unsigned(reg29[(2'h3):(1'h0)]));
    end
  assign wire37 = wire20[(1'h0):(1'h0)];
  assign wire38 = $unsigned($unsigned(($signed(wire18) ?
                      reg36 : {$signed(reg30)})));
  assign wire39 = $unsigned($signed((~(&{reg33, wire25}))));
  assign wire40 = (~wire38[(4'h9):(4'h8)]);
  assign wire41 = $signed(wire26[(2'h2):(2'h2)]);
  assign wire42 = $signed({((+(wire41 ?
                          (8'h9c) : reg29)) || ((&wire38) << wire23)),
                      {reg29[(2'h3):(2'h2)], wire40[(3'h4):(1'h1)]}});
  assign wire43 = $unsigned({wire41[(3'h5):(3'h5)]});
  assign wire44 = $unsigned($signed($unsigned($signed((wire18 ~^ reg36)))));
  assign wire45 = wire22[(4'hc):(3'h6)];
  assign wire46 = ((wire26[(2'h2):(1'h1)] - (((&reg29) < wire39) != ((^wire38) ^ $unsigned(wire20)))) ?
                      wire43[(2'h3):(1'h1)] : reg30[(2'h3):(2'h3)]);
  assign wire47 = (^(reg31 < (~^reg33)));
endmodule
