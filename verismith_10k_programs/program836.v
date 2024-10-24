module top
#(parameter param251 = (^{(^{(~(7'h44)), ((8'hb0) | (7'h41))})}), 
parameter param252 = (param251 != (param251 >> ((^~((8'ha0) - param251)) | (param251 ~^ (param251 ? param251 : param251))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire250;
  wire [(5'h11):(1'h0)] wire235;
  wire signed [(4'he):(1'h0)] wire234;
  wire [(5'h13):(1'h0)] wire233;
  wire signed [(4'hf):(1'h0)] wire232;
  wire [(5'h11):(1'h0)] wire231;
  wire [(5'h13):(1'h0)] wire229;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg249 = (1'h0);
  reg [(5'h15):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg247 = (1'h0);
  reg [(5'h10):(1'h0)] reg246 = (1'h0);
  reg [(4'hd):(1'h0)] reg245 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg244 = (1'h0);
  reg [(4'hd):(1'h0)] reg243 = (1'h0);
  reg signed [(4'he):(1'h0)] reg242 = (1'h0);
  reg [(3'h6):(1'h0)] reg241 = (1'h0);
  reg [(4'hb):(1'h0)] reg240 = (1'h0);
  reg [(5'h12):(1'h0)] reg239 = (1'h0);
  reg [(4'hd):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg237 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg236 = (1'h0);
  assign y = {wire250,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire229,
                 wire5,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 (1'h0)};
  assign wire5 = $unsigned(wire4[(3'h4):(1'h0)]);
  module6 #() modinst230 (.wire10(wire0), .clk(clk), .wire7(wire1), .wire9(wire5), .wire8(wire3), .y(wire229));
  assign wire231 = $signed($signed((7'h41)));
  assign wire232 = (((wire5 >= $unsigned(wire4)) ?
                       {($unsigned(wire2) ?
                               $signed(wire231) : wire231[(1'h1):(1'h0)]),
                           $signed($signed(wire229))} : {($unsigned(wire231) ?
                               $unsigned(wire3) : {wire4, wire229}),
                           ($unsigned(wire231) != (+wire3))}) != {((+((8'hb6) ?
                           wire4 : wire229)) > (wire229 ?
                           $unsigned(wire2) : wire3))});
  assign wire233 = wire3[(3'h4):(2'h2)];
  assign wire234 = $signed((&($signed((&wire232)) & $unsigned($unsigned(wire3)))));
  assign wire235 = {(wire232[(3'h7):(3'h5)] ?
                           (((^(7'h40)) ?
                                   wire229[(4'h9):(1'h0)] : $signed(wire1)) ?
                               wire232[(4'he):(4'hc)] : $unsigned(wire232[(4'he):(4'hc)])) : $unsigned(wire234[(4'hc):(4'hc)]))};
  always
    @(posedge clk) begin
      if ({$unsigned((+wire3))})
        begin
          reg236 <= (((wire3 ~^ $signed((wire2 < wire234))) ^ $signed((^(wire233 ?
                  wire233 : wire229)))) ?
              (wire229 ?
                  ((~^$unsigned((8'hb6))) ?
                      wire4[(3'h7):(1'h1)] : ($signed((8'hbb)) ?
                          $unsigned((8'ha1)) : wire233)) : wire0) : $unsigned(wire235));
          reg237 <= ($unsigned((&wire4)) >= $unsigned($unsigned(((wire5 >= wire229) != wire233))));
          reg238 <= wire229;
          if (wire4[(3'h5):(2'h2)])
            begin
              reg239 <= wire235;
              reg240 <= {reg237[(5'h11):(3'h4)],
                  ((~&($signed(wire235) & (wire234 ?
                      reg239 : reg236))) || $signed($signed((|wire229))))};
              reg241 <= wire4;
            end
          else
            begin
              reg239 <= {wire235[(4'he):(4'hc)],
                  {($signed((~|reg236)) <= wire2),
                      ((reg236 ? (wire4 >= reg236) : reg236) ?
                          reg241[(1'h0):(1'h0)] : ((reg236 ?
                              wire2 : (8'hac)) || {reg241}))}};
              reg240 <= $unsigned(wire3[(4'hd):(3'h6)]);
              reg241 <= (reg239 - reg237);
            end
        end
      else
        begin
          reg236 <= reg239[(2'h3):(1'h0)];
        end
      reg242 <= $signed($signed(wire3));
      reg243 <= wire235;
      if (reg238[(4'hd):(4'hc)])
        begin
          reg244 <= (($unsigned((-$signed(reg243))) ?
              (((wire231 << wire234) ~^ (wire0 ?
                  reg236 : (8'haa))) + reg237) : {(reg241[(3'h6):(3'h4)] ?
                      (^reg239) : $unsigned(reg242)),
                  $unsigned($signed(wire0))}) <= $unsigned({((reg237 != wire3) <= wire3),
              (^~{(8'haf)})}));
          reg245 <= wire4;
          reg246 <= (|wire4);
        end
      else
        begin
          if ((((($unsigned((8'hbd)) && reg237) ?
                      $signed((reg245 ? reg245 : wire229)) : $signed(reg241)) ?
                  reg245 : ($unsigned({reg244, wire5}) ?
                      (8'ha6) : $unsigned((wire2 ? reg239 : wire233)))) ?
              (reg240[(4'h8):(2'h3)] ?
                  (((wire3 != wire2) ?
                      (reg246 - reg242) : ((8'hac) ?
                          reg246 : reg237)) ^ (^~(wire233 ^~ wire234))) : $signed((~(wire232 ?
                      reg242 : (8'h9f))))) : (~&{reg242})))
            begin
              reg244 <= (((reg237[(4'h8):(1'h0)] ?
                  $unsigned(wire234[(2'h2):(1'h0)]) : ({(8'hb4), reg241} ?
                      wire229 : (reg244 | reg243))) + ($signed(wire235) ?
                  $unsigned(reg236) : ((reg242 ?
                      (8'hac) : reg241) > $unsigned(wire229)))) >>> (+reg241[(2'h3):(2'h2)]));
              reg245 <= reg243[(3'h5):(1'h0)];
              reg246 <= $signed((wire2 <= wire5));
              reg247 <= $unsigned($unsigned((~&$signed($signed(reg236)))));
              reg248 <= (reg242 ? reg244[(3'h7):(3'h6)] : reg238);
            end
          else
            begin
              reg244 <= (($signed($signed($signed(reg243))) ?
                      (~$signed($unsigned(wire5))) : reg241) ?
                  $unsigned(reg245) : (8'hb2));
              reg245 <= (!($signed($unsigned((~&(8'h9c)))) ?
                  reg238[(4'hd):(1'h1)] : $unsigned((8'had))));
              reg246 <= wire234;
            end
          reg249 <= (^~(&{{reg244}}));
        end
    end
  assign wire250 = wire4[(3'h7):(1'h0)];
endmodule

module module6
#(parameter param227 = (((((8'haf) ? {(7'h41), (8'hbf)} : (~(8'hb4))) ? ((!(8'hb2)) + {(8'ha2), (8'hbc)}) : (((8'hbc) | (8'hb2)) & ((8'hb7) ? (8'haa) : (8'hb9)))) >= ((((8'hb2) ? (8'ha3) : (8'hb2)) ? {(8'haa), (7'h41)} : ((8'hbc) ? (8'hbf) : (8'hbb))) & ({(8'hb1)} ? (|(8'hb3)) : {(8'hb7), (8'ha3)}))) ? (+{(((8'hbc) ? (8'hac) : (8'h9f)) ? (-(8'ha6)) : ((7'h44) ~^ (8'hbe))), (((8'hb9) ? (8'h9f) : (8'h9e)) ? {(8'ha4)} : (~|(8'hbf)))}) : {((^~((8'hbe) ? (8'hbe) : (8'hb3))) >= (~^(|(8'ha3)))), ((((8'hb1) ? (8'haa) : (8'haa)) ~^ ((8'hb8) ? (8'hb2) : (8'h9d))) == ((~(8'ha8)) != (~&(8'ha4))))}), 
parameter param228 = (((param227 ^ (((8'ha6) != param227) ? {(8'ha1), param227} : (^~param227))) << param227) & {{(^((8'haa) ? (7'h40) : param227)), param227}, param227}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h24d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire226;
  wire signed [(4'hb):(1'h0)] wire225;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(3'h6):(1'h0)] wire223;
  wire [(5'h14):(1'h0)] wire222;
  wire signed [(2'h2):(1'h0)] wire221;
  wire [(2'h3):(1'h0)] wire220;
  wire signed [(5'h15):(1'h0)] wire219;
  wire signed [(4'h9):(1'h0)] wire218;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire191;
  wire signed [(4'he):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire195;
  wire signed [(4'h8):(1'h0)] wire216;
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg189 = (1'h0);
  reg [(2'h3):(1'h0)] reg190 = (1'h0);
  reg [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg193 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire52,
                 wire54,
                 wire176,
                 wire191,
                 wire194,
                 wire195,
                 wire216,
                 reg26,
                 reg25,
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
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg192,
                 reg193,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (8'ha1);
      if ((!$signed((wire10 < wire8))))
        begin
          reg12 <= $signed(reg11);
          if ($signed(reg11))
            begin
              reg13 <= (~(~|wire8[(5'h11):(4'h8)]));
              reg14 <= (!wire7);
              reg15 <= {wire8[(5'h10):(2'h2)], wire9[(2'h3):(2'h3)]};
            end
          else
            begin
              reg13 <= ((^({((7'h44) ? wire8 : wire8),
                  $unsigned(reg12)} > $signed($unsigned(reg12)))) ~^ $unsigned(((~$unsigned(wire8)) ?
                  (|$unsigned((8'ha0))) : $signed((reg12 ? reg13 : wire10)))));
              reg14 <= reg13[(1'h1):(1'h0)];
              reg15 <= (~&wire9);
              reg16 <= (wire9 ?
                  ((wire8[(3'h4):(2'h2)] ?
                      (reg15[(3'h6):(1'h0)] == reg14) : ({wire9} | (~^(8'ha9)))) >= reg12[(2'h2):(2'h2)]) : (+((reg12[(3'h7):(1'h0)] >>> $unsigned(reg12)) | $unsigned((~&wire7)))));
              reg17 <= reg15;
            end
        end
      else
        begin
          reg12 <= $unsigned($signed({$unsigned(reg14),
              (^~((8'ha2) > wire10))}));
          reg13 <= $unsigned(reg13);
        end
      if ((~&(((wire10[(1'h0):(1'h0)] ?
                  (reg11 ? reg11 : wire9) : (reg15 ? reg17 : reg15)) ?
              $signed($unsigned(reg15)) : (~|wire8)) ?
          (-reg11[(3'h4):(2'h2)]) : ((((8'ha7) ? reg11 : reg11) ?
                  ((8'ha1) ^ wire7) : reg14) ?
              $unsigned($unsigned(reg17)) : ((!wire8) ~^ $signed(reg13))))))
        begin
          if ((wire8[(3'h5):(1'h1)] ?
              reg12[(3'h5):(2'h3)] : $unsigned(reg14[(2'h3):(2'h3)])))
            begin
              reg18 <= $unsigned((~|$unsigned($signed((&(8'hba))))));
              reg19 <= reg16[(5'h10):(3'h7)];
              reg20 <= reg18;
              reg21 <= ($unsigned(reg18[(1'h1):(1'h1)]) >>> wire8[(4'ha):(3'h6)]);
            end
          else
            begin
              reg18 <= (reg16 ? (8'hb1) : reg14);
              reg19 <= reg13[(1'h1):(1'h0)];
            end
          reg22 <= (reg15 ?
              $unsigned(($unsigned((reg20 - wire9)) & $signed((wire7 <<< wire7)))) : reg18);
          reg23 <= reg18;
          reg24 <= $unsigned($unsigned($signed(reg21)));
          reg25 <= (({reg13, reg19[(2'h2):(1'h0)]} ?
                  reg16[(4'ha):(4'h9)] : (!reg11[(3'h4):(3'h4)])) ?
              $signed(($unsigned((wire9 * reg23)) ?
                  (|reg14) : ((~reg15) ?
                      {reg21} : (~|(8'hac))))) : $unsigned(wire8));
        end
      else
        begin
          reg18 <= ($unsigned($signed({(-reg20),
              {reg13}})) * ($unsigned((reg12 < $unsigned(reg22))) >>> {(8'h9f)}));
          reg19 <= $unsigned((wire8[(3'h4):(2'h3)] + ((~&reg11[(3'h4):(2'h2)]) ?
              (reg19[(1'h0):(1'h0)] ?
                  $signed((8'hb3)) : $unsigned(reg20)) : ($signed(reg21) ?
                  wire7[(3'h7):(2'h3)] : $signed(reg24)))));
          reg20 <= $signed(({reg18, reg20[(1'h0):(1'h0)]} ?
              (((reg21 ^ reg19) >>> {reg22, wire10}) >= wire9) : reg22));
        end
      reg26 <= $signed($unsigned({(reg15[(3'h4):(1'h0)] ?
              reg23[(4'h9):(3'h4)] : (reg17 ? reg16 : (8'hb7))),
          $signed((reg16 >> wire7))}));
    end
  module27 #() modinst53 (wire52, clk, wire8, reg19, reg25, reg15, reg11);
  assign wire54 = (((-((^(8'hac)) << reg11)) << (wire8[(3'h6):(1'h0)] ?
                      $unsigned((reg11 - reg24)) : ((reg15 <<< (8'ha8)) ?
                          wire7[(5'h11):(4'ha)] : ((8'hac) > reg16)))) || ((reg25[(5'h11):(2'h3)] ?
                      (~&reg13[(2'h2):(1'h1)]) : reg21[(1'h0):(1'h0)]) ~^ $signed(reg14[(4'ha):(4'ha)])));
  module55 #() modinst177 (.wire57(wire7), .y(wire176), .wire59(wire9), .clk(clk), .wire60(reg13), .wire56(reg21), .wire58(reg14));
  always
    @(posedge clk) begin
      reg178 <= (wire52 <<< (((reg20[(3'h6):(1'h0)] ?
          reg13[(4'hf):(3'h4)] : (8'ha2)) && ((~reg12) ?
          wire52 : (reg15 ?
              reg19 : wire54))) + $signed((~reg20[(3'h5):(2'h2)]))));
      if (reg21[(1'h1):(1'h1)])
        begin
          reg179 <= (wire176[(4'h9):(3'h5)] ?
              (!(reg16[(4'he):(2'h3)] <<< (~|(reg21 ?
                  (8'haa) : reg24)))) : (+$signed(((wire54 ^ reg19) ?
                  reg21 : wire54))));
          reg180 <= ((wire54[(3'h5):(3'h4)] <<< (!(^((8'ha6) <<< reg21)))) ?
              {($signed($unsigned(reg26)) == $unsigned((-reg15)))} : reg11[(5'h12):(5'h11)]);
        end
      else
        begin
          reg179 <= $signed(((^~wire54[(3'h5):(1'h1)]) ?
              (+({reg19} ? wire8[(4'hd):(1'h0)] : reg180)) : (reg18 ?
                  wire10[(2'h2):(1'h1)] : reg19[(3'h5):(1'h0)])));
          reg180 <= {((~|$signed(wire176)) - $signed(wire8[(4'h9):(4'h9)]))};
          reg181 <= wire7;
          reg182 <= $signed($signed((8'h9f)));
          reg183 <= $unsigned(reg180);
        end
      reg184 <= ((8'ha5) >= reg18[(2'h2):(1'h1)]);
      if (($unsigned(wire52[(1'h1):(1'h0)]) * reg12[(1'h1):(1'h0)]))
        begin
          reg185 <= reg13;
          reg186 <= $unsigned(wire9);
          reg187 <= ({(|($signed(reg181) >= (reg19 ^ wire54)))} ?
              $unsigned({(reg182 == (reg24 ~^ (8'hba)))}) : {(((reg18 && reg22) && $unsigned(reg178)) && reg180),
                  $unsigned($signed($signed(wire7)))});
          reg188 <= $signed(({$unsigned(reg12)} ?
              $unsigned((+reg21[(3'h5):(1'h0)])) : reg26));
          if ($unsigned($signed((reg12 - ($unsigned((8'hb2)) * reg15)))))
            begin
              reg189 <= ($signed({(~&(reg184 && wire9)),
                      wire176[(4'hf):(4'hb)]}) ?
                  wire9 : ($unsigned($signed($signed((8'ha7)))) < $signed((8'h9e))));
            end
          else
            begin
              reg189 <= ((((reg25[(1'h1):(1'h1)] ?
                      reg22[(4'h9):(3'h7)] : ((8'hba) ?
                          reg25 : reg25)) >> $unsigned($unsigned(reg25))) ?
                  reg182 : $unsigned($signed(((8'ha3) && reg11)))) & $unsigned(($unsigned($signed(wire8)) & reg20)));
              reg190 <= $signed(((~(reg182[(4'hf):(2'h3)] ?
                  reg24[(3'h5):(3'h5)] : (reg11 ?
                      reg183 : reg189))) ~^ (!reg24)));
            end
        end
      else
        begin
          reg185 <= $unsigned((({$unsigned(wire8),
                  $signed(reg189)} << (^~((8'ha3) ? (8'ha2) : reg13))) ?
              (((&reg11) < reg18[(1'h0):(1'h0)]) && {$signed(reg19),
                  reg178[(3'h6):(3'h5)]}) : reg190));
          reg186 <= reg182;
        end
    end
  assign wire191 = $unsigned($unsigned({$signed(reg179),
                       reg178[(2'h3):(2'h2)]}));
  always
    @(posedge clk) begin
      reg192 <= $signed((^~(reg16 ?
          $signed((~|reg23)) : (~&$signed(wire191)))));
      reg193 <= wire9;
    end
  assign wire194 = reg181;
  assign wire195 = $unsigned(reg19);
  module196 #() modinst217 (wire216, clk, wire9, reg187, reg178, reg188);
  assign wire218 = reg15;
  assign wire219 = (wire52[(3'h5):(1'h0)] && (8'hb3));
  assign wire220 = $signed($unsigned({$signed(reg21[(1'h1):(1'h0)])}));
  assign wire221 = wire10;
  assign wire222 = wire54[(1'h0):(1'h0)];
  assign wire223 = $signed(wire195);
  assign wire224 = {(^~(~&$signed((reg188 ~^ reg23))))};
  assign wire225 = $unsigned($signed($unsigned({$unsigned((8'ha0))})));
  assign wire226 = {(reg188[(4'hf):(4'h9)] >>> {{(reg185 ? wire195 : (7'h42)),
                               (reg183 && reg17)},
                           (^reg23[(4'hd):(4'ha)])})};
endmodule

module module196
#(parameter param214 = ((((7'h42) ? (+((8'ha8) - (8'ha7))) : ((!(7'h42)) ? ((8'ha2) ? (8'hb5) : (8'hbe)) : (&(8'hbc)))) ? ((((8'had) || (8'h9c)) | ((8'h9e) ? (8'ha2) : (8'ha4))) & {((8'h9e) ? (8'hb1) : (8'ha0)), ((8'had) + (7'h43))}) : ({((7'h42) ~^ (7'h44)), (-(8'h9c))} ? {((8'hb5) >>> (8'ha1)), ((8'hbb) ? (8'h9d) : (8'hb9))} : (|((8'hba) == (7'h40))))) ? ({((^(8'hb6)) ? (|(8'hb7)) : ((8'hb4) ? (8'hb8) : (7'h42)))} ? {{(^(8'hb0)), ((8'hb2) ? (8'ha6) : (8'hab))}, (~^(8'ha4))} : (({(8'hbb), (8'ha7)} || (-(8'ha3))) ? (8'hab) : {((8'hb7) ? (7'h43) : (8'hb5)), {(8'hbf), (8'hbf)}})) : ((8'ha3) || (((8'h9e) <= (8'h9f)) ? ((~(7'h40)) ? ((8'haa) < (8'ha0)) : ((8'h9c) == (8'hb4))) : (((8'ha8) > (7'h41)) >> ((8'hb3) < (7'h43)))))), 
parameter param215 = param214)
(y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire200;
  input wire [(5'h15):(1'h0)] wire199;
  input wire signed [(2'h3):(1'h0)] wire198;
  input wire [(4'hc):(1'h0)] wire197;
  wire signed [(4'hf):(1'h0)] wire213;
  wire [(5'h14):(1'h0)] wire202;
  wire [(4'he):(1'h0)] wire201;
  reg signed [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(3'h7):(1'h0)] reg211 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(3'h6):(1'h0)] reg207 = (1'h0);
  reg [(4'hf):(1'h0)] reg206 = (1'h0);
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(4'hc):(1'h0)] reg203 = (1'h0);
  assign y = {wire213,
                 wire202,
                 wire201,
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
                 (1'h0)};
  assign wire201 = ($signed(wire199[(3'h7):(2'h3)]) ?
                       ((&(8'hb9)) != $unsigned((wire199 + (wire198 ?
                           wire198 : wire198)))) : wire199);
  assign wire202 = ((wire201 ?
                           $signed(($signed(wire197) ?
                               (+wire200) : ((8'hbe) | wire201))) : $signed(wire199[(5'h14):(2'h2)])) ?
                       wire200 : ($signed(wire199) ?
                           ((wire197 || $unsigned(wire200)) ?
                               {{(8'had), wire199},
                                   (wire197 ?
                                       wire199 : wire197)} : $signed($signed((8'hb2)))) : wire199));
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          reg203 <= $signed($unsigned($unsigned($unsigned((~^(8'hb7))))));
          reg204 <= wire199;
          reg205 <= ((wire197[(4'h9):(3'h4)] ^ {({reg204, (7'h44)} ?
                  wire197[(3'h7):(1'h0)] : wire200[(3'h5):(1'h0)])}) == $unsigned((^($signed((8'haf)) ?
              (wire202 ? wire198 : (8'hb1)) : wire201))));
          if ({(-{(wire198 ?
                      (wire200 ? wire200 : wire202) : $signed(wire197))})})
            begin
              reg206 <= $signed(wire199);
            end
          else
            begin
              reg206 <= (^$signed(wire201[(1'h1):(1'h1)]));
              reg207 <= ((~|(reg205 ^ $unsigned({wire199,
                  wire198}))) != ($signed(reg206) ?
                  ($signed((wire197 ? (8'hbf) : reg205)) ?
                      $unsigned($unsigned(reg203)) : ((reg203 ?
                          wire198 : wire201) | (&reg205))) : (wire201[(2'h2):(2'h2)] ~^ reg204)));
              reg208 <= (wire197 ?
                  ((^~wire202[(5'h12):(2'h2)]) ?
                      wire198 : (~^((reg206 < (8'hab)) ?
                          reg207 : (reg203 ?
                              reg206 : wire201)))) : reg203[(3'h5):(3'h5)]);
              reg209 <= reg205[(1'h1):(1'h1)];
              reg210 <= ($signed(((-(reg204 ?
                  wire197 : reg209)) << ($signed(reg209) ?
                  reg209[(3'h4):(2'h2)] : (!reg206)))) >= (reg204 ?
                  ($signed((wire200 ? reg207 : (8'ha4))) ?
                      (reg207[(3'h5):(1'h0)] ?
                          $signed(reg206) : ((8'hb3) && reg205)) : (~^(wire202 <= reg203))) : (~|wire199)));
            end
          reg211 <= (-$signed($signed((-$signed(reg205)))));
        end
      else
        begin
          reg203 <= wire202;
          reg204 <= ((~&(reg207 ?
              $signed($signed(wire202)) : (~$unsigned(wire199)))) < {wire200[(3'h4):(2'h2)]});
          reg205 <= wire200;
        end
      reg212 <= $signed($signed((($signed((8'hb4)) >>> reg209[(1'h1):(1'h1)]) | (!((8'ha5) ?
          wire201 : reg205)))));
    end
  assign wire213 = $signed((^~(^~({reg211, wire197} < $unsigned(reg209)))));
endmodule

module module55
#(parameter param175 = (((~|({(8'h9d)} ? ((8'hb8) ? (8'h9f) : (8'haa)) : ((8'ha5) == (8'ha2)))) ^~ (+({(8'ha9)} & ((8'ha8) * (8'ha9))))) ^~ (((~&(~|(8'ha5))) != (((8'hac) ? (8'had) : (8'h9e)) ? {(7'h42), (8'hb8)} : {(8'haf)})) ? (-({(8'ha2)} & ((7'h41) >>> (8'ha3)))) : (8'hbc))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h4fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire60;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire58;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire174;
  wire signed [(2'h3):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire170;
  wire [(5'h10):(1'h0)] wire169;
  wire [(4'hc):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire140,
                 wire101,
                 wire100,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire58)
        begin
          reg61 <= $signed($signed(($signed(wire56) ^ $signed((8'hba)))));
          reg62 <= $signed((-reg61));
          reg63 <= $signed((($unsigned((wire57 * wire56)) ?
                  wire58 : $signed($signed((7'h42)))) ?
              (&(reg62[(1'h0):(1'h0)] ?
                  wire56 : (reg62 ? wire59 : reg61))) : (reg62 ?
                  wire56 : (|(&(8'hae))))));
        end
      else
        begin
          if ((reg62[(3'h4):(3'h4)] | (wire58[(2'h2):(1'h0)] <= $unsigned({reg61}))))
            begin
              reg61 <= reg63;
              reg62 <= (8'hae);
              reg63 <= (&wire59);
            end
          else
            begin
              reg61 <= {(~|(~|wire57[(1'h0):(1'h0)]))};
              reg62 <= ({$unsigned((^~(wire56 ? reg62 : reg62))),
                  $unsigned((wire57 ?
                      $unsigned(wire56) : (~|reg63)))} & $signed((&(wire56[(2'h3):(1'h1)] ?
                  (^wire59) : reg61))));
              reg63 <= {(wire56 >> wire60[(4'hc):(3'h4)]),
                  $unsigned({((reg62 ^ reg61) ?
                          (~&(8'hb0)) : $signed(wire57))})};
              reg64 <= (-wire56[(2'h3):(2'h2)]);
              reg65 <= $unsigned(reg64[(1'h0):(1'h0)]);
            end
          reg66 <= {$signed($unsigned(wire59)), $unsigned(reg63)};
        end
      if (((8'hb1) >> wire57))
        begin
          reg67 <= (^~{wire56[(1'h1):(1'h1)]});
        end
      else
        begin
          reg67 <= wire60[(2'h3):(1'h0)];
          reg68 <= reg67;
          if ({(~$signed($signed((!reg62))))})
            begin
              reg69 <= reg66[(4'ha):(4'h8)];
            end
          else
            begin
              reg69 <= (&$unsigned(({wire60[(4'hf):(4'hb)],
                  $signed(wire56)} + wire60[(5'h12):(4'hb)])));
              reg70 <= (($unsigned((~^(wire60 ? reg62 : reg61))) ^~ ((!(wire56 ?
                  wire58 : wire59)) & (&$unsigned(reg69)))) <<< (~^reg62[(1'h0):(1'h0)]));
              reg71 <= $unsigned(((|reg67[(4'hd):(4'h8)]) & {(~|(reg68 < reg67)),
                  ((^reg67) ^~ $signed(reg65))}));
            end
          reg72 <= $unsigned((8'ha4));
          if ($unsigned(((&$unsigned($unsigned(wire60))) <<< $unsigned(wire59))))
            begin
              reg73 <= ((wire56[(3'h4):(2'h2)] ?
                  reg72 : (^$unsigned((-reg63)))) | $unsigned(reg63[(3'h6):(3'h4)]));
            end
          else
            begin
              reg73 <= wire57;
              reg74 <= ({reg71[(3'h7):(1'h1)],
                  $unsigned((~&reg67[(4'h9):(1'h1)]))} <<< ($signed(($unsigned((7'h42)) >> reg72)) < $unsigned(reg64[(2'h2):(1'h0)])));
            end
        end
      reg75 <= reg62;
      reg76 <= reg61[(1'h1):(1'h1)];
      if ($unsigned($signed(reg68[(4'ha):(2'h3)])))
        begin
          reg77 <= ((~&($signed((reg66 ?
              wire56 : wire60)) * (reg64[(2'h2):(1'h0)] || $unsigned(wire56)))) ~^ (($unsigned($unsigned(reg61)) ?
              reg61 : {$signed(reg74)}) >>> wire60[(3'h7):(1'h0)]));
          reg78 <= (!reg77);
          reg79 <= reg67[(4'h9):(1'h1)];
          reg80 <= (8'hab);
          reg81 <= $unsigned($unsigned($unsigned({(reg62 && wire56)})));
        end
      else
        begin
          reg77 <= $signed(reg78[(4'h9):(2'h2)]);
          reg78 <= $unsigned(($unsigned(((reg71 ? reg67 : reg73) ?
                  reg78[(3'h6):(2'h3)] : (-(8'hb8)))) ?
              $signed((~{reg65})) : $signed((!((8'ha2) ? reg80 : reg64)))));
          reg79 <= $signed(reg79);
          if ({{(reg64 == ((|(7'h42)) < reg74))}})
            begin
              reg80 <= ($signed($unsigned($signed(reg81[(3'h6):(1'h1)]))) ?
                  reg65[(2'h3):(2'h2)] : (reg70[(3'h4):(1'h1)] == reg73[(2'h2):(1'h1)]));
              reg81 <= reg80[(3'h7):(3'h6)];
              reg82 <= reg63[(2'h3):(1'h1)];
              reg83 <= ({$signed($unsigned((reg75 || reg64)))} || $unsigned(reg64[(2'h3):(2'h2)]));
              reg84 <= (reg71[(2'h3):(1'h1)] || ($signed($unsigned((^reg67))) ?
                  reg76 : (reg82[(1'h1):(1'h1)] << reg78[(3'h4):(3'h4)])));
            end
          else
            begin
              reg80 <= $signed((~reg66[(1'h0):(1'h0)]));
              reg81 <= ((((^~$unsigned(wire57)) != (+(+reg79))) ?
                  wire59[(2'h2):(2'h2)] : ($signed((reg83 ?
                      reg64 : reg66)) ^~ $signed((reg82 && wire60)))) <= reg76);
              reg82 <= $signed((reg81[(3'h5):(1'h1)] ?
                  (^~((!reg70) >>> reg71)) : $signed(((reg65 ?
                      reg84 : reg83) * reg67))));
              reg83 <= reg73;
              reg84 <= ((((reg61[(2'h2):(1'h1)] ? (!reg81) : $signed((8'ha7))) ?
                      $unsigned((reg75 ? (8'ha1) : reg69)) : {{(8'ha9)},
                          (&(8'h9e))}) ?
                  reg62[(3'h5):(3'h5)] : reg72[(1'h1):(1'h1)]) ~^ reg65);
            end
        end
    end
  always
    @(posedge clk) begin
      reg85 <= ($signed(reg72) > reg64[(1'h1):(1'h1)]);
      reg86 <= $unsigned($signed(reg78[(1'h1):(1'h0)]));
    end
  assign wire87 = ($unsigned(wire60[(4'h8):(3'h5)]) >> (({$signed(reg70),
                              (wire57 ? reg70 : (7'h41))} ?
                          reg81 : wire58) ?
                      $unsigned(((wire57 ? reg82 : reg63) ?
                          (reg84 >> reg75) : {(8'hb4),
                              reg73})) : reg78[(4'ha):(1'h0)]));
  assign wire88 = reg65[(1'h1):(1'h1)];
  assign wire89 = $signed(($unsigned($signed((~reg68))) > {wire56}));
  assign wire90 = $signed(reg77[(1'h0):(1'h0)]);
  assign wire91 = reg83;
  assign wire92 = {reg77[(1'h0):(1'h0)],
                      (reg69 ^~ ((8'ha4) & (reg83[(3'h5):(1'h0)] <= (+(7'h43)))))};
  assign wire93 = reg76;
  always
    @(posedge clk) begin
      reg94 <= wire89[(4'ha):(3'h4)];
      if ((~^reg82))
        begin
          reg95 <= reg77;
          reg96 <= $unsigned($unsigned(wire59[(4'ha):(1'h0)]));
        end
      else
        begin
          reg95 <= wire93[(4'h8):(3'h4)];
        end
      reg97 <= {reg94[(2'h3):(1'h1)], wire58};
      reg98 <= $unsigned(($unsigned($unsigned((^~(8'ha8)))) ?
          {$unsigned((reg80 - wire60)), (&(reg83 >= reg83))} : reg97));
      reg99 <= reg82[(1'h0):(1'h0)];
    end
  assign wire100 = (reg70[(1'h0):(1'h0)] ~^ reg78[(2'h3):(2'h2)]);
  assign wire101 = (($signed(reg74) ?
                           (~|$unsigned(wire59[(4'h8):(3'h5)])) : {$signed(wire59)}) ?
                       ($signed((+$signed(wire57))) || (({reg98, wire100} ?
                           (reg70 < reg61) : reg79) ~^ (wire87 ?
                           {reg64} : $signed((8'hac))))) : $signed(wire93[(4'hf):(1'h0)]));
  always
    @(posedge clk) begin
      if (reg68)
        begin
          reg102 <= reg79[(3'h6):(3'h5)];
        end
      else
        begin
          reg102 <= $unsigned($signed((($signed(reg97) ?
              ((7'h44) ?
                  wire60 : reg78) : $unsigned(reg97)) ~^ ((reg73 >= reg72) ?
              wire60[(4'hb):(3'h7)] : (reg65 ? reg65 : reg65)))));
          if ({($signed((wire101 ?
                  (~^reg102) : (reg75 ~^ reg80))) <<< wire88[(3'h6):(3'h5)])})
            begin
              reg103 <= reg77;
              reg104 <= $signed(({$unsigned((reg97 == reg79))} ?
                  ($unsigned(reg80) ?
                      (~(reg98 ?
                          reg83 : reg66)) : ((reg69 <= (8'hba)) < $unsigned(reg67))) : $signed(reg83[(2'h2):(2'h2)])));
            end
          else
            begin
              reg103 <= (reg62 ? wire56 : reg104[(1'h1):(1'h0)]);
              reg104 <= $unsigned((|$unsigned(((~|wire91) | reg72[(1'h0):(1'h0)]))));
              reg105 <= wire92[(2'h3):(2'h3)];
              reg106 <= ({(~{$signed(reg62)}), {reg66}} * (8'ha3));
            end
        end
      if (reg105)
        begin
          reg107 <= (&$signed(wire87));
          reg108 <= ((((~(wire91 <<< reg70)) ?
                  reg62[(4'h9):(3'h6)] : (reg76[(4'ha):(2'h3)] == (reg94 | reg82))) ?
              $signed(reg105[(3'h7):(3'h4)]) : (!(^~wire89))) == (8'hb3));
        end
      else
        begin
          reg107 <= wire101[(1'h1):(1'h0)];
          reg108 <= reg77;
          reg109 <= ((+$signed((~&$unsigned(reg83)))) ?
              (8'hb8) : ($unsigned(reg68[(3'h7):(2'h2)]) ?
                  {((8'ha3) ? reg64[(1'h1):(1'h1)] : (&wire60)),
                      $signed(reg71)} : (8'had)));
          reg110 <= reg72[(3'h5):(1'h0)];
          if ($signed(wire91))
            begin
              reg111 <= $unsigned(({(^{wire100}),
                      (((8'hb7) > reg84) ? reg68[(4'ha):(4'h8)] : (+reg67))} ?
                  reg103 : reg109));
              reg112 <= (($unsigned($unsigned({reg63})) && {(reg104 == reg111[(2'h3):(2'h2)])}) ?
                  (!$signed(wire93)) : wire93);
              reg113 <= reg82;
              reg114 <= reg99[(3'h7):(3'h4)];
            end
          else
            begin
              reg111 <= $unsigned(({(~|{reg110}), $signed(wire56)} <= reg110));
            end
        end
      if (((^reg68[(3'h6):(2'h3)]) >= $signed(((-reg67[(3'h5):(2'h2)]) ?
          {((8'ha0) ? (8'hb9) : reg70)} : $signed((reg82 * wire90))))))
        begin
          reg115 <= $unsigned(((wire87 ?
              $unsigned($signed(reg84)) : $unsigned(reg105[(5'h12):(1'h1)])) <<< wire91[(2'h2):(1'h0)]));
        end
      else
        begin
          if (reg103)
            begin
              reg115 <= {$unsigned((8'hb8))};
            end
          else
            begin
              reg115 <= (8'hbf);
              reg116 <= wire59;
              reg117 <= {(reg103 ?
                      (reg107[(3'h6):(3'h4)] ?
                          $signed((wire100 ?
                              wire58 : (8'haa))) : (reg66[(1'h0):(1'h0)] ?
                              (wire87 & wire57) : (reg76 << wire88))) : (reg63[(2'h2):(1'h1)] ?
                          $unsigned(wire88[(3'h7):(3'h6)]) : $signed(wire89[(3'h5):(2'h3)])))};
              reg118 <= (^~(~(({wire92} ?
                  $unsigned(wire57) : (^~reg70)) | $unsigned(reg72[(2'h3):(2'h3)]))));
              reg119 <= $unsigned(reg64[(2'h3):(2'h3)]);
            end
          reg120 <= ($unsigned({reg83[(4'hd):(3'h6)], {(|wire58)}}) ?
              (~reg66) : $unsigned(($unsigned((|reg77)) > (~&{(8'hbf)}))));
          reg121 <= reg111[(4'hb):(4'h8)];
        end
      reg122 <= reg76;
      reg123 <= (($unsigned(reg79[(2'h2):(1'h0)]) | (reg76 ?
          $signed(((8'ha5) ? reg63 : reg83)) : $signed((wire57 ?
              (8'haf) : reg112)))) != (~&$unsigned((+((7'h42) * (8'ha9))))));
    end
  always
    @(posedge clk) begin
      reg124 <= ({($unsigned($signed(wire91)) ?
              (~&(&(8'ha6))) : ({wire91} ?
                  (reg62 ? wire57 : reg114) : ((8'ha8) < reg99))),
          reg102} && (reg105 | ((^~reg84[(3'h5):(2'h3)]) ?
          (~^(wire56 >>> reg79)) : (^(~|wire89)))));
      if (wire91[(3'h6):(3'h5)])
        begin
          reg125 <= $unsigned($unsigned($unsigned(reg85[(4'hc):(3'h4)])));
          reg126 <= (reg86 ?
              reg95 : (reg67[(4'h8):(3'h6)] ?
                  reg112[(3'h7):(1'h1)] : (reg109 >= (~(&reg61)))));
          if (reg72)
            begin
              reg127 <= $signed(wire90[(3'h5):(2'h2)]);
              reg128 <= $signed((^(!(&$signed(reg68)))));
              reg129 <= {reg73[(2'h2):(2'h2)],
                  ((~&{reg96}) ^ $unsigned(reg102[(3'h7):(3'h6)]))};
              reg130 <= $unsigned((+((wire90[(1'h1):(1'h1)] && reg99[(3'h6):(1'h0)]) <= ((~^reg120) << reg66))));
            end
          else
            begin
              reg127 <= (+(reg119 ? {reg77} : reg99));
              reg128 <= wire87;
              reg129 <= (7'h40);
              reg130 <= (reg102 << (8'hb0));
              reg131 <= $unsigned(reg74[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg125 <= reg121[(3'h4):(3'h4)];
          reg126 <= reg83;
          reg127 <= (|(~^($signed({reg84, reg64}) ?
              {(^reg115), (~|wire60)} : $signed((reg123 ? reg68 : reg104)))));
          if (reg118[(4'ha):(4'h9)])
            begin
              reg128 <= reg98;
            end
          else
            begin
              reg128 <= reg76[(3'h7):(2'h3)];
              reg129 <= ($signed((+(~(wire60 < reg114)))) ?
                  (((-$signed(reg76)) >= reg86[(4'ha):(2'h2)]) | (+(8'hb5))) : reg127[(4'h8):(1'h0)]);
              reg130 <= (($unsigned(({wire91} ^ $unsigned(reg69))) | (($unsigned((8'hab)) >> {(8'hba)}) ?
                      ($unsigned(reg78) <= reg79[(3'h7):(1'h0)]) : (~|((8'ha5) ?
                          (8'hb1) : reg69)))) ?
                  (($signed(wire88) ?
                          ((|reg65) - $unsigned((8'hab))) : ((~reg128) ?
                              $signed(reg122) : (8'hbc))) ?
                      ((^(reg86 ^~ reg125)) ^ $signed(wire90[(4'ha):(3'h6)])) : reg75[(3'h4):(1'h0)]) : (reg110[(2'h2):(1'h0)] && $unsigned(((8'ha7) ?
                      (reg86 ? wire57 : reg85) : (reg95 - reg110)))));
            end
          reg131 <= {reg119};
        end
      if ($signed(($signed({$unsigned(reg81),
          (~^wire92)}) || $signed($signed((+reg78))))))
        begin
          reg132 <= $signed($unsigned(reg108));
          if ((-($signed((reg124 ?
              (reg69 ?
                  wire56 : reg110) : wire60)) > $unsigned(reg61[(2'h3):(1'h1)]))))
            begin
              reg133 <= (reg62 ?
                  ({(reg80 ? $signed(reg131) : reg111[(3'h7):(3'h4)])} ?
                      (8'hb1) : $unsigned(wire87)) : ((((reg114 | reg82) ?
                      (&wire89) : $unsigned(reg127)) >= ($signed(reg95) ?
                      $unsigned(reg81) : $signed(reg63))) ^~ reg131[(3'h5):(1'h1)]));
              reg134 <= (~$unsigned(reg120[(1'h1):(1'h1)]));
              reg135 <= ((7'h41) ? $signed((8'hbe)) : reg129[(1'h1):(1'h1)]);
              reg136 <= (!$unsigned((reg70[(3'h4):(2'h2)] ? reg125 : (8'ha4))));
            end
          else
            begin
              reg133 <= (+$unsigned($unsigned($unsigned(reg77))));
            end
          reg137 <= (reg122[(3'h5):(1'h1)] < $signed((((reg105 <<< (8'hb2)) >>> $unsigned(reg95)) < wire60)));
          reg138 <= reg120;
          reg139 <= reg95;
        end
      else
        begin
          if ((reg110 ?
              $signed((8'h9d)) : $signed($unsigned((+$signed(reg119))))))
            begin
              reg132 <= {$unsigned(wire60)};
              reg133 <= (reg131 ^ $unsigned({$unsigned((reg137 >>> reg115)),
                  reg105}));
              reg134 <= {($signed($unsigned({reg109})) ^~ ((~reg137[(1'h0):(1'h0)]) ^~ (8'hb6)))};
            end
          else
            begin
              reg132 <= (($signed($signed({reg121,
                      reg70})) != (reg104[(1'h1):(1'h0)] ?
                      $signed(((8'h9f) || (7'h42))) : (~((8'hb0) & reg78)))) ?
                  $signed($unsigned($unsigned($unsigned(wire60)))) : reg76);
              reg133 <= (~wire91[(3'h4):(3'h4)]);
            end
          reg135 <= reg106[(1'h0):(1'h0)];
        end
    end
  assign wire140 = $signed(wire91[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if (((($signed((reg98 ^~ reg66)) * $signed($signed(reg125))) << (^~$unsigned($unsigned((8'ha6))))) ?
          (reg107 ?
              ($unsigned((&reg63)) && (~^$unsigned(reg114))) : wire91[(4'h8):(3'h7)]) : ($signed(reg127) ?
              $unsigned($unsigned({reg126,
                  (8'h9c)})) : ($unsigned($signed(reg67)) <= $signed((wire93 ?
                  (8'hb4) : (8'ha1)))))))
        begin
          reg141 <= reg82[(1'h1):(1'h0)];
          if ($signed(((8'h9d) ? (8'ha7) : $signed($signed($signed(wire58))))))
            begin
              reg142 <= ((reg61[(2'h3):(1'h0)] ? reg68 : (~^reg113)) ?
                  reg117 : reg70[(3'h5):(2'h3)]);
              reg143 <= $unsigned($signed(reg114[(2'h2):(2'h2)]));
              reg144 <= wire140[(4'ha):(3'h4)];
            end
          else
            begin
              reg142 <= (reg85 ?
                  $signed((reg84 >> ((~^reg133) != $signed(wire140)))) : {($unsigned($unsigned(wire60)) * reg62[(3'h7):(1'h0)])});
              reg143 <= (+$unsigned(reg130[(4'hc):(2'h3)]));
              reg144 <= ((reg98 + reg136) ^~ {$unsigned(($signed(reg141) + ((8'h9e) ?
                      reg62 : (7'h41)))),
                  $unsigned((((8'hb6) ? reg125 : wire140) ?
                      (8'hbe) : (reg79 ~^ (8'hac))))});
              reg145 <= ((($signed({reg75}) < (|reg102)) << ($signed({(7'h41)}) + $unsigned(wire101[(1'h0):(1'h0)]))) + reg96[(3'h7):(3'h6)]);
              reg146 <= ($unsigned(reg107) ?
                  $signed(((~wire87) && (~(reg83 ?
                      reg102 : reg61)))) : $signed((({(8'haf),
                      reg127} || reg77[(1'h1):(1'h0)]) >> $signed({(8'hba),
                      (8'hbf)}))));
            end
          reg147 <= (reg141[(4'he):(4'hd)] - ((reg109[(4'hc):(4'hc)] ?
              reg67 : reg71[(1'h1):(1'h0)]) + $signed(reg107)));
          reg148 <= $signed((7'h43));
          reg149 <= reg147[(4'he):(2'h3)];
        end
      else
        begin
          reg141 <= $unsigned(wire92[(4'h8):(1'h0)]);
          reg142 <= reg121[(1'h1):(1'h0)];
          reg143 <= (wire59 << (~(~&reg134[(2'h2):(2'h2)])));
          if (wire140)
            begin
              reg144 <= ($signed((~|((reg115 ?
                  reg104 : (8'hb4)) != wire92[(3'h4):(3'h4)]))) >= ($unsigned($unsigned($unsigned(reg94))) ~^ $signed((+reg139))));
              reg145 <= reg114;
            end
          else
            begin
              reg144 <= (reg95[(5'h10):(3'h7)] ~^ (^~$unsigned(($unsigned(reg108) << (+reg121)))));
              reg145 <= ((|(reg98 >= $signed(reg78[(2'h2):(1'h1)]))) ?
                  {reg75, reg142[(2'h2):(2'h2)]} : {($unsigned((7'h43)) ?
                          reg63[(3'h7):(1'h0)] : reg124)});
              reg146 <= $signed((reg62[(3'h4):(2'h2)] < ($signed((~|reg113)) <<< ((reg102 && reg115) ?
                  (reg74 ? (8'hb1) : reg98) : (reg128 ? reg78 : reg149)))));
            end
          reg147 <= $signed(((~|reg96[(4'hf):(2'h3)]) ?
              (($unsigned(reg143) || {reg105,
                  (7'h44)}) <= reg131[(4'hc):(3'h6)]) : (wire88[(3'h4):(1'h0)] - $signed((~|reg130)))));
        end
      if ($unsigned($signed(reg107[(4'h8):(3'h7)])))
        begin
          if ({reg108, wire89[(1'h0):(1'h0)]})
            begin
              reg150 <= reg130[(4'h8):(2'h2)];
              reg151 <= reg115;
              reg152 <= reg68;
              reg153 <= reg95[(3'h7):(3'h6)];
              reg154 <= ($signed(reg148[(4'h9):(4'h9)]) <<< reg107[(4'h9):(3'h4)]);
            end
          else
            begin
              reg150 <= $unsigned($signed(((reg85[(3'h5):(1'h1)] ?
                  {wire93} : (reg105 ? reg65 : reg122)) & ($signed(wire58) ?
                  {(8'ha9), reg77} : $signed(reg69)))));
              reg151 <= (^(reg117[(3'h6):(1'h1)] ^~ (8'haa)));
            end
          reg155 <= (($unsigned(((reg103 + reg135) != (reg74 ?
              reg84 : (8'h9e)))) <<< reg110) <<< ($unsigned((~&$unsigned(reg136))) ?
              (^$signed(reg107)) : reg85));
          reg156 <= (((reg61 >> ($unsigned(reg98) | $unsigned(wire101))) << ($unsigned((&reg65)) ?
                  $unsigned((reg119 ? reg73 : reg82)) : (((8'hb6) - reg147) ?
                      (7'h40) : (|wire92)))) ?
              (reg84[(2'h3):(1'h1)] ?
                  reg126 : $signed(reg155)) : $signed($signed($unsigned((~&(8'hb2))))));
          if (reg97)
            begin
              reg157 <= $unsigned((({(reg151 ?
                      (8'hba) : reg117)} ~^ (~&reg83)) < (8'h9d)));
              reg158 <= $signed($unsigned({{{reg152, reg148},
                      $signed(reg149)}}));
              reg159 <= ($signed({($unsigned(reg156) && {(8'h9f),
                      reg139})}) <<< {wire87[(1'h0):(1'h0)]});
            end
          else
            begin
              reg157 <= (($unsigned(reg139[(2'h2):(1'h0)]) ?
                      ((~$signed(reg152)) <<< {(^reg128),
                          ((8'had) - reg75)}) : (8'haf)) ?
                  (8'hb0) : reg148[(4'h9):(3'h6)]);
              reg158 <= ((!reg103) | $unsigned(wire90));
              reg159 <= (~&$signed(wire140));
              reg160 <= reg113;
              reg161 <= reg134[(2'h3):(2'h2)];
            end
          if (((((+(reg95 * reg80)) < reg122) ?
                  reg117 : (~|((^~reg128) | ((8'ha0) ~^ reg86)))) ?
              reg117[(3'h4):(3'h4)] : (&{reg63[(3'h7):(3'h7)]})))
            begin
              reg162 <= ((~^{reg156}) ?
                  reg138 : $unsigned(reg109[(4'hb):(4'ha)]));
              reg163 <= $signed((reg148 < $signed(((reg124 != (7'h43)) ?
                  (wire100 >> reg68) : (wire90 ? reg95 : reg128)))));
            end
          else
            begin
              reg162 <= reg97[(1'h1):(1'h0)];
              reg163 <= wire93[(5'h12):(5'h10)];
              reg164 <= reg153;
              reg165 <= (8'ha8);
            end
        end
      else
        begin
          reg150 <= (8'hac);
          reg151 <= (+(((8'hb1) ?
                  $unsigned((reg117 == reg108)) : $unsigned((reg70 && reg85))) ?
              (wire91 > (~reg161)) : ((wire56[(2'h3):(1'h0)] ?
                  {reg77,
                      reg158} : reg129[(1'h0):(1'h0)]) | reg152[(3'h6):(3'h6)])));
          reg152 <= reg162[(1'h1):(1'h0)];
        end
      reg166 <= reg85;
      reg167 <= ($unsigned((|((reg153 ? reg128 : reg125) ?
          reg126 : ((7'h41) ? (8'ha7) : reg73)))) * (reg132 ?
          (reg98 && ($unsigned(wire88) ?
              $unsigned(reg68) : (|(8'hac)))) : wire89));
      reg168 <= $unsigned((8'hbe));
    end
  assign wire169 = (^~reg102);
  assign wire170 = ($signed($unsigned({$signed(reg148),
                       $unsigned(wire101)})) == ({$signed((reg137 ?
                           reg156 : reg108))} + wire60[(3'h6):(2'h2)]));
  assign wire171 = $signed((+reg143[(2'h3):(2'h2)]));
  assign wire172 = reg122;
  assign wire173 = $unsigned(({({reg136, reg156} != reg122), reg71} ?
                       wire100[(2'h2):(2'h2)] : $unsigned((8'ha0))));
  assign wire174 = {$unsigned((~^$unsigned((reg116 ? reg73 : wire171))))};
endmodule

module module27
#(parameter param50 = ({(((+(8'hbd)) >= ((8'haa) ? (8'ha9) : (8'hba))) ? ({(8'h9f)} ? ((8'h9c) ? (8'hba) : (8'hab)) : ((8'h9f) ? (8'ha4) : (8'hbd))) : ({(8'ha6)} >= (8'hb4))), {(^~{(8'ha1)}), (((8'h9e) ? (7'h41) : (8'ha3)) ? {(8'ha8), (8'hb6)} : ((8'hb1) ? (8'had) : (8'hb0)))}} ? {{(((8'ha2) ? (8'hb9) : (8'ha6)) == ((7'h44) * (7'h41))), {((8'hb6) ? (8'hb3) : (7'h41))}}, (~({(8'hb9)} != ((8'ha3) ? (7'h42) : (8'hbb))))} : ({(^~(+(8'h9d)))} ? (~|((~|(7'h42)) == ((8'ha4) >>> (8'h9f)))) : ({{(8'haf)}, (^(8'hab))} ? {((8'h9e) < (8'ha7)), ((8'h9f) | (8'hab))} : ((!(7'h40)) >> {(8'hb6), (8'ha2)})))), 
parameter param51 = ((({(param50 ? param50 : param50)} ? (param50 ? param50 : (8'hae)) : (|((8'hb3) ? param50 : param50))) ? (((~&param50) && (~(8'hbc))) >= (param50 >> (!param50))) : ((!(param50 ? param50 : (8'haf))) + param50)) ^~ param50))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 reg47,
                 reg46,
                 reg42,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= ((wire30[(4'ha):(1'h0)] ?
              $signed((wire32[(2'h3):(1'h0)] - $signed(wire29))) : $signed($signed(wire31[(1'h1):(1'h0)]))) ?
          ((wire28 >= ((wire29 << wire29) ?
                  wire28[(5'h10):(3'h7)] : (wire31 ? wire29 : (8'hb6)))) ?
              ({(wire30 * wire30), $signed(wire31)} ?
                  wire32 : ((wire28 <= wire31) | (wire30 && wire31))) : $signed({wire29[(2'h2):(2'h2)],
                  {wire28}})) : (^$unsigned(({(7'h42)} ?
              (wire32 * wire32) : wire31[(2'h2):(1'h1)]))));
      if (({wire32[(1'h1):(1'h1)],
          (((^wire29) + (wire30 - (8'ha1))) ?
              {(wire29 ? wire29 : wire29)} : ($signed(wire31) ?
                  wire31 : $unsigned(wire32)))} || wire32[(3'h4):(1'h1)]))
        begin
          reg34 <= wire32[(2'h3):(1'h0)];
        end
      else
        begin
          reg34 <= {(~(^~(+{wire31})))};
          reg35 <= wire29[(1'h0):(1'h0)];
          reg36 <= $signed($unsigned($signed(($signed(wire29) ?
              (reg34 != wire30) : (wire31 ? wire28 : wire32)))));
        end
    end
  assign wire37 = reg33;
  assign wire38 = wire30;
  assign wire39 = $unsigned(wire31);
  always
    @(posedge clk) begin
      reg40 <= {wire37[(1'h0):(1'h0)]};
    end
  assign wire41 = ($signed({{(reg36 ~^ wire28), $signed(wire30)},
                          reg35[(1'h0):(1'h0)]}) ?
                      reg36 : $unsigned(wire32[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg42 <= reg34[(2'h3):(2'h3)];
    end
  assign wire43 = wire30;
  assign wire44 = wire43[(1'h0):(1'h0)];
  assign wire45 = wire43;
  always
    @(posedge clk) begin
      reg46 <= ((-$signed((^~(wire31 || reg33)))) ~^ $unsigned((wire45[(1'h0):(1'h0)] ?
          (+reg36) : (~|reg34))));
      reg47 <= $unsigned($signed(wire32));
    end
  assign wire48 = wire29[(2'h2):(1'h0)];
  assign wire49 = (~^reg35);
endmodule
