module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire6,
                 wire5,
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
  assign wire5 = wire1[(3'h6):(2'h2)];
  assign wire6 = $unsigned(wire0[(4'he):(4'h9)]);
  always
    @(posedge clk) begin
      reg7 <= wire3[(3'h4):(1'h1)];
      reg8 <= (~|reg7[(3'h6):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg9 <= ($signed($unsigned((&$signed(wire1)))) | wire3[(1'h1):(1'h1)]);
      if (reg9)
        begin
          reg10 <= $unsigned(reg7);
          reg11 <= $signed(wire1);
          reg12 <= (-(-((reg11[(1'h1):(1'h1)] + wire2) - ((~&wire1) ?
              wire0[(3'h7):(3'h6)] : (wire3 - wire3)))));
          reg13 <= wire5;
        end
      else
        begin
          reg10 <= wire0;
          reg11 <= ((+reg10) ?
              (~$signed(wire4[(4'h8):(2'h3)])) : $unsigned($signed((~|(~|wire5)))));
          reg12 <= (^$signed((+$signed((^reg7)))));
        end
      reg14 <= (($unsigned(wire6[(2'h3):(1'h1)]) >= ($signed((wire4 > reg13)) ?
          wire0 : (~&$unsigned((8'ha2))))) >= wire3[(3'h5):(3'h4)]);
      reg15 <= wire3;
      reg16 <= wire4[(5'h11):(3'h6)];
    end
  assign wire17 = $unsigned($unsigned($unsigned($signed(reg11[(3'h7):(1'h1)]))));
endmodule
