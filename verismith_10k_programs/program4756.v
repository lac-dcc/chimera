module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h28f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire367;
  wire [(2'h2):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire161;
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  assign y = {wire367,
                 wire4,
                 wire5,
                 wire28,
                 wire29,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire161,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = $unsigned(wire2);
  always
    @(posedge clk) begin
      if ($signed((wire4 ?
          $unsigned((+$unsigned(wire1))) : $signed(wire5[(4'h9):(3'h6)]))))
        begin
          reg6 <= wire2[(2'h2):(1'h1)];
          reg7 <= ($unsigned((wire0[(4'hc):(4'hb)] | wire4)) >> (!$unsigned(wire0[(3'h6):(1'h0)])));
          reg8 <= (!($signed((~(reg7 >= wire2))) > ($unsigned((wire1 ~^ wire4)) ?
              $signed((wire5 <= wire0)) : {$signed(reg6)})));
          if ($unsigned(wire1))
            begin
              reg9 <= (!$unsigned($signed({$signed(wire1)})));
              reg10 <= (^~($signed(wire4[(2'h2):(1'h0)]) ?
                  $signed(wire1) : (~^(^(&reg9)))));
              reg11 <= ((~&$unsigned($signed($signed(reg8)))) ?
                  $signed(wire2[(2'h3):(1'h1)]) : wire5[(4'h9):(1'h0)]);
              reg12 <= (~&($signed($signed($unsigned(wire4))) ^ wire5[(1'h0):(1'h0)]));
            end
          else
            begin
              reg9 <= (~|((reg8 ?
                  ($signed(wire0) ?
                      $signed((8'hb8)) : reg8[(4'h9):(2'h2)]) : ({reg7,
                      wire1} < $signed(reg7))) < wire3[(1'h0):(1'h0)]));
              reg10 <= $signed(reg11[(2'h2):(1'h0)]);
            end
        end
      else
        begin
          if ($signed(wire4[(2'h2):(1'h0)]))
            begin
              reg6 <= {(((~|((7'h43) ? wire3 : (8'hb6))) == reg6) ?
                      reg12[(1'h0):(1'h0)] : (((+reg12) ?
                          reg10 : $signed((8'hb6))) <= (wire0[(3'h4):(1'h1)] >= $signed(wire4))))};
              reg7 <= $signed((($unsigned({reg9, wire2}) ?
                  $signed(wire4[(2'h2):(1'h0)]) : wire3[(3'h4):(2'h2)]) < (&$signed((reg8 ?
                  (8'hbd) : wire5)))));
              reg8 <= reg8;
              reg9 <= wire5[(1'h1):(1'h1)];
              reg10 <= (wire0 | $unsigned($unsigned($signed(wire3))));
            end
          else
            begin
              reg6 <= (~^$unsigned((reg8 ? reg10 : reg12[(3'h4):(3'h4)])));
              reg7 <= ($signed(((8'hb7) > ((-wire3) ?
                      reg12 : $unsigned((8'hb2))))) ?
                  ($unsigned($unsigned(reg8)) || $unsigned({$signed((8'haa)),
                      (reg11 > wire3)})) : (wire3 ?
                      ((^~$signed((8'hb9))) ?
                          (|reg12) : (reg8 ?
                              wire2[(1'h0):(1'h0)] : (wire3 == wire4))) : {{$signed(reg9),
                              $signed(wire5)}}));
              reg8 <= wire4;
              reg9 <= (wire0[(3'h4):(2'h2)] != $unsigned({$signed((wire1 ?
                      reg10 : (8'hb1)))}));
              reg10 <= $unsigned(($signed($unsigned((reg8 * reg12))) + ((reg12 ?
                      $unsigned(reg11) : wire3) ?
                  $signed($signed(wire3)) : (&$signed(wire0)))));
            end
          reg11 <= (+$signed((((reg6 & reg12) ?
              reg10 : $signed((8'hbb))) >> wire0[(4'hb):(2'h3)])));
          if ((8'ha4))
            begin
              reg12 <= (((8'hb9) ?
                      $unsigned(reg11[(1'h0):(1'h0)]) : reg7[(4'h8):(3'h7)]) ?
                  reg11[(3'h4):(2'h2)] : reg12);
              reg13 <= (~|(~^($unsigned(((8'ha2) ?
                  wire1 : reg6)) && $unsigned(wire3[(3'h4):(1'h0)]))));
              reg14 <= reg9;
            end
          else
            begin
              reg12 <= ((reg6[(3'h4):(2'h3)] ?
                  wire2[(2'h3):(2'h3)] : $unsigned($signed(wire4))) >>> (-($unsigned(wire0[(1'h0):(1'h0)]) ?
                  $signed((~^wire2)) : $signed((^(8'hb7))))));
            end
          reg15 <= ((reg13 ?
              ($signed((reg12 ? reg6 : reg10)) ?
                  wire0[(4'hd):(4'ha)] : {(reg14 ?
                          reg14 : reg12)}) : (($unsigned(reg7) >= $unsigned(wire5)) ?
                  wire5 : (reg6[(4'h8):(1'h1)] ~^ {reg6}))) < wire5[(2'h2):(2'h2)]);
          reg16 <= (^~({((wire0 ? wire2 : wire4) & wire5),
              $signed(wire2[(1'h1):(1'h0)])} && $signed(reg12)));
        end
      reg17 <= $signed((+$signed(wire2)));
      if ($signed($signed({reg6[(3'h5):(3'h5)]})))
        begin
          reg18 <= {(wire1[(4'h9):(1'h1)] >>> ($unsigned((wire4 ?
                      wire2 : reg6)) ?
                  reg12 : ($signed((8'ha3)) > (wire2 ? reg9 : reg10)))),
              reg14};
          if ($unsigned({($unsigned((reg14 * reg9)) <<< (reg13 <= (+reg8))),
              ($signed(reg13[(3'h5):(3'h4)]) ?
                  ($unsigned((8'ha7)) ?
                      $signed(wire3) : (-reg7)) : $signed((reg13 < reg8)))}))
            begin
              reg19 <= ($signed(reg13[(2'h2):(1'h0)]) >= reg14[(5'h13):(4'hd)]);
              reg20 <= $signed($unsigned($unsigned($signed(reg17[(3'h6):(3'h4)]))));
              reg21 <= $unsigned($unsigned($signed(reg6[(2'h2):(1'h1)])));
            end
          else
            begin
              reg19 <= $unsigned(reg16);
            end
          if ($unsigned($unsigned(reg8)))
            begin
              reg22 <= $unsigned($signed($unsigned($unsigned((+(8'h9e))))));
              reg23 <= wire1;
              reg24 <= $signed((reg17 ?
                  wire2 : {((reg12 ? (7'h40) : reg8) ?
                          reg8[(4'h9):(4'h8)] : (wire1 ? wire0 : wire0))}));
              reg25 <= $signed(((^reg6[(4'hd):(4'hd)]) << ({reg9,
                  $signed(reg11)} && (|reg10[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg22 <= $signed(((!reg16) ?
                  wire4[(1'h0):(1'h0)] : reg7[(5'h10):(3'h5)]));
            end
          reg26 <= ($unsigned((~wire1[(4'h9):(1'h0)])) || ((((~|reg16) ?
              (wire5 ?
                  reg11 : reg13) : wire3[(1'h1):(1'h1)]) >= reg9[(4'hd):(4'hd)]) > $unsigned(($signed(reg6) + $signed(reg12)))));
        end
      else
        begin
          if (reg26)
            begin
              reg18 <= reg9[(4'h8):(2'h2)];
              reg19 <= {$unsigned((!$signed(reg7[(2'h3):(2'h2)]))),
                  $signed((reg26 ?
                      ((wire0 ? reg22 : (8'hb0)) ?
                          (~|reg10) : wire2[(1'h1):(1'h0)]) : (|{(8'hb8)})))};
            end
          else
            begin
              reg18 <= wire0;
              reg19 <= reg14[(3'h6):(3'h6)];
              reg20 <= ((({(wire4 ? reg22 : reg23),
                      $unsigned(wire0)} & wire5) || (reg8[(5'h10):(2'h2)] >= $signed(wire2))) ?
                  $signed($unsigned(reg11)) : $unsigned(reg26));
              reg21 <= (^reg17);
              reg22 <= (($unsigned(wire5[(1'h1):(1'h1)]) ?
                  ($unsigned((~&reg12)) ?
                      wire4[(1'h0):(1'h0)] : $signed((reg19 ?
                          reg6 : reg23))) : reg7[(4'hf):(4'hc)]) * wire1);
            end
        end
      reg27 <= $unsigned($signed($unsigned($unsigned($unsigned(reg26)))));
    end
  assign wire28 = $unsigned(reg24[(2'h2):(1'h1)]);
  assign wire29 = $signed(reg19[(4'he):(1'h0)]);
  always
    @(posedge clk) begin
      if ($signed(reg9))
        begin
          reg30 <= ({{$signed($unsigned(reg26))},
              ((((8'hb5) ? reg8 : reg10) ? reg13 : reg15) ?
                  $signed((reg10 <= (8'h9d))) : $signed($signed(reg25)))} * {((7'h40) ?
                  reg20 : wire2)});
          if ($unsigned(({$unsigned((~|(8'hb9)))} & wire2)))
            begin
              reg31 <= wire3[(3'h4):(1'h1)];
            end
          else
            begin
              reg31 <= $signed($unsigned($signed(((~reg19) ?
                  $unsigned(wire28) : reg6[(2'h3):(1'h0)]))));
              reg32 <= ((|$unsigned({(~^(8'hb9)), (wire28 << reg13)})) ?
                  ((~^$signed((reg16 ?
                      wire29 : wire0))) ^ ($signed((reg8 ~^ reg13)) <<< reg12)) : (^((!{(8'ha1)}) ?
                      ((reg17 ^ wire28) ?
                          (reg12 ?
                              reg25 : (8'ha1)) : reg11[(3'h5):(2'h2)]) : (reg31 ?
                          (^wire3) : $unsigned(reg18)))));
              reg33 <= $signed(wire29[(2'h2):(2'h2)]);
              reg34 <= ({wire5[(2'h3):(2'h3)]} ?
                  reg6[(4'hc):(1'h0)] : ($unsigned($signed(reg13)) <= $signed((~wire5[(1'h1):(1'h1)]))));
              reg35 <= reg9[(4'ha):(1'h1)];
            end
          reg36 <= ((wire5[(4'hd):(3'h7)] ?
              $unsigned($unsigned({(8'ha3)})) : ((reg26 ?
                  (&reg24) : ((8'hb2) ?
                      reg9 : reg33)) * (~reg32))) << $signed($signed($unsigned($signed(wire29)))));
          reg37 <= $unsigned((8'ha7));
        end
      else
        begin
          reg30 <= $signed((|$signed(reg23[(4'hf):(4'h8)])));
          reg31 <= $unsigned(((reg31[(4'hb):(3'h4)] ^~ ((reg9 >>> reg19) ?
                  (-(8'hb6)) : {reg25, (8'hb8)})) ?
              $signed((((8'ha5) && reg13) ? reg10 : (~&wire29))) : (reg27 ?
                  (reg14 ? (~|reg24) : reg33) : $signed({(8'ha0)}))));
        end
      if ($signed((reg13[(4'h9):(4'h9)] ?
          (~|$unsigned(reg17[(1'h0):(1'h0)])) : ($signed(reg12[(4'hb):(2'h2)]) ?
              reg34[(5'h13):(4'he)] : $signed(wire2)))))
        begin
          reg38 <= ({{$signed((!wire5))},
              (reg32[(3'h6):(3'h6)] ^~ $unsigned((reg23 ?
                  wire0 : (8'ha0))))} >> $unsigned((reg21 ?
              {$unsigned(reg20), {reg18, reg6}} : $signed(((8'hb4) * reg36)))));
        end
      else
        begin
          reg38 <= (-$unsigned($unsigned((((7'h42) ? (7'h42) : (8'h9f)) ?
              (^reg10) : (~reg9)))));
        end
      reg39 <= (($unsigned((~|(|reg26))) ^ (^reg23[(4'hc):(4'hb)])) && $signed({(~|{(8'h9c)}),
          $unsigned((~|reg25))}));
      reg40 <= (^~(|$signed({(8'ha8), wire2[(2'h3):(1'h1)]})));
    end
  assign wire41 = (($signed({reg35[(2'h2):(1'h0)],
                      (reg6 <<< reg31)}) <<< reg17[(2'h3):(1'h1)]) ^~ reg32[(3'h6):(3'h4)]);
  assign wire42 = $signed((~^(^($unsigned(reg24) >> (reg11 ? reg14 : reg14)))));
  assign wire43 = ((~|(^(~|reg27))) >= reg16);
  assign wire44 = reg19[(3'h5):(2'h3)];
  assign wire45 = (((^~($signed((8'ha8)) ^~ (!reg24))) ?
                          $unsigned(($signed(reg24) <= (~^reg37))) : (8'hae)) ?
                      (^~reg15[(5'h10):(4'he)]) : (reg35[(2'h2):(1'h1)] ?
                          $unsigned(reg30[(5'h10):(4'h9)]) : (-(reg21[(3'h5):(3'h4)] ?
                              $unsigned(reg13) : (~^reg12)))));
  assign wire46 = {($unsigned(($signed((8'ha0)) >>> (!reg33))) < (reg27[(4'h9):(4'h8)] ?
                          (-{reg6}) : wire0[(4'hf):(3'h6)])),
                      ($signed($unsigned((8'hbb))) ?
                          wire1 : ((~|{reg12}) ?
                              ((+(8'hb8)) ?
                                  (|reg32) : {wire2,
                                      reg17}) : $unsigned($unsigned((8'ha3)))))};
  assign wire47 = {$unsigned(reg15[(5'h10):(4'hb)]), reg19[(1'h0):(1'h0)]};
  assign wire48 = wire1;
  assign wire49 = (reg27[(4'hb):(1'h1)] ?
                      wire48 : $unsigned(wire0[(1'h1):(1'h1)]));
  assign wire50 = {wire5};
  assign wire51 = (^~$signed(((~(wire5 ? reg24 : reg19)) == wire46)));
  assign wire52 = wire46[(3'h7):(3'h7)];
  module53 #() modinst162 (.y(wire161), .wire55(wire3), .wire57(reg32), .wire54(reg25), .wire58(reg24), .clk(clk), .wire56(reg18));
  module163 #() modinst368 (wire367, clk, reg31, reg8, reg27, wire46, wire50);
endmodule

module module163  (y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h29a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire168;
  input wire signed [(5'h15):(1'h0)] wire167;
  input wire [(5'h11):(1'h0)] wire166;
  input wire signed [(2'h3):(1'h0)] wire165;
  input wire [(4'hb):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire184;
  wire [(4'ha):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire196;
  wire [(2'h2):(1'h0)] wire197;
  wire [(4'hd):(1'h0)] wire237;
  wire [(4'hf):(1'h0)] wire241;
  wire [(4'hc):(1'h0)] wire242;
  wire [(5'h10):(1'h0)] wire310;
  wire [(5'h15):(1'h0)] wire312;
  wire [(4'hf):(1'h0)] wire313;
  wire signed [(4'hb):(1'h0)] wire314;
  wire signed [(3'h5):(1'h0)] wire315;
  wire signed [(3'h5):(1'h0)] wire316;
  wire signed [(5'h10):(1'h0)] wire317;
  wire [(5'h15):(1'h0)] wire348;
  reg [(3'h6):(1'h0)] reg366 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg365 = (1'h0);
  reg [(4'hc):(1'h0)] reg364 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg363 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg362 = (1'h0);
  reg [(3'h6):(1'h0)] reg361 = (1'h0);
  reg [(5'h11):(1'h0)] reg360 = (1'h0);
  reg [(4'ha):(1'h0)] reg359 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg358 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg357 = (1'h0);
  reg [(4'he):(1'h0)] reg356 = (1'h0);
  reg [(4'h9):(1'h0)] reg355 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg354 = (1'h0);
  reg [(3'h7):(1'h0)] reg353 = (1'h0);
  reg [(4'h9):(1'h0)] reg352 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg351 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg350 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg258 = (1'h0);
  reg [(3'h7):(1'h0)] reg257 = (1'h0);
  reg [(5'h14):(1'h0)] reg256 = (1'h0);
  reg [(4'ha):(1'h0)] reg255 = (1'h0);
  reg [(3'h5):(1'h0)] reg254 = (1'h0);
  reg [(5'h10):(1'h0)] reg253 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg252 = (1'h0);
  reg [(4'hc):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg250 = (1'h0);
  reg [(3'h5):(1'h0)] reg249 = (1'h0);
  reg [(3'h4):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg [(4'hf):(1'h0)] reg246 = (1'h0);
  reg [(5'h13):(1'h0)] reg245 = (1'h0);
  reg [(5'h12):(1'h0)] reg244 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg243 = (1'h0);
  reg [(4'hd):(1'h0)] reg240 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg239 = (1'h0);
  reg [(3'h6):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(3'h4):(1'h0)] reg193 = (1'h0);
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  assign y = {wire184,
                 wire169,
                 wire196,
                 wire197,
                 wire237,
                 wire241,
                 wire242,
                 wire310,
                 wire312,
                 wire313,
                 wire314,
                 wire315,
                 wire316,
                 wire317,
                 wire348,
                 reg366,
                 reg365,
                 reg364,
                 reg363,
                 reg362,
                 reg361,
                 reg360,
                 reg359,
                 reg358,
                 reg357,
                 reg356,
                 reg355,
                 reg354,
                 reg353,
                 reg352,
                 reg351,
                 reg350,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg240,
                 reg239,
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
                 (1'h0)};
  assign wire169 = wire166[(4'hd):(4'ha)];
  module170 #() modinst185 (wire184, clk, wire164, wire166, wire168, wire167, wire169);
  always
    @(posedge clk) begin
      reg186 <= wire167[(2'h2):(2'h2)];
      if ($signed(((~&($unsigned(reg186) ? $signed(wire164) : (~^(8'h9d)))) ?
          $signed(wire165) : ((^$unsigned(wire184)) & ($unsigned((8'hb6)) ?
              $unsigned(wire165) : $unsigned(wire165))))))
        begin
          reg187 <= wire165;
          reg188 <= ((($signed($signed(wire168)) <<< $signed({wire169,
              wire166})) || wire167[(5'h13):(3'h4)]) || (^($signed(((7'h44) >>> wire184)) ^ wire184[(1'h0):(1'h0)])));
          if ($unsigned(($signed((((8'h9f) ? reg188 : wire166) ?
              $unsigned(wire164) : reg188)) >> {$signed(wire166),
              ((+wire166) || $signed(wire169))})))
            begin
              reg189 <= reg186;
              reg190 <= {wire167};
              reg191 <= (wire166[(3'h5):(3'h4)] ~^ ($unsigned({(reg190 ?
                          wire164 : wire184),
                      wire184}) ?
                  (wire165[(2'h2):(1'h0)] ?
                      {$unsigned(wire169)} : reg188[(2'h3):(1'h1)]) : ({wire168,
                          (|(8'ha9))} ?
                      wire168 : wire184)));
              reg192 <= (wire168 * ({{((7'h40) && wire164)},
                      ((~&reg186) & (~wire168))} ?
                  ({$unsigned(wire169)} ?
                      $signed(wire168[(4'ha):(1'h0)]) : $signed(wire164)) : $signed(reg189[(1'h1):(1'h0)])));
            end
          else
            begin
              reg189 <= wire168;
              reg190 <= (8'h9d);
              reg191 <= ($unsigned($signed($unsigned((wire184 ?
                      (8'h9e) : reg187)))) ?
                  ($signed((|(~(8'hbc)))) ?
                      $signed($signed(reg189)) : (~^$unsigned((~|reg188)))) : $unsigned($unsigned(wire168[(4'ha):(3'h4)])));
              reg192 <= wire164[(3'h5):(3'h5)];
            end
          reg193 <= reg189;
        end
      else
        begin
          if (reg192)
            begin
              reg187 <= (reg192 == ((^($signed((8'ha7)) < (~reg193))) & $unsigned(wire166)));
              reg188 <= $unsigned((wire166[(3'h7):(1'h0)] && (({reg192} < {(8'ha5)}) ?
                  $unsigned(reg187) : wire184[(2'h2):(2'h2)])));
            end
          else
            begin
              reg187 <= $unsigned($unsigned(wire165));
              reg188 <= wire167[(4'hb):(4'ha)];
              reg189 <= (^$unsigned((7'h42)));
              reg190 <= $unsigned(wire169);
              reg191 <= (~|(&{$unsigned((reg191 ? (8'ha2) : wire168)),
                  ($unsigned(wire164) << (!reg189))}));
            end
          reg192 <= $signed($unsigned(($signed(reg192[(4'h8):(1'h0)]) <= wire165[(1'h1):(1'h0)])));
        end
      reg194 <= wire184;
      reg195 <= ((~^{wire169[(3'h6):(3'h4)],
          $unsigned((reg193 ? wire164 : reg190))}) <<< (8'ha5));
    end
  assign wire196 = wire165;
  assign wire197 = (({reg195} | (reg193[(1'h1):(1'h1)] ?
                           (8'hb9) : {((8'haa) << wire166),
                               (reg195 ? reg193 : reg195)})) ?
                       reg191[(1'h1):(1'h0)] : wire166);
  module198 #() modinst238 (.wire201(wire184), .y(wire237), .wire200(wire196), .clk(clk), .wire199(reg195), .wire202(reg194));
  always
    @(posedge clk) begin
      reg239 <= {((^$signed($signed(wire166))) ?
              wire197[(1'h0):(1'h0)] : (&(~&wire166[(4'hf):(4'hf)]))),
          {($signed(wire169[(3'h7):(3'h5)]) > reg194)}};
      reg240 <= (|wire168);
    end
  assign wire241 = reg195[(1'h1):(1'h1)];
  assign wire242 = wire167;
  always
    @(posedge clk) begin
      if ({(~&wire166)})
        begin
          if ($unsigned(({wire165} >> {wire169[(1'h0):(1'h0)],
              $unsigned((wire169 ? reg191 : wire242))})))
            begin
              reg243 <= $signed(wire242);
              reg244 <= {reg187[(2'h2):(1'h1)],
                  ((+$unsigned($unsigned(reg189))) && wire184)};
            end
          else
            begin
              reg243 <= $unsigned(($signed($signed((reg190 << reg195))) >> ((reg188[(1'h0):(1'h0)] ?
                  $unsigned(wire242) : (reg243 >>> reg189)) - (^(-wire169)))));
              reg244 <= reg189;
              reg245 <= wire166[(3'h7):(3'h4)];
              reg246 <= (&wire196[(3'h6):(3'h4)]);
              reg247 <= $signed($unsigned(($unsigned((reg193 ?
                  reg189 : wire166)) >>> reg245)));
            end
          reg248 <= (~&reg244[(4'hc):(2'h3)]);
          if ((!(~^((~^(reg247 ^~ wire184)) ?
              (^~reg239[(4'h9):(1'h1)]) : reg246[(1'h0):(1'h0)]))))
            begin
              reg249 <= ($unsigned(reg243[(3'h5):(3'h5)]) << reg190);
              reg250 <= (+(reg189 ?
                  {$unsigned((reg189 ?
                          reg240 : reg239))} : (|$signed((|reg247)))));
              reg251 <= (($unsigned(wire196) ?
                  (~^wire168) : (!$signed((~|(8'ha3))))) & (8'ha3));
              reg252 <= (reg245[(5'h10):(4'hf)] <<< $unsigned(reg246[(4'hd):(4'hd)]));
              reg253 <= $signed($signed($unsigned($unsigned(reg243))));
            end
          else
            begin
              reg249 <= ($unsigned(reg189) <<< ($signed(wire167) || ((^~(^~wire237)) ?
                  reg192 : $signed((reg247 - (8'haf))))));
            end
          reg254 <= $unsigned((~|wire168));
          reg255 <= (wire237 ?
              (reg250 ?
                  reg254[(2'h3):(2'h2)] : reg193[(1'h1):(1'h0)]) : ((~^$signed($unsigned((8'haa)))) & reg189[(1'h1):(1'h0)]));
        end
      else
        begin
          reg243 <= $signed($unsigned($unsigned((reg249[(1'h0):(1'h0)] && reg191))));
          reg244 <= ($signed($signed(((wire164 <<< wire242) ?
                  (reg251 && reg194) : (7'h40)))) ?
              $unsigned($signed((&{wire184, reg189}))) : reg246[(4'hf):(1'h1)]);
        end
      reg256 <= reg253;
      reg257 <= wire167[(3'h4):(2'h2)];
      reg258 <= $signed($unsigned({reg255, $signed((8'ha9))}));
    end
  module259 #() modinst311 (.wire263(reg253), .y(wire310), .wire262(reg249), .wire260(reg258), .wire261(reg195), .clk(clk));
  assign wire312 = reg247[(1'h0):(1'h0)];
  assign wire313 = (wire184 || ($unsigned({(~^(8'ha3)),
                       wire312}) >> ({$signed(reg187)} <<< reg240)));
  assign wire314 = $unsigned(wire166[(3'h6):(3'h6)]);
  assign wire315 = $signed((reg252 ?
                       $unsigned(wire184) : (~^(reg189 <= $signed(wire165)))));
  assign wire316 = reg192[(4'ha):(2'h3)];
  assign wire317 = (8'h9e);
  module318 #() modinst349 (wire348, clk, wire166, reg186, reg191, wire167, wire237);
  always
    @(posedge clk) begin
      reg350 <= $signed(($unsigned(reg191) && ((~|(+wire167)) + ($signed(wire164) * (reg194 ?
          (8'hac) : reg187)))));
      reg351 <= $unsigned((reg239[(3'h6):(2'h2)] ?
          $unsigned(wire164) : ($signed({wire166}) * ((reg240 ^~ (8'ha4)) != (reg188 ?
              wire196 : wire168)))));
      reg352 <= reg350;
      reg353 <= $unsigned(reg188);
      if (wire314[(1'h1):(1'h1)])
        begin
          reg354 <= wire312;
          reg355 <= $unsigned(reg239[(2'h3):(2'h2)]);
          reg356 <= (($signed(((~|reg252) ?
                  (~reg191) : reg244)) << ((wire310[(4'ha):(3'h6)] <= $unsigned(wire316)) ?
                  reg194[(2'h3):(2'h2)] : $signed((8'hbd)))) ?
              $signed((((+reg253) != $unsigned((8'haa))) < (reg244[(3'h4):(2'h3)] >= (+(8'hbc))))) : $unsigned((+$signed((~^wire242)))));
          reg357 <= (^$signed($unsigned(($signed(wire312) == reg351[(1'h1):(1'h1)]))));
          if (($signed((wire169 ?
              ((reg254 ^ wire313) ?
                  (8'hbe) : (^reg354)) : $signed($signed(wire167)))) <= reg254))
            begin
              reg358 <= $signed(reg243);
              reg359 <= (|{(~|(-(~^reg239))),
                  ((reg193 ? $signed(reg191) : (~^reg252)) & ($signed(reg353) ?
                      (~(8'hab)) : $unsigned(reg257)))});
              reg360 <= reg249;
            end
          else
            begin
              reg358 <= {{reg358[(4'h8):(3'h5)]},
                  {{(-{(8'hb0), wire315}), (reg249 ^ (~|reg351))}}};
              reg359 <= wire348;
            end
        end
      else
        begin
          reg354 <= (^~reg189[(1'h1):(1'h1)]);
          if (($unsigned((reg359 << $unsigned($unsigned(reg249)))) << $signed(wire165)))
            begin
              reg355 <= (($signed($unsigned(wire167[(4'ha):(3'h6)])) ?
                      $signed($unsigned((8'hb8))) : $signed(wire197)) ?
                  reg355 : $unsigned(reg240[(4'h9):(3'h4)]));
              reg356 <= wire196;
              reg357 <= reg353;
              reg358 <= $signed({reg255[(2'h2):(2'h2)]});
              reg359 <= $signed(reg358);
            end
          else
            begin
              reg355 <= ($signed((7'h43)) <= {(-(reg188[(3'h7):(1'h0)] < (reg194 ?
                      wire316 : wire313)))});
              reg356 <= wire314[(3'h6):(3'h5)];
            end
          if ({(8'hb5)})
            begin
              reg360 <= ((&($signed($signed(wire167)) ?
                  $signed((wire313 > reg351)) : (^(~reg243)))) << reg358);
              reg361 <= $signed((|(!(-(&wire184)))));
              reg362 <= reg354;
              reg363 <= $signed($signed($signed($unsigned((reg253 <= wire312)))));
              reg364 <= $unsigned(({((wire241 ^~ (8'ha4)) + $unsigned(reg239))} ?
                  reg250 : reg239[(3'h4):(3'h4)]));
            end
          else
            begin
              reg360 <= ({$unsigned(($unsigned((8'hb2)) ~^ (reg253 >>> wire317))),
                      $unsigned($signed($signed(wire237)))} ?
                  $unsigned({reg354[(4'h8):(2'h2)],
                      reg247[(5'h14):(3'h5)]}) : reg256);
              reg361 <= reg357;
              reg362 <= reg186[(1'h0):(1'h0)];
            end
          reg365 <= $unsigned($unsigned($signed(reg352[(2'h3):(2'h2)])));
          reg366 <= $signed($unsigned($unsigned($unsigned((reg194 ?
              reg359 : wire164)))));
        end
    end
endmodule

module module53  (y, clk, wire54, wire55, wire56, wire57, wire58);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire [(4'h9):(1'h0)] wire55;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire signed [(3'h5):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire157;
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire59,
                 wire60,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire115,
                 wire117,
                 wire118,
                 wire119,
                 wire157,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire59 = {(wire58 ^ $signed(wire55[(3'h4):(1'h1)])), wire57};
  assign wire60 = ($signed($unsigned(wire59)) != (~$unsigned($unsigned({wire57}))));
  always
    @(posedge clk) begin
      reg61 <= (&(!(~$signed((-wire57)))));
      reg62 <= ($signed({((wire57 ?
              wire59 : wire58) <= $unsigned(wire60))}) >= ($unsigned(wire57[(1'h1):(1'h1)]) ?
          {(8'hbd), $unsigned($signed(wire57))} : $signed(($signed(wire58) ?
              (wire57 >>> wire60) : (wire55 ? wire55 : wire58)))));
      reg63 <= $signed(((~&(wire55 ?
          $unsigned(wire59) : {wire58})) * {($signed(wire58) ~^ (&wire54))}));
      reg64 <= wire60[(1'h1):(1'h0)];
      reg65 <= $unsigned((($signed(wire59[(4'hc):(4'h8)]) >> $unsigned((reg61 ?
          reg63 : wire55))) << $signed({$unsigned((7'h43))})));
    end
  assign wire66 = $signed($unsigned(wire59[(4'h8):(3'h4)]));
  assign wire67 = $unsigned(reg61[(2'h2):(1'h1)]);
  assign wire68 = (~&((((reg62 ~^ wire59) ?
                      reg63[(3'h6):(2'h3)] : (~&reg63)) <= ((wire59 ?
                      wire59 : (8'ha3)) << (wire59 >= reg64))) != $signed(wire54[(1'h0):(1'h0)])));
  assign wire69 = $unsigned((+reg61[(4'h9):(2'h2)]));
  assign wire70 = reg63[(3'h4):(3'h4)];
  module71 #() modinst116 (.y(wire115), .wire75(wire58), .wire72(wire56), .wire76(reg64), .wire74(wire66), .clk(clk), .wire73(wire54));
  assign wire117 = (~^{(-({wire58} ?
                           reg63[(4'hf):(4'he)] : (wire115 ?
                               reg64 : wire55)))});
  assign wire118 = {$unsigned(reg65[(3'h7):(3'h5)]),
                       (&(((~&reg62) > reg62[(3'h4):(3'h4)]) ?
                           {{(8'hb0)}, $signed(wire60)} : ($unsigned(wire115) ?
                               (^wire56) : ((8'hae) ~^ wire68))))};
  assign wire119 = wire68;
  module120 #() modinst158 (wire157, clk, reg62, wire117, wire67, wire119);
  assign wire159 = (($signed(wire58) ?
                       ($signed((-wire54)) >>> (~$signed(wire118))) : (^((|wire119) <<< (wire118 >> wire68)))) < ($unsigned(({wire119,
                           reg64} ?
                       (~wire58) : wire118)) << reg61[(4'h9):(3'h5)]));
  assign wire160 = ($signed(($signed($signed(reg64)) ?
                       (!(^wire57)) : wire70)) && ($unsigned((|$signed(wire57))) ?
                       ((wire58 <<< (reg65 ? wire118 : reg62)) ?
                           (!(~(8'ha4))) : $signed({wire68})) : ({(wire69 | reg64)} >> (^~(wire69 > wire69)))));
endmodule

module module120
#(parameter param156 = ({((~&(^(8'haa))) ? (-(~&(8'h9d))) : (((8'hb7) < (8'hb6)) > {(8'hb7), (8'hb6)})), (~^(^(&(7'h41))))} ? ((&(((8'hac) >>> (7'h41)) * {(8'ha4)})) != (8'ha8)) : (&(((!(8'hb3)) ? ((8'ha9) && (8'ha0)) : (-(8'ha4))) | ((~(8'hba)) ? (&(8'ha4)) : (^~(8'ha6)))))))
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire124;
  input wire signed [(5'h11):(1'h0)] wire123;
  input wire signed [(3'h5):(1'h0)] wire122;
  input wire signed [(4'hb):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire152;
  wire signed [(2'h3):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire149;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
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
                 reg148,
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
  assign wire125 = $unsigned({wire123, {$signed((+wire122))}});
  assign wire126 = $signed((wire125 ?
                       $unsigned((+{wire125})) : (wire124[(3'h5):(1'h0)] ?
                           (~&wire121[(2'h3):(2'h3)]) : (~|(~wire124)))));
  assign wire127 = $signed((~|$signed((wire121 * wire121))));
  assign wire128 = wire124[(3'h5):(1'h1)];
  assign wire129 = $unsigned(wire126);
  assign wire130 = $signed(wire122);
  assign wire131 = ($unsigned($signed((wire125 ?
                       $unsigned((8'haf)) : wire127[(2'h2):(2'h2)]))) || $signed(wire126));
  assign wire132 = wire129;
  assign wire133 = $signed(wire131[(1'h0):(1'h0)]);
  assign wire134 = $signed(({$signed(wire123),
                       ($signed(wire124) ?
                           (8'h9f) : wire124)} + $signed(wire131[(1'h0):(1'h0)])));
  assign wire135 = (((^~(&wire133[(3'h6):(3'h4)])) + {wire126[(3'h6):(2'h3)]}) ?
                       (wire128 ?
                           wire127[(1'h0):(1'h0)] : $unsigned($signed((wire134 ?
                               wire128 : wire124)))) : $signed($signed((8'ha9))));
  always
    @(posedge clk) begin
      reg136 <= (($signed(wire130[(3'h6):(1'h1)]) ?
              $unsigned($signed($signed(wire130))) : wire122) ?
          (~((&((8'hab) ? wire129 : (8'hbf))) || ((wire135 + wire126) ?
              $signed(wire135) : (wire128 ?
                  wire122 : (8'h9f))))) : $unsigned(wire124[(1'h0):(1'h0)]));
      reg137 <= $unsigned((|$signed($signed($signed(wire134)))));
    end
  always
    @(posedge clk) begin
      reg138 <= wire124;
      if ((!$unsigned((({reg138, wire131} >> (~&wire135)) ?
          $signed((~wire125)) : $unsigned(wire133[(2'h2):(2'h2)])))))
        begin
          reg139 <= $unsigned(($signed($signed($unsigned(wire126))) ?
              ((8'ha6) <= reg138[(4'ha):(2'h3)]) : wire127[(1'h0):(1'h0)]));
          reg140 <= (($unsigned((~^(wire134 > (8'ha0)))) ?
                  (wire128[(3'h4):(3'h4)] ~^ wire124[(2'h2):(1'h0)]) : $unsigned(({reg136,
                          wire128} ?
                      (wire134 ? wire123 : (8'h9e)) : (wire135 ^ (8'had))))) ?
              (^(~&{wire129[(1'h0):(1'h0)],
                  wire135[(2'h3):(1'h0)]})) : ((wire122[(3'h5):(3'h4)] ?
                  wire122 : ((|wire131) ?
                      (!(8'h9f)) : $unsigned(wire127))) >= $unsigned(wire134)));
          reg141 <= {wire130, wire134};
          reg142 <= $unsigned(({((wire131 >>> wire124) ?
                      (reg141 >> wire130) : (!wire125)),
                  (&$unsigned(reg141))} ?
              $unsigned((8'hb7)) : ((8'h9f) >>> $signed($unsigned(wire130)))));
        end
      else
        begin
          if ($signed(reg139[(4'hf):(4'h8)]))
            begin
              reg139 <= $signed((!(~|(!reg139))));
              reg140 <= (reg141[(1'h1):(1'h0)] ?
                  ($unsigned(wire121[(3'h5):(3'h4)]) || wire134) : wire122);
              reg141 <= {$signed(wire131[(2'h3):(1'h1)])};
            end
          else
            begin
              reg139 <= $signed(($signed({$unsigned((8'ha3))}) && {$unsigned((wire134 ?
                      reg142 : wire129)),
                  (^(reg139 && (8'hbe)))}));
            end
        end
      if ($unsigned($signed($unsigned(reg142[(1'h0):(1'h0)]))))
        begin
          if (wire133)
            begin
              reg143 <= wire124;
              reg144 <= ($signed((~^$signed(wire129))) == ((wire127 ?
                  reg136 : $signed($signed(wire126))) >= ({(|wire123),
                      wire132} ?
                  wire124 : (8'hb1))));
            end
          else
            begin
              reg143 <= (+(!($signed($unsigned(wire122)) ?
                  ((wire133 == reg140) ?
                      ((8'hac) ?
                          wire123 : wire135) : $signed(reg141)) : $unsigned((reg137 && reg143)))));
              reg144 <= (~^$signed(reg142[(1'h0):(1'h0)]));
              reg145 <= $unsigned(wire133);
            end
        end
      else
        begin
          reg143 <= ((~wire125[(3'h4):(1'h1)]) ?
              wire132[(3'h7):(1'h1)] : reg138[(2'h3):(2'h3)]);
          if (((reg136 || (8'h9f)) ?
              (wire123[(4'hd):(1'h0)] ?
                  $signed(wire135[(3'h4):(2'h3)]) : (wire122 ?
                      {((8'hb3) | wire126),
                          wire132} : (8'hac))) : $unsigned($unsigned((8'ha2)))))
            begin
              reg144 <= ($unsigned((|($unsigned(wire129) ?
                  reg145 : reg144[(4'ha):(3'h7)]))) >> ($signed(((reg136 ?
                          wire135 : reg144) ?
                      wire132[(4'hf):(4'ha)] : $unsigned(wire128))) ?
                  wire133 : {$signed($signed(wire130))}));
              reg145 <= wire134;
              reg146 <= $unsigned(($unsigned(((-reg136) ?
                  {reg136} : $signed((8'ha7)))) != $unsigned(wire134[(4'ha):(4'ha)])));
              reg147 <= (reg138 ? (!wire124[(1'h0):(1'h0)]) : wire131);
              reg148 <= $signed(($signed({{reg140},
                  wire128}) <<< wire123[(3'h7):(3'h5)]));
            end
          else
            begin
              reg144 <= $signed($signed((-((wire133 ?
                  reg139 : wire131) ^ {reg145}))));
              reg145 <= (($signed((wire133[(3'h4):(1'h0)] != $unsigned(reg141))) ?
                  ($signed($unsigned(wire129)) || $signed($signed(wire125))) : (8'hb2)) >> $signed(((~&$signed(reg148)) >> wire133)));
              reg146 <= reg148[(2'h2):(1'h1)];
              reg147 <= (&$signed(wire134));
              reg148 <= ($signed((wire126[(3'h5):(3'h5)] < wire128)) == $unsigned((^~{$signed(wire132),
                  wire125})));
            end
        end
    end
  assign wire149 = $signed((($signed((wire134 + (8'hbb))) >= ($signed(wire124) || $signed((8'hb2)))) || {wire131[(2'h2):(1'h1)],
                       reg137}));
  assign wire150 = $signed((+{reg141[(2'h2):(1'h1)]}));
  assign wire151 = ({(($signed(reg147) >> $unsigned(reg140)) << $unsigned(reg144[(2'h3):(2'h3)]))} >> reg136[(4'h9):(2'h3)]);
  assign wire152 = ((~^$unsigned(wire126)) ?
                       wire129[(1'h1):(1'h1)] : wire149[(3'h4):(1'h1)]);
  assign wire153 = $unsigned({$signed(((~&reg147) ?
                           wire131 : (wire135 == wire121))),
                       $signed((~|$unsigned(reg137)))});
  assign wire154 = {(reg148 * ((|reg140[(4'hb):(3'h6)]) ?
                           (((8'hbb) < wire134) ?
                               (wire129 & (8'hbc)) : (wire152 || reg141)) : (^wire128))),
                       $unsigned((-($signed(reg142) & (~^wire150))))};
  assign wire155 = $signed((^wire131));
endmodule

module module71
#(parameter param113 = (((((~^(8'had)) ? ((8'hbf) ? (8'ha1) : (8'ha3)) : ((8'ha1) == (8'hb7))) == (((8'hac) ^ (7'h44)) && (8'hbf))) ? (~^{((8'hbb) ~^ (8'hb1))}) : ((~((8'hab) ? (8'hba) : (8'hbf))) ? (((8'ha3) ? (8'ha9) : (8'ha0)) ? (^~(8'hbb)) : ((8'ha7) ? (8'ha3) : (8'ha1))) : (~((8'hbc) > (8'ha4))))) ? {((|(8'hbb)) >> (^~(^(8'h9d))))} : (~|({((8'haa) << (8'hbf)), ((8'hbd) ? (8'hae) : (8'hb3))} ? (~&((8'hb6) ? (8'h9e) : (8'hb4))) : {((8'hb9) ? (8'hbe) : (8'hba))}))), 
parameter param114 = ((((param113 > (~|param113)) < (param113 ? (param113 || (8'ha8)) : param113)) > (+{param113, (+param113)})) ? {(param113 == (~&param113))} : (^(param113 <= ({param113, param113} ? (-param113) : {param113, param113})))))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire76;
  input wire [(4'hb):(1'h0)] wire75;
  input wire [(4'hf):(1'h0)] wire74;
  input wire [(5'h15):(1'h0)] wire73;
  input wire signed [(2'h2):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire77;
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire87,
                 wire80,
                 wire77,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire77 = $signed(($signed((wire72 ? (^wire75) : (-(8'hb9)))) ?
                      wire73 : $unsigned(wire76[(4'hc):(4'ha)])));
  always
    @(posedge clk) begin
      reg78 <= (&wire76[(3'h4):(2'h3)]);
      reg79 <= $unsigned((wire76[(4'h8):(3'h5)] ?
          wire74[(4'he):(3'h4)] : $unsigned($signed((wire73 ?
              wire77 : wire76)))));
    end
  assign wire80 = (reg79 * (8'h9c));
  always
    @(posedge clk) begin
      reg81 <= reg79[(3'h5):(2'h2)];
      reg82 <= (($signed(((^wire80) == (wire76 ?
          wire77 : wire73))) >= ($signed((wire76 ?
          (7'h40) : wire74)) - ((~^reg81) ?
          wire73[(4'hc):(3'h5)] : reg79))) < $unsigned($signed(reg78[(1'h0):(1'h0)])));
      reg83 <= wire73[(4'h9):(3'h7)];
      if ($unsigned((8'ha1)))
        begin
          reg84 <= $unsigned((!(wire73[(4'ha):(3'h7)] ?
              ({reg81, (8'hb0)} ?
                  (wire73 * wire77) : (reg79 ?
                      (8'ha1) : reg83)) : (wire75[(3'h4):(2'h3)] < reg83))));
          reg85 <= $unsigned($signed((wire77 ?
              (~&wire74[(4'hd):(4'hd)]) : $unsigned($signed(wire80)))));
        end
      else
        begin
          reg84 <= $signed(wire75);
        end
      reg86 <= ($unsigned((wire76 ?
              ((8'ha1) == (reg83 ?
                  reg85 : reg82)) : $unsigned($signed(reg78)))) ?
          (wire72 ?
              $unsigned((~^(7'h42))) : ((wire75[(4'h8):(2'h3)] ?
                      (reg84 & reg78) : $unsigned((8'hb2))) ?
                  reg81[(4'h8):(2'h2)] : reg83[(4'hc):(4'hb)])) : $signed((-($signed(wire75) ?
              $unsigned(wire73) : (^(8'hb6))))));
    end
  assign wire87 = reg79;
  always
    @(posedge clk) begin
      if ((($unsigned($signed(reg78[(2'h2):(1'h0)])) ?
          ((8'hb3) | $signed(reg78)) : {(!wire87)}) != ((reg82[(2'h3):(1'h1)] <= wire77[(3'h5):(1'h1)]) ?
          $unsigned($unsigned(reg83)) : $signed((reg78[(3'h5):(3'h5)] ?
              (+reg81) : ((8'hb6) == reg85))))))
        begin
          reg88 <= reg84;
          reg89 <= $signed(reg84[(2'h2):(2'h2)]);
          if ($signed($signed($signed($signed($signed(reg88))))))
            begin
              reg90 <= ({reg78} ?
                  reg83[(4'h9):(3'h4)] : $unsigned(reg82[(5'h11):(4'h8)]));
              reg91 <= (reg81[(3'h4):(1'h0)] ?
                  (~|reg84[(3'h6):(3'h6)]) : (({(reg83 && (8'h9f))} ?
                      wire75[(1'h1):(1'h0)] : (^~$signed(reg90))) == $signed($unsigned((^~(8'ha1))))));
            end
          else
            begin
              reg90 <= $unsigned(wire77[(3'h5):(3'h4)]);
              reg91 <= $unsigned($unsigned(($unsigned((-(8'ha5))) ?
                  reg90[(3'h4):(1'h0)] : (~^$unsigned(wire73)))));
              reg92 <= (reg91[(1'h1):(1'h1)] == $signed((wire80[(4'ha):(1'h1)] ?
                  reg81 : $signed((8'had)))));
              reg93 <= (($signed((8'ha5)) ?
                  $unsigned(reg88[(2'h3):(2'h3)]) : (!$unsigned(reg89))) ^ $signed($unsigned((^reg92[(2'h3):(1'h1)]))));
              reg94 <= (reg85[(3'h6):(2'h2)] <= (~(reg78[(2'h3):(2'h3)] > wire77[(1'h1):(1'h0)])));
            end
          reg95 <= reg82[(3'h7):(2'h2)];
        end
      else
        begin
          reg88 <= $unsigned({wire76});
          reg89 <= $unsigned({(&(8'hae))});
          reg90 <= $unsigned(wire77[(2'h3):(2'h3)]);
          reg91 <= (wire74 ?
              (~|($signed((8'hb4)) ?
                  $unsigned(reg83) : $signed($signed(reg83)))) : (wire74[(4'hf):(1'h1)] ?
                  reg92[(4'hc):(3'h5)] : reg93[(3'h4):(1'h0)]));
          if ((7'h43))
            begin
              reg92 <= $signed(($signed(($unsigned(reg79) ?
                  $unsigned((8'ha5)) : {reg95})) + ($unsigned($signed(wire87)) ?
                  wire72[(2'h2):(2'h2)] : ((!wire76) <= {(8'hb0)}))));
              reg93 <= (8'hb9);
              reg94 <= wire80;
            end
          else
            begin
              reg92 <= reg83;
              reg93 <= ((8'ha7) > reg78[(3'h5):(2'h2)]);
              reg94 <= ((((^(reg84 >> wire75)) ?
                      ($signed((8'h9f)) | (~^reg84)) : $signed((+reg94))) ?
                  (((&(8'ha7)) ? wire72 : (reg91 | reg81)) ?
                      (|(!reg89)) : {(+wire77),
                          $signed(reg79)}) : reg84[(3'h5):(2'h3)]) <= wire73);
            end
        end
      reg96 <= reg79;
      reg97 <= wire77[(3'h4):(2'h3)];
      reg98 <= reg85[(4'h8):(4'h8)];
      reg99 <= $signed(((($unsigned(reg95) ?
          ((7'h41) ?
              wire73 : (8'hba)) : reg97[(1'h0):(1'h0)]) <<< wire80[(4'ha):(4'ha)]) + (~&wire77[(3'h6):(3'h6)])));
    end
  assign wire100 = ((reg91 ?
                       (reg84 >>> reg88[(2'h2):(1'h1)]) : {reg93}) <<< {reg92[(4'ha):(4'ha)],
                       wire72[(2'h2):(1'h1)]});
  assign wire101 = ((({$signed(reg91), (|wire100)} - ((~^reg78) ?
                           reg81[(4'ha):(3'h5)] : {wire100,
                               reg94})) < (wire77[(2'h2):(2'h2)] <= reg89[(3'h4):(2'h2)])) ?
                       ($signed((~|reg84)) ^ reg81) : ((^$unsigned((reg89 ~^ reg90))) ~^ ($unsigned($unsigned(wire74)) > (~&{(8'hbb),
                           (8'h9e)}))));
  assign wire102 = $signed((((~|wire72[(1'h1):(1'h0)]) ^~ (~&$signed(reg98))) ?
                       $unsigned(($signed((8'h9f)) ?
                           ((8'h9c) ?
                               wire72 : reg92) : $unsigned(reg79))) : ((^(&wire80)) ?
                           (^(reg85 ?
                               wire80 : reg95)) : wire101[(1'h0):(1'h0)])));
  assign wire103 = (($unsigned(((reg83 ? reg95 : (8'hb5)) ?
                           ((8'hae) ? wire74 : (8'hbe)) : $signed(reg92))) ?
                       ($signed(reg97[(3'h4):(2'h3)]) ?
                           reg81[(1'h1):(1'h1)] : reg99[(4'hb):(1'h0)]) : $unsigned($unsigned($signed(reg84)))) ~^ ((^~{$signed(reg97)}) ?
                       (+((reg93 + wire72) ? (^~(8'haf)) : reg93)) : reg95));
  assign wire104 = reg86;
  assign wire105 = (8'ha2);
  assign wire106 = wire74[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg107 <= {reg97[(2'h3):(2'h2)]};
      reg108 <= $signed($signed((~&reg84)));
      reg109 <= wire72[(1'h1):(1'h1)];
      reg110 <= (-(((wire72 && (wire87 <<< (8'hb1))) - $unsigned(wire100[(1'h0):(1'h0)])) * $signed(({reg82,
          reg85} << $unsigned(wire73)))));
    end
  assign wire111 = (reg78[(1'h0):(1'h0)] ?
                       ($signed(((8'ha0) ? (~&wire75) : {wire101})) ?
                           ($unsigned((wire73 >>> reg95)) ?
                               (~|(reg108 ^ wire73)) : {$signed(reg82),
                                   (&(8'hb4))}) : (reg81 && $unsigned($signed(wire106)))) : reg90);
  assign wire112 = reg97[(3'h4):(3'h4)];
endmodule

module module318  (y, clk, wire323, wire322, wire321, wire320, wire319);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire323;
  input wire [(2'h3):(1'h0)] wire322;
  input wire signed [(4'hc):(1'h0)] wire321;
  input wire signed [(5'h12):(1'h0)] wire320;
  input wire signed [(4'ha):(1'h0)] wire319;
  wire signed [(4'hd):(1'h0)] wire347;
  wire signed [(5'h13):(1'h0)] wire346;
  wire [(2'h2):(1'h0)] wire338;
  wire signed [(4'he):(1'h0)] wire337;
  wire signed [(4'h9):(1'h0)] wire336;
  wire [(4'he):(1'h0)] wire335;
  wire [(5'h15):(1'h0)] wire334;
  wire signed [(5'h14):(1'h0)] wire333;
  wire [(4'hb):(1'h0)] wire332;
  wire signed [(4'hc):(1'h0)] wire331;
  wire [(5'h10):(1'h0)] wire330;
  wire signed [(5'h12):(1'h0)] wire329;
  wire [(5'h11):(1'h0)] wire328;
  wire signed [(5'h15):(1'h0)] wire327;
  wire signed [(3'h5):(1'h0)] wire326;
  wire [(5'h10):(1'h0)] wire325;
  wire [(4'h9):(1'h0)] wire324;
  reg [(4'hc):(1'h0)] reg345 = (1'h0);
  reg [(2'h2):(1'h0)] reg344 = (1'h0);
  reg [(4'ha):(1'h0)] reg343 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg342 = (1'h0);
  reg [(4'ha):(1'h0)] reg341 = (1'h0);
  reg [(4'ha):(1'h0)] reg340 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg339 = (1'h0);
  assign y = {wire347,
                 wire346,
                 wire338,
                 wire337,
                 wire336,
                 wire335,
                 wire334,
                 wire333,
                 wire332,
                 wire331,
                 wire330,
                 wire329,
                 wire328,
                 wire327,
                 wire326,
                 wire325,
                 wire324,
                 reg345,
                 reg344,
                 reg343,
                 reg342,
                 reg341,
                 reg340,
                 reg339,
                 (1'h0)};
  assign wire324 = ((wire319[(1'h1):(1'h0)] == wire319) ?
                       (({$unsigned((8'haf)),
                           ((7'h44) ?
                               wire319 : (8'ha5))} & ((^(8'h9c)) * (-wire321))) && ($signed(((8'hb4) ^~ wire322)) ?
                           wire320 : wire320)) : $signed((8'ha9)));
  assign wire325 = ((^~(wire321[(2'h3):(2'h2)] > ({(8'ha4), wire321} ?
                           $unsigned(wire319) : (8'hb2)))) ?
                       (^wire323[(1'h1):(1'h1)]) : $unsigned($unsigned(((~^wire323) ?
                           {wire324} : wire323[(1'h0):(1'h0)]))));
  assign wire326 = {wire320};
  assign wire327 = (^~wire325);
  assign wire328 = (wire320 ? wire326[(1'h0):(1'h0)] : $signed(wire322));
  assign wire329 = wire326;
  assign wire330 = ($unsigned({$signed($unsigned(wire329))}) ?
                       $signed(wire327) : $signed($unsigned(wire323)));
  assign wire331 = wire327[(5'h15):(5'h12)];
  assign wire332 = $unsigned($signed(wire326[(1'h1):(1'h1)]));
  assign wire333 = (+($unsigned($unsigned((wire329 > wire325))) >>> (^$unsigned($unsigned((7'h41))))));
  assign wire334 = wire326;
  assign wire335 = wire331;
  assign wire336 = ((|(($unsigned(wire335) >= wire323[(3'h4):(1'h0)]) ?
                           $signed($unsigned((8'hb7))) : (~wire332))) ?
                       wire332 : ((8'hb7) << ($signed((wire321 >= wire334)) << (^~wire329[(5'h10):(3'h6)]))));
  assign wire337 = (+(wire322 * (8'ha1)));
  assign wire338 = (~^$unsigned(wire336[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if (wire327[(1'h0):(1'h0)])
        begin
          reg339 <= (wire337[(4'h9):(3'h4)] ?
              ((&(~(wire337 ? wire335 : wire319))) ?
                  ((~&(wire321 ?
                      wire338 : wire331)) << $signed((!wire328))) : wire336[(3'h4):(1'h1)]) : wire321);
        end
      else
        begin
          reg339 <= wire322[(2'h3):(1'h0)];
          reg340 <= (wire332[(2'h3):(1'h1)] ?
              $unsigned(((8'ha0) ?
                  wire323 : $unsigned(reg339))) : wire330[(4'h8):(2'h2)]);
        end
      reg341 <= (^~$unsigned((reg339[(2'h2):(1'h0)] ?
          {$unsigned(wire327)} : $signed({wire324, (8'hbf)}))));
      reg342 <= $signed(wire327);
      reg343 <= reg340[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg344 <= {((wire327[(2'h3):(1'h1)] ~^ wire331[(2'h3):(1'h1)]) <= $unsigned((((8'hba) | wire325) ?
              wire323 : wire320)))};
      reg345 <= $signed($signed($signed((8'hb6))));
    end
  assign wire346 = (!$signed((&$unsigned((&wire330)))));
  assign wire347 = (wire332 <<< ({(wire332[(3'h4):(1'h0)] | wire320)} ?
                       wire328[(1'h1):(1'h1)] : (~reg345)));
endmodule

module module259
#(parameter param308 = (((~^(|((8'haf) ? (8'haa) : (8'ha6)))) ? (&(8'ha2)) : ((((7'h44) >> (8'haa)) << ((8'h9f) - (8'ha9))) ? (+((8'hb3) ^ (8'hba))) : {(|(7'h40))})) ? (+((~|((8'hab) ? (8'hb0) : (7'h40))) > (^~((8'ha3) ? (8'hbb) : (8'ha9))))) : ({((+(7'h41)) >= ((8'ha5) || (8'hb6)))} >= (~|({(8'hb1)} >= ((8'hbe) << (8'ha2)))))), 
parameter param309 = (param308 <= param308))
(y, clk, wire263, wire262, wire261, wire260);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire263;
  input wire signed [(3'h5):(1'h0)] wire262;
  input wire [(3'h4):(1'h0)] wire261;
  input wire signed [(5'h11):(1'h0)] wire260;
  wire signed [(5'h14):(1'h0)] wire307;
  wire [(4'hc):(1'h0)] wire306;
  wire [(2'h3):(1'h0)] wire305;
  wire signed [(4'he):(1'h0)] wire304;
  wire [(4'he):(1'h0)] wire271;
  wire [(3'h5):(1'h0)] wire270;
  wire [(4'hf):(1'h0)] wire269;
  wire [(4'he):(1'h0)] wire268;
  wire signed [(3'h6):(1'h0)] wire267;
  wire signed [(4'he):(1'h0)] wire266;
  wire signed [(4'hd):(1'h0)] wire265;
  wire [(2'h2):(1'h0)] wire264;
  reg signed [(5'h13):(1'h0)] reg303 = (1'h0);
  reg [(4'he):(1'h0)] reg302 = (1'h0);
  reg [(3'h5):(1'h0)] reg301 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg300 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg299 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg298 = (1'h0);
  reg [(5'h14):(1'h0)] reg297 = (1'h0);
  reg [(5'h11):(1'h0)] reg296 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg295 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg294 = (1'h0);
  reg signed [(4'he):(1'h0)] reg293 = (1'h0);
  reg [(2'h2):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg291 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg290 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg289 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg288 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg287 = (1'h0);
  reg [(2'h2):(1'h0)] reg286 = (1'h0);
  reg [(4'hc):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg284 = (1'h0);
  reg [(4'he):(1'h0)] reg283 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg282 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg281 = (1'h0);
  reg [(4'he):(1'h0)] reg280 = (1'h0);
  reg [(4'ha):(1'h0)] reg279 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg278 = (1'h0);
  reg [(5'h13):(1'h0)] reg277 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg276 = (1'h0);
  reg [(5'h14):(1'h0)] reg275 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg274 = (1'h0);
  reg [(4'hf):(1'h0)] reg273 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg272 = (1'h0);
  assign y = {wire307,
                 wire306,
                 wire305,
                 wire304,
                 wire271,
                 wire270,
                 wire269,
                 wire268,
                 wire267,
                 wire266,
                 wire265,
                 wire264,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 (1'h0)};
  assign wire264 = (^~$signed($unsigned({((8'hb6) && wire262)})));
  assign wire265 = wire263[(1'h1):(1'h1)];
  assign wire266 = wire264;
  assign wire267 = (~wire262[(3'h5):(2'h3)]);
  assign wire268 = wire263[(3'h5):(2'h3)];
  assign wire269 = (wire260[(3'h5):(1'h1)] ^~ $signed((^$unsigned(wire264[(1'h0):(1'h0)]))));
  assign wire270 = wire260;
  assign wire271 = $signed($signed($unsigned((wire268[(1'h1):(1'h0)] || $unsigned(wire266)))));
  always
    @(posedge clk) begin
      if ((8'hbc))
        begin
          reg272 <= $unsigned($signed($unsigned($unsigned($signed(wire262)))));
          if (wire265[(4'ha):(3'h5)])
            begin
              reg273 <= wire270;
              reg274 <= reg272;
              reg275 <= (8'h9d);
              reg276 <= (!reg275[(2'h3):(2'h2)]);
              reg277 <= reg276[(4'h9):(2'h3)];
            end
          else
            begin
              reg273 <= $signed(((wire266[(1'h1):(1'h0)] > wire263) ?
                  (~&$unsigned($signed(wire263))) : wire268[(2'h2):(2'h2)]));
              reg274 <= (wire267 ?
                  {reg275} : {(wire265 ?
                          (~^(wire262 < wire270)) : ($signed(reg274) * $signed(wire262))),
                      (|$signed(wire260))});
            end
          if ((7'h44))
            begin
              reg278 <= (($unsigned(($signed(wire271) ~^ $signed(reg275))) ?
                  ($unsigned(wire265) <= $signed((reg273 ^~ wire263))) : reg276[(3'h6):(2'h3)]) & (8'hae));
              reg279 <= (wire263 ? reg272[(1'h1):(1'h1)] : wire268);
            end
          else
            begin
              reg278 <= $signed((^~$signed(((!reg278) << $unsigned(reg275)))));
              reg279 <= ({($unsigned((reg273 != wire267)) ~^ {$unsigned((8'hb5))})} == reg276[(4'hf):(3'h5)]);
              reg280 <= (wire267 ?
                  {$signed(((~|reg274) ? {wire270} : wire269)),
                      $signed(($unsigned(reg276) == ((8'ha8) ?
                          wire268 : (8'h9f))))} : reg274[(4'ha):(3'h6)]);
              reg281 <= $unsigned($signed((~^$unsigned({wire262, wire268}))));
            end
        end
      else
        begin
          if ((~reg275))
            begin
              reg272 <= $unsigned(wire269);
              reg273 <= (~&(|($signed((-wire262)) ^~ reg274[(3'h6):(3'h4)])));
              reg274 <= $unsigned(wire270[(2'h2):(2'h2)]);
              reg275 <= wire263;
              reg276 <= (reg279 ? reg281[(2'h2):(1'h0)] : (8'ha3));
            end
          else
            begin
              reg272 <= (-$unsigned(({(+wire271),
                  {reg273, (8'hb2)}} | $signed($unsigned(reg276)))));
            end
          if ($unsigned($signed($signed(((~&(8'ha0)) > $unsigned(wire268))))))
            begin
              reg277 <= wire269[(1'h1):(1'h0)];
              reg278 <= reg272;
              reg279 <= $signed(wire269);
            end
          else
            begin
              reg277 <= reg273[(1'h1):(1'h1)];
            end
          if ((~&reg278[(3'h4):(2'h2)]))
            begin
              reg280 <= ((|((^~(reg276 ^~ reg276)) ?
                  ((~&reg273) <<< (8'hbd)) : (~|(-reg273)))) == wire263[(4'hd):(4'hd)]);
              reg281 <= wire270[(3'h5):(1'h0)];
              reg282 <= wire267[(2'h3):(1'h1)];
              reg283 <= $signed($unsigned((^~{{(8'hab), (8'hac)}, {reg282}})));
              reg284 <= wire271;
            end
          else
            begin
              reg280 <= {(^wire260)};
              reg281 <= reg275;
              reg282 <= (8'hb8);
            end
          reg285 <= reg282[(1'h0):(1'h0)];
          if ($signed($signed(wire265[(4'h9):(3'h6)])))
            begin
              reg286 <= (~^{wire268[(4'ha):(1'h1)]});
              reg287 <= wire267;
            end
          else
            begin
              reg286 <= $signed($signed(reg276));
              reg287 <= ($signed(reg272) - reg284[(4'hd):(2'h3)]);
              reg288 <= wire261[(1'h0):(1'h0)];
              reg289 <= (-($unsigned((8'hab)) ?
                  {wire264,
                      ((reg280 ? (7'h40) : reg285) ?
                          wire269[(4'h8):(1'h1)] : (wire261 ?
                              reg282 : wire266))} : ($signed($unsigned(reg272)) ?
                      $unsigned((wire265 ?
                          reg280 : wire269)) : reg273[(4'hb):(4'h8)])));
              reg290 <= $signed($unsigned(wire263));
            end
        end
      if ((wire270 <<< $unsigned({reg278[(2'h3):(2'h3)]})))
        begin
          reg291 <= wire271;
          reg292 <= wire265;
        end
      else
        begin
          reg291 <= ($signed($signed(reg286)) ^ reg272);
        end
      if (wire268)
        begin
          reg293 <= $signed((reg285 ?
              $signed((reg284 < (!reg275))) : ((reg291[(1'h1):(1'h1)] || {wire268,
                  wire268}) != $unsigned((8'hb0)))));
          if (wire269[(4'h8):(3'h5)])
            begin
              reg294 <= $signed({(reg280 >>> ($signed(reg272) * $unsigned(reg281)))});
              reg295 <= $unsigned(((-$unsigned(wire265[(3'h6):(3'h6)])) <= $signed({(reg288 + (7'h40))})));
            end
          else
            begin
              reg294 <= (&((reg282[(1'h0):(1'h0)] != ((wire261 ?
                  wire268 : wire267) ^ (reg286 ?
                  reg282 : (7'h44)))) >= reg274[(3'h4):(1'h0)]));
              reg295 <= $signed(reg289);
              reg296 <= ((8'hbf) ?
                  $unsigned(wire269) : $unsigned({$signed(wire262),
                      {(wire266 ? wire268 : reg277), (reg279 * reg273)}}));
            end
        end
      else
        begin
          reg293 <= $unsigned($signed(((reg274[(1'h1):(1'h0)] == reg279) < ((wire261 ?
                  reg295 : (8'haa)) ?
              (&(8'ha1)) : (&wire267)))));
          reg294 <= ($unsigned(((-wire268[(3'h6):(3'h4)]) ?
                  ($signed(reg279) < (-(8'h9d))) : ($signed(reg286) + {reg279,
                      reg273}))) ?
              reg293 : reg279);
        end
      if (reg293[(4'hc):(1'h0)])
        begin
          reg297 <= reg289;
          if (wire267[(2'h3):(2'h2)])
            begin
              reg298 <= ($unsigned(reg289[(1'h1):(1'h1)]) + (wire261[(1'h0):(1'h0)] <<< {(reg286 && (wire264 ?
                      wire267 : wire263)),
                  (reg276 ? (reg285 >> reg284) : wire263)}));
              reg299 <= {(reg293 ?
                      (reg277 ?
                          {((8'ha5) + wire262)} : ($unsigned(wire271) & (~|reg294))) : (wire267[(3'h6):(3'h5)] ?
                          ((wire264 ?
                              wire262 : wire266) - $signed(wire267)) : $signed((wire267 ?
                              wire269 : (8'ha8)))))};
              reg300 <= (($unsigned((!(reg297 && reg278))) ?
                  (~{$signed(reg285), (~|reg293)}) : $signed($signed((reg281 ?
                      wire271 : reg276)))) < {$unsigned($signed(reg284)),
                  ($signed($signed((8'hb8))) > ($unsigned((8'hbe)) + wire270))});
              reg301 <= $signed($unsigned($unsigned((reg282 * $unsigned((8'hbc))))));
            end
          else
            begin
              reg298 <= {((~&reg290[(2'h2):(1'h0)]) != reg276[(5'h14):(5'h11)])};
            end
          reg302 <= (reg290[(2'h2):(1'h1)] < (!$unsigned(reg285[(3'h6):(1'h0)])));
        end
      else
        begin
          reg297 <= reg291;
        end
      reg303 <= (|$unsigned(($signed((+(8'h9d))) | (|$unsigned(reg282)))));
    end
  assign wire304 = $unsigned(((((wire263 & (7'h40)) >>> reg296) != wire262) + (reg298[(3'h7):(2'h2)] > reg283)));
  assign wire305 = $signed(($signed($unsigned(reg297[(3'h4):(2'h3)])) ^ (|($signed((8'hb2)) ?
                       $unsigned(wire266) : (~|reg299)))));
  assign wire306 = $unsigned((~^(~^(reg276 || (!reg281)))));
  assign wire307 = (8'hbe);
endmodule

module module198
#(parameter param236 = ((~|{({(8'ha3), (8'ha8)} - ((8'h9c) ? (8'hb5) : (8'ha9)))}) ? (({(8'ha6)} ? ((~&(8'hbc)) ? ((8'hbd) < (8'hab)) : ((8'hbc) | (8'ha3))) : (((8'hb7) ? (8'hb1) : (8'hb4)) ~^ (~&(8'hb9)))) ? ((^~((8'hbf) < (8'h9c))) & ((8'ha9) ? ((8'hbb) || (8'hbd)) : ((8'hb9) ? (8'ha2) : (8'haa)))) : (~(~{(8'ha3), (8'hb6)}))) : (+((((8'h9c) * (8'h9d)) ~^ ((8'ha1) ? (8'ha0) : (7'h43))) ? (((8'hae) ? (8'hbc) : (7'h41)) | ((8'h9c) || (8'ha6))) : (((8'hbf) * (8'ha5)) ? ((8'hb1) <= (8'hbd)) : (~|(8'hbe)))))))
(y, clk, wire202, wire201, wire200, wire199);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire202;
  input wire signed [(3'h5):(1'h0)] wire201;
  input wire signed [(4'hb):(1'h0)] wire200;
  input wire [(3'h6):(1'h0)] wire199;
  wire [(4'h9):(1'h0)] wire219;
  wire signed [(4'hb):(1'h0)] wire218;
  wire [(3'h6):(1'h0)] wire217;
  wire signed [(5'h12):(1'h0)] wire203;
  reg [(5'h14):(1'h0)] reg235 = (1'h0);
  reg [(3'h5):(1'h0)] reg234 = (1'h0);
  reg [(2'h3):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg232 = (1'h0);
  reg [(3'h6):(1'h0)] reg231 = (1'h0);
  reg [(2'h2):(1'h0)] reg230 = (1'h0);
  reg [(4'ha):(1'h0)] reg229 = (1'h0);
  reg [(3'h4):(1'h0)] reg228 = (1'h0);
  reg [(5'h13):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg224 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg223 = (1'h0);
  reg [(5'h11):(1'h0)] reg222 = (1'h0);
  reg [(5'h15):(1'h0)] reg221 = (1'h0);
  reg [(4'h8):(1'h0)] reg220 = (1'h0);
  reg [(4'he):(1'h0)] reg216 = (1'h0);
  reg [(5'h14):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg214 = (1'h0);
  reg [(3'h4):(1'h0)] reg213 = (1'h0);
  reg [(5'h10):(1'h0)] reg212 = (1'h0);
  reg [(2'h3):(1'h0)] reg211 = (1'h0);
  reg [(2'h3):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire203,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
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
                 (1'h0)};
  assign wire203 = $unsigned(wire199);
  always
    @(posedge clk) begin
      reg204 <= (((&wire202[(2'h2):(1'h0)]) == {(wire201[(1'h1):(1'h0)] ?
                  wire203 : wire199)}) ?
          (~^($signed(((8'ha9) ?
              wire202 : (8'ha3))) >>> {wire200[(3'h6):(3'h5)]})) : ((((-(8'ha0)) & wire202) + $unsigned($unsigned(wire202))) - (+{(wire202 ?
                  wire202 : wire201),
              wire203[(5'h10):(4'ha)]})));
      if ((({wire200} ?
          {$unsigned(wire202),
              $signed(wire202[(3'h4):(1'h0)])} : (reg204[(3'h7):(3'h4)] ?
              (|(7'h43)) : ($signed(reg204) ?
                  $unsigned(wire201) : wire202[(2'h3):(2'h2)]))) * (^(wire200[(3'h4):(3'h4)] ?
          reg204[(3'h6):(1'h0)] : wire202))))
        begin
          reg205 <= (((~|($unsigned(wire203) >= {(8'ha8), reg204})) ?
              wire202[(2'h2):(1'h0)] : ((!wire200) ?
                  $unsigned(wire200[(1'h1):(1'h0)]) : ($unsigned(wire203) ?
                      ((8'hb5) ?
                          wire203 : wire201) : (~|reg204)))) << $unsigned((reg204 ?
              wire199 : $signed($unsigned((8'h9c))))));
          reg206 <= reg204;
          reg207 <= $unsigned((~|$signed(wire202[(1'h0):(1'h0)])));
          reg208 <= $unsigned(wire199[(2'h2):(1'h0)]);
          if ((!(~wire200[(4'ha):(1'h1)])))
            begin
              reg209 <= $signed(wire202[(2'h2):(1'h0)]);
              reg210 <= (reg207 ?
                  $unsigned($unsigned(wire200[(3'h5):(1'h1)])) : (-$signed(reg204)));
              reg211 <= ((7'h41) ?
                  (!$unsigned((^~$signed(reg209)))) : reg206[(4'hd):(3'h7)]);
            end
          else
            begin
              reg209 <= $signed(reg204[(3'h4):(2'h3)]);
              reg210 <= reg208[(5'h12):(3'h6)];
              reg211 <= (reg208 ? (8'hb9) : {reg208, wire203[(3'h4):(1'h0)]});
              reg212 <= {(8'ha5), reg208};
              reg213 <= wire200[(2'h3):(2'h3)];
            end
        end
      else
        begin
          if ((({$signed(reg212[(4'h9):(3'h6)]),
              $unsigned($signed(reg208))} | $signed(($unsigned((8'ha9)) ?
              (+reg209) : reg209[(4'h9):(1'h1)]))) ~^ ((8'h9d) ?
              (8'hb1) : {$signed((wire200 <<< reg209)), wire203})))
            begin
              reg205 <= $signed(wire202[(2'h2):(1'h1)]);
              reg206 <= $signed(reg213[(2'h3):(1'h0)]);
              reg207 <= ((reg208[(2'h2):(1'h0)] ?
                  (~&reg212[(4'hc):(1'h0)]) : ((((8'ha3) <<< reg207) ?
                      (reg208 - (8'hb3)) : reg213[(1'h0):(1'h0)]) | reg210)) != (($signed((wire199 ~^ wire199)) ?
                      {reg211} : $signed(wire199)) ?
                  reg212 : reg206[(3'h4):(3'h4)]));
              reg208 <= (reg209[(4'ha):(4'ha)] ?
                  {wire202} : $unsigned(($unsigned($unsigned((7'h40))) != ($unsigned(wire200) << reg209))));
              reg209 <= (^~(8'hbf));
            end
          else
            begin
              reg205 <= reg208[(1'h1):(1'h1)];
            end
          reg210 <= (reg212[(4'hf):(1'h0)] ?
              (+reg205[(4'h9):(4'h9)]) : reg210[(2'h2):(1'h1)]);
          reg211 <= $signed((^~(reg211 ?
              $signed(((8'ha1) ^~ reg207)) : reg212[(1'h1):(1'h1)])));
          reg212 <= reg211[(1'h1):(1'h0)];
        end
      reg214 <= wire201[(1'h1):(1'h1)];
      reg215 <= $unsigned($signed(reg212));
      reg216 <= ({reg215,
          {((~&(8'hae)) ?
                  $unsigned(reg211) : (reg205 * reg214))}} + $unsigned($signed((+{(7'h44)}))));
    end
  assign wire217 = (^~wire203[(4'ha):(3'h6)]);
  assign wire218 = $unsigned($unsigned(($unsigned(reg213) ?
                       {(wire200 ? wire201 : reg215)} : $signed((reg209 ?
                           reg213 : wire200)))));
  assign wire219 = reg212;
  always
    @(posedge clk) begin
      reg220 <= $unsigned(reg214[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg221 <= $signed($signed($unsigned($signed($signed(reg210)))));
      if (reg210[(2'h3):(2'h3)])
        begin
          reg222 <= (reg213[(1'h1):(1'h1)] <<< (|$unsigned($signed($unsigned(reg209)))));
        end
      else
        begin
          if (wire218[(1'h0):(1'h0)])
            begin
              reg222 <= ((((~&(wire200 & (8'hae))) > (+$signed(wire219))) || $unsigned($signed($signed(reg205)))) >> ($unsigned($signed((|wire200))) ?
                  {$unsigned((|wire202)),
                      $unsigned((reg208 <<< reg206))} : reg221));
              reg223 <= {((((wire201 > (8'ha7)) << $unsigned(wire203)) - $signed(reg209[(2'h2):(1'h0)])) | wire199)};
              reg224 <= $signed((^reg210[(2'h3):(1'h0)]));
              reg225 <= {$signed(wire202[(2'h3):(2'h2)]),
                  ($unsigned(($signed(reg220) != $signed((7'h42)))) == reg215)};
              reg226 <= (8'hb4);
            end
          else
            begin
              reg222 <= (+((~^(|$signed((8'hb3)))) & {(+(reg205 | reg223))}));
              reg223 <= ((~^$unsigned(wire202)) && $signed($signed($unsigned(wire217[(3'h6):(1'h0)]))));
              reg224 <= (!(~^reg224));
              reg225 <= (~^reg204[(3'h5):(3'h4)]);
            end
          reg227 <= {{(reg214 + ((reg207 - reg223) ?
                      reg223[(2'h3):(2'h2)] : (wire200 ? reg207 : reg222)))},
              reg216};
          reg228 <= $signed({(reg224[(4'hb):(3'h6)] || ((^wire217) ?
                  reg223 : (8'ha5)))});
          if ($signed((reg222[(4'hc):(2'h3)] ?
              $unsigned({(reg223 << wire201)}) : reg221)))
            begin
              reg229 <= (-(reg212[(4'ha):(3'h6)] <<< wire200));
              reg230 <= wire217[(3'h5):(3'h4)];
              reg231 <= wire219;
              reg232 <= reg231;
              reg233 <= ($signed(($unsigned($signed(reg220)) > (reg225[(2'h3):(2'h3)] ?
                  reg212[(4'ha):(4'h8)] : (reg212 ^ reg215)))) | (|(($signed(wire219) ?
                  (+reg207) : reg216) >= reg213)));
            end
          else
            begin
              reg229 <= (-$unsigned((8'hb1)));
              reg230 <= ((-(reg232 ?
                      (^~(wire199 ? reg222 : reg215)) : $unsigned({reg214}))) ?
                  ((~^reg226) <= (reg209[(1'h1):(1'h1)] ?
                      {(8'hba)} : (~|reg210[(2'h2):(2'h2)]))) : $signed(($unsigned((~|reg204)) >>> $unsigned((reg223 < reg233)))));
              reg231 <= wire218[(2'h3):(2'h3)];
            end
          if ($signed($signed({wire203[(4'hc):(3'h5)],
              wire219[(3'h7):(2'h2)]})))
            begin
              reg234 <= (-((~|(~^reg211[(1'h1):(1'h1)])) ?
                  reg224[(3'h5):(1'h0)] : $unsigned({(reg204 ?
                          reg211 : reg220)})));
              reg235 <= (wire219[(4'h9):(3'h6)] ?
                  (reg208 | ($signed($unsigned(reg215)) ~^ ((reg209 == reg212) ?
                      (^~reg213) : $signed(reg234)))) : $unsigned(($signed({reg223,
                          reg230}) ?
                      reg204 : ($signed((8'ha9)) ?
                          (+(8'hbf)) : reg232[(4'he):(3'h7)]))));
            end
          else
            begin
              reg234 <= reg206;
              reg235 <= reg223;
            end
        end
    end
endmodule

module module170  (y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire175;
  input wire signed [(5'h10):(1'h0)] wire174;
  input wire [(5'h11):(1'h0)] wire173;
  input wire signed [(5'h15):(1'h0)] wire172;
  input wire signed [(4'ha):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire [(4'hc):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire signed [(5'h11):(1'h0)] wire176;
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  assign wire176 = (^wire174);
  assign wire177 = {($signed(((wire176 ? wire176 : wire171) ?
                           (wire173 ^~ (7'h42)) : wire176)) >= (&wire174[(4'hb):(3'h7)])),
                       {$unsigned(($unsigned(wire174) ?
                               (wire175 ? (8'hb6) : wire172) : wire171)),
                           (-($signed((8'hae)) ?
                               {wire171, wire176} : wire176))}};
  assign wire178 = ((!wire173) < wire175);
  assign wire179 = $signed($signed($unsigned(({wire177} ?
                       ((8'hbe) ? wire173 : (8'ha0)) : (~&wire172)))));
  assign wire180 = wire172;
  always
    @(posedge clk) begin
      if ((wire180 ? wire171 : wire179))
        begin
          reg181 <= wire172;
          reg182 <= ($signed({(^(wire173 + reg181))}) ?
              $unsigned((($unsigned(wire179) ? wire171 : $unsigned(reg181)) ?
                  $signed((wire173 ~^ wire173)) : ($signed(wire177) >= (^~wire177)))) : wire174);
          reg183 <= $signed(((8'hab) < wire172));
        end
      else
        begin
          reg181 <= ({$unsigned(($signed(wire171) || wire178))} ~^ $signed(wire177[(3'h6):(1'h0)]));
        end
    end
endmodule
