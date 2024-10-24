module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire22,
                 wire21,
                 wire19,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg20,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg6,
                 (1'h0)};
  assign wire4 = (|wire1);
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= wire3;
    end
  assign wire7 = wire1;
  assign wire8 = reg6[(2'h2):(2'h2)];
  assign wire9 = (wire0[(4'h8):(2'h2)] ? wire4[(3'h7):(2'h3)] : wire7);
  assign wire10 = (~&wire5[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg11 <= wire5;
      reg12 <= reg11[(2'h2):(1'h1)];
      if (wire8)
        begin
          reg13 <= {(8'ha8), wire8[(2'h2):(1'h0)]};
          reg14 <= $unsigned((wire8[(2'h3):(1'h1)] <= $unsigned(wire0)));
          reg15 <= (((reg6 | (wire2[(3'h4):(1'h0)] * $unsigned(wire10))) ?
              $unsigned(($signed(wire1) ?
                  (&reg11) : reg11)) : ((reg12[(4'hc):(2'h3)] ?
                      $unsigned(reg11) : $signed((8'hb8))) ?
                  $signed((wire2 >>> wire1)) : wire9[(2'h3):(1'h1)])) ~^ $unsigned(($unsigned(wire9[(3'h6):(1'h0)]) & (~^$unsigned(wire2)))));
          reg16 <= $unsigned($unsigned($signed($signed({reg13}))));
          reg17 <= (~wire8);
        end
      else
        begin
          reg13 <= $unsigned(reg12);
          reg14 <= {{$unsigned({$signed(wire0)})}};
          reg15 <= wire8;
          if ((7'h40))
            begin
              reg16 <= wire9[(3'h4):(1'h0)];
            end
          else
            begin
              reg16 <= {reg11};
            end
          reg17 <= wire5;
        end
      reg18 <= (^{wire4[(4'hc):(1'h0)], wire8[(1'h1):(1'h0)]});
    end
  assign wire19 = (wire1[(3'h4):(3'h4)] || wire10);
  always
    @(posedge clk) begin
      reg20 <= $unsigned({$signed($signed((wire19 >> wire1))),
          {((-wire4) ? $signed(wire1) : {reg15, wire10})}});
    end
  assign wire21 = (wire0 * $unsigned(reg6[(1'h0):(1'h0)]));
  assign wire22 = reg15[(5'h12):(3'h5)];
  always
    @(posedge clk) begin
      reg23 <= $unsigned($signed(wire5));
      reg24 <= ($unsigned({reg15}) ?
          (($unsigned($signed(reg14)) & wire5[(3'h7):(1'h0)]) - wire2[(4'h9):(3'h5)]) : $unsigned(reg18[(3'h4):(1'h0)]));
    end
  assign wire25 = (wire5[(3'h4):(2'h2)] || ((~^(((8'h9e) > reg18) ^~ (wire8 || (8'hb9)))) ?
                      (wire21[(3'h4):(1'h0)] == ((reg13 | reg6) == (reg16 ?
                          wire8 : reg16))) : ({{reg13, wire7}} <<< wire3)));
endmodule
