module top
#(parameter param215 = ((^((8'ha0) ? ({(8'hbe), (8'hbb)} + ((8'h9d) || (8'hb7))) : ((8'hba) ? ((7'h40) ? (8'hae) : (8'hbd)) : ((8'ha2) <= (8'hbd))))) + {((8'ha0) >= (((8'hbb) ? (8'ha0) : (8'hab)) + {(8'hb7), (7'h44)})), {((~&(8'h9f)) < (!(8'hbe)))}}), 
parameter param216 = (((param215 & ((param215 ? param215 : param215) < (param215 ? param215 : param215))) ? (!((~^param215) ? (-(8'h9d)) : param215)) : (^(~^(param215 ? param215 : param215)))) ? (param215 * param215) : param215))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire214;
  wire [(4'h8):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire212;
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire214,
                 wire4,
                 wire5,
                 wire6,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire212,
                 reg41,
                 reg35,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
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
                 (1'h0)};
  assign wire4 = (8'hb3);
  assign wire5 = (&(($unsigned((wire0 ? wire0 : wire4)) ?
                     $unsigned($unsigned(wire2)) : (&$signed(wire2))) != $signed(($unsigned(wire0) ?
                     wire2 : $signed(wire1)))));
  assign wire6 = $unsigned(((8'h9f) >>> $unsigned((8'ha0))));
  always
    @(posedge clk) begin
      reg7 <= (~wire5);
      reg8 <= wire5[(2'h2):(2'h2)];
      reg9 <= (wire2[(1'h1):(1'h0)] ^ {((!(wire2 ? wire4 : wire0)) ?
              (8'hbd) : ($signed(wire5) >>> (wire6 ? wire5 : wire1)))});
      if (reg9)
        begin
          reg10 <= $unsigned((($signed(((8'had) ? reg8 : reg8)) ?
                  (~|(reg8 ? wire2 : reg8)) : $signed((wire1 * wire4))) ?
              (^$unsigned((wire2 ~^ wire1))) : (^~$unsigned($unsigned(reg8)))));
          reg11 <= $unsigned($unsigned($signed({wire5[(2'h3):(1'h1)],
              ((8'haf) ? reg10 : reg7)})));
          reg12 <= ($unsigned((~|{(reg10 ? (7'h42) : wire6)})) ?
              ((reg7 ?
                  {$unsigned(reg8)} : (~&$signed(wire5))) == wire2) : reg9[(2'h3):(1'h1)]);
          reg13 <= ((wire5 ?
                  ((&(reg8 >= reg10)) ?
                      ((reg11 ?
                          reg9 : (8'ha2)) * $signed(wire4)) : reg8[(4'ha):(1'h1)]) : $unsigned((~reg8))) ?
              wire3[(3'h5):(3'h5)] : (-$unsigned($unsigned(reg9))));
          reg14 <= wire2[(1'h0):(1'h0)];
        end
      else
        begin
          reg10 <= $unsigned(wire0[(2'h3):(1'h1)]);
          if ((reg14 ~^ $signed(wire1[(3'h5):(3'h5)])))
            begin
              reg11 <= (^($unsigned(reg8[(2'h3):(1'h0)]) >> reg11[(1'h0):(1'h0)]));
              reg12 <= wire1[(4'ha):(3'h5)];
              reg13 <= $unsigned((|($signed(wire4) >>> ((reg7 ^ reg9) ?
                  (~&reg9) : wire0))));
              reg14 <= ($unsigned(reg7[(1'h1):(1'h1)]) | reg12);
            end
          else
            begin
              reg11 <= $unsigned(wire0);
              reg12 <= {wire4[(3'h4):(2'h3)], reg11};
              reg13 <= $unsigned((8'hae));
              reg14 <= (|(~(((wire2 ? wire1 : reg12) ?
                      {reg12, wire4} : (~reg14)) ?
                  {(wire0 == (8'h9e)),
                      $unsigned(wire6)} : reg8[(3'h5):(2'h2)])));
              reg15 <= ($unsigned(((|$unsigned(wire2)) << ($signed(wire5) ?
                  (reg8 ?
                      wire6 : (7'h40)) : $signed(wire3)))) > $unsigned((reg7[(3'h6):(3'h4)] ?
                  (reg10 == $unsigned((8'h9d))) : reg9[(3'h6):(3'h6)])));
            end
          if ($signed({reg8[(4'ha):(2'h3)], $signed($signed((-wire2)))}))
            begin
              reg16 <= (8'hbf);
              reg17 <= ($unsigned(({(reg8 ? wire1 : reg7)} + ((reg12 ?
                      wire6 : wire3) ?
                  (~^reg13) : reg12[(1'h1):(1'h1)]))) <<< $signed(wire6));
              reg18 <= reg8;
              reg19 <= $signed((^~{$unsigned(reg7), wire2}));
            end
          else
            begin
              reg16 <= $signed(((^~$unsigned((~&reg16))) != ($unsigned($signed(reg7)) ?
                  {reg7} : $unsigned((wire2 ? reg14 : wire2)))));
              reg17 <= wire2;
              reg18 <= wire2[(4'h9):(2'h2)];
              reg19 <= $unsigned((reg14[(4'ha):(1'h1)] + reg16[(4'hb):(4'hb)]));
            end
          reg20 <= ($signed($signed((+((8'hbd) ?
              reg14 : wire5)))) - ($signed((~|$unsigned(reg9))) ?
              wire5[(2'h2):(1'h0)] : wire1[(3'h6):(1'h0)]));
          reg21 <= reg15;
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $unsigned(reg17);
      reg23 <= reg13;
      reg24 <= $signed((wire6[(2'h2):(1'h0)] == ((~&$signed(reg18)) ?
          reg15 : (-(wire5 ? reg21 : wire1)))));
    end
  assign wire25 = (^$signed({wire3, (~^reg19[(3'h6):(1'h0)])}));
  assign wire26 = $signed((-($signed((&reg16)) <= (((8'ha4) ? wire3 : (8'hb5)) ?
                      reg19 : {reg17}))));
  assign wire27 = $unsigned(reg21);
  assign wire28 = (reg14[(4'h9):(2'h2)] ?
                      ((wire1 ?
                          $signed(wire0[(3'h6):(3'h6)]) : wire26[(3'h6):(1'h0)]) >>> reg16) : $signed(($signed(reg23) ?
                          (wire2 ^~ reg13[(4'hf):(3'h4)]) : $unsigned((wire2 >= wire0)))));
  always
    @(posedge clk) begin
      reg29 <= {wire1[(3'h5):(3'h5)]};
      reg30 <= (|wire25[(4'h9):(3'h6)]);
    end
  assign wire31 = reg14[(3'h5):(2'h3)];
  assign wire32 = reg30;
  assign wire33 = $signed($signed((|wire5[(1'h1):(1'h1)])));
  assign wire34 = reg21[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg35 <= reg16;
    end
  assign wire36 = reg16[(4'hc):(4'hb)];
  assign wire37 = (($signed(((wire27 << (8'hb8)) ? {wire28, reg24} : {reg20})) ?
                      (~|wire25[(4'ha):(3'h6)]) : (wire34[(1'h1):(1'h1)] ?
                          {(reg18 << reg18),
                              reg18} : $unsigned((reg35 == reg16)))) > $unsigned($unsigned((((8'hb2) ^ wire0) < wire3[(1'h1):(1'h1)]))));
  assign wire38 = ((8'hb6) != $signed(($unsigned(wire37[(2'h3):(2'h3)]) ?
                      {(wire31 ? (8'hbb) : wire3)} : $unsigned(reg19))));
  assign wire39 = $unsigned({reg16, (8'hbe)});
  assign wire40 = reg23[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg41 <= ($unsigned(({(-reg24), (+wire36)} ?
              wire37[(2'h2):(1'h0)] : $unsigned((reg17 > (8'hbd))))) ?
          ((&$unsigned(reg16)) | ({$signed(wire31),
              (wire2 ^ wire27)} < ($unsigned(wire36) != wire0))) : reg10);
    end
  module42 #() modinst213 (wire212, clk, reg12, wire3, wire27, wire32, reg9);
  assign wire214 = (~&wire37[(3'h4):(1'h0)]);
endmodule

module module42
#(parameter param211 = ((~&((-((8'h9d) >= (7'h40))) ? (!(|(8'haf))) : (((8'hb6) ? (8'hb1) : (8'ha4)) ^~ ((8'hac) ^ (8'h9f))))) ? (~&((~|((8'hac) ? (8'hb8) : (8'had))) << (&(!(8'ha9))))) : (((((8'hac) ? (8'ha9) : (8'haa)) ~^ (-(8'h9e))) >= (((7'h44) ? (8'hb2) : (8'hbd)) ? {(8'hb1)} : ((8'hbb) != (8'h9d)))) ? ((~|((8'hbd) && (8'hb0))) ? (&((8'hac) + (8'hb4))) : (~^{(8'h9e), (8'ha3)})) : {(((7'h40) < (8'ha3)) ? ((8'ha5) ^ (8'hba)) : ((8'ha1) ? (8'hac) : (8'hbc)))})))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h346):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire signed [(5'h14):(1'h0)] wire44;
  input wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire210;
  wire signed [(4'h9):(1'h0)] wire209;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire152;
  reg signed [(4'h8):(1'h0)] reg208 = (1'h0);
  reg [(4'hd):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg206 = (1'h0);
  reg signed [(4'he):(1'h0)] reg205 = (1'h0);
  reg [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(4'hf):(1'h0)] reg201 = (1'h0);
  reg [(3'h5):(1'h0)] reg200 = (1'h0);
  reg [(2'h3):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg197 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(5'h10):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg194 = (1'h0);
  reg [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg189 = (1'h0);
  reg [(4'hb):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  reg [(5'h12):(1'h0)] reg182 = (1'h0);
  reg [(4'ha):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(4'hb):(1'h0)] reg175 = (1'h0);
  reg [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire165,
                 wire164,
                 wire155,
                 wire118,
                 wire76,
                 wire74,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire122,
                 wire123,
                 wire124,
                 wire152,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg154,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire48 = $unsigned((wire45 ?
                      (wire44 > wire46[(2'h2):(2'h2)]) : (8'hb9)));
  assign wire49 = $unsigned(($signed({(~&wire48),
                      (wire43 + wire46)}) ^ {((|wire47) + {wire48, wire43})}));
  assign wire50 = (8'ha1);
  assign wire51 = (~|$signed((7'h40)));
  module52 #() modinst75 (wire74, clk, wire44, wire51, wire47, wire45);
  assign wire76 = $signed(wire47);
  module77 #() modinst119 (.wire82(wire47), .wire79(wire48), .clk(clk), .wire81(wire44), .wire80(wire76), .y(wire118), .wire78(wire74));
  always
    @(posedge clk) begin
      reg120 <= ((($signed($unsigned(wire48)) ?
              $unsigned((~|wire46)) : (!(wire118 << wire43))) ?
          $unsigned(wire47) : ((~&wire45[(4'ha):(4'h9)]) ?
              $unsigned($unsigned(wire74)) : ($signed(wire76) << (wire47 >> wire44)))) || $unsigned(($signed($unsigned(wire49)) ?
          (^~wire45) : (~(&wire51)))));
      reg121 <= ({$signed($signed($signed(reg120))),
          ($signed((wire76 ? (8'hb4) : wire48)) ?
              $unsigned(wire76) : wire48[(3'h4):(2'h3)])} == reg120[(3'h4):(2'h2)]);
    end
  assign wire122 = reg121[(1'h0):(1'h0)];
  assign wire123 = reg121;
  assign wire124 = $signed($unsigned(wire123));
  module125 #() modinst153 (.wire128(wire50), .wire127(wire44), .wire130(wire118), .wire126(wire48), .clk(clk), .wire129(wire51), .y(wire152));
  always
    @(posedge clk) begin
      reg154 <= ((((+{wire74}) ?
              (~(wire118 ? wire48 : wire74)) : ((wire44 & reg121) ?
                  (wire76 ?
                      wire49 : wire51) : wire51)) < (wire48[(4'h8):(4'h8)] & $signed(reg121))) ?
          reg121 : ($unsigned((~(^~wire43))) ?
              (~&({reg120} ?
                  wire47 : (wire122 ?
                      wire45 : wire47))) : (((wire46 > wire118) * $unsigned((8'ha8))) ?
                  wire123[(1'h0):(1'h0)] : {((8'hbd) < wire122), {wire51}})));
    end
  assign wire155 = $signed($signed((wire47 ? $unsigned({reg154}) : wire43)));
  always
    @(posedge clk) begin
      reg156 <= wire45[(5'h14):(4'hc)];
      if ($unsigned(($unsigned($unsigned((^wire122))) <<< $unsigned(reg120[(2'h3):(1'h0)]))))
        begin
          reg157 <= {({reg156[(3'h4):(2'h3)], wire155} ?
                  $signed(wire118[(2'h3):(1'h0)]) : $unsigned(((!wire45) < wire51))),
              $unsigned(((8'ha7) >>> wire76[(2'h2):(2'h2)]))};
          reg158 <= (reg120[(3'h4):(1'h0)] ?
              (wire124 ?
                  $unsigned(wire122) : (|wire124[(4'he):(4'hc)])) : $signed(reg120[(1'h0):(1'h0)]));
          if ($signed(($unsigned((^wire46[(2'h2):(1'h1)])) ~^ (wire76 ?
              $signed(((8'hb9) ?
                  wire43 : (8'ha2))) : wire124[(5'h12):(4'hb)]))))
            begin
              reg159 <= {($unsigned(reg156[(4'ha):(2'h3)]) * $unsigned($signed(wire49[(3'h5):(2'h2)]))),
                  $signed((wire47[(4'hb):(3'h5)] >= (reg156[(4'h8):(1'h0)] ?
                      (wire118 ? wire51 : wire48) : reg154[(3'h7):(2'h3)])))};
              reg160 <= (wire44 + (wire50[(1'h1):(1'h1)] << wire43));
              reg161 <= (!reg160);
            end
          else
            begin
              reg159 <= (((~{$unsigned(wire47)}) & reg160) ?
                  $unsigned(wire50[(3'h6):(1'h0)]) : (reg160[(4'h9):(3'h6)] ?
                      {wire155,
                          $unsigned(reg157)} : $signed((+$signed(wire48)))));
            end
        end
      else
        begin
          if ($unsigned((wire46 ? reg157 : reg161)))
            begin
              reg157 <= ($signed(wire49[(3'h5):(1'h0)]) || $unsigned(((((8'ha0) ?
                  wire74 : wire123) >= $unsigned(reg157)) <<< $signed({wire44,
                  wire45}))));
            end
          else
            begin
              reg157 <= $signed(reg160);
              reg158 <= (wire155 ?
                  (reg120[(3'h5):(3'h4)] <= {(~^(wire50 ? wire47 : reg156)),
                      wire49}) : (8'h9f));
              reg159 <= ($unsigned((~|wire44)) ?
                  ($unsigned(wire152) ?
                      $signed($signed({reg154})) : reg154[(3'h5):(3'h5)]) : (wire51[(3'h5):(2'h3)] ?
                      $signed((reg154[(3'h4):(2'h2)] << (reg158 | reg154))) : ({wire43[(3'h6):(1'h0)],
                          reg154} >= ({reg161} >> reg156))));
            end
          if ((reg159 > reg154))
            begin
              reg160 <= (wire74 ?
                  ((reg156[(2'h3):(2'h3)] ?
                      $signed((reg157 ?
                          reg120 : wire152)) : reg156[(3'h6):(1'h0)]) & (($unsigned(wire122) - (wire44 * (7'h42))) <<< wire47)) : ($signed(reg159) ?
                      $signed($signed($signed(wire47))) : {((wire50 ?
                                  reg120 : reg159) ?
                              {reg158, wire118} : wire50[(3'h6):(2'h3)])}));
              reg161 <= wire124[(3'h6):(3'h4)];
            end
          else
            begin
              reg160 <= (~^$unsigned(reg160));
              reg161 <= reg159;
              reg162 <= {(($signed(wire152[(4'hb):(3'h6)]) ?
                      $signed((wire44 + wire122)) : wire47[(3'h4):(2'h3)]) ^ (wire46 ?
                      ((-wire155) ?
                          wire155[(1'h1):(1'h0)] : (reg156 >>> wire76)) : reg160[(1'h0):(1'h0)]))};
            end
          reg163 <= $unsigned($signed($unsigned((|reg159))));
        end
    end
  assign wire164 = ($unsigned($unsigned(((reg158 * reg160) != $unsigned(reg154)))) ?
                       (&$signed((^~{reg162, wire45}))) : (^~reg163));
  assign wire165 = wire51;
  always
    @(posedge clk) begin
      reg166 <= ($unsigned(reg154) ?
          wire118 : $signed((((^wire50) ?
                  $unsigned((8'hae)) : ((8'had) ? reg154 : wire51)) ?
              $unsigned(((7'h44) != wire164)) : $unsigned((wire47 & reg120)))));
      if (wire44)
        begin
          reg167 <= (((reg156 << {(wire51 ? wire152 : wire45)}) ?
                  $unsigned($signed((~wire44))) : (&($unsigned(wire118) ?
                      $unsigned(reg156) : (!wire165)))) ?
              $unsigned(wire46) : (wire50[(3'h7):(1'h0)] ?
                  wire51 : wire123[(3'h5):(2'h2)]));
          reg168 <= (~&$signed($unsigned((~&(8'hae)))));
          reg169 <= ({reg167, (~|wire47)} << (wire50 ?
              (^~(^(7'h42))) : wire51[(3'h7):(3'h4)]));
          if ({reg167[(1'h1):(1'h1)],
              (($unsigned(wire43) ^~ (|$signed(reg161))) - reg168)})
            begin
              reg170 <= reg167[(1'h0):(1'h0)];
            end
          else
            begin
              reg170 <= (($unsigned($unsigned(reg120)) <<< (~^wire47)) && (wire48[(4'ha):(1'h0)] < (^~((reg160 ?
                      wire124 : reg157) ?
                  (reg170 ? reg154 : wire123) : $unsigned(reg154)))));
              reg171 <= {reg169[(5'h11):(3'h5)],
                  ((~^reg157[(3'h5):(1'h0)]) ?
                      $signed($unsigned(wire44)) : (($signed(reg162) << {reg161}) ?
                          {reg166,
                              (~wire44)} : (wire155[(2'h2):(2'h2)] ~^ (8'hbc))))};
              reg172 <= (|reg171[(1'h0):(1'h0)]);
              reg173 <= (($unsigned(reg162[(3'h4):(2'h2)]) << {wire45[(4'ha):(4'h9)],
                  ($unsigned(reg121) ?
                      (reg168 ?
                          reg163 : wire165) : wire165[(4'ha):(3'h6)])}) * ($unsigned(wire43) * wire46[(3'h5):(3'h5)]));
            end
          reg174 <= ((wire74[(3'h7):(3'h6)] && $signed((^(reg120 ?
              reg168 : wire124)))) >> ((((reg166 ? (8'hb3) : wire152) ?
                  (~&(8'h9e)) : (wire50 ?
                      reg160 : reg120)) ^~ (((8'had) * reg158) ?
                  $unsigned(wire122) : (8'ha5))) ?
              wire45[(3'h6):(1'h1)] : reg168[(3'h5):(2'h3)]));
        end
      else
        begin
          reg167 <= (8'ha5);
        end
    end
  always
    @(posedge clk) begin
      if ((reg157 <<< wire43[(3'h6):(1'h1)]))
        begin
          reg175 <= ($unsigned(((wire122 ? $signed((8'ha9)) : reg154) ?
                  wire49[(4'hd):(3'h7)] : {reg168, wire47[(3'h6):(1'h1)]})) ?
              (wire155[(3'h4):(3'h4)] ^~ wire164[(2'h2):(2'h2)]) : $unsigned(((~&$signed(reg154)) >>> wire118[(3'h5):(1'h1)])));
        end
      else
        begin
          if ({reg167, $signed($unsigned($unsigned((reg171 <= wire164))))})
            begin
              reg175 <= reg120[(4'h8):(2'h2)];
              reg176 <= (8'ha2);
              reg177 <= ((^((&reg120) ?
                      wire51[(4'h9):(4'h8)] : $signed(wire76))) ?
                  ({(reg154[(4'h8):(3'h6)] ?
                              $unsigned(wire118) : ((8'hae) >> reg160)),
                          (wire155 ? {wire118, reg158} : $signed(reg169))} ?
                      $unsigned(((wire74 < wire76) ?
                          wire155[(1'h1):(1'h0)] : (reg160 ?
                              reg175 : reg161))) : (+(reg174[(5'h11):(4'hd)] ?
                          ((8'hb7) >> reg170) : reg159))) : (!{(((8'hb3) ?
                              reg160 : wire50) ?
                          reg168 : wire43[(3'h6):(2'h2)])}));
            end
          else
            begin
              reg175 <= {(^(&(8'hab)))};
              reg176 <= ($signed($unsigned(($signed(wire45) ?
                  {reg176} : (reg154 ? reg168 : wire45)))) || reg170);
              reg177 <= ($signed($unsigned((8'ha2))) >> wire152);
              reg178 <= $unsigned($signed(({wire152} ?
                  $unsigned((reg175 ? wire50 : reg157)) : (-(+reg176)))));
              reg179 <= wire155[(4'h8):(4'h8)];
            end
          if ((&(reg161[(5'h10):(3'h6)] >= $unsigned((~^$signed((8'hb8)))))))
            begin
              reg180 <= $unsigned(((((reg159 && reg156) ?
                  reg176 : (wire152 ?
                      wire48 : wire164)) - reg169) < reg121[(2'h3):(2'h3)]));
              reg181 <= ($signed((reg175[(1'h0):(1'h0)] <= wire155)) <<< (8'hb1));
              reg182 <= (((^wire164) + ((^(^~reg162)) ?
                  (8'ha9) : (^~reg158[(4'ha):(3'h6)]))) == reg167);
              reg183 <= ((&reg172) ?
                  {{$unsigned((wire51 ? reg181 : (8'hba))),
                          ((reg174 | reg178) * (reg121 ? reg169 : wire165))},
                      {($signed(reg169) ?
                              $signed(wire47) : {reg158})}} : $signed(((8'hb4) - $signed(wire51[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg180 <= $unsigned(reg180[(4'ha):(3'h4)]);
            end
          reg184 <= (reg163 ? reg176 : (~^wire47));
        end
      reg185 <= reg157;
      reg186 <= {{(reg172[(3'h4):(2'h2)] | ((reg160 ? wire155 : (8'hb2)) ?
                  {reg174} : $signed((8'hab))))}};
    end
  always
    @(posedge clk) begin
      if (reg169)
        begin
          reg187 <= $unsigned(reg169);
        end
      else
        begin
          reg187 <= (~(~|$signed((wire49[(4'hf):(1'h0)] ?
              (wire123 ? (8'ha4) : reg121) : (reg186 ~^ wire43)))));
          reg188 <= $signed((reg121[(3'h5):(1'h0)] ?
              ({(wire46 ?
                      (8'hb6) : reg179)} + $signed(reg161)) : ($unsigned(reg178[(3'h5):(3'h5)]) - wire49[(4'h9):(3'h5)])));
          reg189 <= $signed((8'ha6));
        end
      if ($signed(reg159[(3'h5):(1'h0)]))
        begin
          if (((((~&$signed(wire122)) && reg185[(2'h3):(1'h0)]) + reg174[(2'h3):(1'h1)]) < reg161[(3'h6):(3'h4)]))
            begin
              reg190 <= $unsigned(($signed($signed((^~reg169))) ?
                  $signed(((8'hab) * (+wire43))) : $signed((reg182 ?
                      $signed(reg171) : (wire45 >> reg173)))));
              reg191 <= reg154[(3'h5):(3'h4)];
            end
          else
            begin
              reg190 <= (^$unsigned(($unsigned(reg163[(3'h4):(1'h0)]) ?
                  (~reg160[(3'h5):(2'h2)]) : {reg183[(1'h0):(1'h0)],
                      wire122})));
              reg191 <= (reg161 ?
                  ((~^((8'ha8) ? wire164 : $unsigned(reg189))) ?
                      ($unsigned(reg166[(4'hd):(3'h4)]) && reg176) : reg163[(4'ha):(4'ha)]) : (reg166[(4'ha):(4'ha)] >= reg166[(3'h5):(1'h1)]));
              reg192 <= $signed($signed($signed(((~|reg175) ?
                  {reg163, (8'haf)} : reg162))));
              reg193 <= reg159;
            end
          reg194 <= ($unsigned($unsigned(reg120[(3'h6):(1'h0)])) ?
              (reg188 ?
                  (($signed(reg177) ?
                          {reg168, reg193} : ((8'hbd) ? wire165 : reg174)) ?
                      $unsigned($signed(reg193)) : {$unsigned(wire46),
                          {wire118}}) : reg172) : (~^$unsigned({reg190[(5'h10):(1'h0)]})));
          reg195 <= reg191;
          if (((wire44 ?
              (-((+reg179) ~^ (&(8'hb3)))) : ($signed({reg195}) ?
                  (reg172[(1'h1):(1'h1)] ?
                      {reg179} : $signed(wire164)) : reg167)) ^~ wire50[(3'h4):(2'h2)]))
            begin
              reg196 <= $signed(wire51[(1'h1):(1'h0)]);
            end
          else
            begin
              reg196 <= $unsigned(reg174);
            end
        end
      else
        begin
          reg190 <= $signed((wire155 << {$signed($unsigned(reg179))}));
          reg191 <= $signed($signed($signed($signed((reg175 * reg185)))));
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg175[(1'h1):(1'h1)]))
        begin
          reg197 <= {reg163[(1'h0):(1'h0)]};
          reg198 <= (~$signed((((!reg167) ~^ $unsigned(reg169)) ?
              reg160 : (~^$signed(reg171)))));
          reg199 <= {({reg182} ?
                  wire165[(4'h8):(2'h2)] : (($signed(reg154) ^ (reg159 >> wire46)) && (((8'had) ?
                      reg192 : wire165) && reg163))),
              reg197};
          reg200 <= $unsigned(reg162);
        end
      else
        begin
          reg197 <= (wire49 | (~|reg158[(3'h5):(2'h2)]));
        end
      reg201 <= reg196[(3'h4):(1'h1)];
      reg202 <= (-$unsigned(((~&wire152) ?
          $signed($signed((7'h44))) : (wire48[(4'he):(1'h1)] ?
              $unsigned(reg188) : reg197))));
      if ($unsigned(({wire76} + $unsigned($unsigned((^reg156))))))
        begin
          reg203 <= (7'h41);
          reg204 <= $signed(((^($signed(wire123) ?
                  $signed(wire74) : {reg161})) ?
              (~&wire74) : reg169[(3'h7):(2'h3)]));
          reg205 <= reg183[(5'h11):(5'h11)];
          reg206 <= $signed($unsigned(reg178[(1'h1):(1'h0)]));
        end
      else
        begin
          reg203 <= reg194[(3'h4):(1'h1)];
          reg204 <= (&wire164);
          reg205 <= reg204[(4'h8):(3'h4)];
          reg206 <= reg158[(4'hc):(3'h7)];
          reg207 <= (|$unsigned($unsigned(((8'h9e) ~^ (reg170 ?
              wire152 : reg157)))));
        end
      reg208 <= (^{(((^reg195) == (reg195 ?
              reg189 : reg185)) && $unsigned($signed(reg157)))});
    end
  assign wire209 = (((8'hb8) ?
                       (~^wire155[(1'h0):(1'h0)]) : reg190) >>> $signed($unsigned((~^$signed(reg161)))));
  assign wire210 = reg192[(2'h3):(1'h0)];
endmodule

module module125
#(parameter param151 = (((~((~^(8'hb4)) ? (!(8'ha8)) : (~&(8'hb8)))) ? ({(~(8'ha2)), ((8'hae) <= (8'ha7))} ? ({(8'haf), (8'h9e)} + (~&(8'hb8))) : (^((8'hbd) * (8'ha0)))) : {{((8'h9c) == (8'hb2))}}) + (&{(((8'hb0) - (7'h44)) ? (8'hb3) : (&(8'hbd)))})))
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire130;
  input wire signed [(5'h12):(1'h0)] wire129;
  input wire [(4'hc):(1'h0)] wire128;
  input wire [(3'h7):(1'h0)] wire127;
  input wire signed [(4'he):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({wire130[(5'h14):(4'hb)]} ?
          ({(&wire130[(2'h3):(2'h2)]),
                  {(wire126 * wire127), wire130[(5'h15):(4'h9)]}} ?
              $unsigned(wire130) : $unsigned($unsigned($unsigned(wire130)))) : wire128))
        begin
          if ((8'ha4))
            begin
              reg131 <= wire130;
              reg132 <= (wire128[(1'h1):(1'h0)] ?
                  $signed({{$unsigned(wire127)},
                      $signed($unsigned((8'hbd)))}) : ((wire128 ?
                          ((~^wire130) >>> (wire127 ?
                              wire128 : (8'hb5))) : wire129) ?
                      wire128 : (wire126 ^ ((wire128 ? (8'hb6) : wire130) ?
                          wire129[(5'h12):(4'hb)] : (wire129 ?
                              wire129 : reg131)))));
              reg133 <= (~&($unsigned(reg132) ?
                  wire130[(4'hb):(4'h8)] : reg131));
              reg134 <= $unsigned(((wire126[(4'h9):(2'h3)] ?
                      ($signed(reg133) ? (~|wire130) : {reg132}) : reg132) ?
                  (~|$signed($signed(reg133))) : wire126));
              reg135 <= reg131;
            end
          else
            begin
              reg131 <= $unsigned((~^reg135));
              reg132 <= {$signed(($signed((-wire129)) ? wire126 : wire128)),
                  $signed({reg134})};
            end
          reg136 <= $signed(reg132);
          reg137 <= $unsigned((reg131 ? wire129 : reg134[(3'h6):(1'h1)]));
        end
      else
        begin
          reg131 <= wire129;
          reg132 <= $unsigned((8'hab));
          reg133 <= ($signed((7'h40)) ?
              $unsigned(wire129[(4'hf):(4'hf)]) : {(-((!(8'ha8)) >> $signed(reg136))),
                  wire130});
          reg134 <= ($unsigned(reg133) ?
              (wire130 + wire129[(4'he):(2'h2)]) : reg131);
        end
      reg138 <= (wire127 ? (wire126 & {$signed($signed(wire129))}) : wire126);
      reg139 <= ((8'haf) > (7'h40));
      reg140 <= {reg137[(3'h7):(2'h2)], (+(8'hb4))};
    end
  assign wire141 = $unsigned(reg131);
  assign wire142 = reg140;
  assign wire143 = $signed(((^{(wire126 * wire142),
                           (wire141 ? reg140 : reg131)}) ?
                       ({(reg136 ?
                               (8'ha6) : reg131)} || (|$unsigned(reg140))) : reg133[(4'hb):(3'h4)]));
  assign wire144 = ($signed({$unsigned(reg137)}) - (!reg131[(2'h3):(1'h1)]));
  assign wire145 = wire144[(4'ha):(3'h5)];
  assign wire146 = $signed((|wire143[(4'ha):(4'ha)]));
  always
    @(posedge clk) begin
      if ($signed(($signed((reg140 ^ (wire144 ?
          reg140 : (8'h9d)))) << $signed((+reg135[(4'h9):(3'h5)])))))
        begin
          reg147 <= reg136;
          reg148 <= wire127[(2'h3):(2'h3)];
          reg149 <= (reg135 << ((~|$unsigned((reg147 <<< (7'h41)))) << wire129[(4'hc):(3'h4)]));
          reg150 <= (7'h40);
        end
      else
        begin
          reg147 <= $signed((|reg149[(4'hb):(3'h5)]));
          if (reg138)
            begin
              reg148 <= reg131[(2'h3):(1'h1)];
            end
          else
            begin
              reg148 <= ({wire142[(3'h6):(1'h1)],
                      ($unsigned(wire143[(1'h1):(1'h1)]) ?
                          wire145[(2'h2):(2'h2)] : wire130)} ?
                  $unsigned({(~&reg140[(4'hb):(4'h9)]), (-reg132)}) : reg147);
            end
          reg149 <= ($signed(reg131) - reg139[(3'h7):(3'h4)]);
          reg150 <= $signed((($signed((|reg132)) ?
                  $unsigned(wire146) : ({reg136,
                      reg140} << reg147[(4'h8):(1'h0)])) ?
              (~|{$unsigned(reg135), reg149}) : (((+wire141) >>> (^~wire141)) ?
                  wire129 : $signed(wire144[(4'ha):(1'h0)]))));
        end
    end
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire82;
  input wire signed [(4'hd):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(2'h3):(1'h0)] wire79;
  input wire [(4'ha):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire85,
                 wire84,
                 wire83,
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
                 reg102,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire83 = ($signed(($unsigned($unsigned(wire78)) != (~&{wire81,
                      wire80}))) & wire79);
  assign wire84 = ({(~$signed((wire80 >>> wire82)))} ~^ wire82);
  assign wire85 = $signed($signed((&wire84[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      if ($signed(wire80[(1'h0):(1'h0)]))
        begin
          reg86 <= $signed($signed(wire83));
          reg87 <= wire83[(3'h7):(3'h7)];
          reg88 <= wire80;
          if ($unsigned($unsigned((((wire84 ? wire85 : reg87) ?
                  reg86[(3'h4):(3'h4)] : reg87[(1'h1):(1'h0)]) ?
              (8'ha3) : $unsigned(((8'hb2) * (8'hac)))))))
            begin
              reg89 <= ($unsigned((^(~|((8'hb0) == wire79)))) ?
                  (|($signed({(8'hb2)}) >= wire79)) : {wire83,
                      $unsigned($signed(((8'hbc) << reg88)))});
              reg90 <= (wire81[(2'h3):(1'h0)] ?
                  $signed(wire82) : (wire79[(1'h0):(1'h0)] ?
                      (~&(reg88[(2'h2):(1'h1)] & $unsigned((8'hb2)))) : (((wire81 ?
                              reg87 : wire79) | reg88[(2'h2):(1'h1)]) ?
                          $signed($signed(reg88)) : {(!(8'hb6)),
                              {reg89, reg86}})));
              reg91 <= wire82;
              reg92 <= (8'hb0);
              reg93 <= ($signed(({$signed(reg90)} ?
                  ({reg89} ^ (~|wire83)) : (^$unsigned(wire78)))) || (^($signed({reg86}) ?
                  $signed((reg90 == reg91)) : wire78)));
            end
          else
            begin
              reg89 <= ({(reg90 != $signed((wire78 ?
                      wire83 : wire83)))} > ((~|$unsigned(reg88[(1'h0):(1'h0)])) ?
                  wire79[(2'h2):(1'h1)] : $unsigned(wire85[(4'ha):(3'h7)])));
            end
        end
      else
        begin
          reg86 <= (reg87[(4'h8):(4'h8)] ?
              ($signed(wire85) ?
                  (-$unsigned({wire85, reg90})) : ((reg90[(3'h4):(2'h3)] ?
                          (+wire83) : (wire84 <<< reg89)) ?
                      $signed(wire83[(3'h7):(3'h4)]) : $signed($unsigned(wire85)))) : $unsigned((~{$signed(wire83)})));
        end
      reg94 <= (~^reg89[(3'h4):(2'h2)]);
      if (reg87[(4'h8):(3'h7)])
        begin
          reg95 <= (~reg90);
        end
      else
        begin
          reg95 <= (wire79 ?
              wire81[(4'hd):(1'h0)] : (($unsigned($signed((8'ha1))) ?
                  {wire82, reg90} : ({reg92} ?
                      (&reg87) : (reg92 ?
                          wire81 : wire80))) || (($signed(reg94) + (reg88 ?
                      (8'hb1) : wire82)) ?
                  (reg89 ? $signed((7'h44)) : {reg93}) : (((8'ha2) || (8'hac)) ?
                      reg92 : wire83))));
          if (($unsigned(((~|$signed(reg86)) ?
              reg95[(3'h4):(3'h4)] : $unsigned((reg90 ?
                  reg93 : wire82)))) >> reg89))
            begin
              reg96 <= wire81;
              reg97 <= $unsigned({wire83[(3'h4):(1'h1)]});
              reg98 <= reg86[(3'h4):(1'h0)];
              reg99 <= $signed((reg87 & {$unsigned((reg86 <= wire84)),
                  (^~reg97)}));
            end
          else
            begin
              reg96 <= $signed($unsigned((reg94[(4'hd):(4'hb)] - (reg88[(1'h0):(1'h0)] > (reg86 ?
                  reg96 : reg87)))));
              reg97 <= wire78;
              reg98 <= (&wire83[(3'h4):(2'h2)]);
              reg99 <= $signed($unsigned({((reg98 << reg91) ?
                      (~&(8'ha8)) : (reg86 ~^ reg86)),
                  (wire82 << wire79[(2'h3):(2'h3)])}));
              reg100 <= ((~&$signed(wire81[(4'ha):(4'ha)])) + $unsigned(wire78[(3'h4):(1'h0)]));
            end
        end
      if (reg89[(2'h3):(2'h3)])
        begin
          if ((wire81 || $signed(((reg96 ?
                  (~&reg100) : (reg98 ? reg89 : reg91)) ?
              reg100[(4'h8):(3'h4)] : (~(~|(8'hac)))))))
            begin
              reg101 <= reg87;
              reg102 <= (+((wire83 ^~ $signed(reg101)) < (($unsigned((8'hba)) ?
                      (|reg96) : {reg95, reg86}) ?
                  reg96 : {{reg89, (8'ha6)}, (wire79 != reg92)})));
              reg103 <= (~(~^$signed($unsigned($unsigned(reg90)))));
            end
          else
            begin
              reg101 <= reg89[(2'h3):(2'h3)];
              reg102 <= reg90[(2'h2):(1'h0)];
            end
          reg104 <= ((-($unsigned(reg96) != (|reg96))) - wire80);
          reg105 <= {{(8'ha6)}};
          reg106 <= $unsigned(reg102);
        end
      else
        begin
          reg101 <= wire83[(2'h2):(1'h0)];
          if (reg105[(2'h2):(1'h0)])
            begin
              reg102 <= ((8'ha6) - $unsigned($signed($unsigned((reg87 && reg100)))));
              reg103 <= reg95;
              reg104 <= ((reg99[(2'h2):(1'h1)] <<< (-reg99)) ?
                  reg92[(4'he):(3'h6)] : $unsigned(reg94[(4'h8):(2'h2)]));
              reg105 <= (reg94[(2'h2):(1'h1)] ? reg100 : wire82);
              reg106 <= (~^$unsigned(($signed((wire83 ?
                  wire85 : wire79)) * reg87)));
            end
          else
            begin
              reg102 <= reg87;
            end
          if ($signed(reg92))
            begin
              reg107 <= (~&$signed((|{reg95[(2'h2):(1'h0)],
                  $unsigned((8'ha4))})));
              reg108 <= $unsigned($unsigned(reg102));
              reg109 <= reg91[(1'h1):(1'h1)];
              reg110 <= reg105;
            end
          else
            begin
              reg107 <= ({$signed((reg107[(3'h4):(3'h4)] >> (reg97 >> reg96))),
                  $unsigned($signed((8'h9c)))} & (reg104 >>> (~&$signed((7'h44)))));
              reg108 <= (^({{(|reg106), reg101}, reg99} || (|reg104)));
            end
          reg111 <= $unsigned(((!$signed($unsigned(reg92))) + reg99));
          reg112 <= $unsigned($unsigned(reg96));
        end
    end
  assign wire113 = (~^$unsigned((reg96 ?
                       $signed((reg104 >= reg98)) : $signed($unsigned(reg106)))));
  assign wire114 = $unsigned((~^(8'hbf)));
  assign wire115 = wire114[(3'h4):(2'h2)];
  assign wire116 = ($unsigned((^~(~^(~|reg99)))) - (($signed(reg105) ?
                       {wire83} : $unsigned($unsigned(reg90))) ~^ $signed($signed(reg98))));
  assign wire117 = (~&wire78);
endmodule

module module52
#(parameter param72 = (8'had), 
parameter param73 = param72)
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(2'h2):(1'h0)] wire55;
  input wire [(4'ha):(1'h0)] wire54;
  input wire [(3'h4):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 (1'h0)};
  assign wire57 = wire55[(1'h0):(1'h0)];
  assign wire58 = (&(!{$unsigned($signed(wire56))}));
  assign wire59 = (wire56[(4'hc):(4'h8)] != wire57[(5'h12):(3'h5)]);
  assign wire60 = (wire55 ?
                      $signed($signed($unsigned($signed(wire58)))) : ((~$unsigned((&wire58))) ?
                          $signed(wire58) : $unsigned(((wire55 && wire59) ?
                              wire55 : (^~wire55)))));
  assign wire61 = $unsigned($signed(($signed((wire59 | wire55)) ?
                      (((7'h41) ? wire58 : wire53) ?
                          $unsigned(wire59) : (8'haf)) : ((wire60 <= wire55) ?
                          $unsigned(wire54) : wire57[(4'he):(4'hc)]))));
  assign wire62 = {{$unsigned(($signed(wire59) ? (8'haa) : wire60))}, wire60};
  assign wire63 = (($signed((~wire54)) + wire58) ?
                      (8'hb1) : (wire57[(4'h8):(1'h1)] <<< (((wire58 ?
                              wire61 : wire56) - $unsigned(wire57)) ?
                          $unsigned((|(7'h44))) : wire57)));
  assign wire64 = wire55;
  assign wire65 = wire59[(3'h4):(2'h2)];
  assign wire66 = ($signed($unsigned(wire64)) ^ wire61[(3'h5):(2'h2)]);
  assign wire67 = (($unsigned(wire66[(3'h7):(2'h2)]) ?
                      $unsigned((~^wire53)) : wire58) >>> wire64);
  assign wire68 = wire59;
  assign wire69 = $signed($unsigned((((7'h44) >= {wire59}) ?
                      $signed($unsigned(wire63)) : {(~^wire53)})));
  assign wire70 = wire69;
  assign wire71 = wire57[(3'h4):(1'h1)];
endmodule
