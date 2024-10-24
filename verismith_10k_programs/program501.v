module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {$signed((~{wire4})), wire3[(1'h0):(1'h0)]};
  assign wire6 = $unsigned($signed((wire2[(3'h6):(3'h6)] << (^~wire5))));
  assign wire7 = $unsigned($signed((!($signed(wire0) != $unsigned(wire3)))));
  assign wire8 = $unsigned((~&{(|((8'hb9) ? wire3 : wire7)),
                     ((wire6 ? wire4 : wire3) & $unsigned((8'ha1)))}));
  assign wire9 = wire6[(1'h0):(1'h0)];
  assign wire10 = $signed(wire5);
  assign wire11 = wire4[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= $signed((8'hb7));
      reg13 <= $signed($signed($unsigned(wire3[(4'h8):(3'h4)])));
      reg14 <= ($unsigned(wire1) <= ($unsigned((reg13[(3'h7):(3'h5)] * (^~wire9))) + (^~$signed(wire0))));
    end
  assign wire15 = (({reg13} > reg12) * wire0[(4'hf):(4'hb)]);
  assign wire16 = {({(!wire1[(1'h1):(1'h1)]), (8'ha8)} ?
                          $unsigned(((wire10 ~^ wire7) >= (reg13 ?
                              wire10 : wire2))) : {(^wire6[(5'h10):(4'hd)]),
                              (|wire4)})};
endmodule
