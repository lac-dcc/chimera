module top
#(parameter param14 = {(((&((8'had) >= (8'hbc))) ^ (((7'h40) ? (8'had) : (8'hb1)) ? ((8'hbc) ? (7'h40) : (8'ha5)) : ((8'hb3) ^~ (8'ha9)))) <= (({(8'hb5), (8'hb3)} + (|(8'ha9))) | (~&((8'had) | (8'hba)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (((|$unsigned(((8'hb5) ?
                         wire3 : wire2))) << {wire0[(3'h6):(3'h4)]}) ?
                     {wire4,
                         ((8'ha0) ?
                             (((8'hb8) > wire2) > wire0) : ($unsigned(wire4) ?
                                 (wire2 ?
                                     wire4 : wire0) : (~&wire2)))} : ((wire4 != $signed((wire0 ?
                         wire3 : wire2))) - (~($signed(wire0) ^ {wire2}))));
  assign wire6 = ((^$signed($signed(wire2))) ?
                     ((($signed(wire5) ?
                             wire4[(4'ha):(3'h6)] : (wire0 ? (8'ha5) : wire5)) ?
                         (~|wire5[(1'h1):(1'h1)]) : wire1) ~^ wire2[(1'h0):(1'h0)]) : (8'ha3));
  assign wire7 = (wire6 >> wire6);
  assign wire8 = (~|wire5);
  always
    @(posedge clk) begin
      reg9 <= wire7;
      reg10 <= wire8;
    end
  assign wire11 = (~|$signed($signed($signed(wire3[(3'h6):(1'h1)]))));
  always
    @(posedge clk) begin
      if (((~^{wire1, reg10[(5'h11):(4'h8)]}) && $signed((|{wire11}))))
        begin
          reg12 <= wire5[(1'h0):(1'h0)];
        end
      else
        begin
          reg12 <= (wire0 & (wire3 + ((!(wire7 ? wire8 : wire2)) ?
              (wire1[(3'h4):(1'h0)] - $unsigned(wire2)) : wire1)));
        end
      reg13 <= reg10[(4'ha):(4'h9)];
    end
endmodule
