module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (!wire3);
  assign wire6 = $signed(wire1[(5'h10):(1'h1)]);
  assign wire7 = (^{(~wire6[(2'h3):(2'h2)]), $signed({$unsigned(wire2)})});
  always
    @(posedge clk) begin
      if ((wire6 <= $signed((~&(wire2 ?
          $unsigned((8'hbf)) : $unsigned((8'hb4)))))))
        begin
          if ($unsigned(wire0))
            begin
              reg8 <= $signed(wire2[(3'h5):(1'h1)]);
            end
          else
            begin
              reg8 <= $signed($signed($signed((wire7[(2'h3):(2'h2)] || $signed(wire6)))));
            end
          reg9 <= wire4[(4'hd):(2'h3)];
          if ((|$signed((|reg9[(2'h2):(1'h0)]))))
            begin
              reg10 <= wire2;
              reg11 <= $unsigned(((wire2 ?
                      reg10 : $signed(reg9[(4'he):(4'he)])) ?
                  $signed(($signed(reg9) ?
                      (wire5 ?
                          reg9 : reg9) : (-reg10))) : ((((8'h9e) > (8'hbd)) <<< reg10[(3'h7):(3'h4)]) ^ ((reg10 != wire6) ?
                      (wire4 ? wire0 : wire6) : reg10[(5'h10):(4'hc)]))));
              reg12 <= (reg9 ?
                  wire3[(1'h0):(1'h0)] : (^(~|reg11[(4'h9):(2'h3)])));
              reg13 <= (+(~($signed((8'haa)) ?
                  (wire7 ?
                      (reg9 * wire3) : (wire7 ? wire7 : reg8)) : (~|wire6))));
            end
          else
            begin
              reg10 <= (($unsigned((8'hb0)) | (~|{wire7[(2'h3):(1'h1)],
                  $unsigned(wire3)})) != ((reg9[(4'h9):(3'h4)] ?
                  reg11[(3'h6):(1'h1)] : {reg9}) || wire0[(4'ha):(2'h2)]));
            end
        end
      else
        begin
          reg8 <= {(^wire5), wire4};
        end
      reg14 <= (~&(wire7[(1'h1):(1'h0)] | {reg11, $unsigned(wire2)}));
      reg15 <= reg12[(4'h9):(4'h8)];
      reg16 <= reg10[(4'hc):(4'hc)];
    end
  assign wire17 = {{($signed((reg13 ^ wire4)) + wire6[(3'h6):(3'h5)])}};
  assign wire18 = $signed(((((wire4 && (8'h9c)) ?
                          wire7 : wire3) << {(wire4 >> reg8),
                          reg10[(1'h1):(1'h1)]}) ?
                      wire4[(4'hd):(3'h5)] : (8'ha6)));
  assign wire19 = ((~&reg13[(4'hb):(3'h4)]) ?
                      (8'hbb) : (|(reg11[(2'h3):(2'h3)] ?
                          (reg15 ? wire4 : (wire6 ? (7'h43) : wire6)) : {(reg9 ?
                                  reg13 : wire17)})));
  assign wire20 = {(wire0[(4'hb):(4'ha)] >>> ($signed(reg8[(4'hb):(4'h8)]) ?
                          reg12[(3'h7):(3'h6)] : reg15)),
                      reg15};
  assign wire21 = (($signed(wire19) >> (reg8 <<< $signed((wire17 ?
                      wire5 : reg13)))) ^~ (reg16 == reg8));
  assign wire22 = reg10[(4'hd):(1'h0)];
  assign wire23 = {$unsigned(reg12)};
  assign wire24 = ($signed((wire3[(2'h3):(1'h1)] ?
                      $signed((8'hbf)) : (~$signed(wire17)))) && wire5);
  assign wire25 = $unsigned(wire19);
  assign wire26 = wire21;
  assign wire27 = wire18;
  assign wire28 = reg11;
  assign wire29 = (|(-({((8'hb1) ? (8'hbf) : wire28)} ?
                      $unsigned($unsigned(wire25)) : ((wire1 ? wire1 : wire21) ?
                          (reg11 > wire6) : (+reg12)))));
  always
    @(posedge clk) begin
      reg30 <= $unsigned({reg8[(4'hc):(3'h4)]});
      reg31 <= reg8;
      reg32 <= $signed(wire21);
      reg33 <= ($signed((~&wire22)) && ((wire20[(4'h8):(1'h1)] ?
              $signed(wire2[(3'h5):(2'h2)]) : $unsigned((~^wire27))) ?
          ($signed($unsigned(reg13)) >> wire0) : wire26));
    end
endmodule
