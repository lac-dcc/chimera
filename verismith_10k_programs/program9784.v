module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  assign y = {wire41,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = wire2[(2'h2):(1'h1)];
  assign wire6 = (+(wire3[(2'h2):(2'h2)] ?
                     (~^(&wire1[(3'h5):(2'h2)])) : (~|{(-wire1)})));
  assign wire7 = ($signed(wire5[(1'h0):(1'h0)]) == $signed($signed({wire0[(4'hb):(1'h1)]})));
  assign wire8 = (^wire7);
  assign wire9 = wire3;
  assign wire10 = ((!$signed(((8'hb4) ^ (wire5 ?
                      wire6 : wire8)))) > $signed((+(wire0 ?
                      (-wire7) : (~|wire7)))));
  assign wire11 = (($signed((~^wire6)) + wire0) ?
                      wire1[(1'h0):(1'h0)] : wire6[(3'h4):(1'h0)]);
  assign wire12 = $unsigned((((&wire11) && (8'hb4)) && ($unsigned(wire7[(4'h8):(1'h1)]) ?
                      wire11 : (wire2 * (^~wire4)))));
  assign wire13 = (~^{wire7[(1'h0):(1'h0)]});
  assign wire14 = (((($unsigned(wire2) >> (wire7 && wire10)) | wire10[(1'h1):(1'h1)]) << $unsigned((^~(+wire3)))) ?
                      $unsigned(wire8[(3'h6):(1'h1)]) : $signed($signed(wire0)));
  always
    @(posedge clk) begin
      if ((((((wire14 ?
              wire0 : wire10) != $signed(wire6)) >>> {$signed(wire3)}) ?
          ($unsigned(wire12[(4'hb):(1'h0)]) ?
              ((wire0 && wire2) ? (&wire6) : (wire12 >>> wire1)) : ((^(8'ha0)) ?
                  wire2 : wire3[(1'h1):(1'h1)])) : wire6) <= wire0))
        begin
          reg15 <= wire8[(1'h0):(1'h0)];
          reg16 <= ((wire6[(2'h3):(1'h1)] ^~ wire3) ?
              $signed({($unsigned(wire5) ? {wire3, wire8} : (^~wire13)),
                  wire3}) : ((~^reg15[(1'h0):(1'h0)]) >= ((wire10[(1'h1):(1'h0)] ?
                      wire4[(1'h0):(1'h0)] : wire1) ?
                  $unsigned(wire5[(2'h3):(2'h3)]) : $signed((&wire8)))));
          if (wire1[(2'h2):(2'h2)])
            begin
              reg17 <= wire9;
            end
          else
            begin
              reg17 <= (($unsigned($signed((wire8 ?
                      wire13 : wire7))) - {wire7}) ?
                  $signed({(wire0 ?
                          (wire7 ^~ wire9) : $signed(wire13))}) : $unsigned($unsigned($unsigned((wire5 ?
                      wire4 : wire3)))));
            end
        end
      else
        begin
          if (reg16)
            begin
              reg15 <= wire4;
              reg16 <= {{wire3[(2'h3):(2'h3)]}};
            end
          else
            begin
              reg15 <= (~|wire14);
              reg16 <= $unsigned($unsigned((wire11 ^ wire14)));
              reg17 <= $unsigned($unsigned($signed((^wire11[(2'h2):(1'h1)]))));
              reg18 <= (|$signed(wire12));
              reg19 <= $unsigned((~(8'h9f)));
            end
          reg20 <= (~&(!{$unsigned($unsigned((7'h40)))}));
          if ($signed(reg16[(3'h6):(3'h4)]))
            begin
              reg21 <= $unsigned(reg20[(2'h3):(1'h0)]);
              reg22 <= (~&(&$unsigned($signed((~^wire1)))));
            end
          else
            begin
              reg21 <= $unsigned((($signed({wire8, reg16}) ?
                  wire11[(3'h4):(3'h4)] : (wire4[(2'h3):(1'h0)] ?
                      ((8'h9e) >= wire8) : (wire14 < (8'hb7)))) * wire8[(2'h2):(2'h2)]));
              reg22 <= (^~(((^~$unsigned(wire10)) - ((reg15 ?
                  wire14 : wire4) ~^ $signed(wire5))) >> (~((wire1 ?
                  (8'hba) : reg21) << wire0[(1'h1):(1'h0)]))));
              reg23 <= (~|(~^((reg15[(2'h2):(1'h0)] <<< ((7'h41) ?
                      reg15 : wire12)) ?
                  reg21[(5'h11):(4'hd)] : (&(wire11 ? reg19 : wire3)))));
              reg24 <= reg20;
              reg25 <= (($signed((wire7 > $unsigned(reg15))) ?
                  (~^(~|((8'hb1) << wire7))) : wire11[(3'h5):(2'h3)]) & (~($signed($unsigned(reg21)) <= (wire14[(1'h1):(1'h1)] ?
                  reg19[(4'he):(4'h8)] : reg17[(4'hc):(3'h7)]))));
            end
        end
      reg26 <= ((($unsigned(reg17) * (~^reg19)) >= wire14) ?
          wire6 : ({((wire6 ? wire10 : wire11) ?
                      {wire5} : wire14[(1'h0):(1'h0)]),
                  $unsigned($signed(wire7))} ?
              (!$signed(wire10[(1'h1):(1'h0)])) : reg23[(4'hb):(3'h5)]));
      if ($unsigned($signed((~($unsigned((8'hbe)) ?
          (wire2 ? reg17 : wire1) : wire8)))))
        begin
          reg27 <= (~&($unsigned($signed((wire13 ?
              wire11 : wire4))) < {$unsigned($unsigned(reg19)),
              (-$signed(wire0))}));
          reg28 <= {((~|$unsigned($signed(reg26))) | $unsigned((-(reg25 && reg21))))};
          reg29 <= reg21;
          if (({reg21} ?
              $signed((((-reg23) ? (wire14 ? reg20 : wire1) : (~wire0)) ?
                  ((|wire10) ?
                      wire7[(2'h2):(1'h0)] : $unsigned(reg22)) : reg16[(4'hd):(3'h5)])) : reg24[(4'h9):(3'h7)]))
            begin
              reg30 <= ((~&reg20) || (reg17 >>> $signed(($signed(reg23) ?
                  reg26[(4'hb):(4'h8)] : $signed(reg24)))));
              reg31 <= $signed(wire4);
              reg32 <= $signed($unsigned(reg16[(4'ha):(2'h2)]));
              reg33 <= $unsigned(((wire1[(1'h0):(1'h0)] ?
                      {wire8, (wire1 >>> reg27)} : $signed($signed(wire3))) ?
                  $signed(((reg26 || reg25) >= wire13)) : (((~reg25) ^~ (reg25 >>> wire14)) != $unsigned((^~wire10)))));
            end
          else
            begin
              reg30 <= ((^~(wire12[(4'hd):(3'h7)] ~^ reg27[(3'h7):(3'h6)])) && {$unsigned(reg27[(3'h6):(2'h2)]),
                  ($unsigned($signed(wire4)) + reg18[(1'h0):(1'h0)])});
              reg31 <= reg30;
            end
        end
      else
        begin
          reg27 <= {({reg27} ?
                  (($signed(reg17) & (wire14 ? reg33 : (8'hb4))) >>> ((reg15 ?
                      reg28 : reg16) <= (!wire7))) : wire4[(3'h5):(3'h5)]),
              {wire14}};
          if (reg31[(1'h1):(1'h1)])
            begin
              reg28 <= (~(8'hb6));
              reg29 <= reg24[(2'h3):(1'h1)];
              reg30 <= (reg24[(4'h9):(3'h5)] * {(wire6 ?
                      (wire3 ?
                          (^reg26) : $signed(reg21)) : (~|(reg19 >> (8'hba)))),
                  ({reg33[(3'h6):(2'h2)]} >>> {(wire0 ~^ reg21),
                      $unsigned(wire8)})});
            end
          else
            begin
              reg28 <= $signed((wire7[(2'h3):(2'h2)] > (reg16 ?
                  (wire9[(4'hb):(1'h0)] ?
                      $unsigned(reg16) : {reg25,
                          wire3}) : ($signed(reg17) | (wire4 ?
                      wire11 : reg16)))));
              reg29 <= (wire1 * (((reg18 ?
                  $signed(reg32) : $signed(wire9)) || (7'h42)) | {$unsigned((wire9 || (7'h41))),
                  $unsigned(reg16[(3'h7):(2'h3)])}));
              reg30 <= ($signed((^(wire11 ^~ (8'ha9)))) + wire0);
              reg31 <= $unsigned(($unsigned($unsigned($unsigned(wire7))) * reg20));
            end
        end
      reg34 <= $signed((wire8 ? wire5 : $signed($unsigned((|reg19)))));
      if ({$signed($unsigned($signed(((7'h43) ? wire2 : wire5)))),
          reg18[(2'h3):(1'h0)]})
        begin
          reg35 <= $signed((reg28 ?
              $unsigned(reg33) : {$unsigned(reg29[(1'h1):(1'h0)])}));
          if (wire0[(4'ha):(3'h5)])
            begin
              reg36 <= (wire0[(3'h7):(1'h0)] ?
                  (reg25 ?
                      reg26 : $unsigned($unsigned((reg25 > wire4)))) : $signed(wire12[(4'hb):(3'h7)]));
              reg37 <= $signed($unsigned(reg15));
              reg38 <= (~|$signed((~|(wire8[(1'h0):(1'h0)] && (reg21 - wire5)))));
              reg39 <= $signed(wire13[(4'hc):(3'h6)]);
            end
          else
            begin
              reg36 <= wire3;
              reg37 <= ((~&reg39[(2'h2):(1'h1)]) ?
                  reg38[(2'h2):(1'h0)] : ($signed($signed($unsigned((8'ha8)))) & $signed($signed((8'ha1)))));
              reg38 <= reg32;
            end
          reg40 <= $unsigned(reg27);
        end
      else
        begin
          reg35 <= (!$signed(reg38[(2'h3):(1'h0)]));
          reg36 <= $signed((8'hb1));
        end
    end
  assign wire41 = (+$unsigned((($unsigned(wire6) ?
                          $signed(wire3) : $signed(wire10)) ?
                      reg22[(3'h6):(1'h0)] : $unsigned((reg17 < (7'h43))))));
  always
    @(posedge clk) begin
      reg42 <= wire13[(3'h7):(3'h6)];
      reg43 <= $signed(reg18[(1'h0):(1'h0)]);
      if (wire41[(3'h4):(3'h4)])
        begin
          reg44 <= $signed({$signed(reg28[(3'h6):(2'h3)])});
          reg45 <= reg43;
          reg46 <= (~&($signed((+$unsigned(reg27))) ?
              {$unsigned(((8'ha2) - reg27))} : $unsigned(((reg19 ?
                      reg26 : wire5) ?
                  {(8'hb4), reg37} : $signed(reg28)))));
          reg47 <= $signed(wire13[(4'hd):(2'h2)]);
        end
      else
        begin
          reg44 <= $signed($unsigned(wire6[(3'h4):(1'h0)]));
          reg45 <= ({({(reg35 < wire12),
                  wire10[(3'h4):(3'h4)]} == $unsigned($unsigned(wire11)))} >> reg40[(3'h7):(3'h6)]);
          reg46 <= wire2;
          if (reg25)
            begin
              reg47 <= wire11;
            end
          else
            begin
              reg47 <= ((~|$signed((wire13[(3'h4):(2'h2)] ?
                  (reg16 ? reg16 : reg21) : wire1[(2'h2):(2'h2)]))) != (7'h44));
              reg48 <= (!$unsigned({wire14[(3'h7):(1'h1)], (7'h42)}));
            end
          if ($unsigned($unsigned((&((!reg31) ? wire9 : {wire5})))))
            begin
              reg49 <= reg19[(3'h6):(3'h5)];
              reg50 <= reg28;
              reg51 <= ((wire3[(1'h1):(1'h0)] ?
                  ($unsigned(reg35[(3'h6):(3'h6)]) ?
                      $signed({wire13}) : reg50) : {$unsigned(reg29[(1'h1):(1'h1)])}) >> $unsigned($signed(((~&reg37) >= wire14))));
              reg52 <= $signed(reg21);
              reg53 <= (8'h9c);
            end
          else
            begin
              reg49 <= wire2[(1'h0):(1'h0)];
              reg50 <= (8'ha8);
            end
        end
      reg54 <= $unsigned((~($unsigned((wire41 ? reg22 : (8'hb2))) ?
          $unsigned((8'hbd)) : ($unsigned(reg43) >= (reg45 ?
              reg33 : (8'ha1))))));
      reg55 <= wire3[(2'h3):(2'h3)];
    end
endmodule
