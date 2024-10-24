module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed((wire3 ~^ ({wire4, $signed(wire2)} ?
                     $signed($unsigned(wire3)) : $signed(wire3))));
  assign wire6 = ((wire2 ?
                     $unsigned(wire4) : {$unsigned((~wire5)),
                         $signed($unsigned(wire3))}) + $signed($signed(wire2[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (((&{((wire3 && wire1) == $unsigned(wire1))}) ?
          $unsigned((8'hab)) : (~^(($signed(wire0) == (wire2 || wire4)) - $signed((wire6 + wire0))))))
        begin
          reg7 <= wire3[(1'h0):(1'h0)];
          reg8 <= $signed(wire6[(2'h2):(1'h1)]);
          reg9 <= ((reg7[(4'ha):(4'ha)] ?
              (|(8'hbd)) : wire2[(4'h8):(2'h3)]) <<< (reg7 ?
              ((8'ha7) < ((8'hb5) >>> wire1)) : ({((8'had) ? wire6 : wire3),
                      $signed((8'h9e))} ?
                  {wire2[(4'ha):(1'h0)]} : {{reg7}, $signed(wire5)})));
          reg10 <= reg8;
        end
      else
        begin
          reg7 <= ((reg8[(4'hc):(1'h1)] ?
                  (wire1 && ((reg10 ?
                      reg7 : wire4) | $unsigned(wire1))) : wire2[(3'h5):(1'h0)]) ?
              (-$signed(wire6[(1'h0):(1'h0)])) : (-wire1));
          if (($signed($unsigned($unsigned((wire1 ?
              reg9 : wire2)))) >>> (+(+{wire3[(2'h2):(1'h0)]}))))
            begin
              reg8 <= $unsigned(($signed(reg9) >> (~wire1[(1'h0):(1'h0)])));
              reg9 <= $unsigned({(((reg7 ? reg8 : (8'hbd)) ?
                      (wire0 <= reg10) : wire2) || wire4)});
              reg10 <= (wire0[(1'h0):(1'h0)] > ({(reg10[(3'h6):(3'h6)] && $unsigned(wire4)),
                  reg9[(2'h3):(2'h2)]} + $unsigned($unsigned((reg10 ~^ wire4)))));
              reg11 <= reg10[(1'h0):(1'h0)];
            end
          else
            begin
              reg8 <= ($unsigned($unsigned(((wire5 ?
                  wire4 : (7'h41)) != (reg7 <= reg11)))) && $signed($unsigned({$unsigned(wire1),
                  (wire6 ? (8'had) : (8'hb9))})));
              reg9 <= $signed(wire4[(3'h4):(2'h2)]);
              reg10 <= (+(!$unsigned(wire4)));
              reg11 <= wire1;
            end
          reg12 <= $unsigned(reg10);
        end
      if (($signed(wire1[(1'h0):(1'h0)]) >> $unsigned($unsigned((reg9[(2'h3):(1'h0)] * (^~wire3))))))
        begin
          reg13 <= ($signed((((wire3 - reg11) ?
              (reg7 && wire2) : $unsigned(reg8)) < (~$signed(reg8)))) ^~ ($signed($unsigned($signed(reg10))) ?
              $unsigned(wire6[(1'h1):(1'h0)]) : (8'hb4)));
        end
      else
        begin
          if ($signed(reg13[(4'hb):(2'h3)]))
            begin
              reg13 <= wire1[(1'h1):(1'h1)];
              reg14 <= ((+((-((8'ha2) ? reg9 : wire3)) ?
                  ((reg11 ? reg10 : (8'hb3)) ^ (~&reg10)) : ((wire1 ?
                          (8'hb4) : (8'hb2)) ?
                      {reg7} : (~&wire2)))) << (~reg10));
              reg15 <= (+reg11[(4'hb):(1'h0)]);
            end
          else
            begin
              reg13 <= reg15[(4'h9):(3'h7)];
              reg14 <= $signed(((|(reg11 ?
                  (wire4 ?
                      reg14 : reg8) : (reg7 || wire6))) >= (reg9[(1'h0):(1'h0)] ?
                  ({wire4,
                      reg10} ^~ $signed(reg15)) : (reg13 >> (reg14 & (8'hae))))));
              reg15 <= ((&reg9[(3'h4):(2'h3)]) ?
                  reg8 : $unsigned($signed(((wire0 ? wire4 : reg10) != reg8))));
              reg16 <= {((reg7[(5'h10):(1'h1)] ?
                      reg13 : ((wire2 ? wire2 : (8'hbe)) ?
                          (reg10 != (8'h9d)) : (wire5 ?
                              (8'hac) : (8'ha1)))) <= (!$unsigned(reg12[(5'h13):(3'h6)]))),
                  {$signed((reg14[(1'h1):(1'h0)] ?
                          $signed(reg9) : (wire0 & reg7))),
                      reg11[(4'hb):(3'h5)]}};
            end
        end
    end
  assign wire17 = wire4;
  assign wire18 = ($signed($signed($signed($unsigned(reg14)))) >= (-($signed(reg13) >= wire0[(2'h2):(2'h2)])));
  assign wire19 = $signed($unsigned((&(8'hbb))));
  assign wire20 = ($signed($signed($signed($unsigned(wire1)))) << ((wire3 + wire19[(4'he):(1'h0)]) ?
                      reg12 : (($unsigned(reg8) | wire3[(1'h0):(1'h0)]) ?
                          wire6 : (~|(8'ha9)))));
  assign wire21 = {{($signed($unsigned((8'h9c))) ?
                              wire18 : $unsigned(wire19[(4'ha):(4'ha)])),
                          wire18}};
  assign wire22 = $signed({$signed($unsigned($unsigned((8'hae))))});
  assign wire23 = (reg9[(3'h6):(1'h1)] | wire21[(3'h7):(2'h2)]);
endmodule
