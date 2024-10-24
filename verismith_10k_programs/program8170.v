module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire5,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned($signed(($unsigned(wire0) ?
                     (wire2 ? wire0 : wire2) : wire2))));
  assign wire5 = ((~|({wire4[(5'h10):(4'hc)],
                         wire1[(4'hf):(4'ha)]} + wire3[(2'h2):(1'h0)])) ?
                     ((($unsigned(wire3) >= wire4) >> $unsigned(wire0[(1'h0):(1'h0)])) + wire0[(1'h0):(1'h0)]) : ((+(((8'hbe) | (7'h44)) ?
                             $signed(wire4) : wire3)) ?
                         $signed($unsigned((~|wire3))) : (^~(^~{wire3,
                             wire4}))));
  always
    @(posedge clk) begin
      if ($signed(((($unsigned(wire5) ?
          wire4 : $unsigned(wire2)) + wire1) * wire1)))
        begin
          if (wire2)
            begin
              reg6 <= ($unsigned(wire4) == (&wire4[(1'h1):(1'h0)]));
              reg7 <= (((($signed(wire1) * wire0) ?
                      (wire5[(1'h0):(1'h0)] ?
                          (!wire4) : $unsigned(wire1)) : $signed(wire1[(4'ha):(1'h1)])) <= $signed({((8'hb6) * reg6),
                      $unsigned(wire4)})) ?
                  wire0 : wire1);
              reg8 <= {((+({wire4} | $signed(wire2))) < $signed($unsigned(wire2)))};
            end
          else
            begin
              reg6 <= {$unsigned((~((wire4 <= (8'ha3)) || (wire2 > reg8))))};
              reg7 <= wire5[(1'h1):(1'h1)];
              reg8 <= wire5[(4'h8):(2'h2)];
              reg9 <= (~wire5);
              reg10 <= (8'hb7);
            end
          reg11 <= {{(-$signed($signed(wire2))),
                  ((((8'h9c) << (7'h44)) ^~ $unsigned(wire4)) >= $unsigned(reg6[(4'hc):(3'h6)]))},
              wire1};
          reg12 <= $unsigned({wire4[(2'h3):(1'h0)], reg7});
          reg13 <= ((+$signed((!$signed(reg11)))) + reg8);
        end
      else
        begin
          reg6 <= ($unsigned(reg10) <<< (wire4 ?
              (wire0 - reg8) : (~|(^$signed((7'h41))))));
          if ((!(^~(wire5[(3'h6):(3'h5)] ?
              {$signed(wire5), $unsigned(wire0)} : reg13))))
            begin
              reg7 <= $signed(((+reg11[(2'h3):(2'h3)]) <= $unsigned((~&$signed(reg12)))));
              reg8 <= reg13;
              reg9 <= (reg6 ?
                  $signed($unsigned((wire1[(4'hb):(3'h5)] ^~ (reg10 ?
                      reg13 : (8'had))))) : $unsigned((reg6[(3'h7):(2'h2)] < reg12)));
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= wire1;
            end
        end
      reg14 <= {(&$unsigned((!$signed(reg11)))),
          (wire5[(2'h2):(1'h0)] ?
              {(~|wire1),
                  ({reg13, reg11} ? (~reg6) : wire1[(4'h8):(4'h8)])} : reg12)};
      if ({$unsigned((~|(~^reg12)))})
        begin
          if ($signed({reg10, (+$signed((wire2 < reg10)))}))
            begin
              reg15 <= ($unsigned(reg11) ?
                  reg8 : $signed((~&reg14[(4'ha):(2'h2)])));
            end
          else
            begin
              reg15 <= $signed($signed((+$signed((wire0 ? wire0 : reg14)))));
              reg16 <= (($unsigned($signed($unsigned(reg7))) ?
                      (^($unsigned(wire5) ^~ {(8'ha6)})) : (wire2[(2'h2):(1'h1)] ?
                          $signed(wire5[(3'h5):(3'h5)]) : (wire1[(3'h7):(1'h1)] - (reg11 == reg7)))) ?
                  {{$signed(reg8), wire3}} : (reg8 ?
                      ((7'h40) != ((wire0 <<< reg10) ?
                          (wire1 & reg7) : ((8'hb6) ?
                              wire1 : wire0))) : (reg13 <<< $signed($signed(reg9)))));
              reg17 <= ((^(-{reg8,
                  reg13})) <<< $signed(((-(|reg9)) - (|reg13))));
            end
        end
      else
        begin
          reg15 <= $signed({((wire2[(1'h0):(1'h0)] < (8'ha6)) ?
                  ($unsigned(reg11) ? $signed(reg17) : wire2) : wire4)});
          reg16 <= reg9[(3'h5):(3'h4)];
          reg17 <= wire0;
          if ((|($unsigned($signed(wire2[(1'h1):(1'h0)])) ?
              reg13[(1'h0):(1'h0)] : $unsigned((reg6 ?
                  (wire5 ? wire3 : reg10) : $unsigned(reg15))))))
            begin
              reg18 <= {wire3,
                  $signed((reg17 ?
                      (reg16 ? {reg16, (7'h42)} : $signed(wire1)) : ({reg7} ?
                          $unsigned(wire2) : $unsigned(reg17))))};
              reg19 <= {{(^~{wire5, (reg16 ? reg16 : reg15)})}};
            end
          else
            begin
              reg18 <= (((-reg19) ?
                      $unsigned(((-wire1) ?
                          $signed((8'hbb)) : $unsigned(reg13))) : ({reg14} ?
                          {wire5[(1'h0):(1'h0)],
                              reg13} : ($unsigned(reg7) ~^ (reg14 <<< reg10)))) ?
                  reg15[(3'h7):(3'h7)] : (^reg18));
              reg19 <= ({$unsigned($signed($unsigned(reg6)))} ? reg16 : wire4);
              reg20 <= ($signed({$unsigned((wire5 <<< reg7)),
                  reg9[(4'he):(4'he)]}) || (reg6[(4'hd):(3'h4)] ?
                  (~^reg7[(2'h3):(2'h2)]) : ($unsigned((~^(7'h41))) ?
                      $unsigned({wire3}) : $signed((reg12 * (8'ha1))))));
              reg21 <= $unsigned({{$unsigned(reg14[(5'h13):(4'hd)])},
                  (((~^reg10) ?
                      (wire1 ?
                          reg16 : wire3) : ((8'ha0) & reg11)) ^~ reg18[(1'h1):(1'h0)])});
            end
          if (reg15)
            begin
              reg22 <= $signed((reg17[(3'h4):(1'h0)] ?
                  $signed(wire1[(3'h5):(3'h4)]) : (($unsigned(reg8) ?
                      $signed(wire0) : (reg8 < reg6)) >> (reg11 ?
                      reg10[(4'hd):(1'h1)] : (^(8'ha8))))));
              reg23 <= (($unsigned((^(8'hb9))) == reg13[(4'hb):(4'h8)]) | {(~{$unsigned(reg21),
                      reg15})});
              reg24 <= (&reg20[(2'h2):(1'h1)]);
              reg25 <= $unsigned((~|reg9));
            end
          else
            begin
              reg22 <= (^~$unsigned(({{reg11},
                  reg22[(1'h0):(1'h0)]} != wire5)));
            end
        end
    end
  assign wire26 = reg14[(4'hc):(2'h3)];
  assign wire27 = $unsigned($signed(wire3[(2'h3):(2'h2)]));
  assign wire28 = ((~|reg9) ?
                      (!{{$unsigned(wire4)}}) : ($unsigned($signed($signed((8'ha6)))) ?
                          $unsigned((reg10[(5'h10):(1'h0)] ?
                              reg14 : reg25)) : wire1[(3'h4):(1'h0)]));
  assign wire29 = reg13[(3'h6):(2'h2)];
  assign wire30 = $signed(wire28);
  assign wire31 = $signed((reg21 * (reg25[(1'h0):(1'h0)] - $signed({reg14,
                      (8'ha1)}))));
endmodule
