module top
#(parameter param92 = ((8'hbe) ? ((8'hac) ? ((((8'h9f) & (8'hae)) ? ((8'hab) >= (8'hae)) : (~&(8'ha8))) ? ({(8'hbb), (8'hb6)} | ((8'h9f) ? (8'hbc) : (8'h9e))) : {{(8'hbc)}}) : {({(8'haf), (8'hb9)} ? ((8'ha3) ^ (8'ha8)) : (&(8'ha1))), (|{(8'h9c)})}) : (^~((^((8'haa) < (8'ha6))) ? (~^((8'ha1) <<< (8'hb5))) : (((8'haa) ? (8'hbc) : (8'ha2)) ^ ((8'hbb) ? (8'hbc) : (8'hb5)))))), 
parameter param93 = (((8'hae) == (~(+param92))) ^ ((((param92 ? param92 : param92) ? (^~param92) : (param92 ? param92 : param92)) ? (param92 ? (^param92) : (8'had)) : ((-param92) << (param92 ? param92 : (8'hb6)))) ? (~|((param92 ? param92 : param92) < {param92, param92})) : (((param92 << param92) ? param92 : param92) ? (!{param92}) : ({param92, param92} ? (~param92) : (|(8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  assign y = {wire91,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire63,
                 wire4,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg66,
                 (1'h0)};
  assign wire4 = $signed(((~|(|$signed(wire3))) ? $signed(wire1) : wire3));
  module5 #() modinst64 (.wire8(wire0), .y(wire63), .wire9(wire1), .wire7(wire4), .wire6(wire2), .clk(clk));
  assign wire65 = (wire3[(1'h1):(1'h0)] != $signed(wire3[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg66 <= (8'hb1);
    end
  assign wire67 = wire65;
  assign wire68 = (((~&(((8'haa) ? wire2 : (8'hbd)) ?
                          wire0 : (+wire67))) == $signed({$signed(wire3)})) ?
                      ((~^wire2[(4'hb):(3'h6)]) ?
                          ((-wire4) > ($unsigned(wire4) ~^ (8'ha1))) : (~&wire67[(4'h8):(1'h0)])) : $signed((($signed(wire0) > $unsigned((8'ha3))) == wire65[(3'h5):(3'h4)])));
  assign wire69 = (^~$signed($unsigned(wire1[(1'h0):(1'h0)])));
  assign wire70 = $unsigned($unsigned((|{wire68, (wire67 << (7'h44))})));
  assign wire71 = (~&(^~$signed(($unsigned(wire3) + reg66[(1'h0):(1'h0)]))));
  assign wire72 = wire2[(5'h10):(4'hb)];
  always
    @(posedge clk) begin
      reg73 <= wire0;
      if ((8'hab))
        begin
          reg74 <= ($unsigned(wire0) || ($signed($signed({wire72,
              wire70})) + $unsigned($signed((!wire71)))));
          reg75 <= (reg66 ? wire2 : wire69);
        end
      else
        begin
          reg74 <= $signed(($unsigned({wire68[(3'h7):(3'h7)], {reg73}}) ?
              {$unsigned(wire71)} : $unsigned(wire71)));
          reg75 <= $unsigned((((wire2[(2'h2):(2'h2)] < ((8'ha0) >>> (8'h9f))) > ((wire63 ?
                      reg75 : reg75) ?
                  wire4 : $signed(wire69))) ?
              (^~wire67) : (reg75[(4'hb):(1'h1)] ?
                  wire68[(4'h9):(3'h7)] : reg74)));
          reg76 <= reg75;
          reg77 <= (-$unsigned((|((+wire72) ? {wire0, reg66} : (-wire2)))));
        end
      if ((wire69 ? $signed(wire1[(4'hb):(1'h0)]) : wire3[(3'h4):(2'h2)]))
        begin
          reg78 <= ((wire1[(5'h13):(2'h2)] ?
              reg75[(1'h1):(1'h1)] : ((+wire3) ?
                  wire65 : $signed($unsigned(wire71)))) ~^ $unsigned(wire65));
          reg79 <= $signed({($signed(wire65) & ((wire67 ? wire1 : (8'hb2)) ?
                  (wire67 ? wire71 : reg78) : (|(8'hab)))),
              (^~(reg78[(3'h5):(2'h2)] ?
                  ((8'hbc) ? reg76 : wire71) : (wire63 ? wire65 : wire3)))});
          if (wire2[(2'h2):(2'h2)])
            begin
              reg80 <= $unsigned(wire65);
            end
          else
            begin
              reg80 <= reg78;
              reg81 <= wire70;
            end
          reg82 <= wire63;
          reg83 <= wire69[(2'h3):(1'h1)];
        end
      else
        begin
          reg78 <= $signed(reg66[(4'h8):(2'h3)]);
          reg79 <= (~^(^~($signed(wire1) ?
              $unsigned((reg76 ? (8'hbe) : wire63)) : ((8'ha7) ?
                  $unsigned((8'h9d)) : reg78))));
          if (reg83[(2'h2):(1'h0)])
            begin
              reg80 <= reg75;
              reg81 <= ({((8'hb5) + (&{reg73})),
                  $signed($signed($unsigned(wire67)))} ~^ ((((^~wire0) ?
                          (^(8'hac)) : wire68) ?
                      (+{reg81, (8'hb4)}) : reg83) ?
                  $signed((((8'hba) >= wire72) ?
                      (reg80 ~^ wire2) : wire63)) : (($signed(reg82) ?
                      $unsigned(wire68) : {reg77, reg83}) >= (8'hb4))));
              reg82 <= $signed((wire3 ?
                  {wire67,
                      $signed((reg80 ? wire69 : wire67))} : (+{(reg74 != wire4),
                      reg66})));
            end
          else
            begin
              reg80 <= (~|{((~&(wire3 & wire4)) ?
                      wire69[(1'h0):(1'h0)] : wire69)});
              reg81 <= ($unsigned(($signed((+wire68)) ?
                      (&$signed(wire68)) : {(reg83 ? reg77 : wire1),
                          (~|reg66)})) ?
                  (~^$unsigned((8'ha4))) : $unsigned($signed((8'hac))));
              reg82 <= wire2;
              reg83 <= {(reg81[(2'h2):(1'h1)] ?
                      $unsigned((+$unsigned(reg77))) : ((8'h9d) ?
                          (wire4[(2'h3):(1'h1)] ?
                              ((8'haa) ?
                                  wire67 : wire2) : $unsigned((8'hb7))) : {reg78}))};
              reg84 <= wire70;
            end
          reg85 <= $unsigned((reg77 && {reg77[(2'h2):(1'h1)]}));
          if (wire67)
            begin
              reg86 <= $unsigned($signed((8'ha9)));
              reg87 <= reg74[(4'h8):(3'h5)];
              reg88 <= $unsigned($unsigned((reg87[(3'h7):(3'h4)] - wire3)));
            end
          else
            begin
              reg86 <= reg88[(4'h9):(3'h5)];
            end
        end
      reg89 <= (8'ha9);
      reg90 <= ($signed({(((8'ha5) | reg80) ?
                  (reg82 ? wire1 : reg80) : reg77[(2'h3):(2'h3)]),
              (&((8'hba) <= reg78))}) ?
          ((($signed((8'hba)) | (reg82 + (8'ha2))) | {$signed(wire63),
              (wire67 - reg73)}) | $signed(((wire2 ? wire3 : reg83) ?
              {reg79} : (~&wire1)))) : wire0[(4'ha):(4'h9)]);
    end
  assign wire91 = $unsigned(reg90);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire10;
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire47,
                 wire10,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire10 = ($unsigned(wire9[(1'h1):(1'h0)]) ~^ {{($unsigned(wire7) * $unsigned(wire6))},
                      $signed((&wire9[(2'h2):(2'h2)]))});
  module11 #() modinst48 (.y(wire47), .wire12(wire6), .wire15(wire9), .wire13(wire7), .clk(clk), .wire14(wire8));
  always
    @(posedge clk) begin
      reg49 <= $signed(wire10);
      reg50 <= (((8'hb7) ?
              (&{wire8[(4'hb):(4'ha)]}) : (((wire8 ?
                  (8'ha3) : reg49) != $signed(wire9)) >> ({wire47} - (wire47 ?
                  wire6 : (8'hbc))))) ?
          wire7 : $unsigned(wire7[(4'h8):(3'h7)]));
      reg51 <= ((8'hb9) & ($unsigned($signed($signed(wire9))) ~^ wire6));
      if ($signed(wire8))
        begin
          reg52 <= wire9[(3'h6):(2'h2)];
          reg53 <= reg49[(4'hb):(2'h3)];
          if ($unsigned(reg53))
            begin
              reg54 <= $signed(wire6[(3'h4):(3'h4)]);
              reg55 <= $signed(wire6[(4'hd):(4'h9)]);
              reg56 <= reg50[(3'h5):(1'h1)];
              reg57 <= $unsigned({{wire9[(3'h4):(1'h1)]}});
              reg58 <= wire8;
            end
          else
            begin
              reg54 <= $unsigned(wire8[(2'h3):(2'h2)]);
              reg55 <= (((!$unsigned((wire6 * (8'h9d)))) ?
                  reg57 : $signed(($unsigned(wire8) ^ reg56))) << wire10);
              reg56 <= {$unsigned((((reg51 ? (8'hae) : reg55) ?
                      wire9[(4'h9):(3'h4)] : $signed(reg52)) ^~ wire47)),
                  (($unsigned(reg55[(3'h6):(2'h3)]) * (~&(wire9 ?
                          wire7 : wire8))) ?
                      (reg58[(5'h10):(3'h7)] ?
                          (~|$signed(reg51)) : ((reg50 ?
                              (8'hbf) : reg55) || reg56)) : (($unsigned(reg58) | (|wire10)) & $signed((~wire6))))};
            end
        end
      else
        begin
          if (wire8[(1'h0):(1'h0)])
            begin
              reg52 <= $signed(reg58[(1'h1):(1'h1)]);
              reg53 <= reg58[(3'h5):(1'h1)];
              reg54 <= (^({$signed($unsigned(reg53))} ?
                  ($signed((+wire8)) ?
                      reg58 : $signed($unsigned(wire10))) : reg50));
              reg55 <= {(wire9 ?
                      (($signed(wire8) && (reg58 ? reg56 : reg50)) ?
                          (((8'ha4) ? (8'hbe) : reg53) ?
                              (reg56 ?
                                  reg55 : wire6) : reg56) : wire10[(3'h5):(2'h3)]) : wire47)};
            end
          else
            begin
              reg52 <= ($unsigned(({(~&reg56), (-reg58)} ?
                      {wire8} : reg56[(1'h0):(1'h0)])) ?
                  reg51 : (!(!(!reg49))));
              reg53 <= $signed($unsigned(reg56[(3'h5):(1'h1)]));
            end
        end
    end
  assign wire59 = {$unsigned((~|$signed($signed(wire6)))), reg51};
  assign wire60 = reg49;
  assign wire61 = reg57[(3'h7):(3'h4)];
  assign wire62 = (reg58 ?
                      $unsigned((-wire60[(2'h2):(2'h2)])) : $signed(reg51));
endmodule

module module11
#(parameter param46 = (((((&(8'had)) >> {(7'h40), (7'h42)}) - (~(&(8'hb0)))) ? (~(((8'h9d) <<< (8'hab)) < ((8'h9e) ? (7'h44) : (8'ha2)))) : (((+(7'h43)) ^ (-(8'ha4))) ? (~&(8'h9d)) : ((^~(8'h9d)) ? (^~(8'h9d)) : ((8'ha9) ? (8'hbd) : (8'hb0))))) ? (((((8'hb0) * (8'hb4)) ? ((8'hac) || (8'hb2)) : ((8'hb6) << (8'hbd))) ? ((8'h9d) - ((8'haf) ? (8'h9c) : (8'ha8))) : (~((7'h42) ~^ (7'h44)))) | ({(&(8'hb9))} > (~&((8'h9d) << (8'had))))) : (((~&{(8'h9f), (8'hb3)}) ? (8'ha0) : ({(7'h44), (8'hb3)} ^~ ((8'ha2) != (8'ha4)))) ? (((~&(7'h41)) ? ((7'h40) ? (8'h9d) : (8'ha2)) : (~&(8'ha4))) >> (~{(8'ha5)})) : (~({(7'h40)} <<< (~&(8'hb2)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire16 = $unsigned(wire13[(2'h3):(2'h2)]);
  assign wire17 = wire13[(3'h5):(1'h0)];
  assign wire18 = wire16[(2'h3):(2'h3)];
  assign wire19 = (~^(wire15[(4'he):(2'h3)] >>> (($signed(wire17) ?
                          $unsigned(wire16) : $unsigned(wire17)) ?
                      (8'ha1) : (wire12[(4'h8):(3'h5)] <= wire15))));
  always
    @(posedge clk) begin
      reg20 <= (|((($unsigned(wire16) ?
          (~|wire13) : wire16[(2'h3):(1'h1)]) * (+(wire14 >= wire13))) | ($unsigned($signed(wire12)) > ((wire12 ?
              wire18 : wire15) ?
          (wire16 != wire17) : (wire14 ? wire12 : (7'h43))))));
      reg21 <= wire13[(2'h2):(1'h1)];
      if ($signed($unsigned(wire16[(2'h3):(1'h1)])))
        begin
          reg22 <= wire14[(1'h0):(1'h0)];
          reg23 <= ((-wire17[(3'h6):(1'h0)]) ? $signed(wire14) : wire18);
          if ($signed(($unsigned((+(8'haf))) ?
              wire18[(2'h3):(2'h3)] : $signed($unsigned(reg22)))))
            begin
              reg24 <= (reg20[(1'h1):(1'h0)] ?
                  (~$unsigned($unsigned($signed(reg23)))) : {reg20});
            end
          else
            begin
              reg24 <= (8'hb9);
              reg25 <= $unsigned((wire14[(4'ha):(3'h6)] << $unsigned(reg24[(1'h0):(1'h0)])));
            end
          reg26 <= {(8'h9f),
              $signed((((^wire19) ? reg24[(1'h0):(1'h0)] : (reg23 >>> reg20)) ?
                  (^~wire15[(1'h1):(1'h1)]) : (!wire14[(1'h1):(1'h1)])))};
        end
      else
        begin
          reg22 <= (wire17 <= $signed(wire12[(4'hc):(4'h9)]));
        end
      reg27 <= $unsigned(({wire18[(1'h0):(1'h0)],
          $unsigned(((8'hbb) ? wire17 : wire14))} << wire12[(4'hb):(4'ha)]));
      reg28 <= reg21;
    end
  assign wire29 = wire19[(4'he):(4'h9)];
  assign wire30 = $signed((8'hb2));
  assign wire31 = wire17;
  assign wire32 = wire16;
  assign wire33 = reg27;
  assign wire34 = {$unsigned({$signed(wire16), $unsigned((-reg20))}), wire15};
  always
    @(posedge clk) begin
      reg35 <= ($signed($unsigned((wire15 - $unsigned(wire12)))) ?
          $unsigned(((|$unsigned((8'hac))) ?
              ((reg27 || reg25) ?
                  reg25 : $signed(wire33)) : $unsigned(reg21))) : ($signed((8'hb1)) < $signed($signed((!wire17)))));
      reg36 <= ((reg28 ?
          ((wire32[(1'h1):(1'h1)] < (^~reg35)) >= (^~(&wire13))) : (8'hbb)) << $signed((~(wire13 | $signed(reg24)))));
      reg37 <= wire16[(1'h1):(1'h1)];
      reg38 <= (wire29[(3'h7):(3'h6)] & reg22);
      reg39 <= $unsigned((-$signed(((reg23 <<< (8'ha6)) ?
          wire19[(1'h0):(1'h0)] : $unsigned(reg24)))));
    end
  always
    @(posedge clk) begin
      reg40 <= {((wire12 & ($signed(reg39) ?
              (wire15 < wire31) : (reg24 ^~ reg26))) ^~ $unsigned((~&(reg37 ^ reg35)))),
          (wire13[(2'h3):(1'h0)] >= reg24[(1'h1):(1'h1)])};
      reg41 <= {$signed($signed($signed((reg24 ? (7'h41) : reg27)))),
          $signed($signed((~reg36)))};
      reg42 <= wire30;
    end
  assign wire43 = ((~|(~^((wire19 ? reg26 : wire13) ~^ (reg26 ?
                      reg39 : wire17)))) >>> $unsigned((reg37 ?
                      $signed(((8'ha3) ? reg36 : reg24)) : (^reg41))));
  assign wire44 = reg26[(3'h5):(1'h0)];
  assign wire45 = $signed({wire44[(1'h0):(1'h0)]});
endmodule
