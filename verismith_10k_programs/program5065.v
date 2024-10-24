module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = (8'hbd);
  assign wire7 = $unsigned({({(wire2 ?
                             wire6 : wire5)} != (wire4[(3'h5):(3'h4)] ?
                         wire3[(4'hc):(2'h2)] : ((8'ha8) >>> (8'hae)))),
                     $signed($signed(((8'ha1) ? (8'hb9) : wire5)))});
  assign wire8 = $signed($signed((((wire3 ? (8'ha8) : wire6) ?
                         $unsigned(wire6) : (+wire3)) ?
                     $unsigned(wire4) : $signed((wire0 ? wire4 : (8'ha5))))));
  assign wire9 = wire7;
  assign wire10 = ($signed(((~|(wire2 && wire1)) > $unsigned($signed(wire0)))) + {(&{(~(8'hb9))})});
  assign wire11 = ((~^wire0[(2'h3):(1'h0)]) ? wire0 : (!wire8[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      reg12 <= ($signed($signed(wire5)) || $unsigned(($signed((wire9 ?
              wire8 : (7'h42))) ?
          (~|$unsigned(wire0)) : {{wire3}, (~wire1)})));
      reg13 <= wire5;
      reg14 <= (7'h42);
      reg15 <= (8'ha3);
      reg16 <= $signed(wire10);
    end
  assign wire17 = (&$unsigned($signed({(reg14 ? wire4 : wire4),
                      (wire7 ? reg12 : wire11)})));
  assign wire18 = wire7[(1'h1):(1'h1)];
  assign wire19 = ({{(wire11 ? (reg12 | wire8) : $signed(wire10))},
                          {$unsigned((wire2 <<< wire7)),
                              ($unsigned(wire6) * $signed(wire0))}} ?
                      wire2 : (reg16[(2'h2):(2'h2)] < (~$signed($signed(wire3)))));
  assign wire20 = ($signed(wire4[(2'h2):(2'h2)]) ?
                      $signed($signed(((8'h9c) ?
                          (~&wire0) : (wire19 ?
                              wire8 : wire1)))) : reg14[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg21 <= (((+$signed(wire11[(1'h0):(1'h0)])) ?
              wire18 : $unsigned(((wire6 && wire0) ?
                  (wire4 <<< reg15) : {wire8}))) ?
          $signed(reg12) : (~{$signed(wire5[(3'h4):(1'h1)])}));
      reg22 <= $unsigned(wire6);
      if ($signed(reg21))
        begin
          reg23 <= wire0;
          reg24 <= {wire19};
          if ($signed(($unsigned(wire8) && (reg24 ?
              {wire17[(4'hc):(3'h7)], $unsigned(reg23)} : (((8'ha6) && wire4) ?
                  (wire11 + wire4) : {(8'ha4), (8'hb0)})))))
            begin
              reg25 <= wire10;
              reg26 <= $unsigned($unsigned((((wire17 ? wire5 : wire6) ?
                  wire17[(5'h10):(2'h2)] : wire10[(3'h6):(3'h4)]) >>> ($unsigned(reg13) >= ((7'h43) > wire19)))));
              reg27 <= (~&((-$unsigned((reg13 ? wire4 : reg14))) ?
                  $unsigned($signed((&wire2))) : ($unsigned((-wire4)) ?
                      $unsigned({reg26, wire10}) : (-reg15))));
              reg28 <= $unsigned(reg27);
            end
          else
            begin
              reg25 <= reg16;
              reg26 <= $signed($unsigned($signed(($unsigned(reg13) | $unsigned((8'hbf))))));
              reg27 <= (+reg24[(4'ha):(2'h2)]);
            end
          reg29 <= reg26;
          if (reg27)
            begin
              reg30 <= $signed($unsigned((~^((~(8'ha8)) ?
                  {(8'had), wire1} : (reg12 > wire2)))));
              reg31 <= (~(($unsigned((reg24 ^~ (8'ha7))) ?
                  reg16[(3'h5):(1'h0)] : wire11) << reg29));
              reg32 <= ((|($signed((-wire8)) ?
                      ((|wire20) <= (-reg23)) : (|$unsigned(wire7)))) ?
                  $unsigned((((reg31 - reg13) > (wire18 ?
                      reg31 : reg31)) > (8'ha3))) : wire9);
              reg33 <= (~^$signed({(~^(reg13 == reg13))}));
            end
          else
            begin
              reg30 <= reg21[(1'h1):(1'h1)];
              reg31 <= $unsigned(reg33[(3'h4):(2'h3)]);
              reg32 <= ((((((8'hbc) ? wire5 : reg32) != (wire20 != (8'hb6))) ?
                      ((reg33 ?
                          (8'h9d) : wire6) * $unsigned((8'hb5))) : $signed((reg27 ?
                          reg33 : wire0))) ?
                  (~&reg14) : $unsigned(reg22[(5'h11):(4'he)])) && reg27[(4'hb):(4'hb)]);
              reg33 <= $signed((+reg32[(4'hd):(4'hb)]));
            end
        end
      else
        begin
          reg23 <= $signed($signed(($signed(reg25) ?
              (reg31[(3'h7):(1'h1)] == $signed(reg14)) : ({wire4} ?
                  (reg15 ? reg14 : wire18) : wire17[(4'ha):(4'h9)]))));
          reg24 <= reg22[(4'ha):(2'h2)];
          reg25 <= $signed(wire2[(2'h2):(1'h1)]);
        end
      if ($unsigned(({$signed(reg26)} ?
          wire11[(3'h7):(1'h1)] : $unsigned(reg16[(3'h5):(3'h4)]))))
        begin
          reg34 <= wire0;
          reg35 <= wire4[(5'h15):(3'h7)];
          reg36 <= $signed($signed((wire9 * $signed((reg29 ~^ (8'hb0))))));
        end
      else
        begin
          reg34 <= $unsigned($signed(($unsigned(reg28[(4'h8):(2'h2)]) + ($unsigned(reg33) ?
              $signed(reg15) : wire7[(1'h1):(1'h1)]))));
          reg35 <= ({(reg16 ?
                  (~reg22[(3'h4):(1'h0)]) : $unsigned((reg27 ? wire4 : reg16))),
              (((~reg32) ? reg34 : wire7) ?
                  ((~|wire6) ?
                      (reg16 && wire5) : (wire10 + reg33)) : $unsigned((wire11 ?
                      wire3 : wire11)))} ~^ wire17[(4'hc):(1'h1)]);
        end
      if ($unsigned((((^(&wire18)) ?
              wire2 : (wire20[(2'h3):(2'h3)] * wire4[(5'h10):(3'h4)])) ?
          reg25[(3'h5):(3'h4)] : (~(reg12 - {reg16, (8'hb1)})))))
        begin
          reg37 <= $signed((~($unsigned((+reg27)) ?
              reg33[(4'h8):(1'h0)] : (~$unsigned((8'hac))))));
          if (($signed(($signed((reg23 ? reg31 : reg23)) ?
                  $signed($signed(wire18)) : $signed((^reg28)))) ?
              $unsigned(wire8[(3'h4):(2'h2)]) : ((|(~&wire20[(1'h1):(1'h0)])) ?
                  $unsigned(((~(7'h42)) && wire6[(4'hc):(4'hc)])) : (|$signed(reg37[(2'h2):(2'h2)])))))
            begin
              reg38 <= $signed((reg33 >>> $signed($signed(((8'hb0) > wire9)))));
              reg39 <= $unsigned((-$unsigned(($unsigned(wire4) == wire18[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg38 <= $signed(((((+reg37) > $signed(wire3)) > ((&(8'hb6)) ?
                  $signed((8'ha4)) : (reg23 <= reg22))) << (!$unsigned($unsigned(reg38)))));
              reg39 <= $signed(($unsigned($unsigned((reg12 ?
                  (8'hbd) : wire4))) - reg37));
            end
          reg40 <= reg38[(3'h5):(3'h5)];
        end
      else
        begin
          reg37 <= $unsigned(reg25[(1'h1):(1'h0)]);
          reg38 <= wire20[(2'h3):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      reg41 <= wire8[(2'h2):(1'h1)];
      if ($signed(reg12[(3'h5):(2'h3)]))
        begin
          reg42 <= wire0;
        end
      else
        begin
          if (($unsigned($unsigned((^(^~reg27)))) ? (+(~&wire11)) : (8'hae)))
            begin
              reg42 <= {reg35};
            end
          else
            begin
              reg42 <= ((reg31[(4'hb):(4'h9)] ^ {reg14,
                  ((reg25 ? reg37 : reg15) ~^ reg23)}) | (+wire11));
              reg43 <= wire20;
            end
          reg44 <= (+wire11);
        end
      reg45 <= (~^$signed(((~reg14) == (reg31 && $unsigned(reg13)))));
      reg46 <= $signed(wire17[(4'hf):(2'h3)]);
    end
endmodule
