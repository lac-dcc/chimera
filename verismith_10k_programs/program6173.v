module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
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
                 wire5,
                 wire4,
                 reg19,
                 reg6,
                 (1'h0)};
  assign wire4 = (~&wire2[(4'ha):(4'ha)]);
  assign wire5 = (wire0 ?
                     $signed(wire2[(1'h0):(1'h0)]) : (wire2[(5'h12):(5'h12)] ?
                         $unsigned(($unsigned(wire3) ?
                             $signed(wire3) : (wire4 ?
                                 wire1 : (8'hb7)))) : wire2));
  always
    @(posedge clk) begin
      reg6 <= ((($unsigned(wire2) ?
              {(wire2 ? wire2 : wire2)} : ((wire0 + wire0) & (wire4 ?
                  (8'hb0) : wire1))) - ((wire5[(4'hb):(1'h0)] || (8'h9d)) >= (wire2[(5'h10):(5'h10)] ?
              (wire0 & wire5) : wire2[(1'h1):(1'h0)]))) ?
          wire5 : wire3[(3'h6):(3'h5)]);
    end
  assign wire7 = wire0[(2'h3):(1'h0)];
  assign wire8 = (wire3[(4'h8):(3'h5)] >>> (8'hbc));
  assign wire9 = $signed(wire1[(3'h6):(1'h0)]);
  assign wire10 = (&wire9);
  assign wire11 = (((!(~|wire8)) != reg6[(1'h1):(1'h0)]) ?
                      ($signed($unsigned((8'ha1))) >= wire3[(4'h9):(3'h7)]) : wire2);
  assign wire12 = wire5;
  assign wire13 = ($unsigned(wire2) != wire2[(4'h9):(4'h9)]);
  assign wire14 = wire2;
  assign wire15 = (~($unsigned($unsigned((&wire0))) >= (($unsigned((8'hae)) ?
                      ((8'hac) ? wire12 : wire8) : wire3) * (-{wire5}))));
  assign wire16 = (^wire1);
  assign wire17 = wire4;
  assign wire18 = (+wire15[(5'h12):(2'h2)]);
  always
    @(posedge clk) begin
      reg19 <= (^~$signed($signed((wire9[(4'ha):(3'h4)] <= $signed(wire11)))));
    end
  assign wire20 = wire2[(4'h9):(2'h2)];
endmodule
