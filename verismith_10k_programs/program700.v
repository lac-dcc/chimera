module top
#(parameter param215 = ({{{((7'h40) ? (8'hb6) : (8'ha7))}, (+(8'hae))}} ? (+(8'h9f)) : (((-{(8'h9e)}) ? (&{(8'hae)}) : {{(8'hb8)}, ((8'hb0) ? (8'hbd) : (8'hb8))}) ? (+((~|(8'haa)) >= ((8'hbe) | (7'h41)))) : (+{((8'haa) ? (8'h9d) : (7'h44))}))), 
parameter param216 = ((((8'hbc) ? ((+param215) ~^ (param215 ? param215 : param215)) : {(param215 ? param215 : param215)}) ? (param215 ? {(param215 * param215), (param215 >= param215)} : param215) : ((|(-param215)) ? ((~&param215) ? (~(8'hb6)) : (param215 ? param215 : param215)) : (|(-param215)))) && ((((|param215) ^ {param215, param215}) ? (~^(^~(8'hbb))) : param215) ? ((+(param215 >= param215)) ? ((param215 && param215) < param215) : (8'hb7)) : (8'ha0))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire213;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire211;
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire213,
                 wire105,
                 wire211,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire2[(3'h4):(2'h3)])
        begin
          reg4 <= $unsigned(wire2[(1'h1):(1'h0)]);
          reg5 <= (((wire1 ? (8'hb3) : {wire0[(1'h0):(1'h0)]}) >> ((~{reg4}) ?
              (^~reg4) : ($unsigned(wire0) == wire1[(4'h8):(1'h0)]))) || (8'hac));
          reg6 <= ((($unsigned(wire1[(4'hf):(4'hc)]) ?
              ($signed(wire2) * $unsigned(wire1)) : ((reg5 ? wire2 : wire0) ?
                  (wire3 ~^ reg4) : (reg5 ?
                      wire1 : wire2))) >= {wire1[(4'hf):(4'hf)]}) * $unsigned(((reg4[(1'h1):(1'h0)] ?
                  ((8'ha8) | wire0) : (wire1 ? wire3 : wire2)) ?
              ($unsigned((8'haa)) >= (!reg5)) : ((reg4 ^ (8'hbd)) ?
                  ((8'hbe) ? reg5 : wire1) : $unsigned(wire2)))));
          reg7 <= ((reg5[(4'h8):(3'h6)] ?
                  $unsigned($unsigned(((8'hb1) ^~ wire3))) : $signed(wire3)) ?
              $unsigned(wire0) : (8'hbb));
          reg8 <= (&reg7[(1'h0):(1'h0)]);
        end
      else
        begin
          reg4 <= $signed((reg7 && $unsigned($signed(((7'h40) ?
              wire0 : wire2)))));
          if ($unsigned((($unsigned(wire2) * $signed((-wire2))) << $unsigned(wire3))))
            begin
              reg5 <= reg7;
              reg6 <= $unsigned(wire3[(4'ha):(4'ha)]);
              reg7 <= (reg8 != reg8);
              reg8 <= ((wire3 - (~&wire0[(1'h1):(1'h1)])) ?
                  wire2 : ((~&$unsigned(reg4)) ?
                      (reg4 ? $unsigned(wire1) : (+(~&wire2))) : (7'h44)));
              reg9 <= $unsigned($unsigned(wire2[(1'h0):(1'h0)]));
            end
          else
            begin
              reg5 <= $signed({$unsigned((&{reg5, reg9}))});
              reg6 <= (~^reg8);
              reg7 <= {($unsigned(wire2[(3'h5):(2'h2)]) ? wire3 : reg7),
                  $signed({(-$unsigned(reg6))})};
              reg8 <= (8'h9e);
              reg9 <= $unsigned({$unsigned(({(8'hab),
                      reg5} <<< wire1[(2'h2):(1'h0)])),
                  {wire0, {wire3}}});
            end
          if (reg7)
            begin
              reg10 <= $signed($signed((-((reg7 ? wire1 : wire1) ?
                  $unsigned(wire2) : (reg8 ~^ wire1)))));
              reg11 <= wire3;
            end
          else
            begin
              reg10 <= (((reg5[(3'h4):(2'h2)] ~^ ($unsigned(reg6) != {reg7,
                      (8'hbe)})) <= reg8[(1'h1):(1'h1)]) ?
                  wire2 : ($signed(reg11[(4'hf):(2'h3)]) ?
                      wire2 : (reg5[(2'h2):(1'h0)] || (~^reg7))));
              reg11 <= $signed(wire1[(3'h7):(2'h3)]);
            end
          reg12 <= ($signed($unsigned(((8'haf) ?
                  $signed(reg11) : $signed(reg6)))) ?
              $signed((8'hbd)) : reg5);
          reg13 <= {($unsigned({(reg5 ? wire3 : reg8)}) ?
                  (|((wire1 <<< reg8) <= reg12)) : (~^(8'ha4))),
              reg9};
        end
      reg14 <= $signed($unsigned((~$unsigned(wire3))));
      reg15 <= reg13;
    end
  module16 #() modinst106 (wire105, clk, reg5, reg9, reg12, reg4, reg13);
  module107 #() modinst212 (.wire109(reg8), .clk(clk), .wire110(reg10), .y(wire211), .wire108(reg4), .wire111(wire0));
  module189 #() modinst214 (wire213, clk, wire0, wire1, reg14, reg11);
endmodule

module module107
#(parameter param210 = {({{(-(8'hb5))}, (8'h9f)} && {((~^(7'h42)) >>> (^(8'had)))}), {(&((8'ha3) ? (~^(8'hb5)) : (^(8'ha7)))), {((+(8'hae)) ? ((8'hb7) > (7'h44)) : (^(8'ha6))), (((8'haf) * (7'h43)) ? ((8'hb9) ? (8'hb4) : (8'hb4)) : (8'hba))}}})
(y, clk, wire108, wire109, wire110, wire111);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire108;
  input wire [(5'h12):(1'h0)] wire109;
  input wire [(4'hc):(1'h0)] wire110;
  input wire [(5'h11):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire186;
  wire signed [(4'h8):(1'h0)] wire173;
  wire [(4'hd):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire171;
  wire signed [(2'h2):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire207;
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  assign y = {wire209,
                 wire186,
                 wire173,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire136,
                 wire171,
                 wire188,
                 wire207,
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
                 (1'h0)};
  assign wire112 = $unsigned(wire109);
  assign wire113 = $signed(wire112);
  assign wire114 = $signed((|wire111[(4'hb):(4'ha)]));
  assign wire115 = $unsigned($signed(((-wire108) ?
                       ((wire112 ? wire114 : wire111) << (wire114 ?
                           wire110 : wire111)) : (((8'hb5) ?
                               wire108 : wire108) ?
                           (wire112 > wire113) : (wire113 ?
                               wire111 : wire110)))));
  assign wire116 = wire109[(4'he):(1'h0)];
  assign wire117 = $signed(((!(((8'hbe) ? wire109 : wire113) - (~&wire112))) ?
                       ({wire112, wire112} ?
                           wire110 : (~&{wire110, wire111})) : (wire110 ?
                           $unsigned((^wire111)) : {$unsigned(wire111)})));
  assign wire118 = (((-wire112[(2'h3):(1'h1)]) ?
                           $unsigned($signed((wire111 ?
                               wire112 : wire111))) : $unsigned($unsigned((wire115 ?
                               wire116 : wire112)))) ?
                       ($signed(((-wire113) ?
                           wire112 : wire110[(4'hb):(3'h6)])) > wire116) : {wire113});
  always
    @(posedge clk) begin
      reg119 <= $unsigned(({(^~(wire117 ?
              wire116 : wire114))} || {(~|$signed((8'ha4))),
          ({wire111} ? (wire110 <<< wire113) : $unsigned(wire117))}));
      if ((~^wire111))
        begin
          if ((!((((&(8'haa)) ?
              (-(8'hbb)) : (wire115 ?
                  (8'hba) : wire108)) | $signed($signed(wire116))) ^~ wire110[(4'h8):(4'h8)])))
            begin
              reg120 <= (wire108 ? wire111 : $signed((wire117 ~^ wire112)));
            end
          else
            begin
              reg120 <= (((-{(8'ha1), wire112}) ?
                  wire114 : ((((8'hb9) ? wire116 : wire112) ?
                      {wire108,
                          (8'hbc)} : (^wire108)) - reg119)) <= {$signed({((8'hb9) ?
                          wire112 : wire112)})});
              reg121 <= (^~{reg120[(2'h3):(1'h0)]});
              reg122 <= $unsigned({(-($unsigned((8'hb2)) ?
                      wire112[(4'h8):(1'h0)] : wire114)),
                  (^(~|(~^wire116)))});
              reg123 <= $signed($unsigned((8'hb9)));
              reg124 <= wire114;
            end
          reg125 <= (wire112 ?
              (wire112[(4'hc):(1'h0)] ?
                  $unsigned(((8'ha2) ?
                      $signed(wire112) : wire113)) : $unsigned(((wire112 - reg122) ?
                      (wire117 > (8'hbd)) : $signed(wire113)))) : $signed(wire117[(4'h9):(4'h8)]));
        end
      else
        begin
          reg120 <= reg123;
          reg121 <= reg123[(4'hb):(1'h0)];
          reg122 <= wire108[(4'ha):(3'h5)];
          reg123 <= reg124[(4'h8):(3'h6)];
          reg124 <= (reg123[(2'h2):(1'h1)] ?
              $signed(reg120) : $unsigned($signed(wire110)));
        end
      reg126 <= $signed((~{reg120[(4'ha):(4'h8)],
          ({wire116, wire109} ?
              (reg120 ? (8'hbc) : wire114) : (wire117 ? wire111 : (8'ha7)))}));
      reg127 <= wire108[(1'h0):(1'h0)];
      if ({((|(-$signed(reg123))) ?
              (($signed(reg127) ? $unsigned(wire118) : {wire111, (8'hbd)}) ?
                  $unsigned((wire117 + reg122)) : (-(reg123 ^~ reg121))) : reg119[(5'h14):(4'hc)]),
          $signed((($signed(wire108) || (wire115 ? wire110 : wire108)) ?
              $signed((reg126 << reg123)) : $unsigned(reg125[(3'h5):(1'h0)])))})
        begin
          reg128 <= (!reg124[(1'h0):(1'h0)]);
          if (wire108)
            begin
              reg129 <= (reg121 > reg121[(1'h0):(1'h0)]);
              reg130 <= wire115[(4'hf):(4'h9)];
              reg131 <= (8'hac);
              reg132 <= (-(~{wire117[(2'h2):(1'h0)], $signed(wire115)}));
              reg133 <= ((8'ha1) << $signed(reg122[(4'h9):(3'h4)]));
            end
          else
            begin
              reg129 <= ({(wire111 ?
                      (+$unsigned(reg122)) : reg124[(3'h6):(2'h2)]),
                  {wire117, (^~$unsigned(wire111))}} ~^ reg122[(3'h7):(2'h2)]);
              reg130 <= wire110;
              reg131 <= $signed(($unsigned((~(wire111 ?
                  reg130 : wire109))) && reg133));
              reg132 <= $signed((({reg121, {(7'h44), reg122}} ?
                      ((reg123 <<< wire118) ?
                          reg127[(1'h1):(1'h1)] : $unsigned(wire110)) : (^(!wire114))) ?
                  wire108 : (+$signed($signed(reg126)))));
            end
          if ((+$unsigned(wire111[(4'ha):(3'h5)])))
            begin
              reg134 <= ((+(wire112 != ($unsigned(wire117) <<< (8'ha4)))) ?
                  wire108[(1'h0):(1'h0)] : $signed(reg127[(4'hb):(3'h4)]));
              reg135 <= $signed($unsigned((~reg129)));
            end
          else
            begin
              reg134 <= $unsigned(wire111);
            end
        end
      else
        begin
          if (($unsigned(($signed($unsigned(reg134)) ? wire114 : reg134)) ?
              wire117[(2'h2):(1'h0)] : reg128))
            begin
              reg128 <= $signed({(reg128 ?
                      ((wire111 ?
                          reg134 : wire110) ^ (reg125 <<< wire108)) : reg134),
                  ($signed((wire115 ?
                      reg125 : reg119)) > $unsigned((wire113 >= reg132)))});
            end
          else
            begin
              reg128 <= (!wire113[(5'h10):(4'hf)]);
              reg129 <= (&({reg124[(1'h0):(1'h0)],
                      $unsigned($signed((8'hbd)))} ?
                  ($signed((~(8'ha9))) ?
                      $unsigned((wire118 ?
                          wire117 : reg124)) : ($signed(reg124) & (8'ha1))) : (reg127 ?
                      $unsigned($unsigned((8'hb0))) : reg119)));
              reg130 <= $signed(wire109);
            end
        end
    end
  assign wire136 = $unsigned((7'h43));
  module137 #() modinst172 (.clk(clk), .wire141(reg133), .wire140(wire108), .wire139(reg122), .wire138(reg127), .y(wire171));
  assign wire173 = ($unsigned(((^(!reg126)) ?
                       (wire110 | $unsigned(reg128)) : $unsigned((~|wire108)))) ^~ $unsigned(wire136[(3'h7):(2'h3)]));
  module174 #() modinst187 (wire186, clk, reg123, reg128, reg126, reg124, wire117);
  assign wire188 = reg130;
  module189 #() modinst208 (.wire192(wire111), .y(wire207), .wire190(reg135), .wire193(reg119), .clk(clk), .wire191(reg129));
  assign wire209 = {reg135};
endmodule

module module16
#(parameter param104 = (^(8'h9c)))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire22;
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  assign y = {wire103,
                 wire62,
                 wire61,
                 wire59,
                 wire22,
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
                 reg88,
                 reg87,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire22 = (~|wire21[(1'h0):(1'h0)]);
  module23 #() modinst60 (.y(wire59), .wire26(wire22), .clk(clk), .wire27(wire17), .wire24(wire20), .wire25(wire19));
  assign wire61 = wire19[(5'h11):(4'he)];
  assign wire62 = $unsigned($unsigned($unsigned($signed({wire20, (8'hbc)}))));
  always
    @(posedge clk) begin
      if (($signed($signed(($signed(wire22) - $unsigned(wire62)))) ?
          wire20 : ((^~((-wire61) ?
              wire19[(3'h4):(1'h1)] : ((8'had) > wire19))) ^~ wire59[(3'h5):(1'h0)])))
        begin
          reg63 <= {wire20};
        end
      else
        begin
          reg63 <= (8'h9d);
          reg64 <= $unsigned($unsigned(wire22[(4'he):(1'h1)]));
          reg65 <= ((8'had) ?
              $signed((($unsigned((8'ha5)) <= {wire61}) <<< ((wire18 >> reg64) || (~&wire62)))) : wire19[(4'ha):(4'h9)]);
          reg66 <= $unsigned({$unsigned($unsigned($signed(wire62)))});
          reg67 <= wire61[(2'h3):(1'h1)];
        end
      if (($unsigned(reg65[(3'h5):(1'h0)]) ?
          (-(((^~wire19) ^ (wire18 ? (8'hae) : wire62)) ?
              $signed((wire59 <= reg65)) : (+(reg65 ?
                  reg63 : (8'had))))) : ({$signed($unsigned(reg65)),
              wire20[(3'h6):(1'h1)]} & wire61)))
        begin
          reg68 <= reg66[(3'h6):(3'h5)];
        end
      else
        begin
          reg68 <= ((~^((wire17[(4'hd):(4'hc)] + (8'hbd)) ?
              (^(~^reg64)) : (~|wire22))) ^~ {((&{wire18}) ?
                  $signed((&reg63)) : $signed({wire20, wire20})),
              $unsigned(wire17[(4'ha):(2'h2)])});
          reg69 <= (|$unsigned((^~$signed($signed((8'ha8))))));
          if (wire61)
            begin
              reg70 <= $unsigned(($signed($signed((-wire21))) ?
                  (~reg65[(3'h5):(3'h5)]) : reg68[(2'h2):(1'h1)]));
              reg71 <= ((^{(!{wire19, (8'ha6)})}) - ((~&$signed((reg68 ?
                  wire19 : (8'h9c)))) & $unsigned(reg65)));
            end
          else
            begin
              reg70 <= reg64[(4'h8):(3'h6)];
            end
          reg72 <= (8'ha1);
          if ({(+reg67), (8'hb2)})
            begin
              reg73 <= (wire21[(3'h7):(3'h4)] ?
                  ($signed({(!wire61),
                      ((7'h44) ?
                          (8'ha3) : wire17)}) < wire17[(5'h10):(3'h6)]) : reg71);
              reg74 <= {wire22[(3'h5):(1'h0)],
                  {{(|$unsigned(reg65)), wire21}, wire59[(3'h7):(1'h0)]}};
              reg75 <= (reg72[(3'h4):(2'h2)] ?
                  (reg69 ?
                      (reg72[(3'h4):(1'h1)] ?
                          ($signed(reg71) > reg63) : $signed({reg74})) : (wire17 ?
                          wire21[(3'h7):(2'h2)] : (&$signed(reg74)))) : reg70[(1'h0):(1'h0)]);
              reg76 <= ((^~(~(-$unsigned(reg68)))) ?
                  reg69 : (($signed($signed(reg65)) - (reg75 ?
                          (+reg74) : $signed((8'hbc)))) ?
                      $signed(wire21[(1'h0):(1'h0)]) : ((~&(reg73 ?
                              reg64 : reg66)) ?
                          (8'ha1) : ((wire62 >> reg70) ?
                              (reg67 ? reg69 : reg64) : reg68))));
            end
          else
            begin
              reg73 <= ({(reg71[(2'h3):(1'h1)] != (^~wire61)),
                  (8'h9e)} >> reg70);
              reg74 <= reg71;
            end
        end
      if ((&((^~wire61) ?
          wire18[(4'hb):(2'h2)] : $unsigned($unsigned(wire20)))))
        begin
          if (((({reg66[(3'h7):(3'h5)]} ^ $unsigned(((8'ha2) < reg76))) >= (~reg64[(2'h2):(2'h2)])) << reg69))
            begin
              reg77 <= ({$unsigned((+$signed(wire17)))} <<< (~&$unsigned((|(reg72 ?
                  reg75 : reg65)))));
              reg78 <= $unsigned(($signed(reg68) ?
                  (!(8'h9d)) : wire61[(1'h0):(1'h0)]));
              reg79 <= $signed($unsigned(wire62));
              reg80 <= (~^$signed(reg67[(5'h11):(3'h6)]));
              reg81 <= (((reg72[(1'h0):(1'h0)] ?
                      $unsigned((reg73 == reg77)) : reg66[(3'h7):(3'h4)]) ?
                  {(7'h44)} : ((~^$signed((8'h9d))) ?
                      (reg70[(2'h2):(1'h1)] ?
                          reg76[(4'hb):(3'h4)] : (reg73 >>> reg65)) : reg77)) >= reg75);
            end
          else
            begin
              reg77 <= ($signed($signed($signed((~^reg70)))) <= $signed($unsigned({reg66,
                  $unsigned(reg73)})));
              reg78 <= reg64;
            end
          if (reg78)
            begin
              reg82 <= $signed({{$signed(reg64)},
                  {($signed(wire22) + $signed(reg74)),
                      (reg81 && $signed(wire19))}});
              reg83 <= $unsigned(reg77[(1'h1):(1'h0)]);
              reg84 <= wire62[(2'h2):(2'h2)];
            end
          else
            begin
              reg82 <= (((wire61[(2'h3):(1'h1)] == ((reg83 ?
                  wire19 : wire17) <= $unsigned(wire61))) < (reg70[(1'h1):(1'h1)] >= ($signed(wire18) && $unsigned(reg84)))) + {(+wire61[(2'h2):(2'h2)])});
              reg83 <= $unsigned({(+(~&$signed(wire18))),
                  {($signed(reg63) != (-wire21))}});
              reg84 <= $unsigned($unsigned(wire22[(4'hc):(4'ha)]));
            end
          reg85 <= $unsigned($unsigned((reg81 ?
              ($signed(reg63) ? reg68 : (reg75 << reg67)) : (8'hac))));
          reg86 <= wire19[(4'h9):(4'h9)];
          reg87 <= wire18[(3'h5):(2'h2)];
        end
      else
        begin
          reg77 <= wire18[(3'h5):(1'h1)];
          reg78 <= (!($signed($unsigned((reg72 ^ reg76))) ?
              {reg68[(2'h2):(2'h2)],
                  $signed((reg80 && reg68))} : (reg71[(1'h0):(1'h0)] ?
                  ($signed(reg68) ?
                      (8'hb7) : reg70[(3'h7):(3'h7)]) : ((^reg74) ^~ (reg68 >= wire18)))));
          reg79 <= (wire19[(4'h9):(3'h4)] > ($unsigned($signed(reg63[(2'h2):(2'h2)])) >>> (8'ha3)));
        end
      if (((+$unsigned($unsigned($unsigned(reg69)))) >> ((~&((^reg73) ?
          (wire59 ? reg65 : wire59) : (reg76 ^ (8'hb4)))) <<< (|reg83))))
        begin
          reg88 <= wire21;
          if ($signed($signed($unsigned($unsigned((&reg80))))))
            begin
              reg89 <= $signed($signed(reg84));
              reg90 <= wire19;
              reg91 <= (((-(~(wire59 + wire22))) << {{$signed(reg83),
                          ((7'h44) ? reg70 : reg63)}}) ?
                  $signed($signed(reg85[(4'ha):(3'h5)])) : reg88);
            end
          else
            begin
              reg89 <= $unsigned(wire17);
              reg90 <= wire19[(4'he):(1'h0)];
              reg91 <= $unsigned($unsigned(($unsigned(reg68) * (^~(^~reg73)))));
              reg92 <= reg70;
            end
        end
      else
        begin
          reg88 <= ($unsigned((wire19[(5'h12):(1'h0)] ?
                  $unsigned((reg63 & reg69)) : reg66[(1'h0):(1'h0)])) ?
              ($signed(reg91[(3'h6):(1'h0)]) | {reg91[(4'hb):(3'h5)],
                  $unsigned(reg87)}) : $unsigned((reg67[(1'h1):(1'h1)] ?
                  reg71 : reg64[(4'h9):(2'h3)])));
          reg89 <= $signed(reg88[(3'h6):(2'h3)]);
          reg90 <= (reg69[(1'h1):(1'h0)] ?
              {$unsigned($unsigned((reg76 ?
                      (8'h9e) : reg64)))} : reg92[(1'h1):(1'h1)]);
          reg91 <= (((~&$signed(reg83)) ?
                  (({(8'ha3), reg73} ?
                      (~|reg83) : $signed(reg68)) - wire59[(3'h6):(3'h5)]) : (&(reg86[(4'h8):(1'h1)] ?
                      (reg63 ? reg72 : reg72) : (+reg74)))) ?
              reg75[(1'h1):(1'h0)] : wire18[(3'h6):(2'h2)]);
          reg92 <= (reg83 <<< (-{(((8'ha1) < reg79) <<< reg90), reg73}));
        end
      reg93 <= (~^((reg67 << (~$unsigned(reg70))) ^~ (wire19[(4'hf):(4'hc)] | (^(reg71 != reg73)))));
    end
  always
    @(posedge clk) begin
      reg94 <= (((reg87 ^ {(7'h41)}) ?
              reg70 : $unsigned(((8'hb7) ?
                  (reg87 ? wire61 : (8'hbf)) : $unsigned(reg82)))) ?
          (((reg65 == $unsigned(wire18)) ?
                  reg71[(3'h4):(2'h3)] : ((reg78 << wire21) ?
                      (reg90 <= reg66) : (^~reg66))) ?
              (wire20[(4'hc):(2'h3)] ? (!{reg78}) : wire62) : ($signed(reg66) ?
                  (~|reg89) : $unsigned((reg65 ?
                      reg69 : wire22)))) : $signed((8'ha7)));
      if ((~(8'hb8)))
        begin
          if (((((reg93 <<< $unsigned(reg82)) ?
                      (~&$signed((8'hb1))) : $unsigned((reg87 ^ reg88))) ?
                  ($unsigned((reg75 ? reg73 : reg77)) ?
                      (~wire18) : $unsigned((&reg83))) : reg66[(3'h7):(1'h1)]) ?
              {$unsigned({$unsigned(reg86),
                      $unsigned(reg83)})} : reg73[(3'h5):(2'h2)]))
            begin
              reg95 <= reg91;
              reg96 <= reg90;
              reg97 <= ($signed((8'hbf)) ?
                  $signed((reg66[(3'h5):(1'h1)] + {$unsigned(reg96),
                      reg63[(2'h3):(2'h2)]})) : {{$unsigned((reg78 == reg85))},
                      wire20});
              reg98 <= $signed((8'hb4));
            end
          else
            begin
              reg95 <= (8'hae);
              reg96 <= $unsigned(reg96);
              reg97 <= $unsigned($unsigned(reg73));
              reg98 <= (8'ha8);
              reg99 <= ((reg68[(1'h0):(1'h0)] >= reg75[(3'h5):(2'h3)]) ^ $signed((($signed(reg85) ?
                      reg98[(4'ha):(4'ha)] : $unsigned(reg95)) ?
                  reg88 : reg68)));
            end
        end
      else
        begin
          reg95 <= reg72[(3'h4):(1'h0)];
          reg96 <= $signed((reg95 ?
              {$unsigned(reg80[(4'h8):(1'h0)]), reg74} : {reg90}));
        end
      reg100 <= $unsigned({$signed(((reg67 != wire18) ?
              $signed(wire62) : reg96))});
      reg101 <= reg73[(3'h4):(2'h3)];
      reg102 <= ($signed(reg95[(4'h9):(2'h3)]) ?
          $signed((&reg92)) : (^reg88[(3'h4):(3'h4)]));
    end
  assign wire103 = $unsigned((wire19[(1'h0):(1'h0)] ?
                       (^~((reg74 ? (8'hbe) : reg97) ?
                           (|wire18) : (reg91 ?
                               reg90 : reg91))) : ((reg97 && (|(8'ha2))) ?
                           $signed((reg91 + reg97)) : ($unsigned(reg102) | (reg77 ^ (8'had))))));
endmodule

module module23
#(parameter param58 = (8'ha9))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(3'h6):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire28;
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  assign y = {wire57,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire28,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = ($signed((!wire25)) != (($unsigned(wire24) ?
                          wire27 : wire27[(4'hf):(4'he)]) ?
                      {wire26} : (wire27 ? $signed((-wire25)) : wire24)));
  always
    @(posedge clk) begin
      reg29 <= $unsigned(wire24[(1'h0):(1'h0)]);
      reg30 <= (~|wire24[(3'h4):(2'h3)]);
      reg31 <= (wire26 > (($unsigned($unsigned(reg29)) ?
          wire28 : {$unsigned(wire24)}) << (((+(8'h9f)) >= (wire26 < wire25)) ?
          ({wire24} ?
              (wire26 < reg29) : (wire27 ? (8'haa) : wire24)) : wire25)));
      reg32 <= $signed(reg31);
      reg33 <= $unsigned((($unsigned((reg30 ? (7'h43) : reg32)) ?
          (wire24[(3'h6):(3'h5)] * $unsigned(reg31)) : wire26) != (reg29[(4'h9):(2'h3)] * {reg30[(2'h3):(2'h2)]})));
    end
  assign wire34 = $unsigned(reg31);
  assign wire35 = $signed($unsigned($unsigned(wire34)));
  assign wire36 = $signed(reg29);
  assign wire37 = ($unsigned(reg29) != $unsigned($unsigned((wire35 ?
                      (^~wire24) : wire27[(3'h6):(3'h6)]))));
  assign wire38 = (-wire25[(4'ha):(3'h4)]);
  assign wire39 = wire36;
  assign wire40 = wire36;
  assign wire41 = {(|{wire25[(3'h4):(3'h4)],
                          ((reg31 ^~ wire28) ?
                              (reg32 ? wire38 : wire25) : (reg29 ?
                                  wire37 : reg30))}),
                      $unsigned(wire34[(1'h0):(1'h0)])};
  assign wire42 = reg29[(1'h0):(1'h0)];
  assign wire43 = (wire26 >= wire24);
  always
    @(posedge clk) begin
      if (wire41)
        begin
          reg44 <= $unsigned(($signed(((~&wire40) <= $unsigned(wire38))) ?
              (~(+(~&wire42))) : wire35));
        end
      else
        begin
          reg44 <= (~^reg33[(4'ha):(3'h6)]);
          if (($signed($unsigned(reg32[(3'h5):(3'h4)])) ?
              {(reg31[(3'h5):(3'h5)] ?
                      reg32[(3'h7):(2'h3)] : ((~wire28) ?
                          wire25[(4'hb):(4'h8)] : wire26)),
                  wire38[(1'h1):(1'h0)]} : (wire39[(2'h2):(2'h2)] ?
                  $unsigned({wire39, (!wire26)}) : wire38[(1'h0):(1'h0)])))
            begin
              reg45 <= $unsigned($signed(reg29));
              reg46 <= (wire41[(1'h0):(1'h0)] ?
                  $signed($unsigned($unsigned((~&wire39)))) : $signed((reg30[(3'h7):(2'h3)] | (~^reg29))));
            end
          else
            begin
              reg45 <= $signed((-(!(wire25 == wire42))));
            end
          reg47 <= (reg30 ~^ (wire24[(1'h1):(1'h1)] ?
              (~(wire28[(4'hd):(2'h3)] | {(8'haf),
                  wire43})) : wire34[(1'h0):(1'h0)]));
        end
      if (wire27[(5'h11):(1'h1)])
        begin
          if ($unsigned((reg30 * $unsigned(wire34[(1'h1):(1'h0)]))))
            begin
              reg48 <= $signed(reg30[(5'h10):(1'h0)]);
              reg49 <= wire38;
              reg50 <= $unsigned((wire40 ?
                  {$signed((wire25 >>> reg49))} : ({$signed(reg48)} < {(reg33 <<< wire28)})));
              reg51 <= {($signed(($unsigned(reg49) && reg33)) <= wire34[(1'h0):(1'h0)]),
                  {(-$unsigned(reg31)),
                      (reg32[(4'hc):(4'ha)] << $unsigned({reg33}))}};
              reg52 <= {reg30,
                  ($unsigned($unsigned($unsigned(reg33))) < reg32[(2'h2):(2'h2)])};
            end
          else
            begin
              reg48 <= $signed(wire37);
              reg49 <= $signed(($unsigned(($signed(wire36) >> $unsigned(wire36))) ?
                  $unsigned($signed((wire38 ? reg29 : reg49))) : (+wire42)));
              reg50 <= $unsigned(((8'h9e) > (((&(8'haa)) && {(8'ha6), wire41}) ?
                  (wire39 - $unsigned(wire35)) : wire38[(3'h4):(2'h3)])));
              reg51 <= ((($signed($unsigned(wire28)) >>> $signed(((7'h42) * wire39))) < wire35) ?
                  ($signed(wire43[(3'h7):(1'h0)]) << ($signed($signed(reg46)) ?
                      $unsigned(((8'hb8) ?
                          (8'hbb) : (8'ha7))) : ($signed(wire37) + $unsigned(reg44)))) : (wire41[(2'h3):(2'h3)] != (&(8'hb5))));
            end
          reg53 <= (((+$signed(wire34[(1'h0):(1'h0)])) >> $unsigned(reg32[(1'h1):(1'h0)])) ?
              $unsigned(((~^(wire35 < reg30)) ?
                  (^{reg44}) : ((wire36 >> (8'haf)) >>> $unsigned(reg47)))) : $signed($signed($unsigned((^reg45)))));
        end
      else
        begin
          reg48 <= $unsigned((!(8'ha9)));
        end
      reg54 <= reg30[(4'he):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg55 <= (&$signed($unsigned(reg47[(3'h6):(3'h4)])));
      reg56 <= ({{(&$unsigned(reg32))}} <<< {$signed((wire39[(1'h1):(1'h1)] + wire39[(2'h2):(1'h1)]))});
    end
  assign wire57 = {$unsigned(({$signed((8'hae)), (^wire28)} | ((wire36 ?
                              reg53 : wire38) ?
                          {wire42, wire28} : wire35))),
                      (^$unsigned(($unsigned(wire41) ?
                          {reg30, reg31} : wire43)))};
endmodule

module module189
#(parameter param205 = (((8'ha6) ? {(^(~^(8'ha9)))} : (~(((8'h9f) ^~ (8'hbf)) ? (|(7'h42)) : (~(8'hb6))))) ? {({{(8'h9c)}} >>> (((7'h43) ? (7'h44) : (8'ha3)) * ((8'h9f) ? (8'hb9) : (8'ha8))))} : (+((~&((8'hab) * (7'h41))) ~^ {(8'h9c), ((8'hbe) - (8'ha7))}))), 
parameter param206 = (+((&((+(8'hb5)) ? ((8'hac) ^~ param205) : (~|param205))) ? (&(param205 ? {param205} : (&param205))) : (~(!(param205 | param205))))))
(y, clk, wire193, wire192, wire191, wire190);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire193;
  input wire signed [(4'h9):(1'h0)] wire192;
  input wire [(5'h11):(1'h0)] wire191;
  input wire signed [(4'h8):(1'h0)] wire190;
  wire [(4'h8):(1'h0)] wire204;
  wire signed [(5'h13):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire194;
  reg signed [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg200 = (1'h0);
  reg [(5'h11):(1'h0)] reg199 = (1'h0);
  reg [(4'h9):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  assign y = {wire204,
                 wire203,
                 wire195,
                 wire194,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 (1'h0)};
  assign wire194 = {$unsigned((^~$signed({wire192})))};
  assign wire195 = wire190[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if ({$unsigned(($unsigned((!wire190)) == {wire191,
              (wire193 >= wire192)}))})
        begin
          reg196 <= ((^~wire191) ^ (!$signed($signed((wire192 ?
              (8'ha7) : wire191)))));
          reg197 <= (~(($signed((8'hbe)) ?
              wire190 : wire195) != $unsigned((~&{wire192, wire190}))));
          reg198 <= $unsigned(wire194);
          reg199 <= (wire193 ?
              $signed((((~^wire194) > wire195[(3'h6):(1'h0)]) != reg197[(5'h10):(3'h7)])) : ($unsigned(((wire191 ?
                  (8'hb8) : wire191) && ((8'hb4) ?
                  (7'h44) : wire194))) ~^ reg196));
        end
      else
        begin
          reg196 <= (^~($signed($signed((reg199 > wire193))) ?
              reg197[(3'h7):(3'h7)] : $unsigned(wire194[(1'h1):(1'h1)])));
          reg197 <= reg196;
          reg198 <= wire195;
        end
      reg200 <= wire190;
    end
  always
    @(posedge clk) begin
      reg201 <= $unsigned((reg200 ? $signed((~&$signed(wire191))) : wire190));
      reg202 <= (-(({reg200} ?
          $unsigned({wire194}) : $unsigned($unsigned((8'hae)))) ^ {reg201,
          $signed((reg201 ^ reg198))}));
    end
  assign wire203 = {(reg197 ^~ (((reg196 ?
                               reg196 : (7'h43)) > wire191[(3'h5):(1'h1)]) ?
                           $signed({wire195, reg199}) : ($signed(reg197) ?
                               reg200[(2'h2):(2'h2)] : reg201[(3'h4):(1'h0)]))),
                       $signed((8'hbd))};
  assign wire204 = {$signed((reg197 || (+reg196))),
                       ((~{$unsigned(wire190),
                           {reg201,
                               reg197}}) * $signed(reg200[(1'h0):(1'h0)]))};
endmodule

module module174  (y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire179;
  input wire signed [(2'h2):(1'h0)] wire178;
  input wire signed [(5'h11):(1'h0)] wire177;
  input wire [(5'h12):(1'h0)] wire176;
  input wire signed [(5'h13):(1'h0)] wire175;
  wire [(4'hd):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(4'h8):(1'h0)] wire182;
  wire [(5'h10):(1'h0)] wire181;
  wire signed [(5'h14):(1'h0)] wire180;
  assign y = {wire185, wire184, wire183, wire182, wire181, wire180, (1'h0)};
  assign wire180 = $unsigned({wire175[(5'h11):(5'h10)]});
  assign wire181 = (wire179[(1'h1):(1'h1)] ?
                       ((7'h41) < (+$unsigned($unsigned(wire178)))) : ({($signed(wire180) ?
                               $signed(wire178) : (~^(8'had))),
                           wire176[(3'h7):(2'h2)]} ~^ ($signed($unsigned(wire176)) ?
                           $signed((^wire175)) : (~^((8'hbb) ?
                               wire180 : wire176)))));
  assign wire182 = wire176;
  assign wire183 = $unsigned((($signed((wire182 * wire178)) <<< wire181) < (!($unsigned(wire177) & (wire182 ?
                       wire182 : (8'hb2))))));
  assign wire184 = ($unsigned(wire183[(2'h3):(2'h2)]) >>> {wire181[(3'h7):(3'h5)]});
  assign wire185 = wire178;
endmodule

module module137
#(parameter param170 = (((~^(|((8'hbc) != (8'hbb)))) == {(~^{(7'h44), (8'hbb)}), ((&(8'hbf)) ? (^(8'hb4)) : {(8'hbf)})}) - ((^(8'ha0)) + (({(7'h43), (8'hbc)} ? (+(8'hb8)) : (7'h44)) ? ((~^(8'haa)) <= ((8'hb5) ? (8'hac) : (8'h9c))) : ((~&(7'h43)) <<< ((8'ha0) ? (7'h42) : (8'hb7)))))))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire141;
  input wire signed [(4'h9):(1'h0)] wire140;
  input wire signed [(2'h3):(1'h0)] wire139;
  input wire signed [(5'h10):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  assign y = {wire169,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire142 = ((~^$unsigned(((wire139 - (8'hb4)) ^ wire139[(1'h0):(1'h0)]))) <<< wire140[(3'h7):(3'h6)]);
  assign wire143 = (wire140[(2'h2):(2'h2)] > (wire138[(3'h5):(1'h1)] < ($unsigned((wire138 ?
                       wire140 : wire140)) ~^ $unsigned((wire140 ?
                       (8'hbc) : wire139)))));
  assign wire144 = $unsigned(wire139[(2'h3):(2'h2)]);
  assign wire145 = {({(-(wire143 & wire143))} ?
                           wire138[(2'h2):(1'h0)] : {{wire139[(2'h3):(2'h2)],
                                   $unsigned(wire142)},
                               $unsigned((wire144 ? wire139 : wire139))}),
                       $signed((wire139 ?
                           $signed((wire139 * wire142)) : $unsigned((~&wire139))))};
  assign wire146 = $signed(((&wire138[(3'h5):(2'h2)]) + ({wire144,
                       $signed(wire145)} ^~ $signed((!wire140)))));
  assign wire147 = {(~&wire146)};
  assign wire148 = wire146;
  assign wire149 = $unsigned(wire144);
  assign wire150 = ((~|wire146) << $signed(($signed((~|wire148)) ?
                       {wire149[(3'h6):(3'h6)]} : ((+wire142) <<< $unsigned((8'ha9))))));
  assign wire151 = wire149;
  assign wire152 = (($signed((wire150 != (~wire143))) ?
                           (+$signed({wire149})) : wire138) ?
                       (~^(8'ha6)) : ((wire145 ?
                           ((wire146 ^ wire140) >> wire139) : {$unsigned(wire144),
                               (wire145 ?
                                   wire145 : wire139)}) != ((8'ha1) < ($signed(wire138) ?
                           wire138 : (wire145 << (8'ha9))))));
  always
    @(posedge clk) begin
      if (($unsigned(((wire142[(3'h6):(3'h6)] ?
              $signed(wire139) : wire152[(3'h5):(2'h2)]) ?
          (wire143[(3'h4):(2'h2)] > $signed(wire147)) : $signed((wire152 ?
              wire152 : wire149)))) >>> $signed((wire152[(4'hb):(4'ha)] ?
          $signed($unsigned(wire152)) : $signed((^wire138))))))
        begin
          reg153 <= $unsigned($unsigned($unsigned((8'hbc))));
        end
      else
        begin
          if ($signed(($signed($signed($unsigned(wire151))) <<< (8'hb6))))
            begin
              reg153 <= (~(8'hb5));
              reg154 <= (({(~^(+wire138))} ?
                  ($signed($unsigned(wire151)) ~^ $unsigned($signed((8'hb4)))) : wire141) > $signed(($unsigned((wire139 || wire150)) || $unsigned((~^wire147)))));
              reg155 <= reg154[(1'h0):(1'h0)];
              reg156 <= ({$unsigned(wire150[(3'h4):(3'h4)])} ~^ wire149);
            end
          else
            begin
              reg153 <= $signed((((~^{reg156, (8'hbd)}) ^ $signed((reg153 ?
                      wire147 : (8'ha3)))) ?
                  $signed(reg154) : (^~wire141)));
              reg154 <= (((((wire139 ?
                  wire149 : wire146) >> $signed(wire152)) - (+{wire147})) ^~ {($signed(wire145) || (reg154 ^ reg154))}) >> (wire151 ?
                  $signed(wire144[(5'h11):(4'hd)]) : ((wire150[(4'ha):(4'ha)] ?
                      $signed((8'hbd)) : wire140) <<< wire147[(2'h3):(1'h0)])));
              reg155 <= $signed($unsigned(wire145[(4'hb):(4'h9)]));
              reg156 <= $signed((~($unsigned((^~(7'h42))) >= wire152)));
            end
        end
      reg157 <= wire144;
      reg158 <= ({(|{wire140[(3'h5):(1'h0)], (8'ha9)}),
              ((8'h9d) && (&(wire150 ? wire151 : wire146)))} ?
          (8'h9f) : $unsigned((reg157 ? reg153 : reg156[(3'h5):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg159 <= (($unsigned((|(wire150 | reg153))) ?
              reg155 : {($signed(wire144) ? wire143 : $signed(wire142))}) ?
          (reg156 * $unsigned(wire142)) : wire145);
      reg160 <= (8'ha0);
      if (wire140[(2'h3):(2'h3)])
        begin
          reg161 <= reg157;
          if ((~&wire150[(2'h2):(2'h2)]))
            begin
              reg162 <= wire144[(4'hd):(4'hd)];
              reg163 <= (reg158[(4'h8):(3'h6)] ?
                  ((~|reg160) ?
                      wire143[(1'h0):(1'h0)] : (~|$signed((reg159 ?
                          wire152 : reg155)))) : reg160);
              reg164 <= (8'ha8);
              reg165 <= (+$signed($signed((!$signed(reg153)))));
            end
          else
            begin
              reg162 <= ({(reg158[(4'h8):(1'h1)] ?
                          {(reg154 ? reg155 : wire152),
                              reg162} : $signed($signed(reg162))),
                      wire149[(2'h3):(2'h3)]} ?
                  reg158 : {((wire149 ?
                              {reg163} : (wire139 ? reg162 : wire143)) ?
                          wire141 : {$unsigned(reg165), (reg161 << reg155)}),
                      (-$unsigned($unsigned(wire145)))});
              reg163 <= {reg153[(2'h3):(1'h1)],
                  $signed($unsigned($unsigned((+(8'haa)))))};
              reg164 <= wire145;
              reg165 <= ((reg156 <= wire144) | $unsigned($unsigned(((wire152 ?
                      wire140 : wire138) ?
                  (wire151 <<< (8'hab)) : ((8'hba) ? (8'hba) : wire144)))));
              reg166 <= $unsigned(((((^wire139) ?
                      wire143 : (&(8'ha6))) < $signed($signed(reg160))) ?
                  ((|reg162[(3'h5):(2'h2)]) - ((reg159 << reg161) >>> (wire143 ?
                      reg153 : wire148))) : reg162));
            end
        end
      else
        begin
          reg161 <= ((~&reg158[(3'h6):(2'h3)]) < (wire143 << reg159));
          if ($unsigned($signed((^{(~&(8'ha8)), reg164}))))
            begin
              reg162 <= (~reg166[(3'h4):(3'h4)]);
              reg163 <= ((+($signed(reg162[(3'h7):(2'h2)]) ?
                  $signed(wire149[(3'h4):(3'h4)]) : (&$unsigned(reg163)))) < reg158);
              reg164 <= ($unsigned($unsigned(({wire149,
                      reg163} >>> $signed(reg160)))) ?
                  $unsigned(wire141) : {$unsigned((wire143 ?
                          $signed(wire141) : reg158[(2'h3):(2'h2)]))});
              reg165 <= wire147[(1'h1):(1'h1)];
              reg166 <= ($unsigned({reg165[(1'h0):(1'h0)]}) ?
                  $unsigned((8'ha6)) : {{$unsigned($unsigned(wire152))},
                      wire138[(4'hd):(2'h2)]});
            end
          else
            begin
              reg162 <= (~^(wire140[(4'h8):(3'h7)] && wire146[(3'h6):(3'h5)]));
              reg163 <= (-((wire148 ?
                  (~$signed(wire152)) : {(-(8'ha0))}) < reg159));
              reg164 <= (wire151[(1'h0):(1'h0)] ~^ $signed($signed((~|reg164))));
            end
        end
      reg167 <= reg156[(3'h4):(1'h1)];
      reg168 <= (reg166[(1'h1):(1'h1)] ~^ (^wire146));
    end
  assign wire169 = {wire148[(3'h7):(2'h2)]};
endmodule
