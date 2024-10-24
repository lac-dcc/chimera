module top
#(parameter param53 = ((7'h40) - (^{(8'ha3)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = {wire0};
  assign wire5 = (($unsigned($unsigned($signed(wire4))) ?
                         (($signed(wire2) << (wire2 ? wire2 : wire4)) ?
                             $signed((+wire0)) : {wire1,
                                 wire3[(1'h1):(1'h1)]}) : wire1) ?
                     ((($unsigned((7'h40)) ~^ wire3[(4'ha):(1'h1)]) == wire1) > ($signed($unsigned(wire2)) << wire2[(3'h4):(2'h2)])) : ({(!$signed(wire3)),
                         $signed((wire4 ? (7'h40) : wire1))} >> ({(wire2 ?
                             wire1 : wire0)} << (wire4[(4'hb):(3'h4)] != $unsigned(wire2)))));
  assign wire6 = wire3;
  assign wire7 = $unsigned($unsigned((8'ha7)));
  assign wire8 = (|(~|(wire4[(5'h11):(5'h10)] ?
                     $unsigned((wire6 ^~ wire0)) : wire6)));
  assign wire9 = $unsigned(((~&(~&wire8[(1'h0):(1'h0)])) ?
                     (((wire7 ? wire3 : wire1) ?
                             $unsigned((8'hb0)) : (wire1 ? wire8 : wire4)) ?
                         (8'ha3) : wire3) : $unsigned($signed({wire4}))));
  assign wire10 = (~wire8[(3'h5):(3'h5)]);
  assign wire11 = $signed(((8'hbd) ?
                      (wire1[(4'ha):(2'h2)] <<< (((8'haf) > wire4) * $signed(wire3))) : (^{wire5[(4'h9):(2'h2)]})));
  always
    @(posedge clk) begin
      reg12 <= (~|((wire7 ?
              wire9[(5'h14):(4'he)] : (wire9[(2'h3):(2'h2)] && $signed((8'haf)))) ?
          (-wire3[(2'h3):(2'h2)]) : wire0));
      if ((!$signed($signed($signed($unsigned(wire1))))))
        begin
          reg13 <= (&$signed($unsigned(wire3)));
          if (wire3)
            begin
              reg14 <= $signed(($unsigned(reg12) ?
                  {(wire1[(5'h10):(4'hb)] ^ $signed(reg13))} : (~^$signed($unsigned(wire4)))));
              reg15 <= (wire4[(3'h7):(1'h1)] ?
                  ($signed($signed((~reg14))) * $signed($signed(wire6))) : {reg14});
              reg16 <= reg15[(3'h5):(1'h0)];
            end
          else
            begin
              reg14 <= (reg13[(1'h0):(1'h0)] ?
                  $unsigned(((|(!wire2)) + $unsigned({reg12,
                      reg15}))) : $unsigned(wire9[(4'ha):(3'h6)]));
              reg15 <= (wire2[(4'ha):(3'h6)] >= $unsigned((8'hb6)));
              reg16 <= wire4[(4'hb):(3'h4)];
              reg17 <= wire6[(5'h14):(4'h9)];
            end
        end
      else
        begin
          if ((-reg17))
            begin
              reg13 <= wire3;
              reg14 <= (-$signed($unsigned(reg17)));
              reg15 <= wire2[(4'h8):(1'h1)];
              reg16 <= $unsigned((wire5 + (|$unsigned($unsigned(reg16)))));
            end
          else
            begin
              reg13 <= wire7;
              reg14 <= wire7[(2'h3):(1'h1)];
              reg15 <= {$signed($unsigned(((|reg13) ^ (-reg13))))};
              reg16 <= wire6[(4'h8):(3'h5)];
              reg17 <= ((($unsigned($signed(wire8)) ?
                  $signed(wire1) : wire7[(4'hc):(2'h3)]) <<< $unsigned(wire6)) >>> $unsigned($signed($signed(wire0))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg18 <= {reg16[(3'h4):(1'h1)], $unsigned(({$signed(wire3)} <<< wire7))};
      if (wire4[(3'h6):(2'h2)])
        begin
          if ($unsigned(wire0))
            begin
              reg19 <= {(((((8'ha5) ? reg14 : reg14) ?
                      wire6[(3'h7):(3'h7)] : $unsigned(wire2)) <= ((wire4 < (8'ha0)) ?
                      reg18 : ((8'hb9) <= reg17))) ^~ $signed(($signed(wire2) == (wire5 ?
                      reg16 : wire8)))),
                  $signed(reg13[(1'h1):(1'h1)])};
            end
          else
            begin
              reg19 <= $signed({(wire11[(1'h1):(1'h0)] & (^(~&wire6))),
                  (~^reg17)});
              reg20 <= $signed((reg12[(4'h8):(3'h5)] - wire1));
              reg21 <= reg16;
            end
          reg22 <= ($unsigned(reg12) >> (reg16[(4'hc):(3'h5)] & reg13));
          reg23 <= ((&(reg19[(4'ha):(2'h2)] ?
              (8'ha3) : (8'hb6))) <= ($signed(reg14) ?
              ($unsigned(reg17[(1'h1):(1'h0)]) ?
                  $signed((~reg12)) : (&reg14)) : reg18[(2'h2):(2'h2)]));
          reg24 <= reg23;
          reg25 <= $signed($unsigned($signed((&wire2[(3'h4):(2'h3)]))));
        end
      else
        begin
          if (((&$unsigned(wire9)) >>> (8'ha7)))
            begin
              reg19 <= (|(~({(reg20 - reg14)} - $unsigned($signed(reg15)))));
              reg20 <= reg24;
              reg21 <= ((-($unsigned(((8'hb6) >= wire7)) >> $unsigned($unsigned(reg17)))) <<< ((($signed(reg25) ?
                          ((8'hba) ? wire3 : wire1) : reg22[(2'h2):(2'h2)]) ?
                      reg18[(1'h1):(1'h1)] : reg25) ?
                  (!($unsigned(wire2) ?
                      {wire0} : ((7'h40) >= (8'hb1)))) : ($signed((8'hb1)) ?
                      $unsigned(wire7) : (wire0[(5'h11):(5'h11)] ?
                          $signed(wire11) : reg15))));
              reg22 <= $signed(reg13[(4'he):(4'he)]);
            end
          else
            begin
              reg19 <= {{reg16,
                      (reg20 ?
                          (~|(reg22 << reg12)) : ($unsigned(wire5) ?
                              ((8'hb4) || wire9) : (reg12 ^~ wire8)))}};
              reg20 <= reg15[(4'hd):(4'h8)];
            end
          reg23 <= reg16[(5'h10):(2'h2)];
          reg24 <= (wire1[(4'h9):(3'h4)] ?
              (8'ha0) : {$unsigned($unsigned((^reg14)))});
          reg25 <= $signed(reg16);
        end
      reg26 <= $signed($signed(wire0));
      if ((-$signed({({wire5, reg25} ? wire3[(3'h6):(3'h5)] : $signed((8'hbc))),
          (wire11 ? $unsigned(reg22) : (reg20 ? wire4 : wire9))})))
        begin
          if ((($unsigned(wire2) ?
              $signed(((reg14 == reg14) < $signed(reg16))) : ((-(reg18 ?
                      (8'ha8) : reg13)) ?
                  $signed(wire5[(4'ha):(4'ha)]) : reg25)) >= ((reg23[(1'h0):(1'h0)] & $signed($signed(wire0))) > {(reg13 ?
                  (reg23 ? (8'hbc) : wire0) : (reg18 & reg23)),
              $unsigned($signed(wire8))})))
            begin
              reg27 <= $signed(reg19[(3'h6):(3'h5)]);
            end
          else
            begin
              reg27 <= {wire8,
                  ($unsigned($unsigned({reg15, reg23})) ?
                      ((&(reg25 >>> reg18)) + wire4[(4'hf):(4'hd)]) : (reg19 ?
                          ((+(8'hb4)) ?
                              ((8'ha9) ?
                                  wire5 : (8'hb8)) : $signed(reg15)) : $signed(((8'hac) < reg17))))};
              reg28 <= $signed(reg26[(3'h4):(2'h3)]);
              reg29 <= (-($unsigned((&(reg23 && (8'hbd)))) ?
                  reg12[(1'h0):(1'h0)] : reg25));
              reg30 <= (^~$signed(({(wire8 ?
                      reg18 : wire3)} ^~ (reg15[(3'h4):(1'h1)] < wire7))));
            end
          reg31 <= $unsigned($signed(({$unsigned(reg29),
              wire7[(1'h0):(1'h0)]} <<< (reg20[(1'h0):(1'h0)] | (~reg19)))));
          reg32 <= (8'ha2);
          reg33 <= {(~|wire11[(3'h5):(3'h5)])};
          reg34 <= {$signed((!((wire2 ? reg18 : reg31) >> {wire2}))),
              (reg19 ?
                  $unsigned(($unsigned(reg16) ? reg14 : (&wire6))) : (8'hb6))};
        end
      else
        begin
          reg27 <= ($unsigned($unsigned((8'hb4))) <= {wire11,
              (^~$unsigned({reg12}))});
          reg28 <= $unsigned((reg14[(1'h0):(1'h0)] & {(reg27 ?
                  (reg24 > reg14) : (wire8 < reg15)),
              wire1}));
          reg29 <= (~reg14);
        end
    end
  assign wire35 = ($unsigned($signed(reg16)) ? reg30 : {reg16});
  assign wire36 = reg18;
  assign wire37 = (reg25[(1'h0):(1'h0)] <= $signed((($signed(reg15) ?
                      (~|reg31) : reg14[(2'h2):(1'h1)]) < ((reg22 ?
                      reg17 : reg24) | reg28[(3'h7):(3'h6)]))));
  assign wire38 = $signed((8'ha7));
  assign wire39 = reg27[(3'h6):(2'h2)];
  assign wire40 = reg19;
  assign wire41 = (^~wire6);
  always
    @(posedge clk) begin
      reg42 <= {$unsigned((!((-reg32) || $signed(reg26)))),
          $signed(($signed($signed(wire41)) >> $unsigned($unsigned((8'hb9)))))};
      reg43 <= $signed(({(((7'h42) ? (8'hbb) : (8'ha2)) < $signed(wire3)),
              $signed($signed(reg12))} ?
          (reg15 ?
              (~^(~wire35)) : ($signed(reg18) ?
                  {reg18, (8'ha6)} : (reg21 ?
                      reg33 : reg32))) : ((8'haf) ^~ (+wire3))));
      if ((!$unsigned(((8'hb8) <<< wire10))))
        begin
          reg44 <= reg17[(3'h5):(1'h1)];
          if ($signed(({reg15[(4'hb):(1'h1)],
              (wire3[(3'h7):(2'h2)] ?
                  (-wire38) : reg23)} <<< (^$signed(((8'hac) ?
              reg20 : reg33))))))
            begin
              reg45 <= (wire7[(4'hc):(3'h4)] <<< $signed(wire40[(4'hb):(3'h4)]));
              reg46 <= ($unsigned(reg44[(4'h8):(3'h6)]) ?
                  $signed(reg26) : ($unsigned(reg33) ?
                      $unsigned(reg30[(2'h2):(1'h0)]) : (8'ha2)));
            end
          else
            begin
              reg45 <= $signed((-reg26[(5'h13):(4'he)]));
              reg46 <= wire40;
            end
          if (wire37[(3'h6):(3'h6)])
            begin
              reg47 <= reg25[(1'h0):(1'h0)];
              reg48 <= (8'hb9);
            end
          else
            begin
              reg47 <= (-(~|(~|({reg12, reg26} ?
                  reg17[(3'h5):(3'h5)] : $unsigned(reg31)))));
              reg48 <= ((|(reg20 ^~ (-(wire5 != reg31)))) - reg25);
              reg49 <= (($unsigned(((reg22 ? wire8 : wire5) ?
                          {wire3} : reg21[(3'h6):(3'h4)])) ?
                      wire35 : $signed(({wire6, wire3} != $signed(reg44)))) ?
                  $signed((wire1 >= (-(8'haf)))) : reg27);
            end
          reg50 <= $unsigned({reg16});
        end
      else
        begin
          reg44 <= wire36[(3'h5):(2'h3)];
          reg45 <= $signed((reg34[(2'h3):(1'h0)] ?
              (reg31 ? reg23[(1'h0):(1'h0)] : {$signed(reg12)}) : reg12));
        end
      reg51 <= $unsigned($unsigned((($signed(reg32) << (reg19 >= reg30)) ?
          wire9[(4'hb):(2'h2)] : ($unsigned(reg26) ?
              (reg26 == reg32) : {reg49}))));
      reg52 <= $unsigned($signed(((~&$signed(reg21)) * $unsigned(reg16))));
    end
endmodule
