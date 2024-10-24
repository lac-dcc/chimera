module top
#(parameter param164 = (((|((-(8'ha1)) ? ((8'ha4) <= (8'ha0)) : ((8'ha5) ? (8'hbd) : (8'ha1)))) && {(~^(|(7'h42)))}) > (((((8'had) - (8'hbb)) + (&(8'h9f))) ? {((8'hb5) <<< (8'had))} : ({(7'h43), (8'ha6)} ? ((8'hba) ^ (8'hbe)) : ((8'ha8) >>> (8'hbc)))) ? ((|(8'hb1)) & {((8'hae) >>> (8'ha7)), ((8'h9e) <<< (8'hbd))}) : (((~^(7'h41)) ? (^~(8'ha5)) : (~(8'hbc))) ? (((8'hb1) < (8'h9f)) ? ((8'hb4) << (8'hac)) : (!(8'hbe))) : ((&(8'hbd)) ? ((8'ha8) + (8'h9c)) : ((8'hbd) ^~ (8'hbd)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire157;
  wire signed [(3'h5):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire154;
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire4,
                 wire154,
                 (1'h0)};
  assign wire4 = {{((7'h41) < {(wire3 ? wire2 : wire3)}),
                         (($unsigned((8'ha4)) ~^ wire1[(4'h8):(4'h8)]) ?
                             wire1 : (wire0[(3'h5):(1'h1)] ?
                                 (wire2 >>> wire2) : (wire2 ?
                                     wire0 : wire1)))}};
  module5 #() modinst155 (.wire7(wire0), .wire8(wire4), .wire9(wire2), .clk(clk), .y(wire154), .wire6(wire3), .wire10(wire1));
  assign wire156 = ((^wire1[(4'he):(4'ha)]) ?
                       $unsigned(wire4[(5'h13):(4'h9)]) : (!(~|({wire4, wire2} ?
                           (wire3 * wire4) : wire2))));
  assign wire157 = wire4;
  assign wire158 = wire2;
  assign wire159 = $unsigned((wire1 * wire157));
  assign wire160 = $unsigned(wire154[(4'h9):(3'h5)]);
  assign wire161 = wire159[(1'h0):(1'h0)];
  assign wire162 = {$signed(wire1[(2'h3):(2'h2)])};
  assign wire163 = $signed($signed(wire157[(1'h0):(1'h0)]));
endmodule

module module5
#(parameter param152 = {(((^((8'hae) ? (8'hba) : (8'hb7))) ~^ ({(7'h43), (8'hb3)} >> ((7'h41) & (8'ha1)))) + (!((^(7'h41)) ? ((8'h9d) * (8'hb8)) : ((8'h9e) ? (8'hbf) : (8'ha7)))))}, 
parameter param153 = ((param152 ? param152 : {((param152 ? param152 : param152) >= (-param152)), ((param152 ^~ param152) ? (^(8'had)) : param152)}) * (((8'haa) == (8'ha6)) ? (^~(param152 >= (!param152))) : param152)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire148;
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire102,
                 wire82,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire47,
                 wire45,
                 wire25,
                 wire23,
                 wire104,
                 wire105,
                 wire106,
                 wire148,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 (1'h0)};
  module11 #() modinst24 (.wire13(wire9), .wire14(wire6), .y(wire23), .wire16(wire7), .clk(clk), .wire12(wire10), .wire15(wire8));
  assign wire25 = $unsigned(wire6[(1'h0):(1'h0)]);
  module26 #() modinst46 (wire45, clk, wire8, wire9, wire23, wire10);
  assign wire47 = $signed($signed(wire45));
  always
    @(posedge clk) begin
      reg48 <= (wire6[(3'h7):(2'h3)] ?
          wire47[(1'h0):(1'h0)] : wire7[(1'h1):(1'h0)]);
      reg49 <= (|(&$unsigned(wire9[(4'hb):(3'h5)])));
    end
  always
    @(posedge clk) begin
      if ($signed($signed(wire10)))
        begin
          if (wire7)
            begin
              reg50 <= wire45[(1'h1):(1'h0)];
              reg51 <= $unsigned((((+$unsigned(wire23)) ?
                  ($unsigned(wire25) ^~ {wire7,
                      wire25}) : $unsigned($signed((8'hb1)))) <<< (wire25[(4'h9):(4'h8)] ?
                  $signed((reg49 << reg50)) : wire45)));
            end
          else
            begin
              reg50 <= wire7[(4'ha):(2'h3)];
            end
          reg52 <= $signed(wire25);
          reg53 <= wire47[(2'h2):(2'h2)];
          reg54 <= ({(reg51[(2'h2):(1'h1)] ? {wire7, $unsigned(wire8)} : reg51),
              reg48[(4'hc):(3'h6)]} <= (+$unsigned(reg49)));
        end
      else
        begin
          if ($signed((&reg49[(1'h0):(1'h0)])))
            begin
              reg50 <= (reg48 ? wire8[(1'h0):(1'h0)] : wire8);
              reg51 <= ($signed(wire8[(4'hd):(1'h0)]) < (&reg51[(4'hb):(4'ha)]));
            end
          else
            begin
              reg50 <= $unsigned(wire8);
              reg51 <= {$unsigned(wire8)};
            end
        end
    end
  module55 #() modinst73 (wire72, clk, wire7, wire6, reg48, reg54, reg50);
  assign wire74 = wire9;
  assign wire75 = $unsigned((((wire74[(2'h2):(1'h1)] >= reg52[(4'ha):(3'h5)]) == wire8[(3'h4):(1'h1)]) ?
                      wire72[(4'hb):(2'h2)] : (reg48 <<< (8'ha4))));
  assign wire76 = (~$signed((-(|$unsigned(wire8)))));
  assign wire77 = wire75;
  always
    @(posedge clk) begin
      reg78 <= (^~$signed($unsigned(reg50)));
      reg79 <= ($signed(($signed(wire9) <<< reg78)) ?
          reg52[(3'h4):(1'h0)] : {reg54[(1'h1):(1'h0)], wire9[(3'h7):(3'h5)]});
      reg80 <= $unsigned(wire10);
      reg81 <= (~^wire72);
    end
  assign wire82 = $signed({$unsigned($unsigned(reg50)),
                      $signed(((wire8 || (8'h9e)) ?
                          wire9 : (wire74 || wire76)))});
  module83 #() modinst103 (wire102, clk, wire74, wire8, reg52, reg48, wire23);
  assign wire104 = {($unsigned({(~^reg51)}) ?
                           $signed($unsigned($signed(wire25))) : $signed(wire75[(3'h4):(1'h0)])),
                       $signed(reg78[(4'hb):(1'h0)])};
  assign wire105 = $unsigned($unsigned(wire82));
  assign wire106 = wire8;
  module107 #() modinst149 (wire148, clk, wire106, reg51, wire25, wire9, reg52);
  assign wire150 = $unsigned(((((reg52 ? wire75 : (8'haf)) ?
                           wire104 : (wire74 ?
                               (8'hab) : wire74)) | reg49[(2'h3):(1'h1)]) ?
                       ($unsigned($unsigned(reg48)) ?
                           $unsigned(reg53) : $unsigned((|wire7))) : ((~^wire9) ?
                           (reg50[(4'hc):(4'h9)] + $signed(reg50)) : (8'h9f))));
  assign wire151 = (-(+wire10));
endmodule

module module107
#(parameter param146 = ((+((((8'hb3) < (8'hae)) ^~ ((8'hb2) ? (8'hb0) : (8'ha7))) ? ((^(8'hbf)) == (8'ha0)) : (((7'h41) ? (8'hb7) : (8'hb7)) <= (-(8'hb5))))) ? (&{(((8'ha3) ? (8'hbe) : (8'ha2)) ? (+(8'hbb)) : ((8'had) ? (8'hb5) : (8'ha2)))}) : ((^{(~^(7'h40))}) ? (((~&(7'h43)) ? (!(8'hb8)) : ((8'hbf) <<< (7'h44))) ? (-{(8'hbb)}) : (((8'hb4) ? (8'h9e) : (8'ha8)) != ((8'hb9) ? (8'hba) : (8'h9f)))) : ((((7'h41) ? (8'hb3) : (8'ha3)) ? (~|(8'ha0)) : (~^(8'hb5))) & (-((8'h9d) ? (8'h9d) : (7'h42)))))), 
parameter param147 = ((param146 ^~ ((~|(param146 ? param146 : param146)) ? (!(~|param146)) : ((8'hbf) ? (~&param146) : (param146 ? (8'hb3) : param146)))) - param146))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire112;
  input wire signed [(5'h12):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire [(4'hc):(1'h0)] wire109;
  input wire [(2'h3):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire113;
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire113,
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
                 (1'h0)};
  assign wire113 = ((((!$unsigned((8'hb2))) ^ $unsigned(wire111[(4'hd):(4'ha)])) != $signed({wire108,
                           (&(8'ha4))})) ?
                       $unsigned($signed((~|$unsigned(wire109)))) : wire109);
  always
    @(posedge clk) begin
      reg114 <= {$signed((8'hbe)), {wire113, (~(8'h9e))}};
      reg115 <= $signed($signed($unsigned({$signed(wire108), (~wire112)})));
      reg116 <= $signed((~^((((8'hb6) < wire108) ?
              (wire108 ? wire110 : wire109) : (+wire113)) ?
          wire108 : reg114[(4'hf):(4'h9)])));
    end
  always
    @(posedge clk) begin
      reg117 <= $unsigned(wire112[(2'h2):(2'h2)]);
      reg118 <= (8'h9d);
      if ((~$signed(((~(wire108 ? reg118 : wire110)) | $signed(((8'ha1) ?
          wire110 : reg118))))))
        begin
          reg119 <= wire113[(5'h14):(4'he)];
          reg120 <= ((^~reg117) + wire109[(4'hc):(4'hb)]);
          reg121 <= {wire110, $signed(wire109[(4'h8):(2'h2)])};
          reg122 <= (~|(($signed((wire108 - (7'h41))) ?
                  wire109[(4'hb):(2'h3)] : reg117[(5'h13):(2'h2)]) ?
              ($unsigned(reg118) > ((reg114 ?
                  wire110 : reg119) || (&wire108))) : $unsigned({(reg116 <<< reg120)})));
          reg123 <= {($unsigned((~&(~reg116))) <= $unsigned($signed((wire112 ?
                  reg114 : wire113)))),
              $signed(wire109)};
        end
      else
        begin
          reg119 <= $signed($unsigned(wire113[(5'h12):(5'h12)]));
          if ((reg120[(2'h3):(1'h0)] ?
              {((~&$signed(reg119)) | (wire109 ?
                      $signed(reg119) : $signed(wire109)))} : $signed(wire108[(1'h0):(1'h0)])))
            begin
              reg120 <= wire113[(3'h5):(2'h3)];
              reg121 <= {(+wire110[(2'h3):(2'h3)]),
                  ((({wire109} ? (reg114 | reg123) : {reg114}) ?
                          $signed(wire112) : $unsigned($unsigned(reg115))) ?
                      (((reg123 ?
                          reg122 : reg123) <= (^wire112)) + ({(8'ha4)} << $unsigned(reg117))) : {(~&wire108[(2'h2):(2'h2)]),
                          ((wire113 ? reg123 : reg121) ?
                              reg119[(3'h4):(1'h0)] : reg115[(3'h4):(1'h1)])})};
            end
          else
            begin
              reg120 <= reg117[(4'h8):(1'h1)];
            end
          if (((($signed(wire110) << reg119[(4'ha):(3'h4)]) < $signed(reg119[(4'h8):(2'h2)])) ?
              $signed((~{$signed(wire108),
                  (wire111 >>> wire108)})) : $unsigned({reg119[(4'h8):(4'h8)]})))
            begin
              reg122 <= (8'hb2);
            end
          else
            begin
              reg122 <= $unsigned(((~($unsigned(wire113) ? reg115 : wire110)) ?
                  wire112[(2'h3):(2'h2)] : ($unsigned(reg115) ~^ (^reg117))));
              reg123 <= ((|(|reg117)) > wire109);
              reg124 <= $unsigned(wire112);
              reg125 <= wire111;
              reg126 <= ($signed($signed(((~(7'h40)) ?
                  (|(8'haf)) : reg116))) * (!wire111));
            end
          if ({($signed($unsigned($signed((8'ha7)))) ?
                  reg120[(4'hc):(4'hc)] : $unsigned(($unsigned(reg118) >= $unsigned(reg121)))),
              reg126})
            begin
              reg127 <= (($signed((reg122[(3'h7):(1'h0)] ?
                          $unsigned(wire108) : ((8'hae) >>> (8'h9c)))) ?
                      reg123 : (+$signed($unsigned(reg114)))) ?
                  $signed((reg124 ?
                      (reg118 ?
                          (reg115 & reg119) : $unsigned(wire111)) : {$unsigned(reg119)})) : ($unsigned($unsigned($signed(wire110))) >= wire112));
              reg128 <= (wire113 != $unsigned($unsigned(reg119[(3'h4):(2'h2)])));
            end
          else
            begin
              reg127 <= (|(~^$signed($signed((reg124 | (8'ha0))))));
              reg128 <= reg127;
            end
          reg129 <= reg118;
        end
    end
  assign wire130 = $signed(({reg128[(1'h0):(1'h0)]} ?
                       ($unsigned((reg115 ? wire113 : wire109)) ?
                           $signed($unsigned(reg118)) : (reg129[(4'hb):(3'h5)] ?
                               $unsigned(reg127) : wire110)) : $unsigned($unsigned((reg118 ?
                           reg117 : (8'hba))))));
  assign wire131 = (~(8'ha2));
  assign wire132 = ($unsigned(($unsigned(reg119) - (^reg114))) != $signed((~^wire108[(1'h0):(1'h0)])));
  assign wire133 = (~|reg127);
  assign wire134 = wire112[(2'h3):(2'h2)];
  assign wire135 = {(&$signed($signed(reg125)))};
  assign wire136 = $signed(((&{reg115,
                       reg120[(4'hc):(4'ha)]}) >= reg114[(4'hb):(2'h2)]));
  assign wire137 = wire130[(4'hc):(4'h8)];
  assign wire138 = $signed(reg125);
  assign wire139 = ($signed(wire138[(1'h0):(1'h0)]) ?
                       {(8'hbd)} : wire110[(2'h3):(1'h0)]);
  assign wire140 = ((^(!(wire138 ~^ wire132[(2'h3):(2'h2)]))) ?
                       reg127[(4'ha):(1'h1)] : wire136[(3'h7):(1'h0)]);
  assign wire141 = reg129;
  assign wire142 = $signed($unsigned(wire135));
  assign wire143 = (&((~($unsigned((8'ha2)) >= (wire138 ? reg116 : reg129))) ?
                       (^reg120) : (&wire110[(1'h0):(1'h0)])));
  assign wire144 = {(~&wire139[(2'h2):(1'h1)])};
  assign wire145 = {(~&(8'hb7))};
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  input wire signed [(5'h13):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
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
                 (1'h0)};
  assign wire89 = $unsigned((|wire85[(3'h6):(2'h3)]));
  assign wire90 = (wire89[(3'h5):(1'h0)] > (~(8'hb9)));
  assign wire91 = wire88[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ({($unsigned(wire88[(3'h5):(3'h5)]) ?
              {(((8'hbd) ? wire91 : wire91) ? wire91 : (8'hab)),
                  $signed($unsigned((8'hb6)))} : (!wire87))})
        begin
          reg92 <= (+($signed(((wire86 == wire88) && (wire88 >>> wire87))) * $unsigned(wire85[(1'h0):(1'h0)])));
          reg93 <= wire88[(2'h2):(1'h1)];
          reg94 <= wire84;
        end
      else
        begin
          reg92 <= wire91[(4'hb):(2'h3)];
          if ({wire85})
            begin
              reg93 <= (-$signed($signed((&((7'h43) <= wire85)))));
              reg94 <= $signed($unsigned(wire91[(1'h1):(1'h1)]));
              reg95 <= ((&reg92) ?
                  ((~&($signed(wire86) ? {wire88} : $signed(wire84))) ?
                      wire85 : $unsigned(wire85)) : ({wire90,
                      ($unsigned((8'h9f)) ?
                          $unsigned(wire91) : wire84[(3'h4):(1'h0)])} >= (((reg93 | (8'ha3)) <<< (wire84 ~^ (8'ha8))) == ($signed(wire88) ?
                      (wire90 ? wire90 : wire91) : ((8'hb1) ?
                          wire84 : (7'h43))))));
              reg96 <= (-((~^{wire88,
                  (wire88 ? reg94 : wire86)}) != wire91[(3'h5):(2'h3)]));
            end
          else
            begin
              reg93 <= ($unsigned(({(reg93 >>> wire88)} >= ($signed(wire86) * $unsigned(wire90)))) ?
                  (~(8'hb5)) : reg92[(4'hd):(2'h3)]);
              reg94 <= (-wire85);
              reg95 <= (reg96 ?
                  (((wire89[(2'h2):(2'h2)] ?
                          $signed((8'hb5)) : (reg93 ? (8'hb3) : wire84)) ?
                      ((~|reg94) * wire86) : $signed((reg93 ^~ wire85))) ^~ wire87[(3'h5):(2'h3)]) : wire86[(1'h1):(1'h0)]);
              reg96 <= $signed((($unsigned((wire90 ?
                  reg92 : wire84)) ^ ($signed(reg93) ?
                  ((8'ha6) ?
                      wire86 : wire88) : (8'ha6))) + wire89[(3'h4):(2'h2)]));
            end
          reg97 <= wire84;
          reg98 <= $unsigned($signed((8'ha3)));
          reg99 <= reg94[(1'h1):(1'h0)];
        end
      reg100 <= ({((wire91 ? (wire87 ? reg95 : reg93) : $unsigned(wire88)) ?
                  ((~&wire90) ? $unsigned(wire90) : {wire86}) : wire88)} ?
          $signed((^~{reg99[(3'h6):(3'h6)]})) : ($signed(wire89) - ($signed($signed(reg96)) ?
              (~&(~&wire87)) : reg98)));
      reg101 <= ($unsigned($signed(($unsigned(wire86) > reg96[(2'h2):(1'h0)]))) + $unsigned(reg98[(4'hb):(1'h1)]));
    end
endmodule

module module55
#(parameter param71 = {({(8'ha1), (!{(8'h9f)})} != {(((8'ha3) ? (8'hb2) : (8'h9f)) > (^(8'ha5)))})})
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire60;
  input wire [(4'hb):(1'h0)] wire59;
  input wire signed [(2'h2):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire signed [(4'hd):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire61 = $signed(($unsigned({wire59[(4'ha):(4'h9)]}) ?
                      ((8'hb1) ?
                          $signed(wire60) : $unsigned(wire58[(2'h2):(2'h2)])) : wire60[(4'hc):(3'h5)]));
  assign wire62 = ($signed((~^$unsigned(((8'ha9) ?
                      wire56 : wire58)))) == {(+((~^wire57) ~^ (wire60 ?
                          wire60 : wire58))),
                      (wire61 >>> (^{(8'ha0), wire58}))});
  assign wire63 = wire62[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg64 <= {(7'h40)};
      reg65 <= (+(!wire63[(1'h0):(1'h0)]));
      if ($signed((~reg65)))
        begin
          reg66 <= $signed({(~|reg65), (&$signed({wire57, reg65}))});
          reg67 <= (~&$signed($unsigned((8'ha1))));
          reg68 <= (reg64[(3'h5):(2'h2)] << $signed((~&(^~$unsigned((8'hbb))))));
        end
      else
        begin
          reg66 <= (+{wire60[(1'h1):(1'h1)],
              ((~&reg66[(1'h1):(1'h1)]) ?
                  wire60[(4'hd):(3'h4)] : $unsigned($signed(reg65)))});
          reg67 <= $unsigned((reg66[(2'h2):(2'h2)] ?
              reg67 : $unsigned(reg67[(2'h3):(1'h1)])));
        end
      reg69 <= (~&(-wire61[(3'h4):(1'h0)]));
      reg70 <= (~|wire57[(2'h3):(2'h2)]);
    end
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire31 = wire30;
  assign wire32 = (&wire28);
  assign wire33 = (~&wire31);
  assign wire34 = ($signed($unsigned(((wire27 & wire32) & $unsigned(wire33)))) >> {(($unsigned(wire31) ^ $unsigned(wire27)) != {(+wire28)})});
  assign wire35 = (wire29[(4'h8):(4'h8)] ?
                      $unsigned($signed(({wire27,
                          wire34} && wire33))) : (~|((^~$unsigned(wire33)) ?
                          $signed((wire34 ^ wire34)) : wire32)));
  always
    @(posedge clk) begin
      reg36 <= wire33;
      reg37 <= wire33[(3'h4):(3'h4)];
      reg38 <= {$unsigned({wire27[(3'h6):(1'h0)], wire30})};
      reg39 <= (($unsigned($unsigned($signed(wire34))) << $unsigned((~{wire28}))) ?
          (~$unsigned((~|(reg37 ? wire29 : wire31)))) : $unsigned(wire33));
    end
  assign wire40 = (7'h41);
  assign wire41 = (!((wire31[(3'h4):(3'h4)] != $unsigned((!wire29))) << wire32[(3'h4):(3'h4)]));
  assign wire42 = $signed(((($signed(reg36) ? (8'hb4) : reg36) >>> wire30) ?
                      ((7'h41) ?
                          {(reg39 ?
                                  (8'ha3) : wire28)} : (7'h42)) : reg37[(4'hc):(4'h9)]));
  assign wire43 = (~|$unsigned(($signed($signed(wire29)) && reg39)));
  assign wire44 = reg37;
endmodule

module module11
#(parameter param22 = ({((~|(~(8'ha1))) <<< (-(~&(8'ha3))))} ? {{{((8'haa) ? (8'hb0) : (8'ha0)), ((8'hab) + (8'hbe))}, (~&(&(8'haf)))}, (((&(8'hba)) >> (~|(8'ha8))) ? {(8'hbc), (!(8'ha3))} : (~^((8'ha0) ? (8'ha3) : (8'hb3))))} : ((~(!{(8'hb5), (8'ha8)})) > ((((8'hb1) ? (7'h44) : (7'h42)) ? (8'ha5) : ((8'hb9) || (8'hbe))) ^~ ((|(8'hbd)) + {(8'ha2)})))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = $signed((wire15[(3'h5):(3'h4)] ? (&wire12) : (!(&wire14))));
  assign wire18 = wire16;
  assign wire19 = wire12[(3'h4):(3'h4)];
  assign wire20 = {$signed($unsigned(wire14))};
  assign wire21 = (wire19 <= (wire12[(1'h0):(1'h0)] || $signed($signed({wire13}))));
endmodule
