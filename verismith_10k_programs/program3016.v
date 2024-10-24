module top
#(parameter param56 = (-(^~(((|(8'hb1)) ? ((8'hb2) ? (8'ha4) : (8'hb8)) : ((8'haf) ? (8'h9f) : (7'h40))) - (8'hb8)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire34,
                 wire33,
                 wire32,
                 wire18,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg47,
                 reg46,
                 reg45,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire4[(4'he):(4'he)];
  assign wire6 = ({$unsigned($unsigned($signed(wire4))),
                     {((wire5 ? wire4 : wire2) ? $signed(wire3) : wire2),
                         (8'hb9)}} || $unsigned(((+$signed(wire2)) ?
                     wire1[(2'h3):(2'h2)] : $signed((+wire2)))));
  assign wire7 = wire4[(3'h4):(3'h4)];
  assign wire8 = {$unsigned(wire7[(3'h5):(1'h0)]), wire7};
  assign wire9 = (wire1 | wire2[(3'h7):(1'h0)]);
  assign wire10 = $unsigned(((8'hb4) ?
                      ((^wire2) ?
                          ((^~(8'hb9)) < (~^wire4)) : $unsigned({wire4})) : $signed(wire9)));
  assign wire11 = (wire8[(5'h14):(1'h0)] ?
                      ((&$signed((|wire10))) ^ $signed($unsigned((~^wire6)))) : $signed($signed($signed((wire8 ?
                          wire8 : wire5)))));
  always
    @(posedge clk) begin
      reg12 <= $signed(wire4[(3'h5):(2'h2)]);
      reg13 <= (({{((8'h9c) + wire6), wire5[(4'h8):(3'h5)]},
                  ({(7'h42), wire4} << (wire10 >>> wire9))} ?
              {$signed((-wire11))} : (~$signed($unsigned(wire11)))) ?
          ({((~&wire8) - wire5[(2'h2):(1'h1)]), {(wire11 ? wire11 : wire7)}} ?
              $signed((wire8 <<< (wire1 ?
                  (7'h42) : reg12))) : wire9[(3'h7):(3'h5)]) : wire5);
    end
  always
    @(posedge clk) begin
      reg14 <= (reg13 >> {$unsigned(((wire5 >= wire10) ? (~^wire9) : wire7))});
      reg15 <= $signed((|$signed(reg13)));
      reg16 <= wire8;
      reg17 <= wire2;
    end
  assign wire18 = $unsigned({(($unsigned(wire10) <= reg14) == $unsigned($unsigned(wire1))),
                      wire5[(4'hf):(4'hf)]});
  always
    @(posedge clk) begin
      reg19 <= reg15;
      if (wire1[(3'h5):(2'h2)])
        begin
          reg20 <= $unsigned((~|$unsigned(wire18[(4'hc):(4'h9)])));
        end
      else
        begin
          if (wire0)
            begin
              reg20 <= ($unsigned((^(reg14 || $signed((8'hab))))) | $signed((($unsigned(wire18) ?
                  wire11 : ((8'hb5) && reg15)) ~^ ($signed(wire11) ^~ $unsigned((8'hbb))))));
              reg21 <= (wire6 ^ (8'hb7));
              reg22 <= (+reg20[(3'h6):(3'h6)]);
              reg23 <= reg22;
              reg24 <= reg12;
            end
          else
            begin
              reg20 <= reg24;
            end
          if ($unsigned((~($signed(wire18[(5'h12):(4'hb)]) ?
              (8'had) : ({wire9} ? wire18 : $unsigned(reg19))))))
            begin
              reg25 <= (~^($signed(reg15[(3'h6):(2'h2)]) || (^reg16[(3'h5):(3'h4)])));
              reg26 <= reg13;
              reg27 <= wire0[(4'h9):(4'h9)];
              reg28 <= wire10;
            end
          else
            begin
              reg25 <= (^~(^(wire2[(2'h2):(1'h0)] >= ($unsigned(wire3) ?
                  $unsigned(reg19) : {reg19}))));
              reg26 <= wire8[(3'h6):(1'h0)];
              reg27 <= (!wire18);
              reg28 <= reg26;
              reg29 <= (^(&$unsigned(($unsigned(reg14) ?
                  (reg28 ? reg16 : reg21) : reg20[(2'h3):(1'h0)]))));
            end
          reg30 <= wire1;
        end
      reg31 <= ($unsigned(reg23) ?
          {reg21[(2'h2):(1'h0)],
              (($unsigned(reg13) ~^ $signed(wire11)) <= {((8'ha0) - wire8),
                  $signed(reg24)})} : ($unsigned((^(wire0 ?
              wire2 : wire5))) ^ $signed($unsigned((wire0 & wire7)))));
    end
  assign wire32 = reg13;
  assign wire33 = reg21[(3'h7):(1'h1)];
  assign wire34 = wire1;
  always
    @(posedge clk) begin
      reg35 <= wire32;
      reg36 <= $unsigned($signed(wire33));
      if ($signed($signed((^~wire6[(4'ha):(3'h7)]))))
        begin
          reg37 <= ($unsigned(wire1[(3'h6):(2'h2)]) ~^ reg35[(2'h2):(2'h2)]);
          if (reg24[(4'ha):(3'h5)])
            begin
              reg38 <= $unsigned((~^(reg28[(4'hd):(1'h0)] ?
                  {(wire33 ? reg20 : (8'ha0)),
                      $signed(reg21)} : wire3[(1'h0):(1'h0)])));
              reg39 <= ($unsigned((wire7[(1'h1):(1'h1)] ?
                      $signed({reg20}) : (^~{wire5, wire34}))) ?
                  ((reg21[(4'ha):(3'h6)] < {$signed(reg24),
                      reg24}) ^ reg27[(5'h11):(4'hb)]) : $signed(reg28));
              reg40 <= (((!wire6[(4'hd):(2'h3)]) << (+(~$unsigned(wire3)))) ^ $unsigned(reg35[(3'h4):(2'h3)]));
              reg41 <= reg26;
              reg42 <= wire7;
            end
          else
            begin
              reg38 <= reg19;
            end
          reg43 <= (reg17[(2'h3):(2'h2)] << $unsigned($unsigned($unsigned((wire2 ?
              reg19 : wire32)))));
          reg44 <= (|$signed((~&((reg29 > reg20) ?
              reg13 : (reg39 - (8'ha0))))));
          if ((8'ha2))
            begin
              reg45 <= wire9;
              reg46 <= (^(8'hac));
            end
          else
            begin
              reg45 <= (((reg43 >= wire10[(1'h1):(1'h0)]) ?
                      reg42 : (+reg19[(4'hc):(2'h2)])) ?
                  ($unsigned($unsigned((wire34 >> wire0))) || wire7[(1'h1):(1'h1)]) : reg16[(3'h4):(2'h3)]);
              reg46 <= $signed(({reg38, wire11[(1'h1):(1'h0)]} + ((-{wire8,
                      reg30}) ?
                  $unsigned($signed(reg46)) : reg21[(1'h1):(1'h1)])));
              reg47 <= (reg41 | ($unsigned($unsigned($unsigned(reg37))) ?
                  {wire10[(1'h0):(1'h0)]} : (reg38[(3'h7):(3'h6)] ?
                      ({reg14} ?
                          reg26[(3'h4):(1'h0)] : (reg25 >= wire32)) : $signed(reg19[(4'hc):(3'h7)]))));
            end
        end
      else
        begin
          if (($signed(wire10[(1'h0):(1'h0)]) ?
              {$unsigned((reg15[(3'h4):(2'h3)] ? (+(8'had)) : (&wire2))),
                  (($unsigned(reg36) ^~ (+wire10)) ?
                      $unsigned(reg45) : ($signed(reg45) | (reg39 || reg30)))} : (~wire3[(1'h0):(1'h0)])))
            begin
              reg37 <= (wire6[(4'he):(3'h6)] ?
                  $signed(reg41) : ({$signed(reg22)} << $unsigned((~^reg37[(2'h2):(1'h1)]))));
              reg38 <= (reg38 ?
                  reg29[(1'h1):(1'h1)] : $unsigned((^(reg35[(3'h5):(1'h1)] ?
                      (reg20 ? reg22 : reg16) : $unsigned(reg17)))));
              reg39 <= (8'ha7);
              reg40 <= wire11[(1'h1):(1'h1)];
              reg41 <= $unsigned(reg22);
            end
          else
            begin
              reg37 <= ($unsigned(wire3[(2'h2):(1'h0)]) && {((~|(~^reg35)) <= ((!wire0) ?
                      wire10 : {reg40, (8'hbc)}))});
              reg38 <= $signed(wire0);
              reg39 <= $signed({$signed($unsigned($signed(reg29))),
                  (-$signed((~wire11)))});
              reg40 <= (-reg23[(3'h6):(3'h6)]);
              reg41 <= $unsigned($signed(wire7));
            end
          reg42 <= {(8'hb6)};
          reg43 <= reg13;
        end
    end
  assign wire48 = {$unsigned(reg44), $signed(reg40)};
  assign wire49 = (~|reg41[(5'h14):(5'h10)]);
  assign wire50 = $unsigned($unsigned((&$signed((reg13 << reg26)))));
  assign wire51 = $unsigned($unsigned(reg14));
  assign wire52 = $unsigned(wire34[(4'hd):(4'hb)]);
  assign wire53 = (+($unsigned(reg25[(4'hb):(4'h8)]) ?
                      $signed((wire18[(4'hf):(4'h9)] > reg46[(4'hd):(4'h9)])) : (8'hab)));
  assign wire54 = $signed((+reg23));
  assign wire55 = (reg26[(5'h13):(4'he)] ?
                      (((8'hba) - (~{reg23, wire8})) ?
                          $unsigned((wire4[(4'ha):(1'h0)] ?
                              reg28[(3'h4):(3'h4)] : (reg16 >>> reg23))) : (|$signed(reg43[(4'hd):(4'h8)]))) : $signed($unsigned($unsigned((wire53 & reg14)))));
endmodule
