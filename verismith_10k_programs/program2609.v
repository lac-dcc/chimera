module top
#(parameter param38 = ((~|((((8'ha4) + (8'hb3)) + ((8'hbb) ? (8'hbe) : (8'hb0))) <<< (~((7'h41) ? (7'h43) : (8'ha2))))) ^ {(~^(8'h9c)), {(8'had)}}), 
parameter param39 = param38)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire11,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ((((^$unsigned((wire2 ^ wire4))) ?
          (wire4 && $unsigned((&(8'ha0)))) : $unsigned(((^~wire2) ?
              $signed(wire0) : $signed((8'hbd))))) == {((+$signed(wire4)) ?
              ($unsigned(wire3) ?
                  $unsigned(wire3) : {wire1}) : ($signed(wire1) ?
                  $unsigned(wire1) : (wire3 ? wire4 : wire5)))}))
        begin
          reg6 <= ($signed((wire1 + ($unsigned(wire2) ?
                  (~wire0) : $unsigned(wire4)))) ?
              (!($signed((8'h9c)) - wire5[(2'h3):(2'h3)])) : $unsigned((wire0[(3'h4):(2'h3)] >>> (wire1 == (wire0 | (8'ha4))))));
          reg7 <= $signed(($signed(wire0) ? wire0 : wire4[(2'h2):(1'h1)]));
          reg8 <= (wire2[(5'h10):(1'h1)] <= $unsigned(wire4));
          reg9 <= reg7[(5'h11):(5'h10)];
          reg10 <= (^~$unsigned($unsigned($signed(reg6[(3'h7):(3'h7)]))));
        end
      else
        begin
          reg6 <= (!({$unsigned($unsigned(wire3)),
                  ($signed(reg6) ? (&reg8) : (+wire5))} ?
              $signed($unsigned((reg10 ?
                  reg10 : wire2))) : $unsigned((~|reg8))));
          reg7 <= ($signed(($unsigned($unsigned(wire0)) ?
                  wire0[(3'h4):(2'h3)] : $unsigned((wire1 ? wire5 : wire3)))) ?
              wire4 : reg6[(4'hc):(3'h7)]);
        end
    end
  assign wire11 = wire1[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ({$unsigned(reg7[(4'hb):(3'h5)]),
          $signed((($unsigned(reg8) ^ (reg8 ? reg8 : wire5)) ?
              (reg10[(2'h3):(2'h3)] ?
                  {reg8} : $unsigned(wire4)) : ($signed((7'h44)) << reg6[(4'hc):(3'h5)])))})
        begin
          if (wire2)
            begin
              reg12 <= reg10[(1'h1):(1'h0)];
              reg13 <= (($unsigned(({(8'had)} | (wire1 * reg12))) ?
                  (reg7 << wire3[(3'h7):(1'h0)]) : reg12[(4'h8):(1'h0)]) - ({(reg6 ?
                      (wire0 < wire5) : (reg12 ^ wire4))} || $signed(((wire3 ?
                      wire11 : reg12) ?
                  $signed((8'ha9)) : $unsigned(reg7)))));
            end
          else
            begin
              reg12 <= $signed((+{reg10[(1'h0):(1'h0)]}));
              reg13 <= $unsigned($signed(({$unsigned(wire2)} ?
                  $signed((reg12 ? wire3 : reg8)) : wire11[(4'hf):(4'h8)])));
            end
          reg14 <= $signed(wire1);
          reg15 <= (~(wire3[(5'h11):(4'hf)] ?
              {$unsigned((wire2 == wire0)),
                  $unsigned($signed(reg6))} : $signed($signed((reg6 ?
                  wire3 : (8'hae))))));
          reg16 <= (reg7[(4'hf):(2'h2)] ? wire0 : (&reg12[(4'hd):(4'hd)]));
          reg17 <= $signed((($unsigned($unsigned(wire5)) ?
                  wire11 : reg15[(3'h5):(2'h2)]) ?
              reg15[(1'h0):(1'h0)] : {wire4[(3'h5):(2'h3)]}));
        end
      else
        begin
          if ((^wire11[(2'h3):(1'h1)]))
            begin
              reg12 <= $unsigned(reg7[(5'h14):(1'h1)]);
              reg13 <= reg7[(5'h13):(3'h5)];
              reg14 <= wire4;
              reg15 <= (wire3 ?
                  ({($signed(reg9) ? reg10[(2'h3):(2'h2)] : (reg14 == reg10)),
                      ($signed(wire0) ?
                          wire11 : $signed((8'hae)))} < ($unsigned(reg12[(3'h5):(3'h4)]) ?
                      {$unsigned(reg10)} : reg16[(2'h2):(1'h0)])) : $unsigned((^~($signed(wire1) ?
                      {wire4, wire11} : ((8'haa) ? wire1 : wire2)))));
            end
          else
            begin
              reg12 <= reg7;
              reg13 <= (!$unsigned(reg16));
              reg14 <= (~|((reg14[(1'h1):(1'h1)] ?
                  $unsigned(((7'h42) ?
                      reg7 : (8'hb2))) : (^~(reg10 ^~ reg14))) >>> reg16[(4'hf):(4'h9)]));
              reg15 <= reg10;
              reg16 <= {(&(~&($signed(reg13) ? reg17 : $unsigned(reg13)))),
                  wire4};
            end
          if ((~&wire4[(2'h3):(2'h2)]))
            begin
              reg17 <= ((reg17[(1'h1):(1'h1)] << $signed(reg12)) ?
                  (wire0 < $unsigned(((~wire3) ?
                      $unsigned((8'ha7)) : wire11))) : reg15[(4'h8):(3'h7)]);
            end
          else
            begin
              reg17 <= ((wire1[(3'h6):(3'h5)] && reg10[(1'h0):(1'h0)]) ?
                  (~&$signed((~{reg17}))) : wire11[(3'h6):(2'h2)]);
              reg18 <= (-{{(^(-reg8))}});
              reg19 <= $unsigned((8'had));
              reg20 <= $signed(reg16);
            end
          reg21 <= (-(reg12[(3'h7):(3'h6)] != {wire1[(1'h0):(1'h0)]}));
          reg22 <= $signed($unsigned((wire2[(4'ha):(1'h1)] ?
              (reg8[(4'ha):(2'h3)] < $signed((8'ha8))) : $signed($unsigned(reg20)))));
          reg23 <= (reg9 ?
              (|$unsigned($signed(reg18))) : reg12[(5'h10):(4'hd)]);
        end
      reg24 <= (reg15 >= ($unsigned($unsigned($signed(wire3))) << (~|$signed($unsigned(reg9)))));
      if (reg23)
        begin
          reg25 <= (!($unsigned($unsigned(wire11[(4'ha):(3'h6)])) ^ reg13));
          reg26 <= wire2;
          reg27 <= (8'haf);
        end
      else
        begin
          if (reg27)
            begin
              reg25 <= wire5;
              reg26 <= $unsigned((~^reg22[(2'h3):(1'h0)]));
              reg27 <= reg12[(3'h5):(3'h4)];
              reg28 <= (|wire2[(5'h12):(2'h3)]);
              reg29 <= (^~(((reg26[(4'hb):(3'h7)] <<< {reg24, reg8}) ?
                  ((wire11 < reg22) ?
                      reg7 : $unsigned(reg12)) : ($signed(reg18) ?
                      $unsigned(reg10) : (-reg16))) - reg17));
            end
          else
            begin
              reg25 <= wire11[(2'h3):(2'h3)];
              reg26 <= reg23;
              reg27 <= (reg12[(4'hb):(4'hb)] ?
                  {{(8'ha9), ($unsigned(wire5) ? reg25 : $unsigned(reg21))},
                      {{$unsigned(reg20), (|reg24)},
                          ((~reg12) ^ (wire4 * reg15))}} : reg14[(1'h0):(1'h0)]);
            end
          reg30 <= ($unsigned(reg26[(5'h10):(4'hc)]) + ((~|reg7) + ($unsigned((8'h9e)) - (8'hac))));
          reg31 <= $unsigned((&$signed(($signed(reg17) & wire0[(1'h0):(1'h0)]))));
          reg32 <= reg31;
        end
      reg33 <= reg18[(3'h5):(1'h0)];
      reg34 <= ((wire11 & $signed(reg6)) ?
          ($unsigned((reg25[(3'h4):(2'h2)] ?
              reg16[(1'h0):(1'h0)] : (reg31 & reg29))) | reg29[(1'h0):(1'h0)]) : $signed(reg31[(4'h8):(3'h6)]));
    end
  always
    @(posedge clk) begin
      reg35 <= {reg18[(1'h0):(1'h0)], {$signed((~|reg30))}};
      reg36 <= $unsigned((reg26 && ($signed((~|reg16)) ^ $signed($signed(reg29)))));
      reg37 <= reg23;
    end
endmodule
