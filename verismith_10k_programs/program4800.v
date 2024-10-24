module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire177;
  wire signed [(5'h13):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire173;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 reg22,
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
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($unsigned($signed(wire4[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= wire2;
      if ((~^$signed(((~|$signed((8'haf))) >= wire2))))
        begin
          reg7 <= ($signed(reg6[(4'hc):(4'hc)]) != $unsigned(wire3));
          reg8 <= wire1;
          reg9 <= (|$signed((wire1[(5'h13):(3'h5)] ?
              (((8'hab) & wire0) ?
                  $unsigned(reg7) : $unsigned(wire3)) : {reg7[(1'h0):(1'h0)]})));
          reg10 <= wire5;
          reg11 <= ($signed(wire0[(3'h4):(2'h2)]) ?
              ($unsigned($signed((-(8'hbc)))) != reg9[(4'hc):(1'h0)]) : $unsigned($signed((^(wire2 & wire2)))));
        end
      else
        begin
          reg7 <= reg11[(4'ha):(1'h0)];
          if (((wire2 ? (8'ha2) : (8'hb9)) ?
              (7'h41) : $unsigned((&$signed($unsigned(reg6))))))
            begin
              reg8 <= $unsigned(reg10);
              reg9 <= ((&(^~wire1)) == (|$signed(reg11[(5'h14):(5'h11)])));
              reg10 <= wire2;
            end
          else
            begin
              reg8 <= wire4[(3'h4):(2'h2)];
              reg9 <= $unsigned($signed(reg11));
              reg10 <= $signed({reg9[(2'h2):(2'h2)]});
              reg11 <= {$unsigned(wire4), $unsigned((|(8'hb0)))};
              reg12 <= $unsigned(($signed($unsigned((~^reg11))) ?
                  $unsigned((wire0[(2'h3):(1'h1)] < $unsigned(reg6))) : (!(~((8'ha1) ?
                      reg11 : reg9)))));
            end
          reg13 <= {(8'h9e)};
          reg14 <= reg8;
        end
      if ($signed(reg10[(1'h0):(1'h0)]))
        begin
          reg15 <= (~&{(((wire4 ? reg13 : wire0) ?
                      reg9[(3'h6):(1'h0)] : $unsigned(reg11)) ?
                  (((7'h44) << reg7) * {reg11}) : reg11)});
          if ((wire3[(4'h8):(2'h2)] << ($unsigned($unsigned((reg13 >> wire4))) + reg6)))
            begin
              reg16 <= wire1;
              reg17 <= {((8'ha6) && {wire4})};
              reg18 <= $signed((((^reg12) ?
                      $unsigned((wire3 ?
                          reg16 : (8'h9d))) : (!wire4[(4'hd):(1'h1)])) ?
                  ($unsigned(reg6) ?
                      ({(8'hb8), reg6} ?
                          (|(8'hb1)) : $signed(reg13)) : wire4) : (((&(8'ha9)) ^~ (~&(8'ha3))) ?
                      $signed({wire1}) : $signed($signed(reg9)))));
            end
          else
            begin
              reg16 <= (^~($unsigned(((7'h42) >= ((8'h9f) ?
                  reg15 : reg12))) - $unsigned((reg13 ?
                  $signed(reg18) : (8'h9f)))));
            end
          reg19 <= $unsigned(reg16);
        end
      else
        begin
          reg15 <= $signed((($unsigned($signed(wire0)) ?
              ((8'h9e) ^~ (~reg11)) : (^~wire3)) * $signed({reg8})));
          reg16 <= (reg16 ?
              (~^($signed((8'ha1)) ?
                  {(reg6 * reg8), wire4[(3'h6):(3'h6)]} : ({reg17,
                      reg12} >>> reg9[(4'ha):(3'h6)]))) : {{reg7,
                      (~(reg16 ? reg12 : reg10))},
                  $signed(((reg8 | wire1) || (reg11 ? reg15 : reg15)))});
        end
      if ($unsigned((~^$unsigned($unsigned($signed(reg6))))))
        begin
          reg20 <= (((reg18[(1'h1):(1'h0)] ?
                      reg9[(1'h1):(1'h1)] : $unsigned((reg19 ? reg7 : reg19))) ?
                  (+(~|$signed(wire3))) : (~^(reg19 * $unsigned(wire5)))) ?
              ((-$unsigned((wire2 != wire2))) ?
                  wire1 : $unsigned((reg11[(4'ha):(3'h7)] - $unsigned((8'haf))))) : (+(~|wire0[(2'h3):(1'h1)])));
          reg21 <= (-($signed((~&{reg14})) ^~ ((reg20[(1'h0):(1'h0)] ?
              (reg15 ?
                  (8'h9c) : wire0) : $unsigned(reg18)) * $signed($signed(reg6)))));
        end
      else
        begin
          reg20 <= (((~^$signed((reg17 ? wire2 : wire2))) ?
              (((reg6 ? reg12 : reg19) ^~ (~(8'hb1))) < $signed((reg18 ?
                  reg7 : (8'ha1)))) : {((wire4 == (8'ha9)) && wire0[(3'h6):(1'h1)]),
                  $signed(reg21)}) && (8'hb6));
        end
      reg22 <= (reg14 >> $signed(wire0));
    end
  assign wire23 = (reg13[(3'h5):(2'h2)] ?
                      (({$unsigned(reg22), (~^wire3)} <= {(reg10 ?
                              reg10 : wire2)}) > reg22) : ($signed((^~$unsigned((8'hae)))) ?
                          {$signed($signed(reg6)),
                              ((|reg9) ?
                                  (+reg17) : {reg14})} : $unsigned($signed($unsigned(reg7)))));
  assign wire24 = $signed((+$unsigned(reg19)));
  assign wire25 = $unsigned({reg20, reg15});
  module26 #() modinst171 (wire170, clk, wire0, wire25, reg16, reg18);
  assign wire172 = $unsigned($signed((($unsigned(wire0) ?
                       (~wire24) : (reg18 ?
                           (8'h9d) : reg20)) << reg22[(3'h7):(2'h2)])));
  assign wire173 = reg9[(1'h1):(1'h1)];
  assign wire174 = wire25;
  assign wire175 = wire173;
  assign wire176 = wire170;
  assign wire177 = reg17[(2'h3):(1'h0)];
endmodule

module module26
#(parameter param169 = ((&((((8'h9e) * (7'h41)) ? (~^(8'ha3)) : ((8'hbc) + (7'h44))) ? ((&(7'h42)) ? {(8'ha0), (8'h9d)} : ((8'hbd) ? (8'hb6) : (8'h9c))) : (((8'hb9) ? (8'hbf) : (7'h44)) ? ((8'haa) <<< (8'hac)) : {(7'h44), (8'h9c)}))) + ((^~(((7'h42) >= (7'h40)) & ((8'ha5) ? (8'ha3) : (8'h9f)))) | ((~|(|(7'h42))) <= (^~((8'ha8) & (8'hac)))))))
(y, clk, wire27, wire28, wire29, wire30);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire28;
  input wire [(3'h5):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire162;
  wire [(4'hf):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire107;
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire159,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire63,
                 wire65,
                 wire66,
                 wire107,
                 reg168,
                 reg167,
                 reg115,
                 (1'h0)};
  module31 #() modinst64 (wire63, clk, wire28, wire29, wire27, wire30);
  assign wire65 = wire29[(2'h2):(1'h0)];
  assign wire66 = wire30[(5'h10):(4'he)];
  module67 #() modinst108 (wire107, clk, wire30, wire65, wire28, wire66, wire63);
  assign wire109 = $unsigned(wire65[(4'h8):(1'h1)]);
  assign wire110 = (wire66 ?
                       (((((7'h42) | wire29) ?
                               wire107 : $signed(wire30)) != $signed({wire29})) ?
                           $signed($unsigned(wire63[(1'h0):(1'h0)])) : wire109) : (($unsigned((~^wire30)) < $signed((wire28 <<< (8'ha4)))) ?
                           (|{$signed(wire65)}) : wire66[(3'h4):(2'h3)]));
  assign wire111 = $signed(wire63);
  assign wire112 = {$signed((8'hbc)), {(~^(~$signed(wire109)))}};
  assign wire113 = wire112[(2'h2):(2'h2)];
  assign wire114 = $signed($signed((wire30[(5'h12):(4'hf)] ?
                       wire111 : (~&(wire30 > wire66)))));
  always
    @(posedge clk) begin
      reg115 <= wire30;
    end
  module116 #() modinst160 (wire159, clk, wire66, wire28, wire113, wire65);
  assign wire161 = {wire159[(3'h4):(1'h1)]};
  assign wire162 = ((wire28 ^ wire159) == ({$unsigned($unsigned((8'ha7))),
                       wire161[(4'he):(4'h9)]} & $unsigned(wire107)));
  assign wire163 = wire29;
  assign wire164 = $signed(({$unsigned($signed(wire28)),
                       {(reg115 ? wire161 : wire110),
                           wire28}} ^ wire163[(3'h6):(3'h6)]));
  assign wire165 = wire30;
  assign wire166 = wire162;
  always
    @(posedge clk) begin
      reg167 <= (|$unsigned($signed(((wire65 - wire30) > $signed(wire65)))));
      reg168 <= $signed($unsigned($signed(($signed(wire65) ?
          ((8'hbe) < wire166) : (~&(8'h9e))))));
    end
endmodule

module module116
#(parameter param157 = ((+(+({(8'hb7)} ? ((8'ha5) ? (8'had) : (7'h44)) : ((8'h9f) ? (8'ha3) : (8'hbe))))) ? (((((8'ha8) ? (8'hae) : (8'hbf)) >> {(8'h9c), (8'hb7)}) <= {(|(8'h9f)), ((7'h40) ? (8'hb8) : (8'hb1))}) ? (+(((8'h9d) ? (8'ha4) : (8'hba)) ? ((8'h9f) ? (8'ha7) : (7'h43)) : ((8'ha1) >>> (8'hae)))) : ((((8'hb9) != (8'hb2)) ? ((8'hb0) <<< (8'hb1)) : ((8'h9e) << (8'hbe))) ? (((8'had) ? (8'ha2) : (8'h9c)) << (^(8'ha2))) : (((8'hac) ? (8'hb8) : (8'haa)) * ((8'ha8) ? (8'hb9) : (8'hb1))))) : ((~^((&(8'hac)) >>> ((8'hbb) && (8'had)))) ? (((+(8'hbe)) - ((8'had) << (7'h42))) >> ({(8'ha2), (8'hbb)} >> ((8'ha4) ? (8'hbc) : (8'hb2)))) : ((!(~(8'hb5))) >= (~&{(7'h40), (8'h9d)})))), 
parameter param158 = {(({(param157 && param157), (param157 >>> param157)} >>> param157) ? (((param157 ? (8'ha0) : param157) ^ ((7'h41) - param157)) || ({param157, param157} ? (param157 + param157) : param157)) : (|((param157 ? (8'ha7) : param157) ? param157 : param157)))})
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire120;
  input wire signed [(4'hf):(1'h0)] wire119;
  input wire [(4'h9):(1'h0)] wire118;
  input wire signed [(3'h5):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  wire [(5'h14):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire125;
  wire [(2'h2):(1'h0)] wire124;
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire125,
                 wire124,
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
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= $signed(wire119);
      reg122 <= ((wire119 ?
              ($signed((wire118 == (8'h9c))) ~^ (8'hab)) : {(|$signed((8'hbf))),
                  (~|(wire119 == (7'h40)))}) ?
          (reg121[(1'h1):(1'h1)] || (-wire117)) : {wire117,
              reg121[(4'h9):(4'h9)]});
      reg123 <= ((~((|(wire117 ~^ wire118)) * ($unsigned(wire120) != wire118))) * {(^~wire120),
          $signed($signed(wire119[(4'hd):(4'ha)]))});
    end
  assign wire124 = {((reg123[(1'h1):(1'h1)] ?
                           ({wire117,
                               wire117} > (8'h9c)) : ((~&(8'hac)) != {wire120,
                               reg123})) || reg123[(4'hf):(3'h4)])};
  assign wire125 = wire120;
  always
    @(posedge clk) begin
      reg126 <= wire118;
      if (wire119)
        begin
          reg127 <= $unsigned($signed(($unsigned($signed((7'h41))) * $unsigned($unsigned(wire118)))));
          reg128 <= (|(-(wire117 ? reg123 : reg127[(3'h6):(3'h6)])));
          reg129 <= $signed(($unsigned({$signed(reg126)}) ?
              $signed(($signed(wire125) ?
                  $signed(reg122) : $signed(wire124))) : {(-((8'hae) ^~ reg121))}));
          reg130 <= $signed(((reg128 ?
              $unsigned((~(8'hbe))) : (^(8'hb7))) * (~^{$signed(reg121)})));
          if ($signed(reg129))
            begin
              reg131 <= reg130;
              reg132 <= ($unsigned((wire118[(4'h9):(1'h0)] != (wire125[(3'h4):(1'h0)] | $signed(wire125)))) ?
                  $unsigned(wire118[(3'h5):(3'h5)]) : (~^{(!$signed(reg122))}));
              reg133 <= reg130[(3'h6):(3'h6)];
            end
          else
            begin
              reg131 <= $signed($signed(reg132[(3'h4):(2'h2)]));
              reg132 <= $signed(reg122);
              reg133 <= ($signed(reg126[(2'h3):(1'h1)]) ?
                  ($signed(reg131[(3'h7):(3'h7)]) ?
                      reg129 : (($unsigned(wire117) | (^~reg131)) ?
                          (^(~^reg121)) : (~reg130[(4'hd):(2'h2)]))) : reg129[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          reg127 <= ((^~$unsigned((&(reg132 ? reg126 : wire120)))) ?
              wire124 : $signed(reg121[(1'h1):(1'h1)]));
          reg128 <= (^wire117);
        end
      if ($unsigned($signed($unsigned($unsigned($signed((7'h43)))))))
        begin
          if (reg121[(3'h6):(2'h3)])
            begin
              reg134 <= reg129;
              reg135 <= (($signed($unsigned($signed(reg122))) ?
                  (reg131 == ({reg130} * {wire125,
                      (8'hbf)})) : (8'had)) != (-($unsigned(reg122) >= wire125)));
              reg136 <= reg127;
              reg137 <= ((~$unsigned(reg130)) ?
                  (((reg122[(3'h6):(3'h4)] ?
                          (wire119 ?
                              reg130 : reg121) : (reg126 < wire124)) ^~ $signed(((7'h40) < wire119))) ?
                      reg126[(3'h4):(2'h2)] : reg127) : (!{((8'ha7) >> reg126),
                      ((reg131 << wire125) ?
                          wire118[(3'h5):(3'h5)] : reg136[(4'h9):(4'h8)])}));
            end
          else
            begin
              reg134 <= ((8'haa) ?
                  {($signed((reg123 || (8'ha9))) ^~ $unsigned(reg134[(3'h7):(1'h0)]))} : reg128[(4'hb):(3'h4)]);
              reg135 <= (~&(~^$unsigned(reg136)));
            end
          if (($unsigned((^~$signed(reg128[(3'h7):(1'h1)]))) <<< ($unsigned((reg127[(1'h1):(1'h0)] ?
                  {wire117} : (!wire124))) ?
              (8'hb4) : $unsigned(wire125[(1'h1):(1'h0)]))))
            begin
              reg138 <= $signed((~^($signed(reg136) - ((wire124 ?
                  wire117 : (8'hb7)) ^~ {(8'hbc)}))));
            end
          else
            begin
              reg138 <= reg134[(2'h3):(2'h3)];
            end
          reg139 <= (~|reg132[(4'h9):(3'h5)]);
          reg140 <= reg132[(4'h9):(3'h5)];
        end
      else
        begin
          reg134 <= {(8'hb9)};
        end
      if ($signed((reg133[(1'h1):(1'h0)] >> reg127)))
        begin
          reg141 <= reg123[(4'ha):(4'h9)];
          if ((!((~^((reg127 || reg140) ?
              {(8'h9f)} : reg131[(4'hc):(4'hc)])) ^ (|reg121))))
            begin
              reg142 <= ({(|($unsigned(reg131) ?
                          (wire117 | reg138) : $signed(reg129)))} ?
                  $unsigned(reg133) : {(+$signed($signed(wire125)))});
            end
          else
            begin
              reg142 <= ((&$signed(reg127)) - wire124);
            end
          reg143 <= reg128;
        end
      else
        begin
          reg141 <= $unsigned($unsigned(wire118[(3'h6):(1'h1)]));
          reg142 <= (8'hac);
          reg143 <= (8'h9d);
          reg144 <= $signed($unsigned($unsigned((-(reg121 | reg135)))));
        end
    end
  assign wire145 = ((($unsigned((reg127 ?
                           wire119 : reg133)) << $signed((reg135 > reg128))) ?
                       reg133[(1'h0):(1'h0)] : (reg121[(4'h8):(3'h5)] - wire125)) && ($signed($signed((!reg139))) == $unsigned($signed(((8'haf) ?
                       wire118 : reg139)))));
  always
    @(posedge clk) begin
      reg146 <= (+((reg140[(2'h2):(2'h2)] ^ reg138) ?
          (-$unsigned({reg135})) : $signed(($unsigned(reg139) ^~ reg140))));
    end
  assign wire147 = $signed(reg133);
  assign wire148 = reg129[(2'h2):(2'h2)];
  assign wire149 = ($unsigned({({reg130} ? (reg129 ? reg136 : reg135) : reg146),
                           $unsigned((^reg136))}) ?
                       reg144[(4'h8):(3'h7)] : (8'hb6));
  assign wire150 = (8'hbc);
  assign wire151 = {reg129[(1'h0):(1'h0)]};
  assign wire152 = (wire124[(1'h1):(1'h0)] ^~ reg126[(4'hd):(2'h2)]);
  assign wire153 = reg134[(1'h0):(1'h0)];
  assign wire154 = (|(wire125[(3'h4):(1'h0)] ?
                       ((~(reg135 ? wire153 : reg127)) ?
                           $signed((reg126 ?
                               reg146 : wire151)) : $unsigned((wire151 == (8'ha2)))) : ({(reg128 > wire149)} ?
                           $unsigned(reg134[(2'h2):(1'h1)]) : reg141)));
  assign wire155 = ((|($signed((reg142 ?
                           (7'h41) : reg129)) - (((8'h9d) | reg140) ~^ (reg131 > reg140)))) ?
                       wire124[(2'h2):(1'h0)] : (^(8'hb7)));
  assign wire156 = wire151;
endmodule

module module67
#(parameter param106 = (((((~(8'hb3)) ? ((8'hbd) && (8'h9e)) : {(8'h9f)}) * (((8'haf) ^~ (8'hbb)) & (+(8'ha5)))) * ((((8'hbb) + (8'hb9)) < {(8'ha5)}) ? ((7'h43) ? (|(8'hbe)) : ((8'h9d) & (8'hb3))) : (((8'hbc) | (7'h44)) ? {(8'hae), (8'ha2)} : (~|(8'hbd))))) ? (8'hb1) : ((~|((-(8'hb5)) > ((8'ha4) ^~ (8'hbc)))) & (^~(!((8'hbc) + (8'hb3)))))))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire72;
  input wire [(2'h2):(1'h0)] wire71;
  input wire [(2'h3):(1'h0)] wire70;
  input wire [(3'h5):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  assign y = {wire105,
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
                 wire90,
                 wire89,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg93,
                 reg92,
                 reg91,
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
                 (1'h0)};
  assign wire73 = ($signed(({$unsigned(wire72),
                          $unsigned(wire72)} >>> wire69)) ?
                      (+$signed(($signed(wire72) ?
                          {wire70} : (wire72 <<< wire71)))) : (-$unsigned((((8'h9d) <= (8'hb2)) ?
                          wire71[(2'h2):(2'h2)] : wire68[(2'h2):(1'h0)]))));
  assign wire74 = wire70;
  assign wire75 = wire73;
  assign wire76 = (((($signed(wire75) <<< wire68) ?
                      $unsigned(wire68) : wire71[(2'h2):(1'h0)]) ^ (((wire71 ?
                              wire68 : wire70) ?
                          $signed(wire69) : wire69) ?
                      $unsigned($signed(wire74)) : wire71)) & wire74);
  assign wire77 = $signed($signed((wire75 ^~ $unsigned({(8'hb4)}))));
  always
    @(posedge clk) begin
      reg78 <= (^((^~($unsigned(wire73) ?
          {wire71} : (~|wire74))) == $unsigned(((wire72 <= wire68) ~^ (wire70 ?
          wire74 : wire77)))));
      reg79 <= (($unsigned($unsigned(reg78[(2'h3):(2'h3)])) ^~ (^$unsigned({wire77,
              wire70}))) ?
          ((^(wire74[(3'h4):(1'h0)] ?
              (wire76 + wire76) : wire74[(2'h2):(1'h1)])) != (-$unsigned((7'h44)))) : (-wire72[(1'h1):(1'h0)]));
      reg80 <= $unsigned({$unsigned(((reg79 - wire68) ?
              $unsigned(wire73) : $unsigned(wire73)))});
      if ((wire73[(1'h0):(1'h0)] ?
          (!($signed($unsigned(reg80)) ?
              wire69[(1'h0):(1'h0)] : ((reg78 ? reg78 : wire72) ?
                  wire75 : $signed(wire71)))) : wire74[(4'hb):(1'h1)]))
        begin
          reg81 <= $unsigned(wire76[(2'h2):(1'h0)]);
          reg82 <= $signed($unsigned((~^(!(^~reg81)))));
          if (wire77[(4'ha):(3'h4)])
            begin
              reg83 <= ($unsigned((($unsigned(wire73) != {wire68,
                      reg79}) >>> ($unsigned(wire74) >> reg82))) ?
                  wire77[(3'h7):(3'h5)] : wire74);
              reg84 <= ($signed({$unsigned($unsigned(wire75))}) ?
                  $signed($unsigned(wire68)) : ((~^{reg78,
                      wire73[(1'h1):(1'h1)]}) - $signed(reg83[(1'h1):(1'h1)])));
              reg85 <= wire71;
              reg86 <= ($signed($unsigned(((reg82 ? wire68 : reg80) ?
                      wire69[(3'h5):(1'h1)] : (~^(8'h9f))))) ?
                  ($signed(wire76[(1'h0):(1'h0)]) * $unsigned((wire74 > reg81))) : $unsigned(((~|reg78) ?
                      $signed({wire77, reg83}) : reg83[(1'h1):(1'h1)])));
              reg87 <= $signed((|reg78));
            end
          else
            begin
              reg83 <= ((8'haa) ~^ $signed(reg78[(2'h2):(2'h2)]));
              reg84 <= (($signed(({reg80} ?
                  (!(8'hb0)) : reg80)) || $signed((~^$unsigned(reg84)))) >> wire69[(3'h4):(2'h2)]);
              reg85 <= $signed((~&wire77[(1'h1):(1'h1)]));
              reg86 <= (wire75 ?
                  ((~&$unsigned((wire68 ? (8'hb8) : wire76))) ?
                      (((|(8'hae)) ?
                          reg87 : (wire77 ?
                              wire72 : wire77)) >>> wire74) : $unsigned(wire75)) : {$signed(reg82),
                      (^wire77)});
            end
          reg88 <= (&$signed(reg83));
        end
      else
        begin
          reg81 <= wire69;
          reg82 <= reg79[(2'h2):(1'h0)];
          reg83 <= ((-{($signed(reg87) ?
                  wire71 : (^reg86))}) ^~ $unsigned($signed((reg88[(4'h9):(1'h0)] != reg81))));
        end
    end
  assign wire89 = wire76;
  assign wire90 = $signed(wire74);
  always
    @(posedge clk) begin
      reg91 <= (wire73[(2'h3):(1'h0)] ?
          $signed((reg84[(3'h4):(2'h3)] ?
              $unsigned($signed(wire74)) : $unsigned(wire70[(2'h3):(1'h0)]))) : $unsigned((reg86 ?
              reg84[(2'h3):(2'h3)] : wire77[(2'h3):(2'h3)])));
      reg92 <= $unsigned((~&(wire75 ?
          ($signed(reg86) && $unsigned(wire69)) : $unsigned($signed(reg84)))));
      reg93 <= $signed((((^(reg87 ? wire68 : reg85)) ? (8'hac) : reg84) ?
          (reg85 * $unsigned(reg85)) : ($unsigned({(8'ha3)}) ?
              $unsigned(wire90) : $unsigned((wire68 >>> reg83)))));
    end
  assign wire94 = (^~$unsigned(reg92[(2'h2):(2'h2)]));
  assign wire95 = reg91;
  assign wire96 = reg93;
  assign wire97 = ((^~({$signed((8'h9d))} ?
                          wire73 : ((~|(8'hbd)) ?
                              $unsigned(reg84) : $signed(wire69)))) ?
                      ((^{wire90}) <<< reg78) : wire75[(3'h6):(1'h1)]);
  assign wire98 = wire97;
  assign wire99 = $unsigned({reg81[(2'h3):(2'h2)]});
  assign wire100 = $unsigned((8'hbd));
  assign wire101 = reg87;
  assign wire102 = ((8'ha0) != ($unsigned(reg92) ?
                       (~{(wire77 == wire100),
                           (wire72 * reg84)}) : ((!(reg82 - wire89)) * ($signed(wire70) ?
                           (|wire75) : (+(8'had))))));
  assign wire103 = reg88[(4'h8):(3'h6)];
  assign wire104 = $unsigned(wire100[(2'h3):(2'h2)]);
  assign wire105 = ((wire69 ?
                       wire104[(2'h3):(1'h1)] : $signed((|{reg88,
                           reg81}))) + $signed(({(wire100 == (8'h9c))} <= {wire77})));
endmodule

module module31
#(parameter param62 = {{(~&(((8'h9d) ? (8'hac) : (8'h9c)) ? (!(8'hbe)) : (&(8'hb9))))}, (((-((8'h9f) ? (8'ha8) : (8'ha0))) ? {(^(7'h41))} : (((7'h42) ? (7'h40) : (8'h9f)) ? ((8'h9e) ? (8'hbd) : (8'hbd)) : (~^(8'ha7)))) && (!({(8'hba), (8'ha2)} ? ((8'ha5) & (8'hb6)) : ((8'hb4) ~^ (8'ha3)))))})
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire36;
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire36,
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
                 reg37,
                 (1'h0)};
  assign wire36 = wire34[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg37 <= (~$unsigned(wire33[(4'hb):(2'h3)]));
      reg38 <= $unsigned($unsigned(wire34[(1'h0):(1'h0)]));
      if ($unsigned((wire35 ? wire32 : wire34[(2'h2):(1'h1)])))
        begin
          reg39 <= {$signed({(~|{wire36, wire33}),
                  ($signed(wire35) << (~&wire32))})};
          reg40 <= ((8'hbc) != $unsigned(({reg37[(1'h0):(1'h0)],
              wire36} == $unsigned({wire32}))));
        end
      else
        begin
          reg39 <= reg39[(3'h4):(2'h2)];
        end
      if ($signed(reg38[(4'hb):(4'h8)]))
        begin
          if (reg38[(4'h9):(4'h9)])
            begin
              reg41 <= (wire34 >= (reg38 + wire32));
              reg42 <= $signed($signed((~^(wire35[(1'h1):(1'h0)] && (wire36 >>> wire35)))));
              reg43 <= reg37;
              reg44 <= $signed((wire34[(2'h3):(2'h3)] ?
                  {((wire33 >= wire32) >> {wire36,
                          wire35})} : $signed($unsigned($signed(reg38)))));
            end
          else
            begin
              reg41 <= (~^(reg42[(3'h7):(3'h6)] * wire32[(5'h12):(4'h9)]));
              reg42 <= (reg44 == $unsigned($signed($unsigned((wire34 && reg42)))));
              reg43 <= {wire34[(3'h4):(3'h4)]};
            end
          reg45 <= $signed((8'ha0));
          reg46 <= ($signed(({$unsigned(reg44)} <= reg40[(4'ha):(2'h2)])) >> (^($unsigned((reg37 ?
                  wire35 : reg42)) ?
              wire33[(4'h8):(1'h0)] : $unsigned((~|reg42)))));
          reg47 <= $unsigned(((~$unsigned(reg40)) ?
              $unsigned(wire33[(3'h5):(3'h5)]) : $unsigned((reg38[(5'h11):(4'ha)] ^~ reg40))));
        end
      else
        begin
          reg41 <= reg43[(1'h0):(1'h0)];
        end
      reg48 <= wire32;
    end
  always
    @(posedge clk) begin
      reg49 <= {$signed((reg47[(1'h0):(1'h0)] || {(reg45 ? reg42 : wire32)}))};
      reg50 <= reg39;
    end
  assign wire51 = (~^(^(reg48[(4'h9):(3'h5)] > {wire33[(1'h0):(1'h0)],
                      (~&reg50)})));
  assign wire52 = (~wire32[(2'h2):(2'h2)]);
  assign wire53 = ((+reg41[(1'h0):(1'h0)]) ?
                      (&(^~$unsigned(reg47[(1'h1):(1'h1)]))) : reg46[(4'h8):(3'h7)]);
  assign wire54 = {(wire36 ?
                          {$unsigned(reg37[(2'h3):(2'h2)]),
                              (((8'hb9) || wire35) ^~ (reg44 ?
                                  reg48 : reg45))} : reg43[(1'h1):(1'h0)]),
                      $signed($signed(wire53[(2'h2):(1'h1)]))};
  assign wire55 = {(8'hb2),
                      ((|reg38[(3'h5):(2'h3)]) ~^ (((+(8'hac)) <<< $signed(wire32)) <<< ((~&reg40) & (wire33 <= reg37))))};
  assign wire56 = $unsigned(reg43[(1'h1):(1'h1)]);
  assign wire57 = (wire54 ~^ reg38);
  assign wire58 = reg48;
  assign wire59 = {(!$signed($unsigned(reg46[(1'h1):(1'h1)])))};
  assign wire60 = {$signed((~|wire57)), $signed(reg50)};
  assign wire61 = $signed(reg42);
endmodule
