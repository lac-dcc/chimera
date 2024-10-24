module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~|$unsigned(wire3));
  assign wire6 = $signed(((wire0[(3'h4):(1'h0)] && (~&(wire2 <= wire1))) > ($signed(((8'hbc) == wire2)) || {(~&wire4)})));
  assign wire7 = (wire6[(4'hf):(4'hf)] >>> $signed(((wire5 ?
                     (wire6 + wire5) : $unsigned((8'ha0))) <<< $signed((wire4 ^~ wire2)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned({$signed(wire4)});
      if ((~^(~($unsigned((wire5 >> wire2)) ?
          ((wire0 ?
              wire6 : wire1) >= wire5[(5'h10):(4'he)]) : {(wire5 >> wire3)}))))
        begin
          reg9 <= (+(~^(~|$signed($unsigned(wire5)))));
        end
      else
        begin
          reg9 <= $signed((((~|$signed(wire3)) - ((reg9 | wire1) ?
              (wire6 ?
                  wire5 : wire6) : wire0[(2'h2):(1'h1)])) << $unsigned($signed((8'hb9)))));
        end
      reg10 <= $signed(((8'ha7) ? wire4[(4'hc):(4'h8)] : reg8[(3'h7):(3'h4)]));
    end
  assign wire11 = ((^$unsigned($signed((!wire5)))) ?
                      wire4[(3'h5):(3'h5)] : $unsigned({wire2[(4'hf):(4'hd)],
                          (~&$unsigned(reg10))}));
  assign wire12 = ($unsigned($signed((wire7[(4'h8):(4'h8)] ?
                          $signed((8'hb7)) : (wire5 << wire6)))) ?
                      reg8[(4'hc):(3'h5)] : wire3[(4'hc):(3'h7)]);
  assign wire13 = (8'hb3);
  assign wire14 = ({{wire3[(1'h1):(1'h1)], $unsigned({wire2})}} ?
                      (^~reg10) : wire0[(3'h5):(3'h4)]);
  assign wire15 = $unsigned($signed(wire14[(4'h9):(4'h8)]));
  assign wire16 = $signed((reg10 ? $signed(wire12[(4'hd):(4'h9)]) : (8'hb4)));
endmodule
