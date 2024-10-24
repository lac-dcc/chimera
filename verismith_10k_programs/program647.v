module top
#(parameter param15 = (+((&(&(^~(8'hb7)))) ? (-{(+(8'hbf)), ((7'h41) <= (8'h9e))}) : (8'hb4))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = $signed(((&(wire1 & (wire0 ? wire4 : wire3))) ?
                     wire2 : (($signed(wire2) ? (8'ha9) : wire1) >> ((8'ha2) ?
                         (~wire0) : wire3[(4'ha):(4'h8)]))));
  assign wire6 = wire3;
  assign wire7 = (|(^~(((7'h41) == (~wire3)) ?
                     ((wire0 << wire3) ?
                         wire3[(5'h10):(4'hc)] : wire5) : wire5)));
  assign wire8 = {{(wire5[(5'h11):(4'hb)] < (~wire5)),
                         $unsigned({{wire7}, ((8'ha8) & (8'ha2))})},
                     wire7};
  assign wire9 = (((~^{{wire1}}) ? wire8 : wire0) ^ wire7[(4'h8):(3'h7)]);
  assign wire10 = wire1[(5'h12):(3'h7)];
  assign wire11 = $signed({wire1[(4'hb):(3'h6)],
                      ((~|$unsigned(wire10)) ?
                          $unsigned((7'h44)) : wire3[(4'h9):(4'h9)])});
  assign wire12 = wire0[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg13 <= (!{((^~$signed(wire1)) << {((7'h44) ? wire0 : wire3),
              (wire12 != wire7)}),
          wire12});
      reg14 <= ((((reg13[(1'h0):(1'h0)] >= wire6) == wire12) ?
              (~&(!(+wire11))) : wire8) ?
          {(-$unsigned((wire11 + wire2)))} : (wire9 != {wire3,
              $unsigned({wire8, (8'hb1)})}));
    end
endmodule
