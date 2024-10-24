module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire112;
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  assign y = {wire121,
                 wire4,
                 wire112,
                 reg145,
                 reg144,
                 reg143,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire4 = wire2[(4'ha):(3'h5)];
  module5 #() modinst113 (wire112, clk, wire4, wire2, wire1, wire0, wire3);
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg114 <= (~&wire2);
          reg115 <= (($unsigned(wire2) && (wire4 > $unsigned(((8'hb8) | wire4)))) == {$signed(wire2[(4'hb):(4'hb)]),
              {reg114, wire3}});
          reg116 <= wire1[(4'h8):(3'h4)];
          reg117 <= wire0;
        end
      else
        begin
          reg114 <= wire112[(3'h5):(3'h4)];
        end
      reg118 <= {wire1,
          $unsigned(($signed((reg116 > reg114)) ? wire4 : reg116))};
      reg119 <= $signed($unsigned(($signed({wire2}) - reg117)));
      reg120 <= ($signed((reg117 ?
          ((!wire112) ^ (wire0 && reg119)) : $signed($signed((8'ha3))))) < (reg115 ?
          (|(|(&reg115))) : (~|$unsigned($unsigned(wire0)))));
    end
  assign wire121 = reg116;
  always
    @(posedge clk) begin
      reg122 <= $signed($unsigned(wire121[(1'h0):(1'h0)]));
      reg123 <= ((-$unsigned(((+reg122) ?
          $signed(wire2) : (8'hbc)))) <<< ($signed({reg117}) ~^ (wire0 ?
          $unsigned(wire2) : (8'hba))));
      if ({(+($signed(reg122[(4'h8):(4'h8)]) ?
              ($signed((8'hbf)) <= $signed((8'hac))) : ($signed(reg118) ?
                  $unsigned(reg115) : reg116[(2'h3):(1'h1)])))})
        begin
          reg124 <= $signed((~^((~^$signed(reg120)) == (reg114[(4'he):(3'h6)] >= (8'hb8)))));
          if ($signed(wire112[(2'h3):(2'h2)]))
            begin
              reg125 <= wire121[(5'h10):(1'h0)];
              reg126 <= (reg116 < (8'ha4));
              reg127 <= $signed((($signed(reg124[(4'hc):(4'ha)]) ?
                  $signed(reg123) : reg123[(4'h9):(3'h7)]) >>> {((^~wire112) >>> $signed((8'haf))),
                  (+(reg123 != (8'ha4)))}));
              reg128 <= ($unsigned((~&$unsigned(reg117))) ^ reg127[(4'h8):(3'h4)]);
              reg129 <= reg114;
            end
          else
            begin
              reg125 <= wire2[(4'he):(4'ha)];
            end
          if (reg114[(5'h11):(5'h11)])
            begin
              reg130 <= ({wire0, $unsigned(wire1)} != reg117);
              reg131 <= ((($unsigned((8'h9c)) + $signed($signed(reg128))) ?
                  $signed($signed((8'hab))) : reg115) ^~ ((8'hae) ?
                  (~^reg124[(3'h4):(2'h3)]) : reg130[(3'h6):(3'h4)]));
            end
          else
            begin
              reg130 <= ((reg131[(1'h1):(1'h0)] | (reg116 ?
                      ((~reg122) ?
                          (reg120 ?
                              reg126 : reg124) : reg129[(3'h6):(3'h6)]) : reg119[(2'h2):(1'h1)])) ?
                  {($signed((reg116 ? wire0 : wire1)) >> reg127),
                      reg114} : (8'hb4));
              reg131 <= wire121[(4'h9):(3'h7)];
              reg132 <= reg131;
              reg133 <= {$unsigned(reg118), {reg124}};
            end
          if ($unsigned(reg119))
            begin
              reg134 <= $signed(($signed($signed((~^reg129))) >= (((wire121 ?
                      wire0 : (8'hb5)) << $unsigned(reg132)) ?
                  reg129 : (reg116 ? reg123 : reg116[(4'hc):(4'h8)]))));
              reg135 <= reg123[(3'h5):(1'h0)];
              reg136 <= $unsigned($signed(reg133[(3'h6):(1'h0)]));
            end
          else
            begin
              reg134 <= $unsigned($signed((8'hbe)));
              reg135 <= reg115;
            end
          reg137 <= ((($signed((8'hbd)) ?
                  wire112[(3'h7):(2'h2)] : wire0[(3'h4):(1'h0)]) ?
              (!(!{reg117})) : {(reg129 ? $unsigned((8'ha8)) : {reg133}),
                  $signed((&reg131))}) <<< $unsigned(reg120[(3'h7):(3'h6)]));
        end
      else
        begin
          if ((!reg122[(4'hc):(3'h7)]))
            begin
              reg124 <= wire112;
              reg125 <= ((&$signed(((reg118 ?
                  reg123 : wire0) && reg118[(4'ha):(1'h0)]))) ~^ reg122);
              reg126 <= (8'hb8);
            end
          else
            begin
              reg124 <= $signed(wire0[(2'h2):(2'h2)]);
              reg125 <= wire2[(3'h4):(1'h1)];
              reg126 <= ((reg136 ?
                  (&$unsigned(reg124[(4'hb):(2'h3)])) : (((wire121 <= reg125) * (+reg130)) >>> reg130[(5'h11):(3'h7)])) == $signed($signed(((8'hbd) <= reg123))));
            end
          reg127 <= ({$signed((reg136 ? {reg123, reg118} : $unsigned(wire4))),
              (^$signed($signed(wire121)))} << ($unsigned(((wire121 <= reg126) ^ (^(8'hb8)))) ?
              (reg127[(4'hb):(1'h0)] ?
                  (~|$unsigned((7'h44))) : ({reg118} ?
                      reg114 : wire121)) : (!$signed(((8'hb2) ^ reg122)))));
          reg128 <= reg118[(1'h1):(1'h1)];
        end
      if (wire2[(2'h3):(1'h1)])
        begin
          reg138 <= (($signed((~^reg132)) <<< $signed(reg126[(4'hc):(4'h9)])) << reg127);
          reg139 <= {(7'h44),
              ($unsigned((~(reg115 ? reg130 : (8'hbd)))) ?
                  reg116[(1'h0):(1'h0)] : ((reg129[(3'h5):(1'h0)] ?
                      (reg117 ^ reg125) : $signed((8'ha0))) > reg137))};
          reg140 <= (~&wire4);
          reg141 <= ((($signed((reg118 + reg128)) >>> ($unsigned(wire3) ^~ (reg129 ?
                  (8'ha1) : (8'hb1)))) && reg137[(2'h3):(1'h0)]) ?
              (~|(((reg127 ?
                  reg116 : wire4) && $unsigned((8'ha7))) * (reg117 * wire2))) : (reg134[(3'h4):(1'h1)] >= (~|(^~reg131[(2'h3):(1'h0)]))));
        end
      else
        begin
          reg138 <= $unsigned(($unsigned(wire112[(1'h1):(1'h1)]) != $unsigned(((reg132 && reg141) << (^reg118)))));
          reg139 <= $signed($signed($unsigned($signed({reg135, reg137}))));
          if ((($signed((-$signed(reg130))) >>> $unsigned((reg122[(4'he):(1'h1)] ?
                  (reg138 ? reg119 : reg134) : $unsigned((7'h40))))) ?
              $unsigned($signed($unsigned((reg137 ?
                  reg139 : wire0)))) : (~$signed(($unsigned(wire2) >= $signed(wire112))))))
            begin
              reg140 <= $unsigned({$signed($unsigned({reg130, (7'h41)}))});
            end
          else
            begin
              reg140 <= (((~^(&(reg140 ?
                      reg117 : wire121))) >> ($signed($unsigned((8'hbf))) ?
                      wire3 : $signed($signed(reg117)))) ?
                  ($signed(wire4) != $signed($signed((~^(8'ha0))))) : reg138[(1'h1):(1'h1)]);
              reg141 <= reg140;
              reg142 <= $signed(wire2[(1'h1):(1'h0)]);
              reg143 <= (-{$unsigned((~|$signed(reg133)))});
              reg144 <= {wire3[(2'h2):(1'h1)],
                  (reg138 - ((reg133[(3'h6):(3'h4)] ?
                          $signed(reg118) : reg142) ?
                      ($unsigned(reg117) == (reg117 ?
                          reg129 : reg117)) : reg139))};
            end
        end
      reg145 <= ($unsigned($signed(reg117[(3'h7):(3'h7)])) ?
          (($unsigned($unsigned((8'hbb))) || {reg140}) << {{(~reg128)},
              (reg122 ?
                  (reg139 ?
                      reg130 : reg126) : ((8'hb8) == reg135))}) : (reg116 ?
              $signed($signed({reg127})) : reg130));
    end
endmodule

module module5
#(parameter param110 = (((((8'ha9) ? ((8'hb4) ? (8'hbd) : (8'hb7)) : {(8'ha9)}) > ((^~(8'hb3)) ? ((8'hb8) ? (8'hb2) : (8'hab)) : ((8'hae) ? (8'h9d) : (8'h9f)))) ^~ {{(!(8'hb4)), ((8'ha4) ? (8'hbb) : (8'hb6))}}) << (~|((|(8'ha6)) ? (((8'ha5) + (8'hb2)) ? ((8'hba) ~^ (8'had)) : ((8'hae) || (8'ha9))) : (((8'hac) ? (8'haa) : (8'ha6)) == {(7'h42)})))), 
parameter param111 = (~param110))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire108,
                 wire59,
                 wire57,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire10;
    end
  always
    @(posedge clk) begin
      reg12 <= (((!(^~(wire9 ? wire10 : wire6))) ?
              (wire10[(1'h0):(1'h0)] * (wire7[(1'h1):(1'h0)] >= (wire7 ?
                  wire7 : wire10))) : wire8[(4'h9):(3'h4)]) ?
          $unsigned(wire8) : $unsigned(wire8));
      reg13 <= $signed($signed({((wire9 ? wire8 : wire10) + (-(8'haf)))}));
      if (($unsigned($signed(($unsigned(wire6) ?
          {wire10,
              wire7} : (~|reg12)))) || ($unsigned((|(~wire10))) >> {(reg13 ?
              $signed(wire10) : {wire10, wire8})})))
        begin
          reg14 <= reg11[(4'h9):(2'h2)];
        end
      else
        begin
          reg14 <= $signed(reg14[(1'h0):(1'h0)]);
        end
      reg15 <= (wire7 >= ($unsigned(wire6) | (7'h42)));
    end
  assign wire16 = reg14;
  assign wire17 = (~^wire10);
  assign wire18 = (((wire9[(2'h2):(1'h1)] != $unsigned({(8'hb2)})) ~^ ((^~{(8'hb7),
                          (8'hb3)}) && (((8'haf) > (8'hb5)) + wire6))) ?
                      $unsigned($signed($signed($signed((8'ha8))))) : reg11[(5'h12):(3'h6)]);
  assign wire19 = {wire7, {{$unsigned(wire8)}, {wire18}}};
  module20 #() modinst58 (.wire21(wire9), .wire22(reg15), .clk(clk), .wire23(wire6), .wire24(reg11), .y(wire57));
  assign wire59 = $signed((8'h9e));
  module60 #() modinst109 (.clk(clk), .wire62(wire8), .wire61(reg14), .wire64(wire18), .wire63(reg15), .y(wire108));
endmodule

module module60
#(parameter param107 = (((^(((7'h43) ? (8'ha6) : (8'h9e)) ? ((8'ha9) ? (8'ha5) : (8'hb1)) : {(8'ha0)})) ? {(((8'hb4) ? (8'ha1) : (8'hb6)) ? ((8'hb3) ? (7'h40) : (8'hb0)) : ((8'h9f) ? (8'hb3) : (8'hae))), ({(8'h9d), (8'hb4)} ? ((8'hb7) ? (8'hb6) : (8'hb1)) : ((8'ha3) != (8'hbd)))} : (((!(8'hbc)) >> {(8'ha1)}) >> ((~^(8'h9d)) ? (^~(8'hb6)) : (8'ha7)))) - (-({((8'hbb) & (8'h9d))} ? ((~&(8'hb8)) ? (&(8'hba)) : (|(8'ha2))) : {((8'ha9) ? (8'hba) : (8'hac)), ((8'h9e) - (7'h41))}))))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire64;
  input wire [(4'hc):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(4'h8):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  assign y = {wire106,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
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
                 reg87,
                 reg85,
                 reg84,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire65 = $unsigned($unsigned((((wire62 << wire63) ~^ $unsigned(wire62)) ~^ (|(wire64 >= wire64)))));
  assign wire66 = ($signed((($signed((8'hb7)) ?
                          (wire62 ?
                              wire62 : wire63) : (wire64 <<< wire62)) >> $unsigned((wire61 <= wire65)))) ?
                      wire64[(3'h6):(3'h4)] : (^~(wire65[(1'h0):(1'h0)] ?
                          ((wire64 > (8'ha1)) ?
                              $signed(wire65) : (wire63 ?
                                  wire65 : wire62)) : wire63)));
  assign wire67 = wire62[(1'h0):(1'h0)];
  assign wire68 = wire65[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= (wire62[(2'h3):(1'h0)] ?
          (8'hb1) : (wire64 ? wire63 : wire64[(2'h3):(1'h1)]));
      reg70 <= wire68;
      reg71 <= $signed($signed((~|($unsigned((8'hb7)) || (wire68 ^ wire65)))));
      if ((|{(~|(^$unsigned((8'ha0))))}))
        begin
          reg72 <= reg70[(1'h1):(1'h1)];
          reg73 <= (((wire67[(3'h6):(2'h3)] << wire64[(2'h3):(2'h3)]) ?
                  wire67 : (+reg70[(5'h14):(3'h5)])) ?
              reg69[(4'he):(4'hb)] : (!$signed((!(8'ha4)))));
          reg74 <= reg71;
        end
      else
        begin
          reg72 <= (8'ha1);
          reg73 <= (reg73 | $signed($unsigned($unsigned(reg72[(1'h0):(1'h0)]))));
        end
      reg75 <= wire67[(3'h4):(2'h3)];
    end
  assign wire76 = (~|(reg70[(4'hd):(3'h5)] ?
                      (((^(8'hb0)) ~^ wire65[(2'h2):(1'h1)]) > wire66) : $signed($signed(wire67))));
  assign wire77 = reg74;
  assign wire78 = ({$unsigned(reg70[(4'hf):(4'hf)]), (wire77 != wire77)} ?
                      $signed(reg71) : wire63);
  assign wire79 = reg73[(1'h0):(1'h0)];
  assign wire80 = reg69[(4'hc):(4'hc)];
  assign wire81 = (+((~wire64) << ((8'h9d) ?
                      {(|reg75), $unsigned(wire78)} : $signed((wire79 ?
                          wire77 : reg74)))));
  assign wire82 = $signed($unsigned((wire81[(2'h2):(1'h1)] == $unsigned((wire68 ?
                      (8'had) : reg70)))));
  assign wire83 = (($signed($signed((&reg69))) ^~ {reg72}) ?
                      {reg69,
                          {((|wire63) ? $signed(wire77) : (wire80 == (8'ha9))),
                              (~^((8'ha2) ? wire62 : reg75))}} : (8'ha2));
  always
    @(posedge clk) begin
      reg84 <= $unsigned(wire65);
      reg85 <= (($unsigned((~|$unsigned(wire80))) ?
          wire65[(1'h1):(1'h1)] : wire65) != (((8'h9c) <<< ((reg70 ?
              wire80 : wire66) != $signed(wire66))) ?
          ($signed(wire79[(4'h8):(4'h8)]) ?
              wire62 : ($signed(wire79) >>> (-wire77))) : (~&$unsigned($unsigned((8'haa))))));
    end
  assign wire86 = {{$unsigned(reg71),
                          ($unsigned((wire83 ? wire65 : reg85)) ?
                              ((wire65 ? wire77 : wire76) ?
                                  $unsigned((8'hac)) : (~&reg72)) : (&reg85[(5'h13):(3'h4)]))},
                      ((($signed(wire80) | wire66) != reg71) ?
                          ({reg72[(1'h1):(1'h1)]} << {((8'haf) | reg74),
                              wire82}) : wire82)};
  always
    @(posedge clk) begin
      reg87 <= (~^$signed(wire82[(3'h7):(1'h1)]));
    end
  assign wire88 = ($unsigned($signed({(wire77 ? reg72 : wire81), (8'ha1)})) ?
                      {wire76,
                          ((8'hac) ?
                              $signed($signed(reg73)) : $unsigned((~|(8'hb2))))} : {(^wire83[(2'h2):(1'h0)]),
                          $signed(((wire82 ? wire83 : (8'hb2)) <= ((8'hb0) ?
                              reg73 : wire67)))});
  assign wire89 = (8'ha0);
  assign wire90 = wire79[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      if (((($signed($unsigned(reg75)) < $signed((wire76 != (8'hb6)))) ?
          (~(&{wire82})) : reg74[(1'h0):(1'h0)]) <<< $unsigned((wire80[(2'h2):(1'h1)] ?
          $signed((wire78 ^ reg70)) : $unsigned((^~wire79))))))
        begin
          if ((^(wire79[(4'h8):(1'h1)] ^~ (+(~(reg69 ? wire86 : (8'hba)))))))
            begin
              reg91 <= wire68[(3'h7):(3'h7)];
              reg92 <= ({(~(^wire88[(3'h7):(3'h6)]))} ?
                  wire81[(5'h10):(3'h6)] : ($signed(reg85) > (^~$signed($unsigned(wire76)))));
              reg93 <= reg91[(4'hc):(1'h0)];
            end
          else
            begin
              reg91 <= ((($unsigned((wire86 ? wire80 : reg93)) && ((&reg85) ?
                      reg87 : wire67[(3'h5):(3'h4)])) ?
                  $unsigned(reg93) : $unsigned($signed((|wire79)))) != reg92[(3'h4):(3'h4)]);
              reg92 <= {$unsigned($unsigned(reg74))};
              reg93 <= {$signed($signed({(wire63 ? reg87 : wire62)}))};
              reg94 <= (wire89 * wire79[(3'h7):(3'h6)]);
              reg95 <= (^~{wire65[(2'h2):(2'h2)], (!$unsigned((~reg91)))});
            end
          reg96 <= (wire79 >= (^($signed((reg85 == wire68)) ?
              (^~wire82[(4'hb):(1'h0)]) : ((+reg92) ?
                  reg70 : $unsigned((8'ha4))))));
          if ((!(~$unsigned((!(reg96 ? reg94 : reg91))))))
            begin
              reg97 <= (|{$unsigned({reg74}),
                  $signed(($signed(reg85) ? (~reg94) : $signed(wire65)))});
              reg98 <= ($signed(wire61) & (8'ha4));
            end
          else
            begin
              reg97 <= reg69;
              reg98 <= wire88[(4'ha):(4'h8)];
              reg99 <= $unsigned($unsigned(($signed(reg92) ?
                  $unsigned((wire78 ?
                      wire82 : reg92)) : (wire65[(1'h0):(1'h0)] && (+reg69)))));
            end
          if (($unsigned({$signed((|wire79))}) ?
              $signed($unsigned(reg72)) : wire68))
            begin
              reg100 <= (8'h9c);
              reg101 <= $unsigned((reg98 != ({reg73} ^~ ($unsigned(reg94) - wire63[(3'h7):(2'h2)]))));
              reg102 <= wire83;
              reg103 <= (8'h9f);
              reg104 <= ($signed({$unsigned($signed(reg93))}) | (reg69[(4'hc):(3'h5)] | reg97[(1'h1):(1'h1)]));
            end
          else
            begin
              reg100 <= {(|{(wire76 - wire66[(2'h2):(2'h2)]),
                      (reg85[(4'he):(3'h5)] >= reg103)}),
                  {reg100}};
              reg101 <= ($signed(reg87) << {$unsigned((wire82 << wire66[(4'h8):(3'h7)]))});
              reg102 <= ((($signed((8'ha4)) >>> (!wire61)) >>> $signed($signed(wire65[(2'h2):(1'h1)]))) >>> (~|($signed(reg91[(4'h9):(2'h2)]) && wire62[(1'h1):(1'h0)])));
              reg103 <= ({wire63[(4'hc):(4'ha)], reg101[(1'h0):(1'h0)]} ?
                  $signed(wire82[(1'h1):(1'h0)]) : $signed($signed($signed({(7'h42),
                      reg103}))));
              reg104 <= $signed($signed(((-((8'hb1) ?
                  wire82 : wire66)) ^~ $signed((^~(8'h9e))))));
            end
        end
      else
        begin
          reg91 <= $signed(reg96[(4'he):(4'ha)]);
          if (wire67[(1'h0):(1'h0)])
            begin
              reg92 <= (wire77[(4'ha):(2'h3)] ^ $signed($signed(($signed(reg75) >>> wire61[(3'h7):(1'h0)]))));
              reg93 <= reg92[(2'h2):(1'h0)];
              reg94 <= (reg85[(4'hf):(4'hf)] == (+{(^~$unsigned(wire68))}));
            end
          else
            begin
              reg92 <= (reg102[(4'he):(4'h8)] > $signed((-(-(reg70 ?
                  reg71 : wire61)))));
              reg93 <= (!$unsigned(({((8'hbb) || (8'ha7)), {reg104}} ?
                  $signed((wire78 ? reg75 : wire81)) : ({wire80} ^ reg93))));
            end
          reg95 <= $unsigned({$unsigned(($signed(reg73) * (reg102 ?
                  reg103 : wire80))),
              (reg93[(3'h7):(1'h0)] << ($signed(wire80) >= wire86[(3'h7):(2'h3)]))});
          reg96 <= $unsigned((-($signed(reg92) ?
              (-reg75) : wire79[(3'h6):(3'h4)])));
        end
      reg105 <= ((~&reg71) <= ($signed(reg93) ?
          (~(~^$unsigned(wire86))) : (wire66[(4'hb):(2'h3)] && reg104)));
    end
  assign wire106 = (+wire90[(1'h1):(1'h0)]);
endmodule

module module20
#(parameter param56 = ((^~((!((8'ha7) * (7'h44))) ^~ (~((7'h41) ? (8'ha4) : (8'h9d))))) ~^ {(8'hb2)}))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(3'h5):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg53,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire25 = ((&(~|wire23[(2'h3):(1'h1)])) > (~&{wire21,
                      wire21[(4'h8):(4'h8)]}));
  assign wire26 = (&$signed(wire24));
  assign wire27 = wire21;
  assign wire28 = wire26[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg29 <= $unsigned((&wire24[(3'h6):(3'h5)]));
      reg30 <= wire22[(3'h6):(3'h6)];
      reg31 <= ({reg29[(4'h9):(2'h2)]} ?
          wire24[(2'h2):(1'h1)] : ($signed(($signed(wire25) | wire24[(3'h7):(3'h5)])) ?
              (7'h44) : reg29[(1'h1):(1'h0)]));
      reg32 <= $unsigned(wire22);
    end
  always
    @(posedge clk) begin
      reg33 <= reg29[(4'h9):(3'h4)];
      reg34 <= (($unsigned($unsigned($unsigned(wire26))) + $unsigned((~&(wire28 == reg30)))) ?
          ((($signed(wire24) * (reg31 ? wire21 : wire25)) ?
                  ($unsigned(wire28) | (wire24 >> wire25)) : wire28[(1'h0):(1'h0)]) ?
              (~&reg29) : wire23[(2'h2):(1'h0)]) : (+($signed((wire26 ?
              (8'ha8) : (8'h9e))) != $unsigned(wire25[(1'h1):(1'h1)]))));
      if (wire22)
        begin
          reg35 <= (8'h9e);
          reg36 <= $signed((7'h40));
          if ((~^wire27[(1'h1):(1'h1)]))
            begin
              reg37 <= ($unsigned((~&$signed($signed(reg35)))) ?
                  (+$signed($unsigned(((8'hb9) ?
                      wire22 : reg29)))) : ({{$signed((7'h40)),
                              (reg35 || reg29)},
                          ($unsigned(wire24) > (reg30 ? reg34 : reg32))} ?
                      $unsigned($unsigned(reg29[(3'h5):(1'h0)])) : ((wire25[(4'he):(3'h7)] ^ wire22) ?
                          wire21 : wire22)));
              reg38 <= ($signed(wire24) > reg34);
            end
          else
            begin
              reg37 <= (!(~|((wire26 ? (!reg32) : reg35) ?
                  reg29[(4'h8):(3'h6)] : reg29)));
              reg38 <= (wire21 ?
                  ($signed(reg32) ?
                      $unsigned(wire22) : $unsigned((wire23 ?
                          reg30 : (~^wire28)))) : ((({reg38, wire24} ?
                              (wire25 << reg31) : $signed(wire23)) ?
                          reg32 : (wire28[(2'h3):(2'h3)] ?
                              $unsigned(reg30) : $signed(wire21))) ?
                      ($signed($unsigned(reg32)) ?
                          $unsigned((wire26 ? wire23 : reg38)) : ({wire25,
                                  wire25} ?
                              wire27 : wire24[(2'h2):(1'h1)])) : (8'ha6)));
              reg39 <= wire24;
            end
        end
      else
        begin
          reg35 <= $unsigned((~|(^~{(reg32 ? wire26 : wire26), (-reg33)})));
          if (reg29[(4'h8):(3'h7)])
            begin
              reg36 <= $signed($unsigned((reg35[(3'h7):(3'h4)] ?
                  (~^(wire26 ? reg29 : reg32)) : {reg31[(4'hb):(2'h3)],
                      $signed(reg33)})));
            end
          else
            begin
              reg36 <= (reg34[(4'ha):(2'h3)] > {$unsigned(reg31),
                  $signed($unsigned((~^(8'haf))))});
            end
          reg37 <= {$unsigned((($signed(wire22) != (wire28 ?
                  wire23 : (8'ha4))) - $signed((-(8'h9d)))))};
          reg38 <= (+((((reg29 == reg35) ?
              ((8'h9f) ? wire21 : wire26) : {wire21,
                  reg38}) ^~ (!wire24[(2'h2):(1'h1)])) <= $unsigned(reg29)));
        end
      reg40 <= ((^(8'hb4)) == reg39[(3'h5):(2'h3)]);
    end
  assign wire41 = (8'h9d);
  assign wire42 = ({(-$unsigned($unsigned(wire41)))} + (+((!(reg32 + (8'hb5))) >>> {(wire28 & reg35),
                      $signed(reg39)})));
  assign wire43 = wire27[(4'hb):(3'h5)];
  assign wire44 = wire26[(2'h2):(1'h1)];
  assign wire45 = $unsigned({(({reg29, wire24} * (reg34 && reg30)) ?
                          reg36 : ($signed(wire41) && $signed(wire23)))});
  assign wire46 = $unsigned((&$signed(((wire24 != wire28) ?
                      $signed(wire41) : reg32[(2'h3):(2'h3)]))));
  assign wire47 = ({(reg36 ?
                              ($signed(reg40) <<< $unsigned(wire23)) : reg31[(4'hd):(4'h9)]),
                          $signed(($unsigned(wire23) - $unsigned(reg32)))} ?
                      {$unsigned((wire24 != (wire43 ?
                              (8'hb7) : wire22)))} : wire28);
  assign wire48 = (~|(-($signed(wire42[(1'h0):(1'h0)]) & $signed($signed(reg36)))));
  assign wire49 = ((+$unsigned(((reg35 * wire45) >> $unsigned((8'h9f))))) <= (wire46[(2'h2):(1'h1)] ?
                      wire21[(1'h1):(1'h0)] : $signed(reg37[(3'h4):(2'h3)])));
  assign wire50 = wire48[(4'hf):(1'h1)];
  assign wire51 = (~&$signed($unsigned($unsigned((+wire21)))));
  assign wire52 = ($unsigned(reg39) < $signed({(reg39 >> (wire23 ?
                          (7'h40) : wire26))}));
  always
    @(posedge clk) begin
      reg53 <= $unsigned(((^~reg39[(4'h9):(3'h4)]) && wire46));
    end
  assign wire54 = wire46[(1'h1):(1'h1)];
  assign wire55 = reg29[(1'h0):(1'h0)];
endmodule
