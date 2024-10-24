module top
#(parameter param19 = (8'ha8))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed(((+($unsigned(wire4) & wire2)) ?
                     $signed($unsigned((wire3 ?
                         (8'ha5) : wire0))) : {wire1[(3'h5):(3'h5)]}));
  assign wire6 = (8'hba);
  assign wire7 = wire3[(1'h1):(1'h1)];
  assign wire8 = wire6[(2'h2):(1'h0)];
  assign wire9 = wire4[(4'hd):(4'h8)];
  always
    @(posedge clk) begin
      reg10 <= $signed(wire2);
      reg11 <= (wire8[(4'h8):(2'h2)] ? wire9 : {(&wire2[(5'h11):(3'h6)])});
      reg12 <= wire1;
      reg13 <= $signed((($signed($signed(wire4)) | $unsigned((reg11 ?
          wire9 : wire1))) > wire8[(4'h8):(2'h2)]));
      reg14 <= (+{$signed($unsigned((reg13 && reg12))), wire0[(3'h4):(2'h2)]});
    end
  assign wire15 = (|($unsigned(((reg13 << (8'ha0)) ~^ ((8'hac) >>> wire0))) ^~ ((!{wire2}) >>> {{wire5},
                      {wire9}})));
  assign wire16 = wire1;
  assign wire17 = $signed(wire1);
  assign wire18 = $signed($signed(($unsigned(wire5[(4'h8):(3'h5)]) ?
                      reg13[(3'h4):(3'h4)] : wire16[(1'h1):(1'h0)])));
endmodule
