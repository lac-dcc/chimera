module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
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
                 reg6,
                 (1'h0)};
  assign wire5 = (^((!wire3[(2'h2):(1'h1)]) >= (wire4 >>> ($unsigned(wire3) ?
                     (-wire0) : (+wire2)))));
  always
    @(posedge clk) begin
      reg6 <= wire1;
    end
  assign wire7 = (~wire5);
  assign wire8 = $signed((~$unsigned(((|wire7) ?
                     wire5 : wire4[(2'h2):(1'h0)]))));
  assign wire9 = wire3[(3'h7):(2'h2)];
  assign wire10 = $signed($unsigned({wire2}));
  always
    @(posedge clk) begin
      reg11 <= {wire7, $signed(wire9)};
      reg12 <= wire10;
      reg13 <= $signed($signed((~|$unsigned($signed(wire3)))));
      if ((($unsigned(reg12[(3'h4):(2'h2)]) ?
              wire4[(2'h2):(1'h0)] : ((8'hb8) ^~ ($signed(wire5) ?
                  $unsigned(reg6) : (wire8 <= wire10)))) ?
          $unsigned($signed((+(wire9 ?
              reg11 : wire0)))) : (({(reg11 & wire1)} ^ {wire0}) ?
              reg11[(3'h5):(2'h3)] : wire3)))
        begin
          if (wire4)
            begin
              reg14 <= {((wire5[(4'hc):(1'h1)] && $unsigned({wire8})) ?
                      $unsigned({{wire1, (8'hb8)}}) : (({wire4} ?
                              wire8[(3'h5):(2'h3)] : reg13) ?
                          reg6[(4'he):(4'hd)] : wire9)),
                  (~&wire4[(3'h7):(3'h6)])};
              reg15 <= $unsigned($signed((wire7 ?
                  (wire3 || reg14) : (^~$signed(wire1)))));
              reg16 <= $signed((~^{$unsigned({reg6}), $unsigned(wire10)}));
              reg17 <= wire4[(2'h3):(2'h3)];
            end
          else
            begin
              reg14 <= (reg12 ? (~&reg15[(1'h0):(1'h0)]) : reg17);
              reg15 <= {(wire10 ?
                      (((~reg16) < reg13[(2'h3):(2'h2)]) * reg12[(3'h7):(3'h4)]) : ($signed($unsigned((8'hab))) > reg11[(2'h2):(1'h1)])),
                  (!(reg15[(1'h1):(1'h0)] ?
                      (8'had) : (reg12[(5'h11):(4'hf)] ?
                          (&reg12) : (^(8'ha1)))))};
              reg16 <= ((^({wire1} | {(wire0 <<< wire1),
                      (wire0 ? reg17 : wire1)})) ?
                  (8'hbe) : (((!wire8) ?
                          (wire8 ?
                              $signed(reg13) : (wire8 ?
                                  wire10 : wire7)) : $unsigned((wire5 >> reg14))) ?
                      ((reg14[(4'hb):(3'h6)] ^ $unsigned((8'had))) && reg17) : $unsigned((^(wire8 || reg6)))));
              reg17 <= $signed(($unsigned((+$unsigned(wire9))) ?
                  reg15[(1'h1):(1'h1)] : {wire4}));
            end
          reg18 <= ((^reg14[(4'h8):(2'h3)]) ?
              (((!$signed(reg11)) && {$signed(wire10), $signed((8'ha0))}) ?
                  ($unsigned((wire4 ^ (8'h9d))) ?
                      $signed((8'h9c)) : reg17) : $unsigned(wire9[(5'h10):(3'h7)])) : (+$signed($signed((~^reg16)))));
          reg19 <= (!($signed($unsigned($signed(wire3))) ?
              (-((reg18 << wire7) ?
                  $unsigned(reg15) : (reg13 >= wire4))) : ($unsigned((wire4 ?
                      (8'hbc) : (8'hb7))) ?
                  {(+reg11),
                      (wire0 << (8'hb9))} : $signed(reg13[(2'h2):(1'h1)]))));
          reg20 <= $unsigned(reg17[(3'h4):(2'h2)]);
        end
      else
        begin
          if ((~|(reg14 ?
              $signed($signed((&reg11))) : $unsigned($unsigned((8'ha0))))))
            begin
              reg14 <= $signed(({reg18} ?
                  ($unsigned({wire9}) <= reg11[(1'h1):(1'h1)]) : ($signed({wire10}) ?
                      ((reg20 >> reg12) + (|reg12)) : ((~wire7) << {wire5}))));
              reg15 <= {(|$signed({(~|reg17)})),
                  $unsigned({$signed($unsigned(reg13)), wire0})};
              reg16 <= (wire8[(1'h1):(1'h1)] || wire9);
              reg17 <= reg20[(5'h12):(3'h7)];
            end
          else
            begin
              reg14 <= reg12[(4'h9):(1'h1)];
              reg15 <= ({($unsigned((~^reg20)) ?
                          {reg19[(4'hc):(2'h2)],
                              reg11[(3'h4):(1'h0)]} : $unsigned(((8'h9f) << reg16)))} ?
                  wire1 : reg6[(4'ha):(4'h8)]);
            end
        end
    end
endmodule
