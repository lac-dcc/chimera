module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = (+wire1[(1'h0):(1'h0)]);
  assign wire6 = wire0[(3'h4):(1'h0)];
  assign wire7 = (^~($unsigned($unsigned((wire1 ? (8'hb2) : wire5))) ?
                     wire4 : wire0));
  assign wire8 = (wire5[(1'h1):(1'h0)] ?
                     (&$signed(wire1[(4'ha):(3'h5)])) : wire4);
  assign wire9 = ($signed($signed($signed((wire5 <<< wire1)))) ?
                     (&$unsigned(((~^wire2) >= $signed(wire5)))) : (~^(+wire5[(2'h2):(1'h0)])));
  assign wire10 = wire3;
  assign wire11 = ((~&$unsigned({(wire6 ? wire6 : wire1)})) ?
                      ((-(^$unsigned(wire2))) ?
                          $signed(($unsigned(wire5) ?
                              (7'h41) : (wire4 ? wire0 : wire0))) : ((~^(wire2 ?
                                  wire9 : wire7)) ?
                              (wire1[(4'h9):(3'h5)] && wire8[(3'h6):(3'h5)]) : {wire3[(4'hb):(3'h4)]})) : wire3[(2'h2):(1'h0)]);
  assign wire12 = (+wire7[(1'h0):(1'h0)]);
  assign wire13 = $signed(wire3);
  always
    @(posedge clk) begin
      reg14 <= $signed(((~&((^~(8'ha3)) <= {wire4})) == $unsigned($signed($unsigned(wire12)))));
      reg15 <= $unsigned(((^((wire8 ? wire2 : reg14) ?
              (wire10 ^ wire10) : wire1[(2'h2):(1'h1)])) ?
          wire2[(4'hc):(2'h2)] : wire5[(3'h5):(2'h3)]));
    end
endmodule
