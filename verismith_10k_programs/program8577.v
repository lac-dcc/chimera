module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire6,
                 wire5,
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
  assign wire5 = ((($signed(wire4[(4'h8):(4'h8)]) ? wire4 : {wire4}) ?
                     (8'ha4) : $unsigned(wire1[(4'hc):(4'hb)])) << $unsigned((|(~{wire2}))));
  assign wire6 = {$signed($signed({wire1, {wire4, wire2}})),
                     wire3[(3'h5):(3'h4)]};
  always
    @(posedge clk) begin
      reg7 <= wire6[(3'h6):(3'h6)];
      if ((^(wire3 ?
          $signed(wire3[(2'h2):(2'h2)]) : ($signed(wire5[(4'ha):(4'h8)]) | wire6[(4'hd):(2'h2)]))))
        begin
          reg8 <= wire0;
          reg9 <= wire6;
          if ((|wire0[(1'h0):(1'h0)]))
            begin
              reg10 <= ((8'hb4) ?
                  $signed($unsigned(((+wire6) ?
                      reg8[(2'h2):(1'h1)] : $signed(reg8)))) : reg8);
              reg11 <= {(-($signed($signed(reg9)) || ($signed(reg9) ?
                      $unsigned((8'ha3)) : {wire5, wire1}))),
                  wire6[(1'h1):(1'h0)]};
              reg12 <= $signed($unsigned($unsigned(wire0)));
              reg13 <= wire2[(2'h2):(2'h2)];
            end
          else
            begin
              reg10 <= (reg10[(3'h4):(1'h1)] ?
                  ($signed({reg7[(3'h4):(1'h0)], $signed(reg7)}) ?
                      (^~wire4[(4'hd):(4'hb)]) : {reg7}) : wire1[(4'h8):(2'h3)]);
              reg11 <= ({(~|($unsigned(reg8) & wire0)),
                  (^wire5[(3'h7):(2'h2)])} || $unsigned(wire4));
              reg12 <= wire6[(4'hc):(4'h9)];
              reg13 <= ((($signed({reg13, wire0}) ?
                  (-wire4[(4'hd):(4'hd)]) : ((8'h9c) * $signed((8'hab)))) + wire3) ^ ((wire4 && $signed(((8'ha8) ?
                  reg12 : (8'had)))) >>> $unsigned(reg11)));
              reg14 <= reg10;
            end
          if ($signed((|(~&reg11[(5'h10):(2'h3)]))))
            begin
              reg15 <= {reg11[(3'h5):(1'h1)]};
              reg16 <= reg9;
              reg17 <= (8'ha5);
              reg18 <= $unsigned(wire0[(3'h6):(2'h3)]);
            end
          else
            begin
              reg15 <= ((reg9[(2'h2):(2'h2)] >> ($unsigned(reg18) >>> (8'hb1))) ~^ ((&wire1) ?
                  $unsigned({wire1}) : $signed(reg11)));
              reg16 <= wire4[(3'h6):(3'h5)];
            end
        end
      else
        begin
          if (((wire3 ?
              ((^(wire6 ? (8'haf) : (8'ha9))) ?
                  $signed(reg17) : reg15) : $unsigned((!(wire5 ^~ reg14)))) == $unsigned(reg16[(4'hd):(2'h3)])))
            begin
              reg8 <= {reg14};
              reg9 <= ($unsigned($unsigned((&(reg17 >>> wire0)))) + {$signed(($signed((8'hb5)) ?
                      reg14[(1'h0):(1'h0)] : $signed(wire3)))});
              reg10 <= $unsigned(wire0[(1'h0):(1'h0)]);
              reg11 <= (-{({reg8} ?
                      (~&reg17[(4'h9):(3'h4)]) : $unsigned((reg12 ?
                          wire2 : wire0))),
                  $signed((&(8'h9c)))});
              reg12 <= $signed((((7'h43) ~^ ({wire3, wire6} ?
                      (8'h9f) : reg15)) ?
                  ({reg9[(1'h0):(1'h0)],
                      $unsigned(reg13)} | (~|{reg15})) : ((^~(reg14 ?
                      reg15 : wire5)) || ((reg9 ?
                      wire2 : (7'h42)) != $unsigned(reg15)))));
            end
          else
            begin
              reg8 <= ($signed((^reg9[(1'h1):(1'h1)])) * $signed($signed(wire3[(1'h1):(1'h0)])));
              reg9 <= wire3[(2'h2):(1'h1)];
            end
          reg13 <= $unsigned((8'hb5));
          reg14 <= (^~$unsigned($signed((|(+reg8)))));
          if ((+$signed((~^{(wire2 && wire2), (^~reg18)}))))
            begin
              reg15 <= wire4;
            end
          else
            begin
              reg15 <= (reg18[(3'h5):(3'h4)] ?
                  $signed((-$unsigned(reg8[(2'h3):(2'h2)]))) : {(^$signed(reg9[(2'h2):(1'h1)])),
                      {$unsigned(reg7), (^wire4)}});
              reg16 <= wire6;
              reg17 <= (+{reg17[(3'h5):(1'h1)]});
            end
          reg18 <= wire2[(2'h3):(1'h0)];
        end
      reg19 <= (^$unsigned((wire1[(4'hb):(2'h2)] << reg18)));
      reg20 <= (^wire0);
      reg21 <= reg18;
    end
  assign wire22 = {$unsigned($unsigned($signed((reg20 ? reg7 : reg17))))};
  assign wire23 = $unsigned(((~reg13[(1'h1):(1'h0)]) ?
                      $unsigned($signed(reg7[(1'h0):(1'h0)])) : $unsigned(((wire22 ?
                              reg10 : (8'h9f)) ?
                          $unsigned(reg18) : $signed(reg9)))));
endmodule
