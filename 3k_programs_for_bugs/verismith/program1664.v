module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire72;
  assign y = {wire76, wire75, wire74, wire72, (1'h0)};
  module5 #() modinst73 (.wire8(wire4), .wire9(wire1), .wire7(wire2), .y(wire72), .wire6(wire0), .wire10(wire3), .clk(clk));
  assign wire74 = $unsigned(({wire72, wire0[(3'h4):(1'h0)]} == wire4));
  assign wire75 = (8'ha0);
  assign wire76 = wire75;
endmodule

module module5
#(parameter param71 = {(~^{(&((8'ha1) ? (8'ha3) : (8'hbe))), (((8'h9e) >> (8'hb8)) ? (~(8'hb2)) : (|(8'hb7)))}), (-({{(8'hb3), (7'h43)}, ((8'hb1) ? (8'ha0) : (7'h43))} ? (((8'hbd) - (7'h43)) ? {(8'had)} : ((8'hb5) ? (8'hbf) : (8'hab))) : (((8'ha1) | (8'hac)) && {(8'h9d)})))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire67;
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire35,
                 wire13,
                 wire12,
                 wire11,
                 wire37,
                 wire38,
                 wire39,
                 wire67,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire11 = ({$unsigned($unsigned({wire6, wire7})),
                          {$unsigned((^~wire10)), wire6[(4'ha):(4'h9)]}} ?
                      (-$unsigned((wire7[(4'h8):(3'h5)] ^~ $unsigned((8'hab))))) : ((wire7[(3'h7):(1'h0)] <= ($signed((8'hae)) >= $unsigned(wire8))) <= $unsigned($unsigned((~|wire9)))));
  assign wire12 = $signed($signed(((8'hb7) ?
                      ((8'ha5) ?
                          ((8'hbb) ? wire7 : wire6) : (wire9 ?
                              wire7 : wire8)) : wire6[(2'h3):(1'h0)])));
  assign wire13 = $unsigned($unsigned($signed((8'ha3))));
  always
    @(posedge clk) begin
      reg14 <= ($unsigned((~^$signed(wire12[(4'ha):(3'h5)]))) <= wire8);
      reg15 <= (7'h42);
    end
  module16 #() modinst36 (.wire20(wire9), .wire19(wire10), .y(wire35), .wire18(wire8), .wire17(reg15), .clk(clk));
  assign wire37 = (($unsigned((~wire12)) ?
                          (reg14[(2'h3):(1'h0)] ?
                              wire11 : (&wire7[(3'h6):(2'h2)])) : wire8[(4'he):(2'h3)]) ?
                      (|reg15) : {wire7});
  assign wire38 = (($unsigned(reg14[(3'h7):(3'h5)]) ?
                      wire13 : wire8) - $unsigned(wire8));
  assign wire39 = {((wire10 > {(wire38 >= wire12), $unsigned((8'hbf))}) ?
                          (((wire7 & wire10) >> $unsigned(wire13)) - wire7[(3'h4):(1'h1)]) : $unsigned($unsigned((wire7 - wire9)))),
                      wire7};
  module40 #() modinst68 (.y(wire67), .wire43(wire8), .clk(clk), .wire42(wire39), .wire41(wire11), .wire44(wire7), .wire45(wire12));
  assign wire69 = wire12[(4'hf):(3'h4)];
  assign wire70 = wire8;
endmodule

module module40
#(parameter param66 = ({((~^((8'hb0) ? (8'hb8) : (8'hb5))) ? (((7'h43) && (8'hbb)) <<< ((8'hb7) << (8'hb5))) : (((8'hbf) ? (8'ha3) : (8'ha4)) ^~ (~&(7'h42))))} ? (^((((8'haf) ? (8'h9d) : (8'ha8)) ? ((8'hb7) ? (8'hbc) : (8'ha0)) : (!(8'ha0))) ? (|((8'hbe) ? (7'h42) : (8'h9f))) : (((7'h42) ? (8'hb5) : (8'hb4)) ? ((8'hbf) ? (7'h41) : (8'hb8)) : ((8'hab) & (8'hbb))))) : (8'h9c)))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire [(4'h9):(1'h0)] wire43;
  input wire signed [(5'h11):(1'h0)] wire42;
  input wire [(5'h10):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire46 = (8'ha2);
  assign wire47 = wire42;
  assign wire48 = wire46;
  assign wire49 = (~^((wire44[(3'h4):(1'h1)] | $signed((wire48 >> wire41))) ~^ $unsigned($unsigned((^~wire44)))));
  assign wire50 = ((((wire44 ?
                          (^(8'ha4)) : $unsigned(wire47)) >>> (~|{wire43})) ^~ (^wire45)) ?
                      wire49 : (wire43[(3'h5):(3'h5)] ?
                          {wire46[(4'hd):(3'h5)],
                              wire47[(2'h3):(2'h3)]} : (~(+wire49))));
  assign wire51 = $signed((~|$unsigned(((!(8'hb8)) ~^ (&wire49)))));
  assign wire52 = wire48;
  assign wire53 = ($signed(wire44[(1'h1):(1'h0)]) ~^ $signed($unsigned($unsigned(wire41))));
  assign wire54 = (!(8'hb4));
  assign wire55 = $signed({{wire51[(4'h9):(3'h4)], wire44}});
  assign wire56 = (8'hba);
  always
    @(posedge clk) begin
      reg57 <= wire49[(4'h8):(3'h5)];
      reg58 <= (-{$unsigned(wire52[(1'h1):(1'h1)])});
    end
  assign wire59 = (reg58 ? wire45 : wire42);
  assign wire60 = reg58;
  assign wire61 = wire43[(3'h7):(3'h6)];
  assign wire62 = $signed(wire41[(4'hd):(4'hd)]);
  assign wire63 = (7'h41);
  assign wire64 = ($unsigned((reg58[(2'h2):(1'h1)] <= ($unsigned(wire62) >> wire50))) - $unsigned((+{$unsigned(reg57)})));
  assign wire65 = (wire50 ?
                      $signed(wire61[(1'h1):(1'h1)]) : ((8'hbd) < wire56));
endmodule

module module16
#(parameter param34 = {{{(((8'ha7) <= (8'hb7)) + (~&(8'hb0))), (^~{(8'ha6)})}, (~|{(^~(8'hac))})}, {({((8'haa) <= (8'hb4))} ^ (&((8'hb3) <= (8'ha6))))}})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (($unsigned(($unsigned((8'hb3)) ?
                          (!wire20) : wire17[(1'h0):(1'h0)])) ?
                      ($unsigned((|wire19)) ?
                          {(|wire17),
                              $unsigned(wire19)} : wire17[(4'h8):(1'h0)]) : wire17[(2'h2):(1'h1)]) ~^ wire20);
  assign wire22 = $signed(wire19);
  assign wire23 = (^~wire18);
  assign wire24 = ($unsigned((wire17[(2'h2):(2'h2)] ?
                      ((wire22 ^~ wire22) >= {wire19}) : {$unsigned(wire23)})) && wire22);
  assign wire25 = wire17[(3'h4):(1'h1)];
  assign wire26 = {{$unsigned((&wire21[(3'h4):(3'h4)]))}};
  assign wire27 = wire21;
  assign wire28 = $signed($signed((wire19 <<< (~|(wire21 ? wire22 : wire23)))));
  assign wire29 = ((((wire24[(5'h11):(4'hc)] >>> wire25[(3'h4):(2'h2)]) << {(8'hbb),
                      $unsigned(wire25)}) >>> $signed(wire20[(4'hb):(4'h9)])) > {(&(wire23 <<< (^~wire21))),
                      wire24});
  assign wire30 = $unsigned(((~^wire25) ^ (8'hbf)));
  assign wire31 = $signed($unsigned(wire28));
  assign wire32 = wire25[(3'h5):(2'h2)];
  assign wire33 = $unsigned(wire21[(2'h2):(1'h1)]);
endmodule
