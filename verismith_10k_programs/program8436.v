module top
#(parameter param239 = ((~(((!(8'hb9)) + ((8'ha3) || (8'had))) ? (((8'hb2) + (8'ha1)) ? (|(8'ha8)) : ((8'hb5) != (8'hbe))) : (^~((8'hba) ? (8'had) : (8'h9c))))) - (|((!((8'hab) ^~ (8'h9f))) ? {(8'ha4), ((8'ha7) ? (8'hbe) : (8'h9f))} : {(~|(8'ha3))}))), 
parameter param240 = param239)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire238;
  wire [(4'h9):(1'h0)] wire228;
  wire [(4'ha):(1'h0)] wire227;
  wire [(5'h11):(1'h0)] wire226;
  wire [(3'h7):(1'h0)] wire225;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire223;
  reg signed [(5'h12):(1'h0)] reg237 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg236 = (1'h0);
  reg [(3'h7):(1'h0)] reg235 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg234 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg232 = (1'h0);
  reg [(5'h11):(1'h0)] reg231 = (1'h0);
  reg [(4'h9):(1'h0)] reg230 = (1'h0);
  reg [(5'h10):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  assign y = {wire238,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire89,
                 wire5,
                 wire4,
                 wire91,
                 wire92,
                 wire93,
                 wire96,
                 wire223,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg94,
                 reg95,
                 (1'h0)};
  assign wire4 = ($signed(wire2[(3'h4):(3'h4)]) ?
                     wire2 : ((wire2 ?
                             (&wire1) : (((8'hab) ? wire1 : wire0) ?
                                 (wire2 | (8'ha0)) : $unsigned(wire0))) ?
                         (^((8'hbe) ?
                             wire3 : wire1[(3'h7):(3'h4)])) : $unsigned(wire3[(2'h3):(2'h3)])));
  assign wire5 = $signed({wire0,
                     (wire3[(2'h3):(2'h3)] <<< $signed(wire3[(1'h1):(1'h0)]))});
  module6 #() modinst90 (.clk(clk), .wire7(wire5), .wire9(wire0), .y(wire89), .wire11(wire3), .wire8(wire4), .wire10(wire2));
  assign wire91 = $signed($signed(((!(-(7'h41))) ?
                      wire2 : ({wire0, wire1} >= wire89[(2'h2):(2'h2)]))));
  assign wire92 = ($unsigned(((~(wire91 != wire89)) ?
                      wire89 : ($unsigned(wire3) ?
                          wire91[(1'h0):(1'h0)] : $unsigned(wire0)))) > wire1[(1'h1):(1'h1)]);
  assign wire93 = ({$unsigned(($unsigned(wire2) ?
                              ((8'hbf) >> wire0) : (wire2 >>> wire0))),
                          wire92[(4'h9):(4'h8)]} ?
                      wire3 : (wire92[(4'ha):(2'h2)] ?
                          wire3 : (((|wire91) < wire4[(1'h1):(1'h1)]) ?
                              (~&(wire89 >> wire92)) : $unsigned(wire3[(4'hc):(2'h2)]))));
  always
    @(posedge clk) begin
      reg94 <= (-(~^wire93[(2'h3):(1'h1)]));
      reg95 <= (!wire89);
    end
  assign wire96 = $signed($unsigned($unsigned(wire2)));
  module97 #() modinst224 (wire223, clk, reg94, wire1, wire2, wire89);
  assign wire225 = $signed($signed((^~{$signed(wire3),
                       (wire223 ? wire0 : wire92)})));
  assign wire226 = wire93[(2'h3):(1'h1)];
  assign wire227 = (reg94 ?
                       $signed({$unsigned($signed((8'ha8))),
                           ((-wire4) ?
                               (reg94 + wire2) : $signed(wire92))}) : $signed((8'hb8)));
  assign wire228 = wire96;
  always
    @(posedge clk) begin
      reg229 <= (^$signed($unsigned({{(8'hbb)}, $signed(wire223)})));
      reg230 <= wire228;
      reg231 <= (-((wire228[(4'h9):(3'h7)] << {$unsigned((8'ha0)),
              $unsigned(wire226)}) ?
          (&($signed(wire96) != (wire89 <<< (8'haf)))) : reg229));
      if ($signed((^$unsigned($unsigned(wire2)))))
        begin
          reg232 <= $signed($unsigned({{(reg231 ? (8'ha0) : wire226)}}));
          reg233 <= $signed($signed($signed({reg94})));
        end
      else
        begin
          if (((reg94[(4'h8):(3'h7)] & (reg231[(3'h5):(1'h1)] >> $unsigned(reg233))) <= wire92))
            begin
              reg232 <= wire1[(2'h3):(2'h2)];
            end
          else
            begin
              reg232 <= $unsigned(wire5);
              reg233 <= $unsigned((wire228 > ($signed((wire1 * reg232)) ?
                  $unsigned($unsigned(wire92)) : (wire227[(3'h4):(1'h0)] ?
                      (wire0 <<< wire226) : (wire226 ? wire0 : wire5)))));
            end
          reg234 <= wire89;
          reg235 <= reg234[(2'h3):(2'h3)];
          reg236 <= $unsigned($signed($unsigned(((8'ha9) | $signed(reg232)))));
          reg237 <= wire92;
        end
    end
  assign wire238 = $unsigned($signed((~&((~&reg230) ?
                       (reg233 ? reg234 : wire3) : (reg235 << wire89)))));
endmodule

module module97
#(parameter param221 = (8'hbf), 
parameter param222 = (((((+param221) ? {param221, param221} : (param221 ? param221 : param221)) <= ((&param221) ? (param221 <= (8'hb4)) : ((8'hbe) ? param221 : param221))) ? ((~|(param221 ? param221 : (7'h42))) ? param221 : (|((8'ha0) ? param221 : param221))) : (-((^(8'hbd)) ? param221 : (param221 ? (8'ha5) : (7'h41))))) ? param221 : (~((8'hb6) ? ((~&param221) != {param221, (8'ha4)}) : param221))))
(y, clk, wire98, wire99, wire100, wire101);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire98;
  input wire signed [(3'h4):(1'h0)] wire99;
  input wire signed [(5'h12):(1'h0)] wire100;
  input wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire219;
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  assign y = {wire102,
                 wire106,
                 wire121,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire158,
                 wire219,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire102 = wire101;
  always
    @(posedge clk) begin
      reg103 <= $unsigned($signed($signed($signed(wire101))));
      reg104 <= wire100[(4'ha):(4'ha)];
      reg105 <= $unsigned(($signed(reg103[(3'h7):(3'h5)]) ?
          wire98 : (^~(~&reg103))));
    end
  assign wire106 = (+wire99[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed((&(-{(wire98 ? reg103 : wire106),
          (wire98 ? reg103 : reg103)}))))
        begin
          reg107 <= ($unsigned((~|$unsigned((&wire99)))) ?
              wire100[(5'h12):(4'h9)] : $signed((7'h42)));
          reg108 <= (wire101 || {wire106[(2'h2):(2'h2)],
              $unsigned((~|(reg104 >> reg107)))});
          if (reg108)
            begin
              reg109 <= wire99[(2'h3):(1'h0)];
              reg110 <= $unsigned({{(reg105 <<< $unsigned(wire101))},
                  $signed(((~&reg105) == (8'had)))});
              reg111 <= (+{reg107[(4'he):(4'h9)]});
              reg112 <= (reg107 == ($signed((!reg111)) ?
                  $unsigned($signed(((7'h41) ?
                      reg105 : wire102))) : $signed(wire101[(1'h1):(1'h0)])));
            end
          else
            begin
              reg109 <= $signed($unsigned(($signed($signed(reg107)) - reg111[(3'h6):(1'h1)])));
              reg110 <= (~wire98[(2'h2):(2'h2)]);
              reg111 <= reg111;
              reg112 <= (8'hbf);
              reg113 <= $signed(({reg111[(1'h0):(1'h0)],
                  (+(^~reg107))} & wire98));
            end
          reg114 <= (wire106[(1'h0):(1'h0)] ?
              (+$signed(reg113[(3'h7):(2'h3)])) : (((wire106[(3'h4):(3'h4)] ?
                      reg108 : $signed(reg104)) ?
                  (~|{reg110,
                      (8'hab)}) : $signed($unsigned((8'hb6)))) > (($signed(wire106) << $unsigned(wire101)) ?
                  $unsigned((reg111 >= wire102)) : (|reg107[(3'h4):(2'h2)]))));
        end
      else
        begin
          reg107 <= ((+(^wire106[(3'h4):(1'h0)])) || reg107[(1'h0):(1'h0)]);
          reg108 <= (~&$unsigned(wire101[(1'h1):(1'h0)]));
        end
      if ({$signed(wire106[(4'hf):(4'hf)])})
        begin
          reg115 <= $unsigned((^~reg105));
          reg116 <= (~|$signed((~&(reg105 <= wire106))));
          reg117 <= (^reg108[(1'h1):(1'h1)]);
          reg118 <= wire100[(1'h1):(1'h0)];
          reg119 <= (reg111[(4'hb):(4'hb)] ?
              (reg103 ?
                  $signed(((reg113 & reg118) <<< reg113[(2'h3):(1'h1)])) : (~&reg114[(5'h10):(4'hc)])) : (reg117[(1'h1):(1'h0)] < (($signed(wire98) ?
                  (reg108 ?
                      reg110 : reg108) : $signed(reg108)) <<< wire101[(1'h1):(1'h0)])));
        end
      else
        begin
          reg115 <= $signed(reg103);
          if ({$unsigned($unsigned(reg118[(3'h4):(1'h0)])),
              $signed(((~^reg105[(1'h1):(1'h0)]) ?
                  $unsigned(reg115[(2'h2):(2'h2)]) : wire102[(3'h6):(2'h2)]))})
            begin
              reg116 <= $signed(((($signed(reg116) ?
                  reg117[(2'h2):(1'h1)] : (|wire98)) + wire98[(4'h9):(2'h2)]) <= $unsigned(reg109)));
              reg117 <= {(($signed($signed(reg118)) ?
                          $signed(reg115[(4'he):(2'h3)]) : reg105) ?
                      {(reg117 ? {reg108} : $unsigned((8'ha9))),
                          $signed($signed(wire98))} : wire102),
                  ({reg118[(3'h5):(2'h2)], reg112} ?
                      (-(reg108[(1'h0):(1'h0)] << {reg119,
                          reg119})) : reg118[(1'h1):(1'h1)])};
              reg118 <= {$signed(reg115[(3'h5):(1'h1)]),
                  ($unsigned(reg116) ?
                      (^($signed(reg116) & (reg103 + reg115))) : $signed($signed($signed(reg103))))};
            end
          else
            begin
              reg116 <= $signed($unsigned($signed(reg112[(3'h7):(1'h1)])));
              reg117 <= ($unsigned($unsigned({$unsigned(reg115)})) ?
                  $unsigned($signed($unsigned($unsigned(reg114)))) : $signed((((&reg118) ~^ {reg115}) ?
                      reg105[(3'h6):(2'h3)] : ((wire99 >= wire98) ?
                          (reg110 - reg103) : $signed(reg109)))));
            end
          reg119 <= $unsigned($signed($signed((reg117 ^~ $unsigned(reg105)))));
          reg120 <= reg112;
        end
    end
  assign wire121 = reg115[(5'h12):(4'hd)];
  always
    @(posedge clk) begin
      reg122 <= (~&(^~(8'hb1)));
      reg123 <= reg122[(1'h1):(1'h0)];
      reg124 <= (wire106 ?
          ($unsigned(reg104[(3'h6):(2'h3)]) ?
              ($unsigned(reg117) ?
                  ((wire98 ?
                      reg112 : wire99) >>> $signed(reg122)) : reg122) : ((8'hb9) ?
                  ((reg116 ? wire101 : wire106) ?
                      wire98[(3'h5):(3'h5)] : reg118[(4'hb):(3'h7)]) : wire101[(1'h1):(1'h1)])) : $unsigned(reg119));
    end
  assign wire125 = reg112;
  assign wire126 = ((reg120[(4'h8):(2'h2)] ?
                           (+$signed((reg123 ^ reg110))) : ($unsigned(reg111) >> (~|(~reg108)))) ?
                       ($unsigned(((^(8'hb2)) <<< reg108)) && (~|reg120[(3'h6):(2'h2)])) : wire106[(4'h9):(1'h1)]);
  assign wire127 = {$signed(reg124[(1'h1):(1'h1)])};
  assign wire128 = wire100;
  assign wire129 = (~({$signed(wire98[(3'h7):(1'h0)])} < $unsigned({wire128[(4'ha):(1'h0)],
                       $signed(reg115)})));
  assign wire130 = $signed({$signed((wire106 ?
                           wire102[(4'hc):(4'ha)] : (wire129 ?
                               wire100 : (7'h44))))});
  assign wire131 = (7'h44);
  assign wire132 = ($signed($unsigned(reg107)) <= $signed((($unsigned(reg110) ?
                           $unsigned(wire106) : (wire99 <= wire99)) ?
                       ((^(8'hb9)) ?
                           $unsigned(wire128) : reg123[(5'h11):(1'h1)]) : wire127)));
  assign wire133 = wire125[(3'h7):(2'h2)];
  assign wire134 = $unsigned(((~^((reg116 ?
                       reg107 : wire133) * wire131)) || ((~|$signed(wire102)) != $signed({(8'hb9)}))));
  assign wire135 = $signed((reg114 ?
                       ($unsigned((7'h40)) ?
                           (reg123 ? (+(8'hba)) : wire129) : ($signed(reg112) ?
                               $unsigned(wire102) : ((8'hb1) >> wire98))) : wire132[(2'h2):(2'h2)]));
  module136 #() modinst159 (wire158, clk, reg105, wire133, reg109, wire102);
  module160 #() modinst220 (wire219, clk, reg104, wire98, wire125, reg112, wire131);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h369):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 wire56,
                 wire55,
                 wire37,
                 wire22,
                 wire21,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = (wire10 == ($signed((!(-wire8))) ?
                      wire8 : $unsigned(((|wire8) * (wire7 ?
                          wire10 : wire9)))));
  assign wire13 = wire7;
  assign wire14 = (-({(|(~wire11)),
                      ((wire11 > wire12) >>> wire7[(5'h14):(5'h10)])} <<< wire7));
  assign wire15 = (~&wire14[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg16 <= (8'had);
      reg17 <= ($unsigned(wire8[(1'h1):(1'h1)]) ?
          (!wire12[(3'h6):(1'h1)]) : (&$signed(reg16)));
      reg18 <= ((!$signed($unsigned($signed(wire9)))) >= (-$unsigned(((&wire12) == (~&wire10)))));
    end
  always
    @(posedge clk) begin
      reg19 <= $unsigned(({wire13} ? wire7 : wire13[(1'h1):(1'h1)]));
      reg20 <= $signed(wire8[(4'h8):(1'h1)]);
    end
  assign wire21 = (^(reg20 ? $signed(reg17) : {wire12[(1'h1):(1'h0)], wire14}));
  assign wire22 = wire14;
  always
    @(posedge clk) begin
      reg23 <= (reg18 ? $signed((^~(&(&wire22)))) : (~&(wire12 <<< wire21)));
      if ((reg20[(2'h3):(2'h2)] - wire13))
        begin
          reg24 <= ((~^wire14) ?
              (+$unsigned(wire11)) : ((reg23 <= (^~(reg20 ?
                  wire22 : (8'hbc)))) < (($signed(wire13) ?
                  (8'ha0) : (^~wire13)) | $signed((&wire13)))));
          reg25 <= (((((wire10 && wire13) ? (~(8'haf)) : (wire10 + wire12)) ?
              (wire22[(4'he):(3'h6)] ?
                  $signed(reg17) : (~&reg19)) : $unsigned((reg17 ?
                  wire15 : (8'hb0)))) + {$unsigned({wire8}),
              $signed((wire10 ? wire7 : wire11))}) != (|wire13));
        end
      else
        begin
          reg24 <= wire21[(4'hc):(3'h6)];
          reg25 <= (&((~^((-(7'h40)) ^~ wire11)) & $signed($unsigned((wire8 ?
              (8'ha3) : reg24)))));
          reg26 <= wire8[(3'h6):(2'h2)];
        end
      reg27 <= $unsigned(wire11);
      reg28 <= $signed(((8'ha4) ?
          $unsigned($unsigned($unsigned(wire14))) : reg18));
      if ($signed($signed($signed((((8'haf) ? wire8 : reg25) <<< wire15)))))
        begin
          if (reg16)
            begin
              reg29 <= wire11;
              reg30 <= {(-(-reg23[(1'h0):(1'h0)]))};
              reg31 <= {{(wire15[(1'h1):(1'h1)] < $unsigned($signed(wire10))),
                      (~|wire13[(4'hc):(2'h2)])}};
              reg32 <= (~&$signed($unsigned(($signed(reg28) >= (reg28 ?
                  wire10 : wire7)))));
              reg33 <= (($signed($unsigned((-(8'ha5)))) >> $unsigned((~^(reg31 && reg29)))) && wire8);
            end
          else
            begin
              reg29 <= $signed(wire21[(3'h5):(3'h4)]);
            end
          reg34 <= ((((~((8'haf) ? wire15 : reg33)) < ((reg30 ?
                  wire15 : wire12) ?
              wire9[(2'h3):(2'h2)] : {wire22,
                  reg18})) & reg31[(2'h2):(2'h2)]) & (8'h9d));
        end
      else
        begin
          reg29 <= ($unsigned(wire9) ? ({reg26, reg20} != wire21) : reg17);
          if (($unsigned(((reg33 ? $signed(reg32) : $unsigned(wire12)) ?
              reg20 : ((~&wire14) ^ (reg25 + reg27)))) == wire8[(3'h7):(1'h1)]))
            begin
              reg30 <= reg32;
            end
          else
            begin
              reg30 <= $signed({(^reg17), reg19[(2'h2):(2'h2)]});
              reg31 <= ($signed(reg18) ~^ (reg26[(4'h8):(3'h6)] && {wire7,
                  wire21[(1'h1):(1'h0)]}));
              reg32 <= wire21;
              reg33 <= reg26[(4'hf):(3'h4)];
            end
          reg34 <= (!{wire14, reg25});
        end
    end
  always
    @(posedge clk) begin
      reg35 <= $unsigned($signed(reg25[(4'ha):(3'h5)]));
      reg36 <= $signed($signed(((wire14[(4'he):(4'h9)] + (!reg16)) || $unsigned(reg23[(1'h0):(1'h0)]))));
    end
  assign wire37 = reg18[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned(wire10[(1'h0):(1'h0)]) ?
          reg28[(2'h3):(2'h2)] : {(!wire15)}) >> (wire13[(4'hb):(2'h3)] ?
          $unsigned((reg19 << reg25)) : $unsigned((reg28 - reg23))))))
        begin
          reg38 <= $unsigned((~|(!$signed({wire13, reg35}))));
          if (reg20)
            begin
              reg39 <= wire22[(2'h2):(2'h2)];
              reg40 <= $signed({(wire8[(3'h5):(3'h4)] ^~ reg25[(3'h6):(3'h6)]),
                  ({$signed(reg28)} >= reg30)});
              reg41 <= $signed($signed(((reg24 ?
                      (wire15 ? reg17 : wire13) : (reg33 <<< wire13)) ?
                  $signed($unsigned(wire22)) : (8'hb8))));
              reg42 <= (reg26[(4'hc):(4'h8)] & (!wire22[(2'h3):(2'h2)]));
              reg43 <= reg17[(1'h1):(1'h1)];
            end
          else
            begin
              reg39 <= $unsigned($signed($signed((&$signed(reg20)))));
              reg40 <= (^~$signed((wire7 != $unsigned($unsigned(reg19)))));
            end
          reg44 <= wire13;
          reg45 <= ((^(~^{wire13[(4'h8):(2'h3)], reg27})) ?
              reg44[(3'h6):(2'h3)] : $signed((~&((!wire9) ?
                  (wire21 ? wire37 : wire14) : wire10[(2'h2):(1'h1)]))));
          reg46 <= $unsigned(reg39[(1'h1):(1'h0)]);
        end
      else
        begin
          reg38 <= (-($signed(((wire8 ~^ reg45) ?
                  $signed(wire8) : $unsigned(reg26))) ?
              (($unsigned((8'hbc)) ?
                  (^~reg33) : (reg16 == wire14)) && wire11[(1'h1):(1'h1)]) : (8'ha7)));
          if ($unsigned($unsigned($unsigned($signed((wire12 ?
              wire7 : (8'hb1)))))))
            begin
              reg39 <= {(($unsigned((~&wire13)) ?
                      wire9[(1'h1):(1'h1)] : $signed(((8'ha9) ?
                          reg32 : wire13))) && reg19[(2'h2):(2'h2)]),
                  (-{($signed(wire8) <= (reg34 ? reg36 : reg40)),
                      (-(reg35 ? (8'haf) : reg41))})};
              reg40 <= {reg25, wire21};
              reg41 <= (8'haf);
              reg42 <= (~$unsigned(wire12));
              reg43 <= ($unsigned(wire7) << (&$unsigned((~&reg26[(4'hf):(4'hf)]))));
            end
          else
            begin
              reg39 <= (~&reg32);
              reg40 <= $unsigned(($unsigned($signed(wire37)) ?
                  wire15[(3'h6):(2'h3)] : (|{(wire8 ^~ reg34), (&reg36)})));
              reg41 <= (reg34 > ((^((wire12 ? reg33 : reg17) | (!(8'ha4)))) ?
                  reg45 : ((~reg43) ? $unsigned($unsigned(wire12)) : reg30)));
            end
          if ($unsigned($unsigned((+({(8'h9f), reg42} < {reg25})))))
            begin
              reg44 <= reg17;
              reg45 <= (&$signed(reg45));
              reg46 <= (wire10 && (wire22[(4'hb):(1'h1)] > $signed($signed(wire13))));
              reg47 <= (+$signed(reg38[(3'h4):(3'h4)]));
              reg48 <= {((wire14[(3'h5):(3'h5)] >>> wire9[(1'h0):(1'h0)]) <<< $signed($signed((+reg30))))};
            end
          else
            begin
              reg44 <= $signed($signed(((&wire11[(4'hd):(4'hb)]) ?
                  $unsigned((!reg27)) : ((reg31 == (8'ha0)) ?
                      ((8'hb8) ? reg33 : reg46) : $unsigned((8'had))))));
              reg45 <= $unsigned((8'hbd));
              reg46 <= reg19[(2'h2):(2'h2)];
            end
          if ((^~reg39[(1'h0):(1'h0)]))
            begin
              reg49 <= reg32;
              reg50 <= $signed((|reg42));
              reg51 <= ((reg46[(4'hf):(3'h5)] > wire21) ?
                  $unsigned($unsigned($unsigned((reg47 ?
                      reg27 : (8'hae))))) : $unsigned(reg30[(2'h3):(2'h2)]));
              reg52 <= (reg25[(3'h5):(3'h4)] ?
                  ((wire11[(3'h4):(2'h2)] - (reg23[(2'h3):(2'h2)] ?
                      $unsigned(wire37) : (wire11 <<< reg30))) >= reg45) : {{$signed($unsigned(reg24)),
                          (+((8'hbe) ? reg46 : reg18))}});
              reg53 <= $unsigned($unsigned((($signed(reg29) ?
                  $signed(reg42) : reg42) | wire9[(1'h0):(1'h0)])));
            end
          else
            begin
              reg49 <= $unsigned($signed((reg19[(2'h2):(2'h2)] > $signed($signed(reg38)))));
              reg50 <= reg39;
              reg51 <= ($signed($unsigned((reg32 ?
                      (8'had) : $unsigned(reg34)))) ?
                  (+(((^reg35) ?
                      (reg28 ?
                          reg25 : (8'hb2)) : (reg33 > reg50)) - reg45)) : $signed(wire7));
            end
        end
      reg54 <= (-$unsigned(reg27[(5'h10):(5'h10)]));
    end
  assign wire55 = (+wire8);
  assign wire56 = $signed(reg24[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg57 <= ((($signed(reg49[(1'h1):(1'h0)]) ?
                  $unsigned((reg43 ? reg38 : reg43)) : ($signed(reg28) ?
                      (&reg26) : (wire21 + reg35))) ?
              reg47 : reg28[(4'ha):(4'h9)]) ?
          ($unsigned(($unsigned(wire13) ? (^reg34) : {reg51})) ?
              (+reg18[(2'h2):(2'h2)]) : (~$signed(wire15))) : {$unsigned((reg23[(2'h2):(1'h1)] ?
                  reg53[(3'h4):(1'h1)] : $unsigned((8'hbd))))});
    end
  always
    @(posedge clk) begin
      if (wire7[(3'h7):(3'h7)])
        begin
          reg58 <= $unsigned(reg30[(1'h0):(1'h0)]);
          reg59 <= ($unsigned(reg32) ?
              (($unsigned((+reg23)) ?
                  ((reg58 >> reg41) ?
                      $unsigned(wire14) : (-wire55)) : $unsigned((reg51 | wire9))) * $signed({(reg58 ?
                      wire55 : (8'hbf)),
                  (reg39 ? (8'hbd) : wire14)})) : (~(8'hb3)));
          reg60 <= ((~reg26) ?
              ($signed($signed((reg41 ? reg50 : reg32))) ?
                  wire12[(3'h5):(1'h1)] : wire55[(1'h1):(1'h1)]) : (wire15 <<< (($unsigned(reg29) & (reg17 << reg19)) ?
                  $unsigned($signed(wire8)) : {(wire13 <<< reg23)})));
        end
      else
        begin
          reg58 <= (&$signed(reg51[(3'h5):(1'h1)]));
          if ((-$signed({$unsigned(reg39)})))
            begin
              reg59 <= (~^$unsigned((&$signed($signed(reg43)))));
            end
          else
            begin
              reg59 <= ($signed((&reg57)) & $unsigned(wire8));
              reg60 <= wire21[(4'he):(4'h8)];
              reg61 <= ((($signed((&reg38)) - wire55) ?
                      reg47[(4'h8):(1'h1)] : $unsigned($signed((|reg42)))) ?
                  $signed($signed((+reg25[(1'h0):(1'h0)]))) : reg31[(4'hb):(4'h8)]);
              reg62 <= $unsigned({(+{(reg57 <<< reg28)}),
                  ((~|$signed(reg59)) >> $signed(((8'hbb) ?
                      (8'ha0) : reg43)))});
            end
          reg63 <= ((!(wire15[(3'h7):(3'h5)] ?
              reg32 : (~|(wire15 ?
                  reg53 : reg30)))) >>> (-((-$unsigned((8'hb2))) ?
              wire10[(2'h2):(1'h1)] : (~^reg29[(3'h6):(3'h5)]))));
          reg64 <= reg31[(2'h2):(1'h0)];
          reg65 <= ((({$signed(reg42)} ?
                      (~^$unsigned((8'hb3))) : $signed((reg53 & (8'hbb)))) ?
                  $unsigned($signed((reg46 ? wire22 : reg47))) : ({{(8'had),
                              reg39}} ?
                      reg59 : (8'hac))) ?
              reg59 : $signed(reg58[(4'h9):(4'h9)]));
        end
      reg66 <= (8'h9c);
    end
  always
    @(posedge clk) begin
      reg67 <= $unsigned(((|$unsigned({reg35,
          reg40})) ~^ (reg28[(4'hf):(4'hd)] ?
          reg64[(4'he):(3'h6)] : (reg29[(2'h3):(2'h2)] + {wire12}))));
      reg68 <= $signed($unsigned(reg52[(3'h4):(1'h0)]));
      if (((+reg48[(2'h2):(2'h2)]) ?
          (({{reg19, reg50}, reg64} ?
              {$unsigned((8'hb3)), ((8'hb4) && reg39)} : ((reg20 ?
                      reg17 : reg36) ?
                  (reg54 ?
                      wire56 : reg17) : wire9)) <= (($unsigned(wire7) ^ $unsigned(reg17)) ?
              reg60 : {((8'h9d) ? wire7 : reg38),
                  ((8'haf) ?
                      reg65 : reg25)})) : $signed(($signed({(8'hae)}) <= reg67))))
        begin
          reg69 <= (reg30[(2'h3):(2'h2)] || reg48[(1'h0):(1'h0)]);
          reg70 <= reg52;
          reg71 <= $unsigned(($signed($signed((!wire56))) * $signed((~(!reg32)))));
        end
      else
        begin
          reg69 <= ($signed(reg39[(1'h0):(1'h0)]) ?
              $unsigned($unsigned({{wire15}})) : (^reg23[(1'h0):(1'h0)]));
          reg70 <= $signed((-($unsigned(reg68[(1'h1):(1'h0)]) ?
              ($signed((8'h9d)) * {reg60, reg51}) : $unsigned((^~wire7)))));
        end
      reg72 <= (reg19[(1'h0):(1'h0)] - $signed((reg28[(4'hb):(3'h6)] ?
          wire22[(2'h2):(2'h2)] : $signed(wire12))));
      reg73 <= reg50;
    end
  assign wire74 = (8'hb9);
  always
    @(posedge clk) begin
      reg75 <= (-($unsigned((^~reg69[(4'ha):(4'h9)])) + (~|(^(&wire55)))));
      reg76 <= $unsigned(wire13[(1'h0):(1'h0)]);
      if (((-($signed((8'ha2)) ? $unsigned(reg40) : (~|reg64))) ?
          (+$signed(reg66)) : $signed((8'h9c))))
        begin
          reg77 <= (((reg40[(1'h1):(1'h0)] ~^ ((reg27 <<< reg54) > (reg64 ?
              reg36 : (7'h40)))) == {wire9[(1'h1):(1'h0)]}) == $signed(reg69));
          reg78 <= ({(((-reg41) + (8'hb5)) ?
                  $unsigned(reg45) : (reg42[(1'h1):(1'h0)] ?
                      (reg18 > reg70) : reg16[(3'h4):(2'h2)])),
              reg42[(5'h10):(4'he)]} || (wire9[(1'h0):(1'h0)] ?
              (^(reg73[(4'he):(4'he)] ? reg52 : (reg66 != (8'had)))) : ((reg61 ?
                  (~reg53) : $unsigned(reg52)) || ((reg60 ? reg60 : wire10) ?
                  (^~reg19) : (~wire7)))));
          reg79 <= wire56[(2'h3):(2'h2)];
          reg80 <= $signed(((($unsigned((8'hb6)) ?
                      ((8'ha2) ? reg25 : reg38) : reg53) ?
                  $signed({reg54, reg76}) : {(reg44 < reg58),
                      ((7'h40) ? reg48 : reg33)}) ?
              reg57 : (reg63[(4'ha):(3'h6)] ?
                  $signed($signed(wire14)) : reg52[(2'h2):(1'h1)])));
          if ((reg57[(4'ha):(4'h8)] ~^ $unsigned({(~&(reg39 ? reg24 : reg77)),
              reg79[(1'h0):(1'h0)]})))
            begin
              reg81 <= ($unsigned((^~((^~wire12) > {reg23}))) ?
                  ($signed(reg28) > ({$unsigned(reg24),
                      reg18[(2'h3):(1'h1)]} >>> reg25[(1'h1):(1'h0)])) : wire22);
            end
          else
            begin
              reg81 <= ($signed($unsigned((+$signed(reg24)))) ? reg43 : wire74);
              reg82 <= (+$unsigned((|$unsigned(reg20[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg77 <= (reg66 ?
              ({$signed((~^wire13)),
                  $signed((wire56 ?
                      (8'h9f) : reg73))} <<< reg50[(1'h1):(1'h1)]) : $unsigned($unsigned(((~reg36) + (-reg27)))));
        end
      reg83 <= $signed((^($unsigned($signed(reg53)) | ((+reg20) ?
          reg69[(4'h8):(2'h3)] : (&reg53)))));
      reg84 <= {$unsigned($unsigned(((wire74 ? reg43 : (8'h9e)) ?
              reg50[(1'h0):(1'h0)] : (reg80 & reg69))))};
    end
  assign wire85 = (~$unsigned(($unsigned(reg54) ^~ wire14[(5'h11):(3'h7)])));
  assign wire86 = $unsigned($signed($signed(wire56)));
  assign wire87 = (($unsigned($unsigned((+reg38))) == {reg75[(3'h4):(2'h2)]}) ?
                      reg48 : $unsigned(reg78));
  assign wire88 = {$unsigned((^wire8))};
endmodule

module module160
#(parameter param218 = (8'hbe))
(y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire165;
  input wire signed [(5'h15):(1'h0)] wire164;
  input wire [(3'h6):(1'h0)] wire163;
  input wire signed [(2'h3):(1'h0)] wire162;
  input wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire217;
  wire signed [(2'h2):(1'h0)] wire216;
  wire signed [(3'h7):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  wire [(3'h6):(1'h0)] wire172;
  wire signed [(4'h9):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire signed [(4'ha):(1'h0)] wire167;
  wire signed [(4'he):(1'h0)] wire166;
  reg signed [(3'h4):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(3'h7):(1'h0)] reg211 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg206 = (1'h0);
  reg [(3'h5):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'hd):(1'h0)] reg202 = (1'h0);
  reg [(3'h4):(1'h0)] reg201 = (1'h0);
  reg [(2'h3):(1'h0)] reg200 = (1'h0);
  reg [(4'h8):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg196 = (1'h0);
  reg [(2'h2):(1'h0)] reg195 = (1'h0);
  reg [(4'he):(1'h0)] reg194 = (1'h0);
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg [(4'h9):(1'h0)] reg190 = (1'h0);
  reg signed [(4'he):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg181 = (1'h0);
  reg [(4'h8):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire205,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire166 = (($signed($unsigned((~^wire162))) ^~ ($unsigned(wire161) ^ (8'hbb))) ?
                       ((8'hb0) ?
                           $signed($unsigned({wire161})) : $unsigned(wire161[(4'hc):(4'hb)])) : (|wire161));
  assign wire167 = $signed(((~|($signed((8'ha7)) ?
                       $unsigned(wire164) : (wire161 ?
                           wire163 : wire165))) == wire161));
  assign wire168 = wire161;
  assign wire169 = $unsigned((~&wire165));
  assign wire170 = ($signed($signed(wire161[(3'h6):(1'h1)])) ?
                       $unsigned(($signed(wire164) > (wire168[(3'h5):(1'h1)] <= $signed(wire165)))) : (8'hb0));
  assign wire171 = (+$unsigned($unsigned(($unsigned(wire170) <= ((8'hb8) ?
                       wire164 : wire161)))));
  assign wire172 = wire163;
  always
    @(posedge clk) begin
      if (wire170)
        begin
          if ((+wire161))
            begin
              reg173 <= $signed($unsigned(wire163));
            end
          else
            begin
              reg173 <= (((((wire163 ?
                      wire163 : wire162) == $unsigned(wire161)) < (reg173 ?
                      wire165 : {wire172})) & ((((7'h42) ?
                      wire163 : wire165) - (8'hae)) >> reg173[(4'h8):(3'h6)])) ?
                  (|$unsigned(($signed(wire166) && ((8'h9f) + (7'h42))))) : $signed(wire165));
              reg174 <= ($unsigned($unsigned(((reg173 << wire169) + (wire167 ?
                      wire169 : wire169)))) ?
                  wire164 : $signed(reg173[(4'h9):(1'h0)]));
              reg175 <= (wire169 ?
                  (wire171[(1'h1):(1'h0)] & (($unsigned(wire166) ?
                      {wire169,
                          wire171} : $unsigned(wire172)) | (!$signed(wire164)))) : {wire166,
                      wire162});
            end
          reg176 <= (({wire162[(1'h0):(1'h0)]} ?
                  $signed(wire164[(2'h2):(2'h2)]) : (wire171 ?
                      ({wire168, (8'hb4)} ?
                          (wire168 > wire171) : (~wire168)) : wire162[(2'h2):(2'h2)])) ?
              ($signed(wire166) ?
                  {{((8'h9d) ^~ wire165),
                          ((8'ha5) << wire161)}} : ((wire162[(2'h2):(1'h1)] ?
                      $unsigned((8'hb5)) : (~^reg174)) <= $signed($unsigned(wire172)))) : ((~wire161[(2'h2):(1'h0)]) ?
                  {(wire171[(2'h3):(2'h3)] >>> (wire161 ?
                          wire169 : (7'h44)))} : $signed(wire165[(3'h4):(1'h1)])));
          if ($signed(($unsigned($signed((wire165 && wire166))) < (^~{(wire166 ?
                  reg173 : wire161)}))))
            begin
              reg177 <= $signed((^((^$unsigned((8'hbd))) ?
                  wire170[(3'h4):(3'h4)] : $signed($unsigned(wire166)))));
              reg178 <= (!wire161);
            end
          else
            begin
              reg177 <= {wire164[(4'hf):(3'h6)], {wire165[(2'h3):(1'h0)]}};
              reg178 <= $unsigned(reg176[(4'he):(3'h6)]);
            end
        end
      else
        begin
          reg173 <= $unsigned(($signed($signed(reg176[(3'h5):(2'h2)])) ?
              $unsigned($unsigned(reg173[(5'h12):(2'h2)])) : (^wire162)));
          if ($signed(($signed((&{(8'ha9)})) ?
              $signed($signed({(8'ha4)})) : $unsigned($signed(reg173)))))
            begin
              reg174 <= {($signed(((wire163 ?
                          (7'h44) : reg178) | wire166[(4'hd):(2'h3)])) ?
                      $signed($signed($signed(reg175))) : wire169)};
              reg175 <= $signed((($unsigned($signed(wire167)) ^~ reg174) ?
                  reg173[(4'he):(2'h2)] : $signed(wire168)));
            end
          else
            begin
              reg174 <= $signed({{{(reg174 <= wire171)}},
                  $signed($unsigned((wire165 ? wire163 : (7'h44))))});
              reg175 <= (($signed(wire165[(3'h6):(3'h4)]) ^~ wire167[(3'h7):(3'h4)]) ?
                  (|reg174[(3'h4):(1'h1)]) : (((wire166[(4'ha):(2'h2)] ?
                      wire170[(1'h0):(1'h0)] : {wire172}) ^~ ($signed(reg174) >>> {reg177})) >> $unsigned($signed((~^wire165)))));
            end
          if ($signed(wire164[(4'hd):(3'h7)]))
            begin
              reg176 <= $signed(wire167[(1'h0):(1'h0)]);
              reg177 <= ((wire164[(4'hc):(4'ha)] <<< wire167[(1'h0):(1'h0)]) ?
                  (+(&wire165)) : ($signed($signed(wire161)) >= wire167[(1'h1):(1'h1)]));
              reg178 <= $signed(reg174[(4'ha):(3'h6)]);
              reg179 <= $unsigned(wire165);
            end
          else
            begin
              reg176 <= (|$signed((!wire168[(4'h8):(3'h4)])));
            end
          reg180 <= (~(~&$signed((reg175 ? (8'ha0) : $signed((8'ha3))))));
        end
      reg181 <= wire167[(3'h6):(2'h3)];
      reg182 <= wire167;
    end
  assign wire183 = ($signed({$signed((8'hb0))}) ^~ wire171);
  assign wire184 = reg180[(3'h7):(1'h1)];
  assign wire185 = reg176[(2'h3):(2'h2)];
  assign wire186 = (8'ha8);
  assign wire187 = $signed($unsigned(wire166));
  always
    @(posedge clk) begin
      if ({reg176[(2'h3):(1'h1)]})
        begin
          reg188 <= $signed($signed((!(8'ha5))));
          reg189 <= (~|(|{(wire187[(2'h3):(1'h1)] | wire185),
              (^wire183[(1'h0):(1'h0)])}));
        end
      else
        begin
          reg188 <= wire172;
        end
    end
  always
    @(posedge clk) begin
      reg190 <= $signed($unsigned((wire186[(4'hb):(1'h1)] ?
          ((reg175 ?
              reg180 : wire168) >> {wire161}) : $signed((wire170 - wire164)))));
      reg191 <= reg179[(4'h9):(3'h7)];
      if ((wire167[(4'h9):(3'h4)] >>> $signed(($unsigned((~^wire167)) << ($signed(reg174) >> reg177)))))
        begin
          if ($unsigned($signed(((^$signed(wire185)) || $unsigned((wire163 > wire165))))))
            begin
              reg192 <= ($unsigned({reg175[(4'hf):(3'h5)]}) * (~^($unsigned((reg181 ?
                  reg189 : reg190)) < $signed((!wire185)))));
              reg193 <= $unsigned(($unsigned(wire167[(3'h7):(3'h7)]) ?
                  (reg174 ?
                      (wire184[(1'h1):(1'h0)] == $signed(wire169)) : ((~wire170) ?
                          wire163 : wire184[(2'h3):(1'h1)])) : ($signed($signed(wire164)) && ((wire172 ?
                      wire166 : wire186) & wire164[(3'h5):(1'h0)]))));
              reg194 <= ((!wire161[(4'ha):(3'h4)]) >> {wire184[(1'h1):(1'h0)],
                  reg189[(4'he):(4'h9)]});
            end
          else
            begin
              reg192 <= (~$signed({(!$signed(wire161))}));
              reg193 <= $unsigned((-wire186[(3'h4):(3'h4)]));
              reg194 <= $unsigned((~&(reg190 ?
                  ((reg191 ? wire183 : reg176) ?
                      wire164[(5'h15):(1'h1)] : wire164) : {$signed(wire168)})));
              reg195 <= (reg177 && wire168);
              reg196 <= wire170;
            end
          reg197 <= $signed($unsigned($unsigned($unsigned({reg176, wire164}))));
          reg198 <= ({($unsigned({reg180}) == (^~{reg188, reg192})),
              (~(8'hb5))} | reg181);
          if ((wire183 == {$unsigned(reg197[(3'h5):(1'h0)])}))
            begin
              reg199 <= reg194;
              reg200 <= $signed($unsigned(reg176));
              reg201 <= reg189[(4'hd):(3'h5)];
              reg202 <= $unsigned(wire169[(2'h3):(1'h1)]);
              reg203 <= wire162[(1'h0):(1'h0)];
            end
          else
            begin
              reg199 <= ($signed($signed({wire186})) ?
                  ((~&(~|((8'hb6) >> reg175))) ?
                      reg203 : reg201) : {$signed(wire171[(1'h0):(1'h0)]),
                      (7'h40)});
              reg200 <= $unsigned((&((~&reg191[(2'h3):(1'h0)]) == (reg175 >> (wire184 ?
                  wire170 : wire169)))));
              reg201 <= $signed(wire171[(2'h3):(2'h3)]);
            end
          reg204 <= ($signed((reg198 << reg192)) >= wire168[(3'h5):(2'h2)]);
        end
      else
        begin
          reg192 <= (8'ha1);
          reg193 <= (-(~^{(8'hb4)}));
          if ($signed({reg178}))
            begin
              reg194 <= {$signed((reg175 ?
                      wire184[(1'h1):(1'h1)] : $unsigned($signed(wire166))))};
            end
          else
            begin
              reg194 <= (reg201[(1'h0):(1'h0)] ^ {reg202[(3'h6):(1'h1)],
                  ($signed($signed(wire161)) ?
                      reg198 : (wire186 == $unsigned((8'hb1))))});
            end
        end
    end
  assign wire205 = ($signed(((((8'hbb) ? wire163 : reg196) >>> (8'hab)) ?
                       (reg203[(4'he):(4'h8)] == $unsigned(wire172)) : reg178)) != $signed({{$unsigned(reg180),
                           $signed(reg201)},
                       (-(reg198 ? reg192 : reg173))}));
  always
    @(posedge clk) begin
      reg206 <= reg203[(4'h8):(3'h7)];
      if (wire185[(2'h3):(2'h2)])
        begin
          reg207 <= reg206;
          reg208 <= wire169;
          reg209 <= (~^$unsigned((wire205[(3'h7):(1'h0)] ?
              ((~|reg191) >= reg195[(1'h1):(1'h0)]) : reg195[(2'h2):(2'h2)])));
          reg210 <= wire168[(4'h9):(3'h7)];
        end
      else
        begin
          reg207 <= $signed(reg204);
          if ((($signed((|$signed(reg174))) ?
              $signed(wire169) : $unsigned((reg176[(4'he):(3'h6)] ?
                  $unsigned(reg209) : wire167))) - $unsigned((($signed(reg208) == (-wire162)) ?
              (8'hb0) : $unsigned((^~reg181))))))
            begin
              reg208 <= $signed((($unsigned((reg188 + reg204)) ?
                  reg174 : wire187) <= (!wire169[(1'h1):(1'h0)])));
              reg209 <= reg193[(4'he):(2'h2)];
              reg210 <= $unsigned((reg202[(4'hb):(4'h8)] ?
                  (($signed(reg178) << $unsigned(wire184)) ?
                      $unsigned($signed(wire170)) : (&wire161)) : (8'ha0)));
            end
          else
            begin
              reg208 <= wire186;
              reg209 <= wire184[(1'h1):(1'h0)];
              reg210 <= {(~^reg174),
                  $unsigned((~&((wire183 ? wire183 : wire161) ?
                      reg203[(2'h2):(1'h0)] : (reg177 ^ reg192))))};
              reg211 <= wire169;
              reg212 <= (^$unsigned({$unsigned($signed(reg190))}));
            end
          reg213 <= $unsigned($unsigned(($signed(wire187) ?
              ($unsigned(wire170) ?
                  ((8'ha1) << wire167) : reg211[(1'h1):(1'h1)]) : $unsigned(wire168))));
          reg214 <= ((reg173[(4'he):(4'h9)] ^~ (8'hba)) <= {$signed({(~^reg192),
                  (~&reg188)})});
        end
      reg215 <= wire205;
    end
  assign wire216 = reg214;
  assign wire217 = (wire167[(4'h9):(4'h9)] ?
                       wire172 : $unsigned(reg214[(2'h3):(2'h3)]));
endmodule

module module136
#(parameter param156 = (&((!(|((8'haf) >> (8'ha2)))) ^~ {(8'ha3), ((!(8'ha5)) - ((8'hb7) + (8'hb8)))})), 
parameter param157 = ((^param156) ? (param156 ? (~^{(-param156), {(8'h9c), param156}}) : ((((8'h9d) ? param156 : param156) ? (&param156) : (^~param156)) ? (param156 ? {(8'hac), param156} : param156) : (~&(param156 <<< param156)))) : param156))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire140;
  input wire signed [(5'h15):(1'h0)] wire139;
  input wire signed [(3'h7):(1'h0)] wire138;
  input wire signed [(2'h2):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(2'h3):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire141,
                 reg143,
                 (1'h0)};
  assign wire141 = wire139[(5'h13):(4'hc)];
  assign wire142 = (wire141 >= $unsigned(wire137));
  always
    @(posedge clk) begin
      reg143 <= ($signed($signed({wire137[(2'h2):(2'h2)]})) ?
          wire142 : $unsigned($signed((wire139 == $unsigned(wire140)))));
    end
  assign wire144 = {wire137[(1'h1):(1'h0)]};
  assign wire145 = (~(wire138[(3'h7):(1'h1)] ?
                       (($unsigned(reg143) ?
                           $signed(wire137) : (8'hae)) >= ((8'h9c) > (reg143 ?
                           (8'ha3) : wire141))) : $signed((^~(wire140 << wire142)))));
  assign wire146 = wire139[(5'h12):(4'hb)];
  assign wire147 = (8'had);
  assign wire148 = ($unsigned($signed((^~(~|(8'hac))))) ?
                       $signed(wire141[(3'h7):(1'h0)]) : (+($unsigned(wire140) ?
                           {wire142,
                               {wire137,
                                   (8'hb4)}} : $unsigned((wire147 >> wire139)))));
  assign wire149 = {$unsigned((((wire142 ^ wire144) ?
                           (~^wire141) : (^wire140)) < wire146[(4'hb):(3'h7)]))};
  assign wire150 = $unsigned((($unsigned((!(8'ha5))) ?
                       $unsigned(wire142) : $unsigned(wire146)) || wire144));
  assign wire151 = (~^(((+(^wire148)) & reg143[(1'h0):(1'h0)]) ?
                       (wire142[(3'h5):(2'h3)] >> wire137[(1'h1):(1'h1)]) : {(wire139[(1'h1):(1'h0)] <<< $unsigned(wire146))}));
  assign wire152 = $signed(wire142);
  assign wire153 = (^~{(($unsigned((8'ha4)) ?
                           (wire152 ?
                               wire150 : wire147) : wire149[(3'h5):(3'h4)]) <<< {$signed(wire145),
                           wire151})});
  assign wire154 = wire137[(2'h2):(2'h2)];
  assign wire155 = ((((((8'hae) ? wire139 : wire142) ? wire146 : (!wire154)) ?
                           {(^wire138)} : wire144) ?
                       $unsigned($unsigned($unsigned(wire154))) : ($signed(wire153) ?
                           wire148 : wire154[(1'h0):(1'h0)])) != wire138);
endmodule
