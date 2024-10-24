module top
#(parameter param17 = ((+((((7'h41) ? (8'haa) : (8'hb3)) <= (&(7'h40))) != {((8'hb4) ? (8'hb2) : (7'h42))})) ? {((8'hbc) >= (((8'hbc) || (8'ha1)) ? ((8'hbf) ? (8'had) : (8'hb8)) : {(8'hae), (8'hb7)}))} : ((((~&(7'h42)) ? ((8'ha0) ? (7'h42) : (8'hbf)) : ((8'hbc) ? (8'ha4) : (8'ha0))) ? {(^(8'hb3)), ((8'hbc) >>> (8'hbe))} : (((8'ha1) ? (8'haf) : (8'h9e)) == ((8'hb3) | (8'ha1)))) ? (!({(8'hb1)} ? (8'ha8) : (^~(8'haf)))) : {{(+(8'hbd))}, ((~|(8'hb5)) ? (^(8'hb1)) : (~|(8'ha8)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned(wire3);
  assign wire5 = (7'h43);
  always
    @(posedge clk) begin
      reg6 <= {$unsigned(wire3[(1'h1):(1'h0)]),
          $unsigned({$unsigned(wire5[(2'h3):(1'h1)])})};
      reg7 <= (((^({wire2} ? wire5 : {wire4, wire5})) ?
          wire0 : $unsigned(wire2)) == ((!(8'hbb)) ?
          ($unsigned((wire0 != wire5)) ?
              $signed($signed(wire1)) : $signed(wire1)) : ($unsigned(wire0) ?
              {$signed(reg6), wire1} : (+(wire4 != wire5)))));
      reg8 <= ((((+(8'h9e)) ? wire3 : (reg7[(5'h14):(3'h7)] <= wire0)) ?
              $unsigned({(wire2 ? reg7 : wire4)}) : ((reg6[(3'h5):(2'h3)] ?
                  (~&wire1) : $signed(wire3)) == ($signed(wire4) ~^ (wire0 ?
                  wire2 : (8'ha6))))) ?
          (-(-((wire1 | wire0) ^ (^~wire1)))) : $signed(wire2));
      reg9 <= $signed((wire3 >> wire0[(1'h1):(1'h1)]));
    end
  assign wire10 = (-$unsigned((($signed(wire5) <<< $unsigned(wire0)) ?
                      ($unsigned((8'hb9)) ?
                          wire4[(1'h1):(1'h0)] : $unsigned(wire0)) : (((8'ha7) ?
                          reg7 : reg7) == (wire5 ? wire2 : reg8)))));
  always
    @(posedge clk) begin
      reg11 <= ({((-$unsigned((8'ha7))) ?
                  (((8'hb7) <= reg8) ?
                      $unsigned(reg7) : wire0[(2'h2):(2'h2)]) : wire3),
              wire10} ?
          wire4[(2'h3):(1'h0)] : wire10[(1'h0):(1'h0)]);
      reg12 <= wire1;
    end
  assign wire13 = $unsigned(reg6);
  assign wire14 = reg9;
  assign wire15 = (~^wire1[(4'hb):(4'ha)]);
  assign wire16 = wire0[(3'h5):(1'h1)];
endmodule
