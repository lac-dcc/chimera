module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire14,
                 wire13,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = ((&(wire2 ?
                     (&{wire1}) : wire3[(3'h5):(1'h1)])) > {(wire0[(3'h6):(1'h0)] ?
                         (~&(!wire1)) : (^(wire2 ? wire3 : wire3))),
                     wire0});
  assign wire5 = (wire4[(4'ha):(2'h2)] * $signed(wire4));
  assign wire6 = wire2;
  assign wire7 = wire1;
  assign wire8 = $signed($signed((-$signed((^wire2)))));
  assign wire9 = $signed(({(&(8'h9f))} ?
                     $unsigned(((wire6 == wire0) ?
                         {wire1} : (~^wire6))) : {$unsigned((wire8 > wire4))}));
  assign wire10 = {$signed(((&(~^wire4)) ? wire8 : (^~wire3)))};
  always
    @(posedge clk) begin
      reg11 <= (wire10 >>> (wire0[(1'h1):(1'h1)] >>> (~^$signed($unsigned(wire8)))));
      reg12 <= ((wire7 && {($signed(wire0) ? {(8'hbc)} : {wire3, wire10}),
          ($signed(wire2) ?
              (wire7 >> wire10) : wire6[(4'ha):(3'h5)])}) <= $unsigned(wire5[(1'h1):(1'h1)]));
    end
  assign wire13 = reg11;
  assign wire14 = wire7;
  always
    @(posedge clk) begin
      reg15 <= (8'had);
      reg16 <= (^wire2);
    end
  assign wire17 = $signed((wire8 & reg15));
  assign wire18 = ($unsigned($signed(wire17)) ?
                      (^~(~wire5)) : {(($unsigned(wire2) ?
                                  wire4 : wire10[(3'h7):(1'h0)]) ?
                              (~|(wire8 ~^ wire7)) : (!{(8'hb9), wire2})),
                          {({wire2} ? (^wire10) : $signed((8'hac))),
                              (~$unsigned(reg16))}});
endmodule
