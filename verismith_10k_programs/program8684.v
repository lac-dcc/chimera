module top
#(parameter param206 = (-(((~&((8'hb9) << (8'hba))) ? (((8'hb2) ? (8'hb0) : (8'hb4)) ^~ ((8'ha3) ? (8'ha4) : (8'ha7))) : ((&(8'hbb)) ? (!(7'h44)) : ((8'hbd) ? (8'hb9) : (8'haa)))) & ((((8'hb6) ? (8'ha0) : (7'h42)) ^~ (|(8'ha1))) ? {(+(8'ha6))} : (((8'ha8) ? (8'hb6) : (8'haf)) <<< ((8'hbe) | (8'hbb)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire205;
  wire [(4'hd):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire [(5'h12):(1'h0)] wire201;
  wire signed [(4'h8):(1'h0)] wire200;
  wire signed [(4'hb):(1'h0)] wire199;
  wire signed [(5'h15):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire182;
  wire [(3'h6):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire196;
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg [(4'hc):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg195 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire180,
                 wire19,
                 wire18,
                 wire17,
                 wire182,
                 wire183,
                 wire196,
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
                 reg16,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
      if (({(|$unsigned(((8'ha0) == (8'hac))))} >> $unsigned($signed($unsigned(reg4)))))
        begin
          reg5 <= (^~((8'h9c) ?
              (^~wire2) : (wire3[(2'h2):(1'h1)] ?
                  {(~|(8'hb9))} : ($unsigned(wire0) * wire0))));
          if (wire3[(2'h2):(1'h0)])
            begin
              reg6 <= (wire1[(3'h4):(2'h2)] ?
                  wire2[(1'h0):(1'h0)] : $signed($signed(($signed(reg5) ?
                      $unsigned(wire3) : $unsigned(wire3)))));
              reg7 <= (8'hbd);
              reg8 <= wire2;
              reg9 <= ($unsigned({$unsigned((wire3 != reg6))}) < $signed($signed((8'hb5))));
              reg10 <= (+reg6[(4'h8):(3'h5)]);
            end
          else
            begin
              reg6 <= {(reg10 >> wire0[(3'h4):(3'h4)]), $unsigned(reg7)};
            end
          if ($signed(reg9[(2'h2):(1'h1)]))
            begin
              reg11 <= {(~|(wire0[(3'h4):(2'h3)] <<< (8'hab))),
                  (+$signed((^~((8'haf) * reg7))))};
              reg12 <= ($signed($unsigned({(&reg5)})) << (^~(~|((reg9 || reg8) ?
                  (reg7 || reg8) : $signed(wire3)))));
              reg13 <= ($unsigned((7'h41)) ?
                  $signed($signed((~&(8'ha5)))) : reg6);
              reg14 <= wire3[(1'h0):(1'h0)];
            end
          else
            begin
              reg11 <= $unsigned((&{{reg9, $unsigned(reg13)},
                  $signed((reg6 == reg13))}));
              reg12 <= reg11;
              reg13 <= {$unsigned((+((^~reg13) <<< $unsigned(wire3)))),
                  $unsigned((^~(!reg14)))};
              reg14 <= $signed((-reg7));
              reg15 <= (8'hb9);
            end
          reg16 <= (8'hb3);
        end
      else
        begin
          if ($signed(({(reg13[(1'h1):(1'h1)] ?
                  $unsigned((8'haf)) : (reg9 - reg14))} < reg8[(3'h5):(2'h2)])))
            begin
              reg5 <= {(~^($unsigned($signed(reg11)) || reg13)),
                  {(wire3[(2'h2):(2'h2)] && $signed(reg4)),
                      {wire3[(1'h1):(1'h1)]}}};
              reg6 <= (^$signed({(^~wire3[(2'h2):(1'h0)])}));
              reg7 <= (^$unsigned((reg5 ?
                  (~&wire0[(3'h4):(1'h0)]) : (reg14[(1'h1):(1'h1)] ?
                      wire2 : reg15))));
              reg8 <= $unsigned(reg16[(4'hb):(1'h0)]);
            end
          else
            begin
              reg5 <= ((~^(~(wire2 ?
                  (8'ha9) : (&reg13)))) >> $unsigned($unsigned({{reg16},
                  (wire3 ? reg4 : wire2)})));
              reg6 <= (reg14 ^~ reg14[(4'ha):(3'h7)]);
              reg7 <= (-$unsigned($unsigned((^reg11))));
              reg8 <= ($unsigned((reg10 ?
                  ($signed(reg15) ?
                      reg8[(1'h1):(1'h1)] : reg13) : $signed($signed((8'ha7))))) * (reg15[(2'h2):(2'h2)] == $signed(reg5)));
            end
          if (((~^({(wire1 >>> (8'hb3)), reg9} ?
              $signed(reg15) : $signed((reg9 ?
                  reg6 : reg5)))) * ({reg4[(1'h1):(1'h1)],
                  reg8[(2'h3):(2'h2)]} ?
              $signed($signed((reg13 ? reg16 : reg5))) : (!(|(reg6 + reg16))))))
            begin
              reg9 <= $signed($unsigned((8'hba)));
              reg10 <= (reg12[(2'h2):(1'h1)] ?
                  ($unsigned($unsigned($unsigned(wire1))) * reg6[(2'h3):(2'h2)]) : (+$signed(($unsigned(reg14) ^~ reg7))));
              reg11 <= (!(reg11 ?
                  $signed(($signed(reg8) + wire3)) : reg10[(1'h1):(1'h0)]));
              reg12 <= reg7[(5'h12):(4'he)];
              reg13 <= (&wire1);
            end
          else
            begin
              reg9 <= reg14[(2'h3):(1'h1)];
            end
          reg14 <= $unsigned(($unsigned(reg9) <= wire3[(1'h1):(1'h1)]));
        end
    end
  assign wire17 = $unsigned(((^~(reg6[(3'h6):(2'h3)] ?
                          (reg12 ^ reg5) : (reg7 ^~ wire1))) ?
                      reg13 : (~^$unsigned((reg8 ? reg11 : reg4)))));
  assign wire18 = (!(($signed((~&wire17)) & reg12[(4'hd):(4'ha)]) ?
                      $signed($unsigned($unsigned((8'h9e)))) : $unsigned({{reg14,
                              reg11},
                          {wire0}})));
  assign wire19 = $unsigned((|reg4));
  module20 #() modinst181 (wire180, clk, reg13, reg9, wire0, reg5, reg7);
  assign wire182 = (wire17 ?
                       (($signed($signed(wire180)) ?
                               $unsigned(((8'haa) ?
                                   wire3 : (7'h43))) : ($unsigned(reg14) ?
                                   (~^wire1) : $unsigned(reg7))) ?
                           reg6[(1'h0):(1'h0)] : $unsigned(reg4)) : (&($signed(wire180[(3'h6):(1'h1)]) ?
                           $unsigned((~(8'ha9))) : (~|(-wire3)))));
  assign wire183 = reg16;
  always
    @(posedge clk) begin
      if ({reg6[(4'hd):(3'h5)]})
        begin
          reg184 <= $unsigned($unsigned((&$signed((~reg15)))));
          if (reg9)
            begin
              reg185 <= reg6[(3'h5):(1'h1)];
              reg186 <= reg11;
              reg187 <= $signed(($unsigned(reg15[(3'h4):(1'h0)]) ?
                  (reg15[(3'h6):(1'h0)] >>> {((8'hbf) >>> wire17),
                      wire182[(4'h9):(1'h0)]}) : (8'hac)));
              reg188 <= $signed((7'h40));
            end
          else
            begin
              reg185 <= {(~(^(&reg188[(2'h2):(2'h2)])))};
              reg186 <= (~&wire182);
            end
          reg189 <= (reg186 >>> wire18);
        end
      else
        begin
          reg184 <= wire180;
          if ((reg187 <= $signed(($unsigned((wire3 <<< wire17)) ?
              ($signed(wire2) ? $unsigned((8'hb5)) : {reg5}) : ({reg9} ?
                  {wire0} : reg6)))))
            begin
              reg185 <= $unsigned((wire1[(1'h1):(1'h1)] ?
                  (8'hb2) : ((&wire18[(1'h0):(1'h0)]) & $unsigned((reg15 ?
                      wire18 : (8'haa))))));
              reg186 <= ({((&$signed(reg184)) ^ (((8'hb0) > (8'hb9)) ^~ (~^wire17))),
                      reg11[(3'h4):(2'h2)]} ?
                  ($unsigned(((reg5 == reg15) << (~wire1))) >= (reg185 > (wire2 <= {reg187}))) : $signed((~^({(8'hbb)} ~^ (reg14 ?
                      reg4 : reg187)))));
              reg187 <= {($unsigned((reg15[(3'h4):(2'h3)] < ((8'hb0) ?
                      wire3 : reg185))) << $unsigned($signed($unsigned(wire183)))),
                  ($signed($unsigned((wire2 > wire19))) ?
                      ($unsigned((wire182 ? reg14 : wire18)) ?
                          (reg9[(1'h1):(1'h0)] ?
                              reg6 : $signed(reg4)) : {$signed(wire182)}) : (~^($signed(reg10) ?
                          (wire183 ?
                              reg15 : reg184) : reg184[(1'h1):(1'h0)])))};
              reg188 <= {wire3[(1'h1):(1'h1)]};
            end
          else
            begin
              reg185 <= $unsigned(($unsigned(reg10[(4'hd):(4'ha)]) ?
                  ((~^(!wire1)) ?
                      ({reg8, (8'ha6)} - (reg184 ?
                          reg7 : (8'hb9))) : reg185) : reg185[(4'h8):(2'h3)]));
              reg186 <= wire183[(3'h6):(3'h5)];
              reg187 <= ((((~((8'ha0) ? reg11 : wire2)) ?
                      (reg14 || reg13[(4'hb):(3'h7)]) : $signed((reg13 >= reg185))) ?
                  wire17 : {(((8'hb3) >>> reg13) ?
                          (|reg10) : (reg6 << reg6))}) >>> reg189[(5'h12):(3'h7)]);
              reg188 <= reg188[(2'h2):(1'h0)];
              reg189 <= $unsigned((reg14[(3'h5):(3'h5)] < ((~&(wire2 ?
                  reg4 : reg12)) || wire17[(1'h1):(1'h1)])));
            end
          reg190 <= reg6;
          reg191 <= wire1;
          reg192 <= $signed((reg5[(5'h12):(4'h8)] ?
              $unsigned($unsigned((reg186 | reg15))) : ($unsigned((wire2 >> (8'ha5))) ?
                  {$signed(wire183)} : reg188)));
        end
      reg193 <= (({(~(reg12 ? reg15 : reg188))} || ((~&(wire180 ?
              reg190 : reg13)) ?
          {$unsigned(reg12),
              $signed(reg7)} : (|{(8'ha2)}))) << ($unsigned((wire3[(1'h0):(1'h0)] ?
              $unsigned(reg7) : reg14[(4'h8):(2'h2)])) ?
          ((~&(reg14 ?
              reg7 : reg4)) - ($unsigned((8'hac)) ^~ wire18)) : ({wire18[(3'h6):(1'h1)],
              (wire3 << reg186)} > $unsigned(reg14))));
      reg194 <= (8'ha4);
      reg195 <= reg184[(3'h6):(3'h4)];
    end
  module26 #() modinst197 (.y(wire196), .wire31(reg188), .wire29(reg6), .wire30(reg192), .wire27(reg190), .wire28(wire183), .clk(clk));
  assign wire198 = $unsigned(reg185);
  assign wire199 = $unsigned($unsigned($signed(wire182)));
  assign wire200 = wire180;
  module26 #() modinst202 (wire201, clk, reg185, wire17, wire180, reg15, reg5);
  assign wire203 = (reg190[(3'h6):(3'h6)] ?
                       (~&{wire198[(3'h5):(2'h3)]}) : $unsigned(reg185));
  assign wire204 = ($signed($signed($unsigned((|wire200)))) ?
                       reg195[(3'h5):(2'h3)] : $signed($unsigned($signed(wire196[(2'h2):(1'h1)]))));
  assign wire205 = {$signed(reg185)};
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire118;
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  assign y = {wire178,
                 wire150,
                 wire149,
                 wire147,
                 wire40,
                 wire42,
                 wire44,
                 wire45,
                 wire54,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire118,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 (1'h0)};
  module26 #() modinst41 (.y(wire40), .wire27(wire21), .wire30(wire22), .wire29(wire25), .wire31(wire24), .wire28(wire23), .clk(clk));
  assign wire42 = wire22[(4'hf):(4'hb)];
  always
    @(posedge clk) begin
      reg43 <= wire40;
    end
  assign wire44 = reg43[(4'h8):(3'h6)];
  assign wire45 = $signed(($unsigned($signed(wire42)) ?
                      $signed($unsigned((wire22 ?
                          (8'hb9) : wire22))) : $unsigned(($unsigned(wire42) ?
                          (8'hb7) : ((8'hb3) && wire40)))));
  always
    @(posedge clk) begin
      reg46 <= wire24[(4'h8):(3'h6)];
      reg47 <= {wire24, reg46[(3'h5):(3'h5)]};
      if ($unsigned($signed((((8'ha5) ?
          wire22[(4'h8):(3'h7)] : (reg46 || reg43)) <<< $unsigned((wire25 ?
          (8'ha4) : wire40))))))
        begin
          reg48 <= $signed($unsigned(({reg46} ?
              (!(~&(8'h9c))) : ((wire22 ?
                  reg46 : wire44) + wire21[(3'h6):(2'h3)]))));
          reg49 <= $signed(($signed({reg47[(2'h3):(1'h0)], $unsigned(reg46)}) ?
              wire25[(4'ha):(2'h3)] : wire45));
          reg50 <= wire45[(3'h5):(2'h3)];
          reg51 <= wire21[(2'h2):(2'h2)];
          reg52 <= reg48[(3'h5):(3'h4)];
        end
      else
        begin
          if (wire25[(4'he):(4'hb)])
            begin
              reg48 <= ({(($unsigned(reg47) ?
                          (~reg48) : wire45[(2'h2):(2'h2)]) ?
                      ((wire25 ?
                          reg52 : wire42) << (8'ha9)) : ((wire22 * (8'had)) ?
                          (reg43 < reg43) : $unsigned(reg52))),
                  $unsigned({((8'hb4) | reg51),
                      (reg47 ?
                          (8'haa) : wire44)})} <<< ((~$signed($signed(wire22))) * {(~^((8'h9d) ?
                      reg43 : reg52)),
                  (^~reg48[(3'h6):(1'h0)])}));
              reg49 <= $unsigned($signed((-(reg43 ?
                  $unsigned((8'hba)) : $unsigned((8'hbd))))));
              reg50 <= wire25[(4'hc):(2'h2)];
              reg51 <= wire40;
            end
          else
            begin
              reg48 <= $signed(($unsigned((~&(~^reg49))) ?
                  (-((!wire44) ~^ (&reg43))) : ($unsigned((wire44 ?
                      wire25 : wire40)) ^~ ((8'hb5) ?
                      (reg51 ? reg47 : reg51) : (wire25 ? wire23 : reg50)))));
              reg49 <= (!{(($signed(reg46) - reg46[(3'h6):(3'h6)]) ?
                      ((&reg46) ?
                          wire22[(1'h1):(1'h1)] : reg49[(3'h6):(2'h2)]) : reg48[(4'hb):(3'h6)]),
                  $unsigned(($signed(reg50) ?
                      reg46[(4'h9):(3'h4)] : $unsigned((8'had))))});
              reg50 <= wire22;
              reg51 <= $signed(wire24[(4'ha):(4'h9)]);
            end
          reg52 <= $unsigned(wire44);
        end
      reg53 <= (~{(7'h44), (|$unsigned(reg46[(1'h0):(1'h0)]))});
    end
  assign wire54 = ($signed(reg49[(3'h6):(3'h6)]) && (8'hbb));
  always
    @(posedge clk) begin
      reg55 <= wire44[(2'h2):(1'h0)];
      reg56 <= (wire21 ?
          $unsigned((($unsigned(wire22) ?
                  (reg52 ? reg49 : reg47) : (reg51 ? wire42 : reg55)) ?
              ($unsigned((8'hb6)) ?
                  reg52 : wire25[(2'h3):(1'h1)]) : wire21[(2'h2):(1'h0)])) : ((^((reg43 ?
                  wire25 : reg51) ?
              $signed(wire23) : (reg48 ?
                  reg46 : wire23))) | {wire25[(4'h8):(3'h7)]}));
      reg57 <= $signed(($unsigned((reg56[(1'h0):(1'h0)] ?
              $unsigned(reg55) : (!reg50))) ?
          (wire25[(2'h2):(2'h2)] * $unsigned($unsigned(reg51))) : $signed(reg43)));
      if ({{$unsigned((8'h9e))}})
        begin
          reg58 <= (wire44 ?
              $signed(reg56[(5'h10):(4'hd)]) : ((reg55 - $signed($signed(wire44))) & reg47[(3'h7):(3'h6)]));
          reg59 <= {$unsigned($signed((~^(reg55 ? reg43 : reg50)))),
              ({{reg47[(4'h8):(1'h0)]}} == ((reg46 | (reg49 ?
                      reg43 : (8'haf))) ?
                  reg48 : $unsigned(reg53[(2'h3):(2'h3)])))};
          reg60 <= $unsigned({((~|(wire42 >> wire54)) ?
                  (reg50 ? (reg56 ? wire54 : wire40) : wire44) : (!(reg55 ?
                      wire54 : wire42)))});
          reg61 <= (wire25 ? wire44 : reg48[(4'hc):(3'h6)]);
          reg62 <= (^~(8'h9f));
        end
      else
        begin
          reg58 <= {{(7'h43), $unsigned(($signed((8'hb3)) && (~|reg55)))},
              $signed((~wire25[(4'ha):(1'h0)]))};
          reg59 <= ((($unsigned((~^(8'hb6))) ?
              $unsigned((reg47 ^ (7'h43))) : ($unsigned(reg55) ?
                  wire23[(4'h8):(3'h5)] : (reg53 & wire44))) >= ((|{wire24}) ~^ (|(&reg57)))) <= {reg43,
              reg51[(4'hf):(4'hb)]});
          reg60 <= wire22;
        end
    end
  always
    @(posedge clk) begin
      reg63 <= ($unsigned({($unsigned(reg47) >>> (^reg51)),
          {(-reg46), $unsigned(reg48)}}) ^~ reg49[(1'h0):(1'h0)]);
      if ((^~($unsigned($signed(reg55[(4'h8):(3'h5)])) >= (7'h43))))
        begin
          reg64 <= {$unsigned({((wire54 ? reg62 : (7'h40)) ?
                      $unsigned(reg52) : $unsigned(wire45)),
                  (~reg61)}),
              (!$signed(({reg61} ? reg60[(4'hc):(4'ha)] : (8'hbf))))};
          reg65 <= (-reg46);
        end
      else
        begin
          reg64 <= $unsigned({({$unsigned(wire23)} ?
                  reg49 : $signed((wire25 ? wire24 : reg57)))});
          reg65 <= ({$unsigned(wire42)} >>> ($signed({(!reg50),
              reg64}) + $signed($signed(wire24[(3'h5):(2'h2)]))));
          if (reg50[(3'h4):(1'h0)])
            begin
              reg66 <= ($signed(wire42) >>> (^reg57));
              reg67 <= $signed(reg57[(4'hb):(4'h9)]);
            end
          else
            begin
              reg66 <= reg63;
              reg67 <= wire54[(4'h8):(3'h6)];
              reg68 <= {(reg61[(4'h9):(2'h3)] ? wire24[(4'h8):(1'h0)] : reg55),
                  reg43};
              reg69 <= reg67[(1'h0):(1'h0)];
            end
          reg70 <= (wire40[(4'hc):(3'h7)] * {$unsigned(({reg52,
                  wire22} || (reg58 * wire44)))});
          reg71 <= $signed($unsigned(reg57[(4'ha):(4'h8)]));
        end
    end
  assign wire72 = {($unsigned(((reg60 - wire42) >= (~reg68))) ?
                          reg47 : ((~|wire22) == ({wire45,
                              reg56} < $signed(reg58))))};
  assign wire73 = wire22;
  assign wire74 = $signed(reg65);
  assign wire75 = {($unsigned(($signed(reg69) ?
                          $unsigned(reg70) : reg53[(3'h4):(2'h3)])) < (reg43[(4'h9):(2'h3)] ?
                          {(8'hae)} : reg48[(2'h2):(2'h2)]))};
  always
    @(posedge clk) begin
      reg76 <= (+(($unsigned($unsigned(wire23)) ?
          $signed((wire72 - reg52)) : {$unsigned(wire42)}) > $unsigned($signed(reg61))));
      reg77 <= ((^$unsigned({$unsigned(reg64),
          (&reg47)})) << (~|$unsigned((-$signed(reg76)))));
      reg78 <= $signed({$signed(({reg52, reg63} ? reg43 : (~reg58))),
          $signed({(wire54 ? (8'hb7) : reg48)})});
      reg79 <= reg63;
    end
  assign wire80 = reg66;
  assign wire81 = reg51;
  assign wire82 = (^reg76[(1'h1):(1'h0)]);
  assign wire83 = $signed($signed($unsigned((!reg62[(2'h2):(2'h2)]))));
  module84 #() modinst119 (wire118, clk, reg52, reg58, reg79, wire54);
  module120 #() modinst148 (wire147, clk, reg70, wire82, wire80, reg69);
  assign wire149 = $unsigned($signed(wire25[(4'he):(4'hc)]));
  assign wire150 = (~|reg56);
  module151 #() modinst179 (.clk(clk), .wire152(reg48), .wire155(reg62), .wire153(wire40), .wire156(wire149), .wire154(reg66), .y(wire178));
endmodule

module module151
#(parameter param177 = ((!({((8'hab) <= (8'hb5))} && (((8'hb4) ? (8'hbb) : (8'ha7)) | (!(8'ha2))))) || ((((~&(8'ha6)) & ((8'hbe) ? (8'h9e) : (8'hb9))) ? {((8'hb9) ? (8'hb3) : (8'hba)), ((7'h44) | (8'ha5))} : (~^(~(8'hb1)))) >> (~&((&(7'h40)) >> ((7'h42) || (8'hbb)))))))
(y, clk, wire156, wire155, wire154, wire153, wire152);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire156;
  input wire [(5'h11):(1'h0)] wire155;
  input wire [(4'ha):(1'h0)] wire154;
  input wire signed [(5'h15):(1'h0)] wire153;
  input wire signed [(3'h5):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire174;
  wire signed [(2'h3):(1'h0)] wire173;
  wire [(3'h4):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire169;
  wire [(4'hf):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire158,
                 wire157,
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
                 (1'h0)};
  assign wire157 = (~&$signed(wire154[(4'h9):(3'h7)]));
  assign wire158 = $signed((((&$signed(wire154)) ?
                       wire154 : (~&{wire156,
                           wire154})) * wire157[(3'h7):(3'h6)]));
  always
    @(posedge clk) begin
      reg159 <= wire157;
      if (wire156)
        begin
          if ({($signed(wire156[(1'h0):(1'h0)]) || wire158),
              $unsigned(($signed({wire157}) < wire153[(3'h7):(2'h3)]))})
            begin
              reg160 <= (&(reg159 * wire154));
              reg161 <= wire158[(3'h6):(3'h5)];
              reg162 <= ((-($unsigned(wire155[(1'h0):(1'h0)]) | reg159)) ?
                  $signed($signed(reg160[(4'h8):(1'h0)])) : (~&$signed($unsigned((reg160 ~^ reg161)))));
              reg163 <= $unsigned(((~({reg160} ?
                  reg161[(2'h3):(1'h0)] : $signed(wire154))) || ((8'h9d) ~^ ((^~wire153) ?
                  $unsigned(wire153) : (wire154 >= wire158)))));
            end
          else
            begin
              reg160 <= (~^((8'haa) <= $unsigned($unsigned((~^reg160)))));
              reg161 <= $signed(($unsigned(({wire155,
                  reg161} - (-reg162))) >= (~|$unsigned(reg161))));
              reg162 <= ($signed(wire153[(4'h8):(3'h5)]) ?
                  wire158[(2'h2):(1'h1)] : reg163);
              reg163 <= reg159[(3'h5):(1'h0)];
            end
          reg164 <= (~^reg159[(3'h4):(2'h3)]);
          reg165 <= {{wire157[(2'h2):(1'h1)], (|$signed($unsigned(reg161)))},
              $signed(wire154[(3'h5):(1'h1)])};
        end
      else
        begin
          reg160 <= (~|((reg159[(4'h8):(3'h4)] | ((^~wire158) ?
              {reg164, reg164} : $unsigned(reg163))) <<< wire155));
          reg161 <= ($unsigned(((+{wire154, (7'h44)}) ?
                  (reg160[(4'he):(3'h5)] ?
                      (reg164 - wire153) : $signed(reg159)) : wire156)) ?
              (~(+((^reg162) != (&reg162)))) : (+$unsigned(wire156)));
          reg162 <= {wire153, reg159};
          reg163 <= wire154[(2'h3):(2'h2)];
          if (wire153)
            begin
              reg164 <= $signed($unsigned((^{(^~wire152), {wire152}})));
              reg165 <= $unsigned({$unsigned(($signed((7'h42)) == wire158))});
              reg166 <= (reg159 ^ (^~(!{(wire155 * wire154)})));
              reg167 <= (|{wire153[(3'h7):(1'h1)]});
            end
          else
            begin
              reg164 <= reg160;
              reg165 <= $unsigned((((~&wire153) ?
                      $unsigned((~&reg162)) : wire157[(1'h1):(1'h0)]) ?
                  $unsigned(wire158) : $unsigned(reg161[(4'ha):(1'h0)])));
              reg166 <= wire155[(5'h10):(4'he)];
              reg167 <= $unsigned(($signed(((^(8'ha8)) ?
                  ((8'h9f) ? wire155 : wire157) : wire154)) <<< reg163));
            end
        end
      reg168 <= $signed($unsigned((wire152[(3'h4):(2'h2)] >>> $signed(wire157))));
    end
  assign wire169 = $unsigned(($signed($signed(reg168)) - ($signed({wire155}) ?
                       reg167[(2'h2):(2'h2)] : wire152[(1'h1):(1'h1)])));
  assign wire170 = ({$signed($unsigned((reg159 >= reg160))),
                           {({reg163} ?
                                   ((8'hb8) ?
                                       wire158 : wire156) : $signed((7'h44))),
                               $unsigned((wire169 ? wire158 : (8'ha9)))}} ?
                       {$signed(((reg165 ?
                               (7'h41) : reg164) ~^ (+reg159)))} : ((-((reg161 <= wire156) ^ $unsigned(wire156))) ~^ $unsigned(($signed(wire158) ^ $unsigned(reg160)))));
  assign wire171 = ($unsigned(((8'ha7) ?
                           $signed((reg160 > wire157)) : wire155)) ?
                       reg167 : reg165);
  assign wire172 = reg163;
  assign wire173 = (|$signed((($unsigned(wire172) ?
                       $signed((8'hbd)) : (wire154 ?
                           wire153 : reg159)) == {(wire172 >= wire169)})));
  assign wire174 = (reg162[(3'h6):(2'h2)] ?
                       ((((reg161 ? wire171 : (8'hbd)) ?
                               $unsigned(wire169) : {reg166, reg163}) ?
                           $signed(wire153) : $signed($signed(reg168))) > reg168[(3'h4):(1'h1)]) : (wire173 <<< ($signed($signed(wire171)) ?
                           wire156[(5'h12):(4'h9)] : wire156)));
  assign wire175 = (reg168[(1'h0):(1'h0)] <<< (((+wire152) ?
                           wire172[(2'h2):(2'h2)] : wire158) ?
                       (+(&(wire173 ~^ wire154))) : (^((~^wire171) | (reg165 ?
                           reg165 : (8'hb0))))));
  assign wire176 = (((~&wire169) + (reg168[(1'h1):(1'h1)] ?
                       reg159 : ((wire156 ?
                           wire158 : wire169) * (~^reg166)))) == ((($signed(reg165) && (reg162 <<< wire153)) || $unsigned({reg159,
                           (8'hae)})) ?
                       wire152 : (reg161[(3'h4):(3'h4)] ?
                           $unsigned((wire154 ^ (8'hb5))) : (wire173 ?
                               reg167[(1'h1):(1'h1)] : wire158))));
endmodule

module module120
#(parameter param146 = {(((~&(8'ha2)) ^~ ({(8'h9d), (8'had)} | ((8'hbb) ? (8'haf) : (7'h44)))) ? ((((8'h9f) * (8'hbe)) ? {(8'hb2), (8'ha0)} : ((8'hbe) ? (8'hae) : (8'hbd))) * (~^((8'hbf) ? (8'hac) : (8'ha4)))) : ({((8'h9f) ? (8'h9d) : (8'haa))} ? ((!(8'hb4)) + ((8'ha3) ? (8'ha8) : (8'h9c))) : {((8'hab) != (8'ha0))}))})
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire124;
  input wire signed [(4'h9):(1'h0)] wire123;
  input wire signed [(2'h3):(1'h0)] wire122;
  input wire signed [(5'h15):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire signed [(4'ha):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  assign y = {wire143,
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
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg145,
                 reg144,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire125 = (~|($signed($signed({wire124, wire122})) ~^ ({(wire123 ?
                           wire123 : wire121),
                       wire122} < $signed((wire124 << wire124)))));
  assign wire126 = $signed((~|((-(wire125 || wire122)) ?
                       $unsigned((+wire121)) : (~((8'hb6) ^~ wire122)))));
  assign wire127 = ($unsigned(($signed((wire126 ? wire125 : wire126)) ?
                       wire126[(1'h1):(1'h0)] : ({wire124,
                           (8'ha4)} ~^ (&wire126)))) | ({$unsigned((~wire123))} & ({$unsigned(wire122),
                       (!wire123)} != (wire121[(4'ha):(2'h3)] ?
                       (wire124 < wire122) : $signed((8'h9f))))));
  assign wire128 = $unsigned($unsigned(($signed(wire123) + $unsigned($signed(wire127)))));
  always
    @(posedge clk) begin
      reg129 <= wire121;
      reg130 <= (wire123 + $signed(wire126[(2'h2):(1'h0)]));
      reg131 <= wire121[(5'h14):(5'h14)];
      reg132 <= ((wire126 >> wire121) >>> ((((8'hb2) ~^ $signed((8'ha0))) ?
              reg131 : wire125) ?
          (wire121[(3'h7):(3'h6)] << $signed(wire126)) : (({reg129,
                  wire124} & (wire127 - reg130)) ?
              $unsigned(wire121[(3'h4):(2'h2)]) : wire127[(3'h4):(1'h0)])));
    end
  assign wire133 = ($signed((($signed(wire128) ?
                       ((7'h40) << wire125) : ((7'h41) << wire123)) <= $signed((+wire127)))) && wire128[(1'h1):(1'h1)]);
  assign wire134 = ($signed($signed($signed((wire123 * wire127)))) ?
                       (~&wire133[(1'h0):(1'h0)]) : $signed($signed($signed((~^reg130)))));
  assign wire135 = (((8'ha3) ?
                       $signed((reg130[(1'h1):(1'h1)] ?
                           ((8'haf) | wire126) : wire122[(2'h2):(1'h0)])) : $signed(reg131[(2'h3):(2'h2)])) + $signed(({((8'hab) << reg130),
                           $signed(reg130)} ?
                       $signed($unsigned((8'hb2))) : $unsigned($signed(reg131)))));
  assign wire136 = $signed((reg130[(4'hb):(4'ha)] ?
                       $unsigned(wire133) : $unsigned((-(-wire127)))));
  assign wire137 = (8'hbd);
  assign wire138 = {reg131[(2'h2):(1'h0)],
                       (($signed((^~(8'hb3))) ?
                               (+(~|wire121)) : (wire136[(3'h6):(2'h3)] ?
                                   {wire137} : (wire136 ? wire126 : wire133))) ?
                           (wire137[(4'h9):(2'h3)] ?
                               ((8'h9c) * (wire123 < reg129)) : (&(-wire126))) : (({(8'hb3),
                               (8'hab)} != $signed((8'haf))) * reg132[(3'h7):(3'h7)]))};
  assign wire139 = (&$unsigned($signed($unsigned((+wire124)))));
  assign wire140 = $unsigned(wire122);
  assign wire141 = $signed({({$unsigned(wire137)} << ((~&(8'ha5)) != (~^(8'ha6))))});
  assign wire142 = $unsigned(wire121);
  assign wire143 = $unsigned(($signed((wire141[(1'h0):(1'h0)] << wire128[(1'h0):(1'h0)])) ?
                       $signed(wire124) : wire133[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg144 <= $unsigned({(~^(reg132 ?
              (wire142 ? wire140 : wire122) : $unsigned(wire128)))});
      reg145 <= (+(~reg144[(3'h5):(2'h3)]));
    end
endmodule

module module84
#(parameter param117 = ((^(~^(((7'h42) ? (8'hb5) : (8'ha6)) < (8'hba)))) <= (8'h9d)))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire88;
  input wire signed [(4'hb):(1'h0)] wire87;
  input wire [(4'he):(1'h0)] wire86;
  input wire signed [(2'h2):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire89;
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire106,
                 wire105,
                 wire104,
                 wire101,
                 wire100,
                 wire89,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
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
                 (1'h0)};
  assign wire89 = (^(wire86 | $signed((~|{wire88}))));
  always
    @(posedge clk) begin
      reg90 <= (wire86[(2'h2):(1'h0)] <<< (~^(^((~^wire88) ?
          wire87[(4'h8):(3'h4)] : $unsigned(wire86)))));
      reg91 <= wire87[(3'h6):(2'h2)];
      reg92 <= ($unsigned((~&(7'h40))) ?
          ((~((8'hb5) ? ((8'hbb) ? wire87 : reg90) : (wire85 + wire85))) ?
              ((~&wire87[(4'hb):(3'h4)]) ?
                  (+wire87) : ((reg91 ?
                      wire86 : reg90) ^ $signed(wire85))) : (((^~wire86) ^~ (reg90 ?
                      wire86 : wire89)) ?
                  {{wire89, wire89}} : (~(wire86 == wire85)))) : (&wire85));
      if ($signed({wire85}))
        begin
          reg93 <= (-wire85);
          reg94 <= ($unsigned($unsigned(($unsigned(wire88) ?
                  $signed(wire89) : {reg91, wire86}))) ?
              reg90[(4'h9):(2'h2)] : wire87);
          reg95 <= reg93;
          reg96 <= ((~&(wire85[(1'h1):(1'h1)] + ((!(8'hab)) ?
                  (^~reg91) : {wire89, reg90}))) ?
              (+reg90[(4'hd):(3'h7)]) : reg91);
          if ((^({(~&$unsigned(wire85)),
              (^~(reg91 * (8'h9c)))} > ($unsigned(wire89) >= (reg90 ?
              $unsigned(reg95) : reg93)))))
            begin
              reg97 <= wire86[(4'hc):(2'h3)];
            end
          else
            begin
              reg97 <= {$unsigned(wire88)};
              reg98 <= $signed({$unsigned((^$signed((8'had)))),
                  reg90[(4'hc):(2'h2)]});
            end
        end
      else
        begin
          reg93 <= (($signed(((reg94 || wire86) ?
                  (+reg97) : $unsigned(reg93))) ?
              ($signed(wire85[(1'h0):(1'h0)]) <<< reg92) : ((&reg93) ?
                  reg91 : wire88)) || reg93[(5'h13):(3'h6)]);
          reg94 <= reg94[(1'h1):(1'h0)];
        end
      reg99 <= wire86;
    end
  assign wire100 = $unsigned(((reg93[(4'hd):(3'h4)] ^ {(reg92 ?
                           reg93 : reg96)}) && (|$unsigned(reg90[(3'h7):(1'h1)]))));
  assign wire101 = (wire85 ?
                       $unsigned($unsigned(reg94[(2'h3):(1'h1)])) : $signed((($unsigned(reg95) ?
                               (8'ha1) : wire86[(2'h2):(2'h2)]) ?
                           reg93 : wire87)));
  always
    @(posedge clk) begin
      reg102 <= ($signed((((wire87 <= reg96) ?
                  $unsigned(wire87) : (wire86 || reg90)) ?
              ((wire89 ? wire89 : reg91) - (reg93 ^~ reg94)) : (((8'hb7) ?
                      wire85 : wire88) ?
                  (wire86 * (8'hb2)) : (reg98 ? wire88 : reg90)))) ?
          reg93[(1'h1):(1'h0)] : reg97);
      reg103 <= $unsigned((+$unsigned($unsigned(reg90[(1'h1):(1'h1)]))));
    end
  assign wire104 = wire87;
  assign wire105 = ((($signed((7'h42)) || $signed((wire85 <<< wire86))) - (|(~|(!reg103)))) ?
                       (~^(&((wire88 || (8'ha7)) & (~|wire88)))) : ((~&({wire101,
                               (8'hb7)} ?
                           (reg92 - wire101) : $unsigned(reg95))) - ((8'ha9) >= wire88)));
  assign wire106 = (wire88 <<< {wire87, (-reg91)});
  always
    @(posedge clk) begin
      reg107 <= ((~|$unsigned(((reg103 || reg102) ?
              (wire106 ? (7'h44) : wire86) : wire104))) ?
          (^((wire85 << (~wire104)) >= $signed($unsigned(wire101)))) : wire104);
      if (reg94)
        begin
          reg108 <= {wire104[(2'h2):(1'h1)], {reg95}};
          reg109 <= {($unsigned($signed((wire88 <= reg95))) | $unsigned(wire87[(3'h4):(2'h3)]))};
          reg110 <= (8'hbb);
          reg111 <= {$signed(wire87), (8'h9c)};
          reg112 <= wire89[(1'h0):(1'h0)];
        end
      else
        begin
          reg108 <= reg91[(3'h5):(2'h2)];
          if (reg108)
            begin
              reg109 <= $unsigned((^$signed($unsigned((!reg102)))));
              reg110 <= $signed((((&$unsigned(wire105)) ?
                  $unsigned({wire86, wire101}) : ({reg111,
                      (8'hb2)} + $signed(reg92))) < $unsigned($signed($signed(wire100)))));
              reg111 <= ($signed(reg95) ? (8'ha3) : reg92[(2'h3):(2'h3)]);
            end
          else
            begin
              reg109 <= (!({reg99[(1'h1):(1'h1)],
                  reg99[(3'h4):(2'h3)]} + (!{(^wire86), reg110})));
              reg110 <= reg94[(5'h14):(4'h8)];
              reg111 <= reg96[(4'h8):(3'h7)];
              reg112 <= $unsigned((wire89 <= (+$unsigned($unsigned(reg110)))));
            end
          reg113 <= ({(8'ha1),
              ($unsigned($unsigned(reg92)) ?
                  ((wire88 ? (8'h9e) : reg94) | (reg99 ?
                      reg97 : reg95)) : $unsigned((reg111 ?
                      wire101 : reg99)))} << $signed((8'hab)));
          reg114 <= ($unsigned(wire87[(4'ha):(3'h7)]) ?
              (+((reg112[(5'h11):(5'h11)] | (wire87 ? wire88 : (8'hb0))) ?
                  (wire106 ?
                      (reg102 < reg102) : $signed(wire86)) : wire100[(2'h3):(2'h3)])) : $unsigned(wire87));
        end
    end
  assign wire115 = wire88;
  assign wire116 = (reg97[(4'ha):(1'h1)] >= $signed((|($signed(wire87) || {wire86}))));
endmodule

module module26
#(parameter param38 = (8'h9d), 
parameter param39 = (~&param38))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire37, wire36, wire35, wire34, wire33, reg32, (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= (~^(((((8'hb7) <<< wire31) > (~wire30)) != wire30) != (+wire31[(3'h7):(3'h6)])));
    end
  assign wire33 = $unsigned((wire28 > $unsigned(wire30[(1'h0):(1'h0)])));
  assign wire34 = (&$signed(($unsigned({wire28,
                      wire29}) >= reg32[(2'h2):(1'h0)])));
  assign wire35 = (8'haf);
  assign wire36 = {(+$unsigned((~^{reg32})))};
  assign wire37 = reg32[(2'h3):(2'h2)];
endmodule
