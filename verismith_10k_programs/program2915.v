module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed((8'ha4));
  assign wire6 = ($signed(($signed($unsigned(wire3)) ?
                         (^((8'ha0) ? wire3 : (8'hbc))) : $signed((8'ha9)))) ?
                     (~&wire1) : $unsigned(({(wire1 ? wire5 : (7'h42))} ?
                         $unsigned((8'hbe)) : (^~(~^wire3)))));
  assign wire7 = wire1[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ({wire2})
        begin
          reg8 <= {(&(((wire2 != wire0) ? wire5 : $signed(wire6)) ?
                  ({(8'hb0)} ?
                      (wire4 == wire6) : (+wire2)) : wire1[(4'hc):(1'h0)])),
              ($signed($signed((wire7 ? wire1 : wire0))) ^ (($unsigned(wire3) ?
                      (wire7 ? wire1 : wire2) : (wire1 <<< wire6)) ?
                  $unsigned($unsigned(wire2)) : wire0))};
          reg9 <= wire2[(2'h2):(2'h2)];
          reg10 <= ($unsigned((reg8[(2'h3):(1'h0)] | $unsigned(wire0[(5'h10):(3'h4)]))) << (~&((~^(8'hb8)) & reg8[(1'h0):(1'h0)])));
          reg11 <= (^{(wire0 < wire5[(4'h8):(3'h7)]),
              $unsigned(((~(8'hb7)) ?
                  (reg10 ~^ wire6) : (wire6 ? wire4 : (8'hb8))))});
          reg12 <= (~$unsigned(((|$signed(wire3)) & (-(wire4 ?
              wire2 : reg8)))));
        end
      else
        begin
          if ({$signed((wire0[(3'h5):(3'h5)] ?
                  $signed($unsigned(wire4)) : (wire5[(2'h3):(1'h1)] ?
                      (wire3 ? (8'hb5) : reg10) : $unsigned(reg9))))})
            begin
              reg8 <= $unsigned($signed((reg10[(3'h6):(3'h5)] ?
                  (-(reg12 ? reg12 : wire0)) : ((!reg10) <<< $signed(wire6)))));
              reg9 <= reg11;
              reg10 <= $unsigned({(wire7 + (wire1 ? (~wire7) : {wire3, wire4})),
                  (^~(~|(wire5 != wire4)))});
            end
          else
            begin
              reg8 <= wire3;
              reg9 <= wire6[(3'h7):(3'h5)];
              reg10 <= $unsigned(($signed((|wire1[(4'hb):(1'h0)])) ?
                  wire7[(4'h9):(2'h2)] : $signed(reg8[(2'h2):(1'h0)])));
              reg11 <= ({$unsigned(($signed(reg12) ?
                      (reg9 ?
                          wire0 : (8'hbf)) : {reg10}))} <<< $signed({(reg9[(3'h6):(3'h4)] == (reg9 ?
                      reg8 : wire0))}));
            end
          reg12 <= {reg10, wire7};
          if (($signed(wire1) >= ($unsigned(((reg8 ? reg10 : wire5) ?
                  (&(7'h40)) : (reg12 ? wire1 : reg12))) ?
              $signed(($unsigned(reg12) >> $signed(wire3))) : (wire7[(4'he):(3'h5)] ?
                  reg12[(3'h5):(3'h5)] : wire2))))
            begin
              reg13 <= wire6;
              reg14 <= {$signed(($signed($unsigned(reg10)) ?
                      $signed({wire7}) : {((8'hb3) >= wire7)}))};
            end
          else
            begin
              reg13 <= {$unsigned(reg8[(3'h4):(1'h0)])};
            end
        end
    end
  assign wire15 = ({((wire6 || {wire7, wire3}) ?
                          reg10[(3'h5):(1'h0)] : (!$unsigned(wire1))),
                      $signed(wire3)} ^ reg14[(2'h2):(1'h0)]);
  assign wire16 = $signed(($unsigned(((^~reg11) ?
                      $signed((8'hbe)) : (wire15 ^~ reg12))) ~^ (-(!$signed(wire5)))));
  assign wire17 = wire2[(4'hd):(1'h0)];
  assign wire18 = $unsigned(reg13);
  assign wire19 = (8'ha9);
  assign wire20 = (reg12[(5'h14):(3'h4)] >> ((+(reg13 || $unsigned(wire4))) ?
                      $unsigned(reg13[(3'h4):(1'h1)]) : wire16));
  always
    @(posedge clk) begin
      reg21 <= wire4[(3'h4):(1'h1)];
      reg22 <= (^$unsigned((!($signed(reg21) ^~ reg8[(4'ha):(3'h7)]))));
      reg23 <= (^reg10);
      reg24 <= $signed($signed($signed($signed($signed(reg22)))));
      reg25 <= ((~$unsigned($signed(wire0[(4'ha):(2'h3)]))) ?
          $unsigned($signed($signed(wire5[(1'h0):(1'h0)]))) : $signed(({wire7[(4'hc):(3'h6)],
                  $signed((7'h40))} ?
              $unsigned($signed(wire15)) : reg11[(4'h8):(4'h8)])));
    end
  assign wire26 = ((wire5 - wire7[(4'h9):(2'h3)]) ^ reg24);
endmodule
