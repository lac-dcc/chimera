module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg20,
                 reg19,
                 reg12,
                 reg11,
                 reg8,
                 (1'h0)};
  assign wire5 = wire1[(3'h5):(1'h0)];
  assign wire6 = {(($unsigned(wire4[(3'h4):(3'h4)]) > wire3[(4'hb):(2'h2)]) <<< (~&wire5)),
                     ((~^$unsigned(wire0[(3'h6):(3'h6)])) - {(wire0 ?
                             $unsigned((8'ha8)) : (wire2 ? wire5 : wire4))})};
  assign wire7 = $signed(($unsigned({$signed(wire0), (~wire5)}) ?
                     (wire5[(2'h2):(1'h0)] ?
                         wire4 : $signed(wire6[(1'h0):(1'h0)])) : $signed({$unsigned(wire3),
                         (8'hbc)})));
  always
    @(posedge clk) begin
      reg8 <= ((wire0[(3'h4):(3'h4)] == (&$signed($unsigned(wire4)))) << (-wire3));
    end
  assign wire9 = (&wire3);
  assign wire10 = wire1;
  always
    @(posedge clk) begin
      reg11 <= ((^~wire7) <= (reg8 || $signed(((wire1 ?
          wire4 : wire3) * reg8[(2'h3):(2'h3)]))));
      reg12 <= wire4;
    end
  assign wire13 = ($unsigned((wire10 ?
                      wire7 : $signed(reg12))) >= reg12[(4'hc):(3'h4)]);
  assign wire14 = $unsigned($unsigned(((~|(+(8'hab))) >= wire7)));
  assign wire15 = $unsigned($signed(($unsigned((reg12 ? reg12 : wire14)) ?
                      reg12[(4'hc):(4'h8)] : $signed($unsigned((8'hbb))))));
  assign wire16 = (($signed(($signed(wire4) * $unsigned(wire6))) || (+$unsigned((~&wire1)))) ?
                      $unsigned($unsigned(wire0)) : ((8'had) == ((~|$unsigned(wire13)) >> $unsigned((wire14 ?
                          reg8 : wire15)))));
  assign wire17 = reg11[(4'h8):(1'h1)];
  assign wire18 = wire17[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg19 <= wire6;
      reg20 <= wire15[(4'hb):(1'h1)];
      reg21 <= (wire17 ?
          (wire5 ?
              $unsigned($unsigned($signed((8'ha6)))) : (((|wire2) == (wire4 <= wire10)) ?
                  reg12[(4'hb):(2'h2)] : wire5[(4'h9):(4'h8)])) : wire2);
      if ($unsigned(wire4))
        begin
          reg22 <= (+(&(7'h42)));
          reg23 <= $unsigned(reg12[(3'h5):(3'h4)]);
          reg24 <= (&(wire2[(4'hc):(2'h2)] <= wire17));
          reg25 <= (wire14[(2'h3):(1'h0)] ?
              {$unsigned({reg12, (!wire9)})} : {(|($unsigned(reg20) ?
                      reg11[(2'h3):(2'h2)] : (wire13 & wire0))),
                  $signed({(8'hb7)})});
        end
      else
        begin
          if (reg25[(3'h4):(3'h4)])
            begin
              reg22 <= $unsigned(wire6[(3'h5):(1'h0)]);
              reg23 <= wire5;
              reg24 <= (&(($signed(wire2) ?
                      $signed(wire7) : (wire15 ^ wire15[(4'ha):(1'h0)])) ?
                  (|(!{reg22, reg21})) : ($signed(reg11) ?
                      $signed(wire4[(4'ha):(4'h9)]) : (&$signed(wire6)))));
              reg25 <= $signed($signed(wire2));
            end
          else
            begin
              reg22 <= reg12;
              reg23 <= (-{$signed($unsigned((wire18 - wire7))),
                  ((~|(reg22 + reg19)) ? {(~|wire3)} : {(~^wire15)})});
              reg24 <= (!$signed($unsigned(wire14[(2'h2):(1'h1)])));
            end
          reg26 <= (+{(^~reg20), (8'ha7)});
          reg27 <= reg24;
          reg28 <= (reg8[(1'h1):(1'h0)] >> wire5[(3'h5):(3'h4)]);
        end
      if ($unsigned($unsigned(reg21)))
        begin
          if (wire7)
            begin
              reg29 <= $signed((-(((-reg22) ^ (reg26 ? wire13 : wire4)) ?
                  ($unsigned(wire14) <<< $signed(wire13)) : (+(reg20 * reg19)))));
              reg30 <= $unsigned((-(~&(wire10[(2'h3):(2'h3)] >= $unsigned(reg28)))));
              reg31 <= wire13;
            end
          else
            begin
              reg29 <= reg11[(3'h6):(3'h4)];
            end
          reg32 <= (+(reg27[(1'h0):(1'h0)] & (wire16 ?
              {(7'h40)} : $signed((7'h42)))));
        end
      else
        begin
          if (($unsigned({reg29}) ? $unsigned(reg32) : wire0[(3'h4):(2'h3)]))
            begin
              reg29 <= (($unsigned(reg19[(4'hc):(2'h2)]) ?
                  $signed({reg19}) : reg28) ^ $signed((~$signed(wire16[(4'h8):(1'h0)]))));
              reg30 <= $signed(reg24);
              reg31 <= {(~^((!wire7) >= (~$unsigned(reg25))))};
              reg32 <= (^((8'hbf) ?
                  (($signed(wire3) ?
                      reg27[(2'h3):(1'h0)] : $unsigned(wire1)) > reg29[(4'h8):(3'h4)]) : reg24[(2'h3):(1'h1)]));
              reg33 <= wire4;
            end
          else
            begin
              reg29 <= reg33[(2'h2):(2'h2)];
              reg30 <= ((wire15[(3'h7):(3'h7)] ?
                  ($unsigned($signed(reg21)) ?
                      (wire1 >= reg12[(4'h8):(1'h0)]) : $unsigned((reg24 >>> (8'ha8)))) : reg29) ^~ {(8'ha4),
                  (&(~^reg31))});
              reg31 <= (wire2[(2'h2):(2'h2)] | wire10);
              reg32 <= ({wire6,
                      ({$unsigned((8'hb1))} ?
                          wire10 : ($unsigned(wire0) & {reg30, wire5}))} ?
                  ((!reg23) > $unsigned((~|{reg23}))) : ((~((+reg28) ?
                          (reg25 | reg20) : ((8'hb8) >> wire5))) ?
                      ((8'ha5) * reg31[(1'h0):(1'h0)]) : ((wire7[(2'h2):(1'h1)] ~^ (wire17 <= wire15)) ?
                          reg26[(2'h2):(2'h2)] : $unsigned((reg26 << wire10)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg34 <= (wire7 >= (!$unsigned((7'h44))));
      if ($signed(($unsigned(($unsigned((8'hae)) ?
              wire16[(3'h7):(3'h5)] : (wire2 != reg25))) ?
          {wire14[(2'h2):(2'h2)]} : (-($signed((8'ha9)) ?
              (wire18 ^ wire18) : {(8'hb9)})))))
        begin
          reg35 <= $unsigned((wire0[(3'h6):(3'h6)] ?
              {$unsigned({reg28}),
                  (((8'ha0) <<< reg30) ^~ reg27[(2'h2):(1'h1)])} : $unsigned($unsigned((reg12 ?
                  (8'ha5) : wire14)))));
        end
      else
        begin
          reg35 <= $unsigned(($signed($signed($signed(wire3))) ?
              (((8'hbd) != reg19[(4'hf):(3'h7)]) ?
                  ((!(8'hbc)) ?
                      (wire7 ?
                          wire1 : wire16) : (~|reg32)) : ($unsigned(reg26) ?
                      {(8'hb8)} : $unsigned(reg34))) : $signed((reg21[(4'hc):(1'h1)] ?
                  {reg21} : $unsigned(reg28)))));
          reg36 <= ((reg11[(1'h1):(1'h1)] ? wire4 : reg28) ?
              wire13[(3'h5):(2'h3)] : reg20);
          if ((~^($unsigned((~$signed(reg23))) ?
              $unsigned($signed((wire4 | reg26))) : (((8'hbb) <<< (wire17 ?
                      wire3 : wire16)) ?
                  $unsigned(((8'ha3) && wire6)) : reg25[(2'h3):(1'h1)]))))
            begin
              reg37 <= ((((~(~^reg8)) ?
                          $signed((reg30 ? reg8 : reg29)) : {(reg27 + (8'ha0)),
                              $unsigned(wire16)}) ?
                      ($signed(reg12[(3'h7):(2'h2)]) | reg35[(1'h0):(1'h0)]) : wire6[(2'h2):(2'h2)]) ?
                  (+$unsigned(((^(8'hab)) <= (|reg22)))) : ((((wire2 ?
                              reg19 : reg26) ?
                          (8'hab) : $unsigned((8'haf))) ~^ $signed($unsigned(reg29))) ?
                      ($signed({wire5}) ^ ($signed(reg23) == wire2)) : {$unsigned(reg34[(4'hd):(2'h3)])}));
            end
          else
            begin
              reg37 <= ((^~{{reg29[(3'h4):(2'h2)], reg27}}) ?
                  $unsigned({(-$unsigned(wire14))}) : ((reg19[(2'h2):(1'h1)] << {$unsigned(reg29)}) | reg20));
              reg38 <= (8'hbf);
              reg39 <= $signed(reg35[(3'h6):(2'h2)]);
              reg40 <= ($unsigned(reg26[(2'h3):(2'h3)]) ?
                  (((reg29[(2'h2):(1'h1)] - reg19) ?
                      $unsigned(reg24) : reg31) + {$signed($signed(reg23))}) : $signed((~^(wire10[(4'h8):(2'h3)] >>> (~^reg37)))));
              reg41 <= reg38;
            end
          reg42 <= {$signed(reg26), reg30[(4'ha):(3'h4)]};
        end
      reg43 <= ({wire3[(4'hb):(3'h5)],
              (wire5[(4'h8):(3'h7)] ?
                  $unsigned((8'hbd)) : (|(reg39 ? reg12 : reg19)))} ?
          reg26 : reg36);
      reg44 <= wire0;
      reg45 <= $unsigned(((wire3 ?
              $signed((wire4 ? wire14 : reg11)) : ({reg30, wire13} ?
                  (reg43 ? reg29 : wire7) : {reg19})) ?
          $unsigned(((~^wire1) == (~(8'ha6)))) : $unsigned($unsigned((wire10 > (8'had))))));
    end
  assign wire46 = (&(wire10 - (reg28 | (~$unsigned((8'h9e))))));
  assign wire47 = $unsigned($unsigned(reg24));
  assign wire48 = (^reg37[(2'h2):(2'h2)]);
  assign wire49 = (({(-(^~wire3)), wire7} < reg28) << reg38);
  assign wire50 = ((reg33 * {(wire14[(1'h1):(1'h1)] ?
                          wire13 : $unsigned((8'haf))),
                      {$unsigned((8'hb4))}}) && ({reg32[(4'h9):(4'h9)]} ?
                      {((8'ha3) ? {reg38} : reg34),
                          reg8[(2'h3):(1'h0)]} : (^reg12[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg51 <= wire13;
      reg52 <= reg22;
      reg53 <= reg11;
      if ({(8'ha0), (8'ha1)})
        begin
          reg54 <= $signed(reg35);
          if ($signed($unsigned(((reg11[(3'h4):(2'h3)] ?
              reg19[(4'hd):(3'h5)] : {wire13, wire49}) >> $signed((+reg24))))))
            begin
              reg55 <= (reg35 ? wire46 : (^~$signed($signed((8'had)))));
              reg56 <= ($signed((($signed(wire9) - $signed(reg43)) ?
                      (|$unsigned(reg20)) : {(reg22 != wire4)})) ?
                  ($signed(reg40) >> $signed((|$signed(reg39)))) : (-$unsigned((-reg51))));
              reg57 <= {(~^reg53[(4'hb):(1'h0)]),
                  (reg39 ?
                      $signed(((7'h43) ?
                          (reg37 ? wire3 : reg26) : (wire17 ?
                              reg51 : reg22))) : wire10[(2'h2):(2'h2)])};
              reg58 <= $unsigned($signed((reg22[(2'h2):(2'h2)] ?
                  ($signed(wire2) * (wire47 ? wire48 : wire2)) : (^~(reg40 ?
                      wire5 : reg27)))));
              reg59 <= (~&reg53);
            end
          else
            begin
              reg55 <= wire46;
              reg56 <= (8'had);
              reg57 <= $unsigned({$signed((^(~&(8'hb3))))});
            end
          reg60 <= reg23[(4'hc):(3'h6)];
          reg61 <= reg12[(4'he):(2'h2)];
          reg62 <= (reg41 ?
              $unsigned(reg52) : ({(|{(8'haa)})} ?
                  (!($unsigned(reg21) <= (reg60 ? reg32 : reg56))) : (reg52 ?
                      reg37[(2'h3):(1'h1)] : (8'ha6))));
        end
      else
        begin
          if (((-wire15[(3'h4):(2'h2)]) ? reg54[(3'h5):(3'h4)] : wire5))
            begin
              reg54 <= $unsigned($unsigned(wire6));
            end
          else
            begin
              reg54 <= $unsigned(reg21[(4'ha):(3'h7)]);
              reg55 <= reg59[(4'h8):(2'h2)];
              reg56 <= reg60[(2'h2):(1'h0)];
              reg57 <= reg24;
              reg58 <= $signed($unsigned({reg23[(4'hc):(4'hc)],
                  reg21[(3'h7):(3'h6)]}));
            end
          if (((({(reg36 ? (8'h9d) : (8'hb5))} ?
                      reg38 : ((reg38 & wire13) || reg32[(3'h7):(2'h2)])) ?
                  reg42 : $signed(reg59)) ?
              ({{(reg24 ? reg43 : wire9)}} ?
                  (^~reg12) : $unsigned(reg59)) : ((reg55 + (~$signed(wire4))) ?
                  (~|$unsigned(reg52[(3'h4):(3'h4)])) : (wire5[(4'h9):(3'h7)] == {reg51}))))
            begin
              reg59 <= (8'had);
              reg60 <= $unsigned(wire9);
            end
          else
            begin
              reg59 <= reg25[(1'h1):(1'h1)];
              reg60 <= {reg20[(1'h0):(1'h0)]};
              reg61 <= $signed((~^wire5));
              reg62 <= ($unsigned(wire5[(4'ha):(3'h4)]) ?
                  $unsigned(wire7) : wire2[(4'hc):(1'h0)]);
              reg63 <= (reg53[(3'h6):(2'h2)] ?
                  ($signed((~$signed((8'hb5)))) ?
                      ($signed(((8'hb4) ? wire13 : reg35)) ?
                          $signed($signed((8'hb8))) : ($signed((8'ha8)) ?
                              $signed((7'h44)) : $unsigned(reg32))) : ({(wire4 - wire4),
                              (!reg58)} ?
                          $signed($unsigned(wire16)) : reg52)) : ((((wire1 ?
                              wire5 : wire2) ?
                          wire9[(4'he):(3'h4)] : wire1) ?
                      ($unsigned(wire7) ?
                          reg54[(2'h2):(1'h1)] : (~&(8'hac))) : (reg33 * reg33)) || $unsigned(reg39)));
            end
          reg64 <= reg23[(4'ha):(1'h0)];
          reg65 <= $signed((!$signed(((^reg37) >> (wire50 ? reg41 : reg52)))));
          reg66 <= wire46[(3'h4):(1'h0)];
        end
      reg67 <= wire49;
    end
endmodule
