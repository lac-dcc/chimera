module top
#(parameter param32 = ((|(~&{((8'hb2) ? (8'hbb) : (8'ha1))})) - (((+(~&(8'haf))) ? (((8'hab) ~^ (8'ha8)) || (^~(8'haf))) : ({(7'h42)} < ((8'hac) ? (8'hac) : (8'ha6)))) ^ (~(((8'hb5) ? (8'ha7) : (8'hb6)) ? (~&(8'hba)) : (^(8'haf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire9,
                 wire5,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire1 ?
                     $unsigned((($signed((8'hae)) ?
                         (^~wire2) : $unsigned(wire3)) << (!(!wire0)))) : (^~(wire2 & ((+wire2) || (~|(8'hbe))))));
  assign wire5 = ((!wire4) ?
                     (((wire4[(1'h1):(1'h0)] ~^ $unsigned(wire3)) ?
                             wire3 : ($unsigned(wire4) ? {wire2} : wire2)) ?
                         $unsigned($signed(wire3)) : $signed(wire2)) : wire2[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg6 <= $unsigned((^~$unsigned(wire4[(2'h2):(2'h2)])));
      reg7 <= (-{wire2[(3'h4):(1'h0)], $unsigned($unsigned((~reg6)))});
      reg8 <= ({(reg6 ? (~wire3) : $unsigned((wire0 ? wire3 : (8'hb5)))),
          {(-(!wire1))}} & ((~$signed($unsigned((7'h44)))) ?
          (-(reg6[(4'hc):(3'h5)] <= wire5)) : ($unsigned((~&wire5)) & (wire3[(4'he):(4'ha)] >= $signed((8'hae))))));
    end
  assign wire9 = $unsigned({(8'hb6), reg8[(3'h6):(1'h1)]});
  always
    @(posedge clk) begin
      reg10 <= (($unsigned((((7'h44) ? (8'ha9) : wire4) ?
              (wire4 ? reg8 : wire3) : (~reg6))) ?
          {reg6, wire0} : $unsigned({(wire4 >>> wire1),
              ((8'hba) << wire3)})) == $signed(($signed($signed(reg7)) * (((8'hb4) <<< wire3) ?
          wire0[(3'h4):(1'h1)] : {(8'hb0)}))));
      if ((8'h9d))
        begin
          reg11 <= $unsigned(((wire0[(2'h3):(1'h1)] < wire2[(4'hb):(3'h5)]) ?
              (8'ha5) : reg8));
          reg12 <= $unsigned(wire5[(3'h7):(3'h6)]);
          reg13 <= ({$signed((~|(wire9 < (8'h9d)))),
              reg12[(1'h1):(1'h1)]} & reg11[(2'h3):(1'h1)]);
          reg14 <= {(wire0[(2'h3):(1'h0)] <<< reg12),
              ((|(wire4[(1'h0):(1'h0)] >> {reg7})) ^ $signed(wire3))};
        end
      else
        begin
          reg11 <= (-reg14);
          reg12 <= (~(^($unsigned((reg14 ^~ reg13)) ?
              (((8'h9f) ? wire0 : wire9) ~^ reg7) : wire3[(4'ha):(2'h2)])));
          reg13 <= (wire5[(4'hc):(3'h6)] && $unsigned($unsigned(reg6[(3'h5):(2'h3)])));
          reg14 <= (reg12 ? $unsigned({wire2[(4'hc):(3'h7)]}) : reg10);
        end
      reg15 <= $unsigned(($unsigned(((reg14 & wire3) ?
              (wire9 != wire9) : $unsigned(reg11))) ?
          ((^~wire4[(2'h2):(1'h1)]) ?
              {$signed(wire4),
                  wire1[(1'h1):(1'h0)]} : $unsigned((wire5 + wire2))) : ((((8'hab) | reg7) != (8'ha0)) ?
              ((~&(8'ha2)) ?
                  (reg6 ^ reg12) : reg12[(2'h3):(1'h1)]) : (8'ha9))));
    end
  assign wire16 = reg12;
  assign wire17 = $signed(wire9[(2'h3):(2'h3)]);
  assign wire18 = (reg12 + $signed(wire16[(1'h1):(1'h1)]));
  assign wire19 = $unsigned(wire3);
  assign wire20 = ($unsigned($unsigned($unsigned(((8'ha9) ?
                      reg14 : wire0)))) < $signed(wire17[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg21 <= (^(^(8'hbd)));
      reg22 <= $unsigned((|({wire2[(1'h1):(1'h0)],
          wire18[(3'h4):(2'h3)]} >> ((!wire1) * (-wire0)))));
      reg23 <= {wire1};
      reg24 <= $unsigned((($signed(reg6) << ($unsigned(wire17) <= {reg15})) ?
          ($signed(reg10) + (^~(wire19 * wire17))) : (((8'ha6) ?
              reg10[(4'ha):(4'ha)] : $unsigned(wire17)) ^~ (8'hb0))));
      reg25 <= $unsigned((wire16[(1'h1):(1'h0)] >> $unsigned(reg24[(1'h1):(1'h0)])));
    end
  assign wire26 = wire19;
  assign wire27 = wire1[(3'h6):(3'h6)];
  assign wire28 = $unsigned(reg6[(4'hd):(4'hd)]);
  assign wire29 = ($unsigned(wire18[(1'h0):(1'h0)]) | reg23);
  assign wire30 = $signed(reg23[(1'h1):(1'h1)]);
  assign wire31 = ((|(+wire16)) ?
                      reg24 : ($unsigned($signed(wire3[(3'h5):(2'h3)])) ?
                          $unsigned($unsigned({reg11,
                              reg14})) : $unsigned(wire18[(2'h3):(2'h2)])));
endmodule
