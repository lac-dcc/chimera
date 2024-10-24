module top
#(parameter param92 = {(~^(&(~|(-(8'ha3)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire72,
                 wire47,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = {(wire2 ?
                         $signed((-$unsigned(wire1))) : (wire2[(3'h4):(1'h0)] ?
                             (~wire1) : $signed($signed(wire3)))),
                     wire2[(2'h3):(1'h1)]};
  assign wire5 = $unsigned(($unsigned((^~(|wire4))) + $unsigned((+$unsigned(wire3)))));
  assign wire6 = ((!$unsigned((|((8'ha1) ^ (8'ha6))))) | $signed(((!$unsigned(wire4)) ?
                     {(~&wire4)} : {((8'ha6) < wire2), {wire3}})));
  module7 #() modinst48 (.y(wire47), .wire9(wire5), .wire10(wire1), .wire8(wire0), .clk(clk), .wire11(wire4));
  module49 #() modinst73 (wire72, clk, wire47, wire1, wire3, wire6);
  always
    @(posedge clk) begin
      if ($unsigned(wire72))
        begin
          if (wire4[(3'h6):(2'h2)])
            begin
              reg74 <= {(~({$unsigned(wire1),
                      (~&wire3)} != (~((8'had) >>> wire72)))),
                  (($unsigned((+wire3)) - (^~wire0[(5'h11):(4'h8)])) ~^ $signed($unsigned(wire5)))};
              reg75 <= (&$unsigned((({wire3, wire0} ^ {wire1, wire0}) ?
                  ($unsigned(wire5) ?
                      wire4 : wire1[(3'h5):(1'h1)]) : $unsigned((wire2 || wire1)))));
              reg76 <= (8'ha8);
              reg77 <= (|(~$unsigned($signed($signed(wire3)))));
            end
          else
            begin
              reg74 <= wire6[(4'hb):(4'hb)];
              reg75 <= (-$unsigned({(~(wire47 != wire4)),
                  $signed((reg76 ? reg76 : wire2))}));
              reg76 <= (wire0[(4'hb):(4'h9)] ?
                  $signed($unsigned($unsigned({wire2}))) : $unsigned((8'ha9)));
              reg77 <= (+wire6);
            end
          reg78 <= wire2;
          if (({(wire0 == (-(wire72 < reg75)))} >> wire5))
            begin
              reg79 <= (wire0 && wire0);
              reg80 <= reg76[(3'h6):(2'h2)];
              reg81 <= $unsigned($unsigned({($unsigned(wire4) > (&reg74)),
                  $signed(wire5[(4'hc):(3'h6)])}));
            end
          else
            begin
              reg79 <= reg76[(1'h0):(1'h0)];
              reg80 <= $unsigned((&$unsigned((^(&(8'ha1))))));
              reg81 <= $signed(($signed($signed((reg74 << wire4))) == wire6));
            end
          reg82 <= $unsigned($unsigned((8'had)));
          if ($unsigned(reg81))
            begin
              reg83 <= reg80[(1'h1):(1'h0)];
              reg84 <= ((8'ha2) || reg82);
            end
          else
            begin
              reg83 <= (|reg82);
              reg84 <= (+wire0[(1'h1):(1'h0)]);
              reg85 <= {(wire72[(1'h0):(1'h0)] ?
                      (reg80[(2'h2):(1'h1)] ?
                          reg82 : $signed(((8'hb3) ^ wire3))) : reg81),
                  (8'hba)};
              reg86 <= $signed((~|$signed({wire3, wire72[(2'h2):(2'h2)]})));
              reg87 <= ($signed((&reg85)) || (reg76 <= reg80));
            end
        end
      else
        begin
          reg74 <= $signed(reg83[(1'h1):(1'h0)]);
          if ({reg83, wire0})
            begin
              reg75 <= $signed(wire0);
              reg76 <= reg83[(3'h5):(1'h0)];
            end
          else
            begin
              reg75 <= ($signed((^reg74)) ?
                  {{wire2[(3'h6):(3'h6)]},
                      {reg77[(1'h1):(1'h1)]}} : (-((~|(wire3 * reg75)) || (~|(wire2 ?
                      reg78 : wire6)))));
            end
        end
    end
  assign wire88 = (reg87[(4'h9):(2'h2)] << {$signed((wire47 ?
                          reg84[(4'h8):(1'h1)] : {wire6}))});
  assign wire89 = $unsigned($unsigned(wire6));
  assign wire90 = (^$signed({(~&reg78)}));
  assign wire91 = $signed($signed($unsigned($unsigned((wire88 ?
                      (8'hb3) : (8'hac))))));
endmodule

module module49
#(parameter param70 = {(((((8'hbd) ? (8'ha3) : (8'hbd)) ? (~&(8'hb4)) : {(8'ha0)}) > {((8'haf) + (7'h41))}) << ((((7'h42) ? (8'ha6) : (8'hb7)) ? (&(8'h9e)) : ((8'hb4) >> (8'h9e))) ? (^~((8'hb2) <<< (8'hbf))) : (((8'ha3) & (8'hb7)) ? (~(8'hb5)) : (~(8'haf)))))}, 
parameter param71 = ((param70 ? (((~param70) > {param70}) ? ((~param70) ? (param70 == (8'hac)) : (param70 != (8'hb3))) : ((8'ha7) & param70)) : param70) << (~|param70)))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire53;
  input wire [(5'h14):(1'h0)] wire52;
  input wire [(4'h8):(1'h0)] wire51;
  input wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  assign y = {wire69,
                 wire68,
                 wire67,
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
                 (1'h0)};
  assign wire54 = $signed((!wire51));
  assign wire55 = (8'h9e);
  assign wire56 = ((((8'hbc) * $signed($unsigned(wire53))) ?
                          wire52[(2'h2):(1'h0)] : wire55) ?
                      $unsigned(wire53[(3'h7):(3'h5)]) : $unsigned($unsigned(($signed(wire53) >> (wire55 | wire53)))));
  assign wire57 = wire51;
  assign wire58 = wire53;
  assign wire59 = {(wire55 * wire50[(3'h4):(3'h4)]), wire50[(3'h4):(1'h0)]};
  assign wire60 = (((~|((wire56 ?
                      wire56 : wire56) || (~|wire59))) + wire52[(4'hf):(4'hf)]) != {$unsigned((~$signed(wire52))),
                      ($unsigned((wire51 != wire56)) ?
                          ((wire52 ? wire54 : (8'hb0)) ?
                              wire50[(2'h3):(2'h3)] : $signed(wire59)) : (((8'ha1) ?
                              wire50 : (8'hbe)) << (wire59 ?
                              wire55 : wire57)))});
  assign wire61 = ((^wire53) & (^$signed(wire60)));
  assign wire62 = $signed({wire60});
  assign wire63 = (|((((wire60 ? wire61 : wire60) - $unsigned(wire56)) ?
                      wire52 : wire53) >>> $signed(((wire59 ? wire59 : wire56) ?
                      (wire59 ? wire61 : wire60) : (wire62 ?
                          (8'had) : wire59)))));
  assign wire64 = ($unsigned((8'hb3)) ?
                      wire56 : ((((~|wire53) && $unsigned(wire58)) ?
                          $unsigned(wire62[(3'h6):(1'h0)]) : (|(wire63 * wire56))) ^~ ($unsigned((-wire54)) - ((wire59 ?
                          wire59 : wire60) > {(7'h40), wire61}))));
  assign wire65 = (~^($unsigned(((wire58 ~^ wire54) ^ $unsigned(wire55))) ?
                      $unsigned((~&(wire57 <= wire56))) : $unsigned(($signed(wire63) ?
                          $signed(wire59) : $unsigned(wire58)))));
  assign wire66 = $signed($unsigned($unsigned(($signed(wire61) ?
                      wire50 : $signed(wire59)))));
  assign wire67 = $signed(((((wire64 ? (7'h41) : wire64) ?
                              {wire64, wire63} : (-wire66)) ?
                          $unsigned(wire50[(1'h0):(1'h0)]) : {(!wire61),
                              wire50[(1'h0):(1'h0)]}) ?
                      {(~|wire61),
                          ((wire56 ?
                              (8'hb4) : wire65) && $unsigned(wire60))} : {wire58[(1'h1):(1'h1)],
                          (((8'h9e) || wire54) ^ wire57)}));
  assign wire68 = ($signed(wire58[(1'h0):(1'h0)]) ?
                      $unsigned($signed(wire64)) : {($unsigned((~|(8'hae))) == wire56[(5'h13):(5'h13)])});
  assign wire69 = $signed($signed(wire58[(2'h3):(1'h1)]));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire38;
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire38,
                 (1'h0)};
  assign wire12 = wire11;
  assign wire13 = ((&(~^wire8[(5'h11):(4'ha)])) | wire10[(2'h2):(1'h0)]);
  assign wire14 = wire9;
  assign wire15 = $unsigned((-{$unsigned(wire11[(1'h1):(1'h1)]),
                      (^~$unsigned(wire11))}));
  assign wire16 = wire12[(1'h1):(1'h1)];
  assign wire17 = {(wire13[(4'h8):(1'h0)] != ({((7'h44) | wire10),
                          ((7'h42) ^~ wire15)} >= $unsigned((8'hb9))))};
  assign wire18 = wire9[(3'h5):(1'h0)];
  assign wire19 = $signed($signed((wire17[(2'h3):(1'h0)] ?
                      wire13 : ((wire9 ? wire11 : (8'ha4)) <= (~|wire11)))));
  assign wire20 = (wire15 ?
                      {$signed($unsigned((wire12 ? wire19 : wire10))),
                          wire19[(4'he):(4'h9)]} : {(!(wire8 ?
                              $unsigned(wire14) : (-wire9))),
                          {wire15}});
  assign wire21 = {$signed($unsigned(((-wire8) <<< $signed((8'ha4))))),
                      $signed($signed({$signed(wire20)}))};
  module22 #() modinst39 (wire38, clk, wire17, wire14, wire13, wire8, wire20);
  assign wire40 = (wire19 || (~|(wire9 ?
                      wire21[(1'h1):(1'h0)] : $unsigned((wire13 ?
                          wire19 : wire17)))));
  assign wire41 = (7'h42);
  assign wire42 = (~^$unsigned($unsigned({(wire41 - wire16)})));
  assign wire43 = $unsigned((-{wire13, {(8'hb1)}}));
  assign wire44 = wire13;
  assign wire45 = (-(-$signed((|wire18[(5'h13):(4'hf)]))));
  assign wire46 = wire12[(2'h2):(2'h2)];
endmodule

module module22
#(parameter param36 = ({(~^{(~&(8'hb7))})} == {(^(((8'hb7) ? (8'ha3) : (8'hb2)) ? (|(7'h44)) : (&(7'h42))))}), 
parameter param37 = ((({param36, (param36 - param36)} & (param36 ? (param36 ^~ param36) : (+param36))) && ((!(param36 ? param36 : param36)) << ((param36 ? param36 : param36) - {(8'hb8), param36}))) >>> {(~^(param36 && {(8'had)})), (param36 > ((8'hb1) > {param36}))}))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire28 = $signed(wire25);
  assign wire29 = $signed((wire23[(3'h6):(3'h6)] == wire25[(4'h9):(4'h9)]));
  always
    @(posedge clk) begin
      reg30 <= ((((&$signed(wire26)) ~^ $unsigned({wire26})) ?
              (wire23 ^ {{wire26,
                      wire24}}) : $unsigned($signed(wire24[(1'h0):(1'h0)]))) ?
          {wire26, wire25[(2'h3):(1'h0)]} : $unsigned((8'had)));
      reg31 <= wire28;
      reg32 <= ($signed((wire28[(3'h5):(3'h5)] + reg31[(2'h2):(2'h2)])) ?
          {reg31[(2'h2):(1'h1)]} : ($signed((reg30[(1'h0):(1'h0)] >> (wire24 < wire24))) ^ ((((7'h42) * (8'hbb)) ?
                  $unsigned(wire25) : (reg30 ^~ wire29)) ?
              {(^reg31), (~|reg31)} : ({wire26} | $signed(wire23)))));
    end
  assign wire33 = (-$signed($signed(($signed(reg30) ^ (wire23 ?
                      wire27 : (8'hbe))))));
  assign wire34 = (wire23[(1'h1):(1'h1)] ?
                      {wire26[(3'h4):(2'h3)],
                          $signed($unsigned((-reg30)))} : $signed({(!wire26)}));
  assign wire35 = $signed(($unsigned(wire33[(3'h4):(1'h1)]) ?
                      (($unsigned(reg30) ?
                          $unsigned(reg32) : reg32[(3'h6):(1'h0)]) | ((~wire34) ?
                          wire29 : {wire27})) : $unsigned(($signed(wire28) ?
                          wire23 : ((8'ha6) * wire25)))));
endmodule
