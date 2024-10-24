module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire104,
                 wire94,
                 wire92,
                 wire16,
                 wire15,
                 wire5,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      if (wire5[(1'h0):(1'h0)])
        begin
          reg6 <= (7'h42);
          reg7 <= (wire3 ?
              ($unsigned(($signed(wire5) ?
                  (wire1 ?
                      (8'ha2) : wire1) : $unsigned(wire4))) == $unsigned((~^wire2))) : (((!wire3) || {$unsigned(wire2)}) == {(wire2[(4'hd):(3'h4)] ?
                      $unsigned(wire2) : (7'h41)),
                  {(wire0 ? reg6 : wire4)}}));
          reg8 <= $unsigned({((!{wire5, (8'hb1)}) ?
                  wire0 : ((reg6 ? reg7 : (8'hba)) ?
                      (wire0 > wire1) : wire4))});
          reg9 <= $unsigned($signed(wire5[(1'h0):(1'h0)]));
          reg10 <= (reg8 <= $unsigned((~$signed((wire4 ? (7'h42) : reg7)))));
        end
      else
        begin
          reg6 <= reg8[(3'h5):(1'h1)];
        end
      reg11 <= wire2[(3'h5):(1'h1)];
      reg12 <= ({({$signed(wire1)} ^~ ((wire2 == reg11) ?
              $unsigned(reg9) : {wire5, reg7})),
          wire0} <= (~|(8'hb9)));
      reg13 <= ({reg7,
              ($signed(wire3) ? $signed(wire1) : wire3[(5'h13):(5'h12)])} ?
          $signed(wire4) : $unsigned(wire3[(5'h10):(4'hf)]));
      reg14 <= $unsigned(reg13);
    end
  assign wire15 = {($signed(reg14) != {($signed(reg14) ? (!reg8) : reg12),
                          ($unsigned(reg9) ~^ $signed(reg13))})};
  assign wire16 = ($unsigned($unsigned(reg7)) ?
                      ($unsigned($signed(reg7)) ?
                          wire1 : $signed($signed(((8'h9f) < wire5)))) : ({(!reg14),
                              ((!reg7) ?
                                  (reg11 >>> reg8) : (wire5 <<< (8'hae)))} ?
                          wire3[(5'h11):(5'h11)] : (wire2[(3'h7):(3'h6)] ?
                              {$signed(reg8),
                                  reg11[(1'h1):(1'h0)]} : reg11[(1'h1):(1'h0)])));
  module17 #() modinst93 (.y(wire92), .clk(clk), .wire18(wire4), .wire19(reg13), .wire21(wire0), .wire20(reg11));
  assign wire94 = wire5[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      if (wire3[(3'h7):(2'h2)])
        begin
          if (wire3)
            begin
              reg95 <= $signed(wire2[(1'h1):(1'h0)]);
              reg96 <= reg11;
              reg97 <= (~$unsigned((7'h42)));
              reg98 <= (^~wire2);
            end
          else
            begin
              reg95 <= {({$signed((wire2 ? reg97 : reg96)),
                          reg96[(1'h1):(1'h1)]} ?
                      $signed(wire94) : wire5[(4'hb):(4'hb)]),
                  $signed(((~^{reg14}) ? $signed({wire94, wire5}) : reg7))};
              reg96 <= $unsigned(reg13[(3'h5):(1'h0)]);
              reg97 <= reg98[(4'ha):(3'h6)];
              reg98 <= ((&(|((reg98 ? wire16 : reg11) - $unsigned((8'hbb))))) ?
                  (+wire16) : {(wire4 > ({wire92} & $signed(wire92)))});
              reg99 <= $signed($unsigned((^((reg9 && reg7) ^~ wire94[(4'ha):(1'h1)]))));
            end
          reg100 <= reg10[(4'hd):(1'h1)];
        end
      else
        begin
          reg95 <= {(reg95 ?
                  ($unsigned($signed(wire2)) ?
                      ($unsigned(wire5) ?
                          $unsigned(wire92) : $signed(reg14)) : $signed({reg8})) : reg99[(2'h3):(1'h0)]),
              wire3};
        end
      reg101 <= wire3;
      reg102 <= ((reg95 ^ reg14[(4'h9):(3'h5)]) == ((((~&reg9) ?
              {reg9} : (|(8'ha6))) ?
          $signed(reg100[(3'h4):(3'h4)]) : (^reg8[(3'h5):(2'h3)])) <<< wire5[(4'hc):(4'hc)]));
      reg103 <= wire5;
    end
  assign wire104 = (+$unsigned(reg101[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      if (reg8[(3'h4):(2'h2)])
        begin
          reg105 <= (8'ha5);
          reg106 <= reg100[(4'ha):(1'h0)];
          reg107 <= (~^((^(|(wire2 << reg12))) ?
              reg100[(4'h9):(3'h4)] : $signed($signed((reg105 ?
                  (8'had) : reg7)))));
          reg108 <= (~|reg7);
        end
      else
        begin
          if ((~&$unsigned(wire3)))
            begin
              reg105 <= $unsigned(wire1[(2'h2):(1'h1)]);
              reg106 <= (+($unsigned($signed({wire3})) || (((wire94 * reg102) ?
                  ((8'had) || reg97) : (reg100 ?
                      wire2 : reg100)) ^~ $unsigned((8'ha6)))));
            end
          else
            begin
              reg105 <= (^~(~reg96));
              reg106 <= wire15[(2'h3):(1'h0)];
              reg107 <= $unsigned((|reg98));
            end
          reg108 <= (reg6 ? reg10 : reg102[(3'h6):(2'h3)]);
          if (((reg11 <<< $signed(wire104)) ?
              (8'hb8) : ($unsigned(wire0) && ($unsigned((reg107 ?
                      reg6 : reg6)) ?
                  ((reg96 ? wire104 : reg12) ?
                      $unsigned(wire92) : (wire0 ? wire5 : wire4)) : wire16))))
            begin
              reg109 <= (~|(~^((8'had) ? wire4 : (^~reg14[(1'h1):(1'h1)]))));
              reg110 <= (8'hab);
              reg111 <= reg97;
              reg112 <= reg13[(5'h11):(3'h6)];
              reg113 <= reg98;
            end
          else
            begin
              reg109 <= (!$unsigned(($signed(reg12[(4'ha):(4'ha)]) <<< (8'ha6))));
              reg110 <= (~&reg8[(3'h6):(2'h3)]);
            end
        end
      reg114 <= (($unsigned((((8'ha1) ? reg111 : (8'hbd)) >= (8'hb6))) ?
              $signed({reg12[(5'h10):(4'hb)],
                  (reg98 ? reg11 : wire4)}) : wire1) ?
          (8'ha6) : $unsigned(reg97[(4'ha):(4'ha)]));
      reg115 <= reg108[(1'h1):(1'h1)];
      reg116 <= (((({(8'haf)} ? reg13 : (8'hab)) ? (~^reg105) : reg102) ?
              reg107[(4'hc):(4'hc)] : (((-reg101) & (!reg105)) != (-reg112))) ?
          $signed(reg111[(2'h2):(1'h1)]) : $signed($unsigned(($signed(reg97) ?
              wire2[(3'h7):(3'h5)] : (~|reg95)))));
    end
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire85;
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  assign y = {wire91, wire87, wire45, wire85, reg90, reg89, reg88, (1'h0)};
  module22 #() modinst46 (.wire23(wire19), .wire24(wire20), .clk(clk), .y(wire45), .wire26(wire18), .wire25(wire21));
  module47 #() modinst86 (.clk(clk), .wire48(wire45), .wire49(wire21), .wire50(wire19), .wire52(wire18), .y(wire85), .wire51(wire20));
  assign wire87 = $unsigned((wire85[(4'h9):(3'h7)] > (($unsigned(wire21) ?
                      (wire20 ?
                          wire19 : wire18) : wire21) && $signed(wire85))));
  always
    @(posedge clk) begin
      reg88 <= wire21;
      reg89 <= (^$signed($signed(wire18)));
      reg90 <= $unsigned({wire20[(1'h1):(1'h1)], reg89});
    end
  assign wire91 = $signed({$unsigned((~|(|(8'ha6))))});
endmodule

module module47
#(parameter param83 = (((((|(8'ha0)) << {(8'ha0)}) ? (7'h44) : (((8'ha6) ? (8'hac) : (8'hb9)) ^~ (^(8'haa)))) == {{(~&(8'ha7))}}) ? ((~^((~&(8'hb8)) ? ((7'h42) ^ (8'hb2)) : (^~(8'ha9)))) ? ((((8'hac) > (8'h9e)) ? {(7'h41), (8'hb8)} : ((8'h9e) - (8'hb5))) ^~ (-(^~(8'h9f)))) : (((+(8'h9f)) ? ((8'ha0) ? (8'hb1) : (8'had)) : ((8'hb2) & (8'ha3))) ~^ ((~|(8'ha7)) ? {(8'hbb)} : ((8'hb1) ? (7'h43) : (8'ha7))))) : ((((^~(8'ha1)) <= ((8'h9d) == (8'ha5))) ? {((8'hbd) ? (8'ha7) : (8'ha8)), (-(8'hb2))} : (((8'hac) != (8'had)) >>> (+(8'hbf)))) * ((-(!(8'ha2))) ? (((8'hb5) + (8'h9e)) + (~^(8'ha0))) : {((7'h40) < (7'h44))}))), 
parameter param84 = (((~&(+((8'haa) ? param83 : param83))) >= (((param83 ? (8'ha9) : param83) < (param83 ? param83 : param83)) << param83)) && ((&(~&{param83})) >>> {(~&{param83, param83}), ((param83 + param83) <<< (param83 ? param83 : param83))})))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire [(5'h14):(1'h0)] wire50;
  input wire signed [(5'h14):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg74,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= $signed($unsigned((8'h9f)));
      reg54 <= ($unsigned(wire52) != (&reg53));
      reg55 <= wire48[(1'h0):(1'h0)];
      reg56 <= $signed(wire52[(1'h1):(1'h1)]);
      if (((8'hba) ? wire52[(2'h2):(1'h1)] : reg54[(5'h11):(5'h11)]))
        begin
          if ((~^$signed((((wire49 && reg53) >> $signed(reg56)) <<< (wire50 ^ wire51[(5'h15):(5'h15)])))))
            begin
              reg57 <= (-{(($signed(wire51) && $signed(reg55)) | ((~(8'ha8)) ?
                      (wire49 != reg55) : $signed(wire52)))});
              reg58 <= wire50;
              reg59 <= $unsigned({$unsigned(reg53[(3'h6):(3'h5)])});
            end
          else
            begin
              reg57 <= (~(($signed(reg53) * {$unsigned((8'ha2))}) ?
                  {((!(8'ha8)) ?
                          (reg58 ?
                              wire51 : reg57) : wire49)} : $signed(((-(8'hbe)) ?
                      reg56[(4'ha):(2'h3)] : (8'hb9)))));
              reg58 <= (&reg56);
              reg59 <= $unsigned((({reg55[(3'h5):(1'h1)],
                      reg57} < reg55[(4'hc):(3'h5)]) ?
                  (($signed((8'hb3)) ? {reg55} : $signed(reg57)) ?
                      (((8'hb8) ? reg58 : reg55) ?
                          reg53 : (reg54 ?
                              wire48 : (7'h44))) : $unsigned(reg57[(2'h2):(1'h0)])) : (|({reg57} ^~ (reg55 ?
                      (8'hbf) : (8'h9d))))));
              reg60 <= wire52[(1'h0):(1'h0)];
              reg61 <= {reg59};
            end
          if (wire52)
            begin
              reg62 <= $signed($signed(((8'h9d) ?
                  reg55[(4'h9):(1'h0)] : reg60[(4'hf):(3'h7)])));
              reg63 <= reg61;
              reg64 <= (wire48 < $unsigned($unsigned((8'h9f))));
              reg65 <= ((reg57[(3'h5):(1'h1)] ? reg63[(1'h1):(1'h0)] : reg59) ?
                  $signed($signed((reg56[(1'h1):(1'h0)] ?
                      reg59[(2'h3):(2'h2)] : reg61[(5'h10):(4'he)]))) : (~(reg62 >> reg57[(4'h9):(4'h9)])));
            end
          else
            begin
              reg62 <= wire52;
              reg63 <= ((&{(wire49 ? (reg62 <<< reg58) : reg54)}) ?
                  ((~^(~&wire49[(3'h4):(2'h2)])) ^ ($signed((8'ha3)) ?
                      (reg57[(2'h3):(2'h3)] ?
                          (wire48 ^ reg59) : $unsigned(reg56)) : $signed({reg54}))) : ($unsigned($unsigned((wire48 == (8'hbc)))) ?
                      $unsigned(({wire49} ?
                          $unsigned(reg57) : reg64)) : reg54));
              reg64 <= (~&reg58[(4'hd):(1'h1)]);
              reg65 <= $unsigned((reg61 < $unsigned((-(wire48 && reg54)))));
            end
          if (reg65[(2'h2):(1'h0)])
            begin
              reg66 <= reg63;
              reg67 <= reg65[(1'h1):(1'h1)];
              reg68 <= (reg65[(2'h2):(2'h2)] + $unsigned($signed($signed((wire50 ?
                  (8'ha9) : (8'hbb))))));
              reg69 <= (~&(($signed($signed(reg64)) ?
                  ($signed(wire51) > (reg56 | reg53)) : reg54[(5'h14):(2'h2)]) != reg64[(5'h10):(4'h9)]));
            end
          else
            begin
              reg66 <= (+wire52);
              reg67 <= {(reg62 ?
                      $signed(((8'ha3) || (reg61 ?
                          wire48 : wire48))) : $unsigned(reg67[(2'h2):(1'h1)])),
                  $signed($unsigned($signed($unsigned(reg61))))};
              reg68 <= $signed((+(^$unsigned((wire50 << (8'ha9))))));
              reg69 <= ($unsigned((~^$unsigned({reg56,
                  reg66}))) ^ $signed({$signed(reg53[(2'h2):(1'h0)])}));
            end
          reg70 <= (|(|reg61[(2'h3):(2'h3)]));
          if ($unsigned($unsigned(reg65[(1'h0):(1'h0)])))
            begin
              reg71 <= $signed({{(~reg66[(3'h7):(3'h5)])}});
            end
          else
            begin
              reg71 <= ($signed(({{reg63}} ?
                  reg71[(4'he):(3'h6)] : reg68[(4'h8):(2'h2)])) >>> (reg68 ^ ((~^$unsigned(reg64)) == {reg70[(3'h7):(3'h5)],
                  reg67[(1'h0):(1'h0)]})));
              reg72 <= $signed(wire51);
              reg73 <= (($unsigned($unsigned($signed(reg60))) ?
                  $unsigned($signed((&reg60))) : (-$unsigned($signed(wire50)))) ^~ {$signed(reg55)});
              reg74 <= ((~|(-reg70)) ?
                  ($signed((^~((7'h42) ? reg58 : (8'hb7)))) ?
                      $unsigned(({reg60} ?
                          reg73 : reg64[(3'h6):(1'h1)])) : wire50) : ((^(wire48[(1'h0):(1'h0)] ?
                          $signed(reg72) : $unsigned(reg69))) ?
                      reg71[(2'h2):(1'h1)] : reg53[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ($unsigned((&(+wire51[(4'he):(4'h9)]))))
            begin
              reg57 <= reg59[(3'h6):(3'h4)];
              reg58 <= $unsigned(($signed((&(reg60 ? reg71 : reg74))) ?
                  $unsigned(reg65) : $unsigned($signed($unsigned((8'hbf))))));
              reg59 <= (reg70 ?
                  $unsigned((reg68[(4'h8):(2'h2)] ?
                      ($signed(reg58) ?
                          (&reg53) : (^reg74)) : reg62)) : $unsigned($signed($signed($signed(wire48)))));
            end
          else
            begin
              reg57 <= (reg65[(1'h1):(1'h0)] << $unsigned($unsigned((reg56[(2'h2):(1'h0)] ?
                  wire50[(3'h6):(3'h5)] : (~|reg64)))));
              reg58 <= $signed($signed($signed({((8'h9d) + reg57), reg71})));
              reg59 <= $unsigned(reg64[(4'hf):(3'h5)]);
              reg60 <= {(reg62 ?
                      (reg56[(4'hb):(3'h6)] ?
                          (reg65[(1'h0):(1'h0)] ?
                              (reg70 | wire51) : $signed(wire51)) : (!reg60[(4'hb):(4'ha)])) : (($signed((8'ha2)) ?
                          $signed(reg62) : reg59) & (~^((8'ha6) < reg70))))};
            end
        end
    end
  assign wire75 = wire48;
  assign wire76 = ($unsigned((+(~|(reg57 >= reg65)))) ?
                      $unsigned($unsigned(reg74)) : $signed($unsigned($signed((reg67 ?
                          (8'ha0) : (8'ha2))))));
  assign wire77 = $signed(reg67);
  assign wire78 = (8'hab);
  assign wire79 = $signed((8'hb5));
  assign wire80 = reg55[(4'h8):(2'h3)];
  assign wire81 = (wire78[(3'h6):(2'h3)] * $unsigned(wire79[(5'h10):(4'hb)]));
  assign wire82 = ($unsigned((reg61 >= $signed($signed(reg58)))) ?
                      ((reg74 ?
                          $signed((~reg74)) : {((8'hb2) ? reg62 : reg74),
                              $signed(reg74)}) << (wire79[(4'hc):(4'hc)] > $unsigned({wire78}))) : (reg60 ~^ wire50[(4'hb):(3'h5)]));
endmodule

module module22
#(parameter param44 = ((-(({(8'ha0)} > ((8'hb6) ? (8'had) : (8'hb5))) ? (((8'ha7) || (8'h9d)) >> (^~(8'ha7))) : {((8'ha3) ? (7'h41) : (8'haf))})) == ({(((8'hbd) <<< (8'ha0)) ? (~^(8'hb6)) : ((8'hb4) - (8'hb0)))} * (+{((7'h41) ? (8'hb6) : (8'ha3)), ((8'ha5) ? (8'h9f) : (8'hbf))}))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire27 = ((wire26[(1'h0):(1'h0)] == (8'hb5)) <<< $unsigned({((wire23 || (8'h9c)) ?
                          (wire23 ? wire23 : wire24) : $signed(wire24))}));
  assign wire28 = (($signed(($signed(wire27) >>> $unsigned(wire27))) ?
                      {$signed(wire23)} : ((wire26 ^ wire27[(4'hf):(4'ha)]) ?
                          {(&(8'hb0)),
                              (wire26 ? wire23 : wire27)} : $signed({wire27,
                              wire26}))) > (wire24 ?
                      {wire24[(1'h0):(1'h0)]} : $signed({wire27[(4'hb):(4'h9)],
                          (-wire25)})));
  assign wire29 = wire25[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg30 <= $signed(((((wire28 + wire23) >>> (wire24 ?
              (7'h42) : wire29)) ^ (^(+wire27))) ?
          wire29 : (((~|wire29) ? wire28 : $signed((8'hb5))) ^~ (~&(wire24 ?
              (8'hb0) : wire28)))));
      reg31 <= (8'hb1);
    end
  assign wire32 = wire26;
  assign wire33 = $signed($unsigned(($unsigned($signed(wire25)) <<< (+(&(8'ha4))))));
  assign wire34 = $unsigned((8'h9e));
  assign wire35 = $unsigned((wire24[(1'h0):(1'h0)] ?
                      $signed({{reg30}, ((8'ha1) ~^ wire34)}) : (~^wire33)));
  assign wire36 = $unsigned((wire23[(3'h4):(1'h0)] ?
                      (wire26 ?
                          ((wire28 >>> reg30) ?
                              (wire25 > wire32) : {wire27}) : ((^wire28) ?
                              $unsigned(wire25) : $unsigned(wire27))) : {((wire34 * wire35) ?
                              reg30[(4'hb):(1'h0)] : (^wire25)),
                          {(wire26 ? reg31 : wire33)}}));
  assign wire37 = (8'hae);
  assign wire38 = ((~&$signed(wire24[(1'h0):(1'h0)])) == ($unsigned(wire35[(4'h8):(2'h3)]) ?
                      $signed($unsigned({wire32, wire36})) : $unsigned((wire26 ?
                          (wire25 ?
                              (7'h44) : (8'ha0)) : reg31[(1'h0):(1'h0)]))));
  assign wire39 = wire33;
  assign wire40 = wire39[(4'ha):(3'h7)];
  assign wire41 = $unsigned((wire27[(3'h5):(2'h3)] ?
                      wire23[(5'h11):(4'ha)] : (~&($unsigned(wire24) ?
                          $unsigned((7'h41)) : $signed((8'haa))))));
  assign wire42 = {($signed(wire28) & ((8'ha4) ?
                          (wire27 * ((7'h43) ?
                              wire41 : wire38)) : wire38[(2'h3):(1'h0)])),
                      (~|(|(~^wire35)))};
  assign wire43 = $unsigned(($signed((~wire27[(4'hb):(3'h5)])) ~^ wire29));
endmodule
