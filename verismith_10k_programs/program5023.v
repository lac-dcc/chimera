module top
#(parameter param16 = (((({(8'hbd)} ? (!(8'hbd)) : ((8'haf) ? (8'hbe) : (8'hb3))) >= ({(8'haf), (8'hb7)} ? ((8'hb9) ? (8'hb4) : (8'hb7)) : {(8'hb7)})) ? ({((8'ha5) | (8'hb5))} ? (((8'h9f) ? (8'hab) : (8'hb0)) ? {(8'hac)} : (8'hb6)) : (8'hb5)) : (((^~(8'ha6)) ? ((8'ha5) & (8'ha4)) : ((8'h9d) ~^ (8'ha4))) && (!(~^(8'ha9))))) ? (|(((~(8'hbd)) ? ((7'h42) ? (8'ha5) : (8'hbc)) : (-(8'hb2))) >>> (((8'hb8) ^~ (8'ha4)) ? ((8'hb3) <= (8'hb1)) : ((8'hbc) != (8'h9c))))) : ((+(-(&(8'hb4)))) & {(8'hb7)})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire6;
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 reg15,
                 reg8,
                 reg7,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((~^(~|$signed(wire3))));
    end
  assign wire6 = (-$signed(wire2));
  always
    @(posedge clk) begin
      reg7 <= {wire1, wire3[(1'h1):(1'h1)]};
      reg8 <= (^$signed(($signed((&wire2)) >= $signed($signed(wire3)))));
    end
  assign wire9 = ($unsigned((^~wire4)) ?
                     $unsigned((~(~|reg7))) : {$unsigned(((wire1 ?
                             (8'ha1) : wire3) > wire3))});
  assign wire10 = wire1[(3'h4):(1'h0)];
  assign wire11 = ($signed({wire6}) ?
                      (-wire1[(1'h0):(1'h0)]) : $unsigned((~|reg7)));
  assign wire12 = $unsigned($unsigned(wire4));
  assign wire13 = {wire12[(4'he):(4'ha)]};
  assign wire14 = $unsigned(wire2[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= {wire4};
    end
endmodule
