module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire218;
  wire signed [(5'h15):(1'h0)] wire201;
  wire [(4'he):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire172;
  reg [(4'hd):(1'h0)] reg217 = (1'h0);
  reg [(5'h12):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg213 = (1'h0);
  reg [(3'h4):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(4'h9):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg205 = (1'h0);
  reg [(4'hf):(1'h0)] reg204 = (1'h0);
  reg [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(5'h12):(1'h0)] reg202 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg197 = (1'h0);
  reg [(3'h6):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg195 = (1'h0);
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg191 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg189 = (1'h0);
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire218,
                 wire201,
                 wire174,
                 wire4,
                 wire88,
                 wire172,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
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
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= $signed({(wire4[(4'h8):(2'h2)] ~^ $signed(wire3))});
      reg6 <= (wire2 ?
          wire4 : ((^$unsigned(wire2[(3'h7):(3'h5)])) ?
              (~&($unsigned((7'h42)) << {wire4})) : {(~^(wire1 ^ wire3)),
                  wire4[(2'h2):(1'h0)]}));
      reg7 <= $unsigned(wire0);
      if ($signed(wire0))
        begin
          reg8 <= {({(^~{wire2})} >>> (($unsigned((8'hb0)) ?
                      $unsigned((8'hae)) : $unsigned(reg7)) ?
                  (|{wire0}) : (~wire3[(4'hf):(4'h9)])))};
        end
      else
        begin
          reg8 <= $signed(((($unsigned(wire4) ?
                      $signed(wire3) : $unsigned(reg8)) ?
                  (8'hbc) : $signed(reg5[(2'h2):(1'h0)])) ?
              {(&(reg7 - (8'ha7)))} : $signed({((7'h43) ? (8'hab) : wire1),
                  (reg8 ? reg6 : reg7)})));
          reg9 <= $signed(reg6[(1'h0):(1'h0)]);
        end
      if (($unsigned((({reg7} ~^ {(8'hbe),
          wire0}) << (^~wire0[(4'h9):(1'h0)]))) < ($signed($unsigned((~&reg9))) >= ($signed((&reg6)) + (wire3[(4'he):(4'hb)] ?
          $unsigned(reg8) : wire1[(1'h1):(1'h1)])))))
        begin
          if ((|(-wire4[(3'h5):(3'h5)])))
            begin
              reg10 <= {(8'hb5), wire3};
              reg11 <= reg7[(2'h3):(2'h2)];
              reg12 <= reg6[(1'h0):(1'h0)];
              reg13 <= ($signed($signed(((reg11 ? wire0 : wire2) ?
                  (wire3 < wire0) : $unsigned(wire1)))) == wire1);
            end
          else
            begin
              reg10 <= (+reg8[(2'h2):(2'h2)]);
              reg11 <= {((reg8 < ((reg8 ~^ reg9) >= $signed(reg11))) & (-$signed(wire3)))};
              reg12 <= (((-$unsigned($unsigned(wire3))) ?
                  $unsigned($signed((-wire0))) : (reg6[(1'h0):(1'h0)] ~^ $unsigned((wire4 | reg12)))) || wire4[(2'h3):(1'h0)]);
              reg13 <= ((~^(^~$signed(reg13[(1'h1):(1'h0)]))) ? reg5 : (7'h42));
              reg14 <= $unsigned(wire2);
            end
          reg15 <= wire4;
          reg16 <= $unsigned((($signed((reg15 - reg8)) != {{reg15, reg14},
                  $unsigned(wire3)}) ?
              wire1[(1'h0):(1'h0)] : reg9));
        end
      else
        begin
          if ((~&(($signed((&reg8)) >>> ($unsigned(wire0) ?
              $signed((8'hb4)) : {(8'haf),
                  reg5})) != $unsigned($unsigned((reg16 - (8'ha9)))))))
            begin
              reg10 <= $unsigned(((8'ha9) <= wire1[(3'h4):(2'h2)]));
              reg11 <= reg6[(1'h1):(1'h1)];
              reg12 <= {(reg14 ? reg12 : reg8), wire3[(4'he):(4'ha)]};
              reg13 <= reg10;
              reg14 <= $unsigned(((((reg12 ?
                      wire3 : reg12) << (!wire0)) <<< wire0) ?
                  wire2[(1'h1):(1'h1)] : reg5[(4'he):(3'h5)]));
            end
          else
            begin
              reg10 <= $signed(reg9);
              reg11 <= $signed($signed(($signed(reg6) == $signed($unsigned(reg5)))));
              reg12 <= (reg11 <= ($signed($unsigned(reg15[(1'h1):(1'h1)])) ?
                  reg16 : (reg10[(4'h9):(4'h9)] ?
                      $unsigned($unsigned(reg11)) : $signed(reg6))));
              reg13 <= reg12[(1'h1):(1'h1)];
              reg14 <= ($signed(reg12) ?
                  (reg16 ?
                      reg9 : ($signed((|(8'ha4))) ?
                          ($unsigned(reg6) && (reg14 || (7'h41))) : ({reg11,
                              reg7} < (^wire3)))) : $signed($signed(reg13[(2'h3):(2'h3)])));
            end
        end
    end
  module17 #() modinst89 (.wire21(reg7), .y(wire88), .wire19(reg16), .wire18(reg9), .wire20(reg8), .clk(clk));
  module90 #() modinst173 (wire172, clk, reg11, wire3, reg5, reg13, reg8);
  assign wire174 = reg13;
  always
    @(posedge clk) begin
      if (wire4)
        begin
          if (reg12[(2'h3):(2'h2)])
            begin
              reg175 <= reg10[(3'h4):(3'h4)];
              reg176 <= $signed({(8'hb2)});
            end
          else
            begin
              reg175 <= (8'ha6);
              reg176 <= reg11;
              reg177 <= {$signed({(8'hbc), $unsigned($unsigned(wire0))})};
              reg178 <= {reg13[(4'h8):(3'h7)],
                  ((reg12 ?
                      ($unsigned((8'hb4)) <<< (8'ha0)) : $unsigned(wire172)) + $unsigned((+reg8[(4'h9):(3'h5)])))};
              reg179 <= $unsigned(reg177);
            end
          reg180 <= (((|($unsigned(reg14) ?
                  (reg13 ? reg6 : wire174) : (reg6 ? reg6 : (8'haf)))) ?
              reg5 : ($signed($signed(reg11)) > {reg179,
                  wire1[(1'h1):(1'h1)]})) & (~^$signed(wire1[(2'h2):(2'h2)])));
          reg181 <= (+reg11[(2'h3):(1'h1)]);
        end
      else
        begin
          if ($signed(($unsigned(($unsigned(reg11) ?
              reg15[(1'h0):(1'h0)] : $unsigned(reg10))) <= $signed(reg12[(2'h3):(1'h1)]))))
            begin
              reg175 <= $signed($signed((+((~&reg12) <<< {wire172, reg176}))));
            end
          else
            begin
              reg175 <= reg11[(2'h3):(2'h2)];
              reg176 <= {(({(!reg9)} ?
                      $unsigned({reg176,
                          reg12}) : (reg177 ^~ reg181[(3'h4):(1'h1)])) > {{reg14},
                      (reg13 ? $signed((8'hbd)) : wire2[(1'h1):(1'h1)])}),
                  $signed(reg6)};
              reg177 <= ((reg12 >> (($unsigned(reg5) > (-wire3)) ?
                      ((reg12 ? (8'ha7) : reg6) - wire4) : (8'ha4))) ?
                  reg179[(4'h8):(4'h8)] : ({(reg176 ~^ ((8'haa) ?
                          (8'h9d) : (8'haf)))} ^~ wire172));
            end
          reg178 <= (wire4 >> reg175[(1'h1):(1'h0)]);
          if ((-$signed(reg14)))
            begin
              reg179 <= ($signed(reg16[(3'h5):(2'h3)]) || (8'hbc));
            end
          else
            begin
              reg179 <= (~&(|$signed(reg15[(2'h3):(2'h3)])));
              reg180 <= ($signed((+(reg180[(4'he):(1'h1)] != (reg5 ?
                      reg178 : reg14)))) ?
                  $unsigned((((wire174 >> reg10) & (reg177 ?
                      reg5 : reg180)) && reg181)) : $signed({(+$unsigned(reg8))}));
              reg181 <= $unsigned(($signed(((+reg7) * (8'hb1))) ?
                  {$unsigned((wire3 >> (8'hb3)))} : (wire4[(2'h3):(2'h3)] ?
                      (|{wire174}) : reg11)));
              reg182 <= ($signed((7'h44)) ? reg15 : (~|(+$unsigned(reg10))));
              reg183 <= wire3;
            end
          if (reg182)
            begin
              reg184 <= reg5[(2'h2):(1'h1)];
              reg185 <= (reg181 >= reg9);
              reg186 <= {reg180[(3'h5):(1'h1)]};
            end
          else
            begin
              reg184 <= $signed((&$signed({(wire174 != reg176), (^reg8)})));
              reg185 <= ($unsigned((reg6 ?
                      (wire172[(1'h0):(1'h0)] ?
                          reg6 : $unsigned(wire1)) : (reg8 <<< reg8))) ?
                  ($signed($unsigned(wire172)) & (8'hbd)) : (wire0[(4'hd):(3'h4)] ?
                      $signed((reg7[(4'hd):(1'h1)] ~^ $signed(reg9))) : (((wire174 == reg181) ?
                              $unsigned(reg183) : (wire174 ? reg5 : reg5)) ?
                          (~(reg177 ?
                              (8'ha5) : (7'h43))) : $unsigned($signed(reg183)))));
              reg186 <= ((~(reg183 - (^{wire2}))) ?
                  reg177 : $signed($unsigned($unsigned(reg12[(1'h0):(1'h0)]))));
              reg187 <= wire0[(1'h0):(1'h0)];
            end
        end
      if (reg182)
        begin
          reg188 <= ({$unsigned(($signed(reg8) ?
                      (reg15 ? reg186 : (8'hb8)) : reg9))} ?
              $signed($unsigned((|(|(8'hbf))))) : reg182);
        end
      else
        begin
          if (reg183)
            begin
              reg188 <= $signed($unsigned((-$unsigned($signed(reg177)))));
              reg189 <= ((({reg10,
                  {wire3}} ^ reg12[(2'h2):(1'h1)]) < $signed((^~(+reg179)))) * ((&$unsigned($unsigned(reg178))) >= reg10));
              reg190 <= (8'hbc);
              reg191 <= (!{$unsigned(($unsigned(reg187) < (wire174 >= reg11)))});
              reg192 <= ({reg184} ^~ (+reg176[(4'hf):(3'h7)]));
            end
          else
            begin
              reg188 <= $signed({$unsigned((-reg15[(1'h1):(1'h0)])), reg185});
            end
          reg193 <= $signed(($signed($signed(((8'hb4) ? wire0 : (8'hb6)))) ?
              reg182[(3'h5):(3'h5)] : $unsigned((reg13[(5'h10):(2'h2)] << (8'haa)))));
        end
      if ((~^wire172[(2'h3):(2'h3)]))
        begin
          if (((wire172 << (+(&(reg178 && wire3)))) - ((-reg181[(3'h4):(1'h1)]) <= (reg5 ?
              {$unsigned((7'h43))} : ($signed((8'hbc)) ?
                  reg177 : $unsigned(reg188))))))
            begin
              reg194 <= (~|reg10[(2'h2):(1'h1)]);
              reg195 <= ((reg7 ?
                      $unsigned($signed((wire172 & reg182))) : $unsigned($signed((reg5 ^ reg178)))) ?
                  $signed($signed((~(~&(8'h9e))))) : {$unsigned($signed((reg178 ?
                          (8'hb6) : wire2))),
                      $signed($signed($signed(reg181)))});
              reg196 <= reg182;
              reg197 <= ($signed($signed({(reg177 ^~ reg10)})) & (8'h9e));
            end
          else
            begin
              reg194 <= ($unsigned((((8'h9e) * wire4[(4'h8):(3'h7)]) ?
                      ((reg178 == wire2) || (!wire174)) : reg182)) ?
                  $unsigned($signed((!$unsigned((8'hb8))))) : ($signed(((|(8'ha8)) ?
                          {wire0} : $signed(reg8))) ?
                      $signed(reg15) : (!(reg194 || (reg178 * reg7)))));
            end
          reg198 <= (reg176 ? {(^reg15)} : reg175[(1'h1):(1'h1)]);
          reg199 <= (^(((~&(reg183 ? reg14 : reg177)) ?
                  wire3 : $unsigned($unsigned((8'hae)))) ?
              $unsigned({$unsigned(reg197), {(8'hb3)}}) : reg8[(1'h1):(1'h0)]));
        end
      else
        begin
          reg194 <= (reg185[(2'h3):(2'h2)] ?
              $signed((|$signed(wire1))) : $signed(reg183[(4'hb):(3'h6)]));
          reg195 <= (8'hab);
          reg196 <= (reg7[(4'hd):(4'hc)] ?
              {(&$signed($signed(reg179))), reg12} : ((((^~reg196) + ((8'ha5) ?
                      reg196 : reg185)) ?
                  reg16 : (reg6[(2'h3):(1'h0)] == reg12[(2'h2):(2'h2)])) < reg188[(4'ha):(3'h5)]));
          reg197 <= reg14;
        end
      reg200 <= (reg178 ? (8'ha0) : (-(~|(^~reg193))));
    end
  assign wire201 = $signed(($signed(reg188) ?
                       reg179[(3'h7):(2'h3)] : (^$unsigned((reg16 ~^ reg198)))));
  always
    @(posedge clk) begin
      if ((!(~&$unsigned((reg176 ? reg13 : {reg11, reg187})))))
        begin
          reg202 <= (($unsigned(($signed(reg186) ?
                      (reg16 ? wire1 : reg186) : (+reg178))) ?
                  (((wire1 ? reg196 : wire1) & {reg177,
                      reg178}) + (reg16 | ((8'hbb) << reg12))) : (reg184 ?
                      $unsigned((reg9 ? reg15 : reg193)) : (&reg189))) ?
              reg184[(2'h3):(1'h0)] : $signed($unsigned(reg14)));
          reg203 <= (~^(8'h9c));
          if ($unsigned($signed(reg175)))
            begin
              reg204 <= (8'hbe);
            end
          else
            begin
              reg204 <= ($unsigned($signed(wire3[(5'h11):(5'h10)])) ^~ (|(8'hb4)));
              reg205 <= $signed(($signed($signed($signed(reg180))) ?
                  $signed($signed(reg10[(4'hd):(3'h4)])) : (8'hb1)));
              reg206 <= $signed((+(((~(8'hb7)) != (reg190 != reg15)) > reg197)));
              reg207 <= $signed((($unsigned({reg191}) - $signed($signed(reg180))) ?
                  ((~^((8'hba) != reg183)) ?
                      reg177[(1'h0):(1'h0)] : $signed(reg10[(4'hc):(3'h4)])) : (($signed((8'hbf)) ?
                          reg15 : ((8'hbc) ? reg188 : reg179)) ?
                      ((~|(8'h9d)) * (reg176 ? reg188 : wire3)) : reg199)));
            end
          reg208 <= $unsigned($unsigned(reg191[(3'h7):(1'h1)]));
          reg209 <= reg14;
        end
      else
        begin
          if ($signed(reg11))
            begin
              reg202 <= $signed((reg177 > (8'hb4)));
              reg203 <= $signed(reg5[(3'h4):(1'h0)]);
              reg204 <= $unsigned($unsigned(reg14));
            end
          else
            begin
              reg202 <= {(-$unsigned(wire2))};
              reg203 <= wire1;
              reg204 <= {$signed(reg179)};
              reg205 <= $signed($signed($unsigned((7'h42))));
            end
          reg206 <= $signed(reg176);
        end
      if ($signed(reg193))
        begin
          reg210 <= (~^reg176[(3'h6):(3'h6)]);
          reg211 <= (wire4[(3'h7):(3'h5)] ?
              $unsigned({(((8'hbf) ? reg179 : reg186) ?
                      (reg196 ? reg15 : reg190) : $unsigned(reg14)),
                  reg7[(4'h9):(4'h8)]}) : (+(reg6 == $unsigned({reg177}))));
        end
      else
        begin
          reg210 <= reg14;
          reg211 <= $signed(reg177);
          reg212 <= ($signed(((~^(reg197 ? wire172 : reg183)) ?
              reg189 : ($signed((8'hbe)) < reg178))) < wire88[(4'ha):(3'h7)]);
          reg213 <= reg209;
          if ((^(((+(wire172 ? (8'hb4) : reg198)) ?
              {((8'hbb) > reg179),
                  {(8'ha8), reg178}} : $unsigned(wire174)) >> reg181)))
            begin
              reg214 <= $unsigned($unsigned((($unsigned(reg7) ?
                      (reg183 ? reg188 : reg9) : (8'h9f)) ?
                  $unsigned($unsigned(reg195)) : $unsigned(reg184[(1'h1):(1'h1)]))));
              reg215 <= (({$unsigned((7'h40))} ?
                      ($unsigned((^~(8'hb7))) ^~ reg183[(4'hd):(2'h3)]) : (~|reg13)) ?
                  $unsigned(reg175[(1'h1):(1'h1)]) : ($signed(({reg189} ^ ((8'hb3) ?
                      reg210 : (8'had)))) ^ (($unsigned(reg176) || $unsigned(reg12)) ?
                      (~^$signed((8'hab))) : wire172[(4'h8):(4'h8)])));
              reg216 <= ({($signed($signed((8'ha3))) ?
                      (^{reg213, reg178}) : $unsigned((~&reg178))),
                  ($unsigned((wire174 <<< reg179)) | ({reg204, reg180} ?
                      $unsigned(reg199) : (~|wire172)))} <= (~|$unsigned({$unsigned(reg209)})));
              reg217 <= ({reg179[(4'h8):(3'h4)], reg15[(2'h2):(1'h1)]} ?
                  (~&reg211) : $signed(reg198));
            end
          else
            begin
              reg214 <= (((8'hb8) ?
                  $signed(((wire88 <= reg183) ?
                      (8'ha4) : {(8'hb1),
                          reg213})) : reg216) == $unsigned(reg205[(4'h9):(1'h0)]));
            end
        end
    end
  assign wire218 = (!($signed($unsigned($unsigned((8'hbf)))) != wire0));
endmodule

module module90
#(parameter param170 = (+(+({(~^(8'hb6)), {(8'ha1), (8'hac)}} | (((7'h43) ? (8'ha0) : (8'hb6)) ? ((8'ha3) & (7'h41)) : (~|(8'hae)))))), 
parameter param171 = ({{((param170 ? param170 : param170) ? (!param170) : (+param170)), (-{param170, param170})}, {{(^param170), (param170 ? param170 : param170)}}} << param170))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  input wire [(3'h5):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  input wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire166;
  wire [(4'hf):(1'h0)] wire164;
  wire [(4'hb):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire164,
                 wire131,
                 wire112,
                 wire111,
                 wire110,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg169,
                 reg168,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire96 = $signed($signed($unsigned(($unsigned(wire95) + (wire91 ?
                      wire95 : wire95)))));
  assign wire97 = (wire96 < {{((~wire96) ?
                              (wire95 + (8'h9d)) : ((8'ha1) ?
                                  wire96 : (8'hbd))),
                          ((wire96 + wire91) ? (wire93 & wire91) : {wire94})},
                      wire91[(2'h3):(1'h1)]});
  assign wire98 = wire93[(2'h3):(1'h0)];
  assign wire99 = wire95;
  assign wire100 = (-{((~(wire95 ? wire92 : wire91)) >= wire93[(1'h1):(1'h0)]),
                       $unsigned((+(wire93 & wire92)))});
  assign wire101 = {$unsigned(wire91), wire98};
  always
    @(posedge clk) begin
      if ({$unsigned((^~wire93)), wire92})
        begin
          if (($signed((7'h40)) ?
              $signed(({$unsigned(wire92), {wire101}} ?
                  $signed((wire93 ?
                      wire99 : (8'hac))) : (^((8'had) || wire91)))) : {($signed((wire91 ^ wire92)) <= wire98[(3'h6):(1'h0)])}))
            begin
              reg102 <= wire95;
              reg103 <= ((^~$signed(({(8'hae), wire100} ?
                      $unsigned(wire91) : $unsigned((8'ha3))))) ?
                  $unsigned((($signed(wire93) != {wire93}) << $unsigned($signed(reg102)))) : {{(wire92[(3'h5):(3'h4)] ?
                              $unsigned(wire92) : {wire101, wire99})}});
              reg104 <= $signed($unsigned((reg103[(4'h8):(4'h8)] <= wire94)));
              reg105 <= $unsigned($signed(((!{wire95, reg104}) ?
                  {wire99,
                      (reg104 >= wire95)} : $unsigned(wire101[(4'h8):(3'h7)]))));
            end
          else
            begin
              reg102 <= wire98[(2'h3):(1'h0)];
              reg103 <= wire99;
              reg104 <= wire98[(3'h7):(1'h0)];
            end
          reg106 <= $signed(wire100[(4'hb):(3'h5)]);
          reg107 <= reg104;
        end
      else
        begin
          reg102 <= ($signed({{$unsigned((8'h9f)), $unsigned(wire97)}}) ?
              $signed({($signed(reg107) ^ wire99[(3'h7):(1'h1)]),
                  {(~(8'ha1))}}) : $unsigned(wire94[(4'ha):(2'h2)]));
          reg103 <= reg106;
        end
      reg108 <= $unsigned((^~$signed((!reg106))));
    end
  always
    @(posedge clk) begin
      reg109 <= wire97[(3'h4):(3'h4)];
    end
  assign wire110 = (($unsigned(wire91) ? wire99[(4'ha):(2'h3)] : wire93) ?
                       {reg108} : $signed((({(8'haf)} && $signed(wire91)) ~^ ($unsigned(reg108) * $unsigned(wire101)))));
  assign wire111 = (!(reg102[(3'h7):(1'h0)] || {(reg109[(2'h2):(2'h2)] ?
                           (reg103 <<< wire97) : wire98[(2'h3):(1'h1)])}));
  assign wire112 = $unsigned((8'hbb));
  module113 #() modinst132 (wire131, clk, reg109, wire91, wire97, wire96, wire93);
  module133 #() modinst165 (.clk(clk), .wire138(wire131), .wire135(reg109), .wire136(wire99), .y(wire164), .wire134(wire91), .wire137(wire98));
  assign wire166 = wire110;
  assign wire167 = reg104;
  always
    @(posedge clk) begin
      reg168 <= reg103;
      reg169 <= $signed($unsigned(((reg109 ?
          (~|wire112) : wire91[(3'h4):(2'h3)]) < {(~&wire97)})));
    end
endmodule

module module17
#(parameter param86 = {((8'h9c) * ((+((8'h9d) - (8'ha0))) ~^ ((|(8'ha8)) >= (7'h40))))}, 
parameter param87 = (~|(^~{(param86 <<< {(8'h9c)})})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire67,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
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
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire22 = $signed((+wire21[(2'h2):(1'h1)]));
  assign wire23 = wire20;
  assign wire24 = (~(^~{wire18}));
  always
    @(posedge clk) begin
      reg25 <= ({($unsigned(wire21) & $signed($signed((8'hb7))))} ?
          ((7'h43) ~^ ((~&wire24) || ($unsigned(wire18) != (wire20 ?
              wire24 : wire22)))) : wire24[(3'h4):(3'h4)]);
      reg26 <= wire18;
    end
  assign wire27 = wire21[(1'h0):(1'h0)];
  module28 #() modinst68 (wire67, clk, wire22, wire24, wire20, reg26, wire21);
  always
    @(posedge clk) begin
      if ($signed($unsigned((^~wire22))))
        begin
          reg69 <= wire19;
        end
      else
        begin
          reg69 <= $signed({{reg25[(4'hd):(4'h9)],
                  (reg26 << wire67[(2'h2):(1'h0)])}});
          if (((!($unsigned({wire18}) + $signed(((8'hb2) ?
              wire18 : wire24)))) || $signed((~reg69))))
            begin
              reg70 <= $unsigned((wire20 ?
                  wire23[(2'h2):(1'h0)] : {{(wire19 ? wire18 : wire67)},
                      ($signed(reg69) ? (wire27 ? wire18 : reg25) : (8'hb0))}));
              reg71 <= (wire23[(1'h1):(1'h1)] ?
                  ((!$unsigned((!wire19))) > ($unsigned($unsigned(wire67)) ?
                      (-$unsigned((7'h43))) : wire27)) : ((~&$signed($signed(wire20))) <= $unsigned($unsigned((wire21 ?
                      (8'hb8) : reg26)))));
              reg72 <= (+reg26);
            end
          else
            begin
              reg70 <= reg70;
              reg71 <= ($unsigned($signed($signed(((7'h44) ?
                  reg70 : wire23)))) >>> wire22);
              reg72 <= {($signed($signed($signed(reg71))) ?
                      wire27[(1'h0):(1'h0)] : (~&wire20[(3'h6):(3'h4)])),
                  wire24[(4'h9):(2'h3)]};
              reg73 <= wire19;
            end
          if (wire67)
            begin
              reg74 <= wire18;
            end
          else
            begin
              reg74 <= ((7'h42) ?
                  $unsigned({{$unsigned(wire23),
                          $signed((8'hb3))}}) : ((($unsigned(wire24) ?
                              $signed((8'h9e)) : (wire18 < (8'ha1))) ?
                          (reg73[(2'h2):(1'h1)] ?
                              reg73 : (reg69 ? wire19 : (8'hb3))) : reg74) ?
                      reg72 : wire24[(2'h2):(1'h1)]));
              reg75 <= wire20[(2'h3):(1'h1)];
              reg76 <= ((reg70[(3'h6):(3'h4)] & $signed(((reg70 >= wire20) && reg72))) ?
                  {((~^$signed(wire23)) <= ((reg72 ?
                          reg73 : wire67) < (wire22 != (7'h42)))),
                      wire67} : $unsigned($unsigned((|$signed(reg26)))));
            end
        end
      if ({(~(~^$unsigned(wire18[(2'h2):(1'h1)])))})
        begin
          reg77 <= $signed((^((((8'hb9) ? reg70 : reg73) + {(8'hbf)}) ?
              ((wire20 ? (8'hae) : (8'ha5)) ?
                  wire23 : $signed(wire18)) : (-(^reg26)))));
          if (reg77)
            begin
              reg78 <= wire23;
              reg79 <= wire27;
              reg80 <= $unsigned(wire21[(4'hd):(4'ha)]);
            end
          else
            begin
              reg78 <= ($signed(wire19[(1'h1):(1'h0)]) ?
                  $signed($signed((^~$signed(wire24)))) : ((reg77[(3'h4):(1'h1)] <= $signed({reg26})) ?
                      (reg76[(2'h3):(1'h1)] <<< {wire24[(4'ha):(4'ha)]}) : (wire19 + $signed((+wire27)))));
            end
          reg81 <= $unsigned(reg71[(3'h6):(2'h3)]);
        end
      else
        begin
          reg77 <= $unsigned({$signed((reg26[(1'h0):(1'h0)] <<< $signed((8'hb3))))});
          reg78 <= reg25[(4'hd):(3'h4)];
        end
      reg82 <= {($signed($unsigned({wire27, wire22})) <= reg73), reg73};
    end
  assign wire83 = wire23;
  assign wire84 = (reg74 ?
                      ((((wire21 >>> reg70) >>> (wire21 || reg74)) + reg79) ?
                          $unsigned((^~(wire19 ?
                              reg73 : reg80))) : (wire27 & ($unsigned(wire24) || $signed(wire18)))) : (8'h9e));
  assign wire85 = $unsigned(($unsigned($signed((|reg25))) ?
                      (reg78[(2'h2):(1'h0)] ?
                          reg75 : (wire67[(2'h2):(1'h1)] ?
                              (wire27 ?
                                  reg73 : wire83) : {reg82})) : (-(wire23[(2'h2):(2'h2)] ?
                          (reg74 ? wire20 : reg77) : $unsigned(reg69)))));
endmodule

module module28
#(parameter param66 = (|(~((((8'hae) == (8'hb8)) ? ((8'hb3) <<< (7'h41)) : (+(8'hb0))) ~^ (!((7'h44) < (8'haf)))))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire33;
  input wire [(2'h3):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire57,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire34 = (($signed($unsigned(wire30[(3'h5):(2'h3)])) - (((wire32 != wire30) ^~ {wire31,
                              wire29}) ?
                          $unsigned((wire29 ?
                              wire31 : wire31)) : ($unsigned(wire32) ?
                              wire29 : (wire31 ? wire31 : wire32)))) ?
                      {wire29} : ({({wire31, wire31} > wire32[(1'h0):(1'h0)])} ?
                          $signed({(wire31 || (8'ha6))}) : ($signed($unsigned((8'ha2))) ?
                              ($signed((8'h9d)) ?
                                  (wire33 | wire30) : $signed(wire30)) : wire33[(2'h3):(2'h2)])));
  assign wire35 = wire34[(1'h0):(1'h0)];
  assign wire36 = (~|(($unsigned(wire32[(2'h3):(1'h1)]) >> (8'haf)) > ($unsigned(wire31) ?
                      (wire34 ^~ wire31) : (&{wire30}))));
  assign wire37 = (~^wire34);
  assign wire38 = {wire31,
                      {(^{(wire30 ? wire29 : wire31), (wire29 == wire33)}),
                          $signed(wire35)}};
  assign wire39 = wire33;
  assign wire40 = (wire32 ? wire34[(1'h0):(1'h0)] : $unsigned(wire32));
  assign wire41 = (-wire36[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      reg42 <= wire39;
      reg43 <= $signed((({(+(8'hae)), $signed(reg42)} ?
          wire37 : $unsigned(wire34[(2'h3):(1'h0)])) << wire33));
    end
  assign wire44 = ($signed(wire34[(2'h3):(1'h0)]) ~^ wire39);
  assign wire45 = (reg42[(2'h3):(2'h3)] * wire34);
  assign wire46 = $unsigned(((|wire37) >>> {$unsigned({(8'hb3)}),
                      $signed((wire38 ? wire39 : wire39))}));
  assign wire47 = {{(~((wire35 <<< wire30) ? $signed(wire36) : (+wire41)))},
                      wire29};
  always
    @(posedge clk) begin
      reg48 <= {{(8'hbc)}, wire45};
      reg49 <= $signed((8'hae));
      reg50 <= $unsigned($signed(($signed(wire46[(3'h4):(1'h0)]) ?
          $unsigned($unsigned(wire30)) : $signed(wire32))));
      if (wire30[(3'h4):(1'h0)])
        begin
          reg51 <= wire46[(3'h6):(2'h3)];
          reg52 <= (wire45 >> reg42[(4'h8):(3'h6)]);
          reg53 <= ($unsigned({($unsigned(wire45) >>> (wire47 < wire33))}) ^~ $signed(({(wire33 ?
                      wire45 : wire38),
                  (~&(7'h41))} ?
              ((wire47 || reg51) ~^ $signed(wire34)) : ({(8'h9f), (8'ha4)} ?
                  $unsigned(wire46) : (wire30 >= wire38)))));
          reg54 <= $signed((~$signed($unsigned((~&wire38)))));
        end
      else
        begin
          if ((wire34 ? wire39 : {wire34, $signed(wire29[(2'h3):(1'h0)])}))
            begin
              reg51 <= wire33[(1'h1):(1'h0)];
              reg52 <= $unsigned((((~^(wire31 ^ wire41)) ?
                  $unsigned((wire39 ?
                      (8'ha3) : reg52)) : (wire46 < wire37)) ~^ $unsigned($signed((|wire37)))));
            end
          else
            begin
              reg51 <= $signed(wire46[(4'h9):(4'h9)]);
            end
          reg53 <= $signed(wire32[(2'h2):(1'h0)]);
          reg54 <= wire29;
          reg55 <= {reg52};
        end
      reg56 <= ($signed((8'ha6)) ?
          $signed(wire38) : (wire44 ? wire31[(1'h1):(1'h1)] : (^~(8'hb7))));
    end
  assign wire57 = wire36[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned((|wire44)))
        begin
          reg58 <= reg56;
          reg59 <= (wire39 || (!$unsigned(reg55)));
        end
      else
        begin
          reg58 <= (wire30[(1'h0):(1'h0)] & {$unsigned({(reg49 && reg54)})});
          reg59 <= $signed(reg58);
        end
      reg60 <= ((^$unsigned((wire57 * (7'h42)))) & $unsigned(((reg52[(4'ha):(4'ha)] ?
          $unsigned(wire40) : (wire36 > wire46)) > {((8'haa) >= wire46)})));
      reg61 <= ($signed(wire30) ?
          ($signed((^~$signed(reg60))) ?
              {(+{wire45}),
                  ((~reg53) << $unsigned(wire36))} : $signed(wire38[(3'h7):(3'h5)])) : reg55[(1'h1):(1'h1)]);
      reg62 <= $unsigned($signed(($unsigned((reg60 ? wire57 : wire40)) ?
          (8'hae) : ($unsigned(reg48) ? (+wire38) : $unsigned((8'ha2))))));
      reg63 <= reg60[(3'h4):(1'h1)];
    end
  assign wire64 = (7'h42);
  assign wire65 = $unsigned(reg61[(4'hb):(4'ha)]);
endmodule

module module133
#(parameter param162 = (!(((^{(8'had), (8'hb7)}) ? (^~((8'ha2) ? (8'hbc) : (8'haa))) : (((8'ha9) ? (8'hbd) : (8'h9e)) ? (&(8'h9e)) : (~(8'hb2)))) >>> (^~{(^(8'had)), ((8'hb2) >> (7'h44))}))), 
parameter param163 = param162)
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire138;
  input wire [(5'h15):(1'h0)] wire137;
  input wire signed [(4'h9):(1'h0)] wire136;
  input wire [(4'hb):(1'h0)] wire135;
  input wire signed [(2'h2):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
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
                 (1'h0)};
  assign wire139 = $signed({wire134});
  assign wire140 = wire136;
  assign wire141 = ((($signed((wire134 ? wire139 : (8'h9f))) ?
                               ($unsigned(wire139) ?
                                   $unsigned(wire134) : {wire134}) : $signed((~&(8'ha1)))) ?
                           $unsigned(wire137) : (-(8'hb6))) ?
                       $unsigned(($unsigned((wire138 < wire137)) ?
                           {(+wire140),
                               $unsigned(wire140)} : (~^wire135[(1'h1):(1'h0)]))) : (wire134[(1'h1):(1'h0)] <= ($signed($signed(wire136)) > ((wire137 >= (7'h43)) ^~ (+wire139)))));
  assign wire142 = {(~^$signed(wire141[(1'h1):(1'h0)]))};
  assign wire143 = wire139;
  assign wire144 = (8'h9e);
  assign wire145 = $signed($unsigned((+$signed((wire142 ?
                       wire142 : wire143)))));
  always
    @(posedge clk) begin
      if (wire141[(3'h4):(2'h2)])
        begin
          reg146 <= {{$unsigned($signed($signed(wire136)))}};
          if ($unsigned($unsigned($unsigned({(wire144 | wire144), (8'hac)}))))
            begin
              reg147 <= (-wire138[(3'h4):(1'h0)]);
            end
          else
            begin
              reg147 <= $signed($signed(wire141));
              reg148 <= (({(|$unsigned(wire138))} != reg147[(2'h2):(1'h1)]) ?
                  wire141[(1'h1):(1'h0)] : (wire142 <<< $unsigned((+$signed(wire144)))));
              reg149 <= ({(|((wire136 && reg147) << (wire140 ?
                          wire138 : (8'hab)))),
                      $signed($signed(wire135))} ?
                  ($unsigned((~(wire137 * wire141))) - (~&$unsigned($signed(wire144)))) : (&{((wire135 ?
                          wire142 : wire136) && wire138)}));
              reg150 <= (~^$unsigned((((&wire144) ?
                      wire136[(4'h9):(1'h1)] : (reg146 ? wire145 : reg149)) ?
                  wire144 : wire139[(3'h5):(1'h0)])));
              reg151 <= $unsigned({((+reg146) ~^ wire144), wire142});
            end
          reg152 <= $unsigned(wire143[(4'ha):(2'h3)]);
          reg153 <= $signed($signed(((^wire139) ?
              $signed((wire144 == wire143)) : reg148)));
          reg154 <= $unsigned((+{(((8'hbe) || (8'hac)) > wire142[(5'h11):(4'he)])}));
        end
      else
        begin
          reg146 <= ((~^$unsigned($unsigned((-wire134)))) ?
              $signed({(8'h9f)}) : reg154);
          reg147 <= (($unsigned(reg148[(4'h8):(2'h3)]) != (|$signed(wire139[(3'h5):(1'h1)]))) ?
              (&wire134[(1'h0):(1'h0)]) : (^$signed(((~&reg153) ?
                  wire137[(3'h5):(2'h3)] : (reg152 ? wire139 : (8'hb8))))));
          reg148 <= wire137[(5'h14):(1'h0)];
          reg149 <= reg147;
        end
      reg155 <= (&$unsigned(wire145));
      reg156 <= wire142;
      reg157 <= wire141[(1'h0):(1'h0)];
      reg158 <= ((wire137 ? (8'ha7) : wire145) ?
          (~&{($signed(wire145) && $unsigned(reg151))}) : $unsigned(wire145[(3'h6):(3'h5)]));
    end
  assign wire159 = (^~({$signed((wire136 * reg155)), $signed(reg158)} ?
                       wire139[(3'h6):(1'h0)] : ($signed($unsigned((8'hbb))) | {reg158,
                           (~|reg151)})));
  assign wire160 = $unsigned({$signed(wire145)});
  assign wire161 = (reg150 ? reg150 : $unsigned(wire138[(1'h1):(1'h1)]));
endmodule

module module113
#(parameter param129 = ((({((8'hbc) ? (8'hb4) : (8'hbd))} ~^ (~^(~(7'h42)))) >= (!{((8'hba) ? (8'hb5) : (8'hb6)), ((8'hb5) ? (8'hae) : (7'h43))})) ? (~|{{{(8'ha2), (8'ha4)}, (~|(8'hb0))}, (~&((8'hb7) & (8'h9d)))}) : ((^{(~^(8'hbd)), ((8'ha5) <= (8'hb1))}) < ({{(8'hba), (8'hbf)}} & ((|(8'ha4)) ? (+(8'ha9)) : ((7'h44) ? (8'hb9) : (8'hb3)))))), 
parameter param130 = param129)
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire118;
  input wire [(3'h4):(1'h0)] wire117;
  input wire signed [(4'hb):(1'h0)] wire116;
  input wire signed [(4'hf):(1'h0)] wire115;
  input wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire119;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 (1'h0)};
  assign wire119 = wire118;
  assign wire120 = $unsigned($unsigned(wire116));
  assign wire121 = $unsigned($unsigned(wire114));
  assign wire122 = wire119;
  assign wire123 = $signed(wire114[(1'h0):(1'h0)]);
  assign wire124 = $signed($unsigned($unsigned(({wire116,
                       wire122} != wire123[(3'h6):(3'h5)]))));
  assign wire125 = wire122[(4'h9):(3'h7)];
  assign wire126 = wire114;
  assign wire127 = $signed({wire123});
  assign wire128 = (wire120[(3'h7):(1'h1)] > {(^~(^$unsigned(wire114)))});
endmodule
