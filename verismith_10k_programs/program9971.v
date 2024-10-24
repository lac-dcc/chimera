module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire123,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire4 = $signed(wire1);
  assign wire5 = $signed(($signed(((~^wire0) ? wire2 : (wire0 == (8'ha6)))) ?
                     $unsigned(((wire2 ?
                         wire3 : wire3) ~^ wire0)) : (wire1 - ($signed(wire1) < wire1))));
  assign wire6 = wire2;
  assign wire7 = $signed(($signed(wire4) < $unsigned(wire6[(1'h0):(1'h0)])));
  assign wire8 = wire1[(2'h2):(1'h0)];
  assign wire9 = ($signed($unsigned((wire2[(1'h1):(1'h0)] < wire4[(4'h9):(4'h9)]))) ?
                     (~&wire4[(4'hc):(4'hc)]) : wire1[(2'h2):(2'h2)]);
  module10 #() modinst124 (wire123, clk, wire8, wire3, wire7, wire4);
  always
    @(posedge clk) begin
      reg125 <= {$signed({(wire3[(5'h11):(2'h3)] ?
                  $unsigned(wire6) : (wire123 ? wire9 : wire0))})};
      reg126 <= wire9[(2'h2):(1'h1)];
      reg127 <= {wire6[(4'hf):(2'h3)],
          (((wire5[(1'h0):(1'h0)] ?
                  $signed(wire7) : (~&reg125)) == wire4[(2'h2):(1'h0)]) ?
              (~|((7'h40) ?
                  $unsigned((7'h44)) : (reg125 * wire5))) : ($signed((~&(7'h44))) | ((~^wire6) - $signed(wire3))))};
      reg128 <= ((~^$signed(reg125)) & ((!$unsigned(wire1)) ?
          (^~$unsigned(reg127[(2'h2):(1'h0)])) : {$signed(reg126),
              $signed(wire5[(1'h0):(1'h0)])}));
    end
  assign wire129 = (wire123[(2'h2):(1'h0)] <= $signed(wire123));
  assign wire130 = $signed(wire3[(4'ha):(4'h9)]);
  assign wire131 = ((&$unsigned(((|(8'hac)) ?
                           {wire1, wire9} : $unsigned(wire130)))) ?
                       $unsigned((!wire4)) : wire1[(2'h3):(1'h1)]);
  assign wire132 = wire5[(4'h8):(4'h8)];
  assign wire133 = reg125;
endmodule

module module10
#(parameter param122 = (7'h42))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire62;
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire64,
                 wire15,
                 wire16,
                 wire17,
                 wire34,
                 wire35,
                 wire62,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire15 = ((wire14 - $signed(((~^wire11) ?
                          ((8'had) ? wire14 : wire12) : wire13))) ?
                      ($signed($unsigned((wire14 | wire13))) ?
                          wire12[(4'he):(4'he)] : (^wire13[(2'h3):(1'h1)])) : (wire14 ?
                          (&(+$unsigned(wire12))) : wire13[(4'he):(3'h7)]));
  assign wire16 = wire14[(4'hd):(4'h9)];
  assign wire17 = (~$signed((wire15 ^~ wire14[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg18 <= wire15[(2'h3):(1'h0)];
      if (($signed(wire14) ^ (8'hab)))
        begin
          reg19 <= reg18[(4'hd):(4'h9)];
          reg20 <= $unsigned((+$unsigned(wire17[(4'hb):(4'h8)])));
          reg21 <= wire14;
          if (((~|{$signed($unsigned(wire17))}) - wire11[(3'h5):(1'h1)]))
            begin
              reg22 <= wire15;
              reg23 <= $signed(($unsigned(((wire17 ?
                      wire15 : reg21) >>> (^~wire16))) ?
                  (wire17[(3'h5):(1'h0)] - ({wire14,
                      wire11} < $signed(reg18))) : ((8'hbc) | $unsigned($unsigned(reg18)))));
              reg24 <= ((~^$unsigned(wire13)) || wire17[(4'ha):(3'h5)]);
              reg25 <= wire15;
            end
          else
            begin
              reg22 <= ((~^((+wire13) & ($unsigned(wire16) || (!wire17)))) ?
                  $signed(($unsigned($unsigned(reg22)) ?
                      (~|(&wire14)) : (reg22[(3'h6):(2'h2)] > (8'hb1)))) : $signed(reg23[(1'h0):(1'h0)]));
              reg23 <= ($signed((!wire12)) ?
                  ((^$unsigned($unsigned(wire17))) ?
                      (wire15 != ($unsigned((8'ha5)) ?
                          ((8'hba) | wire16) : reg24[(1'h1):(1'h1)])) : $unsigned(reg19[(3'h5):(3'h5)])) : ((!reg24[(1'h1):(1'h1)]) < reg22[(3'h7):(3'h7)]));
              reg24 <= $unsigned(((((+wire16) ?
                      (reg24 ?
                          reg24 : wire13) : (~&(8'ha2))) || $signed($unsigned(reg23))) ?
                  $unsigned(((wire14 ? wire12 : reg25) || ((8'hae) ?
                      reg23 : wire16))) : {(^~$signed(wire16)),
                      reg18[(5'h10):(4'h9)]}));
              reg25 <= (~&$signed((wire17[(1'h1):(1'h1)] & $signed((+(8'h9e))))));
            end
        end
      else
        begin
          reg19 <= reg23[(2'h2):(1'h1)];
          if ((wire12[(4'hb):(3'h6)] * $signed(((~$signed(reg25)) ?
              $signed($unsigned(wire15)) : $signed((wire17 ?
                  wire15 : reg22))))))
            begin
              reg20 <= ((($unsigned((reg24 < wire17)) ?
                  $signed((~reg18)) : (&{wire12})) + $unsigned($signed((~wire16)))) * ($signed(wire17) ?
                  wire17 : $unsigned($signed((^reg20)))));
              reg21 <= ($signed($unsigned($unsigned($unsigned(wire17)))) ?
                  (reg20 ?
                      reg21 : $signed(($signed(reg19) ?
                          (~|wire14) : $unsigned(wire13)))) : (~^(~|((^(8'hb5)) && ((8'ha3) ~^ (8'ha5))))));
              reg22 <= {reg24, reg21[(4'ha):(3'h7)]};
              reg23 <= $signed($signed((~|wire17[(3'h7):(3'h4)])));
              reg24 <= (((reg25[(3'h4):(2'h3)] ?
                      wire14[(1'h1):(1'h1)] : ({wire16} ?
                          $unsigned(reg22) : (wire13 ? reg21 : (8'hbb)))) ?
                  ((&{wire14}) ?
                      {$unsigned((8'hac))} : $signed(((8'hb5) <= (8'had)))) : wire12[(5'h11):(3'h4)]) >= $unsigned($signed(((7'h44) & $unsigned((8'hbb))))));
            end
          else
            begin
              reg20 <= ((reg24[(1'h0):(1'h0)] ?
                      (~&$signed((reg20 >> wire15))) : $signed((|{(8'ha7),
                          reg25}))) ?
                  ((&reg24[(1'h0):(1'h0)]) * reg22) : $unsigned((|{$signed(wire14),
                      (reg24 ? wire11 : reg19)})));
              reg21 <= (($unsigned(wire11) ?
                      (wire13 + $unsigned((~wire11))) : $signed(({wire13} ?
                          $unsigned(reg18) : wire11))) ?
                  ({$unsigned(wire11), reg24} ?
                      (reg18 ~^ $unsigned({wire12,
                          wire16})) : ($unsigned((wire17 ? reg20 : reg19)) ?
                          (~&(wire11 ?
                              reg20 : (8'hbf))) : reg23)) : $unsigned(reg19[(2'h3):(1'h1)]));
              reg22 <= $signed($unsigned(reg24));
              reg23 <= wire11;
            end
          if (reg24[(1'h1):(1'h1)])
            begin
              reg25 <= ($unsigned({((~^reg23) ? (reg18 ~^ reg24) : {wire17}),
                      ($unsigned((8'ha9)) ? $signed(wire12) : (^~reg19))}) ?
                  {reg22[(3'h6):(3'h5)]} : (8'hb7));
              reg26 <= ((wire15[(1'h1):(1'h1)] * ($signed({wire17}) ?
                      $unsigned($unsigned(reg22)) : (~&$signed(reg20)))) ?
                  (({(8'hb9)} < reg21[(4'hc):(4'h8)]) << $unsigned($signed({wire16}))) : $signed(((wire15 && $unsigned(wire11)) < ($signed(wire16) < reg18[(3'h4):(2'h2)]))));
              reg27 <= ((~($signed((wire16 + (8'hbc))) ?
                  reg22[(4'hc):(2'h3)] : $unsigned($signed(reg24)))) == wire16[(3'h6):(3'h5)]);
              reg28 <= ({$signed(reg20[(1'h0):(1'h0)]),
                  $unsigned({$signed(wire12), (~^reg26)})} > $unsigned((reg24 ?
                  (+reg19[(3'h5):(3'h5)]) : reg21)));
              reg29 <= (8'ha8);
            end
          else
            begin
              reg25 <= $signed($unsigned(reg25));
              reg26 <= reg29;
              reg27 <= $signed(reg20);
              reg28 <= $unsigned({wire13[(4'hc):(3'h5)], $signed((|reg19))});
            end
          if ($unsigned(wire14[(1'h1):(1'h0)]))
            begin
              reg30 <= $signed(wire17[(4'hb):(4'hb)]);
            end
          else
            begin
              reg30 <= $unsigned((wire15[(3'h4):(2'h3)] ?
                  ((+((8'hbd) ? reg27 : wire17)) ?
                      (^$signed(reg26)) : reg20[(1'h1):(1'h0)]) : $signed(reg26)));
              reg31 <= reg23;
              reg32 <= wire14;
            end
        end
      reg33 <= $signed($signed((reg22 ?
          (^(~|reg22)) : $unsigned($unsigned(reg32)))));
    end
  assign wire34 = $unsigned($signed((~|{$unsigned(wire16), reg19})));
  assign wire35 = wire34;
  module36 #() modinst63 (wire62, clk, wire16, reg18, reg20, reg23);
  assign wire64 = (reg25[(2'h3):(2'h2)] >= reg22[(4'hb):(3'h4)]);
  module65 #() modinst109 (.wire68(wire16), .wire69(wire13), .wire67(reg33), .clk(clk), .wire66(wire17), .wire70(wire34), .y(wire108));
  assign wire110 = $unsigned((~^reg26));
  assign wire111 = (!(wire17[(3'h4):(1'h1)] ?
                       $unsigned(reg18[(1'h0):(1'h0)]) : (~&$unsigned((~^reg25)))));
  assign wire112 = $unsigned(reg33[(3'h7):(2'h3)]);
  assign wire113 = $signed((wire34[(4'hc):(1'h1)] && (~|(-reg18[(4'hc):(4'h9)]))));
  assign wire114 = {$unsigned((~^reg33)),
                       {((&wire12) ?
                               wire64[(2'h2):(2'h2)] : ((reg27 ?
                                       wire15 : wire16) ?
                                   (wire17 - (8'hb8)) : (~&reg26))),
                           $unsigned((wire111 ? wire35 : {wire34, wire110}))}};
  assign wire115 = {({$signed((-(8'h9e)))} ?
                           ((~&(+wire11)) ?
                               ($unsigned(reg23) ?
                                   reg23[(2'h3):(2'h3)] : (~^(8'hb6))) : wire12) : wire15[(1'h0):(1'h0)])};
  assign wire116 = ({($signed({wire14}) ?
                           ($signed(reg21) ?
                               $signed(wire108) : (wire112 ?
                                   wire113 : wire13)) : reg21)} >>> ($unsigned({(~reg30)}) ^ {(|$unsigned(wire108))}));
  always
    @(posedge clk) begin
      reg117 <= $signed($unsigned($signed((wire16[(3'h7):(3'h7)] ~^ wire110))));
      reg118 <= wire114[(3'h4):(3'h4)];
      reg119 <= reg32;
      reg120 <= $signed((~&(^~$unsigned(wire115))));
      reg121 <= wire11[(3'h5):(2'h3)];
    end
endmodule

module module65
#(parameter param107 = ((~|({((8'hb4) ? (8'h9e) : (8'hba)), {(8'h9c)}} && {{(8'hb7), (8'hb2)}})) ? (~|({((8'h9e) ? (8'hb8) : (8'h9d))} || {{(8'hb7), (8'hb6)}, ((8'hb8) ? (8'ha6) : (8'ha3))})) : (!{((~(8'hbb)) ? {(8'ha6)} : (7'h41)), (((8'ha1) == (8'hba)) ? (~^(8'hb1)) : ((8'hb6) ? (7'h40) : (8'hb1)))})))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h1b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire [(4'he):(1'h0)] wire68;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  assign y = {wire106,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire86,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire71 = $signed($signed(($signed($unsigned(wire70)) >= $unsigned((~&wire67)))));
  assign wire72 = $signed($unsigned((((+wire71) ~^ (8'hbf)) ?
                      ((wire70 & wire67) | wire69[(3'h7):(1'h0)]) : $unsigned((wire70 ?
                          wire71 : wire67)))));
  assign wire73 = ((wire68 & $signed($signed(wire68))) ~^ $unsigned({{(wire66 ?
                              (8'h9f) : (8'ha0)),
                          (wire69 ? wire67 : wire66)},
                      (^~(wire68 ? wire70 : wire69))}));
  assign wire74 = ((~|$signed(wire66)) || ({(|$unsigned(wire68))} ?
                      $unsigned((8'ha2)) : wire66[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg75 <= wire72;
      if ($signed((&wire74[(3'h4):(1'h1)])))
        begin
          reg76 <= (($signed(($unsigned(wire68) ?
                  $unsigned(wire74) : ((8'hb8) < wire68))) ?
              (-(+wire69[(3'h4):(3'h4)])) : $unsigned((wire66 ?
                  (wire71 - (8'hbd)) : wire70))) >>> (7'h43));
        end
      else
        begin
          reg76 <= reg76[(2'h2):(1'h1)];
          reg77 <= wire72;
          reg78 <= {$signed($unsigned(wire69[(3'h5):(2'h3)])),
              $signed(wire69[(3'h4):(3'h4)])};
          if (wire70[(3'h6):(3'h6)])
            begin
              reg79 <= (|((!wire69) ?
                  (!wire73[(2'h3):(1'h1)]) : ($signed(reg75) ?
                      wire73 : wire67)));
              reg80 <= wire70[(2'h2):(1'h1)];
            end
          else
            begin
              reg79 <= (~^(7'h41));
              reg80 <= $unsigned((|wire74));
              reg81 <= (|$unsigned(({wire73[(4'h8):(1'h0)], $signed(reg78)} ?
                  ($signed(reg80) ?
                      $signed((8'ha9)) : (wire73 >= wire67)) : ($signed(wire70) ?
                      (^~wire74) : (^~(8'h9c))))));
              reg82 <= ($signed($unsigned(((reg78 ?
                  wire69 : reg81) & reg80[(2'h2):(1'h0)]))) >= (wire67[(3'h6):(1'h1)] ?
                  {$unsigned(wire69[(1'h1):(1'h1)])} : (~&((wire74 && reg76) ?
                      $unsigned(reg81) : reg78))));
            end
          reg83 <= (($signed(wire73) ?
                  wire70[(4'h8):(4'h8)] : {($unsigned((8'hb3)) & $signed((8'h9c))),
                      ((reg79 ? (8'ha3) : wire68) ?
                          reg76[(2'h3):(1'h0)] : (~wire74))}) ?
              (+reg78[(3'h4):(1'h1)]) : ((~{(^(8'hbc))}) ?
                  $unsigned($unsigned($signed(reg81))) : (+$unsigned((wire68 ?
                      reg76 : reg82)))));
        end
      reg84 <= $unsigned(((($unsigned(wire73) >>> wire72[(3'h6):(3'h4)]) ?
              {{wire67}} : reg78[(2'h3):(2'h3)]) ?
          ({wire66[(2'h2):(1'h0)], (reg78 != wire66)} ?
              $signed($unsigned(wire70)) : $signed((reg80 ?
                  reg81 : wire69))) : (((wire71 <<< (7'h44)) + wire68[(4'ha):(1'h1)]) ?
              {reg81[(4'ha):(3'h7)]} : ((~|reg79) ?
                  ((8'hb3) > wire70) : wire74))));
      reg85 <= wire74[(2'h3):(2'h3)];
    end
  assign wire86 = (~^$signed(reg77[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg87 <= $unsigned($unsigned($signed((^((8'hac) << (7'h42))))));
      if ($unsigned(((^(wire67 - wire71[(3'h5):(1'h0)])) & (wire86 ?
          reg81 : $unsigned(((8'ha0) << wire72))))))
        begin
          if (reg82[(3'h4):(1'h0)])
            begin
              reg88 <= (((|$unsigned((+reg85))) ? reg77 : reg80) ?
                  wire67[(2'h3):(2'h3)] : reg84[(1'h0):(1'h0)]);
            end
          else
            begin
              reg88 <= reg77[(2'h3):(1'h1)];
              reg89 <= $unsigned(reg78);
            end
          reg90 <= $signed((($unsigned($unsigned((8'ha2))) ?
                  (wire66 | (reg83 >>> reg77)) : (wire71[(1'h1):(1'h0)] != (reg81 != reg77))) ?
              ((^~(-wire67)) ?
                  $signed(reg75[(1'h1):(1'h0)]) : (reg77 * wire71[(4'h8):(2'h2)])) : {((wire86 >> reg76) ?
                      $signed(wire69) : $signed(wire67)),
                  $signed($unsigned(wire66))}));
          if ($signed(($signed($signed(((8'hab) ? reg78 : reg79))) ?
              $signed(($unsigned(reg88) < ((7'h40) ?
                  reg77 : reg85))) : $unsigned((+(wire69 ? reg89 : wire71))))))
            begin
              reg91 <= reg88[(2'h2):(2'h2)];
            end
          else
            begin
              reg91 <= {(&(8'hae)),
                  (reg76 ? $signed($unsigned({(8'hbf)})) : wire74)};
              reg92 <= {{$signed(wire72), (~wire72[(2'h2):(1'h0)])}};
              reg93 <= ({(~$unsigned((^~(8'ha1)))),
                  (8'ha3)} * reg90[(2'h2):(1'h1)]);
              reg94 <= $signed(reg79[(3'h4):(2'h3)]);
            end
        end
      else
        begin
          reg88 <= ({$signed(wire68)} ? reg93 : reg75[(1'h0):(1'h0)]);
          reg89 <= reg89;
          if ($signed(((wire86 || (^~(~^(8'hb0)))) ?
              wire86 : (($signed(reg91) ^~ reg78[(4'hb):(3'h6)]) >>> ((8'hab) ?
                  $unsigned(reg87) : (~^reg80))))))
            begin
              reg90 <= (reg82 && $unsigned(({(reg94 ?
                      reg84 : reg94)} ^ (~^(reg84 ? (8'hb1) : reg92)))));
              reg91 <= $unsigned(reg81);
            end
          else
            begin
              reg90 <= (~($unsigned(wire86) ? wire70[(4'ha):(1'h1)] : wire86));
              reg91 <= (reg92 ?
                  $unsigned((($signed((7'h40)) <<< reg81[(4'hb):(2'h3)]) + reg89)) : {$unsigned((^$signed(wire72)))});
              reg92 <= $unsigned(reg88);
            end
          reg93 <= {((reg94[(1'h1):(1'h1)] ?
                  $signed($unsigned(reg94)) : $unsigned((wire73 ?
                      reg83 : wire69))) || $unsigned((-wire72))),
              $unsigned({{(-wire72)}, {{wire68, reg84}, reg81}})};
        end
      reg95 <= reg80[(3'h4):(2'h3)];
    end
  assign wire96 = (-($signed(((reg94 ? wire69 : wire67) ?
                      wire86 : (8'hbd))) ^ (&(reg81 - $signed(reg83)))));
  assign wire97 = {((&$signed(reg92[(2'h3):(2'h2)])) ?
                          (-$unsigned((reg93 ?
                              reg81 : reg88))) : $signed(reg85))};
  assign wire98 = wire96;
  assign wire99 = reg88;
  assign wire100 = $unsigned(wire73);
  always
    @(posedge clk) begin
      reg101 <= $signed(wire66[(1'h0):(1'h0)]);
      reg102 <= $signed(((((8'hb8) >> $signed(reg75)) > {$unsigned(reg83),
          (~reg89)}) | (|{(wire99 ~^ wire66), reg77[(1'h0):(1'h0)]})));
      reg103 <= $signed(wire100[(4'hb):(4'hb)]);
      reg104 <= wire69;
      reg105 <= $signed({$signed(wire99[(2'h3):(2'h2)])});
    end
  assign wire106 = (reg75 ? (^~wire73) : $signed(wire68[(4'hb):(3'h4)]));
endmodule

module module36
#(parameter param61 = {(+(((~|(8'hba)) ? ((8'ha1) ^ (8'hbc)) : ((8'h9c) ? (8'ha8) : (8'hbe))) ? (^((8'hb3) ? (8'ha1) : (8'hab))) : ((|(8'hb5)) ? ((7'h43) ^~ (8'hae)) : ((8'hab) ? (8'h9d) : (8'hb4)))))})
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire42,
                 wire41,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire41 = $unsigned(wire40[(2'h2):(1'h1)]);
  assign wire42 = {wire41};
  always
    @(posedge clk) begin
      reg43 <= wire38;
      reg44 <= (~(((wire39[(4'ha):(4'h9)] ?
              wire41[(3'h5):(2'h3)] : (wire41 << wire40)) == wire42) ?
          wire39 : $signed($unsigned((wire42 ? wire37 : wire42)))));
      if ((8'hbf))
        begin
          reg45 <= wire42[(2'h3):(2'h3)];
          reg46 <= reg45[(2'h2):(1'h0)];
          if ((!wire42))
            begin
              reg47 <= $signed(wire41[(3'h7):(3'h7)]);
              reg48 <= $unsigned((((~|wire41) ?
                      $unsigned($unsigned(wire41)) : ({(8'h9f),
                          reg46} << {wire40, wire39})) ?
                  wire37[(2'h3):(1'h1)] : ($signed({wire39, wire41}) ?
                      {$signed(wire39)} : $unsigned((wire41 ?
                          wire39 : reg43)))));
              reg49 <= ($signed({(|$signed(wire40))}) | (wire39 << reg48));
            end
          else
            begin
              reg47 <= reg48[(3'h6):(1'h0)];
              reg48 <= (((-$unsigned($signed(reg49))) ?
                  ($unsigned((reg46 == reg44)) >>> $signed($unsigned(reg43))) : ($signed($unsigned(wire38)) ?
                      reg48[(5'h11):(4'hf)] : (&(|wire38)))) ^~ (((8'hbb) ?
                      (&(reg43 || reg47)) : $unsigned(reg46)) ?
                  (&({reg43} ^~ ((8'hb8) ?
                      reg44 : reg43))) : $unsigned(wire38[(4'h8):(4'h8)])));
            end
        end
      else
        begin
          reg45 <= {(($unsigned(wire42[(3'h7):(3'h4)]) < $signed({reg47,
                      reg43})) ?
                  {((^reg49) ? $signed(wire42) : (reg44 ? reg43 : reg43)),
                      wire37} : $unsigned($unsigned($signed(reg45))))};
          reg46 <= reg46[(4'ha):(3'h4)];
          reg47 <= (^reg44);
        end
      if ($signed($unsigned((({(8'ha1), (8'hba)} ?
              reg48[(4'h8):(3'h6)] : wire37) ?
          $signed($unsigned(reg48)) : {$unsigned(reg45), wire38}))))
        begin
          if ((reg44[(4'hd):(4'h9)] ?
              ($signed(((reg44 ^~ wire42) ?
                  reg43[(2'h3):(2'h3)] : (reg43 + reg47))) << ({$unsigned(wire39),
                  reg48} <<< reg43[(3'h4):(2'h2)])) : wire39[(3'h5):(3'h4)]))
            begin
              reg50 <= ((8'ha1) ?
                  reg49 : ((^~(~$unsigned(wire40))) ?
                      ((((8'ha6) & reg44) != wire41) << ((reg43 ?
                          wire38 : wire40) != (reg46 ?
                          wire38 : wire39))) : ((!(reg45 > (8'hb0))) ?
                          {wire42[(2'h3):(1'h1)], $signed(reg46)} : reg45)));
            end
          else
            begin
              reg50 <= $signed($unsigned((wire41[(3'h7):(2'h2)] == $signed({reg49,
                  wire40}))));
              reg51 <= $unsigned(reg43[(2'h2):(1'h0)]);
              reg52 <= (|$unsigned(({reg45[(5'h11):(4'he)],
                  (~^reg51)} ^~ $unsigned(((8'ha8) ^~ wire40)))));
              reg53 <= reg48[(3'h6):(3'h6)];
            end
        end
      else
        begin
          if (reg53)
            begin
              reg50 <= $signed((!(reg44[(4'hd):(4'hd)] ?
                  $signed(reg50) : (-reg47))));
              reg51 <= wire38;
            end
          else
            begin
              reg50 <= wire41;
              reg51 <= (8'hba);
              reg52 <= ((&(wire42[(3'h7):(1'h0)] ?
                  $signed((reg43 & wire40)) : ((wire39 - wire41) ?
                      wire42 : (wire41 <= reg43)))) ~^ (8'hbf));
              reg53 <= reg47;
              reg54 <= (~{(wire39 ? (!$signed(wire42)) : {$signed((8'ha3))}),
                  $unsigned((8'hb9))});
            end
          reg55 <= ((wire37[(2'h3):(1'h1)] * ((~|$unsigned((8'hb6))) << $unsigned($signed(reg54)))) >> reg54[(4'h8):(3'h4)]);
          reg56 <= $unsigned((reg43[(3'h4):(3'h4)] == (-((reg50 ?
                  reg52 : wire37) ?
              $unsigned(reg46) : $signed(reg45)))));
        end
      reg57 <= (-(wire40[(1'h0):(1'h0)] <= (reg55[(3'h4):(2'h2)] ?
          {$signed(wire40)} : $unsigned(reg43))));
    end
  assign wire58 = $unsigned((wire38[(4'h8):(3'h6)] ?
                      reg57[(3'h7):(3'h4)] : $signed(reg51[(5'h14):(5'h10)])));
  assign wire59 = (^~$signed(reg47));
  assign wire60 = wire38[(1'h0):(1'h0)];
endmodule
