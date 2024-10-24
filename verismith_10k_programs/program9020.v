module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire18,
                 wire17,
                 wire16,
                 wire12,
                 wire11,
                 wire5,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg15,
                 reg14,
                 reg13,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= wire1[(5'h11):(4'hd)];
      reg7 <= (!($unsigned(reg6[(3'h5):(2'h3)]) ?
          ((wire4[(2'h3):(1'h0)] <= (wire1 ?
              wire5 : wire1)) || reg6[(1'h1):(1'h1)]) : (~&(wire0 ?
              wire5[(5'h10):(1'h0)] : ((8'hbc) ? wire4 : (8'hbc))))));
      reg8 <= $unsigned($unsigned({(~|wire3), wire2}));
      reg9 <= ((~^$signed((^(wire5 ~^ wire3)))) ?
          (~|(((^wire3) <<< wire3[(3'h4):(1'h0)]) >> $unsigned($signed(wire0)))) : (&wire1[(4'hd):(1'h0)]));
      reg10 <= ($signed((reg8 ?
              ((-wire2) ^~ $signed(wire5)) : {(wire1 - (7'h43)),
                  wire0[(4'h9):(3'h7)]})) ?
          (((~^(~^reg7)) & {$unsigned(wire4)}) >= $signed({(reg8 ^~ wire0),
              (wire4 ?
                  reg9 : wire2)})) : $unsigned($unsigned((~&reg9[(1'h1):(1'h1)]))));
    end
  assign wire11 = {$unsigned(reg10), wire4};
  assign wire12 = (~^($unsigned($signed(wire1[(4'h9):(3'h7)])) ?
                      $signed($signed($signed(wire4))) : $unsigned(($signed(wire4) ?
                          reg6 : reg9[(5'h11):(3'h7)]))));
  always
    @(posedge clk) begin
      if (($unsigned(wire12[(3'h6):(2'h3)]) & ((+(wire4[(3'h6):(2'h3)] < (wire11 ?
              (8'ha1) : wire0))) ?
          ({(&wire5), $signed(reg10)} ?
              $signed(wire1) : (|(~(8'hab)))) : (wire0 > {$unsigned(wire1),
              wire11[(3'h4):(2'h3)]}))))
        begin
          reg13 <= (((wire2[(2'h2):(2'h2)] ?
                  (~reg10[(4'hd):(4'hc)]) : $signed((-wire1))) * (~^(reg8 ?
                  (~^wire12) : (8'ha6)))) ?
              $signed((~^((wire3 ? wire2 : reg6) ?
                  $signed(wire0) : (~&wire0)))) : {{($signed((8'ha4)) ^~ ((8'ha4) ?
                          (8'h9d) : wire2)),
                      (|reg7[(3'h4):(3'h4)])},
                  wire5});
          reg14 <= reg8[(1'h0):(1'h0)];
          reg15 <= (($signed($unsigned($unsigned(reg13))) ?
                  (reg7 > wire5) : $signed($unsigned($signed(wire11)))) ?
              $unsigned(((8'hb1) || $unsigned($signed(reg8)))) : (($signed($unsigned((8'ha6))) + $unsigned((reg8 | wire2))) ?
                  (((wire4 + wire1) ?
                      wire1 : reg13[(3'h7):(2'h2)]) >= (((8'ha2) ~^ reg8) ?
                      (|wire2) : $unsigned(wire2))) : (+$unsigned((wire3 ?
                      reg9 : reg10)))));
        end
      else
        begin
          reg13 <= $unsigned(((reg6[(1'h1):(1'h0)] > (~$signed(wire1))) ?
              ($unsigned({wire4}) ?
                  (~reg10[(4'hd):(2'h2)]) : {(~|wire4),
                      (reg6 >>> wire1)}) : (~({wire11, reg13} ?
                  wire5 : (wire0 ? reg6 : wire3)))));
          reg14 <= (-wire4[(1'h0):(1'h0)]);
        end
    end
  assign wire16 = reg7[(3'h5):(1'h1)];
  assign wire17 = (8'hb0);
  assign wire18 = wire1;
  always
    @(posedge clk) begin
      reg19 <= reg6[(4'h8):(2'h2)];
      reg20 <= $signed(reg13[(4'ha):(3'h5)]);
      reg21 <= $unsigned((^(^{wire1[(2'h3):(1'h1)], $unsigned(reg9)})));
      reg22 <= wire3;
      reg23 <= reg21[(2'h2):(1'h1)];
    end
  assign wire24 = $unsigned(reg15[(2'h3):(2'h2)]);
  assign wire25 = (-(reg14 < $unsigned($signed((reg10 - reg19)))));
  assign wire26 = ((~^$unsigned($signed($signed(wire5)))) << reg6[(2'h3):(1'h1)]);
endmodule
