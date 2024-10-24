module top
#(parameter param19 = (~(((((8'hb3) ? (8'had) : (8'hb2)) || ((8'haf) ? (7'h40) : (8'hac))) ^ (((8'ha2) ? (8'hae) : (8'haf)) ? ((8'hac) == (8'ha3)) : {(8'ha0)})) & ({{(8'h9d), (8'hbd)}} ? (+{(8'ha2), (8'hbb)}) : (((8'hbd) && (8'hb5)) >= ((8'hbd) <= (8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 (1'h0)};
  assign wire4 = $signed(wire2[(4'he):(3'h7)]);
  assign wire5 = $unsigned(wire4);
  assign wire6 = wire0[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg7 <= {(($signed({wire2,
              wire6}) * (-(wire6 ^ wire1))) - ($signed(wire4) <= wire2)),
          (~&{(^wire1[(4'hc):(2'h2)])})};
    end
  assign wire8 = wire1;
  assign wire9 = (~^{(~|wire2[(4'hc):(4'hc)])});
  assign wire10 = $signed(wire8);
  assign wire11 = $unsigned(wire6);
  assign wire12 = $signed($unsigned(($signed((&wire6)) * wire3[(4'hc):(4'h9)])));
  assign wire13 = $signed((-$unsigned(reg7[(1'h1):(1'h1)])));
  assign wire14 = wire6[(2'h2):(1'h0)];
  assign wire15 = ({wire11, $unsigned(wire5[(4'ha):(2'h3)])} ?
                      (+$unsigned(wire2)) : $unsigned($unsigned(((wire10 <<< wire0) ?
                          $unsigned(wire2) : (wire9 ? (7'h41) : (8'hb3))))));
  assign wire16 = ($unsigned($signed(($signed(wire10) ?
                      (wire15 - wire9) : wire4[(1'h1):(1'h0)]))) + (!wire3[(4'hb):(3'h7)]));
  assign wire17 = $signed({($unsigned(wire1[(2'h3):(2'h2)]) ?
                          (wire12[(4'hf):(3'h7)] ?
                              $unsigned(reg7) : (~&(8'ha8))) : (wire15[(4'h9):(1'h0)] ?
                              $signed((8'hab)) : $unsigned(wire0)))});
  assign wire18 = $unsigned(wire9[(1'h0):(1'h0)]);
endmodule
