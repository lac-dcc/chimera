module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(5'h11):(4'hc)];
      reg5 <= ($unsigned((-wire3[(3'h6):(3'h4)])) ?
          ($signed(((|reg4) ? (wire0 ? reg4 : wire2) : reg4)) ?
              ((8'hb7) ~^ wire3) : reg4[(2'h3):(1'h1)]) : (($signed($unsigned(wire2)) != ((wire0 != wire1) ^ {(8'ha5)})) ?
              $signed(({(8'ha6)} <<< (wire0 <<< wire2))) : ((~wire1) > (~wire0))));
      reg6 <= (^$signed(reg4[(1'h0):(1'h0)]));
      reg7 <= $unsigned($signed((((wire1 + (8'hbf)) << $signed(reg6)) ?
          $unsigned(wire0) : $unsigned(((8'hab) ? (8'haf) : wire0)))));
      reg8 <= (8'hbc);
    end
  assign wire9 = $unsigned({reg7[(2'h2):(2'h2)],
                     ((wire3 ? (reg6 ? reg4 : (8'hbd)) : reg4[(2'h3):(2'h3)]) ?
                         {(-reg5), (8'hbc)} : (-{(8'hb0), reg6}))});
  assign wire10 = (reg8[(4'hc):(3'h4)] != reg8[(2'h2):(1'h1)]);
  assign wire11 = $signed(({$unsigned(((8'hbe) || wire2))} ^~ (~&reg4[(1'h0):(1'h0)])));
  assign wire12 = $signed(($unsigned($unsigned((8'hb9))) ?
                      {wire2, $unsigned(reg7)} : ((~$signed((8'had))) ?
                          $unsigned((+(8'hb5))) : reg8)));
  assign wire13 = wire11[(3'h7):(2'h3)];
  assign wire14 = $signed($signed($unsigned($signed((wire10 ?
                      wire13 : wire9)))));
  assign wire15 = $signed($unsigned((8'hb3)));
endmodule
