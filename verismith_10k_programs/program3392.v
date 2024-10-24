module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire12,
                 wire11,
                 wire10,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {(wire3 ?
                         (wire0[(4'h8):(3'h4)] + ({wire3, wire3} ?
                             wire0[(4'ha):(3'h7)] : wire2[(1'h0):(1'h0)])) : wire2[(1'h0):(1'h0)]),
                     ($signed($unsigned((wire1 ? wire3 : wire1))) ?
                         (wire2 ?
                             ((wire3 + wire3) ~^ (7'h41)) : $unsigned((!wire2))) : (8'hb5))};
  always
    @(posedge clk) begin
      reg5 <= ((($unsigned({wire2}) & $signed((!wire4))) ?
          wire0[(4'hd):(4'ha)] : wire2[(1'h0):(1'h0)]) >> ($unsigned((^~((8'haa) ?
              (8'hb2) : wire3))) ?
          wire0 : wire2));
      if ($signed(((wire3[(4'h8):(3'h7)] >= {(wire0 ? (8'ha7) : reg5),
          (wire0 ? wire0 : wire2)}) ~^ (^{reg5, (wire0 ? reg5 : wire2)}))))
        begin
          reg6 <= $signed((7'h44));
          reg7 <= ((wire3[(2'h2):(2'h2)] >>> (((wire1 ?
                  wire1 : reg6) >= wire4[(1'h0):(1'h0)]) ?
              $signed({wire2, wire2}) : {$unsigned(reg5),
                  wire2})) * $signed((wire1 ?
              (+reg6) : ((|wire1) ? $signed(wire2) : {wire0}))));
          reg8 <= (reg5 ^~ $unsigned(wire4[(3'h6):(3'h5)]));
          reg9 <= (wire3[(3'h4):(1'h1)] ? wire2 : wire2);
        end
      else
        begin
          reg6 <= wire0;
        end
    end
  assign wire10 = ({(($unsigned((8'h9c)) ? $unsigned((7'h44)) : {reg5, wire0}) ?
                              (^reg6) : (~wire0)),
                          wire4[(3'h7):(1'h0)]} ?
                      (wire2 ?
                          $unsigned({(~|wire4),
                              wire0[(4'hf):(4'he)]}) : $signed($unsigned((wire4 ?
                              wire1 : wire3)))) : (^reg9[(4'hc):(3'h6)]));
  assign wire11 = ((-(((wire2 >>> wire4) >> ((8'ha4) ?
                      (8'hb9) : (8'hbf))) ^ $unsigned($signed(wire4)))) || wire4);
  assign wire12 = ((~$unsigned(($unsigned((8'hbe)) ?
                      ((8'hbb) ?
                          (8'ha4) : wire10) : $signed(reg7)))) >>> $unsigned($signed(((~|wire10) > (wire1 ?
                      wire3 : wire3)))));
  always
    @(posedge clk) begin
      if (({wire12} ?
          $signed($unsigned((^~(wire12 <= wire0)))) : (($signed($unsigned((8'ha0))) + (reg6 ?
              (~(8'hbf)) : wire2)) == $signed(((reg6 ? reg5 : wire3) ?
              $unsigned(wire12) : wire2)))))
        begin
          if ($signed({(8'hb6), (^$signed($signed((8'ha2))))}))
            begin
              reg13 <= $unsigned(wire4[(4'hc):(3'h5)]);
              reg14 <= wire10;
              reg15 <= ((reg14 ?
                  (+{reg13[(3'h5):(3'h4)],
                      reg14[(3'h6):(3'h5)]}) : $signed(reg14)) < reg6[(2'h2):(2'h2)]);
              reg16 <= (|(reg14 ^ $unsigned($unsigned($signed((8'hbc))))));
              reg17 <= $unsigned($unsigned(wire3));
            end
          else
            begin
              reg13 <= wire1[(3'h5):(3'h5)];
              reg14 <= {reg7};
              reg15 <= ($signed((8'hb6)) >> (~&reg17));
              reg16 <= $signed($signed(reg7[(2'h3):(1'h0)]));
              reg17 <= {$signed($unsigned(reg5))};
            end
        end
      else
        begin
          reg13 <= $signed($signed((-{(reg16 ? (8'haa) : reg7),
              $signed(wire1)})));
          reg14 <= $signed($signed(((8'hbb) ?
              wire10 : ({reg16, wire10} != $unsigned(reg17)))));
          reg15 <= ((~&(^~reg9[(4'ha):(4'ha)])) ?
              (($signed($unsigned((8'hab))) + (8'h9d)) + (wire1 ?
                  (~wire10) : (8'h9e))) : $unsigned({((wire0 ?
                      wire4 : reg5) && $signed(reg9))}));
          reg16 <= wire11;
        end
      reg18 <= (($signed($unsigned((+(8'ha6)))) > (+reg13)) ^~ (((reg14 ?
          ((8'ha3) >= reg15) : (reg14 >> reg17)) | {$unsigned(wire2)}) || wire12[(2'h2):(1'h0)]));
      reg19 <= (~|wire4[(1'h1):(1'h0)]);
      reg20 <= wire1;
      if (reg15)
        begin
          if (reg19)
            begin
              reg21 <= $signed(wire1[(2'h3):(2'h3)]);
              reg22 <= $unsigned(($signed(reg7) ?
                  $unsigned(wire0[(4'hf):(4'hc)]) : (($unsigned(reg14) ?
                      reg9[(5'h10):(3'h4)] : {reg5,
                          reg9}) ^ $signed($signed(wire10)))));
              reg23 <= $signed($signed(($signed((reg6 ? reg21 : (8'hb1))) ?
                  $signed((reg8 ? reg20 : (8'ha8))) : (+(reg22 == reg16)))));
            end
          else
            begin
              reg21 <= (({(wire10[(1'h0):(1'h0)] < $unsigned(reg13)), reg13} ?
                  {wire11,
                      reg19[(3'h7):(3'h6)]} : ($unsigned(reg6[(2'h2):(1'h0)]) <<< $unsigned((wire1 == wire1)))) >> (8'hbc));
              reg22 <= reg13;
            end
          if ($unsigned((wire3 ?
              {({wire3, reg17} || {(8'h9d), reg13}),
                  reg6} : (reg9[(5'h11):(5'h11)] <<< ({reg22} < reg17)))))
            begin
              reg24 <= reg18;
              reg25 <= reg24[(4'ha):(3'h7)];
              reg26 <= (reg23 == $unsigned(reg6));
            end
          else
            begin
              reg24 <= (((^~reg24) ^~ (reg18 << (!(wire12 ? reg17 : reg24)))) ?
                  (wire2[(1'h0):(1'h0)] ?
                      wire10[(1'h0):(1'h0)] : (((wire10 - reg18) == (reg15 ?
                          (8'hbb) : reg26)) * reg24[(3'h5):(2'h3)])) : $unsigned(reg15[(1'h1):(1'h1)]));
              reg25 <= $unsigned(reg9[(4'hd):(1'h1)]);
            end
          reg27 <= $unsigned((^reg20[(4'hf):(3'h5)]));
        end
      else
        begin
          reg21 <= {$unsigned(($signed((reg20 < reg8)) ?
                  (reg21 ?
                      (reg25 << wire1) : (wire11 ? reg16 : reg26)) : reg14))};
          reg22 <= ((reg15[(1'h1):(1'h0)] ?
              (({wire0} - (wire0 ^ reg7)) ?
                  $signed($signed(reg19)) : reg22[(1'h1):(1'h1)]) : $unsigned(reg21[(4'hd):(4'hb)])) ^~ $signed((|$signed(((8'haf) ?
              wire12 : wire1)))));
          reg23 <= $signed(wire0[(4'hc):(4'h8)]);
        end
    end
  assign wire28 = (^~reg16);
  assign wire29 = {(((~{reg19, reg25}) <= $unsigned({wire28})) ?
                          $unsigned(((wire1 & (8'haa)) ?
                              (reg9 ~^ wire10) : $signed(reg8))) : ((|$unsigned(reg24)) ?
                              (reg19 ?
                                  (&reg16) : (wire0 ?
                                      wire3 : (8'hbd))) : {$unsigned(wire28),
                                  (8'h9f)})),
                      reg7[(3'h6):(2'h3)]};
endmodule
