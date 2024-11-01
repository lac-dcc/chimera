module top
#(parameter param84 = (~(!(~&{{(8'hbe)}, ((8'ha5) ^ (8'hb3))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire63,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire5 = $unsigned(wire3);
  assign wire6 = (~(8'hb1));
  assign wire7 = wire5[(3'h5):(3'h4)];
  assign wire8 = ((wire6[(2'h3):(1'h0)] > $unsigned($signed((wire5 << wire0)))) ^~ ((8'ha1) >>> wire4[(3'h6):(2'h3)]));
  assign wire9 = {(wire8[(2'h3):(1'h0)] >> wire5[(4'hf):(4'hf)])};
  assign wire10 = (($unsigned($signed(wire5)) ?
                      (~|(~^wire3)) : (+((wire3 << wire7) ?
                          $unsigned(wire6) : $unsigned(wire2)))) == wire0[(3'h6):(2'h3)]);
  module11 #() modinst53 (.wire15(wire5), .wire13(wire6), .y(wire52), .wire14(wire1), .clk(clk), .wire12(wire2));
  assign wire54 = $signed((7'h41));
  assign wire55 = (wire4[(3'h4):(1'h0)] ~^ (|$unsigned(((wire4 ?
                      wire54 : wire6) + wire1[(4'ha):(3'h4)]))));
  assign wire56 = ((wire6 >= $unsigned(((7'h42) ? wire10 : wire55))) ?
                      ($signed($signed((~&(8'hb8)))) <<< $signed(wire4)) : (+wire54));
  assign wire57 = $unsigned({$unsigned(((wire8 << wire1) || wire54[(2'h2):(2'h2)]))});
  always
    @(posedge clk) begin
      if (({(8'h9f)} ^~ (~(~&(|(!wire5))))))
        begin
          reg58 <= ($unsigned(wire3) <= (wire8 ?
              (&$unsigned(wire52)) : (wire54[(4'hf):(3'h6)] ?
                  wire8 : wire55[(1'h1):(1'h0)])));
          reg59 <= $unsigned($unsigned($unsigned($unsigned((~|(8'ha5))))));
        end
      else
        begin
          if ($signed(((8'h9c) && wire52)))
            begin
              reg58 <= $signed((&($unsigned($unsigned(wire9)) || wire57[(4'h8):(3'h4)])));
              reg59 <= reg59;
              reg60 <= ($signed({wire8}) > (^~(^$unsigned(wire6))));
              reg61 <= ((-$unsigned($signed({wire3}))) ?
                  (^$unsigned(wire1)) : {(8'hbb),
                      (((8'hac) > (~|wire9)) + $signed(wire6[(3'h4):(1'h1)]))});
              reg62 <= reg58[(4'h8):(3'h4)];
            end
          else
            begin
              reg58 <= $signed($unsigned((~reg58)));
              reg59 <= {$unsigned(wire4[(4'ha):(3'h4)])};
              reg60 <= $signed((($unsigned(wire10) ~^ $signed($unsigned(reg61))) && {wire4[(4'ha):(3'h4)]}));
              reg61 <= $signed((~wire56[(4'hb):(3'h7)]));
            end
        end
    end
  assign wire63 = wire8;
  module64 #() modinst79 (.wire68(wire6), .wire65(wire56), .wire67(wire10), .y(wire78), .wire66(reg62), .wire69(wire9), .clk(clk));
  assign wire80 = $unsigned(((((wire78 + wire1) > $unsigned(wire54)) == wire54[(1'h0):(1'h0)]) & (~^(wire4 ?
                      ((8'ha6) ? (8'hba) : wire55) : {reg58}))));
  assign wire81 = reg60;
  assign wire82 = (+wire56);
  assign wire83 = wire63[(4'h8):(3'h4)];
endmodule

module module64
#(parameter param76 = ({(~(^((8'hb1) || (8'haa)))), (7'h42)} >= {(((8'haf) ? (8'hb1) : (7'h42)) ? ({(7'h40), (7'h44)} ? (~&(8'hb0)) : (^(8'hb8))) : (((8'hac) ? (8'hb7) : (8'hb1)) ? (^~(8'h9c)) : ((8'h9d) | (8'ha0))))}), 
parameter param77 = (8'hb7))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire69;
  input wire signed [(5'h14):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire66;
  input wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  assign y = {wire75, wire74, wire73, wire72, wire71, wire70, (1'h0)};
  assign wire70 = wire69[(3'h5):(3'h5)];
  assign wire71 = {(~^((wire69[(1'h0):(1'h0)] || $unsigned(wire65)) ?
                          wire69[(4'hd):(3'h6)] : (~|((8'ha4) << wire69))))};
  assign wire72 = wire68[(4'h9):(3'h7)];
  assign wire73 = {wire72, wire71[(2'h2):(2'h2)]};
  assign wire74 = ((!wire71[(4'h8):(1'h1)]) > $signed(wire67));
  assign wire75 = wire73;
endmodule

module module11
#(parameter param50 = (((8'hb9) ? {(((8'hbf) << (8'ha5)) ? ((8'hbf) ? (8'ha0) : (8'ha4)) : (!(7'h44))), ({(8'hb9)} ^~ (^(8'hbd)))} : (~{((8'ha8) ? (8'hb7) : (8'hb8))})) ? {(~&((~(8'ha7)) == ((8'hb4) ? (8'haa) : (8'h9d))))} : (((&((8'hb6) == (8'haa))) ? (~^(8'hb9)) : ((~&(8'hbb)) ? ((8'hb1) ? (8'ha8) : (8'haa)) : {(8'had), (8'hba)})) ? {(~(8'hbe))} : {(+((7'h40) ? (8'ha6) : (8'ha6))), {(-(7'h42))}})), 
parameter param51 = (~|((((^~param50) ? (param50 < param50) : param50) << (|(param50 ? param50 : param50))) >>> (((param50 ? param50 : param50) ? (param50 ^~ param50) : (8'hac)) << ((7'h44) > {param50})))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire16;
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
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
                 wire39,
                 wire38,
                 wire37,
                 wire32,
                 wire30,
                 wire16,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire16 = ((&{((~|wire14) && $unsigned(wire13))}) ?
                      ($unsigned({wire13}) << $signed((wire15 ?
                          wire14 : {wire13,
                              wire13}))) : ($unsigned($signed((wire15 ?
                          (8'ha3) : wire14))) <= $unsigned(wire14)));
  module17 #() modinst31 (wire30, clk, wire16, wire12, wire13, wire15);
  assign wire32 = wire14;
  always
    @(posedge clk) begin
      reg33 <= (|$signed($unsigned(wire12)));
      reg34 <= wire32;
      reg35 <= $unsigned((+$signed(($unsigned(wire13) ?
          wire16 : (wire16 ^~ wire30)))));
      reg36 <= wire12[(4'ha):(4'h9)];
    end
  assign wire37 = wire30;
  assign wire38 = $signed($signed($unsigned({wire13, (~&wire13)})));
  assign wire39 = ($unsigned((((^~(8'hb9)) ? (7'h44) : {wire12, wire15}) ?
                          (((8'had) < wire32) != (^~reg33)) : $signed((wire30 ?
                              wire14 : wire15)))) ?
                      (wire30 ?
                          $unsigned((|$unsigned((7'h40)))) : ($unsigned((wire12 ?
                                  wire37 : wire13)) ?
                              ((wire38 >> wire30) >> ((8'hbf) * (8'hb1))) : wire12[(1'h1):(1'h0)])) : wire14[(4'hb):(1'h0)]);
  assign wire40 = (((~{((8'ha6) ? wire39 : wire39),
                      wire38[(4'h8):(3'h4)]}) >> wire38[(4'h9):(3'h5)]) * (reg33 ?
                      (~&$signed(wire30[(3'h6):(3'h5)])) : $signed((wire37[(2'h2):(1'h1)] ?
                          $unsigned(wire32) : $signed(wire14)))));
  assign wire41 = (^($unsigned(wire38[(4'hd):(4'hb)]) || reg34[(2'h3):(2'h3)]));
  assign wire42 = $unsigned({$unsigned($signed(wire16[(4'h9):(2'h2)])),
                      {reg36[(1'h0):(1'h0)],
                          ($signed((8'hb2)) ? $signed((8'hb9)) : (~|wire32))}});
  assign wire43 = reg33[(4'ha):(1'h0)];
  assign wire44 = (~|wire39);
  assign wire45 = (wire12 == $unsigned(wire13[(3'h6):(3'h4)]));
  assign wire46 = wire15;
  assign wire47 = wire45[(5'h10):(3'h6)];
  assign wire48 = $signed(wire47);
  assign wire49 = ($unsigned((~&wire30)) <<< ((((+wire38) - wire37) * wire15) ?
                      $unsigned(($unsigned(wire46) < wire46)) : (((reg35 ?
                              wire38 : wire16) ^ wire14[(3'h7):(3'h6)]) ?
                          reg35 : {((8'h9e) ? (8'hbe) : wire32),
                              (reg34 ~^ wire45)})));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = wire18;
  assign wire23 = {($signed(wire19) < $signed((wire21 - (wire21 ?
                          wire18 : wire20))))};
  assign wire24 = (wire18[(2'h3):(2'h2)] * (($unsigned(wire22[(3'h6):(1'h1)]) - (8'hac)) - (8'hb8)));
  assign wire25 = $signed(($signed({wire21}) <= wire24[(2'h3):(2'h3)]));
  assign wire26 = (+$signed($signed(($signed(wire23) ~^ wire19[(2'h2):(1'h1)]))));
  assign wire27 = $signed(wire25[(4'hc):(3'h7)]);
  assign wire28 = $signed({{(~^$signed(wire21)),
                          $unsigned(wire25[(4'h8):(2'h3)])},
                      $unsigned({(~|(8'hbf))})});
  assign wire29 = wire23;
endmodule
