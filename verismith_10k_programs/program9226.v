module top
#(parameter param35 = ({(|(((8'hb1) ? (8'haf) : (8'hbe)) ? ((7'h43) ? (8'ha9) : (8'hb3)) : ((8'hab) ~^ (7'h40)))), (((-(8'hab)) + (+(8'hb2))) ? ({(8'hb1)} ? (~(8'hab)) : (~&(8'had))) : {((8'ha8) | (8'had)), (~^(8'hb9))})} | (^(~({(8'hb2)} ? {(8'ha0)} : ((8'hae) ? (8'hb5) : (8'ha4)))))), 
parameter param36 = (((~((param35 ? param35 : (8'hac)) <= {param35, param35})) >>> (~((+param35) ? (|param35) : param35))) ? (|(8'haf)) : ((~&(&(~^param35))) ? (^param35) : (((param35 ? param35 : param35) < param35) ? (~(param35 ? param35 : (8'ha0))) : (param35 < (param35 ? param35 : param35))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
                 wire4,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
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
                 reg6,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire4[(5'h10):(4'hf)];
  always
    @(posedge clk) begin
      if ((~^($signed(((wire5 & wire4) ?
          $unsigned((8'had)) : wire4)) + (wire5[(1'h1):(1'h1)] ?
          $unsigned($signed((7'h41))) : $unsigned($unsigned(wire2))))))
        begin
          if (wire2)
            begin
              reg6 <= (wire2[(4'ha):(2'h2)] + $signed($signed($unsigned(wire5[(3'h4):(1'h0)]))));
              reg7 <= ($unsigned($unsigned(reg6)) == $signed({$unsigned((^~wire5))}));
              reg8 <= wire1[(4'h8):(1'h1)];
              reg9 <= wire2;
            end
          else
            begin
              reg6 <= $signed({((^(^~(8'hbd))) ?
                      $signed($unsigned(wire2)) : ((~^reg8) ?
                          $unsigned(wire1) : (~|reg6)))});
              reg7 <= $signed(reg7);
            end
          reg10 <= ((reg6 + (wire5 ?
              reg8[(4'h9):(4'h8)] : $unsigned(wire3[(3'h5):(1'h0)]))) <= reg6);
        end
      else
        begin
          if (wire1[(5'h10):(4'ha)])
            begin
              reg6 <= wire5;
            end
          else
            begin
              reg6 <= $signed({$signed(wire2[(2'h3):(2'h3)])});
              reg7 <= wire1[(3'h6):(3'h5)];
              reg8 <= $unsigned($unsigned((((wire0 << (8'hbe)) * wire5) ?
                  (wire5 ? (8'ha0) : $unsigned(reg8)) : wire2)));
              reg9 <= $unsigned($unsigned($signed($unsigned((~&(8'hb7))))));
              reg10 <= wire4;
            end
        end
      if ((wire4 ?
          ($unsigned(wire2) ~^ ((8'ha7) | ($unsigned(wire0) ?
              $unsigned(wire5) : ((7'h40) ?
                  (7'h40) : reg10)))) : reg6[(3'h6):(3'h6)]))
        begin
          reg11 <= (-reg7);
          reg12 <= $unsigned(({(((8'hab) != wire5) ? reg10 : (|wire4)),
              {wire3[(3'h7):(2'h3)]}} >>> wire3[(3'h4):(1'h1)]));
          reg13 <= ((reg8[(4'h9):(2'h3)] ~^ $signed((~((8'ha1) ?
                  wire2 : reg11)))) ?
              {$unsigned(reg10[(3'h6):(3'h5)])} : (~&reg6[(4'hd):(3'h6)]));
          reg14 <= $signed((wire1 || (7'h43)));
          reg15 <= reg8[(4'h9):(2'h2)];
        end
      else
        begin
          if (wire2[(4'he):(4'hb)])
            begin
              reg11 <= reg9;
              reg12 <= reg13[(3'h6):(2'h3)];
              reg13 <= wire2;
              reg14 <= {wire4[(4'hd):(3'h7)],
                  $unsigned((reg12 >> ((reg10 ? (8'h9e) : wire1) & wire3)))};
            end
          else
            begin
              reg11 <= {reg6[(1'h0):(1'h0)],
                  ((8'hbf) ? $signed(wire3[(2'h2):(2'h2)]) : $signed(reg12))};
              reg12 <= $unsigned((((8'h9c) ?
                  {$signed(reg11),
                      (reg13 & (8'hbf))} : reg11[(5'h12):(5'h11)]) == $unsigned({{reg14}})));
              reg13 <= (~((($signed(reg13) | wire1[(1'h1):(1'h1)]) ?
                      (wire3 ~^ $signed((8'ha4))) : reg9) ?
                  reg6[(4'h8):(3'h5)] : (~^$unsigned((reg8 < reg9)))));
            end
          reg15 <= $signed($unsigned(($unsigned($signed(reg10)) == $signed($signed(reg7)))));
        end
      reg16 <= {(reg15[(2'h3):(1'h0)] ?
              ((^reg9[(2'h2):(1'h1)]) ?
                  wire0[(3'h6):(2'h3)] : $unsigned(wire0)) : ((reg13[(4'hc):(4'hc)] ?
                      (reg15 ? wire5 : wire0) : $unsigned(wire4)) ?
                  ((wire0 > (7'h40)) & (&wire5)) : reg12))};
    end
  assign wire17 = ((wire2[(4'hb):(4'hb)] ^~ $unsigned((|wire3[(4'h8):(1'h0)]))) + ($signed((reg12 | reg14[(3'h6):(3'h5)])) || (wire0 ?
                      $unsigned(reg6) : wire5)));
  assign wire18 = reg16[(5'h12):(4'h8)];
  assign wire19 = $unsigned(({reg15} ? {$unsigned(reg14)} : $signed((8'ha7))));
  assign wire20 = reg14[(5'h13):(4'h8)];
  assign wire21 = (~$signed(((|(~^reg11)) ? (8'hba) : (8'haa))));
  assign wire22 = wire3[(2'h3):(2'h3)];
  assign wire23 = (reg16 <= reg15[(2'h3):(1'h1)]);
  assign wire24 = $signed({$unsigned($unsigned({reg8}))});
  assign wire25 = reg13[(5'h12):(5'h10)];
  always
    @(posedge clk) begin
      reg26 <= {(~|(wire4[(2'h3):(2'h3)] <= $unsigned(wire21[(5'h15):(4'hf)])))};
      reg27 <= {wire25[(2'h3):(2'h3)]};
    end
  assign wire28 = (^wire25);
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned({{reg13, reg7}, $unsigned(reg8)}))))
        begin
          reg29 <= $signed((^wire20[(2'h2):(1'h0)]));
          if (((8'hb0) * ((($signed(reg11) ?
                      ((8'ha5) || wire5) : (wire28 >>> reg14)) ?
                  ($unsigned((8'hb6)) - (reg26 != wire3)) : reg7[(3'h6):(2'h3)]) ?
              (({reg8,
                  wire17} > reg9) >= (~^((8'ha8) ^ wire25))) : $signed((~&wire25[(3'h5):(1'h0)])))))
            begin
              reg30 <= $signed(({(~wire20[(5'h13):(3'h7)]),
                      $unsigned($signed(wire5))} ?
                  (!{(reg8 ?
                          reg29 : wire1)}) : $unsigned($unsigned((reg27 || (8'hbf))))));
              reg31 <= $unsigned(wire2);
              reg32 <= (reg8 ?
                  $signed($unsigned(wire21)) : ({reg6[(2'h2):(1'h1)]} < (wire4 ?
                      $unsigned(reg15) : wire23[(4'hf):(4'hb)])));
              reg33 <= (wire5 ?
                  wire18[(2'h3):(1'h0)] : {$unsigned($unsigned($unsigned(wire2)))});
            end
          else
            begin
              reg30 <= ((!$signed($unsigned(wire25))) ?
                  (((~^(~&wire23)) ?
                          (reg7 ?
                              (reg15 ^~ reg13) : (reg33 ?
                                  wire20 : wire4)) : ((wire22 ?
                              (8'ha5) : wire0) << (reg26 ? wire28 : reg15))) ?
                      {wire28[(1'h0):(1'h0)],
                          wire17[(4'hb):(3'h7)]} : {(reg16 ^~ wire25)}) : $unsigned(wire19));
              reg31 <= ((^~$unsigned(((~wire5) + $signed(wire24)))) <<< (reg30 != wire24[(3'h4):(2'h2)]));
            end
          reg34 <= reg10;
        end
      else
        begin
          reg29 <= wire18;
          reg30 <= ((wire17[(2'h2):(2'h2)] ?
              ((~(~reg15)) * (8'haf)) : $signed({(reg11 != reg13),
                  (!(8'hb6))})) > reg7);
          reg31 <= (~^reg13[(5'h11):(3'h7)]);
          reg32 <= (8'h9d);
        end
    end
endmodule
