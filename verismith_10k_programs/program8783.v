module top
#(parameter param68 = {(((((8'hac) | (8'hac)) ? ((8'hbf) ? (8'ha5) : (7'h40)) : {(8'h9f), (8'ha3)}) >> ((~&(8'ha9)) ? ((8'hae) ? (8'hbd) : (8'hb4)) : {(7'h42), (8'hbb)})) ? ({((8'hac) ? (8'ha7) : (8'hb6))} <= (((8'ha4) ? (8'hbe) : (8'ha1)) && ((8'haf) ? (8'hb8) : (8'hba)))) : ((~&((8'hb8) ? (8'haf) : (8'hb1))) ? ((&(8'hb4)) << (8'hb1)) : (((7'h44) & (8'hbd)) - ((8'ha5) ? (8'haf) : (8'hac)))))}, 
parameter param69 = ((!{(8'hb4)}) ? (8'ha7) : ((((+(8'hbf)) > {param68}) > (-(~&(8'hb0)))) ? param68 : param68)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire52;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire4,
                 wire52,
                 (1'h0)};
  assign wire4 = $signed({{wire2}, (+{$unsigned(wire1), wire3})});
  module5 #() modinst53 (.wire10(wire1), .wire8(wire2), .wire6(wire4), .y(wire52), .wire7(wire0), .wire9(wire3), .clk(clk));
  assign wire54 = $unsigned(wire3);
  assign wire55 = $unsigned($signed(($signed((wire2 ?
                      wire2 : wire2)) ~^ $signed((8'h9c)))));
  assign wire56 = wire3[(3'h7):(3'h7)];
  assign wire57 = (wire2[(2'h2):(1'h1)] < ((!$unsigned((wire0 ?
                      wire3 : wire55))) ^ (-$signed((wire1 ?
                      wire0 : wire55)))));
  assign wire58 = (~&(~|(&(wire54[(1'h1):(1'h1)] ?
                      (!wire1) : $signed((8'had))))));
  assign wire59 = (8'ha3);
  assign wire60 = $unsigned(wire54);
  assign wire61 = (~&wire58[(4'he):(4'hb)]);
  assign wire62 = (!(~|$signed(($signed(wire56) ?
                      $unsigned(wire61) : $unsigned(wire59)))));
  assign wire63 = $signed(wire61[(2'h2):(1'h1)]);
  assign wire64 = $unsigned($unsigned(wire59));
  assign wire65 = ($unsigned($unsigned(((wire59 <<< wire54) * $unsigned(wire52)))) ?
                      (wire60[(3'h4):(1'h1)] + ({wire64} < (8'hae))) : (!wire56[(3'h4):(1'h1)]));
  assign wire66 = {wire56, $unsigned(wire52[(1'h1):(1'h1)])};
  assign wire67 = {(8'hbd), (!$unsigned(((!wire66) || (!(8'haa)))))};
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire45;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire11,
                 wire12,
                 wire45,
                 (1'h0)};
  assign wire11 = $signed($unsigned(wire7));
  assign wire12 = (|(~({(wire10 >> wire10)} ?
                      ($signed(wire10) ?
                          (wire6 ? wire10 : wire9) : (wire9 ?
                              wire7 : wire10)) : ($signed(wire6) ~^ ((8'haa) & wire11)))));
  module13 #() modinst46 (.y(wire45), .wire14(wire11), .clk(clk), .wire16(wire8), .wire15(wire6), .wire18(wire12), .wire17(wire10));
  assign wire47 = (&((&((+(8'hb2)) ?
                          (wire10 ? wire12 : (8'hb4)) : {wire12, wire10})) ?
                      $signed((~^(wire10 > wire11))) : wire12));
  assign wire48 = ($signed(wire12) ?
                      wire10[(5'h12):(4'hc)] : $signed((wire9 <<< ($unsigned(wire7) - wire8[(2'h3):(1'h1)]))));
  assign wire49 = $unsigned($unsigned(wire45[(1'h0):(1'h0)]));
  assign wire50 = {((^(+wire12[(3'h5):(2'h2)])) ?
                          $unsigned(wire45) : (~&$unsigned(wire49)))};
  assign wire51 = $signed(($unsigned(((wire49 ? wire8 : wire50) ?
                      (8'ha0) : (wire48 > wire7))) << {(wire10 < wire12[(2'h3):(2'h3)]),
                      ((8'hbc) ? (^~wire6) : $unsigned(wire48))}));
endmodule

module module13
#(parameter param43 = (!(({{(8'ha6), (8'hbe)}, ((8'ha2) | (8'ha4))} ? ((^~(8'hb4)) + (!(8'hb0))) : (((8'ha9) ? (8'haf) : (7'h43)) ? {(8'ha0), (8'ha7)} : ((8'ha2) ? (8'hb6) : (8'ha7)))) - ((-((8'hbe) ? (8'h9c) : (8'hb5))) * ({(7'h42)} + ((8'hb9) ? (8'hb7) : (8'h9e)))))), 
parameter param44 = ({(((param43 << param43) >>> (~param43)) ? param43 : (!(-param43))), {({param43, param43} > (param43 ~^ param43))}} < param43))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg39,
                 reg38,
                 reg35,
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
  assign wire19 = (|(wire17 ?
                      $unsigned($unsigned((wire18 ?
                          wire15 : wire14))) : wire18[(2'h2):(2'h2)]));
  assign wire20 = $signed((|(8'ha4)));
  assign wire21 = $signed(wire18[(1'h0):(1'h0)]);
  assign wire22 = wire15;
  assign wire23 = wire20[(1'h0):(1'h0)];
  assign wire24 = $unsigned($unsigned(wire16[(2'h3):(1'h1)]));
  assign wire25 = $unsigned((^~wire20));
  always
    @(posedge clk) begin
      reg26 <= $unsigned((|((wire19 < $unsigned(wire25)) != (^{wire22,
          wire19}))));
      reg27 <= (wire20[(2'h3):(2'h2)] && wire23[(4'h8):(4'h8)]);
      reg28 <= (!wire25[(5'h10):(5'h10)]);
      reg29 <= (($unsigned((~wire19[(2'h2):(1'h0)])) | ((^(+reg28)) >>> wire16)) ?
          $signed(wire22) : (~|(+(8'hac))));
    end
  always
    @(posedge clk) begin
      reg30 <= (&(8'hb1));
      if ($unsigned((wire16 ?
          (^~$signed(((8'hb1) ?
              wire15 : wire24))) : $unsigned($unsigned((wire15 & wire16))))))
        begin
          reg31 <= ((8'hbe) ?
              (~(!wire25[(4'hd):(3'h4)])) : ($signed((-wire17[(3'h6):(2'h2)])) ?
                  reg28 : (((^wire17) << (wire20 ~^ wire17)) ?
                      (-{wire17, wire22}) : reg28[(2'h2):(1'h0)])));
          reg32 <= (($signed((~|$signed((8'hb8)))) | wire18[(2'h2):(2'h2)]) ?
              (~&$unsigned($unsigned($unsigned(wire21)))) : wire18);
          reg33 <= ((-wire18[(2'h2):(1'h0)]) & (~|wire16[(1'h1):(1'h1)]));
        end
      else
        begin
          reg31 <= $unsigned((~&wire23));
          reg32 <= (~^wire20[(3'h6):(2'h2)]);
          reg33 <= (($unsigned({$unsigned((7'h40)),
              (~&(8'hb4))}) != $signed(wire15)) << reg26[(1'h1):(1'h1)]);
          reg34 <= $signed(((~^(7'h43)) ?
              (-$signed(((8'ha4) + reg31))) : (wire24[(2'h2):(1'h1)] * $signed($signed(wire18)))));
          reg35 <= wire16;
        end
    end
  assign wire36 = (-(reg32 ?
                      $signed(wire19[(2'h3):(2'h2)]) : (reg30 ?
                          ((~&wire22) ?
                              wire18 : $unsigned((8'ha0))) : $signed(reg27))));
  assign wire37 = $unsigned(wire19);
  always
    @(posedge clk) begin
      reg38 <= $signed((($signed((wire17 < wire22)) ?
              $unsigned((wire14 < (8'ha1))) : (&$unsigned(wire19))) ?
          $signed((-wire18[(1'h0):(1'h0)])) : wire36));
      reg39 <= wire24[(1'h0):(1'h0)];
    end
  assign wire40 = (wire16[(2'h2):(1'h1)] <= (~|(reg30[(3'h6):(1'h0)] * reg32)));
  assign wire41 = ((($unsigned((|reg32)) ? reg26 : (~{reg29, wire17})) ?
                          {(wire19[(4'hb):(3'h6)] << $unsigned(wire24))} : ((^~(^wire18)) - reg35[(4'ha):(4'ha)])) ?
                      (^(!((~^reg26) || (+reg30)))) : (8'haa));
  assign wire42 = $unsigned(($unsigned(wire15) || $unsigned(((wire24 ?
                      wire37 : reg26) * reg26[(1'h1):(1'h1)]))));
endmodule
