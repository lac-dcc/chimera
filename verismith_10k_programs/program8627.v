module top
#(parameter param48 = {{({((8'hb1) ? (8'hab) : (8'hab))} ? (((7'h40) >= (8'hb6)) <= (^(8'ha3))) : (((7'h42) ? (8'hab) : (8'h9c)) * {(8'had), (8'h9f)})), (^~{((8'hb9) < (8'hbc)), (&(8'ha4))})}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire24,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg44,
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
                 (1'h0)};
  assign wire4 = ((8'hb0) == ($unsigned({(wire3 ?
                         wire0 : wire3)}) >= (wire2[(3'h5):(1'h1)] <<< (wire2 ?
                     wire0[(1'h0):(1'h0)] : (wire2 ? wire3 : wire3)))));
  assign wire5 = (wire1 ?
                     wire0 : ((wire4 - wire1[(1'h1):(1'h1)]) ?
                         ({(~|wire0), (^wire3)} ?
                             (-(wire2 >> wire1)) : wire3) : $unsigned(wire0[(1'h0):(1'h0)])));
  assign wire6 = ($unsigned($signed($unsigned($signed(wire2)))) ?
                     (^~wire3[(3'h6):(3'h6)]) : wire2);
  assign wire7 = {(~wire6), (^~wire4)};
  assign wire8 = ($unsigned($unsigned(((wire0 ?
                     wire3 : wire3) | $signed(wire3)))) != {$signed(wire0[(2'h3):(1'h1)]),
                     wire1});
  assign wire9 = ((^$signed(wire1)) ?
                     $signed($signed($signed(wire2[(2'h3):(2'h3)]))) : wire3[(2'h2):(1'h1)]);
  assign wire10 = (wire0[(3'h7):(3'h6)] > (wire7 ? wire7 : wire3));
  always
    @(posedge clk) begin
      reg11 <= $unsigned(((wire10[(1'h0):(1'h0)] ?
              (8'haf) : ((8'hb0) >= (wire9 ? wire6 : wire8))) ?
          wire3 : {wire7[(4'ha):(3'h4)]}));
      if ((($unsigned(wire5[(3'h5):(1'h0)]) ~^ (($signed(wire4) > wire7[(2'h3):(2'h3)]) > wire0[(3'h6):(1'h1)])) ?
          wire5[(2'h3):(1'h1)] : $unsigned((~&((wire2 ? wire10 : reg11) ?
              (^~wire9) : wire7)))))
        begin
          if (wire1[(3'h6):(1'h0)])
            begin
              reg12 <= wire1;
              reg13 <= wire8[(2'h2):(1'h1)];
              reg14 <= wire0[(2'h3):(2'h2)];
              reg15 <= $signed(reg11[(4'hf):(2'h3)]);
              reg16 <= $unsigned(wire0);
            end
          else
            begin
              reg12 <= $signed($unsigned({(((8'h9c) ? (8'hbc) : wire3) ^ wire1),
                  $signed($unsigned(reg13))}));
              reg13 <= ($signed(wire4) ^ {reg16,
                  $signed($signed($unsigned(reg13)))});
            end
          reg17 <= (wire10 ? wire3 : wire2);
          if (((wire3 ?
              ($unsigned($unsigned((8'hb7))) ^~ {$unsigned(wire3),
                  $unsigned((8'ha0))}) : (wire8[(2'h2):(2'h2)] << wire10[(3'h7):(3'h6)])) >>> (-{(+$signed(reg17))})))
            begin
              reg18 <= ((wire6[(3'h6):(3'h4)] ?
                      (wire6[(4'hd):(3'h7)] << $unsigned(wire8)) : (($signed(wire5) <= (&wire9)) ?
                          wire6 : reg14[(4'hc):(4'hc)])) ?
                  (wire6 && (~^((|reg13) <<< (wire7 <<< (8'hb6))))) : reg11);
              reg19 <= wire6[(3'h7):(1'h1)];
              reg20 <= ($signed((^~(!(wire9 ? reg16 : reg12)))) ?
                  ($unsigned(wire6) && reg14) : reg12[(4'ha):(3'h4)]);
              reg21 <= {(^~(+$signed($unsigned(reg16)))), (8'hac)};
              reg22 <= (~|wire7[(3'h6):(2'h2)]);
            end
          else
            begin
              reg18 <= ($signed(($signed(reg15) << (&reg11))) ?
                  (^~(reg17[(1'h0):(1'h0)] ~^ (|wire1[(4'hf):(2'h2)]))) : $signed(wire7[(2'h3):(2'h3)]));
              reg19 <= $signed(({$signed((reg13 ? reg22 : reg17))} ?
                  (!reg22) : reg20[(4'h9):(4'h9)]));
              reg20 <= (8'hba);
              reg21 <= $signed(reg16[(4'hc):(3'h5)]);
            end
        end
      else
        begin
          if (wire6[(5'h13):(4'hb)])
            begin
              reg12 <= (~wire8[(3'h6):(3'h6)]);
              reg13 <= (reg16[(1'h0):(1'h0)] > (reg18[(4'hf):(4'hd)] * $signed(reg16)));
              reg14 <= (-(^~wire9));
              reg15 <= wire9[(2'h2):(1'h0)];
            end
          else
            begin
              reg12 <= ({($signed($unsigned(wire6)) ?
                      wire3 : wire6[(3'h5):(3'h4)])} >= reg22);
            end
          reg16 <= reg18[(4'hf):(4'he)];
        end
      reg23 <= $signed((reg21[(4'h9):(3'h6)] ?
          wire5 : (({(8'ha9)} ? reg20[(3'h6):(2'h3)] : (reg16 ~^ reg21)) ?
              (-reg17) : $unsigned(wire0[(2'h3):(1'h0)]))));
    end
  assign wire24 = ((wire2 ?
                      (reg19[(4'h8):(2'h2)] + (+$unsigned(reg19))) : reg15) >> (^~($unsigned((reg13 ?
                          wire2 : (7'h43))) ?
                      ({wire1, wire6} ? wire3 : (+(7'h41))) : (8'hb1))));
  always
    @(posedge clk) begin
      if ((wire8[(4'h9):(1'h0)] ?
          (wire1[(4'h8):(3'h5)] || reg22) : {wire3[(1'h0):(1'h0)],
              ($unsigned(wire8[(3'h5):(1'h0)]) ?
                  reg16[(4'h9):(1'h1)] : (-reg19[(3'h6):(3'h4)]))}))
        begin
          reg25 <= $unsigned(reg12);
          reg26 <= (~reg14);
          reg27 <= wire0[(2'h3):(1'h1)];
          if ((($signed({$unsigned(reg27)}) ?
              $unsigned(((^~wire6) || wire0[(1'h0):(1'h0)])) : wire6[(4'ha):(3'h7)]) <<< ({wire3[(3'h7):(3'h6)]} ?
              {$signed((wire10 >= wire0))} : reg23[(4'hc):(2'h2)])))
            begin
              reg28 <= ($signed($unsigned($signed($unsigned(reg23)))) ^~ (|$signed(($unsigned(reg19) ?
                  (reg13 >= reg12) : wire9[(4'ha):(2'h2)]))));
              reg29 <= $signed(({wire24[(1'h0):(1'h0)], (reg21 - (8'hbf))} ?
                  $unsigned((8'hb9)) : $unsigned($signed({(8'ha2), reg16}))));
              reg30 <= wire10;
              reg31 <= (~&reg28);
            end
          else
            begin
              reg28 <= ({($signed((reg25 ? (8'haf) : (7'h44))) ?
                          {(~^reg20), {wire9}} : ((^~reg14) ?
                              $signed(reg16) : reg26[(2'h2):(1'h1)])),
                      (8'hb4)} ?
                  $signed(reg23) : $signed(wire6));
            end
          if ((($signed({(reg12 ? (8'ha9) : wire5)}) ?
                  $unsigned({$signed(reg27),
                      (reg28 + reg16)}) : (reg15[(3'h6):(2'h3)] | (((8'hbf) ?
                          reg11 : (8'hbf)) ?
                      reg28[(4'h8):(1'h1)] : {reg29}))) ?
              $unsigned($unsigned((wire1[(4'h8):(4'h8)] == reg25[(1'h1):(1'h1)]))) : $unsigned({($unsigned(reg20) ?
                      $signed(reg13) : {reg21}),
                  (reg22[(3'h7):(3'h4)] && (wire7 ? reg15 : reg21))})))
            begin
              reg32 <= wire5[(3'h7):(3'h4)];
              reg33 <= ((((~|(wire7 || reg19)) ?
                          (reg13 ?
                              $unsigned(reg29) : $signed(reg12)) : wire9[(3'h7):(1'h1)]) ?
                      reg27[(4'hd):(3'h7)] : $signed((wire8[(1'h0):(1'h0)] ?
                          $signed((7'h43)) : (reg22 && reg25)))) ?
                  {(($signed(reg18) - $signed((8'hbf))) ?
                          (~{reg30,
                              reg13}) : reg18[(1'h0):(1'h0)])} : $unsigned($signed(reg26[(2'h3):(1'h0)])));
              reg34 <= reg23[(5'h10):(4'hd)];
              reg35 <= ($unsigned((wire9 + reg25)) ?
                  wire9[(2'h2):(1'h1)] : {$signed($unsigned($unsigned(reg33)))});
              reg36 <= (^~(~(wire6 <<< $signed((reg26 ? (8'ha0) : (8'hb4))))));
            end
          else
            begin
              reg32 <= {$unsigned($unsigned(reg15)), wire8[(3'h6):(3'h5)]};
              reg33 <= reg21[(3'h6):(3'h6)];
              reg34 <= (({reg28} ?
                  (wire5[(1'h1):(1'h0)] ?
                      (reg31[(2'h3):(1'h0)] ?
                          ((7'h40) ^ reg14) : reg28[(2'h2):(2'h2)]) : $unsigned((8'ha6))) : (8'hb3)) * (~|reg13));
            end
        end
      else
        begin
          if ($signed((-$signed($unsigned({reg11, reg18})))))
            begin
              reg25 <= (^~{($signed((reg11 <= reg17)) || ((8'hbf) + wire1[(5'h10):(2'h2)])),
                  ($unsigned(reg21[(4'h9):(2'h2)]) ?
                      $signed(wire3) : {(^reg20)})});
              reg26 <= wire4[(2'h2):(1'h1)];
              reg27 <= (8'h9f);
              reg28 <= ($signed($unsigned(((^reg14) == (^reg19)))) ^~ ($signed((reg35[(4'hc):(3'h4)] ?
                  {reg12, wire4} : (7'h44))) - reg18));
              reg29 <= reg34[(2'h2):(1'h1)];
            end
          else
            begin
              reg25 <= ((+(((~|reg19) ?
                  reg35[(5'h12):(3'h6)] : $signed(reg22)) & $unsigned((~&reg28)))) + $unsigned($unsigned(reg16[(3'h7):(1'h1)])));
              reg26 <= (reg27 < $signed($unsigned(($unsigned((8'hb3)) > {reg15}))));
            end
          reg30 <= ($signed($signed(wire2)) ?
              ($unsigned((~&reg15[(1'h1):(1'h1)])) ?
                  {wire2[(2'h2):(1'h1)]} : ((wire9 ? $unsigned(reg11) : reg19) ?
                      (^~((8'haa) ?
                          wire4 : (8'hb5))) : (~^(wire2 >>> reg35)))) : $signed(($signed(reg32[(2'h2):(1'h1)]) ?
                  wire8 : $unsigned($unsigned(reg11)))));
          reg31 <= wire8;
          reg32 <= {reg28[(4'h8):(3'h4)], wire24[(5'h13):(4'h9)]};
        end
      reg37 <= reg31;
      reg38 <= ((reg30 ?
              $unsigned((reg16 ?
                  reg12[(4'hd):(4'hc)] : ((8'h9e) ?
                      wire10 : (8'hae)))) : ((~&$signed(wire24)) ^~ $unsigned((reg18 ?
                  wire3 : reg13)))) ?
          ($signed({$unsigned(reg14)}) ?
              (reg23[(4'h8):(3'h5)] >> ((wire6 | reg23) ?
                  reg28 : $signed(reg33))) : (($signed(reg14) < wire1[(3'h5):(1'h0)]) <= reg28[(2'h3):(1'h1)])) : (+$unsigned((wire3 ?
              reg22[(5'h11):(4'he)] : (~reg25)))));
      reg39 <= reg20[(4'hc):(4'hc)];
    end
  assign wire40 = $unsigned({(|(wire9 && (-reg22))),
                      $unsigned({(reg39 == (7'h44)), {reg30, reg19}})});
  assign wire41 = (^~(^(~|(&(reg15 >= reg14)))));
  assign wire42 = (|wire10[(2'h2):(1'h0)]);
  assign wire43 = $signed(reg20[(4'ha):(3'h6)]);
  always
    @(posedge clk) begin
      reg44 <= (~&((~{(wire8 << wire0), (reg18 ? reg25 : reg32)}) ?
          (&(&$signed(reg21))) : (wire1 ?
              reg15[(3'h5):(3'h5)] : $signed(reg17))));
    end
  assign wire45 = reg34[(2'h3):(2'h3)];
  assign wire46 = ((($unsigned((^reg27)) << reg26) & reg17[(5'h12):(4'he)]) + wire41[(4'h8):(2'h2)]);
  assign wire47 = ($signed({(~&$signed((8'haa)))}) | ((8'hb0) >>> wire1[(3'h4):(2'h3)]));
endmodule
