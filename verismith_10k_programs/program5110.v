module top
#(parameter param18 = (((~{{(8'ha3), (8'hb3)}}) ~^ ((((8'hb7) ? (8'ha5) : (8'ha8)) ? ((8'ha2) >= (8'hb1)) : (|(8'haa))) ? (((8'hb0) ? (7'h43) : (8'hbf)) ? (8'ha3) : ((7'h40) || (7'h40))) : (((8'ha6) * (8'ha4)) ? (8'hb6) : (~|(8'h9d))))) * (-(~((+(7'h41)) ? ((8'haf) ? (8'hbd) : (8'h9f)) : ((8'hb0) ^ (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire1[(3'h7):(2'h3)];
  assign wire6 = (+(|wire4));
  assign wire7 = ({$signed(wire1[(4'hb):(4'hb)])} > wire0[(4'h8):(2'h2)]);
  assign wire8 = wire5[(3'h4):(3'h4)];
  assign wire9 = wire5;
  assign wire10 = (|$unsigned($signed(wire7)));
  assign wire11 = {$unsigned($unsigned(wire4[(4'hb):(1'h1)]))};
  always
    @(posedge clk) begin
      reg12 <= (wire5 >> $unsigned((((wire11 > wire3) != ((8'hbf) * wire7)) << wire3)));
      reg13 <= (wire9 >>> wire3[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg14 <= {(((^(wire8 | wire6)) ? wire8 : wire4) ?
              wire11[(3'h4):(2'h2)] : wire0[(3'h5):(3'h4)])};
    end
  assign wire15 = ((+$unsigned($unsigned(wire0[(3'h7):(3'h4)]))) > reg12);
  assign wire16 = $signed($unsigned((($signed(wire15) ^ wire10[(4'h9):(4'h8)]) ?
                      (&(reg12 != wire15)) : $unsigned((|reg14)))));
  assign wire17 = wire15[(4'hf):(2'h3)];
endmodule
