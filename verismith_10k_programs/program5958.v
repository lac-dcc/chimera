module top
#(parameter param15 = ({({((7'h43) | (8'hb3))} >= (((8'ha6) <= (8'ha4)) ? ((8'hbb) >>> (8'hb3)) : ((8'hb8) ? (8'ha8) : (8'hae))))} ~^ {{((~^(8'hbe)) ? ((8'haa) ^~ (8'h9c)) : (!(8'ha5)))}, ((8'hb4) - ((&(8'hb5)) + ((8'hac) <<< (8'hab))))}), 
parameter param16 = {(&((|(!(8'ha7))) ? (~^(^~param15)) : (!(+param15))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = ((wire1 == wire5[(3'h7):(3'h6)]) ?
                     wire3[(2'h2):(1'h1)] : wire4[(4'hb):(2'h2)]);
  assign wire7 = wire2;
  assign wire8 = wire2;
  assign wire9 = (&($signed((~$signed(wire4))) ?
                     (^((^wire7) ?
                         (wire0 <= (8'ha0)) : $unsigned(wire7))) : wire3[(4'h9):(4'h9)]));
  assign wire10 = $unsigned((|(wire4 == $unsigned($signed(wire3)))));
  assign wire11 = $unsigned(wire1[(5'h11):(4'he)]);
  always
    @(posedge clk) begin
      reg12 <= wire9[(3'h4):(2'h3)];
      reg13 <= $unsigned($signed((~^$signed(wire5[(2'h3):(1'h1)]))));
      reg14 <= {$unsigned((8'hb6)),
          ($signed(wire0[(4'he):(4'ha)]) >>> (^~{(wire7 ? (8'hae) : wire3),
              wire10}))};
    end
endmodule
