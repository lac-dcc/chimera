module top
#(parameter param20 = (({(^((8'ha0) ? (8'ha3) : (8'hb2))), ({(8'hb0)} < (!(8'h9c)))} * (~({(8'hbb), (8'h9f)} ? ((8'haa) ? (7'h43) : (7'h42)) : ((8'ha1) * (8'ha6))))) == (-(~^(((8'ha5) ^ (8'hbb)) && ((8'ha0) ? (8'h9e) : (8'hb0)))))), 
parameter param21 = ((((+(param20 ? param20 : param20)) + param20) ? ({(param20 ? (7'h44) : param20), {param20}} - (^~(param20 && param20))) : ((8'ha1) - (~|param20))) < ((((~^param20) ? (~param20) : param20) ? {(^~(8'haf))} : param20) ? (!param20) : param20)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
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
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire2);
      reg5 <= (~|(^~reg4[(4'hb):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg6 <= (!($signed(wire0) ^~ ($signed(reg5) ?
          wire3[(3'h4):(2'h3)] : ($signed(wire3) - $signed(reg4)))));
      reg7 <= $signed({(~wire2)});
    end
  assign wire8 = $unsigned($unsigned(((reg5 ? wire3[(2'h3):(2'h2)] : reg7) ?
                     (wire1[(1'h1):(1'h1)] ?
                         wire2[(4'h9):(2'h2)] : (wire1 <<< reg6)) : $signed(reg4[(2'h2):(1'h1)]))));
  assign wire9 = wire3;
  assign wire10 = (($signed($unsigned($unsigned(wire1))) ^ {(reg6[(1'h0):(1'h0)] >= ((8'hbd) & reg6)),
                          $signed((~|reg4))}) ?
                      reg4 : reg7[(4'hb):(1'h0)]);
  assign wire11 = (wire8[(3'h5):(3'h5)] ?
                      ((reg6[(5'h13):(1'h1)] - $unsigned(wire2[(5'h15):(3'h7)])) ?
                          wire2 : (^reg6[(5'h11):(3'h6)])) : $signed(reg5[(5'h11):(4'ha)]));
  assign wire12 = wire11;
  assign wire13 = ((8'hb7) < ((($unsigned(reg4) - $unsigned((8'h9c))) ?
                      $unsigned(reg6) : ($unsigned((8'hbd)) != (+wire3))) || ((wire12 || ((8'ha6) | (7'h44))) ?
                      $unsigned(wire1) : (wire3 ?
                          $signed(wire3) : wire3[(3'h7):(3'h7)]))));
  assign wire14 = $signed((reg7[(2'h3):(2'h2)] ?
                      ((&(wire10 || wire10)) >>> $unsigned((reg4 > wire2))) : {reg4,
                          $unsigned($signed(reg6))}));
  assign wire15 = ({$unsigned(wire11),
                      (wire10[(1'h0):(1'h0)] ?
                          (~&$signed(wire0)) : {(reg5 >= reg5),
                              (^wire1)})} <<< $unsigned(wire12[(4'h9):(3'h6)]));
  assign wire16 = wire13;
  assign wire17 = (+(($unsigned($unsigned(wire12)) ~^ wire3) ~^ reg7));
  assign wire18 = (~^{(wire0 ?
                          {(reg7 != reg7),
                              ((7'h44) ?
                                  wire2 : wire16)} : $signed((wire11 < (7'h44)))),
                      wire3});
  assign wire19 = (wire16 & $unsigned(wire11[(4'hf):(1'h1)]));
endmodule
