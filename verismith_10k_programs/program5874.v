module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h259):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire56,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 wire37,
                 wire28,
                 wire14,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = wire2[(2'h3):(2'h3)];
  assign wire6 = $signed((~&wire0[(4'hd):(3'h6)]));
  assign wire7 = ((&((|$unsigned(wire4)) != ((wire4 <<< wire3) + ((8'haf) ?
                         (7'h44) : (8'ha6))))) ?
                     ($signed((&(8'ha1))) == (wire5 < $unsigned(wire0))) : $unsigned(($signed($unsigned((8'hba))) ?
                         wire0 : ($unsigned(wire3) & (wire5 ?
                             wire0 : (8'h9f))))));
  assign wire8 = ((($signed({(8'hb4)}) ?
                         ((wire3 >= (8'hb8)) ?
                             wire5[(2'h3):(2'h2)] : $signed((8'hbd))) : (&wire2[(2'h3):(2'h2)])) ?
                     ($unsigned((wire3 & wire5)) < wire7[(3'h4):(2'h2)]) : $unsigned($unsigned((wire4 <= (8'hbc))))) << $unsigned((8'ha1)));
  assign wire9 = ($unsigned($signed($signed($signed(wire2)))) | (((^(^wire6)) ?
                         (~&{wire0}) : (&wire4)) ?
                     $signed($unsigned((wire8 ?
                         wire5 : wire4))) : wire0[(1'h1):(1'h0)]));
  assign wire10 = ($unsigned($signed(({wire3,
                          wire4} || wire7[(1'h1):(1'h1)]))) ?
                      {$unsigned($signed((wire8 >> wire1))),
                          (wire0[(3'h5):(1'h0)] ?
                              $unsigned((wire6 ?
                                  wire3 : wire6)) : $unsigned($unsigned(wire2)))} : $unsigned($unsigned($signed(wire1[(3'h5):(1'h0)]))));
  always
    @(posedge clk) begin
      reg11 <= (($signed(wire0) >> wire3[(2'h3):(1'h1)]) ?
          $signed(wire4[(1'h1):(1'h1)]) : wire3[(5'h13):(3'h7)]);
      reg12 <= wire4[(4'h9):(4'h8)];
      reg13 <= {(^~(reg12 ?
              {(8'hbd), $unsigned(reg12)} : wire6[(4'he):(2'h2)]))};
    end
  assign wire14 = (+(((-{wire2, wire4}) ?
                      ((wire6 << wire7) ?
                          $unsigned(wire1) : (wire1 * wire4)) : ($signed(wire7) && (wire4 ?
                          wire3 : wire8))) && $unsigned(wire9)));
  always
    @(posedge clk) begin
      reg15 <= ($signed(((&wire4) ?
          (^~(wire6 ? (8'ha7) : reg13)) : (8'hbf))) && (wire6[(4'h8):(3'h7)] ?
          ($unsigned($unsigned(wire5)) >> (((8'h9c) ?
              wire5 : wire9) < wire4[(1'h1):(1'h0)])) : (((wire1 ?
                      wire7 : wire4) ?
                  {wire8} : (8'ha8)) ?
              ((wire10 ?
                  reg11 : reg12) | $signed(wire4)) : reg11[(4'h9):(2'h3)])));
      reg16 <= $signed($unsigned(($unsigned($signed(wire8)) ?
          ($unsigned(wire14) * (~|(8'hb4))) : (reg15 & (reg15 ?
              wire5 : wire3)))));
      reg17 <= (wire0 << wire10[(4'h9):(1'h1)]);
      reg18 <= (|$unsigned(wire7));
    end
  always
    @(posedge clk) begin
      reg19 <= $signed((($signed($signed((7'h44))) ?
              {(wire4 != reg18)} : ($unsigned(wire7) ?
                  reg17[(3'h5):(1'h0)] : reg16[(3'h5):(1'h0)])) ?
          ($unsigned(reg15) ^~ $signed((wire7 ?
              wire8 : wire1))) : ($unsigned(reg18) ?
              reg15[(1'h0):(1'h0)] : (+(reg13 << wire0)))));
      if ({(reg19[(2'h3):(1'h1)] ?
              $unsigned(wire6) : (^($signed(reg11) * (7'h41)))),
          reg15[(4'h9):(1'h0)]})
        begin
          reg20 <= wire9;
          reg21 <= $signed(($unsigned(wire7) <<< (&wire1[(2'h2):(1'h1)])));
          reg22 <= wire7[(1'h0):(1'h0)];
          reg23 <= (((|wire5[(4'h8):(3'h5)]) && $signed((^~$signed(reg21)))) ?
              ($unsigned((8'hb9)) >= ({reg22,
                  $signed(reg21)} >> reg19)) : (((wire10 ?
                  wire6[(4'he):(3'h6)] : $signed(wire7)) || (!$unsigned(reg18))) <<< (8'ha9)));
          reg24 <= $signed(reg20);
        end
      else
        begin
          reg20 <= $signed(((reg13[(4'ha):(3'h5)] ? reg16 : reg19) ?
              (^(&$signed(reg19))) : (|($signed(wire8) ^~ reg17))));
          if (wire2)
            begin
              reg21 <= (^(+(~$unsigned($signed(reg20)))));
              reg22 <= (8'h9f);
              reg23 <= {wire5[(1'h1):(1'h0)]};
              reg24 <= $signed((!(((!reg11) != (&wire7)) ?
                  reg20 : (wire5 ? reg11 : wire6))));
            end
          else
            begin
              reg21 <= wire6[(2'h3):(1'h1)];
              reg22 <= reg17[(2'h3):(2'h2)];
              reg23 <= (|(&(~|($signed(wire4) ?
                  wire2 : (reg19 ? reg22 : wire3)))));
            end
        end
      reg25 <= ($signed(reg15[(1'h1):(1'h1)]) ?
          {($signed((8'haa)) * wire10[(4'h8):(1'h0)]),
              wire6[(4'h9):(3'h4)]} : ($signed(wire7[(1'h0):(1'h0)]) ?
              {reg11, wire5} : wire1[(3'h4):(1'h1)]));
      if ((((|$unsigned({wire0, wire5})) ?
              $signed({reg11[(4'h9):(2'h3)], wire3}) : reg20) ?
          (((reg25[(1'h0):(1'h0)] ?
              (reg21 + wire14) : (~|wire7)) && (~^wire1[(2'h3):(1'h1)])) == ((((7'h43) & reg23) - (^wire2)) ?
              $signed((wire8 < (8'hbf))) : $signed(wire3))) : (reg17 ?
              $unsigned((-(reg23 | wire8))) : $signed(reg20))))
        begin
          reg26 <= (|$signed({wire1[(1'h0):(1'h0)],
              ($signed(reg20) | reg13[(1'h0):(1'h0)])}));
        end
      else
        begin
          if (({$signed(wire7)} ?
              ((!(&{reg25, wire7})) ?
                  $signed(($unsigned(wire3) >>> wire1)) : wire3[(4'ha):(3'h4)]) : (+reg17)))
            begin
              reg26 <= $unsigned(((-$unsigned((reg11 ? (8'hbb) : wire10))) ?
                  ((&wire8) ?
                      wire6 : reg13) : $unsigned(($unsigned(reg11) != ((8'hb9) != reg20)))));
            end
          else
            begin
              reg26 <= $unsigned((|(&$signed(wire4[(4'ha):(2'h2)]))));
              reg27 <= ((^~(-((wire7 ~^ wire0) ?
                      wire2[(2'h3):(1'h0)] : $unsigned(wire5)))) ?
                  reg18[(3'h5):(2'h3)] : wire6);
            end
        end
    end
  assign wire28 = ((wire2[(2'h3):(1'h0)] ?
                          $unsigned($signed($signed(reg18))) : ({(!reg21)} ?
                              (~^(reg26 ?
                                  wire8 : reg26)) : $signed($signed(reg16)))) ?
                      (8'hac) : ({reg20[(2'h2):(2'h2)], (|$signed(reg20))} ?
                          $signed(wire4) : (reg27[(3'h5):(1'h0)] > $unsigned((-reg23)))));
  always
    @(posedge clk) begin
      reg29 <= wire5[(3'h5):(1'h0)];
      reg30 <= $signed((^~reg23[(5'h10):(2'h2)]));
      if (wire0)
        begin
          reg31 <= (~^$unsigned($signed(((reg20 ?
              reg25 : (7'h40)) ^~ (wire14 > (8'haa))))));
          reg32 <= wire28[(1'h0):(1'h0)];
          reg33 <= $signed({({$signed(wire7)} ?
                  (wire7 ? (reg21 ? reg24 : reg22) : $signed((8'hab))) : reg31),
              $signed({((8'hbc) ? wire7 : reg13)})});
        end
      else
        begin
          reg31 <= (reg13 * $unsigned({((~^reg19) <= $unsigned(reg29))}));
          reg32 <= $unsigned(($signed(wire4) ?
              ((-wire28[(1'h1):(1'h0)]) | ((^~wire8) ?
                  $unsigned(wire4) : wire7)) : (^($signed(reg21) ?
                  (^reg12) : reg15[(4'h9):(3'h4)]))));
          reg33 <= wire8[(3'h6):(2'h3)];
          reg34 <= (((reg26[(4'hc):(2'h3)] ~^ $unsigned((&reg12))) || (8'h9d)) ?
              (|($unsigned((wire9 ? (8'hac) : (8'ha2))) ?
                  ((reg27 ? (8'ha4) : reg11) ?
                      $signed(wire4) : (+reg15)) : reg11[(2'h2):(1'h0)])) : {((^reg24) ?
                      {reg19[(4'hb):(4'h9)]} : (^$signed(wire9))),
                  (wire5 ?
                      ((reg23 ? reg23 : wire0) ?
                          (reg13 ^ wire0) : $signed(wire8)) : $signed({wire4,
                          (8'hb5)}))});
          reg35 <= $signed(wire28[(1'h1):(1'h0)]);
        end
      reg36 <= wire1;
    end
  assign wire37 = (reg34[(1'h1):(1'h0)] <= ({$signed((~&wire14)),
                      $signed($signed(reg16))} != (reg32 ?
                      ($signed(reg30) ?
                          $signed((8'h9f)) : reg13[(2'h2):(1'h1)]) : $signed($unsigned(reg13)))));
  assign wire38 = $unsigned($signed($unsigned($unsigned({reg19}))));
  assign wire39 = reg15;
  always
    @(posedge clk) begin
      reg40 <= {(-wire0[(2'h2):(1'h1)]), reg24[(1'h1):(1'h0)]};
      reg41 <= {reg30};
      reg42 <= $unsigned((((reg35 | $signed(reg23)) ?
          $unsigned((~|(8'ha7))) : (8'hae)) >> ($signed($unsigned(wire8)) ?
          reg16[(5'h10):(4'h9)] : reg41[(2'h3):(2'h2)])));
      reg43 <= (8'hb1);
    end
  assign wire44 = ((8'hb6) || (~|{(8'ha9)}));
  assign wire45 = ({(reg26 ?
                              ({reg32} ?
                                  $signed(wire8) : (wire2 - reg22)) : $signed(wire10[(4'he):(1'h0)])),
                          ({(wire10 * wire5), reg34} & reg27[(2'h3):(2'h3)])} ?
                      (^$unsigned($unsigned(wire6[(4'he):(3'h4)]))) : {$signed((~|wire6))});
  assign wire46 = (reg17[(3'h6):(3'h4)] <<< reg29[(1'h1):(1'h0)]);
  assign wire47 = reg33;
  always
    @(posedge clk) begin
      if (reg31[(3'h5):(3'h5)])
        begin
          reg48 <= ($unsigned((8'haf)) <= (((+reg29) ?
              {(8'ha9), (reg36 ? (8'hb9) : wire46)} : wire5) <= reg34));
          if (wire37[(2'h3):(1'h0)])
            begin
              reg49 <= $signed({$signed(wire44),
                  $signed((reg21[(3'h4):(2'h3)] >= $signed(wire6)))});
              reg50 <= ($signed(reg19[(4'hc):(3'h5)]) ?
                  ($unsigned(wire44) ?
                      (|reg29[(3'h4):(1'h1)]) : (8'ha5)) : $unsigned($signed({$signed(reg15)})));
              reg51 <= $unsigned((~^wire2[(1'h0):(1'h0)]));
            end
          else
            begin
              reg49 <= (reg34 ? reg19[(4'ha):(3'h7)] : reg16);
            end
          reg52 <= $signed(($signed($unsigned({reg18, reg48})) & wire46));
        end
      else
        begin
          reg48 <= $unsigned($unsigned({(reg15 ?
                  $unsigned(reg35) : wire28[(1'h1):(1'h0)]),
              (&reg13[(4'hb):(4'hb)])}));
          if ($unsigned(((reg49[(3'h4):(3'h4)] <= {{reg29, wire0}, wire4}) ?
              (+reg24[(2'h2):(1'h0)]) : ($unsigned((wire37 > reg30)) ~^ (~&{wire39,
                  reg20})))))
            begin
              reg49 <= (((reg12[(2'h2):(1'h0)] > (|(wire39 | reg43))) ?
                  (((^wire14) && $signed(reg27)) ?
                      ($signed(wire3) < reg41) : $signed(reg12[(1'h1):(1'h0)])) : (8'ha4)) - (reg19[(3'h4):(1'h0)] ?
                  wire8[(4'h9):(2'h3)] : $unsigned(wire2[(2'h2):(2'h2)])));
              reg50 <= reg35[(4'h8):(2'h3)];
            end
          else
            begin
              reg49 <= wire44;
              reg50 <= reg24[(2'h2):(1'h0)];
            end
          reg51 <= ((8'ha6) ? wire44 : reg29);
          reg52 <= reg35;
        end
      reg53 <= wire39;
      reg54 <= {$unsigned(wire8)};
      if ($signed(reg48))
        begin
          reg55 <= $unsigned((8'hb8));
        end
      else
        begin
          reg55 <= {$signed($unsigned($signed((reg27 ? (8'ha6) : reg24)))),
              (((^~$signed(reg48)) ?
                      (&$unsigned(wire10)) : ($unsigned(reg55) == wire6)) ?
                  {$signed((!reg16)), reg15} : {wire7[(2'h3):(1'h1)],
                      ($signed((8'ha0)) ~^ $unsigned(wire8))})};
        end
    end
  assign wire56 = $unsigned($unsigned({($signed(reg32) ?
                          (reg31 ? (8'hae) : wire9) : (reg50 <<< reg30))}));
endmodule
