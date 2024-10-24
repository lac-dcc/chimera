module top
#(parameter param29 = ((^(&{((8'ha3) ? (8'h9e) : (8'hbc))})) ^ {(({(8'hb1), (8'hb6)} ? ((8'hb4) + (8'hbf)) : (|(8'hb3))) ? (8'had) : ({(8'ha5)} <<< {(8'ha4)}))}), 
parameter param30 = ((({(param29 ? param29 : param29), (param29 + param29)} >>> (param29 ? {(8'hb8)} : (param29 ? param29 : param29))) ? (((~&param29) ? (~^param29) : {param29, param29}) <= param29) : ((~|(~^param29)) ? {(param29 <<< param29)} : (!(+param29)))) ? ((!((param29 ? param29 : param29) ? param29 : (param29 ? param29 : param29))) ? (param29 ? ({param29} + (param29 ? param29 : param29)) : (~|param29)) : param29) : (({(param29 ? param29 : param29), (+param29)} << ((param29 ^~ param29) > (param29 > param29))) ? {((param29 > (8'had)) ~^ ((8'hb0) ? param29 : param29))} : param29)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire5,
                 wire4,
                 reg26,
                 reg24,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned(wire2[(2'h2):(1'h0)]));
  assign wire5 = wire1;
  module6 #() modinst18 (wire17, clk, wire2, wire1, wire4, wire0);
  assign wire19 = wire1[(4'hd):(4'hb)];
  assign wire20 = (|$signed(wire19[(2'h3):(1'h1)]));
  assign wire21 = $signed($unsigned(wire20[(2'h2):(1'h0)]));
  assign wire22 = $unsigned(wire21);
  assign wire23 = wire4[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      reg24 <= wire2;
    end
  assign wire25 = $unsigned($unsigned((reg24[(1'h1):(1'h0)] <<< wire1)));
  always
    @(posedge clk) begin
      reg26 <= $unsigned(wire5[(5'h10):(3'h5)]);
    end
  assign wire27 = $unsigned(wire25);
  assign wire28 = reg24[(3'h7):(1'h1)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (|wire8[(4'hc):(4'h8)]);
  assign wire12 = ((^~{(((8'hba) ? wire8 : wire7) ?
                              {wire7, wire10} : $unsigned(wire7))}) ?
                      $unsigned($signed($signed(wire8))) : $signed({$signed(wire10[(4'hb):(2'h2)])}));
  assign wire13 = $signed(wire11);
  assign wire14 = {wire11[(3'h4):(1'h1)],
                      {({(wire10 ? wire11 : wire9)} ?
                              wire10[(4'hc):(4'hc)] : wire9),
                          wire13}};
  assign wire15 = wire12;
  assign wire16 = $signed((wire14 | $signed($signed(wire8[(3'h5):(1'h0)]))));
endmodule
