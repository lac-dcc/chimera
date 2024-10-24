module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire55;
  assign y = {wire58, wire57, wire4, wire55, (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst56 (.clk(clk), .y(wire55), .wire9(wire3), .wire6(wire1), .wire10(wire4), .wire8(wire2), .wire7(wire0));
  assign wire57 = wire4[(3'h4):(2'h2)];
  assign wire58 = (^$unsigned(((~&wire3[(2'h2):(2'h2)]) != wire4)));
endmodule

module module5
#(parameter param54 = (8'hae))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire45;
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire45,
                 reg50,
                 (1'h0)};
  assign wire11 = (^~wire10);
  assign wire12 = {{({((8'hb5) ? wire10 : wire9)} < ((wire6 ?
                              wire11 : wire8) | $unsigned(wire9))),
                          (wire11[(1'h1):(1'h0)] * (wire10[(1'h0):(1'h0)] >= $signed(wire7)))}};
  assign wire13 = (8'hb8);
  assign wire14 = wire11;
  module15 #() modinst46 (wire45, clk, wire9, wire11, wire7, wire12, wire10);
  assign wire47 = ((({(wire14 ? wire10 : wire8),
                              (8'ha5)} ~^ wire6[(2'h3):(1'h1)]) ?
                          $signed(wire11[(3'h6):(2'h3)]) : wire13) ?
                      wire10[(3'h7):(3'h6)] : {(((8'hb3) || {wire14}) | $unsigned((&wire13)))});
  assign wire48 = wire45[(5'h10):(4'he)];
  assign wire49 = (~wire9[(4'h8):(3'h4)]);
  always
    @(posedge clk) begin
      reg50 <= wire7;
    end
  assign wire51 = wire9;
  assign wire52 = ($unsigned(wire10[(3'h6):(2'h2)]) ?
                      (({wire7, (|(7'h40))} - reg50[(4'he):(3'h5)]) ?
                          $signed($unsigned((wire48 != wire8))) : wire49[(2'h3):(1'h1)]) : $signed(wire12[(4'hb):(3'h7)]));
  assign wire53 = ($unsigned($unsigned({reg50})) ?
                      wire12 : wire8[(4'hd):(4'hd)]);
endmodule

module module15
#(parameter param43 = ((((8'h9d) ? (^~(~(8'h9e))) : {(~(8'hb2))}) ? {(((8'hbb) * (8'hb9)) ~^ ((8'ha1) ? (8'h9d) : (8'hbf))), (^(|(7'h44)))} : ((-((8'hac) >>> (7'h40))) ? ((8'hb4) ? ((8'hb8) ? (8'hb5) : (8'hb6)) : ((8'hbe) || (8'haa))) : (((8'ha6) ? (8'hb0) : (8'ha1)) ? (8'haa) : (8'h9e)))) ? ((((~^(8'hbf)) & {(8'h9f), (8'ha7)}) || ((~(8'ha5)) ~^ (^(8'ha4)))) ? (~|{(^(8'haf)), {(8'hb5), (7'h41)}}) : (&((+(8'h9d)) >> ((8'hbe) ? (7'h40) : (8'hb0))))) : ((~^(~|((8'ha5) ? (8'hbc) : (8'ha7)))) ? (&((~(8'hbf)) || {(8'hac)})) : {(!(^(8'hbd)))})), 
parameter param44 = (~^(8'hab)))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire21 = (wire20[(4'h9):(2'h2)] ~^ (~wire18));
  assign wire22 = $signed({$signed((wire18 == $unsigned(wire18))),
                      $unsigned((+$signed(wire21)))});
  assign wire23 = $signed($unsigned((-$signed(((8'hbd) >>> (8'ha9))))));
  assign wire24 = ((((+(wire21 ? wire18 : wire23)) ?
                          (-(-wire22)) : (((8'hb5) ?
                              (8'haf) : wire18) ^~ (^wire16))) >= (^wire18)) ?
                      wire16 : (($unsigned($signed(wire19)) ?
                              (~&$unsigned((8'hab))) : (8'haf)) ?
                          {(8'hae),
                              ((wire22 * wire23) ?
                                  $unsigned(wire21) : wire23[(2'h3):(2'h2)])} : (($unsigned(wire22) ?
                                  (wire22 ?
                                      wire17 : wire18) : (wire18 == wire18)) ?
                              (~|wire19) : wire22)));
  assign wire25 = $signed($signed({(wire22 ?
                          (wire20 ? wire20 : (8'ha7)) : (wire24 == wire20)),
                      wire22[(4'h8):(1'h1)]}));
  always
    @(posedge clk) begin
      if ((((($signed(wire24) ^ (-(8'h9e))) >= wire16) ?
          ($signed($unsigned(wire24)) ?
              (-$signed((7'h42))) : ({(8'hbe), wire20} <= (wire19 ?
                  wire21 : wire16))) : {$signed(wire16[(1'h0):(1'h0)]),
              wire18[(2'h3):(2'h3)]}) <= ((8'hb1) ^ ($unsigned($unsigned((8'hb2))) ?
          $unsigned((wire19 ? (8'ha9) : wire19)) : $unsigned(((8'h9f) ?
              (8'hb2) : wire24))))))
        begin
          if ((wire22[(4'hb):(3'h7)] <= (~^((wire18[(1'h1):(1'h0)] ?
              wire25[(3'h7):(2'h2)] : $signed(wire25)) ~^ $unsigned(wire22)))))
            begin
              reg26 <= $signed((($unsigned(wire22) ?
                  ($signed((8'haa)) * wire21) : ($unsigned((7'h44)) ?
                      {wire20} : wire17)) <= $unsigned(($signed((8'ha6)) ?
                  $signed(wire22) : $unsigned(wire21)))));
              reg27 <= wire21;
              reg28 <= $unsigned(({wire18,
                  $unsigned(reg27[(1'h1):(1'h0)])} >>> wire20));
            end
          else
            begin
              reg26 <= (~wire18[(2'h2):(1'h0)]);
              reg27 <= (7'h44);
              reg28 <= ({wire24[(3'h4):(1'h1)]} + ((~&($signed((8'hac)) == (wire18 <= wire24))) ?
                  (~|$signed(wire16[(1'h0):(1'h0)])) : $signed($signed($signed(wire21)))));
              reg29 <= (8'ha3);
            end
          reg30 <= $unsigned($unsigned(wire16));
          reg31 <= $signed({$unsigned($unsigned($unsigned(reg30))),
              (wire17[(1'h0):(1'h0)] * wire24[(3'h4):(1'h0)])});
        end
      else
        begin
          reg26 <= wire25[(2'h2):(1'h1)];
          reg27 <= (~|(^$unsigned(((!(8'haf)) ?
              (|wire21) : $unsigned(wire25)))));
          if (wire23[(1'h0):(1'h0)])
            begin
              reg28 <= $signed($unsigned(wire19));
              reg29 <= (-wire17[(2'h3):(2'h2)]);
              reg30 <= (wire23 - wire16);
              reg31 <= $unsigned($signed(wire17[(4'h9):(1'h0)]));
              reg32 <= $unsigned($unsigned((reg30 && (8'haf))));
            end
          else
            begin
              reg28 <= ((~|$unsigned(wire25[(5'h11):(4'hb)])) * $signed((^$signed(wire23))));
              reg29 <= $unsigned(((~&$unsigned((wire23 ?
                  reg27 : wire22))) ^ ($signed(reg28[(4'he):(1'h1)]) && $signed({wire22,
                  reg30}))));
              reg30 <= $unsigned({wire22});
            end
        end
      reg33 <= (reg30 << $signed(reg32));
      reg34 <= wire19[(2'h2):(1'h1)];
    end
  assign wire35 = $unsigned(reg30[(3'h7):(3'h5)]);
  assign wire36 = $unsigned(((8'hbd) ?
                      $signed(wire20[(4'h9):(1'h1)]) : ($unsigned($unsigned((8'haa))) >= $unsigned({wire18,
                          wire17}))));
  assign wire37 = {$signed($unsigned((wire25[(3'h4):(1'h1)] <<< (wire24 ?
                          (7'h40) : (8'ha9))))),
                      (8'h9c)};
  assign wire38 = wire19[(1'h1):(1'h1)];
  assign wire39 = ({$signed((!(wire35 ? wire35 : wire35))),
                      reg33} || reg32[(3'h6):(3'h6)]);
  assign wire40 = ((wire25 ?
                      $signed($signed((wire23 ?
                          wire16 : wire36))) : $unsigned((&wire18[(3'h4):(2'h2)]))) << reg31[(4'hb):(4'hb)]);
  assign wire41 = (~&reg32);
  assign wire42 = {($unsigned((|((8'hb3) >> reg29))) << (wire35 && ((8'ha8) ?
                          reg32 : (8'ha6)))),
                      reg30};
endmodule
