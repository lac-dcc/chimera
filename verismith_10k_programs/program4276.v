module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire31,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (8'ha2);
  assign wire5 = wire4;
  assign wire6 = {(~^(~(7'h40)))};
  assign wire7 = wire1;
  assign wire8 = $signed($unsigned((wire3[(2'h2):(2'h2)] >= $unsigned((|wire6)))));
  always
    @(posedge clk) begin
      if ({(-{($signed(wire5) != $unsigned(wire5))}),
          (!({wire4[(1'h0):(1'h0)]} ?
              {(~wire3), (^~wire3)} : {$signed(wire1)}))})
        begin
          reg9 <= {wire0[(2'h2):(2'h2)]};
          if ($signed((~^((wire3[(2'h3):(2'h2)] ?
              ((7'h44) ? wire5 : (8'hb3)) : (&wire0)) != (&$unsigned(wire1))))))
            begin
              reg10 <= ({wire0} >>> wire6);
              reg11 <= ($unsigned(wire1) + wire4[(1'h1):(1'h1)]);
              reg12 <= $unsigned($unsigned(((wire7[(5'h11):(3'h7)] & reg9[(2'h3):(2'h3)]) ?
                  ((wire2 != wire0) == (-wire2)) : ($unsigned((8'ha1)) | $unsigned(wire7)))));
            end
          else
            begin
              reg10 <= (7'h42);
              reg11 <= wire0;
              reg12 <= ((((^((8'hb6) <= (8'hb9))) ?
                      (reg11[(3'h7):(3'h5)] ?
                          ((7'h43) ?
                              wire3 : wire6) : (8'ha9)) : $unsigned((wire0 | wire2))) | ((!$unsigned(reg11)) != $signed($signed(reg9)))) ?
                  (wire7[(1'h0):(1'h0)] ~^ $signed($signed((wire5 <<< wire6)))) : wire2);
              reg13 <= $signed(((+wire6) & (wire5 == $unsigned((wire7 ?
                  wire5 : wire6)))));
            end
          reg14 <= (^~($unsigned(wire4[(1'h0):(1'h0)]) ?
              (reg10 ?
                  ((!wire3) ? (~reg12) : (wire7 ? wire3 : wire7)) : ({reg13} ?
                      (reg11 ?
                          reg9 : wire3) : (~^wire5))) : wire0[(1'h1):(1'h1)]));
          if (($signed((($signed(wire1) ?
                      wire8[(3'h7):(3'h4)] : (reg13 ? wire1 : wire1)) ?
                  reg9 : wire5)) ?
              (^(~&$unsigned((&reg13)))) : $signed(wire7)))
            begin
              reg15 <= (wire4 ?
                  (wire2[(1'h1):(1'h0)] != wire0) : $unsigned(wire6));
              reg16 <= $unsigned($signed(((((8'hb7) ?
                  wire6 : (8'h9f)) << reg10[(1'h1):(1'h0)]) <= wire2)));
              reg17 <= $unsigned((~^reg9));
            end
          else
            begin
              reg15 <= (((!$signed((reg16 ?
                  (8'haa) : wire0))) <= (((reg9 << wire4) ?
                  {wire5, reg15} : (reg13 && (8'ha5))) != {(wire6 ?
                      (8'ha2) : reg10),
                  $signed(reg17)})) >>> (wire1[(1'h0):(1'h0)] ?
                  (8'ha2) : (^$unsigned(reg11))));
              reg16 <= wire6;
              reg17 <= $unsigned({$signed($unsigned((reg14 ?
                      wire1 : (8'hb6))))});
              reg18 <= (-(((reg15 ? $unsigned(reg15) : (wire1 >>> wire7)) ?
                  $signed((reg15 ?
                      wire0 : reg17)) : wire3) && $signed(($unsigned(wire5) && wire8))));
              reg19 <= ($signed($unsigned(((reg17 ~^ reg16) ?
                  wire2[(1'h1):(1'h1)] : (~&reg10)))) != $unsigned($unsigned(wire8)));
            end
        end
      else
        begin
          reg9 <= $unsigned(wire7);
          if ((wire7[(4'ha):(3'h6)] ?
              (reg10 ?
                  wire2 : $unsigned(reg16)) : {$signed($unsigned($unsigned(wire5)))}))
            begin
              reg10 <= $unsigned(reg10[(4'ha):(4'ha)]);
              reg11 <= {{$unsigned($signed(reg15[(5'h10):(3'h4)])),
                      (|$unsigned((reg18 + reg15)))},
                  {((((8'ha4) ? reg11 : reg16) <= wire4) * ((reg11 ?
                          wire1 : reg18) == (wire4 >>> reg14)))}};
              reg12 <= (^wire6);
            end
          else
            begin
              reg10 <= reg12[(3'h6):(3'h5)];
              reg11 <= $unsigned(reg10[(4'ha):(3'h5)]);
              reg12 <= wire4;
            end
          reg13 <= ($signed(($signed(reg11[(3'h7):(1'h0)]) ?
                  ((&wire1) - $unsigned(reg18)) : wire0)) ?
              $unsigned($unsigned(((reg16 ? reg17 : reg12) ?
                  (8'ha5) : {reg18}))) : ({reg16,
                  $signed($signed((8'hae)))} - $unsigned((((7'h42) | wire8) ?
                  (reg12 << (8'hbd)) : (reg19 ? reg17 : reg17)))));
          if ({$unsigned((wire4[(2'h3):(2'h3)] ?
                  reg9 : $unsigned({reg15, reg13})))})
            begin
              reg14 <= (wire3[(2'h3):(1'h0)] & $unsigned({$signed({reg10,
                      (8'h9e)}),
                  (reg13 ? $unsigned(wire5) : reg18)}));
              reg15 <= wire0;
              reg16 <= ((~&reg19[(1'h0):(1'h0)]) <<< reg10[(2'h2):(1'h1)]);
            end
          else
            begin
              reg14 <= (reg9[(2'h2):(1'h1)] ?
                  {wire6,
                      $unsigned($signed(reg19[(3'h6):(2'h3)]))} : (-(~^(^~(reg10 < reg17)))));
              reg15 <= (((|$unsigned((reg15 > wire0))) >> (reg14[(4'h8):(1'h0)] ?
                  reg10 : (^(reg14 ? wire8 : wire3)))) + ({reg17} ?
                  {wire7[(4'hc):(1'h0)]} : wire4));
              reg16 <= (&($signed(reg18[(1'h1):(1'h1)]) ?
                  $signed(wire1[(4'h9):(2'h3)]) : ($signed((~&reg14)) ?
                      $signed((reg11 >> (8'hba))) : (reg11 & reg12[(3'h7):(3'h7)]))));
              reg17 <= (wire4[(1'h1):(1'h0)] <<< (reg12[(4'ha):(2'h2)] ?
                  {($signed(wire4) ?
                          $unsigned(wire0) : $signed(reg15))} : ((&$unsigned(wire3)) ?
                      reg18[(1'h0):(1'h0)] : $unsigned((reg15 ?
                          (8'hac) : reg16)))));
              reg18 <= (+(|{(wire3 ? (-wire7) : $signed(reg11))}));
            end
          reg19 <= ($unsigned((((reg15 ?
              wire7 : reg14) & reg19) >>> $signed((8'h9f)))) ^ {{reg11,
                  (~^(-reg18))}});
        end
      reg20 <= (((+(^wire5)) ?
          ($signed(((8'hac) >> wire4)) ?
              ($signed(reg15) | reg17[(2'h3):(2'h2)]) : wire1) : ((!(wire1 ?
                  (8'haa) : reg14)) ?
              $signed(reg15) : wire0)) >>> reg10);
      if (reg10[(4'hb):(4'hb)])
        begin
          if ($signed({$unsigned((-{wire1, (8'haf)})), reg20[(3'h6):(2'h3)]}))
            begin
              reg21 <= (~^$unsigned(wire8[(4'hd):(4'hc)]));
              reg22 <= $unsigned(reg18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg21 <= wire4;
            end
        end
      else
        begin
          if ((($unsigned((reg15 ?
                      $signed((7'h43)) : (wire6 ? wire4 : reg13))) ?
                  $signed(wire7) : wire2) ?
              (!(wire6[(1'h1):(1'h1)] <<< reg16)) : wire3[(1'h0):(1'h0)]))
            begin
              reg21 <= $unsigned(reg10[(1'h0):(1'h0)]);
              reg22 <= (~&reg22);
            end
          else
            begin
              reg21 <= {{wire3, {(&reg19), (8'hb8)}}};
              reg22 <= $signed(wire5[(4'h8):(3'h7)]);
              reg23 <= $signed(wire6[(5'h11):(4'he)]);
              reg24 <= {({(reg9[(2'h3):(1'h1)] ?
                              $signed(wire5) : {reg10, (8'hb4)}),
                          ((reg21 ^ wire7) ? (^wire2) : (wire2 ~^ reg13))} ?
                      wire4[(1'h0):(1'h0)] : ($unsigned(reg15[(5'h13):(2'h2)]) ^~ ($unsigned(reg17) ?
                          (reg19 >> (8'h9f)) : reg22)))};
            end
        end
      reg25 <= reg21;
    end
  always
    @(posedge clk) begin
      reg26 <= $signed({(~^reg12), $unsigned($unsigned(wire5[(2'h3):(2'h3)]))});
      reg27 <= $unsigned($signed((wire1[(2'h3):(2'h3)] + (~^reg19))));
      reg28 <= reg16;
      reg29 <= reg19[(3'h7):(3'h4)];
      reg30 <= {reg27[(2'h3):(2'h2)]};
    end
  assign wire31 = wire8[(4'hb):(4'ha)];
endmodule
