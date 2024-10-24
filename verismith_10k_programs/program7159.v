module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire289;
  wire [(3'h5):(1'h0)] wire288;
  wire [(4'hf):(1'h0)] wire287;
  wire [(4'h9):(1'h0)] wire286;
  wire signed [(5'h15):(1'h0)] wire285;
  wire signed [(5'h13):(1'h0)] wire284;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire282;
  reg [(4'hf):(1'h0)] reg290 = (1'h0);
  assign y = {wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire34,
                 wire36,
                 wire37,
                 wire282,
                 reg290,
                 (1'h0)};
  module4 #() modinst35 (wire34, clk, wire2, wire0, wire1, wire3);
  assign wire36 = wire1;
  assign wire37 = $signed((-((wire34[(3'h5):(1'h0)] ?
                      {wire3, wire34} : $unsigned(wire1)) >= (((8'hae) ?
                      wire2 : wire34) == wire0[(4'hd):(2'h3)]))));
  module38 #() modinst283 (wire282, clk, wire0, wire37, wire36, wire34, wire1);
  assign wire284 = wire1;
  assign wire285 = $unsigned((-$signed($unsigned((~|wire3)))));
  assign wire286 = (+(~wire282));
  assign wire287 = (~^wire36);
  assign wire288 = wire0[(5'h13):(2'h2)];
  assign wire289 = wire287;
  always
    @(posedge clk) begin
      reg290 <= (($unsigned((~&$unsigned(wire287))) != (wire284 ?
          ($unsigned((8'ha8)) ?
              (wire288 & (8'hb7)) : wire3) : wire0)) ^~ (~^(~&wire2[(2'h3):(2'h3)])));
    end
endmodule

module module38
#(parameter param281 = ((~(({(7'h44), (8'ha6)} ? ((8'hb0) ~^ (8'ha7)) : (|(8'hae))) ~^ (((8'hb2) ? (8'hba) : (8'ha8)) == ((8'ha1) ? (8'hb2) : (8'h9d))))) ? ({(((8'h9c) - (8'hb4)) ? ((8'hb0) >= (8'hb0)) : {(8'ha7)})} ? ((((8'hb0) && (7'h42)) ? ((7'h42) & (7'h43)) : ((8'ha3) ? (8'h9c) : (8'hb1))) ? (((8'haa) ? (8'hbf) : (8'hbe)) * ((8'haa) <<< (8'hbd))) : (~|((8'hb3) ? (8'h9c) : (8'hbe)))) : (({(8'ha6)} ? ((8'ha3) << (8'hb3)) : ((8'ha8) ? (8'hbe) : (7'h44))) & (^~((8'hb4) ? (8'hac) : (7'h44))))) : (((~&(!(8'ha2))) ~^ {(7'h40)}) << (-(~&((8'ha5) ^~ (8'haf)))))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h265):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire43;
  input wire [(4'he):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire280;
  wire signed [(4'hb):(1'h0)] wire279;
  wire signed [(4'hf):(1'h0)] wire278;
  wire [(4'h8):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire209;
  wire signed [(4'ha):(1'h0)] wire210;
  wire [(3'h7):(1'h0)] wire211;
  wire [(5'h13):(1'h0)] wire212;
  wire [(3'h7):(1'h0)] wire213;
  wire [(3'h7):(1'h0)] wire276;
  reg signed [(3'h5):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg207 = (1'h0);
  reg [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg201 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(3'h7):(1'h0)] reg198 = (1'h0);
  reg [(5'h14):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg [(4'h9):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'h9):(1'h0)] reg193 = (1'h0);
  reg [(5'h10):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  assign y = {wire280,
                 wire279,
                 wire278,
                 wire182,
                 wire147,
                 wire125,
                 wire90,
                 wire89,
                 wire87,
                 wire53,
                 wire52,
                 wire45,
                 wire44,
                 wire209,
                 wire210,
                 wire211,
                 wire212,
                 wire213,
                 wire276,
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
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire44 = wire43[(3'h4):(2'h2)];
  assign wire45 = wire43[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg46 <= ($unsigned($unsigned((wire40 < $signed(wire39)))) && (8'h9c));
      reg47 <= (+({((~reg46) * $signed(wire41))} ?
          ($signed($unsigned(wire40)) ?
              $unsigned((wire43 ?
                  wire43 : wire42)) : $unsigned((+(8'ha8)))) : (^(^(&(8'hab))))));
      if ((wire43[(4'h8):(1'h1)] ?
          $unsigned((|((+wire45) ?
              wire44 : $unsigned((8'ha4))))) : (|$unsigned($signed((^wire43))))))
        begin
          reg48 <= $signed(($signed($signed((reg46 >= wire39))) ?
              $signed({$signed(reg47),
                  (wire44 | wire43)}) : reg46[(3'h5):(3'h4)]));
        end
      else
        begin
          reg48 <= {wire42[(3'h4):(3'h4)],
              (reg46 ?
                  (($unsigned(reg46) ? (wire41 || wire42) : $unsigned(wire41)) ?
                      ((+reg48) == wire39[(1'h1):(1'h0)]) : $unsigned((reg48 ?
                          reg47 : wire41))) : $signed($unsigned((reg48 ?
                      wire44 : wire45))))};
          reg49 <= wire44[(1'h0):(1'h0)];
          reg50 <= (^~{wire43});
          reg51 <= {($signed(reg50) < ((+$unsigned((7'h43))) * (wire45 ?
                  $unsigned(wire39) : {wire43})))};
        end
    end
  assign wire52 = wire39[(2'h2):(1'h1)];
  assign wire53 = $signed($unsigned((reg50[(3'h5):(3'h5)] ?
                      ($unsigned(reg48) > (wire41 + (8'hb1))) : $signed(wire39[(4'he):(4'ha)]))));
  module54 #() modinst88 (wire87, clk, wire53, reg49, wire52, reg48, reg50);
  assign wire89 = wire44;
  assign wire90 = $unsigned((~&reg47));
  module91 #() modinst126 (wire125, clk, wire90, reg49, reg46, wire41);
  module127 #() modinst148 (.clk(clk), .wire131(wire41), .wire129(wire42), .y(wire147), .wire132(reg46), .wire128(wire40), .wire130(wire90));
  module149 #() modinst183 (wire182, clk, wire45, wire90, reg50, wire41);
  always
    @(posedge clk) begin
      if ((&wire125))
        begin
          reg184 <= $signed((~|(~&(~wire125[(5'h13):(1'h1)]))));
          reg185 <= $unsigned($unsigned(($unsigned((^wire44)) ?
              wire53 : {wire42[(3'h6):(1'h1)]})));
        end
      else
        begin
          reg184 <= (&$signed((8'h9d)));
          reg185 <= wire147[(2'h3):(1'h1)];
          if (reg184[(2'h3):(1'h1)])
            begin
              reg186 <= $signed($unsigned((wire41[(5'h10):(5'h10)] || $signed((wire182 ?
                  (8'hb4) : wire89)))));
              reg187 <= ($signed($signed({wire42, (wire42 ^~ (8'hac))})) ?
                  (((wire182 ?
                      wire45 : reg50) ^ ({reg184} >= $signed(wire89))) | reg49) : ($unsigned(((wire182 ?
                      reg51 : wire42) != wire125[(1'h0):(1'h0)])) < (-{(-reg186),
                      (+wire52)})));
              reg188 <= (reg46 && (($unsigned((8'hb2)) ~^ {(+wire147),
                      reg47[(3'h5):(2'h2)]}) ?
                  ($unsigned((reg51 > wire40)) ?
                      (~(wire40 ?
                          wire42 : reg46)) : $signed(reg51)) : (|((~^reg187) - (!wire40)))));
              reg189 <= (~(+(^~(^reg184[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg186 <= reg46;
              reg187 <= ((|$unsigned((~^(!wire42)))) > (wire87[(4'ha):(4'h8)] > $unsigned($unsigned((wire52 ?
                  wire53 : wire41)))));
              reg188 <= $signed({($unsigned((&wire45)) ?
                      ((wire41 ? (8'hbc) : reg48) ?
                          $signed((8'ha3)) : $signed(reg189)) : (-{wire43}))});
              reg189 <= ((wire147 ? wire125 : wire52) >>> ($signed(((wire44 ?
                  reg46 : wire40) & $signed(reg189))) ~^ ($unsigned(((8'h9f) ?
                  (8'hbf) : wire53)) != $signed($unsigned(wire147)))));
              reg190 <= ($unsigned((((reg189 ? wire87 : wire41) ?
                          reg184[(3'h4):(1'h1)] : (reg46 != wire44)) ?
                      wire53[(4'hc):(3'h6)] : reg50[(4'ha):(3'h5)])) ?
                  $unsigned({($signed(wire90) || $signed(wire125))}) : wire89);
            end
          reg191 <= reg190[(4'h9):(3'h6)];
        end
      if (reg46)
        begin
          if (reg184[(3'h4):(3'h4)])
            begin
              reg192 <= ((reg50[(4'he):(4'hd)] ^~ ((reg50[(4'hf):(1'h0)] >= (~^wire53)) ?
                      reg190[(5'h14):(3'h6)] : (^~$signed((7'h44))))) ?
                  wire42[(3'h5):(2'h3)] : ($unsigned(wire52[(4'h9):(4'h9)]) ?
                      ($signed(wire125[(5'h10):(3'h4)]) > ($signed((8'ha9)) >> (8'haa))) : $signed(reg47[(4'h9):(4'h9)])));
            end
          else
            begin
              reg192 <= reg50[(4'hf):(4'he)];
            end
          reg193 <= (!$unsigned((8'hb9)));
          reg194 <= (~reg187);
          if ($signed(wire182))
            begin
              reg195 <= $unsigned(((~^(wire90[(4'hc):(1'h0)] ?
                  $unsigned(reg192) : $signed(reg48))) && reg49[(4'ha):(4'h9)]));
              reg196 <= $unsigned(wire42);
              reg197 <= (+reg190[(4'hc):(3'h6)]);
              reg198 <= $signed(((+{$signed(reg195)}) >= (+$unsigned(wire40[(2'h2):(1'h0)]))));
              reg199 <= ($signed(wire87[(2'h2):(2'h2)]) ?
                  {($signed({reg46}) ?
                          $unsigned((wire182 ?
                              reg47 : (8'hb9))) : $unsigned($signed(reg185)))} : ($unsigned($signed((wire52 ~^ reg196))) ?
                      $unsigned((!{reg192,
                          reg196})) : $unsigned($signed((reg46 <<< reg193)))));
            end
          else
            begin
              reg195 <= ($unsigned(((~^{reg192,
                  (8'hbd)}) ^ $signed((+wire39)))) ~^ {(^(wire41 <<< {reg184,
                      wire89})),
                  $signed(reg187)});
              reg196 <= ($unsigned(($signed(reg46) ?
                  (8'ha5) : $unsigned(wire89[(3'h5):(3'h4)]))) == wire44[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg192 <= reg48;
          reg193 <= $unsigned({$unsigned(((~&wire89) <= $signed(wire52))),
              $unsigned({(&reg47), (^~reg48)})});
        end
      if ((+(reg194[(2'h2):(1'h0)] ?
          wire147[(2'h2):(2'h2)] : $unsigned(({reg196, reg193} ?
              $unsigned((8'hb7)) : reg184[(2'h3):(2'h2)])))))
        begin
          reg200 <= {(reg188 <<< (wire43 | wire89[(3'h4):(1'h0)]))};
          reg201 <= ((-(7'h42)) ?
              $unsigned($unsigned((|$signed(wire90)))) : $unsigned(reg49));
          if ({(reg184[(3'h5):(3'h4)] ?
                  (7'h44) : (((reg195 * reg200) ?
                      (reg195 ?
                          wire42 : wire90) : $unsigned((8'hb3))) || reg47)),
              ($signed((+$signed(wire53))) || wire147)})
            begin
              reg202 <= ({(~wire40[(3'h7):(3'h6)]),
                  (^reg51)} * ((|(!$unsigned(wire44))) >>> ($signed(reg186) ?
                  reg189[(4'he):(4'hb)] : ({reg51, reg201} | $signed(reg47)))));
              reg203 <= ((~&(&$signed(reg47))) && $unsigned((7'h44)));
              reg204 <= (wire147[(1'h1):(1'h1)] ?
                  $signed(wire125[(4'he):(3'h5)]) : reg203);
              reg205 <= $unsigned((((wire125 ? (-reg204) : (wire44 == reg47)) ?
                  (~^wire40) : (~|(reg48 ?
                      (8'hb0) : reg196))) - $unsigned(($unsigned(wire87) ?
                  reg48 : wire147))));
            end
          else
            begin
              reg202 <= ($signed(((reg187 | (8'hb8)) ?
                  wire125 : $signed(((7'h42) ?
                      (8'hb8) : reg190)))) || (-{($unsigned(reg197) ?
                      $signed(wire52) : {(8'ha7), reg205})}));
            end
        end
      else
        begin
          reg200 <= $signed($signed(reg203));
          if (wire147)
            begin
              reg201 <= reg203;
              reg202 <= $unsigned((8'haf));
              reg203 <= (8'hb1);
              reg204 <= (^~(8'hb7));
            end
          else
            begin
              reg201 <= $signed(wire44);
            end
          reg205 <= $unsigned($signed((wire41 ?
              (-(reg205 == reg203)) : wire43[(4'h8):(1'h1)])));
          reg206 <= (reg199 ?
              $signed($signed((wire39[(4'h9):(2'h3)] ?
                  {reg202, reg195} : $signed(wire42)))) : wire39);
          reg207 <= (($unsigned($unsigned((reg189 ^~ reg184))) ?
              wire41 : reg197[(5'h12):(4'hc)]) * reg205[(1'h1):(1'h0)]);
        end
      reg208 <= ($unsigned($signed($signed($signed(wire40)))) || wire40[(1'h0):(1'h0)]);
    end
  assign wire209 = $signed((~reg195[(4'h9):(4'h8)]));
  assign wire210 = wire147;
  assign wire211 = $signed($signed($signed(wire53[(3'h5):(3'h4)])));
  assign wire212 = wire43[(1'h0):(1'h0)];
  assign wire213 = wire147;
  module214 #() modinst277 (wire276, clk, reg197, wire209, wire212, reg208, wire42);
  assign wire278 = (((((wire147 - reg187) && (reg199 >= reg188)) ?
                               reg202 : $signed($signed(wire209))) ?
                           $unsigned($unsigned({wire182})) : {$unsigned($unsigned((8'ha4))),
                               wire43[(1'h0):(1'h0)]}) ?
                       (reg201[(1'h1):(1'h0)] ?
                           (wire43[(3'h5):(1'h1)] - reg199) : $signed(reg47)) : ((($unsigned(wire39) ?
                               reg204 : (~^wire43)) ?
                           $unsigned($signed(reg184)) : $unsigned((wire182 ?
                               wire212 : reg201))) ^~ $unsigned((reg191 || ((8'hbb) ?
                           reg51 : reg201)))));
  assign wire279 = (^~wire278);
  assign wire280 = $signed($unsigned($unsigned(($signed((8'hbf)) ^~ $unsigned(wire125)))));
endmodule

module module4
#(parameter param33 = ((+{(((8'hb6) ~^ (8'hba)) && ((7'h44) | (7'h41))), ({(7'h40)} ^~ (|(8'ha2)))}) * ({(((8'ha1) * (8'ha5)) >= ((8'had) ? (7'h40) : (8'hb0))), (8'ha0)} >>> (+{{(8'had), (8'haf)}}))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire29;
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire17,
                 wire29,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire7 ?
              $signed(($unsigned(wire8) ?
                  wire8[(3'h4):(1'h0)] : {(8'ha3)})) : wire5[(2'h2):(2'h2)]) ?
          (wire8 << (wire5 - $signed(((8'hb9) < wire5)))) : ($unsigned($unsigned(wire5[(1'h0):(1'h0)])) == wire5)))
        begin
          reg9 <= (wire5 ?
              wire7[(2'h3):(2'h2)] : ($signed(wire6) ^~ $signed((8'haf))));
        end
      else
        begin
          reg9 <= $unsigned(wire8);
          reg10 <= wire5[(1'h1):(1'h0)];
          reg11 <= wire6[(2'h2):(1'h1)];
          reg12 <= $unsigned(wire6[(4'h8):(1'h1)]);
          if ({(reg11[(2'h2):(1'h0)] ?
                  $signed(wire6) : ($signed((~wire6)) == (reg9[(2'h3):(1'h1)] >>> $signed(reg9)))),
              (~|(~wire7[(2'h3):(1'h1)]))})
            begin
              reg13 <= ($signed(wire8) & ((~&(~&(-(8'hbd)))) ?
                  {($unsigned(reg11) | (8'hbb)),
                      wire8[(3'h4):(2'h3)]} : ((~(wire7 ?
                      reg11 : reg10)) ^ (reg11[(3'h4):(3'h4)] >= reg10))));
              reg14 <= (wire8[(2'h3):(1'h0)] ?
                  wire5 : ($signed(reg13[(3'h6):(3'h6)]) ?
                      reg12[(1'h1):(1'h0)] : wire7[(2'h3):(1'h0)]));
              reg15 <= (~reg14[(5'h10):(4'ha)]);
            end
          else
            begin
              reg13 <= $signed($signed(reg15[(2'h2):(1'h0)]));
            end
        end
      reg16 <= {wire5[(1'h0):(1'h0)]};
    end
  assign wire17 = (~&reg14);
  module18 #() modinst30 (wire29, clk, wire8, wire5, wire7, reg12);
  assign wire31 = (-wire8);
  assign wire32 = $unsigned((reg9[(1'h1):(1'h1)] ?
                      $unsigned($unsigned($unsigned(wire29))) : ((reg14 != $signed(reg9)) == $unsigned((wire8 ?
                          reg15 : wire17)))));
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  assign y = {wire26, wire25, wire24, wire23, reg28, reg27, (1'h0)};
  assign wire23 = (^~$signed({((8'ha5) ?
                          (wire21 ? wire20 : wire19) : $unsigned(wire20))}));
  assign wire24 = wire19[(3'h5):(2'h3)];
  assign wire25 = wire21[(4'h8):(3'h7)];
  assign wire26 = (((($signed(wire21) != (wire23 - wire20)) == wire25[(3'h5):(2'h3)]) ?
                          ($signed({wire22, wire19}) ?
                              wire19[(4'hf):(3'h4)] : ({wire21, wire19} ?
                                  wire25 : (-wire25))) : $unsigned(wire23)) ?
                      {{$unsigned((wire24 ^~ wire25))},
                          (wire22[(1'h1):(1'h1)] >>> $signed($unsigned(wire23)))} : $signed({($signed(wire21) ?
                              $unsigned(wire25) : $signed(wire23)),
                          $signed((~^wire23))}));
  always
    @(posedge clk) begin
      reg27 <= wire25;
      reg28 <= $signed($unsigned((wire21[(2'h3):(2'h2)] + $unsigned(wire26[(3'h4):(1'h1)]))));
    end
endmodule

module module214
#(parameter param275 = (8'ha8))
(y, clk, wire219, wire218, wire217, wire216, wire215);
  output wire [(32'h2c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire219;
  input wire [(4'he):(1'h0)] wire218;
  input wire signed [(3'h4):(1'h0)] wire217;
  input wire [(3'h5):(1'h0)] wire216;
  input wire [(4'h8):(1'h0)] wire215;
  wire [(3'h4):(1'h0)] wire274;
  wire [(4'hc):(1'h0)] wire273;
  wire [(5'h10):(1'h0)] wire255;
  wire signed [(4'ha):(1'h0)] wire254;
  wire [(4'hf):(1'h0)] wire253;
  wire signed [(3'h5):(1'h0)] wire252;
  wire [(3'h6):(1'h0)] wire251;
  wire [(3'h6):(1'h0)] wire250;
  wire signed [(5'h14):(1'h0)] wire249;
  wire signed [(4'h8):(1'h0)] wire248;
  wire signed [(5'h15):(1'h0)] wire247;
  wire [(5'h12):(1'h0)] wire227;
  wire signed [(4'hd):(1'h0)] wire226;
  wire [(5'h11):(1'h0)] wire225;
  wire [(3'h6):(1'h0)] wire224;
  wire [(5'h12):(1'h0)] wire223;
  wire signed [(5'h10):(1'h0)] wire221;
  wire signed [(4'hd):(1'h0)] wire220;
  reg [(4'h8):(1'h0)] reg272 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg271 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg270 = (1'h0);
  reg [(5'h10):(1'h0)] reg269 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg267 = (1'h0);
  reg [(2'h3):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg265 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg264 = (1'h0);
  reg [(3'h4):(1'h0)] reg263 = (1'h0);
  reg signed [(4'he):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg260 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg257 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg243 = (1'h0);
  reg [(5'h10):(1'h0)] reg242 = (1'h0);
  reg [(5'h11):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg239 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg237 = (1'h0);
  reg [(5'h10):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg234 = (1'h0);
  reg [(4'hd):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg232 = (1'h0);
  reg [(4'hf):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg228 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  assign y = {wire274,
                 wire273,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire221,
                 wire220,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
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
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg222,
                 (1'h0)};
  assign wire220 = $unsigned(((wire216 ?
                           ({wire219,
                               wire219} != $unsigned(wire215)) : (~$signed(wire218))) ?
                       ((~^wire215[(1'h1):(1'h1)]) ^~ wire215[(2'h3):(1'h0)]) : wire219));
  assign wire221 = $unsigned({{wire219[(2'h2):(1'h1)], wire220}});
  always
    @(posedge clk) begin
      reg222 <= $signed((wire218[(2'h3):(2'h2)] << {($unsigned(wire217) ?
              (+wire218) : $signed(wire217)),
          $unsigned((wire216 * (8'ha1)))}));
    end
  assign wire223 = $signed(($signed($unsigned(wire220[(4'hd):(3'h7)])) ?
                       $unsigned(wire215) : (wire220[(3'h5):(1'h1)] & (wire217 > (wire221 || wire218)))));
  assign wire224 = $unsigned((-$unsigned($signed(wire216))));
  assign wire225 = (~|(($signed((|wire223)) + $signed(wire219)) ?
                       $unsigned((|{wire219,
                           wire219})) : (($unsigned(wire221) <= (^wire221)) || wire224[(2'h2):(1'h0)])));
  assign wire226 = wire215[(3'h4):(3'h4)];
  assign wire227 = {(reg222 <<< ({wire221} ?
                           $unsigned($signed(wire217)) : wire217))};
  always
    @(posedge clk) begin
      if ((~&wire218[(3'h5):(3'h4)]))
        begin
          if ({(((wire220[(2'h2):(2'h2)] ?
                      wire221 : reg222) <<< (!$unsigned(wire226))) ?
                  wire220[(4'h8):(3'h7)] : wire216[(2'h2):(2'h2)]),
              wire223})
            begin
              reg228 <= $unsigned($signed(($unsigned((8'hab)) ?
                  wire219[(2'h2):(1'h1)] : {(wire224 && reg222),
                      ((7'h44) ? (8'hbc) : wire224)})));
              reg229 <= wire219[(1'h0):(1'h0)];
            end
          else
            begin
              reg228 <= (wire226[(4'ha):(2'h2)] ^~ (wire220[(2'h2):(2'h2)] ?
                  wire223[(5'h11):(4'h9)] : (^$signed(reg229[(2'h3):(1'h0)]))));
              reg229 <= (-$signed((reg222 + (reg228 ?
                  wire225 : $unsigned((7'h40))))));
            end
          if ($signed((wire220 != $signed(reg228[(1'h0):(1'h0)]))))
            begin
              reg230 <= (-(&$signed(((wire220 ^~ reg229) != (8'hbf)))));
              reg231 <= wire215[(1'h1):(1'h0)];
              reg232 <= $unsigned((~^reg228[(2'h3):(1'h1)]));
              reg233 <= {($signed((|reg222[(4'hd):(4'hc)])) - {wire223,
                      ($unsigned(reg232) != (8'ha1))})};
              reg234 <= ((wire224 ^~ wire216) ?
                  {((reg229[(4'he):(3'h4)] ?
                          $unsigned(wire219) : (wire227 & wire217)) && $unsigned($unsigned(wire219)))} : (|((wire224[(3'h4):(3'h4)] ?
                          $unsigned(wire218) : reg222) ?
                      ($signed(wire215) && (wire226 < (8'ha7))) : wire220)));
            end
          else
            begin
              reg230 <= $signed(reg234[(2'h2):(1'h1)]);
              reg231 <= (wire225 << (~|$unsigned(wire215)));
              reg232 <= $signed(wire227[(4'hd):(4'hb)]);
            end
          reg235 <= ((reg228[(3'h6):(2'h2)] ?
              (|$signed($signed(wire217))) : (($unsigned(reg231) << (wire226 ?
                      reg222 : wire216)) ?
                  wire225 : (8'ha0))) ^ $signed($unsigned((reg234[(1'h0):(1'h0)] ?
              (~&wire220) : (wire225 ? reg222 : wire224)))));
          reg236 <= wire226;
          if ($signed(reg236))
            begin
              reg237 <= wire226;
            end
          else
            begin
              reg237 <= wire219[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg228 <= {reg231[(4'hb):(2'h2)]};
          reg229 <= $unsigned(wire216);
          reg230 <= $signed($unsigned(((reg237 ?
              (8'h9d) : (8'hb5)) ^ wire226)));
        end
      reg238 <= wire225[(5'h10):(1'h1)];
      reg239 <= $signed($unsigned(wire219));
      reg240 <= reg235[(1'h1):(1'h1)];
      if (wire218)
        begin
          reg241 <= (8'hba);
          if (($unsigned((8'hbc)) >>> reg241[(3'h7):(1'h1)]))
            begin
              reg242 <= (-reg239[(2'h2):(2'h2)]);
              reg243 <= (reg239[(2'h2):(2'h2)] ?
                  (+reg240[(4'h8):(3'h7)]) : $signed((wire220 ?
                      reg237 : ((reg232 ?
                          reg229 : wire224) ~^ $signed(wire227)))));
            end
          else
            begin
              reg242 <= reg229;
              reg243 <= {{($unsigned((wire221 <= wire226)) ?
                          (&(&reg231)) : (^~(!reg237)))},
                  ({{$unsigned(wire217),
                          reg222}} >= ($signed((~|wire217)) && $unsigned($unsigned(wire224))))};
            end
          reg244 <= wire223;
          reg245 <= reg241[(4'hd):(1'h0)];
          reg246 <= ($signed($signed($unsigned($unsigned(reg241)))) ?
              $signed($signed((reg231 ?
                  (^~reg240) : (wire226 << reg242)))) : ((+($signed(reg222) ?
                      reg235[(4'h8):(1'h1)] : reg228)) ?
                  ($signed((|wire221)) >> $unsigned($signed(reg243))) : wire215[(2'h3):(1'h1)]));
        end
      else
        begin
          reg241 <= reg233;
          reg242 <= wire221[(4'h8):(3'h6)];
          reg243 <= wire220[(1'h1):(1'h1)];
          reg244 <= reg246[(3'h4):(1'h1)];
        end
    end
  assign wire247 = $unsigned((~^($unsigned((^~reg244)) || {{(8'hb5),
                           reg234}})));
  assign wire248 = reg230[(3'h4):(1'h0)];
  assign wire249 = $signed((~(reg232 != (reg246[(3'h7):(3'h4)] - {reg240}))));
  assign wire250 = (!(~|((|(-(7'h42))) ?
                       (8'hbe) : ((reg237 * wire220) ?
                           (wire248 * wire227) : wire247))));
  assign wire251 = ((($unsigned($unsigned((8'haf))) ?
                           (~(reg235 ?
                               reg236 : wire247)) : ($signed(reg234) && ((8'h9f) >> reg234))) >>> (~(!$unsigned(wire227)))) ?
                       (|wire219[(4'h8):(3'h6)]) : reg241[(4'hc):(1'h1)]);
  assign wire252 = ((wire216 & ($signed(wire218[(4'h8):(3'h4)]) ?
                       $unsigned((reg239 * (8'hb0))) : ($unsigned((8'hb6)) || {wire220,
                           (8'ha9)}))) && {(reg241[(1'h1):(1'h0)] ?
                           ($unsigned(wire251) ^~ $signed(reg246)) : ((wire224 ?
                                   (8'hb7) : reg244) ?
                               $unsigned(reg233) : (wire224 ?
                                   reg233 : reg242)))});
  assign wire253 = (!$signed(reg228));
  assign wire254 = reg241[(3'h4):(1'h0)];
  assign wire255 = (({reg234[(3'h4):(1'h1)]} << wire220[(4'hb):(3'h6)]) < (^((^~$unsigned(reg230)) ?
                       (-reg231[(1'h1):(1'h0)]) : $unsigned((wire253 ?
                           reg222 : wire251)))));
  always
    @(posedge clk) begin
      if ({$unsigned((reg235 ^ (reg237[(5'h12):(3'h4)] ?
              ((8'hb6) ? reg236 : reg239) : $unsigned(wire217)))),
          {(&(^(+wire219))),
              $unsigned($unsigned((reg231 ? wire217 : wire251)))}})
        begin
          reg256 <= ((((reg236 ? $unsigned(reg232) : (^wire255)) ?
              wire249 : (((7'h43) ? (7'h40) : reg244) ?
                  (^wire226) : reg244)) ^ wire225[(1'h1):(1'h1)]) || $signed({($unsigned(reg228) ?
                  $signed(wire252) : reg242[(3'h5):(3'h5)])}));
          reg257 <= reg246;
          reg258 <= ((-wire216) ?
              ($signed((reg241[(3'h6):(2'h3)] ? wire254 : wire253)) ?
                  ($signed(wire253) >>> (reg238[(3'h6):(3'h4)] ?
                      {(7'h41)} : (^reg232))) : (((wire224 > (8'had)) ?
                          $unsigned(wire218) : $unsigned(wire226)) ?
                      ($signed(wire254) ?
                          wire221 : (wire248 ?
                              wire218 : wire226)) : $unsigned(wire225))) : {(~|{(|wire219)})});
          reg259 <= ((8'ha1) <<< wire227);
          reg260 <= (|(~({{reg231}, $signed(reg258)} ?
              $signed((&reg246)) : (^~$signed(reg244)))));
        end
      else
        begin
          if ($unsigned($unsigned(reg259)))
            begin
              reg256 <= $signed(wire253);
            end
          else
            begin
              reg256 <= $signed(((&wire254[(4'ha):(4'h9)]) ?
                  reg244[(5'h10):(4'h9)] : $unsigned($unsigned((^~reg246)))));
              reg257 <= wire251[(1'h0):(1'h0)];
              reg258 <= {(((~(reg256 ?
                      reg238 : wire227)) & $unsigned({(8'hb6)})) >>> wire248)};
              reg259 <= $unsigned(reg245);
              reg260 <= (&(((|wire224) ?
                      $unsigned((~wire252)) : ((wire216 ^ wire227) ?
                          (-wire217) : reg245)) ?
                  (+(!wire253[(4'hb):(1'h1)])) : reg229));
            end
          reg261 <= wire218;
          reg262 <= (|(reg259 ?
              (~|$unsigned(((8'hbd) ? (8'hbf) : wire218))) : (!{(reg237 ?
                      (8'had) : wire217)})));
          reg263 <= $unsigned($unsigned($unsigned($signed((wire220 ?
              (8'h9e) : reg256)))));
          reg264 <= ($signed($unsigned(wire216)) ?
              $unsigned($unsigned(((reg256 != wire216) >>> $unsigned(reg258)))) : ((~^$unsigned((wire225 ?
                  wire227 : reg233))) < wire248));
        end
      if ((&$signed(wire225[(4'hd):(4'h8)])))
        begin
          if (((reg234[(2'h3):(2'h2)] < wire252[(2'h3):(2'h3)]) ?
              $signed(($unsigned($signed(wire248)) << ($unsigned(reg222) ?
                  (reg233 ?
                      wire249 : reg259) : $unsigned((8'hb6))))) : $signed(reg256)))
            begin
              reg265 <= {reg230};
              reg266 <= wire227;
              reg267 <= reg233[(1'h1):(1'h1)];
            end
          else
            begin
              reg265 <= (|reg259[(5'h10):(4'hd)]);
              reg266 <= ((~|$signed(reg244)) ^ $signed((8'hb4)));
            end
          reg268 <= wire219;
          reg269 <= {(($unsigned(wire252) ?
                  ({wire220,
                      reg243} <= {reg264}) : $unsigned((reg236 > wire251))) > (-(^~$signed(reg233)))),
              wire251};
        end
      else
        begin
          if ({$signed({$signed((!reg246)), $unsigned(reg243[(4'hd):(4'h8)])}),
              $signed($signed(reg257[(3'h4):(2'h3)]))})
            begin
              reg265 <= reg264;
              reg266 <= $unsigned((reg229 >>> ($signed($unsigned(reg239)) ?
                  {wire221, reg265} : (~|reg240[(1'h0):(1'h0)]))));
              reg267 <= $unsigned($unsigned($signed($signed((~&reg266)))));
              reg268 <= (reg263 <<< ($unsigned($signed($signed(reg256))) ?
                  $signed($signed((wire219 < wire226))) : {$signed($unsigned(reg244)),
                      ($unsigned(wire221) + reg237)}));
              reg269 <= reg246[(3'h7):(3'h7)];
            end
          else
            begin
              reg265 <= $unsigned(((~|wire221) ?
                  ((^(^(8'hb0))) ?
                      $unsigned(wire251[(3'h6):(3'h6)]) : reg256) : $signed({wire215,
                      (reg264 < wire226)})));
              reg266 <= reg258[(1'h0):(1'h0)];
            end
          reg270 <= $unsigned((({(wire252 ?
                  reg260 : wire249)} ~^ reg238[(2'h3):(1'h0)]) <<< $signed(reg269)));
          if (reg239[(3'h4):(3'h4)])
            begin
              reg271 <= reg263[(3'h4):(1'h0)];
              reg272 <= $unsigned(reg235);
            end
          else
            begin
              reg271 <= wire218[(4'hb):(3'h5)];
            end
        end
    end
  assign wire273 = $signed(reg235);
  assign wire274 = (wire216 - wire215[(4'h8):(3'h6)]);
endmodule

module module149  (y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire153;
  input wire [(5'h13):(1'h0)] wire152;
  input wire signed [(4'h9):(1'h0)] wire151;
  input wire [(5'h12):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire174;
  wire [(4'ha):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire154;
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire154,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg169,
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
                 (1'h0)};
  assign wire154 = wire153;
  always
    @(posedge clk) begin
      if ((~$signed($unsigned((wire151[(2'h3):(2'h2)] ?
          (~|wire152) : (&wire154))))))
        begin
          reg155 <= wire151;
          reg156 <= ((wire152[(1'h0):(1'h0)] > (&(^(^wire154)))) ?
              wire150[(3'h7):(3'h4)] : ((wire153 ?
                  reg155[(4'ha):(3'h6)] : (8'hb2)) == $signed(((reg155 ^~ wire150) != $signed(wire154)))));
          reg157 <= wire150[(4'he):(1'h1)];
        end
      else
        begin
          reg155 <= reg157[(2'h3):(2'h2)];
          reg156 <= (($signed(wire154) ?
                  (~&wire150[(5'h12):(4'h9)]) : $signed(wire151[(1'h0):(1'h0)])) ?
              wire152 : reg157);
          if ((((reg156 ?
                      (~&$unsigned(wire153)) : (|(wire154 ?
                          wire152 : wire151))) ?
                  $signed({wire151[(2'h3):(2'h2)]}) : $signed(wire152[(2'h3):(2'h3)])) ?
              wire151 : $signed($signed($signed($unsigned((8'hab)))))))
            begin
              reg157 <= (|(~($unsigned({wire150}) == $signed((~wire152)))));
              reg158 <= ({$signed(wire151)} == (((|$signed((8'hbb))) == (~^(wire150 ?
                  wire152 : reg156))) > $unsigned($unsigned(((7'h44) ?
                  wire152 : wire154)))));
            end
          else
            begin
              reg157 <= wire152[(3'h6):(1'h1)];
              reg158 <= wire150;
            end
        end
      if (wire151[(3'h7):(3'h7)])
        begin
          if ($signed($unsigned(wire150)))
            begin
              reg159 <= $signed($unsigned((((+wire152) ?
                  ((8'h9c) ?
                      wire150 : wire152) : (+reg156)) - (wire154[(1'h1):(1'h1)] ?
                  $signed(wire151) : wire152))));
            end
          else
            begin
              reg159 <= (wire150 + (~&$unsigned((^~$unsigned(reg157)))));
              reg160 <= $unsigned(wire152);
            end
        end
      else
        begin
          if (($unsigned(({$unsigned(wire154)} ?
              wire152 : reg155)) == $signed($unsigned({(~|wire154),
              ((8'hb0) ? reg155 : (8'hbb))}))))
            begin
              reg159 <= $unsigned($unsigned(($unsigned(wire152[(1'h0):(1'h0)]) ?
                  reg158[(3'h4):(2'h3)] : ((wire154 * reg159) >>> (^~wire151)))));
              reg160 <= reg158[(2'h3):(2'h3)];
              reg161 <= (&(reg159[(3'h5):(3'h4)] ?
                  $signed(({wire150,
                      wire151} <<< reg156[(1'h1):(1'h1)])) : (+{wire151})));
              reg162 <= reg156;
            end
          else
            begin
              reg159 <= $signed(reg159[(3'h4):(1'h0)]);
            end
          if (reg159[(3'h4):(2'h3)])
            begin
              reg163 <= ($unsigned((((8'hae) ?
                      reg162[(2'h3):(1'h1)] : $unsigned(reg159)) ?
                  {(8'ha4),
                      (-wire154)} : $signed($signed((8'h9e))))) + {$signed(reg160[(1'h1):(1'h1)])});
              reg164 <= $unsigned(wire153[(2'h2):(2'h2)]);
              reg165 <= ({wire152[(4'hf):(1'h1)], reg155} ?
                  (((wire153[(4'hc):(3'h4)] ~^ reg156[(2'h2):(2'h2)]) ?
                      (!$unsigned(reg159)) : ({wire151} <= (-(8'hac)))) && reg164) : {((-reg156[(1'h1):(1'h1)]) && (reg159 | $unsigned(reg160))),
                      ($signed((~reg159)) ?
                          ($unsigned(reg162) ?
                              (reg157 ? reg157 : reg162) : (reg163 ?
                                  wire151 : reg163)) : reg163)});
              reg166 <= reg161[(4'hf):(4'hc)];
            end
          else
            begin
              reg163 <= reg165[(3'h4):(1'h1)];
              reg164 <= (+reg163);
              reg165 <= (((reg163 != (((8'h9c) | reg162) ?
                          reg163[(2'h2):(1'h0)] : ((8'hac) ?
                              reg161 : reg158))) ?
                      wire152[(4'h8):(2'h2)] : $signed(wire154)) ?
                  $unsigned(reg158) : {reg157});
              reg166 <= {wire154[(3'h7):(1'h1)],
                  ({wire151} >= (!$unsigned(wire151)))};
              reg167 <= wire152;
            end
          reg168 <= ($signed({({reg156} ? ((8'hbe) != reg167) : (~&wire153))}) ?
              reg165 : (~^(^((~&reg158) ? {reg162} : (&reg165)))));
        end
      reg169 <= wire151[(2'h3):(1'h1)];
    end
  assign wire170 = wire153[(4'hc):(4'hc)];
  assign wire171 = reg166[(5'h10):(4'he)];
  assign wire172 = reg163[(1'h0):(1'h0)];
  assign wire173 = $signed($signed($signed($unsigned((-wire171)))));
  assign wire174 = $unsigned((~^($unsigned($signed(reg159)) <= ($signed(reg167) < (-wire170)))));
  assign wire175 = ($signed(reg163) <= wire152[(2'h2):(1'h1)]);
  assign wire176 = ((((&$unsigned(wire170)) ?
                           reg169[(2'h2):(1'h1)] : wire172) != {(~^(&reg166))}) ?
                       $signed(((|reg156[(1'h1):(1'h1)]) * reg155)) : ({(+{reg169,
                                   reg157}),
                               reg167[(1'h0):(1'h0)]} ?
                           $signed((~&(reg158 ?
                               wire151 : wire172))) : (~&wire154[(2'h3):(1'h1)])));
  assign wire177 = reg161;
  always
    @(posedge clk) begin
      if (($signed($unsigned((-reg165))) ?
          (~|(-wire171[(1'h0):(1'h0)])) : (|((reg160 >>> (wire150 * wire176)) || (!(reg165 > wire172))))))
        begin
          reg178 <= $signed($unsigned((&($signed(wire177) ~^ wire174))));
          reg179 <= ({$signed($signed((7'h44))),
              reg159[(1'h1):(1'h1)]} & wire170);
        end
      else
        begin
          reg178 <= (~^(~^$signed((wire150[(3'h7):(2'h2)] || (reg163 ?
              wire176 : (8'haf))))));
        end
      reg180 <= (((~|$signed((wire170 <<< reg167))) ?
              $unsigned({$signed((8'hb6)),
                  $unsigned(wire150)}) : $unsigned((8'hb6))) ?
          ((((&reg155) ? $unsigned(reg156) : reg165[(1'h1):(1'h0)]) | (|{reg161,
                  reg159})) ?
              reg163[(1'h1):(1'h0)] : (+reg169[(1'h0):(1'h0)])) : (~|$unsigned((wire152[(3'h6):(3'h4)] ?
              (reg166 ? reg161 : reg169) : $signed(reg165)))));
      reg181 <= wire151;
    end
endmodule

module module127
#(parameter param145 = (({({(8'hb2), (8'ha5)} & ((8'hb8) - (8'hbc))), (((8'ha9) ? (8'hb1) : (8'hb2)) & (&(8'ha7)))} ? (8'h9f) : (((-(8'hae)) ? ((8'ha5) && (8'ha9)) : ((8'hbc) ? (8'hb5) : (8'h9c))) ? (-((8'hac) ? (8'ha4) : (7'h42))) : ((8'ha6) != ((8'h9d) != (8'hbb))))) ? (((~&((8'hae) + (8'ha9))) ? (~|(|(8'hbb))) : (~{(8'hbc), (8'hb8)})) ~^ ((~^((8'hb6) != (8'hb0))) ? ((^~(8'haa)) << ((8'hbb) ? (8'hb2) : (7'h44))) : (!((8'h9d) < (7'h42))))) : ((((&(8'h9d)) ? (^(8'ha8)) : (-(7'h43))) ? (+(8'ha7)) : {{(8'hbe), (8'haf)}, {(8'h9d), (8'hae)}}) == ((~|((8'haa) <= (7'h44))) ? (((8'hb4) ? (8'hba) : (8'had)) ? ((8'ha3) >> (8'hba)) : (|(8'ha1))) : (((8'ha2) ? (8'hb8) : (8'haf)) ~^ {(8'hb3)})))), 
parameter param146 = ((({(8'hb7)} | (|{param145, param145})) ? {({(7'h42), param145} ? (8'ha4) : ((7'h43) ? param145 : param145))} : (((-param145) ? (param145 ? param145 : (8'hbe)) : (param145 || param145)) * ({param145} < param145))) < (+(({param145} - (param145 * param145)) ? {(8'h9d)} : ((8'hb2) ? (|param145) : param145)))))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire132;
  input wire [(5'h14):(1'h0)] wire131;
  input wire signed [(5'h14):(1'h0)] wire130;
  input wire [(4'he):(1'h0)] wire129;
  input wire [(4'h8):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 (1'h0)};
  assign wire133 = {(+(&wire131))};
  assign wire134 = $unsigned((&((^(wire130 << wire130)) ?
                       $signed({(8'hae),
                           wire131}) : $unsigned($unsigned(wire130)))));
  assign wire135 = (~|{$unsigned(({wire132, wire128} ~^ (~&wire134)))});
  assign wire136 = $signed((8'hb8));
  assign wire137 = (~^$signed($signed((~|(8'ha0)))));
  assign wire138 = wire134;
  assign wire139 = $unsigned($unsigned($unsigned((wire137[(1'h0):(1'h0)] ?
                       (wire136 ? (8'haf) : wire134) : (wire131 ?
                           (8'hb5) : wire138)))));
  assign wire140 = $unsigned({(+$signed((!wire138))),
                       (wire139 ? wire139[(4'hc):(1'h0)] : wire131)});
  assign wire141 = (~&wire137);
  assign wire142 = ((&wire133) | $unsigned($signed((!((8'hb9) || wire131)))));
  assign wire143 = ($unsigned((wire142[(2'h3):(2'h3)] * $unsigned((wire142 <= (8'haf))))) && (~&((((7'h40) & wire138) ^ (wire140 ?
                       wire138 : wire134)) + wire138[(4'hc):(2'h2)])));
  assign wire144 = wire135;
endmodule

module module91
#(parameter param124 = (({{((8'ha5) >>> (8'hbf))}} ? ({((8'ha9) ? (7'h40) : (8'ha1)), (-(8'hb0))} ? ((!(8'hb2)) ^ (~&(8'hb0))) : (((8'hac) - (8'haa)) | {(8'ha1), (8'hbe)})) : (8'ha7)) | (!(~|(((8'hb7) + (8'hb6)) ? ((8'h9e) ? (8'hb3) : (8'h9e)) : (|(8'hb9)))))))
(y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(5'h14):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  assign y = {wire123,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg96,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg96 <= $signed($unsigned((({wire94,
          wire92} << (8'ha5)) | wire93[(1'h1):(1'h0)])));
    end
  assign wire97 = $signed($unsigned(((~&wire93[(2'h2):(2'h2)]) >>> ((^~(8'h9d)) ?
                      {wire92, reg96} : wire93[(2'h2):(1'h0)]))));
  assign wire98 = $unsigned(wire93[(2'h2):(1'h0)]);
  assign wire99 = (~^(8'ha5));
  assign wire100 = wire94[(2'h3):(2'h2)];
  assign wire101 = (wire97 ? $unsigned(wire95) : wire97[(3'h5):(2'h2)]);
  assign wire102 = (&(^~wire94[(4'hd):(3'h6)]));
  assign wire103 = ({$unsigned($unsigned((~|wire99))),
                           (wire95 ?
                               ((wire94 << wire102) * ((7'h44) ?
                                   wire93 : wire92)) : (wire92[(4'hd):(4'h8)] < $signed(wire100)))} ?
                       (!($unsigned($unsigned((8'hb9))) <<< {(wire94 ?
                               wire102 : reg96)})) : ((8'had) < (8'ha6)));
  always
    @(posedge clk) begin
      if ({(8'ha9), (^$signed($unsigned((wire103 ? reg96 : wire97))))})
        begin
          if (($unsigned($signed($unsigned(((8'hb6) ?
              wire92 : wire101)))) || (|$unsigned({$unsigned((8'hab))}))))
            begin
              reg104 <= {($unsigned(((^~(8'hab)) > $signed(wire95))) ?
                      (8'h9e) : wire93)};
              reg105 <= wire98[(4'hb):(4'h8)];
              reg106 <= (reg104[(1'h0):(1'h0)] > $unsigned($unsigned($unsigned((^wire103)))));
              reg107 <= {(($signed((!wire95)) * $signed(wire102)) ?
                      wire95 : wire92[(1'h1):(1'h0)]),
                  wire93[(2'h2):(1'h1)]};
              reg108 <= $unsigned(((^$signed(((8'hbc) << (8'ha7)))) ?
                  {((wire94 ? (8'hb5) : wire93) ? $signed(wire98) : reg96),
                      wire94} : (+$signed((reg107 && wire92)))));
            end
          else
            begin
              reg104 <= $unsigned(({wire94[(4'hc):(3'h4)], (!$signed(wire95))} ?
                  wire93 : (8'hb7)));
            end
          if ({reg105})
            begin
              reg109 <= (((8'hbc) ?
                  reg108[(3'h6):(2'h3)] : (~&(wire98 ?
                      reg96 : (&reg105)))) > reg107[(4'h9):(2'h3)]);
              reg110 <= wire99[(1'h0):(1'h0)];
              reg111 <= (^$unsigned(wire99));
            end
          else
            begin
              reg109 <= {((((wire92 ? reg109 : reg106) ?
                          $signed((8'ha6)) : (~reg96)) * wire92) ?
                      $signed(($signed(wire102) ?
                          wire94 : ((8'hba) != (8'hb7)))) : (^~wire99)),
                  ($signed(reg104[(1'h1):(1'h0)]) ?
                      (~&(~$unsigned(wire95))) : (~&$unsigned((7'h40))))};
              reg110 <= ({{(^((8'ha4) && reg104))}, $unsigned((~(|(8'hbe))))} ?
                  reg106 : $signed(((8'hb5) ? wire95 : reg107[(3'h4):(2'h2)])));
              reg111 <= (^~(reg111[(2'h2):(1'h0)] ?
                  $signed($unsigned($signed(wire103))) : ($unsigned((~wire97)) ?
                      {$unsigned((8'ha2))} : (-(-(8'had))))));
              reg112 <= $unsigned($unsigned((wire102 << {reg96[(4'h9):(4'h8)]})));
            end
          reg113 <= {wire101};
          reg114 <= $unsigned(({({wire97} * (reg111 ?
                  reg111 : wire92))} <<< wire97));
          if ($signed((-($signed(((8'h9f) ? wire99 : reg111)) ?
              reg107[(2'h3):(1'h0)] : ($unsigned(wire94) ?
                  (~wire94) : (reg112 && wire99))))))
            begin
              reg115 <= reg108;
            end
          else
            begin
              reg115 <= (~^reg105[(3'h4):(1'h0)]);
              reg116 <= reg113[(1'h1):(1'h0)];
              reg117 <= wire99;
              reg118 <= reg111[(2'h3):(2'h2)];
              reg119 <= wire99;
            end
        end
      else
        begin
          reg104 <= ((({wire101, $unsigned((8'hb2))} ?
                  wire103[(5'h11):(2'h3)] : $signed((wire103 + reg117))) << ((^~(~&wire98)) ?
                  reg119[(3'h4):(3'h4)] : (+wire101))) ?
              $unsigned((($unsigned(wire103) >>> $unsigned(wire92)) + (wire95 ?
                  $unsigned(reg105) : (8'hab)))) : reg109);
        end
      reg120 <= ({wire94[(4'hd):(1'h1)]} != (|wire92[(3'h7):(3'h5)]));
      reg121 <= $signed($signed(($unsigned((reg109 ~^ wire98)) | reg106[(4'h8):(3'h7)])));
    end
  always
    @(posedge clk) begin
      reg122 <= reg113[(4'h9):(4'h8)];
    end
  assign wire123 = (+(!wire94));
endmodule

module module54
#(parameter param85 = (~&((~|(8'ha8)) * {(((8'ha3) ? (8'h9f) : (7'h44)) ? ((8'ha4) ? (8'had) : (8'hae)) : ((8'h9e) ? (8'haa) : (8'ha7)))})), 
parameter param86 = {({{{param85}, {param85}}} ? (8'hbf) : ((~^(+param85)) ? (8'hb6) : (8'ha2)))})
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire59;
  input wire [(4'h9):(1'h0)] wire58;
  input wire signed [(4'h9):(1'h0)] wire57;
  input wire [(4'hf):(1'h0)] wire56;
  input wire [(4'h8):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire68,
                 wire67,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg81,
                 reg70,
                 reg69,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire60 = {wire58[(3'h4):(1'h0)]};
  assign wire61 = (wire57 ? wire59[(4'h8):(1'h1)] : (8'ha8));
  assign wire62 = wire55[(1'h0):(1'h0)];
  assign wire63 = wire59[(2'h2):(1'h0)];
  assign wire64 = ((~wire60) || (wire57[(3'h6):(3'h4)] & $signed((~&wire57[(3'h6):(1'h1)]))));
  always
    @(posedge clk) begin
      reg65 <= (wire58[(4'h8):(1'h1)] << ({$signed(((8'ha7) >>> wire55))} ?
          (!$signed((8'hb4))) : (wire63 ?
              wire57 : $unsigned((wire63 ? wire61 : wire60)))));
      reg66 <= (~(!($unsigned(wire63[(2'h3):(1'h0)]) >> wire61[(3'h6):(3'h6)])));
    end
  assign wire67 = (-(wire61 && $unsigned(((wire55 == wire57) != (!wire60)))));
  assign wire68 = $signed(($signed($unsigned({(8'h9d)})) >>> $signed($signed((wire63 ?
                      wire60 : (8'hb0))))));
  always
    @(posedge clk) begin
      reg69 <= ((~wire62) == $unsigned((8'haf)));
      reg70 <= wire68[(2'h2):(1'h0)];
    end
  assign wire71 = $unsigned($signed((^{reg69[(3'h7):(3'h7)],
                      $unsigned(reg66)})));
  assign wire72 = ({(reg70[(4'h8):(4'h8)] >>> $signed($signed(reg70)))} ?
                      $unsigned(($unsigned((~wire55)) >> ($unsigned(reg66) | wire71))) : (~|$unsigned({$unsigned(reg66)})));
  assign wire73 = ((^($signed((8'hbb)) ?
                      ({(8'ha3), wire59} ^~ wire57) : ((8'ha9) ?
                          (reg70 ? wire59 : (8'hb4)) : {wire67,
                              (8'ha2)}))) ^ (wire64[(3'h7):(3'h5)] ?
                      $signed(reg69[(3'h5):(2'h3)]) : ($signed((wire60 ?
                              wire71 : reg66)) ?
                          $signed((!wire63)) : (~&(~^wire60)))));
  assign wire74 = ((~&wire64[(4'hb):(2'h2)]) ? wire59[(4'ha):(4'h8)] : wire61);
  assign wire75 = ($signed((8'hb3)) & (&(((wire61 >= wire63) ?
                      wire55[(3'h7):(3'h6)] : $unsigned(wire61)) | ((~^(8'hb8)) << (~^(8'ha5))))));
  assign wire76 = (($unsigned($unsigned((reg66 ? wire71 : reg66))) ?
                      wire55 : ($signed(wire61[(3'h7):(2'h3)]) >>> wire73[(3'h6):(3'h5)])) <= ($signed(($unsigned(wire62) ?
                      (wire67 ?
                          reg66 : (8'hb7)) : $unsigned(reg65))) & {(^(7'h42))}));
  assign wire77 = $unsigned({wire68,
                      (({wire67} ? wire73[(5'h10):(4'hd)] : wire57) ?
                          wire56[(1'h0):(1'h0)] : {(~|(8'ha3))})});
  assign wire78 = (8'hbd);
  assign wire79 = $unsigned(wire71);
  assign wire80 = (((((wire64 ? wire67 : (8'ha0)) ?
                          $signed(wire73) : wire76[(2'h2):(2'h2)]) ?
                      ($unsigned(wire75) ?
                          (wire55 ?
                              reg69 : wire67) : wire55[(2'h2):(2'h2)]) : reg69[(3'h7):(3'h7)]) >> ((8'ha1) ?
                      (^((8'hba) == (8'h9f))) : (wire60 ?
                          $signed(wire60) : wire68[(2'h2):(1'h0)]))) & ($unsigned((^((8'ha6) ?
                          wire76 : (7'h44)))) ?
                      (({reg70,
                          (8'hb5)} < $signed((8'haa))) != wire64[(3'h5):(3'h5)]) : wire76));
  always
    @(posedge clk) begin
      reg81 <= (reg66 * $unsigned((($unsigned(wire75) * $unsigned(wire68)) ^~ $unsigned((wire79 || wire61)))));
    end
  assign wire82 = (((!wire61[(3'h6):(1'h0)]) ?
                      {($unsigned((8'had)) >>> (wire58 ? wire57 : reg69)),
                          wire57[(4'h8):(3'h6)]} : (~|$signed(wire62))) < {{((-wire73) ?
                              ((8'ha2) ? wire62 : wire56) : (wire78 ?
                                  wire57 : (8'h9c))),
                          wire60[(1'h0):(1'h0)]},
                      wire71[(5'h10):(4'ha)]});
  assign wire83 = (!$unsigned($unsigned((&{wire77}))));
  assign wire84 = (((wire72[(4'h9):(2'h2)] ?
                      $unsigned(wire63) : {(8'ha0),
                          wire75}) << $signed(($unsigned(wire61) <<< {wire80}))) - $signed((+((wire62 || reg69) ?
                      $unsigned((8'hb5)) : $signed(wire68)))));
endmodule
