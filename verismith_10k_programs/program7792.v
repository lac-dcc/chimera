module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire167,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire0 ?
          $signed((~(|wire0[(5'h12):(3'h4)]))) : $signed(($signed((wire3 - (8'hbd))) ?
              wire3 : (wire3[(3'h6):(1'h0)] || wire1))));
      if ((wire4[(1'h0):(1'h0)] ?
          ($signed((8'hb7)) || $unsigned(($signed((8'h9e)) ^~ $unsigned(wire1)))) : {$signed($unsigned(((8'ha6) ?
                  wire1 : wire4))),
              {(~|(wire4 ^~ wire0)),
                  ((wire4 >> wire2) ? $signed(wire3) : wire0)}}))
        begin
          reg6 <= $signed(wire1[(3'h7):(3'h6)]);
          reg7 <= ((($unsigned((wire1 ^~ reg6)) || ((|(7'h44)) ?
              wire4 : $unsigned((8'ha7)))) != wire0) || $signed((!(&(wire3 ?
              wire1 : wire4)))));
          reg8 <= wire4;
          reg9 <= (^~reg7[(1'h1):(1'h1)]);
        end
      else
        begin
          reg6 <= reg6;
        end
    end
  assign wire10 = (8'hac);
  assign wire11 = (+$unsigned((((~reg7) ?
                      wire0 : {(8'h9c)}) != reg7[(1'h1):(1'h1)])));
  assign wire12 = wire4;
  assign wire13 = wire1;
  assign wire14 = (^{((~&$unsigned(wire0)) ?
                          reg9[(2'h2):(1'h1)] : (~^wire4[(4'h9):(3'h6)])),
                      (!(wire3[(3'h5):(2'h2)] ?
                          wire3 : wire10[(1'h1):(1'h0)]))});
  assign wire15 = (reg7 ~^ ((-wire3) + (($signed(wire1) + (wire2 >>> wire4)) << (~&reg8))));
  assign wire16 = (&$unsigned({(reg8 != {wire14})}));
  always
    @(posedge clk) begin
      if ((|{($unsigned((wire1 ? (8'hac) : wire0)) ?
              (reg9[(2'h3):(1'h0)] >>> (-wire14)) : (reg6[(3'h4):(2'h3)] ?
                  (wire15 ? (8'ha4) : reg8) : (reg8 ? wire10 : wire10))),
          ($signed((wire13 ? wire15 : wire2)) ? reg7[(2'h2):(1'h0)] : wire1)}))
        begin
          reg17 <= (wire11 ?
              (~&$unsigned((!(wire10 <<< (7'h42))))) : $unsigned((~(-reg7))));
          reg18 <= ($signed($signed($signed($unsigned((8'ha2))))) ?
              ({(|(~^wire11)),
                  ((^wire15) & $signed(wire10))} <<< wire4) : ($signed(reg6[(2'h3):(2'h2)]) >>> $signed(((wire1 ?
                  wire2 : wire10) - (wire0 ^~ wire11)))));
        end
      else
        begin
          reg17 <= wire2[(3'h5):(2'h3)];
        end
      reg19 <= $unsigned(wire16[(4'h9):(3'h4)]);
      reg20 <= ($signed(wire10) <<< {($signed(reg6) ?
              (wire10[(2'h2):(1'h1)] + $unsigned(reg9)) : {(wire1 * wire13),
                  (reg18 ? reg6 : reg18)})});
      reg21 <= $unsigned((^~(-wire12[(4'h9):(3'h4)])));
      reg22 <= ((reg17 ^ wire10) ?
          $signed((((8'hb0) || {reg18}) * ($unsigned(reg7) | wire14[(3'h6):(3'h6)]))) : reg9);
    end
  assign wire23 = (7'h42);
  assign wire24 = (~^{(((~reg6) != wire0[(5'h13):(5'h11)]) ?
                          {{reg21}, $signed(reg5)} : reg7[(2'h2):(2'h2)])});
  assign wire25 = {$signed($signed((^~(^reg6)))),
                      ($signed(((wire15 ?
                              wire13 : wire14) <= reg21[(1'h1):(1'h1)])) ?
                          $signed($signed((wire4 ? wire4 : wire13))) : wire4)};
  assign wire26 = wire3;
  module27 #() modinst168 (.wire32(wire0), .wire29(reg20), .wire30(reg8), .y(wire167), .clk(clk), .wire28(wire10), .wire31(reg5));
endmodule

module module27
#(parameter param166 = (~&(~&{(8'hbe), (~^((8'hb9) ? (8'hb3) : (8'ha0)))})))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire164;
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  assign y = {wire100,
                 wire76,
                 wire34,
                 wire33,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire115,
                 wire116,
                 wire164,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg114,
                 (1'h0)};
  assign wire33 = $signed($unsigned($signed($unsigned(wire28))));
  assign wire34 = {$signed((-({wire28} ? (~wire28) : $unsigned(wire28))))};
  module35 #() modinst77 (wire76, clk, wire31, wire32, wire34, wire29);
  module78 #() modinst101 (wire100, clk, wire31, wire34, wire76, wire29, wire28);
  always
    @(posedge clk) begin
      reg102 <= $unsigned(((^~(~&(wire28 * wire31))) == $unsigned(wire100[(3'h4):(2'h3)])));
      reg103 <= ($signed($signed((^wire30))) ?
          (+(~&($signed(wire33) ?
              wire30[(4'h8):(1'h0)] : reg102[(3'h6):(1'h1)]))) : $signed((wire100[(3'h6):(3'h5)] < wire28[(5'h14):(2'h2)])));
      reg104 <= $unsigned({wire76[(4'h8):(3'h6)]});
      reg105 <= $unsigned(reg104[(3'h6):(3'h6)]);
      reg106 <= $signed((^~$unsigned({wire31[(4'hb):(1'h1)], (+wire28)})));
    end
  assign wire107 = ({$unsigned((~|(~&wire31)))} ^~ reg102);
  assign wire108 = (wire107 ? reg104[(1'h0):(1'h0)] : wire30[(1'h1):(1'h1)]);
  assign wire109 = $signed((!(({wire100, wire31} ?
                       ((8'ha4) ?
                           reg103 : wire29) : (|wire100)) < $unsigned((wire31 ?
                       wire100 : (8'hb0))))));
  assign wire110 = $signed((~|wire34[(5'h12):(2'h2)]));
  assign wire111 = (wire76[(4'h9):(2'h2)] ^~ wire76[(4'hd):(4'ha)]);
  assign wire112 = ($signed(($unsigned((wire111 ?
                       wire110 : wire100)) >>> (~&(wire110 ?
                       wire111 : wire28)))) ~^ ((($signed(wire110) ?
                           $unsigned((8'h9d)) : {(8'h9e), reg105}) ?
                       wire111 : (-(wire29 ?
                           wire76 : wire34))) ^ $unsigned({(~|wire110),
                       $signed(wire33)})));
  assign wire113 = (((-$unsigned($unsigned(wire112))) < $unsigned(wire112[(5'h11):(5'h10)])) ?
                       (((!wire29[(3'h5):(3'h5)]) + (wire100 ~^ (-wire111))) >= (reg103[(3'h7):(3'h4)] ?
                           $unsigned($signed((7'h40))) : ({wire100,
                               wire107} || $signed(wire109)))) : $signed((($unsigned(wire76) ?
                           (!wire109) : wire112[(5'h13):(5'h10)]) != wire110)));
  always
    @(posedge clk) begin
      reg114 <= {$unsigned($signed(((~(8'hbc)) << {wire28})))};
    end
  assign wire115 = $signed($unsigned(wire112));
  assign wire116 = reg102;
  module117 #() modinst165 (wire164, clk, wire100, wire107, reg114, wire111);
endmodule

module module117  (y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire121;
  input wire [(5'h12):(1'h0)] wire120;
  input wire [(5'h14):(1'h0)] wire119;
  input wire [(5'h15):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire163;
  wire signed [(5'h14):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire138;
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= wire119[(4'h9):(4'h9)];
      if ($unsigned($unsigned(wire118[(4'h9):(1'h0)])))
        begin
          reg123 <= wire121;
        end
      else
        begin
          reg123 <= ((-reg123) ?
              ((({reg123} ? reg122 : $signed((7'h43))) ?
                  $signed({wire119}) : wire118[(4'ha):(3'h4)]) >= (8'hb4)) : (8'hb8));
          reg124 <= wire118[(4'hd):(1'h1)];
          reg125 <= ($signed($signed(({wire119,
              reg122} + reg123))) ^ $unsigned($unsigned(wire120[(4'hf):(3'h5)])));
          reg126 <= ((^reg124[(4'hd):(1'h1)]) ?
              $signed($unsigned(((8'hb7) ?
                  (reg123 ? wire119 : reg124) : ((8'hb7) ?
                      wire121 : wire120)))) : ((!$unsigned((wire119 != wire121))) ?
                  wire120[(4'he):(4'hc)] : {$signed((wire118 ?
                          reg124 : reg125))}));
          reg127 <= (!wire118);
        end
      if (reg122)
        begin
          reg128 <= ({(wire121 < ((reg122 && reg127) >>> (reg124 ?
                      reg127 : wire121))),
                  reg123} ?
              $unsigned($signed((((8'hbc) ?
                  reg123 : reg122) << (wire121 - (8'hbd))))) : (8'hbe));
          reg129 <= (wire121 ?
              {$unsigned(((8'hbb) & (&reg126)))} : (wire120 ?
                  reg126 : (^reg126)));
          reg130 <= (reg124[(4'hb):(3'h5)] ?
              (reg126[(1'h1):(1'h0)] ?
                  (~|(^$unsigned(wire118))) : $unsigned(reg124[(4'ha):(3'h7)])) : (~|$unsigned((((8'hab) ?
                      (7'h44) : reg125) ?
                  wire118[(3'h6):(3'h4)] : (-wire118)))));
          reg131 <= wire119;
          reg132 <= reg130[(4'hb):(1'h0)];
        end
      else
        begin
          reg128 <= reg126;
          reg129 <= ((reg129[(2'h2):(2'h2)] || ($unsigned((wire120 ?
                  reg130 : (8'ha0))) ?
              (~|{reg122, reg125}) : wire121)) || (-(wire121 | {wire120})));
          reg130 <= (reg123[(3'h6):(2'h2)] ?
              ({(&$unsigned(reg124)),
                      (wire119 ? $unsigned(reg123) : (^reg130))} ?
                  wire119[(4'ha):(2'h3)] : reg132[(5'h11):(4'ha)]) : ($unsigned((|$unsigned(reg128))) + wire119[(5'h13):(3'h4)]));
          reg131 <= ((wire121 > $unsigned(((~&wire120) << (~&reg126)))) ?
              reg126 : $unsigned(reg124[(4'hb):(3'h7)]));
          reg132 <= reg127[(2'h2):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg133 <= {wire119[(5'h13):(3'h4)], reg126[(4'h8):(2'h2)]};
      reg134 <= ($unsigned((^~$unsigned($unsigned(reg128)))) && ($unsigned((&$unsigned(reg124))) <<< ($unsigned(((8'ha9) == (8'ha5))) ?
          reg128 : reg128)));
      reg135 <= (($unsigned($unsigned($unsigned(wire120))) - $signed((~&$signed(reg127)))) ?
          reg125 : wire119);
    end
  always
    @(posedge clk) begin
      reg136 <= $unsigned((reg126 ?
          $signed($unsigned((wire119 ? reg131 : reg123))) : reg134));
      reg137 <= (+((reg125[(4'h8):(2'h2)] ?
              ((reg131 <<< reg126) <<< (reg127 >= (8'h9e))) : $unsigned(reg123[(5'h13):(4'hc)])) ?
          (((reg128 ? reg132 : wire119) ?
                  wire121 : (reg122 ? reg134 : reg123)) ?
              reg128[(3'h4):(2'h2)] : $signed(reg126)) : (^(((8'hab) ?
              wire121 : reg123) == $signed(reg132)))));
    end
  assign wire138 = reg122[(4'hc):(3'h7)];
  assign wire139 = reg136;
  assign wire140 = $unsigned({reg136, (8'h9e)});
  assign wire141 = reg125[(2'h2):(1'h0)];
  assign wire142 = {$unsigned($signed(reg128[(4'h8):(1'h0)]))};
  assign wire143 = $signed($unsigned({(reg126[(3'h5):(2'h3)] ?
                           (wire142 ? wire119 : reg137) : reg133)}));
  assign wire144 = (reg129 ?
                       $signed(($signed((wire121 ? wire141 : reg132)) ?
                           {reg127,
                               (wire141 == reg137)} : (~|reg136))) : (8'hb9));
  assign wire145 = $unsigned((~$unsigned((-(!reg133)))));
  assign wire146 = $signed((((~|reg127[(3'h4):(3'h4)]) || ($signed(reg132) << reg122[(4'hc):(4'ha)])) ?
                       ((wire141[(3'h4):(1'h0)] ?
                               reg124[(2'h2):(1'h1)] : $signed(reg125)) ?
                           ((wire143 <= wire140) ?
                               {reg123} : wire121[(4'h9):(3'h4)]) : ((^~reg136) ?
                               (reg124 ?
                                   (8'hbb) : reg124) : (wire138 ~^ (8'hac)))) : $signed(((!reg131) ?
                           ((8'h9f) || wire139) : (reg122 ^ wire119)))));
  always
    @(posedge clk) begin
      reg147 <= (~((|reg129[(1'h1):(1'h1)]) ?
          $signed((reg124[(1'h0):(1'h0)] ?
              (wire146 ?
                  reg122 : wire143) : wire144[(2'h2):(1'h0)])) : (wire118 ?
              (wire145[(4'hd):(3'h7)] ?
                  $unsigned(wire145) : reg136) : $unsigned((reg123 ?
                  reg136 : wire119)))));
      reg148 <= ((8'hb5) == reg131);
      if (($unsigned((~(8'hb4))) - wire139))
        begin
          reg149 <= ($unsigned($signed($signed(reg136))) ?
              ((~^(^~reg132)) >>> (^$unsigned($unsigned(reg122)))) : (wire141 + {reg130[(4'hc):(1'h1)],
                  (~&(reg125 ? wire146 : wire145))}));
          if ($signed(((((!(8'ha7)) * (reg122 ? wire119 : reg135)) ?
              $signed({(8'ha0)}) : $signed((|wire144))) >= (~&$signed((wire144 ^ wire145))))))
            begin
              reg150 <= (~(($unsigned({(7'h44), reg135}) ?
                  ({reg134, reg123} ?
                      (~&reg128) : ((8'hb3) & wire145)) : {$signed(reg136),
                      reg136}) & (wire118 ?
                  reg122[(3'h7):(3'h7)] : ((8'hb5) && $signed(reg122)))));
              reg151 <= wire138[(3'h4):(1'h1)];
              reg152 <= reg149[(4'h8):(3'h7)];
              reg153 <= wire141;
              reg154 <= reg124[(2'h2):(1'h0)];
            end
          else
            begin
              reg150 <= ($unsigned((~&wire145[(3'h4):(2'h2)])) <= ({(wire143[(3'h4):(2'h3)] | (~|reg147)),
                      (reg150 ? (8'hb4) : wire120[(4'he):(4'he)])} ?
                  ((wire141[(5'h10):(1'h1)] ?
                      $unsigned(reg147) : $signed(reg128)) <<< (^wire121[(5'h13):(4'hc)])) : reg123));
              reg151 <= (&reg134);
              reg152 <= (reg154 >= reg128);
            end
          reg155 <= reg148[(4'ha):(4'ha)];
          if (wire143)
            begin
              reg156 <= $unsigned(wire146[(4'he):(2'h2)]);
              reg157 <= reg122[(4'h9):(3'h4)];
              reg158 <= ((8'haa) ?
                  ({($unsigned(wire146) && reg122)} ?
                      ($unsigned(((8'hb1) << wire143)) ?
                          $signed((|wire121)) : (^(reg128 & reg154))) : ((~|$unsigned(reg133)) ?
                          $unsigned((+reg155)) : {(+reg132)})) : $unsigned({$unsigned($signed(reg135)),
                      $unsigned({wire144})}));
              reg159 <= reg135[(2'h3):(1'h1)];
              reg160 <= reg151[(2'h2):(1'h0)];
            end
          else
            begin
              reg156 <= $unsigned(wire145);
              reg157 <= $unsigned({(!(|(~reg130))), wire144});
              reg158 <= (~&($unsigned(reg137) >>> reg137[(2'h3):(2'h2)]));
              reg159 <= $unsigned((wire138[(3'h5):(3'h4)] >= $unsigned((wire118 ?
                  $unsigned(wire144) : reg148))));
            end
          reg161 <= $unsigned(reg157[(3'h4):(1'h1)]);
        end
      else
        begin
          reg149 <= (~|reg150);
          if ((8'haf))
            begin
              reg150 <= reg128;
            end
          else
            begin
              reg150 <= $signed((reg135 ?
                  $unsigned($signed(reg153)) : $unsigned((+$unsigned(reg161)))));
              reg151 <= (~|(reg148 ?
                  (($unsigned(reg148) * $signed(reg124)) ?
                      ((reg137 ? reg136 : reg133) ?
                          (reg135 > reg149) : reg122[(4'hb):(4'ha)]) : $signed($unsigned(reg134))) : (($signed(reg150) ?
                      (wire119 ? wire121 : wire118) : reg152) ^ (^~(reg157 ?
                      wire146 : reg123)))));
            end
        end
    end
  assign wire162 = (8'ha9);
  assign wire163 = (!$unsigned(reg133[(4'ha):(2'h3)]));
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire83;
  input wire [(5'h13):(1'h0)] wire82;
  input wire signed [(4'hf):(1'h0)] wire81;
  input wire signed [(3'h5):(1'h0)] wire80;
  input wire signed [(5'h14):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg84 <= wire81[(2'h2):(1'h0)];
      if (wire81[(1'h0):(1'h0)])
        begin
          reg85 <= (!$unsigned(($signed($unsigned(wire83)) ~^ $signed({(8'hbc)}))));
          if ($unsigned($signed((~&reg85[(3'h5):(3'h4)]))))
            begin
              reg86 <= $unsigned($unsigned($signed($unsigned((reg85 ?
                  wire81 : wire83)))));
            end
          else
            begin
              reg86 <= ((&($unsigned(wire83) ?
                      reg85 : $unsigned($signed(wire81)))) ?
                  wire80 : {(wire83[(3'h5):(2'h3)] ? wire80 : wire83),
                      {$signed($signed(wire79)),
                          (reg86 << ((8'ha6) >>> wire82))}});
              reg87 <= reg85[(2'h3):(2'h3)];
              reg88 <= $unsigned($signed((wire83 <= (((8'hab) >= reg85) ?
                  wire79[(4'ha):(1'h0)] : $unsigned(reg86)))));
            end
          reg89 <= ((({(reg86 == wire80), $unsigned(wire80)} && ((reg88 ?
                          reg88 : reg87) ?
                      reg87[(4'h8):(3'h4)] : (wire83 ? wire81 : wire82))) ?
                  reg85[(3'h4):(2'h2)] : (reg84[(4'hf):(1'h1)] ?
                      $unsigned($unsigned(reg88)) : $signed($signed(reg87)))) ?
              (~(((8'had) <= reg88[(1'h1):(1'h0)]) || ($unsigned(reg88) ?
                  (~^reg87) : (~&reg85)))) : (+reg88[(2'h2):(1'h1)]));
        end
      else
        begin
          reg85 <= ($signed(wire80) <<< ($signed((8'ha9)) || wire83[(4'hf):(4'hc)]));
          reg86 <= (^$signed($unsigned((((8'h9f) ?
              reg84 : reg85) || (-wire81)))));
          reg87 <= ($signed($signed($signed((&wire79)))) * $signed($signed(((^~(8'hb9)) ?
              (reg85 ? wire81 : reg84) : (reg87 >> reg85)))));
        end
      reg90 <= {($signed(((|reg89) ? reg84[(4'hb):(1'h1)] : wire79)) ?
              $signed(((wire80 || (8'hac)) ?
                  reg84[(3'h7):(3'h5)] : (8'hbb))) : wire81)};
      if ($signed({(|(~|$signed(wire81))), reg88[(1'h1):(1'h0)]}))
        begin
          reg91 <= {(~$signed(($signed(reg85) ?
                  wire80 : (wire80 ? wire82 : wire81))))};
          reg92 <= (reg88 & $unsigned((wire82 >= ((+(8'hb1)) <= reg89))));
        end
      else
        begin
          reg91 <= reg85;
          reg92 <= $unsigned($unsigned(reg84[(3'h6):(3'h5)]));
          reg93 <= ((~|($unsigned((reg90 & reg84)) ? reg88 : {(^~wire83)})) ?
              $signed(reg91[(1'h1):(1'h0)]) : $signed((8'ha0)));
          reg94 <= ((~^(reg90[(4'ha):(3'h4)] >= ($unsigned(wire81) ?
              reg93[(1'h0):(1'h0)] : (wire81 ?
                  wire81 : reg93)))) << $signed(wire79));
          reg95 <= reg86;
        end
      reg96 <= reg90;
    end
  assign wire97 = (8'h9f);
  assign wire98 = $unsigned(reg84);
  assign wire99 = (({$signed(reg84)} ?
                          (&reg91) : ($signed(wire82[(3'h7):(3'h5)]) ?
                              (~&$unsigned(reg93)) : (~^(reg88 <= reg85)))) ?
                      $unsigned($signed(reg96)) : (8'hab));
endmodule

module module35
#(parameter param75 = {({(((8'h9f) + (7'h40)) ? ((8'hb1) ? (8'hbe) : (8'haa)) : ((8'ha8) || (8'hb3)))} + {(((8'ha9) ? (8'ha0) : (8'h9f)) >= (!(8'hae)))})})
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire39;
  input wire [(4'hd):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire [(4'ha):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  assign y = {wire74,
                 wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire48,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire40 = wire39[(4'hc):(3'h6)];
  assign wire41 = (~wire39);
  assign wire42 = ((8'h9d) ?
                      ($signed($signed(wire37)) ~^ wire38[(1'h0):(1'h0)]) : (((wire40 ~^ (wire36 ?
                          wire38 : wire37)) <= ($unsigned((8'h9d)) ?
                          wire40 : $unsigned(wire38))) >>> $unsigned(wire36[(1'h1):(1'h0)])));
  assign wire43 = (-($signed({$unsigned((8'hbd))}) ?
                      ($signed((&wire42)) ?
                          $signed(wire42[(2'h2):(2'h2)]) : wire38[(2'h2):(2'h2)]) : wire37));
  assign wire44 = wire41[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg45 <= {$signed(wire40[(3'h6):(3'h5)])};
    end
  always
    @(posedge clk) begin
      if (((($signed((wire37 ? wire41 : (8'hb2))) ?
          {(&wire44),
              $unsigned(wire40)} : {(wire40 == wire40)}) ~^ {$signed((wire39 ?
              wire39 : wire39)),
          wire36[(1'h0):(1'h0)]}) >>> ((|$signed($unsigned(wire40))) ?
          $signed(wire41) : wire39)))
        begin
          reg46 <= (-(wire36[(3'h4):(1'h0)] >>> $signed((+$signed(wire39)))));
        end
      else
        begin
          reg46 <= $unsigned(wire38[(4'h9):(1'h1)]);
        end
      reg47 <= {wire40,
          ($signed($unsigned({wire40, wire39})) || (~|$unsigned((8'hb4))))};
    end
  assign wire48 = wire42;
  always
    @(posedge clk) begin
      reg49 <= $unsigned((wire38 ?
          $unsigned(((wire48 ? wire37 : reg46) ?
              ((8'h9e) ^~ reg45) : wire37)) : {{wire39, (wire36 >= wire44)},
              $signed((wire48 ? wire39 : wire48))}));
      reg50 <= (($unsigned(($signed((8'haa)) ^ $signed(wire41))) ?
              (({reg47} != (wire43 ?
                  wire39 : reg46)) ^ wire38[(1'h0):(1'h0)]) : wire48) ?
          (~|(+(8'hbe))) : $unsigned(wire39));
      reg51 <= (~&(reg46[(3'h5):(1'h0)] ? wire39 : $unsigned(reg45)));
      reg52 <= (+$unsigned((^~$unsigned((8'ha5)))));
    end
  assign wire53 = (|{$unsigned(($signed(reg50) ?
                          reg49[(1'h0):(1'h0)] : (reg49 ? (8'h9e) : reg51)))});
  assign wire54 = ($signed(wire42) ?
                      (-((-wire37) >>> ((wire36 ?
                          reg45 : reg50) - $unsigned(reg45)))) : $unsigned(reg46));
  assign wire55 = $unsigned((+$signed($signed(((8'ha7) ? wire43 : (8'h9d))))));
  assign wire56 = $unsigned($signed(wire36));
  always
    @(posedge clk) begin
      reg57 <= wire43;
    end
  always
    @(posedge clk) begin
      reg58 <= reg51;
      reg59 <= ((~^(~&(~|((8'hb2) | (8'hb3))))) != (-{($unsigned(wire55) ?
              $unsigned(wire44) : (wire38 <<< reg49))}));
      reg60 <= $signed(reg59);
    end
  assign wire61 = (reg47 ?
                      $unsigned($signed($unsigned(wire53[(4'hf):(4'hf)]))) : (|wire39[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if (((((wire48 * ((8'hbb) + wire48)) >> (reg45[(4'h8):(1'h1)] >= (|reg58))) - {((8'hb2) ?
              reg57 : (wire48 + wire42))}) || reg58))
        begin
          reg62 <= (~|$signed((8'hb9)));
          if (($signed(reg47[(4'hb):(3'h5)]) ?
              (~(reg50 + (^$unsigned(wire40)))) : $unsigned($signed($signed((wire41 << (8'h9f)))))))
            begin
              reg63 <= $unsigned((+(reg46 ?
                  (~|wire56[(1'h0):(1'h0)]) : reg58)));
              reg64 <= $unsigned($signed($signed($signed((wire36 ?
                  reg47 : wire54)))));
              reg65 <= $signed($unsigned($unsigned($signed($unsigned(reg63)))));
              reg66 <= wire54;
              reg67 <= $signed($signed((reg51[(4'hd):(3'h4)] * $unsigned({wire36,
                  (8'h9e)}))));
            end
          else
            begin
              reg63 <= wire40[(2'h2):(2'h2)];
            end
          reg68 <= (({({wire61, (8'hb9)} * reg58[(3'h4):(1'h1)]),
              $unsigned((reg60 ? (8'h9f) : reg63))} != {{{reg49, wire38},
                  (wire42 & reg58)}}) >>> {(~$unsigned($signed(reg46)))});
          reg69 <= $signed($unsigned(reg59[(5'h13):(1'h0)]));
        end
      else
        begin
          reg62 <= $unsigned(wire54);
          reg63 <= wire36;
          reg64 <= (((+($unsigned(wire42) ?
              wire38[(1'h1):(1'h1)] : wire54)) | ($signed($unsigned((8'hab))) ?
              ((reg65 ~^ wire48) ?
                  (!reg51) : $unsigned((8'hb3))) : wire41)) << {((reg67 ?
                      (reg62 >> reg66) : (wire43 ? reg59 : reg57)) ?
                  ($signed(wire39) >= $signed((8'ha9))) : (7'h40)),
              reg59[(2'h2):(2'h2)]});
          reg65 <= ((reg51[(3'h7):(3'h7)] | wire48[(3'h4):(2'h3)]) ?
              $unsigned(($unsigned((reg60 < reg68)) ?
                  $signed($unsigned(reg51)) : (^reg57))) : (!wire61[(4'h8):(3'h4)]));
        end
      reg70 <= $unsigned(reg47[(3'h7):(3'h7)]);
      reg71 <= (($signed({(8'h9e)}) ?
              wire42 : $unsigned(((reg47 ? reg50 : reg63) ?
                  (^reg70) : (wire41 ? wire61 : wire44)))) ?
          (wire39 <= {{(!reg62), (reg63 ? reg65 : reg64)},
              {$unsigned(wire44)}}) : (|wire36));
      reg72 <= (8'ha7);
      reg73 <= wire39[(4'hb):(3'h5)];
    end
  assign wire74 = (^{$signed((wire36 | (8'h9f)))});
endmodule
