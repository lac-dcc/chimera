module top
#(parameter param202 = {(((((8'hb0) ? (8'h9d) : (7'h44)) ^ ((8'ha3) != (8'ha5))) ? (((8'hb9) ? (8'hba) : (8'hba)) ? (7'h42) : ((8'hbd) ? (8'hb7) : (8'ha8))) : {((8'hb5) ? (8'ha9) : (8'h9c))}) ^~ ((((8'hae) ? (8'h9e) : (8'hb6)) && ((7'h41) ? (8'h9d) : (8'hb5))) | (((8'hbd) - (8'h9f)) << ((7'h41) ? (8'hb0) : (8'ha8)))))}, 
parameter param203 = {(((param202 ? param202 : (param202 & (8'hb4))) ? (param202 ? (param202 - param202) : (~^param202)) : (&(param202 ? param202 : param202))) < (-(((8'ha6) ? param202 : param202) * (+param202)))), param202})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire201;
  wire signed [(4'hc):(1'h0)] wire200;
  wire [(5'h14):(1'h0)] wire199;
  wire [(3'h5):(1'h0)] wire197;
  wire [(5'h10):(1'h0)] wire196;
  wire signed [(2'h3):(1'h0)] wire188;
  wire [(4'h9):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire184;
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg194 = (1'h0);
  reg [(4'hf):(1'h0)] reg195 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire197,
                 wire196,
                 wire188,
                 wire187,
                 wire186,
                 wire94,
                 wire99,
                 wire100,
                 wire104,
                 wire105,
                 wire106,
                 wire184,
                 reg103,
                 reg102,
                 reg101,
                 reg98,
                 reg97,
                 reg96,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 (1'h0)};
  module4 #() modinst95 (.wire5(wire2), .wire6(wire1), .wire7(wire0), .clk(clk), .y(wire94), .wire8(wire3));
  always
    @(posedge clk) begin
      if ($signed($signed(((((8'hab) * wire2) ?
              $unsigned(wire1) : (wire1 ? (8'hab) : wire2)) ?
          (&(wire2 ? (7'h42) : wire94)) : wire3))))
        begin
          reg96 <= {(wire94[(3'h5):(1'h1)] ?
                  $signed(((-wire3) | wire2[(4'h9):(4'h9)])) : (wire3 >> (^(~|wire0))))};
        end
      else
        begin
          reg96 <= (!wire1);
        end
      reg97 <= (~wire94);
      reg98 <= wire3;
    end
  assign wire99 = reg96[(2'h2):(1'h0)];
  assign wire100 = $signed(($signed($unsigned((wire3 ?
                       (8'ha2) : reg98))) <<< $signed(((wire94 ?
                       reg98 : wire94) || $unsigned(wire94)))));
  always
    @(posedge clk) begin
      reg101 <= (!(~{$signed($unsigned(wire100)), wire2}));
      if ((&wire0))
        begin
          reg102 <= $signed(($signed({wire100,
              (reg98 ^~ wire3)}) | (((reg96 & wire99) ?
                  $unsigned(reg96) : {reg97}) ?
              $unsigned($signed(wire94)) : $signed($unsigned(reg97)))));
          reg103 <= (-$unsigned($signed((-(^~wire94)))));
        end
      else
        begin
          reg102 <= $unsigned((((!$signed(wire0)) & {{wire100, (8'ha5)}}) ?
              $unsigned(reg101[(4'h8):(3'h7)]) : (8'hbb)));
        end
    end
  assign wire104 = (-reg96);
  assign wire105 = reg103[(4'he):(4'hc)];
  assign wire106 = $unsigned({wire94[(2'h2):(1'h1)],
                       ({{wire2}} ?
                           ($unsigned(wire94) ?
                               reg103[(4'he):(3'h7)] : reg96[(2'h2):(2'h2)]) : {((8'h9d) ?
                                   reg101 : reg98),
                               reg102})});
  module107 #() modinst185 (wire184, clk, reg103, wire105, reg97, wire104, wire106);
  assign wire186 = $signed({$unsigned(wire0[(3'h4):(3'h4)]),
                       {reg102, $unsigned(wire94[(1'h1):(1'h0)])}});
  assign wire187 = wire104[(3'h7):(3'h4)];
  module144 #() modinst189 (wire188, clk, wire184, reg103, reg98, wire186, reg97);
  always
    @(posedge clk) begin
      reg190 <= wire100;
      reg191 <= $signed(($signed((!(~|wire0))) ~^ $unsigned($unsigned(wire2))));
      if ($signed((reg102[(3'h7):(3'h7)] - ($signed((reg96 >= wire184)) ?
          wire106 : wire99[(3'h6):(2'h2)]))))
        begin
          reg192 <= ({(($signed((8'ha4)) == (wire187 > wire94)) ?
                  $signed($unsigned(wire100)) : reg191[(2'h2):(1'h1)]),
              $unsigned(reg96)} - wire2[(1'h0):(1'h0)]);
          reg193 <= (wire187 <= reg101);
          if (({reg98[(3'h4):(1'h0)]} ~^ $signed({(reg101[(4'he):(1'h0)] ?
                  reg103[(4'hf):(1'h0)] : {wire3}),
              {(|reg101), reg101}})))
            begin
              reg194 <= $signed((~^((~|$signed(reg103)) && (wire106 ?
                  ((8'haf) ^ wire1) : $unsigned(wire186)))));
            end
          else
            begin
              reg194 <= wire186[(4'ha):(2'h3)];
              reg195 <= $unsigned(({reg96[(1'h1):(1'h1)], $unsigned(wire94)} ?
                  (~(&reg97)) : (&($unsigned(reg97) && reg101[(4'ha):(4'h8)]))));
            end
        end
      else
        begin
          if ($unsigned($signed($unsigned($unsigned($unsigned(reg103))))))
            begin
              reg192 <= wire186;
              reg193 <= {(7'h44), (^$unsigned((|((8'hbe) == reg190))))};
            end
          else
            begin
              reg192 <= ((&wire105[(4'hc):(1'h0)]) > $signed(($signed(reg103) + $signed((wire1 | reg102)))));
              reg193 <= {((reg103[(2'h2):(1'h1)] ~^ ($signed((8'hbe)) && {reg101,
                      wire106})) * {$unsigned({wire3, reg103}),
                      reg103[(4'hd):(3'h7)]})};
            end
          reg194 <= $signed(({{(reg102 ? reg190 : (8'hb1)), (!reg192)},
              wire100[(3'h4):(2'h2)]} - ($signed((!reg97)) ?
              {(8'ha8)} : (8'hb7))));
        end
    end
  assign wire196 = $signed((wire186[(3'h6):(1'h1)] ?
                       {$signed((wire186 ? reg195 : reg193)),
                           $signed((~wire100))} : ($unsigned(reg97) ?
                           $signed($signed(wire99)) : ($signed(wire0) < $unsigned(wire187)))));
  module107 #() modinst198 (wire197, clk, wire3, reg191, wire184, reg102, reg98);
  assign wire199 = wire0[(1'h1):(1'h0)];
  assign wire200 = {$unsigned(wire186), (^~$signed((8'hb3)))};
  assign wire201 = {reg103,
                       $signed($unsigned($unsigned((reg103 ?
                           (8'ha9) : (8'hb9)))))};
endmodule

module module107
#(parameter param182 = ((((((8'hab) ? (8'hbb) : (8'hbe)) ? ((8'ha7) ? (8'ha6) : (8'hbf)) : (^~(8'h9d))) ? (((8'ha9) == (8'h9d)) ? ((7'h44) & (7'h44)) : {(8'ha7), (8'hb4)}) : {((8'hab) ? (8'haf) : (8'hb2))}) ? ((^(-(8'hb9))) - (~^((8'h9c) ? (8'hb5) : (7'h42)))) : (&((~(7'h40)) < ((8'hbb) ? (8'ha0) : (8'haf))))) ? (|{((^(7'h42)) | ((8'ha2) ? (8'hb7) : (8'ha1))), (~(~&(7'h41)))}) : ((({(8'had)} ? ((8'h9c) ? (8'ha3) : (8'ha6)) : (&(8'h9f))) ? {(+(7'h42))} : (((8'ha3) ? (8'hbf) : (8'haf)) ^~ ((8'hb7) ? (8'hb4) : (8'hb6)))) ? (({(8'ha1), (8'haa)} < (|(8'ha3))) ? (((8'ha4) ? (7'h43) : (8'ha8)) == ((8'hae) <= (8'hb6))) : ({(8'hb7)} ? ((8'ha7) ^~ (8'h9f)) : ((8'hab) ? (8'hbf) : (8'hbf)))) : (^(((8'ha8) ? (8'had) : (8'hb8)) < ((8'hb6) ? (8'h9c) : (8'ha2)))))), 
parameter param183 = (~&(param182 & param182)))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire112;
  input wire [(4'hb):(1'h0)] wire111;
  input wire signed [(5'h13):(1'h0)] wire110;
  input wire [(3'h7):(1'h0)] wire109;
  input wire [(3'h6):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire181;
  wire signed [(3'h7):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire179;
  wire signed [(4'he):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire172;
  wire signed [(2'h2):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire142;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire155;
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire172,
                 wire158,
                 wire157,
                 wire126,
                 wire130,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire155,
                 reg128,
                 reg129,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 (1'h0)};
  module113 #() modinst127 (wire126, clk, wire110, wire111, wire109, wire112, wire108);
  always
    @(posedge clk) begin
      reg128 <= (wire111 ?
          ($signed(wire109[(3'h7):(2'h3)]) << (8'hbf)) : (({(~^wire109)} ?
              $unsigned($unsigned(wire110)) : (((8'ha1) * wire111) ?
                  (!wire112) : $signed((8'hb8)))) <= $signed((~(wire111 ?
              (8'hab) : wire110)))));
    end
  always
    @(posedge clk) begin
      reg129 <= (wire111 | wire111[(3'h4):(1'h0)]);
    end
  assign wire130 = wire109;
  always
    @(posedge clk) begin
      reg131 <= $unsigned((^wire109));
      reg132 <= reg129[(3'h4):(1'h1)];
      reg133 <= ((~&$signed((|$signed(wire111)))) ?
          ((({wire109, reg131} ?
              (wire109 ?
                  wire108 : wire130) : {(8'hab)}) >>> $unsigned($unsigned(wire108))) < (reg132[(1'h0):(1'h0)] ?
              wire108 : wire126)) : (^~$unsigned(wire111)));
      if ($signed(wire109))
        begin
          reg134 <= {($unsigned($signed((~&wire108))) > reg131[(4'he):(2'h2)])};
        end
      else
        begin
          if ((8'ha2))
            begin
              reg134 <= $signed(wire112[(2'h3):(1'h0)]);
              reg135 <= wire130[(3'h7):(3'h5)];
              reg136 <= ($signed((^~(+((8'hb6) | wire126)))) ?
                  wire110 : reg134);
            end
          else
            begin
              reg134 <= (^~$unsigned($signed($unsigned(((8'hbe) ?
                  (7'h44) : reg134)))));
              reg135 <= $unsigned(($unsigned(reg134) & {(!(^~reg132)),
                  ((reg136 ? wire110 : wire126) ? $signed(reg129) : wire108)}));
              reg136 <= ((wire111 ~^ (((~(8'hb4)) != $unsigned((8'ha2))) ?
                  $signed($signed(wire110)) : $unsigned(wire112))) || $signed(wire111[(1'h1):(1'h0)]));
              reg137 <= ((reg131 ?
                      $unsigned(reg131) : (~^$unsigned({reg134, reg128}))) ?
                  (reg136[(1'h1):(1'h0)] ?
                      ($unsigned(wire110) >>> wire109[(3'h6):(3'h5)]) : wire126) : $signed($unsigned({$unsigned(reg134)})));
            end
        end
    end
  assign wire138 = ($signed($unsigned($unsigned($signed(reg135)))) != $signed(wire130));
  assign wire139 = $unsigned(((8'hb9) <= wire130[(4'hd):(4'hc)]));
  assign wire140 = ((^(reg135 < (^(wire138 < reg134)))) << $signed(($unsigned($signed(reg134)) ^ (reg135[(1'h1):(1'h1)] & wire126[(3'h5):(2'h2)]))));
  assign wire141 = {$signed((~{(wire140 ? reg134 : reg129)})),
                       $signed(wire138)};
  assign wire142 = (^~(~&$signed($unsigned(wire111[(2'h3):(1'h0)]))));
  assign wire143 = wire138;
  module144 #() modinst156 (.wire147(reg132), .wire149(reg131), .wire146(reg135), .wire148(wire126), .clk(clk), .y(wire155), .wire145(reg134));
  assign wire157 = reg133;
  assign wire158 = (8'hb3);
  module159 #() modinst173 (.y(wire172), .wire161(reg137), .wire163(reg135), .wire164(reg129), .wire160(wire130), .clk(clk), .wire162(wire155));
  assign wire174 = wire140;
  assign wire175 = ((8'hab) ?
                       $signed({(~&(~wire108))}) : reg132[(3'h5):(2'h3)]);
  assign wire176 = reg135[(5'h14):(4'hb)];
  assign wire177 = $unsigned(($signed($signed(wire126[(4'hd):(3'h6)])) ?
                       wire157[(1'h1):(1'h1)] : wire176[(3'h4):(2'h2)]));
  assign wire178 = (-reg133[(4'h8):(1'h1)]);
  assign wire179 = {$unsigned(wire157)};
  assign wire180 = wire176;
  assign wire181 = $unsigned((!($unsigned((wire108 ? wire176 : wire139)) ?
                       wire110[(3'h4):(1'h0)] : reg131)));
endmodule

module module4
#(parameter param92 = {{(((8'ha5) ? (&(8'had)) : (8'hbf)) >= (^~((8'h9d) ? (8'haa) : (8'ha1))))}, ((-(((8'hb7) < (8'hae)) ? (~&(8'ha6)) : ((8'ha3) ? (8'ha8) : (8'hbc)))) ? ((8'hb0) ? (!((8'hb4) ? (8'h9d) : (8'hb5))) : (((8'ha6) != (8'hb9)) == ((7'h43) ? (8'ha7) : (8'h9f)))) : (!(((8'ha0) ? (8'hae) : (8'hbe)) ? ((8'ha8) ? (8'haf) : (7'h41)) : {(8'ha5), (7'h44)})))}, 
parameter param93 = (((-(~&(+param92))) || param92) ? {(8'hb7)} : (-(!param92))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire85;
  assign y = {wire91, wire90, wire89, wire88, wire87, wire85, (1'h0)};
  module9 #() modinst86 (.clk(clk), .wire13(wire8), .wire10((8'hb7)), .wire11(wire6), .wire14(wire7), .wire12(wire5), .y(wire85));
  assign wire87 = $signed((&wire8[(3'h4):(2'h3)]));
  assign wire88 = wire87[(2'h3):(2'h2)];
  assign wire89 = $signed(wire8);
  assign wire90 = ($unsigned(($unsigned(wire5) >>> ((^~wire88) ?
                          $unsigned(wire8) : (wire5 != (8'had))))) ?
                      $signed($signed($signed($unsigned((8'hbd))))) : (wire85[(3'h5):(3'h5)] ?
                          $unsigned({(!wire5),
                              $unsigned(wire8)}) : $unsigned(($signed(wire89) ?
                              (8'h9d) : ((8'hb6) <<< wire87)))));
  assign wire91 = {wire6[(4'hd):(3'h6)],
                      (~^{(^(wire6 * (8'ha3))),
                          ({wire90, wire8} ? $unsigned(wire85) : wire8)})};
endmodule

module module9
#(parameter param84 = (&(8'ha5)))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h2ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  assign y = {wire65,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire15,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg18,
                 (1'h0)};
  assign wire15 = $unsigned(($unsigned($signed(wire12[(4'h9):(4'h9)])) && wire10[(4'h8):(3'h5)]));
  assign wire16 = $signed({(&wire10)});
  assign wire17 = $signed(wire10[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg18 <= $unsigned((!(wire16[(3'h6):(2'h2)] ?
          wire16 : wire10[(4'h8):(1'h0)])));
    end
  assign wire19 = $unsigned(((($signed((8'ha0)) ?
                          $unsigned(wire15) : (wire15 && reg18)) ^~ ($unsigned(wire16) ?
                          $signed(wire10) : wire12)) ?
                      (!$unsigned(wire15)) : $unsigned($signed(wire17[(4'hf):(4'he)]))));
  assign wire20 = wire15[(3'h4):(2'h3)];
  assign wire21 = {wire14};
  always
    @(posedge clk) begin
      reg22 <= (wire17[(4'hd):(2'h2)] ?
          $signed(wire20) : wire12[(3'h6):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg23 <= $signed({reg18});
      if ($signed(wire15))
        begin
          reg24 <= wire11[(1'h1):(1'h0)];
          reg25 <= (&wire17[(3'h6):(1'h1)]);
        end
      else
        begin
          reg24 <= reg24[(4'hc):(2'h2)];
          if (reg25)
            begin
              reg25 <= $unsigned($signed(wire10[(4'h8):(3'h6)]));
              reg26 <= reg25[(1'h1):(1'h1)];
              reg27 <= wire11;
            end
          else
            begin
              reg25 <= ({wire13[(1'h1):(1'h0)]} <<< (~$unsigned($signed((!reg23)))));
              reg26 <= (reg23 | $unsigned((reg25[(4'hd):(4'hd)] & (^(^wire17)))));
              reg27 <= (reg23 ? wire21[(1'h0):(1'h0)] : reg27[(4'ha):(3'h5)]);
              reg28 <= (($unsigned(((-wire20) <<< wire11[(2'h3):(2'h3)])) ?
                      reg24 : {$signed(reg23), wire10[(3'h6):(3'h6)]}) ?
                  ($signed({wire20, (-wire10)}) ?
                      $unsigned({(wire17 == wire13)}) : $signed(((+wire21) ?
                          wire15[(3'h4):(2'h3)] : $signed((7'h40))))) : $unsigned($unsigned((-$unsigned((7'h44))))));
              reg29 <= ((|wire11) ?
                  $unsigned(wire16[(3'h5):(1'h0)]) : $unsigned(((^~$signed(wire14)) * ((wire12 | wire15) ^~ (wire13 ?
                      (7'h40) : reg22)))));
            end
          reg30 <= (~^wire17);
          reg31 <= reg30;
          if (reg28)
            begin
              reg32 <= wire19;
              reg33 <= ($unsigned(((^~$signed(wire16)) ~^ (|$unsigned(reg25)))) + (8'ha5));
              reg34 <= wire10[(3'h7):(1'h0)];
              reg35 <= {(8'ha4),
                  (wire13[(3'h7):(2'h3)] ?
                      $signed(reg32[(2'h2):(2'h2)]) : {($unsigned((8'hab)) ?
                              wire21[(2'h2):(2'h2)] : {wire14, (8'hab)})})};
            end
          else
            begin
              reg32 <= ($unsigned((($signed(wire21) ?
                          (reg34 ? (8'hb3) : reg35) : (-(8'hb0))) ?
                      ($signed(wire12) ?
                          $unsigned(wire11) : {wire17}) : (wire17 == (!reg31)))) ?
                  $unsigned((8'hb9)) : (^~reg18[(3'h7):(1'h1)]));
              reg33 <= reg28[(3'h6):(3'h4)];
              reg34 <= (^~wire15[(3'h5):(3'h5)]);
              reg35 <= $unsigned((~|$signed(wire16[(3'h6):(3'h6)])));
              reg36 <= {($signed((~&{reg28,
                      (8'hbc)})) >>> ($signed({wire10}) != (^~(wire16 + wire15)))),
                  wire10};
            end
        end
      reg37 <= reg34[(4'ha):(4'h9)];
      if ((8'hae))
        begin
          reg38 <= ($signed({(wire14[(3'h5):(2'h3)] + {reg18,
                  reg28})}) == ($unsigned((reg18 ~^ (wire10 || (8'haf)))) ?
              ($signed((reg22 ? reg25 : wire16)) ?
                  (reg37[(2'h3):(2'h2)] & $signed(reg36)) : (8'hbb)) : $unsigned({(^reg32)})));
        end
      else
        begin
          if ({$signed(($signed((wire10 ?
                  reg34 : wire15)) > $unsigned($unsigned(wire21)))),
              $signed((^($unsigned(reg28) < (wire13 <= wire14))))})
            begin
              reg38 <= $signed(($signed((^~(reg25 <= reg33))) ?
                  {$unsigned($signed((8'ha8)))} : ((^~((8'hae) >= (8'h9c))) - reg18)));
            end
          else
            begin
              reg38 <= $signed((reg35 && (8'ha2)));
              reg39 <= ({{(reg25[(3'h7):(3'h6)] >= wire15),
                      wire16[(4'h8):(1'h0)]},
                  (+reg38[(3'h7):(3'h7)])} ^~ {$signed(($signed(reg28) << reg18)),
                  ($signed($unsigned(wire20)) - $unsigned((~reg23)))});
            end
          if ({reg30[(3'h7):(1'h0)]})
            begin
              reg40 <= $unsigned((~^{wire16}));
              reg41 <= reg39[(4'h8):(2'h2)];
            end
          else
            begin
              reg40 <= (reg33[(2'h2):(1'h1)] | $signed(reg31[(3'h4):(1'h1)]));
              reg41 <= {((8'had) ? reg18[(3'h4):(1'h1)] : reg18), reg24};
              reg42 <= ($unsigned((|wire13[(4'hb):(1'h0)])) != $unsigned(reg28));
              reg43 <= wire21[(3'h4):(2'h2)];
            end
          reg44 <= (~wire11);
        end
      reg45 <= $signed(((&wire15) >>> wire11[(2'h2):(2'h2)]));
    end
  assign wire46 = $unsigned((&(~^wire11[(2'h3):(1'h0)])));
  assign wire47 = ((({{reg43, reg31}, (~^reg44)} - $signed((^~(8'hb8)))) ?
                          ((((8'hbd) + wire20) ?
                                  (+(8'ha0)) : (wire11 ? reg33 : (8'ha7))) ?
                              ((&reg28) ?
                                  (7'h43) : {reg37,
                                      (8'hbc)}) : $signed(reg23)) : $unsigned($unsigned($signed(wire14)))) ?
                      reg43[(1'h1):(1'h0)] : $unsigned(($signed((~|reg41)) >>> $signed(reg38))));
  assign wire48 = (&(&(reg23[(1'h1):(1'h1)] ?
                      ($signed(reg38) << ((8'hb0) > (8'haa))) : ($signed(wire14) ?
                          {reg26} : reg33))));
  assign wire49 = reg37;
  assign wire50 = $unsigned($unsigned((((reg40 && reg37) ?
                      $signed((8'hb1)) : $signed(wire14)) - ((wire14 ?
                      reg39 : reg36) != (wire47 <= wire15)))));
  assign wire51 = $unsigned((~$signed(($signed(wire16) <= (wire48 ?
                      reg23 : wire16)))));
  always
    @(posedge clk) begin
      reg52 <= (8'ha8);
      if ((-(~&wire17[(5'h11):(3'h4)])))
        begin
          if ($unsigned(((-($unsigned(reg26) - (reg43 ? wire46 : wire50))) ?
              reg30 : $signed(reg43))))
            begin
              reg53 <= $signed(((|(^~{wire21})) ?
                  reg23 : (wire12[(4'hf):(4'hf)] >> $signed((wire11 ^ reg52)))));
              reg54 <= (wire13 ~^ (reg31[(1'h1):(1'h1)] <<< ($unsigned($signed(reg39)) <= reg34)));
            end
          else
            begin
              reg53 <= $unsigned($unsigned(reg38[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg53 <= ($unsigned(($unsigned(wire51) - {$signed(wire47)})) ?
              (8'ha8) : $unsigned({(^~$signed((8'h9f))),
                  ((reg37 <= reg22) >= (+reg39))}));
          reg54 <= (reg18 + reg32);
          reg55 <= ((($signed(wire20[(4'hd):(4'hd)]) < {$unsigned(wire20),
                      (^(8'ha8))}) ?
                  ($unsigned(reg28) != (~$signed(wire12))) : $unsigned($unsigned($unsigned(reg29)))) ?
              $signed((|{(8'hba),
                  (wire20 ?
                      reg53 : (8'h9f))})) : $signed($unsigned({(reg38 ^ (7'h41)),
                  {wire47}})));
          reg56 <= $signed(reg43[(4'hc):(4'h9)]);
          reg57 <= $unsigned((!(&$unsigned(reg36))));
        end
      reg58 <= (^~((($unsigned(reg52) << reg38) ?
          ($unsigned(reg18) ?
              {wire10} : reg42[(3'h4):(1'h1)]) : reg30[(3'h7):(1'h0)]) > {wire12,
          $signed($signed(reg37))}));
      reg59 <= $unsigned(($signed(($signed(reg42) ?
          wire21 : (wire47 ? reg43 : reg29))) == (^($unsigned(reg22) ?
          wire51 : $signed(wire13)))));
    end
  always
    @(posedge clk) begin
      reg60 <= (!({reg25, $signed(reg27)} == (reg59 ?
          reg58 : $signed((reg40 <= wire50)))));
      reg61 <= $unsigned((($unsigned($unsigned((7'h41))) ?
              wire14 : ($signed(wire11) && ((8'hb2) ? wire20 : wire49))) ?
          reg26 : ((reg18 - wire19) >>> wire12)));
      reg62 <= $signed((8'ha9));
      reg63 <= (reg18[(1'h1):(1'h0)] ?
          ((reg33 < ($unsigned(wire16) ?
                  reg43[(4'hd):(3'h4)] : (reg34 >= reg56))) ?
              reg36 : ((^~reg62) ^~ ($signed(wire49) ^~ $unsigned((8'ha4))))) : (+(((reg59 ?
              reg58 : wire48) ^ ((8'h9c) ^~ reg38)) == wire50[(4'h9):(3'h5)])));
      reg64 <= ((|(($signed(reg29) ? (8'hb6) : reg33[(1'h1):(1'h1)]) ?
              (8'haa) : wire16[(4'h9):(2'h2)])) ?
          ((reg59[(4'h9):(1'h1)] <<< wire17) == ({$signed(reg57),
              (wire46 ? reg38 : wire50)} & {reg31})) : {reg18});
    end
  assign wire65 = $unsigned($unsigned((8'ha4)));
  always
    @(posedge clk) begin
      reg66 <= $signed((8'hb5));
      reg67 <= {{(wire12[(3'h5):(1'h0)] ? wire17[(2'h2):(1'h1)] : (&(8'ha5)))},
          ({(8'hbf), reg24} <<< reg55)};
      reg68 <= (((wire17 ? $signed((|wire47)) : $signed(reg25[(2'h3):(1'h0)])) ?
              wire13 : ($signed((reg36 ~^ reg40)) & reg36)) ?
          reg39[(4'ha):(2'h2)] : ((reg33 + reg22[(1'h1):(1'h1)]) ?
              (^(((8'hb5) > wire11) ?
                  (reg27 ?
                      reg37 : reg42) : $unsigned(wire17))) : $signed((&$signed(wire47)))));
      if ((&((~&(reg30 + (-reg57))) || (&reg31[(1'h0):(1'h0)]))))
        begin
          reg69 <= (~reg34);
        end
      else
        begin
          if (reg40[(4'h8):(4'h8)])
            begin
              reg69 <= (7'h43);
              reg70 <= {(({(reg60 >>> wire46)} == ((wire13 * wire47) ?
                      $signed(wire15) : reg57[(3'h6):(3'h6)])) ^ $signed((8'hbf))),
                  reg44[(2'h2):(1'h0)]};
            end
          else
            begin
              reg69 <= $unsigned(reg40[(4'hf):(3'h5)]);
              reg70 <= $signed({$signed(reg39[(4'h8):(2'h3)])});
              reg71 <= (-reg25[(4'h9):(3'h5)]);
              reg72 <= (($unsigned(reg63[(5'h10):(3'h5)]) ?
                      (reg58[(1'h0):(1'h0)] ?
                          $signed($signed(wire20)) : ((~(7'h44)) - reg66[(2'h3):(1'h0)])) : wire21) ?
                  $signed($unsigned(wire16)) : ((!reg53[(2'h3):(2'h2)]) ?
                      $signed({(~^reg40),
                          reg56[(1'h1):(1'h0)]}) : ($signed({reg68}) ?
                          reg44[(2'h3):(2'h2)] : reg54[(4'hb):(1'h1)])));
              reg73 <= $unsigned((~reg35[(3'h7):(3'h5)]));
            end
          if (reg30[(3'h6):(2'h3)])
            begin
              reg74 <= $signed($signed($signed((~$unsigned(reg30)))));
              reg75 <= wire15;
              reg76 <= (wire49 ?
                  $signed($unsigned(((~(8'had)) ?
                      (7'h44) : $signed(reg38)))) : $signed((~|{reg56})));
            end
          else
            begin
              reg74 <= (reg32[(1'h0):(1'h0)] ?
                  ((~&(reg43[(4'hf):(4'ha)] ? reg32 : reg73[(3'h5):(1'h0)])) ?
                      {$signed($signed((8'hb1)))} : (reg76 ?
                          $signed((8'ha3)) : wire21[(2'h3):(1'h1)])) : reg36[(4'h8):(1'h0)]);
              reg75 <= (~($signed({$signed(wire50),
                  wire16}) >>> ($signed(((8'ha7) <= reg22)) * ((wire17 ?
                      reg27 : (7'h40)) ?
                  (wire21 ^ wire14) : $unsigned(wire46)))));
              reg76 <= {wire21[(1'h0):(1'h0)],
                  (!$unsigned(wire47[(1'h1):(1'h1)]))};
              reg77 <= (((~&wire48[(4'h9):(3'h7)]) ?
                  (~reg30[(3'h6):(3'h5)]) : {((reg28 + reg62) ?
                          (reg36 + reg24) : (reg27 > reg39)),
                      $signed(wire47[(4'hd):(3'h6)])}) || {((wire13 ?
                          $signed(reg74) : (wire50 << (8'hbd))) ?
                      reg23 : $unsigned($signed((8'ha4)))),
                  (~^((reg72 <= reg44) ?
                      reg22[(3'h7):(1'h0)] : $signed(reg59)))});
            end
          if (reg55[(3'h5):(2'h3)])
            begin
              reg78 <= ($unsigned((((reg31 >= reg26) ?
                  (wire51 <<< reg40) : ((8'ha3) & reg36)) >>> $signed(wire11[(2'h3):(1'h1)]))) - $unsigned((wire12 ?
                  ({(8'had)} ?
                      $signed(wire65) : $unsigned((8'h9c))) : (8'h9f))));
              reg79 <= $signed({(|$unsigned($signed(wire15))),
                  $signed($signed((reg54 && reg27)))});
            end
          else
            begin
              reg78 <= {reg22[(2'h3):(2'h2)]};
              reg79 <= ($unsigned((+({reg56} <= (!(7'h43))))) ?
                  $unsigned($unsigned($signed((8'hab)))) : (~$unsigned((!(+reg72)))));
              reg80 <= $signed(wire49);
              reg81 <= $signed($signed({$signed((reg68 > wire50))}));
              reg82 <= $signed(($signed($unsigned(reg55[(3'h4):(3'h4)])) ^~ $unsigned($unsigned(reg61))));
            end
        end
      reg83 <= $signed($unsigned((&{(reg75 ? (7'h40) : reg52)})));
    end
endmodule

module module159
#(parameter param171 = ((^~((((8'ha6) == (8'had)) + ((8'ha6) ^ (8'hb3))) ? {(8'hb7)} : (((8'hb4) ~^ (8'hbf)) ? ((8'hbe) ? (8'hb6) : (8'ha5)) : (^~(8'hb6))))) ~^ ((~^(((8'hbd) ? (8'hb0) : (7'h40)) ~^ {(8'hb8)})) >>> (((+(8'hac)) >= {(8'hb4)}) << (((8'hbf) >> (8'hb1)) >>> ((8'ha4) > (8'hab)))))))
(y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire164;
  input wire signed [(4'hd):(1'h0)] wire163;
  input wire signed [(5'h11):(1'h0)] wire162;
  input wire [(3'h6):(1'h0)] wire161;
  input wire [(3'h4):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire168;
  wire [(3'h6):(1'h0)] wire167;
  wire signed [(4'he):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire165;
  assign y = {wire170, wire169, wire168, wire167, wire166, wire165, (1'h0)};
  assign wire165 = $unsigned((~|(wire161[(1'h1):(1'h1)] <<< (-((8'ha6) ~^ wire160)))));
  assign wire166 = $signed((8'hb7));
  assign wire167 = $unsigned({(8'hab),
                       (({wire160} >>> $signed(wire166)) ?
                           ((wire165 ? wire164 : (7'h41)) ?
                               (!wire160) : $signed(wire166)) : (~|(wire164 + wire164)))});
  assign wire168 = (wire166 ?
                       (~(((wire160 >> wire162) ?
                           {(8'ha6),
                               (8'ha8)} : $unsigned(wire165)) + (~|wire160[(2'h3):(1'h0)]))) : ((~&($unsigned((8'hb0)) | $signed(wire160))) ?
                           {({wire166} ?
                                   (+wire160) : (wire165 ?
                                       wire167 : wire167))} : wire160));
  assign wire169 = wire161[(1'h1):(1'h1)];
  assign wire170 = (wire168[(1'h0):(1'h0)] | (($signed((wire160 <<< wire163)) - ((wire166 ?
                       (8'hbf) : (8'ha0)) + (wire166 ?
                       wire160 : wire161))) == ((~&(8'hae)) != $signed($signed(wire168)))));
endmodule

module module144
#(parameter param154 = (({{{(8'h9d)}, ((8'hb0) * (8'hae))}} ? ((~{(8'h9d)}) ? (((8'hbc) > (7'h41)) ? (+(8'h9e)) : (~|(8'hae))) : (((7'h44) ? (8'hb5) : (7'h41)) ? ((8'ha5) == (8'hae)) : ((8'hbc) ? (8'ha0) : (8'hb2)))) : {(((8'hb3) ? (8'haf) : (8'ha7)) <= {(8'h9f), (8'ha0)}), {(|(8'hb4)), ((8'hb5) ? (8'h9c) : (8'ha5))}}) ? (({{(8'h9f), (8'h9d)}, ((8'hb3) >= (8'h9e))} ? (((8'ha4) ^~ (8'hb5)) > ((8'hb2) ? (8'hb9) : (8'ha1))) : (((8'hbd) | (8'hb6)) ? {(7'h42)} : (~|(8'ha8)))) ^ (|((8'h9c) ? ((8'ha9) ^~ (8'hb6)) : {(7'h40), (8'hb5)}))) : ((&(8'hae)) == (((+(8'hac)) ? {(8'hb4), (8'hb7)} : {(8'ha3), (8'hb7)}) + (~^(^~(8'hb5)))))))
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire149;
  input wire signed [(3'h5):(1'h0)] wire148;
  input wire [(4'h8):(1'h0)] wire147;
  input wire signed [(2'h2):(1'h0)] wire146;
  input wire signed [(5'h14):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  assign y = {wire153, wire152, wire151, wire150, (1'h0)};
  assign wire150 = (($unsigned(wire148[(1'h1):(1'h1)]) >>> wire146) ?
                       wire146 : wire145);
  assign wire151 = ($unsigned(wire145) ? wire149 : wire145);
  assign wire152 = (wire147[(1'h1):(1'h1)] ?
                       (($signed(wire148[(1'h1):(1'h0)]) << {(wire147 ?
                               wire151 : wire151)}) & wire149) : (($unsigned((wire146 - wire149)) | ((~(8'hb6)) == $signed(wire146))) >>> {{$unsigned((7'h41)),
                               $signed(wire151)}}));
  assign wire153 = $unsigned(wire150[(3'h5):(2'h3)]);
endmodule

module module113
#(parameter param125 = ((({((8'hbc) ^~ (7'h41))} ? (~&((8'hb9) >>> (8'hb0))) : (|((8'hb4) > (8'hb5)))) != (8'ha2)) + (^((((8'hbf) << (8'hb6)) - ((8'hb5) ? (8'hbd) : (8'h9f))) * (8'ha9)))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire118;
  input wire signed [(3'h5):(1'h0)] wire117;
  input wire signed [(3'h7):(1'h0)] wire116;
  input wire signed [(2'h2):(1'h0)] wire115;
  input wire signed [(3'h6):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  assign y = {wire124, wire123, wire122, wire121, wire120, wire119, (1'h0)};
  assign wire119 = {(+((|(wire116 < wire115)) << $unsigned($unsigned((7'h40)))))};
  assign wire120 = {((wire118 ? wire116 : $signed($unsigned(wire114))) ?
                           {$signed((wire115 * wire118)),
                               (8'ha0)} : $signed($signed((~&wire115)))),
                       wire116};
  assign wire121 = ($unsigned(wire114) ~^ $signed(wire118));
  assign wire122 = wire120[(5'h14):(4'hf)];
  assign wire123 = wire114[(1'h1):(1'h0)];
  assign wire124 = $unsigned((($unsigned(((8'h9e) ? (8'hab) : wire116)) ?
                           (-(wire117 ? wire116 : wire123)) : (7'h41)) ?
                       wire123 : (((wire114 ?
                               wire117 : wire123) ^ $signed(wire114)) ?
                           wire123[(2'h2):(1'h1)] : (8'haf))));
endmodule
