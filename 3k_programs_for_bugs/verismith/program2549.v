module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 (1'h0)};
  assign wire4 = {($signed($signed((|wire0))) ?
                         (wire0[(4'ha):(2'h3)] ?
                             wire3 : $unsigned((wire1 ?
                                 wire2 : wire1))) : {$unsigned(wire0), wire1})};
  assign wire5 = wire4[(4'he):(2'h3)];
  assign wire6 = $unsigned((((((8'hb1) ? (8'hb2) : wire1) ?
                         wire1[(1'h0):(1'h0)] : (8'ha7)) | (((8'hac) ?
                             wire5 : wire0) ?
                         (wire2 ? wire5 : (7'h40)) : (~&wire3))) ?
                     (^(~&wire0)) : $signed($signed((wire5 ? wire1 : wire4)))));
  assign wire7 = $unsigned(((wire0 ?
                     ($signed(wire3) >= $unsigned(wire1)) : {((8'hb4) ?
                             wire4 : wire5),
                         $unsigned(wire4)}) & (wire4[(4'hd):(3'h5)] ?
                     wire5 : (wire4 ? (wire2 ^~ wire5) : $unsigned(wire5)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((8'hb7));
    end
  assign wire9 = wire0[(4'hb):(4'h8)];
  assign wire10 = $unsigned((^~wire1[(2'h3):(2'h3)]));
  assign wire11 = wire6[(2'h2):(2'h2)];
  assign wire12 = wire7[(4'hb):(3'h7)];
  assign wire13 = $signed((^wire9[(1'h0):(1'h0)]));
  assign wire14 = (+wire13[(4'hd):(4'h9)]);
endmodule
