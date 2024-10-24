module top
#(parameter param206 = ((~^(^(|(^~(8'hbb))))) != ((-(|((8'hac) > (8'ha4)))) ? (({(8'haf), (8'hb3)} ^ ((8'hb7) ? (8'hab) : (8'hb5))) - {{(8'hb6), (8'hb8)}, {(8'hac), (8'had)}}) : ((((8'h9e) ? (8'haf) : (8'h9e)) + ((8'ha8) * (8'h9f))) && (((7'h43) || (7'h42)) != (|(8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire205;
  wire signed [(2'h3):(1'h0)] wire204;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire202;
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire202,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = $unsigned(($signed(wire3) >>> $signed($unsigned($signed(wire0)))));
  assign wire7 = (wire4[(1'h1):(1'h0)] ? wire1 : wire0);
  assign wire8 = $unsigned(wire5[(2'h3):(1'h0)]);
  assign wire9 = $signed(wire7[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg10 <= $signed($unsigned(wire6[(3'h6):(1'h1)]));
      reg11 <= wire0[(4'hc):(3'h6)];
      reg12 <= (~&$unsigned((wire1[(3'h6):(2'h2)] ?
          wire5 : (~^(wire5 ? wire5 : wire5)))));
    end
  assign wire13 = wire9[(4'h9):(4'h8)];
  assign wire14 = {(!(8'h9c)),
                      ($signed($signed($unsigned(reg12))) > ($signed(wire7) == ({wire6,
                              (8'h9d)} ?
                          $unsigned(wire2) : (&reg11))))};
  assign wire15 = $unsigned({$unsigned($signed(wire2[(2'h3):(1'h1)]))});
  assign wire16 = (wire4 >> wire3[(2'h3):(2'h2)]);
  assign wire17 = $signed(wire0[(4'hd):(1'h1)]);
  module18 #() modinst203 (.wire20(wire2), .wire19(wire9), .wire23(wire1), .wire22(wire5), .clk(clk), .y(wire202), .wire21(wire15));
  assign wire204 = ({{((~|wire14) * wire7[(3'h5):(2'h3)]),
                           {wire15[(4'h8):(2'h2)], (wire17 && wire5)}},
                       wire0[(3'h4):(1'h1)]} < (~|{$unsigned((8'h9d))}));
  assign wire205 = $signed($signed($unsigned(reg10[(4'ha):(2'h2)])));
endmodule

module module18
#(parameter param200 = {((~&(((8'ha6) == (8'hb0)) >= (8'ha0))) ? (8'haa) : (((~|(8'had)) ? ((8'hbc) ? (8'hbd) : (8'had)) : {(8'hb2), (8'hb8)}) ? ((8'hb0) << (^~(8'hab))) : ((~(8'hab)) & ((8'hb8) ? (8'ha5) : (7'h40)))))}, 
parameter param201 = param200)
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h1fa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire177;
  wire signed [(4'ha):(1'h0)] wire198;
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire24,
                 wire56,
                 wire58,
                 wire80,
                 wire101,
                 wire103,
                 wire104,
                 wire155,
                 wire157,
                 wire174,
                 wire176,
                 wire177,
                 wire198,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
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
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg57,
                 (1'h0)};
  assign wire24 = (8'hb7);
  always
    @(posedge clk) begin
      reg25 <= {$unsigned((^~wire21[(1'h0):(1'h0)]))};
      reg26 <= ($signed(reg25) ?
          $signed($signed((~|wire21))) : (~|$unsigned(($signed(reg25) ?
              reg25 : {wire23}))));
      reg27 <= (|($unsigned(((wire20 > wire19) ?
              (wire24 ? (8'ha9) : wire24) : $unsigned(reg25))) ?
          {$signed(reg26[(2'h2):(1'h1)]),
              ((wire22 ?
                  (8'ha3) : wire20) ~^ (&wire20))} : $unsigned(($signed(wire24) ^~ wire21))));
    end
  always
    @(posedge clk) begin
      if (($unsigned(((~wire21) < ({wire23, wire19} - (wire23 <<< reg27)))) ?
          reg25 : ((^$unsigned((reg25 < wire20))) >>> ((reg26[(1'h1):(1'h1)] != (wire20 ?
                  reg26 : (8'ha1))) ?
              (wire20 ?
                  reg26[(2'h2):(1'h1)] : $signed(wire19)) : $signed((~^wire22))))))
        begin
          reg28 <= (-(+$unsigned((^wire24[(2'h2):(1'h0)]))));
          reg29 <= ($unsigned({wire22, $signed((reg25 + reg26))}) ?
              ($unsigned(wire19) ^ $unsigned(wire22)) : ($signed(reg26) != $signed(($unsigned(reg27) < $unsigned(wire24)))));
          reg30 <= (($signed((reg29[(4'hb):(4'hb)] ?
                  reg28[(3'h4):(2'h3)] : $signed(reg28))) <= $signed(wire22[(4'he):(4'ha)])) ?
              ((-reg29[(4'hc):(4'ha)]) ?
                  wire20[(3'h5):(2'h3)] : wire21) : $signed(($signed($signed(reg25)) ?
                  {$signed(wire23), (~|(8'h9d))} : wire20)));
          reg31 <= reg28[(3'h5):(2'h2)];
        end
      else
        begin
          reg28 <= wire21;
          reg29 <= wire19[(3'h7):(3'h5)];
          reg30 <= wire21[(3'h7):(1'h0)];
          if ($signed((^~(wire20[(5'h13):(3'h6)] ?
              $signed((+wire22)) : ($signed(reg29) ^~ reg30[(3'h4):(2'h3)])))))
            begin
              reg31 <= $unsigned((!(wire20[(3'h7):(2'h3)] ?
                  reg27[(3'h5):(2'h2)] : (wire20 ?
                      {reg25} : $unsigned(reg30)))));
              reg32 <= $unsigned({$unsigned($unsigned((wire19 + wire20)))});
              reg33 <= ($signed(reg25) > reg32[(2'h2):(1'h0)]);
              reg34 <= ($signed($unsigned((8'had))) >= $signed(wire20));
              reg35 <= ($signed(((~&reg28[(2'h2):(1'h1)]) || (reg34 <= (wire19 ?
                      reg27 : reg27)))) ?
                  {$unsigned(reg26)} : $signed($unsigned((reg29 ?
                      ((8'hbd) ? reg29 : reg34) : (-reg34)))));
            end
          else
            begin
              reg31 <= $signed(wire22[(4'hd):(3'h4)]);
              reg32 <= reg35;
              reg33 <= (8'hbe);
            end
          reg36 <= ($unsigned((-wire20)) ?
              ($signed(reg32[(2'h2):(2'h2)]) != $signed((~|{reg34}))) : {(((reg30 ?
                      reg27 : wire23) >> $signed(wire23)) >>> (~^reg28)),
                  (^$unsigned($signed(wire19)))});
        end
      if (($unsigned((reg31 + (+((8'ha7) ? (8'hb8) : reg25)))) ?
          (reg29[(4'hf):(3'h5)] != $unsigned($signed((-reg36)))) : reg29[(3'h4):(3'h4)]))
        begin
          if (({$unsigned((^(reg29 ? wire21 : (8'hb4))))} ?
              (~|$unsigned(reg33[(4'ha):(3'h4)])) : (((^reg27[(3'h7):(1'h0)]) | $unsigned(wire24)) || $signed($unsigned(reg28[(2'h2):(2'h2)])))))
            begin
              reg37 <= (~^wire22[(1'h1):(1'h1)]);
              reg38 <= (~|reg32[(2'h2):(1'h0)]);
              reg39 <= wire19[(4'ha):(4'h8)];
              reg40 <= ((reg35[(2'h2):(1'h0)] > (~^$signed(reg33[(2'h2):(1'h0)]))) ?
                  reg27[(4'hd):(2'h3)] : wire20);
              reg41 <= reg25;
            end
          else
            begin
              reg37 <= {($signed(reg28[(3'h6):(1'h1)]) ?
                      reg27 : ($unsigned($unsigned(reg28)) ?
                          (reg39[(2'h2):(1'h1)] ?
                              (reg34 ? (8'h9d) : (8'hba)) : (reg28 ?
                                  reg41 : reg29)) : (8'h9d))),
                  (8'hb9)};
              reg38 <= (~{reg30[(1'h1):(1'h0)], reg30});
              reg39 <= $unsigned(reg37);
              reg40 <= reg39;
            end
          reg42 <= reg32;
          reg43 <= reg33[(1'h1):(1'h0)];
          if ($signed(reg32))
            begin
              reg44 <= {((({reg29, (8'hab)} ?
                      (reg38 ?
                          reg32 : reg31) : $signed(reg35)) >>> reg25[(1'h0):(1'h0)]) << (8'hbe)),
                  reg31[(2'h2):(1'h1)]};
              reg45 <= (~|($signed($signed(reg37)) & {(!(~wire23)),
                  reg25[(1'h0):(1'h0)]}));
              reg46 <= $unsigned((!((-(8'hb1)) <<< (~&{wire19}))));
              reg47 <= (reg25[(2'h2):(1'h0)] <<< (^~$signed(((+reg43) + reg28[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg44 <= $unsigned($signed($signed($unsigned(wire21))));
              reg45 <= $unsigned({({reg31, (reg31 * (8'ha3))} ?
                      ($unsigned(reg44) ?
                          ((8'h9c) | reg42) : reg45) : $signed((wire20 != (8'hb3)))),
                  ($unsigned(reg42) ? reg38 : wire20[(5'h11):(4'hf)])});
              reg46 <= $unsigned((((~&$signed(wire24)) == (8'hae)) >> $unsigned((reg46 ?
                  $unsigned(reg41) : (+reg38)))));
              reg47 <= ({reg40} ?
                  ((($signed(reg39) - (~^wire23)) ?
                          reg25 : ((!reg28) || {reg43})) ?
                      ($signed($unsigned(reg31)) ~^ (~&reg33)) : (^~reg32)) : $signed(wire20[(3'h7):(3'h4)]));
            end
          reg48 <= ((8'had) + $signed((-$unsigned({reg35, reg39}))));
        end
      else
        begin
          reg37 <= (reg47 ~^ ($unsigned((~&(reg43 ?
              reg42 : wire22))) >= reg25));
        end
      if ($signed(wire19[(1'h1):(1'h0)]))
        begin
          if ($signed((|{reg31, reg41[(1'h0):(1'h0)]})))
            begin
              reg49 <= {reg41[(1'h0):(1'h0)]};
              reg50 <= {((wire23[(2'h3):(2'h3)] > (^~$signed((8'hb1)))) | (reg37[(1'h0):(1'h0)] ?
                      ((reg45 >= reg33) + $unsigned(reg39)) : $signed($unsigned(wire24)))),
                  $signed((reg30 ?
                      ((reg42 ? reg30 : (8'h9c)) ~^ (+reg46)) : $signed((reg48 ?
                          reg26 : wire24))))};
              reg51 <= $unsigned({wire21[(3'h5):(1'h1)],
                  (reg32 * ($signed(wire19) <= $signed(reg29)))});
            end
          else
            begin
              reg49 <= ($unsigned(reg44[(4'ha):(1'h1)]) ^~ (reg28 ?
                  $unsigned({$signed(reg31)}) : reg32[(1'h0):(1'h0)]));
              reg50 <= ($unsigned(((reg34[(3'h5):(2'h3)] >= reg32) | (~(reg46 == (8'hb5))))) * reg35[(3'h5):(2'h2)]);
              reg51 <= $signed(reg26[(2'h2):(1'h1)]);
              reg52 <= reg39[(1'h1):(1'h0)];
              reg53 <= ($signed((reg27[(4'h8):(4'h8)] ?
                  $signed($unsigned(reg51)) : reg36)) << $signed($signed((wire22 ?
                  $signed(wire22) : (&reg45)))));
            end
        end
      else
        begin
          reg49 <= reg51;
        end
      reg54 <= (8'hb5);
      reg55 <= reg25;
    end
  assign wire56 = ($signed(reg49) <= ((8'ha6) ?
                      $signed({$signed(reg40)}) : {(~&(reg31 ?
                              (8'ha1) : wire22)),
                          ($unsigned(wire19) ?
                              $unsigned((8'h9f)) : $unsigned((7'h42)))}));
  always
    @(posedge clk) begin
      reg57 <= (wire20[(3'h5):(1'h0)] ? $unsigned(reg52) : wire20);
    end
  assign wire58 = (^~$signed({reg42[(4'ha):(3'h5)], $unsigned({reg48})}));
  module59 #() modinst81 (wire80, clk, wire22, reg51, reg45, wire58, reg40);
  module82 #() modinst102 (.clk(clk), .y(wire101), .wire83(reg31), .wire86(wire20), .wire84(reg36), .wire85(wire19));
  assign wire103 = $unsigned((&reg47));
  assign wire104 = wire58;
  module105 #() modinst156 (wire155, clk, reg43, reg54, reg32, reg25);
  assign wire157 = (~&(|({$signed(reg45), {reg32}} ^~ reg42[(1'h0):(1'h0)])));
  module158 #() modinst175 (.y(wire174), .wire159(wire22), .wire160(wire56), .clk(clk), .wire163(reg57), .wire161(reg48), .wire162(reg52));
  assign wire176 = wire20;
  assign wire177 = $signed(((8'haa) && ((((8'ha8) ?
                           reg37 : reg41) ~^ $signed((7'h42))) ?
                       reg50 : (^wire19))));
  module178 #() modinst199 (wire198, clk, reg46, wire56, reg26, reg31);
endmodule

module module178  (y, clk, wire182, wire181, wire180, wire179);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire182;
  input wire signed [(4'he):(1'h0)] wire181;
  input wire signed [(4'hf):(1'h0)] wire180;
  input wire [(3'h4):(1'h0)] wire179;
  wire [(2'h2):(1'h0)] wire197;
  wire signed [(4'h8):(1'h0)] wire194;
  wire [(4'hf):(1'h0)] wire183;
  reg [(3'h7):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg195 = (1'h0);
  reg signed [(4'he):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'he):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(4'he):(1'h0)] reg184 = (1'h0);
  assign y = {wire197,
                 wire194,
                 wire183,
                 reg196,
                 reg195,
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
  assign wire183 = $unsigned(wire182);
  always
    @(posedge clk) begin
      if ($signed($signed({(wire180 > $unsigned(wire179)),
          ((wire179 && wire179) ? $signed(wire180) : (&wire179))})))
        begin
          reg184 <= (&(((~|$unsigned(wire180)) ?
              $signed($signed(wire181)) : wire180[(4'h8):(2'h3)]) - (wire180[(2'h2):(2'h2)] ?
              ({wire181} ?
                  (8'ha7) : (wire180 & wire182)) : {wire182[(2'h2):(2'h2)]})));
          reg185 <= reg184[(4'hc):(4'hb)];
          if ({(^(~$signed((wire183 ? wire180 : wire183)))),
              $signed($unsigned(reg184[(1'h1):(1'h1)]))})
            begin
              reg186 <= ((wire181 >= (reg184 & (~&wire179[(1'h0):(1'h0)]))) ?
                  ((8'ha4) != wire183[(2'h2):(1'h0)]) : wire182[(1'h0):(1'h0)]);
              reg187 <= $signed(reg186[(2'h2):(2'h2)]);
              reg188 <= wire181;
              reg189 <= wire179;
            end
          else
            begin
              reg186 <= (wire180 ?
                  {((^~(~|reg184)) ?
                          wire183[(4'hf):(1'h0)] : $unsigned((reg188 ?
                              wire181 : wire183))),
                      ($signed($signed(reg187)) ?
                          wire182[(3'h6):(3'h4)] : {$signed(wire182),
                              (-reg186)})} : $signed(({(~|(8'haa))} ~^ $signed((reg186 ?
                      reg188 : wire179)))));
              reg187 <= {($unsigned($unsigned($signed((7'h44)))) <<< $unsigned($unsigned({reg186}))),
                  reg189[(3'h4):(3'h4)]};
              reg188 <= reg186;
              reg189 <= $unsigned(wire183);
            end
          reg190 <= (+$signed(((~((8'hb6) > (7'h42))) ?
              {reg187[(2'h2):(1'h0)]} : (~|$signed(wire183)))));
        end
      else
        begin
          reg184 <= (reg184 < ((reg185 ?
              reg187[(1'h1):(1'h1)] : (reg185 ^ $signed(wire181))) <= reg186));
          reg185 <= (~reg189);
          if (wire179)
            begin
              reg186 <= wire183;
              reg187 <= $signed(((reg190[(2'h3):(1'h0)] < $unsigned((^reg188))) > $unsigned(((wire182 >= reg188) ?
                  reg186 : wire179))));
              reg188 <= ((reg185[(4'h9):(1'h1)] >>> (8'hae)) ?
                  $signed(reg188[(4'h8):(1'h1)]) : reg184);
              reg189 <= ($signed(wire179[(1'h1):(1'h0)]) ?
                  {(~^(&$unsigned(reg190))),
                      reg189[(2'h3):(1'h1)]} : (wire183 ~^ $unsigned($unsigned((8'hb3)))));
            end
          else
            begin
              reg186 <= $unsigned((((~&(+reg187)) || ($signed(reg187) & {wire183,
                  reg188})) >> (|reg185)));
              reg187 <= $unsigned($unsigned({$signed(((8'ha5) ^~ (8'hb7))),
                  reg186}));
              reg188 <= $unsigned(($unsigned($signed(reg186[(5'h11):(4'h8)])) ?
                  ((~|$unsigned((8'ha6))) & wire183[(4'h8):(1'h1)]) : ($signed((~&reg187)) != ($signed(reg189) ?
                      wire182 : ((8'ha6) >> reg184)))));
            end
          if (reg185[(4'hf):(4'ha)])
            begin
              reg190 <= ($unsigned(wire180[(2'h3):(1'h0)]) ?
                  reg188[(4'h8):(3'h4)] : ((8'hba) * $unsigned(((&reg186) & (-reg186)))));
              reg191 <= reg185[(3'h6):(2'h3)];
              reg192 <= reg184[(3'h6):(3'h5)];
            end
          else
            begin
              reg190 <= $signed(wire180);
              reg191 <= (wire181[(4'h8):(2'h3)] ^ (!reg189[(3'h7):(3'h6)]));
            end
          reg193 <= ({(^~reg184[(4'h9):(2'h2)]),
              reg192[(2'h3):(1'h0)]} || $unsigned({{(|reg191),
                  (reg190 ? reg190 : (8'ha2))}}));
        end
    end
  assign wire194 = reg189;
  always
    @(posedge clk) begin
      reg195 <= wire179[(1'h1):(1'h0)];
      reg196 <= reg189[(1'h0):(1'h0)];
    end
  assign wire197 = $signed(wire182[(3'h7):(2'h2)]);
endmodule

module module158
#(parameter param173 = {(((((8'ha5) * (8'had)) ? {(8'ha4)} : {(7'h44)}) != (~|(^~(8'h9c)))) ? ({(!(8'hb7)), ((8'ha3) + (8'hbc))} ? (8'hab) : (((8'hb8) ? (8'hbc) : (8'ha7)) ? {(8'hae)} : ((8'hb9) ? (8'hb1) : (8'ha4)))) : {(~((8'ha0) ? (8'hb7) : (8'haf))), {(^(8'hb2)), {(8'ha4), (8'ha5)}}}), (+(~|(((8'haf) - (8'h9d)) ? {(8'hb8), (8'haf)} : {(8'hbd), (8'ha8)})))})
(y, clk, wire163, wire162, wire161, wire160, wire159);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire163;
  input wire signed [(2'h2):(1'h0)] wire162;
  input wire [(5'h12):(1'h0)] wire161;
  input wire signed [(5'h10):(1'h0)] wire160;
  input wire signed [(2'h3):(1'h0)] wire159;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire [(4'he):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire signed [(4'h9):(1'h0)] wire164;
  reg [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg169 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire164 = {wire159, $unsigned(wire160[(5'h10):(1'h0)])};
  assign wire165 = wire159[(1'h1):(1'h0)];
  assign wire166 = wire165;
  assign wire167 = ((|(wire159 <= wire163)) + ($unsigned(((&wire164) > wire162)) <= {$signed({wire164})}));
  assign wire168 = (wire160 ?
                       $signed((+$unsigned($signed(wire161)))) : wire159[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg169 <= (~$signed(((&$signed(wire164)) ?
          $unsigned({(8'hbc), wire162}) : (wire160[(4'ha):(3'h7)] ?
              wire160 : $signed(wire163)))));
      reg170 <= {(wire159[(1'h0):(1'h0)] + wire167[(4'hc):(2'h2)]),
          (reg169[(4'he):(2'h3)] >> (wire167 <= wire159))};
      reg171 <= (&(((~|(wire163 ^~ wire160)) ?
          reg170[(3'h4):(1'h1)] : ({wire167,
              wire167} == (~|wire167))) <<< $signed(wire165[(3'h4):(3'h4)])));
      reg172 <= (+reg169);
    end
endmodule

module module105
#(parameter param154 = ((^(|{(+(8'ha9))})) != (((((7'h44) ? (8'hbc) : (8'hb3)) ^~ ((8'hbf) ? (8'hb4) : (8'hb1))) ? ({(8'hb8)} || (7'h41)) : ((-(8'ha7)) ? (|(8'ha5)) : ((8'h9d) ? (8'ha4) : (8'ha1)))) ? ((7'h40) ? ((8'ha6) && {(7'h41)}) : ((|(8'ha4)) + ((8'hbf) <= (8'hbc)))) : ({(-(8'hb9))} ? ((!(8'hb6)) * ((8'ha3) ? (8'hbe) : (8'hb2))) : (((8'hb6) ? (8'h9e) : (8'had)) ? (+(8'ha6)) : ((8'hb9) ? (8'hb1) : (8'hab)))))))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  input wire signed [(3'h5):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire144;
  wire [(4'ha):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(5'h13):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire125;
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire125,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg110 <= $signed(wire108[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire108))
        begin
          reg111 <= (~&wire109);
          reg112 <= $signed(reg111);
          reg113 <= $unsigned((wire106 ^~ {reg111}));
          reg114 <= ((wire109 ? $unsigned(wire108) : wire107[(2'h2):(1'h0)]) ?
              (|$signed(((!wire108) ?
                  $unsigned(reg110) : {wire108}))) : ((((wire107 ?
                      wire106 : wire108) & $unsigned(wire106)) ^~ wire106[(1'h0):(1'h0)]) ?
                  wire109 : ((-wire108[(3'h7):(2'h3)]) < wire108[(4'h8):(3'h6)])));
          reg115 <= (~|(reg113 >>> $unsigned(((reg114 + wire106) ?
              (reg112 >> wire107) : (wire106 < reg111)))));
        end
      else
        begin
          reg111 <= ((8'ha6) ? $signed(reg111) : (8'ha3));
        end
      if (reg114)
        begin
          reg116 <= wire107[(2'h2):(2'h2)];
          reg117 <= {($unsigned(reg114[(2'h3):(2'h2)]) <= $signed($signed(reg115[(1'h1):(1'h1)])))};
          reg118 <= reg111;
          if ((((((~^reg111) ^ (wire109 ? reg118 : (8'hbd))) ?
                  (^~reg115[(2'h2):(1'h0)]) : $signed(reg112)) ?
              $unsigned((8'hb4)) : $signed((8'hbb))) ~^ reg112))
            begin
              reg119 <= (((7'h41) * (-$signed(reg115))) ?
                  (~&{(^{reg118, reg111})}) : (+$signed((&reg116))));
            end
          else
            begin
              reg119 <= $unsigned(reg112);
              reg120 <= (wire106 ?
                  $signed((reg111[(5'h11):(4'hc)] ?
                      $signed(wire109) : (^~{wire106}))) : ((~|({(8'hbc),
                      reg118} >>> (reg119 ?
                      reg110 : reg119))) ^~ (~&reg117[(3'h4):(2'h2)])));
              reg121 <= ({$unsigned((^(reg119 >= wire106))),
                      ($signed({reg110, (8'ha2)}) ?
                          reg111[(1'h1):(1'h1)] : reg111)} ?
                  $signed($unsigned(reg120[(2'h3):(1'h0)])) : (^((8'hb1) >= ($signed(reg116) ?
                      wire109[(3'h5):(3'h4)] : (^(8'h9e))))));
            end
          reg122 <= reg117;
        end
      else
        begin
          reg116 <= $unsigned($unsigned(($unsigned(wire108[(2'h2):(2'h2)]) ?
              $unsigned(reg117) : reg118[(4'ha):(4'h8)])));
          reg117 <= (wire108[(4'hb):(3'h7)] && reg120[(4'hb):(1'h1)]);
          if ($unsigned($unsigned((~^wire107[(2'h2):(1'h0)]))))
            begin
              reg118 <= $signed($signed(wire108[(4'h8):(1'h0)]));
            end
          else
            begin
              reg118 <= {((~$signed($unsigned(reg118))) ?
                      $signed(($signed(wire109) <= (&wire109))) : $unsigned(wire108))};
              reg119 <= $signed($unsigned($unsigned(reg120[(3'h7):(1'h1)])));
            end
          reg120 <= (^reg119);
          reg121 <= ($signed(($signed($unsigned(reg120)) | $signed($signed(reg119)))) ?
              (&(wire106[(3'h4):(1'h0)] <<< wire108)) : (^~(^~{(wire109 ?
                      (7'h44) : reg112),
                  $signed(reg121)})));
        end
      reg123 <= (~|(^{wire107}));
      reg124 <= {((~|reg117) ?
              (({wire108} >> $unsigned(reg117)) ?
                  ($signed(reg112) + $unsigned(reg112)) : ($signed(reg119) ?
                      $signed(reg112) : reg111[(3'h5):(1'h1)])) : $unsigned($signed({reg123})))};
    end
  assign wire125 = $unsigned((~$unsigned((reg114[(2'h2):(1'h1)] ?
                       reg121[(2'h2):(1'h1)] : $unsigned(reg121)))));
  always
    @(posedge clk) begin
      reg126 <= reg120;
      reg127 <= (~|(|reg118));
      if ((~^$unsigned(($unsigned({wire125}) - (|$signed(reg120))))))
        begin
          reg128 <= $signed((($signed(reg126) >> reg110) ?
              ($signed($signed(reg114)) ?
                  ($signed((8'hb4)) ?
                      reg112 : reg121[(4'hd):(3'h6)]) : reg127) : (^((8'hbd) <<< (reg118 ?
                  reg111 : reg111)))));
          reg129 <= $unsigned({(8'h9d)});
          if ((~^$unsigned(((~&reg122) ?
              (~|(~&reg111)) : $unsigned($unsigned(reg118))))))
            begin
              reg130 <= $signed(reg129);
              reg131 <= reg117[(4'hd):(4'hd)];
              reg132 <= ($unsigned((((wire107 ? reg130 : wire106) <<< (reg113 ?
                      wire107 : reg127)) ?
                  ($unsigned((8'hbc)) * (8'hb8)) : $unsigned((reg120 >= reg113)))) <<< {reg117[(1'h0):(1'h0)]});
              reg133 <= $unsigned((((reg124[(4'hf):(4'h9)] - $signed(reg122)) ?
                  (&$unsigned(reg114)) : (reg115[(1'h1):(1'h1)] ^ (7'h43))) <<< reg110[(4'h9):(2'h3)]));
            end
          else
            begin
              reg130 <= $unsigned(({reg126} ^ $signed((reg127 - (!reg116)))));
              reg131 <= (~&(~&((8'hb3) ^~ reg133[(2'h3):(2'h3)])));
              reg132 <= wire125;
            end
        end
      else
        begin
          reg128 <= (reg110 ?
              (~&$signed($signed($signed(reg122)))) : (&({(8'hbc)} ?
                  reg114[(3'h4):(3'h4)] : reg133)));
        end
      if (reg114[(3'h7):(3'h4)])
        begin
          reg134 <= {(reg126 - reg128[(2'h3):(2'h3)]), wire106};
          reg135 <= (8'hb1);
          reg136 <= (reg114 <<< (reg112[(1'h1):(1'h0)] < (reg114 ?
              (^(&reg127)) : reg117[(4'he):(4'he)])));
        end
      else
        begin
          reg134 <= ({$unsigned(reg119[(3'h5):(1'h1)])} == (reg115 != (~|$unsigned($signed(reg131)))));
          if (reg127)
            begin
              reg135 <= $unsigned(($unsigned(reg112[(2'h2):(2'h2)]) <= reg112[(1'h1):(1'h1)]));
            end
          else
            begin
              reg135 <= $unsigned((((~^(reg121 ?
                  wire106 : (8'haf))) && $unsigned((reg126 && (8'ha7)))) >= $signed($unsigned($unsigned(reg123)))));
            end
          if ((~$signed({wire107})))
            begin
              reg136 <= (reg118 ?
                  reg120[(4'h8):(2'h3)] : ((($signed(reg123) | {reg134}) & wire108) ?
                      (-reg116) : (((~^wire106) ^ $unsigned(reg127)) ?
                          $unsigned(reg130) : $unsigned({reg118, wire125}))));
              reg137 <= reg126[(5'h10):(4'h8)];
            end
          else
            begin
              reg136 <= (reg123[(2'h3):(2'h3)] ?
                  (reg111 == ({(reg112 << (8'hb4))} ?
                      reg113[(4'ha):(3'h7)] : {reg128,
                          (^~(7'h40))})) : $unsigned({((~|reg129) && {reg119}),
                      ((~|wire106) | $unsigned((8'ha4)))}));
              reg137 <= $signed(reg123);
            end
        end
      reg138 <= $signed(reg117[(5'h10):(4'hc)]);
    end
  always
    @(posedge clk) begin
      reg139 <= $unsigned((~^($unsigned({wire107, reg113}) ?
          (-{reg122}) : {((8'hb0) ? reg119 : reg132)})));
    end
  assign wire140 = (~|(reg131[(3'h6):(3'h5)] + (~|reg122)));
  assign wire141 = ({(reg129 ?
                           reg129[(4'h9):(3'h7)] : (8'hbf))} >= reg119[(4'h8):(3'h7)]);
  assign wire142 = reg134;
  assign wire143 = wire107[(1'h1):(1'h1)];
  assign wire144 = (reg124[(5'h12):(2'h2)] >> (8'hb7));
  assign wire145 = $signed(($signed(((reg116 ~^ reg139) ? reg128 : reg131)) ?
                       ((reg123 && {reg127, reg133}) ?
                           wire108 : ((8'ha2) <= (wire140 ?
                               wire125 : wire140))) : ((reg123[(4'h8):(2'h2)] ^~ (8'hbd)) ?
                           reg118[(4'hd):(3'h6)] : $signed($signed(wire109)))));
  assign wire146 = ((wire140[(4'hc):(4'hb)] ?
                       ((+{(8'ha3), reg139}) ?
                           wire108 : reg113) : $unsigned(wire125[(1'h0):(1'h0)])) >>> (8'hab));
  always
    @(posedge clk) begin
      reg147 <= $unsigned(wire107[(2'h2):(1'h0)]);
      reg148 <= reg128[(1'h1):(1'h1)];
      reg149 <= (~&reg132);
      reg150 <= reg137[(2'h2):(1'h1)];
      reg151 <= $signed(reg126);
    end
  assign wire152 = (~|$signed((reg118[(1'h1):(1'h1)] * reg148[(3'h6):(1'h0)])));
  assign wire153 = (^~reg134[(4'h8):(3'h6)]);
endmodule

module module82
#(parameter param100 = (^({{((8'haa) | (8'ha8)), {(8'hbc)}}, (((8'hb1) ? (8'hb7) : (8'hb1)) ? (~&(8'hb6)) : ((8'ha2) ? (8'ha9) : (8'ha8)))} ? (^(8'hae)) : ((^(8'ha5)) ? (^~((8'hb9) ? (7'h43) : (8'hb3))) : (((8'hbb) ? (8'haa) : (8'ha0)) ? ((8'hb9) * (8'hbf)) : ((8'ha7) ? (8'ha5) : (8'ha6)))))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire86;
  input wire [(3'h7):(1'h0)] wire85;
  input wire signed [(5'h14):(1'h0)] wire84;
  input wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire87 = ($unsigned($signed(wire84[(2'h3):(2'h2)])) ?
                      wire84 : $unsigned($unsigned($unsigned({wire85,
                          wire85}))));
  assign wire88 = ({wire84} ^ (wire83 ?
                      $signed((wire87 ? wire84 : $signed(wire86))) : wire83));
  assign wire89 = wire84[(5'h12):(4'h9)];
  assign wire90 = ($signed(wire84[(5'h12):(3'h7)]) ?
                      (((8'hb4) || (wire87[(4'hd):(2'h3)] >>> {wire84})) ?
                          wire87[(4'h8):(3'h7)] : $signed($signed((~wire86)))) : ($unsigned(($unsigned(wire89) ?
                          $unsigned(wire89) : wire86[(2'h2):(1'h1)])) ^~ $unsigned((~^(wire84 - (7'h42))))));
  assign wire91 = $unsigned(wire84[(4'hf):(4'he)]);
  assign wire92 = wire86[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg93 <= wire89[(3'h4):(1'h1)];
      reg94 <= $unsigned(wire87[(5'h10):(2'h3)]);
      reg95 <= ($signed({($unsigned((8'h9e)) << ((8'hbc) || wire83)),
              $unsigned((wire90 ? reg94 : wire90))}) ?
          $unsigned((~|(~&wire89))) : (($unsigned({wire83}) ^~ (~|$unsigned(wire85))) ?
              wire83 : (~^{{reg94, wire92}})));
      reg96 <= {$signed((((wire87 ? wire88 : wire83) ?
              $signed((8'hb1)) : wire88[(2'h3):(2'h3)]) | $unsigned({wire92,
              reg95}))),
          $signed($signed(($signed((8'h9e)) || (wire91 ? wire92 : reg94))))};
    end
  assign wire97 = {($signed((&(~^(8'ha4)))) ^~ (wire88[(1'h1):(1'h1)] ?
                          {{reg96, reg95}} : ((~&wire91) ?
                              wire83 : $signed(wire84)))),
                      $unsigned($signed(((wire89 ?
                          wire91 : (7'h41)) ^ $unsigned(wire92))))};
  assign wire98 = (($signed(({wire84} ~^ $unsigned(reg94))) ?
                          wire89[(3'h6):(3'h5)] : (~$unsigned(wire92))) ?
                      $unsigned(((reg95[(1'h0):(1'h0)] && ((8'hae) == (8'ha7))) ?
                          (8'ha7) : $signed(wire85[(2'h3):(1'h1)]))) : $unsigned(reg94[(2'h3):(1'h0)]));
  assign wire99 = $unsigned(wire92[(5'h10):(4'h8)]);
endmodule

module module59
#(parameter param78 = {(8'ha6)}, 
parameter param79 = (((+(-(param78 ? param78 : param78))) >>> (+((param78 >>> param78) ? (!(8'ha4)) : {param78}))) ? ((param78 < ((~&param78) - ((8'ha4) ? param78 : (8'hb0)))) ? ((!(8'haa)) * param78) : {(&(|param78))}) : {param78, (~&((param78 > param78) ? param78 : ((8'hb3) || param78)))}))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  input wire [(2'h2):(1'h0)] wire62;
  input wire [(4'hc):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  assign y = {wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg76,
                 reg75,
                 reg70,
                 (1'h0)};
  assign wire65 = $signed((wire60 ?
                      $unsigned(wire61) : $unsigned((wire64[(3'h4):(1'h1)] >> wire64))));
  assign wire66 = {(wire63 * {(wire62[(1'h1):(1'h0)] << {wire65})})};
  assign wire67 = $signed($signed({wire61,
                      ((wire65 + wire61) > $unsigned(wire61))}));
  assign wire68 = $signed({(8'hab), wire62});
  assign wire69 = $signed(wire61);
  always
    @(posedge clk) begin
      reg70 <= (~{(^~(8'hbd)), wire61});
    end
  assign wire71 = ((wire69[(3'h4):(2'h3)] ?
                      {reg70[(3'h4):(2'h3)]} : (wire67 ?
                          ($unsigned(wire63) ?
                              $unsigned(wire66) : wire63[(4'hb):(2'h2)]) : (!wire68))) ^~ (+wire61));
  assign wire72 = reg70;
  assign wire73 = wire71[(3'h4):(1'h1)];
  assign wire74 = $unsigned({{$unsigned((&wire68)), (8'hbc)}});
  always
    @(posedge clk) begin
      reg75 <= $signed($signed(wire66[(4'h9):(3'h6)]));
      reg76 <= reg75;
    end
  assign wire77 = (~^{((wire65 ?
                          {(8'hb0)} : wire65[(4'hc):(4'hb)]) ~^ wire72[(1'h0):(1'h0)]),
                      $unsigned((wire67[(2'h3):(1'h1)] * (-(8'haa))))});
endmodule
