module top
#(parameter param181 = (-{(^~((~|(8'hb3)) ? (&(8'hb9)) : ((7'h43) ? (8'hba) : (8'hb8))))}), 
parameter param182 = (~param181))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire179;
  wire [(3'h6):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire179,
                 wire121,
                 wire32,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 (1'h0)};
  assign wire5 = $signed({$signed((~^(wire0 * wire2))), $unsigned((+{wire4}))});
  assign wire6 = wire3;
  assign wire7 = ((wire4 - wire5[(1'h0):(1'h0)]) <= wire5[(2'h3):(2'h3)]);
  assign wire8 = wire1[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg9 <= wire2[(4'hc):(3'h7)];
      reg10 <= wire3;
      reg11 <= reg9[(3'h6):(2'h2)];
      if (reg11[(3'h4):(3'h4)])
        begin
          reg12 <= $unsigned((~(wire6[(1'h0):(1'h0)] + ($signed(wire0) ?
              $signed(wire0) : reg11))));
          reg13 <= $unsigned((8'h9d));
          if ((~((!reg13[(3'h5):(2'h3)]) >> ((wire4[(3'h4):(3'h4)] ?
              (!(8'hae)) : (~&wire0)) + $signed($unsigned(reg13))))))
            begin
              reg14 <= (^~(!$unsigned(((-reg11) || reg11))));
              reg15 <= (($unsigned(reg12) ?
                      $unsigned((|(+reg11))) : ($unsigned($signed(wire4)) ?
                          ($unsigned(wire0) ?
                              (wire3 || wire5) : (wire5 * wire4)) : wire3)) ?
                  $signed($unsigned((~&(wire7 < reg11)))) : (~($signed($unsigned(wire2)) ?
                      reg12[(3'h7):(3'h5)] : reg14)));
              reg16 <= $unsigned((^~reg11[(2'h3):(2'h3)]));
              reg17 <= $signed(reg11);
              reg18 <= (8'ha2);
            end
          else
            begin
              reg14 <= (~|{($unsigned($unsigned(wire1)) ~^ ((reg9 ~^ reg13) - (~^reg11)))});
              reg15 <= reg9[(1'h1):(1'h1)];
              reg16 <= (-$unsigned((8'hb9)));
              reg17 <= reg13[(3'h4):(1'h0)];
            end
          reg19 <= reg18;
        end
      else
        begin
          reg12 <= $unsigned(reg13[(3'h4):(1'h0)]);
          reg13 <= $signed($unsigned((wire6 ?
              $unsigned($unsigned(wire3)) : ($unsigned((8'hb2)) | (~reg19)))));
          if ($unsigned((8'hb0)))
            begin
              reg14 <= wire8;
              reg15 <= $signed((8'ha8));
            end
          else
            begin
              reg14 <= $signed((($signed((reg10 - reg17)) & reg12) ?
                  wire4[(4'hb):(2'h3)] : (({reg18} ?
                      $unsigned(wire8) : (wire6 ?
                          wire4 : (8'hb8))) <<< $signed(wire0))));
              reg15 <= reg16[(2'h3):(2'h2)];
              reg16 <= (|($unsigned((~&$signed(reg13))) ? reg16 : wire4));
            end
        end
    end
  assign wire20 = $signed($signed($unsigned(wire4[(4'hb):(1'h1)])));
  assign wire21 = {($unsigned((^reg14)) << wire5[(1'h0):(1'h0)]),
                      $unsigned((!(~{(8'hb5)})))};
  assign wire22 = wire20[(4'hb):(3'h7)];
  assign wire23 = $signed((~|wire8[(2'h3):(2'h3)]));
  assign wire24 = (reg16 ~^ reg13);
  assign wire25 = $unsigned((^reg13));
  assign wire26 = (~(-$signed(wire4[(4'he):(1'h1)])));
  assign wire27 = ($unsigned($signed(wire0[(2'h3):(2'h2)])) >>> (wire4[(4'hb):(4'h9)] ?
                      (~|$unsigned((~&reg19))) : {reg9}));
  always
    @(posedge clk) begin
      if ({((~^(((8'hbd) <= wire27) < wire21)) ? reg12 : reg18), wire22})
        begin
          if ($signed((wire27 * reg14)))
            begin
              reg28 <= wire2;
            end
          else
            begin
              reg28 <= ((($unsigned(((8'h9e) && (8'h9e))) > (&reg9)) && wire22) ?
                  $signed(wire25[(2'h3):(1'h0)]) : reg17);
            end
          reg29 <= $signed($signed((^$unsigned((!wire3)))));
          reg30 <= ($signed(reg15) ?
              ((|((wire7 ? reg11 : wire24) ?
                  $signed(wire0) : wire7[(2'h3):(1'h0)])) << wire0[(1'h0):(1'h0)]) : reg15[(3'h6):(1'h0)]);
        end
      else
        begin
          reg28 <= {wire2, $unsigned((8'haa))};
          if (wire2[(3'h5):(3'h5)])
            begin
              reg29 <= wire23;
              reg30 <= ((wire26 > $signed((reg16 ?
                      wire23 : {wire21, wire22}))) ?
                  (^(~wire2[(3'h7):(3'h6)])) : {$unsigned((wire8[(3'h5):(3'h5)] | ((8'ha7) ?
                          wire6 : reg10)))});
            end
          else
            begin
              reg29 <= wire22;
            end
        end
      reg31 <= ((8'ha6) ?
          $unsigned(($signed((&reg17)) <= ({reg18} < {(8'h9e)}))) : reg18[(2'h2):(1'h0)]);
    end
  assign wire32 = reg13;
  module33 #() modinst122 (.clk(clk), .wire36(wire24), .wire37(wire23), .wire38(reg14), .wire35(reg12), .wire34(reg13), .y(wire121));
  module123 #() modinst180 (.wire128(wire22), .wire124(reg10), .y(wire179), .wire125(wire20), .wire127(reg19), .wire126(reg17), .clk(clk));
endmodule

module module123  (y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire128;
  input wire signed [(4'hd):(1'h0)] wire127;
  input wire [(5'h12):(1'h0)] wire126;
  input wire signed [(2'h2):(1'h0)] wire125;
  input wire [(5'h13):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire129;
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  assign y = {wire178,
                 wire176,
                 wire148,
                 wire147,
                 wire146,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg133,
                 (1'h0)};
  assign wire129 = wire127;
  assign wire130 = wire128[(2'h3):(2'h3)];
  assign wire131 = ((~^$signed(wire127[(2'h2):(2'h2)])) << {wire129});
  assign wire132 = wire127[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg133 <= (wire131[(3'h6):(3'h6)] >= wire132);
    end
  assign wire134 = wire128[(1'h1):(1'h0)];
  assign wire135 = (({$unsigned({wire127,
                           wire131})} != wire129) && ((($signed((8'ha1)) ?
                       wire125[(2'h2):(1'h0)] : (8'hb8)) << {(^wire131)}) <<< $unsigned((wire130[(2'h2):(1'h0)] + wire126))));
  assign wire136 = ($unsigned(wire126) ~^ $signed($signed(($signed((8'ha5)) ?
                       $signed(wire128) : (wire135 < wire129)))));
  assign wire137 = $signed({$signed(({wire132} ?
                           (wire126 ?
                               wire124 : wire134) : ((7'h44) ^~ (8'hbb))))});
  assign wire138 = ((wire137 ?
                           $signed(wire137) : (&$unsigned((wire136 >= (8'ha7))))) ?
                       wire129 : (~(~^(!$unsigned(wire127)))));
  assign wire139 = $unsigned(wire134[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg140 <= wire127;
      reg141 <= (wire130 ?
          (~&$unsigned((((8'hb0) < wire126) ?
              (wire134 ^~ wire139) : $signed(wire134)))) : {wire130[(2'h3):(2'h2)]});
      if ((wire137 ?
          $unsigned((wire139[(1'h0):(1'h0)] ^ ((wire139 << wire138) ?
              (wire136 ? wire134 : wire138) : (reg133 ?
                  wire132 : reg133)))) : wire131[(4'h8):(3'h6)]))
        begin
          reg142 <= wire132;
          reg143 <= ((8'hac) << wire131[(3'h6):(2'h2)]);
          reg144 <= $unsigned({$unsigned(wire132[(1'h0):(1'h0)])});
        end
      else
        begin
          reg142 <= (~|wire136);
          reg143 <= (~^$unsigned(wire136[(3'h5):(1'h0)]));
          reg144 <= wire129[(1'h1):(1'h0)];
          reg145 <= (-$unsigned(((|reg140[(4'hc):(2'h3)]) > {(8'hbf)})));
        end
    end
  assign wire146 = $unsigned((8'h9f));
  assign wire147 = $unsigned(wire132[(1'h0):(1'h0)]);
  assign wire148 = {$signed((!(+(+reg133))))};
  module149 #() modinst177 (wire176, clk, wire131, wire147, wire127, wire137);
  assign wire178 = (!$unsigned($signed(wire131)));
endmodule

module module33
#(parameter param119 = ((((^~(8'h9c)) < (&{(8'hbd)})) ? ((((8'ha7) ? (7'h44) : (8'hb4)) << ((8'ha3) * (8'ha8))) ? {(8'hb8)} : (^(8'hac))) : (({(8'h9f)} || ((8'ha4) < (8'hb1))) ? (((8'ha8) ^~ (8'ha7)) ^ ((8'ha2) + (7'h40))) : {{(8'ha3), (8'hb0)}})) ? (((&((8'hac) ? (8'had) : (8'ha0))) <= ({(8'ha5), (8'hb7)} >> ((8'hb0) ? (8'hb0) : (8'h9c)))) + ((((8'hac) >>> (7'h43)) - {(8'ha2)}) && {((8'ha5) ? (8'hb4) : (8'ha7)), ((8'ha5) > (8'hbb))})) : {(!(!{(8'hb0)})), (^~(8'hae))}), 
parameter param120 = (!(((+(param119 ? param119 : (8'h9c))) ? ((param119 ? param119 : param119) ? (param119 != (8'h9c)) : param119) : param119) >> param119)))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(2'h2):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire118,
                 wire116,
                 wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 (1'h0)};
  assign wire39 = (^~{{wire38, ((-wire34) ? (|wire38) : (+wire35))},
                      wire34[(4'h9):(2'h3)]});
  assign wire40 = ((($signed($unsigned(wire39)) >>> ((wire35 ?
                              wire34 : wire36) >= wire34[(4'hc):(4'ha)])) ?
                          wire35[(1'h1):(1'h0)] : wire36) ?
                      wire36 : (wire36[(4'h8):(3'h7)] ^~ $signed((8'hbe))));
  assign wire41 = $signed(((~|(wire35[(1'h1):(1'h1)] ?
                          (wire37 * wire40) : ((8'h9c) ? wire36 : wire40))) ?
                      $unsigned({(&wire38)}) : wire39[(4'ha):(1'h1)]));
  assign wire42 = wire40[(3'h5):(3'h5)];
  assign wire43 = $unsigned($signed($signed((8'ha6))));
  assign wire44 = (!(~|$unsigned($unsigned({wire38}))));
  assign wire45 = $signed((($unsigned((wire34 << wire36)) - wire43[(5'h13):(3'h4)]) ?
                      {($signed(wire35) - (wire40 ?
                              wire37 : wire43))} : wire42));
  assign wire46 = ((|{($unsigned(wire42) ? wire42 : (&(8'hbc)))}) ^ wire41);
  always
    @(posedge clk) begin
      reg47 <= (-((-(+(wire37 == wire45))) ?
          $unsigned((7'h44)) : (^~$signed((wire40 ^ wire41)))));
      reg48 <= $unsigned(((~(!wire42)) ?
          (~&wire43) : $unsigned($unsigned((wire44 ? wire35 : (8'h9e))))));
      reg49 <= ((|((^~((8'hb7) ? (8'hb0) : wire37)) ?
              (8'hac) : ((reg47 & wire42) < wire43))) ?
          (7'h43) : $unsigned(({(|reg48)} != $unsigned((wire44 == wire34)))));
      reg50 <= (~|((|(^(wire43 < wire39))) == (($unsigned(wire35) || $signed(wire44)) ?
          (|$unsigned(wire36)) : (^~$unsigned(wire37)))));
    end
  assign wire51 = $unsigned(wire34);
  always
    @(posedge clk) begin
      if ({wire51, wire35[(1'h0):(1'h0)]})
        begin
          reg52 <= wire51[(2'h3):(1'h0)];
          reg53 <= $signed(((($unsigned(wire42) ?
              (wire40 ? (8'haa) : wire39) : (8'ha3)) ^ ((+wire34) ?
              wire34[(4'h9):(1'h1)] : (8'hae))) >> $unsigned($unsigned({(8'h9f),
              reg48}))));
          if (($unsigned(((((8'h9f) ? reg47 : (8'hb9)) ?
              (wire45 ?
                  reg47 : wire51) : reg48[(2'h3):(2'h3)]) * $unsigned((-wire42)))) - ($signed(wire37[(2'h2):(1'h1)]) ?
              ($unsigned($signed(wire36)) ?
                  ((!reg53) ?
                      $unsigned(reg48) : $unsigned(wire44)) : $signed($unsigned(wire42))) : ({$signed((8'had))} ?
                  ({wire38} ?
                      (wire37 ?
                          (8'ha8) : wire36) : $signed(wire35)) : {(wire51 - reg50)}))))
            begin
              reg54 <= $unsigned((((8'hb0) ?
                  ((~|reg52) <<< (wire34 - wire51)) : $signed($unsigned(wire38))) <<< wire36[(3'h6):(3'h4)]));
            end
          else
            begin
              reg54 <= $signed({((((7'h41) <<< wire51) && wire46[(3'h6):(2'h3)]) ?
                      $unsigned((&wire39)) : $signed((wire42 * reg47)))});
              reg55 <= {$unsigned($signed((wire38 >> wire45))),
                  (^$signed(((wire51 ? wire38 : reg48) != (wire45 ?
                      wire36 : wire40))))};
            end
          reg56 <= wire41;
        end
      else
        begin
          reg52 <= wire40[(2'h2):(2'h2)];
          reg53 <= $unsigned($signed($signed(reg55)));
          reg54 <= {$signed((wire51[(4'h9):(1'h1)] ^~ $signed($unsigned(reg50))))};
          if ($signed(reg48))
            begin
              reg55 <= (($unsigned(reg55) != reg56[(3'h6):(2'h2)]) > $unsigned(wire45[(4'hb):(3'h4)]));
              reg56 <= wire36[(2'h2):(2'h2)];
              reg57 <= {$unsigned($unsigned($unsigned($signed(wire34)))),
                  ($signed((8'hb2)) & reg52[(4'hc):(2'h3)])};
              reg58 <= reg50[(1'h1):(1'h0)];
              reg59 <= wire34;
            end
          else
            begin
              reg55 <= $signed((!reg56));
              reg56 <= reg57[(1'h1):(1'h1)];
            end
        end
    end
  assign wire60 = (+$unsigned($signed(wire46)));
  assign wire61 = {(reg53[(5'h10):(4'ha)] ?
                          wire60 : ($signed($unsigned(reg56)) ?
                              reg53 : {$signed(wire39), $unsigned(reg59)}))};
  assign wire62 = reg59;
  module63 #() modinst117 (wire116, clk, reg54, reg58, wire44, wire40, reg56);
  assign wire118 = wire35[(1'h0):(1'h0)];
endmodule

module module63
#(parameter param114 = ((((^(^(8'hb0))) > {(~^(8'h9e))}) && (((&(8'hb7)) ? ((8'h9c) != (8'hbb)) : {(8'ha3)}) + (+((8'h9c) || (8'hb0))))) & ((~&(((8'ha7) ? (8'hbe) : (8'hb3)) != ((8'had) ? (7'h44) : (8'hb7)))) ? {({(8'hb0)} ? ((8'hb0) ? (8'h9c) : (8'hb8)) : ((8'haa) >> (8'haf)))} : ({((8'ha4) ? (8'h9f) : (8'h9e))} ? (8'hb6) : ((+(8'ha1)) ? (8'ha5) : {(8'hbe), (8'hb7)})))), 
parameter param115 = ((8'ha0) ? (((((8'ha4) << param114) ? {param114} : (param114 ~^ param114)) ? param114 : (param114 ? (param114 ? param114 : param114) : ((8'h9c) <<< (7'h44)))) ? (((param114 ? param114 : param114) ? {param114} : (param114 ? param114 : param114)) ~^ ({param114, (8'haf)} >> (param114 ? param114 : param114))) : param114) : (-(8'hb7))))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire signed [(2'h2):(1'h0)] wire66;
  input wire [(4'he):(1'h0)] wire65;
  input wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire71,
                 wire70,
                 wire69,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 (1'h0)};
  assign wire69 = (wire68 ?
                      $signed($unsigned(wire68[(4'ha):(2'h2)])) : ((wire68[(2'h2):(2'h2)] ?
                          wire67[(3'h4):(2'h2)] : ($unsigned(wire68) ?
                              {wire66} : (wire68 << wire66))) << wire66[(2'h2):(1'h1)]));
  assign wire70 = $unsigned($signed({$signed(wire65)}));
  assign wire71 = wire69;
  always
    @(posedge clk) begin
      if ((wire66[(2'h2):(1'h1)] ?
          ({$unsigned({wire71}), wire68} ?
              wire71 : ($signed((|(8'ha0))) ?
                  $unsigned(wire67[(2'h3):(2'h3)]) : $signed($unsigned(wire70)))) : $unsigned(($unsigned(((8'hb4) < wire66)) * $signed(wire67)))))
        begin
          reg72 <= ((($unsigned(((8'hbd) != wire65)) < $signed((8'hbd))) ^ {(^$unsigned((8'ha5)))}) >> $signed((~&$unsigned(wire66[(2'h2):(1'h0)]))));
          reg73 <= {wire69, $signed(wire65)};
          reg74 <= ($unsigned(reg72[(4'ha):(4'ha)]) ?
              ((|(|$signed(wire70))) ?
                  reg73[(2'h3):(1'h1)] : wire69) : wire69[(3'h4):(1'h1)]);
          reg75 <= ({(wire69[(3'h5):(2'h3)] ?
                  wire68[(1'h0):(1'h0)] : $signed(((8'hbb) ?
                      wire68 : reg72)))} << ({reg72[(2'h3):(1'h0)]} ?
              (reg72 ?
                  $unsigned((wire65 >= wire70)) : {reg74[(1'h1):(1'h1)]}) : wire71[(1'h1):(1'h1)]));
        end
      else
        begin
          reg72 <= reg72[(4'h8):(3'h5)];
          reg73 <= (8'ha7);
          reg74 <= ($signed(wire71[(3'h4):(2'h3)]) ?
              $unsigned(($unsigned(wire65[(4'hc):(4'h9)]) ?
                  reg74[(3'h5):(1'h1)] : (((8'hb5) ? reg74 : wire70) ?
                      $unsigned(reg72) : reg73[(4'h9):(2'h2)]))) : $signed(wire69));
          if ($unsigned(wire69))
            begin
              reg75 <= {$unsigned((^$unsigned(reg72))), (-(|(-(^~wire64))))};
              reg76 <= ($unsigned((-$signed((wire70 == wire67)))) ?
                  ((^~(wire64 ? $unsigned(wire71) : $signed((8'haa)))) ?
                      $unsigned($signed($signed(reg72))) : ((!reg75[(3'h4):(1'h1)]) && {$signed(wire68)})) : reg73);
              reg77 <= ($unsigned({$unsigned((wire65 ? reg72 : wire69)),
                  reg76[(2'h3):(2'h3)]}) + (($unsigned((~|wire68)) ?
                  {(~^reg72),
                      wire67} : wire66) ^~ $unsigned(($unsigned(reg76) < {wire70}))));
            end
          else
            begin
              reg75 <= wire64;
              reg76 <= (reg72[(4'he):(1'h0)] <<< (~^wire67));
              reg77 <= (~^wire67);
            end
        end
      reg78 <= $unsigned(wire71);
      reg79 <= ($unsigned(wire68) ?
          ((~reg73) ?
              $unsigned(($signed(wire70) <<< (wire65 >= wire66))) : $signed(((wire68 ?
                      (8'h9e) : wire64) ?
                  reg76[(3'h5):(3'h4)] : $signed((8'hbc))))) : reg76[(3'h5):(2'h2)]);
      reg80 <= (~^wire64[(1'h0):(1'h0)]);
      if (reg72)
        begin
          if (reg79[(1'h1):(1'h1)])
            begin
              reg81 <= (-$unsigned($signed($signed(wire70[(4'ha):(3'h5)]))));
              reg82 <= $signed($signed((-($signed(reg72) & $unsigned((8'hac))))));
            end
          else
            begin
              reg81 <= ($signed(((reg72[(4'h8):(3'h4)] ^ $unsigned(reg74)) ?
                  reg76[(1'h1):(1'h0)] : ((reg78 ? wire67 : reg72) ?
                      (-wire66) : $signed(wire67)))) == (&(8'hb8)));
              reg82 <= reg81;
              reg83 <= ($unsigned($signed($signed(reg72[(4'h8):(3'h6)]))) ^~ reg73[(3'h5):(3'h4)]);
            end
          reg84 <= reg75[(2'h3):(1'h0)];
        end
      else
        begin
          reg81 <= ((reg84 | (reg78[(5'h12):(4'hf)] != wire65)) == ($signed($unsigned(((8'hae) ?
                  reg78 : reg79))) ?
              $signed(($unsigned(reg77) ?
                  {wire65,
                      reg73} : (wire68 << (8'hbd)))) : reg79[(1'h1):(1'h0)]));
          reg82 <= reg78[(3'h7):(3'h5)];
          reg83 <= wire67;
          reg84 <= $signed(wire70);
          if ((^((wire70 ?
                  wire66[(1'h0):(1'h0)] : $signed((wire71 ? reg74 : reg79))) ?
              (reg82[(2'h3):(2'h3)] == ((wire68 >> wire70) ?
                  reg73[(3'h4):(2'h3)] : ((8'hae) * reg79))) : {((|reg82) ?
                      (!wire66) : {wire69}),
                  (~|$unsigned(reg76))})))
            begin
              reg85 <= (wire68 + ($signed(($signed((8'ha7)) ?
                  $signed((8'hb6)) : reg72[(4'h8):(3'h5)])) ^ ($unsigned(((8'hbb) - reg81)) ?
                  $unsigned($unsigned(reg83)) : wire65[(4'hd):(4'h8)])));
              reg86 <= $signed(($signed(((~&wire71) ?
                  ((8'hac) ? wire64 : reg74) : (wire69 ?
                      wire64 : reg82))) <<< (((wire69 ?
                      reg72 : reg77) <= (^reg73)) ?
                  $unsigned((-reg85)) : wire64[(1'h0):(1'h0)])));
              reg87 <= $signed($signed(wire66));
              reg88 <= wire68;
            end
          else
            begin
              reg85 <= reg88;
              reg86 <= (7'h40);
              reg87 <= $unsigned(wire66[(2'h2):(1'h1)]);
              reg88 <= (8'haa);
              reg89 <= (-$unsigned(reg79[(3'h4):(2'h2)]));
            end
        end
    end
  assign wire90 = ($signed($signed(wire70[(4'he):(4'h8)])) == (({$signed(wire69)} ?
                          ({reg87, (8'hbd)} ~^ ((8'ha5) >> reg82)) : (reg89 ?
                              reg86 : wire71)) ?
                      reg85 : wire64));
  assign wire91 = reg89[(3'h4):(3'h4)];
  assign wire92 = $signed(reg77[(1'h0):(1'h0)]);
  assign wire93 = reg80;
  always
    @(posedge clk) begin
      reg94 <= wire68;
      if (((wire65 != wire66) ?
          {reg85[(3'h7):(1'h1)]} : $unsigned((^~wire65[(4'h9):(1'h1)]))))
        begin
          reg95 <= reg77;
          reg96 <= $signed(($signed($signed(reg80[(5'h12):(4'hc)])) && $unsigned(($unsigned(reg85) ?
              $unsigned(reg80) : wire65))));
          if ((~&wire93[(5'h10):(1'h1)]))
            begin
              reg97 <= reg73;
              reg98 <= wire93;
              reg99 <= $unsigned((reg86 > ((!((8'haa) ? wire92 : (8'ha9))) ?
                  wire69 : reg97[(2'h2):(1'h1)])));
            end
          else
            begin
              reg97 <= (~reg96[(3'h5):(2'h2)]);
              reg98 <= reg72;
              reg99 <= (wire91[(2'h2):(2'h2)] ?
                  (reg99[(4'hb):(1'h1)] >>> reg84) : (~|reg97));
              reg100 <= {((($signed(wire68) ?
                          reg87 : reg85[(3'h4):(2'h2)]) ^ reg99) ?
                      (wire93 ?
                          $signed((^~reg85)) : reg89) : (reg98[(2'h3):(1'h1)] ?
                          (reg94[(3'h6):(3'h5)] ^ (|reg77)) : reg85)),
                  ($unsigned($signed(reg80)) && (reg72[(4'hb):(3'h6)] && reg80[(3'h6):(3'h5)]))};
              reg101 <= (|((~^reg78) & reg95[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg95 <= (|$unsigned($signed($unsigned((reg97 >>> reg94)))));
          if (reg94[(2'h2):(1'h1)])
            begin
              reg96 <= $unsigned($signed(wire92));
              reg97 <= reg99[(4'ha):(4'h8)];
              reg98 <= ($unsigned({$unsigned((reg81 ? wire69 : reg73)),
                  ((reg100 < (8'hb9)) >> reg75[(1'h1):(1'h0)])}) << $unsigned(($unsigned((-reg89)) ?
                  (!reg94[(2'h2):(1'h0)]) : (^wire67[(2'h2):(2'h2)]))));
              reg99 <= reg81[(5'h12):(5'h10)];
              reg100 <= {$signed({$signed((reg82 != reg86)), wire92}),
                  $signed(($signed((reg94 == reg84)) ?
                      $signed((8'h9c)) : $unsigned((|wire69))))};
            end
          else
            begin
              reg96 <= $unsigned($signed((reg82 ?
                  reg75 : ({reg72, wire93} != {reg99, reg84}))));
              reg97 <= $signed($signed((({wire64, reg82} ?
                  (+wire66) : $signed(reg95)) >= reg75)));
            end
          reg101 <= reg101;
          reg102 <= ($unsigned($signed(((reg98 <<< reg87) ^ {wire90}))) != reg82);
        end
    end
  assign wire103 = reg102;
  assign wire104 = (((wire91[(1'h0):(1'h0)] >>> ($unsigned(reg83) <<< (reg86 ?
                           reg75 : wire103))) & $unsigned($signed((reg94 ?
                           reg82 : wire64)))) ?
                       (((+reg88) ?
                           wire90 : wire65[(4'ha):(4'ha)]) >>> $unsigned(reg80)) : {(reg96 && reg89),
                           reg96});
  assign wire105 = wire92[(4'h8):(2'h3)];
  assign wire106 = {wire91};
  assign wire107 = $signed(reg95);
  assign wire108 = $unsigned(((~&($signed(wire92) | wire93[(5'h12):(4'hb)])) + (~|$unsigned($unsigned(wire106)))));
  assign wire109 = reg101[(2'h3):(1'h1)];
  assign wire110 = (~|($unsigned(reg97[(2'h2):(1'h1)]) ?
                       wire104[(3'h7):(3'h6)] : $signed((wire90[(3'h7):(3'h5)] & {reg86}))));
  assign wire111 = {$unsigned(({$unsigned(reg88),
                           (reg77 & (8'ha2))} >> (|reg76[(3'h7):(3'h4)])))};
  assign wire112 = reg77[(2'h2):(2'h2)];
  assign wire113 = $unsigned((|(($unsigned(wire66) * (~|reg77)) & ({wire104,
                       (8'hb5)} + $signed(reg83)))));
endmodule

module module149  (y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire153;
  input wire signed [(4'hc):(1'h0)] wire152;
  input wire signed [(4'hd):(1'h0)] wire151;
  input wire signed [(2'h2):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire175;
  wire signed [(4'hc):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire173;
  wire signed [(4'hf):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(4'hd):(1'h0)] wire156;
  wire signed [(4'hd):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire154;
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire156,
                 wire155,
                 wire154,
                 reg169,
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
                 (1'h0)};
  assign wire154 = $signed($signed(($signed($unsigned(wire150)) <= ((wire150 ?
                           (7'h43) : wire152) ?
                       (+wire152) : wire153))));
  assign wire155 = (^~$signed((~^(^~(8'hb7)))));
  assign wire156 = (8'ha3);
  always
    @(posedge clk) begin
      reg157 <= (wire151[(4'h9):(2'h2)] > wire155[(2'h3):(2'h3)]);
      reg158 <= $unsigned(({(wire152 + wire150[(2'h2):(1'h1)]),
              {$signed(wire156)}} ?
          ($unsigned(wire154[(1'h1):(1'h0)]) ?
              ($unsigned(wire156) ?
                  wire154[(1'h0):(1'h0)] : wire150[(1'h0):(1'h0)]) : {$signed(wire151)}) : wire151));
      reg159 <= $unsigned(wire151[(4'hb):(3'h6)]);
      reg160 <= {$unsigned((+($signed(wire153) ?
              (~&reg157) : wire155[(1'h1):(1'h1)]))),
          ($unsigned($signed($signed(wire151))) ?
              ($unsigned((wire154 ^~ wire152)) ?
                  (|$signed(wire150)) : ($signed(wire150) >= {wire153})) : ($signed($signed(wire155)) - (~&wire152)))};
      reg161 <= reg159;
    end
  always
    @(posedge clk) begin
      if ($signed((^~(!wire156))))
        begin
          if ((~|(reg161 ?
              {{$signed(reg157)}} : $unsigned((~$unsigned(wire154))))))
            begin
              reg162 <= wire156;
              reg163 <= (wire154 ^ $unsigned(($unsigned($unsigned(reg162)) - ((~reg157) << wire154[(1'h1):(1'h1)]))));
              reg164 <= $unsigned(wire153);
              reg165 <= ((|$signed({reg163[(4'hc):(4'h9)],
                      $unsigned(wire155)})) ?
                  (~&(&reg160[(4'h8):(3'h6)])) : {$unsigned(wire153[(4'h9):(4'h9)]),
                      (+(~wire150[(2'h2):(1'h0)]))});
              reg166 <= (+(^wire153));
            end
          else
            begin
              reg162 <= $unsigned(((reg163 ?
                      reg161[(1'h0):(1'h0)] : (reg157[(1'h0):(1'h0)] ?
                          ((8'ha2) ? reg161 : reg166) : {wire150, reg163})) ?
                  (8'hae) : reg162));
              reg163 <= ((($signed((~&wire154)) ^ (^~(wire150 >= reg166))) ?
                      (7'h43) : {reg162}) ?
                  (&((+(|reg161)) | $unsigned((!reg165)))) : $unsigned(reg164));
              reg164 <= ($unsigned((wire152 ?
                  reg162 : wire154)) - reg159[(1'h1):(1'h0)]);
              reg165 <= ($signed(wire150) ?
                  ((~{reg158}) ?
                      ((!reg164[(4'h8):(3'h6)]) == $unsigned((reg164 & reg161))) : wire153[(4'ha):(3'h6)]) : (($signed(((8'ha1) <<< reg163)) ?
                      ((reg160 ? wire154 : reg158) ?
                          {reg165,
                              reg162} : reg159[(4'he):(4'ha)]) : $signed(reg165[(4'h9):(1'h1)])) << ((8'ha0) ^~ {reg165,
                      (^wire155)})));
              reg166 <= ($unsigned(reg163[(4'h9):(2'h3)]) >>> $unsigned($signed($unsigned(reg165[(5'h10):(2'h2)]))));
            end
          reg167 <= {(+(+(wire153[(4'h8):(2'h2)] ?
                  (reg161 ? reg157 : wire153) : $signed(reg161))))};
        end
      else
        begin
          reg162 <= ($unsigned(($unsigned((~|reg158)) ?
              (wire154 == $unsigned(wire156)) : wire154[(4'ha):(3'h5)])) << ((wire152[(4'hc):(4'h9)] ?
                  reg159[(4'hd):(1'h1)] : $signed(reg167[(3'h4):(2'h2)])) ?
              (8'ha9) : (^{reg161})));
          reg163 <= $unsigned(wire155);
          reg164 <= $signed(reg161);
          reg165 <= $unsigned($unsigned(reg158[(3'h6):(2'h2)]));
          if (reg163)
            begin
              reg166 <= ($unsigned($signed($unsigned(reg160))) ?
                  (~^(^~$signed($unsigned(wire152)))) : ((8'ha6) == (reg161[(1'h0):(1'h0)] || ($unsigned(wire152) ?
                      wire156[(4'ha):(3'h6)] : {wire152}))));
              reg167 <= (8'hac);
              reg168 <= $unsigned(wire156[(3'h6):(3'h4)]);
              reg169 <= reg160;
            end
          else
            begin
              reg166 <= ($signed(reg164) ^ (((((7'h42) ? (8'ha6) : wire152) ?
                          (!reg161) : $signed(reg167)) ?
                      wire150 : $unsigned({reg165})) ?
                  ((reg158 ? (~(8'hbb)) : $unsigned(wire153)) & ((~&reg166) ?
                      (reg162 ? (8'ha2) : reg159) : (!reg166))) : reg160));
              reg167 <= $unsigned((8'ha2));
              reg168 <= $unsigned($signed(reg162));
              reg169 <= (^~$signed(((^~reg157[(3'h4):(3'h4)]) ?
                  reg157 : ($unsigned(wire155) ?
                      wire154[(4'h8):(3'h7)] : (reg161 ? reg166 : wire152)))));
            end
        end
    end
  assign wire170 = (reg157 ?
                       reg164[(3'h6):(1'h1)] : $unsigned((&$unsigned((reg159 ^ (8'hb4))))));
  assign wire171 = (reg167[(2'h3):(2'h2)] < wire170);
  assign wire172 = (7'h42);
  assign wire173 = wire155;
  assign wire174 = wire151;
  assign wire175 = reg162[(1'h1):(1'h0)];
endmodule
