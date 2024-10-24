module top
#(parameter param14 = (~&{{(((8'hbf) ? (8'haa) : (7'h42)) ? (!(8'hbf)) : (8'hb0)), ({(7'h40)} - ((8'ha1) ? (8'haa) : (8'ha0)))}}), 
parameter param15 = param14)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(((wire1[(4'h8):(3'h7)] ?
          (~$unsigned(wire3)) : ((wire2 | wire3) ?
              (wire4 ? wire3 : wire3) : $signed((8'ha7)))) <<< (8'hb3)));
      reg6 <= {wire2[(1'h0):(1'h0)], wire3[(2'h2):(1'h0)]};
      reg7 <= $unsigned(($unsigned((wire0 ?
              (reg5 ? wire2 : wire2) : $signed(wire0))) ?
          wire0 : (^~reg6[(2'h3):(2'h2)])));
      reg8 <= (wire4[(2'h2):(1'h1)] ?
          (wire1[(4'ha):(3'h6)] ?
              (8'ha6) : {(reg7 == (8'hac)),
                  (~^(wire0 ?
                      reg6 : wire3))}) : ($signed(reg6[(2'h2):(1'h1)]) && reg6[(3'h7):(2'h3)]));
    end
  assign wire9 = $signed({reg5});
  assign wire10 = ({$unsigned(wire0[(3'h4):(2'h3)]), (~&wire1)} ?
                      (reg6 & reg5[(3'h6):(1'h1)]) : wire2[(2'h2):(1'h1)]);
  assign wire11 = {(wire3[(3'h6):(3'h6)] ?
                          (~^(8'hae)) : $unsigned(wire0[(1'h0):(1'h0)]))};
  assign wire12 = reg7;
  assign wire13 = $unsigned(($signed(((reg5 ? reg6 : wire10) ?
                          (~^wire1) : (wire12 ? wire12 : wire4))) ?
                      (wire10 ?
                          {wire10[(2'h2):(2'h2)],
                              {wire11,
                                  wire1}} : $unsigned((wire11 * reg5))) : ({wire4} <= $unsigned((^~reg7)))));
endmodule
