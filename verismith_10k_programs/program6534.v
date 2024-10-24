module top
#(parameter param18 = (-((~^(~^(8'had))) ? ((((8'hb4) >>> (8'hb3)) < (~&(8'hab))) == (^((8'hac) > (7'h42)))) : ({((8'h9d) > (7'h41)), ((7'h40) ^~ (8'hb9))} ? (~&(&(8'haf))) : ((-(8'hb2)) >>> ((8'hac) ? (8'hbd) : (8'hb1)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed(($signed(wire3[(4'hd):(3'h5)]) | $unsigned($unsigned($unsigned(wire3)))));
  assign wire6 = wire3[(4'ha):(3'h7)];
  assign wire7 = (wire2 < $signed(wire4));
  always
    @(posedge clk) begin
      reg8 <= (!(~|$signed(wire2)));
    end
  always
    @(posedge clk) begin
      reg9 <= ($signed($unsigned({$signed(wire2)})) <= ({$unsigned((wire5 ?
              reg8 : wire6))} || (+((wire4 ? wire6 : wire1) ?
          wire4 : $unsigned(wire2)))));
    end
  assign wire10 = ($unsigned((+($signed(wire3) > {(8'hb1),
                      wire2}))) & (((+(wire0 >= (8'hb1))) ?
                      {(!wire1)} : wire0) > $unsigned(((wire6 >>> (8'ha1)) <= (wire1 ?
                      wire2 : wire6)))));
  assign wire11 = (~|wire6);
  assign wire12 = ((({(~wire1), $signed(wire3)} ^~ (&{wire7})) ?
                      (-$signed((wire1 ?
                          wire11 : wire1))) : reg8) - $signed((((7'h42) > wire3) ~^ (&$signed(wire4)))));
  assign wire13 = reg8;
  assign wire14 = (wire3 ?
                      {{((&wire13) + $signed(wire13)), {$unsigned(wire11)}},
                          {$signed(wire2[(2'h2):(1'h1)]),
                              $signed($unsigned(wire10))}} : wire2);
  assign wire15 = ($signed((((wire14 ? reg9 : wire12) ?
                          $unsigned(wire6) : ((8'hb6) ? (8'hb5) : wire10)) ?
                      wire12 : $unsigned(wire1))) & ((((reg8 + wire1) ?
                          $signed(wire14) : (reg8 >= wire7)) ?
                      $signed(reg9) : ($signed(reg9) ?
                          reg8 : (!reg8))) >= (~$unsigned($unsigned(wire0)))));
  assign wire16 = wire2;
  assign wire17 = (((~&wire2) ?
                          ((+(wire4 != (8'hbf))) >> wire13[(5'h11):(3'h7)]) : (8'hab)) ?
                      {(~$unsigned(wire3[(4'ha):(3'h4)]))} : $signed($unsigned({$unsigned(wire14)})));
endmodule
