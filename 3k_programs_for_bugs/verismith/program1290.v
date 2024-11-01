module top
#(parameter param167 = {(((~^((8'hac) ? (8'ha4) : (8'hab))) > (~^(^~(8'h9e)))) ^~ ((((7'h40) ? (8'ha3) : (7'h42)) ? (~|(8'hbe)) : (7'h42)) ? (~&{(7'h41), (8'hb0)}) : (~((8'hba) << (8'ha0))))), (((((7'h41) ~^ (8'h9c)) ? (8'h9f) : ((8'hae) <<< (8'hb7))) >>> (~(~(8'ha9)))) ? (-(((8'hbc) - (8'ha3)) ? (8'ha6) : (&(8'hb9)))) : ((8'hb0) ^~ (((8'hb2) ? (7'h42) : (8'h9e)) << ((8'hb9) ? (8'haf) : (8'hb1)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire [(3'h4):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire94;
  assign y = {wire165,
                 wire164,
                 wire162,
                 wire61,
                 wire4,
                 wire63,
                 wire64,
                 wire65,
                 wire94,
                 (1'h0)};
  assign wire4 = (&(^$signed((^~(^~wire0)))));
  module5 #() modinst62 (wire61, clk, wire1, wire2, wire0, wire4, wire3);
  assign wire63 = $unsigned($signed(wire61[(4'h8):(2'h3)]));
  assign wire64 = $signed($signed($signed(((wire1 ?
                      wire2 : (8'hab)) >>> $unsigned(wire1)))));
  assign wire65 = (8'hbc);
  module66 #() modinst95 (wire94, clk, wire63, wire4, wire1, wire64, wire3);
  module96 #() modinst163 (wire162, clk, wire2, wire94, wire3, wire65);
  assign wire164 = $signed(wire0);
  module96 #() modinst166 (.wire99(wire1), .clk(clk), .wire100(wire63), .wire97(wire2), .y(wire165), .wire98(wire162));
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire100;
  input wire [(2'h2):(1'h0)] wire99;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire signed [(4'hf):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire110,
                 wire109,
                 wire108,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire101 = $signed(((|((!(8'hb8)) ?
                           wire100[(3'h5):(1'h1)] : ((8'ha5) ?
                               wire100 : (8'ha4)))) ?
                       (&(8'ha3)) : wire100));
  assign wire102 = ({$unsigned($unsigned((wire98 | (7'h44))))} >>> {(wire98[(2'h3):(2'h2)] + (+wire98)),
                       (7'h40)});
  assign wire103 = $signed((~&(~{wire97[(4'h9):(4'h8)]})));
  assign wire104 = wire101[(2'h2):(2'h2)];
  assign wire105 = ((((wire99[(1'h1):(1'h1)] << wire102) ?
                               wire97[(2'h3):(2'h2)] : $unsigned(((8'hae) ?
                                   wire100 : wire104))) ?
                           (8'hb0) : ((wire103 & (^~wire104)) ^~ (!(wire102 && (8'hba))))) ?
                       ($signed(((wire97 << wire98) ?
                           {wire104} : $unsigned(wire100))) - (wire97[(4'he):(4'h9)] ?
                           (-$unsigned(wire99)) : ({wire97} <<< (wire99 + (7'h41))))) : (^~wire103));
  always
    @(posedge clk) begin
      reg106 <= $unsigned(((wire98[(1'h1):(1'h1)] ?
          ((wire99 ? wire105 : wire102) ?
              wire99 : {(8'ha4)}) : wire101[(1'h0):(1'h0)]) + (wire98[(2'h2):(2'h2)] != wire105)));
      if (wire101[(1'h0):(1'h0)])
        begin
          reg107 <= {$unsigned($unsigned($unsigned((wire105 ?
                  wire102 : reg106)))),
              {$unsigned(($signed(wire101) != wire102))}};
        end
      else
        begin
          reg107 <= $signed({{($unsigned(reg107) ^ (~|reg107)),
                  ($unsigned(wire104) | $unsigned(wire99))}});
        end
    end
  assign wire108 = ({$unsigned(wire97),
                           $signed($unsigned({wire104, wire105}))} ?
                       $unsigned(reg106) : reg106);
  assign wire109 = ((&reg107[(1'h1):(1'h0)]) + (~&reg106[(4'h8):(3'h5)]));
  assign wire110 = $signed((wire99[(1'h1):(1'h0)] ?
                       $unsigned({wire97[(1'h1):(1'h0)], {wire97}}) : reg107));
  module111 #() modinst156 (.y(wire155), .clk(clk), .wire115(reg106), .wire114(reg107), .wire112(wire108), .wire113(wire97));
  assign wire157 = {{{(8'hb9), $unsigned($unsigned(wire110))}, reg107}};
  assign wire158 = $signed({wire103[(1'h1):(1'h1)],
                       (wire110[(3'h6):(2'h2)] ?
                           ($unsigned(wire100) ?
                               (8'hb3) : wire100) : $unsigned(((8'hba) ?
                               (8'hb6) : wire157)))});
  assign wire159 = (($signed($unsigned($signed(wire105))) ?
                       (~^(8'ha8)) : wire104[(5'h14):(5'h11)]) | wire101[(3'h4):(3'h4)]);
  assign wire160 = (^($unsigned($unsigned(wire101[(2'h3):(2'h3)])) ?
                       ($unsigned($unsigned(wire103)) ?
                           wire98[(1'h1):(1'h0)] : $signed(wire100)) : wire100[(4'he):(4'hd)]));
  assign wire161 = wire103;
endmodule

module module66
#(parameter param92 = ((~&(((|(8'hae)) ? ((8'ha4) >= (8'hbc)) : ((8'hb8) + (8'hb3))) >> (-((7'h42) || (8'ha4))))) ? ({(((8'hbf) <= (8'hab)) ^~ (+(8'hb2)))} | ({(~&(8'haf)), (^(8'hb7))} ^~ (((7'h41) * (8'ha7)) ^ {(8'hbd)}))) : (+({((8'hae) <<< (8'ha7))} ? (~^(^(8'hb3))) : (((8'hb9) >= (7'h43)) ? (&(8'ha0)) : {(8'hb8)})))), 
parameter param93 = ((((param92 > (param92 <<< param92)) ? ((~^param92) * param92) : ((param92 ? param92 : param92) ? (param92 ? param92 : param92) : {param92})) <<< (!(param92 != {param92}))) ^ (~|(+param92))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire signed [(3'h7):(1'h0)] wire69;
  input wire [(4'h9):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire72;
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire72,
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
                 (1'h0)};
  assign wire72 = $unsigned($signed($unsigned($unsigned(((7'h41) | wire69)))));
  always
    @(posedge clk) begin
      if (((wire71 * (wire71[(1'h0):(1'h0)] | wire68[(4'h9):(3'h7)])) * ({(wire71 ?
                  wire67 : wire71[(1'h1):(1'h1)])} ?
          $signed(wire67) : wire69[(2'h2):(1'h1)])))
        begin
          if ((wire72[(2'h3):(1'h0)] ?
              $unsigned((^~(wire67 * $signed(wire69)))) : $signed({$signed($signed(wire70)),
                  (^$unsigned(wire69))})))
            begin
              reg73 <= (8'h9e);
              reg74 <= wire67[(3'h4):(3'h4)];
              reg75 <= reg73[(2'h2):(1'h0)];
              reg76 <= wire69;
              reg77 <= wire68[(2'h2):(1'h0)];
            end
          else
            begin
              reg73 <= (&wire72[(3'h4):(1'h1)]);
              reg74 <= ($unsigned($unsigned((^{reg75, reg76}))) ?
                  ($unsigned($unsigned($signed(wire72))) == $signed(reg75)) : wire72);
              reg75 <= (~((wire71 & {$unsigned((8'ha4)), wire72}) ?
                  $unsigned((+$signed(wire72))) : (8'hb9)));
              reg76 <= wire71[(2'h3):(1'h0)];
              reg77 <= (reg74[(3'h6):(3'h6)] + wire69[(1'h1):(1'h0)]);
            end
          reg78 <= $unsigned(wire72);
          reg79 <= wire72;
          reg80 <= ($unsigned($signed($signed((wire70 >>> reg76)))) ^ ({((reg77 - reg79) ^ ((8'h9c) ?
                      reg79 : reg78)),
                  wire67} ?
              {($unsigned(wire70) << wire67), reg75} : wire71));
        end
      else
        begin
          reg73 <= $signed((!((wire68[(2'h3):(1'h0)] ?
              $signed(reg79) : (-(8'hbc))) || ({reg73,
              wire68} > $signed(wire69)))));
        end
    end
  always
    @(posedge clk) begin
      if (reg80[(2'h2):(1'h0)])
        begin
          reg81 <= reg78[(3'h6):(2'h3)];
          reg82 <= $signed((($unsigned($unsigned(reg81)) ?
              ($signed(reg75) != reg76) : reg81) >>> reg78));
          reg83 <= reg80;
          reg84 <= $signed($signed(wire72));
          if (reg84)
            begin
              reg85 <= $unsigned((({reg74[(2'h3):(1'h1)],
                          (wire71 ? reg82 : reg80)} ?
                      $signed(reg80) : ($signed(reg83) ?
                          (~|wire69) : reg84[(1'h0):(1'h0)])) ?
                  wire70 : reg83[(3'h5):(2'h2)]));
              reg86 <= (8'h9c);
              reg87 <= $unsigned((({(+reg82)} ?
                      (8'haa) : (|wire67[(4'hc):(3'h7)])) ?
                  {reg84,
                      ((reg82 * reg75) ^~ reg75)} : (&$unsigned((reg86 + wire71)))));
              reg88 <= $signed(reg87[(2'h2):(1'h1)]);
              reg89 <= (((~reg76[(3'h6):(1'h1)]) ?
                      $signed($signed((!wire70))) : reg87) ?
                  $signed((^~reg84)) : (({{reg76}, (reg74 == reg79)} ?
                      ((~wire69) * $signed(reg82)) : (8'haf)) > reg74[(3'h6):(2'h2)]));
            end
          else
            begin
              reg85 <= $unsigned($signed($signed((reg85[(2'h3):(1'h1)] && reg73[(2'h3):(2'h3)]))));
              reg86 <= $signed(((8'hb2) >> (~|$signed((wire72 ?
                  reg73 : (8'ha8))))));
              reg87 <= {reg85, {{(reg88 * (~&reg86)), (~&reg73)}}};
            end
        end
      else
        begin
          reg81 <= (((~|((+wire72) >> (|reg80))) - {$signed((reg88 ?
                      reg84 : reg86)),
                  (reg83 ? (reg74 ? reg80 : reg78) : $unsigned(reg82))}) ?
              (8'ha7) : wire69[(3'h5):(1'h0)]);
          reg82 <= {(reg82 ^~ (wire67 ?
                  reg85[(4'h8):(2'h2)] : (reg74[(2'h3):(2'h3)] ?
                      reg81 : reg73[(4'hd):(4'hb)])))};
          if (((reg73 && wire67) ^~ wire71))
            begin
              reg83 <= (^wire67);
              reg84 <= $signed({(~&$signed(reg79[(3'h6):(3'h5)]))});
            end
          else
            begin
              reg83 <= ($unsigned(wire71) ?
                  (^((^reg82[(3'h7):(3'h4)]) < reg89)) : $unsigned(reg82[(3'h5):(1'h0)]));
              reg84 <= (reg83 ^ (8'ha1));
              reg85 <= ({{(+$signed(reg80))},
                  (|$signed((reg75 << reg73)))} & $unsigned($signed(reg87)));
              reg86 <= (((wire69[(3'h7):(3'h6)] ?
                          reg80[(1'h0):(1'h0)] : (reg80[(2'h2):(1'h1)] ?
                              $signed(reg81) : (reg80 ? reg75 : wire72))) ?
                      {$unsigned($unsigned(reg82))} : (~|reg73[(3'h5):(3'h5)])) ?
                  $signed($unsigned((~&$signed(reg79)))) : (~&{reg85[(3'h5):(3'h5)],
                      wire68[(3'h4):(1'h0)]}));
              reg87 <= (~&$signed(reg87));
            end
        end
    end
  assign wire90 = reg86;
  assign wire91 = reg85[(3'h6):(2'h3)];
endmodule

module module5
#(parameter param60 = (((^((8'hbc) ? ((7'h41) != (8'ha1)) : ((8'ha5) ? (8'hac) : (7'h41)))) < (((|(7'h40)) ^ ((8'h9f) <<< (8'h9f))) ? (-((8'had) - (8'ha1))) : (((8'hba) ? (8'ha4) : (8'hb5)) ? ((8'had) | (8'ha9)) : (+(8'hb7))))) ? ({((8'hbc) | ((8'hbc) >= (8'hab)))} ? {(((8'ha5) ? (8'had) : (8'hb2)) || ((7'h41) ^ (7'h41)))} : {(-((8'hb6) >>> (8'hb3)))}) : ((7'h41) & ((((8'hb2) >> (8'ha9)) ? ((7'h41) ? (8'h9e) : (8'ha0)) : (~^(8'ha0))) ? {{(7'h42), (8'hae)}, {(8'hbe)}} : (((8'ha1) != (7'h43)) ? (^(8'hb6)) : (8'haf))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire45;
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire11,
                 wire45,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire11 = $signed(wire7[(4'h9):(2'h3)]);
  module12 #() modinst46 (.clk(clk), .wire17(wire10), .wire14(wire9), .wire15(wire11), .y(wire45), .wire16(wire8), .wire13(wire7));
  always
    @(posedge clk) begin
      reg47 <= {($signed($unsigned({wire10})) ~^ wire45),
          $signed($unsigned(wire7[(1'h1):(1'h0)]))};
      reg48 <= (reg47 || ($signed((wire10 * (~|wire7))) ?
          $signed($unsigned((wire6 != wire9))) : wire9[(1'h0):(1'h0)]));
    end
  assign wire49 = ((8'h9d) ? wire7[(4'hb):(4'hb)] : (~wire8));
  assign wire50 = wire10;
  always
    @(posedge clk) begin
      reg51 <= wire49[(1'h1):(1'h0)];
      reg52 <= reg48;
      if ($unsigned((wire10[(4'h9):(4'h8)] * $unsigned({$unsigned(reg47)}))))
        begin
          if (wire45[(4'ha):(4'ha)])
            begin
              reg53 <= (reg47 ?
                  (&(|$unsigned(((8'hab) ?
                      (8'ha7) : wire9)))) : $unsigned(reg52[(2'h2):(1'h1)]));
              reg54 <= reg48;
              reg55 <= $unsigned({(~&wire6[(2'h2):(2'h2)]),
                  $unsigned($signed((8'hb4)))});
              reg56 <= ($unsigned(reg52[(3'h6):(3'h5)]) < wire11[(3'h4):(1'h0)]);
              reg57 <= {$signed(reg52[(3'h4):(1'h1)])};
            end
          else
            begin
              reg53 <= reg56;
              reg54 <= {$unsigned(reg48)};
              reg55 <= (^$unsigned(wire50[(3'h7):(3'h6)]));
              reg56 <= (reg53[(1'h0):(1'h0)] >= $signed(((^~$signed(wire7)) ?
                  (^{reg56, wire50}) : ((reg47 ? reg48 : reg54) ?
                      (wire6 ? wire6 : reg47) : reg52[(2'h2):(1'h0)]))));
            end
          reg58 <= ((~|wire10[(2'h2):(2'h2)]) != $unsigned((~wire11[(1'h0):(1'h0)])));
          reg59 <= reg51[(2'h3):(1'h0)];
        end
      else
        begin
          reg53 <= ((reg56 ?
              (reg47[(3'h5):(1'h1)] > $signed({reg56})) : reg48) == (($signed((!(8'hb5))) ?
                  ({wire7, (8'ha2)} ~^ (reg58 ?
                      wire6 : (8'h9c))) : (~&$unsigned(reg53))) ?
              ((^{reg48}) ?
                  (!(reg51 ?
                      wire9 : wire49)) : ({wire7} && $unsigned(reg52))) : ({(^~reg48)} ~^ ((wire6 ?
                      wire45 : reg48) ?
                  reg58 : reg55[(2'h3):(2'h2)]))));
          reg54 <= (~^(&wire10));
          reg55 <= (($unsigned(($unsigned(reg48) && $signed(wire11))) ?
                  $signed($signed($unsigned((8'h9f)))) : {$unsigned($signed(reg47))}) ?
              (+$signed((~|{reg57, reg54}))) : ((|wire7[(3'h6):(2'h3)]) ?
                  (7'h42) : $signed((~|wire9))));
          if (reg55)
            begin
              reg56 <= $signed((~&wire6[(4'hc):(3'h4)]));
              reg57 <= $signed($unsigned((!{(~&wire11)})));
              reg58 <= (((^(~&(^~reg59))) ?
                  $unsigned(reg56) : $signed($signed(((8'hac) | (7'h44))))) <<< (^~wire45));
            end
          else
            begin
              reg56 <= (wire11 ? reg56 : reg57[(2'h3):(1'h1)]);
            end
        end
    end
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  assign y = {wire44,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg29,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = ($unsigned($unsigned(({wire17,
                      (8'had)} ^~ wire15[(4'hf):(2'h3)]))) != (!wire13));
  assign wire19 = wire15;
  always
    @(posedge clk) begin
      reg20 <= ((8'hb5) - $signed({((~&wire18) ?
              ((8'ha0) ? wire18 : wire13) : $signed(wire19)),
          (^~(-(8'hab)))}));
      reg21 <= reg20;
    end
  assign wire22 = ({$signed($unsigned($signed((7'h41)))), wire19} ?
                      wire14 : wire16[(2'h2):(2'h2)]);
  assign wire23 = ((($signed({wire18, wire13}) * ($unsigned(wire22) ?
                          $unsigned(wire14) : (+wire15))) ?
                      $signed({$signed(wire19),
                          (+wire18)}) : reg20) ^ $unsigned((wire13 ?
                      (~|(7'h41)) : ((8'ha8) ?
                          (reg20 ? wire15 : wire19) : wire13))));
  assign wire24 = wire17[(3'h4):(1'h1)];
  assign wire25 = (wire23[(2'h2):(2'h2)] ?
                      (wire22[(3'h4):(1'h0)] ?
                          $signed(wire24[(1'h1):(1'h0)]) : $unsigned(($unsigned((8'hb6)) < $signed(wire16)))) : reg20);
  assign wire26 = (!(8'h9e));
  assign wire27 = (~^$unsigned($signed((|reg21))));
  assign wire28 = (^$unsigned(wire18));
  always
    @(posedge clk) begin
      reg29 <= wire26[(5'h13):(3'h6)];
    end
  assign wire30 = (|($unsigned(($unsigned(wire18) ?
                          (wire13 > wire22) : $unsigned(wire19))) ?
                      wire24 : {$unsigned((wire18 + wire28))}));
  assign wire31 = (~|wire27);
  assign wire32 = (8'had);
  assign wire33 = (+wire22[(1'h1):(1'h1)]);
  assign wire34 = (({(8'h9d),
                          wire14[(4'hd):(4'ha)]} != ({(!wire18)} >> (wire30[(3'h4):(2'h3)] & $unsigned(wire19)))) ?
                      (-$unsigned((~^(reg29 * wire25)))) : ((~^wire17[(1'h1):(1'h0)]) == $unsigned(wire26[(4'ha):(1'h0)])));
  assign wire35 = ($unsigned((wire19[(4'ha):(2'h2)] ?
                      ((|wire13) ?
                          (&(8'hae)) : $unsigned(wire28)) : $signed($unsigned(reg20)))) >>> wire22);
  assign wire36 = wire19[(2'h3):(2'h2)];
  assign wire37 = ((wire19 ?
                          $unsigned({$unsigned(wire23),
                              (wire28 ?
                                  wire17 : wire16)}) : (~wire36[(4'hb):(4'h8)])) ?
                      wire15 : $unsigned($unsigned($signed({wire27}))));
  assign wire38 = ((-$signed((~^$signed(wire31)))) ?
                      (($unsigned($signed(wire18)) > $signed($unsigned((8'hb4)))) && (7'h44)) : $signed($unsigned(wire37)));
  always
    @(posedge clk) begin
      reg39 <= ($signed(wire22[(2'h2):(2'h2)]) ?
          wire16 : $unsigned((((~^wire27) ^ $signed(reg29)) > wire38)));
      reg40 <= (($unsigned((-$signed(wire33))) ?
              $unsigned($unsigned(wire17[(1'h1):(1'h1)])) : (^~(wire28[(3'h5):(3'h4)] & (wire27 ?
                  reg29 : wire37)))) ?
          ($signed($unsigned(wire36[(3'h6):(1'h0)])) ?
              wire35 : wire13) : wire32[(3'h4):(1'h0)]);
      reg41 <= ((wire24 ^~ (wire36[(3'h5):(2'h2)] != $signed((~|wire24)))) | wire28);
      reg42 <= wire22[(1'h0):(1'h0)];
      reg43 <= $signed(($signed($signed(wire13)) ?
          (+{$signed(wire24), wire34}) : (8'hb2)));
    end
  assign wire44 = wire34[(2'h2):(1'h1)];
endmodule

module module111
#(parameter param154 = (8'ha6))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire115;
  input wire signed [(2'h2):(1'h0)] wire114;
  input wire [(2'h2):(1'h0)] wire113;
  input wire [(3'h4):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(4'he):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$signed((wire113[(2'h2):(2'h2)] ?
              $signed($unsigned((8'hb1))) : ((+wire114) - wire114[(1'h1):(1'h1)])))})
        begin
          reg116 <= $signed((((|$signed(wire114)) ?
              $unsigned($signed(wire114)) : (|wire112[(1'h1):(1'h1)])) >> wire112));
          if ($unsigned(wire114[(2'h2):(1'h0)]))
            begin
              reg117 <= (+wire115[(1'h1):(1'h0)]);
              reg118 <= ($unsigned(({{wire115, wire115}} >>> ({wire113,
                  wire114} >>> (wire115 ?
                  reg116 : reg116)))) >= ((^~(-(wire114 > wire115))) || (reg116 > wire114)));
              reg119 <= reg116[(2'h3):(1'h1)];
            end
          else
            begin
              reg117 <= reg119[(4'h9):(2'h3)];
              reg118 <= ((($unsigned(reg117[(4'hf):(3'h6)]) || (~&wire115)) >>> (~&wire115)) ?
                  $signed((reg117 > ($signed(reg116) ?
                      (+reg116) : $signed((8'hbf))))) : wire115);
              reg119 <= reg119[(4'hd):(4'h8)];
              reg120 <= ((8'ha8) != $unsigned(((reg116 ?
                      (+wire115) : ((8'hba) >>> reg118)) ?
                  ($unsigned(wire114) ?
                      (wire113 ?
                          (8'ha8) : reg117) : (+reg116)) : (reg118[(1'h1):(1'h1)] - (wire112 ?
                      wire115 : reg116)))));
            end
          if ((~|($signed(reg116[(1'h0):(1'h0)]) ?
              reg120[(4'hb):(3'h4)] : ((wire112[(3'h4):(2'h3)] ?
                      wire115 : {reg118}) ?
                  (((8'ha2) <= reg120) | reg119[(3'h4):(2'h3)]) : $signed(reg120[(4'h9):(2'h3)])))))
            begin
              reg121 <= $unsigned(wire113[(1'h1):(1'h1)]);
              reg122 <= reg120;
              reg123 <= $unsigned(wire113);
              reg124 <= {reg120};
              reg125 <= $signed((~^((^~reg117) | (reg121[(1'h1):(1'h1)] - ((8'hb8) >>> wire113)))));
            end
          else
            begin
              reg121 <= ($signed(reg116[(1'h0):(1'h0)]) || (|reg124[(3'h4):(1'h1)]));
              reg122 <= (reg122[(2'h3):(2'h3)] >> $signed(reg120[(5'h14):(4'hb)]));
            end
        end
      else
        begin
          reg116 <= (8'h9e);
          reg117 <= $unsigned({$unsigned($signed((reg121 ?
                  (8'h9e) : reg124)))});
          reg118 <= reg125[(3'h6):(3'h5)];
          reg119 <= (8'ha2);
          reg120 <= ($signed((reg120 ?
              $unsigned(wire112[(2'h3):(1'h0)]) : (~|reg123[(3'h6):(2'h3)]))) > ((~($signed((8'ha3)) ^~ $unsigned((8'hab)))) ?
              ((reg125 && (~reg116)) ?
                  reg125 : ((!reg116) ?
                      reg124[(4'he):(4'hb)] : (reg122 ?
                          reg123 : reg122))) : (reg122[(4'hc):(3'h5)] ?
                  ($unsigned(wire114) < $unsigned(reg116)) : $signed((~reg122)))));
        end
      reg126 <= wire114;
      if ($unsigned($signed(reg125)))
        begin
          reg127 <= reg124;
        end
      else
        begin
          if (($signed($unsigned($signed(reg119))) ^~ $signed(wire113)))
            begin
              reg127 <= wire112[(1'h1):(1'h0)];
              reg128 <= $unsigned((reg122[(3'h7):(3'h7)] ?
                  (reg122[(4'hc):(1'h0)] ?
                      $signed((wire113 <<< (8'h9c))) : (8'h9e)) : (wire115[(1'h0):(1'h0)] ?
                      (~^$unsigned(reg123)) : reg120)));
              reg129 <= (reg123[(2'h2):(2'h2)] >>> {(8'ha4),
                  (-reg125[(3'h4):(1'h0)])});
              reg130 <= $signed((8'hb0));
            end
          else
            begin
              reg127 <= (|wire114);
              reg128 <= (8'hbf);
            end
          reg131 <= ($signed((reg121 ^ ($signed(reg124) ?
                  reg130[(1'h0):(1'h0)] : $signed((8'h9e))))) ?
              {reg120, reg130[(1'h0):(1'h0)]} : (^{(8'hb2)}));
          if ({((reg131[(4'h8):(4'h8)] ?
                      $unsigned((wire114 ?
                          reg122 : reg116)) : $unsigned((reg127 ?
                          reg116 : reg117))) ?
                  ($unsigned($signed(reg127)) > $signed({reg121})) : {(+$signed(reg119)),
                      ((+reg121) ? $unsigned(reg131) : (wire115 <<< wire112))}),
              $signed((+reg130))})
            begin
              reg132 <= (|((wire115 ?
                      (!(reg122 ? reg124 : reg117)) : (((8'h9d) | reg118) ?
                          (~^reg130) : reg130[(2'h2):(1'h0)])) ?
                  reg120[(4'ha):(1'h0)] : $signed(({reg129} ?
                      (&(8'hb6)) : {reg120}))));
              reg133 <= reg119;
              reg134 <= ((reg116[(1'h0):(1'h0)] ?
                      reg124 : (reg133 > (reg120 ~^ reg118[(3'h5):(2'h2)]))) ?
                  (+reg120) : {(~^reg133[(2'h3):(1'h1)])});
            end
          else
            begin
              reg132 <= ($unsigned(((!((7'h41) <= reg122)) - $unsigned(((8'hb3) >>> reg129)))) ?
                  (~^(wire114 >> (-(reg134 > reg117)))) : ((!(reg131[(1'h0):(1'h0)] - (+(8'hb1)))) != {(reg134[(2'h2):(2'h2)] & reg117[(4'hd):(4'h8)])}));
              reg133 <= $unsigned(reg133);
              reg134 <= ($signed({reg121[(3'h7):(1'h0)],
                      (|$unsigned(wire112))}) ?
                  reg118 : reg123);
            end
        end
      reg135 <= {(~(((~|wire115) ? $unsigned((7'h42)) : (reg118 > reg128)) ?
              {(reg120 ? reg116 : reg119),
                  $unsigned(reg133)} : $unsigned(wire112))),
          $signed(reg130[(1'h1):(1'h0)])};
    end
  assign wire136 = (~&wire112[(1'h0):(1'h0)]);
  assign wire137 = ($unsigned(reg122) + $unsigned((~&(~(reg117 || wire112)))));
  assign wire138 = (($signed(reg123[(2'h2):(1'h0)]) ?
                           reg121[(4'hb):(1'h0)] : reg117) ?
                       wire114 : {$unsigned((~&((8'ha8) ? reg123 : reg124))),
                           $signed(((reg131 ~^ reg119) ?
                               (reg116 == reg119) : $signed((8'ha3))))});
  assign wire139 = $signed({(reg120[(4'ha):(4'h9)] ^~ $unsigned($unsigned(reg121)))});
  assign wire140 = ((8'hb8) ?
                       $unsigned((!($unsigned(reg128) ?
                           reg119 : (reg130 <<< reg120)))) : $signed((wire113[(1'h0):(1'h0)] << (^(~&reg125)))));
  assign wire141 = (reg130[(1'h0):(1'h0)] ?
                       {reg127[(3'h6):(2'h2)],
                           $signed($signed((~wire138)))} : reg122[(4'ha):(2'h2)]);
  assign wire142 = ((reg125[(2'h3):(2'h3)] <<< $unsigned({$signed(reg123)})) ^ ((~^reg134) || $signed($unsigned(reg134[(1'h1):(1'h0)]))));
  assign wire143 = ((^(~(^(~^reg120)))) + $unsigned($signed((reg119[(4'hf):(3'h7)] ~^ reg133))));
  assign wire144 = $signed((~&reg124[(5'h15):(5'h12)]));
  assign wire145 = $unsigned($signed(reg131));
  assign wire146 = ((($signed($unsigned(reg120)) ^ ((wire142 ?
                       wire138 : wire138) ^~ (reg132 == (8'hb4)))) == wire138) >> wire136[(3'h4):(2'h3)]);
  assign wire147 = $signed({$unsigned($unsigned($unsigned((8'h9e)))),
                       (wire113[(1'h0):(1'h0)] ?
                           $signed({reg126,
                               reg132}) : ((wire139 ^ reg121) * (reg118 ?
                               wire143 : reg132)))});
  assign wire148 = (8'ha8);
  assign wire149 = (reg132 ?
                       (wire141 ?
                           {(|$signed(wire147))} : (($unsigned(reg135) >>> $signed(reg131)) & ((reg132 ^ reg130) ?
                               $unsigned(reg116) : reg131))) : ({$unsigned($unsigned(wire145))} > (((reg118 ?
                                   wire144 : wire141) ?
                               $signed(wire148) : wire136) ?
                           $unsigned($signed(reg121)) : $signed($unsigned(wire136)))));
  assign wire150 = {wire115};
  assign wire151 = reg127[(4'hc):(3'h7)];
  assign wire152 = wire146;
  assign wire153 = wire144[(2'h3):(1'h0)];
endmodule
