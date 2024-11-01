module top
#(parameter param17 = ((^((((8'ha8) || (7'h44)) << ((8'ha5) ? (8'hb4) : (8'had))) ? (^((8'hab) < (8'ha9))) : ((-(7'h43)) & ((8'hb5) * (8'hb4))))) <= ({(&((8'hb6) == (8'ha5))), ((^~(8'ha9)) ? (~&(7'h41)) : (^~(8'hbf)))} ? (~^({(8'h9f)} ? ((8'hbc) > (8'h9f)) : (8'haf))) : {(((8'haf) || (8'h9d)) ^ (~(8'hb5)))})), 
parameter param18 = param17)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= (wire0[(4'hb):(3'h6)] ?
          $unsigned($signed(wire3[(2'h2):(1'h0)])) : {wire3});
      reg7 <= ({$unsigned(wire4[(4'hb):(3'h5)]),
              $unsigned((wire5 & (wire5 ? wire1 : wire2)))} ?
          wire1 : wire3);
    end
  assign wire8 = reg6[(3'h6):(1'h0)];
  assign wire9 = wire2;
  assign wire10 = reg7;
  assign wire11 = ((^(~wire10[(4'h9):(1'h0)])) ^~ ((wire8 ^ (^~$signed(wire3))) ?
                      wire3 : ((^wire10[(3'h4):(2'h2)]) || {wire9[(2'h3):(1'h0)],
                          wire2[(4'h8):(3'h5)]})));
  assign wire12 = wire1;
  assign wire13 = reg7;
  assign wire14 = reg7[(3'h6):(3'h5)];
  assign wire15 = {reg6};
  assign wire16 = ($unsigned((wire0 & {(wire8 == wire2),
                      wire8})) != ((((wire15 ? wire2 : wire8) ?
                              {wire10, reg7} : (-wire4)) ?
                          $unsigned((wire0 ?
                              reg7 : wire3)) : ($unsigned(wire2) ?
                              wire3[(4'ha):(4'h8)] : reg6[(1'h0):(1'h0)])) ?
                      ((8'had) == $signed($signed(wire8))) : ((wire14 ?
                              (-wire14) : $unsigned(wire10)) ?
                          (^~wire12) : ({(7'h42), wire5} | (reg7 << wire14)))));
endmodule
