module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed(((wire0[(4'h8):(2'h2)] <<< wire0[(2'h2):(1'h1)]) << {wire0[(4'h8):(2'h3)]}))))
        begin
          reg4 <= wire2[(4'hd):(3'h7)];
          reg5 <= (^$signed($signed((wire0[(4'ha):(2'h2)] ?
              wire1[(2'h3):(2'h2)] : wire3))));
          if ((&wire0[(2'h2):(1'h1)]))
            begin
              reg6 <= $unsigned((&{wire2}));
              reg7 <= $signed($signed(wire1[(2'h2):(1'h1)]));
            end
          else
            begin
              reg6 <= (reg5[(3'h6):(2'h2)] ~^ reg6[(1'h1):(1'h1)]);
              reg7 <= wire3[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg4 <= (reg4 || $unsigned($unsigned(((wire3 ~^ wire2) >> (wire2 && reg7)))));
          reg5 <= {$signed(wire1[(2'h3):(1'h1)])};
          reg6 <= $unsigned((8'h9f));
          reg7 <= {$unsigned(reg7)};
          reg8 <= wire3;
        end
      reg9 <= reg8;
    end
  assign wire10 = $unsigned((wire3 <<< reg6[(1'h1):(1'h0)]));
  assign wire11 = $signed((^~reg4[(5'h10):(1'h0)]));
  assign wire12 = wire3;
  assign wire13 = ({(+((&wire2) >> {(8'hac)})),
                      $unsigned(wire0)} ~^ (~$unsigned(($signed((8'hb4)) ?
                      (wire10 <= reg9) : wire12[(4'hf):(4'ha)]))));
  assign wire14 = (~|(+$signed($signed((wire13 >>> wire13)))));
  assign wire15 = (8'ha0);
  assign wire16 = (wire1[(2'h3):(2'h3)] ?
                      wire15 : ($unsigned((!$unsigned(wire11))) ?
                          $signed($unsigned($unsigned(wire11))) : wire3));
  assign wire17 = $unsigned((-$unsigned($unsigned($signed(reg8)))));
  assign wire18 = (~(!{{wire3[(1'h1):(1'h1)]},
                      ((wire13 ? wire2 : reg8) ?
                          ((7'h42) <<< reg9) : $signed(wire1))}));
endmodule
