module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg18,
                 reg17,
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
  assign wire4 = wire0;
  assign wire5 = (&wire4);
  always
    @(posedge clk) begin
      if ((~|(wire0[(2'h3):(1'h1)] ?
          {($signed(wire4) <= $signed((7'h41))),
              $unsigned($unsigned(wire1))} : (+((~wire1) ?
              (&(8'hb2)) : (wire2 ~^ (8'ha5)))))))
        begin
          if ((~&($signed(($unsigned(wire3) ?
              wire5[(4'hd):(4'h8)] : $signed((7'h40)))) >>> (-$unsigned((wire2 <<< wire0))))))
            begin
              reg6 <= ((~^(-(^~(wire5 == wire1)))) ?
                  wire3[(4'h9):(4'h8)] : $signed($unsigned((~|wire3))));
              reg7 <= $unsigned($signed(wire4[(2'h3):(1'h0)]));
              reg8 <= ((wire2 ?
                  reg7 : {(&(reg6 && wire1))}) && (|$unsigned($signed({wire1,
                  wire3}))));
            end
          else
            begin
              reg6 <= (&(wire0 < (^~($signed(wire5) > (+(8'ha3))))));
              reg7 <= (wire4 * wire2);
              reg8 <= reg6;
              reg9 <= $unsigned(wire5);
            end
        end
      else
        begin
          if (wire3[(2'h2):(1'h0)])
            begin
              reg6 <= reg6[(4'hf):(1'h1)];
            end
          else
            begin
              reg6 <= (reg7[(2'h3):(2'h3)] ?
                  reg6[(5'h12):(4'hc)] : ($signed($signed((wire5 ?
                          wire2 : wire4))) ?
                      (~|(&reg8[(4'h8):(2'h3)])) : ((7'h41) ?
                          (&(reg9 * reg9)) : $signed($unsigned(reg8)))));
              reg7 <= wire4[(3'h6):(2'h2)];
              reg8 <= {(wire0 ?
                      (reg6[(4'ha):(4'ha)] << (+(wire1 >> (8'ha3)))) : {wire1})};
            end
          if (wire5[(3'h4):(2'h2)])
            begin
              reg9 <= ($unsigned($signed((~reg8))) ?
                  ((~$signed($unsigned(reg8))) ?
                      (-{$signed(wire5)}) : wire3) : wire5[(4'hf):(4'hf)]);
            end
          else
            begin
              reg9 <= wire3;
              reg10 <= ($unsigned($unsigned(((~|wire3) ?
                  $signed(wire4) : $unsigned(wire5)))) >= $unsigned(reg6));
              reg11 <= $unsigned(wire4);
              reg12 <= (&({$signed(wire1[(3'h7):(2'h3)])} == (($unsigned(reg8) << (-wire4)) ?
                  (reg8[(4'h9):(1'h0)] ?
                      ((7'h43) ?
                          wire1 : wire2) : reg8[(3'h5):(3'h4)]) : ((wire0 ^ (8'hb8)) ?
                      $signed((8'ha2)) : (wire3 - (8'h9d))))));
            end
        end
      reg13 <= reg10;
    end
  always
    @(posedge clk) begin
      reg14 <= reg6;
    end
  assign wire15 = (reg11 ?
                      $unsigned(((&reg11) <= (~^$unsigned(reg8)))) : {((-$signed(reg12)) < $signed(reg8)),
                          (~reg8[(3'h7):(1'h0)])});
  assign wire16 = {$signed((8'hb2))};
  always
    @(posedge clk) begin
      reg17 <= wire2[(4'h9):(4'h8)];
      reg18 <= (wire4 >> (-$unsigned(wire2)));
    end
  assign wire19 = reg14[(1'h0):(1'h0)];
  assign wire20 = ((wire3 ?
                          (reg11[(2'h3):(1'h1)] ?
                              wire5[(4'h9):(3'h4)] : $unsigned((reg9 <<< wire1))) : (~(~^$signed(reg18)))) ?
                      ((($signed(wire1) - (~^wire4)) <<< wire16[(4'hb):(4'ha)]) ?
                          (|($signed(wire4) + (!wire19))) : reg10[(1'h0):(1'h0)]) : $unsigned($unsigned((~&(wire3 ?
                          wire19 : (8'hba))))));
  assign wire21 = $unsigned((^(~(~|(reg17 > reg13)))));
  assign wire22 = reg17;
endmodule
