module top
#(parameter param105 = ({(!(((8'ha7) ? (8'hb8) : (8'hbc)) < (8'ha8))), (~((~&(8'haf)) ? ((8'h9f) <<< (8'ha0)) : (7'h44)))} ? {((~^((8'hb5) * (8'ha6))) ? (((8'ha8) >= (7'h43)) && (~^(8'hb1))) : (~|(~(8'ha8))))} : (((((8'hae) ? (7'h43) : (8'ha4)) >= ((8'hbf) ? (8'h9c) : (8'ha4))) != {(+(8'hb4))}) ? ((((8'h9d) == (8'hb9)) ? (~(8'ha5)) : (~|(8'hae))) ? (^~(+(8'hae))) : (((8'hb7) << (8'h9e)) ^~ ((8'haa) ? (8'ha1) : (7'h40)))) : {(((7'h42) ? (8'h9d) : (7'h41)) ? {(8'hbc), (8'hb8)} : ((7'h41) || (8'haa)))})), 
parameter param106 = ((^(^~(~|param105))) + {(((+param105) ? (param105 || param105) : (param105 ? (8'haf) : (8'hbd))) < ({param105} ? param105 : param105))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire75;
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  assign y = {wire104,
                 wire100,
                 wire99,
                 wire98,
                 wire79,
                 wire78,
                 wire77,
                 wire4,
                 wire75,
                 reg103,
                 reg102,
                 reg101,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst76 (.wire6(wire1), .wire9(wire4), .wire7(wire3), .clk(clk), .wire8(wire2), .wire10(wire0), .y(wire75));
  assign wire77 = ((wire4[(2'h2):(1'h0)] ~^ {wire0[(5'h11):(4'hb)]}) ?
                      wire75 : wire0);
  assign wire78 = (wire77[(4'h9):(4'h9)] * ((($unsigned(wire3) ?
                          $unsigned(wire4) : wire0[(4'h9):(1'h1)]) ?
                      $signed($unsigned(wire0)) : wire0) && {wire4}));
  assign wire79 = wire75;
  always
    @(posedge clk) begin
      reg80 <= wire75;
      if ($signed($signed($unsigned(wire1[(4'h8):(3'h5)]))))
        begin
          reg81 <= (~($unsigned((+$signed(wire79))) >= (|$signed({wire77}))));
          reg82 <= {$signed(wire78)};
          if (({$unsigned($unsigned($signed(wire77)))} >>> wire3))
            begin
              reg83 <= $signed((~&$unsigned($signed((wire79 ?
                  wire2 : wire75)))));
            end
          else
            begin
              reg83 <= $unsigned(reg83[(1'h1):(1'h1)]);
              reg84 <= $unsigned($signed(wire4[(3'h6):(1'h0)]));
              reg85 <= reg82[(3'h6):(1'h1)];
              reg86 <= wire1[(4'ha):(2'h2)];
              reg87 <= ($unsigned((((reg80 - (8'hb9)) ?
                      reg86[(2'h2):(1'h1)] : wire1[(5'h13):(4'ha)]) ?
                  wire0 : $signed((-(8'hb1))))) >>> ($unsigned(wire4) * $signed((~^(8'hbb)))));
            end
          if ($signed(wire0[(4'hf):(4'h9)]))
            begin
              reg88 <= reg84[(3'h5):(2'h2)];
              reg89 <= {{reg83[(2'h3):(1'h0)],
                      ((reg82[(1'h1):(1'h1)] ?
                              (wire2 >> reg87) : (reg84 >>> reg82)) ?
                          $signed($signed((7'h42))) : (reg81 ?
                              (wire78 == reg88) : (wire1 > reg87)))},
                  $unsigned((^$unsigned(wire77[(1'h0):(1'h0)])))};
              reg90 <= reg85;
              reg91 <= reg90;
              reg92 <= ((({(^reg83),
                      reg84} == wire0[(4'ha):(4'ha)]) >> ((wire79 != $signed(wire79)) >= $unsigned(((7'h41) == reg82)))) ?
                  $signed($unsigned(wire4[(3'h7):(3'h6)])) : ((8'hb3) - reg80[(2'h2):(1'h1)]));
            end
          else
            begin
              reg88 <= ((reg83 < ((^reg82[(1'h1):(1'h1)]) ?
                      {$unsigned(wire4)} : ((wire1 ? wire77 : wire77) ?
                          reg87[(4'hd):(4'hb)] : ((7'h41) ?
                              reg87 : (8'ha2))))) ?
                  wire1[(3'h4):(1'h0)] : ({(^{wire77}), ((8'hb0) * {wire78})} ?
                      $signed($signed($signed(wire4))) : ((reg89 == (^~reg86)) + $unsigned($signed((7'h43))))));
              reg89 <= reg90;
            end
          if ($unsigned(reg91))
            begin
              reg93 <= (~&(wire1 ?
                  wire79[(2'h2):(2'h2)] : $signed({wire0[(4'hc):(4'hb)]})));
              reg94 <= $unsigned(wire77);
            end
          else
            begin
              reg93 <= reg93;
              reg94 <= $signed(wire1[(4'h9):(4'h9)]);
              reg95 <= $signed(wire1);
              reg96 <= ($unsigned((reg92 ?
                      reg82 : ((reg93 & reg84) != ((8'hb1) ? reg95 : reg87)))) ?
                  (($unsigned((8'had)) ?
                      reg84[(3'h7):(1'h0)] : {(-reg95),
                          (^~reg85)}) <= ((reg80[(3'h4):(1'h0)] > $unsigned(reg91)) >= (wire75 >> $signed(wire2)))) : $unsigned($signed(wire78)));
              reg97 <= ({reg91,
                  $unsigned(((wire79 ?
                      reg84 : wire1) ^~ (!wire2)))} < $unsigned((-reg93)));
            end
        end
      else
        begin
          reg81 <= (~^reg81[(1'h1):(1'h0)]);
        end
    end
  assign wire98 = (wire0[(4'hf):(3'h4)] == $signed($unsigned((~&$unsigned(reg83)))));
  assign wire99 = (~|{((8'hae) ? reg91 : $unsigned((reg81 > reg97))),
                      $signed((~^(reg85 ? reg93 : (8'hb2))))});
  assign wire100 = wire4;
  always
    @(posedge clk) begin
      reg101 <= reg82;
      reg102 <= (reg96[(1'h1):(1'h1)] ?
          $signed((reg90[(1'h1):(1'h1)] ^ ($signed(reg95) ?
              (wire4 ? reg91 : reg91) : (!wire98)))) : (wire77 ?
              (reg96[(4'ha):(3'h5)] + $signed($unsigned(reg80))) : wire2[(4'h9):(3'h4)]));
      reg103 <= $signed(wire100[(4'hd):(4'ha)]);
    end
  assign wire104 = reg80;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire40;
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire66,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire11,
                 wire12,
                 wire13,
                 wire40,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire11 = ($unsigned($unsigned((wire10[(1'h1):(1'h0)] ?
                      $unsigned(wire7) : (&wire10)))) ~^ (wire6[(3'h5):(1'h1)] ^~ (wire10 ?
                      ($unsigned(wire10) << $unsigned(wire9)) : wire6)));
  assign wire12 = (-(^{wire8[(1'h0):(1'h0)], (8'hb2)}));
  assign wire13 = (~|(^{$unsigned(wire12), wire11[(4'h8):(2'h2)]}));
  module14 #() modinst41 (wire40, clk, wire9, wire13, wire11, wire8, wire12);
  assign wire42 = $unsigned(wire40[(4'he):(4'hd)]);
  assign wire43 = {$unsigned(wire6)};
  assign wire44 = wire6[(5'h12):(4'h9)];
  assign wire45 = (+($signed(((wire40 > wire13) ?
                      (^~(8'ha9)) : $signed(wire11))) ~^ (wire42[(4'h9):(1'h1)] != ($unsigned(wire7) && {wire40,
                      wire12}))));
  assign wire46 = ($unsigned(((~$unsigned(wire43)) ?
                      (~(+(8'hae))) : wire45)) >> (^~wire42));
  assign wire47 = ((~|(((-(8'hb5)) ? $signed((8'hae)) : {wire8, wire44}) ?
                      wire43[(4'hb):(4'hb)] : wire45)) ~^ (!((8'h9e) <= wire10[(4'ha):(1'h0)])));
  assign wire48 = $unsigned({(~wire6), (~^wire43[(3'h6):(1'h1)])});
  assign wire49 = ($signed({wire10[(4'h9):(3'h7)]}) ?
                      wire10 : {($signed((~|wire7)) || (wire47[(1'h0):(1'h0)] ?
                              (8'hb4) : ((8'ha3) & wire13))),
                          (($signed(wire10) ?
                              wire45 : $signed(wire12)) >> $unsigned(wire8[(2'h3):(1'h0)]))});
  always
    @(posedge clk) begin
      reg50 <= $unsigned({$signed(($unsigned(wire6) & (~^wire13)))});
      reg51 <= $signed(wire11[(4'ha):(2'h3)]);
      if ($signed(wire48))
        begin
          if (wire13[(4'hc):(4'h9)])
            begin
              reg52 <= ($unsigned({($signed(wire10) ?
                      {wire40, (8'ha8)} : (wire47 ? wire46 : (8'ha7))),
                  wire46[(4'hb):(3'h4)]}) > (^($signed(wire11) ?
                  (~$unsigned(wire42)) : wire10[(4'h9):(3'h4)])));
              reg53 <= $signed({reg51,
                  ($unsigned((8'ha7)) ? $signed((wire7 != reg51)) : wire12)});
              reg54 <= ({wire48} ? wire13 : wire43[(4'h8):(3'h4)]);
            end
          else
            begin
              reg52 <= wire47[(2'h2):(1'h0)];
              reg53 <= wire9;
              reg54 <= wire9[(4'h9):(2'h3)];
            end
          reg55 <= (^~((reg51[(4'ha):(4'h8)] < wire40) | wire44[(4'ha):(4'h9)]));
          if (((~|(~((~|reg55) ? $signed(wire45) : ((8'ha5) == wire9)))) ?
              $signed({reg51}) : (($signed($unsigned(reg51)) ?
                      reg52[(1'h1):(1'h0)] : wire45) ?
                  wire43[(4'hd):(3'h6)] : $unsigned((^~$signed((8'ha2)))))))
            begin
              reg56 <= (wire12 ?
                  ((wire47[(1'h0):(1'h0)] ?
                      $unsigned((-wire13)) : $signed((reg54 ?
                          (8'ha7) : wire8))) - $signed({$signed(wire46)})) : $unsigned(wire13));
              reg57 <= reg54;
            end
          else
            begin
              reg56 <= ($unsigned(wire9) & $signed($signed(({(8'hb2),
                  reg52} >>> wire7))));
              reg57 <= ({(wire12 ?
                          $signed((reg54 ?
                              (8'h9d) : reg54)) : (+wire8[(3'h5):(3'h5)]))} ?
                  (-wire9[(1'h1):(1'h0)]) : (reg56[(1'h1):(1'h0)] == ((wire43[(4'ha):(4'h8)] != (~|wire46)) ?
                      ($unsigned(reg56) ?
                          wire46 : $signed(wire7)) : ((wire47 ^~ wire9) ?
                          {wire6} : $signed(reg55)))));
              reg58 <= (wire40[(4'ha):(2'h3)] > ($unsigned((&{wire47, reg52})) ?
                  $signed($unsigned(wire49)) : (~^((8'hb6) << (wire13 >= wire6)))));
            end
          if ((reg55[(1'h1):(1'h0)] ?
              {(!((wire46 ^ wire44) ?
                      $unsigned(wire9) : ((8'hb0) <<< wire42)))} : (~((8'ha5) >>> (|$unsigned((8'h9f)))))))
            begin
              reg59 <= $signed((~^wire9));
              reg60 <= reg50[(4'hd):(3'h6)];
              reg61 <= wire49[(2'h2):(1'h0)];
              reg62 <= (((reg53 || $unsigned((reg53 <= wire8))) ?
                  reg61 : (^~((wire11 ? wire12 : wire46) ?
                      reg54[(1'h1):(1'h0)] : $unsigned(wire11)))) ~^ ((~^$signed((reg57 ?
                  wire42 : wire10))) - ($unsigned((wire9 ? reg57 : (8'ha0))) ?
                  wire49 : ((wire47 ? (8'hb1) : reg51) ?
                      $signed(reg50) : (7'h42)))));
            end
          else
            begin
              reg59 <= (({reg59,
                      $signed(reg52[(1'h0):(1'h0)])} | $unsigned(wire47[(2'h2):(1'h0)])) ?
                  ($unsigned($signed(wire13)) * (8'hbe)) : $unsigned((reg52[(3'h4):(3'h4)] << wire46[(1'h1):(1'h1)])));
              reg60 <= reg53;
              reg61 <= ({reg53[(1'h0):(1'h0)],
                      ((+{wire48}) ?
                          $unsigned($signed(wire44)) : (wire48 ?
                              $unsigned(reg57) : $unsigned(reg57)))} ?
                  {(+$unsigned(((8'hbb) ?
                          wire46 : reg59)))} : $unsigned(wire45));
            end
          reg63 <= (((+wire7[(4'he):(4'hc)]) ?
                  (-reg61[(4'hd):(3'h4)]) : (&$unsigned((+wire7)))) ?
              $unsigned(wire12) : (+wire9));
        end
      else
        begin
          reg52 <= (^~((&(wire48[(2'h3):(2'h3)] | (~&wire9))) ?
              $signed((|(reg58 ?
                  wire12 : reg55))) : $unsigned($signed(reg62))));
          reg53 <= {reg58[(3'h4):(3'h4)], wire48[(3'h6):(3'h4)]};
        end
      reg64 <= (wire45[(2'h3):(2'h3)] & $unsigned(wire11));
      reg65 <= (+(wire12[(5'h12):(4'hd)] ?
          {$unsigned(reg64[(3'h4):(1'h0)]),
              $signed($unsigned((8'hbe)))} : {wire46}));
    end
  assign wire66 = reg56[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (reg56[(1'h0):(1'h0)])
        begin
          reg67 <= reg55[(3'h4):(1'h1)];
        end
      else
        begin
          reg67 <= ((8'hab) ?
              (!(reg59 - (&$signed(reg59)))) : (~(|$signed({(8'h9e)}))));
          reg68 <= (wire9[(4'ha):(3'h4)] >> ({(^(wire12 <= (8'hba))),
                  (wire8 ? $signed(wire13) : wire9[(2'h2):(1'h0)])} ?
              $signed(($signed(reg65) > wire42[(4'h8):(2'h2)])) : $signed((wire42[(3'h4):(1'h0)] ?
                  reg52 : ((8'hac) ? (8'hb6) : wire46)))));
        end
      reg69 <= (^wire13[(3'h4):(1'h1)]);
      reg70 <= reg67[(2'h3):(1'h1)];
      reg71 <= $unsigned($unsigned($unsigned((8'hb1))));
      reg72 <= $unsigned(($signed((wire9[(4'ha):(3'h6)] ?
          reg63[(1'h1):(1'h0)] : (reg64 ? reg52 : wire46))) - (&((wire47 ?
              reg55 : wire44) ?
          reg50[(4'he):(4'he)] : $unsigned((8'hb8))))));
    end
  assign wire73 = $signed((&(!($unsigned(wire6) ?
                      $signed(wire11) : (^~wire43)))));
  assign wire74 = $unsigned((reg64 <<< (8'had)));
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire20;
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire35,
                 wire20,
                 reg37,
                 reg36,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = $signed(wire18);
  always
    @(posedge clk) begin
      if ((~^(8'ha2)))
        begin
          reg21 <= wire17[(4'hc):(1'h1)];
        end
      else
        begin
          reg21 <= wire18[(4'hd):(4'hb)];
        end
      if ($unsigned({(~|(|wire18)), ({(8'hab), wire20} ~^ wire19)}))
        begin
          reg22 <= $unsigned(($signed({(~|wire16), wire20[(2'h2):(2'h2)]}) ?
              $signed(wire19[(1'h1):(1'h1)]) : {(wire16 || wire19),
                  ($unsigned(wire17) >>> $signed(wire17))}));
          if ({({($signed(wire17) && (^wire19)),
                      {$signed(wire17), (reg21 | reg21)}} ?
                  ((wire20[(1'h0):(1'h0)] ^~ (&wire19)) ?
                      $signed(reg22[(4'hb):(2'h2)]) : (wire20[(1'h1):(1'h1)] >>> wire20[(1'h1):(1'h0)])) : wire19)})
            begin
              reg23 <= wire16;
              reg24 <= (wire15[(4'ha):(4'h8)] ?
                  {reg22, $unsigned((~((8'h9e) << reg21)))} : (((&(wire16 ?
                          wire19 : wire17)) > (reg21 ?
                          (wire19 | reg23) : (reg22 ? wire16 : wire20))) ?
                      $signed(wire20[(1'h1):(1'h1)]) : reg21[(1'h1):(1'h0)]));
            end
          else
            begin
              reg23 <= reg21;
              reg24 <= $unsigned(wire19);
              reg25 <= $unsigned(wire15);
            end
          reg26 <= (reg23[(1'h0):(1'h0)] ?
              $signed($unsigned(wire19)) : wire19[(1'h0):(1'h0)]);
          reg27 <= $signed($signed((-wire15)));
          reg28 <= $signed((reg25[(1'h0):(1'h0)] ?
              (^$unsigned($signed(reg27))) : ({wire18[(4'hc):(4'ha)]} & wire20)));
        end
      else
        begin
          reg22 <= ((7'h41) == (^((~{(8'had)}) ?
              $signed(wire15[(4'hc):(3'h7)]) : reg23[(3'h4):(2'h2)])));
          if ((+(wire18 ?
              $signed((~&(wire20 ? reg21 : wire15))) : (reg22 ?
                  {$unsigned(wire18)} : ($unsigned(reg26) ?
                      reg22 : (wire18 ? (8'ha7) : reg27))))))
            begin
              reg23 <= (+((~($signed(reg23) ? wire18 : {reg27})) | (wire19 ?
                  reg26[(4'hf):(4'hd)] : {$signed(reg28), $signed((8'hae))})));
              reg24 <= $unsigned($signed(reg23[(1'h1):(1'h0)]));
              reg25 <= reg22;
              reg26 <= $signed(wire15[(1'h0):(1'h0)]);
            end
          else
            begin
              reg23 <= ((~($unsigned($signed(wire19)) != reg28[(4'hc):(4'h8)])) == (-(-{$unsigned(reg23),
                  $unsigned(wire17)})));
            end
          reg27 <= (($signed(reg26) ?
                  $unsigned(((wire19 >> wire16) + $unsigned(reg27))) : $unsigned((8'hb6))) ?
              (8'hbf) : (($signed((reg21 ^~ reg24)) ?
                      $signed(wire16[(5'h12):(5'h10)]) : (&(wire17 || reg21))) ?
                  $signed((^~(wire18 >> (8'h9c)))) : $unsigned(($signed(wire16) >>> reg22[(1'h1):(1'h0)]))));
          reg28 <= {reg24[(1'h0):(1'h0)], wire15};
        end
      reg29 <= $signed((~&($signed((^~reg22)) ?
          reg22[(3'h7):(2'h3)] : wire17[(4'hb):(4'h9)])));
      if (wire18)
        begin
          reg30 <= wire19;
          reg31 <= (^(!$signed($unsigned($signed(wire15)))));
          reg32 <= (wire16[(1'h0):(1'h0)] ?
              $unsigned($unsigned($unsigned($signed(reg26)))) : (+reg28));
          reg33 <= reg30[(4'h8):(3'h6)];
          reg34 <= (^$signed(reg23[(1'h1):(1'h0)]));
        end
      else
        begin
          reg30 <= wire17[(1'h0):(1'h0)];
        end
    end
  assign wire35 = (|((reg21[(3'h5):(2'h3)] ?
                      (+wire19[(1'h1):(1'h0)]) : $signed(reg21)) + $unsigned(((reg33 <= wire20) ?
                      {reg23} : reg31[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg36 <= (~^reg26);
      reg37 <= $unsigned(((^~reg29) * reg27));
    end
  assign wire38 = $signed($unsigned($unsigned(((wire17 ? reg37 : reg21) ?
                      reg30 : reg31))));
  assign wire39 = $unsigned($unsigned($signed(reg37[(4'hc):(3'h7)])));
endmodule
