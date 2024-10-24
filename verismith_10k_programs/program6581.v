module top
#(parameter param143 = ((~&(+(~(~(8'haa))))) ? ({(&(~&(8'h9f))), (((8'hbd) + (8'ha6)) ? (^~(8'hb6)) : {(8'hb7), (8'haf)})} <<< ({((8'hb3) & (8'hb6))} ~^ ({(8'hb3), (8'ha9)} != (!(8'ha0))))) : ({({(8'hae)} + (~(8'hbe))), (((7'h41) ^~ (8'hbc)) ? ((8'ha9) && (8'hb0)) : ((8'h9c) ? (8'hac) : (8'hb5)))} || (7'h40))), 
parameter param144 = (8'h9f))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire138;
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire140,
                 wire138,
                 reg142,
                 reg141,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&wire4))
        begin
          reg5 <= $unsigned($signed($unsigned($unsigned((wire3 - wire4)))));
          if ($unsigned($signed(wire2)))
            begin
              reg6 <= wire2[(3'h5):(3'h4)];
              reg7 <= $unsigned(((~(~^reg6)) ? reg6 : wire3));
            end
          else
            begin
              reg6 <= reg6[(3'h5):(3'h4)];
            end
          reg8 <= $unsigned($signed({wire4[(4'h8):(3'h6)]}));
          if ($signed({$unsigned(reg8), $signed($unsigned({reg7}))}))
            begin
              reg9 <= $signed((wire1 ^~ ((~&(&reg8)) <<< $signed({reg6}))));
              reg10 <= $unsigned((!((wire2[(2'h2):(1'h0)] + (wire3 + wire1)) ?
                  ((^~reg5) ^ wire4) : wire1)));
              reg11 <= {reg10[(3'h6):(3'h6)]};
              reg12 <= wire3;
              reg13 <= ($unsigned($signed((reg7 ^~ reg12))) ?
                  reg11[(4'hd):(1'h1)] : wire4[(4'h8):(2'h3)]);
            end
          else
            begin
              reg9 <= (reg6[(5'h13):(5'h12)] ?
                  ($signed({$unsigned(reg9)}) ?
                      $unsigned($unsigned((^~reg13))) : (((reg13 ?
                              reg11 : reg13) ~^ $unsigned(reg10)) ?
                          $signed($signed(reg12)) : $unsigned(wire4[(4'h8):(3'h4)]))) : wire3[(5'h14):(4'h8)]);
            end
          reg14 <= wire4;
        end
      else
        begin
          reg5 <= $signed(wire3);
        end
      if ($unsigned($unsigned((((^reg6) < (reg5 - reg10)) + reg9))))
        begin
          reg15 <= (reg9 ?
              ((+((reg6 && wire0) ?
                  (wire3 ?
                      (8'h9c) : reg6) : reg12)) & $signed($signed((~^wire0)))) : wire4[(3'h5):(2'h2)]);
          reg16 <= $signed($unsigned(wire4[(3'h7):(3'h6)]));
          reg17 <= (^$unsigned(((((8'hbb) ?
              reg15 : reg14) > reg6) == {((8'hb3) ? reg13 : reg12),
              reg12[(3'h7):(3'h4)]})));
          reg18 <= (~^reg12);
          reg19 <= (reg10[(3'h4):(2'h3)] ?
              (|reg14[(1'h0):(1'h0)]) : ($signed(((~&reg18) <<< reg7[(1'h0):(1'h0)])) == ($unsigned(reg15) ?
                  {(^~reg12), $unsigned(reg17)} : {reg17})));
        end
      else
        begin
          reg15 <= $signed(({{(reg17 ? reg11 : wire0), reg11}} ?
              ($signed((~|reg9)) ?
                  $unsigned((reg18 > reg10)) : ($unsigned(reg10) >= $unsigned(reg10))) : reg18));
          if ({reg5[(4'h8):(1'h1)], reg16[(1'h0):(1'h0)]})
            begin
              reg16 <= $unsigned(wire0);
            end
          else
            begin
              reg16 <= $unsigned(((($unsigned(wire2) >= (reg6 ?
                      reg12 : reg5)) ^ (reg16[(4'h9):(3'h5)] <= (wire3 + reg17))) ?
                  ((+reg12[(4'h8):(3'h7)]) ^ {(reg15 <<< reg12)}) : (^~{(reg6 <= wire2),
                      $unsigned(wire0)})));
              reg17 <= (+(~^reg9[(4'hf):(1'h1)]));
              reg18 <= $unsigned(reg14[(4'ha):(2'h2)]);
              reg19 <= (^$unsigned({($signed((8'hb0)) ?
                      $unsigned(reg15) : $unsigned(reg18)),
                  $unsigned($signed((8'hb8)))}));
            end
          reg20 <= {reg10[(3'h7):(3'h6)]};
          reg21 <= {$signed($unsigned(reg14[(5'h12):(4'he)]))};
        end
    end
  module22 #() modinst139 (.clk(clk), .wire24(reg13), .wire23(reg8), .wire27(reg21), .y(wire138), .wire26(reg5), .wire25(wire2));
  assign wire140 = ($unsigned(((^wire3) << wire138)) ?
                       $unsigned(reg16[(3'h7):(1'h0)]) : wire3[(4'hc):(4'hb)]);
  always
    @(posedge clk) begin
      reg141 <= $unsigned($unsigned({$unsigned(reg18[(2'h2):(2'h2)])}));
      reg142 <= ((~&(8'hae)) != (~|reg21[(4'hb):(4'h8)]));
    end
endmodule

module module22
#(parameter param136 = {{((((8'ha5) - (8'ha4)) ? ((8'h9c) ? (8'ha9) : (8'had)) : ((8'h9f) ? (8'ha6) : (8'hbe))) - ((~|(8'had)) ? (&(7'h43)) : ((7'h44) ^~ (8'h9f)))), ({(^(8'hb1))} ? {((8'hbc) ? (8'hb8) : (8'hba)), (&(8'hb8))} : (|((8'h9c) ? (8'hbb) : (8'hba))))}}, 
parameter param137 = {(param136 | (param136 ? param136 : (-param136)))})
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h265):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire133;
  wire signed [(2'h2):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire106;
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire106,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= ({(~|($unsigned(wire25) << ((8'ha7) ?
              wire24 : wire25)))} ^ wire23[(4'h8):(1'h0)]);
      if ($unsigned($unsigned($signed(wire24[(4'h9):(3'h4)]))))
        begin
          reg29 <= $signed(($unsigned(($unsigned(wire24) >>> wire25[(4'hc):(1'h0)])) && (wire25[(4'hb):(3'h4)] <<< ($signed(wire24) ?
              wire26[(3'h5):(3'h4)] : $unsigned((8'hac))))));
          reg30 <= reg28[(1'h0):(1'h0)];
          reg31 <= ($unsigned($unsigned(wire27[(2'h3):(1'h0)])) ?
              wire27 : (8'hbc));
          if ($signed((($unsigned((wire24 - reg30)) == ($unsigned(wire25) & wire26)) ?
              $signed(reg29[(4'he):(4'hb)]) : (-wire24))))
            begin
              reg32 <= (wire26 ~^ ((wire25 > ((-reg30) ?
                  reg30 : $signed(reg29))) - reg31));
              reg33 <= wire23[(1'h0):(1'h0)];
              reg34 <= $signed($signed(($signed(wire25[(5'h13):(3'h5)]) >> $signed(wire23[(4'h8):(2'h3)]))));
              reg35 <= ((((reg30 ?
                  (wire26 << reg28) : $unsigned(reg34)) >>> (^~reg29)) != {wire25,
                  ((8'hb8) * (7'h40))}) ~^ (!(8'hb2)));
            end
          else
            begin
              reg32 <= {wire23};
            end
        end
      else
        begin
          if ($unsigned(wire23[(2'h2):(2'h2)]))
            begin
              reg29 <= (({$signed({reg30, wire23}),
                      $signed((~&reg30))} ^ $signed(($signed(wire24) ?
                      (8'hab) : wire25))) ?
                  $signed((wire26 <<< (~^(!wire27)))) : {(wire27[(1'h1):(1'h1)] ?
                          $signed(reg33[(3'h6):(3'h6)]) : {{reg31, wire26}}),
                      $unsigned($signed(reg28[(2'h2):(1'h1)]))});
              reg30 <= wire24[(3'h7):(1'h0)];
            end
          else
            begin
              reg29 <= (~|{({$signed(reg33),
                      reg30[(2'h3):(1'h0)]} && (-$unsigned(wire23))),
                  $unsigned((~&wire26))});
              reg30 <= (wire23 & $unsigned((8'ha9)));
              reg31 <= (~^reg32[(4'hf):(3'h7)]);
            end
          reg32 <= (~^$signed($unsigned($signed((wire25 >= wire24)))));
          reg33 <= ($unsigned(reg35[(1'h0):(1'h0)]) - reg34[(1'h1):(1'h0)]);
          reg34 <= reg31;
        end
      if (reg28[(2'h2):(2'h2)])
        begin
          reg36 <= (~|(|reg34));
          reg37 <= ($signed(reg31) | ($unsigned(wire26) ?
              (8'ha8) : ((reg30 ?
                  (+(7'h41)) : wire23[(4'ha):(4'h8)]) != ($unsigned(reg36) ?
                  reg34[(4'hd):(2'h3)] : (reg31 ? wire27 : reg31)))));
          if (($unsigned((((wire24 ? reg28 : (8'had)) >> ((7'h41) ?
              wire26 : (8'hab))) ^ reg35)) >>> (8'ha4)))
            begin
              reg38 <= (~|wire24[(4'hb):(1'h0)]);
              reg39 <= wire27;
              reg40 <= wire23;
            end
          else
            begin
              reg38 <= $unsigned($signed((^reg33)));
              reg39 <= reg39[(1'h0):(1'h0)];
            end
          reg41 <= {(+(~|(reg39 | $unsigned(wire26)))),
              $signed(((!$signed((8'ha6))) ^~ wire24))};
          reg42 <= (-$signed((+((^~reg30) == (wire25 ? reg41 : wire25)))));
        end
      else
        begin
          if ({(((^reg38[(4'ha):(3'h5)]) ?
                  (~|$unsigned(reg30)) : ($signed((8'h9c)) ?
                      (reg31 ?
                          reg33 : (7'h41)) : (reg41 == wire27))) & (~|$unsigned(wire26)))})
            begin
              reg36 <= (-(~&({wire26} ? {(!reg40), reg31} : (8'ha2))));
              reg37 <= (|reg36);
              reg38 <= wire27;
              reg39 <= reg39[(1'h1):(1'h1)];
            end
          else
            begin
              reg36 <= $unsigned((!($signed($unsigned(reg35)) & (~(reg31 ~^ wire25)))));
              reg37 <= $unsigned(($signed(($unsigned(wire25) ?
                      $unsigned((8'hb0)) : wire26)) ?
                  reg30[(3'h5):(1'h1)] : $signed(reg34)));
              reg38 <= ((reg36[(1'h1):(1'h1)] ?
                      (^(&$unsigned(reg42))) : reg41) ?
                  $signed($signed($unsigned((reg38 ?
                      reg29 : reg41)))) : (|(~&{((8'h9f) >> reg36)})));
            end
          reg40 <= reg28[(1'h0):(1'h0)];
          if (($unsigned($signed($unsigned((reg36 - reg29)))) ?
              (^($signed({reg41, reg39}) == ((~reg36) < ((8'ha6) ?
                  wire27 : reg29)))) : (($unsigned($signed(reg28)) <<< $signed(reg31)) ?
                  ((wire26[(1'h1):(1'h0)] + $unsigned(reg37)) ?
                      {{reg31, reg42}} : $signed($signed(reg31))) : (+(&{reg34,
                      reg28})))))
            begin
              reg41 <= (reg37[(4'ha):(1'h0)] || reg31);
              reg42 <= ((wire26[(1'h0):(1'h0)] ?
                      (((reg28 ? reg34 : (8'ha7)) != {(8'ha5),
                          (8'hae)}) + (&reg36[(1'h1):(1'h1)])) : wire23[(4'h9):(3'h6)]) ?
                  wire25 : (^(wire25[(4'he):(1'h0)] ?
                      ((~^reg42) ~^ (reg35 ?
                          reg40 : (8'ha3))) : (reg36[(2'h3):(1'h0)] < ((8'ha3) | reg31)))));
              reg43 <= reg29[(4'hf):(3'h6)];
            end
          else
            begin
              reg41 <= $signed({wire26,
                  (~^((reg42 + reg42) ?
                      (reg41 ? reg38 : reg34) : (~^(8'hac))))});
              reg42 <= {($signed((|reg40)) * reg38), (8'hbe)};
              reg43 <= (|((reg32 && (^((7'h41) ? reg32 : reg40))) ?
                  reg35 : reg32[(2'h3):(2'h3)]));
              reg44 <= {$unsigned(reg42[(4'h9):(4'h8)])};
            end
          reg45 <= reg33;
        end
      if (($unsigned(reg35) ^~ $signed($unsigned(reg31))))
        begin
          reg46 <= wire26;
        end
      else
        begin
          reg46 <= (+$unsigned(((reg32[(4'h8):(1'h1)] ?
              (&reg36) : reg44[(2'h3):(1'h0)]) > (-wire23[(2'h2):(1'h0)]))));
          reg47 <= $unsigned(({(~reg37[(3'h7):(2'h2)])} >> (|$signed($signed(reg30)))));
          reg48 <= wire27;
        end
      if (reg28)
        begin
          if ((!($signed(((reg48 && reg48) & reg41)) >> wire26)))
            begin
              reg49 <= ((8'hbd) != $signed($unsigned(reg47[(3'h4):(2'h2)])));
            end
          else
            begin
              reg49 <= (reg40 ?
                  wire25 : ({((!reg28) > (reg34 && reg45))} ?
                      (($unsigned(reg43) ?
                          (reg35 ? reg36 : reg32) : ((8'hb7) ?
                              wire27 : reg48)) & ((wire24 < wire23) ^~ reg44[(4'hb):(3'h5)])) : (!$unsigned($signed((8'hb3))))));
              reg50 <= ($signed($signed($unsigned((-reg47)))) ?
                  (^$signed($unsigned((~reg43)))) : (~wire26));
              reg51 <= {reg37[(4'hd):(1'h0)]};
              reg52 <= (|((8'h9d) & reg30[(2'h3):(1'h0)]));
              reg53 <= (reg36[(3'h4):(1'h0)] == (reg32[(5'h11):(4'hd)] && reg50[(3'h5):(2'h3)]));
            end
          reg54 <= $signed({(~&{reg46}), reg48[(1'h1):(1'h0)]});
          reg55 <= (8'hbe);
        end
      else
        begin
          reg49 <= ($unsigned($signed((-(^reg41)))) ?
              reg31 : (^~wire27[(1'h0):(1'h0)]));
          reg50 <= (8'hb5);
          if ((~{reg46[(3'h4):(1'h1)]}))
            begin
              reg51 <= $signed((reg43 ^~ $unsigned((~(7'h44)))));
              reg52 <= ((&reg29[(4'hd):(1'h0)]) <<< $unsigned($unsigned({$signed(reg31),
                  reg48})));
              reg53 <= ($signed(({(reg41 <= reg40)} ?
                      (~&$unsigned(reg40)) : ($signed(reg54) ^~ (reg53 ?
                          reg48 : (8'hbe))))) ?
                  reg36 : ($unsigned({$signed(reg38)}) != reg48));
              reg54 <= $signed($signed($unsigned(((reg38 ? (8'had) : wire26) ?
                  $signed(reg40) : (~reg38)))));
            end
          else
            begin
              reg51 <= $signed(reg29[(5'h11):(4'ha)]);
            end
          if ({{(reg42[(5'h13):(4'he)] ~^ reg47[(3'h7):(3'h4)]),
                  (+$unsigned({reg31}))}})
            begin
              reg55 <= (((($signed(reg50) ~^ $unsigned(reg47)) ?
                  {(-reg46),
                      $unsigned(reg41)} : $signed((~reg54))) <= (^(~&(reg49 ?
                  (8'ha5) : wire25)))) + ($signed($signed($unsigned(reg53))) ?
                  reg48 : reg43));
              reg56 <= reg29[(2'h2):(2'h2)];
              reg57 <= {wire27[(1'h0):(1'h0)]};
              reg58 <= ({(!reg44),
                  {reg54[(3'h4):(1'h0)]}} > $unsigned($signed(reg40)));
              reg59 <= reg38;
            end
          else
            begin
              reg55 <= reg44[(3'h7):(3'h5)];
            end
          reg60 <= $unsigned($signed(($unsigned(reg37) & (~&reg39))));
        end
    end
  always
    @(posedge clk) begin
      reg61 <= $unsigned((8'hb2));
      reg62 <= reg37;
      reg63 <= (~^(^$signed((((8'had) ? reg41 : reg52) ?
          (reg56 ? reg54 : (8'ha1)) : reg33))));
      reg64 <= (~&$unsigned($signed($signed(reg45))));
      reg65 <= ({$signed($signed({reg49, (8'hbd)}))} ?
          $signed($signed($signed(reg57[(2'h3):(2'h3)]))) : reg38[(4'he):(4'hb)]);
    end
  module66 #() modinst107 (.wire70(reg42), .wire67(reg35), .y(wire106), .wire71(reg60), .clk(clk), .wire69(reg48), .wire68(reg49));
  assign wire108 = (((8'hbc) - ($signed((8'hbb)) ?
                       $signed(reg29) : (~^$signed(wire24)))) < reg64);
  assign wire109 = $unsigned($unsigned(reg34[(4'h8):(1'h0)]));
  assign wire110 = $unsigned($signed(($unsigned(reg42) ?
                       ((~^reg48) * (8'ha6)) : $signed((reg63 || reg44)))));
  assign wire111 = (reg63[(3'h4):(3'h4)] && $signed(({{reg50},
                       $signed(reg54)} >> (~|$signed((8'ha4))))));
  module112 #() modinst131 (wire130, clk, reg59, reg28, reg33, reg52);
  assign wire132 = (~&(-$unsigned((7'h44))));
  assign wire133 = reg53[(3'h6):(1'h1)];
  assign wire134 = reg57[(3'h5):(2'h3)];
  assign wire135 = $signed(($unsigned(reg45[(4'ha):(4'h8)]) ?
                       (!reg37) : $unsigned((wire23 ?
                           (~^(8'hae)) : (reg51 <= reg63)))));
endmodule

module module112  (y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire116;
  input wire signed [(5'h15):(1'h0)] wire115;
  input wire signed [(5'h12):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  assign y = {wire129,
                 wire119,
                 wire118,
                 wire117,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire117 = {(!wire114[(4'hf):(3'h6)]), (&((8'hb7) >= wire115))};
  assign wire118 = wire115[(2'h2):(2'h2)];
  assign wire119 = wire113[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      reg120 <= (~^(($signed($unsigned(wire119)) ?
          wire116[(2'h2):(1'h0)] : wire114[(4'ha):(4'h8)]) - wire118[(1'h0):(1'h0)]));
      if ($unsigned(((+$unsigned(reg120[(3'h5):(2'h3)])) ?
          ((&$signed(wire113)) == wire116) : (&{wire113[(3'h7):(3'h4)]}))))
        begin
          reg121 <= wire115[(3'h7):(1'h1)];
          if ((^~(wire118[(1'h1):(1'h1)] > (((^wire118) ?
              $unsigned(reg121) : ((8'hbf) ? wire116 : wire114)) >>> reg120))))
            begin
              reg122 <= wire119[(3'h5):(1'h0)];
              reg123 <= wire117[(3'h5):(3'h4)];
            end
          else
            begin
              reg122 <= wire118[(1'h0):(1'h0)];
              reg123 <= $unsigned(($signed($unsigned((reg123 ?
                      wire113 : wire118))) ?
                  wire115[(5'h11):(2'h2)] : (wire117[(1'h0):(1'h0)] ^~ $unsigned(reg123))));
              reg124 <= ($signed(wire116[(4'ha):(3'h4)]) ?
                  (-reg120[(2'h2):(2'h2)]) : {$signed((^~(wire117 != wire116)))});
              reg125 <= ($unsigned($signed(((wire115 != wire118) ?
                  (reg124 & wire113) : {wire114}))) < ($signed(((&wire118) ?
                      (reg124 ? reg124 : wire114) : $unsigned(wire116))) ?
                  $signed($unsigned($signed(wire114))) : $unsigned((~(reg123 ?
                      wire115 : wire116)))));
            end
          reg126 <= (+$signed(reg120[(4'hd):(4'ha)]));
          reg127 <= wire119;
          reg128 <= ($signed(((reg124[(1'h1):(1'h1)] == $signed(reg126)) ?
                  reg120[(4'ha):(4'ha)] : wire119[(3'h5):(2'h2)])) ?
              wire116 : wire117[(3'h7):(3'h6)]);
        end
      else
        begin
          reg121 <= (8'h9c);
          reg122 <= (($unsigned({reg125,
                  $signed(wire118)}) && $signed(((reg128 | reg123) < $unsigned(wire119)))) ?
              $signed(($unsigned((|reg122)) || $unsigned({reg122}))) : (reg123 ?
                  ({$unsigned((8'haa)), (^reg120)} ?
                      $signed($signed(reg120)) : ((~wire119) ?
                          reg124[(2'h2):(1'h0)] : (reg120 < wire113))) : $signed(wire118)));
          reg123 <= ($signed(wire118[(2'h2):(1'h0)]) >>> ({(~&(wire119 ?
                      reg127 : reg127)),
                  wire115[(3'h6):(2'h2)]} ?
              $signed({(reg127 ? (8'hb8) : wire118),
                  $unsigned((8'ha0))}) : reg126[(2'h3):(1'h1)]));
          reg124 <= $unsigned(reg128);
          reg125 <= (^(((!$signed(reg120)) ?
                  $unsigned(reg124) : ((7'h42) || reg121)) ?
              (wire119 * $signed((reg127 < wire117))) : {((wire118 < wire113) >> (8'hb8))}));
        end
    end
  assign wire129 = reg121;
endmodule

module module66
#(parameter param105 = {{((|(~(8'ha0))) && (&(~&(8'h9f)))), (({(7'h43)} ? ((8'hba) * (8'hab)) : (^~(8'ha8))) ? (((8'h9f) - (8'hae)) + (+(8'ha5))) : (~(^(7'h41))))}, ({(&((8'hae) >>> (8'hbc))), (~|{(8'hb8)})} - {{((8'ha2) ? (8'hb7) : (8'ha8))}})})
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  input wire signed [(5'h15):(1'h0)] wire69;
  input wire [(5'h10):(1'h0)] wire68;
  input wire [(5'h11):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire72 = (($unsigned($signed((~&wire69))) + wire70) + {wire70[(3'h5):(1'h1)]});
  assign wire73 = $unsigned(((~&wire68[(2'h3):(2'h2)]) ?
                      $signed(wire68) : ($signed(wire70) ?
                          wire70[(3'h6):(1'h1)] : (+wire70[(4'h9):(3'h4)]))));
  assign wire74 = {(((-$unsigned(wire71)) ~^ $signed($unsigned(wire73))) | (((^wire69) << wire73) ?
                          wire71 : ({wire67} - (!wire67))))};
  assign wire75 = wire74[(3'h7):(3'h4)];
  assign wire76 = (^wire68);
  assign wire77 = wire69[(5'h13):(5'h11)];
  always
    @(posedge clk) begin
      if (wire71)
        begin
          reg78 <= ({(8'hb1)} && (wire74[(3'h6):(1'h0)] || ((~&(wire68 ?
                  (8'hb9) : wire74)) ?
              wire69[(4'ha):(3'h7)] : wire73)));
        end
      else
        begin
          if ($signed((^~wire70[(2'h3):(2'h2)])))
            begin
              reg78 <= ({((|{wire67, (8'hbd)}) < wire67)} ?
                  $signed($unsigned(({wire70} ?
                      wire71 : ((8'haf) ^ wire68)))) : wire72[(3'h6):(3'h4)]);
              reg79 <= (wire73 || wire70[(3'h4):(1'h1)]);
              reg80 <= $unsigned(((8'hbb) ?
                  {{wire70, reg78[(3'h4):(2'h2)]},
                      wire71} : (|$signed((~^wire67)))));
              reg81 <= ($unsigned((~|$unsigned((!reg78)))) ?
                  $signed(wire72) : ((~$unsigned(((8'hb3) ? reg80 : reg79))) ?
                      (wire69 && $unsigned((7'h44))) : $unsigned((reg78 ?
                          reg80[(4'h8):(3'h4)] : wire71[(4'hf):(3'h7)]))));
            end
          else
            begin
              reg78 <= wire71;
              reg79 <= $unsigned((!{(8'hb2)}));
              reg80 <= $signed(reg80);
            end
          reg82 <= (^~$signed((((~^reg79) <= (wire71 > reg79)) ?
              (wire70[(1'h0):(1'h0)] << (~&wire73)) : ((^~reg79) ?
                  (reg79 ? (8'h9e) : wire68) : wire72[(3'h4):(1'h0)]))));
          reg83 <= {wire67[(3'h5):(3'h4)], wire75};
          reg84 <= $unsigned(wire68[(2'h3):(2'h3)]);
        end
      if ((~&wire73))
        begin
          reg85 <= reg78;
          reg86 <= $signed((reg85 ?
              {(wire76[(3'h6):(2'h3)] ?
                      $signed((7'h44)) : reg80[(2'h2):(2'h2)])} : (($signed(wire68) ^~ $unsigned(wire68)) ?
                  (8'hbc) : ((wire68 != reg82) ?
                      $signed(wire74) : {reg78, reg80}))));
          reg87 <= $unsigned($signed($signed($signed((+(8'hae))))));
        end
      else
        begin
          reg85 <= reg78;
        end
      reg88 <= reg79[(3'h4):(1'h1)];
      if (reg86)
        begin
          reg89 <= $unsigned($unsigned((~^reg86)));
          if ((reg81[(5'h15):(5'h14)] < $unsigned(($unsigned({reg86}) ?
              $signed($unsigned(reg81)) : ((~|reg79) ?
                  $signed(reg79) : {reg87})))))
            begin
              reg90 <= (~(+({(wire77 ? wire70 : wire67)} ?
                  ($signed(reg83) ?
                      wire72[(3'h7):(2'h3)] : $signed(wire68)) : {(~|reg79),
                      {reg85, wire72}})));
              reg91 <= {({reg88} ?
                      {($signed(reg88) ?
                              (reg88 ? wire69 : reg87) : (wire73 ?
                                  (8'ha7) : reg86))} : $signed(reg86)),
                  $unsigned(reg90[(1'h1):(1'h0)])};
              reg92 <= ($signed(wire69) ?
                  ((($unsigned(wire68) ?
                          (8'h9d) : reg79[(4'hc):(4'h9)]) && ((reg89 ?
                              reg84 : wire70) ?
                          wire68[(3'h5):(1'h0)] : wire70[(2'h2):(1'h1)])) ?
                      wire70[(3'h6):(2'h2)] : (^~$unsigned($unsigned(reg83)))) : $unsigned(((8'hb9) ?
                      $unsigned($unsigned(wire67)) : ({reg91} >>> (&(7'h44))))));
              reg93 <= (~^($unsigned($unsigned({reg79, (8'hbb)})) ?
                  reg87 : (|$signed(reg90))));
              reg94 <= $signed((~&((reg87 ?
                      $unsigned(wire71) : $signed(reg79)) ?
                  $unsigned(wire74[(1'h1):(1'h0)]) : (-wire76))));
            end
          else
            begin
              reg90 <= ((8'ha7) + ((($signed(reg90) ?
                      reg89[(4'h9):(3'h5)] : (wire72 == reg94)) >> reg87[(1'h1):(1'h0)]) ?
                  $signed($signed((reg94 << reg90))) : reg83));
              reg91 <= (reg89[(4'hd):(4'ha)] ?
                  ({wire76} ~^ {(((8'hb9) ? reg92 : wire68) ?
                          $signed(reg87) : {(8'hb2), wire76})}) : {reg83});
              reg92 <= $signed($signed(({(~^wire72)} ?
                  wire74[(1'h1):(1'h0)] : (reg78 & $signed(wire76)))));
            end
          if ((~^$signed((~|($unsigned(reg83) - $unsigned(reg86))))))
            begin
              reg95 <= $unsigned($signed((reg88 ?
                  {$signed(reg90),
                      $signed(reg87)} : $signed($signed(wire70)))));
              reg96 <= ($unsigned($signed($unsigned($unsigned(reg88)))) ?
                  ((!$unsigned(wire68)) << ({reg81[(3'h6):(3'h4)],
                      (reg89 ?
                          reg80 : reg83)} >> (reg82 < wire74[(3'h5):(1'h0)]))) : {(|($unsigned(wire71) ^ $unsigned(wire71))),
                      ($unsigned((-reg86)) ?
                          ((^~reg78) ^ (reg92 >= reg92)) : ($signed((8'hac)) >>> reg81[(4'hb):(2'h2)]))});
              reg97 <= wire68[(4'ha):(3'h6)];
              reg98 <= wire68;
            end
          else
            begin
              reg95 <= $signed($unsigned($signed(wire77[(4'h9):(4'h8)])));
              reg96 <= ((^~(wire73 ?
                  wire74 : ((reg78 || (8'had)) == wire67[(4'hc):(3'h7)]))) + {(^({(8'ha3)} > $signed(reg90)))});
              reg97 <= {reg85[(2'h3):(1'h0)],
                  $signed($unsigned(($signed(reg84) <= (reg95 - wire72))))};
              reg98 <= (wire71[(3'h5):(1'h1)] >>> (reg85[(4'hf):(3'h7)] ?
                  reg86[(3'h5):(1'h0)] : (^~(!(|reg87)))));
            end
          if ((8'haf))
            begin
              reg99 <= $signed((~&(wire72 ? reg83 : $signed((^~wire69)))));
            end
          else
            begin
              reg99 <= reg98[(4'he):(1'h0)];
              reg100 <= reg81;
              reg101 <= {(~&{$unsigned($signed(reg97))})};
              reg102 <= $signed(wire74[(3'h7):(1'h1)]);
            end
        end
      else
        begin
          reg89 <= ((reg101[(3'h6):(2'h3)] <= ((+$unsigned(reg84)) ~^ wire69)) && (~|reg80[(4'ha):(4'h9)]));
          reg90 <= $signed(reg102);
          reg91 <= (wire74[(2'h3):(1'h0)] ?
              $signed(wire76[(3'h6):(2'h2)]) : $unsigned((reg96 != $unsigned(reg84))));
        end
    end
  assign wire103 = $signed(reg95[(2'h2):(1'h0)]);
  assign wire104 = wire72[(4'h8):(3'h4)];
endmodule
