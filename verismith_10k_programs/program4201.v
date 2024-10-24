module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire10,
                 wire9,
                 wire5,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($unsigned((((wire1 ? wire3 : wire1) ?
                         $signed(wire2) : (wire0 ? wire4 : wire4)) - {(wire4 ?
                             (8'ha2) : wire1),
                         wire2})) ?
                     ((~&wire2[(3'h6):(2'h3)]) ?
                         {((wire4 <= wire0) != wire0)} : $unsigned(((8'haf) ^~ $signed(wire0)))) : wire0);
  always
    @(posedge clk) begin
      reg6 <= {(8'h9c), $signed(wire4)};
      reg7 <= $signed(((8'ha0) ? $signed(reg6) : $signed(wire4)));
      reg8 <= wire4[(1'h1):(1'h0)];
    end
  assign wire9 = $unsigned(reg8);
  assign wire10 = {(|$signed(((~|wire2) + (wire2 ? wire3 : wire9)))),
                      (({reg8[(1'h0):(1'h0)]} ^ wire5[(3'h7):(3'h5)]) ?
                          {$signed((&wire4))} : wire4[(2'h3):(1'h0)])};
  always
    @(posedge clk) begin
      reg11 <= (8'ha4);
      reg12 <= (~$unsigned($signed($unsigned((wire9 == (8'ha7))))));
      if (reg8[(3'h7):(3'h4)])
        begin
          reg13 <= $signed($unsigned((8'hb1)));
          reg14 <= wire0;
          if ((~&$unsigned(reg8)))
            begin
              reg15 <= $signed(wire9[(2'h3):(1'h1)]);
              reg16 <= $signed((^~($signed(((8'hb2) ?
                  reg6 : wire10)) >>> $signed(reg13))));
              reg17 <= ((wire1[(2'h2):(1'h0)] ?
                      $signed({$signed((7'h40)),
                          reg16}) : (((8'hb8) - wire9[(4'hb):(4'h9)]) > reg13[(5'h11):(3'h5)])) ?
                  (wire4[(1'h0):(1'h0)] ?
                      $unsigned(reg7[(3'h7):(1'h1)]) : $signed(reg13)) : (~|$signed((wire5[(3'h6):(1'h0)] <= wire9[(1'h0):(1'h0)]))));
              reg18 <= reg13[(3'h6):(3'h4)];
              reg19 <= (!($signed($signed($signed(wire9))) == $unsigned({(-wire9)})));
            end
          else
            begin
              reg15 <= reg14[(3'h6):(2'h2)];
              reg16 <= wire9;
              reg17 <= (&reg15);
            end
          reg20 <= (~&((((+wire4) ? {reg11, wire2} : $signed(wire0)) ?
                  (&((8'hb1) ? (8'hac) : wire2)) : (-$unsigned(wire0))) ?
              ((~reg6[(4'he):(4'h9)]) == (8'hbe)) : $unsigned($signed((8'ha3)))));
          reg21 <= (((!((reg20 * reg19) ? (^wire5) : reg16[(4'h9):(3'h5)])) ?
              (^~((reg14 < reg20) ?
                  (wire10 ?
                      reg8 : reg8) : (reg14 ^ reg13))) : wire10) - (~^($unsigned(reg6) ?
              (reg17 ? {wire4, wire0} : wire1) : (reg12[(4'h9):(3'h7)] ?
                  (reg18 ? reg12 : reg16) : reg17))));
        end
      else
        begin
          reg13 <= {{(^($signed(reg21) + {reg21, wire0}))},
              ({$signed(reg21)} ?
                  $signed(((wire9 ? reg20 : reg8) ?
                      reg7[(4'hb):(3'h7)] : $signed(reg8))) : (-$signed(wire10[(5'h11):(2'h2)])))};
          if ((~^reg13))
            begin
              reg14 <= (($signed(({reg16} ?
                          ((8'ha8) ? (8'ha2) : (8'ha8)) : (|wire0))) ?
                      wire5[(2'h3):(1'h1)] : ((((7'h41) ?
                          reg18 : reg18) > (reg21 << reg21)) ^~ ((reg13 ^~ reg15) ?
                          (+reg11) : (+wire3)))) ?
                  (~($unsigned((reg19 ? reg20 : reg14)) ?
                      $unsigned((reg18 >> reg19)) : (8'hbd))) : ((reg6[(4'hd):(2'h3)] | ((wire5 ?
                      wire1 : reg12) ^~ reg8)) >>> reg17));
            end
          else
            begin
              reg14 <= ($unsigned({($unsigned((8'ha1)) ?
                      {reg6, reg21} : {wire3, reg13})}) < reg8[(3'h6):(3'h4)]);
              reg15 <= {(reg11[(3'h5):(2'h2)] >= $unsigned(reg18[(1'h0):(1'h0)]))};
              reg16 <= {(|wire5[(2'h3):(1'h0)])};
            end
        end
      reg22 <= $unsigned($signed(((~(wire10 ? wire2 : reg15)) ?
          ($unsigned(reg18) <= reg7) : $unsigned(wire5))));
      reg23 <= ({($unsigned(wire2) ? (&{reg13}) : (+$unsigned((8'ha8)))),
          wire4[(2'h2):(2'h2)]} >>> $unsigned((((reg21 != reg15) ?
              ((8'hab) ? reg6 : reg13) : (8'hb0)) ?
          reg14 : $unsigned($unsigned(reg21)))));
    end
  assign wire24 = (reg21 ^ {reg6});
  assign wire25 = wire5;
  assign wire26 = wire25[(4'hc):(1'h1)];
  assign wire27 = ((({wire4[(2'h3):(1'h1)]} ?
                          wire5[(4'h9):(1'h0)] : $signed((!(8'hbb)))) != (&(wire25 ?
                          $unsigned(wire10) : reg7))) ?
                      (reg22[(4'h8):(3'h7)] ?
                          ((reg22 ? $unsigned(wire3) : (&wire0)) ?
                              $signed(wire25) : ((~|reg17) * {reg20,
                                  wire4})) : $unsigned(((reg11 ?
                              reg12 : wire9) != $unsigned(reg11)))) : (^~(reg23[(3'h7):(3'h5)] ?
                          $signed((wire9 == reg15)) : $unsigned((wire0 == reg23)))));
  assign wire28 = ($unsigned((((wire3 || reg16) & (wire10 << wire27)) ^ reg6)) ?
                      {wire4[(2'h3):(2'h2)],
                          $unsigned($signed($signed(wire1)))} : (($signed((reg8 ?
                                  reg22 : wire0)) ?
                              (wire1 ?
                                  $signed(reg15) : $unsigned(wire2)) : reg21) ?
                          reg8 : ((8'h9d) ?
                              reg7[(4'ha):(4'ha)] : $signed(wire27))));
endmodule
