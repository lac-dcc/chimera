module top
#(parameter param165 = (-((((^~(8'ha0)) ? ((8'hb5) ? (8'had) : (8'haf)) : ((8'ha4) ? (8'ha0) : (8'hbc))) >> (((8'h9c) ? (8'hb6) : (8'hae)) >= ((7'h40) <= (8'hbb)))) || ((8'ha6) - (((8'hbc) == (8'hba)) ? (~(8'hb4)) : {(8'h9d), (8'h9e)})))), 
parameter param166 = (param165 ? param165 : (((+(param165 ? (7'h43) : param165)) ? ((^~param165) ? (^~param165) : (param165 ? param165 : param165)) : (~^param165)) ? {((param165 >>> param165) ^ (param165 & param165))} : (~param165))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire162;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire16,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire4 = ((|($unsigned((wire3 ?
                     (8'ha0) : wire3)) > wire1)) | {wire1[(1'h0):(1'h0)],
                     {(&(wire1 ? wire1 : wire1))}});
  assign wire5 = (~|$signed((wire1[(3'h5):(1'h1)] - wire2)));
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(wire0[(2'h3):(1'h0)]) ?
          (~|wire4[(2'h3):(1'h1)]) : (^~wire6));
      if ($unsigned({(wire1[(3'h4):(2'h2)] - wire6)}))
        begin
          reg8 <= ((8'hb8) << {wire2[(2'h2):(1'h1)]});
        end
      else
        begin
          reg8 <= {(^wire3)};
          reg9 <= wire1[(2'h3):(2'h3)];
          if ((~(^~{((|wire4) + reg9),
              {$signed(wire4), (reg9 ? wire0 : wire2)}})))
            begin
              reg10 <= (^~(~(+reg7)));
              reg11 <= wire0[(4'hc):(4'hb)];
              reg12 <= (~$signed({$signed(wire0)}));
              reg13 <= $signed($unsigned((wire1[(3'h5):(1'h0)] >> ((reg12 + (7'h44)) ?
                  $signed(reg8) : (wire6 <= wire3)))));
              reg14 <= {(+reg9),
                  {$signed({((8'h9c) ? reg12 : (8'ha0))}),
                      ($signed({wire4}) ?
                          $unsigned((|wire3)) : (reg11[(4'he):(2'h2)] <<< wire2[(2'h3):(1'h0)]))}};
            end
          else
            begin
              reg10 <= reg8;
              reg11 <= (^reg8[(4'h8):(2'h2)]);
              reg12 <= wire5[(4'hf):(3'h7)];
            end
          reg15 <= $signed(($signed((((8'had) * wire1) != {wire2,
              (7'h44)})) & (({wire1, reg12} ?
              wire4[(1'h0):(1'h0)] : (reg11 ?
                  (8'had) : reg7)) & ((-reg12) ^ $signed(wire1)))));
        end
    end
  assign wire16 = wire0;
  module17 #() modinst160 (wire159, clk, wire1, reg15, wire0, reg12, reg8);
  assign wire161 = (((|{$signed(wire1)}) ?
                           (~|wire3) : $signed(((^wire3) ?
                               $unsigned(reg8) : (reg12 ? (8'hab) : reg14)))) ?
                       ((|({reg13, reg9} > $unsigned(reg7))) ?
                           reg9[(1'h1):(1'h1)] : ($signed((~wire1)) ?
                               (8'ha9) : $signed($unsigned((7'h42))))) : $signed(($unsigned((~(8'ha4))) ^~ $signed(reg11[(3'h6):(1'h1)]))));
  assign wire162 = ((^~(wire3 <= (wire0[(3'h5):(1'h1)] ^~ wire161))) * wire159[(4'hd):(3'h4)]);
  assign wire163 = (&wire159[(4'h9):(4'h8)]);
  assign wire164 = reg8;
endmodule

module module17
#(parameter param158 = (~(((((8'ha4) ? (8'haa) : (8'ha8)) ? ((8'ha2) ? (8'hb6) : (8'h9f)) : ((8'ha2) | (8'hbc))) < (!((8'ha4) ? (8'ha6) : (8'ha4)))) != (-{{(8'h9c), (8'ha8)}, ((8'hb0) <<< (8'hb2))}))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire151;
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  assign y = {wire157,
                 wire155,
                 wire154,
                 wire153,
                 wire80,
                 wire23,
                 wire94,
                 wire95,
                 wire151,
                 reg156,
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
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = wire18[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg24 <= (~|(({{wire21}} < $unsigned({wire21, wire21})) ?
          ($unsigned(wire20) && wire18[(2'h2):(1'h0)]) : wire23[(2'h3):(1'h1)]));
      reg25 <= (8'hbb);
      reg26 <= $unsigned(wire23);
    end
  module27 #() modinst81 (wire80, clk, reg24, wire23, reg26, wire21, wire19);
  always
    @(posedge clk) begin
      if ($unsigned((^~{wire80, $signed(wire80)})))
        begin
          reg82 <= (~&$signed($unsigned(wire18)));
          reg83 <= wire19;
          if ($unsigned((($unsigned($unsigned((8'hb5))) ?
                  ((|(8'ha5)) ? reg24[(4'h8):(4'h8)] : (~wire23)) : ((|reg82) ?
                      reg83[(1'h1):(1'h1)] : reg83[(2'h2):(2'h2)])) ?
              $unsigned(reg26[(1'h0):(1'h0)]) : (!$unsigned({wire22,
                  (8'ha9)})))))
            begin
              reg84 <= {reg24};
              reg85 <= $unsigned(wire19[(4'hd):(4'ha)]);
              reg86 <= (^(wire22 ?
                  wire19 : ((8'hb0) ?
                      ($unsigned(reg82) ?
                          wire80[(2'h2):(1'h0)] : (8'hb6)) : ((&wire80) ?
                          $signed(wire18) : $unsigned(wire22)))));
              reg87 <= (~&reg86[(2'h2):(2'h2)]);
              reg88 <= $signed({($unsigned((reg82 ? reg87 : reg83)) + ({wire80,
                      reg87} >>> {wire19})),
                  (reg87 - ($signed(wire21) & ((8'ha2) || reg87)))});
            end
          else
            begin
              reg84 <= {(wire19[(4'hf):(2'h3)] >> {reg87,
                      ((reg25 ? reg84 : reg86) > {(8'hbd), wire18})})};
              reg85 <= $unsigned((~^$unsigned($signed(reg86))));
              reg86 <= (|reg25);
              reg87 <= reg88;
              reg88 <= (8'ha3);
            end
          reg89 <= (({reg82} ?
                  (reg86[(2'h3):(2'h3)] ?
                      (~|((8'hae) ?
                          (8'hb7) : reg86)) : $unsigned((~reg83))) : {reg25}) ?
              ($unsigned(($signed(wire80) == reg86[(3'h6):(2'h3)])) ?
                  wire19[(4'h8):(3'h5)] : wire21) : wire21[(3'h7):(3'h5)]);
        end
      else
        begin
          reg82 <= {($unsigned(($signed(wire19) ?
                  {wire18,
                      wire21} : reg89[(3'h6):(3'h4)])) <<< {(+(reg83 && reg86)),
                  $unsigned($signed(wire23))}),
              ({reg26} ?
                  $unsigned($unsigned($unsigned(reg86))) : (reg82 < reg25))};
          reg83 <= (~{$signed(reg25)});
          reg84 <= (reg24[(4'ha):(3'h4)] ?
              (wire80 || $unsigned($signed({wire19}))) : wire19[(1'h0):(1'h0)]);
          if ((((((reg86 ? reg87 : reg26) != {reg24,
                  reg26}) >= {$signed((8'hbb))}) == (!(wire21[(4'h9):(3'h4)] ?
                  reg25[(4'hf):(2'h2)] : wire22[(1'h0):(1'h0)]))) ?
              $signed((wire21[(2'h3):(1'h0)] ?
                  (^~wire21[(1'h0):(1'h0)]) : ($signed(reg24) ?
                      (8'hab) : (wire80 == reg89)))) : (reg85 * reg84[(1'h1):(1'h1)])))
            begin
              reg85 <= reg89[(3'h6):(2'h3)];
              reg86 <= reg86[(1'h0):(1'h0)];
              reg87 <= $signed(wire20);
              reg88 <= (+(-{reg84, wire21[(4'h9):(1'h0)]}));
              reg89 <= reg24;
            end
          else
            begin
              reg85 <= wire23;
            end
        end
      reg90 <= wire22[(2'h3):(2'h2)];
      reg91 <= $unsigned({$signed(((reg25 ? reg90 : wire18) ?
              (~&wire22) : (~^reg84)))});
      reg92 <= reg88;
      reg93 <= wire23;
    end
  assign wire94 = $unsigned(reg91);
  assign wire95 = (reg89 & (($unsigned($signed(reg24)) < $signed(reg88[(1'h0):(1'h0)])) > wire21[(4'hb):(2'h2)]));
  module96 #() modinst152 (wire151, clk, wire18, wire19, wire95, reg90, reg25);
  assign wire153 = $unsigned(({{reg91}} ?
                       $unsigned($signed(reg93[(4'hc):(2'h2)])) : wire151));
  assign wire154 = reg25[(4'ha):(3'h5)];
  assign wire155 = $unsigned(reg85[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg156 <= reg82;
    end
  assign wire157 = {reg90[(5'h11):(4'hc)], (^~wire80[(5'h13):(5'h13)])};
endmodule

module module96
#(parameter param149 = ((((((8'haf) ? (7'h40) : (8'ha1)) ? ((8'ha6) && (8'hbd)) : ((8'haa) ? (8'h9c) : (8'had))) <<< (&(~(8'ha5)))) < ((|(|(8'haf))) <<< ((+(8'hbc)) | ((8'hb1) + (8'hb4))))) ? ((8'hbb) + ((((8'ha4) != (8'ha8)) * (~^(8'hac))) ? (((8'ha7) ? (8'ha1) : (7'h43)) ? (^~(8'hbb)) : ((8'hba) ? (8'hb9) : (8'hbd))) : {(&(8'h9c)), (-(8'hb7))})) : (((~|((8'ha6) ? (7'h40) : (7'h44))) < ((~|(8'ha8)) > (^~(8'hbc)))) ? (^(|((8'haf) ? (8'h9e) : (8'ha3)))) : (8'ha1))), 
parameter param150 = (7'h44))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire101;
  input wire signed [(4'h8):(1'h0)] wire100;
  input wire signed [(5'h11):(1'h0)] wire99;
  input wire [(4'h9):(1'h0)] wire98;
  input wire signed [(4'he):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  assign y = {wire147,
                 wire145,
                 wire132,
                 wire119,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire104,
                 wire103,
                 wire102,
                 reg148,
                 reg146,
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
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire102 = wire101[(2'h2):(1'h0)];
  assign wire103 = $signed(wire98[(2'h2):(2'h2)]);
  assign wire104 = (-(wire98 <= {{((8'ha9) << wire100)}, wire98}));
  always
    @(posedge clk) begin
      reg105 <= $signed((~|($unsigned({wire98}) || {(wire97 ^~ wire103)})));
      if ({wire104})
        begin
          reg106 <= $unsigned($unsigned(wire101));
          reg107 <= ((($signed((~&wire102)) ?
                  (wire99 ?
                      (wire102 ?
                          wire102 : wire103) : reg105[(3'h6):(3'h6)]) : wire97) ?
              $unsigned((^$signed(wire101))) : wire101) <= {{($unsigned(wire104) ?
                      wire97[(1'h1):(1'h0)] : reg106[(1'h0):(1'h0)]),
                  $unsigned(reg105[(4'h8):(1'h0)])}});
        end
      else
        begin
          reg106 <= ((^$unsigned($signed(wire101[(4'hb):(3'h7)]))) >= $unsigned(({(wire99 <= wire98)} ?
              wire97 : wire99[(2'h3):(2'h3)])));
        end
      reg108 <= (~$unsigned($unsigned(wire99)));
    end
  assign wire109 = (~|$unsigned((reg108[(1'h0):(1'h0)] ?
                       wire101 : ($signed((7'h41)) ~^ wire104))));
  assign wire110 = wire109[(3'h7):(1'h1)];
  assign wire111 = (^(&(reg105[(3'h4):(3'h4)] ?
                       $unsigned((^~wire110)) : ($signed(wire103) ?
                           (wire110 - wire98) : (~|wire97)))));
  assign wire112 = reg108;
  assign wire113 = (wire99[(4'hc):(3'h6)] ?
                       wire111 : ((!(wire102[(4'hd):(3'h7)] ?
                           (wire103 ?
                               wire109 : wire110) : {wire100})) * (+wire100[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      if ($signed(wire103[(1'h1):(1'h1)]))
        begin
          reg114 <= $signed($signed((~^reg105[(3'h6):(3'h5)])));
          reg115 <= (&$unsigned(wire98[(3'h6):(2'h3)]));
          reg116 <= wire102[(4'ha):(1'h1)];
          reg117 <= wire97;
        end
      else
        begin
          reg114 <= $signed((wire99 + ({(reg106 ? wire100 : wire102)} ?
              wire102 : ((wire110 & wire101) ?
                  wire110[(4'h8):(2'h3)] : reg117[(5'h15):(2'h3)]))));
          reg115 <= $unsigned(reg117);
          reg116 <= (wire104 == wire113[(3'h7):(3'h7)]);
        end
      reg118 <= (8'ha3);
    end
  assign wire119 = (reg106[(1'h0):(1'h0)] >>> wire99);
  always
    @(posedge clk) begin
      reg120 <= wire99[(3'h4):(3'h4)];
      reg121 <= (^reg118);
      reg122 <= ((~|$unsigned(((wire111 && reg120) ^ (wire102 ?
          (7'h41) : reg116)))) > ((((8'hab) >>> $unsigned(wire102)) ?
          ($unsigned(reg118) ?
              ((8'h9d) & reg117) : (8'ha3)) : {$signed(wire99)}) == ({reg115,
          (wire109 ? (8'hb6) : wire102)} <<< $unsigned($unsigned(reg114)))));
      reg123 <= $unsigned(((((wire99 >>> wire110) > $signed(reg117)) << ({wire97} ?
          wire111 : wire119)) ^~ $unsigned($unsigned($signed(wire102)))));
      reg124 <= ((wire111 == $signed((|wire112[(2'h3):(2'h3)]))) ~^ ($signed(reg106) ?
          ($signed($unsigned(reg115)) ?
              reg121[(4'he):(4'he)] : (~|$unsigned(wire119))) : (~|wire100)));
    end
  always
    @(posedge clk) begin
      reg125 <= (-wire113[(4'h8):(2'h2)]);
      reg126 <= $unsigned(((reg105[(4'ha):(3'h4)] ?
          reg122 : $unsigned($unsigned(wire103))) << wire111[(2'h3):(1'h0)]));
      reg127 <= (({((~|wire100) >>> (reg118 ? reg121 : reg114))} ?
              ($signed(((8'hb8) << reg125)) ?
                  ((wire110 && reg125) && (wire101 ?
                      wire112 : wire112)) : {(wire119 << reg105)}) : (reg125[(2'h2):(1'h0)] >> {wire98})) ?
          reg125 : $signed(reg120[(2'h3):(2'h3)]));
      reg128 <= reg121[(4'h9):(3'h6)];
      if ({$unsigned(reg107), (!$unsigned(reg127))})
        begin
          reg129 <= reg117[(4'hb):(1'h1)];
          reg130 <= ({wire103[(1'h1):(1'h1)]} >= ((~^reg116[(4'hd):(3'h7)]) ?
              $signed((((7'h42) ? (8'h9c) : reg123) ?
                  reg125 : reg129)) : $unsigned(wire99)));
          reg131 <= (((&$signed((8'h9d))) | (|((reg130 ? reg116 : reg122) ?
              (reg123 >>> wire101) : wire110[(5'h15):(5'h12)]))) + (((~wire100) ?
              (~|(-reg128)) : reg118) >>> (reg105[(1'h1):(1'h0)] ?
              reg108[(2'h3):(1'h0)] : (~$unsigned(wire110)))));
        end
      else
        begin
          reg129 <= (~^{reg128});
        end
    end
  assign wire132 = $signed(((reg128 <<< ((reg122 ? reg117 : reg123) ?
                       $unsigned(reg106) : wire99)) && $unsigned($unsigned(((8'hb1) == reg129)))));
  always
    @(posedge clk) begin
      if ((wire104[(3'h6):(2'h3)] > ({(|reg122[(4'he):(3'h6)]),
          {wire109}} != wire109[(1'h1):(1'h1)])))
        begin
          if ($unsigned((8'ha2)))
            begin
              reg133 <= ($signed($signed($unsigned(reg124))) ?
                  reg108 : reg123[(3'h4):(1'h0)]);
              reg134 <= (-reg121[(3'h5):(3'h4)]);
            end
          else
            begin
              reg133 <= (~(wire111[(1'h1):(1'h1)] == $unsigned($signed(wire109))));
              reg134 <= (!($signed(((reg127 >>> wire109) ^ reg118[(3'h4):(1'h1)])) ?
                  (+(+(-reg105))) : $unsigned(reg107[(1'h1):(1'h0)])));
              reg135 <= $signed($signed(wire99));
              reg136 <= (reg129 ?
                  reg135[(3'h5):(1'h0)] : $unsigned((((!reg122) == $unsigned(wire100)) > ((~^wire97) < (reg117 ?
                      reg130 : (8'ha6))))));
              reg137 <= $signed(wire101);
            end
        end
      else
        begin
          reg133 <= wire109[(4'ha):(1'h0)];
          reg134 <= reg105;
          reg135 <= $signed($signed({reg122}));
        end
    end
  always
    @(posedge clk) begin
      reg138 <= reg107[(3'h7):(3'h6)];
      if (wire113[(3'h6):(3'h4)])
        begin
          reg139 <= ((|(reg138[(3'h6):(1'h1)] ?
              $unsigned((wire102 ?
                  reg114 : wire109)) : (7'h42))) >> ({($signed(reg114) < (wire98 << wire132)),
                  $unsigned((reg127 ^~ reg134))} ?
              $unsigned((((8'ha4) ?
                  (8'ha7) : wire132) & wire103)) : $signed(reg129[(3'h4):(3'h4)])));
          reg140 <= reg126[(4'hd):(4'hb)];
          reg141 <= {(!reg123[(1'h0):(1'h0)])};
          reg142 <= (-((~|reg140[(3'h6):(2'h3)]) ?
              (($signed(reg122) ?
                  $signed(reg107) : (-(8'ha9))) ^ ($signed(reg118) ?
                  $unsigned(reg126) : reg121)) : (((8'hab) >= $signed(reg133)) > $unsigned((~reg121)))));
        end
      else
        begin
          reg139 <= (8'hbd);
          if ((($unsigned($unsigned((reg128 != wire101))) ?
                  (|wire100[(2'h3):(2'h2)]) : reg127) ?
              (|reg125) : (~&{(!(wire104 ? reg142 : wire102))})))
            begin
              reg140 <= reg141[(1'h0):(1'h0)];
              reg141 <= $unsigned((7'h43));
            end
          else
            begin
              reg140 <= reg123;
              reg141 <= reg121;
              reg142 <= ($signed((8'hb6)) == (~|wire112));
            end
          reg143 <= (wire99[(5'h11):(5'h10)] && {$signed($unsigned($signed(wire101)))});
        end
      reg144 <= reg126;
    end
  assign wire145 = $signed((!(~&(8'ha5))));
  always
    @(posedge clk) begin
      reg146 <= $unsigned($signed($unsigned(reg105[(4'hd):(1'h1)])));
    end
  assign wire147 = {$signed((!reg121[(3'h5):(3'h5)]))};
  always
    @(posedge clk) begin
      reg148 <= wire102[(5'h13):(2'h2)];
    end
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  assign y = {wire77,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg79,
                 reg78,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire33 = wire29;
  assign wire34 = wire29[(2'h3):(2'h2)];
  assign wire35 = {$signed(((^(wire33 ? wire33 : (8'hb3))) ?
                          ({wire33, wire34} ?
                              wire29 : $signed(wire28)) : $signed(wire31[(2'h3):(1'h1)])))};
  assign wire36 = (wire30 ?
                      ((((8'h9c) ^~ wire28[(3'h4):(1'h1)]) ?
                              wire33[(4'hb):(4'h9)] : $unsigned((~&wire30))) ?
                          $unsigned((7'h42)) : wire29) : $signed($unsigned((wire32[(2'h2):(1'h1)] ?
                          wire28 : (~|wire31)))));
  assign wire37 = (((wire31[(4'hc):(1'h1)] ?
                      (8'ha4) : $unsigned((~(7'h43)))) >> (wire34[(4'hb):(3'h4)] ?
                      $signed(wire31) : (^~wire35))) >= wire34);
  always
    @(posedge clk) begin
      reg38 <= wire35[(1'h1):(1'h0)];
      reg39 <= {wire36};
      reg40 <= {wire35[(1'h1):(1'h0)]};
      if ($signed((wire36[(2'h2):(1'h0)] || ($signed(wire34) ?
          (&$signed((8'ha0))) : $unsigned((^wire30))))))
        begin
          reg41 <= wire31[(4'hd):(4'hc)];
          if (reg39)
            begin
              reg42 <= ($unsigned($signed(wire31[(5'h14):(5'h13)])) ?
                  wire32[(2'h2):(1'h1)] : (((~^$unsigned((8'ha5))) >= ((wire29 ?
                          reg40 : wire28) > $signed(wire28))) ?
                      ((^~(8'hb0)) ?
                          {$signed(reg41)} : $signed($signed(wire37))) : ($unsigned($unsigned((8'ha2))) ?
                          ({reg38} ? $signed(wire31) : {wire36}) : reg39)));
              reg43 <= wire37[(5'h10):(1'h1)];
              reg44 <= ($signed(($unsigned((wire31 & reg41)) ?
                  ($unsigned(wire28) >>> (^reg42)) : $unsigned((wire33 ?
                      reg43 : reg42)))) && $signed($unsigned((+$signed(reg42)))));
            end
          else
            begin
              reg42 <= wire29[(1'h0):(1'h0)];
              reg43 <= (~|$unsigned(wire36[(3'h4):(1'h1)]));
            end
          reg45 <= (^(~&$signed($signed((8'hbe)))));
          if ((($unsigned(((wire36 | reg40) != $signed(reg41))) & $signed({(wire31 ?
                      reg43 : reg43)})) ?
              ((reg38 ?
                  (~|(wire29 ?
                      wire33 : wire31)) : (((8'ha2) ^~ wire32) | (8'hbd))) <= (($signed((8'hbe)) || (wire30 != reg42)) ?
                  (8'haf) : {(wire30 ? reg43 : wire30),
                      $signed((8'h9f))})) : (($signed(wire33) >= $signed($unsigned(reg41))) ?
                  {$signed(wire30[(2'h2):(1'h1)]),
                      ((wire28 || wire34) ?
                          $signed(reg44) : (+reg40))} : wire28[(5'h11):(3'h5)])))
            begin
              reg46 <= $signed($signed(reg42));
            end
          else
            begin
              reg46 <= {({wire30} ?
                      (~|(reg44 ?
                          $signed(wire35) : (~^(8'hb5)))) : $signed(((wire37 ?
                              wire36 : wire32) ?
                          $signed(wire28) : (reg42 ? wire31 : wire32)))),
                  (($signed(wire36) ?
                      $unsigned($signed(reg40)) : ((^reg38) ?
                          wire33[(2'h2):(1'h0)] : (reg45 >> (8'ha0)))) != reg43[(2'h3):(1'h1)])};
              reg47 <= wire31;
              reg48 <= $signed(wire32[(1'h0):(1'h0)]);
              reg49 <= (~&$unsigned(((|(^~(8'hb6))) - $signed($unsigned(reg47)))));
              reg50 <= reg46;
            end
        end
      else
        begin
          if ((reg41 ?
              ((^~((7'h42) - $unsigned(reg46))) ^ (wire31[(1'h1):(1'h1)] & (~reg47[(3'h5):(3'h5)]))) : reg40))
            begin
              reg41 <= reg50;
              reg42 <= $unsigned($signed(reg50));
            end
          else
            begin
              reg41 <= $signed($signed(({reg45} | ($unsigned(reg40) ?
                  (^~wire36) : wire36[(3'h5):(3'h5)]))));
              reg42 <= (({wire37} ?
                      wire37 : $unsigned(($unsigned(wire31) ?
                          (~^wire37) : {wire36}))) ?
                  ((wire30[(4'hd):(3'h7)] || (^wire32[(1'h0):(1'h0)])) ?
                      reg38[(3'h4):(3'h4)] : {$unsigned((wire32 ?
                              reg44 : reg41))}) : (($signed({reg39}) ?
                          reg50 : reg41[(3'h6):(3'h4)]) ?
                      {(+reg42),
                          ((!reg40) ?
                              (reg45 | wire32) : ((7'h40) ?
                                  (8'had) : reg45))} : $unsigned((~$unsigned(wire36)))));
            end
        end
    end
  assign wire51 = (reg43[(4'hd):(2'h2)] > reg48[(3'h5):(3'h5)]);
  assign wire52 = wire51[(2'h3):(2'h2)];
  assign wire53 = wire31;
  assign wire54 = {(8'hb8),
                      (($signed((wire30 ? (8'hb3) : reg42)) ?
                          (wire36[(1'h1):(1'h1)] || ((8'ha5) || (8'ha0))) : (&((8'h9e) ~^ wire51))) - ($unsigned((!reg47)) >> {((8'ha1) ?
                              reg38 : reg48),
                          reg39[(3'h6):(2'h2)]}))};
  assign wire55 = $signed((+wire53));
  assign wire56 = (reg38 ?
                      $signed(reg38) : ({(wire33[(1'h1):(1'h0)] ?
                                  (~^wire36) : (reg49 ? wire31 : reg44))} ?
                          $unsigned({$unsigned(wire51)}) : $signed(wire54)));
  assign wire57 = ((((~|wire36[(3'h5):(2'h3)]) ? wire52 : $unsigned((8'ha2))) ?
                          (^~($unsigned(reg48) ?
                              $unsigned(reg45) : reg43[(4'h8):(3'h5)])) : reg40[(3'h6):(2'h2)]) ?
                      $unsigned(reg49[(4'h8):(3'h6)]) : reg47[(2'h3):(1'h1)]);
  assign wire58 = (8'hb6);
  always
    @(posedge clk) begin
      if (wire56[(3'h5):(3'h4)])
        begin
          if (wire28)
            begin
              reg59 <= reg40;
              reg60 <= ((|(&((reg59 + wire29) <<< $signed((8'had))))) ?
                  wire31 : $signed($signed(($unsigned((8'ha1)) ?
                      (wire55 >= (8'had)) : (8'hab)))));
              reg61 <= reg48[(3'h4):(2'h2)];
              reg62 <= ((&$signed((wire55[(1'h0):(1'h0)] && ((8'hb4) ?
                  wire37 : wire31)))) && (~&(wire36[(1'h1):(1'h1)] <= {{reg59}})));
            end
          else
            begin
              reg59 <= ($signed((|($unsigned((7'h41)) && $signed(wire53)))) <= wire53);
              reg60 <= {reg44};
              reg61 <= wire29;
              reg62 <= $unsigned(wire35);
            end
          if ($signed($signed($signed($unsigned((~&(8'hbd)))))))
            begin
              reg63 <= reg62;
              reg64 <= {(reg61[(2'h3):(1'h0)] << ($signed(wire54) ?
                      $signed($signed(reg59)) : wire29))};
              reg65 <= (~|reg38);
              reg66 <= (&(reg49[(2'h2):(2'h2)] >= (((reg38 ?
                      reg50 : wire33) > reg42) ?
                  $signed($signed(reg47)) : wire37)));
              reg67 <= (&reg38);
            end
          else
            begin
              reg63 <= ($signed($unsigned($signed({reg47}))) ?
                  {wire32} : wire54);
              reg64 <= $unsigned({$signed(reg64[(3'h5):(3'h5)]),
                  $unsigned($unsigned($unsigned(wire29)))});
              reg65 <= reg59[(3'h5):(2'h2)];
              reg66 <= $signed({(8'hbf)});
            end
          reg68 <= $signed((reg60[(2'h3):(1'h1)] ?
              $signed({wire37}) : $signed({(wire32 ^ reg59),
                  (wire58 | (8'ha4))})));
          reg69 <= wire37;
        end
      else
        begin
          reg59 <= (^(~|(~$unsigned((reg39 != wire33)))));
          reg60 <= reg43[(4'h8):(1'h0)];
          reg61 <= (&$unsigned($signed(($signed((8'hbb)) ?
              ((8'h9e) ? reg63 : (7'h41)) : (wire55 ? wire55 : reg42)))));
          if ($signed({(reg65[(2'h2):(1'h0)] ?
                  {$unsigned(reg44), wire51[(1'h0):(1'h0)]} : wire28),
              wire56[(3'h6):(3'h5)]}))
            begin
              reg62 <= wire52;
              reg63 <= reg60[(3'h7):(3'h7)];
              reg64 <= $signed($signed({wire57[(1'h1):(1'h0)]}));
              reg65 <= (&(wire37 ?
                  {reg38[(1'h0):(1'h0)],
                      {(7'h44),
                          reg60[(4'h8):(2'h2)]}} : ($unsigned($signed(wire30)) ?
                      ($unsigned(wire28) ?
                          $signed(wire35) : $unsigned(reg59)) : (reg59 >>> (~^wire54)))));
              reg66 <= $signed(reg66[(2'h2):(2'h2)]);
            end
          else
            begin
              reg62 <= $signed($unsigned(($signed($unsigned(reg48)) || reg64)));
              reg63 <= wire36[(3'h4):(3'h4)];
            end
          reg67 <= $signed({(8'ha1)});
        end
      if (wire34[(4'h8):(1'h1)])
        begin
          reg70 <= (({((reg63 == reg65) ^ (reg43 != reg49))} ?
              ($signed(reg62[(2'h2):(1'h0)]) >>> $signed(reg41)) : $signed($signed(reg68[(4'h8):(3'h7)]))) || ($signed($unsigned(wire29[(4'h9):(2'h2)])) ?
              reg40[(1'h1):(1'h1)] : ($signed($signed((8'hba))) ?
                  $unsigned((8'h9e)) : $unsigned(reg66[(4'h8):(2'h2)]))));
          if ((~$unsigned($signed(($unsigned(reg60) <<< (wire52 & wire33))))))
            begin
              reg71 <= $signed({(reg70[(5'h12):(3'h5)] ?
                      $signed($signed(reg44)) : reg70[(3'h5):(2'h2)])});
              reg72 <= $signed($signed(((((8'hb8) < wire57) ^ reg42) > (reg61 ?
                  (^~wire55) : (~wire33)))));
            end
          else
            begin
              reg71 <= {wire55,
                  ($unsigned((|$unsigned(reg71))) ^ (~^wire54[(4'h8):(3'h5)]))};
              reg72 <= {$unsigned(wire35[(3'h4):(1'h1)])};
              reg73 <= (^$signed($unsigned((reg45[(1'h0):(1'h0)] != wire58))));
              reg74 <= {reg61[(2'h2):(1'h1)]};
            end
          reg75 <= wire29;
          reg76 <= wire31;
        end
      else
        begin
          if (wire36[(2'h2):(1'h1)])
            begin
              reg70 <= $unsigned(wire32);
              reg71 <= {$signed($signed($unsigned((reg76 ? reg46 : reg74))))};
              reg72 <= $unsigned(reg63);
              reg73 <= $unsigned((~reg41));
            end
          else
            begin
              reg70 <= $unsigned($signed($signed(wire53[(2'h3):(2'h3)])));
              reg71 <= $signed($signed((-reg75)));
              reg72 <= wire51[(2'h3):(2'h2)];
            end
        end
    end
  assign wire77 = wire56[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg78 <= ((!($unsigned($unsigned(reg63)) ^ reg47)) ?
          (+$unsigned(wire34[(4'h9):(3'h6)])) : wire55);
    end
  always
    @(posedge clk) begin
      reg79 <= $signed((~$signed(reg71)));
    end
endmodule
