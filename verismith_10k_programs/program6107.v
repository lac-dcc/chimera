module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire36,
                 wire22,
                 wire6,
                 wire5,
                 reg39,
                 reg38,
                 reg37,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire2[(3'h4):(3'h4)] ?
                     ({$unsigned(wire2), $signed(wire0)} ?
                         (!((wire2 << wire1) ~^ $unsigned((8'h9e)))) : wire0) : ({{(wire4 ?
                                     wire3 : (8'h9c)),
                                 (~^wire2)},
                             ((wire3 < wire0) | {(8'h9d), wire0})} ?
                         wire2[(1'h1):(1'h1)] : (+(!(wire1 | wire2)))));
  assign wire6 = (~((({wire1} ^~ (wire4 << wire3)) ?
                         (wire1[(1'h0):(1'h0)] > (wire0 ?
                             wire5 : (8'hb3))) : (|(wire3 && wire4))) ?
                     (!({wire4, (8'hb2)} ?
                         (wire1 && wire3) : wire4)) : wire4[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= ((((wire3 ? wire6[(1'h1):(1'h0)] : wire5) ?
          $signed((wire5 ? wire6 : wire6)) : ((wire5 ? (8'hb6) : wire5) ?
              $signed((8'hbd)) : (&wire6))) > (wire1 <<< $signed(wire4[(2'h2):(1'h0)]))) && ((wire6 ?
          ((wire3 ? wire4 : wire4) ?
              (~wire5) : $signed(wire0)) : $unsigned($unsigned(wire6))) >>> ($unsigned($unsigned((8'had))) ?
          wire6[(1'h1):(1'h1)] : (~|wire3[(4'hb):(3'h6)]))));
      if (wire0[(1'h1):(1'h1)])
        begin
          reg8 <= (($unsigned(reg7) ?
                  wire6[(3'h6):(3'h6)] : wire0[(2'h2):(1'h0)]) ?
              (^~(+$unsigned(wire5))) : ((|((8'h9c) ?
                      (^wire0) : $signed(reg7))) ?
                  $signed(({reg7} ?
                      $signed(wire3) : (~^wire2))) : wire1[(1'h1):(1'h1)]));
          if (wire5[(1'h0):(1'h0)])
            begin
              reg9 <= ($unsigned((+wire2)) ?
                  $unsigned(({(reg7 ? wire0 : wire3), $unsigned(wire1)} ?
                      (~(wire5 ?
                          wire5 : reg8)) : $unsigned((~^wire3)))) : wire3);
              reg10 <= wire1[(1'h0):(1'h0)];
              reg11 <= ($signed(((&(~wire3)) ?
                  (+$signed((8'ha0))) : (+(reg8 ?
                      wire4 : wire5)))) >> $unsigned({({reg9} ?
                      (+wire6) : (reg9 ? wire5 : (7'h44))),
                  (wire3 ^~ $signed(wire3))}));
            end
          else
            begin
              reg9 <= $unsigned((~^$unsigned(wire1[(1'h0):(1'h0)])));
              reg10 <= (^~wire6);
              reg11 <= wire6[(4'hd):(4'hb)];
              reg12 <= (^~wire4);
              reg13 <= $signed($signed(wire5[(3'h7):(2'h2)]));
            end
          reg14 <= wire1[(1'h1):(1'h1)];
          if (wire5[(3'h7):(3'h6)])
            begin
              reg15 <= wire3[(5'h12):(4'hf)];
              reg16 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg15 <= (!$signed({reg11,
                  ((|reg13) ? $unsigned((8'hb3)) : (|(8'ha7)))}));
              reg16 <= (^$signed($unsigned($unsigned($unsigned(reg15)))));
              reg17 <= $signed($signed(wire1));
              reg18 <= $unsigned(((^~((reg14 >> reg17) + $signed(reg16))) ~^ $signed((reg8 ?
                  (reg7 <= (8'ha1)) : (wire2 ? reg8 : wire0)))));
            end
        end
      else
        begin
          reg8 <= wire0[(3'h7):(3'h7)];
          if ((8'hac))
            begin
              reg9 <= ($signed(($signed((reg15 >> reg18)) ?
                  wire5 : $unsigned((8'ha0)))) ^~ reg7[(4'h8):(2'h2)]);
              reg10 <= $unsigned((wire1 ?
                  wire5[(3'h7):(3'h5)] : (wire1 ? $signed((+wire0)) : wire0)));
              reg11 <= ((^~$unsigned($signed((reg8 <<< reg12)))) & $unsigned($signed((+$signed(reg18)))));
              reg12 <= wire0[(1'h1):(1'h0)];
              reg13 <= $unsigned($signed(wire4));
            end
          else
            begin
              reg9 <= ($signed((-($unsigned(reg10) ?
                      (!(8'hbd)) : wire1[(1'h0):(1'h0)]))) ?
                  (8'hb9) : ($unsigned(((reg8 ?
                          wire6 : wire1) ~^ reg18[(3'h6):(2'h3)])) ?
                      {(|(^reg18))} : $unsigned(reg18[(3'h5):(1'h0)])));
              reg10 <= {($unsigned(reg10) ?
                      wire4[(3'h5):(2'h2)] : (reg16[(3'h5):(3'h4)] ?
                          {$unsigned(reg9)} : $signed((reg14 ?
                              (8'ha5) : reg10)))),
                  reg8};
              reg11 <= reg17;
              reg12 <= wire3[(5'h12):(1'h0)];
              reg13 <= (^({$signed((wire3 ? wire3 : reg18)), {wire6}} ^ reg18));
            end
          reg14 <= wire6[(3'h5):(3'h5)];
          reg15 <= (^~(wire0 ? wire5[(2'h3):(2'h2)] : {$unsigned(reg12)}));
          reg16 <= reg8;
        end
      reg19 <= $signed((($signed({(8'ha7), wire4}) ?
              (reg13[(2'h2):(1'h0)] ?
                  reg14 : $signed(reg8)) : $unsigned(reg11)) ?
          (^~wire4[(3'h5):(2'h3)]) : ($unsigned($unsigned((8'hb5))) <= $signed(reg14[(2'h3):(1'h1)]))));
      reg20 <= (reg14 + $signed($unsigned(((reg17 <<< wire3) < $unsigned(reg17)))));
      reg21 <= (~$signed({{$unsigned(reg19), $signed((8'haa))},
          ((reg16 ? (8'hb8) : reg13) && $unsigned(reg20))}));
    end
  assign wire22 = ((($unsigned($signed(wire4)) ? reg12 : reg20[(3'h4):(2'h3)]) ?
                          $signed({$unsigned(reg21),
                              reg13[(3'h6):(1'h1)]}) : reg10) ?
                      (reg12[(1'h0):(1'h0)] ?
                          {(wire4[(2'h3):(1'h1)] ? wire5 : (+wire1)),
                              $unsigned((wire0 ?
                                  (8'hb1) : wire5))} : reg17) : {{$unsigned((wire5 | wire5)),
                              {(~^(8'ha3)), ((8'h9e) <= wire3)}}});
  always
    @(posedge clk) begin
      if ((^$signed(reg9)))
        begin
          reg23 <= {((reg18 ?
                  (~|wire6[(4'hd):(3'h6)]) : $signed($signed((8'h9d)))) << $signed((~|(8'ha3))))};
          if ({(wire6 ?
                  $signed($signed((~&reg10))) : {{reg23, ((8'hb6) ~^ wire6)}}),
              reg9[(4'ha):(2'h2)]})
            begin
              reg24 <= reg16[(2'h2):(1'h0)];
              reg25 <= (($unsigned((&$signed(reg19))) > (((wire4 + reg18) >>> $unsigned(wire1)) ?
                  $unsigned(reg10) : $signed(wire3))) * (((-((7'h40) ~^ reg18)) + (~^(reg10 ^~ reg24))) ^ $signed($unsigned($unsigned(wire5)))));
              reg26 <= $unsigned(((((reg21 * reg16) ?
                          $unsigned(reg21) : (~^reg12)) ?
                      (&$signed((7'h43))) : $signed((reg10 ? reg23 : reg21))) ?
                  wire0[(1'h0):(1'h0)] : $unsigned($signed((~&reg11)))));
              reg27 <= reg7[(4'hd):(4'hd)];
            end
          else
            begin
              reg24 <= $signed(reg24);
              reg25 <= ((((((8'hb9) || wire0) > (reg19 | reg23)) || (^~$unsigned(reg7))) ?
                  ($signed(reg20) ? (+(~&wire6)) : wire3) : ((8'h9d) ?
                      ($signed(wire2) ?
                          reg12[(1'h1):(1'h1)] : $unsigned(reg8)) : (&wire5[(4'h9):(4'h8)]))) >> ((reg23 != $unsigned(reg21[(3'h5):(2'h3)])) ?
                  $unsigned({reg14}) : $signed(((8'hb2) ?
                      wire3 : reg17[(1'h0):(1'h0)]))));
              reg26 <= (+(reg16 ?
                  (({reg13, (8'haf)} ?
                      $unsigned(reg10) : (reg27 != wire0)) << reg18[(3'h5):(2'h2)]) : (((reg23 ?
                          reg17 : reg13) ?
                      $unsigned(reg7) : $signed(reg19)) >> (-$signed(reg14)))));
              reg27 <= reg8[(3'h4):(2'h2)];
            end
        end
      else
        begin
          reg23 <= (~|($unsigned((!reg16[(4'h9):(3'h6)])) ?
              (reg17[(3'h6):(2'h3)] ?
                  {$signed(reg8)} : $signed(reg16)) : ($signed((-reg23)) * (~&wire4[(1'h0):(1'h0)]))));
        end
      reg28 <= wire1[(1'h0):(1'h0)];
      reg29 <= (7'h41);
      reg30 <= (~|reg11);
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(reg18[(3'h5):(2'h2)])))
        begin
          reg31 <= reg8;
          if ({reg18})
            begin
              reg32 <= reg25;
              reg33 <= (8'ha6);
              reg34 <= {(~|($signed(reg13) < wire22))};
              reg35 <= ((reg32[(2'h2):(1'h0)] ?
                      {(~&(reg9 ^~ reg16)),
                          $signed((reg16 <<< reg33))} : $unsigned(($signed(reg12) * {reg20,
                          wire5}))) ?
                  $unsigned(reg26) : (reg7[(4'hf):(4'h9)] ^ $signed(({wire1,
                      wire6} ^~ (reg24 ? reg10 : reg7)))));
            end
          else
            begin
              reg32 <= ($signed((^~$unsigned(wire22[(4'h8):(4'h8)]))) ?
                  ($unsigned($unsigned((reg27 ? wire3 : wire1))) ?
                      reg17 : reg33[(3'h7):(3'h4)]) : $signed(({reg26,
                      {(8'hb3), reg17}} | $signed(((8'hb9) ? reg31 : reg20)))));
              reg33 <= $unsigned((&($signed({reg34, reg32}) ?
                  reg26[(1'h0):(1'h0)] : reg26)));
              reg34 <= reg20[(3'h5):(3'h5)];
              reg35 <= ((~$signed(reg32)) <= ((reg17 ^~ reg35[(1'h1):(1'h0)]) << (+$signed((reg9 ?
                  reg34 : reg11)))));
            end
        end
      else
        begin
          reg31 <= $unsigned($signed((+{$signed((8'ha9)),
              reg27[(3'h5):(1'h0)]})));
        end
    end
  assign wire36 = $signed((reg19[(5'h10):(1'h1)] || $unsigned((8'ha9))));
  always
    @(posedge clk) begin
      reg37 <= reg35[(2'h2):(1'h0)];
      reg38 <= reg28;
      reg39 <= (($unsigned((+{reg18, reg32})) ?
          {reg11[(4'hd):(4'ha)], $signed(reg11[(4'hd):(4'hd)])} : ((~^(reg29 ?
              (8'hb1) : wire1)) > wire1)) - wire0[(1'h0):(1'h0)]);
    end
  assign wire40 = $unsigned({reg8,
                      (reg23[(3'h5):(1'h1)] ?
                          {$signed(reg15)} : (~&(reg18 ? reg15 : reg33)))});
  assign wire41 = $signed((((reg30[(4'hc):(2'h3)] <<< (reg30 >> reg15)) && $unsigned((+reg17))) ?
                      reg8[(4'h9):(2'h3)] : wire0));
  assign wire42 = (+{(wire4[(3'h5):(1'h1)] ?
                          $unsigned({wire5}) : wire5[(4'hc):(3'h6)])});
endmodule
