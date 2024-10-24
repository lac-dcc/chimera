module top
#(parameter param16 = ((((^((8'hbd) >> (7'h42))) ? (((7'h41) & (8'ha4)) ? ((8'ha7) ? (8'ha6) : (8'h9d)) : (+(8'hb6))) : (((8'hac) ? (8'h9d) : (8'hb4)) ? ((8'ha3) <<< (8'had)) : {(8'hbb), (8'h9d)})) - ((((7'h44) ? (8'h9c) : (8'h9d)) - ((8'had) && (8'hb3))) << (8'hb9))) ? (((~(8'hbd)) ? (|(~&(8'haa))) : (((7'h43) && (7'h40)) + {(8'ha5)})) ? ({((8'hac) ^~ (8'hb5))} ? (((8'h9c) ? (8'had) : (8'hbc)) << {(8'had), (8'haf)}) : (((7'h43) ? (8'hbc) : (8'h9e)) ? (!(8'hb0)) : {(8'haf)})) : (~&({(8'ha1), (8'hb7)} ? {(8'haa)} : {(8'ha4), (8'hbe)}))) : (((&((8'hbb) | (8'hb7))) ~^ (^((8'hb6) ~^ (7'h43)))) ? (~(((7'h40) ? (8'ha2) : (8'ha0)) >> ((8'ha0) ? (8'hb9) : (8'h9f)))) : (8'hb3))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= ((($unsigned($unsigned((8'hbb))) <<< ($signed(wire0) ?
                  ((8'hab) <<< wire3) : wire3[(2'h3):(2'h2)])) ?
              ($signed({(8'h9e), wire1}) ?
                  wire0[(4'h8):(1'h0)] : ((wire3 + wire2) ~^ wire4)) : $unsigned(wire1)) ?
          ((wire1[(3'h5):(1'h0)] ?
                  $unsigned((wire2 ?
                      wire3 : wire5)) : $signed(wire1[(3'h6):(1'h1)])) ?
              wire3[(1'h0):(1'h0)] : $unsigned(({wire5} != $unsigned(wire4)))) : {((wire3[(4'h9):(3'h6)] && $unsigned(wire2)) ?
                  (8'h9f) : $signed($unsigned((8'hba)))),
              (^~{((8'ha7) <<< wire1), ((8'ha2) ? wire3 : (8'h9f))})});
      reg7 <= ((wire3 + {{{wire3}}, (~{(8'hb4)})}) ?
          {(((^wire5) ?
                  (~reg6) : {reg6}) != (wire3[(4'h8):(3'h7)] ~^ $unsigned(wire1)))} : wire2);
      reg8 <= (^~(wire3[(4'hb):(1'h0)] ?
          (~&wire0) : (((&wire3) > (reg7 * (8'hab))) ?
              (~&(wire0 ? (8'hb0) : wire3)) : $unsigned({(8'hbe), (8'ha0)}))));
      reg9 <= ($signed({({wire0} <<< {wire2}), $signed($unsigned(reg8))}) ?
          wire5[(4'ha):(3'h7)] : $unsigned($unsigned(wire2[(2'h2):(1'h1)])));
    end
  assign wire10 = $unsigned(reg6);
  assign wire11 = ((reg6[(3'h5):(1'h0)] ?
                          reg9[(2'h3):(2'h2)] : (reg8[(4'h8):(2'h3)] ?
                              {(&wire5)} : ($unsigned(reg7) ?
                                  wire3 : (8'ha3)))) ?
                      $signed($unsigned($unsigned(((7'h42) ?
                          wire1 : wire3)))) : (wire0[(3'h7):(1'h0)] * $unsigned($unsigned(reg7))));
  assign wire12 = {$signed(wire4[(3'h5):(2'h2)])};
  assign wire13 = wire10;
  assign wire14 = ((wire2 ~^ (wire1[(2'h2):(2'h2)] ?
                      wire11[(1'h0):(1'h0)] : (&$signed((8'hb1))))) >> $signed(wire10));
  assign wire15 = $unsigned(wire1[(2'h2):(1'h1)]);
endmodule
