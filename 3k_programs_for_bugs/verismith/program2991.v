module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire19,
                 wire18,
                 wire17,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = {$unsigned((((wire2 && wire1) ?
                         (8'ha1) : wire4) > (wire4 ^~ wire4)))};
  assign wire7 = $signed((+{((wire6 == (8'ha1)) < ((8'hbf) ?
                         wire0 : (8'hb4)))}));
  always
    @(posedge clk) begin
      reg8 <= $unsigned({$unsigned($unsigned(wire0[(4'h8):(3'h7)]))});
      reg9 <= (~(-((reg8 ?
              wire7[(4'hc):(4'h8)] : ((8'hae) ? (8'hb9) : (8'hac))) ?
          $unsigned($signed(wire2)) : $signed({(8'ha0), reg8}))));
      reg10 <= $unsigned(reg8[(1'h1):(1'h1)]);
      reg11 <= wire7[(4'he):(3'h4)];
    end
  assign wire12 = reg11;
  always
    @(posedge clk) begin
      reg13 <= $unsigned(({wire12[(3'h5):(3'h5)]} ?
          (~&wire12) : (~^$unsigned($unsigned(reg8)))));
      if ((^$signed($signed(((+wire3) + reg9[(4'hf):(3'h7)])))))
        begin
          reg14 <= {wire0[(3'h4):(1'h0)], $unsigned(reg9[(1'h1):(1'h0)])};
          reg15 <= {($signed((wire3[(2'h2):(1'h0)] | (|reg11))) ?
                  reg14 : reg11),
              (&{(~^(^wire0))})};
        end
      else
        begin
          reg14 <= wire3[(2'h3):(2'h3)];
          reg15 <= (wire4[(4'hb):(3'h7)] > ($signed($signed((wire7 ^ wire6))) < wire1));
          reg16 <= $unsigned((!$signed(wire4)));
        end
    end
  assign wire17 = ((^~(($unsigned(wire6) ^~ $unsigned((8'had))) ~^ $unsigned(reg9))) ?
                      $signed((wire0 > $signed(reg13))) : wire6);
  assign wire18 = $unsigned(wire7[(4'hb):(3'h7)]);
  assign wire19 = $unsigned($signed(wire1[(4'hc):(2'h3)]));
  always
    @(posedge clk) begin
      reg20 <= {(!{wire19[(4'h9):(3'h4)], $signed($unsigned(reg8))}),
          $signed({(reg16[(4'h9):(1'h0)] * (^~reg8))})};
    end
  assign wire21 = reg10[(4'h9):(2'h3)];
  assign wire22 = $signed(reg13);
endmodule
