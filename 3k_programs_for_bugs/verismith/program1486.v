module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = $unsigned({$signed((wire4 >>> $signed(wire0)))});
  assign wire6 = ((+{wire5[(4'h8):(1'h0)],
                     {{wire4, wire0}, (wire2 + wire5)}}) << wire1);
  assign wire7 = ((+wire3) > ((~|($signed(wire1) ?
                         {wire1} : $unsigned(wire1))) ?
                     ($signed((&wire1)) || (!(|(8'hba)))) : (~&$signed(wire1[(3'h7):(1'h0)]))));
  assign wire8 = ($unsigned({$unsigned($signed(wire6))}) && wire4[(2'h2):(2'h2)]);
  assign wire9 = wire8;
  assign wire10 = wire7;
  always
    @(posedge clk) begin
      reg11 <= $signed(((^~(8'hb5)) ?
          $unsigned(wire8) : ($unsigned(wire1[(1'h0):(1'h0)]) - $unsigned($unsigned(wire2)))));
      reg12 <= $unsigned(((^wire8[(3'h7):(2'h2)]) <= {wire9}));
      reg13 <= $signed((~&$unsigned(wire6[(3'h7):(3'h5)])));
      reg14 <= (&($unsigned(wire8) ? wire7 : reg12[(2'h2):(1'h0)]));
      reg15 <= $signed($signed(wire6[(3'h7):(1'h1)]));
    end
  assign wire16 = wire3[(1'h0):(1'h0)];
  assign wire17 = reg15;
endmodule
