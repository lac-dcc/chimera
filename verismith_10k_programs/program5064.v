module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire326;
  wire [(5'h12):(1'h0)] wire325;
  wire signed [(5'h15):(1'h0)] wire323;
  wire [(2'h3):(1'h0)] wire171;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire169;
  wire signed [(3'h7):(1'h0)] wire168;
  wire [(3'h4):(1'h0)] wire167;
  wire signed [(4'h8):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire124;
  reg signed [(4'he):(1'h0)] reg333 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg332 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg331 = (1'h0);
  reg [(3'h5):(1'h0)] reg330 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg329 = (1'h0);
  reg [(4'hb):(1'h0)] reg328 = (1'h0);
  reg [(4'hc):(1'h0)] reg327 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  assign y = {wire326,
                 wire325,
                 wire323,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire147,
                 wire146,
                 wire144,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire24,
                 wire25,
                 wire124,
                 reg333,
                 reg332,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg327,
                 reg4,
                 reg5,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (+{wire1});
      if (wire3)
        begin
          reg5 <= (~&wire2[(4'ha):(2'h2)]);
          reg6 <= wire3[(4'ha):(1'h1)];
          reg7 <= (reg5 ^~ {$signed(wire2[(3'h4):(1'h0)])});
          reg8 <= $signed(((8'hbd) ?
              (({wire1, wire0} >= {wire3, reg4}) ?
                  reg7 : ($unsigned(reg4) ?
                      wire2[(4'ha):(3'h6)] : (reg5 ?
                          wire0 : (8'hbb)))) : ($signed(wire1) ?
                  ($unsigned(wire2) && (reg4 >>> wire0)) : ({(8'haf)} ?
                      (!reg4) : reg6))));
        end
      else
        begin
          if ($unsigned($unsigned((~$signed((wire2 ? wire0 : wire3))))))
            begin
              reg5 <= (~|wire0);
              reg6 <= ($signed({wire1,
                  ((^~reg4) ?
                      $unsigned(reg8) : {reg8})}) & $signed(reg7[(2'h2):(1'h0)]));
              reg7 <= {$signed(($unsigned(reg6[(3'h4):(1'h1)]) | {(wire0 >>> (8'hb7)),
                      (wire2 <<< reg7)}))};
            end
          else
            begin
              reg5 <= {$signed($signed($signed((reg6 < (7'h41)))))};
              reg6 <= (((&({wire3} < $unsigned(wire3))) ?
                      $signed(wire2[(3'h7):(3'h5)]) : {wire3}) ?
                  reg8 : (!({$unsigned(wire2), (~(8'hb8))} ?
                      reg4 : $unsigned(wire1))));
              reg7 <= $unsigned((|$signed(wire0)));
            end
          reg8 <= reg7[(2'h2):(1'h1)];
          reg9 <= (wire3[(3'h7):(1'h1)] ?
              (&(wire3[(2'h2):(1'h0)] << ($signed(wire0) ?
                  (wire3 ? (8'hb8) : reg8) : (reg4 ?
                      reg5 : (8'ha4))))) : $signed(reg4[(4'hc):(4'h8)]));
        end
      if (wire3)
        begin
          reg10 <= reg5[(4'hc):(3'h4)];
          reg11 <= (~&(&reg4));
          reg12 <= {($signed((!wire0)) ? $signed(reg9) : (8'ha4))};
          reg13 <= reg6;
        end
      else
        begin
          reg10 <= (8'ha9);
          if (reg11)
            begin
              reg11 <= wire2;
              reg12 <= $unsigned(($unsigned((reg11[(4'hf):(4'ha)] ?
                  reg8[(1'h0):(1'h0)] : reg6[(2'h2):(1'h0)])) || (!(+(8'ha4)))));
              reg13 <= (&reg4);
            end
          else
            begin
              reg11 <= reg10[(3'h7):(3'h4)];
              reg12 <= {reg11,
                  ($signed(reg7[(1'h1):(1'h0)]) ?
                      (((~reg11) ? $unsigned(reg4) : (reg11 <<< reg12)) ?
                          reg11 : (&$signed(reg4))) : reg10)};
              reg13 <= {{$signed($signed(reg8[(4'h8):(1'h0)])),
                      $signed((+$unsigned((8'ha8))))},
                  reg12[(3'h7):(3'h4)]};
              reg14 <= $unsigned(reg13[(1'h0):(1'h0)]);
            end
          reg15 <= reg12[(4'he):(3'h6)];
        end
    end
  assign wire16 = $unsigned(reg12);
  assign wire17 = ((reg15 ^ $signed(((reg14 == (8'hb0)) << wire0))) < (~$unsigned($signed((reg6 ?
                      reg9 : reg8)))));
  assign wire18 = ($unsigned({reg10[(2'h2):(2'h2)],
                      reg14}) == $unsigned(reg12[(4'hf):(4'hc)]));
  assign wire19 = reg5;
  always
    @(posedge clk) begin
      reg20 <= (~|$unsigned(reg4));
      reg21 <= $unsigned(reg9);
      reg22 <= $unsigned(reg15[(4'h9):(2'h2)]);
      reg23 <= {reg10[(1'h1):(1'h1)], wire3[(3'h4):(1'h1)]};
    end
  assign wire24 = ((8'ha6) ?
                      {(reg6 ? $signed($signed(reg22)) : reg4),
                          (~^$signed($unsigned(reg10)))} : (reg15 ?
                          {(((8'ha5) ? wire16 : reg7) ?
                                  {reg7} : $unsigned(reg15)),
                              (&reg6[(4'h8):(1'h1)])} : wire19));
  assign wire25 = {(reg7 <= ((reg9[(4'ha):(2'h2)] ?
                          reg11 : {reg12,
                              (8'hae)}) * (((7'h41) != reg21) >= wire2)))};
  module26 #() modinst125 (.wire28(reg9), .wire29(reg12), .wire30(wire19), .wire27(reg14), .y(wire124), .clk(clk));
  module126 #() modinst145 (wire144, clk, reg4, reg13, reg15, reg12, reg10);
  assign wire146 = wire3[(1'h1):(1'h1)];
  assign wire147 = wire25[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (reg23)
        begin
          reg148 <= $unsigned((reg23 ?
              (((reg10 ? wire3 : wire1) ?
                      (reg21 != wire144) : (wire19 ? reg11 : reg9)) ?
                  $signed((wire0 ?
                      wire16 : wire1)) : (reg23[(3'h7):(1'h0)] - reg14[(4'he):(3'h4)])) : $unsigned($signed((~|reg8)))));
          reg149 <= {reg10[(1'h0):(1'h0)]};
          if (((8'ha5) ?
              ((wire1 ?
                  reg148[(3'h6):(1'h1)] : (~^$unsigned(reg148))) | wire19[(2'h3):(1'h1)]) : reg5[(3'h7):(3'h5)]))
            begin
              reg150 <= (!(7'h42));
            end
          else
            begin
              reg150 <= (wire1 ?
                  $unsigned((($unsigned((8'hb9)) >= reg15[(4'h9):(2'h3)]) ?
                      ((reg7 < reg13) ?
                          (^reg12) : wire24) : wire147)) : reg149);
              reg151 <= reg148[(1'h1):(1'h0)];
              reg152 <= $unsigned(wire144[(1'h1):(1'h0)]);
              reg153 <= (|reg13);
              reg154 <= wire124;
            end
          reg155 <= (+$signed((((reg10 != wire19) >> $unsigned(reg21)) ?
              wire147[(2'h2):(1'h1)] : $unsigned((wire147 - reg9)))));
          reg156 <= ($unsigned(($signed($unsigned(wire147)) * (wire0[(3'h4):(2'h3)] ?
              (wire124 ^~ wire147) : (-reg14)))) == $unsigned((7'h40)));
        end
      else
        begin
          reg148 <= $signed($unsigned((((^~reg5) & (wire3 >>> wire17)) != $unsigned((~wire3)))));
          reg149 <= (|wire19[(3'h6):(2'h3)]);
          reg150 <= wire19[(1'h1):(1'h1)];
        end
      reg157 <= $unsigned((+$unsigned(reg5)));
      reg158 <= wire3[(2'h2):(1'h1)];
      if ((reg7 ?
          {reg13, {$unsigned(wire0[(3'h7):(2'h3)])}} : reg152[(3'h5):(1'h0)]))
        begin
          reg159 <= ($signed($signed(($unsigned((8'haa)) ?
              (reg4 << wire146) : (reg152 ? wire17 : wire16)))) >>> reg4);
          reg160 <= ((|(+{$unsigned((7'h41)), reg22[(1'h1):(1'h0)]})) ?
              (~^wire147) : ($signed($unsigned(reg154[(4'h8):(1'h1)])) ?
                  $unsigned($unsigned($signed(wire19))) : (wire144 < (8'ha7))));
          reg161 <= $unsigned({wire0[(1'h0):(1'h0)]});
          reg162 <= ((reg9 ?
              ($signed($unsigned((7'h41))) ?
                  $unsigned(reg160) : ((reg14 ? wire1 : reg5) >>> (reg155 ?
                      reg152 : reg155))) : wire144[(2'h2):(2'h2)]) << (8'hac));
          if (($signed($unsigned((reg12[(1'h1):(1'h0)] ?
              (8'hb9) : (reg8 ?
                  reg21 : reg152)))) || $unsigned({$signed((wire17 ?
                  (8'hbf) : wire146))})))
            begin
              reg163 <= wire25;
              reg164 <= ((8'hba) > reg15[(3'h6):(3'h6)]);
            end
          else
            begin
              reg163 <= $signed(reg152[(1'h0):(1'h0)]);
              reg164 <= ((($signed((reg151 ?
                  reg159 : wire144)) - $signed($unsigned((8'hbf)))) + (^~(&{reg20,
                  wire16}))) ^~ $signed(((-(reg152 ~^ wire2)) ?
                  $unsigned(reg151[(1'h0):(1'h0)]) : $signed((-wire18)))));
            end
        end
      else
        begin
          if ($signed(($signed((reg22[(1'h0):(1'h0)] ?
                  {wire17} : reg5[(3'h5):(3'h5)])) ?
              (~&($signed((8'hb3)) || ((8'haa) ?
                  reg158 : (8'haf)))) : reg162[(1'h0):(1'h0)])))
            begin
              reg159 <= (((reg5[(4'hb):(4'h9)] ?
                      wire124[(1'h0):(1'h0)] : ((reg158 - wire24) ?
                          reg161[(2'h2):(1'h1)] : $unsigned(reg23))) ?
                  $signed({$unsigned(reg7),
                      (wire3 || wire17)}) : $unsigned($signed({reg10,
                      reg154}))) << (reg158[(4'hc):(3'h5)] << (~^reg160)));
              reg160 <= (-$unsigned($signed($unsigned((wire0 ?
                  reg160 : wire24)))));
            end
          else
            begin
              reg159 <= $signed((wire17[(4'hb):(2'h2)] <<< wire144[(2'h2):(1'h0)]));
              reg160 <= (+(|($unsigned(reg9) - ({reg152,
                  reg20} ^~ reg21[(1'h1):(1'h1)]))));
              reg161 <= ($unsigned(reg12) >> reg159[(1'h1):(1'h0)]);
              reg162 <= ((~|((~$signed(reg148)) ?
                  reg155 : $signed((&reg156)))) || $unsigned({wire18}));
              reg163 <= (~&($signed($signed((wire19 ?
                  (8'hb0) : reg4))) > $unsigned(wire18)));
            end
          reg164 <= (((-($signed(wire18) << reg5)) <<< reg153) ?
              (((reg15[(4'hb):(4'hb)] <<< {reg152}) ?
                      $signed(reg151[(1'h0):(1'h0)]) : ($unsigned(reg8) | (~|reg163))) ?
                  (reg153 << $signed($signed(wire0))) : ((-{wire3, reg155}) ?
                      ((&reg23) ?
                          wire18 : (&reg9)) : (&$signed(reg160)))) : (-$signed($unsigned($unsigned(wire18)))));
        end
      reg165 <= (~|$unsigned($signed(reg4)));
    end
  assign wire166 = {{reg9[(3'h6):(3'h6)]}};
  assign wire167 = $signed($signed((((~reg22) ?
                       (wire3 ?
                           wire19 : wire1) : (^reg11)) && ((reg150 || wire19) >= (reg156 ?
                       wire19 : reg165)))));
  assign wire168 = (wire166[(2'h3):(1'h0)] != wire167);
  assign wire169 = (8'ha3);
  assign wire170 = {(^~(+reg164[(3'h4):(2'h2)])),
                       (wire3 ?
                           $unsigned({(^~wire168),
                               $signed(wire18)}) : $unsigned($unsigned((~|reg160))))};
  assign wire171 = ((reg12 && (8'hb9)) > (wire16 | (($unsigned(wire169) ?
                           reg14[(4'ha):(3'h7)] : (reg164 > wire170)) ?
                       $unsigned((8'hb9)) : ($unsigned((8'hbd)) ?
                           $signed((8'hae)) : (^wire18)))));
  module172 #() modinst324 (.wire175(wire169), .wire173(reg7), .clk(clk), .wire176(wire17), .y(wire323), .wire177(wire25), .wire174(wire170));
  assign wire325 = (~|wire168);
  assign wire326 = reg161[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ((+(~|(reg9[(4'hc):(3'h5)] || reg160[(1'h1):(1'h0)]))))
        begin
          reg327 <= ((~^wire325[(4'hc):(4'h8)]) * (&reg149[(2'h2):(1'h0)]));
          if ($unsigned($signed(reg164)))
            begin
              reg328 <= $signed($unsigned(wire0[(1'h0):(1'h0)]));
              reg329 <= ($signed(reg22) ?
                  (~^((reg8[(3'h7):(1'h0)] * {reg12}) - ($signed(reg6) ^~ (reg163 >>> reg7)))) : reg12);
            end
          else
            begin
              reg328 <= (-(~^reg7[(5'h11):(4'hc)]));
              reg329 <= wire144[(2'h3):(1'h1)];
              reg330 <= ($unsigned({(~&(reg149 ? wire16 : wire169)),
                  reg21[(3'h4):(1'h0)]}) >>> (8'hbe));
              reg331 <= (7'h41);
            end
          reg332 <= reg331;
        end
      else
        begin
          reg327 <= wire170[(3'h5):(2'h3)];
          reg328 <= ((^~reg159[(1'h0):(1'h0)]) <= wire323[(5'h10):(4'h8)]);
        end
      reg333 <= ($signed({(~&reg6),
          {$unsigned((8'hbc))}}) << wire24[(3'h5):(1'h0)]);
    end
endmodule

module module172
#(parameter param322 = ((~^((((8'hb9) ? (8'ha6) : (8'ha9)) ? ((8'ha9) * (8'ha1)) : (^~(8'hbe))) ~^ (((8'h9c) ? (8'ha9) : (8'ha9)) << ((8'hbe) != (8'hae))))) | {(((-(8'hb9)) >= ((8'hb9) >>> (8'h9d))) ? (((8'hbc) ? (8'ha6) : (7'h41)) ? ((8'h9e) & (8'hab)) : (8'hae)) : (((8'h9c) * (8'haa)) ? (~|(8'hb7)) : ((7'h41) - (8'ha9))))}))
(y, clk, wire177, wire176, wire175, wire174, wire173);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire177;
  input wire signed [(5'h14):(1'h0)] wire176;
  input wire signed [(3'h4):(1'h0)] wire175;
  input wire signed [(4'h9):(1'h0)] wire174;
  input wire signed [(5'h15):(1'h0)] wire173;
  wire signed [(2'h2):(1'h0)] wire321;
  wire [(5'h15):(1'h0)] wire320;
  wire signed [(4'h8):(1'h0)] wire319;
  wire signed [(2'h2):(1'h0)] wire318;
  wire signed [(4'hd):(1'h0)] wire316;
  wire signed [(4'h8):(1'h0)] wire274;
  wire signed [(4'h9):(1'h0)] wire273;
  wire [(5'h14):(1'h0)] wire266;
  wire signed [(5'h13):(1'h0)] wire265;
  wire signed [(5'h15):(1'h0)] wire203;
  wire signed [(4'hc):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire209;
  wire [(3'h7):(1'h0)] wire210;
  wire signed [(4'h9):(1'h0)] wire211;
  wire [(4'hc):(1'h0)] wire212;
  wire signed [(5'h11):(1'h0)] wire213;
  wire signed [(4'h8):(1'h0)] wire263;
  reg [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg189 = (1'h0);
  reg [(5'h12):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg207 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg267 = (1'h0);
  reg [(4'hc):(1'h0)] reg268 = (1'h0);
  reg [(3'h5):(1'h0)] reg269 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg271 = (1'h0);
  reg [(4'hc):(1'h0)] reg272 = (1'h0);
  assign y = {wire321,
                 wire320,
                 wire319,
                 wire318,
                 wire316,
                 wire274,
                 wire273,
                 wire266,
                 wire265,
                 wire203,
                 wire190,
                 wire178,
                 wire209,
                 wire210,
                 wire211,
                 wire212,
                 wire213,
                 wire263,
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
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg267,
                 reg268,
                 reg269,
                 reg270,
                 reg271,
                 reg272,
                 (1'h0)};
  assign wire178 = $signed((wire175 && {$signed((wire174 ?
                           (8'h9f) : wire175))}));
  always
    @(posedge clk) begin
      reg179 <= $signed((~^wire178[(4'h8):(3'h4)]));
      reg180 <= reg179;
      if ((+$signed(((8'ha2) ? $unsigned(wire173) : $unsigned(reg180)))))
        begin
          reg181 <= $unsigned(reg180[(5'h10):(3'h7)]);
          reg182 <= ($signed(reg181[(4'hf):(4'ha)]) ?
              $signed($unsigned(reg181[(4'he):(4'he)])) : $unsigned($signed(wire177[(3'h7):(1'h0)])));
          reg183 <= $signed((reg179 <<< (-$unsigned($signed(wire176)))));
          if ({$unsigned(($unsigned((wire176 ? wire175 : wire178)) ?
                  $unsigned({reg183, wire177}) : ({reg179,
                      (8'hab)} * wire173[(4'hc):(3'h7)])))})
            begin
              reg184 <= $signed(($unsigned($signed($signed(wire176))) ?
                  $signed($unsigned(wire175[(1'h1):(1'h0)])) : (|reg180[(2'h2):(2'h2)])));
              reg185 <= (reg184[(4'hd):(4'hc)] <= wire175);
              reg186 <= (&(~^$signed(wire178)));
              reg187 <= ({$signed((8'ha8))} ?
                  (7'h44) : {$signed(reg185[(1'h1):(1'h1)]),
                      {$unsigned(reg184[(4'hd):(4'hb)])}});
            end
          else
            begin
              reg184 <= wire175[(2'h3):(1'h1)];
              reg185 <= ((($unsigned((wire177 ? (8'haf) : wire176)) ?
                      $signed({wire177}) : $signed($unsigned((8'h9c)))) ?
                  ((((8'hb3) ? reg183 : reg186) ?
                      $signed(reg186) : reg181) + reg181[(3'h5):(1'h0)]) : wire175) > {(reg184[(4'hd):(4'ha)] ?
                      ($unsigned(wire177) * (|(8'hbc))) : $unsigned(reg183[(2'h3):(1'h1)])),
                  (($signed(reg181) + $unsigned(wire177)) <= (~&(8'ha7)))});
              reg186 <= (~^{$signed(reg187[(1'h0):(1'h0)])});
              reg187 <= ((($signed((reg187 != wire173)) ?
                      ((wire173 ? reg179 : wire175) ?
                          reg179 : reg179[(3'h5):(1'h1)]) : {(reg183 ?
                              wire176 : (8'hba))}) ?
                  reg185 : $unsigned(reg185[(1'h1):(1'h0)])) >>> (|reg181));
              reg188 <= ($signed(($signed(reg179) ?
                  $signed(reg187[(2'h2):(1'h0)]) : {(+reg185),
                      (reg186 << wire177)})) * wire176[(3'h7):(2'h2)]);
            end
          reg189 <= (reg179[(3'h4):(1'h0)] ?
              reg188[(4'hb):(4'hb)] : $unsigned((~&(~&{wire177, wire173}))));
        end
      else
        begin
          reg181 <= (((wire175 ?
                  $signed(((8'ha3) ^ (7'h40))) : (^~reg188[(5'h10):(4'ha)])) ?
              wire176[(4'he):(4'h8)] : {$unsigned((reg187 ? reg187 : reg180)),
                  reg189}) & reg179);
          if ((reg179 == $unsigned({(-reg187[(4'ha):(1'h1)]),
              (&{reg183, reg181})})))
            begin
              reg182 <= wire177[(1'h0):(1'h0)];
            end
          else
            begin
              reg182 <= ($unsigned({$unsigned({wire178, (8'hab)}),
                  $signed(reg189[(1'h1):(1'h0)])}) ^~ (~^$signed({wire174[(3'h4):(3'h4)],
                  (reg180 & reg180)})));
              reg183 <= wire173[(5'h13):(4'h8)];
              reg184 <= (~&((reg181 != wire177[(4'hb):(3'h5)]) ^~ reg187));
            end
        end
    end
  assign wire190 = $signed(wire178);
  module191 #() modinst204 (wire203, clk, reg186, reg183, wire176, reg180, reg188);
  always
    @(posedge clk) begin
      reg205 <= reg187;
      reg206 <= (~|{({$unsigned(reg187), reg187[(3'h4):(1'h1)]} ?
              $signed(((8'hae) ? (8'hac) : reg184)) : reg180[(4'h8):(3'h5)])});
      reg207 <= (wire175 == $unsigned(reg189[(1'h0):(1'h0)]));
      reg208 <= $signed($unsigned($signed((~$signed((8'hbd))))));
    end
  assign wire209 = ((8'hac) >>> wire177[(4'h8):(3'h7)]);
  assign wire210 = $signed(reg184);
  assign wire211 = (~$unsigned({(~(reg183 << reg205))}));
  assign wire212 = $unsigned({$unsigned($unsigned({(8'h9c)})),
                       $signed(((reg207 >= reg207) <= (^(8'haa))))});
  assign wire213 = $unsigned($unsigned(($unsigned((wire173 >= reg205)) << (~^wire173[(5'h12):(5'h10)]))));
  module214 #() modinst264 (.wire215(wire203), .clk(clk), .wire216(wire213), .wire217(wire173), .wire219(wire209), .wire218(wire177), .y(wire263));
  assign wire265 = (-((|(7'h44)) ? (&(8'ha2)) : $signed($unsigned(reg187))));
  assign wire266 = (~&(reg187[(1'h1):(1'h1)] ?
                       $unsigned($unsigned(wire212)) : reg206[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ((&reg180[(2'h2):(1'h1)]))
        begin
          reg267 <= {$signed(($signed(reg181[(4'h8):(2'h3)]) ?
                  reg182 : (reg186 < (reg186 ? wire190 : reg187))))};
          reg268 <= $signed(($unsigned(({wire263} != $signed(wire211))) < $unsigned($signed(wire203))));
          reg269 <= (reg206 | (&$signed(wire175)));
        end
      else
        begin
          reg267 <= {(+$signed((-((8'hbb) ? wire175 : wire209)))),
              (!(reg189 ? (+(reg188 ? wire263 : reg208)) : wire176))};
          if ($unsigned($unsigned(reg269)))
            begin
              reg268 <= wire266;
              reg269 <= ($unsigned(($signed($unsigned((8'hb5))) ?
                  (~{wire177}) : wire176)) && wire173);
              reg270 <= {reg185[(1'h1):(1'h1)],
                  ((~&(+(|reg185))) >>> wire177[(2'h2):(2'h2)])};
              reg271 <= wire210[(2'h3):(1'h0)];
              reg272 <= ((8'hb7) ^~ (^~$signed(($signed((8'h9f)) ?
                  ((8'h9d) <= wire211) : $signed(wire263)))));
            end
          else
            begin
              reg268 <= $signed((8'ha0));
              reg269 <= reg271;
              reg270 <= (reg205 ?
                  {(({reg181} < reg207) ?
                          ((wire203 - reg270) > (reg272 ^~ reg187)) : reg270[(4'h9):(4'h9)])} : ({wire209[(3'h4):(1'h0)]} ?
                      $signed($signed((-(8'hb6)))) : (^$unsigned($unsigned(wire263)))));
            end
        end
    end
  assign wire273 = ($signed(reg185) - reg272);
  assign wire274 = (~|wire209);
  module275 #() modinst317 (.wire278(reg189), .y(wire316), .clk(clk), .wire279(wire173), .wire276(wire210), .wire280(wire211), .wire277(wire203));
  assign wire318 = $signed($signed($unsigned(wire209)));
  assign wire319 = (~&$unsigned(reg184[(4'he):(4'hd)]));
  assign wire320 = $unsigned({wire174});
  assign wire321 = ({$unsigned((reg183[(3'h4):(2'h3)] ?
                           $signed(wire178) : (wire190 >> reg185))),
                       $signed((reg184[(3'h6):(3'h4)] ^~ {wire266,
                           (8'ha9)}))} << (reg271 + wire213));
endmodule

module module126
#(parameter param142 = (-((8'hb1) == (~&({(8'hb5)} ? (&(8'haa)) : {(8'hb8), (8'hab)})))), 
parameter param143 = param142)
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire131;
  input wire [(2'h3):(1'h0)] wire130;
  input wire [(5'h14):(1'h0)] wire129;
  input wire signed [(4'ha):(1'h0)] wire128;
  input wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire132;
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire132,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire132 = {wire129[(4'hc):(3'h4)]};
  always
    @(posedge clk) begin
      reg133 <= (~^wire128[(4'h8):(3'h7)]);
      if ((($unsigned($unsigned(wire132)) ?
          wire131[(2'h2):(1'h1)] : {(+$unsigned(wire132)),
              $unsigned((wire131 - (8'hb5)))}) | ((&(~wire129[(3'h6):(2'h3)])) ?
          (($unsigned(reg133) >>> $unsigned(wire131)) ?
              (-(+wire130)) : $signed((wire127 >>> wire129))) : $signed(wire130))))
        begin
          reg134 <= wire130;
        end
      else
        begin
          reg134 <= ((((&((8'hb9) ?
                  reg134 : wire131)) <<< ($unsigned(wire128) > (8'hbe))) <= ((-(reg134 ^ wire132)) >= ($unsigned(wire130) ?
                  (reg133 - wire129) : (wire129 ? wire131 : reg134)))) ?
              (($unsigned(reg133[(4'ha):(3'h5)]) ?
                      ((wire128 == reg134) <= $unsigned(reg134)) : $unsigned((wire131 >>> wire130))) ?
                  {$unsigned((^reg133)),
                      wire127} : $unsigned((8'had))) : (wire127 <= wire128[(4'h8):(3'h6)]));
          reg135 <= {{({wire130} != $unsigned(wire130[(1'h0):(1'h0)])),
                  (~|reg134[(3'h6):(2'h2)])},
              reg134[(3'h5):(2'h2)]};
          reg136 <= (~^(($signed((|wire127)) >= wire129) == (7'h43)));
        end
    end
  assign wire137 = $unsigned((($unsigned((reg135 ? (8'hb0) : reg133)) ?
                           ({wire127} - (wire127 && reg135)) : (((8'hb8) ?
                                   wire130 : reg135) ?
                               $unsigned(reg135) : ((8'hba) < wire130))) ?
                       $signed((reg133 ?
                           wire130[(1'h1):(1'h1)] : $unsigned(reg135))) : {((wire127 == wire127) * (8'h9c))}));
  assign wire138 = $unsigned($signed(({(reg133 <<< reg136)} ?
                       (|(wire127 ? (8'ha7) : reg136)) : reg133)));
  assign wire139 = (($unsigned((&$signed(wire127))) >= $unsigned($unsigned((wire131 ?
                       wire130 : wire131)))) <<< (8'ha7));
  assign wire140 = (-$unsigned((reg134[(3'h7):(3'h5)] < ({wire130} & (reg136 ?
                       reg133 : wire129)))));
  assign wire141 = reg134;
endmodule

module module26  (y, clk, wire27, wire28, wire29, wire30);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire signed [(3'h4):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire117;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire117,
                 (1'h0)};
  module31 #() modinst65 (.clk(clk), .wire32(wire27), .wire33(wire29), .wire35(wire30), .y(wire64), .wire34(wire28));
  assign wire66 = $unsigned(((~^(&wire29[(4'h8):(3'h4)])) < {wire64}));
  assign wire67 = $signed((!wire30));
  assign wire68 = $unsigned(wire30[(2'h2):(1'h1)]);
  assign wire69 = $unsigned(wire67[(2'h3):(1'h1)]);
  module70 #() modinst118 (.clk(clk), .wire71(wire29), .wire72(wire67), .y(wire117), .wire74(wire66), .wire73(wire69), .wire75(wire30));
  assign wire119 = (!(~&($signed((wire29 + wire64)) >>> (8'hb3))));
  assign wire120 = ((wire69[(4'hb):(4'ha)] ^~ (8'hab)) ?
                       ((8'hbd) <= wire27[(5'h15):(2'h2)]) : ((8'hb7) ?
                           (((wire29 ?
                               wire64 : wire28) * $signed(wire66)) ^~ wire28) : (~|(~|(|(8'ha5))))));
  assign wire121 = (((wire117[(5'h10):(4'hd)] <<< $unsigned(wire29[(3'h6):(2'h2)])) != (($unsigned(wire27) <= (wire67 || wire69)) != $unsigned((~&wire69)))) ?
                       wire30 : wire28[(1'h0):(1'h0)]);
  assign wire122 = ((^~(^~(~&(wire30 ? wire67 : wire119)))) ?
                       wire117[(1'h0):(1'h0)] : (wire67[(3'h5):(3'h5)] & (((wire64 >= (7'h44)) ?
                               wire30 : (wire29 == wire119)) ?
                           $signed(wire69[(2'h3):(2'h2)]) : $signed({wire117}))));
  assign wire123 = {wire29};
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire75;
  input wire [(5'h14):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire signed [(4'hf):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire98,
                 wire97,
                 wire89,
                 wire88,
                 wire78,
                 wire77,
                 wire76,
                 reg114,
                 reg113,
                 reg112,
                 reg108,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire76 = wire74[(4'hb):(4'hb)];
  assign wire77 = wire74[(4'hf):(3'h5)];
  assign wire78 = $signed(((^~(wire73[(3'h5):(1'h0)] ?
                      wire75 : $unsigned(wire71))) != ({(wire75 ?
                              (8'hbb) : wire77),
                          {wire77}} ?
                      ((wire72 - wire77) ^~ (wire77 ?
                          (8'hbc) : wire76)) : ({wire76, wire75} ?
                          (+wire73) : wire71[(4'h8):(3'h4)]))));
  always
    @(posedge clk) begin
      reg79 <= $unsigned((wire71 ?
          ((~|$unsigned(wire78)) << (!(wire73 == wire73))) : (wire72 ?
              (~(~|(8'h9f))) : wire73[(4'ha):(3'h6)])));
      if ((~&$signed(($unsigned(wire75) > (~|$signed(wire77))))))
        begin
          reg80 <= (wire76 * wire77[(5'h12):(4'hc)]);
          reg81 <= (|$signed({wire74}));
        end
      else
        begin
          reg80 <= (8'hb4);
          if ((+wire77))
            begin
              reg81 <= wire71[(2'h2):(2'h2)];
              reg82 <= (~(reg80 >>> (reg79 >> (8'hbf))));
              reg83 <= $signed((^$unsigned($signed(reg80))));
              reg84 <= ((+(^~$unsigned(((8'hb2) ? reg80 : reg81)))) ?
                  ($unsigned($signed($signed(reg83))) ?
                      wire77[(3'h6):(2'h3)] : (!wire71)) : ($unsigned((^wire72[(5'h10):(3'h6)])) ?
                      (((wire72 >= reg82) ?
                          $unsigned(reg81) : $unsigned(wire78)) > (&$unsigned(reg79))) : ($signed($unsigned(wire71)) ?
                          reg83 : (^(~(8'ha3))))));
            end
          else
            begin
              reg81 <= wire76;
              reg82 <= $unsigned(reg80[(4'ha):(2'h3)]);
              reg83 <= $unsigned((((-(8'hab)) >> $unsigned($signed(reg80))) ?
                  (reg82 < (reg79[(3'h5):(3'h4)] != $unsigned(reg80))) : $unsigned(((reg84 ?
                          reg80 : wire71) ?
                      $unsigned(wire77) : $unsigned(reg81)))));
              reg84 <= (8'hae);
              reg85 <= wire75[(4'ha):(4'h9)];
            end
        end
      reg86 <= $signed(wire71[(4'h8):(4'h8)]);
      reg87 <= $unsigned(reg85[(2'h3):(2'h2)]);
    end
  assign wire88 = ((&reg83) >= ($signed(($unsigned((7'h41)) ?
                      reg81 : reg80)) >>> ($signed(reg87[(2'h3):(2'h2)]) ?
                      wire78[(2'h2):(1'h1)] : reg84[(3'h7):(3'h4)])));
  assign wire89 = reg86;
  always
    @(posedge clk) begin
      if (($unsigned(wire77) ^~ (reg82[(1'h1):(1'h0)] ^~ ($signed($signed(reg84)) & ($signed(wire77) ?
          $unsigned((7'h42)) : reg84[(2'h2):(2'h2)])))))
        begin
          reg90 <= wire88[(4'hb):(4'hb)];
          reg91 <= $unsigned($unsigned((~&wire88)));
          reg92 <= ((^~(((reg81 ^ reg85) ?
                  reg86 : wire76[(4'hd):(1'h1)]) & $signed(reg86))) ?
              reg79 : $unsigned($signed((8'had))));
        end
      else
        begin
          reg90 <= $signed(reg81[(1'h1):(1'h0)]);
          reg91 <= reg81[(1'h1):(1'h1)];
        end
      reg93 <= $signed((8'h9e));
      reg94 <= reg93;
      reg95 <= ((reg92[(1'h0):(1'h0)] ^~ (((reg82 - reg84) ?
              $signed(reg94) : $unsigned(wire75)) ?
          reg80[(4'h9):(4'h8)] : (^~(wire73 | wire74)))) ^~ $unsigned($unsigned({$signed(wire77),
          $signed(reg94)})));
      reg96 <= (8'ha4);
    end
  assign wire97 = reg80[(5'h11):(1'h1)];
  assign wire98 = $unsigned(reg87[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      if (((-(!($unsigned((8'ha5)) << (reg95 > wire77)))) + reg90))
        begin
          reg99 <= reg84;
        end
      else
        begin
          reg99 <= (+wire74);
        end
      reg100 <= $unsigned(reg91);
      reg101 <= $signed($unsigned($signed(((reg83 ^~ reg85) ?
          (reg94 ? reg82 : (8'h9d)) : (~^reg95)))));
    end
  always
    @(posedge clk) begin
      reg102 <= $signed($unsigned(reg90[(1'h1):(1'h1)]));
      reg103 <= ({({(wire98 ? reg100 : reg92), {reg102, (8'had)}} <= reg85)} ?
          $signed({{wire78},
              reg80[(5'h11):(1'h1)]}) : {$signed(wire75[(1'h0):(1'h0)])});
    end
  assign wire104 = (^~$signed($unsigned(((+reg94) ?
                       ((8'hb6) != wire75) : reg99[(4'ha):(2'h3)]))));
  assign wire105 = $signed($signed({$signed((wire74 ~^ wire71)),
                       $unsigned(((8'h9c) ? wire76 : wire73))}));
  assign wire106 = $unsigned((((reg80 ?
                           $unsigned(reg82) : $signed(reg92)) & {{wire78,
                               (8'ha7)},
                           (~&reg92)}) ?
                       $unsigned(wire72) : $signed(((^~wire104) ?
                           (reg85 <= wire74) : reg102[(3'h7):(3'h7)]))));
  assign wire107 = (~^{(8'haa)});
  always
    @(posedge clk) begin
      reg108 <= {$unsigned(reg80[(1'h1):(1'h0)])};
    end
  assign wire109 = (&$unsigned(reg100));
  assign wire110 = (8'ha0);
  assign wire111 = ($signed(wire73[(3'h6):(3'h5)]) ?
                       reg84[(5'h14):(4'h9)] : ((8'hb0) ?
                           {$signed((reg99 == (8'hb2))),
                               ($unsigned(wire109) ?
                                   (wire74 || (8'ha1)) : wire71)} : $signed((|(8'ha6)))));
  always
    @(posedge clk) begin
      reg112 <= (~wire109);
      reg113 <= {(($signed({(8'ha7)}) ?
                  (wire73[(3'h6):(1'h0)] ?
                      reg79 : $unsigned(reg84)) : ((wire76 ?
                      wire88 : (8'ha9)) >>> $unsigned(reg103))) ?
              (~^(-$signed(wire78))) : {wire104}),
          (|(reg112 ?
              $unsigned(wire107) : $unsigned((reg82 ? (7'h40) : reg101))))};
      reg114 <= reg99[(4'h9):(4'h9)];
    end
  assign wire115 = {$unsigned((~$signed($signed(reg85))))};
  assign wire116 = (($signed(((wire77 != reg92) ?
                           $signed(reg96) : $signed(reg80))) ?
                       $signed({((8'hb9) & wire115),
                           (reg108 + reg112)}) : $signed(reg102[(2'h3):(1'h0)])) | $unsigned({({wire115,
                           (7'h42)} ^ reg96[(4'hb):(4'ha)]),
                       $signed((reg84 ? reg86 : reg102))}));
endmodule

module module31
#(parameter param62 = (((-{((7'h43) ? (7'h42) : (8'hb2)), (^~(8'ha4))}) ? {((|(8'ha9)) ? (&(7'h44)) : ((7'h41) ? (8'ha8) : (7'h40)))} : ({(~&(8'h9f)), (^(8'hbf))} ? (((8'had) <= (7'h44)) ? (-(8'haa)) : (~^(8'hb9))) : {((8'hb4) ? (7'h41) : (8'hbb)), (!(8'hba))})) ? (^(8'h9e)) : {((((8'hb5) * (8'hb1)) ^ {(7'h43)}) ? (~(~&(8'hbc))) : (((8'ha3) && (8'h9c)) ~^ ((8'hb6) >> (8'hbf)))), {({(8'hab)} ^ ((8'haf) <<< (8'h9d))), {{(8'hae), (7'h42)}}}}), 
parameter param63 = param62)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(2'h2):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
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
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire37,
                 wire36,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 (1'h0)};
  assign wire36 = wire34;
  assign wire37 = wire34[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg38 <= (~^($unsigned(((wire33 ^ wire33) ?
          wire37[(1'h1):(1'h1)] : wire35[(5'h11):(4'hf)])) << (7'h40)));
    end
  assign wire39 = ($unsigned((({wire35, wire36} ?
                              (wire35 - reg38) : (wire34 ? (8'hac) : (8'hba))) ?
                          wire37[(1'h0):(1'h0)] : (wire33 | (~^(8'hbc))))) ?
                      $unsigned(wire35[(2'h2):(1'h0)]) : $signed(($signed(((8'ha9) ?
                          (8'hae) : (8'hbc))) << $unsigned((reg38 != wire34)))));
  always
    @(posedge clk) begin
      reg40 <= wire34;
      reg41 <= wire37[(1'h0):(1'h0)];
      reg42 <= wire33[(1'h1):(1'h0)];
      if ($unsigned($signed(wire34)))
        begin
          reg43 <= wire32[(4'h9):(3'h5)];
        end
      else
        begin
          reg43 <= $signed({wire32[(4'h9):(1'h0)]});
          reg44 <= {reg43[(4'hb):(4'h8)],
              ($signed((~^$signed(reg40))) - {$signed(wire34[(4'h9):(3'h6)]),
                  reg42[(5'h12):(4'hb)]})};
          reg45 <= $unsigned(({$signed(wire35)} <<< $unsigned($unsigned((+wire39)))));
          reg46 <= $unsigned($unsigned((reg45[(4'hb):(3'h7)] <<< $unsigned(reg40[(1'h0):(1'h0)]))));
        end
      reg47 <= (reg41[(3'h5):(1'h1)] ?
          (+({(reg40 ?
                  reg42 : reg44)} - $signed({(7'h41)}))) : $signed($unsigned(reg44)));
    end
  assign wire48 = wire32[(5'h10):(3'h5)];
  assign wire49 = reg47;
  assign wire50 = (~&wire48);
  assign wire51 = reg38;
  assign wire52 = (|{$signed($signed(reg45[(3'h5):(2'h3)]))});
  assign wire53 = {$unsigned({{$unsigned(wire49)}})};
  assign wire54 = wire36;
  assign wire55 = $unsigned((~^wire54));
  assign wire56 = $signed(reg42[(4'hb):(3'h5)]);
  assign wire57 = reg47[(2'h2):(1'h0)];
  assign wire58 = (-(reg47 ?
                      {wire56[(2'h2):(1'h0)], (~|$signed(wire32))} : reg43));
  assign wire59 = (((reg38 ?
                          reg46[(3'h4):(2'h2)] : ((wire35 == reg43) & wire34[(4'h9):(2'h3)])) ?
                      (+((8'ha3) >= (-wire34))) : $signed($signed(wire34[(3'h7):(3'h5)]))) <= (~^reg47[(1'h0):(1'h0)]));
  assign wire60 = reg44;
  assign wire61 = wire34[(2'h2):(2'h2)];
endmodule

module module275  (y, clk, wire280, wire279, wire278, wire277, wire276);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire280;
  input wire [(5'h15):(1'h0)] wire279;
  input wire [(4'hd):(1'h0)] wire278;
  input wire signed [(4'hc):(1'h0)] wire277;
  input wire [(3'h7):(1'h0)] wire276;
  wire signed [(4'hc):(1'h0)] wire315;
  wire [(3'h6):(1'h0)] wire314;
  wire signed [(2'h3):(1'h0)] wire313;
  wire signed [(4'h9):(1'h0)] wire294;
  wire [(5'h11):(1'h0)] wire293;
  wire [(4'hb):(1'h0)] wire292;
  wire signed [(4'he):(1'h0)] wire291;
  wire [(4'hb):(1'h0)] wire290;
  wire [(5'h14):(1'h0)] wire289;
  wire [(4'ha):(1'h0)] wire288;
  wire signed [(2'h2):(1'h0)] wire287;
  wire signed [(4'hf):(1'h0)] wire286;
  wire signed [(4'hd):(1'h0)] wire285;
  wire signed [(4'hd):(1'h0)] wire284;
  wire [(4'ha):(1'h0)] wire283;
  wire [(3'h6):(1'h0)] wire282;
  wire signed [(5'h11):(1'h0)] wire281;
  reg [(5'h11):(1'h0)] reg312 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg311 = (1'h0);
  reg [(3'h5):(1'h0)] reg310 = (1'h0);
  reg [(5'h10):(1'h0)] reg309 = (1'h0);
  reg [(4'hc):(1'h0)] reg308 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg307 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg306 = (1'h0);
  reg [(5'h12):(1'h0)] reg305 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg304 = (1'h0);
  reg [(4'hc):(1'h0)] reg303 = (1'h0);
  reg [(4'hf):(1'h0)] reg302 = (1'h0);
  reg [(5'h13):(1'h0)] reg301 = (1'h0);
  reg [(2'h2):(1'h0)] reg300 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg299 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg298 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg297 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg296 = (1'h0);
  reg [(4'h8):(1'h0)] reg295 = (1'h0);
  assign y = {wire315,
                 wire314,
                 wire313,
                 wire294,
                 wire293,
                 wire292,
                 wire291,
                 wire290,
                 wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire282,
                 wire281,
                 reg312,
                 reg311,
                 reg310,
                 reg309,
                 reg308,
                 reg307,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 (1'h0)};
  assign wire281 = (^$unsigned(wire280));
  assign wire282 = $signed(wire281);
  assign wire283 = wire278[(1'h0):(1'h0)];
  assign wire284 = $unsigned($unsigned({{wire283}}));
  assign wire285 = ($unsigned(wire283[(3'h7):(2'h2)]) ?
                       (~|wire282) : (wire279 <= wire276));
  assign wire286 = wire277;
  assign wire287 = wire276[(3'h7):(3'h4)];
  assign wire288 = (wire278 && ($unsigned($signed($unsigned(wire287))) ?
                       wire283 : $unsigned((wire286[(4'ha):(3'h6)] <= wire286))));
  assign wire289 = (8'hbb);
  assign wire290 = ($signed($unsigned((wire284 < wire285))) | ($signed($signed((wire285 != wire278))) ?
                       wire281[(1'h0):(1'h0)] : $signed($unsigned($signed((8'hb7))))));
  assign wire291 = ((($signed((wire276 ? wire278 : wire276)) ?
                           ($unsigned((8'h9c)) ?
                               $unsigned(wire284) : (wire280 ~^ wire288)) : ((wire290 ?
                                   wire283 : wire287) ?
                               $unsigned((8'hba)) : (wire286 ?
                                   (8'hb5) : (8'ha8)))) ?
                       wire286[(1'h1):(1'h0)] : wire289) >= $unsigned({wire284[(2'h2):(1'h1)],
                       (|(wire277 && wire289))}));
  assign wire292 = (8'ha5);
  assign wire293 = ($unsigned({(8'ha2),
                       ((wire283 << wire276) ?
                           (wire288 ?
                               wire287 : (8'hab)) : (wire276 >>> wire286))}) + wire286);
  assign wire294 = wire289[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire289) ?
          (|wire278[(3'h5):(1'h0)]) : wire279[(4'he):(4'hd)])))
        begin
          reg295 <= wire280[(3'h6):(1'h1)];
          reg296 <= wire277;
          reg297 <= (-(8'hb5));
          reg298 <= reg296;
          if (wire282[(3'h4):(2'h3)])
            begin
              reg299 <= $signed((~wire276));
              reg300 <= wire279;
              reg301 <= wire283[(2'h3):(1'h0)];
              reg302 <= (|wire287);
            end
          else
            begin
              reg299 <= ((wire289[(4'hb):(3'h5)] >> $unsigned(reg300[(1'h1):(1'h0)])) <<< (~&wire290));
            end
        end
      else
        begin
          if ($unsigned(wire294))
            begin
              reg295 <= {{$signed((8'hb4))}};
              reg296 <= wire281;
              reg297 <= ($signed(($signed((reg297 ?
                  wire281 : wire293)) | {(^~wire290)})) <<< ({({wire280,
                              (7'h40)} ?
                          (wire285 ^ (8'ha0)) : $unsigned(wire292)),
                      ($signed((7'h43)) ?
                          {wire289, reg296} : (wire293 ? wire290 : wire281))} ?
                  wire277[(3'h4):(3'h4)] : wire287[(1'h0):(1'h0)]));
              reg298 <= (|reg296);
              reg299 <= (($signed({$unsigned(wire292),
                          (wire283 ? wire291 : reg297)}) ?
                      $signed($unsigned((wire278 ?
                          wire294 : wire282))) : reg300[(2'h2):(1'h1)]) ?
                  (&(&wire285)) : ($unsigned(wire290[(1'h0):(1'h0)]) || ($unsigned($unsigned(wire288)) ?
                      $signed($signed(wire292)) : $unsigned((^~(8'hbf))))));
            end
          else
            begin
              reg295 <= $unsigned($signed($signed($signed(reg300[(1'h0):(1'h0)]))));
              reg296 <= $signed(wire284);
            end
        end
    end
  always
    @(posedge clk) begin
      reg303 <= wire290[(3'h6):(3'h4)];
      if (($signed($signed((wire290 & $signed(wire284)))) ^ (-(~$unsigned($unsigned(reg299))))))
        begin
          reg304 <= (reg297[(4'h9):(3'h5)] ?
              {$unsigned((wire280[(3'h5):(1'h0)] > wire283[(3'h7):(3'h5)])),
                  (^(8'hbb))} : (~^$signed((~|reg295))));
        end
      else
        begin
          if ((+($signed((wire282[(3'h4):(1'h1)] ?
                  (wire291 > wire279) : (+(8'hb3)))) ?
              (((!wire291) <<< $unsigned(wire294)) ?
                  (wire277[(4'h9):(3'h5)] ?
                      wire278[(2'h2):(1'h0)] : $signed((8'ha7))) : wire290) : $unsigned((wire281 | wire287[(1'h0):(1'h0)])))))
            begin
              reg304 <= ($unsigned(reg298) != $unsigned((8'hb1)));
              reg305 <= {$signed((($signed(wire288) & $unsigned(reg297)) >> ($unsigned(wire288) >= ((8'hb6) & reg301))))};
            end
          else
            begin
              reg304 <= ((+(wire285[(3'h6):(3'h4)] ?
                      (~|reg297[(4'ha):(2'h2)]) : $unsigned(wire286[(2'h2):(2'h2)]))) ?
                  reg302 : wire279[(4'he):(2'h3)]);
              reg305 <= ({($signed({(8'had)}) + (~$unsigned(reg305)))} > $unsigned((&{reg304})));
              reg306 <= $signed({$signed($unsigned($signed(wire286)))});
              reg307 <= (wire278[(3'h7):(3'h7)] ?
                  wire276[(1'h1):(1'h0)] : reg303[(3'h6):(1'h0)]);
              reg308 <= wire280;
            end
          reg309 <= {$unsigned({$unsigned((reg300 ~^ reg303)),
                  $unsigned((wire289 && reg303))})};
          reg310 <= wire290[(1'h1):(1'h0)];
          reg311 <= reg300;
          reg312 <= ($unsigned($signed({wire285})) << $signed((((wire290 <<< reg306) ?
                  (~^(8'hb5)) : $signed(reg304)) ?
              $unsigned((&(8'haa))) : $signed({wire292}))));
        end
    end
  assign wire313 = (&((reg304[(1'h1):(1'h0)] ?
                       $unsigned((^~wire281)) : (&(wire280 <<< wire282))) == ($signed((|wire281)) ?
                       ((reg304 | reg298) ^ (reg302 ~^ (8'had))) : $signed($unsigned(wire276)))));
  assign wire314 = (reg296 >= reg296[(1'h1):(1'h1)]);
  assign wire315 = $unsigned($signed(wire278[(3'h7):(1'h0)]));
endmodule

module module214
#(parameter param262 = (((+(^{(8'hb7), (8'haa)})) ? (~^(((8'h9d) ? (7'h42) : (8'ha0)) ? ((8'hbd) ? (8'h9e) : (8'hb0)) : ((8'hb2) >> (8'hb7)))) : ((|((7'h43) ? (8'haa) : (8'hb8))) << (7'h44))) ~^ (~&((~&((8'hba) & (8'ha3))) ? {((8'hbd) ? (8'hab) : (8'ha8))} : (((8'ha8) ? (8'hb1) : (8'hb0)) <= ((8'ha1) ^ (8'ha9)))))))
(y, clk, wire219, wire218, wire217, wire216, wire215);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire219;
  input wire signed [(4'hc):(1'h0)] wire218;
  input wire [(3'h4):(1'h0)] wire217;
  input wire [(5'h11):(1'h0)] wire216;
  input wire signed [(4'hd):(1'h0)] wire215;
  wire signed [(3'h4):(1'h0)] wire261;
  wire [(4'hb):(1'h0)] wire260;
  wire [(4'hd):(1'h0)] wire259;
  wire signed [(5'h13):(1'h0)] wire258;
  wire [(4'hf):(1'h0)] wire257;
  wire [(4'hb):(1'h0)] wire256;
  wire [(2'h3):(1'h0)] wire255;
  wire signed [(4'ha):(1'h0)] wire254;
  wire signed [(4'h9):(1'h0)] wire244;
  wire [(5'h13):(1'h0)] wire243;
  wire signed [(2'h2):(1'h0)] wire242;
  wire [(4'h8):(1'h0)] wire225;
  wire [(4'hd):(1'h0)] wire224;
  wire signed [(2'h3):(1'h0)] wire223;
  wire signed [(4'hf):(1'h0)] wire222;
  wire signed [(5'h12):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire220;
  reg [(2'h3):(1'h0)] reg253 = (1'h0);
  reg [(5'h12):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg251 = (1'h0);
  reg [(3'h6):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg249 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg248 = (1'h0);
  reg [(5'h14):(1'h0)] reg247 = (1'h0);
  reg signed [(4'he):(1'h0)] reg246 = (1'h0);
  reg [(5'h14):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg241 = (1'h0);
  reg [(4'hf):(1'h0)] reg240 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg239 = (1'h0);
  reg [(5'h14):(1'h0)] reg238 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg235 = (1'h0);
  reg [(2'h2):(1'h0)] reg234 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg227 = (1'h0);
  reg [(4'hc):(1'h0)] reg226 = (1'h0);
  assign y = {wire261,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire244,
                 wire243,
                 wire242,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
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
                 (1'h0)};
  assign wire220 = ((wire219 ~^ (+wire219)) ?
                       $signed(($unsigned($signed(wire218)) ?
                           ($unsigned(wire215) ?
                               (7'h40) : (~&(8'ha5))) : $signed($signed(wire219)))) : $signed(({$unsigned(wire216)} ?
                           ((wire216 >= wire218) ?
                               $signed((8'ha3)) : $signed((8'hac))) : ($signed(wire217) - {wire219}))));
  assign wire221 = wire215;
  assign wire222 = $signed((~($unsigned(wire221) ?
                       ((wire218 ?
                           wire219 : wire217) != $unsigned(wire219)) : wire220[(4'h8):(3'h6)])));
  assign wire223 = (-((8'hb8) ?
                       $unsigned({wire220}) : {((8'ha7) ?
                               (|wire221) : ((8'haa) ? wire218 : wire221)),
                           $signed((^wire217))}));
  assign wire224 = ($unsigned((^~$unsigned(wire221))) >>> (|wire217[(1'h0):(1'h0)]));
  assign wire225 = wire224;
  always
    @(posedge clk) begin
      if ($signed(wire215))
        begin
          reg226 <= $unsigned((~|(~|wire225)));
          if (($signed(({{wire224}, $signed(wire215)} && (wire224 ?
                  (8'hb1) : ((8'ha3) ? wire222 : wire216)))) ?
              $signed(wire216) : $unsigned((^~{$signed(wire216),
                  (wire218 ? wire216 : wire218)}))))
            begin
              reg227 <= $unsigned((8'ha8));
              reg228 <= (wire215 ?
                  $signed((~wire219)) : {(|reg226),
                      {reg227, $unsigned($unsigned(wire219))}});
            end
          else
            begin
              reg227 <= reg227;
            end
          reg229 <= ((!$signed({reg228[(4'hd):(2'h2)],
              $unsigned(wire216)})) ~^ $unsigned($signed($signed((~wire223)))));
          reg230 <= ($signed((~&((wire215 >>> reg228) ?
              reg229 : {(8'ha3), wire215}))) << ((~^{wire225[(1'h1):(1'h1)],
                  wire225[(3'h7):(1'h0)]}) ?
              reg229[(3'h7):(3'h4)] : ({(wire219 != (7'h40)),
                      ((7'h40) == reg228)} ?
                  ((wire225 ?
                      wire225 : wire216) - (&wire222)) : $unsigned(wire221))));
          reg231 <= $signed(((~((wire224 ^ (8'hbe)) ?
              (|wire223) : wire218[(1'h1):(1'h0)])) << $signed(((wire221 ?
              reg227 : wire221) < wire215))));
        end
      else
        begin
          if (((~&wire223) ?
              (reg229 ?
                  $signed($unsigned($unsigned((8'had)))) : wire222) : $unsigned(reg230[(1'h1):(1'h1)])))
            begin
              reg226 <= $signed(reg228);
              reg227 <= reg227[(2'h2):(1'h0)];
              reg228 <= ($unsigned(($signed((wire225 ?
                      reg228 : reg230)) ~^ (reg226 ?
                      (wire221 ? reg230 : reg228) : $signed(reg231)))) ?
                  {wire217} : (~^{$unsigned($unsigned(reg228)),
                      wire224[(4'hc):(2'h2)]}));
              reg229 <= $signed(wire223);
            end
          else
            begin
              reg226 <= ((8'hb9) ?
                  $unsigned({(~&reg227[(4'hc):(3'h6)])}) : ($signed($unsigned($unsigned(wire215))) < ((~^$unsigned((7'h43))) ?
                      ($unsigned(wire219) <= $signed(reg227)) : (((8'hbe) ?
                              wire217 : wire219) ?
                          (wire221 ? wire216 : reg230) : reg230))));
            end
          reg230 <= $signed($unsigned((wire224 <= reg226)));
          reg231 <= (^~wire225[(1'h1):(1'h1)]);
          reg232 <= $unsigned((&wire223));
          reg233 <= reg227[(2'h2):(2'h2)];
        end
      if (($signed((~^$signed({wire220, wire225}))) != reg226))
        begin
          reg234 <= (&wire217);
          if (wire224)
            begin
              reg235 <= $signed($unsigned($signed((reg226 < (wire215 && wire216)))));
            end
          else
            begin
              reg235 <= reg229[(4'h9):(3'h6)];
              reg236 <= (&{reg233});
            end
          if ((~|reg234))
            begin
              reg237 <= ((&(~^$signed((~wire225)))) ~^ $signed(wire221));
            end
          else
            begin
              reg237 <= $unsigned($unsigned((+$unsigned((wire220 >= (8'haf))))));
              reg238 <= reg228;
              reg239 <= reg235[(4'h9):(3'h4)];
              reg240 <= (($unsigned((reg231[(5'h11):(3'h7)] ?
                      (wire223 ? (8'hb1) : wire224) : (~reg234))) ?
                  $unsigned((reg238 ?
                      reg235 : {(8'hb6),
                          reg238})) : ($unsigned((~|wire224)) & $unsigned(reg227))) + $unsigned((((^~(8'hb4)) << ((8'ha9) && wire215)) > $unsigned($unsigned(wire218)))));
            end
          reg241 <= ($unsigned((~&(~^(reg230 != reg240)))) ?
              ((reg230 ?
                  $unsigned($signed(reg230)) : $unsigned((-reg235))) == (reg226 ?
                  {reg230[(2'h2):(1'h0)],
                      (reg226 || wire216)} : $signed($unsigned(reg232)))) : wire215);
        end
      else
        begin
          reg234 <= wire219;
          reg235 <= $signed(reg231[(5'h13):(5'h11)]);
          reg236 <= reg230[(2'h2):(1'h1)];
        end
    end
  assign wire242 = reg238;
  assign wire243 = (reg235 && (reg231[(3'h7):(1'h1)] << ($unsigned((wire225 ?
                       reg230 : wire222)) & (|reg232))));
  assign wire244 = $signed(reg234[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg245 <= reg231[(5'h11):(3'h5)];
      reg246 <= (8'hbb);
      reg247 <= (~|$unsigned(((8'hbd) ?
          (wire220 >> (reg229 ?
              (8'hb5) : wire219)) : (reg245 ^ $signed((8'hbe))))));
      reg248 <= $signed(wire216[(4'hc):(1'h0)]);
      if ((8'hbb))
        begin
          reg249 <= ($unsigned(($signed($signed(reg229)) > ((+reg231) ?
              (wire219 <<< reg232) : $unsigned(reg228)))) >> wire221);
          if (({(reg226[(1'h0):(1'h0)] ?
                      ((wire221 ? reg248 : wire219) ?
                          (reg231 ?
                              wire216 : wire217) : $signed(wire224)) : $unsigned((8'ha0))),
                  ((8'hb0) ?
                      reg246[(1'h1):(1'h0)] : (wire215[(3'h5):(2'h2)] ?
                          $unsigned(reg231) : reg238[(4'hb):(2'h2)]))} ?
              wire243 : ($signed($signed(reg230)) ~^ reg246[(2'h2):(2'h2)])))
            begin
              reg250 <= ({reg234[(2'h2):(2'h2)]} ?
                  (wire217[(3'h4):(1'h0)] ~^ wire218[(4'hc):(4'h9)]) : ({$unsigned((reg236 || wire217))} ?
                      $unsigned((-$signed(wire217))) : {wire244[(3'h7):(3'h7)],
                          ($signed((8'ha4)) ?
                              wire221 : (wire223 >> wire217))}));
              reg251 <= $unsigned(($unsigned(wire223) ?
                  $unsigned({$unsigned(reg233),
                      $unsigned(wire225)}) : reg250[(2'h3):(2'h2)]));
            end
          else
            begin
              reg250 <= {(+wire222[(4'h8):(3'h5)]),
                  (reg228[(3'h5):(1'h1)] ?
                      $signed({(wire217 ? (8'ha0) : reg230),
                          (wire218 <<< reg250)}) : wire221)};
              reg251 <= $signed(wire217[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg249 <= (~^$unsigned(reg233[(1'h0):(1'h0)]));
          reg250 <= ($unsigned($signed((^~{reg234}))) >>> $signed($signed((!(wire242 ~^ wire244)))));
          reg251 <= (&reg232[(4'h9):(4'h8)]);
          if (reg250[(3'h6):(3'h5)])
            begin
              reg252 <= ((^~$unsigned($unsigned(wire223[(2'h3):(2'h2)]))) ?
                  (!wire244) : $unsigned((reg230 << (^reg231))));
            end
          else
            begin
              reg252 <= reg247;
              reg253 <= {(wire222 + (8'hb3)), reg228[(4'h9):(3'h4)]};
            end
        end
    end
  assign wire254 = wire217;
  assign wire255 = (($signed({reg240[(3'h5):(3'h4)],
                           (+reg246)}) & {$signed((~^reg228))}) ?
                       wire216 : $signed((reg230[(2'h2):(1'h0)] ?
                           $unsigned({reg229,
                               wire217}) : $unsigned(wire218[(1'h0):(1'h0)]))));
  assign wire256 = reg231;
  assign wire257 = wire222[(4'hb):(4'h8)];
  assign wire258 = {$unsigned((|(-$unsigned(reg253)))),
                       {wire221[(4'hd):(2'h3)],
                           $signed({reg237[(3'h6):(3'h4)]})}};
  assign wire259 = $unsigned(wire224[(3'h5):(1'h0)]);
  assign wire260 = $signed(wire244[(3'h6):(1'h0)]);
  assign wire261 = ((~|(-$signed(((8'hb2) ? reg231 : reg233)))) ?
                       (~^{wire255}) : (($signed(((8'ha4) ?
                               wire258 : wire225)) == (+wire217)) ?
                           $unsigned($signed(reg240)) : (-reg234)));
endmodule

module module191  (y, clk, wire196, wire195, wire194, wire193, wire192);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire196;
  input wire [(3'h5):(1'h0)] wire195;
  input wire signed [(5'h14):(1'h0)] wire194;
  input wire signed [(5'h11):(1'h0)] wire193;
  input wire signed [(3'h4):(1'h0)] wire192;
  wire [(5'h13):(1'h0)] wire202;
  wire signed [(5'h13):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire198;
  wire [(4'hb):(1'h0)] wire197;
  assign y = {wire202, wire201, wire200, wire199, wire198, wire197, (1'h0)};
  assign wire197 = $unsigned($unsigned($signed(((wire194 >= (7'h43)) | (wire192 ^~ wire192)))));
  assign wire198 = wire197[(2'h2):(1'h0)];
  assign wire199 = ((wire194[(4'h9):(1'h1)] ^ (7'h41)) ?
                       wire198 : (($unsigned($unsigned(wire198)) ?
                           $signed($signed((8'ha7))) : {(wire194 || wire196)}) + wire194));
  assign wire200 = (~&$signed($signed((~^(wire197 ? (7'h42) : wire196)))));
  assign wire201 = (8'hba);
  assign wire202 = $unsigned(wire194);
endmodule
