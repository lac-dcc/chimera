module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~|(wire3 ?
          ((wire3[(1'h1):(1'h1)] >>> (wire2 ? wire3 : wire0)) ?
              (wire3[(1'h0):(1'h0)] ?
                  (wire0 + (8'haf)) : (-(8'haa))) : $signed($signed(wire3))) : wire2));
    end
  assign wire5 = {wire0, reg4[(4'hc):(2'h3)]};
  assign wire6 = ({$signed(($unsigned(wire0) || (reg4 ? wire0 : (8'hbb)))),
                     {(reg4 && wire3[(1'h1):(1'h1)]),
                         wire3[(2'h2):(1'h0)]}} + $signed(($unsigned((wire2 < reg4)) ~^ (~&$signed(wire0)))));
  assign wire7 = wire3;
  assign wire8 = (|(({(wire5 ? wire6 : wire2)} ?
                     wire6[(4'hd):(1'h1)] : (!{reg4,
                         wire7})) >> $unsigned($signed(((8'ha9) ?
                     wire5 : wire6)))));
  assign wire9 = (~wire0[(1'h0):(1'h0)]);
  assign wire10 = wire9[(2'h2):(1'h0)];
  assign wire11 = wire2[(4'h9):(3'h7)];
  always
    @(posedge clk) begin
      reg12 <= ((~|(wire5[(3'h4):(3'h4)] ?
              (+$signed(wire0)) : $signed(wire3))) ?
          $unsigned(($unsigned(wire1) && {(wire6 ? (8'hb6) : (7'h44)),
              $unsigned(wire8)})) : wire0);
      reg13 <= (~^($signed((wire0 << wire2[(3'h5):(2'h3)])) >>> {(wire2[(4'hb):(2'h2)] << {wire7,
              wire10})}));
    end
endmodule
