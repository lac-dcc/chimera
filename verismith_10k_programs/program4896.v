module top
#(parameter param18 = (((+(&((8'h9f) & (8'h9e)))) ? ((+((8'ha4) >> (7'h43))) ? {{(8'ha4)}} : (&(~|(8'hb7)))) : (((8'had) ? {(8'hb0), (8'hb1)} : (+(8'hac))) & (~|((8'hb4) ? (8'haa) : (8'ha7))))) ? ((((8'hbd) ? ((8'hbb) - (8'ha9)) : ((8'ha2) >> (7'h44))) << (((8'had) + (8'h9f)) << ((8'h9c) >>> (8'h9e)))) ? (+((!(8'hbb)) ? (~&(8'ha3)) : (+(7'h44)))) : {((|(8'hb0)) != (~(8'hb6)))}) : (((|((8'hbf) ~^ (8'h9f))) ? (~(-(8'hbd))) : (((8'ha8) != (8'ha5)) && (~^(8'h9f)))) ? {(((8'hb2) != (8'ha0)) && {(8'hb4)}), {((8'hb5) ? (8'ha0) : (8'hb1))}} : (&(~|(~^(8'ha9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $signed(($unsigned(((wire0 ^ wire3) && $signed(wire1))) - (~&wire4[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg6 <= (!((^~(~^wire1)) >= wire4[(3'h6):(1'h1)]));
      reg7 <= $signed(reg6[(2'h2):(1'h0)]);
      reg8 <= ((~^$signed(wire4[(1'h1):(1'h1)])) - $signed((&$unsigned(wire2[(4'ha):(3'h4)]))));
      if (((wire5 && ((wire1 || (wire3 ? reg8 : wire1)) ?
          $unsigned((wire4 ?
              wire4 : wire1)) : wire5[(4'he):(4'h9)])) == $signed((&$unsigned(wire1[(1'h0):(1'h0)])))))
        begin
          reg9 <= reg6[(1'h0):(1'h0)];
        end
      else
        begin
          if (($unsigned((wire5[(3'h7):(3'h6)] ?
                  $signed((wire2 * (8'hbe))) : $signed(wire3[(2'h3):(1'h0)]))) ?
              (wire2 ? wire2[(4'h9):(2'h3)] : reg6[(3'h4):(2'h2)]) : reg6))
            begin
              reg9 <= $signed((!wire2[(2'h3):(1'h1)]));
              reg10 <= ((|wire0) < wire1[(1'h0):(1'h0)]);
              reg11 <= {($signed(((-wire2) != (wire5 ? reg6 : wire1))) == reg8),
                  (^wire5[(5'h10):(1'h1)])};
            end
          else
            begin
              reg9 <= {($signed(wire3) ~^ ((|(~&wire2)) <= (-{(8'hb0),
                      reg11})))};
            end
          reg12 <= {$unsigned(wire1)};
          reg13 <= ((&(&((wire5 | wire0) ?
              ((8'h9d) ?
                  (8'hb6) : wire4) : wire5[(3'h4):(1'h1)]))) + reg8[(2'h2):(1'h1)]);
        end
    end
  assign wire14 = {((+((wire0 ? reg6 : wire0) ?
                              (^~wire2) : (wire2 > (8'hb4)))) ?
                          ($unsigned(reg10[(5'h12):(4'hc)]) >= ($unsigned(reg6) ?
                              (wire5 <<< reg9) : $unsigned(reg6))) : wire2)};
  assign wire15 = ((8'h9c) >= reg13);
  assign wire16 = $signed($unsigned(wire5));
  assign wire17 = reg13;
endmodule
