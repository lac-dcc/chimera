module top
#(parameter param161 = (((({(8'h9f)} ? ((7'h40) ? (8'hb5) : (8'hb8)) : ((8'ha8) ? (8'hb1) : (8'hb1))) ? (!(&(8'ha6))) : ({(8'hb5)} >= (~^(8'hbf)))) ~^ ((8'ha9) ? {((8'ha1) ? (8'haf) : (8'h9c))} : ((-(8'ha1)) ? {(7'h41)} : (8'hb0)))) * (((((8'haa) ? (8'hb2) : (8'hb5)) + ((8'ha9) ? (8'hba) : (8'hba))) ? (((7'h42) || (8'hbe)) + {(7'h41)}) : (((8'hba) ? (8'hb1) : (8'hb0)) << ((8'h9f) ? (8'hb1) : (8'h9d)))) ? ((((8'hae) <<< (8'h9d)) ? ((8'ha4) ? (8'hb9) : (8'hb1)) : ((8'hab) <<< (8'h9f))) >= (-{(8'haa), (8'hb2)})) : ((((8'had) ? (8'hb7) : (7'h40)) ? {(8'ha5)} : {(8'ha7), (8'h9d)}) ? ({(8'hba)} >> (8'hb9)) : (^(+(8'hbe)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  wire signed [(3'h5):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire159;
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire21,
                 wire159,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $signed((((^wire3) ?
                     $signed(wire3) : wire0) < (^~$signed((wire0 >= wire1)))));
  assign wire5 = wire4[(3'h4):(3'h4)];
  assign wire6 = wire4[(2'h2):(2'h2)];
  assign wire7 = (($unsigned((|(wire5 ?
                         (8'hab) : wire4))) ^ $signed((wire2[(5'h13):(5'h11)] ?
                         $unsigned(wire3) : (wire2 ^~ wire4)))) ?
                     wire4 : (+$unsigned($unsigned((wire5 + wire2)))));
  always
    @(posedge clk) begin
      reg8 <= (wire1[(1'h1):(1'h1)] ?
          (~|wire0) : {wire4[(3'h5):(1'h0)], (~wire4[(2'h3):(1'h1)])});
      reg9 <= $unsigned(wire0[(3'h4):(1'h0)]);
      reg10 <= {($signed(wire1[(3'h4):(2'h3)]) ^~ $signed($unsigned({wire0}))),
          reg9};
      reg11 <= $unsigned((^~(($unsigned(wire5) * wire4[(2'h2):(2'h2)]) | {$signed(wire3),
          (^~wire4)})));
      if (($signed(reg9) | $signed({$signed(wire4[(2'h3):(1'h1)]),
          $unsigned({wire3})})))
        begin
          reg12 <= {$signed($signed(wire3))};
          reg13 <= $signed($unsigned({({wire2} ?
                  {wire4, reg8} : (reg9 ? wire1 : (8'hbd)))}));
          if ((({(~^wire7), ((wire3 ^ (8'ha5)) <<< wire2)} * (({(7'h41),
                      reg10} ?
                  reg9[(3'h7):(3'h7)] : $signed(reg13)) ?
              reg10 : ((wire2 ~^ reg13) ?
                  reg13 : $unsigned(wire5)))) < (8'ha9)))
            begin
              reg14 <= $signed($signed(wire6));
              reg15 <= $unsigned(reg10[(2'h2):(2'h2)]);
              reg16 <= {wire6};
              reg17 <= $signed($signed(wire5));
            end
          else
            begin
              reg14 <= wire0;
              reg15 <= $signed({(8'hb6),
                  $unsigned(($signed((8'hb7)) > $unsigned(reg8)))});
            end
          if ((|(8'h9c)))
            begin
              reg18 <= $unsigned((^((^reg10) ?
                  ((wire5 ? wire4 : wire7) ?
                      (reg8 ?
                          reg12 : reg13) : wire6[(4'ha):(1'h1)]) : wire4[(3'h5):(3'h4)])));
              reg19 <= (($unsigned((8'hb0)) + $signed(($unsigned(wire0) ?
                      $unsigned(reg9) : $signed(wire4)))) ?
                  $unsigned(((wire2[(4'h8):(3'h5)] >>> wire0) * wire2[(3'h5):(2'h3)])) : {{(reg14 * (reg16 ?
                              wire5 : reg18)),
                          $unsigned(wire2[(4'hd):(3'h4)])},
                      (7'h43)});
              reg20 <= reg17;
            end
          else
            begin
              reg18 <= $unsigned(wire3[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg12 <= (8'hac);
          reg13 <= {reg12, reg18};
          reg14 <= (8'ha3);
          reg15 <= (~|reg17);
        end
    end
  assign wire21 = ({$signed((8'hb7)), wire0} ? reg10 : wire0);
  module22 #() modinst160 (.wire26(wire0), .wire25(wire7), .clk(clk), .y(wire159), .wire23(wire6), .wire27(reg19), .wire24(reg17));
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire156;
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  assign y = {wire158,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire56,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire80,
                 wire156,
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
  assign wire28 = (({(!$unsigned(wire25)), (-(8'hb9))} ?
                      $unsigned(({wire27} ?
                          wire27[(1'h1):(1'h1)] : (+(8'hb7)))) : ($signed($signed((7'h43))) == wire25)) & (-wire25[(3'h6):(1'h0)]));
  assign wire29 = wire24;
  assign wire30 = $unsigned(wire26[(4'hf):(1'h0)]);
  assign wire31 = {$unsigned(wire23)};
  module32 #() modinst57 (wire56, clk, wire25, wire24, wire26, wire27);
  assign wire58 = (&wire23[(3'h5):(1'h0)]);
  assign wire59 = wire30[(3'h6):(1'h0)];
  assign wire60 = wire28[(4'hd):(4'hc)];
  assign wire61 = $unsigned(wire30[(1'h0):(1'h0)]);
  assign wire62 = wire23;
  assign wire63 = $unsigned(wire26[(2'h3):(2'h2)]);
  assign wire64 = (7'h42);
  assign wire65 = ($unsigned((8'hb4)) ?
                      wire64[(1'h0):(1'h0)] : (~^$signed((wire23[(3'h5):(1'h0)] ?
                          wire62[(2'h2):(1'h1)] : {wire23}))));
  assign wire66 = (|(wire26 ?
                      wire61 : (!((wire23 ^~ wire63) ?
                          wire62[(2'h2):(1'h0)] : $signed(wire63)))));
  always
    @(posedge clk) begin
      reg67 <= $unsigned({wire64});
      reg68 <= $unsigned((wire29 && ($unsigned((reg67 ?
          wire28 : wire30)) & wire62)));
      reg69 <= $unsigned(wire58[(4'h9):(1'h0)]);
      if ((^~(((~^((8'ha3) ? reg68 : wire23)) || (wire29 ?
              $unsigned(wire29) : (8'hac))) ?
          (-$signed(wire27[(4'ha):(3'h6)])) : (!$signed(((8'hba) ?
              (8'hac) : (8'haf)))))))
        begin
          if (wire29)
            begin
              reg70 <= $unsigned((wire65 ?
                  (((!wire31) != (wire27 - reg69)) ?
                      (&reg67[(3'h5):(3'h5)]) : (|(wire27 ^ (8'hb1)))) : wire27));
              reg71 <= $unsigned(((8'hb0) ?
                  ($signed(reg67[(3'h7):(3'h7)]) ?
                      (wire64[(4'h9):(2'h2)] ?
                          (reg67 ?
                              (8'ha4) : reg69) : (wire23 <= wire25)) : (-$signed(wire64))) : (wire28[(4'hf):(2'h3)] ~^ ((wire56 < wire66) ?
                      {(8'h9c), reg67} : $unsigned((8'haa))))));
            end
          else
            begin
              reg70 <= wire60[(1'h0):(1'h0)];
              reg71 <= $unsigned($signed((8'hb5)));
              reg72 <= {{($unsigned(wire65[(1'h0):(1'h0)]) * (~|wire24))},
                  ((reg67[(1'h1):(1'h1)] ^~ reg70[(4'h9):(3'h7)]) ?
                      wire30 : (((&wire29) - (wire27 << wire31)) >> {wire66[(4'hf):(4'h9)]}))};
              reg73 <= $signed((wire59 > (~|{(wire26 ? wire62 : wire56),
                  (wire66 ? reg69 : reg67)})));
            end
          reg74 <= {$signed((wire66 ?
                  (!{wire63}) : ((wire24 | wire26) >= wire63[(4'h8):(3'h6)]))),
              (~|($unsigned(wire60[(2'h2):(1'h1)]) != ((wire25 >> reg67) ?
                  (reg69 != wire23) : ((8'hb9) ^~ reg67))))};
          if (reg70)
            begin
              reg75 <= ((wire61[(1'h0):(1'h0)] - wire63) <<< ((wire66[(3'h5):(1'h0)] ~^ (8'hbb)) ?
                  $unsigned(wire58[(3'h5):(1'h1)]) : wire26));
              reg76 <= wire27[(3'h6):(1'h0)];
              reg77 <= reg72;
              reg78 <= $signed({(8'hba), wire26[(5'h10):(4'hf)]});
              reg79 <= wire64[(1'h0):(1'h0)];
            end
          else
            begin
              reg75 <= (reg69 <= (~^reg76));
            end
        end
      else
        begin
          if (reg77)
            begin
              reg70 <= wire25[(3'h6):(3'h6)];
              reg71 <= (wire63[(4'hd):(4'hb)] && ({(reg79[(3'h7):(3'h6)] ?
                      {reg76} : $signed(wire66)),
                  ((-wire31) | wire24)} && (+$unsigned($signed(wire26)))));
              reg72 <= wire27;
            end
          else
            begin
              reg70 <= wire63[(3'h4):(2'h2)];
            end
          reg73 <= {$unsigned((~^(!wire62[(4'hf):(2'h2)])))};
        end
    end
  assign wire80 = ((reg73[(4'hc):(1'h0)] << ((((8'ha6) <= wire58) ?
                          $signed(wire31) : reg76[(4'hc):(1'h0)]) != ((!reg74) ?
                          wire25[(1'h1):(1'h1)] : $signed(reg71)))) ?
                      (~({(reg71 ?
                              reg70 : (8'hb2))} <= (^~((8'hbb) > wire24)))) : $signed((~&(^(!reg70)))));
  module81 #() modinst157 (.clk(clk), .wire82(wire26), .wire85(wire27), .wire84(reg79), .y(wire156), .wire83(wire60), .wire86(reg70));
  assign wire158 = wire28;
endmodule

module module81
#(parameter param155 = ((((~((8'ha3) == (8'ha6))) ? (~|((8'h9e) ? (8'hbb) : (8'ha9))) : (~|{(8'h9d), (8'ha7)})) || (-(!(|(8'hbc))))) ? {({((8'hbf) ? (8'ha1) : (8'haa)), ((8'hb2) ^~ (8'had))} ? (((8'had) + (8'h9d)) & ((7'h44) != (8'hb1))) : (+((8'ha4) ? (8'h9f) : (8'hb1))))} : (((((8'hb3) & (8'h9f)) & ((8'hbd) ? (8'hbe) : (7'h42))) ? (^~((8'ha2) ^~ (8'ha2))) : (^~((8'ha7) >> (8'ha6)))) ? ((8'ha8) ? ((~&(8'hbc)) | {(7'h41)}) : {((7'h44) ? (8'ha5) : (8'ha6))}) : {(8'hb2)})))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h322):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire86;
  input wire signed [(3'h5):(1'h0)] wire85;
  input wire signed [(4'h9):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(5'h13):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire154,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
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
                 reg106,
                 reg105,
                 reg104,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire87 = ((wire82[(2'h2):(1'h0)] ^ wire85[(2'h2):(2'h2)]) ?
                      $unsigned((({wire86} << $signed(wire84)) * wire85)) : {$unsigned({$signed(wire82),
                              wire84})});
  assign wire88 = wire83[(2'h2):(2'h2)];
  assign wire89 = wire83[(3'h5):(1'h1)];
  assign wire90 = $signed(wire83[(3'h6):(2'h2)]);
  assign wire91 = (!wire89[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((wire82[(4'hc):(1'h1)] ?
          ((((~wire89) == wire82) ^ $unsigned($unsigned(wire90))) <<< wire90) : $signed((((wire85 >= wire87) != {wire82}) << wire90[(1'h1):(1'h1)]))))
        begin
          if (($signed(wire87[(2'h2):(1'h0)]) ?
              $signed(($unsigned((wire88 ? wire83 : wire90)) ?
                  $unsigned((^wire84)) : ((wire82 ? wire87 : wire85) ?
                      $signed((8'had)) : wire88))) : (~|wire86[(3'h4):(1'h0)])))
            begin
              reg92 <= ($unsigned($unsigned((wire90[(3'h6):(3'h6)] * wire87))) ?
                  {((~(8'hb7)) + $signed(wire83[(1'h0):(1'h0)]))} : $unsigned(wire85));
            end
          else
            begin
              reg92 <= wire85[(2'h2):(1'h0)];
              reg93 <= $unsigned((~^reg92[(3'h6):(1'h0)]));
            end
          reg94 <= wire89[(2'h2):(2'h2)];
          if ((reg94 ?
              $unsigned($signed(((&wire86) && wire85[(3'h4):(2'h3)]))) : ((+$unsigned(wire91[(3'h6):(1'h1)])) * (!$unsigned((!reg94))))))
            begin
              reg95 <= reg94;
              reg96 <= $unsigned($signed((|(&(8'ha7)))));
              reg97 <= $unsigned(wire88);
              reg98 <= reg96[(3'h6):(1'h1)];
              reg99 <= wire82[(3'h6):(3'h6)];
            end
          else
            begin
              reg95 <= ({reg96} + wire86[(4'hd):(3'h5)]);
              reg96 <= wire85;
              reg97 <= (~(wire87 ^ $unsigned(reg92)));
            end
        end
      else
        begin
          reg92 <= $unsigned((&reg93));
          reg93 <= ((8'hb6) & ({{(wire89 ? wire90 : reg98)}} ?
              $signed($unsigned((~reg92))) : $signed(((reg94 ?
                  wire87 : wire86) << (^~reg95)))));
        end
    end
  assign wire100 = $signed(reg98);
  assign wire101 = {(|($signed(reg93) + (~^(wire88 > wire84))))};
  assign wire102 = $signed({(^~$signed(reg98[(2'h2):(2'h2)]))});
  assign wire103 = ((($signed($signed(wire85)) ^ ((reg93 ? (7'h43) : wire84) ?
                           (wire102 <<< wire90) : ((8'ha4) < reg98))) != $signed(wire89)) ?
                       reg98[(4'h8):(3'h7)] : (&(-reg99[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg104 <= wire84;
      reg105 <= ((!{wire87[(1'h0):(1'h0)]}) ?
          $signed(((reg98[(4'he):(4'h8)] ?
              (wire100 ? reg104 : (8'hb7)) : (wire101 ?
                  wire87 : wire88)) >= (~&reg98[(3'h5):(3'h4)]))) : $signed(((wire83[(2'h2):(1'h0)] | (wire87 != wire82)) ?
              $unsigned((wire83 ?
                  reg98 : wire100)) : (wire103[(1'h0):(1'h0)] + (wire84 ?
                  reg104 : wire83)))));
      reg106 <= $signed({reg98[(3'h4):(2'h3)], wire88});
    end
  assign wire107 = ((!{(wire100 + {wire88}),
                       reg93[(4'hc):(4'hc)]}) < (wire82 ~^ {wire100,
                       $signed((^reg104))}));
  assign wire108 = $unsigned((8'haa));
  assign wire109 = wire103;
  assign wire110 = {wire84[(1'h1):(1'h1)],
                       $unsigned($unsigned((reg99 <<< (~&wire84))))};
  assign wire111 = $unsigned($signed(reg96));
  assign wire112 = (~^wire85[(2'h3):(1'h0)]);
  assign wire113 = reg93[(3'h6):(2'h3)];
  assign wire114 = reg97;
  assign wire115 = $unsigned((8'ha6));
  always
    @(posedge clk) begin
      reg116 <= $signed(wire100[(4'h8):(3'h4)]);
      if (reg116[(4'hf):(3'h4)])
        begin
          if (reg93)
            begin
              reg117 <= (|(&((-$signed(wire101)) - (reg94[(4'ha):(4'ha)] ?
                  (^wire83) : {wire89, (7'h42)}))));
              reg118 <= (~&(8'ha7));
              reg119 <= ({($unsigned((^~reg104)) ?
                      (8'hae) : ($signed(wire100) ?
                          reg106 : wire83[(3'h5):(1'h1)]))} < (reg97 ?
                  wire107 : {(((8'hb1) >= reg97) ?
                          $signed((8'hb3)) : (^wire101)),
                      ((^~wire84) != $unsigned(wire82))}));
              reg120 <= wire89[(1'h1):(1'h0)];
              reg121 <= (8'hab);
            end
          else
            begin
              reg117 <= wire89[(1'h1):(1'h0)];
              reg118 <= (((reg95 ? reg104 : wire91[(3'h7):(2'h2)]) ?
                      reg93[(4'hd):(4'hb)] : $unsigned($unsigned(wire113))) ?
                  $signed((((reg105 - wire112) ?
                          $signed(reg118) : $unsigned(reg92)) ?
                      $signed({wire102,
                          reg119}) : (~&(reg99 >>> wire101)))) : $signed($signed(wire114[(5'h11):(1'h0)])));
              reg119 <= (({wire115[(2'h3):(2'h3)],
                      ($signed(wire84) != (!(8'ha0)))} ?
                  wire85 : (&(8'hb8))) + (($signed(reg116) ?
                  {wire84[(1'h1):(1'h1)],
                      $unsigned(wire113)} : ($signed(wire100) ^~ (~|reg98))) << reg97));
              reg120 <= $signed($unsigned((~&((8'hac) <= {reg97}))));
              reg121 <= {(+(^~wire111[(5'h10):(3'h5)]))};
            end
          reg122 <= ($signed($signed({((8'hb7) || reg106),
              {wire86, reg105}})) & (($unsigned($unsigned(reg104)) ?
              (~&$unsigned(wire113)) : reg95) >= wire82));
          reg123 <= $unsigned(wire103);
          reg124 <= (!$signed((~(!$unsigned(wire100)))));
          reg125 <= $unsigned($unsigned(($unsigned(((7'h44) ? reg105 : reg97)) ?
              (+(wire107 - reg96)) : {(wire102 ? reg98 : (8'hba))})));
        end
      else
        begin
          reg117 <= $unsigned(reg92);
        end
      if (wire110[(3'h5):(1'h0)])
        begin
          if ($signed((^$unsigned($signed({reg119})))))
            begin
              reg126 <= (wire115[(1'h1):(1'h0)] ?
                  wire114 : (-(wire110[(3'h5):(2'h3)] ?
                      (8'had) : ($signed((8'hb8)) <<< $unsigned(wire82)))));
              reg127 <= {$signed($signed($signed($signed(wire115)))),
                  ($signed({(~^wire88)}) ? wire101 : reg94)};
              reg128 <= (wire88[(2'h3):(2'h3)] ?
                  (^($signed({reg106, reg97}) ?
                      {$signed(wire108),
                          $unsigned(wire107)} : reg116)) : {$signed($signed((reg96 ?
                          wire91 : (8'h9e))))});
              reg129 <= $signed($unsigned((7'h40)));
              reg130 <= (+reg96);
            end
          else
            begin
              reg126 <= (reg99 >>> ($unsigned({{wire109,
                      reg128}}) <<< (((~^wire102) < ((8'hb3) <= reg96)) ?
                  $signed($unsigned(reg128)) : $unsigned($unsigned(wire100)))));
              reg127 <= (reg92[(3'h6):(1'h1)] & $unsigned((wire107 | ((|reg122) ?
                  wire101 : (~reg120)))));
            end
          reg131 <= ((~^reg94[(3'h7):(3'h4)]) ?
              ((wire89 ?
                      ($signed((8'hbc)) ?
                          ((8'had) ?
                              wire82 : reg106) : $signed(reg121)) : wire90[(2'h3):(2'h2)]) ?
                  reg106 : wire101[(3'h7):(2'h2)]) : reg128);
        end
      else
        begin
          reg126 <= (wire88 ?
              (~^({wire91[(3'h6):(3'h4)]} >>> (^(reg121 ?
                  wire100 : reg94)))) : (-($unsigned((-wire82)) <<< $signed((reg106 ^ (8'h9e))))));
          reg127 <= ({wire111} ?
              (~wire101) : (wire102[(1'h1):(1'h0)] ?
                  $signed($signed((wire91 & wire109))) : ((+wire83) ^~ wire103[(3'h5):(3'h5)])));
          if ({(7'h42), $unsigned(wire102[(1'h1):(1'h0)])})
            begin
              reg128 <= {(|wire87[(1'h0):(1'h0)]), reg118};
              reg129 <= (wire91 ?
                  (&(wire89[(1'h0):(1'h0)] << {$unsigned(reg119),
                      wire101})) : ($signed(((|wire112) ?
                          (wire107 ? wire88 : reg124) : $unsigned(wire114))) ?
                      reg105 : reg128));
              reg130 <= wire111[(3'h4):(1'h1)];
              reg131 <= (((~$signed((^~reg94))) >>> wire109) + $unsigned((^~(reg119 * (reg98 ?
                  wire84 : wire110)))));
            end
          else
            begin
              reg128 <= $signed(wire100[(4'hd):(4'h9)]);
              reg129 <= (|(reg96[(2'h2):(1'h0)] ?
                  $signed(($signed(reg128) < wire90)) : ((~|$signed(wire112)) <= (reg95[(2'h2):(1'h0)] <<< reg130))));
              reg130 <= {{reg130, ($unsigned(reg128[(1'h0):(1'h0)]) > wire107)},
                  ({wire114} >>> $unsigned($unsigned($unsigned(reg123))))};
              reg131 <= (^($unsigned(wire110) <<< (!reg129[(4'h8):(3'h4)])));
            end
          if ((8'hb5))
            begin
              reg132 <= (wire91 ^ (8'hbc));
            end
          else
            begin
              reg132 <= (reg120 ^~ (+($signed(reg121) <<< $unsigned($signed(reg118)))));
            end
          reg133 <= $unsigned(wire90);
        end
      if ($signed($signed((wire107 ?
          (reg133 ? wire113 : wire114[(4'hc):(4'h9)]) : $unsigned((!reg95))))))
        begin
          if ((($signed((!{reg120,
              (8'hb2)})) || $unsigned((wire107[(4'h8):(1'h0)] ?
              wire115[(1'h0):(1'h0)] : (~^reg106)))) << reg93[(2'h3):(2'h2)]))
            begin
              reg134 <= ($unsigned((((^wire115) ?
                      (wire90 ? (7'h40) : wire109) : ((8'hb9) ?
                          wire109 : reg118)) ?
                  $unsigned($signed(reg120)) : $signed(((8'hba) >>> wire102)))) <= (reg98[(3'h6):(1'h1)] ~^ wire90[(1'h1):(1'h0)]));
              reg135 <= (reg116[(1'h0):(1'h0)] ?
                  (^~(7'h40)) : {wire82[(4'hc):(2'h2)]});
              reg136 <= $unsigned((~^(($signed(reg118) >> $unsigned(wire114)) <= $unsigned($signed(reg99)))));
              reg137 <= {({reg106[(3'h5):(1'h1)]} <= ($signed($signed(reg121)) ?
                      {(wire90 ? reg124 : wire107),
                          {reg133, (8'hab)}} : {(|(8'ha9)), (8'hbc)}))};
            end
          else
            begin
              reg134 <= $unsigned((reg119[(2'h3):(1'h1)] ?
                  $unsigned($unsigned((wire85 ?
                      reg122 : wire112))) : ({$unsigned(wire83),
                      (-reg106)} >> (^{(7'h43), reg96}))));
              reg135 <= {((wire112[(2'h3):(1'h0)] + reg126) & (($signed(wire84) <= $unsigned(reg131)) ?
                      (^~(8'hbf)) : $signed((8'hbe)))),
                  (~|$unsigned($unsigned($unsigned(wire83))))};
              reg136 <= reg119[(1'h0):(1'h0)];
              reg137 <= {(((8'ha1) ?
                      (|reg136[(4'hf):(3'h4)]) : reg120[(4'hd):(2'h2)]) || wire108)};
              reg138 <= $unsigned((+reg116[(4'hc):(4'hc)]));
            end
          reg139 <= reg128[(1'h1):(1'h0)];
          reg140 <= {(!(8'hbc)), wire107};
          if (((|wire101[(3'h5):(1'h1)]) ?
              $unsigned(($unsigned((reg97 < reg117)) <<< {reg93,
                  (-(7'h44))})) : $signed((~(|$signed(wire115))))))
            begin
              reg141 <= {$signed({$unsigned(wire85[(1'h0):(1'h0)])}), reg97};
              reg142 <= ($signed(($signed($unsigned(reg130)) >= (reg99[(4'hb):(1'h0)] << (!reg119)))) >= (8'ha4));
              reg143 <= reg141[(3'h5):(3'h5)];
            end
          else
            begin
              reg141 <= {(reg104[(2'h3):(2'h3)] == (^reg131)),
                  $signed(($signed(reg116) ?
                      $unsigned((wire113 > reg137)) : reg127[(3'h4):(1'h0)]))};
              reg142 <= $signed((~^$unsigned((~&reg93))));
              reg143 <= reg94;
              reg144 <= ($unsigned((reg124[(3'h7):(3'h4)] ?
                  ((-wire88) ?
                      $signed(wire87) : {reg127,
                          wire90}) : reg118)) <= wire111[(3'h4):(2'h2)]);
              reg145 <= wire100[(4'h9):(4'h8)];
            end
        end
      else
        begin
          if (((!reg125) ? reg134 : (-wire103)))
            begin
              reg134 <= $unsigned(reg145[(3'h4):(2'h3)]);
            end
          else
            begin
              reg134 <= {{$unsigned(($unsigned(wire112) != $signed(reg125)))},
                  $signed(wire101[(4'h8):(2'h2)])};
              reg135 <= $unsigned(((reg94 | (reg131[(1'h0):(1'h0)] ?
                      (~wire90) : $unsigned(reg130))) ?
                  ($signed((^reg94)) ~^ {(reg131 >= wire85)}) : (^~$unsigned({wire89}))));
              reg136 <= reg123;
              reg137 <= ($unsigned({($signed(reg134) ?
                      {reg141, reg97} : $unsigned(reg95)),
                  $unsigned((reg94 && (8'hb4)))}) >= $unsigned(((~^(reg106 ?
                      wire110 : (8'haf))) ?
                  $signed((~^wire115)) : (+$signed(reg124)))));
            end
          if ({((8'hac) ?
                  (((wire83 ? wire108 : (8'hb1)) ~^ reg132) ?
                      $signed((8'ha6)) : (wire103 <= ((8'hba) == reg93))) : (&reg143)),
              ((!(8'hb1)) ^~ $unsigned(((reg142 - reg145) == $unsigned(reg98))))})
            begin
              reg138 <= $unsigned(((+(reg117[(2'h3):(1'h0)] ?
                      (reg134 ? reg117 : wire85) : (reg122 ?
                          wire111 : reg142))) ?
                  (reg119[(2'h3):(1'h0)] + (&(wire114 - reg134))) : reg95[(1'h1):(1'h1)]));
              reg139 <= (($unsigned({(reg128 ? wire100 : (8'h9f)),
                  (reg130 || reg142)}) ~^ wire85) <<< $unsigned($signed($unsigned((~&reg141)))));
              reg140 <= $unsigned($unsigned(((wire103 << (wire107 >> reg141)) ?
                  $unsigned($signed(reg120)) : wire88)));
              reg141 <= ((~&wire112[(2'h2):(2'h2)]) ?
                  $unsigned($signed(wire83)) : reg142[(2'h3):(2'h3)]);
              reg142 <= $unsigned(((({(8'hb3),
                      (8'hbc)} * reg134[(4'ha):(2'h3)]) ^~ (^~$signed((8'hbd)))) ?
                  $signed($signed((wire86 >> reg92))) : (((reg118 & wire91) ^ wire83) + ($unsigned(wire87) + (-reg136)))));
            end
          else
            begin
              reg138 <= (((|wire100) != reg97[(3'h6):(3'h5)]) ?
                  $signed(({((8'ha4) ? reg131 : reg142), $signed(reg139)} ?
                      $signed((wire112 ?
                          reg97 : wire108)) : {reg130})) : {(^~({wire84} ?
                          (~|(8'hbe)) : (reg96 ? wire86 : reg118)))});
              reg139 <= (~$unsigned($signed({(reg122 << wire103)})));
              reg140 <= reg120[(5'h11):(4'ha)];
            end
          if (({wire102} ^ (($unsigned(((8'hb0) >>> reg140)) * ((-reg98) ?
              (~&reg133) : {(8'hb3),
                  reg138})) >= $signed(((wire113 * reg123) | ((8'hb2) ?
              (8'hb8) : wire112))))))
            begin
              reg143 <= (~(^~reg127[(3'h4):(3'h4)]));
              reg144 <= {((!reg121[(4'h8):(2'h3)]) ^~ reg118)};
            end
          else
            begin
              reg143 <= reg119;
              reg144 <= {wire89,
                  $unsigned(((&reg135[(3'h6):(1'h1)]) ?
                      (-(reg94 ? reg132 : reg97)) : wire85[(2'h2):(2'h2)]))};
              reg145 <= $unsigned(reg126);
              reg146 <= (~&({reg104[(1'h1):(1'h0)]} ?
                  reg94[(4'ha):(4'ha)] : (-(-(|reg118)))));
              reg147 <= $signed(((|reg104) ?
                  reg143[(1'h1):(1'h1)] : $signed({reg99[(4'hf):(4'hd)],
                      $signed(wire89)})));
            end
          if (((&$unsigned($unsigned($unsigned(reg121)))) || ((^~(|((8'hb0) | reg96))) ?
              $signed(reg138[(4'hf):(4'h8)]) : $unsigned(({reg130,
                  reg137} | {wire91})))))
            begin
              reg148 <= ($unsigned({wire107,
                  ({wire108, (8'hb9)} ?
                      $unsigned(wire102) : (wire113 ~^ wire100))}) <<< $signed({((reg97 >>> (8'hb1)) ?
                      $unsigned((8'hbc)) : (8'hb1))}));
              reg149 <= (reg123 & $signed(reg92[(2'h3):(2'h2)]));
              reg150 <= wire90[(3'h4):(2'h3)];
              reg151 <= wire100[(4'hf):(1'h0)];
              reg152 <= ($unsigned(((~(reg125 ?
                      reg121 : reg150)) == ($signed(wire85) >= reg140[(1'h0):(1'h0)]))) ?
                  (~&($signed({(8'hae), wire108}) ?
                      {wire109} : ($unsigned((8'h9f)) << (+wire111)))) : (|(+reg149[(4'ha):(1'h1)])));
            end
          else
            begin
              reg148 <= (~^wire86[(4'hb):(2'h3)]);
              reg149 <= reg145;
              reg150 <= $unsigned((~reg146));
            end
          reg153 <= ($signed((reg142 ?
                  (7'h42) : ((wire91 < (8'hb7)) | reg145))) ?
              ($signed(({reg129} || (wire109 && reg126))) ?
                  reg132 : $unsigned((reg96[(4'h9):(3'h5)] + reg128))) : (7'h43));
        end
    end
  assign wire154 = {(reg151[(4'h9):(3'h4)] ?
                           ({(reg140 ? reg147 : wire86)} ?
                               (reg130[(5'h10):(4'h9)] <= reg145[(1'h0):(1'h0)]) : (&$signed(reg127))) : $signed({{reg141,
                                   reg149}})),
                       reg119[(1'h1):(1'h0)]};
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire55,
                 wire48,
                 wire47,
                 wire46,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire37 = (($signed((+(wire35 > (8'ha8)))) >> wire36[(3'h4):(2'h2)]) ?
                      wire33[(1'h1):(1'h0)] : wire35[(5'h10):(4'hd)]);
  assign wire38 = ((~&(-((wire35 ? wire34 : wire35) ?
                          $signed(wire34) : {wire33}))) ?
                      $signed((|(wire35[(3'h5):(1'h0)] > wire33))) : $signed(wire33));
  assign wire39 = ({{$signed(wire34[(1'h1):(1'h1)]),
                              ($signed(wire35) != $unsigned(wire35))},
                          $signed(((wire33 <= wire33) ?
                              {wire33, wire36} : $unsigned(wire37)))} ?
                      (+$signed((&(-wire37)))) : $signed((+wire36[(3'h4):(1'h0)])));
  assign wire40 = $unsigned(wire39[(4'hb):(3'h4)]);
  always
    @(posedge clk) begin
      reg41 <= wire40;
      reg42 <= $signed(wire35);
      reg43 <= (+(~&($unsigned(((8'had) ?
          wire35 : reg41)) ~^ $unsigned(wire40[(1'h1):(1'h1)]))));
      reg44 <= (8'ha5);
      reg45 <= $signed(({(8'hb9), (+wire39[(4'ha):(2'h3)])} ?
          ($signed($unsigned(wire40)) ?
              ($signed((8'h9c)) ?
                  wire35[(4'ha):(4'h8)] : reg42) : $signed(wire36[(1'h1):(1'h1)])) : $signed((^~$signed(reg42)))));
    end
  assign wire46 = ($signed($signed(wire37[(4'hc):(3'h4)])) >> reg45[(1'h1):(1'h0)]);
  assign wire47 = wire33;
  assign wire48 = reg44;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire46)))
        begin
          if ((~($signed(reg43) ?
              {wire39,
                  {$signed(reg41),
                      $unsigned((8'haa))}} : $unsigned($signed((!(8'had)))))))
            begin
              reg49 <= (reg45 ?
                  $unsigned($signed(((reg43 ? wire35 : reg45) ?
                      wire35[(5'h11):(3'h6)] : ((8'had) >> wire33)))) : reg44);
            end
          else
            begin
              reg49 <= wire33[(4'hb):(3'h4)];
              reg50 <= $unsigned($unsigned(wire36[(1'h1):(1'h0)]));
              reg51 <= reg43[(4'hb):(2'h2)];
              reg52 <= (wire47[(2'h3):(1'h1)] ?
                  wire37[(1'h1):(1'h0)] : $signed(($unsigned((reg44 >>> wire47)) != $signed((wire37 && reg45)))));
              reg53 <= (!reg52[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          reg49 <= $unsigned((8'h9c));
          reg50 <= ((wire47 ?
              (8'hb8) : {$signed($unsigned(wire46))}) + (-wire33[(4'h8):(1'h0)]));
        end
      reg54 <= $signed((reg50 ?
          $unsigned($unsigned($signed((8'hab)))) : $signed({$signed(wire36),
              $unsigned(wire47)})));
    end
  assign wire55 = (($signed(((~reg52) ? (reg44 <<< wire34) : (8'hb7))) ?
                      (8'h9d) : $unsigned((~|reg50))) ~^ (wire37 ?
                      (((wire46 ?
                          wire39 : reg51) < (+wire33)) <<< $signed((~wire40))) : reg53[(4'he):(4'hd)]));
endmodule
