module top
#(parameter param187 = (((!((~^(7'h43)) >>> ((8'hbd) ? (8'had) : (8'hbc)))) << ((^~{(8'hb1), (8'hb9)}) ~^ ((8'ha6) ? (~|(8'ha7)) : ((8'ha0) ? (8'h9d) : (8'hab))))) ? ((((!(8'h9f)) == ((8'ha6) ? (8'ha2) : (8'hb2))) && (^(~^(8'hae)))) > (8'h9c)) : ((((!(8'hac)) ? ((8'hba) || (8'had)) : ((8'hb3) ? (8'hae) : (8'ha5))) ~^ {((8'hab) ? (8'hbc) : (8'h9e))}) ? {((~|(8'hbf)) > (~&(8'h9d)))} : (&(|(~(8'hb7)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire184;
  wire signed [(4'hc):(1'h0)] wire183;
  wire [(3'h5):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire178;
  wire signed [(3'h4):(1'h0)] wire179;
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg4 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire186,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire9,
                 wire18,
                 wire19,
                 wire20,
                 wire60,
                 wire68,
                 wire69,
                 wire176,
                 wire178,
                 wire179,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~wire1[(4'hb):(1'h1)]);
      reg5 <= ({wire3} + wire0[(1'h0):(1'h0)]);
      reg6 <= ($unsigned(reg4) >= $signed((8'ha0)));
      reg7 <= $signed($signed($signed((((8'ha2) & wire3) ?
          $unsigned(wire0) : wire3))));
      reg8 <= (~&(wire0[(4'hc):(4'ha)] - ((|(~|wire1)) && (~|$unsigned(wire1)))));
    end
  assign wire9 = ($unsigned($unsigned(reg5)) * (7'h43));
  always
    @(posedge clk) begin
      if (reg6[(3'h4):(2'h3)])
        begin
          reg10 <= ($unsigned(((&(reg7 | wire9)) ?
                  {$signed(reg8), (8'ha3)} : wire0)) ?
              $unsigned($unsigned((~^(wire2 ?
                  wire3 : (8'hba))))) : $unsigned(reg4[(3'h5):(3'h4)]));
          reg11 <= reg6;
          reg12 <= (wire2 ?
              wire1 : $signed(({wire2, $unsigned(reg10)} ?
                  $unsigned((reg4 <<< reg11)) : (^reg8))));
        end
      else
        begin
          reg10 <= ($unsigned((reg4 ?
              reg10[(2'h3):(2'h3)] : wire0)) ^ wire2[(2'h3):(1'h0)]);
          reg11 <= {$signed((^({reg12} & wire9[(3'h4):(1'h1)]))),
              ($unsigned((~|(&wire1))) ~^ $unsigned($unsigned((wire9 >>> wire3))))};
          reg12 <= reg11;
          if ($unsigned(($signed(((~|reg11) < (reg10 ? wire3 : wire2))) ?
              wire1[(1'h1):(1'h1)] : ($unsigned((reg12 ?
                  reg10 : reg6)) | reg4[(3'h5):(1'h1)]))))
            begin
              reg13 <= ($signed($signed(wire1[(4'hb):(4'h9)])) ?
                  ((+$unsigned((-(8'hbe)))) ?
                      {$signed(reg6),
                          $signed(reg12)} : $unsigned(wire3)) : {(reg11[(1'h0):(1'h0)] << (+(reg7 - wire0)))});
              reg14 <= $unsigned(reg4);
              reg15 <= $signed(wire3);
              reg16 <= reg10[(3'h5):(3'h4)];
              reg17 <= (+reg4[(3'h4):(2'h2)]);
            end
          else
            begin
              reg13 <= $unsigned((($unsigned($unsigned(wire2)) ~^ (8'had)) ~^ reg8[(2'h3):(2'h3)]));
            end
        end
    end
  assign wire18 = reg12[(4'hf):(2'h2)];
  assign wire19 = (~$unsigned(reg15));
  assign wire20 = ($unsigned((+$signed({(8'hac), reg10}))) ?
                      $unsigned(reg7) : ($unsigned(reg6) & reg13[(1'h1):(1'h0)]));
  module21 #() modinst61 (.y(wire60), .wire24(reg13), .wire22(reg15), .wire23(reg10), .wire25(reg4), .clk(clk), .wire26(reg6));
  always
    @(posedge clk) begin
      reg62 <= ($unsigned(wire0) ?
          ((~|(^~(8'ha5))) ?
              ((((8'ha3) >> reg16) ?
                      wire0[(2'h3):(2'h3)] : (reg7 ? reg8 : reg16)) ?
                  ($signed(reg14) ?
                      wire9[(4'hb):(2'h2)] : (wire18 ?
                          reg16 : wire20)) : (~&(wire1 ?
                      (7'h41) : (8'haa)))) : reg13[(4'h8):(3'h4)]) : reg16);
      reg63 <= (((8'hbd) ?
              ((^~(+(8'ha7))) ?
                  (8'ha9) : ($unsigned(reg12) ?
                      wire20[(3'h7):(1'h0)] : wire60[(3'h7):(3'h7)])) : {(~&wire60[(4'hb):(2'h3)])}) ?
          (reg12 << wire0) : {(~^(wire60[(1'h0):(1'h0)] ?
                  (wire20 ^ (8'h9d)) : reg62[(1'h0):(1'h0)])),
              (($unsigned(reg8) >> {(8'ha5)}) ?
                  $unsigned((reg11 >>> reg14)) : reg16)});
      if ($signed((((~|(reg4 == reg62)) ?
              $signed((^~reg15)) : {wire2[(2'h3):(2'h3)], {reg63, reg17}}) ?
          ((8'haf) < ((~wire20) ? $signed(wire60) : (reg63 ^~ reg5))) : reg11)))
        begin
          reg64 <= (^wire3);
          reg65 <= reg4[(3'h4):(2'h2)];
          reg66 <= wire2;
        end
      else
        begin
          reg64 <= wire18[(3'h5):(2'h2)];
        end
      reg67 <= {$unsigned($signed(({wire20} ?
              (reg14 <= (8'ha2)) : (wire19 ? reg12 : reg12))))};
    end
  assign wire68 = $signed(($signed((((8'ha1) ?
                      wire9 : reg6) * $signed(wire0))) <<< $signed((~|(&wire3)))));
  assign wire69 = reg8[(1'h0):(1'h0)];
  module70 #() modinst177 (.y(wire176), .wire72(reg62), .wire71(reg17), .wire73(reg12), .clk(clk), .wire74(reg5), .wire75(reg15));
  assign wire178 = reg8;
  module119 #() modinst180 (wire179, clk, reg64, reg17, wire60, reg5);
  assign wire181 = ((~^(&reg17)) ?
                       ($unsigned($signed($unsigned(wire3))) ?
                           $signed(($signed(wire2) ?
                               wire9 : (reg4 ?
                                   reg64 : wire176))) : $signed($unsigned($signed(reg6)))) : (($unsigned($unsigned(reg7)) && $unsigned($signed((7'h44)))) ^~ (wire2[(1'h0):(1'h0)] & $unsigned(wire19))));
  assign wire182 = ($signed(reg17) && ({($unsigned(reg8) ?
                               $signed(reg15) : $unsigned(wire19))} ?
                       wire69 : wire178[(1'h0):(1'h0)]));
  assign wire183 = (+((((&wire0) ?
                           (wire69 ?
                               wire181 : wire179) : (8'ha3)) > ({wire182} | {wire18,
                           wire181})) ?
                       {((wire69 != reg7) <= reg65)} : $unsigned($signed((reg15 ?
                           wire1 : (8'hac))))));
  module152 #() modinst185 (.wire153(reg5), .wire157(wire183), .wire156(wire19), .y(wire184), .wire154(wire69), .wire155(wire0), .clk(clk));
  assign wire186 = $signed((+$signed((wire182 ? (!wire178) : reg66))));
endmodule

module module70
#(parameter param175 = ({(((8'ha8) ? {(8'had), (7'h43)} : {(8'ha7), (8'hbd)}) - ((8'hbc) ? ((8'hb5) ? (8'ha2) : (8'hb7)) : (+(8'ha2))))} ? {((((8'hb8) ? (8'ha4) : (7'h42)) < ((8'hbe) ~^ (8'h9f))) ? ((-(8'ha4)) <= ((8'hb1) != (8'ha4))) : ({(8'ha8), (8'hb8)} ? (!(8'hbb)) : ((8'hb3) ? (8'ha5) : (8'hac)))), ((((8'ha5) ? (8'hb8) : (8'hab)) ? {(8'hb9), (8'h9c)} : (~(8'hb3))) ? ({(8'hb8)} != ((8'ha9) ? (8'h9d) : (7'h40))) : ((^(8'haf)) ? ((8'ha6) ? (8'hb3) : (8'hb4)) : {(8'hbd)}))} : ((~(((8'hae) ? (8'ha8) : (8'hab)) && (~(8'hbd)))) ? ((^~((7'h43) ? (7'h41) : (8'hbc))) <= ((8'hb4) == (8'hb2))) : (!{((8'hb8) - (8'had)), {(8'hb8)}}))))
(y, clk, wire71, wire72, wire73, wire74, wire75);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire72;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire [(3'h4):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire171;
  assign y = {wire174,
                 wire173,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire113,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire150,
                 wire171,
                 (1'h0)};
  assign wire76 = $unsigned(wire75);
  assign wire77 = {wire76, wire71};
  assign wire78 = $unsigned($unsigned({(((8'hb0) ? wire76 : wire73) ?
                          wire77[(2'h3):(2'h2)] : wire73),
                      $signed(wire77[(3'h6):(2'h2)])}));
  assign wire79 = (+(^(|wire72[(4'h9):(3'h7)])));
  module80 #() modinst114 (wire113, clk, wire74, wire75, wire78, wire72);
  assign wire115 = $unsigned($signed(($signed((8'h9c)) > wire71[(3'h4):(1'h0)])));
  assign wire116 = $signed($signed((((wire72 ?
                       wire113 : wire115) != (wire76 + wire113)) & ($signed((7'h43)) >= (wire72 | wire74)))));
  assign wire117 = (~({{wire115, (wire72 ? wire113 : (8'hb3))},
                           (wire115[(5'h12):(3'h4)] ?
                               $unsigned((7'h44)) : $signed(wire73))} ?
                       $unsigned(((wire79 ?
                           wire115 : wire77) > $signed(wire71))) : (8'ha8)));
  assign wire118 = $unsigned((((wire79[(4'he):(1'h0)] ?
                               (wire71 >>> wire73) : (wire116 ?
                                   wire75 : wire116)) ?
                           wire71[(1'h0):(1'h0)] : ($signed(wire78) ?
                               wire77[(3'h5):(2'h2)] : wire115[(5'h11):(4'h9)])) ?
                       wire77[(3'h7):(3'h5)] : ((~^wire76[(4'he):(4'ha)]) ?
                           ((!(8'ha8)) ?
                               $unsigned(wire74) : $signed(wire78)) : wire79)));
  module119 #() modinst151 (wire150, clk, wire116, wire117, wire74, wire78);
  module152 #() modinst172 (wire171, clk, wire79, wire117, wire118, wire73, wire71);
  assign wire173 = (wire73[(1'h1):(1'h0)] ^ wire76);
  assign wire174 = $unsigned((wire72[(3'h7):(1'h0)] ?
                       (wire79[(3'h5):(3'h5)] ?
                           $signed($signed(wire118)) : wire173) : ((((8'hb7) ?
                           wire113 : wire113) - wire73) < ({(8'hac),
                           wire116} * $unsigned(wire73)))));
endmodule

module module21
#(parameter param58 = (^({(~|((7'h41) < (8'hba)))} ? {((~&(8'h9e)) ~^ ((8'h9e) ? (8'ha5) : (8'ha6)))} : ((((8'h9c) || (8'hb6)) << (~(7'h40))) ? (-((8'ha6) ? (8'haa) : (8'hac))) : ((8'ha5) ? (|(8'hab)) : ((8'hb1) ? (8'h9c) : (7'h44)))))), 
parameter param59 = ((((((8'ha9) ? param58 : param58) ? param58 : param58) ? (~|(^~param58)) : param58) ? (!((param58 && param58) * (param58 <= (8'h9c)))) : (((^param58) << ((8'hbd) ^~ param58)) ^~ (~|{param58}))) < (((param58 + (param58 ? param58 : param58)) ? (|(param58 ? param58 : param58)) : (param58 + {param58})) ? param58 : {((param58 ? param58 : (8'hb0)) ? {param58} : (8'ha2)), param58})))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire27;
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire44,
                 wire27,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg28,
                 (1'h0)};
  assign wire27 = wire25[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg28 <= (~(wire22[(5'h12):(3'h5)] ?
          $unsigned((8'hb0)) : $unsigned({wire23})));
      reg29 <= reg28;
      if (($unsigned($unsigned($unsigned(wire23[(4'ha):(1'h0)]))) <<< ({(~|$unsigned(wire22))} ?
          wire26 : $unsigned(($signed((8'ha9)) < $unsigned((8'hac)))))))
        begin
          if (wire25)
            begin
              reg30 <= reg29;
              reg31 <= reg30;
            end
          else
            begin
              reg30 <= $signed(((((!reg31) < $signed(reg30)) * $signed(reg31[(1'h0):(1'h0)])) ?
                  (reg30 ?
                      reg30 : reg31) : (((reg30 << wire22) && (wire24 + (8'hbb))) ?
                      {reg29[(3'h7):(3'h4)]} : (^((8'hbd) < wire25)))));
              reg31 <= (~reg31);
              reg32 <= ({(((wire23 ? wire26 : wire23) >> wire23) ^ wire27)} ?
                  ((((wire25 ? wire27 : wire25) - (~|reg29)) ?
                          (wire23 ? reg29 : (~^reg31)) : wire26) ?
                      $signed(({wire22, reg28} ?
                          ((8'ha6) << wire25) : (reg29 ?
                              wire23 : reg30))) : reg31) : $unsigned($signed(((8'had) ?
                      $signed(wire24) : wire22))));
              reg33 <= wire26;
              reg34 <= $unsigned($signed(($signed((reg29 ?
                  wire27 : wire23)) * $unsigned(reg28[(4'hb):(3'h7)]))));
            end
          reg35 <= (&wire27[(3'h4):(2'h2)]);
          reg36 <= $unsigned(reg29);
          if ((8'hb9))
            begin
              reg37 <= ((($unsigned(((8'ha4) * reg34)) ?
                  $unsigned({reg36}) : wire23) << (^(8'hbf))) >>> reg35[(2'h3):(2'h3)]);
              reg38 <= ((~($signed($unsigned(wire24)) == ((~&wire22) & wire27))) - (~&wire23[(4'he):(4'he)]));
              reg39 <= reg29[(1'h0):(1'h0)];
              reg40 <= (((8'hb9) >>> reg28) * wire24[(3'h7):(1'h0)]);
            end
          else
            begin
              reg37 <= wire23[(1'h0):(1'h0)];
              reg38 <= {$signed(reg31[(1'h1):(1'h0)])};
              reg39 <= reg29[(4'h8):(3'h7)];
            end
          if (wire24)
            begin
              reg41 <= wire26[(4'ha):(1'h1)];
              reg42 <= wire23[(4'ha):(1'h1)];
            end
          else
            begin
              reg41 <= (reg30[(2'h2):(2'h2)] ?
                  ($signed(wire23[(4'he):(4'hb)]) ?
                      reg41[(2'h2):(1'h1)] : reg38[(4'hf):(1'h0)]) : (7'h43));
              reg42 <= ((8'hb3) << $unsigned(wire23[(3'h5):(1'h0)]));
              reg43 <= ((8'hba) ?
                  (wire22[(1'h0):(1'h0)] ?
                      (^~((reg33 ? reg28 : (8'hbb)) ?
                          wire25[(2'h3):(2'h3)] : $signed(reg33))) : reg29[(3'h5):(1'h1)]) : wire26);
            end
        end
      else
        begin
          reg30 <= reg30[(1'h0):(1'h0)];
          reg31 <= $unsigned(reg42);
        end
    end
  assign wire44 = reg31;
  always
    @(posedge clk) begin
      reg45 <= (!wire24[(1'h0):(1'h0)]);
      reg46 <= $signed(reg40[(5'h12):(2'h2)]);
      if ($signed($signed(reg37)))
        begin
          if ((+$signed($unsigned(reg46[(3'h4):(2'h2)]))))
            begin
              reg47 <= ({($signed($unsigned(wire24)) ?
                      (((8'hb1) != reg41) > $unsigned(reg33)) : $signed(wire27[(3'h5):(1'h1)])),
                  ((~$signed(reg28)) ?
                      {reg31, $signed(reg40)} : wire27)} & $signed(reg32));
              reg48 <= ({$unsigned(reg35), wire26[(2'h2):(1'h1)]} ?
                  {(wire23[(4'h9):(3'h6)] ?
                          ((reg42 >= reg38) >>> {reg40,
                              wire22}) : reg47[(4'hf):(1'h1)])} : (reg46 ?
                      ((reg39 ?
                          (reg32 ?
                              reg35 : reg33) : {reg35}) >= $signed((wire23 | reg47))) : $signed(reg31[(2'h2):(1'h1)])));
              reg49 <= ($signed(($signed($unsigned((8'h9c))) ~^ ($unsigned(reg32) ?
                  (reg45 ?
                      wire22 : reg40) : $signed(reg43)))) ^~ {$unsigned((|(reg30 ?
                      reg28 : reg28))),
                  ((~reg30) ?
                      (wire44 >>> $unsigned((8'haa))) : $unsigned((reg41 ?
                          reg46 : reg34)))});
              reg50 <= (8'ha9);
            end
          else
            begin
              reg47 <= wire22;
              reg48 <= (($signed(reg34[(3'h4):(2'h2)]) ?
                      $signed((~|reg43)) : (^($signed(reg31) <= (wire23 ?
                          reg35 : reg43)))) ?
                  (+$signed($unsigned($unsigned(wire23)))) : $unsigned(reg45[(4'hc):(3'h4)]));
              reg49 <= $signed((wire27 ?
                  (wire44[(1'h1):(1'h0)] ?
                      (^(^reg50)) : $signed($unsigned(wire23))) : $unsigned(($signed(wire25) ?
                      $signed(reg32) : (~&reg31)))));
              reg50 <= $signed((reg48[(4'hb):(3'h6)] || $unsigned(((8'haf) ?
                  $signed(reg43) : wire22))));
              reg51 <= ($signed((^~{$unsigned((8'hb2)), (reg45 ~^ (8'ha9))})) ?
                  $signed(wire27) : wire27[(4'h8):(4'h8)]);
            end
          reg52 <= {{reg51[(4'h8):(3'h6)]}};
          reg53 <= (~&reg42);
        end
      else
        begin
          reg47 <= (((7'h42) < $unsigned($unsigned((reg39 ^ reg45)))) ?
              {(((reg29 == reg39) && $signed(reg52)) << reg47[(4'h9):(2'h2)])} : {(~&reg33[(3'h5):(1'h0)])});
        end
      reg54 <= (($unsigned((8'ha6)) ?
          $unsigned(($signed(wire24) < $signed(reg53))) : $signed($signed((7'h43)))) && reg47[(4'ha):(4'ha)]);
    end
  assign wire55 = $signed(reg50);
  assign wire56 = $signed(({$unsigned((reg28 << reg49))} > reg33));
  assign wire57 = reg37;
endmodule

module module152
#(parameter param170 = {(~^{((~|(8'hbc)) ? (7'h42) : {(8'ha5), (8'hbe)})})})
(y, clk, wire157, wire156, wire155, wire154, wire153);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire157;
  input wire [(4'h9):(1'h0)] wire156;
  input wire [(4'ha):(1'h0)] wire155;
  input wire [(2'h2):(1'h0)] wire154;
  input wire signed [(5'h11):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire169;
  wire signed [(5'h11):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire160;
  wire signed [(5'h11):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire158;
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire158 = wire153[(4'he):(3'h5)];
  assign wire159 = ($signed((~((wire157 && wire153) ?
                           (&wire156) : (!(8'haf))))) ?
                       (~&wire153) : (((8'ha2) ?
                           ((wire156 != wire154) > (wire154 ?
                               wire157 : (7'h41))) : $signed($signed(wire155))) ^ wire157));
  assign wire160 = wire156[(3'h5):(3'h5)];
  assign wire161 = (~^{wire154});
  always
    @(posedge clk) begin
      if ($unsigned($signed((-(wire155 ?
          (wire157 < wire155) : wire153[(4'hf):(4'ha)])))))
        begin
          if (wire158[(5'h10):(4'he)])
            begin
              reg162 <= ((^wire157) ?
                  wire160 : $signed((+$unsigned($signed(wire156)))));
              reg163 <= $signed($unsigned(((wire154 + (wire157 ?
                  wire160 : wire160)) ^~ wire154[(1'h1):(1'h1)])));
              reg164 <= (&(+$unsigned((^~$signed(wire160)))));
            end
          else
            begin
              reg162 <= (($unsigned({(&wire153), (reg162 == (8'hb9))}) ?
                  $unsigned($signed($signed(wire158))) : $signed($signed($unsigned((8'hb2))))) <<< {$signed(wire160),
                  $unsigned($signed(reg162[(5'h11):(3'h4)]))});
              reg163 <= (wire158[(2'h2):(1'h1)] >= (wire155 <= (wire158 || (^{(8'ha2)}))));
              reg164 <= wire158[(1'h1):(1'h1)];
              reg165 <= wire160[(4'he):(3'h6)];
            end
          reg166 <= $unsigned(((reg163[(2'h3):(1'h1)] ^ $unsigned(reg165[(4'hc):(2'h3)])) <= (($signed(wire160) ?
              $signed(reg164) : reg162) && $signed(reg165[(4'hd):(1'h0)]))));
        end
      else
        begin
          reg162 <= wire154[(2'h2):(1'h0)];
        end
    end
  assign wire167 = (!($signed((-reg166[(1'h0):(1'h0)])) > wire153));
  assign wire168 = wire156[(1'h1):(1'h1)];
  assign wire169 = (wire158 != ($unsigned(($signed(wire161) ?
                           wire154 : $signed(wire156))) ?
                       reg164 : $signed($signed((reg163 ? wire153 : reg166)))));
endmodule

module module119
#(parameter param149 = {((&{((8'ha8) ? (7'h43) : (8'hb1))}) ? ((((8'ha9) ? (8'h9c) : (8'ha3)) ? (&(8'hab)) : ((8'ha7) << (7'h40))) ? (((8'hb1) ? (8'hbf) : (8'hbd)) ? ((7'h40) < (8'hb3)) : (^~(8'ha8))) : {(~(8'hbf))}) : (({(8'hb8)} ? (-(8'h9d)) : {(8'ha8), (8'ha2)}) ^~ (((8'hb7) ^ (8'hb8)) ? (^(8'ha5)) : {(8'hb2)}))), {{(((8'hb0) <<< (8'hbc)) ^ (8'hbd))}}})
(y, clk, wire123, wire122, wire121, wire120);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire123;
  input wire signed [(2'h3):(1'h0)] wire122;
  input wire [(2'h2):(1'h0)] wire121;
  input wire signed [(4'he):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg124 <= (~|$signed($signed((8'hb4))));
      if ((wire123 <<< $signed({(&$unsigned(wire122)), wire120})))
        begin
          reg125 <= ((($signed((wire121 ? wire123 : wire120)) ?
              $unsigned((&reg124)) : (wire122[(2'h2):(2'h2)] * wire123[(1'h0):(1'h0)])) ~^ $unsigned((wire122[(2'h3):(1'h1)] >> $signed(wire123)))) >> reg124[(1'h1):(1'h1)]);
          reg126 <= $unsigned(({wire123[(4'ha):(1'h1)]} ?
              wire120[(4'hb):(4'hb)] : (($signed(wire123) && (reg125 ?
                  (7'h44) : wire123)) << reg125[(2'h3):(2'h3)])));
          if (reg124)
            begin
              reg127 <= (({$unsigned((wire121 - (8'hb1))),
                          (~&$signed(wire123))} ?
                      $unsigned($unsigned(wire121[(1'h0):(1'h0)])) : reg124[(4'he):(4'hd)]) ?
                  (-((+(wire123 || reg125)) ?
                      reg124[(4'he):(1'h1)] : ({wire122} ?
                          ((8'hae) ?
                              reg126 : wire120) : wire122[(2'h3):(2'h2)]))) : $signed((wire123[(3'h5):(3'h4)] ?
                      $signed((8'h9f)) : $signed((wire123 <= reg125)))));
              reg128 <= ($signed(reg127) >>> (8'hb9));
              reg129 <= reg127;
              reg130 <= ((reg128[(4'he):(3'h7)] ?
                      ({$signed(reg126)} && $signed((!(8'h9f)))) : wire122[(1'h0):(1'h0)]) ?
                  (~&(+(!$unsigned((8'hba))))) : (((wire120 < reg126) ?
                          (-$signed(wire121)) : reg129[(4'hb):(3'h7)]) ?
                      $signed(((~^reg127) ?
                          ((8'ha0) ? wire123 : (8'hab)) : (reg125 ?
                              reg124 : reg127))) : (reg126[(1'h1):(1'h1)] ?
                          wire122[(2'h3):(2'h3)] : reg127[(5'h14):(4'hb)])));
              reg131 <= wire121[(1'h1):(1'h1)];
            end
          else
            begin
              reg127 <= (&reg131);
              reg128 <= (($unsigned(wire121) & (($signed(reg128) < $unsigned(wire120)) ?
                      ((wire123 ~^ wire121) ?
                          $unsigned(wire120) : $signed(wire121)) : reg128[(4'ha):(3'h5)])) ?
                  $unsigned((~|$unsigned($unsigned(wire121)))) : ((($unsigned(reg125) ~^ (reg130 == reg128)) ^ $signed({(8'ha9)})) <<< $signed(((~^reg130) ?
                      $signed(reg127) : (reg127 < (8'ha9))))));
              reg129 <= ($signed((($unsigned(reg130) * $unsigned(wire121)) ?
                      ((|(8'h9f)) & (wire122 != wire120)) : $unsigned(reg131[(2'h2):(1'h0)]))) ?
                  (reg126 ?
                      ($unsigned((reg130 >= (8'ha4))) >>> $unsigned((^reg128))) : ($signed($signed(reg126)) * ($unsigned(reg131) >= (^~reg127)))) : ((wire120[(1'h1):(1'h1)] ?
                          reg124 : ((reg126 ? reg126 : (8'hb1)) ?
                              reg129 : (wire122 ? wire121 : reg125))) ?
                      ({$signed(wire123)} ?
                          reg130[(2'h3):(2'h3)] : reg128[(1'h0):(1'h0)]) : reg131));
            end
          reg132 <= $signed(reg125);
        end
      else
        begin
          reg125 <= (~{(~(reg124[(1'h0):(1'h0)] != (reg131 ?
                  wire121 : reg126)))});
          if ($unsigned((reg129[(2'h3):(1'h0)] ?
              (^~(wire120 ?
                  wire120[(1'h0):(1'h0)] : {reg126,
                      reg124})) : ($signed((~|reg132)) != reg125[(3'h4):(2'h2)]))))
            begin
              reg126 <= $unsigned($unsigned(reg131));
              reg127 <= $signed(reg124);
              reg128 <= $signed($unsigned($unsigned({(reg127 >= reg131),
                  reg129})));
            end
          else
            begin
              reg126 <= $unsigned(wire121[(1'h1):(1'h1)]);
              reg127 <= (reg127 ?
                  $signed($unsigned((~|wire122))) : (&reg125[(3'h6):(2'h2)]));
              reg128 <= (((^~reg125) ?
                      ((reg129[(5'h13):(5'h13)] ?
                          $unsigned(reg127) : (reg128 != (8'ha8))) + (8'hb1)) : $signed(((wire122 && reg131) ?
                          {reg127} : (reg130 ? reg124 : reg126)))) ?
                  wire122 : {reg130});
              reg129 <= ({{wire123, ({reg132} <<< $signed(reg128))}} * reg125);
            end
        end
    end
  assign wire133 = $unsigned((wire123 <<< (($signed((8'hb0)) ?
                           (^~wire122) : (8'had)) ?
                       {(reg129 * wire122), {reg124}} : {(reg124 ?
                               reg127 : wire121),
                           (8'ha4)})));
  assign wire134 = (8'hb7);
  assign wire135 = wire133;
  assign wire136 = (($unsigned((~&reg129[(5'h10):(4'h9)])) && ($signed((reg126 ?
                               (8'hb9) : wire135)) ?
                           (!reg124) : (!(reg130 < (8'ha8))))) ?
                       (8'ha5) : (^~(~$unsigned($signed(reg130)))));
  assign wire137 = wire123;
  assign wire138 = reg125;
  assign wire139 = $signed({$signed($signed(wire134))});
  always
    @(posedge clk) begin
      reg140 <= (|wire139[(3'h5):(3'h5)]);
      if ((-$unsigned((((~wire121) ? ((7'h40) ? reg131 : (8'h9c)) : (8'hb1)) ?
          $signed((wire135 && wire139)) : (&(^~(8'hb8)))))))
        begin
          reg141 <= {wire136[(3'h5):(2'h3)]};
        end
      else
        begin
          if (($signed(reg129) > {$signed((reg125 * wire135)),
              $signed($unsigned($unsigned(wire121)))}))
            begin
              reg141 <= $unsigned(wire136[(4'h9):(3'h7)]);
              reg142 <= $unsigned({({wire123} ?
                      wire121[(2'h2):(1'h0)] : $unsigned($unsigned(reg140))),
                  (8'ha5)});
            end
          else
            begin
              reg141 <= ((8'hb1) >= reg131[(1'h0):(1'h0)]);
            end
          reg143 <= (^(((~reg141) && reg124[(3'h4):(3'h4)]) ?
              (^(reg130 != (^(8'haa)))) : {{{(8'h9e), reg130},
                      $signed(reg131)}}));
        end
      reg144 <= reg142[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ({{reg128[(3'h7):(3'h4)], wire139}})
        begin
          reg145 <= reg141[(3'h4):(2'h2)];
          reg146 <= (($unsigned((8'ha3)) ?
              (wire137 - (reg132[(3'h4):(2'h3)] ^~ (+reg124))) : $unsigned(reg132)) <= (((^~((8'ha0) ?
                  reg142 : reg131)) << (reg145 ? (^reg129) : wire133)) ?
              (wire138 ?
                  reg140 : (wire139[(3'h5):(1'h0)] <= (~reg124))) : (wire120[(4'he):(4'ha)] < reg128)));
          reg147 <= (reg145[(1'h0):(1'h0)] + ((&(&reg145)) > ($unsigned((reg143 ?
              reg142 : reg143)) >> {(wire123 && reg130)})));
        end
      else
        begin
          reg145 <= (&$signed((reg130[(3'h4):(1'h0)] & ((wire122 ?
                  wire138 : reg143) ?
              reg131 : wire122))));
          reg146 <= (7'h41);
        end
      reg148 <= $unsigned(reg124);
    end
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire84;
  input wire [(3'h4):(1'h0)] wire83;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(4'h9):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
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
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg89,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= (+$unsigned($signed(wire84[(4'h8):(3'h4)])));
    end
  assign wire86 = $signed((8'ha9));
  assign wire87 = $unsigned((~|({wire82[(1'h0):(1'h0)],
                      (wire81 >>> (8'hb3))} & wire82[(4'hb):(1'h1)])));
  assign wire88 = {$unsigned(wire86[(2'h3):(2'h2)])};
  always
    @(posedge clk) begin
      reg89 <= reg85;
    end
  assign wire90 = (reg89[(1'h0):(1'h0)] ?
                      $signed((((reg89 && wire86) ?
                          $unsigned(wire88) : wire86[(3'h6):(3'h5)]) > (+(8'ha7)))) : ({{(+wire88)},
                              $unsigned($signed(wire83))} ?
                          $unsigned({$signed((8'hb4))}) : wire87[(3'h6):(2'h3)]));
  assign wire91 = (^~wire81);
  always
    @(posedge clk) begin
      reg92 <= (^(reg85[(3'h7):(2'h3)] == {$signed(((8'hb2) & wire82)),
          wire83}));
      reg93 <= wire91;
      if (reg93[(4'hb):(4'hb)])
        begin
          reg94 <= wire88[(4'he):(4'ha)];
        end
      else
        begin
          if ($signed(wire87))
            begin
              reg94 <= reg92;
              reg95 <= (((reg92[(1'h1):(1'h1)] | (&(-reg85))) << (wire88 || ((wire84 <<< wire81) >>> $unsigned(wire88)))) ?
                  (wire90 || $signed(wire90[(4'hb):(2'h2)])) : wire88[(4'he):(4'he)]);
              reg96 <= reg89[(2'h3):(2'h3)];
              reg97 <= ($signed($signed({(wire91 | (8'hb1)), {reg93}})) ?
                  $signed($unsigned($unsigned(reg85[(4'h9):(3'h5)]))) : ($signed({(8'hb4)}) * (^(~|reg93))));
            end
          else
            begin
              reg94 <= $signed(wire90);
              reg95 <= $signed((reg93 ?
                  reg85[(3'h6):(2'h2)] : reg96[(5'h14):(5'h11)]));
            end
          reg98 <= ((+$signed($unsigned(wire82[(5'h10):(4'ha)]))) ?
              reg97 : reg89[(1'h1):(1'h1)]);
          reg99 <= $unsigned(((&wire81[(3'h5):(1'h1)]) ?
              ($unsigned(reg92[(4'hf):(4'hc)]) < ((~&reg98) ^ $unsigned(reg85))) : ($unsigned((wire91 >> wire88)) ?
                  $unsigned((reg92 > (8'hba))) : ($unsigned(wire87) ?
                      $unsigned(wire81) : $unsigned(reg89)))));
          if (reg99)
            begin
              reg100 <= {{(^~(~^$unsigned(reg85))), (^~wire90[(1'h1):(1'h0)])}};
              reg101 <= $signed(reg100[(3'h4):(2'h2)]);
              reg102 <= wire84;
            end
          else
            begin
              reg100 <= reg102[(3'h5):(2'h3)];
              reg101 <= (reg99 ?
                  (-({$unsigned(reg97)} ?
                      {$unsigned(wire84),
                          (~reg89)} : $unsigned($signed(reg89)))) : reg101[(1'h0):(1'h0)]);
              reg102 <= $unsigned((((^~$signed(wire87)) <= (~^$unsigned(wire90))) >> $signed(((reg102 * wire86) != (reg99 <= reg101)))));
              reg103 <= reg100;
              reg104 <= (&$unsigned(reg97));
            end
          reg105 <= ((wire90[(1'h0):(1'h0)] < (((reg98 <<< reg99) ?
              (|(8'ha1)) : {reg97}) ~^ (!$signed(reg99)))) << $unsigned($signed((|$signed(reg92)))));
        end
      reg106 <= ($signed(((&((8'haa) ? (8'h9d) : reg92)) ?
          (+(8'hb8)) : $signed((8'ha8)))) ^~ ($signed(({(8'h9d)} ?
              {reg98, reg85} : reg92)) ?
          (~$signed((^~reg92))) : $unsigned(reg97[(3'h4):(1'h1)])));
      if ((wire83[(1'h0):(1'h0)] & ($unsigned($unsigned(((8'hb4) ?
              (8'hae) : wire84))) ?
          (~^(reg103 && (8'h9c))) : reg100)))
        begin
          reg107 <= $signed(($unsigned(reg94[(2'h3):(2'h3)]) ?
              reg85 : (($signed(reg105) > $signed(reg96)) ?
                  reg85[(4'hd):(2'h2)] : reg103[(1'h1):(1'h0)])));
          if (((&{(8'hb9)}) - $signed($unsigned(reg96))))
            begin
              reg108 <= $signed((reg105 ^ reg92[(4'hb):(4'ha)]));
              reg109 <= wire84;
              reg110 <= ((($unsigned($signed((8'hb2))) ?
                          (reg93 >= wire82[(4'hf):(1'h1)]) : (+(8'had))) ?
                      wire88[(3'h4):(3'h4)] : (((reg99 ? reg94 : reg92) ?
                              reg94 : reg104) ?
                          ((|wire87) ^~ (^~(8'hb0))) : $signed((&wire81)))) ?
                  (^~wire90[(3'h4):(2'h2)]) : (({(wire88 ^ reg103)} ?
                          wire91[(3'h7):(3'h4)] : (~^wire90[(3'h4):(3'h4)])) ?
                      (^~$signed((reg92 <= wire83))) : $unsigned(wire84[(3'h4):(1'h1)])));
            end
          else
            begin
              reg108 <= reg103;
              reg109 <= {{$signed(wire86[(3'h6):(3'h6)]),
                      (wire84 ?
                          reg103 : ($unsigned(reg101) ?
                              $unsigned(wire83) : (reg100 ?
                                  reg108 : reg101)))}};
              reg110 <= (8'ha9);
            end
          reg111 <= $signed((reg92 ?
              {($unsigned(reg98) ?
                      (reg92 ? wire81 : reg101) : $unsigned(reg104)),
                  ($unsigned((8'hb9)) || (+reg89))} : reg89));
          reg112 <= ({$unsigned((wire91 ?
                  reg95 : $unsigned(reg109)))} || (&reg106));
        end
      else
        begin
          reg107 <= $unsigned(({((reg92 << reg108) != reg96[(4'h9):(1'h1)]),
                  $signed($unsigned(reg97))} ?
              reg111 : wire82));
          reg108 <= (~({wire82[(4'hb):(4'ha)],
                  ($signed(reg103) ?
                      $signed((8'ha2)) : wire91[(1'h1):(1'h1)])} ?
              $signed($signed((~|(7'h40)))) : (wire81 <= reg106)));
          reg109 <= (&(($signed({reg96, reg99}) != reg111[(5'h10):(4'hc)]) ?
              (~((~|reg111) ?
                  $unsigned(reg99) : ((8'ha5) < reg104))) : $signed(((reg95 & reg107) <= $unsigned(reg110)))));
        end
    end
endmodule
