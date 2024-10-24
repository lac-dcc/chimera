module top
#(parameter param17 = {(-((((8'ha9) ^~ (7'h41)) ? ((8'ha8) <= (8'hb1)) : {(8'hb3), (8'hb7)}) > (8'hb8)))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = (^~{($signed($signed(wire3)) ?
                         wire3 : (wire0[(2'h2):(2'h2)] ? {wire0} : wire3)),
                     (wire2[(5'h10):(4'hc)] ?
                         (~&wire2[(1'h0):(1'h0)]) : ($unsigned(wire1) | (^wire1)))});
  assign wire5 = ($signed(wire0) ?
                     $unsigned($unsigned((8'hb4))) : ($unsigned((wire4[(4'ha):(3'h7)] >> (wire3 ^ wire3))) ?
                         $unsigned($signed($signed(wire3))) : $signed($signed(wire2))));
  assign wire6 = $signed(wire1);
  assign wire7 = (~&(wire2[(2'h2):(2'h2)] ?
                     $unsigned($unsigned($signed(wire3))) : (wire6 || wire1[(2'h2):(2'h2)])));
  assign wire8 = wire5;
  assign wire9 = (wire2 >= (!($signed({wire7}) << $unsigned(wire5[(4'hd):(3'h4)]))));
  assign wire10 = (($signed((((7'h41) > wire7) ? $signed(wire0) : wire8)) ?
                          wire3[(4'h8):(4'h8)] : (wire6 >>> (wire0 || wire5[(5'h11):(3'h5)]))) ?
                      ($unsigned($unsigned(wire7[(1'h0):(1'h0)])) ?
                          $signed((wire6[(1'h1):(1'h1)] + wire5)) : wire2[(4'hd):(4'hc)]) : $unsigned((wire4[(3'h4):(3'h4)] ?
                          wire0[(2'h2):(2'h2)] : ($signed(wire9) == (wire4 ?
                              (8'hb6) : wire8)))));
  assign wire11 = wire6[(4'ha):(1'h0)];
  assign wire12 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg13 <= ((wire0 ?
              wire10[(5'h10):(3'h4)] : (^~((wire10 ?
                  (8'haf) : wire11) != $unsigned(wire3)))) ?
          wire4 : wire11);
      reg14 <= (^~wire0);
      reg15 <= wire4;
      reg16 <= wire12[(3'h4):(1'h0)];
    end
endmodule
