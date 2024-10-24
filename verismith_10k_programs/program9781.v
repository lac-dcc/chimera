module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  assign y = {wire70, wire69, wire68, wire66, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(wire0);
  assign wire6 = $signed($signed((({wire1} ? wire5 : (8'ha8)) ?
                     $signed(wire5) : {$signed(wire0), wire1[(2'h2):(2'h2)]})));
  assign wire7 = wire0[(4'hd):(3'h7)];
  module8 #() modinst67 (.wire11(wire6), .wire9(wire2), .clk(clk), .wire10(wire5), .wire12(wire1), .y(wire66));
  assign wire68 = (~&((~^wire5) & ({(wire66 ? wire5 : wire5)} ?
                      wire2[(2'h2):(2'h2)] : wire4)));
  assign wire69 = wire7[(1'h0):(1'h0)];
  assign wire70 = {(~&(wire6[(4'he):(4'hc)] >> (wire66 ?
                          wire4 : (wire7 << wire2))))};
endmodule

module module8
#(parameter param64 = ((((!((7'h42) ? (8'ha8) : (8'hae))) ? ((~&(8'hbc)) ? (~&(8'ha3)) : ((7'h43) != (8'h9d))) : (((8'hbb) || (8'hb1)) < ((8'h9e) ? (8'ha0) : (8'hb1)))) ? (~|(((8'hba) >>> (8'h9c)) < ((8'hb7) & (8'hac)))) : (((~|(8'hb8)) - ((8'hb2) ? (8'hb8) : (8'h9c))) >>> (8'hb4))) <= ({(~((8'ha6) ^ (8'hbb))), (((8'hbe) ? (8'h9f) : (8'had)) ? ((8'hb7) ? (8'hb4) : (8'ha3)) : ((8'hb6) ? (8'hab) : (7'h44)))} ? {{((8'hbc) ? (8'hbb) : (8'h9f))}, (((8'h9f) <= (8'hbd)) && (^(8'ha2)))} : {(((8'h9f) != (8'haf)) ? ((8'ha1) ? (8'haf) : (8'ha2)) : ((7'h42) ? (8'hae) : (8'hbe)))})), 
parameter param65 = (&((({param64} == (param64 ~^ param64)) || (7'h44)) ? ((+(param64 ~^ param64)) ? ({param64} ? (param64 || param64) : ((8'hab) ? param64 : param64)) : ((param64 >= param64) ? (param64 ? param64 : param64) : ((8'haa) ? param64 : param64))) : ((~param64) < ((param64 * param64) ? (param64 >>> param64) : param64)))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire36,
                 wire35,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire13 = wire11[(1'h0):(1'h0)];
  assign wire14 = ($signed(wire10[(1'h1):(1'h0)]) || (|wire13));
  assign wire15 = (wire11 ?
                      {wire14[(1'h0):(1'h0)],
                          wire11} : ((+wire10[(4'hd):(4'hd)]) <= wire9[(2'h2):(2'h2)]));
  assign wire16 = (8'ha7);
  assign wire17 = wire13;
  assign wire18 = wire17[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg19 <= $unsigned($unsigned(({(~^wire15),
          {wire14}} == (!(wire18 >= wire10)))));
      reg20 <= $signed(wire17[(1'h1):(1'h0)]);
      reg21 <= wire18[(1'h0):(1'h0)];
      reg22 <= $unsigned($signed($unsigned(wire17[(3'h5):(3'h4)])));
      reg23 <= wire11[(5'h11):(4'hc)];
    end
  always
    @(posedge clk) begin
      reg24 <= $signed({((^~$unsigned((8'hb6))) ? (~^wire13) : {{reg23}})});
      reg25 <= (wire12 ?
          $signed($unsigned(reg20[(3'h7):(3'h4)])) : (^$signed((8'ha7))));
      reg26 <= wire18;
      if (reg24[(4'hc):(4'hc)])
        begin
          if (($signed({$unsigned((reg22 & reg25))}) ?
              wire13 : {$unsigned($unsigned((reg19 || wire10)))}))
            begin
              reg27 <= ($unsigned((wire14 ?
                  ((8'hb5) ?
                      ((8'h9d) ?
                          wire17 : reg25) : (!wire18)) : reg20[(3'h5):(1'h1)])) && wire11);
              reg28 <= wire13;
            end
          else
            begin
              reg27 <= (8'haf);
              reg28 <= $unsigned((~|reg19));
              reg29 <= (~wire9);
              reg30 <= $signed($signed({$unsigned((reg29 != (8'hab))),
                  reg19[(1'h1):(1'h0)]}));
              reg31 <= $signed(wire15[(1'h0):(1'h0)]);
            end
          reg32 <= (8'ha9);
          reg33 <= wire12;
        end
      else
        begin
          reg27 <= reg22;
          reg28 <= $unsigned((8'hab));
          reg29 <= (($signed($signed($signed(reg21))) ~^ (({wire12,
                      wire18} >> {wire9, reg31}) ?
                  $signed(reg21[(2'h2):(1'h1)]) : $signed($unsigned(wire17)))) ?
              $unsigned((({(7'h40)} ?
                  (8'hb6) : wire15[(2'h2):(2'h2)]) + reg31[(5'h11):(3'h4)])) : ({$unsigned(wire12),
                      ({reg32, reg32} ?
                          (wire18 ? wire17 : wire11) : (reg31 != wire13))} ?
                  {((wire11 == reg20) ? $unsigned(wire9) : $unsigned((8'hbb))),
                      ((reg25 > reg23) ?
                          reg33[(3'h6):(1'h1)] : $signed(wire13))} : $unsigned({{reg27},
                      reg25})));
          reg30 <= (-(!(&(~|$unsigned(wire15)))));
        end
      reg34 <= (((((!(8'ha1)) <= (~&reg21)) ?
                  (+{reg32, reg30}) : $signed((~reg27))) ?
              (~|($unsigned(wire17) * wire18)) : $unsigned(wire14[(2'h2):(2'h2)])) ?
          $unsigned(($unsigned(wire17) <= (~(reg28 >> wire17)))) : reg28);
    end
  assign wire35 = reg30[(4'hb):(1'h1)];
  assign wire36 = (^~$unsigned((~^$unsigned(wire11))));
  module37 #() modinst52 (.wire41(wire35), .clk(clk), .wire42(wire17), .wire40(reg24), .y(wire51), .wire39(reg28), .wire38(reg31));
  assign wire53 = wire14[(1'h0):(1'h0)];
  assign wire54 = ($signed($unsigned((wire13[(3'h6):(3'h5)] >= wire17))) ?
                      $unsigned(reg28) : $signed({wire15,
                          (~|((8'hb6) ? wire36 : reg24))}));
  assign wire55 = reg22[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg56 <= (~wire17);
      reg57 <= wire18[(2'h3):(2'h3)];
      if ($signed(($signed($signed((reg23 & reg19))) ?
          (($signed((8'hac)) ? {reg30, wire35} : ((8'hac) << wire53)) ?
              $unsigned(reg26) : (~&$signed(reg33))) : wire13[(3'h5):(2'h3)])))
        begin
          reg58 <= reg20;
          reg59 <= ($unsigned(reg58) ?
              wire53 : (reg27 + $unsigned((&(reg30 ? (8'hb9) : reg21)))));
          reg60 <= {$unsigned(reg29[(5'h10):(4'h8)]),
              (($unsigned((8'hb0)) ?
                  (reg24[(4'ha):(3'h4)] - (reg33 ^~ wire16)) : (&$unsigned(reg31))) >>> reg31)};
          reg61 <= $unsigned(reg32[(2'h3):(1'h0)]);
        end
      else
        begin
          reg58 <= (8'hb2);
          reg59 <= ($unsigned(wire16[(3'h5):(1'h1)]) ?
              ((wire9 ? reg58[(1'h1):(1'h0)] : (~&(~|reg58))) ?
                  $unsigned((|(~&(8'ha0)))) : {(~^$signed(reg58)),
                      $signed({wire54, reg60})}) : (wire17 ?
                  wire15[(1'h0):(1'h0)] : {(~(&wire11))}));
          reg60 <= $signed((reg57[(1'h0):(1'h0)] ~^ $unsigned($unsigned(reg56[(3'h7):(3'h7)]))));
          reg61 <= reg31[(5'h15):(4'hc)];
        end
    end
  assign wire62 = (^$unsigned($signed(reg58)));
  assign wire63 = $unsigned(($signed(({reg32} && (^reg21))) ?
                      (~^reg28) : (~$unsigned($unsigned((8'ha2))))));
endmodule

module module37
#(parameter param49 = {((8'hb1) ? (8'haa) : ((~|((8'hb8) < (8'had))) ? {(~(8'hae)), ((8'ha6) ? (8'hb1) : (8'h9c))} : (~^{(8'h9e), (8'hbb)})))}, 
parameter param50 = ((((((8'hb6) != (8'h9e)) ? (8'haf) : param49) <= param49) ? param49 : ((|{param49}) ~^ ((param49 ? (8'h9c) : param49) ^~ (param49 | param49)))) * param49))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire signed [(4'hb):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  input wire [(5'h13):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, (1'h0)};
  assign wire43 = ($signed($unsigned(({wire42} > (8'hb0)))) <<< (&$signed(({wire38} ?
                      $signed(wire40) : (wire42 ? wire40 : wire38)))));
  assign wire44 = (|wire43);
  assign wire45 = wire40;
  assign wire46 = {wire42[(4'h8):(1'h1)], wire39[(4'hd):(4'h9)]};
  assign wire47 = (~(($signed(((8'haa) ? wire45 : wire46)) & $signed((wire42 ?
                      wire39 : wire40))) | $signed($signed($unsigned(wire43)))));
  assign wire48 = $signed($unsigned(wire44[(2'h3):(1'h0)]));
endmodule
