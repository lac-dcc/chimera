module top
#(parameter param95 = ({(7'h41)} == (7'h41)), 
parameter param96 = ({((~|(^~param95)) ? ((!param95) ? (&param95) : param95) : (param95 & (~param95)))} <= param95))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire75,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg91,
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
                 (1'h0)};
  assign wire4 = $unsigned({$signed((wire1 ? wire1 : (8'hba))), wire1});
  assign wire5 = (wire4 * $unsigned(wire2[(2'h3):(2'h2)]));
  assign wire6 = wire5;
  assign wire7 = {(($signed((&wire2)) ?
                         $signed($unsigned(wire5)) : {(wire0 + wire4),
                             wire6[(5'h11):(5'h11)]}) || $signed({$signed((8'hab))})),
                     ($signed(((wire5 ? wire0 : wire6) ?
                         $signed(wire3) : $signed(wire3))) << wire6[(2'h2):(1'h0)])};
  module8 #() modinst76 (wire75, clk, wire3, wire4, wire6, wire2);
  always
    @(posedge clk) begin
      reg77 <= (~|(8'ha3));
      reg78 <= $signed($unsigned(((~&wire2[(3'h6):(1'h1)]) ?
          wire0[(4'hd):(4'ha)] : wire2)));
      reg79 <= {(8'ha9), wire7};
    end
  always
    @(posedge clk) begin
      reg80 <= wire1;
      reg81 <= (((!(^~((8'ha2) * wire5))) ^ {{$unsigned(reg78),
              (wire75 << (7'h40))}}) - ($signed($signed((8'h9e))) ^ $unsigned(((wire1 ?
              wire7 : wire1) ?
          (reg77 ? reg80 : (8'ha2)) : $signed(wire0)))));
      reg82 <= (wire1 > wire2);
      if (reg78)
        begin
          if (($unsigned(($unsigned((wire7 | reg82)) ?
                  wire5 : {$unsigned((8'hb8))})) ?
              (((8'hb3) ?
                  $signed((wire6 ?
                      reg81 : wire4)) : reg80[(2'h3):(1'h1)]) != (~$unsigned(reg81))) : $unsigned(wire2[(3'h6):(3'h6)])))
            begin
              reg83 <= (reg79[(1'h0):(1'h0)] | $unsigned(reg77[(1'h1):(1'h0)]));
            end
          else
            begin
              reg83 <= {(8'ha7)};
              reg84 <= wire4[(2'h3):(1'h0)];
            end
          reg85 <= reg84[(4'ha):(4'h9)];
          reg86 <= (wire7[(3'h4):(2'h3)] ?
              ($signed((8'ha3)) ?
                  reg82 : $unsigned($unsigned((wire2 ^ wire75)))) : $unsigned((reg80 ?
                  {$unsigned(wire7),
                      wire75[(2'h2):(2'h2)]} : $unsigned((!reg83)))));
          if ((~|wire4))
            begin
              reg87 <= wire75;
              reg88 <= (($unsigned(((-reg80) ?
                      (~(8'ha9)) : (wire6 * (8'hb8)))) & wire5) ?
                  reg83 : {$signed($unsigned($unsigned((8'hba)))),
                      $signed({$signed(wire5)})});
              reg89 <= wire5;
              reg90 <= reg82[(3'h5):(2'h2)];
            end
          else
            begin
              reg87 <= $signed(reg88[(3'h6):(3'h5)]);
              reg88 <= reg89[(4'h9):(2'h2)];
            end
        end
      else
        begin
          reg83 <= (((+wire3[(1'h1):(1'h1)]) ?
              {$unsigned((reg84 ~^ reg88))} : reg83) && reg79[(1'h0):(1'h0)]);
          if (({(wire1[(4'h8):(1'h0)] == (reg84[(4'hb):(1'h0)] && $unsigned((8'ha8))))} ?
              (|(wire3[(2'h2):(1'h0)] == wire4[(3'h4):(1'h1)])) : {wire3[(4'hb):(2'h2)],
                  {reg86}}))
            begin
              reg84 <= $unsigned(((($unsigned(reg84) & (&wire3)) & (+wire6[(1'h1):(1'h1)])) <= (reg81[(3'h5):(3'h5)] ?
                  $signed(reg88) : ($unsigned(reg79) <= (^~wire2)))));
              reg85 <= reg83;
              reg86 <= $unsigned((!(&{reg81})));
              reg87 <= $signed((~|wire1[(3'h4):(1'h0)]));
              reg88 <= reg86[(3'h4):(2'h2)];
            end
          else
            begin
              reg84 <= $signed(($unsigned(reg77) ?
                  (~&((wire5 || wire1) ?
                      (8'hb0) : reg79[(3'h4):(1'h0)])) : wire4));
              reg85 <= wire1;
              reg86 <= reg79[(3'h5):(2'h2)];
            end
        end
      reg91 <= (~reg89[(3'h5):(2'h2)]);
    end
  assign wire92 = ($signed(((~&$signed(reg81)) ?
                          $unsigned((!reg86)) : (8'ha0))) ?
                      $signed((^~($unsigned(reg87) >>> $signed(reg88)))) : wire0);
  assign wire93 = $unsigned({($signed(((8'hb4) ? (8'ha2) : wire0)) ?
                          $signed((8'hbf)) : reg79[(2'h2):(2'h2)])});
  assign wire94 = (~^wire2);
endmodule

module module8
#(parameter param74 = (8'hb0))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire36;
  assign y = {wire73,
                 wire72,
                 wire70,
                 wire39,
                 wire38,
                 wire13,
                 wire14,
                 wire36,
                 (1'h0)};
  assign wire13 = wire12[(2'h2):(2'h2)];
  assign wire14 = (8'ha3);
  module15 #() modinst37 (.y(wire36), .clk(clk), .wire18(wire9), .wire20(wire12), .wire17(wire11), .wire19(wire13), .wire16(wire14));
  assign wire38 = $unsigned((($signed((wire36 - wire10)) - wire11[(4'h9):(4'h8)]) - ((!{wire14}) == $signed($unsigned(wire11)))));
  assign wire39 = ((wire38 ?
                      {wire10[(3'h5):(3'h4)]} : $signed((wire36 ?
                          (wire36 ?
                              wire36 : wire10) : wire11))) == $signed($signed(wire12)));
  module40 #() modinst71 (.wire44(wire36), .y(wire70), .wire42(wire13), .wire43(wire39), .clk(clk), .wire41(wire11));
  assign wire72 = {$unsigned((~^wire11[(2'h3):(1'h1)])),
                      wire36[(5'h11):(2'h2)]};
  assign wire73 = {$unsigned(wire12)};
endmodule

module module40
#(parameter param69 = (8'ha0))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire44;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
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
                 wire45,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire45 = wire41;
  assign wire46 = $unsigned($unsigned($signed((wire45[(3'h7):(2'h2)] ~^ (wire42 ?
                      wire45 : wire44)))));
  assign wire47 = wire42;
  assign wire48 = ({(+wire47[(4'ha):(1'h1)])} == (~&$unsigned(((wire44 ?
                          wire44 : wire43) ?
                      $signed(wire41) : (wire43 ^~ wire44)))));
  assign wire49 = (wire42[(3'h6):(3'h4)] ?
                      (&$unsigned(((-wire46) ?
                          $unsigned((7'h43)) : (wire46 ?
                              wire46 : wire44)))) : ($signed(wire42) != $unsigned($signed(wire45))));
  assign wire50 = $signed((-$signed((8'ha9))));
  assign wire51 = wire44[(5'h12):(3'h4)];
  assign wire52 = ({$unsigned($unsigned((wire45 ? (8'hbc) : wire49))),
                      wire45[(2'h3):(2'h2)]} - (({((8'had) ? wire51 : wire46),
                          ((8'hba) && wire42)} ?
                      {(wire49 ? wire49 : wire42),
                          $unsigned(wire50)} : $signed((wire45 <<< wire43))) >= $unsigned(((wire44 ?
                          wire50 : wire45) ?
                      {wire46} : wire50))));
  assign wire53 = (($unsigned((~|$unsigned(wire48))) && $unsigned($signed(wire48[(4'h9):(3'h7)]))) ^~ $unsigned({((wire43 * (8'hbf)) ?
                          wire47[(3'h4):(1'h0)] : (8'ha6)),
                      (wire51[(4'h9):(3'h4)] ?
                          $unsigned(wire42) : (wire44 < wire46))}));
  assign wire54 = (~^{(($signed(wire52) ?
                          {wire45} : (^~wire41)) << (wire48[(1'h1):(1'h1)] ?
                          wire43 : (+wire53)))});
  assign wire55 = wire41;
  assign wire56 = ({wire49[(3'h5):(2'h3)],
                      $signed((~&$signed(wire52)))} ~^ $signed((~&(^wire43[(3'h5):(3'h4)]))));
  assign wire57 = $unsigned(wire51);
  assign wire58 = (^~(8'hae));
  assign wire59 = {($unsigned((|{wire45})) == $unsigned(((wire52 > wire44) ?
                          $unsigned(wire56) : $signed(wire53)))),
                      (wire58[(2'h2):(1'h0)] || $signed(wire48[(3'h7):(1'h0)]))};
  assign wire60 = $unsigned((-wire44[(5'h12):(2'h3)]));
  always
    @(posedge clk) begin
      reg61 <= wire42[(4'he):(2'h2)];
      reg62 <= (^$signed({(~$signed(wire48))}));
      reg63 <= $signed((wire47[(4'hf):(4'he)] ^ $signed(((wire56 ?
          wire44 : wire45) ^ (wire52 ? wire49 : (8'ha1))))));
    end
  assign wire64 = {($signed($signed($signed(reg62))) ?
                          {(+$signed(wire54)),
                              {wire42}} : reg63[(1'h0):(1'h0)]),
                      ($unsigned(((~&wire48) && $unsigned(wire43))) ?
                          wire45[(2'h3):(1'h0)] : (8'hb8))};
  assign wire65 = wire48[(5'h10):(3'h4)];
  assign wire66 = ($signed({(wire49[(4'hb):(3'h4)] || (wire51 | wire53)),
                          $unsigned((!wire55))}) ?
                      wire59 : (!$signed($signed($unsigned(wire45)))));
  assign wire67 = reg63[(3'h7):(3'h6)];
  assign wire68 = wire50[(2'h2):(1'h0)];
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire23,
                 wire22,
                 wire21,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = wire20;
  assign wire22 = $signed($unsigned($unsigned((((8'hb3) + wire18) ?
                      ((8'hbe) - wire19) : $signed(wire17)))));
  assign wire23 = (^$unsigned(wire21[(4'h8):(3'h5)]));
  always
    @(posedge clk) begin
      reg24 <= wire17;
      reg25 <= (8'ha7);
      reg26 <= $unsigned((!($signed({wire19, reg24}) ?
          $signed({wire23, (8'hb9)}) : {$unsigned(wire23),
              (wire22 != wire21)})));
    end
  assign wire27 = (|$signed($unsigned({$signed(wire16), $unsigned(wire21)})));
  assign wire28 = ({wire18[(4'hb):(4'hb)],
                      $signed($unsigned(wire23[(4'he):(4'he)]))} <= reg24[(1'h1):(1'h0)]);
  assign wire29 = ({reg25[(1'h0):(1'h0)],
                      $signed(((wire20 << wire21) ^ wire22[(1'h1):(1'h0)]))} ^ reg24[(2'h3):(2'h3)]);
  assign wire30 = $signed({($signed($unsigned(wire19)) ?
                          (wire17[(1'h1):(1'h0)] ~^ $unsigned((8'hb8))) : reg25),
                      wire29});
  assign wire31 = {$signed((((wire17 ? wire30 : (8'hb9)) ?
                              wire18 : $unsigned(wire28)) ?
                          $signed(wire23[(4'h8):(4'h8)]) : $signed(wire16[(5'h11):(4'hf)])))};
  assign wire32 = (($unsigned(((wire18 ? wire30 : wire21) ?
                          (|wire30) : (-wire29))) ?
                      (($signed(wire18) ?
                          (wire20 ?
                              (8'h9f) : wire28) : wire22[(1'h0):(1'h0)]) <= $signed({wire17})) : wire28[(3'h4):(1'h1)]) >>> wire23);
  assign wire33 = $signed(wire27);
  assign wire34 = $unsigned((((&$signed(wire31)) >>> $unsigned((wire23 ^~ wire20))) ?
                      (~^(8'h9f)) : $unsigned(($signed(wire21) ?
                          wire23[(2'h3):(1'h0)] : wire28[(2'h2):(2'h2)]))));
  assign wire35 = reg26;
endmodule
