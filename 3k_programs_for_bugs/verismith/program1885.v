module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire16,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = wire2[(1'h0):(1'h0)];
  assign wire5 = $signed(($signed(((8'hb4) ?
                     (wire1 < (8'hb4)) : $signed(wire1))) | $signed((^(wire3 ?
                     wire1 : wire1)))));
  assign wire6 = $unsigned($signed(($unsigned(wire0[(3'h7):(3'h7)]) != $unsigned(wire1[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire2[(1'h1):(1'h1)])
        begin
          reg7 <= (|$signed(wire4));
        end
      else
        begin
          if ((~&(+$unsigned($unsigned((|wire0))))))
            begin
              reg7 <= wire3;
              reg8 <= wire5[(1'h1):(1'h1)];
            end
          else
            begin
              reg7 <= reg7;
              reg8 <= (~&((((~|wire3) >> (|(8'hb9))) ?
                  ({(8'h9c), reg7} << ((8'hbe) ?
                      (8'haf) : reg7)) : $unsigned(wire0[(1'h1):(1'h0)])) >= ($signed((8'hb6)) << (((8'hb7) ?
                  (8'hbf) : wire3) ~^ (reg7 ? wire6 : wire1)))));
              reg9 <= $signed((~|{$unsigned($unsigned(reg8))}));
              reg10 <= reg9;
              reg11 <= $signed($unsigned(wire2[(1'h0):(1'h0)]));
            end
          reg12 <= $unsigned(wire1[(4'he):(3'h7)]);
          reg13 <= reg7;
          reg14 <= (8'h9c);
          reg15 <= wire4;
        end
    end
  assign wire16 = (^~reg12);
endmodule
