module top
#(parameter param16 = (8'hb6), 
parameter param17 = param16)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      reg5 <= $signed(wire2);
      if ((^$unsigned(wire1)))
        begin
          reg6 <= {((~&wire1) ?
                  {wire1[(2'h2):(2'h2)]} : {$signed((wire2 - wire0)),
                      {(&wire1)}}),
              (((reg5 ^~ $unsigned((8'hb8))) | wire4[(3'h7):(1'h0)]) ?
                  (^~(&wire2)) : ($unsigned($signed(wire2)) ?
                      wire1 : (wire1 > (wire4 - wire3))))};
        end
      else
        begin
          reg6 <= wire2[(5'h11):(4'h9)];
          if ($unsigned($signed((((reg5 < (7'h43)) != $signed(wire2)) ?
              $signed($signed(wire0)) : $unsigned((+wire1))))))
            begin
              reg7 <= (&(-{((wire3 - wire1) ? (wire1 >= wire2) : (^wire1)),
                  (((8'hbe) >>> wire3) ? {(8'had)} : $signed(wire3))}));
            end
          else
            begin
              reg7 <= ((($signed((reg5 ^ reg6)) <<< wire3) ?
                  $signed(reg7) : reg6[(2'h2):(1'h0)]) >= $signed((^reg5[(3'h5):(3'h4)])));
            end
          if (wire2)
            begin
              reg8 <= (wire4 <= wire4);
              reg9 <= (($unsigned((reg8[(4'hb):(4'hb)] ?
                      wire2 : ((7'h41) ? reg6 : (8'h9f)))) + ({(reg7 ?
                          (8'hb9) : reg8)} || (|$unsigned(wire1)))) ?
                  ((^~wire2[(5'h13):(1'h1)]) ?
                      $signed(wire1) : $unsigned((^~(reg7 ~^ wire1)))) : {(wire4[(3'h7):(3'h6)] ?
                          (~wire3) : reg5[(2'h2):(1'h0)]),
                      (~|(reg5 + $unsigned(wire2)))});
              reg10 <= (reg8 ?
                  (8'hb4) : ($signed(($signed(reg8) ? (^wire4) : (~&wire4))) ?
                      (^((7'h44) + (reg7 & reg9))) : wire1[(3'h4):(2'h2)]));
            end
          else
            begin
              reg8 <= reg10;
              reg9 <= (reg8[(4'hf):(4'he)] ?
                  (((~(+wire2)) ?
                      $unsigned($signed(wire0)) : (reg5[(3'h4):(1'h0)] & reg8[(4'hd):(2'h3)])) ~^ ((~^$signed(wire1)) || $unsigned((wire3 ~^ reg8)))) : (~|(((8'ha8) <<< {reg8}) >= reg8[(4'hc):(4'h9)])));
            end
          reg11 <= (8'hba);
          reg12 <= wire4[(1'h1):(1'h0)];
        end
      reg13 <= {wire3[(4'ha):(2'h2)]};
    end
  assign wire14 = wire0[(3'h7):(3'h4)];
  assign wire15 = $signed((reg7 > ((wire3[(5'h11):(4'hf)] ^~ (wire2 == wire14)) >= wire4)));
endmodule
