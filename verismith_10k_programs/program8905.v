module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1[(3'h6):(3'h6)];
  assign wire6 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= wire2[(4'hf):(3'h7)];
      if ($unsigned((~^wire6)))
        begin
          reg8 <= $unsigned({(wire1[(4'ha):(4'h8)] ? wire2 : (&(|reg7))),
              $signed(wire4[(2'h2):(2'h2)])});
          reg9 <= $unsigned((((^(|wire1)) ? $unsigned({wire1}) : (&(~|reg8))) ?
              $unsigned(wire0[(4'h8):(2'h2)]) : (^(~$unsigned(wire5)))));
          reg10 <= $signed(wire2[(4'he):(3'h6)]);
          reg11 <= ($signed($signed(reg9)) ?
              ($unsigned($signed(wire5)) == (|$unsigned(reg7[(1'h1):(1'h1)]))) : ((wire0[(3'h6):(3'h4)] ?
                  ((8'hbd) & wire2[(4'ha):(2'h2)]) : (~wire1[(4'h8):(3'h4)])) != (wire6[(4'hf):(1'h1)] ?
                  $unsigned(wire0[(1'h0):(1'h0)]) : wire6[(3'h4):(2'h3)])));
          reg12 <= $signed(($signed(reg11) != (~|$unsigned(wire1[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg8 <= $unsigned($unsigned(reg11[(2'h3):(1'h0)]));
        end
      reg13 <= reg12[(2'h2):(2'h2)];
    end
  assign wire14 = reg8;
  assign wire15 = (((8'hbd) ?
                      (wire5 ?
                          (~&(wire1 + wire6)) : $signed(reg11[(1'h0):(1'h0)])) : $unsigned(wire14[(4'hc):(4'hc)])) ^ reg13);
  assign wire16 = reg13[(2'h3):(2'h2)];
  assign wire17 = wire14[(2'h3):(2'h2)];
  assign wire18 = $unsigned({wire6[(4'hc):(4'hb)]});
  always
    @(posedge clk) begin
      reg19 <= ((^$signed((~$signed(wire2)))) >> (~^wire2[(3'h5):(1'h1)]));
      reg20 <= (($signed(reg11) == wire5) ?
          {(wire14[(1'h1):(1'h1)] ? reg7 : {(^wire2)})} : ({(|{reg19}),
              $unsigned({reg7, reg9})} >= (^(((8'ha5) >>> (8'h9d)) ?
              $unsigned(wire6) : {wire6}))));
    end
  assign wire21 = ((~|$signed($unsigned($signed(wire3)))) << reg12[(3'h4):(1'h0)]);
  assign wire22 = (reg10 >>> $unsigned((+$unsigned((&wire6)))));
endmodule
