module top
#(parameter param119 = (((~&(((8'ha8) > (8'hb3)) ? (&(8'h9d)) : ((8'hbd) ? (8'ha4) : (8'ha5)))) ? ({(&(8'hb2))} ? (((8'hbc) ? (8'hbf) : (8'hae)) <= ((8'h9c) >= (8'hbc))) : {{(8'ha2)}}) : ((8'ha5) == {(&(7'h44)), ((8'hbe) ? (7'h42) : (8'hb7))})) ? (7'h40) : (|((((8'hab) > (8'hbe)) ^ ((7'h43) || (8'hb6))) != (((7'h42) ? (7'h44) : (8'hbf)) ? ((8'ha0) ? (8'haf) : (8'ha1)) : {(8'hb6)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire8;
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire115,
                 wire26,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire2[(4'h8):(1'h0)]) ?
          ({(8'hb6)} <= {(&wire4[(3'h7):(1'h1)]),
              (wire4[(3'h7):(2'h3)] ?
                  (wire3 & wire0) : $signed(wire4))}) : $unsigned(((~^(wire4 ?
              wire4 : wire1)) * wire4[(3'h4):(3'h4)])));
      reg6 <= (+($unsigned(wire4[(4'hd):(3'h5)]) ? (!$signed(wire3)) : wire1));
      reg7 <= $unsigned({($unsigned(reg6) <= wire1[(4'h8):(2'h2)])});
    end
  assign wire8 = ($signed((wire4 ?
                     ({wire1} ?
                         reg7 : $signed(wire0)) : (~(wire0 || wire2)))) >>> wire3);
  module9 #() modinst27 (wire26, clk, reg6, wire0, wire8, wire3, wire2);
  module28 #() modinst116 (wire115, clk, wire8, wire1, wire0, reg6, wire26);
  assign wire117 = wire8[(3'h4):(2'h3)];
  assign wire118 = ((8'ha9) ?
                       $signed({$unsigned($unsigned(wire0))}) : (~&$signed(((+wire117) != (wire115 ?
                           wire2 : wire3)))));
endmodule

module module28
#(parameter param114 = ((!((((8'hbb) ^ (8'haf)) ^ ((8'hb6) ? (8'hb3) : (8'had))) > {((8'hae) ? (8'ha8) : (8'hb3))})) ? ((^~((&(8'hbe)) * ((8'hac) <<< (7'h41)))) >= (-((^(7'h40)) ? ((7'h43) ? (8'hb1) : (8'ha4)) : ((8'ha3) ? (8'ha6) : (7'h44))))) : (8'hb4)))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  assign y = {wire113,
                 wire97,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
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
                 reg101,
                 reg100,
                 reg99,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire34 = (~|({(wire29 ?
                          wire33[(4'hd):(2'h3)] : (wire29 == (8'hb4)))} <<< (^~{wire33,
                      wire31[(4'h8):(3'h5)]})));
  assign wire35 = wire33[(4'hd):(2'h3)];
  assign wire36 = ($unsigned($unsigned(wire34[(2'h3):(2'h3)])) ?
                      (!(((^~wire33) ?
                          {wire33} : (wire29 < wire29)) * wire29[(1'h0):(1'h0)])) : ($signed(($signed(wire35) ^~ wire32[(1'h0):(1'h0)])) >> {$signed((|wire33))}));
  always
    @(posedge clk) begin
      reg37 <= {(($signed(wire36[(3'h7):(2'h2)]) ?
                  $unsigned(wire32) : {((8'haf) ? (8'hb1) : (8'ha9))}) ?
              (~|$signed(wire33)) : $unsigned(((wire36 ?
                  wire34 : wire31) <= $unsigned(wire32))))};
      reg38 <= (8'had);
      reg39 <= (reg38 ?
          $signed($signed($unsigned({wire30}))) : (wire29 > ($signed((wire32 << (8'h9d))) >>> (wire34 * (wire30 ?
              wire32 : wire33)))));
    end
  always
    @(posedge clk) begin
      reg40 <= wire33[(4'hd):(3'h6)];
      reg41 <= wire31[(4'ha):(1'h0)];
    end
  assign wire42 = ($unsigned((8'ha4)) || ((+reg39) ?
                      (((wire34 ~^ wire35) - ((8'h9d) ? wire32 : wire30)) ?
                          $signed((wire36 || wire34)) : ({wire34} ?
                              $unsigned(wire35) : {(8'h9e)})) : ($unsigned((!reg39)) && reg39[(4'h9):(2'h2)])));
  assign wire43 = (8'hb1);
  module44 #() modinst98 (wire97, clk, reg38, reg37, reg40, wire29, wire30);
  always
    @(posedge clk) begin
      reg99 <= (^~(~wire36[(4'he):(4'h8)]));
      if ($unsigned($signed($signed($signed((~^wire97))))))
        begin
          reg100 <= ((~^(~|((!reg41) - (!reg99)))) ?
              $signed(reg99) : ($signed({(wire29 ? wire34 : wire34),
                      $signed(wire36)}) ?
                  (&reg99[(3'h6):(1'h0)]) : reg41[(2'h2):(2'h2)]));
          reg101 <= $signed(reg100);
          reg102 <= ($unsigned(reg101) ?
              wire29 : $signed((~&(^~((8'hbd) - reg41)))));
        end
      else
        begin
          reg100 <= reg38;
          reg101 <= $signed($signed(reg38[(3'h5):(3'h5)]));
        end
      reg103 <= wire29;
      reg104 <= $unsigned(((wire42 ^~ reg37[(4'h9):(3'h7)]) && ((reg102 ?
          reg39[(1'h0):(1'h0)] : wire34[(3'h7):(3'h4)]) | $unsigned($signed(reg100)))));
      if (reg38)
        begin
          reg105 <= wire36;
          if ({$signed($unsigned((-reg102[(3'h5):(2'h3)])))})
            begin
              reg106 <= wire97;
              reg107 <= reg41;
              reg108 <= ((~$unsigned((^~$unsigned(wire32)))) * $unsigned($signed(wire42[(4'h9):(2'h3)])));
              reg109 <= reg101;
            end
          else
            begin
              reg106 <= $signed($signed(reg107[(3'h4):(2'h3)]));
              reg107 <= $signed($signed($signed(($signed((7'h41)) ?
                  {(8'ha1)} : wire32))));
              reg108 <= {{($unsigned((reg40 ? reg103 : reg109)) ?
                          $unsigned((~|wire32)) : $unsigned($unsigned(reg107))),
                      (wire36 >>> wire36)}};
              reg109 <= reg103;
              reg110 <= wire42[(4'he):(4'h9)];
            end
          reg111 <= (|$signed(wire36));
          reg112 <= (($signed($unsigned($unsigned((8'hb1)))) >> (($signed(reg100) <<< (reg107 ?
                  reg105 : reg102)) ^ reg110)) ?
              (wire35[(4'ha):(2'h2)] + (($signed(wire34) && {reg102}) <= $signed($signed(reg109)))) : (~&{(reg39[(4'h8):(1'h1)] ?
                      (wire34 & wire33) : (&reg37))}));
        end
      else
        begin
          reg105 <= $unsigned((~&(({reg99, reg101} ?
                  (reg38 ? reg100 : reg112) : $signed((7'h43))) ?
              $unsigned({wire42, wire43}) : ($signed(wire42) ?
                  ((8'hb6) <= (8'hbd)) : $unsigned((8'hb6))))));
        end
    end
  assign wire113 = $signed($unsigned($signed((reg38[(2'h2):(2'h2)] ?
                       {(8'ha0), reg106} : wire34))));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire15;
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire15,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = wire12;
  always
    @(posedge clk) begin
      reg16 <= $unsigned((($signed((8'hba)) ?
          (wire13 ? (wire11 ? (8'hbc) : wire14) : $signed(wire13)) : ({wire12,
                  wire13} ?
              $unsigned(wire15) : (wire13 <= wire11))) ~^ (($unsigned(wire14) ?
              $unsigned(wire13) : wire13) ?
          (|wire11) : (8'h9f))));
      reg17 <= (reg16 >= (&(wire10 >> (|(~^wire15)))));
      reg18 <= reg17[(1'h1):(1'h1)];
    end
  assign wire19 = $signed((|(+((~|reg16) ? {(8'h9f)} : $unsigned(wire13)))));
  assign wire20 = wire10;
  assign wire21 = $signed(($unsigned(wire19) ?
                      (wire11 ?
                          $unsigned(wire19) : (wire10[(3'h4):(2'h2)] ^ $signed(reg18))) : (8'hb9)));
  assign wire22 = wire10[(3'h5):(2'h3)];
  assign wire23 = {wire14[(2'h3):(2'h3)]};
  assign wire24 = (&$unsigned((($signed(reg17) ?
                      {wire15, wire15} : ((8'hb2) ?
                          wire20 : wire14)) * ((&wire10) ?
                      (wire21 ? wire11 : wire22) : (^~wire20)))));
  assign wire25 = wire13;
endmodule

module module44
#(parameter param95 = ((({{(8'ha5), (8'hae)}} >= (((8'h9e) + (8'h9f)) & (~&(8'hb2)))) ? ({(-(8'hbe)), (~(8'hae))} <<< (((8'ha2) ? (8'ha4) : (8'hb3)) ? ((8'hbc) ? (8'hb9) : (8'hb1)) : ((8'ha2) * (8'hb6)))) : (!((&(8'h9f)) != (!(8'hb7))))) <= ({(&((8'hbb) == (8'had))), ((^~(8'ha7)) == ((8'had) && (8'hb5)))} ? ({(&(8'hab))} || (^~((7'h42) >> (8'had)))) : {(((8'hae) > (8'h9e)) != ((8'haf) && (8'hae)))})), 
parameter param96 = ((!(8'ha7)) >>> ({(|param95), (~|(param95 ? (8'h9f) : param95))} | param95)))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire49;
  input wire [(4'ha):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  input wire signed [(3'h5):(1'h0)] wire46;
  input wire [(3'h5):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire87,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire51,
                 wire50,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire50 = ($unsigned(((~&(8'hb4)) <= (8'hba))) & wire45);
  assign wire51 = (~|wire45);
  always
    @(posedge clk) begin
      if ((($unsigned((+wire45)) ? $signed(wire47[(4'h8):(4'h8)]) : wire45) ?
          $unsigned(wire50[(4'he):(4'he)]) : {((wire51[(1'h0):(1'h0)] ?
                      $unsigned(wire50) : ((8'hb7) | wire47)) ?
                  ((|wire48) != wire47[(4'hb):(4'h9)]) : {(~^(7'h40)),
                      (wire49 ? wire49 : (8'haf))}),
              $unsigned({wire48})}))
        begin
          reg52 <= {(8'ha8), wire51};
          reg53 <= ($unsigned(wire49[(4'h9):(3'h4)]) ?
              ((wire48[(2'h3):(1'h1)] ?
                  (((8'h9f) ? wire51 : wire50) ?
                      (wire46 ?
                          wire46 : wire49) : $unsigned(wire49)) : ((wire48 ?
                      wire51 : wire49) <<< wire49[(2'h3):(1'h1)])) >= reg52[(5'h11):(3'h6)]) : (wire48[(4'h8):(3'h5)] ?
                  {($signed(wire49) >>> $unsigned(wire45))} : $signed((^wire51))));
        end
      else
        begin
          reg52 <= $signed({(wire45 ?
                  ((wire46 ? wire46 : wire48) > ((8'hb6) & wire49)) : (reg52 ?
                      (!reg52) : wire46))});
          reg53 <= (~^{(~^wire50)});
        end
      reg54 <= ($unsigned((~^wire47[(4'h9):(3'h6)])) ?
          {(wire47[(3'h6):(3'h4)] < wire45),
              wire45[(2'h2):(1'h0)]} : (^(($unsigned(reg53) ?
                  (-(8'ha8)) : (|(8'hb1))) ?
              reg52[(5'h14):(4'he)] : $signed((~wire51)))));
      reg55 <= (wire49[(3'h7):(3'h5)] ?
          (((~(&wire45)) ?
              $unsigned($signed(wire50)) : (~^reg54[(1'h0):(1'h0)])) || wire46[(3'h4):(1'h0)]) : $unsigned(wire46[(2'h3):(2'h3)]));
    end
  assign wire56 = {((wire45[(2'h3):(1'h1)] ?
                              $unsigned(wire46) : $unsigned($unsigned((8'ha9)))) ?
                          {({reg53} != (|reg53))} : (wire45[(1'h1):(1'h1)] & ((-wire49) == (reg55 != (7'h41))))),
                      ((reg53 >>> ((&wire46) != wire50[(4'ha):(3'h6)])) ^ ($signed(reg54[(4'hc):(4'hb)]) ?
                          $signed({wire51}) : ((reg52 ? reg55 : (8'hbb)) ?
                              {(8'ha6)} : $unsigned(wire48))))};
  always
    @(posedge clk) begin
      reg57 <= reg54;
      reg58 <= (~&$signed(wire50[(3'h4):(2'h2)]));
    end
  assign wire59 = ((~|(&(reg53[(3'h4):(2'h2)] == $signed(reg52)))) ?
                      wire51[(1'h0):(1'h0)] : (wire50[(3'h7):(2'h2)] ^ reg58[(4'h8):(1'h0)]));
  assign wire60 = $signed(reg52);
  assign wire61 = (~&wire46[(3'h4):(1'h1)]);
  assign wire62 = wire46[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg63 <= $signed($unsigned((-((wire48 ? wire45 : reg58) || wire47))));
      if (wire49)
        begin
          reg64 <= $signed(reg58);
          reg65 <= reg58;
          reg66 <= reg63;
          reg67 <= reg55;
        end
      else
        begin
          reg64 <= reg65;
          if ((+((^~((~&reg52) != (~reg55))) & (8'ha9))))
            begin
              reg65 <= wire51;
              reg66 <= {$signed(reg67[(5'h12):(2'h3)])};
              reg67 <= wire59[(3'h4):(3'h4)];
              reg68 <= (^reg58[(1'h1):(1'h0)]);
              reg69 <= $signed($unsigned($unsigned($unsigned(((8'ha2) < reg66)))));
            end
          else
            begin
              reg65 <= $signed((&(+reg67)));
              reg66 <= $unsigned((~&((^(+reg63)) ?
                  reg65 : ($unsigned(wire45) >>> (reg65 << wire59)))));
              reg67 <= (((|(!$signed(reg63))) >= $signed(($signed((8'ha7)) << (wire48 ?
                  (7'h44) : reg67)))) <= wire50);
            end
          reg70 <= $unsigned($signed({(~^$unsigned((8'ha0))),
              {wire45[(3'h5):(3'h4)]}}));
        end
      reg71 <= ($unsigned({$unsigned($unsigned(reg70))}) ?
          reg70[(1'h1):(1'h0)] : wire45);
      reg72 <= ((((!(|reg69)) * {$unsigned(wire62), (wire59 ? reg69 : reg53)}) ?
              {reg55[(5'h10):(4'hc)], reg69} : reg71) ?
          ((^(((8'h9e) < reg57) <= {reg55})) >= (&(!reg64))) : (8'hae));
      reg73 <= $signed($signed(wire61[(1'h1):(1'h1)]));
    end
  assign wire74 = (~(reg69 ? reg73[(4'h8):(2'h2)] : wire56));
  assign wire75 = $signed((wire60[(2'h2):(2'h2)] && $unsigned({reg67,
                      (~reg72)})));
  assign wire76 = $signed($unsigned(($unsigned((reg64 ? wire61 : reg63)) ?
                      (&$signed(wire75)) : $signed((wire56 >>> reg71)))));
  assign wire77 = (!wire61);
  assign wire78 = ((~&((wire77[(2'h2):(1'h1)] ?
                          (reg72 ?
                              reg67 : reg53) : reg57[(4'hc):(3'h6)]) * $signed($signed(wire59)))) ?
                      (^~$signed((-(~&wire60)))) : ($signed((wire50 ?
                          (wire51 ?
                              wire61 : reg73) : $signed(wire49))) * ($unsigned(wire50[(4'hc):(4'h9)]) == $signed({wire45}))));
  assign wire79 = $signed(reg58[(4'h8):(1'h0)]);
  assign wire80 = $unsigned($signed($unsigned((~&reg54))));
  always
    @(posedge clk) begin
      reg81 <= ({$signed(reg67), reg66[(2'h3):(1'h1)]} > $signed(reg64));
      reg82 <= ($signed((wire77[(2'h3):(1'h0)] ^ (wire49[(1'h1):(1'h0)] ~^ $unsigned(wire75)))) ~^ {(reg72[(1'h1):(1'h0)] ?
              ($unsigned((8'h9d)) ?
                  wire47[(2'h2):(1'h0)] : (~reg72)) : $signed($unsigned(wire76))),
          ((wire79[(3'h5):(3'h4)] - $unsigned(wire49)) ?
              ((reg68 ? reg58 : wire77) != $unsigned(wire59)) : wire45)});
      if ((~|$signed({(^~reg82[(2'h3):(1'h1)])})))
        begin
          reg83 <= $unsigned((~^reg63));
        end
      else
        begin
          reg83 <= ($signed($unsigned($signed($unsigned((8'hb3))))) <<< $unsigned($signed(($unsigned(reg57) ?
              ((8'hae) ? reg68 : reg64) : wire76[(4'h8):(2'h3)]))));
        end
      reg84 <= wire46[(2'h2):(2'h2)];
      reg85 <= ({wire56} >>> (~|(reg81 ^~ ((8'ha0) ?
          wire62[(5'h10):(4'hf)] : $signed(reg68)))));
    end
  always
    @(posedge clk) begin
      reg86 <= (8'haf);
    end
  assign wire87 = ({(!wire78[(3'h4):(1'h0)])} ?
                      $unsigned(reg83[(3'h4):(1'h0)]) : (wire51 ?
                          (($signed(reg65) ? ((8'h9d) && reg82) : (^~(8'hba))) ?
                              (reg55 <<< $signed(wire79)) : $unsigned(wire60)) : wire76));
  always
    @(posedge clk) begin
      reg88 <= wire48;
      reg89 <= $signed($unsigned($unsigned($signed((reg52 ^ reg73)))));
      reg90 <= {$unsigned((|({wire46, reg65} & (wire47 ? (8'hb6) : reg57)))),
          (((-reg89) - wire50[(2'h3):(1'h0)]) ?
              ($signed($signed((8'hb7))) <= wire50) : $unsigned($signed((-wire59))))};
      reg91 <= reg72[(1'h0):(1'h0)];
      reg92 <= reg65[(3'h7):(1'h0)];
    end
  assign wire93 = (reg67[(4'hd):(3'h4)] ?
                      {$signed($signed(reg68)),
                          (reg53 ?
                              ((wire46 != reg66) || reg54[(1'h1):(1'h0)]) : ($unsigned(reg63) ?
                                  reg92[(3'h7):(1'h0)] : $unsigned(reg68)))} : $signed(reg92[(4'ha):(3'h5)]));
  assign wire94 = ({wire75,
                      (^~wire77[(2'h2):(2'h2)])} == $signed((reg83 >= (wire50 ?
                      (~|wire45) : $unsigned(reg82)))));
endmodule
