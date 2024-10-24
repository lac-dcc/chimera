module top
#(parameter param172 = (~^((^((-(8'hbf)) ^~ (^(8'hbb)))) ? ((^((8'hb6) ^~ (7'h43))) != ({(8'hb8)} && ((8'hb3) ^ (8'ha0)))) : {((7'h44) != {(8'hb7)}), (((8'ha8) ? (8'h9c) : (8'hb9)) << (~(8'ha6)))})), 
parameter param173 = (param172 >= ((^((param172 - param172) ? (!param172) : ((8'h9f) || (7'h40)))) ? ((param172 ~^ (param172 ? param172 : param172)) == {{param172}}) : (~|((param172 >> param172) ? {param172} : (param172 ? param172 : param172))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire171,
                 wire169,
                 wire107,
                 wire25,
                 wire10,
                 wire9,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({wire3[(4'h8):(3'h5)],
          {($unsigned(wire2) * $signed(wire3)),
              $unsigned(wire1[(4'h8):(4'h8)])}});
      reg5 <= ((^~(^wire1[(1'h0):(1'h0)])) ?
          $signed({reg4}) : (($unsigned({wire3}) ? reg4 : wire1) ?
              (&$signed((reg4 & wire0))) : wire3[(4'h9):(1'h0)]));
      reg6 <= {($unsigned($unsigned((wire3 ?
              wire2 : wire0))) << $signed($signed((wire1 ? (8'hb3) : wire3))))};
      reg7 <= wire2;
      reg8 <= {wire1[(3'h5):(2'h3)]};
    end
  assign wire9 = wire1;
  assign wire10 = (reg7 ?
                      $signed({$unsigned((wire1 || wire2)),
                          ((wire1 || reg4) ?
                              (wire0 ?
                                  wire3 : wire0) : $signed(reg5))}) : $unsigned(reg4));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($unsigned({(8'ha1)}) ?
          $unsigned($signed(reg8)) : (!(wire1 ? reg8 : reg7))))))
        begin
          reg11 <= (!wire10[(1'h0):(1'h0)]);
          reg12 <= $unsigned($unsigned(reg7));
        end
      else
        begin
          if ($signed(($unsigned($signed(((8'haf) ?
              reg11 : reg12))) >>> {wire1[(2'h3):(2'h3)]})))
            begin
              reg11 <= $signed($unsigned((wire0 ?
                  reg5[(1'h0):(1'h0)] : $unsigned((!wire0)))));
              reg12 <= $signed(reg8);
              reg13 <= ((~(8'hb3)) ?
                  (($unsigned($unsigned(reg6)) - (wire10[(3'h4):(1'h1)] & {reg4})) <= reg7[(3'h5):(1'h1)]) : reg8[(3'h5):(2'h2)]);
              reg14 <= (+$signed(reg11));
            end
          else
            begin
              reg11 <= ({(+(wire2 ^~ $unsigned(reg14)))} ?
                  {$signed(((!reg4) >= (8'hab)))} : wire9);
              reg12 <= ($signed(($unsigned($unsigned(wire9)) ~^ ((!reg8) << wire10[(2'h2):(1'h1)]))) ~^ $unsigned(wire9));
              reg13 <= reg13;
            end
          if (((({(~reg11), {reg6}} & ($unsigned(reg4) ?
                      reg8 : reg5[(3'h4):(3'h4)])) ?
                  (reg13[(4'hc):(4'hb)] ?
                      ((reg14 + reg8) ?
                          (&reg7) : reg13[(4'he):(3'h6)]) : {$unsigned((7'h42)),
                          (8'ha5)}) : $unsigned($unsigned((wire0 ^ reg5)))) ?
              (reg7 ?
                  ((~|(wire3 ? reg14 : (7'h42))) ?
                      reg12[(2'h3):(2'h3)] : $unsigned($signed(wire2))) : ($signed((~^reg7)) ?
                      ((wire3 ? wire3 : wire0) ?
                          $signed(wire1) : (~reg13)) : ($signed(reg14) || (~^(8'hb2))))) : ($unsigned($unsigned({reg13,
                  wire10})) == (($unsigned(reg13) ? reg4 : $unsigned(reg6)) ?
                  (((7'h40) < (8'ha5)) ? {reg13} : $unsigned(wire9)) : reg12))))
            begin
              reg15 <= wire1[(4'hd):(2'h2)];
            end
          else
            begin
              reg15 <= ((!$unsigned($signed(reg4[(4'h8):(3'h5)]))) >> (^~(^~$signed((^reg5)))));
              reg16 <= wire1;
              reg17 <= (+wire10[(1'h1):(1'h0)]);
              reg18 <= ((|(~&{(wire2 * (8'hb0)), reg13[(5'h13):(4'ha)]})) ?
                  $signed((!{(~|wire10), $signed(reg11)})) : reg15);
              reg19 <= $unsigned($signed(($signed(reg7[(4'h9):(4'h9)]) ?
                  $signed(reg15[(3'h4):(2'h3)]) : reg15[(1'h1):(1'h1)])));
            end
          reg20 <= (((!$signed((^~reg11))) ?
              {(~|((8'h9e) ?
                      reg4 : reg18))} : reg14[(4'hc):(3'h7)]) <= (reg16 ~^ wire3[(4'ha):(2'h3)]));
          reg21 <= (8'hb2);
          reg22 <= ((wire1[(4'h9):(2'h3)] & (~{(wire0 ? reg4 : (8'hae)),
                  $unsigned(wire0)})) ?
              {$unsigned($signed(wire2[(4'ha):(3'h6)])), (8'ha2)} : (~wire9));
        end
      reg23 <= (&($unsigned(wire3[(1'h1):(1'h0)]) ?
          (8'ha2) : reg15[(2'h3):(2'h2)]));
      reg24 <= $unsigned(reg12);
    end
  assign wire25 = wire3;
  module26 #() modinst108 (.y(wire107), .wire28(wire3), .wire29(reg8), .wire30(reg17), .wire27(wire0), .clk(clk));
  module109 #() modinst170 (wire169, clk, reg7, wire0, wire3, reg14);
  assign wire171 = ({{($signed(reg19) <= wire9[(5'h12):(4'hb)])}, wire1} ?
                       reg7 : $unsigned(({(|reg20)} ?
                           $unsigned((wire169 ?
                               wire9 : reg13)) : (+(~&reg24)))));
endmodule

module module109
#(parameter param168 = ((((((8'ha2) ? (8'hb9) : (8'h9f)) | ((7'h44) == (7'h43))) ? ((^~(8'ha5)) ? {(8'h9d), (8'hb2)} : ((8'h9c) * (7'h41))) : (|(+(8'haf)))) ? (((^~(8'hb4)) ? (!(8'hb5)) : {(8'ha7), (8'hb7)}) ? {((8'hbb) ? (8'hb6) : (8'ha1))} : (|{(8'ha0), (8'hb1)})) : (((~&(8'had)) == ((7'h41) ? (8'ha7) : (8'hb4))) | (~&{(7'h44), (8'ha3)}))) ~^ (~({((8'h9c) != (8'ha8)), ((8'hb2) && (8'had))} || ({(8'hb4), (7'h41)} ? ((8'haa) ? (8'ha7) : (7'h43)) : (8'ha8))))))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h26a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire113;
  input wire signed [(4'hd):(1'h0)] wire112;
  input wire signed [(3'h6):(1'h0)] wire111;
  input wire [(4'hf):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire165;
  wire [(5'h14):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire163;
  wire signed [(5'h15):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire114;
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire139,
                 wire138,
                 wire125,
                 wire124,
                 wire122,
                 wire119,
                 wire118,
                 wire114,
                 reg167,
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
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
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
                 reg121,
                 reg120,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire114 = (8'ha6);
  always
    @(posedge clk) begin
      reg115 <= wire112[(1'h0):(1'h0)];
      reg116 <= wire113[(4'ha):(3'h7)];
      reg117 <= wire110[(3'h6):(2'h2)];
    end
  assign wire118 = {((($unsigned(wire114) & reg117) == (wire110[(1'h1):(1'h0)] ?
                           $unsigned(reg116) : (reg117 ?
                               (8'ha2) : reg116))) < reg115[(2'h2):(1'h0)])};
  assign wire119 = wire113[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg120 <= $signed((wire114[(2'h2):(2'h2)] ?
          wire112 : reg115[(2'h3):(2'h2)]));
      reg121 <= $signed({$unsigned(reg120)});
    end
  assign wire122 = {($unsigned($signed(wire119)) | (~$unsigned((~|wire119))))};
  always
    @(posedge clk) begin
      reg123 <= (^~(7'h41));
    end
  assign wire124 = $signed($signed($signed((|(reg123 * wire113)))));
  assign wire125 = ($signed(reg115) & {(wire114[(1'h1):(1'h0)] ^~ {{wire110,
                               reg121},
                           $signed((8'ha5))})});
  always
    @(posedge clk) begin
      reg126 <= {$unsigned((~&{wire111, (8'hb1)})),
          $unsigned(({$unsigned(reg116), (~|reg115)} ?
              {(reg123 ? (8'hae) : wire125)} : (|wire114)))};
      reg127 <= $signed(((((wire125 == reg123) ?
                  wire111 : (wire118 ? wire125 : wire125)) ?
              reg117 : ($signed(wire118) & wire118)) ?
          $signed((reg115[(2'h3):(2'h3)] >= wire122[(4'hc):(4'hb)])) : ((~|(reg126 ?
              (7'h44) : (8'h9e))) ^ (-((8'hac) > reg121)))));
      reg128 <= ($signed((((~&reg127) < $signed(reg117)) ?
          {$unsigned(reg121)} : $unsigned($unsigned(wire111)))) + $unsigned($signed(wire111[(2'h2):(1'h0)])));
      reg129 <= $signed((&$signed(wire112[(3'h5):(3'h4)])));
      if (reg116)
        begin
          reg130 <= ((|reg123) > (!(reg117[(4'h8):(2'h3)] ?
              ($unsigned(wire122) + reg115) : (reg123 >>> (&(8'hb8))))));
          reg131 <= ($signed($signed($unsigned(reg129))) != $signed(((|wire112[(3'h4):(2'h2)]) - {$signed(reg115),
              (wire114 ? wire118 : wire111)})));
          reg132 <= (^~(-(({wire125} == {reg121}) ?
              $unsigned(reg120[(1'h0):(1'h0)]) : (~|reg126))));
          if (reg130)
            begin
              reg133 <= wire118[(1'h1):(1'h0)];
              reg134 <= reg130;
              reg135 <= wire124;
              reg136 <= $unsigned(reg132[(3'h6):(3'h5)]);
            end
          else
            begin
              reg133 <= $unsigned({reg120, reg126});
              reg134 <= ({reg121} ?
                  ((~$signed((-(8'ha7)))) ^ wire112) : $unsigned(wire125));
              reg135 <= $unsigned((reg129 ?
                  ({reg123} ?
                      reg120[(2'h2):(1'h1)] : reg131[(4'hb):(3'h5)]) : $signed((wire113 ^~ reg132))));
            end
          reg137 <= reg134;
        end
      else
        begin
          reg130 <= $unsigned($signed(wire114));
          if (reg134)
            begin
              reg131 <= $signed(reg130);
            end
          else
            begin
              reg131 <= (reg134 >> ((^reg129) ?
                  (~reg116[(2'h2):(2'h2)]) : (-(8'hb0))));
              reg132 <= {$signed(wire118[(3'h6):(2'h2)])};
              reg133 <= {(~|(&$signed(wire125[(4'he):(4'he)]))),
                  $unsigned((8'hb3))};
            end
          reg134 <= $unsigned({(~^(reg117[(1'h1):(1'h0)] ?
                  reg116[(3'h4):(2'h3)] : $signed(reg134))),
              (wire110 * {$unsigned(reg128)})});
          reg135 <= {reg117[(3'h4):(2'h3)], $unsigned((8'hb7))};
          reg136 <= $unsigned(($signed(wire110) ?
              $signed({(reg130 ?
                      wire119 : wire122)}) : ((reg121[(3'h5):(2'h3)] ?
                  ((8'hbc) >>> reg131) : (reg126 ?
                      wire118 : reg120)) ^~ $signed((reg127 ?
                  reg123 : reg135)))));
        end
    end
  assign wire138 = (8'ha2);
  assign wire139 = (&wire118[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(8'hb5), wire139})
        begin
          reg140 <= ((reg133[(1'h1):(1'h0)] >>> (reg136 ?
              wire119[(4'ha):(1'h1)] : (reg116 || (^~reg120)))) << wire125);
          if ((~(-(-$signed((wire125 ~^ wire112))))))
            begin
              reg141 <= wire119;
              reg142 <= wire125[(4'ha):(3'h7)];
              reg143 <= reg133;
              reg144 <= ((~$unsigned(reg133)) <<< (&({(wire113 + reg128)} ?
                  $signed((wire119 ? (8'h9e) : (8'ha6))) : {$unsigned(reg137),
                      (reg121 ? reg132 : reg143)})));
              reg145 <= (~$signed($signed($signed((wire139 != wire139)))));
            end
          else
            begin
              reg141 <= ($signed({$unsigned($unsigned(reg128))}) ?
                  {$unsigned(reg120[(1'h0):(1'h0)])} : ((~&(|(^~reg116))) ?
                      (wire138[(5'h14):(5'h12)] ?
                          ((reg144 <<< reg131) ~^ (reg123 ?
                              reg121 : wire112)) : (&$unsigned(wire125))) : (reg136[(2'h3):(2'h3)] || (+$unsigned(reg133)))));
              reg142 <= reg120;
            end
          if (wire122[(5'h10):(3'h5)])
            begin
              reg146 <= (8'hba);
              reg147 <= reg136[(3'h5):(2'h3)];
              reg148 <= (8'hb0);
              reg149 <= $signed(reg135);
              reg150 <= $signed(((8'ha6) >> reg148[(3'h7):(2'h2)]));
            end
          else
            begin
              reg146 <= (-$unsigned(reg121[(3'h5):(1'h0)]));
              reg147 <= reg147[(2'h2):(1'h1)];
              reg148 <= wire110;
              reg149 <= $signed($unsigned($signed($unsigned(reg120))));
            end
          reg151 <= $unsigned((~($unsigned($unsigned(reg142)) ^ {(reg120 & wire111)})));
          reg152 <= wire138[(4'hb):(1'h0)];
        end
      else
        begin
          reg140 <= $unsigned($unsigned((8'hb2)));
          if ((7'h42))
            begin
              reg141 <= (+reg140[(3'h4):(2'h3)]);
            end
          else
            begin
              reg141 <= ($signed(($signed(reg152) & (^reg151[(4'hc):(1'h0)]))) ?
                  $unsigned(wire113) : (+$unsigned(reg142[(1'h0):(1'h0)])));
              reg142 <= (&((((8'ha8) ? {reg143, reg136} : $unsigned(wire139)) ?
                      wire112[(3'h7):(1'h1)] : $signed((^~reg117))) ?
                  ($unsigned($unsigned(wire112)) + reg120[(2'h3):(1'h0)]) : ($unsigned($unsigned(reg117)) != $unsigned($unsigned(wire112)))));
            end
          reg143 <= ($unsigned($unsigned(reg144[(3'h4):(2'h3)])) || wire110[(2'h3):(2'h3)]);
        end
      reg153 <= {$unsigned((reg135[(3'h5):(1'h0)] - $signed(reg135[(3'h6):(1'h0)]))),
          (8'h9d)};
      if ((reg132 ?
          $signed($unsigned(($signed(reg151) >>> reg129[(2'h3):(2'h2)]))) : {{$signed((reg144 + (8'hb5))),
                  wire114[(2'h2):(1'h0)]}}))
        begin
          reg154 <= (&wire122);
          reg155 <= $unsigned(wire138);
          if (reg117[(4'hc):(2'h3)])
            begin
              reg156 <= reg117;
              reg157 <= reg117;
            end
          else
            begin
              reg156 <= (reg136[(3'h4):(1'h1)] ^ (~|$unsigned({(reg134 == reg132)})));
              reg157 <= (reg134[(2'h2):(1'h1)] ?
                  $unsigned(((7'h44) > wire124[(4'ha):(3'h5)])) : wire113[(3'h6):(1'h1)]);
              reg158 <= $signed((7'h40));
            end
        end
      else
        begin
          reg154 <= (~&$signed(({(wire119 ? reg142 : (8'hb2)),
              $signed((8'ha5))} - $signed(reg148))));
        end
      reg159 <= $signed({(+((8'hba) <<< ((8'hb0) >>> (8'ha5)))),
          (reg149[(3'h7):(3'h7)] | $signed($unsigned(reg143)))});
    end
  assign wire160 = wire118[(1'h1):(1'h0)];
  assign wire161 = $unsigned((wire112 || (~$signed({reg140}))));
  assign wire162 = reg148[(1'h0):(1'h0)];
  assign wire163 = (({{(reg120 || wire138)}, reg115} ?
                           reg142[(3'h4):(1'h0)] : $signed({(reg158 <<< (8'hbf)),
                               (reg117 ? wire139 : (8'ha8))})) ?
                       (~|wire111) : (!(&reg120)));
  assign wire164 = $signed(reg151);
  assign wire165 = reg149;
  assign wire166 = {(reg148 * ($unsigned({reg140, wire162}) ?
                           ((~|reg158) ?
                               (reg115 ?
                                   wire125 : reg153) : (reg133 < wire160)) : $unsigned((^reg151))))};
  always
    @(posedge clk) begin
      reg167 <= $unsigned((~|$signed((reg117 ? $signed((8'ha9)) : wire165))));
    end
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
  assign wire31 = ($unsigned(({(+wire27), (wire27 ? wire30 : wire30)} ?
                          ((wire29 ? wire29 : wire27) ?
                              wire29[(3'h7):(3'h6)] : (~^(8'had))) : ((^~(8'hb5)) > (^wire27)))) ?
                      (!$unsigned(wire30)) : ((((|wire27) ?
                          wire28[(4'hd):(1'h1)] : $signed(wire30)) || wire30[(5'h11):(4'ha)]) & (wire28 ?
                          {(wire28 && wire30)} : wire27)));
  assign wire32 = {((^~({wire29, wire31} <<< $signed(wire29))) ?
                          wire27[(4'h8):(4'h8)] : $signed($unsigned(wire29[(3'h7):(2'h3)])))};
  assign wire33 = $signed(wire30);
  assign wire34 = wire29;
  assign wire35 = $signed($signed(($unsigned(wire31[(3'h4):(1'h0)]) ~^ $unsigned((wire34 >= wire27)))));
  assign wire36 = $signed(({{(!wire27)},
                      (((8'hab) ~^ wire28) <<< (wire35 <<< wire27))} && $unsigned($signed($signed(wire31)))));
  assign wire37 = wire34[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= wire29[(1'h0):(1'h0)];
      reg39 <= (reg38[(2'h2):(1'h0)] ^~ ((+{$unsigned((8'hb8))}) << wire31[(1'h1):(1'h0)]));
      if ($unsigned((({(wire36 ? wire30 : wire37)} - wire31[(3'h4):(1'h1)]) ?
          $signed(wire32[(3'h7):(2'h3)]) : reg39[(1'h0):(1'h0)])))
        begin
          reg40 <= wire31[(3'h4):(3'h4)];
          if ((wire29 ?
              $unsigned((~wire28[(4'h9):(1'h1)])) : (+$unsigned((8'hbd)))))
            begin
              reg41 <= wire30[(4'ha):(4'h8)];
              reg42 <= wire35[(2'h2):(1'h0)];
              reg43 <= reg42;
            end
          else
            begin
              reg41 <= (wire36 << $unsigned((^(wire30[(4'he):(4'ha)] ?
                  (|wire37) : wire35[(2'h2):(1'h0)]))));
              reg42 <= $unsigned(reg39[(3'h5):(2'h2)]);
            end
          reg44 <= $unsigned({{($unsigned(wire31) ?
                      $signed(wire29) : {wire31})},
              wire27});
          reg45 <= (~^(~^$unsigned({{wire27, wire32}})));
          if ({(wire37[(3'h6):(3'h4)] ?
                  ((^~(reg38 ? reg41 : reg42)) ?
                      (^(wire31 ^~ (8'hbd))) : $signed(reg42[(4'hb):(3'h4)])) : $signed(wire27))})
            begin
              reg46 <= (($signed(wire33) ?
                  ((8'hb2) & reg42) : (^wire35)) | wire34[(1'h1):(1'h0)]);
            end
          else
            begin
              reg46 <= reg43[(1'h0):(1'h0)];
              reg47 <= $unsigned($signed($unsigned(reg39)));
            end
        end
      else
        begin
          reg40 <= $unsigned($unsigned((($signed(reg44) <<< (^wire37)) <= reg42[(4'h8):(1'h0)])));
        end
    end
  module48 #() modinst92 (.wire52(reg46), .wire49(reg44), .clk(clk), .wire50(wire36), .y(wire91), .wire51(wire32));
  assign wire93 = (~wire35[(3'h6):(3'h4)]);
  assign wire94 = (-$unsigned($unsigned(reg47[(3'h5):(1'h1)])));
  assign wire95 = wire34;
  assign wire96 = ($unsigned($unsigned(reg46)) ^ wire30);
  assign wire97 = (8'hab);
  assign wire98 = wire91;
  assign wire99 = ($unsigned((reg44 | $signed((wire98 && (8'hb9))))) ?
                      $signed(reg47[(2'h3):(2'h2)]) : reg47);
  always
    @(posedge clk) begin
      reg100 <= wire33[(3'h6):(2'h3)];
      if ((($unsigned(((reg43 | wire97) * $unsigned((8'hbb)))) == $unsigned(wire30[(5'h13):(5'h10)])) <<< (-(8'h9e))))
        begin
          if ($signed($unsigned(wire34)))
            begin
              reg101 <= ({wire32,
                      ((+(!reg44)) ? $unsigned($unsigned(wire35)) : reg45)} ?
                  $unsigned((~^((^~reg40) ?
                      {wire33, (8'hb3)} : {wire37, reg41}))) : (wire97 ?
                      ($unsigned((wire36 && wire36)) ?
                          wire91[(4'h8):(1'h0)] : wire30) : wire34));
            end
          else
            begin
              reg101 <= (8'ha3);
              reg102 <= wire96[(2'h3):(2'h3)];
            end
          reg103 <= (({$signed((reg46 ^ reg101)),
                  $unsigned(reg45[(2'h3):(1'h1)])} && wire37) ?
              (wire91[(2'h2):(1'h0)] > reg42) : wire34);
          reg104 <= ((!(wire37 & ($unsigned((8'hab)) && $signed((8'ha6))))) && $unsigned((~|((^reg38) ?
              (reg43 ~^ reg100) : $signed(reg102)))));
        end
      else
        begin
          reg101 <= (8'had);
          reg102 <= $unsigned({reg46[(3'h6):(2'h2)]});
          reg103 <= $signed({wire35});
        end
    end
  assign wire105 = reg104;
  assign wire106 = $unsigned($unsigned(wire36[(5'h10):(2'h2)]));
endmodule

module module48
#(parameter param89 = {(8'ha1)}, 
parameter param90 = (param89 + (7'h41)))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire signed [(5'h11):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
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
                 reg74,
                 reg73,
                 reg72,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire53 = (($unsigned(($unsigned(wire50) ?
                          ((8'hb1) & (8'hbe)) : (~&wire51))) | (|wire50[(2'h2):(1'h1)])) ?
                      $signed(((wire49[(1'h1):(1'h0)] && wire50) >> ((wire51 ?
                          wire51 : wire50) < (wire52 ?
                          wire49 : (8'hb3))))) : $unsigned(wire51[(5'h11):(3'h7)]));
  assign wire54 = $signed((($signed(wire51) >= $signed(wire52)) <<< (|wire50[(1'h0):(1'h0)])));
  assign wire55 = (({wire51, wire51} ?
                          ($unsigned(wire51) ?
                              {wire54[(4'h8):(1'h1)],
                                  (wire51 ?
                                      wire51 : (8'hb5))} : $unsigned((8'h9d))) : $unsigned($unsigned($unsigned(wire52)))) ?
                      wire53 : ((&wire53) & {{$signed(wire49)}}));
  assign wire56 = (~($signed(((wire50 ?
                      wire50 : (8'hb1)) ^~ $signed(wire50))) ^~ ($unsigned((wire49 >= wire50)) <= ((wire54 ?
                          wire52 : (8'hbd)) ?
                      $unsigned(wire54) : $signed(wire55)))));
  assign wire57 = (wire49[(1'h1):(1'h0)] ?
                      {(+(7'h41)),
                          (&$signed(wire51[(3'h7):(2'h2)]))} : wire51[(2'h3):(1'h0)]);
  assign wire58 = (~(8'ha9));
  assign wire59 = (^(~^(!(&((8'hb0) ^ wire57)))));
  assign wire60 = wire50;
  assign wire61 = (&(~{((8'had) ? (|wire58) : $signed(wire60))}));
  always
    @(posedge clk) begin
      reg62 <= wire61[(3'h7):(3'h7)];
      if ({$unsigned($signed((!wire51))), $signed(wire52[(1'h1):(1'h1)])})
        begin
          if ($signed(wire57))
            begin
              reg63 <= (($signed({reg62,
                  {wire57, wire54}}) ^ (~^(^wire52))) ^ {$unsigned(({wire51,
                      wire61} & {(8'hb7)})),
                  (&wire50[(4'h9):(2'h3)])});
              reg64 <= ((({(wire60 ?
                              wire60 : reg63)} >= wire51[(4'hb):(3'h4)]) ?
                      $unsigned($unsigned((wire59 ?
                          wire49 : reg63))) : ($unsigned($unsigned((8'ha8))) ?
                          $signed($signed(wire58)) : ((wire60 ?
                              (8'hba) : wire59) ^ reg63))) ?
                  ({(~|(~|wire58)), wire59} ?
                      ($unsigned((~&(8'hb5))) & (8'ha4)) : {(~wire59),
                          ((^~(8'hb9)) ?
                              wire55 : wire58[(3'h5):(2'h3)])}) : (~^wire55[(3'h5):(1'h0)]));
              reg65 <= wire49[(1'h0):(1'h0)];
              reg66 <= (8'hbb);
            end
          else
            begin
              reg63 <= $unsigned(($unsigned($unsigned($unsigned(wire54))) ?
                  $unsigned((^~$signed(reg65))) : $signed((wire60 ?
                      (wire53 ? (8'hac) : reg66) : $signed(wire57)))));
              reg64 <= {wire53, reg66};
            end
          reg67 <= $unsigned(wire61);
        end
      else
        begin
          reg63 <= (!{$signed(($signed(reg67) + (wire49 ? reg62 : (8'hab)))),
              (~^$signed((wire55 ? reg67 : reg64)))});
          reg64 <= wire58;
          reg65 <= wire54[(3'h5):(2'h3)];
          reg66 <= wire53[(1'h1):(1'h1)];
        end
    end
  assign wire68 = ((&$signed(((-reg66) ^ (wire53 <= wire61)))) ?
                      (^wire50[(2'h2):(2'h2)]) : wire57);
  assign wire69 = $signed({$signed(wire61[(3'h5):(2'h3)]),
                      $signed($signed(wire56[(3'h4):(2'h2)]))});
  assign wire70 = wire56;
  assign wire71 = wire49;
  always
    @(posedge clk) begin
      reg72 <= {$unsigned($signed(wire61))};
      reg73 <= wire52[(2'h2):(1'h1)];
      reg74 <= $signed(wire60);
    end
  assign wire75 = ((wire57[(3'h5):(1'h1)] <= $signed((-reg66))) ?
                      wire69[(4'hd):(4'hb)] : $unsigned((8'ha3)));
  assign wire76 = {wire56, $signed((^reg74[(1'h1):(1'h1)]))};
  assign wire77 = reg67;
  assign wire78 = (8'hae);
  always
    @(posedge clk) begin
      reg79 <= (&reg74[(3'h4):(1'h0)]);
      if ({$signed(wire77)})
        begin
          if ($signed(reg65[(3'h5):(3'h4)]))
            begin
              reg80 <= $unsigned(($signed(((wire70 ?
                  reg67 : reg66) & $signed((8'hb6)))) > reg62));
            end
          else
            begin
              reg80 <= $signed(($signed((!(wire70 ?
                  wire61 : (7'h44)))) * ((^$signed((8'hb2))) <<< wire51[(2'h3):(1'h1)])));
            end
          reg81 <= wire52;
          reg82 <= $signed(wire61[(1'h1):(1'h1)]);
          if (wire61[(3'h4):(1'h1)])
            begin
              reg83 <= {$unsigned((((wire56 ? wire60 : reg67) ?
                      $unsigned((8'ha8)) : (-reg81)) ~^ (wire54 ~^ reg65)))};
              reg84 <= reg74[(1'h0):(1'h0)];
              reg85 <= (^(~|((|(reg67 ?
                  wire51 : wire76)) ~^ $signed({wire78}))));
              reg86 <= (wire55 < reg67);
              reg87 <= (wire75 > (($signed(((8'hb7) <= wire76)) ?
                  {$unsigned(reg66),
                      $unsigned(wire52)} : wire51) > $unsigned(wire54)));
            end
          else
            begin
              reg83 <= reg87[(2'h3):(2'h3)];
              reg84 <= (!reg72);
              reg85 <= wire78[(1'h1):(1'h0)];
            end
          reg88 <= wire55[(3'h4):(1'h1)];
        end
      else
        begin
          reg80 <= reg82;
        end
    end
endmodule
