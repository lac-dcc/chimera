module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire38,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire4,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (((wire2[(2'h2):(1'h0)] && (+$unsigned(wire3))) ?
                     (!wire3[(1'h1):(1'h0)]) : wire3) <<< $unsigned((^$unsigned((wire0 ^ wire2)))));
  always
    @(posedge clk) begin
      reg5 <= wire1;
      reg6 <= wire3[(1'h0):(1'h0)];
      reg7 <= (|wire3);
    end
  assign wire8 = wire2;
  assign wire9 = $unsigned((reg5 < $unsigned($signed($unsigned(wire3)))));
  assign wire10 = {reg7[(4'he):(4'hb)], wire8[(3'h7):(3'h4)]};
  assign wire11 = $unsigned(reg6[(3'h4):(1'h1)]);
  assign wire12 = (-wire1);
  module13 #() modinst39 (wire38, clk, reg6, wire4, reg7, wire10);
  assign wire40 = ((~|($unsigned(wire0[(2'h2):(2'h2)]) << $signed((~&wire1)))) ?
                      wire0 : ((~(|(wire2 ?
                          reg7 : reg7))) * {$signed($signed(wire11)),
                          (!$signed(reg7))}));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  assign y = {wire37,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg22,
                 (1'h0)};
  assign wire18 = (~|(~&$signed({wire17})));
  assign wire19 = {{{$signed(wire16), $signed($signed(wire16))}}};
  assign wire20 = ((&(-{(wire17 ? wire19 : wire17), $signed(wire15)})) ?
                      (($signed($unsigned(wire18)) ?
                              $signed(((8'haf) + wire17)) : wire14[(2'h3):(1'h0)]) ?
                          wire18[(4'hb):(1'h0)] : $unsigned(({wire16} >> $unsigned(wire19)))) : $signed((&(8'hb8))));
  assign wire21 = (wire16[(2'h2):(1'h1)] ~^ wire19);
  always
    @(posedge clk) begin
      reg22 <= wire17;
    end
  assign wire23 = $unsigned(wire16);
  assign wire24 = (wire16 ? wire21 : wire23);
  assign wire25 = (wire15[(4'h9):(2'h2)] ?
                      wire16 : (((((8'ha4) >>> wire18) ?
                          $unsigned(wire14) : (^~reg22)) >>> ({wire15} >>> (wire18 << wire21))) >> (({(8'h9d)} ^ (wire23 ?
                              wire20 : wire20)) ?
                          (^~(wire24 < wire16)) : $unsigned(wire24[(4'ha):(4'h8)]))));
  assign wire26 = ({{wire21[(2'h3):(2'h3)], (!$unsigned(wire23))},
                      $unsigned({{wire15}})} ^ wire19[(1'h1):(1'h1)]);
  assign wire27 = wire24;
  assign wire28 = wire14;
  assign wire29 = {wire19, $unsigned($signed({(~wire28)}))};
  assign wire30 = (|$unsigned(wire28[(1'h0):(1'h0)]));
  assign wire31 = (wire20[(3'h7):(2'h3)] ?
                      ($signed(wire15) ^ wire23[(4'h9):(4'h8)]) : reg22[(3'h5):(2'h2)]);
  assign wire32 = $unsigned(wire28[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg33 <= (wire17 ?
          (+(&(+$signed(wire26)))) : ((^{(|wire16)}) ?
              ($unsigned((wire29 ? wire30 : wire16)) && wire28) : {((~wire21) ?
                      (wire30 ? wire31 : wire23) : (^~wire20)),
                  wire24}));
      reg34 <= (wire21 ?
          reg33 : (($unsigned((reg33 ~^ wire32)) ?
              wire23[(4'h9):(4'h8)] : $unsigned($signed(wire32))) ^ (&wire17[(2'h3):(2'h3)])));
      reg35 <= (($signed(({wire18} ?
          wire32[(1'h1):(1'h1)] : (wire30 ?
              wire24 : (8'hbc)))) - wire27) ^~ $signed(($signed((+wire15)) || wire29[(4'hc):(2'h3)])));
      reg36 <= (~(-$signed(wire21)));
    end
  assign wire37 = (8'ha8);
endmodule
