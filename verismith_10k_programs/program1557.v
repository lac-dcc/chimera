module top
#(parameter param16 = ({(-({(8'haf)} >= (-(8'h9d)))), (((8'hbb) >= (|(8'h9d))) && (&(~|(8'ha6))))} ^~ (((~^(^~(8'hab))) ? (((8'haa) ^~ (7'h41)) > ((8'ha9) != (8'had))) : (((8'hae) ? (8'ha6) : (7'h42)) ? ((8'hab) << (7'h41)) : ((7'h41) < (8'hac)))) ? ((&((8'ha3) != (7'h43))) << (((8'hbc) ? (8'hbf) : (8'h9f)) ? ((8'ha1) ? (8'ha1) : (8'ha8)) : ((8'hb3) | (8'hb3)))) : (-(~^((8'ha2) <= (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(~|(~{wire3, (^~wire2)}))};
      reg6 <= (wire0[(2'h2):(2'h2)] >>> wire2);
      reg7 <= ((wire4[(2'h2):(1'h0)] && $unsigned((|$unsigned(wire0)))) < (^wire1[(4'hf):(3'h5)]));
    end
  assign wire8 = $signed(($signed(wire2[(1'h0):(1'h0)]) ?
                     wire0 : reg7[(5'h11):(3'h4)]));
  assign wire9 = wire1;
  assign wire10 = $unsigned($signed(($unsigned((wire1 ? reg7 : wire8)) ?
                      (^(~|(8'h9e))) : (wire8[(3'h6):(2'h2)] ?
                          (wire3 ~^ reg6) : (wire9 <<< wire0)))));
  assign wire11 = (wire9 & (~((&$unsigned(wire0)) ?
                      ((wire1 | wire0) < wire3) : $signed((+(7'h44))))));
  always
    @(posedge clk) begin
      reg12 <= ((-reg5[(4'h9):(3'h7)]) << (wire0[(2'h2):(1'h0)] != wire8[(4'h9):(3'h7)]));
      reg13 <= {wire11[(1'h1):(1'h0)]};
      reg14 <= (|(8'hb9));
      reg15 <= (!$unsigned(wire9[(3'h6):(3'h4)]));
    end
endmodule
