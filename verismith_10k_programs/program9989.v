module top
#(parameter param17 = (~|((({(8'hb2), (8'ha0)} ? (!(8'hb5)) : {(8'ha3), (8'hbe)}) ? (((8'h9f) + (7'h41)) ? {(8'hb6), (8'hb7)} : ((8'ha9) != (8'hbd))) : (((8'hbc) ? (8'hbf) : (8'hbc)) != (-(8'ha3)))) ? (-({(8'hbc)} && {(8'h9f)})) : (^~(8'h9e)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg15,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (((&wire2) ?
          $signed(($unsigned(wire1) ?
              (wire0 ~^ wire0) : {wire3, wire4})) : $signed(wire3)) ^~ wire3);
    end
  assign wire6 = $unsigned($unsigned($unsigned(($signed(wire4) ~^ ((8'ha1) >>> (8'hb8))))));
  assign wire7 = $unsigned(wire2);
  assign wire8 = $signed((&$unsigned($signed(reg5[(1'h0):(1'h0)]))));
  assign wire9 = wire8[(2'h3):(1'h1)];
  assign wire10 = $signed(((($signed(reg5) - {reg5, wire7}) ?
                      (wire7[(1'h1):(1'h1)] >> wire1) : {$signed((7'h41))}) >= $signed($signed((wire4 <<< wire4)))));
  assign wire11 = wire9[(3'h4):(3'h4)];
  assign wire12 = ($signed((|wire4[(4'h8):(3'h7)])) ?
                      wire2[(1'h1):(1'h0)] : (8'ha9));
  assign wire13 = $unsigned({$unsigned(wire8),
                      ($signed(wire9[(4'hf):(4'hf)]) ?
                          ((wire0 ?
                              wire12 : wire2) + (!wire3)) : $signed(wire12[(3'h5):(2'h3)]))});
  assign wire14 = $unsigned($signed((~&wire8)));
  always
    @(posedge clk) begin
      reg15 <= wire1[(3'h5):(3'h5)];
    end
  assign wire16 = $signed(wire0);
endmodule
