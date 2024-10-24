module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
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
  assign wire4 = (wire0[(2'h3):(2'h3)] <= (+wire2[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg5 <= ((&((&$signed((8'ha8))) <= {wire0,
          $signed(wire1)})) <= (&(wire1[(3'h6):(2'h2)] ?
          {(wire3 * wire3),
              $unsigned((8'ha5))} : $unsigned((wire1 >> wire2)))));
      reg6 <= wire1;
      reg7 <= reg5;
      if ($unsigned((reg6 ? reg5 : reg7[(1'h1):(1'h0)])))
        begin
          reg8 <= (8'ha8);
          reg9 <= $unsigned({wire3, (7'h44)});
          reg10 <= reg7[(1'h0):(1'h0)];
          reg11 <= ($signed($signed(reg8[(4'hd):(3'h5)])) >> (reg7[(2'h3):(2'h3)] ?
              wire3 : (-$signed((-wire2)))));
        end
      else
        begin
          reg8 <= (((((reg9 ? reg11 : reg7) < (reg11 ? reg7 : reg9)) ?
                      wire2[(4'hd):(4'h9)] : ($unsigned(reg5) << reg6)) ?
                  ((wire4 != $signed(wire0)) ?
                      {(^~wire0),
                          reg11[(3'h6):(1'h0)]} : ({(8'ha1)} <= (^~reg11))) : $unsigned($unsigned($unsigned(reg5)))) ?
              {(8'hbf)} : reg6[(5'h15):(3'h4)]);
          if (reg9[(5'h11):(3'h6)])
            begin
              reg9 <= ({(8'ha3), $signed(reg8[(4'hd):(2'h2)])} ?
                  (8'ha3) : ((8'hb1) ?
                      (-(~&(reg7 ? wire1 : reg7))) : reg10[(4'hc):(4'h9)]));
              reg10 <= {(&wire1)};
              reg11 <= wire3[(4'ha):(3'h4)];
            end
          else
            begin
              reg9 <= $unsigned($signed((&(~^(wire4 | (8'hb3))))));
              reg10 <= {reg9, wire1};
              reg11 <= (7'h42);
            end
          if ($signed({reg7, reg8}))
            begin
              reg12 <= reg6;
            end
          else
            begin
              reg12 <= $unsigned(((($unsigned(reg6) ?
                  (^~wire4) : (+reg11)) ^ (-$signed(reg10))) != $unsigned($signed(wire3[(4'hd):(3'h7)]))));
              reg13 <= ((~wire3) <<< reg8);
            end
        end
    end
  assign wire14 = ((reg8[(5'h15):(4'ha)] ?
                          (&$signed($signed(reg8))) : reg5[(1'h1):(1'h1)]) ?
                      reg7 : $signed((reg10 & (8'ha5))));
  assign wire15 = $unsigned($signed((-reg8)));
endmodule
