module top
#(parameter param149 = (~|(^((^(!(7'h43))) || (((8'ha3) - (8'hab)) >= {(8'hb7)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire114;
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire131,
                 wire130,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire5,
                 wire6,
                 wire18,
                 wire91,
                 wire93,
                 wire114,
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
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
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
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned($signed($unsigned(((wire4 ?
                     wire0 : wire2) << $unsigned(wire2)))));
  assign wire6 = (+((!(^~$unsigned(wire3))) != $signed(wire1[(4'he):(4'hc)])));
  always
    @(posedge clk) begin
      reg7 <= $signed($signed(wire2));
      if ($signed($unsigned(($signed($unsigned(reg7)) >= wire0))))
        begin
          if ({{(~&wire5[(1'h1):(1'h0)]), $unsigned({$signed(wire4)})},
              ($signed((~|(wire0 ? wire2 : wire0))) >> (((wire3 ?
                          wire1 : (8'ha5)) ?
                      $unsigned(wire5) : $unsigned(wire3)) ?
                  ((wire0 ?
                      wire6 : reg7) <<< $unsigned(wire0)) : (~&(wire3 ^~ wire5))))})
            begin
              reg8 <= $signed({(wire3 <= wire0[(1'h0):(1'h0)]),
                  {$signed(reg7), (!wire1)}});
              reg9 <= $unsigned((!$unsigned((8'ha3))));
              reg10 <= (~&reg9);
              reg11 <= ({(wire4 | wire4[(4'ha):(1'h1)]),
                      ((~^(reg8 ? wire6 : wire2)) ?
                          $unsigned((wire4 ? reg8 : reg9)) : {wire1, wire3})} ?
                  $unsigned((|$signed((wire3 >> (8'ha1))))) : wire4);
              reg12 <= ({($unsigned((reg9 ? reg10 : reg11)) ?
                      (~^$unsigned(wire2)) : $signed((-wire6)))} ^~ $unsigned({$signed({reg11})}));
            end
          else
            begin
              reg8 <= (|($unsigned($signed(wire0[(1'h0):(1'h0)])) & wire3[(2'h2):(2'h2)]));
              reg9 <= (reg7 ?
                  (~^(!$unsigned($signed(reg8)))) : reg7[(2'h3):(2'h3)]);
            end
          reg13 <= reg7[(2'h2):(1'h0)];
        end
      else
        begin
          if (wire4[(4'hd):(4'hc)])
            begin
              reg8 <= $signed(wire1[(4'hb):(3'h7)]);
              reg9 <= {{{reg13[(2'h2):(1'h1)], reg9[(4'hd):(4'hd)]},
                      (reg11[(1'h1):(1'h0)] ^ ((&reg13) >>> (wire5 ?
                          reg9 : wire0)))},
                  $signed(wire2[(1'h1):(1'h1)])};
              reg10 <= {$unsigned((($signed(reg10) || reg8) == wire5[(4'h9):(1'h1)])),
                  $signed((!reg7[(2'h2):(2'h2)]))};
              reg11 <= reg10[(3'h7):(2'h3)];
            end
          else
            begin
              reg8 <= reg9[(3'h4):(2'h3)];
              reg9 <= (-wire1[(4'hd):(3'h5)]);
              reg10 <= {reg12};
              reg11 <= (($signed(((~|wire0) ?
                  (!wire3) : (~^reg9))) < (&(reg9[(4'ha):(3'h5)] >> {wire4,
                  wire4}))) - wire0[(5'h14):(4'he)]);
            end
          reg12 <= {(((wire0[(5'h11):(4'hd)] & (reg10 ?
                  reg8 : reg12)) > reg7[(1'h0):(1'h0)]) & reg12[(1'h1):(1'h0)]),
              $signed(((-$unsigned(reg13)) <= $unsigned((reg10 ?
                  reg12 : reg7))))};
          reg13 <= (~$unsigned({((~^reg13) >= wire2[(1'h0):(1'h0)])}));
          reg14 <= reg9[(3'h4):(2'h3)];
          reg15 <= ($signed({$signed($signed(reg7))}) ?
              (&reg8) : $signed(reg14));
        end
      reg16 <= ((~$unsigned(reg9[(1'h0):(1'h0)])) < reg14);
      reg17 <= reg16[(2'h2):(1'h1)];
    end
  assign wire18 = (reg12[(2'h3):(2'h2)] ^ {reg17, (8'h9e)});
  module19 #() modinst92 (wire91, clk, wire6, reg14, reg15, reg7, wire2);
  assign wire93 = reg12;
  module94 #() modinst115 (wire114, clk, reg14, wire5, reg17, reg7);
  assign wire116 = reg17[(2'h2):(1'h1)];
  assign wire117 = $signed(wire6[(2'h2):(1'h0)]);
  assign wire118 = reg12[(1'h0):(1'h0)];
  assign wire119 = (~|reg7[(5'h10):(4'hb)]);
  assign wire120 = wire3[(2'h2):(1'h0)];
  assign wire121 = (~^(8'hb7));
  assign wire122 = wire6[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg123 <= $signed((!($unsigned(wire2[(2'h2):(1'h1)]) >>> (-$unsigned(reg16)))));
      if (reg14)
        begin
          reg124 <= (~|{(wire116 ? reg7 : $unsigned((wire122 && wire117))),
              wire5[(4'ha):(2'h2)]});
          reg125 <= (^$signed(wire121));
          reg126 <= $unsigned({$signed(wire91)});
        end
      else
        begin
          reg124 <= wire121[(3'h4):(1'h1)];
          reg125 <= $signed((($signed(wire93[(2'h3):(2'h2)]) > $signed(wire118)) ?
              reg9[(3'h5):(3'h5)] : reg10));
          reg126 <= wire120[(1'h0):(1'h0)];
        end
      reg127 <= ((~($unsigned($unsigned(wire93)) & (-{wire117,
          wire2}))) >> reg126[(3'h5):(3'h4)]);
      reg128 <= (wire91 ?
          ((wire114[(1'h1):(1'h0)] < {$unsigned((8'h9e))}) == $signed({(wire117 ?
                  wire18 : wire3)})) : $signed(reg10[(3'h7):(2'h3)]));
      reg129 <= $signed($signed(wire3));
    end
  assign wire130 = wire122;
  assign wire131 = {wire119};
  always
    @(posedge clk) begin
      reg132 <= (8'hba);
      if ((wire93 && {$signed($signed({(7'h40)}))}))
        begin
          reg133 <= wire121[(4'h8):(3'h5)];
          reg134 <= reg15[(3'h5):(1'h1)];
          if (wire118)
            begin
              reg135 <= $unsigned((!$signed(((wire118 >>> reg13) ?
                  {wire130} : (wire93 && wire2)))));
              reg136 <= ((~^$signed(reg16)) ^ (+reg128[(2'h3):(1'h0)]));
            end
          else
            begin
              reg135 <= (+wire3[(3'h4):(2'h2)]);
              reg136 <= (reg126 ?
                  $unsigned(reg11) : (wire18[(2'h3):(2'h2)] - $unsigned($unsigned(wire114[(3'h6):(1'h1)]))));
              reg137 <= (~(reg127 >>> wire131));
            end
        end
      else
        begin
          if ($signed($signed($signed(((~reg16) | wire5)))))
            begin
              reg133 <= (((~$signed($signed(reg8))) ?
                      (($signed(reg123) ? reg8 : (reg8 ? (8'h9e) : wire93)) ?
                          wire131[(3'h6):(3'h4)] : $unsigned((reg11 == wire118))) : ((wire118[(4'h8):(1'h1)] ?
                              (reg127 | wire120) : (wire0 && (8'hba))) ?
                          reg136 : ((^~reg126) <<< (^~wire0)))) ?
                  ((8'ha7) ?
                      (8'haa) : ($signed({wire116, reg8}) == {(wire117 ?
                              reg13 : wire116)})) : $signed((^$signed(wire130))));
              reg134 <= wire93;
              reg135 <= $unsigned(((~^$signed(wire120)) ?
                  reg128[(2'h3):(2'h3)] : reg135[(3'h7):(2'h2)]));
            end
          else
            begin
              reg133 <= {(((reg129 ? reg126 : (^~(8'ha9))) ?
                          {(reg132 ? reg128 : wire3),
                              ((8'ha4) ?
                                  reg136 : reg126)} : reg10[(4'h9):(2'h2)]) ?
                      $signed(((wire5 < (8'ha7)) ?
                          (|reg128) : (~&reg12))) : $signed(reg15))};
            end
          reg136 <= reg136[(1'h0):(1'h0)];
          if ((^~($signed((8'ha2)) ^~ $unsigned(reg123))))
            begin
              reg137 <= reg15;
              reg138 <= (&reg14);
              reg139 <= wire18;
              reg140 <= (wire119[(3'h6):(2'h3)] ? reg124 : wire0);
            end
          else
            begin
              reg137 <= $unsigned($signed($signed(wire3[(2'h2):(1'h1)])));
              reg138 <= reg127;
              reg139 <= ($unsigned((+wire2)) <<< (8'hb6));
              reg140 <= $unsigned((~|$signed(wire91[(4'h9):(2'h2)])));
              reg141 <= $signed(($signed($signed($unsigned(wire122))) && $signed((reg12 ?
                  (reg133 << (8'ha9)) : $unsigned(reg137)))));
            end
          reg142 <= (8'hae);
          if ((($signed(($signed(wire0) ?
                  $signed(wire91) : reg140[(1'h0):(1'h0)])) ?
              $unsigned(wire117) : $signed($unsigned(((8'ha7) >> wire119)))) << $unsigned((&((-wire3) <= (wire119 ?
              reg7 : (8'hb0)))))))
            begin
              reg143 <= (8'hbc);
              reg144 <= wire3;
              reg145 <= $signed($signed({{wire3},
                  $unsigned(reg15[(3'h7):(3'h4)])}));
            end
          else
            begin
              reg143 <= reg124[(3'h4):(1'h1)];
              reg144 <= $signed(reg140);
              reg145 <= (|reg139[(1'h1):(1'h0)]);
              reg146 <= ({(+$unsigned((reg143 ? wire117 : reg11))),
                      $unsigned($signed(wire117))} ?
                  (!reg129[(3'h4):(1'h0)]) : (~(-$signed($signed(reg142)))));
            end
        end
    end
  assign wire147 = reg132[(3'h6):(2'h3)];
  assign wire148 = (reg137[(3'h7):(2'h3)] == {($signed((^~wire114)) ?
                           reg143 : ((|reg15) << (reg132 <= reg134)))});
endmodule

module module94
#(parameter param113 = {((~((8'ha8) ? ((7'h42) - (7'h42)) : ((8'h9c) ? (8'hae) : (8'hae)))) ? ((((8'hb8) - (8'hb3)) ? {(8'ha5), (8'h9d)} : (&(8'ha7))) != (((8'hb8) & (8'hbf)) & ((7'h44) << (8'hae)))) : (({(8'hb8)} ? ((8'h9f) ^~ (7'h44)) : ((8'hb1) != (8'ha1))) - ((8'hbd) ? ((8'ha2) >> (8'hb1)) : (~&(8'ha2)))))})
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire98;
  input wire [(4'h9):(1'h0)] wire97;
  input wire [(4'hf):(1'h0)] wire96;
  input wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  assign y = {wire112,
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
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire99 = (~|(^~wire98[(1'h0):(1'h0)]));
  assign wire100 = $signed({{wire97,
                           ((^wire96) >>> (wire97 ? wire99 : wire97))}});
  assign wire101 = wire97[(3'h6):(3'h4)];
  assign wire102 = ((~^{wire98[(4'hd):(4'h8)],
                           ($unsigned(wire95) < wire97[(4'h8):(2'h3)])}) ?
                       wire101 : ((wire95[(3'h4):(3'h4)] >= (wire101[(2'h3):(1'h0)] <<< (^~wire96))) == (!(~$signed((8'h9d))))));
  assign wire103 = (~|wire99);
  assign wire104 = wire95;
  assign wire105 = ($unsigned($unsigned($signed({wire104}))) ?
                       wire104 : (~&$unsigned(((~^wire101) <= (!wire99)))));
  assign wire106 = {(wire97[(2'h2):(1'h0)] ?
                           (wire104[(4'hc):(4'ha)] != $unsigned((wire103 != (8'hb0)))) : (((wire102 << wire102) ?
                               $unsigned((7'h43)) : (wire102 ?
                                   wire98 : wire102)) >> {(~&wire98)}))};
  assign wire107 = ((~|wire99) ?
                       (&$unsigned(wire96[(4'h8):(3'h7)])) : (!$signed({$unsigned(wire98),
                           wire95})));
  assign wire108 = wire100[(3'h7):(1'h1)];
  assign wire109 = (!wire97);
  always
    @(posedge clk) begin
      reg110 <= $signed($unsigned($signed($signed(wire100))));
      reg111 <= (($unsigned(((wire99 > wire106) ?
          $unsigned(wire106) : (wire97 < wire105))) ^~ $signed(reg110[(1'h1):(1'h0)])) != wire104[(4'h9):(2'h2)]);
    end
  assign wire112 = $signed(wire105[(3'h7):(3'h7)]);
endmodule

module module19
#(parameter param89 = (((((-(8'hbd)) ? ((7'h42) ? (7'h44) : (8'hac)) : ((8'h9c) ? (8'ha2) : (8'ha4))) ? (((8'ha3) <<< (8'hb2)) << ((8'hbe) ? (8'haf) : (8'hb0))) : (&((8'haf) ? (8'ha4) : (8'ha6)))) <= {({(8'hb0), (7'h40)} ? ((8'ha8) ^ (8'ha1)) : ((8'hbb) ? (8'ha4) : (7'h40))), ({(8'h9e), (8'hbf)} ? {(8'ha0), (8'ha5)} : ((8'h9e) != (8'h9f)))}) ? (8'ha2) : {(~|({(8'hb0), (7'h44)} != ((8'hb1) ? (7'h40) : (8'hbf)))), (!(((8'hab) ? (8'ha1) : (8'haf)) ? (-(8'haa)) : ((8'had) > (8'hb0))))}), 
parameter param90 = param89)
(y, clk, wire20, wire21, wire22, wire23, wire24);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire81;
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire25,
                 wire81,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire25 = $signed($unsigned(($unsigned((^wire22)) < $unsigned($signed(wire22)))));
  always
    @(posedge clk) begin
      reg26 <= ({$signed(((wire23 != wire23) ?
              $signed(wire25) : $signed((8'ha0)))),
          wire24} | (($unsigned((wire22 || wire20)) ?
          $signed(((8'hb0) > wire21)) : (wire23[(4'ha):(4'h9)] + $signed(wire21))) && {$signed((^~wire25))}));
      reg27 <= reg26;
      reg28 <= $unsigned((($signed(wire21) >>> ({wire21,
          wire23} << reg27[(4'hf):(3'h6)])) <= wire25[(2'h2):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (wire24)
        begin
          reg29 <= wire21;
          reg30 <= $unsigned(reg28);
          reg31 <= $signed({{$signed($unsigned(wire22)),
                  $signed((~&(8'ha1)))}});
          reg32 <= ($signed((-($unsigned(wire25) ?
                  $unsigned(reg27) : {reg31}))) ?
              {wire20, wire22} : $signed($unsigned(reg29)));
        end
      else
        begin
          reg29 <= (7'h44);
          reg30 <= (^(($signed($signed(wire22)) || wire23[(3'h4):(3'h4)]) && (8'ha6)));
        end
      reg33 <= $unsigned(wire21);
      reg34 <= (|wire21[(1'h0):(1'h0)]);
      reg35 <= ($unsigned($unsigned($unsigned(((8'h9f) ?
          reg33 : reg31)))) >> $unsigned((~(-reg27[(4'he):(4'ha)]))));
      reg36 <= reg32;
    end
  module37 #() modinst82 (.wire41(reg26), .clk(clk), .y(wire81), .wire38(reg32), .wire40(reg28), .wire39(wire25));
  always
    @(posedge clk) begin
      reg83 <= ((({$signed(reg31), wire20[(2'h2):(1'h1)]} ?
          reg28 : {$signed((8'ha8))}) ^~ wire20) && $unsigned($unsigned(((+wire25) ^~ reg32[(3'h5):(2'h3)]))));
      reg84 <= $unsigned((~|(-(&wire23))));
      reg85 <= $signed((reg32[(3'h7):(2'h2)] ~^ (8'ha7)));
      reg86 <= ((~|reg36) ? (^~wire24) : $signed(reg36[(3'h5):(1'h0)]));
      reg87 <= reg36[(3'h7):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg88 <= (~|((~^$unsigned({wire23})) ?
          $unsigned(($signed(reg31) ? (reg26 - reg85) : {(8'hb3)})) : reg30));
    end
endmodule

module module37
#(parameter param79 = (~&((({(8'hb3)} ? (~(8'hb0)) : (&(8'ha3))) ? ({(8'hb8)} ? ((8'h9c) ? (8'ha4) : (8'ha0)) : {(7'h43), (8'hb2)}) : (^(^(7'h40)))) ? (((-(8'ha1)) ? ((8'hbd) ? (8'hb6) : (8'ha7)) : ((8'hba) ? (7'h44) : (8'hbd))) ? ({(8'ha6)} ? (^~(7'h43)) : (~|(8'haf))) : ((~&(8'hb6)) ^~ (!(8'ha8)))) : ((8'hbd) ? ((~&(7'h43)) ? ((7'h42) ? (8'ha8) : (7'h44)) : ((8'hb0) <<< (8'hbb))) : ((~^(8'ha2)) <= ((8'hb1) ? (8'hb1) : (8'hb0)))))), 
parameter param80 = {{({{param79}, (param79 != param79)} && (+(|param79)))}})
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(4'ha):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire58,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire42 = wire40;
  assign wire43 = {wire41[(1'h1):(1'h1)], wire41};
  assign wire44 = {$unsigned($signed(($unsigned(wire40) != (wire43 == (8'ha0))))),
                      (($unsigned({wire41, wire39}) << $unsigned(wire43)) ?
                          $signed($unsigned(wire40)) : {wire38})};
  assign wire45 = $unsigned($signed($unsigned($unsigned((!wire39)))));
  assign wire46 = wire42;
  assign wire47 = (wire42[(2'h3):(2'h3)] ?
                      wire41[(4'h8):(3'h5)] : wire38[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire43[(3'h5):(1'h0)])
        begin
          reg48 <= $unsigned(wire44[(4'hc):(4'h8)]);
          if (reg48[(2'h2):(1'h0)])
            begin
              reg49 <= $signed((|$signed((wire42[(4'hb):(3'h5)] ?
                  (wire42 ? wire44 : wire43) : wire43[(2'h3):(2'h3)]))));
              reg50 <= (wire42[(4'ha):(3'h7)] ?
                  (^~(~|$unsigned($signed(reg49)))) : wire41);
            end
          else
            begin
              reg49 <= (~^$unsigned(($signed($unsigned(wire39)) ?
                  (((8'hab) ? wire47 : wire47) ?
                      (wire39 ?
                          (7'h44) : wire47) : $signed(wire47)) : wire46)));
            end
          reg51 <= (~^$signed((~^{(&reg49)})));
          reg52 <= (reg49 ? $unsigned(wire41) : wire43);
        end
      else
        begin
          reg48 <= reg50;
        end
    end
  assign wire53 = $signed(wire46);
  always
    @(posedge clk) begin
      reg54 <= wire41;
      reg55 <= wire45;
      reg56 <= wire39[(2'h2):(2'h2)];
      reg57 <= {(~{reg56[(1'h1):(1'h0)]}), (!{wire42[(2'h2):(1'h0)]})};
    end
  assign wire58 = (^~reg52[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg59 <= reg52;
      reg60 <= reg54[(1'h1):(1'h1)];
      if ((8'h9c))
        begin
          reg61 <= (+(8'hac));
          reg62 <= {(~|($unsigned((^~wire44)) ?
                  $unsigned($unsigned(wire53)) : {((8'hb3) ? reg48 : reg59),
                      $signed(wire53)})),
              $signed((~^(^{reg57, (7'h40)})))};
          if (reg54[(4'h8):(3'h5)])
            begin
              reg63 <= (~((wire40[(1'h0):(1'h0)] || reg60[(1'h1):(1'h1)]) && $unsigned(reg57)));
              reg64 <= reg56[(1'h1):(1'h0)];
              reg65 <= $unsigned(((8'hb4) || $unsigned(reg60[(3'h6):(1'h0)])));
            end
          else
            begin
              reg63 <= $signed(reg56);
              reg64 <= ($unsigned(wire47[(3'h4):(3'h4)]) ? wire58 : (8'hab));
              reg65 <= $unsigned($unsigned({(!(~reg55)),
                  reg55[(3'h4):(2'h3)]}));
              reg66 <= ((~^$unsigned(((|wire58) ~^ $unsigned((8'had))))) ?
                  (~$signed((^~reg56))) : wire53[(1'h0):(1'h0)]);
              reg67 <= (({$signed({reg49, reg56}), (8'hbc)} - reg57) ?
                  $signed(reg49[(4'h8):(3'h4)]) : (&(!$signed({wire47}))));
            end
          reg68 <= wire42;
          reg69 <= $unsigned(reg57[(3'h5):(3'h5)]);
        end
      else
        begin
          reg61 <= (~&($signed(reg49[(4'hb):(1'h1)]) ?
              (|reg67[(3'h4):(1'h0)]) : (~&wire44[(5'h13):(4'hb)])));
          reg62 <= (reg51[(5'h10):(2'h3)] ?
              (^~$unsigned($signed(reg67[(2'h3):(2'h3)]))) : $signed(reg49[(1'h0):(1'h0)]));
          if ((wire39[(1'h0):(1'h0)] | reg57[(4'h8):(3'h6)]))
            begin
              reg63 <= reg57;
            end
          else
            begin
              reg63 <= (~|(((reg64 ? $unsigned(wire44) : reg51[(4'h8):(3'h5)]) ?
                      $signed(reg50) : $signed((wire43 + reg55))) ?
                  {((reg52 < reg56) <= reg54)} : (wire53[(2'h3):(1'h1)] << $unsigned($signed(reg61)))));
            end
          reg64 <= ((wire41[(3'h7):(3'h6)] <= $signed(($unsigned(reg51) - (^~reg62)))) && wire58);
          reg65 <= {(+($signed($unsigned(wire39)) ^~ (wire43[(1'h0):(1'h0)] | (~(8'h9c))))),
              $signed(reg51)};
        end
    end
  assign wire70 = {reg68,
                      $unsigned(($signed(reg66) ?
                          ($unsigned((8'hbd)) ? reg60 : wire47) : reg69))};
  assign wire71 = wire47[(5'h10):(1'h0)];
  assign wire72 = $unsigned(reg64[(3'h4):(1'h0)]);
  assign wire73 = $unsigned($signed(($unsigned((wire42 ? (8'hb6) : reg49)) ?
                      reg59[(3'h7):(3'h6)] : $signed(wire58[(4'hd):(4'h9)]))));
  assign wire74 = $signed(wire72[(3'h6):(2'h2)]);
  assign wire75 = ({$unsigned(($unsigned(reg55) <<< $signed(wire42)))} ?
                      $unsigned((8'ha1)) : $signed((reg51 <<< reg66)));
  assign wire76 = (+(!$unsigned(wire39)));
  assign wire77 = (+{wire42});
  assign wire78 = $unsigned(wire39);
endmodule
