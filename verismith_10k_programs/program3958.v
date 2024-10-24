module top
#(parameter param17 = ({{{((8'hbb) < (8'hbf)), ((8'hb9) ? (8'haf) : (8'ha0))}}} ? ({(~|((8'ha4) ? (8'h9f) : (8'h9d)))} | (^(((8'hb3) ? (8'hae) : (7'h43)) == {(8'hbf)}))) : (^((8'ha0) ^ {((7'h44) ? (8'h9f) : (8'ha1))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ($unsigned(wire4) > $signed((($unsigned(wire3) ?
                         (~&(8'ha3)) : (+wire1)) ?
                     $unsigned(wire0[(1'h0):(1'h0)]) : $signed((+(8'hb0))))));
  assign wire7 = $signed((wire3 ? wire0[(1'h1):(1'h0)] : wire4[(4'h9):(1'h0)]));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire1[(1'h1):(1'h0)]);
      reg9 <= ($signed($unsigned($unsigned((wire4 == wire7)))) * $signed((8'hb7)));
    end
  assign wire10 = wire4;
  assign wire11 = (&($unsigned(($signed((8'h9d)) == $unsigned(wire4))) & ($signed((^wire4)) < $signed((reg9 ?
                      wire4 : wire3)))));
  assign wire12 = wire2;
  assign wire13 = (~|$signed(wire4));
  assign wire14 = ($unsigned(($signed($signed(wire3)) ?
                      reg9 : $signed(reg9[(4'h9):(3'h4)]))) || ({$unsigned((wire7 ^ wire10))} < ($signed(wire4[(5'h13):(3'h4)]) ?
                      $unsigned($signed(wire2)) : (wire5 ?
                          (wire12 ? wire2 : wire10) : (wire6 ^ (8'hb8))))));
  assign wire15 = (~|wire6[(3'h5):(1'h1)]);
  assign wire16 = $signed({($signed(wire12) ?
                          $signed((wire14 * wire11)) : $signed(wire14[(4'hf):(3'h5)]))});
endmodule
