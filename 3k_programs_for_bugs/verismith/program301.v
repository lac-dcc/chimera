module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire157,
                 wire155,
                 wire37,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg21,
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
                 reg7,
                 (1'h0)};
  assign wire4 = (~^wire1[(3'h4):(2'h3)]);
  assign wire5 = ($unsigned(wire4[(3'h7):(3'h6)]) ?
                     {(~^wire4[(4'h9):(4'h9)]),
                         wire0} : (~(|(!$signed(wire2)))));
  assign wire6 = $signed(((wire3[(2'h2):(1'h0)] ?
                         (+(wire5 ? (8'hbf) : wire1)) : (8'h9d)) ?
                     wire5 : ({$signed(wire3),
                         wire1[(3'h4):(1'h1)]} <<< $signed({wire4, (8'ha6)}))));
  always
    @(posedge clk) begin
      if ($unsigned(wire1[(2'h2):(1'h1)]))
        begin
          reg7 <= (wire2 + $signed(($signed((!wire5)) != (^$signed(wire4)))));
          reg8 <= wire5;
          if ({$unsigned(wire1[(3'h4):(3'h4)]),
              $unsigned($unsigned({{(8'hbf)}, (8'hb7)}))})
            begin
              reg9 <= $unsigned(($unsigned(($signed(wire4) ?
                      wire3 : (!wire0))) ?
                  $signed($unsigned((wire0 > reg8))) : wire2));
              reg10 <= {($unsigned(wire3[(4'hd):(4'hd)]) + {(7'h40),
                      {$signed(reg8)}}),
                  {(wire2 ?
                          ($signed(wire1) ?
                              (reg9 <<< wire3) : (8'ha0)) : wire3[(4'h8):(2'h3)]),
                      wire0[(3'h5):(2'h2)]}};
            end
          else
            begin
              reg9 <= wire2;
            end
          reg11 <= ($signed($signed((7'h41))) ?
              (8'ha5) : (~^{$signed((wire1 ^ (8'h9e)))}));
          reg12 <= $signed((|(|{(reg8 ? (8'ha7) : wire4), (~reg9)})));
        end
      else
        begin
          reg7 <= ((~&wire0[(3'h6):(3'h4)]) ?
              reg12 : $unsigned($signed(reg8[(4'hb):(3'h7)])));
          reg8 <= reg8;
          if (wire5[(3'h6):(2'h2)])
            begin
              reg9 <= (^~$unsigned($unsigned((reg8 ?
                  (wire3 ? reg11 : (8'h9d)) : (reg7 >>> wire4)))));
              reg10 <= ((reg8[(3'h6):(3'h6)] ?
                  reg7 : reg8[(4'he):(4'hd)]) >> (&(~|({wire6} <<< {reg11}))));
              reg11 <= (~&$signed($unsigned(wire4)));
            end
          else
            begin
              reg9 <= reg11;
              reg10 <= (|$signed($signed(((wire4 <<< reg10) ?
                  $unsigned((8'ha6)) : reg7))));
              reg11 <= wire5[(1'h1):(1'h1)];
              reg12 <= $unsigned((wire0[(4'h9):(3'h6)] >>> {(wire4[(4'hd):(4'h9)] ?
                      (reg10 || reg11) : wire1),
                  reg9[(4'hd):(4'hd)]}));
            end
        end
      if (wire6)
        begin
          reg13 <= $signed((|$signed((wire6 || (~|(8'ha5))))));
        end
      else
        begin
          if ({(reg7[(4'h8):(1'h0)] == (~^wire0[(2'h2):(1'h1)]))})
            begin
              reg13 <= ((~^$signed((wire1[(2'h2):(1'h1)] ?
                      reg7 : (reg13 >= wire6)))) ?
                  reg8[(4'hf):(3'h7)] : (|wire4));
              reg14 <= ((8'h9e) ?
                  (8'hbe) : ($unsigned($unsigned((reg9 != reg9))) & ((wire5 ?
                      ((8'hac) && wire0) : $signed(wire0)) < $unsigned(reg7))));
              reg15 <= reg14[(4'hb):(1'h0)];
            end
          else
            begin
              reg13 <= ((&reg8) ?
                  reg10[(3'h6):(1'h1)] : $unsigned(((^(reg7 ? wire2 : wire1)) ?
                      ($unsigned(reg14) ? $unsigned(reg7) : wire2) : {{reg10},
                          (wire3 >>> reg14)})));
              reg14 <= $unsigned((8'hb1));
              reg15 <= (reg12[(2'h3):(2'h2)] >> {$unsigned(wire4[(5'h11):(1'h0)]),
                  {reg8}});
              reg16 <= ({reg11,
                  ($unsigned((^~reg14)) & $signed({wire4, reg8}))} <= (8'hba));
              reg17 <= (|wire3[(4'hc):(3'h7)]);
            end
          reg18 <= wire0[(2'h3):(1'h0)];
          reg19 <= $unsigned((wire1 ?
              reg9 : ((reg16 | (-reg10)) ?
                  reg12[(3'h6):(3'h5)] : (reg11[(2'h2):(1'h1)] ?
                      (reg8 << reg15) : $signed(reg12)))));
          reg20 <= ((^(((reg14 ? reg7 : (8'hab)) * reg15[(3'h6):(2'h3)]) ?
                  $unsigned((reg19 ?
                      wire4 : reg12)) : $unsigned($signed(reg14)))) ?
              $signed((($unsigned(wire1) ?
                      (reg18 * wire1) : wire5[(3'h6):(2'h2)]) ?
                  (reg14 | reg18[(1'h1):(1'h0)]) : $unsigned({reg19,
                      (8'hb7)}))) : {((~^(8'ha1)) <= wire4),
                  (((wire1 - wire3) ^ $unsigned(wire3)) ?
                      reg15[(2'h2):(1'h0)] : reg14[(4'hc):(2'h3)])});
        end
      reg21 <= (!(((~&{reg13}) + $unsigned({reg19})) > (&wire2[(4'h9):(3'h6)])));
    end
  assign wire22 = (8'haa);
  assign wire23 = $unsigned((wire6 ?
                      $signed($signed((wire2 ?
                          wire2 : reg11))) : $unsigned(((reg20 | wire3) ?
                          (~reg10) : $unsigned(reg19)))));
  assign wire24 = $signed($unsigned((reg18 ? wire1 : $signed(wire3))));
  assign wire25 = wire1[(2'h2):(2'h2)];
  assign wire26 = wire5;
  assign wire27 = $unsigned({(+($unsigned(reg16) <<< {reg19, wire2}))});
  assign wire28 = {(&reg7[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      reg29 <= $signed($unsigned(reg20[(4'h9):(2'h3)]));
      if ((((!((7'h43) ? $signed(reg19) : reg9)) | ({(reg7 ? (8'hb1) : reg11)} ?
              wire5[(1'h0):(1'h0)] : (~^(wire24 ? (7'h42) : reg13)))) ?
          ($signed(wire22[(3'h4):(1'h0)]) * $unsigned($unsigned((wire1 > reg12)))) : reg13))
        begin
          reg30 <= ((+{reg14}) >>> (reg17[(1'h1):(1'h1)] ? reg17 : (8'hb4)));
          if ($unsigned(reg8))
            begin
              reg31 <= ((&(~|wire4)) ?
                  (((8'ha6) ?
                      (wire28 + (+(8'hab))) : (wire5 ?
                          $unsigned(reg17) : (wire4 == (8'ha7)))) ~^ (reg16[(4'he):(4'h9)] <<< $unsigned($unsigned(reg18)))) : reg29);
              reg32 <= reg8;
            end
          else
            begin
              reg31 <= ((~reg15) >> (((~&reg14) | ((reg7 ? (8'hb1) : reg8) ?
                  wire0 : (~&reg19))) > $unsigned(((^~wire1) ?
                  (wire22 * reg11) : (!(8'hbc))))));
            end
          reg33 <= (~&(($signed($unsigned(wire1)) ?
              ((|wire1) ?
                  reg8 : $signed((8'hba))) : reg12) + $signed((&reg29[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg30 <= wire2[(4'ha):(1'h1)];
          reg31 <= $signed(reg13);
          if ((&((8'hac) - (-reg13))))
            begin
              reg32 <= wire5;
              reg33 <= wire26[(2'h3):(2'h2)];
              reg34 <= $unsigned(($unsigned(reg19) ? (8'h9f) : (~(8'hb7))));
              reg35 <= reg13;
            end
          else
            begin
              reg32 <= (^reg10);
              reg33 <= (+($unsigned({$signed(reg33)}) || ((8'hbc) ?
                  $signed($signed(reg7)) : wire26)));
              reg34 <= (!(~^($signed($signed(wire25)) ?
                  (~&$signed(reg10)) : $signed(reg8[(2'h3):(1'h1)]))));
              reg35 <= $signed($unsigned($signed((+{reg21, reg9}))));
            end
        end
      reg36 <= {(~&$unsigned(((wire2 ? reg21 : reg9) | reg31[(3'h4):(2'h2)])))};
    end
  assign wire37 = wire5;
  module38 #() modinst156 (wire155, clk, reg17, wire23, wire27, reg9);
  assign wire157 = $unsigned((~|reg21));
endmodule

module module38
#(parameter param153 = (&(((|((8'ha7) & (8'hb7))) <= ((-(8'hb1)) ? ((8'ha3) ^~ (8'h9e)) : {(8'h9d)})) ? (8'ha0) : ((((8'ha1) ? (8'hb2) : (8'had)) ? (8'h9c) : ((7'h40) >= (8'ha0))) ~^ {(^(8'h9e))}))), 
parameter param154 = (&param153))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(3'h7):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire144;
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire117,
                 wire67,
                 wire62,
                 wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire119,
                 wire144,
                 reg152,
                 reg151,
                 reg44,
                 reg45,
                 reg46,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire43 = $unsigned($signed({$unsigned($unsigned((8'hbc))),
                      (wire42[(4'hc):(2'h3)] ?
                          $unsigned(wire40) : $signed(wire39))}));
  always
    @(posedge clk) begin
      reg44 <= wire41;
      reg45 <= wire42;
      reg46 <= $unsigned((~^(~&(~&reg45[(4'hf):(1'h1)]))));
    end
  assign wire47 = wire42[(4'ha):(4'h8)];
  assign wire48 = ($unsigned(({reg44, (8'hbb)} >>> {(reg46 ? wire47 : (8'hb4)),
                      reg46})) ^ {reg44[(2'h2):(2'h2)]});
  assign wire49 = ((+$signed(wire40)) ?
                      ((($signed(reg45) << wire39[(2'h3):(2'h2)]) + $unsigned(reg46)) ?
                          {(8'hbc),
                              $unsigned(wire42[(1'h1):(1'h0)])} : (~|$signed({wire39,
                              wire43}))) : $signed({wire42[(2'h2):(1'h1)],
                          (8'hb3)}));
  module50 #() modinst63 (wire62, clk, wire42, reg44, wire43, reg46);
  always
    @(posedge clk) begin
      reg64 <= (|$unsigned(wire39));
      reg65 <= (wire41 ?
          wire40 : ((~&$unsigned(wire40)) | ((wire40 ^~ $unsigned(reg64)) ?
              (^(~&reg46)) : wire47)));
      reg66 <= (|reg44);
    end
  assign wire67 = ((-(8'hbe)) ^~ reg65[(4'hb):(3'h5)]);
  module68 #() modinst118 (.wire72(reg45), .clk(clk), .wire69(wire67), .wire71(wire41), .wire73(reg66), .wire70(wire39), .y(wire117));
  assign wire119 = (8'ha8);
  module120 #() modinst145 (.y(wire144), .wire124(reg45), .wire121(wire39), .wire122(wire40), .clk(clk), .wire123(wire49));
  assign wire146 = $unsigned($unsigned((-(wire144 > wire62))));
  assign wire147 = wire40[(3'h5):(1'h1)];
  assign wire148 = reg46;
  assign wire149 = reg44[(3'h5):(3'h4)];
  assign wire150 = (wire149[(4'hb):(3'h6)] ?
                       ($unsigned(reg44[(2'h3):(2'h2)]) + ((~(wire144 ?
                               (8'hb0) : wire147)) ?
                           wire144 : (((8'h9f) ? wire144 : (8'hb1)) ?
                               (~|wire47) : wire42))) : wire146);
  always
    @(posedge clk) begin
      reg151 <= (($signed(wire119) <= wire39) > reg46);
      reg152 <= {($unsigned((+$unsigned(reg65))) != $unsigned(wire49))};
    end
endmodule

module module120
#(parameter param143 = (~|(&(((&(8'hb7)) || ((8'ha7) >>> (8'hb4))) >= {{(8'h9d)}}))))
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire124;
  input wire [(2'h2):(1'h0)] wire123;
  input wire signed [(2'h2):(1'h0)] wire122;
  input wire [(4'hf):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  reg [(4'hc):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire125 = {$signed({$unsigned((wire122 ? wire122 : wire123))})};
  assign wire126 = (~$unsigned(wire124[(2'h3):(1'h1)]));
  assign wire127 = wire122[(1'h1):(1'h1)];
  assign wire128 = $unsigned($unsigned((^(wire124 ? (+wire124) : wire125))));
  assign wire129 = $unsigned(((~&(|$signed(wire128))) ?
                       ((8'ha3) > (wire121[(4'h9):(3'h5)] <<< wire121[(2'h2):(1'h0)])) : wire122));
  assign wire130 = (&$unsigned($signed($signed((+wire128)))));
  assign wire131 = ($signed((wire123 ? wire127[(4'h9):(4'h9)] : (|wire121))) ?
                       {(wire121[(3'h4):(3'h4)] ?
                               $signed($unsigned(wire121)) : ($signed(wire127) | (wire122 << wire129))),
                           ((-(wire127 ? wire123 : wire121)) ?
                               wire125 : (|((8'h9f) != wire122)))} : (({(wire129 ?
                                   (8'hac) : (8'hb0))} * {(wire128 ?
                                   (8'hb9) : wire130)}) ?
                           $signed($signed((~(8'hae)))) : $unsigned((&(8'ha1)))));
  assign wire132 = wire126;
  assign wire133 = {$signed($signed($unsigned((wire127 >= wire132)))),
                       $unsigned(wire132[(1'h1):(1'h1)])};
  assign wire134 = ($unsigned((~&$unsigned($unsigned(wire125)))) ?
                       wire123[(1'h1):(1'h1)] : (({(+wire125),
                                   (wire121 < wire132)} ?
                               ($unsigned(wire133) > $unsigned(wire127)) : wire123[(1'h1):(1'h1)]) ?
                           $unsigned($signed($unsigned(wire132))) : {(wire121[(3'h6):(2'h3)] ?
                                   $signed(wire132) : ((8'hb1) ?
                                       wire124 : wire126))}));
  assign wire135 = wire132[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg136 <= wire130[(4'h9):(1'h1)];
      reg137 <= wire128;
      reg138 <= (!wire129[(5'h10):(4'h8)]);
      reg139 <= ((wire128 & $unsigned(($unsigned(wire124) ?
              ((8'hbb) ? wire128 : wire126) : wire125))) ?
          $unsigned((((wire126 ?
              wire124 : wire131) != wire135) == ($signed(wire128) ?
              reg136 : wire121[(2'h2):(1'h0)]))) : (!($unsigned((reg137 << wire124)) >> {(wire124 ?
                  wire125 : wire126),
              (+(8'hb6))})));
    end
  assign wire140 = ((^reg138[(1'h0):(1'h0)]) > (reg136 ?
                       $signed(($signed(wire122) ?
                           wire123 : (~wire129))) : (~&$unsigned(wire125))));
  assign wire141 = reg139;
  assign wire142 = ($signed({((wire141 ?
                               wire121 : wire123) > $unsigned(wire125))}) ?
                       (((8'ha8) ?
                           ({wire124,
                               wire122} * reg136[(4'hc):(1'h0)]) : wire134[(5'h13):(4'h9)]) ~^ (-wire125[(3'h4):(2'h2)])) : $unsigned(($signed((~&wire128)) + $signed((wire128 & (8'ha4))))));
endmodule

module module68
#(parameter param115 = (((~^(((8'hb9) >= (8'ha4)) || (~^(8'hbf)))) * ((((8'hb0) >= (7'h42)) ~^ ((8'hb1) << (7'h42))) <<< (&(^~(8'hbe))))) ? (~((~|((8'hb5) ? (8'h9e) : (8'hbe))) != {((8'hab) ? (8'hbf) : (8'h9e))})) : (((((8'hbf) ? (8'hbe) : (8'haa)) ? ((8'haf) ^~ (8'haa)) : ((8'hb5) || (8'ha0))) ? ({(8'h9f)} ? ((8'hbd) == (7'h43)) : (8'h9c)) : (((8'hb7) ? (8'h9f) : (8'hb3)) * (8'ha0))) ? (&(((8'ha9) ? (8'hbe) : (8'hac)) ? {(8'hb1)} : ((7'h40) < (8'had)))) : (|((|(8'hb0)) - ((8'ha2) ? (7'h41) : (8'hbd)))))), 
parameter param116 = param115)
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  input wire [(3'h7):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  input wire signed [(4'hd):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(3'h6):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  reg [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire96,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg98,
                 reg97,
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
                 (1'h0)};
  assign wire74 = $unsigned(((wire73 ? {(^~(8'ha4))} : (~|wire72)) ?
                      {wire70,
                          $unsigned(wire71[(1'h1):(1'h0)])} : wire70[(4'hd):(4'ha)]));
  assign wire75 = ((wire73[(2'h2):(2'h2)] ?
                      (((wire72 ?
                          (8'h9d) : wire69) <= $unsigned(wire73)) - wire71) : (8'hb0)) == wire70[(5'h13):(5'h13)]);
  assign wire76 = (~$signed($signed({(wire70 ? (8'h9d) : wire71)})));
  assign wire77 = ({$signed(wire76)} ?
                      ($unsigned($signed($unsigned((8'had)))) || wire76) : (-((~(wire69 ?
                          wire74 : wire76)) & ($unsigned(wire71) ?
                          $signed(wire74) : $signed((8'ha4))))));
  assign wire78 = $unsigned(wire71[(3'h5):(1'h0)]);
  assign wire79 = $unsigned($signed(((~(wire76 && wire73)) ?
                      wire74[(3'h5):(1'h1)] : (wire75 * $signed(wire74)))));
  assign wire80 = $signed(wire70[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg81 <= $signed((wire70 != $signed($signed(wire80[(3'h6):(3'h6)]))));
      if ({$unsigned($unsigned((wire74 ? (8'hbc) : $unsigned(wire75)))),
          ((((wire77 ? wire69 : (8'h9c)) ? $signed(wire77) : $signed(wire74)) ?
                  $signed(wire72[(1'h1):(1'h0)]) : ($unsigned(wire73) && {wire77})) ?
              wire76[(1'h1):(1'h1)] : (~&($signed(reg81) ?
                  (wire69 ? wire73 : wire73) : (!wire69))))})
        begin
          reg82 <= {((~^({(8'hba),
                  wire73} | $unsigned(wire73))) <<< wire74[(3'h5):(3'h4)])};
          reg83 <= (~^wire74);
          reg84 <= ({reg82[(1'h1):(1'h0)],
              (reg81 ?
                  $unsigned((^wire70)) : ((~&(8'haa)) ?
                      wire79 : (wire76 ?
                          (8'ha4) : wire72)))} + $unsigned({$unsigned((wire77 != (8'ha2)))}));
        end
      else
        begin
          reg82 <= {((+wire69) ? wire71[(2'h3):(2'h2)] : reg83[(2'h3):(2'h3)]),
              (8'ha8)};
          if (($unsigned($unsigned((!(wire69 << reg82)))) & wire69))
            begin
              reg83 <= $signed({(8'hac), (~^{$unsigned(reg82)})});
              reg84 <= wire72[(4'hf):(2'h2)];
              reg85 <= $unsigned($unsigned(wire71));
              reg86 <= $signed($signed(wire76[(1'h1):(1'h0)]));
              reg87 <= wire74[(3'h4):(1'h1)];
            end
          else
            begin
              reg83 <= (((((!wire69) ?
                          (reg82 ? (8'hab) : reg87) : {reg82}) ^ ((reg83 ?
                          reg85 : reg85) > ((8'hbc) ? reg87 : wire80))) ?
                      $signed(((wire72 <= wire77) ?
                          reg86[(2'h3):(1'h1)] : reg81[(4'h8):(3'h4)])) : ($signed($signed(wire69)) || $unsigned($unsigned(wire69)))) ?
                  wire72 : wire77[(4'hf):(4'hf)]);
              reg84 <= ((reg87 ^ reg82[(3'h5):(3'h4)]) && wire74);
              reg85 <= $signed(wire72[(4'hd):(2'h2)]);
            end
          reg88 <= ((-(^{reg87, $unsigned(reg84)})) * (({$signed(reg81),
                  $signed((8'hb8))} - wire72[(1'h0):(1'h0)]) ?
              wire78[(3'h4):(1'h0)] : (wire77 ?
                  $signed(reg85[(1'h0):(1'h0)]) : (wire75[(4'hc):(3'h7)] ?
                      wire78[(1'h0):(1'h0)] : (~wire71)))));
          reg89 <= (($signed(wire71) ?
                  ($unsigned(wire77) ?
                      (^(reg83 <<< wire76)) : $signed(wire69[(3'h7):(2'h3)])) : (7'h44)) ?
              (~|($signed($signed(reg88)) ?
                  reg83[(1'h1):(1'h0)] : reg86[(4'h9):(2'h2)])) : wire73[(1'h0):(1'h0)]);
        end
      if ((({wire75[(3'h5):(2'h3)],
              $unsigned(reg87[(2'h3):(1'h0)])} >>> wire73[(1'h1):(1'h1)]) ?
          reg83 : $signed((^~(wire69 ^ (wire70 ? (8'ha9) : wire72))))))
        begin
          reg90 <= reg81;
        end
      else
        begin
          if (wire69[(4'ha):(4'h9)])
            begin
              reg90 <= (~reg85[(2'h2):(1'h0)]);
              reg91 <= {$unsigned((((~wire69) ?
                      {(7'h40),
                          wire78} : (wire69 - wire77)) < wire79[(4'hd):(1'h0)]))};
              reg92 <= $signed(wire72[(4'ha):(1'h0)]);
            end
          else
            begin
              reg90 <= (($signed($unsigned((wire69 ? reg87 : reg91))) ?
                      (!$unsigned(((7'h40) & wire69))) : reg87[(3'h5):(1'h1)]) ?
                  reg87[(4'ha):(4'h8)] : ((~|wire72[(3'h7):(3'h5)]) + $signed((!(~wire76)))));
              reg91 <= (+($unsigned(wire77) ?
                  ((!(~&(8'ha4))) ?
                      $unsigned(wire75) : (~&$unsigned(reg83))) : reg83));
              reg92 <= (+((((wire77 ? wire80 : wire75) >= $signed(reg85)) ?
                      $unsigned(reg86) : (|$unsigned(wire75))) ?
                  $unsigned(reg87[(4'hd):(1'h1)]) : {wire75[(4'hd):(1'h0)],
                      (~^wire74)}));
              reg93 <= ($signed(((reg87[(4'h8):(3'h7)] && (&reg88)) ?
                      $signed((wire79 ? reg84 : reg91)) : (((8'ha2) > wire69) ?
                          reg88 : (~&reg84)))) ?
                  $unsigned((($signed(reg85) ~^ (^wire72)) ?
                      $unsigned(reg87[(1'h0):(1'h0)]) : (8'h9f))) : (wire72[(3'h4):(3'h4)] ?
                      $unsigned(($signed(wire75) ?
                          $signed(wire75) : (wire78 | wire73))) : reg82[(2'h2):(1'h1)]));
            end
        end
      reg94 <= {wire73, $signed($unsigned(reg91[(3'h7):(1'h1)]))};
      reg95 <= (-reg87[(2'h2):(2'h2)]);
    end
  assign wire96 = wire79;
  always
    @(posedge clk) begin
      reg97 <= $signed($signed($signed((^(reg87 ? reg87 : wire75)))));
      reg98 <= $signed({($signed(((8'ha6) ^ wire74)) ?
              (-wire77) : {(reg84 == wire76), (wire78 <= wire76)}),
          wire96[(3'h7):(1'h1)]});
    end
  assign wire99 = (~^$signed(($unsigned(wire80) ?
                      $unsigned(reg81) : $unsigned(wire69))));
  assign wire100 = $signed((+$signed($unsigned((wire80 ? wire77 : reg83)))));
  assign wire101 = (|(wire77[(4'h9):(2'h2)] * {$signed((reg89 == wire73))}));
  assign wire102 = $signed({wire100});
  always
    @(posedge clk) begin
      if ($unsigned($signed((($unsigned(reg89) ?
          $unsigned(reg92) : reg95[(3'h7):(1'h1)]) ~^ (+(wire71 || wire99))))))
        begin
          reg103 <= $unsigned((&$signed($unsigned(reg85[(1'h0):(1'h0)]))));
          if ((^($signed($unsigned((-reg90))) == $signed((+(wire69 | reg103))))))
            begin
              reg104 <= (-((^({reg97,
                  reg85} | reg86[(3'h7):(2'h3)])) < wire73[(2'h2):(2'h2)]));
              reg105 <= $unsigned((+(~((~&reg88) ?
                  (wire71 ? wire100 : wire79) : $unsigned(wire80)))));
              reg106 <= wire79[(3'h4):(2'h3)];
              reg107 <= $signed(wire73);
            end
          else
            begin
              reg104 <= reg97;
              reg105 <= reg103;
            end
          reg108 <= {$unsigned($signed({(reg106 ? wire75 : (7'h42))}))};
        end
      else
        begin
          reg103 <= $signed((reg83 >>> (&$unsigned(reg84[(3'h5):(3'h5)]))));
          reg104 <= ((+$unsigned(({(8'hac)} >> (+(8'hbb))))) < $signed(((-(reg97 ?
                  reg107 : reg108)) ?
              $signed($unsigned(reg108)) : (-reg92[(3'h5):(3'h4)]))));
        end
      reg109 <= reg92;
      reg110 <= $unsigned({(^~($unsigned(reg83) + $unsigned(wire75))),
          (~|((|wire101) == $signed((8'hb0))))});
      reg111 <= (!(($signed((reg107 * reg88)) ?
          wire96[(4'hc):(3'h5)] : ($signed(wire78) ^ (wire73 | wire69))) ^ {((reg93 || (8'ha3)) || reg87[(1'h1):(1'h1)])}));
      reg112 <= (~&wire74[(3'h5):(1'h0)]);
    end
  assign wire113 = reg88;
  assign wire114 = ($unsigned((wire71[(3'h5):(2'h2)] & reg112)) ~^ {(+$signed((!(8'ha7))))});
endmodule

module module50  (y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire54;
  input wire signed [(4'ha):(1'h0)] wire53;
  input wire [(4'hf):(1'h0)] wire52;
  input wire [(4'hf):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  assign y = {wire61, wire60, wire59, wire57, wire56, wire55, reg58, (1'h0)};
  assign wire55 = (~^{({(wire53 ? wire54 : wire54), wire54} ^ (8'hb6)),
                      $unsigned(($unsigned((8'haa)) ?
                          (wire51 == wire53) : wire51))});
  assign wire56 = wire54[(4'hb):(3'h7)];
  assign wire57 = wire54;
  always
    @(posedge clk) begin
      reg58 <= $unsigned(wire51[(4'hc):(1'h0)]);
    end
  assign wire59 = (((|$unsigned((wire55 * reg58))) << (8'ha3)) ?
                      wire52 : wire56);
  assign wire60 = $unsigned((-wire57[(1'h0):(1'h0)]));
  assign wire61 = (((-$signed((&wire51))) ?
                      ($signed($unsigned(wire56)) | reg58) : $unsigned((|(wire57 ?
                          wire56 : wire53)))) > {(((^wire54) || wire56[(2'h3):(1'h1)]) ~^ wire57),
                      wire55});
endmodule
