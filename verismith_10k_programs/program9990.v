module top
#(parameter param17 = (~((({(8'had), (7'h43)} ^~ ((8'haf) ? (8'hab) : (7'h41))) ? {((7'h42) ? (8'hb6) : (8'hac)), (&(7'h43))} : (((8'ha7) ? (8'hb6) : (8'hb3)) ~^ {(7'h41), (8'hab)})) ? ((((8'haf) != (7'h40)) | (~(8'hb2))) ^~ ((~^(8'ha0)) >>> ((8'ha9) ? (8'hb7) : (7'h43)))) : (~|(~^((8'ha7) & (8'hbb)))))), 
parameter param18 = ((|(((param17 ? param17 : param17) & (8'ha1)) || ((^~param17) ? (-param17) : param17))) ? (param17 ? ((((8'hae) ? param17 : param17) ? (param17 | param17) : (&param17)) ? (param17 << (param17 >> param17)) : ((~param17) ? {param17} : param17)) : (param17 ? (8'hbc) : (|(param17 + param17)))) : param17))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 (1'h0)};
  assign wire4 = {(wire3[(3'h4):(1'h1)] ?
                         {($unsigned(wire0) ~^ (wire2 ~^ wire2)),
                             {(~|wire2)}} : wire0[(2'h3):(2'h2)]),
                     wire3[(3'h4):(2'h3)]};
  assign wire5 = (8'hbc);
  assign wire6 = wire0;
  assign wire7 = $signed({($signed(wire0[(3'h5):(1'h0)]) ?
                         (wire2[(2'h3):(2'h3)] + $signed((7'h44))) : (+$unsigned(wire2)))});
  assign wire8 = wire2[(1'h0):(1'h0)];
  assign wire9 = $signed($signed({($unsigned(wire3) ?
                         $signed(wire2) : (~|wire4)),
                     ((wire3 ? (8'ha7) : (8'h9e)) << wire8[(1'h0):(1'h0)])}));
  assign wire10 = wire4[(2'h2):(2'h2)];
  assign wire11 = $unsigned(wire7);
  assign wire12 = wire11[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= wire12;
    end
  assign wire14 = ((|($signed($unsigned(wire7)) ?
                          (~|(^~(8'haf))) : $unsigned($unsigned(wire8)))) ?
                      (|((((8'ha1) - wire9) + ((8'ha1) >= wire8)) == $unsigned($unsigned(wire12)))) : wire7[(3'h5):(3'h4)]);
  assign wire15 = $signed((wire3[(5'h10):(3'h7)] != $unsigned(($signed((8'hbd)) ~^ wire2[(1'h1):(1'h0)]))));
  assign wire16 = $unsigned($signed($signed(wire14[(1'h0):(1'h0)])));
endmodule
