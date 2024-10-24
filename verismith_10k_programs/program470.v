module top
#(parameter param15 = {((|(((8'h9d) & (8'hb3)) ? (^~(8'hb6)) : ((8'hb3) - (8'h9e)))) ? (7'h41) : (({(8'hb6)} ? ((8'h9c) ? (8'ha4) : (7'h44)) : ((8'h9f) >>> (8'hab))) ? (((8'hbc) ? (7'h40) : (7'h44)) ? (^(8'haa)) : (-(8'ha8))) : ({(8'hae), (8'hac)} ? ((8'had) ? (8'had) : (8'h9e)) : ((8'hba) ? (8'h9f) : (7'h43)))))}, 
parameter param16 = {param15})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed($unsigned((wire2[(3'h6):(3'h4)] ?
                     wire1 : wire3[(4'hb):(4'hb)])));
  assign wire6 = $signed(({(wire2 ? (|wire5) : ((8'hb4) >>> wire2)),
                     (~&(&wire4))} + wire1));
  always
    @(posedge clk) begin
      reg7 <= (wire5[(2'h3):(2'h3)] <<< wire1);
      reg8 <= wire0;
      reg9 <= wire3[(5'h10):(4'he)];
    end
  assign wire10 = $unsigned(wire3[(4'h9):(2'h2)]);
  assign wire11 = (8'ha5);
  assign wire12 = wire5[(2'h2):(1'h1)];
  assign wire13 = ($unsigned(wire12) + ($signed(((~|wire10) != $signed(wire3))) || {{$signed(wire5),
                          (!wire10)},
                      $unsigned(((8'hb0) < wire2))}));
  assign wire14 = ((+wire2[(4'he):(3'h6)]) ?
                      $signed((^(+(wire1 || reg9)))) : wire6);
endmodule
