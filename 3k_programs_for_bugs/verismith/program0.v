module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire4,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {wire2};
  always
    @(posedge clk) begin
      if ({(~(wire3 >>> (wire1 >> (wire1 ? (8'hb4) : wire3)))),
          (wire2[(2'h2):(1'h0)] ?
              (|(wire0 ? (wire4 != wire4) : (wire2 ^~ wire1))) : {wire4,
                  (!(wire3 + wire3))})})
        begin
          reg5 <= wire4;
          reg6 <= ((8'h9e) ^ wire2);
          reg7 <= $signed(wire4);
          reg8 <= wire1[(4'ha):(4'h9)];
        end
      else
        begin
          if ((^~reg6[(3'h5):(2'h2)]))
            begin
              reg5 <= (|$signed({(^~{reg7}), (^~wire4)}));
            end
          else
            begin
              reg5 <= reg5[(1'h1):(1'h0)];
              reg6 <= wire4[(3'h4):(2'h2)];
              reg7 <= wire1;
              reg8 <= {((((8'hbc) ?
                      $signed(wire1) : reg6[(3'h6):(3'h4)]) << (reg7 && (wire2 + (8'h9d)))) && (((reg5 ?
                          (7'h40) : wire1) + (wire4 ? wire3 : reg8)) ?
                      ($signed(reg5) ?
                          wire4[(2'h2):(1'h0)] : (reg6 ?
                              reg6 : (8'hb4))) : {(~|wire3)}))};
            end
          reg9 <= $unsigned((({{wire1}} >> $unsigned((reg8 ?
              wire0 : reg7))) > wire2));
          if (wire0[(5'h12):(1'h1)])
            begin
              reg10 <= $signed(wire0);
              reg11 <= ((reg9[(2'h2):(2'h2)] + {((^wire4) && $signed((8'hb9))),
                      ((wire0 ? wire0 : (8'h9e)) == ((8'h9d) ?
                          wire1 : reg5))}) ?
                  {(wire3[(1'h1):(1'h0)] ?
                          (((8'ha1) ? reg9 : reg9) ?
                              (~^(8'hb8)) : reg9[(2'h2):(1'h1)]) : wire0)} : ($unsigned(reg9) + $signed($signed({reg9,
                      reg9}))));
              reg12 <= ({wire2} ^ {wire4[(2'h3):(1'h0)],
                  $unsigned(wire1[(3'h5):(1'h1)])});
              reg13 <= wire1;
              reg14 <= reg8;
            end
          else
            begin
              reg10 <= {(reg7[(5'h14):(3'h4)] || (~|wire2)),
                  reg11[(1'h1):(1'h1)]};
              reg11 <= (((^reg13[(1'h1):(1'h0)]) ^~ (8'hb8)) >>> reg13);
              reg12 <= {(reg5[(2'h3):(1'h0)] ?
                      ({(!reg8)} < $signed((reg14 ~^ (8'hb2)))) : $signed($unsigned((reg7 ^~ reg11)))),
                  $unsigned($signed($signed($signed(reg10))))};
              reg13 <= (^$signed($unsigned($unsigned(reg9[(1'h1):(1'h0)]))));
            end
          if (wire0[(4'h8):(3'h7)])
            begin
              reg15 <= ($signed($signed((reg6 ?
                  (^reg14) : $signed(wire3)))) ~^ wire1[(1'h1):(1'h1)]);
              reg16 <= (wire4 << wire3);
              reg17 <= (~&(reg16[(1'h0):(1'h0)] == (-reg5[(3'h4):(2'h2)])));
              reg18 <= (((reg9 ?
                      ((wire3 ? reg17 : reg9) ?
                          reg8[(2'h2):(1'h1)] : (wire0 <<< (8'hb1))) : ((-reg16) ?
                          (8'hac) : {(8'ha6)})) <= (reg16[(2'h2):(1'h0)] >>> ((wire3 == reg14) ?
                      (8'hbe) : reg7[(4'ha):(1'h0)]))) ?
                  reg9[(4'hf):(2'h2)] : (~&reg7));
              reg19 <= (!reg14);
            end
          else
            begin
              reg15 <= (($unsigned((reg8 ^ reg16[(5'h12):(2'h3)])) ?
                      reg18[(2'h2):(2'h2)] : ((8'hba) ?
                          reg16[(4'hf):(3'h6)] : (~|(-reg9)))) ?
                  (+(|$signed($signed(reg18)))) : wire0[(5'h13):(3'h6)]);
              reg16 <= $unsigned((reg17 ?
                  ({wire4[(1'h0):(1'h0)], (reg15 ^ reg13)} ?
                      reg10 : (reg19[(4'ha):(4'h8)] ?
                          (reg8 ? wire4 : reg17) : (wire1 < reg6))) : reg16));
              reg17 <= reg8[(1'h0):(1'h0)];
              reg18 <= ((~^({(reg16 + (8'hb5))} ?
                  (reg17[(2'h3):(1'h0)] ?
                      {reg8} : (wire0 ?
                          reg5 : reg16)) : $unsigned(((8'hb4) ~^ reg17)))) < reg11[(2'h2):(2'h2)]);
            end
        end
      reg20 <= (~^{(|reg11), reg9});
      reg21 <= wire2[(1'h0):(1'h0)];
      reg22 <= wire1;
      reg23 <= $unsigned((~(8'hb8)));
    end
  always
    @(posedge clk) begin
      reg24 <= {$signed((((!reg8) ? reg14[(2'h3):(1'h0)] : (8'hb3)) & (~^{wire1,
              reg13})))};
      reg25 <= $signed(reg24[(3'h6):(2'h2)]);
      reg26 <= ($signed(reg18[(4'hc):(1'h1)]) & (|(~&$unsigned((|(8'ha1))))));
      reg27 <= (~&($signed(reg6[(2'h3):(2'h2)]) + ((reg26 == reg23) ^~ ({reg23,
              reg21} ?
          $signed(reg12) : $unsigned(reg21)))));
    end
  assign wire28 = wire3[(2'h2):(1'h1)];
  assign wire29 = (reg10[(2'h2):(2'h2)] ?
                      (~^reg23[(5'h12):(3'h6)]) : {(!((8'hab) == reg5))});
  assign wire30 = reg7[(4'hc):(3'h5)];
endmodule
