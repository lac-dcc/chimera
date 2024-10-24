module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg10,
                 reg8,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (|{wire1[(1'h1):(1'h1)], (8'h9c)});
  assign wire6 = $signed($unsigned((((8'ha6) + $signed((8'ha2))) > (|$unsigned(wire3)))));
  assign wire7 = wire3[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (((wire4[(3'h5):(1'h0)] ? wire5 : wire0[(2'h2):(1'h1)]) - wire6))
        begin
          reg8 <= wire1[(2'h2):(1'h0)];
        end
      else
        begin
          reg8 <= $unsigned($unsigned(wire1[(4'hd):(3'h7)]));
        end
    end
  assign wire9 = (reg8[(2'h2):(1'h0)] >= $signed(($signed((wire5 >>> wire1)) < (^~(wire0 & wire0)))));
  always
    @(posedge clk) begin
      reg10 <= wire2;
      reg11 <= wire4[(3'h6):(3'h6)];
      if ($signed($signed(wire5[(5'h12):(3'h6)])))
        begin
          reg12 <= ((reg8 >= (((~wire1) >= reg8) ?
              $unsigned(wire0[(3'h5):(3'h5)]) : ($signed((8'ha2)) || $signed((8'h9c))))) & (~($signed({reg11,
              (8'hb2)}) * wire0[(2'h3):(2'h2)])));
          if (($signed(reg8[(5'h12):(3'h5)]) ?
              (^wire0[(3'h7):(2'h3)]) : $unsigned((reg11 ?
                  wire0[(3'h5):(2'h3)] : wire3))))
            begin
              reg13 <= (($unsigned(wire2) > (~|((+reg8) << (wire7 == wire4)))) && {(reg11 ^~ ((~^wire4) ?
                      (wire0 ? reg11 : (8'h9f)) : (wire5 ? wire6 : reg11)))});
              reg14 <= {(8'hbc)};
              reg15 <= $signed((^~(((8'ha7) ?
                  wire4 : (reg13 > wire0)) - $unsigned({(8'hbe), wire1}))));
              reg16 <= reg15[(4'he):(4'h9)];
              reg17 <= (8'hb7);
            end
          else
            begin
              reg13 <= reg16;
              reg14 <= (^(wire2[(2'h3):(2'h2)] != (({(8'hb7)} == reg10[(1'h1):(1'h0)]) ?
                  $signed(((8'hb1) ? reg15 : reg16)) : reg14[(2'h2):(1'h0)])));
              reg15 <= wire7;
              reg16 <= ((reg17 ? reg15 : wire4[(4'ha):(4'h8)]) || {(8'hae),
                  $signed((^~(wire5 <= reg17)))});
              reg17 <= {(($unsigned(reg17) ?
                      $unsigned($unsigned((8'ha8))) : (~^wire6[(5'h14):(3'h7)])) >= ((-reg17) ?
                      (~|(wire1 ^~ (8'hbd))) : (wire4 <= reg17)))};
            end
          reg18 <= (^~{(+reg10[(4'he):(4'h9)])});
          reg19 <= $signed(reg8);
          if ((((wire1[(4'he):(4'hd)] ? $signed((reg18 < (7'h42))) : (8'hb8)) ?
                  reg14[(3'h5):(1'h0)] : $signed($signed(reg19))) ?
              wire5 : (~|$signed(((wire3 >>> wire3) + {reg11})))))
            begin
              reg20 <= $unsigned((reg16[(2'h3):(2'h2)] << ($signed(((8'hb2) ?
                  reg13 : wire1)) && ((wire2 ? reg18 : reg16) ?
                  (^wire7) : (wire2 ^~ reg15)))));
            end
          else
            begin
              reg20 <= (8'hb2);
            end
        end
      else
        begin
          reg12 <= (reg12[(2'h3):(2'h3)] ?
              wire4[(4'ha):(3'h6)] : {$unsigned(wire4[(3'h4):(1'h1)]),
                  wire0[(4'h8):(3'h5)]});
          if ($signed(($unsigned($signed($signed(wire6))) >= (wire2[(2'h3):(2'h2)] ?
              $signed((wire3 ? (8'hb8) : wire1)) : (-wire1[(4'hc):(4'ha)])))))
            begin
              reg13 <= ((~|$signed($signed((wire9 > wire0)))) ?
                  wire0 : $signed((8'hb9)));
              reg14 <= (^~((~|$unsigned((-wire3))) ?
                  $signed(($unsigned(reg18) ?
                      $signed((8'ha8)) : (~^wire5))) : reg13));
              reg15 <= $unsigned($unsigned(wire3[(2'h2):(2'h2)]));
            end
          else
            begin
              reg13 <= reg13[(1'h1):(1'h1)];
              reg14 <= ((((~&(~|wire6)) ?
                      (&$unsigned(reg14)) : $unsigned((+reg15))) ?
                  $unsigned((^~$unsigned(reg18))) : (|$signed(wire7))) + reg19);
            end
          if ((reg12 & $signed({reg13, ($unsigned(reg11) >= wire7)})))
            begin
              reg16 <= (|reg15);
              reg17 <= $unsigned($signed(wire6));
              reg18 <= (+wire4[(4'hd):(3'h7)]);
            end
          else
            begin
              reg16 <= ({$signed(((reg18 >> reg19) ?
                      (^reg12) : reg13))} >>> (8'hab));
            end
          reg19 <= (reg10[(1'h0):(1'h0)] ?
              (reg16 != $unsigned(wire6[(5'h11):(4'he)])) : {((^(wire1 ?
                      reg10 : reg12)) ^~ (^reg20)),
                  ((reg18 ? $unsigned(reg19) : (8'ha3)) ?
                      {reg10[(3'h7):(3'h4)],
                          wire0} : $unsigned((wire0 - wire5)))});
        end
      if (($signed($signed(((reg15 & reg11) <= ((7'h40) ?
          reg11 : reg8)))) * $unsigned($signed(((reg17 ?
          reg11 : reg15) >= wire5)))))
        begin
          reg21 <= reg11[(2'h2):(1'h0)];
        end
      else
        begin
          reg21 <= ($unsigned(reg14[(1'h1):(1'h0)]) != $unsigned((($signed((8'h9d)) - (reg19 << reg10)) ~^ reg11[(1'h0):(1'h0)])));
          reg22 <= ((8'hab) ? reg15 : (8'hb3));
          reg23 <= reg19;
        end
      reg24 <= {($unsigned(($unsigned((8'hae)) ~^ reg16)) >>> $unsigned(((reg17 ?
                  wire6 : wire3) ?
              reg17[(1'h0):(1'h0)] : $unsigned((8'h9d))))),
          $unsigned({wire3[(3'h5):(2'h2)]})};
    end
  assign wire25 = ($unsigned(($unsigned((reg12 ? reg12 : reg24)) != reg14)) ?
                      (7'h41) : (~^$signed(({wire5, (8'h9d)} + {(8'ha3)}))));
  assign wire26 = wire1[(4'h8):(3'h4)];
  assign wire27 = ($signed($signed($signed(reg11))) ?
                      $signed((reg15[(2'h2):(1'h1)] ?
                          $unsigned(reg8) : ((reg14 + wire25) & (wire26 ?
                              reg24 : reg14)))) : (wire2 || (((reg11 - reg18) ?
                          (wire7 <= reg15) : $unsigned(wire4)) <<< $signed(wire0))));
  assign wire28 = wire25[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      if (((~^(7'h44)) ?
          ($unsigned($unsigned(reg14)) ?
              wire0[(4'h9):(2'h3)] : (reg16 * $signed({wire3,
                  (8'hac)}))) : {$unsigned((8'ha5)),
              $signed(reg8[(3'h6):(2'h2)])}))
        begin
          reg29 <= (((wire26 ? $unsigned(wire27) : reg21[(4'h8):(4'h8)]) ?
                  reg24 : wire3[(3'h4):(1'h1)]) ?
              $signed($signed(((wire5 ? (8'hb7) : (8'ha3)) ?
                  wire3 : wire0))) : reg23);
          if ({(~|(~(-$unsigned(reg14)))), wire6[(4'hc):(4'hc)]})
            begin
              reg30 <= $unsigned(wire28);
            end
          else
            begin
              reg30 <= ({(wire4[(4'h9):(4'h8)] >> {wire5})} ~^ ($unsigned($unsigned(wire6[(1'h0):(1'h0)])) - $signed(((reg16 ?
                      wire2 : wire3) ?
                  (~^reg13) : wire26))));
            end
          reg31 <= (^(((reg21 ? $unsigned(wire9) : (reg23 ? wire5 : reg10)) ?
              (^~wire2) : (reg21 - (reg18 <= (8'hb8)))) + (((8'h9e) << wire25[(1'h1):(1'h1)]) ?
              {(wire3 && wire6)} : (+{(8'hae), reg14}))));
          reg32 <= $signed(wire9[(4'h9):(2'h2)]);
          reg33 <= $unsigned({(!(^~$signed(wire26))),
              (wire28[(3'h6):(2'h2)] < (reg14[(4'ha):(3'h6)] || $signed(reg11)))});
        end
      else
        begin
          reg29 <= reg30;
          reg30 <= reg13;
          reg31 <= {reg19[(1'h0):(1'h0)]};
        end
      reg34 <= reg22;
      if ($signed((~|(((^~reg12) << reg29[(5'h11):(3'h4)]) ?
          {$signed(wire0), $unsigned(reg29)} : ($unsigned(wire25) ?
              (reg20 ? wire25 : (7'h40)) : (^~reg8))))))
        begin
          if (((+($unsigned(reg17) ?
              reg34 : ((reg12 <= reg11) != $unsigned(reg33)))) ^~ $signed((8'hab))))
            begin
              reg35 <= ($unsigned($unsigned({reg22})) ^~ $signed((wire5[(1'h0):(1'h0)] > $signed((+reg29)))));
            end
          else
            begin
              reg35 <= $unsigned({{(^reg29)}});
              reg36 <= (($unsigned(reg33[(2'h3):(1'h1)]) & $unsigned((wire5 >= {reg30}))) ?
                  ((!(7'h40)) ?
                      ((^~(+reg31)) ?
                          reg21[(4'he):(3'h7)] : ($signed((8'hb7)) | reg21)) : reg13[(2'h3):(1'h1)]) : {$unsigned(reg23),
                      $unsigned(reg11)});
            end
          reg37 <= (|reg22);
          reg38 <= wire2;
        end
      else
        begin
          reg35 <= reg34;
        end
    end
  assign wire39 = {$unsigned($unsigned($signed(wire2)))};
  assign wire40 = ((((reg37 ?
                      (reg38 ? wire9 : wire1) : (wire26 ?
                          reg34 : reg32)) - reg22) ^~ (reg20 ^~ reg20)) ~^ wire7[(3'h6):(3'h6)]);
  assign wire41 = reg33[(4'h9):(2'h3)];
  assign wire42 = $unsigned($unsigned(($signed((&reg32)) ?
                      (!$signed((8'ha0))) : (((8'ha9) >>> reg11) ?
                          reg18[(4'hd):(4'ha)] : $unsigned(reg11)))));
endmodule
