module top
#(parameter param14 = (8'hae), 
parameter param15 = (param14 ^~ (((~^((8'ha7) | (8'hac))) >> (8'hb2)) ^~ (&(|(8'hb0))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 (1'h0)};
  assign wire4 = (wire3 * (wire0 ?
                     wire3 : ((7'h42) ?
                         (^(wire3 ? wire1 : wire2)) : {(wire2 ? wire0 : wire2),
                             (wire2 && wire3)})));
  assign wire5 = (($signed($unsigned(wire1)) > (^$signed(wire0))) ?
                     $signed(wire0[(3'h5):(1'h1)]) : wire4[(3'h4):(3'h4)]);
  assign wire6 = wire3[(5'h10):(4'he)];
  assign wire7 = $unsigned($unsigned(wire0[(1'h0):(1'h0)]));
  assign wire8 = $unsigned(wire2);
  assign wire9 = {wire6,
                     {((wire4 - (wire3 >= wire5)) ?
                             $signed((8'ha0)) : (~&(!wire4)))}};
  assign wire10 = wire7;
  assign wire11 = wire6;
  always
    @(posedge clk) begin
      reg12 <= ($unsigned(wire4[(1'h1):(1'h1)]) ?
          wire8[(1'h1):(1'h1)] : wire11[(2'h2):(2'h2)]);
    end
  assign wire13 = wire4[(3'h5):(1'h0)];
endmodule
