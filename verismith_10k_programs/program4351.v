module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire46;
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  assign y = {wire48,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire14,
                 wire15,
                 wire46,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned((((wire0[(4'hf):(4'hb)] < $unsigned(wire3)) <= $signed((wire3 << wire1))) | $signed(wire1[(1'h1):(1'h0)])));
  assign wire5 = $signed(wire0[(3'h6):(2'h3)]);
  assign wire6 = {(^$unsigned({(wire3 | wire1), wire1[(2'h3):(1'h1)]})),
                     $signed((~^$unsigned($signed(wire2))))};
  assign wire7 = $signed((~|(|((^~wire5) ? wire5 : (^~wire2)))));
  assign wire8 = wire7;
  assign wire9 = $unsigned(wire5[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg10 <= (8'hae);
      reg11 <= (^wire8[(4'he):(4'ha)]);
      reg12 <= {wire3[(3'h5):(3'h5)],
          $unsigned((wire4 * ($unsigned(wire9) < (8'ha4))))};
      reg13 <= (~&(($signed((!reg11)) ?
              {wire9[(2'h2):(2'h2)], {reg11, wire8}} : (wire5[(2'h2):(2'h2)] ?
                  (&reg11) : wire8)) ?
          (^($signed(wire1) > {wire8})) : wire9[(1'h1):(1'h0)]));
    end
  assign wire14 = reg10;
  assign wire15 = $unsigned((|($signed((reg13 && wire8)) ?
                      $unsigned(wire8[(4'h9):(3'h5)]) : wire3[(1'h1):(1'h0)])));
  module16 #() modinst47 (.clk(clk), .wire20(wire3), .wire18(wire6), .wire17(wire9), .y(wire46), .wire19(reg11));
  assign wire48 = $unsigned((wire1 ^ ({$unsigned(wire6), ((8'hae) > wire4)} ?
                      (|(wire15 * reg10)) : $unsigned(((8'had) ?
                          reg12 : (7'h44))))));
endmodule

module module16
#(parameter param45 = (~|({((&(8'ha7)) <= ((8'h9f) ? (8'ha1) : (7'h43))), (~((7'h44) & (8'ha8)))} > (((!(8'hbf)) ? {(8'hb3)} : ((8'ha4) ? (8'hb4) : (8'hb5))) ? {((8'ha6) & (8'hac))} : (^(|(8'hb2)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  assign y = {wire44, wire43, wire41, wire22, wire21, (1'h0)};
  assign wire21 = wire18;
  assign wire22 = wire18;
  module23 #() modinst42 (.wire25(wire19), .wire24(wire17), .clk(clk), .wire27(wire18), .wire26(wire22), .y(wire41));
  assign wire43 = $unsigned({$signed($unsigned($signed(wire19)))});
  assign wire44 = $signed(wire21);
endmodule

module module23
#(parameter param39 = (&(^~{(((8'hb5) ? (8'hb6) : (8'ha1)) | (|(8'hb8))), ((!(8'ha0)) * ((8'hbc) <= (7'h42)))})), 
parameter param40 = param39)
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire26;
  input wire [(2'h2):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = ((((~wire26) ?
                      ((+(8'hb2)) >> (|wire27)) : {$unsigned(wire24),
                          wire27[(4'h8):(2'h2)]}) * (&$signed(wire26[(2'h2):(1'h0)]))) == $unsigned((^~(7'h43))));
  assign wire29 = $signed(wire24[(1'h0):(1'h0)]);
  assign wire30 = wire29;
  assign wire31 = $signed(($signed(($unsigned((8'h9e)) ?
                      (wire27 ?
                          wire26 : wire30) : wire28[(4'hc):(4'h8)])) <<< $unsigned(wire24)));
  assign wire32 = wire29[(3'h7):(2'h3)];
  assign wire33 = $unsigned(($unsigned(((wire25 && wire24) | (8'hb8))) ^ wire27));
  assign wire34 = (~wire32);
  assign wire35 = wire24;
  assign wire36 = (8'hb6);
  assign wire37 = wire30[(3'h4):(2'h2)];
  assign wire38 = {{{wire28[(4'hc):(3'h7)], wire30},
                          $signed(wire24[(1'h0):(1'h0)])}};
endmodule
