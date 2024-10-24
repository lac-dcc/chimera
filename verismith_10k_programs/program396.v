module top
#(parameter param75 = ((!((!(~(8'hbd))) - (((8'had) << (8'ha7)) >> ((8'had) ? (8'hae) : (8'hb3))))) ? (+(!(&((8'ha2) || (8'ha6))))) : ((^(((7'h43) ? (8'hba) : (8'hac)) ? ((8'hbb) ? (8'hb7) : (8'haa)) : (|(8'hb9)))) ? (!(+((8'ha8) ^~ (8'ha7)))) : {{((7'h41) ? (8'h9f) : (8'hbd))}})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire70;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire70,
                 (1'h0)};
  assign wire5 = (~|$unsigned((wire3[(2'h2):(2'h2)] * $unsigned(wire1))));
  assign wire6 = $signed($unsigned((wire4[(1'h1):(1'h1)] ?
                     (+(|wire2)) : (^(-wire2)))));
  assign wire7 = {$signed($signed(wire6)), $unsigned($unsigned((~&wire1)))};
  assign wire8 = (wire5 >= wire3);
  assign wire9 = $signed({($unsigned($unsigned((8'hbb))) <= ((wire0 | (8'hb9)) ?
                         {wire2} : (wire8 ? wire4 : wire5))),
                     wire0});
  assign wire10 = ($signed(((wire1[(2'h3):(1'h1)] ?
                          (+wire3) : wire6[(3'h7):(1'h0)]) >>> wire4[(1'h1):(1'h0)])) ?
                      (+(wire0 && (wire0[(4'h8):(1'h1)] + (8'h9f)))) : ((wire4[(4'h9):(4'h8)] ?
                          wire6[(4'he):(3'h5)] : (+(^~wire6))) <= wire9[(3'h5):(2'h3)]));
  assign wire11 = wire0[(2'h2):(2'h2)];
  assign wire12 = (8'hbf);
  module13 #() modinst71 (.clk(clk), .wire16(wire3), .wire15(wire0), .wire14(wire5), .wire18(wire11), .y(wire70), .wire17(wire2));
  assign wire72 = (~|wire10[(4'hd):(4'h9)]);
  assign wire73 = $unsigned({wire1,
                      (wire9[(4'hb):(3'h4)] < wire2[(4'h9):(2'h2)])});
  assign wire74 = (|{(|($signed(wire73) ? wire73[(3'h7):(1'h1)] : {wire9})),
                      $signed({wire3[(1'h0):(1'h0)]})});
endmodule

module module13
#(parameter param68 = (~&(((~|((8'hb9) ? (8'hb9) : (8'hbb))) || (((8'hab) ? (8'h9f) : (8'hbb)) ? (~(8'ha6)) : (^~(8'hac)))) <= (^~(7'h41)))), 
parameter param69 = (((8'hb8) ? (({(8'haa)} & {param68}) ? (param68 | param68) : param68) : {((param68 ? (8'h9c) : (8'hbc)) ~^ param68), ((param68 < param68) ? param68 : param68)}) <= ((!{param68, ((8'hb5) ? param68 : param68)}) ? (~&param68) : ((param68 ? (param68 && param68) : param68) ? param68 : ((param68 ? param68 : param68) ? {param68} : param68)))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire54,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg58,
                 reg57,
                 reg56,
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
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire19 = wire14;
  assign wire20 = {{($signed((^wire16)) <= wire18), wire17[(2'h3):(1'h0)]},
                      wire17};
  assign wire21 = (wire17[(1'h0):(1'h0)] ?
                      (wire18 ?
                          $signed($unsigned((wire16 && wire16))) : $unsigned({$signed((8'ha2))})) : (~|wire15));
  assign wire22 = (({wire20[(1'h1):(1'h0)],
                          ($signed(wire18) ?
                              wire16 : (wire19 ^ wire15))} <<< (~|((wire15 ?
                          (7'h40) : wire14) ^ (wire15 > wire19)))) ?
                      wire20 : (wire15[(2'h2):(2'h2)] ?
                          wire19 : $unsigned(($signed(wire16) ?
                              wire14 : $unsigned(wire21)))));
  always
    @(posedge clk) begin
      if ($unsigned((wire21[(1'h1):(1'h0)] <= wire17[(2'h2):(1'h1)])))
        begin
          if ((wire14 >> (wire16[(1'h1):(1'h0)] == {((wire14 ?
                  wire17 : wire21) == ((8'ha0) ~^ wire20)),
              $unsigned($signed(wire18))})))
            begin
              reg23 <= (~^$unsigned((((wire22 ? wire14 : wire15) ?
                  (wire18 & wire20) : $unsigned(wire16)) <<< (~&wire16))));
              reg24 <= $signed(wire22);
            end
          else
            begin
              reg23 <= wire21;
              reg24 <= (~^reg23[(3'h7):(3'h5)]);
              reg25 <= (wire20 ^ (((7'h44) == reg23) ?
                  ($signed((wire16 > reg23)) >= (~^(~reg23))) : (^wire18[(4'hd):(3'h4)])));
              reg26 <= $signed($signed(wire21[(1'h0):(1'h0)]));
              reg27 <= reg25;
            end
          if ((wire18 ?
              ($signed((reg24 ?
                  $unsigned(wire21) : (wire17 ?
                      wire21 : (7'h41)))) != $unsigned((!(wire21 < wire14)))) : {(~|((-wire19) ?
                      wire15 : $signed(wire20))),
                  (wire17 | $signed(wire15[(2'h3):(1'h1)]))}))
            begin
              reg28 <= wire19;
              reg29 <= $signed({(-(wire16[(3'h5):(1'h1)] ?
                      (reg25 ? wire19 : wire21) : (~&reg28)))});
              reg30 <= {(!(((wire15 > reg28) <<< $unsigned(reg28)) ?
                      (wire20[(2'h2):(2'h2)] <= $signed(reg29)) : (8'ha2))),
                  wire21[(2'h2):(2'h2)]};
            end
          else
            begin
              reg28 <= $signed(reg29[(5'h10):(1'h1)]);
            end
        end
      else
        begin
          reg23 <= ($unsigned($signed((-reg29))) < wire22);
        end
      reg31 <= $signed($unsigned((($unsigned(wire17) * ((8'haa) ?
          reg25 : reg26)) < (+$signed(wire15)))));
      if ($signed(($unsigned(((wire18 + reg31) << {reg25,
          wire14})) <<< (((wire22 ? wire19 : reg30) ?
          (wire18 ^~ reg23) : $unsigned(reg27)) >= $unsigned(reg31)))))
        begin
          reg32 <= $signed($signed((reg23 && reg30[(3'h6):(2'h2)])));
          if (reg30[(5'h10):(3'h4)])
            begin
              reg33 <= (8'hb7);
              reg34 <= wire22;
            end
          else
            begin
              reg33 <= $signed(($signed(wire17) ?
                  (~&(reg33[(2'h2):(2'h2)] ?
                      (^~reg25) : (~&wire22))) : (({reg24,
                      reg27} + {wire15}) | $unsigned($unsigned(reg33)))));
              reg34 <= (~^{$signed(wire16[(3'h5):(3'h4)])});
            end
          reg35 <= $signed((~|(wire18 & reg30[(1'h0):(1'h0)])));
        end
      else
        begin
          reg32 <= (reg32 ?
              $unsigned(((reg35[(4'ha):(4'h9)] ?
                  $unsigned(wire16) : wire17) || {$unsigned(reg26)})) : reg26[(1'h1):(1'h0)]);
          reg33 <= $signed(((reg23 <= reg30) ? reg24[(1'h1):(1'h0)] : reg34));
        end
      reg36 <= {($signed(reg31) < $unsigned(($unsigned((8'ha1)) ?
              $unsigned(wire16) : (+reg32))))};
    end
  module37 #() modinst55 (wire54, clk, reg27, reg26, wire21, reg32, wire17);
  always
    @(posedge clk) begin
      reg56 <= (-$signed(wire14));
      reg57 <= $signed((wire20 != (reg35 ^~ wire19)));
      reg58 <= (&(reg31[(4'h8):(2'h2)] ?
          $signed((reg57 ?
              $signed(reg30) : ((8'hb5) ?
                  (7'h42) : reg30))) : $signed($signed({wire20}))));
    end
  assign wire59 = reg56;
  assign wire60 = reg23[(2'h2):(1'h1)];
  assign wire61 = {(wire59 ?
                          {((reg34 ? reg36 : reg33) || wire22),
                              ({reg30} == $signed(reg36))} : (~|(+{wire18,
                              reg57}))),
                      (^reg25)};
  assign wire62 = $unsigned(reg23);
  assign wire63 = $unsigned(reg26);
  assign wire64 = $signed($unsigned(wire60));
  assign wire65 = $unsigned($unsigned($unsigned({(reg36 & wire21), (8'ha2)})));
  assign wire66 = $signed(wire19);
  assign wire67 = $unsigned($unsigned((wire64 ? reg35 : {(~^wire62)})));
endmodule

module module37
#(parameter param52 = ((~|(^~(((8'hb7) ? (8'hb0) : (8'hb0)) ? (~&(8'hb2)) : {(8'ha9)}))) != ((+{(~^(7'h42)), {(8'ha4)}}) > ((((8'hb9) ? (8'hbf) : (8'ha6)) ? ((8'had) ? (8'hb4) : (8'hb2)) : (+(8'ha2))) ? (+((8'h9c) ? (8'hb1) : (8'hbe))) : (8'hbe)))), 
parameter param53 = (~|{(((param52 | param52) ~^ {param52}) ? ((param52 ? param52 : param52) ? (param52 ? param52 : param52) : {(8'hb8)}) : ((~^param52) ? {(8'ha3), param52} : param52))}))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire42;
  input wire [(5'h12):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire signed [(5'h11):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = (8'hb4);
  assign wire44 = ({wire42[(3'h7):(3'h7)]} ?
                      $signed(wire38) : (wire40 > wire42[(4'hd):(1'h0)]));
  assign wire45 = $signed((wire40 >= ($unsigned((~&wire42)) ?
                      $signed(wire44[(2'h3):(1'h1)]) : wire42)));
  assign wire46 = {({wire45[(4'ha):(3'h6)]} ?
                          wire45[(2'h3):(1'h1)] : $signed((8'ha7)))};
  assign wire47 = (8'haa);
  assign wire48 = $unsigned(($unsigned((~^wire40[(3'h5):(3'h5)])) & ($unsigned(wire43[(4'ha):(3'h7)]) ?
                      $unsigned(((8'ha0) && wire40)) : wire42)));
  assign wire49 = wire44[(2'h3):(1'h1)];
  assign wire50 = ((((~&wire47) ?
                      $signed((|(8'ha0))) : (^~((8'haf) - (7'h41)))) * (^~wire38[(3'h7):(2'h2)])) * ($signed(((8'ha3) ?
                          wire41[(4'hb):(4'h8)] : ((8'hb6) >> (8'hb8)))) ?
                      $unsigned(wire40[(2'h3):(1'h1)]) : $unsigned((~|$signed(wire44)))));
  assign wire51 = (wire39[(4'h8):(3'h4)] ?
                      {(wire47 ? wire50 : (^~$unsigned(wire40))),
                          (wire38[(3'h4):(3'h4)] - ((wire39 >>> wire50) ?
                              $signed(wire50) : $signed((8'hb9))))} : $unsigned((!$signed(((7'h43) ?
                          wire46 : wire40)))));
endmodule
