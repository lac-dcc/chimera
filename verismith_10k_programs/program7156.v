module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire17,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = ({{$unsigned($unsigned(wire2)), (&(wire2 || wire3))},
                     (8'h9e)} < {wire3[(1'h1):(1'h0)]});
  assign wire5 = wire3;
  assign wire6 = wire1[(1'h0):(1'h0)];
  assign wire7 = ($unsigned(wire2[(1'h0):(1'h0)]) - (8'ha6));
  always
    @(posedge clk) begin
      reg8 <= (&$signed($signed((+$signed(wire2)))));
      if (reg8)
        begin
          reg9 <= ($unsigned(($unsigned(wire0) ?
              (reg8[(4'he):(3'h4)] ?
                  $signed((8'h9e)) : ((8'hba) >>> wire2)) : (wire7[(5'h11):(1'h1)] ~^ $signed(reg8)))) || (wire5[(3'h5):(2'h2)] ?
              wire0 : wire1));
        end
      else
        begin
          reg9 <= wire3;
          reg10 <= wire1;
          reg11 <= (&wire7[(3'h6):(3'h5)]);
          if ((~(~&$signed(reg9))))
            begin
              reg12 <= reg11;
            end
          else
            begin
              reg12 <= $unsigned(reg11[(4'hc):(4'h9)]);
              reg13 <= reg12[(1'h0):(1'h0)];
              reg14 <= reg9;
            end
        end
      reg15 <= $unsigned($unsigned(reg12));
      reg16 <= (($signed($signed(wire4[(2'h3):(2'h3)])) | wire1) ?
          wire5 : $unsigned($unsigned(reg11[(3'h6):(1'h1)])));
    end
  assign wire17 = $signed((-$unsigned({{wire6}})));
endmodule
