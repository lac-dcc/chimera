module top
#(parameter param211 = (8'ha4), 
parameter param212 = param211)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire210;
  wire [(5'h10):(1'h0)] wire208;
  wire signed [(4'hc):(1'h0)] wire141;
  wire [(3'h7):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire129;
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire210,
                 wire208,
                 wire141,
                 wire140,
                 wire129,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire0[(2'h3):(1'h0)]))
        begin
          reg4 <= (^wire0);
          reg5 <= ($unsigned(({reg4} ?
                  $unsigned($signed(reg4)) : $signed($signed(wire1)))) ?
              $unsigned($signed(wire3[(4'hf):(4'hc)])) : {wire3[(4'ha):(2'h2)],
                  $unsigned((reg4 ? (wire1 ? (8'had) : (8'h9c)) : reg4))});
        end
      else
        begin
          reg4 <= ($signed({({wire0} ? reg5 : (wire2 ^~ (8'h9c))),
              wire3}) - wire0);
          if (wire1)
            begin
              reg5 <= (wire3 ?
                  ((~&{$signed(wire0),
                      reg4[(3'h6):(3'h4)]}) * ($signed((~|reg5)) ~^ ((^(8'hab)) ?
                      (reg4 ? wire1 : wire1) : (~&wire1)))) : wire3);
            end
          else
            begin
              reg5 <= (~($unsigned(reg5) ?
                  (~{{reg4}}) : (wire2 <<< $signed($signed(wire2)))));
              reg6 <= {$signed(wire1), wire0};
              reg7 <= wire2;
              reg8 <= ({$unsigned(reg6),
                      (wire2[(4'hb):(3'h6)] ?
                          wire3 : $unsigned(reg5[(1'h0):(1'h0)]))} ?
                  reg5[(2'h3):(1'h0)] : reg5[(1'h1):(1'h0)]);
            end
        end
      reg9 <= reg7;
      reg10 <= (~$signed(($signed($unsigned(reg4)) != reg6[(3'h6):(3'h5)])));
      if ((^~reg5))
        begin
          reg11 <= wire0;
          reg12 <= $unsigned($signed(($signed((!(8'hbd))) | $unsigned({reg9}))));
          if ((($signed($signed(reg7[(1'h0):(1'h0)])) + $signed(({reg6, wire0} ?
              (reg8 <= reg6) : (^~wire0)))) << $unsigned(($signed(wire1[(4'he):(3'h4)]) ?
              $signed((wire0 & wire1)) : $unsigned(reg7[(3'h6):(2'h2)])))))
            begin
              reg13 <= {{(wire3[(5'h14):(5'h14)] ?
                          (+(wire2 ? wire0 : reg6)) : reg10[(3'h6):(3'h4)])},
                  ((!reg10) ^ $signed($unsigned(reg6)))};
            end
          else
            begin
              reg13 <= $signed($unsigned({({wire2, wire2} <= $signed(reg5))}));
            end
          reg14 <= (((7'h42) > $signed({(-reg13),
              (reg8 ~^ reg7)})) <= (($unsigned({wire0}) ?
              $signed({reg9}) : {$unsigned(reg4),
                  wire2[(4'h8):(1'h0)]}) ^~ ((reg4 & reg13[(3'h5):(3'h5)]) ?
              $unsigned((+wire0)) : ({reg11} ? reg8 : reg13[(3'h7):(2'h3)]))));
          reg15 <= ((~|wire1[(4'hf):(4'hd)]) ? $signed(reg5) : reg6);
        end
      else
        begin
          reg11 <= (($unsigned(reg10) - ($signed((!reg15)) ?
                  reg5[(1'h1):(1'h1)] : reg15)) ?
              reg7 : reg8);
          if (({$unsigned($signed(reg7[(3'h6):(1'h0)]))} ?
              (^~(reg13 ?
                  ((+reg4) ?
                      $unsigned((8'hb9)) : $signed(reg8)) : (^~$signed((8'ha3))))) : reg4))
            begin
              reg12 <= $unsigned(reg6[(2'h2):(1'h0)]);
              reg13 <= $signed(wire1[(3'h4):(2'h2)]);
              reg14 <= (reg5 ? (^$unsigned($signed(reg5))) : (|wire2));
              reg15 <= $signed((~|reg7));
              reg16 <= (($unsigned(($unsigned(wire2) || wire0[(3'h6):(3'h4)])) << {(+reg14[(1'h0):(1'h0)]),
                      $signed(wire2)}) ?
                  $unsigned($signed(($signed(reg6) <<< reg8[(1'h0):(1'h0)]))) : (|$signed($unsigned($unsigned(wire2)))));
            end
          else
            begin
              reg12 <= ((($signed(reg16[(2'h2):(2'h2)]) && ((wire3 << reg5) >>> {reg15})) ?
                  $signed(((^reg11) ?
                      reg6[(2'h2):(2'h2)] : $unsigned(reg4))) : (-reg10[(4'hf):(4'he)])) && $signed(($signed($unsigned(reg12)) ?
                  $signed((reg4 ? reg9 : reg15)) : ((reg15 ^ reg10) ?
                      ((8'ha8) >> reg5) : $unsigned(reg14)))));
              reg13 <= (-$unsigned(reg15));
              reg14 <= ($signed((wire2 ?
                  reg15 : (~(reg11 ? reg8 : reg12)))) + $unsigned(reg15));
              reg15 <= $unsigned(((~&$signed((reg4 * reg6))) ?
                  reg10[(5'h11):(3'h7)] : reg12[(3'h4):(1'h1)]));
            end
          reg17 <= (wire0[(4'h9):(2'h3)] ?
              $signed(wire3[(4'h9):(4'h9)]) : reg8);
          reg18 <= (|wire2[(1'h0):(1'h0)]);
          reg19 <= wire0[(3'h4):(1'h0)];
        end
    end
  module20 #() modinst130 (wire129, clk, reg5, reg7, wire2, reg11, reg16);
  always
    @(posedge clk) begin
      reg131 <= {(reg8[(3'h4):(1'h1)] ?
              (~^($signed((8'hae)) <= $signed((7'h41)))) : (($signed((8'haf)) & $signed(reg5)) ?
                  (8'hab) : reg9[(4'hd):(4'hb)])),
          $signed($unsigned(reg15[(2'h2):(2'h2)]))};
      reg132 <= ((wire2 ?
          $signed((^~$unsigned(reg8))) : $signed((~&wire129))) | (~|(wire129[(1'h1):(1'h0)] | $unsigned(reg14[(2'h3):(2'h3)]))));
      if (($unsigned($signed(wire2[(4'hf):(4'hb)])) <= ({$unsigned($unsigned(reg12))} << ($unsigned((reg7 * reg18)) ?
          ((reg12 <= reg9) ~^ $signed(reg11)) : reg132))))
        begin
          reg133 <= ((-reg131[(2'h3):(1'h0)]) <= (~$unsigned($signed(reg16))));
          if ($unsigned((-$unsigned((+$unsigned(reg14))))))
            begin
              reg134 <= $unsigned(((~&reg19[(3'h5):(3'h4)]) ?
                  $signed(wire1) : (((wire2 + reg11) & $signed(reg131)) & $signed((^~reg12)))));
              reg135 <= reg13[(3'h7):(1'h0)];
              reg136 <= reg134[(3'h5):(2'h2)];
              reg137 <= $signed((((~&$unsigned(reg6)) ?
                      ($signed(reg7) >= (reg13 * reg9)) : wire2[(5'h10):(2'h3)]) ?
                  reg7 : $signed(({(7'h42)} || $unsigned(reg18)))));
              reg138 <= {reg137};
            end
          else
            begin
              reg134 <= (8'h9e);
            end
          reg139 <= (&($signed($unsigned(reg7[(5'h10):(5'h10)])) << $signed(reg19[(3'h5):(2'h2)])));
        end
      else
        begin
          reg133 <= (wire2[(4'hd):(3'h6)] ^ $signed({reg131}));
          reg134 <= ((|reg133) ? reg134 : $unsigned(reg12));
          reg135 <= {($unsigned(reg6[(4'h8):(3'h6)]) ?
                  (reg17 > reg19[(1'h0):(1'h0)]) : $unsigned((!$signed(wire2))))};
        end
    end
  assign wire140 = reg12[(3'h6):(1'h1)];
  assign wire141 = wire1[(3'h7):(2'h3)];
  module142 #() modinst209 (.clk(clk), .wire144(reg139), .y(wire208), .wire146(reg134), .wire143(reg16), .wire145(reg19));
  assign wire210 = wire2;
endmodule

module module142
#(parameter param206 = (+({(((8'hb8) ^ (8'ha8)) < (^~(8'haa))), ((&(7'h42)) >= {(8'ha2)})} ? (((^(8'ha6)) ? ((8'hae) && (7'h41)) : ((8'h9f) ? (8'h9d) : (8'hae))) ? ({(8'had)} || (-(8'h9c))) : ((-(8'hb1)) & ((8'hb8) ? (8'hbf) : (8'hb6)))) : (&(+((8'ha0) < (8'ha9)))))), 
parameter param207 = (~&{{((+param206) ? (^param206) : (^~param206))}, ({(8'hb8)} & ({param206} >= (param206 ? param206 : param206)))}))
(y, clk, wire143, wire144, wire145, wire146);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire143;
  input wire [(4'hb):(1'h0)] wire144;
  input wire [(4'hb):(1'h0)] wire145;
  input wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire183;
  wire [(5'h14):(1'h0)] wire182;
  wire [(3'h4):(1'h0)] wire181;
  wire [(3'h5):(1'h0)] wire180;
  wire signed [(3'h5):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire176;
  wire [(4'hb):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire174;
  reg signed [(2'h2):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg203 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(4'ha):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg [(3'h6):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(5'h11):(1'h0)] reg191 = (1'h0);
  reg [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(4'he):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire147,
                 wire148,
                 wire174,
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
                 (1'h0)};
  assign wire147 = wire146;
  assign wire148 = wire147[(3'h7):(2'h3)];
  module149 #() modinst175 (.wire152(wire144), .wire150(wire143), .wire154(wire146), .wire153(wire148), .wire151(wire145), .y(wire174), .clk(clk));
  assign wire176 = wire144;
  assign wire177 = ($signed($unsigned((wire147 & (wire146 >>> (8'hae))))) ?
                       ((~^($unsigned(wire143) ?
                               {(8'ha7)} : $signed(wire176))) ?
                           $signed($signed((wire143 ?
                               wire145 : wire143))) : $signed(((wire143 ?
                                   wire176 : wire176) ?
                               {wire143} : $unsigned(wire147)))) : wire176[(4'he):(4'h8)]);
  assign wire178 = $signed($unsigned(($unsigned(wire176[(1'h0):(1'h0)]) * ((wire143 ~^ wire176) ?
                       ((7'h41) - wire148) : wire177[(3'h7):(2'h3)]))));
  assign wire179 = $signed(wire146[(3'h4):(3'h4)]);
  assign wire180 = {$signed((-($signed(wire143) < (wire178 >>> wire179)))),
                       {(~|($unsigned(wire148) ?
                               (wire148 ?
                                   wire176 : wire147) : $unsigned(wire179)))}};
  assign wire181 = (($signed($unsigned({wire179})) >>> $signed($signed({wire144,
                       wire147}))) + {wire174,
                       ({(&wire177)} ?
                           wire144[(4'h8):(3'h6)] : ((wire148 ?
                               wire174 : (8'hb6)) - wire146[(3'h5):(1'h0)]))});
  assign wire182 = $unsigned(((((8'hae) ? ((8'h9f) ~^ wire143) : (&wire179)) ?
                       $unsigned(wire144[(1'h1):(1'h0)]) : $signed($unsigned(wire177))) >>> (&((wire146 ~^ wire180) ?
                       (&wire177) : $unsigned(wire178)))));
  assign wire183 = (+(wire144[(3'h4):(1'h1)] * (wire179 ?
                       {wire177[(1'h1):(1'h1)], $signed((8'had))} : {wire176,
                           $signed(wire179)})));
  always
    @(posedge clk) begin
      reg184 <= {$signed(wire145)};
      reg185 <= {wire179[(1'h0):(1'h0)]};
    end
  always
    @(posedge clk) begin
      if (($signed($signed(({wire145,
          wire147} | wire146))) >= $unsigned(wire144)))
        begin
          reg186 <= (!{$signed((wire177 ? $unsigned(wire180) : wire146))});
          if ((|(((wire177[(3'h4):(2'h3)] ?
                      ((8'hb0) == reg186) : $signed((7'h43))) ?
                  (&reg186) : $unsigned(wire180)) ?
              wire183 : (({(8'ha5)} & wire146) & ((~^wire144) >> wire178[(3'h5):(2'h2)])))))
            begin
              reg187 <= (({($unsigned(reg184) ?
                              $unsigned(wire147) : (^(8'hb7)))} ?
                      reg186[(3'h6):(3'h5)] : (wire183 ?
                          ((wire145 >> wire143) ~^ wire145) : ((wire180 && (8'ha9)) < ((7'h44) || wire183)))) ?
                  {(wire147[(3'h7):(3'h5)] >> ((!wire143) <= (|wire181))),
                      ($signed((wire148 == (8'hb0))) == {$signed((7'h43))})} : wire179[(1'h1):(1'h1)]);
              reg188 <= wire174;
              reg189 <= wire183[(2'h3):(1'h1)];
              reg190 <= (8'ha5);
            end
          else
            begin
              reg187 <= $signed(($signed(((wire176 ^ (8'ha9)) >= (wire177 ?
                      wire182 : wire174))) ?
                  (~^(^(reg189 | wire143))) : (-(~&wire180[(1'h1):(1'h1)]))));
              reg188 <= (({{$signed(wire144), (wire181 ? wire179 : reg184)}} ?
                      reg189[(4'hb):(3'h4)] : ((~|{wire177}) ^~ $signed((wire144 && wire145)))) ?
                  $signed(wire146[(3'h5):(3'h5)]) : $signed(wire145[(4'h8):(4'h8)]));
              reg189 <= $signed(wire180);
              reg190 <= $unsigned($signed(($unsigned((~^(8'h9e))) || (wire180 < (wire183 >>> wire177)))));
              reg191 <= {{(($signed(wire182) ?
                          $unsigned((8'ha0)) : $unsigned(wire181)) ^ wire180[(3'h4):(1'h0)])},
                  (~|(^$unsigned($unsigned(reg184))))};
            end
          reg192 <= (~|wire174[(2'h2):(1'h0)]);
          reg193 <= ((reg189 ?
                  $signed($unsigned((reg189 ?
                      wire146 : wire177))) : wire148[(4'he):(2'h3)]) ?
              $unsigned(wire147) : ({(|(+wire144)),
                      ($unsigned(wire181) >>> (reg189 > (8'h9d)))} ?
                  {(reg184[(2'h3):(1'h0)] ?
                          $signed(wire147) : $unsigned(reg190))} : {reg187[(1'h0):(1'h0)],
                      ($signed(wire148) ?
                          ((8'hbc) >> (8'hb3)) : ((8'hb4) || wire181))}));
          if (wire178)
            begin
              reg194 <= (-reg188[(3'h6):(3'h6)]);
              reg195 <= (!(!wire147));
              reg196 <= wire182[(5'h11):(4'hc)];
              reg197 <= (&$signed(reg186[(3'h5):(1'h1)]));
              reg198 <= {($signed((8'ha3)) >> $signed(wire180)), (8'hbc)};
            end
          else
            begin
              reg194 <= (~|wire148);
            end
        end
      else
        begin
          reg186 <= (((^(^~(-reg189))) == ((~reg185) ?
                  (wire145[(3'h6):(2'h3)] ?
                      reg189 : reg188) : reg197[(3'h6):(1'h0)])) ?
              ($signed(reg187[(2'h2):(2'h2)]) - reg194) : reg186);
          reg187 <= $signed((reg193[(3'h4):(2'h3)] ?
              $unsigned((reg192 ?
                  $unsigned(reg195) : (reg189 ?
                      reg187 : wire179))) : $unsigned($signed((wire148 != wire145)))));
          reg188 <= (reg193[(1'h1):(1'h0)] ?
              (^~$signed($signed((^~reg185)))) : $signed((~|$unsigned(((7'h41) ?
                  (8'h9f) : reg193)))));
          reg189 <= (reg195 ?
              reg189[(4'h8):(1'h0)] : ({reg196[(1'h1):(1'h0)]} ?
                  (8'hb3) : (((8'hb2) == (!reg190)) << $unsigned((wire148 ~^ (8'had))))));
          reg190 <= ((~&$signed(wire180[(1'h1):(1'h0)])) ?
              $unsigned($signed((&(&reg192)))) : reg188);
        end
      if (($unsigned({$unsigned(wire174[(2'h2):(1'h1)]), reg190}) ^~ wire183))
        begin
          reg199 <= reg185;
          if (reg189)
            begin
              reg200 <= $unsigned((-reg199));
            end
          else
            begin
              reg200 <= $unsigned($unsigned(reg198[(4'h8):(2'h3)]));
              reg201 <= wire174[(2'h3):(2'h3)];
              reg202 <= wire178[(3'h5):(3'h5)];
              reg203 <= reg194;
              reg204 <= (($unsigned({(+wire177),
                      (reg191 | reg184)}) <<< reg189[(4'h9):(3'h5)]) ?
                  {(reg199[(2'h3):(2'h3)] <<< reg186[(1'h0):(1'h0)]),
                      $signed((|reg202))} : reg190[(3'h5):(1'h0)]);
            end
        end
      else
        begin
          reg199 <= ((wire178[(3'h7):(3'h5)] >= $signed(wire176[(4'hd):(2'h3)])) | ((~^((reg185 ?
                      wire176 : (7'h43)) ?
                  (reg197 >> reg184) : (reg201 ^ wire176))) ?
              wire145 : wire144));
          if (reg199)
            begin
              reg200 <= wire144[(4'ha):(4'h9)];
              reg201 <= (~|(~&(&((^~reg203) ^ $unsigned(wire177)))));
              reg202 <= wire176[(1'h0):(1'h0)];
              reg203 <= {$unsigned(((8'ha7) == (7'h41)))};
            end
          else
            begin
              reg200 <= (|((($unsigned(reg195) <<< (wire143 ?
                  reg190 : (8'ha5))) == wire179[(3'h5):(2'h3)]) ^~ (~$signed((+wire145)))));
            end
          if ((^~reg195[(3'h6):(2'h2)]))
            begin
              reg204 <= wire145[(4'ha):(3'h6)];
            end
          else
            begin
              reg204 <= ((($unsigned($signed((8'ha8))) ?
                  {(^(8'h9c))} : ({wire179, wire179} ?
                      $signed(wire183) : reg186[(3'h6):(2'h2)])) < reg185[(1'h1):(1'h0)]) >>> {(^~reg194[(3'h7):(2'h3)]),
                  {($signed(wire183) ? {reg202} : (reg192 >= (8'hbb))),
                      (wire177 ? (wire177 > reg186) : $unsigned(reg193))}});
              reg205 <= ({$signed(reg194)} & wire178);
            end
        end
    end
endmodule

module module20
#(parameter param127 = (((8'hb5) ? (8'had) : ((8'hb0) ^~ (((8'h9f) ? (8'h9f) : (8'ha4)) - {(8'hbf)}))) << ((~^((~|(8'had)) ? (~(8'hb7)) : (!(8'hab)))) ? ({{(8'hb0), (7'h43)}} <<< (8'hbb)) : ({((8'hae) && (8'hb2))} ? (&((8'hb7) ? (8'hae) : (8'ha3))) : (~&((7'h43) ? (8'hb9) : (8'hbf)))))), 
parameter param128 = ((~&param127) ? ((~|{(7'h41), param127}) ? {{(param127 >>> param127)}} : (param127 ? param127 : ((param127 >> param127) != (param127 ~^ param127)))) : ({param127, {param127, (param127 ? param127 : param127)}} ? (!param127) : (param127 ? param127 : ((param127 ? param127 : (8'h9c)) ? ((8'hb5) >= (8'hbd)) : ((8'ha2) >>> param127))))))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire123;
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire26,
                 wire27,
                 wire32,
                 wire33,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire78,
                 wire80,
                 wire81,
                 wire123,
                 reg84,
                 reg83,
                 reg82,
                 reg36,
                 reg35,
                 reg34,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire26 = (wire21 != ({((wire23 ? wire23 : (8'ha0)) ?
                          (wire23 >> wire24) : $signed(wire23)),
                      $signed(wire21)} * (((!wire23) ?
                      wire21 : (wire24 << (8'hba))) && wire21[(2'h2):(2'h2)])));
  assign wire27 = $signed(((wire23[(4'h8):(2'h3)] <= ((wire22 ?
                          wire25 : wire26) ?
                      $signed(wire25) : $signed(wire26))) ^ (({wire21} ^~ (!wire22)) * $signed(wire22))));
  always
    @(posedge clk) begin
      reg28 <= wire22;
      reg29 <= ($unsigned({$signed($signed(wire26)),
          wire26}) && wire27[(3'h7):(1'h1)]);
      reg30 <= ($signed(((((8'ha0) && wire25) ? $unsigned(wire25) : wire27) ?
          ($signed(reg28) ?
              {wire21, wire22} : (wire21 < wire22)) : ($signed(wire23) ?
              (!wire21) : $unsigned(wire26)))) ^~ (!reg29[(3'h4):(1'h0)]));
      reg31 <= wire26[(3'h6):(3'h4)];
    end
  assign wire32 = wire25;
  assign wire33 = wire24;
  always
    @(posedge clk) begin
      reg34 <= (^(wire24[(4'h9):(3'h5)] > (reg28[(4'hb):(3'h6)] ?
          $signed(wire26) : ($signed(reg30) ?
              (wire26 ? (8'hb3) : reg29) : reg31[(1'h1):(1'h0)]))));
      reg35 <= (8'hb3);
      reg36 <= $unsigned(($unsigned(($signed(wire22) & wire22[(2'h3):(1'h1)])) ?
          (^~wire27[(3'h4):(3'h4)]) : reg35[(3'h6):(1'h0)]));
    end
  assign wire37 = $unsigned($signed((reg36[(1'h1):(1'h0)] ?
                      {(reg34 ? wire24 : wire27),
                          $signed(wire21)} : $unsigned($unsigned(wire25)))));
  assign wire38 = wire22[(1'h1):(1'h0)];
  assign wire39 = $signed({$unsigned((^~$signed(reg36)))});
  assign wire40 = (wire32[(1'h1):(1'h0)] == ((^~(wire24[(3'h7):(3'h5)] ?
                      $signed(wire26) : $signed(wire32))) <<< $signed(reg34)));
  assign wire41 = (~^{{$unsigned(wire21[(1'h0):(1'h0)]), reg36}});
  module42 #() modinst79 (.y(wire78), .wire44(wire37), .wire43(wire25), .clk(clk), .wire46(wire32), .wire45(wire21));
  assign wire80 = (wire23 ?
                      ((8'hb9) ?
                          ((~&$unsigned((8'ha1))) * wire33) : $unsigned((&wire39))) : $signed(((wire39[(2'h3):(1'h1)] ?
                          ((8'hb2) <= (8'hac)) : (8'hb3)) & wire41[(1'h1):(1'h1)])));
  assign wire81 = (^$signed(wire23));
  always
    @(posedge clk) begin
      reg82 <= ($unsigned((^~$signed({wire78, wire80}))) ?
          $unsigned($signed(wire80)) : $unsigned($unsigned((+(reg31 <<< reg35)))));
      reg83 <= (~&(wire37[(4'he):(4'hb)] ?
          (&reg82) : {wire78[(1'h0):(1'h0)], $signed($signed(reg31))}));
      reg84 <= $signed(($signed(($signed(reg36) || ((8'h9c) ?
              (8'ha5) : wire80))) ?
          reg82 : ((^$signed((8'hac))) * {(7'h42), (+reg83)})));
    end
  module85 #() modinst124 (wire123, clk, wire80, wire26, reg84, reg35, wire40);
  assign wire125 = $unsigned(wire24[(4'hb):(2'h2)]);
  assign wire126 = wire39[(2'h2):(1'h0)];
endmodule

module module85
#(parameter param122 = {(((!(&(8'hbb))) ? (-((8'ha0) ? (7'h44) : (8'hae))) : (^(^~(8'ha8)))) ? (8'ha3) : (((8'haa) ? (~|(8'hbb)) : ((8'hb5) ? (8'hb6) : (7'h44))) ? {((8'hb5) ? (8'h9d) : (8'h9d)), (+(8'ha0))} : ({(8'hbd), (8'hbd)} ? ((8'hb5) | (7'h42)) : {(8'hb3), (8'ha4)})))})
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(4'he):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire112;
  wire signed [(4'hb):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 (1'h0)};
  assign wire91 = $unsigned(wire90[(3'h6):(3'h4)]);
  assign wire92 = wire90[(2'h3):(2'h3)];
  assign wire93 = {$signed(((&{wire87}) ?
                          {wire88[(3'h7):(3'h7)],
                              wire88} : ($signed(wire89) >>> (wire90 ?
                              wire89 : wire86)))),
                      $unsigned(wire91[(3'h4):(2'h3)])};
  assign wire94 = wire91;
  assign wire95 = ($unsigned((((wire91 & wire92) ?
                              (wire94 ? wire91 : wire92) : $signed(wire91)) ?
                          ({wire90} ?
                              $signed(wire92) : (wire91 >> wire91)) : ($signed(wire88) ?
                              {wire92} : (~|wire94)))) ?
                      (^(((wire93 ?
                          wire89 : wire93) && wire90) <= wire93[(4'ha):(4'ha)])) : {($signed($signed(wire86)) ?
                              (~&$signed(wire92)) : $unsigned((&wire88))),
                          $signed((wire93[(4'hd):(4'hb)] ?
                              $signed(wire89) : (^~wire89)))});
  assign wire96 = $signed((~^((+(wire92 + (7'h44))) && (wire88[(3'h4):(2'h3)] ?
                      ((8'haf) ? wire87 : wire87) : $signed(wire87)))));
  assign wire97 = ((~&wire95) && ((((8'ha6) ?
                      {wire93,
                          wire87} : wire86[(3'h4):(1'h0)]) * $unsigned($signed(wire91))) ^ wire89[(2'h3):(2'h2)]));
  assign wire98 = (8'ha4);
  always
    @(posedge clk) begin
      reg99 <= (^~(8'ha5));
      reg100 <= $unsigned($signed(wire90));
      if (wire95[(5'h13):(4'ha)])
        begin
          reg101 <= (~&$unsigned((&($unsigned(wire87) ?
              (wire96 >= wire95) : ((8'ha7) || wire92)))));
          reg102 <= ($unsigned(($unsigned(wire97[(1'h1):(1'h0)]) + $signed(wire96))) ?
              {(wire89[(1'h0):(1'h0)] ?
                      $unsigned(wire98) : wire97)} : (^$unsigned($signed($signed((7'h42))))));
        end
      else
        begin
          reg101 <= $unsigned(($signed((!reg101[(4'h8):(3'h5)])) ?
              $signed(((~|wire91) >= $unsigned(wire88))) : $signed(reg102[(1'h0):(1'h0)])));
          if ($unsigned(wire97))
            begin
              reg102 <= (&$signed($signed(reg99[(3'h5):(2'h2)])));
              reg103 <= ((($signed((^wire95)) <<< $signed(wire86[(4'hb):(4'ha)])) ?
                  (((8'hac) <<< (~wire95)) & ({wire88,
                      wire94} & wire98)) : (|$unsigned((reg100 ?
                      wire96 : wire94)))) >> (reg100 ?
                  ($signed({(8'had)}) ?
                      $unsigned(reg102) : $unsigned($signed(wire89))) : $signed((((8'ha7) ?
                      wire94 : reg100) + $signed(wire96)))));
              reg104 <= $unsigned((8'ha8));
            end
          else
            begin
              reg102 <= (reg103[(3'h7):(1'h0)] ~^ (+$unsigned($unsigned(wire91))));
              reg103 <= wire86[(4'hc):(3'h6)];
              reg104 <= $signed(($signed(($unsigned((7'h41)) == wire98[(3'h6):(3'h5)])) & reg100));
              reg105 <= ((~$unsigned(((+wire93) | ((8'hb0) ?
                      wire97 : reg103)))) ?
                  (^$signed($unsigned(reg102))) : {({$signed(reg100)} <<< {wire89[(1'h1):(1'h0)],
                          (wire89 ? reg99 : reg104)}),
                      wire86});
              reg106 <= {wire91,
                  (($signed((&reg103)) ?
                          $unsigned({wire98, wire94}) : {(~(8'ha3)),
                              $unsigned(wire88)}) ?
                      (reg100 * wire94) : reg100[(1'h1):(1'h1)])};
            end
        end
      reg107 <= (($unsigned(((wire91 ? (8'hb2) : wire95) ?
          $signed(wire92) : {wire92})) > ((wire89 ?
              (wire88 ? wire91 : wire94) : (wire86 ^ wire87)) ?
          wire90[(3'h6):(2'h2)] : wire96[(1'h1):(1'h0)])) >= ($signed((+(-wire87))) << ($unsigned((wire88 ?
          reg102 : reg101)) ~^ ($unsigned(reg104) * $signed(reg103)))));
      reg108 <= wire94;
    end
  assign wire109 = ((~wire90) * ($signed((-$unsigned(wire93))) + (|($unsigned(wire87) | (~|wire91)))));
  assign wire110 = {((^~$unsigned((~|wire90))) ?
                           ({$signed(wire89)} << $unsigned(((8'ha5) << (8'hae)))) : $signed(($unsigned(wire92) >> (~^wire94)))),
                       (reg100[(2'h2):(1'h0)] && $signed(wire87))};
  assign wire111 = $unsigned((^$unsigned(wire109)));
  assign wire112 = $signed({(~^wire89[(1'h0):(1'h0)]), wire88[(4'h9):(3'h4)]});
  always
    @(posedge clk) begin
      if (wire89)
        begin
          if ((reg108 ?
              wire94 : (((^~$signed(wire112)) ?
                  ($signed(reg102) && reg104[(3'h6):(3'h6)]) : wire88) >>> wire94[(4'hb):(4'h9)])))
            begin
              reg113 <= $unsigned($signed(((~reg108[(1'h1):(1'h1)]) ?
                  reg102[(3'h6):(1'h0)] : ((wire86 ? wire111 : wire96) ?
                      $signed((8'ha3)) : reg107))));
              reg114 <= ($unsigned($signed({{wire90},
                  (~&(8'hb9))})) * wire97[(3'h4):(2'h2)]);
              reg115 <= {wire111, $unsigned($signed(reg101[(4'ha):(3'h7)]))};
            end
          else
            begin
              reg113 <= (((~|(wire91[(1'h0):(1'h0)] ?
                  $unsigned(reg104) : $signed(reg102))) & ($unsigned($signed(wire96)) ?
                  (!(reg107 <= (8'hba))) : (!wire98))) * reg99[(3'h7):(2'h2)]);
              reg114 <= {reg115[(3'h4):(2'h3)],
                  (($unsigned($signed(reg114)) ?
                          $unsigned($signed(reg101)) : (|(wire91 ^ wire109))) ?
                      (8'ha0) : ($signed((wire110 > reg108)) <= reg101[(2'h3):(1'h1)]))};
              reg115 <= ((|$signed($unsigned($unsigned(wire87)))) ?
                  (reg115[(1'h1):(1'h1)] - ($unsigned($signed(wire111)) ?
                      (~&(!reg104)) : reg101)) : {(reg99[(2'h2):(1'h0)] ?
                          wire92[(3'h5):(1'h0)] : $signed((reg108 ?
                              wire87 : wire110))),
                      $signed((&$unsigned(reg115)))});
              reg116 <= (+($unsigned(wire91) ?
                  $signed($unsigned((wire89 ^ reg101))) : {(!(-wire97))}));
            end
          reg117 <= ($signed(wire86[(4'he):(3'h5)]) ?
              ({(|$unsigned(wire98)), $unsigned(reg113[(4'h8):(1'h1)])} ?
                  (($signed(reg105) && (+(8'haa))) ?
                      (-wire90[(4'h8):(4'h8)]) : wire96) : wire112) : ({$unsigned($signed(wire89))} ?
                  $unsigned(wire89) : ({(wire97 ? reg99 : reg102),
                      wire92[(4'hb):(4'ha)]} <= wire109[(5'h13):(3'h4)])));
          reg118 <= (8'hbc);
          reg119 <= wire87;
          reg120 <= wire89;
        end
      else
        begin
          if ($signed(wire97))
            begin
              reg113 <= {reg119};
            end
          else
            begin
              reg113 <= (^~wire87[(3'h4):(2'h2)]);
              reg114 <= wire112;
              reg115 <= reg105;
              reg116 <= (8'hb7);
              reg117 <= $unsigned($unsigned($unsigned(reg100)));
            end
          if (reg104)
            begin
              reg118 <= (|{reg115[(4'h8):(2'h2)]});
            end
          else
            begin
              reg118 <= ($signed($unsigned($signed((+wire112)))) + ((reg115[(4'ha):(4'h8)] | ((~|reg117) ?
                      (~^reg99) : (~&reg114))) ?
                  reg106[(3'h4):(2'h3)] : wire91));
            end
        end
      reg121 <= wire109[(3'h6):(3'h5)];
    end
endmodule

module module42
#(parameter param76 = ((((&((8'hbe) ? (8'hb7) : (8'hb9))) > (((8'h9e) > (7'h43)) >>> (^(8'hb9)))) != {((!(8'ha8)) ? (!(7'h40)) : (~&(8'hae)))}) ? ((((~^(8'ha9)) ? (!(7'h44)) : (~&(8'hbc))) >= (((8'ha7) >= (8'hb3)) != {(7'h44)})) ? (~&(-((8'ha8) - (7'h44)))) : {((~(8'hb0)) | ((8'haa) ? (8'hac) : (8'hbd))), ({(8'hbc)} == ((8'h9f) && (8'hb5)))}) : ((+(^~((7'h40) ^ (8'hb1)))) ? {((~^(8'hbd)) ^ {(8'hb8)})} : (|(8'hb2)))), 
parameter param77 = (((8'hb8) ? (({param76, param76} || {param76, param76}) ? ((^(8'hbc)) < (param76 && param76)) : ((param76 && param76) ? param76 : (+param76))) : (((param76 ^~ param76) ? (param76 || param76) : param76) > ((param76 != param76) + {param76, param76}))) ^ {((((8'hb3) & param76) >> (param76 || (8'ha1))) ? {(param76 ^ param76)} : param76)}))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire53;
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire66,
                 wire65,
                 wire53,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~wire44[(2'h2):(1'h1)]) ?
          ((wire43 >>> (wire45 < (wire45 ?
              wire43 : wire44))) << wire45) : $signed({(~&(+wire44))})))
        begin
          reg47 <= (wire45[(3'h6):(2'h2)] != $signed($unsigned((wire43[(3'h4):(1'h1)] ?
              $signed(wire44) : (&wire44)))));
          reg48 <= $signed((|$unsigned(((reg47 ? wire46 : reg47) ?
              wire43[(3'h4):(1'h1)] : {wire44}))));
          reg49 <= wire44[(3'h6):(2'h3)];
          reg50 <= $unsigned($signed((|wire44)));
          reg51 <= ((($unsigned((-reg50)) || $unsigned(reg49[(4'he):(4'hb)])) || (wire43[(1'h1):(1'h0)] ?
              ((reg48 + wire43) ?
                  (~^wire43) : reg47[(2'h2):(1'h1)]) : $signed((!reg47)))) ^~ reg50);
        end
      else
        begin
          reg47 <= ($unsigned(((~(~&wire46)) != {reg51})) - ($signed(reg51[(4'ha):(4'ha)]) ?
              ($unsigned($unsigned(reg51)) ?
                  $signed((|(8'h9c))) : reg48[(4'hd):(2'h3)]) : $unsigned(((wire45 >>> wire43) ?
                  $signed(reg51) : reg51))));
          if ((wire43[(1'h1):(1'h0)] >= reg48[(4'h9):(3'h6)]))
            begin
              reg48 <= reg50[(3'h4):(1'h1)];
              reg49 <= ((~|$signed($unsigned(wire43))) ^ $signed({$unsigned(reg50),
                  $unsigned($signed(reg51))}));
            end
          else
            begin
              reg48 <= (+$signed((((reg47 == reg48) ?
                  (~|wire46) : (reg51 ?
                      wire43 : wire45)) ^ (~$signed((8'hb8))))));
            end
          reg50 <= wire44;
        end
      reg52 <= $unsigned((~(^~$signed((~|reg47)))));
    end
  assign wire53 = reg50;
  always
    @(posedge clk) begin
      reg54 <= (~&(reg51[(4'hf):(4'hf)] < reg52));
      reg55 <= $signed(((&{$signed(wire46), $unsigned(reg54)}) ^~ reg50));
      if (wire43)
        begin
          if (wire44[(4'hf):(2'h2)])
            begin
              reg56 <= (wire43[(1'h0):(1'h0)] ?
                  ((reg48 ?
                          $unsigned($unsigned(wire44)) : reg47[(3'h6):(2'h2)]) ?
                      $unsigned(reg49[(1'h0):(1'h0)]) : $signed((wire45 ^~ $unsigned(reg54)))) : ((({reg47,
                              reg55} ?
                          wire46 : (~^reg55)) < (~^(^wire43))) ?
                      $signed(reg47) : $unsigned($signed((wire43 & reg47)))));
              reg57 <= ((reg54[(2'h2):(1'h1)] ?
                  $unsigned(((8'hab) ~^ (reg48 >>> reg54))) : (($signed((8'hb2)) ?
                          $unsigned(reg55) : (reg51 || wire44)) ?
                      ($signed(wire43) ?
                          reg49[(4'hf):(2'h2)] : (reg47 <<< reg51)) : (^(~reg47)))) | (wire46[(2'h2):(2'h2)] ?
                  $signed($signed((reg55 ?
                      reg55 : reg56))) : {(+$signed(reg55)),
                      ((-wire53) ? (wire53 ~^ wire44) : ((8'ha1) + (8'hac)))}));
              reg58 <= (8'hbb);
            end
          else
            begin
              reg56 <= (reg57[(2'h2):(2'h2)] ?
                  $unsigned($unsigned(wire44[(5'h10):(4'hd)])) : wire45);
              reg57 <= ((wire53 ?
                  $unsigned(reg49[(4'h8):(2'h2)]) : ((reg56 ?
                          reg47 : reg58[(1'h1):(1'h0)]) ?
                      wire46 : reg50)) > reg47);
            end
          if ({$signed((wire46[(3'h5):(2'h2)] ^~ {$signed(reg51),
                  (~|wire45)}))})
            begin
              reg59 <= reg47[(1'h1):(1'h0)];
            end
          else
            begin
              reg59 <= reg51;
              reg60 <= $signed(((~&reg48) ?
                  {reg51[(1'h1):(1'h0)], reg59[(4'he):(3'h5)]} : reg56));
              reg61 <= ((8'h9c) << reg52[(1'h0):(1'h0)]);
              reg62 <= (+reg60[(4'hb):(4'ha)]);
              reg63 <= (reg47[(2'h3):(1'h1)] ?
                  (wire43[(1'h1):(1'h1)] ?
                      (~^{(reg50 ?
                              reg54 : reg61)}) : (!$unsigned($signed(reg62)))) : $signed(($signed((~^wire43)) >>> $unsigned(wire45[(2'h2):(1'h0)]))));
            end
        end
      else
        begin
          reg56 <= ($unsigned($signed((+reg58[(1'h1):(1'h1)]))) ?
              ((((reg51 ? (8'hbd) : (8'h9e)) < $signed(wire44)) ?
                      $unsigned((reg58 ?
                          reg60 : (8'hab))) : $unsigned($unsigned(reg60))) ?
                  ((~reg58) ^~ $signed((wire45 ? reg49 : reg58))) : ((((8'hb3) ?
                          reg59 : wire43) ?
                      $unsigned(reg55) : (+reg50)) >> wire46)) : (^~$unsigned($signed($unsigned(reg51)))));
          reg57 <= ((($unsigned($unsigned(wire53)) >= (8'hbd)) ?
                  ($signed((~&wire53)) ?
                      $signed((+reg47)) : (!(wire43 == reg59))) : reg47) ?
              ($unsigned($unsigned({reg49})) <= (({reg48,
                  reg57} << $signed(reg49)) >= (-(+reg58)))) : (~|$unsigned(((reg56 ?
                      reg48 : reg63) ?
                  reg63[(1'h1):(1'h0)] : (reg58 ? reg55 : wire44)))));
          reg58 <= (reg61 >= reg60);
          if ((~^(^~(~&{(|reg55)}))))
            begin
              reg59 <= $signed((reg62[(3'h6):(3'h6)] >>> ((reg56 + (!reg60)) ?
                  reg49 : (-$signed(reg55)))));
              reg60 <= reg49[(4'h9):(3'h7)];
              reg61 <= $unsigned(reg54[(1'h0):(1'h0)]);
              reg62 <= reg49[(4'h9):(3'h5)];
            end
          else
            begin
              reg59 <= reg48[(3'h5):(2'h2)];
              reg60 <= $signed($signed($unsigned($signed((^wire46)))));
              reg61 <= reg62[(3'h6):(2'h3)];
            end
        end
      reg64 <= $unsigned((($signed({(8'ha5)}) << wire53[(1'h1):(1'h0)]) ~^ reg63[(1'h0):(1'h0)]));
    end
  assign wire65 = $unsigned($signed((((~reg59) >> $unsigned(reg51)) < wire46[(3'h5):(1'h0)])));
  assign wire66 = $unsigned((|((reg49[(2'h3):(1'h0)] + $signed(reg52)) ?
                      ({wire46} ?
                          reg51[(4'hc):(2'h3)] : wire53[(1'h0):(1'h0)]) : reg48[(4'hb):(4'h9)])));
  always
    @(posedge clk) begin
      if ((((~|reg51) ?
          $signed(((wire46 ?
              wire45 : (8'hb9)) << (!wire45))) : $signed((~(wire65 <= (8'hba))))) && reg59[(4'ha):(3'h5)]))
        begin
          if ((reg60 ?
              $signed($signed($unsigned(reg59))) : ((wire45 + (wire44 >= ((8'ha5) + (8'hb0)))) ?
                  reg48 : $signed({{(8'hbb), wire44}}))))
            begin
              reg67 <= ({(^~$unsigned((8'h9e))),
                      ((+$unsigned(wire65)) || $signed({wire43, reg55}))} ?
                  (wire46[(4'hc):(1'h0)] >> wire46) : wire66[(3'h5):(3'h5)]);
            end
          else
            begin
              reg67 <= reg59[(3'h5):(2'h2)];
              reg68 <= reg49;
            end
          reg69 <= ($unsigned(reg50) ?
              $signed(wire44) : ($unsigned($unsigned((reg51 >= wire43))) ^~ $signed(($unsigned((8'ha0)) >>> $unsigned(wire43)))));
          reg70 <= $signed(($signed($signed((reg57 ?
              wire45 : reg67))) & wire43));
        end
      else
        begin
          reg67 <= reg60[(4'hb):(4'h8)];
          reg68 <= $signed(wire43[(1'h1):(1'h1)]);
          if (wire45)
            begin
              reg69 <= $unsigned($signed({(~|reg62)}));
              reg70 <= reg63;
            end
          else
            begin
              reg69 <= ({{({(8'h9e), (8'hb5)} ? reg50 : $signed(wire43)),
                          reg48[(4'hd):(4'hb)]},
                      {wire65}} ?
                  ($unsigned(reg56[(2'h2):(1'h0)]) ?
                      reg62[(3'h4):(2'h3)] : $signed(($unsigned(reg55) <<< $signed((8'ha4))))) : wire46);
              reg70 <= ((+($unsigned($signed((8'ha8))) >= $signed((-reg68)))) + reg64);
            end
          reg71 <= $signed(reg57[(3'h6):(3'h6)]);
          reg72 <= ((|(({reg51, wire46} ?
                      $unsigned(reg56) : (reg54 >>> reg47)) ?
                  ({reg57} ? {reg54} : (-reg71)) : ((~wire43) ?
                      ((8'hb7) < reg48) : (wire66 ? reg64 : wire45)))) ?
              (^~wire66) : reg64[(1'h0):(1'h0)]);
        end
    end
  assign wire73 = ((!(((reg62 ? wire43 : reg72) | $signed(reg59)) ?
                      ((8'ha4) | reg48[(4'h9):(4'h9)]) : wire53)) <<< (wire65 ?
                      (8'ha0) : $signed($signed(reg57))));
  assign wire74 = reg51[(5'h12):(4'hb)];
  assign wire75 = reg68;
endmodule

module module149
#(parameter param173 = (8'ha2))
(y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire154;
  input wire signed [(3'h4):(1'h0)] wire153;
  input wire [(3'h6):(1'h0)] wire152;
  input wire [(4'hb):(1'h0)] wire151;
  input wire [(5'h10):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(4'he):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire [(4'h8):(1'h0)] wire166;
  wire signed [(4'hf):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(2'h2):(1'h0)] wire163;
  wire signed [(5'h10):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  wire [(4'he):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire157,
                 wire156,
                 wire155,
                 reg158,
                 (1'h0)};
  assign wire155 = wire152;
  assign wire156 = ({(-($signed(wire152) - $unsigned(wire151))),
                       (~^$unsigned(wire155))} != (($unsigned((wire152 > wire151)) ?
                           $signed($unsigned(wire153)) : wire154) ?
                       $signed({{wire155, (8'ha5)},
                           (wire151 == wire150)}) : $unsigned($signed((8'hab)))));
  assign wire157 = wire154[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg158 <= $unsigned(($signed($unsigned($unsigned(wire151))) ?
          $signed($unsigned(wire152[(1'h1):(1'h1)])) : wire154[(4'h9):(2'h3)]));
    end
  assign wire159 = (~|wire151);
  assign wire160 = ((($signed($unsigned((7'h44))) << wire150) ?
                           wire153[(2'h3):(1'h1)] : wire157) ?
                       $signed({{(wire155 ? wire156 : reg158), (7'h42)},
                           $signed((wire154 | wire159))}) : (~|{(7'h42)}));
  assign wire161 = wire152[(2'h3):(1'h0)];
  assign wire162 = ($unsigned({wire160[(4'hb):(1'h1)]}) >> wire154[(2'h2):(1'h1)]);
  assign wire163 = $signed($signed((wire159[(3'h6):(3'h4)] ?
                       (~|(wire155 <= (7'h40))) : (!(wire153 - wire161)))));
  assign wire164 = {$unsigned(wire157[(2'h3):(2'h3)]),
                       $signed({{wire162[(4'hf):(4'he)]}, (8'hb6)})};
  assign wire165 = ($signed((wire155[(1'h1):(1'h0)] ? wire164 : (8'hac))) ?
                       wire156 : (8'ha0));
  assign wire166 = {$unsigned(wire157)};
  assign wire167 = wire153;
  assign wire168 = wire155;
  assign wire169 = (!(((-(wire151 ? wire162 : wire164)) ?
                       $signed((wire165 ?
                           wire164 : wire152)) : {wire153}) >> ($unsigned((wire167 ^~ wire166)) ?
                       wire162 : {wire168, (wire161 ? wire168 : wire162)})));
  assign wire170 = ($signed(wire168) ?
                       $unsigned($signed((wire151[(4'h8):(1'h1)] - $signed((8'hb6))))) : (wire161 ~^ ($unsigned(wire160) != (~^$signed((7'h41))))));
  assign wire171 = $signed($unsigned(reg158[(1'h1):(1'h1)]));
  assign wire172 = wire170[(4'ha):(1'h1)];
endmodule
