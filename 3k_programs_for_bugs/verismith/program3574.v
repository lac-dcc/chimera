module top
#(parameter param30 = (8'ha8))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire6,
                 wire5,
                 reg28,
                 reg27,
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
  assign wire5 = (~(8'ha1));
  assign wire6 = $signed((8'hb5));
  always
    @(posedge clk) begin
      if ($signed($signed((~&(wire3 ? wire1 : (wire3 ? wire5 : wire2))))))
        begin
          reg7 <= {$signed(wire5)};
        end
      else
        begin
          reg7 <= ({$signed((-(8'ha9)))} ?
              $signed((wire5[(2'h3):(1'h0)] > wire1)) : wire3[(3'h4):(2'h2)]);
          reg8 <= ((8'hbc) + $signed(wire5[(1'h1):(1'h1)]));
        end
      if ($signed((~wire2)))
        begin
          if ($unsigned($unsigned(({$signed(reg7)} ?
              {(wire4 ? wire2 : wire0)} : ((wire6 > wire2) || {wire0,
                  wire3})))))
            begin
              reg9 <= wire4[(2'h3):(1'h0)];
              reg10 <= (^(+(8'hac)));
            end
          else
            begin
              reg9 <= wire1;
              reg10 <= (wire2 << (^{$signed((reg7 ? wire6 : (8'hab))),
                  ({(7'h44), wire3} >= (-wire6))}));
            end
          reg11 <= wire2[(4'hb):(4'hb)];
          reg12 <= $signed(wire4);
          reg13 <= (($unsigned(wire5) * ((&(8'h9e)) ?
                  (+$signed(wire4)) : ($unsigned(wire5) ^ (reg9 ?
                      wire3 : wire0)))) ?
              (({{(8'hb2), reg9}} ? reg7 : $signed($unsigned(wire0))) ?
                  {((wire5 - reg11) << (reg8 ? wire0 : wire6)),
                      ($signed(wire5) >> reg8)} : $unsigned(($unsigned(reg10) >= (wire5 ^~ wire4)))) : (~(~(!{reg8}))));
          reg14 <= $unsigned((+wire6));
        end
      else
        begin
          reg9 <= (wire5 < $unsigned(wire0));
          reg10 <= (wire5[(1'h1):(1'h1)] ?
              ((-wire5[(2'h2):(1'h1)]) ?
                  (((~^wire0) ?
                      (!wire1) : $signed(reg14)) != reg12[(2'h2):(1'h1)]) : $unsigned(((reg13 ?
                          wire0 : reg10) ?
                      (!reg12) : reg8))) : wire6);
          reg11 <= (|reg7);
          reg12 <= $unsigned(wire6[(4'h8):(2'h2)]);
        end
      reg15 <= $signed($unsigned((8'hb6)));
      reg16 <= (7'h42);
      reg17 <= $signed($unsigned($unsigned(($signed(reg11) * reg10[(3'h4):(2'h2)]))));
    end
  assign wire18 = $unsigned(reg14);
  assign wire19 = $signed((^{(reg17[(4'hc):(4'hb)] != $unsigned(wire18))}));
  assign wire20 = (($unsigned(wire19[(1'h1):(1'h1)]) ^ (&(8'hb3))) < wire4);
  assign wire21 = $unsigned((~^(wire0 <<< {$unsigned(wire19),
                      $unsigned(wire20)})));
  assign wire22 = (^$signed($unsigned(reg12[(2'h3):(2'h3)])));
  assign wire23 = reg12;
  assign wire24 = (wire23[(2'h2):(2'h2)] ?
                      {{reg12[(2'h3):(2'h3)]},
                          $signed($signed((~(8'hbf))))} : $signed((wire0 ^~ $signed($unsigned(reg7)))));
  assign wire25 = $signed(wire21);
  assign wire26 = $unsigned(wire23);
  always
    @(posedge clk) begin
      reg27 <= wire26;
      reg28 <= reg13;
    end
  assign wire29 = reg16[(3'h4):(1'h0)];
endmodule
