module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire45;
  assign y = {wire48, wire47, wire4, wire45, (1'h0)};
  assign wire4 = $signed((&(~|$unsigned($unsigned(wire1)))));
  module5 #() modinst46 (.wire8(wire4), .wire10(wire0), .clk(clk), .wire6(wire3), .y(wire45), .wire9(wire2), .wire7(wire1));
  assign wire47 = (wire1 != ((!wire45[(3'h5):(3'h5)]) || wire0));
  assign wire48 = wire47[(1'h0):(1'h0)];
endmodule

module module5
#(parameter param44 = ((((((7'h41) > (8'hba)) >= (-(8'hbd))) ? (~|(^(7'h42))) : {(|(8'hbf))}) >>> ((((8'hac) + (8'hb0)) + (|(8'had))) ? (+{(8'ha4)}) : (((8'ha6) ? (8'ha2) : (8'h9e)) ? ((8'hb8) < (8'hae)) : (~^(8'ha3))))) ? (-((|(~(8'hae))) ? (((8'hab) ? (8'hbf) : (8'hac)) ? ((8'hb8) + (7'h43)) : (~(8'ha3))) : (((8'hbe) >> (8'hb9)) ? {(8'hbd)} : ((8'hb3) & (8'hb7))))) : (({(~|(8'hba))} ? {((8'h9e) ? (8'hae) : (8'hbe)), ((8'ha3) ? (8'h9f) : (8'ha4))} : (((8'hb3) ? (8'hb0) : (8'had)) ^ ((8'hb8) < (8'ha1)))) == ((((8'hab) == (8'hb8)) - (|(8'hb4))) * (-(|(8'hbb)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire34;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 (1'h0)};
  module11 #() modinst35 (.y(wire34), .wire15(wire6), .clk(clk), .wire13(wire7), .wire16(wire10), .wire12(wire9), .wire14(wire8));
  assign wire36 = (~^(((wire8 != (~^wire8)) ? wire7[(4'h8):(3'h4)] : wire7) ?
                      $unsigned((~^(wire9 ?
                          wire6 : wire34))) : ($unsigned($signed(wire7)) && wire10)));
  assign wire37 = {wire9[(2'h3):(1'h0)],
                      $signed(($signed((wire34 ? wire6 : wire34)) ?
                          {(wire7 ? wire6 : wire34)} : $unsigned((wire8 ?
                              wire7 : wire7))))};
  assign wire38 = $unsigned((({{wire10, wire36}} ?
                      ((8'h9f) >= $signed(wire34)) : wire7[(3'h7):(3'h6)]) - (({wire37} ?
                          $signed(wire34) : $signed(wire10)) ?
                      (wire7 > wire10[(4'hc):(1'h1)]) : $unsigned((^~wire9)))));
  assign wire39 = (^(wire7[(3'h4):(2'h2)] ?
                      $signed($signed((wire36 && wire37))) : {(~^wire6[(3'h6):(3'h4)])}));
  assign wire40 = $unsigned($signed((~|$unsigned((wire10 ? wire38 : wire36)))));
  assign wire41 = ($signed(wire40[(1'h1):(1'h1)]) | wire36);
  assign wire42 = (wire37 ? wire8 : wire41[(2'h2):(2'h2)]);
  assign wire43 = (($unsigned($signed($signed(wire40))) * $unsigned(wire34)) + wire37[(3'h7):(3'h6)]);
endmodule

module module11
#(parameter param33 = (~^(~&(({(8'hb9), (8'hae)} ? (&(8'haa)) : (~|(8'hb1))) ? (((8'h9c) ? (8'h9d) : (8'hbe)) <<< (-(8'h9f))) : (((8'ha1) && (8'hbb)) ? {(8'hb6)} : (~(8'hae)))))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire17 = wire14[(4'ha):(1'h0)];
  assign wire18 = (($unsigned((|wire15[(3'h6):(3'h4)])) ^~ wire12[(3'h7):(2'h2)]) ^ $unsigned(wire13));
  assign wire19 = (wire12 == (8'ha7));
  assign wire20 = ((-wire18[(1'h1):(1'h1)]) ?
                      {$signed(((wire18 ^ wire18) ?
                              wire13[(3'h7):(3'h7)] : (~|(7'h43))))} : wire12[(4'hc):(2'h3)]);
  assign wire21 = wire12[(4'ha):(3'h7)];
  assign wire22 = ((&(8'ha8)) <= wire19[(3'h6):(3'h4)]);
  assign wire23 = $unsigned(((({wire14} ?
                          wire16 : $unsigned(wire15)) == (wire13 ?
                          (wire15 ? (7'h40) : wire15) : (wire14 && (7'h43)))) ?
                      ($signed((wire12 <= wire13)) - (wire12[(3'h5):(3'h5)] ?
                          wire22 : $unsigned(wire13))) : $signed((|$unsigned(wire17)))));
  assign wire24 = $signed(wire15);
  assign wire25 = ((^~wire16[(3'h4):(2'h2)]) >= wire18[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg26 <= wire19;
      reg27 <= $unsigned($signed((wire14[(4'hc):(2'h3)] && ((+wire15) ?
          (wire21 << (8'hbc)) : $signed(wire21)))));
    end
  assign wire28 = (wire18[(3'h5):(1'h1)] || $unsigned($signed($signed($unsigned((8'hb7))))));
  assign wire29 = (wire23[(2'h3):(1'h0)] >>> (|(8'ha1)));
  assign wire30 = (8'ha5);
  assign wire31 = (wire14 ?
                      $unsigned((~wire22[(3'h4):(1'h1)])) : {{($unsigned(wire22) ?
                                  wire29[(4'hc):(1'h1)] : wire30[(4'hf):(4'h9)]),
                              wire17[(2'h3):(2'h2)]},
                          (wire19[(3'h5):(3'h4)] ?
                              ({wire25} ?
                                  (wire18 ?
                                      wire25 : (8'ha2)) : wire14[(4'ha):(3'h6)]) : ($unsigned(wire14) << $signed(wire24)))});
  assign wire32 = wire12;
endmodule
