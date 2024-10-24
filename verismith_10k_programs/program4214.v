module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire4,
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
                 reg5,
                 (1'h0)};
  assign wire4 = ((~|($unsigned(wire3) ?
                         ({wire2, wire3} ?
                             $unsigned(wire2) : (wire0 ?
                                 wire1 : wire0)) : wire0)) ?
                     $signed($signed(($unsigned(wire1) ?
                         $signed(wire0) : wire2[(3'h6):(3'h5)]))) : wire3);
  always
    @(posedge clk) begin
      reg5 <= $signed((((~wire4[(3'h6):(3'h4)]) < $unsigned((wire2 ^ wire1))) ^~ $unsigned($unsigned(wire3[(1'h1):(1'h1)]))));
      reg6 <= wire2;
      reg7 <= $signed(wire0);
    end
  always
    @(posedge clk) begin
      if (wire3[(1'h1):(1'h0)])
        begin
          reg8 <= ((+{(-reg6), $signed((wire3 >> wire3))}) ?
              (|($signed(reg6[(5'h14):(4'ha)]) <= $signed({wire2,
                  reg7}))) : $unsigned((wire3[(1'h1):(1'h1)] ?
                  ($unsigned(wire3) ?
                      (reg6 < reg7) : reg5[(2'h2):(1'h0)]) : ($unsigned(wire4) ?
                      $unsigned(reg6) : {(8'ha0), wire4}))));
          reg9 <= $unsigned(wire0[(3'h5):(3'h4)]);
          if ($unsigned($signed({(wire1[(3'h7):(1'h1)] ?
                  (wire3 ? reg8 : reg7) : (^wire0))})))
            begin
              reg10 <= reg9[(4'h8):(1'h0)];
              reg11 <= $unsigned($signed((reg7[(4'hf):(4'he)] | ($signed((8'hb5)) & $signed(reg10)))));
              reg12 <= ($unsigned((~&(7'h44))) >>> {($signed(wire3) ?
                      ({reg6} <= (wire3 + reg10)) : $signed({reg9})),
                  ((~&(wire2 && reg10)) ? $signed((~^wire1)) : (-(!reg6)))});
              reg13 <= (^reg11[(5'h11):(4'hc)]);
              reg14 <= (reg13[(2'h2):(1'h0)] < {{reg6[(2'h2):(1'h0)]}});
            end
          else
            begin
              reg10 <= (~&reg10[(4'ha):(4'h8)]);
            end
          reg15 <= reg9[(4'h9):(4'h8)];
          reg16 <= reg9;
        end
      else
        begin
          reg8 <= $signed(({reg10[(5'h10):(3'h5)], {$signed(reg8), reg9}} ?
              (((reg7 << (8'ha8)) ? (~&reg12) : $signed(wire0)) ?
                  reg16 : (wire3 & (-reg16))) : ((&{(8'ha9)}) < $unsigned($unsigned(reg12)))));
          if ($unsigned(((7'h43) * ($unsigned((reg5 >= reg16)) ?
              {$unsigned((7'h40))} : $signed({reg9, reg15})))))
            begin
              reg9 <= reg8;
              reg10 <= $unsigned($signed($unsigned(($unsigned(wire3) ?
                  (~reg9) : $signed(wire0)))));
              reg11 <= wire1;
              reg12 <= (+reg8[(2'h2):(2'h2)]);
            end
          else
            begin
              reg9 <= reg9;
              reg10 <= reg14;
              reg11 <= reg8[(1'h0):(1'h0)];
              reg12 <= ((wire4[(3'h5):(1'h0)] == $unsigned($unsigned((-reg14)))) ?
                  ((reg11[(4'hc):(2'h2)] ^ ((~^wire4) ~^ wire2[(2'h2):(2'h2)])) ?
                      $signed($unsigned($signed(reg6))) : (~^(wire1[(4'hc):(4'hb)] ?
                          {(7'h43), reg16} : $signed(reg13)))) : reg5);
              reg13 <= (-(^$unsigned((7'h42))));
            end
          reg14 <= $signed($unsigned(reg9));
        end
      reg17 <= reg15[(3'h7):(2'h2)];
      reg18 <= (((($unsigned(reg17) <= (+reg8)) ^~ reg14) >> ($unsigned(((8'hae) ?
              (8'ha9) : wire0)) ?
          ((wire0 >>> wire1) ?
              $unsigned(reg14) : (^wire1)) : (reg9[(3'h7):(2'h3)] | $signed(reg15)))) <<< ($signed(reg9[(1'h0):(1'h0)]) ^ ($unsigned(wire3) >> reg8[(1'h0):(1'h0)])));
    end
  assign wire19 = (-((reg9 - (((7'h44) == wire2) + wire0)) ?
                      ($signed((8'hb5)) && (^~(wire1 ?
                          wire0 : wire4))) : {$signed($signed(reg5))}));
  assign wire20 = (reg5 ?
                      (^~$signed(reg14[(1'h0):(1'h0)])) : ((-(^~(wire2 ?
                              reg9 : (8'h9c)))) ?
                          ({reg18[(1'h0):(1'h0)], reg6} * ($unsigned(wire3) ?
                              {(8'ha2)} : $unsigned((8'hb8)))) : reg11));
  assign wire21 = wire1;
  assign wire22 = {$signed(($unsigned(reg15[(4'h9):(3'h4)]) ?
                          $signed($unsigned(wire20)) : reg16[(4'h9):(3'h5)]))};
endmodule
