module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire20,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 reg19,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $unsigned(((wire0 ? wire3 : ((~^wire2) <= $signed(wire3))) ?
                     $unsigned(wire4[(2'h2):(1'h1)]) : wire2));
  assign wire6 = wire5;
  assign wire7 = (($signed((wire1[(4'he):(4'ha)] ^ $unsigned(wire0))) ^ (wire3 ?
                         wire6 : wire2)) ?
                     (8'hb7) : wire1);
  always
    @(posedge clk) begin
      if ((((wire3[(3'h4):(3'h4)] ?
                  wire4 : (wire2[(4'ha):(3'h4)] ?
                      {wire3, wire7} : wire2[(3'h7):(2'h2)])) ?
              {(^~(|wire6))} : $signed((7'h41))) ?
          ((~|$unsigned($signed((8'hba)))) ?
              (-$unsigned((wire3 ~^ wire3))) : wire7[(5'h10):(4'h9)]) : (&wire2)))
        begin
          reg8 <= ({{((wire2 ? wire7 : wire6) ?
                          ((8'h9c) != wire3) : $signed(wire6))}} ?
              (-$signed(wire1[(4'h8):(2'h3)])) : wire7[(5'h12):(2'h2)]);
          reg9 <= ($unsigned(($unsigned((^~wire2)) ?
                  wire7[(4'hc):(3'h7)] : (8'ha0))) ?
              $unsigned((~(wire0[(4'h9):(4'h8)] && (+wire1)))) : ((wire6 | ($signed(wire0) >= $unsigned(wire6))) ?
                  ($unsigned($signed(wire4)) <<< ($signed(wire6) ?
                      (wire2 & wire2) : $signed(wire2))) : (~^wire6)));
        end
      else
        begin
          reg8 <= $unsigned(reg9[(3'h5):(2'h3)]);
          reg9 <= wire3[(2'h2):(1'h1)];
          if ($signed(($unsigned(({wire3} ? (wire7 <<< wire5) : (~|reg8))) ?
              $signed($signed((wire1 ? reg8 : wire2))) : (($unsigned(wire5) ?
                  wire4[(3'h4):(1'h0)] : $signed(wire6)) ^ reg9[(4'hd):(4'hb)]))))
            begin
              reg10 <= wire1[(3'h4):(3'h4)];
              reg11 <= $signed($unsigned(($unsigned($unsigned(wire0)) ?
                  ((reg8 <<< wire5) ^ $unsigned(wire6)) : ($unsigned(reg8) > wire2))));
              reg12 <= ($unsigned((((|wire2) ? (+(8'h9c)) : (+wire2)) ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : (~&(reg10 ?
                      reg8 : (8'hbe))))) | wire5);
              reg13 <= {$signed($unsigned((wire5[(5'h11):(4'ha)] >> $unsigned(wire4))))};
              reg14 <= wire5;
            end
          else
            begin
              reg10 <= (8'h9c);
            end
        end
    end
  assign wire15 = (8'ha5);
  assign wire16 = {reg13[(2'h2):(2'h2)], $unsigned(wire0)};
  assign wire17 = ($unsigned(wire15[(1'h1):(1'h1)]) ?
                      wire1[(4'hf):(4'hf)] : wire4[(4'h9):(3'h7)]);
  assign wire18 = reg9[(4'hd):(2'h2)];
  always
    @(posedge clk) begin
      reg19 <= ({$unsigned(reg10[(1'h1):(1'h1)])} ?
          wire6 : (-(|(wire4 ^~ $signed(wire18)))));
    end
  assign wire20 = reg10[(2'h3):(2'h3)];
endmodule
