module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg18,
                 (1'h0)};
  assign wire4 = wire1[(4'h8):(4'h8)];
  assign wire5 = wire0[(4'he):(4'hc)];
  assign wire6 = $unsigned((wire1[(3'h7):(3'h4)] ?
                     ($unsigned((wire1 ?
                         (7'h43) : (8'hab))) <<< ((!(8'hb6)) & {wire1,
                         wire5})) : (^{$signed(wire4)})));
  assign wire7 = {$signed(wire5[(4'h9):(2'h3)])};
  assign wire8 = ((~|$signed((+(wire2 + wire0)))) + (!$unsigned(wire4[(4'hb):(3'h6)])));
  assign wire9 = ({$signed($unsigned(wire4)), wire6} == wire5[(4'h9):(2'h2)]);
  assign wire10 = wire3;
  assign wire11 = wire2[(4'hc):(4'hc)];
  assign wire12 = wire9;
  assign wire13 = wire12[(2'h2):(2'h2)];
  assign wire14 = $unsigned((wire2 << $unsigned(wire8)));
  assign wire15 = wire6[(3'h4):(2'h3)];
  assign wire16 = wire0[(2'h2):(1'h0)];
  assign wire17 = ($unsigned(wire3[(2'h2):(1'h1)]) ?
                      ((8'hbd) ?
                          ($unsigned(wire0[(4'hf):(2'h3)]) ?
                              (8'ha7) : ((wire5 > wire8) + wire13[(4'ha):(4'ha)])) : (((wire7 ?
                                      (8'hbe) : wire9) ?
                                  (8'hb5) : $signed(wire10)) ?
                              {$signed(wire2),
                                  wire6[(1'h0):(1'h0)]} : $unsigned($signed(wire13)))) : $signed(($unsigned($unsigned(wire15)) >>> wire13)));
  always
    @(posedge clk) begin
      reg18 <= $signed(((|$signed($signed(wire8))) ?
          (wire13 ?
              $unsigned((wire3 < (8'ha6))) : $unsigned({wire0})) : (wire9[(3'h4):(3'h4)] ^~ ($unsigned(wire16) <<< $unsigned(wire12)))));
    end
endmodule
