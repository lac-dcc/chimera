module top
#(parameter param166 = ((({((8'h9d) * (8'hb1)), ((7'h41) & (8'ha0))} || (((8'haf) ? (8'hb8) : (8'ha5)) ? (!(8'ha8)) : ((8'hbb) + (8'ha3)))) & ((!((8'ha2) | (8'ha6))) ? (|(^~(8'hae))) : (((8'ha6) ? (8'ha8) : (8'hb5)) <= (~^(7'h41))))) ? (((((8'ha5) && (8'hb7)) ? ((7'h41) >>> (8'hbd)) : (8'hb5)) ? (((8'hb0) ? (8'hbb) : (7'h44)) <= (~^(8'hb4))) : ((8'ha8) ? ((7'h40) <= (8'haa)) : ((8'hbe) ? (8'ha2) : (8'hac)))) ~^ ((((8'h9f) ? (8'ha7) : (8'ha0)) ? ((8'h9f) ? (7'h40) : (8'hb3)) : (^~(8'haa))) & ((&(8'hb8)) != ((7'h44) ? (8'ha4) : (8'hac))))) : (~&(^(&{(8'ha4)})))), 
parameter param167 = (((&{(!param166)}) ? (8'hb0) : (param166 ? {(~^(8'hbc))} : (-(+param166)))) ? (^~(param166 ? (((8'ha7) >= param166) - (param166 << param166)) : {param166, (param166 ? param166 : param166)})) : (8'ha9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire160;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire160,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $signed(wire0[(4'hf):(4'hf)]);
  module6 #() modinst161 (.y(wire160), .wire8(wire0), .wire9(wire4), .clk(clk), .wire7(wire2), .wire10(wire1));
  assign wire162 = (8'hbc);
  assign wire163 = wire160;
  assign wire164 = wire5[(1'h0):(1'h0)];
  assign wire165 = (({(-(~wire0)), $signed($unsigned(wire4))} < wire164) ?
                       wire163[(3'h4):(1'h1)] : ($signed((wire162[(1'h1):(1'h0)] > {wire5,
                               wire2})) ?
                           wire160[(4'h8):(2'h3)] : $signed($signed((8'hb7)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire85;
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire16,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire37,
                 wire85,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg15,
                 (1'h0)};
  assign wire11 = wire9[(3'h4):(1'h1)];
  assign wire12 = {({wire7[(3'h5):(3'h4)], wire9} + (~&((~^(8'ha9)) ?
                          $signed(wire11) : (~^wire8)))),
                      $signed((~&$signed(((8'ha5) ? wire10 : wire8))))};
  assign wire13 = $unsigned(wire9[(3'h4):(1'h1)]);
  assign wire14 = ({wire8[(1'h0):(1'h0)], wire12[(1'h1):(1'h1)]} ?
                      wire11[(4'hf):(4'hc)] : {($unsigned($unsigned(wire11)) ?
                              $unsigned((-wire13)) : wire11)});
  always
    @(posedge clk) begin
      reg15 <= {$signed(wire11[(5'h11):(3'h6)]),
          $unsigned((($unsigned((8'hbd)) ?
              wire9[(2'h3):(2'h3)] : (wire8 ? wire11 : wire7)) ~^ (~(wire12 ?
              wire12 : wire13))))};
    end
  assign wire16 = wire12[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= wire8;
      reg18 <= $unsigned(wire14);
      reg19 <= reg15[(4'h8):(1'h1)];
      reg20 <= wire9[(1'h0):(1'h0)];
    end
  assign wire21 = ({wire14[(2'h2):(1'h1)],
                      {wire14,
                          ((wire9 ?
                              reg18 : wire11) && (reg19 > wire9))}} != $unsigned($unsigned(reg15[(1'h1):(1'h1)])));
  assign wire22 = (((~(|wire14[(3'h4):(2'h3)])) << $unsigned({(^~reg18)})) ?
                      ((($signed(reg17) ?
                          (reg19 ?
                              wire13 : wire21) : (~^wire14)) + {$unsigned(reg17)}) - wire8[(3'h4):(2'h3)]) : wire21);
  assign wire23 = wire21[(1'h1):(1'h0)];
  assign wire24 = $unsigned((wire10 ?
                      $unsigned(wire10[(3'h4):(1'h1)]) : $unsigned(((wire11 || wire13) == (reg18 ?
                          wire13 : wire9)))));
  always
    @(posedge clk) begin
      if ({wire23, (|$signed(($unsigned(wire11) ? (wire9 * wire10) : wire22)))})
        begin
          reg25 <= (^~((($unsigned(reg17) ? (8'hab) : $unsigned(wire23)) ?
              (reg20[(2'h2):(1'h1)] ? (-wire13) : (-(8'hba))) : {(~&reg17),
                  (&wire11)}) - ((reg15[(1'h1):(1'h0)] ?
              $signed(wire24) : (reg15 ?
                  wire14 : wire22)) ~^ $unsigned(wire7[(2'h3):(2'h2)]))));
          if (reg19)
            begin
              reg26 <= ($signed({$signed(wire16)}) ?
                  wire14 : ({$unsigned((reg25 - wire13)),
                      (((8'ha6) >> wire22) ?
                          (wire23 ?
                              reg20 : wire22) : wire9[(3'h6):(3'h5)])} && (+reg20)));
              reg27 <= (+(!$unsigned({$unsigned((8'ha1)), $signed(wire12)})));
              reg28 <= $unsigned(wire16[(4'hb):(3'h6)]);
            end
          else
            begin
              reg26 <= ((-$unsigned(reg26[(4'hb):(4'ha)])) ?
                  (!$signed(reg25)) : (+(reg28[(2'h3):(2'h3)] ^ ((wire21 ?
                      wire16 : wire14) && reg19[(3'h6):(2'h3)]))));
              reg27 <= ($unsigned(((wire8 <<< (reg28 ? reg15 : (8'hbc))) ?
                      $unsigned($unsigned((8'haa))) : (8'h9d))) ?
                  $signed(reg19[(2'h3):(2'h3)]) : (wire9[(1'h0):(1'h0)] >= $unsigned(reg26)));
              reg28 <= ($signed((wire22 << ((wire9 ?
                      (8'ha2) : wire22) >> (wire7 ? (7'h43) : wire12)))) ?
                  wire16[(5'h15):(5'h12)] : (reg26[(4'h9):(4'h9)] <<< $signed($unsigned(wire9))));
            end
          reg29 <= (&($unsigned(((-wire13) ?
                  $unsigned(wire9) : $unsigned(reg26))) ?
              $signed(((wire16 | reg19) ?
                  wire24[(2'h2):(1'h0)] : (|(7'h42)))) : ($unsigned((wire13 ?
                      wire23 : reg26)) ?
                  (&(wire12 << reg28)) : ({reg18} ~^ wire8[(1'h0):(1'h0)]))));
          if ($signed({reg29,
              $unsigned(($unsigned(reg17) & wire11[(4'h9):(3'h7)]))}))
            begin
              reg30 <= {(reg28[(4'hb):(1'h0)] ?
                      $unsigned($signed(reg18)) : ($signed(wire21[(3'h7):(3'h4)]) <= wire12)),
                  $unsigned(($unsigned($unsigned((8'ha9))) ?
                      $signed((^~(8'haa))) : reg27[(5'h11):(2'h2)]))};
              reg31 <= reg17[(1'h0):(1'h0)];
              reg32 <= $signed($signed({$unsigned((&wire10))}));
            end
          else
            begin
              reg30 <= (~wire11[(4'hc):(3'h4)]);
              reg31 <= wire23;
            end
          reg33 <= $signed((($unsigned((reg18 << wire13)) ^ (-(wire16 != reg20))) ?
              (-$signed((reg29 >>> (8'hb9)))) : wire11));
        end
      else
        begin
          reg25 <= ($unsigned($signed(($unsigned(wire21) ?
              (wire22 >>> wire12) : (~|wire7)))) >>> ($signed((8'ha6)) != $signed(wire23)));
          reg26 <= $unsigned(((reg32 >= reg18) ?
              (~|(~|(+wire7))) : $unsigned($unsigned((^~reg33)))));
          reg27 <= {wire7, $signed($unsigned($unsigned(reg31)))};
        end
      reg34 <= wire10;
      reg35 <= ((wire9[(2'h3):(1'h0)] ?
              ($unsigned(reg33[(2'h3):(1'h0)]) ?
                  reg26 : $unsigned((wire14 >>> reg27))) : (reg30[(2'h2):(2'h2)] >>> ((wire22 ?
                  wire14 : reg27) >>> (reg34 - reg33)))) ?
          (^~wire9) : wire21);
      reg36 <= (wire16 < $signed((!reg34)));
    end
  assign wire37 = (~reg20);
  module38 #() modinst86 (wire85, clk, wire22, reg15, wire21, wire10);
  module87 #() modinst154 (wire153, clk, reg20, reg17, reg15, reg19, reg36);
  assign wire155 = reg20[(2'h2):(1'h1)];
  assign wire156 = wire22;
  assign wire157 = $unsigned(($signed((wire9[(1'h1):(1'h0)] ?
                       {reg33, wire21} : wire156[(1'h1):(1'h1)])) && wire22));
  assign wire158 = ((~|reg29[(1'h1):(1'h0)]) ?
                       (~^$signed((((8'hbd) ? reg35 : (8'hab)) ?
                           wire9 : $signed((8'ha1))))) : ((|({reg20, wire7} ?
                           ((8'ha0) <<< wire13) : (wire153 ?
                               reg19 : (8'had)))) | wire14));
  assign wire159 = $unsigned($unsigned(reg18));
endmodule

module module87
#(parameter param152 = ((((((8'ha9) ? (8'hbc) : (8'hb6)) ? ((8'haf) < (8'hbd)) : (8'hb7)) ~^ (~|((8'hb2) && (8'ha4)))) ? ((&((8'ha3) ? (8'ha1) : (8'hbf))) | ((~|(8'hb4)) ? ((8'hb7) ? (7'h44) : (8'hab)) : ((8'ha7) <= (8'hbe)))) : (8'h9c)) ? ({(~((8'hb8) ~^ (8'ha2)))} <= {(+(!(8'hb1)))}) : ((~^(((8'ha2) ? (8'haa) : (8'ha3)) ? (-(8'hae)) : (~^(8'h9d)))) ? {(((8'h9c) << (8'hac)) ? {(8'hb4), (8'hba)} : {(8'hb8), (8'hb0)}), (((8'ha8) < (8'hac)) | ((8'ha9) <= (8'hbf)))} : (~&(!((7'h42) ? (8'hbb) : (8'haf)))))))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire92;
  input wire [(2'h2):(1'h0)] wire91;
  input wire [(4'h8):(1'h0)] wire90;
  input wire signed [(4'h9):(1'h0)] wire89;
  input wire [(4'hd):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
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
                 reg121,
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
                 (1'h0)};
  assign wire93 = wire89;
  assign wire94 = {$signed($signed(wire92)), (7'h44)};
  assign wire95 = $unsigned((~^$unsigned(((wire94 - wire92) ?
                      {wire91, (8'hb8)} : $signed(wire91)))));
  assign wire96 = ((8'ha2) ?
                      $signed((wire89 ?
                          (wire93[(4'hf):(3'h7)] ^ wire91) : $unsigned(wire88))) : (-{($signed(wire90) ?
                              wire92 : (-(8'hae)))}));
  assign wire97 = ($signed($signed(((~&(8'hbc)) ?
                      $unsigned(wire93) : $unsigned(wire88)))) > (&wire94[(3'h5):(3'h4)]));
  assign wire98 = $signed((^~(&(^~(~^(8'hbd))))));
  assign wire99 = (+($unsigned((|(~^wire98))) | $unsigned($unsigned(wire89[(3'h7):(3'h7)]))));
  assign wire100 = wire91;
  assign wire101 = (((wire89 ?
                           (((8'hbe) && wire99) << (wire99 || wire89)) : (!{wire98,
                               wire93})) ?
                       wire96[(1'h1):(1'h0)] : wire91[(1'h0):(1'h0)]) ^ (wire89[(3'h4):(1'h0)] >> {(~|(&wire97)),
                       $signed(wire98[(4'he):(4'hb)])}));
  assign wire102 = $signed((^wire94));
  assign wire103 = $signed(((~|{$unsigned(wire88)}) ?
                       ((wire102 + (~&wire101)) <<< wire88) : (wire102 > {wire88[(4'hb):(2'h3)],
                           $signed((8'ha0))})));
  assign wire104 = ((-(-{wire93})) ?
                       ($unsigned($unsigned($unsigned(wire89))) | wire94) : $signed((~^$signed($unsigned(wire103)))));
  assign wire105 = (~wire89);
  assign wire106 = {wire97, wire91[(2'h2):(1'h1)]};
  assign wire107 = (((8'ha4) ? wire95 : wire89) ?
                       $signed(((!wire96[(1'h1):(1'h1)]) <<< ((!(8'hbe)) ?
                           (wire106 ?
                               wire89 : wire104) : (~wire98)))) : ($unsigned((wire106 ?
                           wire103[(2'h2):(1'h1)] : wire90[(1'h0):(1'h0)])) == $signed((wire95[(1'h1):(1'h0)] ?
                           (wire88 ~^ wire98) : ((8'h9c) ? wire98 : wire97)))));
  assign wire108 = $unsigned(({($unsigned(wire90) ?
                               (wire92 << wire106) : $signed(wire95))} ?
                       (|{wire103, (wire93 ? wire95 : (8'ha7))}) : wire97));
  assign wire109 = $unsigned((~^(|{$signed(wire90), {wire99, wire100}})));
  assign wire110 = wire94;
  always
    @(posedge clk) begin
      if (wire92[(3'h4):(3'h4)])
        begin
          reg111 <= ({{(wire96[(2'h2):(1'h1)] ?
                      wire92 : (wire108 ? (8'hbc) : (8'h9c))),
                  (8'ha4)},
              (wire110 <= (wire99 ?
                  (wire110 > (8'hbc)) : wire89[(1'h0):(1'h0)]))} == wire88[(3'h7):(3'h6)]);
          reg112 <= (8'ha8);
          reg113 <= ($signed(((+wire107[(3'h6):(1'h0)]) & $signed((wire108 != wire92)))) << $unsigned($signed($signed((wire106 ?
              wire95 : wire97)))));
        end
      else
        begin
          if (wire97)
            begin
              reg111 <= $unsigned($signed(wire107[(2'h3):(1'h0)]));
              reg112 <= {{(8'hb5), wire100}};
              reg113 <= {wire97, (wire110[(1'h1):(1'h0)] << wire110)};
            end
          else
            begin
              reg111 <= $unsigned({reg111[(1'h0):(1'h0)]});
              reg112 <= wire99;
              reg113 <= (8'hac);
              reg114 <= wire109[(1'h1):(1'h1)];
            end
          reg115 <= $unsigned((~(~&((wire93 > reg113) ?
              $unsigned(reg112) : wire102))));
          if (wire89[(2'h3):(1'h1)])
            begin
              reg116 <= $unsigned({($unsigned((reg114 <= wire93)) ?
                      $unsigned($unsigned((8'haf))) : $signed(wire98)),
                  wire98[(4'hf):(4'hf)]});
            end
          else
            begin
              reg116 <= {($signed({$signed(wire94), wire96}) == reg114),
                  $unsigned($signed((&(^wire107))))};
              reg117 <= {($unsigned($unsigned((reg113 ?
                      reg116 : wire90))) < $unsigned((reg113[(1'h1):(1'h0)] ?
                      $unsigned(reg116) : (wire92 <<< wire88)))),
                  $signed({(+wire94[(3'h4):(1'h1)])})};
            end
          reg118 <= (^$unsigned(wire90));
          reg119 <= (((wire99 >> {$signed(wire91)}) & $signed(wire102)) <= $signed(($unsigned(wire91) <= wire103[(2'h2):(1'h0)])));
        end
      if ($signed($unsigned((!((|wire90) ?
          (wire105 ? wire89 : reg117) : wire107)))))
        begin
          if (wire98)
            begin
              reg120 <= ((-(8'ha5)) ^~ $signed((^$unsigned(wire107[(3'h4):(1'h1)]))));
              reg121 <= (wire110 >= (8'hb5));
              reg122 <= $signed({{$signed($signed(wire102))}});
              reg123 <= $signed(reg120[(3'h5):(1'h0)]);
            end
          else
            begin
              reg120 <= ((~^(~|wire90)) <= (~|wire109[(4'ha):(2'h3)]));
              reg121 <= reg119;
            end
          if ((reg114[(3'h5):(3'h4)] + $unsigned(wire94[(1'h0):(1'h0)])))
            begin
              reg124 <= (wire100[(1'h0):(1'h0)] && (8'ha7));
            end
          else
            begin
              reg124 <= reg118[(1'h1):(1'h0)];
              reg125 <= $signed((wire101 - (wire101[(3'h5):(1'h1)] <= $unsigned((wire110 ?
                  reg112 : wire109)))));
              reg126 <= $unsigned(($signed($unsigned($unsigned(wire97))) > wire110[(2'h3):(2'h2)]));
              reg127 <= (((&(reg117[(2'h2):(1'h0)] & wire107)) >>> $unsigned($signed($signed(reg114)))) > (^(|((wire95 ?
                  wire106 : wire100) < (reg113 * reg119)))));
              reg128 <= {(^~$signed(wire105[(2'h3):(2'h2)]))};
            end
          reg129 <= (wire92 ?
              {$unsigned($signed($unsigned(wire94))),
                  wire103[(2'h2):(1'h1)]} : (reg124 != $signed(($unsigned(wire99) < wire102[(4'h9):(4'h8)]))));
        end
      else
        begin
          if (($unsigned($unsigned({$unsigned(wire92)})) ?
              reg117[(2'h3):(1'h1)] : (~^wire96[(1'h0):(1'h0)])))
            begin
              reg120 <= $signed($unsigned(reg115));
            end
          else
            begin
              reg120 <= reg116;
              reg121 <= $unsigned(reg129);
              reg122 <= (&({reg125} * $signed(($unsigned(wire92) ?
                  $signed(wire96) : (-wire98)))));
              reg123 <= $signed(wire105);
              reg124 <= wire106[(2'h2):(1'h1)];
            end
          reg125 <= $signed({(~((wire99 ? (8'hbc) : wire94) ?
                  (|reg128) : (^~reg126))),
              (&$signed($unsigned(reg111)))});
          if ($unsigned((~(&((wire107 >>> reg115) ?
              wire97[(4'hf):(2'h3)] : $signed(wire105))))))
            begin
              reg126 <= (|$signed($signed(((reg119 >>> reg118) && $signed((8'hbb))))));
              reg127 <= $signed(((8'ha4) ^ (((reg112 ? reg121 : (8'hb2)) ?
                      reg127 : $unsigned(wire100)) ?
                  reg115 : wire108)));
              reg128 <= reg126;
            end
          else
            begin
              reg126 <= (8'hae);
              reg127 <= $unsigned(reg128);
              reg128 <= {(+wire92)};
            end
          if ((wire104[(3'h7):(3'h6)] & $unsigned(reg122[(1'h1):(1'h1)])))
            begin
              reg129 <= ((({$unsigned(reg126),
                  $unsigned(wire107)} && reg113[(1'h0):(1'h0)]) & reg117[(1'h0):(1'h0)]) >= wire104);
              reg130 <= wire108;
              reg131 <= reg121[(3'h4):(2'h2)];
              reg132 <= (((wire100[(3'h5):(3'h5)] ?
                  reg129 : (|wire97[(2'h2):(1'h1)])) > wire91) + ($unsigned(wire107[(3'h4):(2'h3)]) <= $unsigned($signed($unsigned(reg123)))));
              reg133 <= reg130[(1'h0):(1'h0)];
            end
          else
            begin
              reg129 <= (8'h9e);
            end
          if ((({wire88} ^ reg120[(1'h0):(1'h0)]) ?
              ((8'hb5) || $signed({wire88,
                  wire105})) : $unsigned($signed({(~&reg130)}))))
            begin
              reg134 <= (~&((~&reg125[(4'hb):(2'h2)]) ?
                  ($unsigned((wire110 && wire101)) && $unsigned($unsigned(wire89))) : $unsigned(wire100[(3'h5):(3'h4)])));
              reg135 <= (~(reg111[(1'h0):(1'h0)] ?
                  $unsigned(wire98) : $unsigned(wire109)));
              reg136 <= (+$signed(($signed(reg115[(2'h2):(2'h2)]) >= ($unsigned(wire107) ?
                  (|(8'hb0)) : wire103[(3'h5):(2'h3)]))));
              reg137 <= $signed($signed(wire105));
              reg138 <= {($signed($unsigned($unsigned(reg118))) >> (~^wire100))};
            end
          else
            begin
              reg134 <= ({(reg117 ?
                      $unsigned((reg132 ?
                          wire88 : reg130)) : ($signed(reg120) >= reg117[(2'h2):(1'h0)])),
                  reg137[(3'h5):(1'h0)]} != (^{$unsigned(((7'h40) ?
                      wire90 : (8'ha4)))}));
              reg135 <= {wire99,
                  {$unsigned(wire100[(4'hf):(1'h1)]),
                      ($unsigned($signed(reg120)) & (!reg120[(2'h3):(1'h1)]))}};
              reg136 <= $unsigned((~^$signed(($signed(reg125) != $signed(wire89)))));
            end
        end
      reg139 <= (^wire100[(4'h9):(4'h8)]);
      if ($signed((reg124[(2'h3):(2'h3)] ?
          $signed(((8'hb5) ? {wire107} : $unsigned(reg115))) : (~reg114))))
        begin
          reg140 <= wire94;
        end
      else
        begin
          reg140 <= (((~^(~^wire96)) ?
              $signed($unsigned({(8'h9f)})) : reg137) << $signed({(|(~^(8'hb2))),
              wire110}));
        end
      if (($unsigned($signed(wire105[(3'h4):(2'h3)])) ?
          $unsigned($signed(((wire107 != (8'hb4)) ?
              (~&reg121) : {reg136, reg120}))) : reg119))
        begin
          reg141 <= wire105;
          if ({(($unsigned($unsigned(reg127)) + $unsigned(((8'hab) ?
                  wire100 : reg126))) + ($unsigned($signed((8'hae))) >> $unsigned({wire106,
                  reg134}))),
              $signed($unsigned(wire97[(3'h5):(3'h4)]))})
            begin
              reg142 <= wire99[(4'ha):(3'h6)];
            end
          else
            begin
              reg142 <= (wire108[(3'h7):(2'h3)] >> wire106[(2'h3):(2'h3)]);
              reg143 <= $signed($signed(({$unsigned(reg113)} | {(reg126 ?
                      reg114 : reg117),
                  $unsigned(reg111)})));
              reg144 <= ($unsigned(reg120) && $signed(wire96[(1'h1):(1'h0)]));
              reg145 <= $signed($signed(($signed((wire96 == reg135)) ?
                  $unsigned($unsigned(wire97)) : wire98)));
              reg146 <= (-(~^reg111[(3'h5):(2'h3)]));
            end
        end
      else
        begin
          if ((((~&((reg123 ? reg135 : (7'h44)) ?
                  reg118 : (~^reg127))) + reg135) ?
              (!$unsigned(wire88)) : $signed(reg125)))
            begin
              reg141 <= (($unsigned(((reg129 ?
                          reg146 : reg144) | (wire109 & (8'hb4)))) ?
                      (((reg118 ? reg137 : (8'h9c)) ?
                          (8'hbc) : reg118[(3'h4):(1'h1)]) | $unsigned(wire88)) : $unsigned($signed({reg121,
                          wire93}))) ?
                  wire103 : $unsigned(reg117[(2'h2):(1'h0)]));
            end
          else
            begin
              reg141 <= wire110[(4'hd):(4'hc)];
              reg142 <= ($unsigned(reg134) ?
                  reg120 : (reg130[(3'h4):(1'h1)] <= (wire99 ?
                      $signed($unsigned(wire108)) : $signed((!wire88)))));
            end
          reg143 <= reg121;
          if ($signed($unsigned({$unsigned($signed(reg142))})))
            begin
              reg144 <= (~|(wire90 != ($signed((+wire102)) - $unsigned(reg125[(2'h2):(1'h1)]))));
              reg145 <= $signed(wire103[(3'h4):(1'h1)]);
            end
          else
            begin
              reg144 <= $unsigned((!reg144));
              reg145 <= (^~wire97[(2'h3):(2'h3)]);
              reg146 <= {($signed(reg135[(3'h5):(1'h0)]) ?
                      $signed((|{reg137,
                          reg121})) : $unsigned(wire102[(4'ha):(3'h7)]))};
            end
          reg147 <= {$signed($unsigned(($unsigned(reg146) & ((8'h9e) | wire89))))};
          reg148 <= $signed(reg145[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg149 <= $unsigned({(^(&(~&reg125))),
          $signed($unsigned((reg112 > reg135)))});
      reg150 <= wire95[(4'h8):(3'h4)];
      reg151 <= wire89;
    end
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire42;
  input wire [(4'hf):(1'h0)] wire41;
  input wire [(4'hb):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire45,
                 wire44,
                 wire43,
                 reg79,
                 reg78,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  assign wire43 = wire41;
  assign wire44 = $unsigned(wire42);
  assign wire45 = wire39;
  always
    @(posedge clk) begin
      if ($signed({$signed(wire40[(4'h9):(2'h2)])}))
        begin
          if ((-$signed((wire39[(2'h3):(2'h2)] ?
              (+((8'h9d) & wire45)) : $unsigned(wire40[(4'hb):(3'h4)])))))
            begin
              reg46 <= $signed($unsigned((-(-$unsigned((8'ha5))))));
              reg47 <= $signed({(|$unsigned((|wire40)))});
            end
          else
            begin
              reg46 <= wire39;
              reg47 <= (8'had);
            end
        end
      else
        begin
          reg46 <= wire43;
          reg47 <= $signed(wire44);
          reg48 <= wire43;
          reg49 <= wire39;
          reg50 <= (+({((wire45 ? wire40 : wire45) ^~ (wire44 ?
                      wire40 : wire45))} ?
              {reg47[(3'h4):(2'h2)],
                  (((8'hbc) ?
                      wire42 : wire43) - (wire42 == reg49))} : wire39[(4'hc):(4'hc)]));
        end
      if ((wire42 != $signed(($unsigned($signed(reg49)) ?
          $unsigned((wire43 ? reg50 : wire41)) : $unsigned((reg49 >= reg50))))))
        begin
          if ($signed(((((^wire41) ? (&wire41) : wire40) ?
                  reg50[(1'h1):(1'h1)] : {(reg47 ? wire42 : wire45)}) ?
              $unsigned($signed($unsigned(reg46))) : $unsigned($signed($signed(reg50))))))
            begin
              reg51 <= wire39[(3'h4):(1'h0)];
            end
          else
            begin
              reg51 <= reg48;
              reg52 <= $unsigned((((~&wire40) ?
                  wire43[(2'h3):(2'h3)] : ((reg48 ?
                      reg48 : reg46) & $signed(reg51))) > reg46));
              reg53 <= (|reg47[(4'h9):(1'h0)]);
              reg54 <= (($unsigned({wire39}) ?
                      $signed((^~$unsigned(reg52))) : ($unsigned($unsigned((8'hac))) - wire39)) ?
                  reg51[(4'h9):(1'h1)] : (~&{wire45, $signed((&wire45))}));
              reg55 <= (-reg52[(3'h4):(2'h2)]);
            end
          if ((((~&($signed(reg49) | reg52[(2'h3):(2'h3)])) ?
                  $signed($unsigned($unsigned(wire44))) : wire43) ?
              ((($signed((7'h44)) ^ {wire40, wire43}) ?
                  ((reg55 > reg47) != $signed(reg46)) : (&((8'hb7) != (7'h44)))) < (^($signed(wire42) <= $unsigned(wire42)))) : (((^~((8'hbe) <= wire39)) ?
                      (+reg51[(1'h1):(1'h1)]) : {reg54}) ?
                  $unsigned(((7'h44) ^~ wire39[(5'h13):(2'h3)])) : ($unsigned((reg53 ?
                          reg55 : (7'h44))) ?
                      $unsigned(((8'hac) ? reg52 : reg52)) : ({(8'haa), reg55} ?
                          (&(8'hbb)) : ((8'hb3) ? reg53 : reg52))))))
            begin
              reg56 <= {$unsigned(reg53)};
            end
          else
            begin
              reg56 <= {{$signed((8'haa)),
                      ($signed(reg55[(3'h5):(3'h4)]) ?
                          ((^reg56) >= (reg56 <= reg56)) : (8'hb9))}};
              reg57 <= (|wire44);
            end
          reg58 <= (^({$unsigned(reg54),
              $unsigned(wire44[(2'h3):(1'h0)])} * (((wire45 ?
                  reg52 : reg48) ^ (wire40 && (8'ha0))) ?
              (-$unsigned(reg57)) : $unsigned(((8'ha0) != reg47)))));
          reg59 <= $unsigned($signed({reg51,
              {$unsigned(reg55), (reg51 <<< wire39)}}));
          reg60 <= reg50;
        end
      else
        begin
          reg51 <= $unsigned((wire41[(2'h2):(1'h0)] >= {$unsigned((~&reg57))}));
        end
      reg61 <= reg47[(5'h12):(4'hb)];
      if (reg49)
        begin
          if (reg59[(5'h12):(5'h10)])
            begin
              reg62 <= (reg51[(1'h1):(1'h0)] ?
                  ({((^~reg50) ? (+reg60) : $signed((8'hae))),
                      (8'hb0)} >= (reg59 != (((8'hbc) ? wire44 : (7'h42)) ?
                      (^wire45) : ((8'h9c) ?
                          reg52 : reg48)))) : reg50[(2'h2):(2'h2)]);
              reg63 <= reg62;
            end
          else
            begin
              reg62 <= $signed((!$unsigned({(^~reg50)})));
              reg63 <= $unsigned((~&$unsigned((wire40 | {reg62, reg62}))));
              reg64 <= {(8'ha5),
                  (reg47[(1'h0):(1'h0)] ?
                      $signed((reg50[(2'h2):(2'h2)] > ((8'ha3) + reg54))) : ({$signed(reg53)} ?
                          ((|reg46) ?
                              (reg52 ?
                                  reg50 : wire42) : $unsigned(reg48)) : $signed((reg55 | reg60))))};
              reg65 <= {(reg63 <= (((reg47 ? (8'ha0) : reg56) ^~ (~&(8'hbf))) ?
                      reg55[(3'h5):(2'h2)] : wire42)),
                  (^(8'haa))};
            end
          reg66 <= (8'had);
          reg67 <= $unsigned((reg50 >> {$unsigned(reg58[(3'h6):(2'h2)]),
              ((reg50 ? wire41 : wire44) ?
                  $unsigned(wire45) : reg56[(2'h3):(1'h1)])}));
        end
      else
        begin
          reg62 <= reg67[(2'h2):(2'h2)];
        end
    end
  assign wire68 = reg53[(4'hb):(2'h2)];
  assign wire69 = $unsigned((~reg61));
  assign wire70 = (~(+(|reg62[(3'h5):(1'h0)])));
  assign wire71 = (+(reg50 ?
                      (({(8'h9d), reg58} ?
                          (reg60 ~^ reg67) : (wire69 | reg50)) << (|(wire70 | reg54))) : $unsigned(reg57[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg72 <= $signed($signed(reg64[(1'h1):(1'h0)]));
      reg73 <= (!(($signed(reg65) <= $signed(reg57[(3'h4):(3'h4)])) >>> wire69[(2'h3):(2'h2)]));
      reg74 <= (!(-$signed(wire43[(1'h0):(1'h0)])));
    end
  assign wire75 = ($signed((~$unsigned($signed(wire39)))) << $signed((~|$signed((~reg60)))));
  assign wire76 = wire40[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg77 <= (reg46 ?
          (~|$unsigned(((+wire70) | $unsigned(wire44)))) : (~({(wire71 >>> wire69),
              {wire45}} || reg63)));
      reg78 <= wire39[(5'h12):(3'h7)];
      reg79 <= (((8'ha6) ~^ reg65) * (wire76 ?
          $unsigned(($unsigned((8'hb1)) ?
              (&wire45) : reg57[(1'h0):(1'h0)])) : ({{wire44}} | reg64)));
    end
  assign wire80 = ($signed(({$unsigned(wire76),
                      {reg78}} <<< (!$signed(reg55)))) >> reg78[(2'h2):(1'h0)]);
  assign wire81 = (~|(~^($unsigned((wire39 ?
                      reg59 : (8'ha0))) < ($signed(reg64) <= (&wire43)))));
  assign wire82 = ((^~$signed(((^~reg53) ? wire43[(1'h0):(1'h0)] : (-reg55)))) ?
                      $unsigned(((~^$signed(reg59)) + ($unsigned(reg49) <<< {reg52}))) : $signed($signed($signed(reg49))));
  assign wire83 = (~($signed(wire40) > reg79));
  assign wire84 = $unsigned($unsigned((~^(&((8'hbd) ^~ (8'h9e))))));
endmodule
