module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire3));
      reg6 <= (|reg5[(3'h6):(1'h1)]);
    end
  assign wire7 = reg5[(1'h0):(1'h0)];
  assign wire8 = ((~|(((reg5 ? wire1 : reg6) ^ (+reg5)) ?
                         reg6 : $unsigned(wire2))) ?
                     {$unsigned($unsigned(wire0)), (~$signed({reg6}))} : wire4);
  assign wire9 = (8'hb7);
  assign wire10 = ((-wire8) ?
                      (((~$unsigned((8'hb4))) ?
                              wire0[(4'he):(4'he)] : {wire3}) ?
                          {((wire7 ? (8'hb9) : wire2) ^ ((8'hbe) ?
                                  wire8 : wire2)),
                              $unsigned($signed(wire3))} : ((wire1 ~^ wire8) ?
                              (^~$signed(wire4)) : (|$unsigned(wire3)))) : {(+reg6)});
  assign wire11 = wire0[(4'h9):(3'h6)];
  assign wire12 = ((^~{($signed(reg5) ? (wire0 | wire4) : wire10)}) ?
                      wire4 : (~&wire8));
  assign wire13 = $unsigned(($signed(({wire1} ?
                      $signed((7'h43)) : (wire7 ? wire11 : wire11))) ^ wire4));
  assign wire14 = $unsigned((!(~|{wire2[(3'h5):(1'h0)]})));
  assign wire15 = ((((~&(~wire7)) >>> (^~((8'haa) ^ (7'h40)))) > (((wire11 - wire3) != wire11) ?
                      (!wire4) : (wire0 ?
                          (wire4 <<< (7'h41)) : $unsigned(wire13)))) * ({(^$unsigned(wire13))} & $signed(wire13[(2'h3):(1'h0)])));
  assign wire16 = (-$signed((reg5[(4'hf):(4'h8)] ?
                      wire10[(4'hd):(4'hd)] : $signed($unsigned((8'ha2))))));
  assign wire17 = $unsigned((wire8[(2'h2):(1'h1)] ?
                      $signed({wire14, $unsigned(wire16)}) : $signed(((wire15 ?
                              wire2 : reg6) ?
                          (wire3 == wire12) : (&wire9)))));
  assign wire18 = (wire12[(4'he):(4'ha)] ~^ wire10[(3'h4):(1'h0)]);
  assign wire19 = (wire12[(3'h5):(3'h5)] ?
                      $signed($signed(wire13[(3'h5):(2'h2)])) : $signed($signed($unsigned(wire1[(2'h2):(1'h1)]))));
  assign wire20 = wire19[(4'ha):(2'h2)];
  assign wire21 = $unsigned({(^$unsigned((+wire8))),
                      {{{wire4, wire2}, (wire14 ^ wire10)}}});
endmodule
