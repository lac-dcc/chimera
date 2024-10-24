module top
#(parameter param160 = ({{(~&(8'hba))}, {(^~(+(8'hac))), {((8'hb6) ? (8'hbf) : (8'hb6))}}} ? (((((8'ha1) | (7'h43)) ? (-(8'hbb)) : ((8'ha2) & (8'hbe))) << (8'hb5)) ? ((~^((8'ha6) ? (8'haa) : (8'hb9))) ? {((8'ha9) ? (8'hbe) : (8'ha2))} : (~((8'hb7) ? (8'haa) : (8'hb7)))) : ((((8'had) ^ (8'hac)) ? {(8'hb1)} : ((8'h9c) <= (8'hbc))) == (|(^~(8'haa))))) : ((-({(8'had), (8'hbb)} ? {(8'hba)} : {(8'hbd)})) & (&((!(8'hb2)) - ((8'ha8) * (8'hae)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire156;
  assign y = {wire159, wire158, wire4, wire5, wire156, (1'h0)};
  assign wire4 = $signed($signed($unsigned($unsigned(wire2))));
  assign wire5 = wire1;
  module6 #() modinst157 (.wire11(wire1), .wire7(wire5), .clk(clk), .wire10(wire2), .wire9(wire0), .wire8(wire3), .y(wire156));
  assign wire158 = $signed({wire5, {(^~wire5)}});
  assign wire159 = (8'haf);
endmodule

module module6
#(parameter param154 = (((+((8'had) ? (!(8'hba)) : (~|(8'ha2)))) ? ((((8'hbf) != (8'hb2)) + ((8'hb7) >>> (8'hbd))) ~^ (~&{(8'hb4)})) : (-{((8'hae) < (8'hb8))})) ? {((|((8'hb6) | (8'hb8))) ? (~&((8'hab) & (8'ha2))) : {((8'haf) || (8'hab)), ((7'h41) == (8'hae))}), {(((7'h42) ? (8'h9c) : (8'h9f)) ? {(8'ha9)} : ((8'hba) <= (8'hb0))), (((8'ha2) ? (8'hb5) : (8'hae)) ^~ ((8'hba) ? (8'ha9) : (8'ha0)))}} : (((((8'ha9) | (7'h44)) || ((8'h9f) ? (8'had) : (8'h9d))) ? (7'h44) : (((8'ha6) ? (8'ha5) : (8'had)) ~^ (^~(7'h40)))) <<< ((((8'ha7) ? (8'hab) : (8'ha1)) && ((8'hbf) ? (7'h42) : (8'hb2))) ^~ (8'hb5)))), 
parameter param155 = (^(~&param154)))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h273):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(2'h2):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire113;
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire153,
                 wire147,
                 wire146,
                 wire122,
                 wire121,
                 wire120,
                 wire117,
                 wire15,
                 wire16,
                 wire21,
                 wire22,
                 wire56,
                 wire113,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
                 reg119,
                 reg118,
                 reg116,
                 reg115,
                 reg12,
                 reg13,
                 reg14,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= {wire9[(5'h10):(3'h5)]};
      reg13 <= wire8;
      reg14 <= {((reg13[(4'hd):(3'h4)] < reg12[(4'h9):(4'h9)]) | wire9[(2'h3):(1'h0)])};
    end
  assign wire15 = $signed((~|{$unsigned($signed(reg12)), reg14}));
  assign wire16 = $signed(reg12);
  always
    @(posedge clk) begin
      reg17 <= (wire7 | (wire10 <<< $signed($unsigned({reg12, reg13}))));
      reg18 <= wire16;
      reg19 <= reg18;
      reg20 <= reg14;
    end
  assign wire21 = wire15;
  assign wire22 = {$signed(($unsigned(reg19[(3'h5):(2'h2)]) < $signed({reg12,
                          (8'haa)})))};
  module23 #() modinst57 (wire56, clk, wire22, wire9, wire8, wire11);
  module58 #() modinst114 (wire113, clk, reg18, wire8, wire22, wire10);
  always
    @(posedge clk) begin
      reg115 <= (&($signed((+(reg14 ~^ wire11))) << $unsigned((^(wire56 ?
          wire22 : wire8)))));
      reg116 <= ($signed((!reg13)) << {reg18[(4'hd):(2'h2)],
          ($signed($signed(reg115)) ?
              $signed({wire11, reg115}) : $signed((!wire10)))});
    end
  assign wire117 = $unsigned((~|$signed((!wire22))));
  always
    @(posedge clk) begin
      reg118 <= wire10[(2'h3):(1'h0)];
      reg119 <= ($unsigned(wire8) ?
          reg18[(4'h8):(2'h3)] : reg19[(1'h0):(1'h0)]);
    end
  assign wire120 = ($signed((|$signed(((8'hbf) * wire117)))) + wire10[(4'ha):(1'h1)]);
  assign wire121 = wire11;
  assign wire122 = $signed({(^($signed((8'ha3)) ? $signed(reg116) : (~|reg17))),
                       $unsigned(reg19[(5'h11):(4'hf)])});
  always
    @(posedge clk) begin
      reg123 <= {wire21[(2'h3):(2'h3)],
          $signed((($signed(reg14) ^ (~wire56)) ?
              ((reg14 ~^ (8'ha8)) ?
                  $unsigned(wire122) : {(8'ha3)}) : (7'h43)))};
      reg124 <= {reg115};
      if ($unsigned(wire7[(3'h7):(1'h0)]))
        begin
          reg125 <= $unsigned($signed(reg118));
          reg126 <= reg118[(4'he):(4'hd)];
          reg127 <= wire9[(1'h1):(1'h0)];
          reg128 <= (reg14 ?
              reg14[(5'h11):(4'hc)] : $unsigned((wire11[(4'hf):(2'h2)] ?
                  $unsigned((wire10 != (8'hb4))) : $unsigned((reg118 ?
                      reg19 : (8'ha3))))));
          reg129 <= reg128[(3'h5):(1'h1)];
        end
      else
        begin
          if ((wire15 ?
              ({$signed(reg12[(2'h3):(1'h1)]), $signed($signed(wire121))} ?
                  ({$signed((8'ha9)),
                      (reg124 ?
                          reg129 : reg17)} & wire15[(4'hc):(4'hb)]) : (^$unsigned((wire117 ^~ wire120)))) : wire117))
            begin
              reg125 <= ((wire7 >> wire15[(2'h3):(1'h1)]) | ($signed($unsigned($signed(wire122))) & reg125));
              reg126 <= $signed($unsigned($unsigned(wire56)));
              reg127 <= $signed(wire11[(3'h4):(2'h2)]);
              reg128 <= (({reg119[(2'h3):(2'h3)],
                          (wire56 ?
                              (wire9 ? (8'hb3) : reg18) : ((8'hb9) ?
                                  (8'hae) : reg12))} ?
                      $signed((~&(-(8'hab)))) : reg119[(4'h8):(1'h0)]) ?
                  ($unsigned(($unsigned(reg124) ?
                      $signed(wire121) : (8'ha8))) >>> reg128) : reg126);
              reg129 <= {reg20,
                  $unsigned($unsigned(((reg129 ?
                      reg119 : reg126) >= {reg128})))};
            end
          else
            begin
              reg125 <= ((~|wire9) || wire22[(3'h6):(2'h3)]);
              reg126 <= reg118;
              reg127 <= (~wire9[(5'h11):(4'h8)]);
              reg128 <= {$signed(($signed($signed(wire8)) ?
                      wire122[(4'ha):(4'h8)] : ($signed((8'hb4)) ~^ (^wire22)))),
                  (!reg125)};
            end
          reg130 <= (reg124 >= wire21[(2'h3):(1'h0)]);
          reg131 <= reg14;
          reg132 <= wire11;
          reg133 <= reg128[(2'h2):(2'h2)];
        end
      if ((reg115 == reg13[(5'h11):(1'h0)]))
        begin
          reg134 <= {({({reg20, reg20} ? (-reg130) : wire56[(1'h0):(1'h0)]),
                  $unsigned($signed((8'ha8)))} < {$signed($signed(wire16))}),
              reg125[(2'h2):(2'h2)]};
          reg135 <= reg130;
          reg136 <= (((^~((wire9 == reg129) ?
                  (reg133 == wire16) : $signed(wire9))) | (((wire16 ?
                      wire56 : (8'hb1)) & $unsigned(reg132)) ?
                  ($signed(wire120) < (+(8'ha8))) : reg133[(2'h3):(1'h1)])) ?
              (((reg124[(3'h5):(1'h1)] ? reg129 : (wire122 ^~ reg13)) ?
                      ($unsigned(reg125) ?
                          reg115 : (reg118 ?
                              wire121 : wire16)) : $unsigned(reg131)) ?
                  (((~&wire16) ? reg132 : $signed(wire113)) ?
                      ($unsigned(reg128) || reg130) : wire10[(3'h7):(3'h5)]) : ($signed((reg118 >= wire120)) & wire22[(3'h7):(1'h0)])) : ((~$signed((!(8'h9e)))) ?
                  reg123[(5'h11):(4'h9)] : (({reg14} << wire113) >> reg115[(3'h5):(1'h1)])));
          reg137 <= (~|$unsigned($unsigned($unsigned({wire122, reg134}))));
          reg138 <= reg128[(2'h3):(1'h0)];
        end
      else
        begin
          reg134 <= reg115;
          reg135 <= wire16[(5'h12):(1'h0)];
          if ({$signed(reg17)})
            begin
              reg136 <= reg14;
            end
          else
            begin
              reg136 <= (+((^~((reg14 ?
                      reg123 : (8'ha2)) * (reg115 & wire15))) ?
                  reg138 : reg129[(1'h1):(1'h0)]));
              reg137 <= (reg131[(4'h8):(1'h0)] > ((~|(reg119 ^ $signed(reg116))) & $unsigned($unsigned($unsigned(reg137)))));
              reg138 <= ($signed(wire120) == (~wire56[(2'h2):(2'h2)]));
              reg139 <= reg17[(1'h0):(1'h0)];
            end
        end
      if ((8'hb6))
        begin
          reg140 <= (reg129 & ($unsigned($signed(wire120)) ?
              {reg133, {reg123, reg131}} : reg18[(5'h10):(3'h4)]));
          reg141 <= (~(wire121[(1'h0):(1'h0)] <<< ((reg132 >>> {wire120,
              reg18}) && ((wire121 - reg18) ?
              reg19 : (reg135 ? reg137 : reg19)))));
        end
      else
        begin
          reg140 <= ($signed(((reg130 | $signed(wire56)) ^~ $unsigned((wire122 > wire56)))) || ({reg135} + (~&(wire22 ?
              reg129[(1'h0):(1'h0)] : $signed((8'ha2))))));
          if ($unsigned((reg12[(3'h6):(3'h4)] == {wire7,
              $unsigned((wire22 ? wire117 : reg131))})))
            begin
              reg141 <= (~&reg17[(3'h5):(3'h5)]);
              reg142 <= $signed(wire113);
              reg143 <= $unsigned(wire7[(1'h0):(1'h0)]);
              reg144 <= (+reg137[(4'h9):(1'h0)]);
              reg145 <= {$signed({(~|{(8'ha4)}), wire15[(4'hc):(3'h6)]}),
                  $signed(((reg116 << {(8'h9c)}) ?
                      {((8'hb3) ? wire22 : reg17)} : reg135))};
            end
          else
            begin
              reg141 <= (~((8'hab) ?
                  (((-wire122) >>> (wire22 ?
                      wire113 : reg14)) && (wire9 > ((8'hbb) ?
                      (8'hb5) : wire7))) : (reg116 ?
                      $unsigned(((8'hb6) ?
                          reg138 : reg20)) : $signed($unsigned(wire120)))));
              reg142 <= (reg17 < $signed((((+reg134) > $unsigned(reg128)) ?
                  wire15 : (reg123[(3'h4):(2'h2)] ?
                      $unsigned((8'hac)) : (~&wire11)))));
            end
        end
    end
  assign wire146 = (!$unsigned((8'hb0)));
  assign wire147 = (~&wire56[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg148 <= $signed($unsigned(wire121[(2'h2):(1'h0)]));
      reg149 <= ($unsigned($unsigned($unsigned($signed(wire16)))) ?
          reg130[(1'h1):(1'h0)] : $signed((|(reg136 - ((8'hb3) ?
              reg126 : reg138)))));
      reg150 <= $signed((&{{wire16[(2'h2):(1'h1)]}, $unsigned((^reg134))}));
      reg151 <= {($signed((~$signed((8'hb0)))) ?
              (|(~|(8'hb2))) : reg137[(4'h8):(3'h5)]),
          $unsigned($signed($unsigned(wire146[(1'h1):(1'h1)])))};
      reg152 <= (+{($signed($unsigned(wire121)) * reg140[(4'hb):(2'h2)])});
    end
  assign wire153 = $signed($unsigned(((reg134 ?
                           {wire146, reg129} : reg119[(2'h2):(2'h2)]) ?
                       (wire16 || $unsigned(reg143)) : ($signed(wire21) - (wire16 ?
                           wire7 : reg148)))));
endmodule

module module58  (y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire62;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire [(5'h12):(1'h0)] wire60;
  input wire signed [(3'h4):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  assign y = {wire112,
                 wire109,
                 wire108,
                 wire98,
                 wire88,
                 wire87,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg111,
                 reg110,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg86,
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
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire63 = {(~|(&{$signed(wire60)})), wire62[(1'h0):(1'h0)]};
  assign wire64 = (wire63 ? $unsigned(wire61) : wire63);
  assign wire65 = $unsigned($unsigned((wire60[(3'h7):(2'h3)] * $signed((^wire64)))));
  assign wire66 = wire62[(1'h1):(1'h0)];
  assign wire67 = wire59[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg68 <= ($signed((~((wire66 * wire67) > $signed(wire62)))) >> $signed(wire61));
      if ($unsigned(($signed(wire66[(4'ha):(3'h7)]) >= wire59)))
        begin
          reg69 <= $unsigned((~$unsigned($unsigned(wire66[(4'h8):(2'h2)]))));
          reg70 <= {((reg68[(4'he):(4'hc)] > ($signed((8'h9d)) * wire65[(3'h7):(1'h1)])) ?
                  (+(!(&wire66))) : wire67)};
          reg71 <= $signed(wire65);
          reg72 <= $signed(wire62);
          if ((wire65 <<< (-(((|wire63) << $unsigned((8'h9c))) <<< (~&$unsigned((8'h9e)))))))
            begin
              reg73 <= ({{((reg72 ? reg72 : wire59) ?
                          (wire61 ? wire62 : wire63) : $signed(wire60))},
                  $signed((&reg68))} & reg69[(4'h9):(4'h8)]);
              reg74 <= reg70;
            end
          else
            begin
              reg73 <= ($unsigned(((!wire67) ?
                  {wire63} : ((~reg69) ?
                      (wire64 ? reg71 : wire64) : reg72))) < (8'hbb));
              reg74 <= (reg70[(3'h5):(2'h3)] ?
                  $signed({(wire60[(4'hd):(2'h2)] ?
                          (wire61 > wire61) : wire62[(3'h5):(2'h2)]),
                      wire65[(4'h8):(3'h5)]}) : ({$unsigned($unsigned(wire62))} ?
                      (+reg68) : $unsigned((wire61[(3'h4):(2'h2)] + (8'hb1)))));
              reg75 <= wire64;
            end
        end
      else
        begin
          if ($signed(($unsigned(wire60[(3'h7):(2'h3)]) ?
              (8'h9f) : $unsigned((!(~&reg69))))))
            begin
              reg69 <= reg72[(2'h2):(1'h1)];
            end
          else
            begin
              reg69 <= $unsigned((~|{(~|(reg72 ? wire65 : wire63))}));
              reg70 <= (wire60 ?
                  $unsigned((((~^reg68) ?
                      wire66 : (wire67 ?
                          wire62 : reg73)) <<< (reg74[(3'h7):(2'h3)] ?
                      wire62[(3'h5):(1'h1)] : (reg74 ?
                          wire59 : reg68)))) : ({($signed(reg69) >>> $signed(wire66)),
                          (-reg68)} ?
                      $signed($signed($unsigned(reg69))) : ((-$unsigned(wire64)) ?
                          wire63 : {wire61, wire65})));
            end
          reg71 <= ($signed(((wire62 ?
              (reg74 ? wire67 : reg73) : $unsigned(wire62)) <<< ((reg68 ?
                  wire67 : wire67) ?
              (8'hac) : wire66))) * $signed((!$signed($unsigned(reg68)))));
          reg72 <= $unsigned(reg73);
        end
      reg76 <= ({(((8'ha2) - $unsigned((8'haa))) ?
                  $unsigned((reg68 ^ wire62)) : $unsigned((8'ha7))),
              wire63[(4'hc):(2'h3)]} ?
          $signed((((&wire65) ? (~^reg68) : $unsigned(wire65)) ?
              wire60 : {(~^wire65)})) : ((~^(^~wire66)) ?
              $signed($signed($signed((8'h9f)))) : (wire61 ?
                  $signed(reg72[(2'h2):(1'h1)]) : $signed(reg69[(1'h1):(1'h0)]))));
      if (wire59[(3'h4):(1'h1)])
        begin
          if ((wire66[(3'h7):(1'h0)] ?
              wire62[(1'h0):(1'h0)] : ($signed(({wire61,
                      wire63} * $signed(reg74))) ?
                  (~wire65[(4'h9):(1'h0)]) : {wire63[(4'h9):(3'h5)], wire65})))
            begin
              reg77 <= {$signed((8'ha0))};
            end
          else
            begin
              reg77 <= ($unsigned((~$signed(reg72))) ^~ reg69[(3'h6):(2'h2)]);
              reg78 <= {wire64[(2'h3):(2'h2)], wire61};
              reg79 <= (wire60 ^~ $unsigned(wire67[(1'h0):(1'h0)]));
              reg80 <= $unsigned(wire61);
              reg81 <= reg80[(3'h7):(1'h1)];
            end
          if (wire62[(1'h0):(1'h0)])
            begin
              reg82 <= {wire59[(1'h1):(1'h0)], (~wire65[(4'h8):(3'h7)])};
              reg83 <= (~wire62);
              reg84 <= {reg73};
            end
          else
            begin
              reg82 <= reg82[(4'he):(4'hc)];
              reg83 <= ((((!reg76[(4'he):(4'h9)]) ?
                          (-$signed(reg76)) : $signed($unsigned((8'hbd)))) ?
                      (8'ha7) : $signed(reg68)) ?
                  $unsigned(reg84[(2'h3):(1'h1)]) : ((((reg74 > wire62) - (reg81 ?
                              reg83 : reg83)) ?
                          (reg81[(1'h1):(1'h0)] ?
                              (8'ha5) : (+(8'hb4))) : {(!reg81)}) ?
                      wire62[(2'h2):(1'h0)] : {{(^~reg71), $signed(reg74)}}));
              reg84 <= {reg77};
              reg85 <= reg78;
            end
          reg86 <= {({(~reg73)} ?
                  $unsigned($unsigned(wire62[(2'h2):(1'h0)])) : wire64[(3'h6):(3'h6)]),
              ($unsigned($unsigned($unsigned(reg82))) ?
                  reg83[(3'h4):(2'h3)] : (((wire65 - (7'h43)) ?
                          wire63[(3'h5):(3'h4)] : reg68) ?
                      (wire64 >>> (~^reg73)) : $signed(reg77[(3'h7):(3'h5)])))};
        end
      else
        begin
          if ({$signed({(~&$signed((8'h9c))), (~&(8'h9c))}),
              (reg86 ?
                  $unsigned(wire59) : (((+(8'ha3)) >> (reg85 ? reg85 : reg77)) ?
                      ($unsigned((8'hbc)) - $unsigned(wire65)) : reg73[(4'h8):(1'h0)]))})
            begin
              reg77 <= reg79;
              reg78 <= $unsigned((($unsigned((reg80 == reg86)) != (((8'haa) ?
                  reg73 : reg81) ^~ ((8'haf) ?
                  (8'ha6) : reg81))) && $signed(({(8'h9f)} ?
                  wire67 : wire63))));
              reg79 <= wire64;
              reg80 <= $signed(reg73);
              reg81 <= ($signed(reg74[(2'h3):(1'h1)]) * reg69[(3'h6):(3'h4)]);
            end
          else
            begin
              reg77 <= ($signed({reg85[(3'h7):(1'h0)],
                  reg79[(1'h1):(1'h0)]}) & $signed($unsigned($unsigned($unsigned(reg83)))));
              reg78 <= ((|(($unsigned(reg79) ?
                      (reg84 * reg83) : wire65[(3'h6):(2'h2)]) ?
                  {(&(8'hb7))} : (~^(wire61 << wire61)))) ~^ reg78);
              reg79 <= reg73[(2'h3):(2'h3)];
              reg80 <= (~^({(^reg70)} << reg84));
            end
          reg82 <= (-(8'hb6));
          reg83 <= ((reg70[(1'h0):(1'h0)] != (~&($signed(reg86) <= (reg86 * wire62)))) ?
              (^~(^~($signed(reg74) > reg79))) : (reg75 && reg83[(2'h3):(2'h3)]));
        end
    end
  assign wire87 = (wire67[(4'ha):(2'h3)] == $signed((reg72[(2'h2):(1'h0)] ~^ reg74)));
  assign wire88 = reg69;
  always
    @(posedge clk) begin
      if (($signed(reg73[(2'h3):(2'h3)]) ?
          $signed((~$unsigned((8'ha4)))) : wire62[(1'h1):(1'h0)]))
        begin
          reg89 <= {(^((wire63 ?
                  reg81[(3'h6):(3'h4)] : reg86[(3'h6):(2'h2)]) << ((|wire65) + reg84[(2'h2):(1'h1)]))),
              ($signed(((wire62 >>> wire59) * (reg68 ?
                  reg79 : wire59))) == ((((8'hb9) == wire63) ?
                      $unsigned(reg81) : (reg68 ? (8'hb2) : reg79)) ?
                  wire87 : wire61))};
          reg90 <= wire65[(4'hb):(4'h9)];
          reg91 <= $unsigned((-$signed(((+wire62) + (!reg86)))));
        end
      else
        begin
          if (reg71[(3'h7):(3'h7)])
            begin
              reg89 <= (8'ha8);
              reg90 <= ($unsigned((&wire65)) <= $unsigned(((reg73[(3'h4):(1'h1)] <= reg79) ?
                  $unsigned((~|(8'ha6))) : (!(~^reg68)))));
              reg91 <= ($signed(reg77) != reg77);
            end
          else
            begin
              reg89 <= {(^$unsigned(wire88[(2'h3):(1'h1)]))};
              reg90 <= (reg85 == $signed(((^~(reg77 ? reg70 : (8'hb9))) ?
                  (reg84 ?
                      wire64[(3'h7):(3'h6)] : ((8'hb7) >> (8'hbd))) : ((wire61 < reg75) ?
                      wire67 : reg68))));
              reg91 <= $unsigned((-$unsigned($signed(wire60))));
            end
          reg92 <= (8'hbf);
          reg93 <= (^((reg89 < (!(~|wire64))) ?
              $unsigned(($unsigned(wire62) ?
                  (-wire63) : (reg86 ? wire67 : (8'hbb)))) : (~reg78)));
          if (($signed($signed($signed(wire67[(3'h7):(2'h3)]))) && (8'hb1)))
            begin
              reg94 <= $unsigned(reg69[(4'h9):(2'h3)]);
              reg95 <= {wire60[(5'h11):(3'h7)]};
              reg96 <= wire87[(1'h1):(1'h1)];
            end
          else
            begin
              reg94 <= reg79[(1'h1):(1'h1)];
              reg95 <= reg85;
              reg96 <= $unsigned($signed((&$signed($signed((8'hab))))));
            end
          reg97 <= (!{(((reg77 ? reg70 : reg94) ?
                  (!reg92) : (reg86 >= reg75)) + $unsigned($signed(reg83))),
              ({(wire60 < wire63), (wire63 ? wire66 : reg79)} | (reg82 ?
                  {reg74, reg76} : (~|reg82)))});
        end
    end
  assign wire98 = ({(reg86[(1'h1):(1'h0)] ^ reg90)} ?
                      {($unsigned((reg80 + reg76)) ? (8'hb5) : (8'ha2)),
                          reg91} : $unsigned($signed(($unsigned(reg95) ?
                          $signed(reg82) : $signed(wire66)))));
  always
    @(posedge clk) begin
      reg99 <= (^~reg77[(2'h2):(1'h1)]);
      if ((wire63[(5'h12):(5'h12)] >> $signed((8'hae))))
        begin
          reg100 <= (reg85[(4'h8):(3'h7)] >>> ((+reg70) << $unsigned((+(reg89 << reg92)))));
          if ($unsigned((!{(^(wire67 ^ (8'hb2)))})))
            begin
              reg101 <= ((&reg95[(2'h3):(2'h3)]) ?
                  {(~(-reg73[(4'hb):(2'h3)]))} : reg92[(4'h8):(3'h4)]);
              reg102 <= ($signed(reg73[(2'h2):(1'h1)]) && $unsigned($signed($unsigned($unsigned(reg73)))));
              reg103 <= (~|(7'h40));
              reg104 <= $signed({(wire98[(2'h2):(2'h2)] ?
                      {((8'ha7) ?
                              reg101 : reg101)} : $unsigned(reg75[(2'h2):(1'h1)]))});
            end
          else
            begin
              reg101 <= ((reg96[(2'h3):(2'h2)] ?
                  (8'hb3) : reg100[(1'h0):(1'h0)]) ~^ wire98[(3'h4):(1'h1)]);
              reg102 <= (~$signed((-reg77[(2'h2):(2'h2)])));
              reg103 <= ($signed((&{reg91})) ?
                  ((!($signed(reg73) < $signed(wire60))) ?
                      (^((8'hb9) < (reg100 ?
                          wire64 : (8'ha1)))) : wire98[(3'h5):(3'h5)]) : ($signed(wire98[(2'h2):(1'h0)]) & $signed((^~{reg73,
                      wire98}))));
            end
        end
      else
        begin
          reg100 <= (7'h40);
        end
      reg105 <= (~((8'hb1) == reg74[(2'h3):(1'h1)]));
      reg106 <= $unsigned($signed((8'hb1)));
      reg107 <= $unsigned(reg89[(5'h10):(4'h9)]);
    end
  assign wire108 = $signed($unsigned($signed(reg82[(4'hc):(3'h4)])));
  assign wire109 = $unsigned(($signed($signed(reg106)) ?
                       (($unsigned(reg71) >> ((7'h43) < reg70)) ?
                           reg107[(2'h3):(2'h2)] : reg100[(2'h3):(1'h1)]) : $unsigned(((wire87 ?
                           (8'ha0) : (7'h44)) == (^~reg70)))));
  always
    @(posedge clk) begin
      reg110 <= $signed((!(^(~(reg106 || (8'h9d))))));
      reg111 <= ((+(reg94[(3'h5):(1'h0)] ?
              $signed({wire63,
                  (7'h41)}) : ((-(8'haa)) >>> ((8'haf) ~^ reg105)))) ?
          $unsigned($unsigned((+reg90[(4'h9):(3'h7)]))) : (~^(+(^$unsigned(reg81)))));
    end
  assign wire112 = $unsigned($unsigned(reg104[(1'h0):(1'h0)]));
endmodule

module module23
#(parameter param54 = (({(~&((8'haa) * (8'hb6)))} ? (+((~|(8'hbf)) != ((8'hb2) ? (8'hb4) : (8'h9f)))) : (-((~&(7'h40)) ? ((8'hb3) ? (8'haf) : (8'ha3)) : ((8'hab) <<< (8'hb5))))) ? (|{((-(7'h40)) ^~ ((8'hbf) ~^ (8'hb3)))}) : {({(8'hb0)} <= (8'hb8)), (((+(8'hb3)) && ((8'hbe) ? (8'hb7) : (8'h9d))) ? ((~(8'h9e)) ? ((8'had) ? (8'h9e) : (8'haf)) : {(8'hae)}) : ({(8'hbd)} ? {(8'hb9), (8'hb0)} : ((8'hb3) ? (8'h9c) : (8'hba))))}), 
parameter param55 = ((8'hbb) && ((~^param54) ? (~^{{param54, param54}}) : ((param54 ^ (param54 <<< param54)) ? param54 : param54))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire28;
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire28,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = $unsigned((8'ha8));
  always
    @(posedge clk) begin
      if (wire27[(3'h6):(1'h1)])
        begin
          reg29 <= wire24[(3'h5):(3'h5)];
          reg30 <= wire27[(4'hb):(4'h8)];
          reg31 <= (wire26 ?
              {$unsigned((&$signed((8'hae))))} : $signed(wire25));
        end
      else
        begin
          reg29 <= wire27[(2'h2):(2'h2)];
          if ($unsigned((~|($unsigned((-wire28)) == reg31))))
            begin
              reg30 <= reg30;
              reg31 <= (wire27 ?
                  (^((reg29 ? wire24 : wire28[(4'h8):(4'h8)]) ?
                      (reg31[(4'ha):(4'h9)] == (wire27 || wire28)) : ((!(8'ha7)) ?
                          $unsigned(reg30) : (reg31 > wire28)))) : ((~&(((8'hbf) << wire28) ?
                      (wire25 ? wire28 : wire26) : $signed(wire27))) + reg29));
              reg32 <= (($unsigned(((wire26 >> (8'ha0)) ?
                  $unsigned((8'hb7)) : $signed(reg29))) + wire27) * $unsigned((^~wire28[(3'h4):(1'h0)])));
            end
          else
            begin
              reg30 <= $signed((wire24[(1'h0):(1'h0)] ?
                  wire27[(4'hf):(4'ha)] : reg29));
              reg31 <= ((8'had) << reg30);
              reg32 <= (~|wire24);
              reg33 <= ($signed(wire27) ? (8'ha9) : wire28[(3'h4):(1'h1)]);
            end
          if ({wire27,
              {({(wire28 ? reg33 : wire28)} <<< (wire24 ?
                      $signed(reg32) : $signed(wire28)))}})
            begin
              reg34 <= reg30;
              reg35 <= {wire26[(5'h10):(1'h1)], wire24};
              reg36 <= reg35[(5'h13):(4'hf)];
              reg37 <= $unsigned(($signed($signed($signed(wire27))) ?
                  ({wire28[(3'h5):(2'h2)]} + reg36[(3'h6):(2'h2)]) : reg30[(3'h4):(3'h4)]));
              reg38 <= $signed(reg33[(2'h2):(1'h1)]);
            end
          else
            begin
              reg34 <= (8'hb6);
              reg35 <= $signed((($signed((wire25 ? wire27 : reg29)) ?
                  $unsigned((^~reg31)) : $unsigned((~|reg31))) ^ ({(~&(8'hbd))} ?
                  $signed((wire26 == (8'ha9))) : $unsigned(reg32))));
              reg36 <= $signed(reg37);
              reg37 <= $unsigned(($unsigned(((reg31 ? (8'ha1) : wire26) ?
                      $signed((8'ha2)) : (~^reg31))) ?
                  wire27 : (wire26 & wire27[(4'h9):(4'h8)])));
              reg38 <= $unsigned((reg30[(2'h2):(2'h2)] ?
                  wire26[(4'hb):(2'h2)] : $signed($signed((wire24 ?
                      reg38 : reg31)))));
            end
          reg39 <= {((^~(&reg31)) ^ reg29[(3'h5):(1'h0)]),
              ($unsigned(reg29) ? reg31 : $signed({wire25[(2'h2):(2'h2)]}))};
          reg40 <= $unsigned($unsigned({reg30, $unsigned({reg35, reg39})}));
        end
      if (reg39[(3'h5):(2'h2)])
        begin
          reg41 <= ((((!reg31) ? $signed({reg29}) : reg35) ?
              reg34 : {reg33[(2'h3):(1'h1)], wire27}) >> {((8'ha6) ?
                  (^reg39[(1'h0):(1'h0)]) : {$signed(reg31)})});
          reg42 <= reg37[(4'hd):(2'h3)];
          if ($signed(reg42))
            begin
              reg43 <= (reg37[(1'h1):(1'h0)] <<< (&$unsigned(reg33)));
              reg44 <= $unsigned(reg40);
              reg45 <= $unsigned(reg30);
              reg46 <= (^~((reg34[(1'h0):(1'h0)] | $unsigned((reg31 ^ reg31))) & reg36[(3'h6):(1'h0)]));
              reg47 <= reg36[(4'ha):(1'h1)];
            end
          else
            begin
              reg43 <= $signed(reg47[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          reg41 <= ($unsigned(($unsigned($unsigned(reg30)) ?
                  (-reg41[(4'hb):(2'h3)]) : $signed(reg34))) ?
              ((reg38[(2'h3):(2'h2)] && $signed($signed(wire24))) ?
                  wire26[(2'h3):(2'h3)] : reg42) : (-(((reg38 ? reg31 : reg32) ?
                      (wire24 ? wire25 : reg29) : $signed(reg31)) ?
                  reg43[(4'h9):(2'h2)] : wire27)));
          reg42 <= (8'had);
          reg43 <= reg44;
          reg44 <= ($unsigned($signed(reg32)) <<< ({{$signed(reg38),
                  (reg43 <= reg44)}} >>> (reg34 == $unsigned((reg41 ?
              reg45 : reg29)))));
        end
      if (wire26[(4'hb):(4'ha)])
        begin
          reg48 <= $signed((reg36 ?
              ({(reg30 ? wire28 : (8'hb2))} ?
                  (-reg39[(1'h1):(1'h0)]) : reg46[(5'h12):(3'h7)]) : (~(~^reg45))));
        end
      else
        begin
          reg48 <= ((&reg44) || (reg47[(4'hd):(2'h2)] | reg38));
          reg49 <= $signed($unsigned(($unsigned($signed(reg39)) ?
              (-$signed(reg43)) : ((-reg42) ? reg36 : (-(8'hb6))))));
        end
    end
  assign wire50 = (~$signed((^wire24)));
  assign wire51 = ($unsigned((8'hbf)) ?
                      (reg32 <= ((wire50[(1'h1):(1'h0)] ?
                          (|reg41) : (^~reg36)) != ((reg42 < wire24) <= reg33[(2'h3):(1'h0)]))) : (|({(!reg32),
                          {wire25, reg34}} | ((reg42 ?
                          reg40 : reg38) >= (wire27 != reg45)))));
  assign wire52 = (^$unsigned($unsigned($signed(wire28[(3'h4):(1'h0)]))));
  assign wire53 = (~|$unsigned(((~&$signed(reg42)) ?
                      reg31[(5'h13):(1'h1)] : (~&$unsigned((8'hbf))))));
endmodule
