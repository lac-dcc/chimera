module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire7;
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((((wire3[(3'h7):(3'h4)] ?
          $unsigned((8'hb8)) : (wire3 ?
              (8'hb9) : wire4)) ~^ $unsigned({wire4})) | (|$signed(wire0)))))
        begin
          reg5 <= $signed($signed(wire3));
          reg6 <= (^~(~^$unsigned(($unsigned(reg5) ?
              $unsigned(wire3) : (~^wire2)))));
        end
      else
        begin
          reg5 <= reg6;
        end
    end
  assign wire7 = ((^~($unsigned($unsigned(wire0)) | (((8'hac) + wire3) < (wire0 >>> (8'ha2))))) ?
                     $signed(wire2) : wire3);
  always
    @(posedge clk) begin
      reg8 <= $signed((({wire3} ?
              $unsigned((reg6 != wire4)) : ($signed((8'hac)) << $unsigned(wire0))) ?
          wire2[(1'h0):(1'h0)] : $signed(reg5)));
    end
  assign wire9 = {(wire3 ^ ($unsigned(((8'hb8) ? (8'hbd) : reg5)) ?
                         (8'hb0) : ($signed(reg6) ?
                             $unsigned(wire0) : (reg5 >= wire2)))),
                     wire0};
  assign wire10 = reg8[(5'h11):(2'h2)];
  assign wire11 = (((-(^$signed(reg8))) <= reg5) >= $signed($unsigned((8'hb2))));
  always
    @(posedge clk) begin
      reg12 <= $unsigned($signed($unsigned(wire1)));
      reg13 <= $signed((~|wire1[(1'h0):(1'h0)]));
      reg14 <= ($unsigned($unsigned(wire11[(4'h9):(3'h7)])) | (((^reg6[(3'h5):(3'h4)]) >> (8'hbc)) ?
          wire1[(3'h4):(2'h3)] : {$unsigned((wire1 ? reg8 : wire3)),
              $signed($unsigned(wire11))}));
      reg15 <= (~|{(-($unsigned(wire1) << $unsigned(wire1)))});
    end
  assign wire16 = (((reg12 < (reg12 ?
                      {wire1,
                          wire2} : wire11[(3'h5):(3'h4)])) >> (reg5 < wire2[(1'h1):(1'h0)])) ^ $signed(({reg12,
                          $unsigned(wire1)} ?
                      {$signed(reg14)} : $unsigned(reg6))));
endmodule
