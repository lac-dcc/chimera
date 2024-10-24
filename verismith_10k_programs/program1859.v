module top
#(parameter param32 = ({(^((^(8'hb9)) ? (+(7'h41)) : (^~(8'h9f))))} ? ((~(((8'ha5) + (8'haa)) <<< ((8'hae) ? (8'h9f) : (8'hb6)))) ? {((~|(8'hb6)) >> ((8'hb7) ~^ (8'hb3)))} : (({(8'h9e)} ? (-(8'ha3)) : ((8'hb1) ^~ (8'hb1))) & (-{(8'h9c), (8'hab)}))) : ({(((7'h42) >> (8'ha6)) + ((8'h9c) ? (8'hba) : (8'ha1))), (~|((8'hb4) << (8'ha5)))} > (-(((8'ha8) ? (8'ha9) : (8'ha1)) ^ (|(8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg31,
                 reg30,
                 reg25,
                 reg23,
                 reg22,
                 reg21,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = {$unsigned(wire4)};
  assign wire6 = (wire1[(3'h7):(3'h7)] ?
                     ($signed((~|(wire3 ?
                         wire2 : wire0))) >= ($signed($signed(wire3)) ?
                         $unsigned($signed(wire5)) : (+((8'ha0) ?
                             wire4 : wire1)))) : (^~($signed((wire1 ?
                         wire5 : wire5)) != (+(wire3 ^ wire5)))));
  assign wire7 = (|($unsigned(($signed(wire2) ?
                     $signed(wire2) : (~wire3))) < (wire1[(2'h2):(1'h1)] | ((wire2 ?
                     (8'haf) : wire6) ~^ (wire2 << wire0)))));
  assign wire8 = {(-($unsigned(wire5) ?
                         wire6[(1'h1):(1'h0)] : $unsigned(wire1[(3'h7):(1'h0)]))),
                     {$signed({(~|wire0), $signed(wire5)})}};
  assign wire9 = $unsigned({(({wire6, wire2} >= (8'ha1)) ?
                         wire7 : ((wire7 * wire2) ?
                             $unsigned(wire1) : wire8[(2'h3):(1'h0)]))});
  always
    @(posedge clk) begin
      reg10 <= (wire4 ?
          ((($unsigned(wire9) ?
                  (8'hb1) : $signed(wire1)) != {((8'hae) <= (8'haa))}) ?
              wire0[(1'h0):(1'h0)] : $signed(wire9[(2'h3):(1'h1)])) : wire1[(2'h3):(2'h2)]);
      if ($signed(($unsigned((&$signed(wire6))) ~^ (+(|(!wire3))))))
        begin
          reg11 <= (+wire8);
          reg12 <= $unsigned(wire9);
          reg13 <= wire5[(3'h6):(2'h3)];
        end
      else
        begin
          reg11 <= $signed(($unsigned($unsigned((wire4 == reg10))) <<< (wire1[(4'h9):(1'h1)] + {$signed((8'hb3))})));
          reg12 <= $unsigned(wire0[(4'hc):(3'h6)]);
          if ({$signed(wire9[(4'hc):(1'h0)])})
            begin
              reg13 <= (~^wire6);
              reg14 <= $signed($signed($signed(($unsigned(reg10) > (^~wire1)))));
              reg15 <= $signed(wire6[(3'h4):(2'h2)]);
              reg16 <= (wire9[(3'h6):(3'h6)] ?
                  (~^(wire4[(2'h2):(1'h0)] ~^ wire5[(5'h12):(4'h8)])) : (8'ha0));
              reg17 <= ($signed({{(reg15 >= wire4)},
                  {(^~wire1), (wire1 ~^ wire9)}}) ^~ (+$signed($signed((wire8 ?
                  reg12 : reg13)))));
            end
          else
            begin
              reg13 <= wire1[(3'h6):(1'h0)];
              reg14 <= (-(($signed({wire9, reg14}) ?
                  reg16[(4'hb):(2'h2)] : ((wire8 <= (7'h41)) ?
                      (reg12 > wire0) : reg16)) >> (~^$signed((^wire2)))));
              reg15 <= ({$unsigned($signed($signed(reg14)))} > reg11[(2'h3):(1'h1)]);
              reg16 <= $signed({$unsigned($unsigned((reg14 & wire5)))});
              reg17 <= (-$signed((8'ha2)));
            end
        end
    end
  assign wire18 = $signed($unsigned((-($unsigned(reg17) == (reg13 >= reg10)))));
  assign wire19 = ((~|$unsigned(((wire9 ~^ reg14) || (wire5 ?
                          reg14 : reg16)))) ?
                      $unsigned($unsigned((!wire18))) : wire4[(1'h1):(1'h1)]);
  assign wire20 = $signed($signed($unsigned((~^$unsigned((8'ha1))))));
  always
    @(posedge clk) begin
      reg21 <= reg15;
      if (reg15)
        begin
          reg22 <= $unsigned(wire19);
        end
      else
        begin
          reg22 <= ($signed($signed((reg10[(1'h0):(1'h0)] ?
              {reg10} : reg16[(4'hc):(3'h5)]))) & ($signed(((wire3 ?
                      wire8 : wire19) ?
                  $signed(wire19) : $signed(wire20))) ?
              {$unsigned((^(8'hb3)))} : $signed($signed({wire6, wire2}))));
          reg23 <= $unsigned(((7'h42) ?
              (reg14 != wire1) : $signed($unsigned($unsigned(wire0)))));
        end
    end
  assign wire24 = reg17[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg25 <= (wire24[(1'h1):(1'h1)] ?
          $unsigned(((wire8 ? wire20 : (wire9 >> reg22)) ?
              wire18[(4'he):(4'hd)] : wire5)) : wire5);
    end
  assign wire26 = wire1;
  assign wire27 = $signed(wire5);
  assign wire28 = $signed(wire5);
  assign wire29 = $signed({reg22[(3'h5):(1'h0)],
                      $signed(wire3[(4'h8):(1'h1)])});
  always
    @(posedge clk) begin
      reg30 <= reg14[(4'hf):(3'h4)];
      reg31 <= ($unsigned((reg14 == {{reg10,
              reg10}})) <<< $unsigned({reg11[(3'h6):(1'h1)]}));
    end
endmodule
