module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (wire0[(3'h4):(1'h1)] - $unsigned($unsigned((&(wire3 * wire0)))));
  assign wire5 = wire0;
  assign wire6 = wire2[(1'h0):(1'h0)];
  assign wire7 = $unsigned((~^wire4[(3'h5):(2'h3)]));
  assign wire8 = wire4[(3'h6):(3'h6)];
  assign wire9 = $unsigned(wire4);
  assign wire10 = $signed($unsigned((wire7 ?
                      wire3[(2'h2):(2'h2)] : $unsigned($signed(wire2)))));
  always
    @(posedge clk) begin
      reg11 <= wire7[(4'he):(4'h8)];
      reg12 <= ($signed($unsigned((8'hb9))) - ((-(((8'hab) <= wire10) + wire2)) ?
          (((wire5 <= wire2) > wire2) ?
              (~^wire8[(1'h0):(1'h0)]) : (+((8'hac) >= (7'h40)))) : ({wire6[(4'hb):(3'h5)],
              (^wire2)} + (!wire7[(1'h0):(1'h0)]))));
      reg13 <= ((((-reg11[(1'h0):(1'h0)]) ^~ wire4) <= (~^$signed(wire2))) ?
          $unsigned({({wire5, wire2} ?
                  wire0 : wire5[(4'hf):(3'h6)])}) : $signed($unsigned((-(wire6 ^ reg11)))));
      reg14 <= (wire2 >> ($signed(($signed(reg11) + $signed(wire1))) ?
          $unsigned($signed({wire1})) : $unsigned({$unsigned(wire1)})));
      reg15 <= wire1[(3'h5):(1'h1)];
    end
  assign wire16 = ((~|((wire6[(2'h3):(2'h2)] + (~|wire6)) ^ wire3)) ?
                      (-(((~|wire4) ^ (wire9 == wire4)) > ((-wire4) <<< wire8[(2'h3):(1'h0)]))) : $unsigned($unsigned((&(wire6 ?
                          (8'hae) : (8'hb1))))));
  assign wire17 = (wire8[(1'h1):(1'h1)] ?
                      ((8'ha3) ^~ (-($unsigned(wire8) ?
                          (!wire9) : ((8'hb8) ?
                              wire9 : reg12)))) : ({{$signed((8'ha2)),
                                  wire2[(4'he):(2'h2)]}} ?
                          $unsigned($signed($signed(reg12))) : (~|(reg14[(4'hb):(4'h8)] != ((8'ha3) ?
                              reg15 : reg15)))));
endmodule
