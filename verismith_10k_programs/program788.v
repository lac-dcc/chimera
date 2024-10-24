module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire161;
  wire signed [(4'h8):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(3'h4):(1'h0)] wire157;
  wire [(4'hd):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire142;
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire5,
                 wire142,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire5 = wire1;
  module6 #() modinst143 (wire142, clk, wire5, wire3, wire4, wire0, wire2);
  always
    @(posedge clk) begin
      if ($signed(($unsigned((8'hab)) && (wire142 ?
          {$signed(wire3), {wire2}} : wire5[(2'h3):(2'h2)]))))
        begin
          reg144 <= {$unsigned(wire3)};
          reg145 <= ({$signed(wire142)} & ({$signed(wire142[(3'h6):(2'h2)])} && (reg144 > ((wire1 <= (8'hb5)) || wire2))));
          reg146 <= $unsigned(($unsigned(wire1[(1'h1):(1'h1)]) ?
              ((~^$signed((8'ha5))) == {wire2}) : (!(~^wire3))));
        end
      else
        begin
          if ({($signed(((-wire4) >>> {wire1, reg146})) ?
                  $unsigned(wire3) : $signed(wire3[(3'h7):(3'h7)])),
              $signed((~|((wire142 ~^ (8'hb2)) ?
                  $unsigned((8'haa)) : (wire2 ? reg144 : wire5))))})
            begin
              reg144 <= $unsigned(($unsigned($signed(wire5)) ?
                  $signed($unsigned(reg145[(2'h3):(2'h3)])) : $unsigned($unsigned(wire4))));
            end
          else
            begin
              reg144 <= {$signed((wire142[(4'h9):(3'h4)] | ((wire3 >= (7'h42)) ?
                      wire0 : (wire1 ^~ (8'hab))))),
                  $signed($signed(wire1))};
              reg145 <= $signed((wire4[(3'h7):(3'h7)] + (+$unsigned(((7'h40) ^~ wire5)))));
              reg146 <= $signed((wire0[(4'hf):(3'h7)] ?
                  (|(-{wire5, wire0})) : {(^{reg144, wire4})}));
            end
          reg147 <= wire142;
          reg148 <= ($unsigned({(!(wire4 ? wire142 : reg145)),
              (((8'ha1) ?
                  wire0 : reg144) + (&wire142))}) <<< (wire3 <<< wire3));
          if ($unsigned((^$unsigned(reg147))))
            begin
              reg149 <= $unsigned((+{wire0}));
              reg150 <= wire5[(2'h3):(2'h3)];
              reg151 <= $unsigned(wire1);
            end
          else
            begin
              reg149 <= wire142;
              reg150 <= ({$signed((wire0 + (reg149 ? (8'hae) : reg150))),
                  wire1[(2'h3):(1'h1)]} + $unsigned(((8'hbf) ?
                  (+(wire4 ? (8'hba) : reg147)) : ($unsigned(wire1) ?
                      reg149 : $unsigned(reg144)))));
              reg151 <= ($signed(wire2) ^~ reg145);
              reg152 <= (wire4[(1'h1):(1'h1)] ?
                  (reg144[(2'h3):(2'h3)] >= $signed(($signed(wire1) != (8'hbb)))) : $unsigned((wire3 < reg151)));
              reg153 <= $signed($unsigned(($unsigned((wire4 >= reg147)) ?
                  $signed((^~reg146)) : $unsigned(reg150[(3'h4):(3'h4)]))));
            end
        end
    end
  assign wire154 = $unsigned((reg149 < $unsigned({(wire142 | wire0),
                       ((8'hbb) <<< wire2)})));
  assign wire155 = (!$signed((wire4[(1'h1):(1'h0)] ?
                       wire4 : $signed((7'h41)))));
  assign wire156 = (~(8'hbd));
  assign wire157 = ($signed($signed(({wire4,
                       reg150} && $signed(reg149)))) > $signed((wire4[(4'h8):(4'h8)] || ((reg151 ?
                           reg146 : wire2) ?
                       $unsigned(wire142) : (8'hbd)))));
  assign wire158 = ((reg144[(1'h1):(1'h0)] ?
                           $unsigned({(wire154 ?
                                   reg147 : reg147)}) : {$signed((wire4 ?
                                   (8'h9f) : reg147))}) ?
                       $unsigned(wire156) : ((8'ha5) ?
                           $unsigned(($signed(wire2) > (reg144 & reg153))) : $unsigned($unsigned((wire155 <<< wire4)))));
  assign wire159 = ((reg144 >> (((~wire2) ? $signed(wire0) : (^~reg145)) ?
                       (8'hab) : (^~((8'ha2) ~^ reg144)))) >>> reg146[(4'h8):(3'h7)]);
  assign wire160 = $unsigned($unsigned($signed(reg153)));
  assign wire161 = {$signed($signed(reg152))};
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire61;
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  assign y = {wire140,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire61,
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
                 reg67,
                 (1'h0)};
  assign wire12 = $signed((-wire11));
  assign wire13 = wire11[(3'h6):(2'h2)];
  assign wire14 = (8'h9f);
  assign wire15 = (wire11[(4'h9):(3'h7)] ?
                      (~&{((wire7 & wire8) == (wire13 ?
                              (8'h9c) : wire11))}) : {wire13, wire10});
  assign wire16 = {$unsigned($unsigned((wire14[(4'hf):(4'hb)] ?
                          wire10 : wire8[(2'h2):(2'h2)])))};
  assign wire17 = $signed(($unsigned({{wire12, wire7}, (&wire10)}) ?
                      {wire16, wire8} : ({wire11[(1'h1):(1'h0)],
                          wire9[(2'h2):(1'h0)]} <<< wire15)));
  module18 #() modinst62 (wire61, clk, wire7, wire11, wire16, wire8, wire9);
  assign wire63 = wire13[(4'ha):(3'h5)];
  assign wire64 = $signed($unsigned(((wire8 ?
                      (8'hae) : wire15[(4'hc):(2'h3)]) << ((+wire9) << (wire15 ?
                      wire10 : (8'h9c))))));
  assign wire65 = wire7;
  assign wire66 = (^~$unsigned(((~wire11) ~^ (~((8'hae) == wire63)))));
  always
    @(posedge clk) begin
      if (wire63)
        begin
          reg67 <= wire61[(4'hc):(3'h7)];
          if ({(((wire65[(1'h0):(1'h0)] ? {wire11, wire64} : wire65) ?
                  ((wire8 ? wire61 : wire16) > {wire16,
                      wire17}) : reg67[(3'h6):(1'h0)]) >>> (^$unsigned($unsigned(wire7))))})
            begin
              reg68 <= wire66[(2'h2):(2'h2)];
              reg69 <= $unsigned({wire17});
              reg70 <= ({(wire7[(3'h7):(2'h2)] ?
                          $unsigned((8'h9d)) : wire10[(4'hd):(4'hd)]),
                      wire66[(1'h0):(1'h0)]} ?
                  (+wire12) : $unsigned((({wire9,
                      wire14} | $signed(wire8)) >= $unsigned({wire63,
                      reg69}))));
              reg71 <= {$signed(wire12[(2'h3):(2'h2)]),
                  ($unsigned($unsigned((~&reg69))) << $signed(((wire8 ?
                          wire66 : wire14) ?
                      {wire7, wire66} : (wire16 ~^ wire12))))};
              reg72 <= wire66[(1'h0):(1'h0)];
            end
          else
            begin
              reg68 <= (($unsigned(wire10) ?
                      (wire17[(2'h2):(2'h2)] <= (~((8'hb4) ?
                          wire16 : (8'h9f)))) : wire65[(1'h0):(1'h0)]) ?
                  (reg68 ?
                      (((wire14 ? wire11 : reg70) ?
                          (!wire9) : reg68[(5'h10):(3'h7)]) ^~ ((~&wire9) ?
                          {reg69} : reg69[(4'hb):(3'h7)])) : $unsigned((~|(wire11 & (8'hb0))))) : wire12);
              reg69 <= reg70[(1'h1):(1'h0)];
            end
          if (reg72)
            begin
              reg73 <= $signed(wire65);
            end
          else
            begin
              reg73 <= wire9;
              reg74 <= $signed(wire61);
              reg75 <= ($unsigned(({$signed(wire66), reg68[(4'hd):(3'h7)]} ?
                      ((8'hb6) ? (+wire63) : reg70) : (-(wire12 ?
                          wire65 : wire65)))) ?
                  $unsigned(wire13) : ((~&wire11[(3'h4):(3'h4)]) ?
                      wire63[(4'h9):(1'h0)] : wire63[(2'h2):(1'h0)]));
              reg76 <= $unsigned((wire16 ? wire61[(4'h9):(1'h0)] : reg68));
              reg77 <= (~^($signed((~|(wire15 ?
                  wire12 : reg72))) <<< $signed(wire14[(4'he):(1'h1)])));
            end
          reg78 <= $signed(($unsigned(($unsigned(wire9) + (~|wire12))) ?
              (~&((wire7 ^~ (8'ha2)) <<< ((8'hb5) == wire9))) : (~&((reg71 ^ reg75) ?
                  ((7'h44) ? (8'h9d) : wire14) : (^(8'hb3))))));
          reg79 <= wire8;
        end
      else
        begin
          reg67 <= (8'hbe);
          reg68 <= (($unsigned(($unsigned(wire65) & $signed(wire13))) ?
                  wire65[(1'h0):(1'h0)] : (^(~^$unsigned(wire61)))) ?
              wire7 : $signed(wire17[(1'h0):(1'h0)]));
          reg69 <= {($signed((8'hb8)) & reg67),
              (&$unsigned(((8'hb7) || (wire7 ? reg71 : reg75))))};
          reg70 <= $unsigned($signed((^reg76)));
        end
      reg80 <= wire65[(2'h2):(1'h0)];
      reg81 <= reg74;
      reg82 <= ($unsigned(((~(wire61 >= wire65)) ?
          reg77[(4'hc):(1'h0)] : $signed(((8'hba) & wire10)))) >= $unsigned({$signed((!reg76)),
          {{reg78}, reg78[(4'he):(4'ha)]}}));
      reg83 <= $signed(wire15);
    end
  module84 #() modinst141 (.wire88(wire7), .y(wire140), .wire86(reg80), .clk(clk), .wire87(reg72), .wire85(wire8));
endmodule

module module84  (y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire [(3'h7):(1'h0)] wire87;
  input wire signed [(2'h3):(1'h0)] wire86;
  input wire signed [(3'h6):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg109,
                 reg108,
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
                 (1'h0)};
  assign wire89 = $signed((^$signed({$signed((8'hbd)),
                      wire86[(1'h0):(1'h0)]})));
  assign wire90 = (^~(8'ha3));
  assign wire91 = wire86;
  assign wire92 = {$signed(($signed($signed(wire86)) >> wire88)),
                      $unsigned((^~(-wire85[(2'h3):(2'h3)])))};
  assign wire93 = ((wire89[(3'h6):(3'h4)] ^ ($signed((wire90 ?
                              wire88 : wire86)) ?
                          wire92[(4'hb):(4'h9)] : {(^~wire90),
                              $unsigned(wire87)})) ?
                      wire86[(1'h1):(1'h1)] : wire88[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg94 <= $signed((+(($unsigned(wire88) >>> {wire87, (8'ha4)}) ?
          $unsigned($signed(wire88)) : (|wire85[(2'h3):(1'h1)]))));
      reg95 <= $unsigned($signed(wire88[(1'h0):(1'h0)]));
      reg96 <= (8'ha3);
      if ({{$unsigned((~&(wire85 ? wire86 : reg95)))},
          (^~{wire91[(3'h6):(2'h3)], (~$unsigned(wire88))})})
        begin
          if (wire88)
            begin
              reg97 <= reg95;
              reg98 <= $signed({wire91, $unsigned((~^(+reg97)))});
              reg99 <= (8'hbc);
              reg100 <= ((($signed((~|wire86)) ?
                      $signed($signed(reg96)) : ($signed((8'ha3)) <= (^~reg94))) < ((reg96[(3'h4):(2'h3)] ?
                      $unsigned(reg96) : $unsigned(wire93)) | reg99)) ?
                  reg95[(2'h3):(1'h0)] : $unsigned({reg95}));
            end
          else
            begin
              reg97 <= (~&((|wire87[(1'h1):(1'h0)]) ?
                  reg100[(4'hf):(2'h3)] : ({$unsigned(reg99),
                      $unsigned(reg97)} >>> wire87[(3'h7):(3'h6)])));
            end
          reg101 <= (^~(reg95 >>> (~^($unsigned(wire87) << {reg98, (8'ha1)}))));
          reg102 <= (((((8'ha8) ? reg97[(3'h7):(3'h4)] : $unsigned(reg99)) ?
                  ($unsigned(reg96) ?
                      reg95[(3'h4):(3'h4)] : (reg97 >>> wire88)) : wire89[(3'h4):(2'h2)]) | (wire90[(4'h8):(3'h7)] & $unsigned($unsigned(wire88)))) ?
              reg94 : (~$unsigned(($signed(wire89) ?
                  wire90[(5'h14):(1'h0)] : reg99))));
        end
      else
        begin
          if (reg97)
            begin
              reg97 <= $unsigned(reg96);
              reg98 <= {{(($signed(reg98) ?
                          $signed(reg97) : (wire92 <= reg96)) + $unsigned(reg100[(2'h2):(2'h2)])),
                      reg94}};
              reg99 <= ($signed((^~wire93[(1'h0):(1'h0)])) >= reg98);
            end
          else
            begin
              reg97 <= {$signed(wire88[(2'h2):(1'h0)])};
            end
          if (((&reg98) ?
              $signed($signed({(reg97 >= (8'hb6)),
                  wire91[(3'h4):(2'h2)]})) : {$signed(wire93[(2'h3):(2'h2)])}))
            begin
              reg100 <= (^~$signed(reg102));
              reg101 <= ((&wire85[(2'h2):(1'h0)]) > $unsigned($signed((~reg98))));
              reg102 <= {((|$signed(reg101)) - $signed((|$unsigned(wire90)))),
                  (!{reg96[(1'h1):(1'h0)], (^(wire88 <= wire87))})};
              reg103 <= (^~reg95[(4'h9):(4'h9)]);
            end
          else
            begin
              reg100 <= $unsigned(($signed(reg94) ?
                  (|reg96[(1'h0):(1'h0)]) : $unsigned(((~^reg96) != (reg101 ?
                      reg103 : reg94)))));
              reg101 <= $signed($unsigned($unsigned(((^~reg102) * (reg101 ?
                  reg95 : reg101)))));
            end
        end
      reg104 <= (($unsigned(($unsigned(wire86) == wire85)) ?
              reg98 : (^{(^~reg101)})) ?
          ($signed(wire87) ?
              $signed((~^{(8'h9f)})) : (-(reg99[(1'h1):(1'h0)] * wire89[(2'h3):(1'h0)]))) : reg103);
    end
  assign wire105 = (~^((((wire92 == wire93) <= (wire91 | (8'ha6))) ?
                           wire90 : {reg100, {reg103}}) ?
                       (8'ha6) : $unsigned((|reg100))));
  assign wire106 = $unsigned(wire93[(1'h1):(1'h0)]);
  assign wire107 = reg99[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg108 <= $signed((8'hb2));
      reg109 <= $unsigned((~&(^(-(!wire92)))));
    end
  assign wire110 = $unsigned(wire86[(2'h3):(2'h2)]);
  assign wire111 = reg102;
  assign wire112 = $unsigned({(reg108[(4'h9):(2'h3)] * wire86[(1'h1):(1'h1)])});
  assign wire113 = reg101;
  assign wire114 = wire87[(1'h0):(1'h0)];
  assign wire115 = (^~(wire88 & (~|(~|$signed(wire114)))));
  always
    @(posedge clk) begin
      reg116 <= ({wire86, wire85[(1'h0):(1'h0)]} && wire106);
      reg117 <= $unsigned((((8'hb0) && $signed((wire111 <<< wire92))) ?
          {((~|wire86) ?
                  wire92 : $signed(wire110))} : (-wire106[(1'h0):(1'h0)])));
      reg118 <= (($unsigned(wire105) >= (8'ha5)) ?
          ($unsigned((~|(reg102 & reg116))) ?
              $signed({$signed(wire85)}) : $unsigned(reg101[(1'h1):(1'h0)])) : (^$unsigned(reg117)));
      if ($unsigned($signed(((~&wire107[(4'ha):(4'h8)]) * reg102[(4'hc):(4'hc)]))))
        begin
          if ($signed((+((&reg103) ? reg98[(4'hb):(1'h1)] : wire90))))
            begin
              reg119 <= wire106;
              reg120 <= $signed((^$signed(({wire86} || wire113))));
              reg121 <= ((reg96[(2'h3):(1'h0)] && $signed((reg99[(3'h5):(2'h2)] ?
                      (-reg96) : (wire112 ? reg118 : wire93)))) ?
                  $signed($unsigned({wire87[(2'h3):(2'h2)]})) : (^~(($unsigned((8'hae)) ^ (|wire105)) ?
                      $unsigned((-(8'hb5))) : ((reg94 == reg100) == $unsigned(reg101)))));
              reg122 <= (({reg117[(2'h3):(2'h2)],
                      (~^reg102)} >= (~$signed($signed(wire105)))) ?
                  reg118 : (wire105 ~^ (~reg100)));
              reg123 <= (^{(!wire89[(3'h7):(2'h3)]),
                  $signed({(+reg99), (!reg121)})});
            end
          else
            begin
              reg119 <= $unsigned(wire112[(3'h5):(1'h1)]);
              reg120 <= $unsigned($unsigned($unsigned(wire111)));
              reg121 <= reg96[(3'h5):(3'h4)];
            end
          if ({reg96, wire114[(4'hf):(3'h6)]})
            begin
              reg124 <= ($signed({$unsigned(reg96),
                  {wire85}}) - $unsigned($signed(wire112)));
              reg125 <= (~($unsigned(reg99) ?
                  (reg122 ^~ $unsigned($signed(wire105))) : (~^$signed((-(8'ha2))))));
            end
          else
            begin
              reg124 <= {$signed({reg102[(5'h13):(1'h1)], reg96}),
                  ((^wire110[(4'hc):(2'h3)]) ?
                      $unsigned(($signed((8'hb7)) ?
                          (!reg99) : reg98)) : $unsigned($unsigned(reg118[(2'h2):(1'h1)])))};
              reg125 <= (~((~|(~^$signed(reg120))) ?
                  ({(~|wire90)} ^~ (|((8'hb9) ?
                      wire88 : reg98))) : ({$unsigned(wire87)} || ((wire107 > reg124) ?
                      reg124[(4'hd):(1'h0)] : (wire90 ? wire89 : reg104)))));
              reg126 <= wire89[(3'h6):(3'h6)];
            end
          if ((reg124[(3'h5):(2'h3)] && ($unsigned((8'ha8)) * ($unsigned(wire90) ?
              ($unsigned(reg123) << (wire115 != wire114)) : ((wire86 ~^ reg103) ^ $signed(wire107))))))
            begin
              reg127 <= {$signed(reg119),
                  $signed($signed($unsigned((reg101 ^ wire89))))};
              reg128 <= ((reg109 ~^ wire85[(3'h6):(1'h1)]) >> (wire85[(1'h1):(1'h0)] ?
                  $signed(((&(8'hbd)) == wire87[(3'h4):(2'h3)])) : wire115));
              reg129 <= {wire90[(5'h11):(5'h10)]};
              reg130 <= wire106[(4'hd):(4'hc)];
            end
          else
            begin
              reg127 <= wire110;
              reg128 <= (($unsigned((~|(wire111 ? wire113 : reg127))) ?
                      reg122 : wire106) ?
                  wire91[(2'h3):(1'h1)] : (((^~((8'hae) << wire89)) <= (~$signed(wire86))) << wire106));
              reg129 <= wire115[(4'hc):(4'h9)];
              reg130 <= $signed(({$unsigned((+(7'h44)))} + wire114));
            end
        end
      else
        begin
          reg119 <= ({(($signed(reg129) ?
                      $unsigned(wire110) : reg95[(4'he):(4'h8)]) ?
                  wire89[(1'h0):(1'h0)] : $unsigned((reg94 ?
                      wire93 : (8'hb3))))} != $unsigned(wire86[(2'h3):(2'h2)]));
          reg120 <= ($signed({reg95[(2'h3):(1'h1)]}) ?
              wire93 : ({reg123, {wire110[(4'hf):(3'h7)]}} ?
                  (-({(8'hb0)} <<< (reg98 > wire112))) : ((wire113[(2'h3):(1'h0)] ?
                          (|(8'ha6)) : ((8'haa) == reg94)) ?
                      ((^(8'h9e)) ?
                          $signed(reg99) : wire114) : $unsigned((!reg121)))));
          reg121 <= ((~($signed($unsigned(reg97)) >> wire92)) ?
              ($unsigned(reg102[(5'h13):(1'h1)]) ?
                  (^(((8'hb8) ~^ reg119) ?
                      ((7'h41) ? reg121 : wire88) : reg102)) : (+({wire105,
                          reg95} ?
                      ((8'hb5) ? (7'h43) : reg103) : (wire115 ?
                          wire111 : wire85)))) : $unsigned(wire111));
          if ($unsigned(reg124))
            begin
              reg122 <= (reg129[(2'h2):(1'h1)] ?
                  ((({(8'ha0), wire115} <= (~|(8'ha6))) ?
                          $unsigned(reg94) : {((8'ha8) ? reg98 : reg120),
                              (|(8'hab))}) ?
                      $unsigned({wire91[(1'h0):(1'h0)],
                          $unsigned(reg103)}) : {reg95[(5'h10):(4'hc)],
                          (&$signed(reg101))}) : $unsigned(wire110[(1'h0):(1'h0)]));
              reg123 <= reg128[(4'h8):(1'h1)];
              reg124 <= ((~wire86[(2'h3):(2'h2)]) - wire113);
            end
          else
            begin
              reg122 <= wire93;
              reg123 <= (reg129 <<< $unsigned(reg127));
            end
        end
      if ($unsigned(reg129[(3'h6):(2'h2)]))
        begin
          reg131 <= (^~$signed((reg124 > (reg109 ?
              reg116[(1'h1):(1'h1)] : (reg97 >= wire93)))));
        end
      else
        begin
          reg131 <= (~($signed((reg128[(3'h7):(2'h2)] >>> $unsigned(wire113))) ?
              ($unsigned(((8'hb9) - wire88)) ? reg125 : wire113) : (({reg97,
                  reg131} >>> (reg127 == reg129)) ^ ((~|wire114) + (wire93 >>> reg127)))));
          reg132 <= (!reg108);
          if (wire86[(1'h0):(1'h0)])
            begin
              reg133 <= $unsigned({reg126});
              reg134 <= reg133;
            end
          else
            begin
              reg133 <= ({reg126[(4'he):(2'h3)], $signed((&(&wire86)))} ?
                  reg95 : (+(($signed(wire110) - $signed(reg132)) < ((~^wire110) >= (wire93 ?
                      reg108 : wire115)))));
              reg134 <= wire92[(4'he):(4'ha)];
              reg135 <= $signed((wire115 ?
                  (8'hb4) : $signed($signed((reg132 ? reg119 : (8'ha9))))));
            end
        end
    end
  assign wire136 = $signed({(7'h40)});
  assign wire137 = ($unsigned($signed(((reg102 >= reg118) > {(8'haf),
                           wire92}))) ?
                       (!$signed($signed($signed(reg118)))) : (^~reg129));
  assign wire138 = (~|$signed(reg120));
  assign wire139 = ((~^(8'had)) && (^{$unsigned((reg126 && reg123))}));
endmodule

module module18
#(parameter param59 = (({{((7'h43) ? (7'h40) : (7'h42)), ((8'ha6) ? (8'hbb) : (8'ha7))}} ? (~^((8'hb4) <<< {(8'hab), (8'ha4)})) : {(~^((8'ha0) || (8'ha5))), (((8'haf) ? (7'h41) : (8'hb7)) && (^~(7'h43)))}) ? ((-(~^{(8'ha4), (8'h9e)})) ? (!((8'hb7) ? (^~(8'h9d)) : ((8'ha1) + (8'ha9)))) : (+{(+(8'ha2))})) : ((-((-(8'haf)) ? (&(8'hb5)) : (8'hb7))) * {((|(8'ha1)) >> ((8'haa) ? (7'h43) : (8'hb7))), (((8'h9e) ? (8'ha3) : (7'h44)) >= ((8'hb6) ? (8'ha8) : (8'hb2)))})), 
parameter param60 = param59)
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  assign y = {wire58,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg31,
                 reg26,
                 (1'h0)};
  assign wire24 = (($signed((|(+wire21))) > (+$signed($signed(wire20)))) ?
                      wire22 : $signed(wire19[(1'h1):(1'h0)]));
  assign wire25 = $signed($unsigned(wire21));
  always
    @(posedge clk) begin
      reg26 <= wire22;
    end
  assign wire27 = (-$signed(reg26));
  assign wire28 = (+wire25);
  assign wire29 = (((-wire21) ?
                          {(wire27 - $signed(wire25)),
                              $unsigned($unsigned(wire19))} : wire27) ?
                      $unsigned($signed(((wire21 ? wire24 : wire24) * (reg26 ?
                          wire23 : wire27)))) : wire28[(1'h0):(1'h0)]);
  assign wire30 = $unsigned(wire20);
  always
    @(posedge clk) begin
      reg31 <= ((^~wire29) == wire28);
    end
  assign wire32 = wire25;
  always
    @(posedge clk) begin
      if (reg26[(1'h0):(1'h0)])
        begin
          reg33 <= $signed(((+(wire21[(1'h1):(1'h1)] == $unsigned((8'hac)))) <= (($unsigned(wire24) >>> reg31) == (|(8'ha4)))));
          if ($signed((8'ha2)))
            begin
              reg34 <= $signed((reg26[(1'h0):(1'h0)] == {wire19[(4'h8):(1'h0)]}));
            end
          else
            begin
              reg34 <= $signed(wire22);
              reg35 <= ($signed(reg33[(4'hc):(2'h3)]) == (|$unsigned($signed(wire30))));
            end
        end
      else
        begin
          reg33 <= $signed((wire20 ?
              $signed(reg33) : $unsigned(wire19[(4'h8):(1'h1)])));
        end
      reg36 <= ($unsigned($unsigned({(-wire25)})) & (8'ha3));
      reg37 <= (8'haa);
    end
  assign wire38 = ({(~reg37[(2'h2):(1'h1)])} ?
                      wire24 : $unsigned($unsigned(wire20)));
  assign wire39 = ($signed(wire27[(4'h9):(4'h8)]) != $signed(wire29[(4'hf):(3'h6)]));
  assign wire40 = reg31;
  assign wire41 = wire25[(1'h0):(1'h0)];
  assign wire42 = wire29;
  always
    @(posedge clk) begin
      reg43 <= $unsigned(wire24[(4'hb):(4'ha)]);
      if ((|(($unsigned({reg31, wire27}) ?
          $signed((wire40 + wire21)) : ((wire28 < wire24) || wire22[(2'h2):(1'h1)])) <<< reg34)))
        begin
          if ($unsigned((wire22 ?
              $unsigned((wire39[(4'h8):(4'h8)] == wire25)) : wire38)))
            begin
              reg44 <= ($unsigned($unsigned(wire39)) ?
                  $unsigned({(|((8'ha6) >= wire19))}) : $unsigned($unsigned((&{(7'h43)}))));
            end
          else
            begin
              reg44 <= (8'h9d);
              reg45 <= (~^wire40[(3'h6):(3'h4)]);
              reg46 <= reg36;
            end
          reg47 <= wire24;
        end
      else
        begin
          reg44 <= $unsigned($signed((wire20[(4'h8):(1'h0)] ^~ ($unsigned(reg45) ?
              reg34 : $unsigned(reg33)))));
          reg45 <= (({$unsigned($signed(wire42))} ^ $signed($unsigned((+wire39)))) >> (reg47 ?
              wire21[(2'h2):(1'h0)] : wire41));
        end
      reg48 <= reg36;
      if ($unsigned((~^reg34[(2'h2):(2'h2)])))
        begin
          reg49 <= (!wire38);
          reg50 <= {wire20,
              $unsigned((wire19 ?
                  $unsigned(reg26) : $unsigned((reg37 >> reg43))))};
          reg51 <= $unsigned((({(7'h42)} ?
              wire23 : ($signed(reg36) ~^ (reg44 || reg31))) >= (8'ha1)));
        end
      else
        begin
          reg49 <= (~|wire25[(2'h2):(1'h1)]);
          reg50 <= $signed((wire41[(3'h4):(1'h0)] ~^ wire27));
          if ($unsigned($signed(wire40)))
            begin
              reg51 <= $unsigned(wire20);
            end
          else
            begin
              reg51 <= {{reg50,
                      ({(~|reg48), (reg45 | (8'hb8))} - $unsigned(reg34))},
                  ($unsigned($unsigned({wire27,
                      reg35})) && ((~|$unsigned(reg48)) ^~ reg48[(2'h3):(2'h2)]))};
              reg52 <= {wire24[(3'h4):(3'h4)]};
              reg53 <= {((!(|{wire23, reg37})) ?
                      reg46[(3'h4):(1'h0)] : (({wire20} ~^ (8'ha6)) ?
                          $signed($signed(reg52)) : wire30[(4'h9):(3'h7)])),
                  wire41[(3'h4):(3'h4)]};
              reg54 <= $signed($signed((7'h42)));
              reg55 <= wire23[(2'h2):(1'h0)];
            end
          reg56 <= (|(8'hb8));
        end
      reg57 <= (-$unsigned((~^((reg44 >> reg48) ? (~reg43) : $signed(reg56)))));
    end
  assign wire58 = reg37;
endmodule
