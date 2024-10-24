module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire206;
  wire signed [(2'h2):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  wire signed [(3'h7):(1'h0)] wire197;
  wire signed [(4'h9):(1'h0)] wire195;
  wire signed [(2'h3):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(4'hb):(1'h0)] wire186;
  wire signed [(4'h9):(1'h0)] wire185;
  wire signed [(5'h12):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire191;
  wire signed [(3'h7):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire193;
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg [(3'h6):(1'h0)] reg204 = (1'h0);
  reg [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire206,
                 wire202,
                 wire201,
                 wire199,
                 wire198,
                 wire197,
                 wire195,
                 wire189,
                 wire188,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire5,
                 wire181,
                 wire191,
                 wire192,
                 wire193,
                 reg205,
                 reg204,
                 reg203,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= wire1[(4'h9):(2'h2)];
      if (wire4[(4'hd):(4'hc)])
        begin
          reg7 <= (wire0 ? (!wire0) : reg6[(2'h3):(1'h1)]);
        end
      else
        begin
          reg7 <= ($unsigned($unsigned(wire0[(4'hd):(3'h6)])) ?
              wire1[(4'hf):(3'h7)] : $signed($signed(((wire1 || reg7) ?
                  (+wire0) : (-wire1)))));
          if (wire3[(5'h13):(4'hf)])
            begin
              reg8 <= ($unsigned(wire5) ^~ $signed(($signed(reg7[(2'h3):(2'h3)]) ?
                  (~|$signed(wire5)) : ($unsigned(wire4) > reg6[(3'h4):(3'h4)]))));
              reg9 <= $unsigned(((^~reg6[(3'h7):(1'h0)]) ?
                  (!((8'hb1) <<< (~(8'ha1)))) : reg6));
            end
          else
            begin
              reg8 <= ($unsigned({{$signed(reg8), (reg9 > wire2)}}) ?
                  (+($unsigned((wire1 <<< reg9)) && $unsigned($unsigned(wire2)))) : $signed({reg8[(3'h5):(1'h0)]}));
              reg9 <= (~{$unsigned({(^reg6)})});
              reg10 <= reg9;
              reg11 <= (((wire3[(3'h5):(3'h5)] ^~ reg9) ?
                      reg9 : (wire0[(3'h6):(3'h5)] ?
                          $unsigned((&reg10)) : reg6)) ?
                  $unsigned(reg7) : (wire0[(1'h0):(1'h0)] ? (8'h9d) : reg9));
            end
          if ($unsigned(reg7[(3'h7):(1'h1)]))
            begin
              reg12 <= $signed({($unsigned(wire0) ?
                      ($unsigned(wire1) ^ (&(8'ha8))) : (!(8'hbb)))});
              reg13 <= reg8[(2'h3):(2'h3)];
            end
          else
            begin
              reg12 <= $signed($unsigned((^~$signed(((8'hb1) ?
                  wire3 : reg7)))));
            end
          if (reg10[(3'h6):(3'h4)])
            begin
              reg14 <= reg10[(4'hd):(4'h9)];
              reg15 <= (8'ha9);
              reg16 <= reg8[(3'h7):(2'h3)];
            end
          else
            begin
              reg14 <= reg14;
              reg15 <= $signed($signed({(|(reg13 && wire5)),
                  reg9[(4'hb):(1'h1)]}));
              reg16 <= $unsigned((8'ha9));
              reg17 <= $unsigned((~&(&reg9[(4'hc):(3'h4)])));
              reg18 <= (-wire4);
            end
          reg19 <= (wire2 ?
              {reg15,
                  (^~(|(wire1 << (8'h9f))))} : $unsigned($unsigned((-(wire1 ?
                  (8'ha1) : reg16)))));
        end
      reg20 <= ({reg16[(2'h3):(2'h2)]} <= $unsigned({(reg19[(3'h7):(3'h4)] * (~^wire3))}));
      reg21 <= reg20[(3'h5):(1'h0)];
    end
  module22 #() modinst182 (wire181, clk, reg13, reg10, wire4, wire0, wire2);
  assign wire183 = ((({reg15} ? (&(~^wire4)) : wire5) && ($unsigned({(8'hb2),
                       reg9}) | (reg18[(4'hc):(4'hb)] ^ (reg6 ?
                       wire0 : reg15)))) >>> ({(|(|reg16))} ?
                       reg7 : wire4[(4'hb):(3'h7)]));
  assign wire184 = $signed((reg7[(3'h5):(1'h0)] ?
                       $signed(reg14) : ((((8'ha9) ?
                           reg11 : reg6) >>> {(8'hb0)}) != $unsigned((reg8 ~^ reg6)))));
  assign wire185 = $signed($signed($unsigned($unsigned(wire3[(3'h7):(1'h0)]))));
  module130 #() modinst187 (.wire132(wire2), .wire133(wire3), .y(wire186), .wire134(wire5), .clk(clk), .wire131(wire185));
  assign wire188 = $unsigned((($signed((~^wire3)) ?
                       reg11[(3'h4):(2'h2)] : {$signed((8'hb2)),
                           (reg8 - reg7)}) >= reg16));
  module89 #() modinst190 (wire189, clk, wire5, reg13, wire183, wire1, reg12);
  assign wire191 = reg9[(4'hf):(3'h5)];
  assign wire192 = wire186;
  module89 #() modinst194 (wire193, clk, reg8, wire2, reg17, wire0, wire5);
  module22 #() modinst196 (.wire23(wire191), .y(wire195), .clk(clk), .wire24(reg14), .wire26(reg7), .wire25(reg9), .wire27(wire1));
  assign wire197 = $signed(wire181[(1'h1):(1'h0)]);
  assign wire198 = {((wire0 ?
                           (~^$unsigned((8'hbd))) : ((reg21 ?
                               wire192 : wire183) <= (~&(7'h42)))) < (~reg8)),
                       ((reg17[(3'h7):(3'h5)] ?
                               $unsigned($signed(wire184)) : wire183) ?
                           ((reg8[(4'hc):(3'h7)] ~^ (8'hac)) ?
                               wire2 : wire185[(3'h4):(1'h0)]) : wire2)};
  module160 #() modinst200 (.y(wire199), .wire163(wire198), .wire164(reg10), .wire162(reg19), .wire161(wire183), .clk(clk));
  assign wire201 = {$unsigned((wire191[(1'h0):(1'h0)] <= $unsigned($unsigned(reg15))))};
  assign wire202 = $signed(wire1[(4'hf):(3'h4)]);
  always
    @(posedge clk) begin
      reg203 <= $unsigned(reg9);
      reg204 <= $unsigned({$signed($signed(wire1[(5'h13):(4'hd)])),
          (wire1[(4'hb):(3'h4)] || $signed(wire195))});
      reg205 <= (~&wire186);
    end
  assign wire206 = wire195;
endmodule

module module22
#(parameter param180 = ((~&({((8'hb3) ? (7'h42) : (8'hab))} ? ((~&(8'h9e)) ? {(8'ha4)} : (&(8'ha1))) : ((^~(8'haf)) < ((8'ha4) >> (8'hba))))) <<< (^~{({(8'hb1), (8'ha3)} ? ((8'hac) ? (8'h9e) : (8'hbd)) : (~&(8'hb2)))})))
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire178;
  wire [(5'h14):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire157;
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  assign y = {wire178,
                 wire159,
                 wire127,
                 wire88,
                 wire28,
                 wire45,
                 wire86,
                 wire129,
                 wire157,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = $unsigned({$signed(((-wire23) > $signed(wire25))), wire24});
  always
    @(posedge clk) begin
      if ($unsigned(wire24[(5'h10):(4'hf)]))
        begin
          if ((~|(|(($unsigned(wire25) != wire25) << wire26))))
            begin
              reg29 <= $unsigned((wire25 ?
                  {(~^((8'h9c) & (8'hb6))),
                      ($unsigned(wire27) <= (wire23 ?
                          (8'had) : wire28))} : $unsigned((~^wire24[(2'h2):(1'h1)]))));
              reg30 <= wire27;
              reg31 <= $unsigned(wire26[(4'hb):(4'ha)]);
            end
          else
            begin
              reg29 <= ($signed(($signed({wire27,
                      reg30}) & reg31[(4'h9):(2'h3)])) ?
                  wire28[(1'h0):(1'h0)] : wire23);
              reg30 <= (($unsigned($signed((^~wire25))) * (~&(+(7'h43)))) ?
                  $unsigned((wire23[(4'hc):(1'h0)] <= (~^wire27))) : $signed(((-$signed((8'hb0))) + (~(~wire24)))));
              reg31 <= $signed($signed(wire25));
              reg32 <= wire28;
            end
          if ((wire26[(1'h1):(1'h0)] ^ $unsigned((wire27 ?
              {(^wire23)} : wire26[(3'h7):(1'h0)]))))
            begin
              reg33 <= {$unsigned((-($signed(wire24) << (wire27 ?
                      reg32 : wire27))))};
            end
          else
            begin
              reg33 <= wire27;
              reg34 <= wire28[(2'h3):(1'h1)];
              reg35 <= $unsigned((wire28 ?
                  (&reg32) : $unsigned(($signed(wire24) ?
                      (wire27 ? wire27 : wire24) : (wire27 ?
                          wire25 : reg31)))));
              reg36 <= $unsigned(((&$signed({wire24,
                  (8'h9e)})) != wire25[(3'h7):(1'h1)]));
            end
        end
      else
        begin
          reg29 <= reg30;
          if (wire25)
            begin
              reg30 <= {(wire28[(5'h11):(4'hb)] * (7'h40))};
            end
          else
            begin
              reg30 <= reg31[(1'h1):(1'h1)];
              reg31 <= reg31;
            end
          reg32 <= $unsigned(($unsigned({$unsigned(reg30),
                  reg35[(4'hd):(2'h2)]}) ?
              (($unsigned(reg31) ?
                      (reg29 ? reg29 : wire28) : reg36[(3'h7):(1'h1)]) ?
                  (!(reg33 ^ (8'hb9))) : reg29[(3'h4):(1'h0)]) : ((!{reg35}) ?
                  ((~^reg34) >> ((7'h43) ?
                      reg33 : reg33)) : $signed($unsigned(reg32)))));
          reg33 <= ((|wire27[(2'h3):(2'h2)]) || $signed(reg34[(4'h9):(3'h7)]));
          reg34 <= $signed(({wire23[(4'h9):(3'h6)]} ~^ wire25));
        end
      if ((wire28 - (reg31[(2'h3):(1'h1)] ?
          $unsigned($signed($signed((8'hae)))) : wire26[(4'h9):(3'h6)])))
        begin
          if (wire23)
            begin
              reg37 <= wire24;
              reg38 <= $signed(reg32[(1'h0):(1'h0)]);
              reg39 <= (reg32 + $unsigned(reg31[(1'h0):(1'h0)]));
              reg40 <= $signed($unsigned((^~reg32)));
              reg41 <= (~&$signed((8'ha2)));
            end
          else
            begin
              reg37 <= (reg31[(2'h2):(1'h0)] ?
                  (($signed($signed(reg30)) > ($unsigned((8'had)) ?
                      {reg37, wire25} : (8'hb5))) < (reg32[(1'h0):(1'h0)] ?
                      $unsigned((reg40 ? reg38 : wire27)) : ($signed((8'h9d)) ?
                          {(8'h9d)} : $unsigned((8'hac))))) : $unsigned(reg33[(2'h3):(1'h1)]));
              reg38 <= ($signed(reg39[(2'h3):(2'h3)]) ?
                  ($unsigned($signed($unsigned(reg31))) ?
                      (~wire23) : $signed(wire26)) : {(~^reg31)});
              reg39 <= ($signed({(^reg35[(5'h10):(1'h1)])}) && reg32);
              reg40 <= wire28[(4'h8):(1'h1)];
              reg41 <= $signed({$signed($unsigned(((8'ha6) ? reg35 : reg38)))});
            end
          reg42 <= $signed({wire23,
              (wire23[(4'hb):(3'h4)] * $signed(wire27[(3'h6):(2'h2)]))});
          reg43 <= ($signed($unsigned(((wire25 ?
                  reg39 : reg33) && $unsigned(wire23)))) ?
              reg31 : ((reg30 == reg37) != (wire25[(5'h15):(4'hb)] * (((8'hba) ?
                  reg31 : reg37) << $signed(reg32)))));
        end
      else
        begin
          reg37 <= (|($unsigned(($signed(reg40) ?
                  reg32[(2'h2):(1'h1)] : {(8'ha0), reg33})) ?
              reg43[(4'hf):(4'he)] : (|$unsigned((7'h40)))));
          if (reg32)
            begin
              reg38 <= reg35;
              reg39 <= $signed((((reg40 >> $unsigned(reg32)) ~^ {$unsigned((8'hbd)),
                  reg33}) >>> ((-((8'hbd) >> reg33)) ?
                  wire23 : {$signed(reg37), (wire26 >= reg38)})));
            end
          else
            begin
              reg38 <= wire27[(3'h4):(1'h1)];
              reg39 <= wire26[(3'h5):(3'h5)];
              reg40 <= (wire27[(1'h0):(1'h0)] * (reg34[(3'h5):(1'h0)] || ($unsigned((reg31 ?
                  reg34 : reg32)) + $unsigned($unsigned((7'h42))))));
            end
          reg41 <= $unsigned(wire24[(1'h1):(1'h1)]);
        end
      reg44 <= (wire27[(2'h2):(1'h1)] ?
          (reg31[(4'h8):(3'h4)] ?
              ((^reg39) >= $unsigned(reg36)) : (wire24 ?
                  $unsigned($signed(wire27)) : $unsigned((wire28 * reg39)))) : (^~(!(|((8'haf) ?
              wire25 : reg35)))));
    end
  assign wire45 = wire24[(5'h11):(4'hd)];
  always
    @(posedge clk) begin
      reg46 <= reg38[(3'h6):(1'h1)];
      reg47 <= ((wire24[(3'h4):(1'h1)] < ($unsigned((reg29 | (7'h41))) ?
              ($signed(reg41) << wire26[(3'h5):(3'h4)]) : reg29)) ?
          (wire23[(4'h9):(2'h2)] ?
              $signed(((^~wire27) & $signed(wire25))) : $unsigned(reg31)) : ((reg39 <= $unsigned(reg36[(2'h3):(1'h0)])) + (($signed((8'ha5)) ?
              $signed(reg38) : wire45[(3'h5):(1'h0)]) | ($signed(reg41) >> (^(8'hae))))));
      if (($unsigned((wire27[(3'h5):(2'h2)] ?
          $signed(((7'h42) ? reg36 : wire45)) : ({wire26, reg47} ?
              {(8'hb6), reg35} : (reg39 + reg40)))) - $unsigned(((reg31 ?
          (reg38 ?
              reg43 : reg34) : reg31[(2'h2):(1'h1)]) + reg32[(2'h2):(1'h1)]))))
        begin
          reg48 <= $unsigned({reg41[(2'h3):(1'h0)],
              (reg32 ^~ (+$signed(wire25)))});
          reg49 <= wire28;
          reg50 <= $unsigned((reg32[(2'h2):(2'h2)] ?
              ((~|$signed(reg40)) ?
                  (~^(~|reg39)) : $signed((~&wire23))) : reg38[(4'hb):(4'ha)]));
        end
      else
        begin
          reg48 <= {reg46};
        end
      reg51 <= (+reg43);
      reg52 <= ($unsigned(($signed(reg38[(3'h5):(1'h1)]) ^~ $unsigned((reg40 ?
          reg30 : wire28)))) <<< $signed((($unsigned(reg31) ^ (|wire28)) >> reg42[(1'h1):(1'h1)])));
    end
  module53 #() modinst87 (.wire56(wire27), .wire57(reg29), .wire54(reg44), .wire55(reg31), .clk(clk), .y(wire86));
  assign wire88 = (^~$unsigned($unsigned($unsigned(wire86[(1'h0):(1'h0)]))));
  module89 #() modinst128 (wire127, clk, reg44, wire88, wire24, reg43, wire86);
  assign wire129 = reg29[(4'hf):(4'h9)];
  module130 #() modinst158 (wire157, clk, reg40, reg49, wire127, reg44);
  assign wire159 = (^{$signed({$signed(wire127), reg42[(3'h4):(2'h3)]})});
  module160 #() modinst179 (.clk(clk), .y(wire178), .wire162(wire26), .wire161(reg32), .wire164(reg33), .wire163(wire159));
endmodule

module module160
#(parameter param177 = (+((((8'hb5) > (^~(8'hbc))) >> (((8'ha5) <= (8'hb3)) ? ((8'hbe) ? (8'hab) : (7'h42)) : {(8'ha9), (8'hb0)})) ? (^~(~&(~^(8'hbb)))) : ((|((8'h9f) ? (8'ha2) : (8'ha9))) >= ((8'ha4) - ((8'ha2) ? (8'hb2) : (8'hbe)))))))
(y, clk, wire164, wire163, wire162, wire161);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire164;
  input wire [(5'h10):(1'h0)] wire163;
  input wire signed [(5'h15):(1'h0)] wire162;
  input wire [(4'hc):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire176;
  wire signed [(5'h10):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(5'h13):(1'h0)] wire172;
  wire signed [(4'hb):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire [(4'he):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire165;
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 (1'h0)};
  assign wire165 = $signed(wire161[(4'h8):(4'h8)]);
  assign wire166 = $unsigned((wire161[(1'h1):(1'h1)] ?
                       ((8'ha1) && wire164) : (($unsigned(wire164) ?
                           wire165 : (wire165 ? wire163 : (8'hb8))) - ({wire164,
                           (8'hab)} ~^ wire165))));
  assign wire167 = ($signed($unsigned((~(wire162 ?
                       wire165 : wire166)))) >= $signed(($signed((wire162 + wire164)) >>> ((wire161 ^ wire165) - (wire163 ?
                       wire162 : wire164)))));
  assign wire168 = ((8'haf) ?
                       $signed((~^(+(wire163 < wire162)))) : $signed((~(wire162 > (wire164 ?
                           wire161 : wire162)))));
  assign wire169 = wire165[(3'h5):(2'h3)];
  assign wire170 = (wire168 >= ((wire163[(5'h10):(3'h5)] ?
                           wire167[(4'h9):(3'h4)] : wire168) ?
                       $signed((^~((8'hbb) ? wire168 : wire166))) : (((wire161 ?
                           wire162 : wire163) >>> (~|wire166)) <= ((wire161 ?
                           wire166 : wire164) != ((8'hba) - (8'hbe))))));
  assign wire171 = $signed($unsigned(((wire168[(4'h9):(1'h0)] - (8'hb4)) ?
                       $signed(wire165) : ($unsigned(wire168) << wire166))));
  assign wire172 = (!wire168[(2'h2):(2'h2)]);
  assign wire173 = wire161[(1'h1):(1'h1)];
  assign wire174 = $unsigned((^wire162[(5'h15):(3'h6)]));
  assign wire175 = wire167[(5'h10):(1'h0)];
  assign wire176 = wire163[(1'h1):(1'h1)];
endmodule

module module130
#(parameter param155 = ((8'hb3) + ((8'h9d) ^~ {(^((8'h9f) ? (8'hba) : (8'ha1))), ({(7'h40), (8'hb1)} ? {(8'ha2), (8'hb5)} : ((8'ha1) ? (8'ha7) : (8'had)))})), 
parameter param156 = {{((param155 == param155) ? param155 : ({(8'ha9), param155} ? (+param155) : ((8'hb0) >>> param155))), (!(&(param155 ? param155 : (8'hb2))))}, {param155}})
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire134;
  input wire signed [(4'ha):(1'h0)] wire133;
  input wire signed [(5'h13):(1'h0)] wire132;
  input wire [(4'h8):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire154;
  wire [(2'h2):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire signed [(5'h11):(1'h0)] wire135;
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire135,
                 reg147,
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
                 (1'h0)};
  assign wire135 = wire133[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg136 <= $signed({wire132});
      if ((!$unsigned((wire133 ?
          $signed(wire132[(4'he):(4'hc)]) : $unsigned((wire134 ?
              wire134 : (8'hb3)))))))
        begin
          reg137 <= (($unsigned(((wire135 <<< wire135) <= {wire131,
              reg136})) >= $signed((wire134 ?
              (wire134 ^~ wire131) : wire135))) ^ {(({wire135} ?
                  (&wire131) : (^~wire132)) >= wire133[(4'h8):(3'h6)]),
              $unsigned(wire131)});
          reg138 <= wire132[(3'h7):(3'h6)];
          reg139 <= (-wire135[(4'hb):(4'hb)]);
        end
      else
        begin
          reg137 <= {(8'hb4)};
          if (((^~reg136[(3'h6):(1'h1)]) ?
              ($signed(((wire134 ? reg138 : reg138) && $unsigned(reg138))) ?
                  wire133 : $unsigned((&$signed(wire133)))) : reg138))
            begin
              reg138 <= (reg139 != $unsigned($unsigned($signed(wire134))));
              reg139 <= {(!((|reg136) ?
                      $signed((reg136 ? wire134 : wire133)) : wire135))};
            end
          else
            begin
              reg138 <= {$unsigned($unsigned(reg138)),
                  $unsigned({((~&reg138) ?
                          $signed(wire134) : $unsigned(wire132)),
                      (reg136 ?
                          $unsigned(reg139) : (reg139 ? reg137 : wire134))})};
              reg139 <= (~wire135);
            end
          reg140 <= wire134[(3'h4):(3'h4)];
        end
      reg141 <= wire132;
      if ((wire135[(3'h4):(2'h3)] ?
          ($unsigned(wire133[(1'h1):(1'h1)]) ?
              wire133 : (reg139[(3'h5):(3'h5)] ?
                  {(wire134 <<< reg137)} : {(wire134 != wire133),
                      (wire131 == reg136)})) : $signed($unsigned($unsigned((reg138 << wire131))))))
        begin
          if (({(~&($unsigned(wire131) ~^ $unsigned(reg139))),
                  reg139[(1'h1):(1'h1)]} ?
              (^~($unsigned((7'h42)) >>> wire132)) : (~|(^~$unsigned((^~reg140))))))
            begin
              reg142 <= (reg138 | reg136);
              reg143 <= $signed((~(reg138 && wire134)));
              reg144 <= ($unsigned($unsigned($unsigned((wire135 != reg142)))) << wire133);
              reg145 <= reg140;
            end
          else
            begin
              reg142 <= $unsigned((wire134 & $signed($unsigned($unsigned(reg145)))));
              reg143 <= $unsigned((((wire134[(1'h1):(1'h1)] ?
                  (wire133 ?
                      wire132 : (8'hb1)) : (&reg138)) > ($signed(reg136) >= $unsigned(wire135))) > (+((reg140 <= (8'hab)) * $signed(wire133)))));
              reg144 <= $unsigned(($signed(reg142) ?
                  wire133[(3'h5):(3'h4)] : reg141));
              reg145 <= (-reg137);
              reg146 <= ($signed(((~&{reg144}) ?
                      {((8'hb4) ? reg145 : reg137)} : reg137)) ?
                  ((|$unsigned({reg142,
                      reg138})) >= (($signed(reg140) | (^~reg139)) ^~ (|(reg142 < reg139)))) : (^(((8'ha6) ?
                          {reg138, wire135} : $unsigned(reg142)) ?
                      (reg136[(2'h3):(1'h0)] <= $unsigned(reg137)) : reg138[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if (($signed(((reg139[(4'hd):(2'h2)] && $unsigned(reg139)) ?
              $unsigned($unsigned((8'ha1))) : {reg140})) <<< (reg136 ?
              (wire131 ^ {reg136[(3'h7):(3'h4)]}) : reg139[(4'h8):(2'h2)])))
            begin
              reg142 <= ($unsigned(({$signed((8'ha6)),
                      (~|reg143)} <= ((8'ha8) >> $signed(wire131)))) ?
                  wire132[(5'h11):(2'h3)] : $unsigned(reg143));
              reg143 <= (8'hb3);
              reg144 <= $signed((wire134 ?
                  $signed(wire134[(3'h7):(3'h7)]) : $unsigned(wire131)));
              reg145 <= (^~$unsigned({($signed(wire134) ?
                      $unsigned((8'haa)) : reg137),
                  ((reg143 ? reg136 : reg142) ?
                      (8'hab) : reg145[(1'h1):(1'h1)])}));
            end
          else
            begin
              reg142 <= (~wire131[(4'h8):(1'h1)]);
              reg143 <= $signed($signed((|($signed((8'hb9)) ?
                  (!(8'ha0)) : (-reg136)))));
              reg144 <= $unsigned($signed(reg141));
              reg145 <= wire132[(2'h2):(1'h0)];
            end
          reg146 <= $unsigned($signed((reg143 ?
              (reg136 ?
                  ((8'ha3) ? (8'hac) : reg144) : (reg142 + reg143)) : {{wire133,
                      wire133}})));
          reg147 <= $unsigned(wire131[(3'h7):(2'h2)]);
        end
    end
  assign wire148 = reg141[(1'h0):(1'h0)];
  assign wire149 = (reg144[(3'h6):(1'h0)] - (!{reg147[(2'h2):(2'h2)],
                       wire134}));
  assign wire150 = (~$unsigned($signed(wire135[(4'ha):(3'h4)])));
  assign wire151 = {$signed(((~&$unsigned(wire135)) | wire134))};
  assign wire152 = $unsigned(reg141);
  assign wire153 = $signed(reg142[(3'h4):(3'h4)]);
  assign wire154 = ($signed($unsigned(wire150[(3'h6):(2'h3)])) - reg142);
endmodule

module module89  (y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire94;
  input wire [(5'h10):(1'h0)] wire93;
  input wire signed [(4'h8):(1'h0)] wire92;
  input wire signed [(5'h13):(1'h0)] wire91;
  input wire [(5'h13):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire126;
  wire signed [(5'h12):(1'h0)] wire108;
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  assign y = {wire126,
                 wire108,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({($signed(wire90[(2'h2):(1'h1)]) ?
                  $unsigned((-wire91)) : ((wire92 >= wire94) * (wire90 >= (8'hbf)))),
              wire90[(2'h2):(2'h2)]} ?
          wire94[(4'hd):(1'h0)] : $unsigned({$signed((wire93 ?
                  wire90 : wire91))})))
        begin
          reg95 <= wire93[(4'h9):(2'h2)];
          reg96 <= $signed(wire93);
          reg97 <= (7'h43);
        end
      else
        begin
          reg95 <= $unsigned(reg95);
        end
      if ((((8'h9f) ?
          wire94[(3'h7):(3'h6)] : $signed($signed($signed(wire93)))) ~^ (reg96[(4'h8):(3'h7)] ^ wire91)))
        begin
          reg98 <= $signed($signed({((~&(8'ha3)) < (^~(7'h44)))}));
        end
      else
        begin
          reg98 <= (($signed($unsigned((8'hac))) > $unsigned((^~((8'ha1) ?
                  wire92 : (8'hb8))))) ?
              ((reg95 ?
                      ((~^wire92) ?
                          (wire94 ? reg96 : reg98) : {reg98,
                              wire94}) : wire90[(4'h9):(4'h9)]) ?
                  ($unsigned(reg96[(2'h3):(1'h1)]) ?
                      wire94 : (^~(|wire93))) : reg98) : wire92);
          if (wire93)
            begin
              reg99 <= ($signed((~(~^$signed(reg97)))) < {$signed($unsigned($signed(wire94)))});
              reg100 <= ($unsigned(reg97) > wire94);
            end
          else
            begin
              reg99 <= {({((reg99 >>> (8'haa)) != $unsigned(reg96))} >> wire94)};
            end
          reg101 <= reg98;
          if (reg100[(2'h3):(1'h1)])
            begin
              reg102 <= reg100;
              reg103 <= wire93;
              reg104 <= {reg96};
              reg105 <= (~^reg96[(4'h9):(3'h5)]);
              reg106 <= {reg104,
                  ((reg103[(2'h3):(1'h0)] >>> (!reg101[(4'he):(2'h3)])) ~^ $unsigned(wire93[(4'ha):(3'h7)]))};
            end
          else
            begin
              reg102 <= $unsigned($unsigned(reg103[(3'h4):(2'h3)]));
              reg103 <= {(wire90[(3'h5):(3'h4)] ?
                      (~&reg96[(4'h8):(1'h0)]) : $signed($unsigned({reg104,
                          reg99})))};
              reg104 <= $signed((+(-reg103)));
              reg105 <= (7'h44);
            end
        end
      reg107 <= (reg98 ?
          $unsigned((($unsigned((8'hb9)) - (!reg106)) << ($signed(reg95) + reg95[(2'h3):(2'h2)]))) : wire90);
    end
  assign wire108 = reg105;
  always
    @(posedge clk) begin
      reg109 <= (reg96 ^ (wire91 && wire94));
      if ((($unsigned((|(reg109 - reg109))) * (8'hba)) * (8'ha0)))
        begin
          reg110 <= $signed(((|$signed($unsigned(wire94))) | ((~^(reg107 > (8'hbb))) > {$signed((8'h9c))})));
          reg111 <= ($signed((^~reg96)) ?
              ($unsigned(((reg110 * reg103) ?
                  (wire108 | (8'hab)) : $signed(wire92))) ^ reg106[(2'h2):(2'h2)]) : $unsigned({$signed(reg109),
                  (reg101 ? (reg96 || wire92) : (&wire94))}));
          reg112 <= $unsigned($signed(({(~wire92), (8'hab)} ?
              ((+reg97) < $signed(reg105)) : {$unsigned(reg109)})));
        end
      else
        begin
          reg110 <= $signed(($signed(reg99[(2'h3):(1'h1)]) ?
              $unsigned($unsigned((reg111 != reg100))) : $unsigned(($unsigned((8'ha4)) ?
                  reg97[(2'h2):(1'h1)] : (reg110 ? (8'ha6) : reg100)))));
          reg111 <= (reg109[(2'h3):(1'h1)] ^~ wire91);
          if (reg111)
            begin
              reg112 <= ((wire91[(3'h6):(3'h4)] ?
                  {$unsigned({reg110})} : (reg98 ~^ $unsigned((reg101 >> wire92)))) >>> $unsigned(reg109));
              reg113 <= $unsigned(reg110);
              reg114 <= ((reg101[(3'h4):(2'h2)] < $signed(wire90)) >>> $signed((|((wire90 ?
                      reg98 : wire108) ?
                  $unsigned(wire91) : $signed(reg107)))));
              reg115 <= (wire91 + $unsigned(({$signed((8'ha5)), reg96} ?
                  $unsigned((wire108 != reg113)) : ($unsigned(wire93) ~^ wire90))));
            end
          else
            begin
              reg112 <= reg103;
              reg113 <= $unsigned(wire93);
              reg114 <= $unsigned($unsigned((|(+(reg97 ? (8'ha4) : wire94)))));
              reg115 <= ((reg106[(3'h4):(2'h2)] ?
                  (8'ha5) : $unsigned($signed($signed(reg97)))) >> (~^(((reg109 ?
                  (8'ha8) : reg97) << reg110) == wire94)));
              reg116 <= ((((7'h43) ?
                  ($unsigned(wire93) | (wire94 ?
                      wire91 : reg96)) : (reg97 <<< (reg104 ?
                      wire92 : reg95))) == wire93) == ((^$unsigned($signed(reg97))) >= (&$unsigned(((8'hb7) ~^ reg114)))));
            end
        end
      if (reg96[(4'hc):(3'h7)])
        begin
          reg117 <= $signed((reg112 ?
              ($unsigned($unsigned((8'hb8))) <<< $signed(wire90[(1'h0):(1'h0)])) : (reg107[(4'hc):(4'ha)] ?
                  (&(reg106 ? reg110 : reg98)) : (^~$unsigned(reg97)))));
          reg118 <= wire93[(4'h8):(3'h4)];
        end
      else
        begin
          reg117 <= {({$signed(((8'h9c) ? reg102 : wire108)), reg102} ?
                  reg98 : reg109)};
          if (($unsigned((&{$signed(wire108),
              $unsigned(reg98)})) >> $signed((^~$signed(reg118)))))
            begin
              reg118 <= $signed(reg111);
            end
          else
            begin
              reg118 <= $signed(wire108[(5'h10):(4'he)]);
              reg119 <= ($signed(reg103) && reg99[(1'h1):(1'h0)]);
              reg120 <= $unsigned(wire108[(4'he):(2'h3)]);
              reg121 <= (reg96 & ($signed({(~|wire90)}) - {(8'hb6), reg105}));
              reg122 <= $unsigned({$signed($unsigned($signed(reg110)))});
            end
          reg123 <= reg97;
        end
      reg124 <= $unsigned(reg119);
      reg125 <= $unsigned($signed(((^(reg123 ^~ reg114)) ?
          wire94 : $unsigned($unsigned(reg96)))));
    end
  assign wire126 = reg119;
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire signed [(5'h15):(1'h0)] wire55;
  input wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire60,
                 wire59,
                 wire58,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg74,
                 reg73,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire58 = (8'hbc);
  assign wire59 = (~&(((-((8'hba) == wire55)) ?
                          {(wire56 ?
                                  wire57 : wire54)} : $unsigned(wire57[(4'hf):(3'h7)])) ?
                      {wire57,
                          wire57[(3'h4):(2'h2)]} : (^(wire55 <<< (wire55 || wire56)))));
  assign wire60 = {(~$unsigned($unsigned(((8'hba) ? (8'ha0) : wire59)))),
                      (wire59[(2'h2):(1'h1)] >> wire58)};
  always
    @(posedge clk) begin
      reg61 <= (~wire59);
      reg62 <= (~|{(reg61 ^~ (^{wire59, wire59}))});
    end
  always
    @(posedge clk) begin
      reg63 <= ((wire54 - $signed($unsigned((wire57 >> wire59)))) ?
          wire55 : {$signed($signed((^~wire56))), (8'hb6)});
      reg64 <= (($unsigned(wire54) <<< $unsigned($signed((wire59 ^ wire58)))) ?
          {{($unsigned(wire55) ?
                      {wire56} : (reg61 ?
                          wire57 : wire58))}} : $unsigned(wire60));
      reg65 <= wire58[(3'h7):(3'h4)];
    end
  assign wire66 = reg63;
  assign wire67 = $unsigned({$signed($unsigned((+reg64))),
                      ((+reg62[(5'h12):(3'h7)]) << wire60)});
  assign wire68 = wire58[(4'ha):(2'h3)];
  assign wire69 = wire66;
  assign wire70 = {$unsigned(reg61[(4'hc):(4'h9)]),
                      ($signed(wire54[(3'h6):(3'h6)]) <= (((8'hb3) != (~^wire66)) ?
                          wire54[(2'h3):(2'h3)] : (8'hac)))};
  assign wire71 = ((^$signed(((~|wire69) ?
                      ((8'ha9) ? reg62 : wire54) : {reg61}))) >>> wire60);
  assign wire72 = $signed(wire60[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg73 <= $signed(reg63);
      reg74 <= wire57;
    end
  assign wire75 = (({$unsigned($signed(wire66))} ?
                          ((wire72[(2'h3):(1'h1)] ?
                                  wire55[(3'h4):(3'h4)] : (wire56 ?
                                      wire69 : (8'haa))) ?
                              $unsigned((&wire67)) : {(8'h9e)}) : wire71[(4'h8):(1'h0)]) ?
                      wire71[(2'h3):(1'h1)] : (~&reg73));
  assign wire76 = (((((wire58 <= wire55) >= {reg63,
                              reg74}) && wire57[(4'hc):(3'h5)]) ?
                          $unsigned((~|(7'h43))) : $unsigned($signed($unsigned((8'ha5))))) ?
                      reg64 : $signed((wire70 ^~ wire54)));
  assign wire77 = $unsigned((~^(~^reg63)));
  assign wire78 = ((^~wire69) ^ $signed({($unsigned(wire77) ?
                          (|wire72) : ((8'ha9) ^ (8'ha7))),
                      (^reg65[(5'h11):(5'h10)])}));
  always
    @(posedge clk) begin
      reg79 <= (wire77 ?
          $unsigned({$unsigned($unsigned(wire58)),
              ($signed(reg73) ? $unsigned(wire76) : (-wire67))}) : (~^wire77));
      reg80 <= reg62[(3'h6):(1'h0)];
      reg81 <= (^({((~wire70) ? (reg63 > wire58) : ((7'h42) ? wire76 : wire59)),
              ((&reg61) + (!wire76))} ?
          (^reg65) : ((^wire59) ^ $signed((wire70 ? wire76 : wire57)))));
      reg82 <= (^wire58[(4'hd):(3'h7)]);
    end
  assign wire83 = (($signed({(&reg79)}) ?
                          (^wire55[(4'hb):(4'h9)]) : $signed($signed(wire71))) ?
                      (reg65[(5'h11):(4'h9)] ?
                          wire67[(3'h5):(1'h0)] : ($signed($unsigned(wire57)) ?
                              reg62 : (wire68 ?
                                  {wire76} : wire70))) : $unsigned(reg80));
  assign wire84 = ((8'hb5) * wire75[(3'h4):(3'h4)]);
  assign wire85 = (wire60[(1'h1):(1'h1)] > (|reg81[(3'h5):(3'h4)]));
endmodule
