module top
#(parameter param123 = ((^~{(((8'hb9) >= (8'hbb)) == (8'hab))}) ^~ (((((8'hac) ? (8'ha4) : (8'hbf)) ? ((7'h41) ~^ (8'hb5)) : ((8'ha7) ? (7'h44) : (8'haa))) ? {(8'ha7), ((8'hae) != (7'h40))} : ((~|(8'ha8)) | ((8'ha5) ? (8'hb6) : (8'ha3)))) >= ((((7'h41) ~^ (8'hb4)) ? ((8'hbe) ~^ (8'hb4)) : ((7'h42) - (8'hab))) ? (^((8'hb4) != (8'ha3))) : ((^~(8'hb3)) <= {(8'hae), (8'hab)})))), 
parameter param124 = param123)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  assign y = {wire121,
                 wire16,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = (((wire3[(3'h4):(3'h4)] ?
                     {(wire4 >> wire1),
                         (wire2 && wire2)} : wire0) != (|wire4[(3'h7):(3'h4)])) * ((&(wire2[(4'h9):(4'h8)] ?
                     (-wire3) : {wire2, wire3})) <= ($signed((wire3 ?
                     wire0 : wire4)) ^ (8'hb4))));
  always
    @(posedge clk) begin
      reg6 <= $signed((-wire1));
      reg7 <= wire2[(2'h2):(2'h2)];
      if (wire0[(3'h4):(3'h4)])
        begin
          if (wire2)
            begin
              reg8 <= ($unsigned((wire0 == (reg6[(4'hb):(3'h5)] ^ $signed(wire2)))) || ({reg7[(4'hd):(4'hc)],
                      ({reg7} && wire1)} ?
                  $unsigned(wire4) : $unsigned($unsigned((reg7 << (8'hbd))))));
            end
          else
            begin
              reg8 <= {(&reg6),
                  ((~&reg6[(4'he):(3'h5)]) ?
                      ((^~(+reg6)) ?
                          (reg8[(2'h2):(2'h2)] ?
                              {reg6} : wire3[(4'h8):(4'h8)]) : ((reg6 ?
                              (8'ha4) : wire0) ~^ (8'h9f))) : (~((8'hb1) - (reg8 && wire2))))};
            end
          if ($unsigned(wire3))
            begin
              reg9 <= reg6;
              reg10 <= ({reg6[(1'h1):(1'h1)],
                  wire2} + $signed($signed((~^$signed((8'hbd))))));
              reg11 <= ({(|($unsigned(reg7) ? (^~reg6) : (reg7 != wire2))),
                  (!$signed((wire3 < (8'ha0))))} ~^ $unsigned(reg9[(4'h8):(3'h6)]));
            end
          else
            begin
              reg9 <= (~|{($unsigned($unsigned(wire2)) == wire3), wire0});
              reg10 <= ($unsigned(($unsigned($unsigned(reg8)) ?
                      wire2[(2'h3):(2'h3)] : ((~^wire3) << (~&(8'hb4))))) ?
                  ((wire0[(1'h1):(1'h0)] | reg7[(4'he):(4'he)]) >= (wire2[(2'h2):(1'h0)] < $unsigned(reg8))) : wire4);
              reg11 <= {((~&(reg8[(1'h1):(1'h0)] ? (|(8'hb3)) : (7'h41))) ?
                      $signed($signed((-wire3))) : {($signed(wire2) ?
                              (~^reg8) : {reg9, wire3})})};
            end
          reg12 <= reg9[(3'h7):(1'h0)];
          reg13 <= reg6[(4'h9):(1'h1)];
          reg14 <= (-reg13[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg14[(2'h3):(2'h2)])
            begin
              reg8 <= (~&({(~reg8)} < $signed($unsigned((wire2 | reg12)))));
            end
          else
            begin
              reg8 <= wire5[(3'h6):(3'h6)];
              reg9 <= reg9;
              reg10 <= wire3[(2'h2):(1'h0)];
              reg11 <= ({$unsigned((|$unsigned(reg8)))} << (8'ha3));
            end
        end
      reg15 <= $signed(reg6);
    end
  assign wire16 = $signed(({reg13, {reg8[(4'h9):(2'h3)]}} ?
                      ($signed({wire3,
                          reg11}) ^ $signed((reg7 != wire2))) : $unsigned((((8'hb5) ?
                          reg11 : reg8) >>> (wire5 ? wire5 : wire4)))));
  module17 #() modinst122 (wire121, clk, reg12, wire3, reg11, wire4, reg8);
endmodule

module module17
#(parameter param119 = (^((~|(-(-(8'hbf)))) ? (~&({(8'haa), (7'h42)} ? (~^(8'hb9)) : ((7'h41) ? (8'hb0) : (7'h40)))) : (-{{(8'haa), (8'ha5)}}))), 
parameter param120 = param119)
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire47;
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  assign y = {wire118,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  module23 #() modinst48 (.y(wire47), .wire27(wire19), .clk(clk), .wire24(wire18), .wire26(wire22), .wire28(wire20), .wire25(wire21));
  assign wire49 = wire19[(4'hd):(4'ha)];
  assign wire50 = $unsigned($signed(wire20));
  assign wire51 = wire22[(3'h7):(2'h2)];
  assign wire52 = {(($unsigned((wire47 & wire51)) ?
                          $unsigned((&wire49)) : ($unsigned((8'had)) ?
                              wire51 : (wire51 - (8'hbd)))) <<< (wire20[(2'h3):(1'h0)] >> (~&{wire49,
                          wire50}))),
                      {wire21[(3'h4):(1'h0)]}};
  module53 #() modinst69 (wire68, clk, wire52, wire50, wire49, wire22);
  assign wire70 = $signed($unsigned($unsigned((^wire47[(1'h0):(1'h0)]))));
  assign wire71 = (wire51[(2'h2):(1'h1)] ?
                      (!$signed($signed($signed(wire20)))) : wire49[(4'hc):(3'h6)]);
  assign wire72 = ({$signed({$unsigned(wire52), $unsigned(wire21)})} ?
                      wire68 : $signed($unsigned((wire18 ?
                          (wire50 ? wire50 : wire70) : wire68))));
  module73 #() modinst97 (wire96, clk, wire20, wire18, wire19, wire22);
  assign wire98 = $signed(wire71);
  assign wire99 = $unsigned((~|(8'hb5)));
  assign wire100 = ((|$signed(($unsigned(wire51) ?
                       wire71[(2'h3):(1'h1)] : $unsigned(wire99)))) ~^ (wire71 ?
                       ({((8'ha2) ? (8'hbe) : wire50)} ?
                           wire50 : ((wire22 ? wire22 : wire22) <= (wire21 ?
                               wire72 : wire52))) : (~$signed({wire19}))));
  assign wire101 = {(wire47[(1'h0):(1'h0)] && (~|wire21)),
                       $unsigned((wire68[(2'h2):(1'h1)] ?
                           ((!wire71) ?
                               $unsigned(wire99) : (8'ha4)) : $signed((wire49 ^~ wire47))))};
  always
    @(posedge clk) begin
      reg102 <= (((((wire21 <= wire22) ?
              ((8'h9e) ^ (8'ha3)) : (~|wire70)) > wire49) ?
          (7'h41) : wire98[(3'h4):(1'h0)]) ~^ (~|(wire19[(2'h2):(2'h2)] ?
          (((7'h43) && wire72) ? (+wire71) : wire101) : (~(wire52 > wire52)))));
      if ($signed((+(({(8'hb4), wire22} && (wire96 && wire18)) ?
          $unsigned($unsigned(wire51)) : wire21[(1'h0):(1'h0)]))))
        begin
          if ($signed((~^$signed((^wire71[(2'h2):(1'h1)])))))
            begin
              reg103 <= wire98[(1'h1):(1'h1)];
            end
          else
            begin
              reg103 <= $unsigned(($signed(wire49) ^ reg102[(1'h0):(1'h0)]));
              reg104 <= (&(^~{(~&wire20)}));
              reg105 <= $signed(wire71[(2'h3):(1'h1)]);
            end
          if ((+(!reg103)))
            begin
              reg106 <= ($signed(reg104) << $unsigned(reg105));
              reg107 <= $unsigned(((~(8'hb0)) ?
                  wire52[(4'hd):(1'h1)] : (({(7'h41)} ?
                          wire68[(4'ha):(1'h0)] : wire96[(2'h2):(1'h1)]) ?
                      wire68 : ({reg103} ?
                          $unsigned(wire52) : (wire72 ? wire22 : reg106)))));
            end
          else
            begin
              reg106 <= $signed((!$signed((8'haa))));
            end
          reg108 <= $unsigned({{reg106[(4'h9):(1'h0)]}, wire19[(1'h1):(1'h1)]});
        end
      else
        begin
          reg103 <= {$signed($signed((-$unsigned(wire19))))};
        end
    end
  always
    @(posedge clk) begin
      reg109 <= {$unsigned(($signed($signed((7'h41))) >= ({wire20} ?
              (wire21 ? reg107 : reg106) : $unsigned((8'hb9)))))};
      if (wire99[(4'h8):(3'h4)])
        begin
          reg110 <= wire21[(4'hc):(1'h0)];
          reg111 <= wire22;
          reg112 <= reg105;
          reg113 <= ($unsigned((8'h9e)) >= $unsigned((8'hb4)));
        end
      else
        begin
          if ((wire21 ?
              $signed((((reg112 & wire101) ?
                  (reg103 ?
                      wire70 : (7'h41)) : ((7'h40) + wire99)) << $unsigned((~wire19)))) : reg102[(3'h7):(3'h4)]))
            begin
              reg110 <= $unsigned(({{(reg111 > reg104)}} & $signed(((reg106 ?
                      reg102 : reg110) ?
                  $unsigned(reg104) : {wire96, wire101}))));
              reg111 <= wire19;
              reg112 <= ((wire96[(3'h5):(1'h1)] ?
                      reg104[(1'h1):(1'h1)] : wire72) ?
                  ($signed(((wire51 < reg105) <<< wire70[(2'h2):(2'h2)])) && $signed(({wire72,
                          wire19} ?
                      (wire100 ?
                          wire18 : wire98) : (reg103 == wire50)))) : (((^(~^wire70)) ?
                          wire49 : ((reg108 >= reg104) ?
                              wire98[(1'h0):(1'h0)] : $unsigned((8'haf)))) ?
                      $signed(((wire72 ?
                          wire47 : wire18) ^ (8'hb9))) : reg103));
            end
          else
            begin
              reg110 <= {reg113};
              reg111 <= ($signed(($signed(wire22[(3'h4):(3'h4)]) ?
                      $signed((wire18 ~^ reg102)) : $unsigned(reg107[(3'h6):(3'h6)]))) ?
                  $unsigned(((8'ha8) * $signed(((8'hb4) ?
                      wire72 : wire99)))) : $unsigned($unsigned(($signed(wire51) ?
                      $unsigned((8'hb0)) : (~&wire18)))));
              reg112 <= $unsigned($signed((($unsigned(wire21) ~^ ((8'ha1) && reg107)) ?
                  $unsigned($signed(wire52)) : (wire22 ?
                      $signed(reg113) : (wire19 < (8'h9e))))));
              reg113 <= wire99[(4'ha):(1'h1)];
            end
          reg114 <= reg106;
          reg115 <= $unsigned({wire99[(3'h5):(2'h2)]});
        end
      reg116 <= (|($signed(($unsigned(reg103) ?
              (wire70 ? (7'h40) : reg102) : {(8'h9f), wire96})) ?
          wire22[(4'hd):(4'hb)] : ($signed(wire101) ?
              ({reg108, (8'hb9)} ~^ (wire19 ? wire49 : reg109)) : reg106)));
      reg117 <= wire100;
    end
  assign wire118 = {$unsigned(wire72),
                       $unsigned((-($unsigned(reg104) ~^ (reg117 * wire98))))};
endmodule

module module73
#(parameter param95 = ((({((8'hb3) ? (8'hab) : (8'hb5)), (8'hac)} ? (~|(|(7'h40))) : (((8'ha1) >= (7'h44)) ? (~|(8'hae)) : (|(8'had)))) ? ((((8'ha7) + (8'ha9)) >>> {(8'hb3), (8'hb5)}) ? (^~(~&(8'ha0))) : (((8'ha6) <= (8'ha6)) != ((8'h9f) - (7'h41)))) : ({(8'haa), (8'hba)} << ({(8'hbf)} ? (8'h9f) : ((8'hae) ? (8'had) : (7'h43))))) || (8'hb0)))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire77;
  input wire signed [(5'h15):(1'h0)] wire76;
  input wire signed [(5'h10):(1'h0)] wire75;
  input wire signed [(5'h13):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire76)
        begin
          if (wire74)
            begin
              reg78 <= ({$signed(($signed(wire75) ?
                      wire74[(3'h7):(1'h1)] : wire77[(4'hb):(4'hb)])),
                  $unsigned($unsigned((|wire77)))} >= ((~|{(~wire76),
                  $unsigned(wire75)}) <= $signed($signed($unsigned((7'h41))))));
              reg79 <= reg78[(2'h2):(1'h0)];
              reg80 <= $unsigned({$signed((!wire74[(2'h3):(1'h0)]))});
              reg81 <= reg79;
            end
          else
            begin
              reg78 <= (+((~|$unsigned((&wire77))) ~^ wire75[(4'hd):(4'hb)]));
              reg79 <= reg80;
              reg80 <= (^((((~|wire77) + wire74[(4'hc):(1'h1)]) + ($unsigned(wire76) || wire76[(3'h5):(3'h4)])) ?
                  reg80 : $unsigned($signed($unsigned(reg78)))));
            end
          reg82 <= $signed(wire74);
          reg83 <= reg82[(4'hd):(4'h9)];
          reg84 <= (reg83[(3'h5):(2'h2)] ?
              ((+$signed((reg82 ?
                  wire75 : reg79))) == $signed({wire76})) : ((-wire77) ~^ ((reg83 > (reg81 ?
                  reg80 : wire75)) ^ $signed(wire75))));
          reg85 <= $signed(wire76[(1'h1):(1'h1)]);
        end
      else
        begin
          if ({($signed($unsigned((reg84 < reg85))) ?
                  {{(reg79 ? wire74 : reg85)},
                      reg79[(3'h6):(2'h3)]} : $unsigned({$signed(reg81)})),
              (~|$unsigned(((wire76 != reg84) ?
                  $unsigned((8'hb7)) : (wire75 ? reg85 : reg83))))})
            begin
              reg78 <= {($signed($signed($signed(reg85))) & (+((reg78 ?
                      reg84 : (8'h9f)) >> (reg83 ? wire77 : reg82))))};
              reg79 <= {$signed(wire74[(3'h6):(3'h6)])};
              reg80 <= wire77;
              reg81 <= $unsigned((reg80[(2'h3):(2'h3)] == ($unsigned((~reg81)) ?
                  $signed((reg83 ?
                      wire77 : reg85)) : (!wire75[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg78 <= reg82[(2'h2):(2'h2)];
              reg79 <= (~|(wire74 ?
                  (($signed(wire76) ?
                          (reg80 ? reg83 : reg85) : ((8'hac) ? reg81 : reg84)) ?
                      $signed(wire76) : (reg85[(2'h3):(1'h1)] && (reg81 + wire76))) : $signed(reg83[(1'h0):(1'h0)])));
            end
          reg82 <= $unsigned($unsigned($signed($unsigned(reg83))));
          reg83 <= wire76[(2'h2):(1'h0)];
        end
      reg86 <= reg82;
      reg87 <= {{(((~|reg80) ?
                  (reg81 ? reg81 : reg84) : $unsigned((8'hb9))) ^~ reg86),
              {reg85[(2'h3):(1'h1)]}}};
      reg88 <= wire77;
      reg89 <= (|($signed($signed((~wire76))) >>> wire74[(4'hb):(2'h3)]));
    end
  assign wire90 = (((!(-$signed(reg85))) >>> (8'had)) ?
                      ((8'ha3) ^~ (reg79 ?
                          $signed((reg82 ?
                              reg89 : reg78)) : $unsigned(reg84[(4'h9):(3'h4)]))) : reg80[(2'h3):(2'h3)]);
  assign wire91 = $unsigned(reg80);
  assign wire92 = $signed(($unsigned((reg80[(2'h3):(2'h3)] + (wire75 ^~ reg88))) ?
                      $unsigned($unsigned($unsigned((8'ha7)))) : $signed(((reg78 ?
                          reg81 : reg88) >> wire76))));
  assign wire93 = $signed((^$signed((((8'ha0) <<< (8'hb5)) == wire77))));
  assign wire94 = $unsigned($signed(wire93));
endmodule

module module53
#(parameter param66 = {(8'hb6)}, 
parameter param67 = ((param66 ? (^(param66 ? (|param66) : (param66 <<< param66))) : (({param66, (8'hae)} << param66) ^ (~&(!(8'ha8))))) < ((^~(^~(param66 ^~ param66))) < (((!param66) ? (param66 < param66) : (^param66)) ? ((param66 ? param66 : param66) >= {(8'ha7)}) : {(param66 ? param66 : (8'ha7))}))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  input wire [(4'ha):(1'h0)] wire55;
  input wire [(4'hf):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire58 = {$signed(($signed(wire55[(3'h4):(2'h3)]) < $unsigned({(8'ha5),
                          wire55}))),
                      (wire55 ~^ (((~&wire55) ?
                              $signed(wire56) : $unsigned(wire55)) ?
                          ((^wire56) ?
                              wire56[(4'h8):(4'h8)] : wire55[(1'h1):(1'h0)]) : ($signed(wire55) >>> $unsigned(wire57))))};
  assign wire59 = $signed($unsigned(wire57[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg60 <= $signed((wire58[(4'hb):(3'h6)] ?
          $unsigned(($signed((8'ha8)) ?
              (~wire59) : $signed(wire59))) : (^(|(~^wire54)))));
      reg61 <= ((|(wire56[(3'h5):(1'h1)] - wire58[(3'h6):(3'h6)])) ?
          ((&((wire54 & wire57) <= $signed(wire58))) >= {{(reg60 > wire58)}}) : $signed((~|(|wire55))));
    end
  assign wire62 = (|(|((((8'hb5) == wire56) != $unsigned(wire58)) >>> {{wire59},
                      $signed(wire54)})));
  assign wire63 = wire55[(3'h6):(2'h3)];
  assign wire64 = $unsigned($signed($signed(reg61)));
  assign wire65 = wire59;
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire30;
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire30,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg29,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= $signed(wire27);
    end
  assign wire30 = (wire28 ?
                      (^~{reg29}) : {$unsigned((wire24[(1'h0):(1'h0)] && (8'ha8))),
                          $signed($signed($unsigned(reg29)))});
  always
    @(posedge clk) begin
      if (wire28[(3'h5):(1'h1)])
        begin
          reg31 <= reg29;
        end
      else
        begin
          reg31 <= ((~^$signed(($unsigned(wire25) ?
                  $signed(reg29) : (wire28 ? wire24 : reg29)))) ?
              {(&$unsigned($signed(reg29))),
                  $signed($unsigned({wire26, wire26}))} : reg31);
          reg32 <= wire27;
          reg33 <= ((+wire25[(2'h3):(2'h2)]) ?
              $signed(wire30[(2'h3):(1'h0)]) : reg32[(4'h9):(3'h7)]);
          reg34 <= (reg29[(3'h7):(3'h7)] <<< (!wire27));
        end
      reg35 <= ($unsigned($signed(wire30[(3'h7):(2'h3)])) ?
          reg32 : (^((wire26 ?
              $unsigned(wire28) : $unsigned(wire28)) >>> {$unsigned(wire26)})));
      reg36 <= ((^reg35) ? wire26 : wire30[(4'hd):(3'h7)]);
      reg37 <= ((($signed((8'ha6)) || ({reg29} ?
              $unsigned(reg33) : (wire27 ?
                  reg33 : wire30))) ^ (($unsigned(wire28) ?
              $unsigned(wire26) : reg34) ~^ {(reg31 ^~ reg32), wire27})) ?
          (^wire25) : (($signed((reg29 | reg31)) ?
                  ($unsigned((8'h9f)) >= (reg29 ?
                      (8'hb1) : (8'hb2))) : wire28) ?
              wire25 : {(^(reg31 ? reg31 : reg32))}));
      if ($unsigned((^($unsigned(reg33[(4'hb):(2'h2)]) <= {(!wire24),
          {reg34, reg35}}))))
        begin
          reg38 <= $unsigned((|reg34));
        end
      else
        begin
          reg38 <= ($signed($signed($signed((reg35 > (7'h41))))) + wire30[(3'h7):(1'h1)]);
        end
    end
  assign wire39 = {(wire27[(2'h2):(1'h0)] == $signed((+reg31[(2'h2):(1'h0)])))};
  assign wire40 = (8'hb8);
  assign wire41 = (-{wire24[(3'h6):(3'h6)]});
  assign wire42 = wire25;
  assign wire43 = $unsigned(wire40[(1'h0):(1'h0)]);
  assign wire44 = $signed($unsigned(((wire41[(1'h0):(1'h0)] << {wire26}) == {$unsigned(wire40)})));
  assign wire45 = {wire30[(4'he):(4'he)]};
  assign wire46 = ($signed((!$unsigned(wire27))) ^~ ($unsigned(((reg31 ?
                      wire26 : reg36) < {reg37, reg33})) && wire42));
endmodule
