module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire24,
                 wire23,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
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
                 reg22,
                 reg21,
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
  assign wire5 = ((~&$signed(($signed(wire3) ? wire1[(4'h8):(3'h4)] : wire0))) ?
                     (!{{(^~wire4),
                             $signed(wire1)}}) : ($unsigned({(wire2 >>> wire0)}) >> wire0));
  assign wire6 = (-wire1);
  always
    @(posedge clk) begin
      reg7 <= (|(8'h9c));
      reg8 <= $signed($unsigned(({(wire1 ? reg7 : wire0), reg7} ?
          $unsigned($signed(wire3)) : $signed((wire6 ~^ wire6)))));
      reg9 <= (|($signed($unsigned(wire4)) * wire2));
      if ($signed({(wire5 ? reg8 : reg9[(2'h3):(1'h1)]),
          {({(8'hbc), wire5} ? wire5[(3'h4):(1'h1)] : wire5)}}))
        begin
          if (reg7)
            begin
              reg10 <= wire3;
              reg11 <= {reg10};
              reg12 <= (-$signed((wire2 ? (~^(reg9 <= wire2)) : wire6)));
              reg13 <= wire5[(1'h0):(1'h0)];
            end
          else
            begin
              reg10 <= $unsigned($unsigned((~^(&wire2[(1'h0):(1'h0)]))));
              reg11 <= $signed($signed($signed(wire1[(3'h7):(3'h7)])));
              reg12 <= ((reg12[(4'hb):(4'ha)] ?
                      reg8 : $signed(((reg10 ? reg13 : reg9) << (+wire1)))) ?
                  {$signed($unsigned({wire3, reg9}))} : reg11[(4'h9):(3'h4)]);
              reg13 <= $unsigned((wire6[(3'h4):(1'h0)] ?
                  (wire6 <<< $unsigned((reg13 && reg10))) : (~^($unsigned(wire4) <<< wire1[(4'h8):(3'h6)]))));
            end
          if ((~&wire6))
            begin
              reg14 <= $signed((~|((wire3 ?
                      (wire2 ? reg12 : wire5) : {wire0, reg10}) ?
                  ($signed(reg9) >= {wire1}) : $signed(((8'h9c) <= wire4)))));
            end
          else
            begin
              reg14 <= wire1[(3'h6):(1'h1)];
              reg15 <= $signed(((^reg13) ?
                  (wire6 ^ wire5[(3'h5):(3'h4)]) : $signed((~^(!wire1)))));
              reg16 <= reg13;
            end
        end
      else
        begin
          if (($unsigned((^({reg8, reg12} ?
              $unsigned(reg7) : (7'h42)))) != (~&((~&(wire1 <= reg14)) ?
              reg10[(1'h1):(1'h0)] : wire5[(1'h0):(1'h0)]))))
            begin
              reg10 <= wire4[(3'h7):(2'h3)];
              reg11 <= (^(~^{reg10,
                  ((wire2 ? reg16 : wire5) && (wire6 ? reg7 : wire3))}));
            end
          else
            begin
              reg10 <= wire2;
              reg11 <= wire4[(3'h4):(1'h0)];
              reg12 <= (~&reg14);
            end
          reg13 <= (reg13 - reg14[(5'h15):(4'he)]);
          reg14 <= reg12;
          reg15 <= $unsigned({{$signed(reg9)},
              $signed(($signed(reg11) < (wire6 ? reg14 : reg10)))});
        end
    end
  assign wire17 = $unsigned(((wire2[(3'h4):(2'h2)] && ((wire6 && (8'hb5)) ?
                          $unsigned(wire5) : {reg13, reg8})) ?
                      ($unsigned({wire3}) ?
                          reg14 : ($signed(reg9) ?
                              reg12[(4'h8):(3'h5)] : $signed(reg8))) : reg13[(1'h1):(1'h1)]));
  assign wire18 = reg11[(2'h3):(2'h3)];
  assign wire19 = wire2;
  assign wire20 = ((reg14[(5'h14):(2'h3)] ?
                      ((reg7 ?
                          (^reg8) : wire0) || (~^$signed(reg11))) : {$unsigned((~&wire17))}) != $signed((((8'hb5) || wire17) >> $signed(wire18))));
  always
    @(posedge clk) begin
      reg21 <= (|$unsigned((((reg10 ^ reg16) >>> (&reg14)) ?
          ((-reg16) ? (&reg12) : (-(8'ha9))) : (reg7[(2'h2):(1'h1)] ?
              wire1 : (reg7 > wire5)))));
      reg22 <= $signed($signed(((((8'hae) - reg8) & (reg16 ?
          reg12 : (8'hbc))) + wire18[(3'h5):(1'h1)])));
    end
  assign wire23 = (7'h44);
  assign wire24 = $signed(reg12);
  always
    @(posedge clk) begin
      reg25 <= $signed(({(reg11 ? (8'hac) : reg22), reg13} ?
          wire0 : $unsigned(((^reg8) ~^ reg15[(3'h4):(2'h3)]))));
      if (((reg11 ?
          ((wire19 && wire24[(1'h1):(1'h0)]) ?
              $signed((-wire18)) : reg9[(2'h3):(2'h2)]) : $signed($signed($unsigned(wire0)))) >> ((!(&(reg12 << (8'hb4)))) * {$unsigned(wire1),
          (|((8'ha7) ? wire3 : reg21))})))
        begin
          reg26 <= reg14[(2'h2):(2'h2)];
          reg27 <= reg7[(3'h7):(3'h4)];
        end
      else
        begin
          if ((~$unsigned(({(~^wire6), (wire20 <= reg21)} & {(~|(8'haf))}))))
            begin
              reg26 <= reg8;
              reg27 <= ((wire23[(3'h4):(2'h3)] ?
                      {((wire0 || reg10) ? {reg25} : $unsigned(reg7)),
                          (wire18[(3'h4):(1'h1)] > reg7[(4'h8):(1'h0)])} : (((reg8 ?
                          wire0 : wire1) ~^ $signed((7'h43))) <<< $unsigned($unsigned(reg9)))) ?
                  $unsigned({(-wire20),
                      $signed($unsigned(reg9))}) : $signed(($signed({(8'hb0)}) >= reg21)));
              reg28 <= wire17;
            end
          else
            begin
              reg26 <= (|$signed({$signed({wire17, reg9}),
                  $unsigned((~&reg13))}));
              reg27 <= (wire20 <= reg15);
              reg28 <= ((({$unsigned(reg26)} != $unsigned(((8'hbd) == reg9))) ?
                  $signed($signed(reg9)) : $signed((|$signed((7'h44))))) <<< wire5[(3'h6):(2'h3)]);
            end
          if ({($signed({$signed(wire3)}) ~^ {(~^$signed(reg21))})})
            begin
              reg29 <= $signed($signed($signed((~&((8'h9f) ? wire5 : reg21)))));
              reg30 <= (^reg26[(2'h3):(1'h0)]);
              reg31 <= $signed($signed(reg15));
              reg32 <= wire5;
              reg33 <= (+wire1);
            end
          else
            begin
              reg29 <= (+($signed($signed((8'ha4))) ~^ $unsigned(($signed(reg26) ?
                  (reg16 ? (8'hb4) : (8'hbf)) : $unsigned(reg12)))));
              reg30 <= (+$signed(reg28[(3'h4):(2'h2)]));
              reg31 <= (^~$signed(($unsigned(wire19) >>> ((reg29 < (8'haa)) ?
                  wire3[(3'h6):(2'h3)] : reg25[(2'h3):(1'h1)]))));
              reg32 <= $unsigned($unsigned((8'hb3)));
            end
        end
      reg34 <= reg28[(3'h6):(3'h5)];
      reg35 <= $unsigned((8'ha8));
    end
  assign wire36 = reg13[(3'h5):(2'h3)];
  assign wire37 = ((((reg27 >= (reg31 ? wire2 : wire5)) ?
                          reg29 : (8'ha4)) <<< (~&reg10[(1'h1):(1'h0)])) ?
                      (($signed((reg16 ? reg10 : reg28)) << ((reg25 <= wire2) ?
                          reg27[(4'h8):(3'h7)] : $unsigned(reg12))) * {(8'hb2),
                          reg27[(1'h0):(1'h0)]}) : reg10[(1'h0):(1'h0)]);
  assign wire38 = $unsigned(($unsigned(((reg25 ? reg9 : reg33) || (+reg27))) ?
                      (!reg28[(1'h0):(1'h0)]) : reg10));
endmodule
