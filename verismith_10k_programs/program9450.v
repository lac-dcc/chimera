module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $signed(wire1[(3'h5):(3'h5)]);
  assign wire6 = ($signed($unsigned((~|$signed(wire4)))) ?
                     wire2 : $unsigned(($signed($signed(wire5)) ?
                         wire1 : ($signed((8'ha0)) >>> (+wire2)))));
  assign wire7 = wire0[(3'h5):(1'h0)];
  assign wire8 = wire1;
  always
    @(posedge clk) begin
      reg9 <= wire6[(4'hc):(2'h3)];
    end
  assign wire10 = (~&(~|$signed($signed($signed(wire2)))));
  assign wire11 = {$unsigned(wire6), wire6};
  assign wire12 = wire4;
  assign wire13 = (8'hba);
  assign wire14 = (((($signed(wire1) ? {wire6} : ((8'h9d) ? wire1 : reg9)) ?
                          (^(wire6 < (8'hbb))) : $signed($unsigned(wire6))) + wire11) ?
                      (($signed((~wire4)) ^~ $unsigned($signed(wire8))) ?
                          $unsigned((-(8'hbc))) : (reg9[(4'he):(3'h6)] >>> wire12[(1'h0):(1'h0)])) : (wire12[(2'h2):(1'h0)] == ($unsigned((wire6 ?
                          wire10 : wire13)) >= wire11[(4'ha):(4'ha)])));
  assign wire15 = {(~|wire7[(3'h4):(1'h1)]),
                      ($unsigned((~|(wire14 >>> wire1))) ?
                          $signed(wire3[(2'h3):(1'h0)]) : (8'h9c))};
  assign wire16 = (($unsigned(wire4[(4'he):(4'he)]) ?
                          $unsigned($unsigned((wire0 + wire3))) : wire7[(1'h1):(1'h1)]) ?
                      $signed(wire15) : ({wire7[(5'h10):(4'hb)],
                          (wire2[(4'hb):(2'h2)] ?
                              $signed(wire13) : {wire13})} < (($signed(wire13) ?
                              (~&wire15) : (~wire4)) ?
                          $signed($signed(reg9)) : ((8'h9f) ^~ (wire7 - wire8)))));
  assign wire17 = wire11[(1'h0):(1'h0)];
  assign wire18 = (8'hb8);
  assign wire19 = wire3[(2'h2):(1'h1)];
endmodule
