module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire41;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, wire41, (1'h0)};
  module4 #() modinst42 (wire41, clk, wire2, wire0, wire1, wire3, (8'ha3));
  assign wire43 = wire2[(3'h4):(1'h1)];
  assign wire44 = wire0[(3'h5):(3'h5)];
  assign wire45 = wire44[(3'h6):(2'h3)];
  assign wire46 = wire45;
  assign wire47 = {(7'h44),
                      $signed((($signed(wire1) <<< $unsigned(wire41)) ?
                          ((|wire0) ? $signed(wire43) : wire41) : ({wire44} ?
                              $unsigned((8'haf)) : $unsigned((8'ha8)))))};
  assign wire48 = wire41[(3'h5):(2'h3)];
endmodule

module module4
#(parameter param39 = ((&(~{((8'ha8) > (8'had)), ((7'h41) ? (8'ha4) : (8'hab))})) ? (((8'hbb) ? {((8'hbb) >= (8'ha8)), (|(8'hb3))} : (^~(|(7'h40)))) ? {(((8'hb4) || (8'ha9)) + (~&(7'h43))), ({(8'haf)} ? (~^(8'hb7)) : {(7'h41), (8'ha7)})} : {(((7'h43) == (8'ha4)) << ((8'hb4) * (8'hbe))), (((7'h44) ? (8'hbe) : (8'hb6)) ? {(8'h9e)} : (^(8'hb0)))}) : ((~(~{(7'h40)})) ? {(-((8'ha5) < (8'hac))), ({(8'hb9)} ? (~&(8'hbc)) : (7'h40))} : ({((8'ha6) != (8'had)), ((7'h40) | (8'hb7))} | (8'hbe)))), 
parameter param40 = {((((param39 ? param39 : param39) ? {param39, param39} : (param39 ? param39 : (8'hb4))) ^ (|(param39 * param39))) <<< param39)})
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire5;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire35;
  assign y = {wire38, wire37, wire10, wire35, (1'h0)};
  assign wire10 = wire7;
  module11 #() modinst36 (.wire13(wire9), .wire15(wire8), .y(wire35), .clk(clk), .wire14(wire7), .wire12(wire10), .wire16(wire6));
  assign wire37 = wire6;
  assign wire38 = $unsigned(wire5);
endmodule

module module11
#(parameter param33 = ({(~(+((8'hbb) ? (8'ha3) : (8'hbc))))} + (^~{(((8'ha6) ? (8'haa) : (8'ha8)) ~^ ((7'h41) ? (8'hb6) : (8'hbb))), (((8'ha7) < (7'h43)) > ((8'hb0) << (7'h43)))})), 
parameter param34 = (((8'hab) ? (((param33 * (8'ha5)) >>> (^~param33)) ^ (-(|param33))) : ({{param33}} << (+(param33 && param33)))) - (param33 - ((^~param33) ? {(param33 && param33), (param33 ? (8'haf) : (8'hb6))} : (&(-param33))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire21,
                 wire20,
                 wire18,
                 wire17,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg19,
                 (1'h0)};
  assign wire17 = (~$unsigned(($unsigned((~^wire15)) ?
                      wire14 : (~|(-wire16)))));
  assign wire18 = $signed({(^wire12), $signed($signed($unsigned((7'h41))))});
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire17);
    end
  assign wire20 = (-(reg19[(3'h5):(2'h2)] ?
                      $signed((wire13 != $unsigned(wire18))) : ((~^(8'hac)) > $signed((~&wire13)))));
  assign wire21 = wire13[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg22 <= (($unsigned(wire12) ?
          ({wire17,
              wire17} ^ $unsigned($signed(wire18))) : wire18[(1'h0):(1'h0)]) & reg19[(1'h1):(1'h1)]);
      reg23 <= {(wire12[(1'h1):(1'h1)] ^ $unsigned((~wire12[(3'h5):(3'h5)])))};
      reg24 <= ($unsigned($unsigned(wire21[(1'h1):(1'h0)])) ?
          $signed(wire16) : wire12);
      reg25 <= $signed(wire20[(1'h0):(1'h0)]);
      if ((|{wire14, wire12}))
        begin
          reg26 <= (~|(+(^{reg19[(2'h3):(2'h3)]})));
        end
      else
        begin
          reg26 <= wire21;
          reg27 <= {(&{(wire16[(4'hb):(2'h2)] ?
                      $unsigned(wire14) : $unsigned(wire17)),
                  ((~(8'hac)) ?
                      (wire16 ? reg26 : (8'ha7)) : (wire18 >> reg23))})};
        end
    end
  assign wire28 = $unsigned((~(wire14 ?
                      (wire12 <<< $unsigned(reg24)) : (wire16 <<< reg23))));
  assign wire29 = (!$signed(reg19));
  assign wire30 = (($signed($unsigned(wire29)) ?
                      $signed(($signed((8'hb0)) >= {wire17})) : $signed(wire16[(3'h7):(2'h2)])) >> (reg24 && $unsigned($signed((~|reg23)))));
  assign wire31 = (reg19 ?
                      $signed(wire17[(4'h9):(3'h4)]) : reg19[(1'h0):(1'h0)]);
  assign wire32 = wire15;
endmodule
