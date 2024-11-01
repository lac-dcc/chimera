module top
#(parameter param14 = (|(~&(({(8'h9e)} <<< (-(8'ha1))) ? ((+(8'ha9)) ? (+(8'hbd)) : ((8'hbd) >= (8'hb0))) : {((8'hb6) > (8'hb7))}))), 
parameter param15 = ((((!(param14 > param14)) >= (param14 == {param14})) < param14) > (!(((~|param14) ? {param14, param14} : (^param14)) ? ((^~param14) ^ (param14 && param14)) : ((param14 ? param14 : param14) ? (param14 ? param14 : param14) : (param14 ? param14 : param14))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned(wire2);
  assign wire5 = $signed(wire2);
  assign wire6 = wire5[(3'h6):(1'h0)];
  assign wire7 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg8 <= $unsigned($unsigned(({$signed((8'haf))} ?
          $unsigned(wire4) : wire7)));
    end
  assign wire9 = (8'haa);
  assign wire10 = wire5[(3'h4):(1'h0)];
  assign wire11 = reg8[(1'h1):(1'h0)];
  assign wire12 = $unsigned((((^~$unsigned(wire2)) ?
                          $unsigned({wire3}) : (~&{wire7})) ?
                      $signed({(+wire5),
                          (8'hb4)}) : ($unsigned(wire9) || (-$signed(wire2)))));
  assign wire13 = (wire4[(2'h3):(2'h3)] ?
                      $signed((({wire10, wire1} ?
                          $unsigned(wire10) : wire6) && $unsigned(wire1))) : $unsigned($unsigned(wire0[(4'ha):(3'h5)])));
endmodule
