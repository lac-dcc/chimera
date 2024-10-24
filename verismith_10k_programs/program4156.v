module top
#(parameter param52 = {(8'hb2)})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire50;
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire20,
                 wire22,
                 wire23,
                 wire24,
                 wire32,
                 wire33,
                 wire34,
                 wire50,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire5 = $unsigned((wire3[(3'h7):(3'h5)] ?
                     wire2[(3'h5):(1'h1)] : $unsigned(wire2[(2'h2):(2'h2)])));
  assign wire6 = wire4[(4'hc):(3'h5)];
  assign wire7 = $signed(wire6);
  assign wire8 = ($signed($unsigned((wire2[(3'h5):(1'h0)] ^~ (+wire6)))) >>> ($unsigned((wire0[(2'h3):(1'h1)] ?
                     $signed(wire2) : (wire2 ?
                         wire1 : (8'hb7)))) ^~ (wire6[(2'h3):(1'h0)] > wire2)));
  module9 #() modinst21 (wire20, clk, wire0, wire6, wire1, wire5);
  assign wire22 = ($signed(wire0[(3'h5):(3'h4)]) ?
                      ((wire1[(3'h5):(2'h3)] ?
                          wire8[(1'h0):(1'h0)] : ((wire0 ? wire8 : (7'h41)) ?
                              $signed(wire5) : $unsigned(wire5))) <= ($unsigned($signed(wire20)) >> $signed(wire5[(2'h2):(1'h1)]))) : (|(({(7'h43)} - $unsigned(wire7)) ?
                          $signed($signed(wire8)) : ($unsigned(wire3) == wire8[(2'h2):(1'h1)]))));
  assign wire23 = wire8;
  assign wire24 = (^~wire2);
  always
    @(posedge clk) begin
      reg25 <= wire8;
      reg26 <= wire20;
      if ((~&$unsigned($unsigned($unsigned((wire7 ? wire1 : wire3))))))
        begin
          if (wire3[(4'ha):(4'h9)])
            begin
              reg27 <= wire1[(4'hf):(3'h7)];
              reg28 <= (8'hb5);
            end
          else
            begin
              reg27 <= (($unsigned(((wire2 ?
                      wire5 : wire4) >>> (reg27 != wire0))) ?
                  $unsigned((wire3[(1'h0):(1'h0)] ?
                      {wire5,
                          reg27} : reg28)) : $unsigned((-reg28[(5'h11):(4'hd)]))) > (wire8 ?
                  ($signed((wire24 < wire23)) ?
                      $signed($unsigned(reg27)) : wire24[(4'h8):(4'h8)]) : (((wire2 ?
                          wire22 : wire24) ~^ ((8'h9c) >= wire4)) ?
                      (wire6[(3'h5):(1'h0)] != (wire23 >>> (8'ha6))) : $signed((wire23 < wire4)))));
              reg28 <= $signed((reg28[(4'h8):(1'h0)] & ({$unsigned(wire20),
                      {wire6}} ?
                  wire2 : $unsigned((wire5 ? wire6 : (8'haa))))));
              reg29 <= $signed($unsigned((&(|$unsigned(wire23)))));
            end
        end
      else
        begin
          reg27 <= $signed(wire23[(4'h8):(1'h1)]);
          reg28 <= $unsigned(reg26[(4'hb):(2'h3)]);
          reg29 <= $unsigned($unsigned($signed($unsigned(wire22))));
          reg30 <= $unsigned((&$unsigned(wire7[(3'h7):(1'h1)])));
          reg31 <= (~^{((8'ha6) >= wire1)});
        end
    end
  assign wire32 = wire6;
  assign wire33 = $signed((((!$signed(wire3)) ?
                          wire0 : $unsigned(reg25[(3'h4):(2'h2)])) ?
                      ($unsigned((reg30 < wire3)) ?
                          $signed((^~wire1)) : $unsigned(wire22)) : $unsigned($signed((wire23 ?
                          (8'hb3) : wire24)))));
  assign wire34 = ($unsigned(reg26[(4'hc):(3'h4)]) != $unsigned((!(~&reg28[(3'h7):(3'h7)]))));
  module35 #() modinst51 (.wire39(reg26), .clk(clk), .wire36(reg30), .y(wire50), .wire37(reg27), .wire38(wire23));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire39;
  input wire [(4'ha):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 (1'h0)};
  assign wire40 = wire37;
  assign wire41 = (~&(+((wire37[(3'h6):(1'h1)] ?
                      wire40[(3'h6):(3'h5)] : (+(7'h43))) + $signed(wire37[(3'h4):(2'h2)]))));
  assign wire42 = ($unsigned((wire37 | ((wire40 ? wire36 : wire39) ?
                          wire39[(4'hf):(4'hc)] : $unsigned(wire36)))) ?
                      $signed($signed(({wire38,
                          wire40} * (wire40 * wire38)))) : ((&wire40) & (!{wire40[(1'h1):(1'h1)]})));
  assign wire43 = ($unsigned((8'hbf)) ?
                      (~&$signed((wire39 ?
                          (wire39 >> wire37) : (wire37 >>> wire41)))) : $unsigned(wire38[(1'h0):(1'h0)]));
  assign wire44 = (+wire39[(4'h8):(2'h2)]);
  assign wire45 = ((((-wire37) ?
                          $unsigned(((7'h44) || wire43)) : ($unsigned(wire40) & (wire39 > wire42))) < wire43) ?
                      wire39[(3'h6):(3'h5)] : (wire43 | (wire39[(4'h8):(4'h8)] ?
                          ((wire42 == (8'hb3)) ~^ wire44) : {wire44[(3'h6):(2'h2)],
                              wire42})));
  assign wire46 = (wire42 ?
                      wire36[(4'h9):(4'h9)] : ({((wire42 >> (7'h40)) != wire41[(3'h5):(3'h5)]),
                          $unsigned(wire43[(2'h3):(2'h2)])} | wire43));
  assign wire47 = ((wire42[(4'hf):(4'h8)] ?
                      {(!((8'hac) >>> (8'hbd)))} : wire39[(3'h5):(2'h2)]) + ($signed(({wire39} ?
                      $unsigned((8'hb5)) : $unsigned(wire41))) > (^~(-(~^wire43)))));
  assign wire48 = (((+(8'ha6)) >> $signed($unsigned(wire45[(2'h2):(1'h0)]))) << $unsigned((wire46[(4'h9):(4'h9)] ?
                      $signed($signed(wire47)) : $unsigned(((8'hb4) ^~ wire46)))));
  assign wire49 = $unsigned((((wire45[(3'h7):(2'h3)] - wire45[(4'h8):(2'h2)]) ?
                          $unsigned($signed(wire47)) : wire37) ?
                      $signed(wire37) : (8'hab)));
endmodule

module module9
#(parameter param19 = {((((~|(8'ha8)) ? ((7'h41) ? (8'hac) : (7'h41)) : ((7'h44) ? (8'ha6) : (7'h40))) ? (((8'ha2) ? (8'ha3) : (8'hb5)) ^ {(8'had)}) : (((8'hbc) ? (8'hb8) : (8'ha4)) - (^~(8'hbd)))) ^~ (&({(8'hbf)} > ((7'h44) ? (8'hb8) : (8'hae)))))})
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  assign y = {wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = (wire13[(1'h1):(1'h0)] ? wire11 : wire10);
  assign wire15 = wire11[(1'h0):(1'h0)];
  assign wire16 = ($unsigned((!{(8'ha7), $unsigned(wire14)})) ?
                      $unsigned(((|{(8'ha3), wire10}) >= ((wire13 ?
                          wire10 : wire13) - wire10))) : (8'hb4));
  assign wire17 = wire11;
  assign wire18 = wire17;
endmodule
