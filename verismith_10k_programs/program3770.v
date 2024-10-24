module top
#(parameter param51 = (-{(!(~^{(8'hb4), (8'ha2)}))}), 
parameter param52 = (~&((!param51) > ({(+param51)} ? {param51} : ({param51, param51} ? (param51 ? param51 : param51) : param51)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire14,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
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
                 reg28,
                 reg27,
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
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (^{{wire3[(3'h7):(1'h1)]}});
  assign wire6 = (~&$unsigned(((wire4 - wire2) ?
                     wire3[(3'h7):(3'h6)] : $unsigned((wire2 >>> wire4)))));
  assign wire7 = (!(!({{wire1, wire0},
                     {(8'haa)}} | ($unsigned(wire4) < wire3[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      reg8 <= wire2[(5'h14):(5'h11)];
      reg9 <= reg8[(2'h3):(2'h3)];
    end
  assign wire10 = (|$unsigned((({wire4, wire0} ?
                          (~&wire0) : reg8[(1'h1):(1'h0)]) ?
                      (~(~wire2)) : {(wire7 ? reg9 : (8'h9f))})));
  always
    @(posedge clk) begin
      reg11 <= $unsigned((-$unsigned((|wire0[(1'h0):(1'h0)]))));
      reg12 <= ({(wire5[(3'h6):(1'h0)] << (8'ha2)),
              $signed($unsigned(wire10))} ?
          (reg9[(2'h3):(2'h2)] & ((wire1 < $unsigned(wire1)) ?
              wire4 : wire0)) : reg9[(2'h2):(2'h2)]);
      reg13 <= ($signed((wire6[(2'h2):(1'h1)] ?
              (~&(!wire0)) : (((8'hae) - wire0) ?
                  (wire7 ? wire5 : (8'hb3)) : wire5[(5'h12):(3'h6)]))) ?
          $unsigned($unsigned(reg8[(1'h1):(1'h0)])) : (~$signed(wire1)));
    end
  assign wire14 = (-(~&$signed($unsigned((wire6 ? wire1 : reg12)))));
  always
    @(posedge clk) begin
      if (((8'hae) ?
          (wire1[(1'h1):(1'h1)] ?
              (((wire2 << reg8) ? wire0[(1'h0):(1'h0)] : $signed(wire1)) ?
                  {$unsigned(wire10)} : wire7[(3'h4):(3'h4)]) : reg9[(2'h2):(1'h1)]) : $signed((wire3[(2'h3):(1'h1)] ?
              $signed((+reg8)) : {(wire5 ? (8'hb5) : wire2)}))))
        begin
          reg15 <= (wire3 >= (^($unsigned(reg9) ?
              {wire10[(4'hf):(4'hc)]} : reg12)));
          if ((&(+(!($signed((8'hba)) < wire6[(2'h3):(2'h3)])))))
            begin
              reg16 <= $unsigned(wire3);
              reg17 <= reg15[(3'h7):(1'h1)];
              reg18 <= wire3[(3'h4):(1'h1)];
            end
          else
            begin
              reg16 <= (wire3[(3'h6):(3'h4)] >>> $unsigned($unsigned({$unsigned((8'ha6))})));
              reg17 <= (^~$signed(wire0));
              reg18 <= {(^wire0[(4'h8):(1'h1)]), (~reg9)};
              reg19 <= (~{((wire10[(3'h7):(2'h3)] ?
                      $signed(reg15) : $unsigned(reg15)) < reg16[(3'h5):(2'h3)]),
                  {$signed((reg15 >> wire0)),
                      ({reg17} ?
                          (wire14 ? reg15 : wire0) : $signed((8'hb3)))}});
              reg20 <= (((wire3 == $signed($signed(reg15))) ?
                      reg13 : reg15[(3'h6):(2'h3)]) ?
                  (~(+(^$unsigned(wire6)))) : wire7[(2'h2):(2'h2)]);
            end
          reg21 <= (-(wire3 ? ((^~reg16) * wire1[(3'h4):(1'h0)]) : (|wire0)));
          reg22 <= wire1;
          if (($unsigned((-(~&$unsigned(reg11)))) ?
              {$signed((^reg22)),
                  wire14[(2'h3):(1'h0)]} : (|$unsigned($unsigned(wire4)))))
            begin
              reg23 <= (((($signed((8'h9d)) ?
                              reg20[(4'h9):(1'h1)] : (~^reg21)) ?
                          $unsigned(reg18[(5'h10):(4'he)]) : $signed($signed(wire14))) ?
                      (((^~(8'ha6)) ?
                          (wire5 ?
                              wire7 : (7'h40)) : $unsigned(reg20)) ^~ reg20) : wire1[(4'ha):(1'h1)]) ?
                  $unsigned($signed((!(reg17 ?
                      wire0 : (8'hbe))))) : $signed({$unsigned($signed(reg11))}));
              reg24 <= reg23;
              reg25 <= (8'hb1);
              reg26 <= $unsigned(wire5[(4'hf):(4'h9)]);
              reg27 <= reg12[(3'h5):(3'h4)];
            end
          else
            begin
              reg23 <= (~|$signed((|((-wire14) ?
                  (wire0 * wire6) : {reg8, wire14}))));
              reg24 <= $signed(wire5);
            end
        end
      else
        begin
          reg15 <= reg15;
        end
      reg28 <= wire0;
      reg29 <= {$unsigned((wire5 ^ $signed((reg11 | (8'hb5))))), {reg17}};
      reg30 <= ((~^($unsigned($unsigned(wire5)) | {wire2[(5'h14):(2'h3)],
          reg29})) <<< ((7'h42) >> (^~$unsigned($signed(wire3)))));
      reg31 <= reg27[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ((((((reg25 < reg29) * (wire14 ? reg25 : (8'ha2))) ?
              ($signed(reg21) ?
                  wire3[(2'h2):(1'h0)] : (wire5 && reg8)) : ((-wire10) - reg13)) > {reg11}) ?
          (~|$signed(((reg28 ? reg24 : reg13) ?
              {reg16, reg20} : wire2))) : (^~wire3[(2'h2):(1'h0)])))
        begin
          if ((^~($signed($unsigned($unsigned(reg11))) ?
              (reg21[(3'h4):(2'h3)] ?
                  ({wire14} - (reg27 ? reg26 : reg8)) : reg30) : ({reg29} ?
                  ((wire10 ? (8'ha4) : reg29) ?
                      (reg21 ?
                          (8'ha7) : reg22) : reg15[(1'h1):(1'h0)]) : ({reg26} ?
                      $unsigned(reg26) : reg12)))))
            begin
              reg32 <= reg13[(2'h3):(1'h0)];
              reg33 <= reg29[(3'h4):(2'h2)];
              reg34 <= wire5[(4'ha):(2'h3)];
            end
          else
            begin
              reg32 <= $signed($unsigned($unsigned((~&(|reg33)))));
              reg33 <= ($unsigned($signed(reg12)) || $signed($signed($signed((&(8'hb1))))));
              reg34 <= ((reg15 >> $signed($unsigned((reg28 ? reg24 : reg33)))) ?
                  (8'ha9) : $signed((~|reg27)));
            end
          reg35 <= reg8[(1'h1):(1'h0)];
          reg36 <= reg31[(3'h5):(2'h2)];
          reg37 <= (~(((-(reg23 ^ reg34)) ?
                  (wire14[(4'hb):(2'h2)] ^~ (reg11 >>> reg24)) : reg36[(5'h11):(1'h1)]) ?
              $unsigned(($signed(reg22) ?
                  reg22[(4'hc):(4'hc)] : $unsigned(reg15))) : (-$unsigned($signed(reg32)))));
        end
      else
        begin
          if (reg23)
            begin
              reg32 <= ($signed($signed($unsigned($signed(reg8)))) ^~ $signed($unsigned({$unsigned(reg8)})));
              reg33 <= (({reg36} ?
                  (reg36 ^~ reg24[(1'h1):(1'h0)]) : reg23[(1'h0):(1'h0)]) != (reg21 ?
                  $signed($unsigned($unsigned(reg18))) : {((reg29 ?
                          (8'hb6) : reg29) < {(8'ha0), reg34}),
                      wire10}));
              reg34 <= (($signed(wire6) ?
                  $unsigned((~&$unsigned(wire5))) : (reg20[(1'h0):(1'h0)] ?
                      reg27 : $unsigned((^reg32)))) | reg26[(2'h2):(2'h2)]);
              reg35 <= (~|(wire7 >>> reg30[(3'h6):(3'h6)]));
              reg36 <= (((8'haf) ?
                  ($unsigned(reg24[(2'h2):(1'h1)]) | $signed((wire10 > reg34))) : reg11[(4'hf):(4'he)]) >> $signed($signed({reg8,
                  (reg15 <<< wire1)})));
            end
          else
            begin
              reg32 <= $unsigned(reg24);
              reg33 <= $signed($signed(((7'h40) ^ reg8[(1'h1):(1'h1)])));
            end
          if ($signed((&($unsigned(reg26) ?
              ((reg24 ? reg36 : reg23) ?
                  (7'h42) : (reg18 ^~ reg16)) : ((wire3 == reg8) ^ wire1)))))
            begin
              reg37 <= $unsigned({$signed($unsigned((~|reg25)))});
            end
          else
            begin
              reg37 <= reg30[(4'ha):(4'ha)];
              reg38 <= {({{reg16},
                      reg17[(5'h10):(4'hf)]} >> (-($unsigned(reg29) ^~ (reg30 ?
                      wire5 : reg23))))};
              reg39 <= reg35;
            end
          reg40 <= $unsigned((((((8'haa) ? reg39 : reg13) >> (!reg38)) ?
              {reg23,
                  $unsigned((8'hac))} : {$unsigned((8'hbe))}) > ($signed((8'ha7)) ?
              wire10 : (!$signed((8'hb1))))));
          reg41 <= ((~^{($signed(reg12) ?
                  reg36 : (wire5 ? wire3 : (8'h9d)))}) + wire7[(1'h1):(1'h1)]);
        end
      reg42 <= reg40;
      reg43 <= (~|$signed((^~reg22[(3'h5):(2'h2)])));
      reg44 <= {$signed($unsigned($signed({reg33, wire2})))};
    end
  assign wire45 = reg33;
  assign wire46 = ((-(~&reg8)) <= reg23);
  assign wire47 = reg22[(3'h6):(2'h3)];
  assign wire48 = ((reg34[(2'h2):(1'h0)] ?
                          $unsigned(wire7) : $unsigned(wire10[(4'h9):(1'h0)])) ?
                      $signed((reg21[(2'h3):(1'h0)] ^~ ((8'hb1) ^ $unsigned(reg31)))) : $unsigned((^~(reg12[(1'h0):(1'h0)] ?
                          $unsigned(reg27) : reg32[(2'h2):(2'h2)]))));
  assign wire49 = {(~|$signed((^(~^reg33)))), $unsigned($signed((&(8'ha2))))};
  assign wire50 = (~|(|(({wire46, reg11} ?
                      (reg43 ? reg11 : reg9) : $unsigned(reg11)) >> reg31)));
endmodule
