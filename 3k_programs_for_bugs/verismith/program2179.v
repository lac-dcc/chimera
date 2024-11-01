module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire3;
  assign wire7 = (wire0 >>> {(wire6[(1'h0):(1'h0)] ?
                         {$unsigned(wire1),
                             (wire2 || wire5)} : $unsigned((|wire5))),
                     (~&wire5[(4'hd):(2'h2)])});
  assign wire8 = ($unsigned($signed(wire0[(2'h2):(1'h0)])) << ($signed(((~wire1) >= (~wire3))) ?
                     ($unsigned((wire2 ? wire3 : wire0)) ?
                         ((~&(8'hab)) ?
                             $unsigned(wire4) : (wire6 ?
                                 wire0 : (8'ha8))) : ($unsigned(wire3) ?
                             (!wire1) : wire7)) : (8'hb2)));
  always
    @(posedge clk) begin
      reg9 <= (+$signed(($unsigned($signed(wire0)) ? (^~(+wire6)) : (8'hb2))));
      if (($unsigned($signed(({wire0} >>> $signed(wire6)))) <<< (|(($unsigned(wire2) * wire8) ?
          {$unsigned(reg9)} : wire2[(3'h6):(1'h0)]))))
        begin
          if ((wire4 ? $unsigned(wire8) : wire0))
            begin
              reg10 <= reg9[(1'h0):(1'h0)];
              reg11 <= $signed((wire7[(1'h0):(1'h0)] == wire2[(3'h5):(1'h0)]));
              reg12 <= ($unsigned(((~(wire7 >= wire8)) ?
                      $signed(wire5) : ((reg10 >>> reg9) ?
                          $unsigned(wire0) : (!wire8)))) ?
                  wire7 : (^~(8'hac)));
              reg13 <= ((^~(8'hbd)) >> wire1);
              reg14 <= $unsigned($signed((($unsigned(reg13) ?
                      wire3[(2'h2):(1'h0)] : (reg12 ? wire3 : wire6)) ?
                  $signed(wire5) : reg9)));
            end
          else
            begin
              reg10 <= wire2[(3'h6):(1'h1)];
              reg11 <= (8'hae);
              reg12 <= $signed(({wire4[(2'h2):(1'h1)],
                      $unsigned((reg10 ? wire6 : wire4))} ?
                  $unsigned($signed(wire0)) : ($unsigned((7'h41)) ?
                      (~&$signed(wire3)) : wire0[(1'h0):(1'h0)])));
              reg13 <= wire3[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg10 <= (8'ha9);
          reg11 <= {((-($unsigned(wire1) >= (reg13 ?
                  reg11 : wire7))) ~^ ((reg14 ?
                      $signed(wire3) : $unsigned(reg10)) ?
                  $unsigned((wire8 ? reg13 : wire5)) : (~|reg13)))};
          if (wire1[(4'ha):(2'h2)])
            begin
              reg12 <= wire8[(2'h3):(1'h1)];
              reg13 <= ((&(reg14[(3'h7):(1'h0)] & wire1)) ?
                  wire5[(2'h3):(2'h3)] : {($unsigned(((8'hab) + reg14)) | wire4)});
              reg14 <= wire3[(1'h1):(1'h1)];
              reg15 <= $unsigned({$signed({(&wire1), (reg10 ^ wire4)}), reg14});
            end
          else
            begin
              reg12 <= (&$unsigned(wire5[(3'h6):(3'h5)]));
              reg13 <= (wire4 == reg14[(3'h5):(3'h5)]);
              reg14 <= $unsigned($signed($unsigned((-(^reg9)))));
              reg15 <= $unsigned(({$unsigned(wire5)} ?
                  (($signed((8'hb7)) ~^ $signed(wire4)) ?
                      $signed($signed(wire7)) : (8'h9f)) : reg11));
            end
        end
      reg16 <= $unsigned(reg15[(1'h1):(1'h0)]);
    end
  assign wire17 = $unsigned(reg11);
  assign wire18 = $unsigned(($unsigned(wire1) >= reg10));
  assign wire19 = (reg15 >>> (8'hb7));
  always
    @(posedge clk) begin
      reg20 <= {reg14[(3'h6):(3'h6)], (8'ha2)};
    end
  assign wire21 = wire8;
  assign wire22 = reg14;
  assign wire23 = reg20;
  assign wire24 = reg11[(1'h0):(1'h0)];
  assign wire25 = wire18[(5'h11):(3'h7)];
  always
    @(posedge clk) begin
      reg26 <= $signed({wire19, (wire0[(2'h2):(2'h2)] ^ (~(-(8'haf))))});
      if (wire4)
        begin
          if (({(^~($signed((8'h9d)) ?
                  (wire18 ?
                      (8'hbd) : reg9) : $unsigned(reg12)))} ~^ ((^~reg9) <= (~$unsigned((reg13 ?
              reg11 : wire17))))))
            begin
              reg27 <= wire4;
              reg28 <= reg10[(2'h2):(1'h1)];
              reg29 <= wire4;
            end
          else
            begin
              reg27 <= wire1;
              reg28 <= $signed((7'h40));
            end
          reg30 <= {((reg16 & wire18[(4'he):(4'hc)]) ?
                  $signed((&wire2[(1'h0):(1'h0)])) : $signed({{wire25},
                      (wire18 ? wire22 : reg28)}))};
          reg31 <= (((~|(wire8[(5'h10):(4'h9)] <<< {reg29,
              wire19})) != reg20[(1'h0):(1'h0)]) * (|wire0[(1'h0):(1'h0)]));
          reg32 <= $signed({{$unsigned({reg30, wire1}),
                  ((&wire0) ? (wire3 + wire0) : {wire0, reg26})},
              (+{(^wire0)})});
        end
      else
        begin
          reg27 <= (((-wire21) ?
              (wire3[(1'h1):(1'h1)] ?
                  $unsigned(((8'ha1) ?
                      wire4 : (8'hac))) : $signed(reg29[(1'h1):(1'h1)])) : $signed($unsigned((wire24 == wire8)))) == reg9);
        end
      reg33 <= reg20;
    end
  assign wire34 = (8'ha9);
  assign wire35 = $unsigned((-(~^reg11)));
  assign wire36 = (~|wire24);
  assign wire37 = (~|wire34);
  always
    @(posedge clk) begin
      if ($signed(wire0[(2'h3):(2'h2)]))
        begin
          reg38 <= ((8'ha7) ?
              ({(8'ha7), (^~(wire23 ? wire0 : wire0))} ?
                  wire37 : $unsigned($signed({wire25,
                      wire1}))) : $unsigned(wire5));
          reg39 <= wire4[(1'h0):(1'h0)];
          if ($unsigned(reg28))
            begin
              reg40 <= ((wire2[(3'h4):(1'h1)] ?
                      ($signed((wire23 ^ reg27)) <= $signed(wire21[(2'h2):(1'h0)])) : wire36[(4'h8):(3'h6)]) ?
                  ((~&(~|(reg12 <<< (8'ha3)))) ?
                      {reg16, $signed(wire35[(2'h3):(1'h1)])} : (((wire2 ?
                                  wire17 : reg29) ?
                              $unsigned(reg27) : $signed(wire34)) ?
                          $signed({wire17}) : $signed($signed(reg26)))) : $signed($unsigned(reg15[(3'h4):(3'h4)])));
              reg41 <= wire19[(2'h2):(1'h1)];
              reg42 <= reg12[(4'h8):(3'h4)];
            end
          else
            begin
              reg40 <= reg16[(3'h4):(1'h0)];
            end
        end
      else
        begin
          reg38 <= ($signed(reg39[(4'hc):(4'ha)]) ?
              $signed($unsigned($signed((reg41 ? (8'hb4) : wire21)))) : (wire4 ?
                  (^reg13) : ($signed((wire24 & (7'h40))) ?
                      $signed({wire7, wire19}) : ((reg15 ?
                          reg29 : wire2) == (8'ha1)))));
          reg39 <= {{(~^$unsigned($unsigned(wire18)))},
              {(-wire36), (^~wire21)}};
          reg40 <= wire2[(4'hb):(3'h7)];
          reg41 <= wire4[(3'h5):(3'h5)];
          reg42 <= ((((wire5[(2'h2):(1'h0)] ?
                      wire19[(1'h1):(1'h0)] : $signed(reg42)) << {$unsigned((8'hb4)),
                      ((7'h42) ? wire21 : (8'hac))}) ?
                  ((^reg32) ?
                      (|reg26) : (wire25 + reg29)) : (reg12[(5'h11):(4'h9)] - $unsigned(wire2))) ?
              $unsigned(reg12[(3'h6):(2'h3)]) : ($unsigned(wire22) * $signed(((wire18 - reg31) - (reg26 > wire35)))));
        end
      reg43 <= reg38[(3'h5):(3'h5)];
      reg44 <= ($signed($unsigned({(wire1 ? (8'hbd) : wire36),
              reg28[(2'h2):(1'h0)]})) ?
          reg43 : $unsigned(reg16[(4'he):(4'h9)]));
      reg45 <= ($unsigned((8'hbd)) & (^~reg11));
    end
endmodule
