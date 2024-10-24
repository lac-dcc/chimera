module top
#(parameter param42 = {{(8'hb7)}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire40, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($signed(wire0));
  assign wire5 = wire4;
  assign wire6 = $signed((^wire5[(4'h8):(4'h8)]));
  module7 #() modinst41 (.y(wire40), .wire10(wire4), .wire11(wire5), .wire8(wire2), .wire9(wire3), .clk(clk));
endmodule

module module7
#(parameter param38 = {{{(((8'hb5) != (8'ha4)) * ((8'ha5) ? (8'h9e) : (8'hbd)))}, ((((8'h9d) << (8'ha2)) ? ((8'ha5) == (7'h41)) : ((7'h44) != (8'hb1))) == (&(^(8'hb8))))}}, 
parameter param39 = (~|({(8'ha9), {(~|param38)}} ^~ ((8'hb1) ? {(param38 >= param38)} : {((8'h9c) ? param38 : param38)}))))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire12,
                 wire27,
                 reg31,
                 (1'h0)};
  assign wire12 = {$unsigned($signed((&$unsigned(wire10)))),
                      ($signed($signed(wire11)) | (wire10[(1'h1):(1'h1)] ?
                          $unsigned($signed(wire10)) : wire9))};
  module13 #() modinst28 (.wire16(wire9), .wire17(wire11), .wire15(wire8), .wire14(wire10), .clk(clk), .y(wire27), .wire18(wire12));
  assign wire29 = {{$signed((&(wire8 ? (8'hb7) : wire10)))}};
  assign wire30 = (7'h44);
  always
    @(posedge clk) begin
      reg31 <= $signed(((!(^~(wire8 ? wire12 : wire8))) ?
          $unsigned($unsigned((^~(8'haa)))) : ($unsigned((&wire8)) ?
              $unsigned(((7'h42) ? (8'ha5) : wire30)) : $unsigned(wire9))));
    end
  assign wire32 = $signed((8'hbd));
  assign wire33 = wire10;
  assign wire34 = (~$signed({$unsigned(wire27)}));
  assign wire35 = wire11;
  assign wire36 = $signed((~wire11));
  assign wire37 = reg31[(4'ha):(1'h0)];
endmodule

module module13
#(parameter param25 = (8'haf), 
parameter param26 = param25)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = (wire14 ?
                      (wire18[(4'hc):(2'h3)] & $signed(wire18[(4'h8):(3'h4)])) : wire18[(2'h2):(1'h0)]);
  assign wire20 = (((((~wire19) <= (wire16 ? wire19 : wire17)) ?
                              ((8'ha3) <= (+(8'ha8))) : (wire16[(3'h5):(1'h0)] && (wire14 != wire17))) ?
                          {(+{wire19}),
                              $unsigned(wire14)} : {$signed((!wire17)),
                              (~wire19[(3'h4):(2'h2)])}) ?
                      wire15[(2'h2):(1'h0)] : wire15);
  assign wire21 = ($signed((&(~wire20[(3'h5):(3'h5)]))) ^~ ($unsigned((|wire19[(1'h0):(1'h0)])) >= ($signed((wire16 || wire20)) > $signed((wire16 ?
                      (8'hb6) : wire14)))));
  assign wire22 = wire16[(4'h8):(3'h7)];
  assign wire23 = wire15[(4'ha):(1'h1)];
  assign wire24 = (~|$unsigned(wire14));
endmodule
