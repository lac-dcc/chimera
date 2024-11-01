module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg22,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({{(-({wire3} ? $unsigned(wire3) : (wire2 ? wire3 : wire1))),
              wire3[(3'h5):(2'h2)]},
          {wire1}})
        begin
          reg4 <= (8'had);
          reg5 <= {$unsigned((^$signed(((8'ha2) & (8'had))))),
              $unsigned((wire3[(2'h3):(2'h3)] ?
                  ($signed((8'hb7)) ?
                      reg4 : $signed((8'ha0))) : $signed($unsigned(reg4))))};
          reg6 <= $signed($signed(($signed((~(8'hb5))) ^ $unsigned((reg4 ?
              wire2 : (8'hb7))))));
        end
      else
        begin
          reg4 <= $signed(wire1[(3'h5):(3'h4)]);
          reg5 <= (+wire1[(3'h5):(3'h5)]);
          reg6 <= $signed($unsigned(reg5));
        end
      if ({$signed((($unsigned(wire1) ?
              $signed(wire0) : (^~reg6)) + wire2[(4'h9):(2'h3)])),
          reg6[(3'h4):(2'h2)]})
        begin
          reg7 <= (reg5 ?
              ($unsigned(reg6) + wire3) : (wire0 ?
                  (+($unsigned(reg6) >> $signed(reg4))) : (8'ha6)));
          reg8 <= ({reg5[(4'ha):(1'h0)]} - (8'hbc));
          reg9 <= (7'h42);
          reg10 <= (|(reg5 ?
              (({reg9} ?
                  (reg5 && wire1) : $signed(wire1)) <= $unsigned(reg7[(3'h6):(3'h6)])) : ({(~|reg6),
                  reg9} * ((wire3 & reg9) | wire2))));
          reg11 <= $unsigned(reg8[(1'h1):(1'h0)]);
        end
      else
        begin
          reg7 <= reg9[(3'h5):(1'h0)];
          reg8 <= $unsigned($signed((+reg9[(1'h1):(1'h1)])));
          reg9 <= $signed(($signed(((reg9 - wire3) * (-reg8))) <= ({$unsigned(reg5)} ?
              $unsigned({reg10}) : $signed($unsigned((8'hb4))))));
          reg10 <= (~^reg6);
          reg11 <= (($unsigned(($signed((8'ha8)) & (reg11 ? (8'h9e) : wire3))) ?
              wire1 : ((reg10 ?
                  {wire1,
                      reg6} : (8'ha9)) <= wire3[(2'h3):(1'h0)])) < $unsigned(wire3[(3'h6):(1'h1)]));
        end
      reg12 <= $signed((!(|reg6[(4'h8):(4'h8)])));
    end
  assign wire13 = reg6;
  assign wire14 = reg9;
  assign wire15 = (reg10 ^ reg8[(1'h1):(1'h0)]);
  assign wire16 = (($unsigned(wire1) ^ $signed($signed(reg6[(1'h1):(1'h0)]))) ?
                      (wire3[(1'h0):(1'h0)] | reg4[(4'hb):(4'hb)]) : wire13);
  assign wire17 = (&(~|$signed(($unsigned(wire3) ?
                      reg9[(3'h6):(3'h4)] : $signed(reg10)))));
  assign wire18 = (~$unsigned({$unsigned($unsigned(reg7)), reg10}));
  assign wire19 = ((&reg5) - (((~|{reg4, wire1}) ?
                          wire17 : $signed($signed((8'hb6)))) ?
                      $signed(wire18[(4'h9):(1'h0)]) : (reg11 || {$unsigned(reg6)})));
  assign wire20 = $unsigned((((wire18[(3'h7):(3'h6)] ?
                      (reg11 ?
                          wire17 : (8'hab)) : (wire16 | wire15)) < $unsigned((reg9 & wire17))) != {$signed(reg4)}));
  assign wire21 = wire13[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg22 <= reg5[(3'h5):(3'h5)];
    end
endmodule
