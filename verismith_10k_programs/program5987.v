module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire24;
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire6, wire9, wire10, wire24, reg4, reg5, reg7, reg8, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed(($unsigned((8'ha3)) << $signed($signed(wire0)))) + $unsigned($unsigned($signed(wire2[(4'hb):(2'h3)]))));
      reg5 <= (($unsigned($unsigned((^reg4))) ?
          ($unsigned(wire2) ?
              ($signed(wire0) >>> $signed((7'h40))) : $unsigned((&wire2))) : {{(wire0 >= wire1)}}) | $unsigned(reg4[(1'h0):(1'h0)]));
    end
  assign wire6 = (($signed({reg5}) ? reg5 : reg4) < (^(wire0 <<< wire1)));
  always
    @(posedge clk) begin
      reg7 <= $signed(wire6[(4'h9):(1'h1)]);
      reg8 <= wire6;
    end
  assign wire9 = wire6;
  assign wire10 = (~|$signed($unsigned(wire9[(3'h6):(3'h4)])));
  module11 #() modinst25 (.wire13(reg5), .wire12(wire2), .wire15(reg4), .wire14(reg8), .clk(clk), .y(wire24));
endmodule

module module11
#(parameter param23 = ((((!((8'hb8) <= (7'h42))) ? (~&((8'hb0) ? (8'hb9) : (8'hbe))) : {((8'ha8) ? (8'hb0) : (8'hbb))}) ? ((((8'h9c) ? (8'h9d) : (7'h40)) ? ((8'hba) ? (7'h40) : (8'hb4)) : (^(8'hb4))) ^ {{(8'hae)}}) : ((((8'hb2) * (8'hae)) >= ((8'h9d) ? (8'had) : (8'ha2))) ? (((8'ha4) ? (8'hbe) : (8'haa)) ? {(8'hb7), (8'ha3)} : ((8'h9e) ^ (8'hbc))) : (8'hb9))) < (((|((8'h9e) | (8'ha4))) ? (((7'h43) == (8'hb1)) ^~ (^(8'hb0))) : ((~&(8'hbb)) <<< (^(8'hbd)))) | ({((8'ha6) <= (8'hb4))} ? (8'hae) : (8'ha8)))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  assign y = {wire22, wire21, wire19, wire18, wire17, wire16, reg20, (1'h0)};
  assign wire16 = ((-wire15[(2'h3):(1'h0)]) >>> wire13);
  assign wire17 = (wire12[(3'h5):(2'h3)] ^ {(~|$signed((8'hbd))),
                      $signed(wire15[(1'h1):(1'h0)])});
  assign wire18 = wire13[(4'hb):(3'h5)];
  assign wire19 = $unsigned(((^~wire14) * $signed(wire16)));
  always
    @(posedge clk) begin
      reg20 <= $unsigned((^(~&(^$signed(wire17)))));
    end
  assign wire21 = $signed($signed(wire18[(5'h12):(4'ha)]));
  assign wire22 = (wire15 ?
                      ((8'ha3) | $signed((!wire19))) : $unsigned({($unsigned(wire21) ?
                              (wire16 ^ (7'h42)) : (wire13 << reg20)),
                          {(reg20 - wire16), (wire21 ? wire14 : wire13)}}));
endmodule
