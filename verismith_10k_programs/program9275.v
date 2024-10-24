module top
#(parameter param204 = (-(8'ha6)), 
parameter param205 = (|(8'ha8)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire202;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire200;
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire5,
                 wire6,
                 wire7,
                 wire10,
                 wire200,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire1[(2'h3):(1'h0)];
  assign wire6 = wire1;
  assign wire7 = (!{wire4});
  always
    @(posedge clk) begin
      reg8 <= wire6[(1'h1):(1'h1)];
      reg9 <= wire1[(2'h3):(1'h1)];
    end
  assign wire10 = ($unsigned(((-{wire5}) ?
                          $unsigned(wire4[(4'hc):(4'hc)]) : reg8[(3'h4):(2'h3)])) ?
                      (~^wire4[(5'h11):(4'h9)]) : $signed((~|(8'hab))));
  module11 #() modinst201 (wire200, clk, wire10, wire1, wire0, reg8, reg9);
  assign wire202 = ($unsigned((+wire3[(3'h7):(3'h7)])) ?
                       reg9 : wire7[(3'h5):(2'h2)]);
  assign wire203 = ($signed((((wire202 ? wire7 : (8'hbb)) & (wire5 ?
                       wire3 : wire5)) <= ({wire1} + $signed(reg9)))) << $unsigned((reg9 ?
                       wire0 : $unsigned(reg9))));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h298):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire161;
  wire [(3'h7):(1'h0)] wire163;
  wire [(5'h10):(1'h0)] wire176;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire198;
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  assign y = {wire51,
                 wire18,
                 wire17,
                 wire53,
                 wire54,
                 wire66,
                 wire77,
                 wire78,
                 wire79,
                 wire138,
                 wire140,
                 wire161,
                 wire163,
                 wire176,
                 wire177,
                 wire178,
                 wire198,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 (1'h0)};
  assign wire17 = $unsigned(($signed({$signed(wire14)}) - wire14));
  assign wire18 = wire16[(2'h3):(2'h3)];
  module19 #() modinst52 (.wire23(wire17), .wire24(wire13), .clk(clk), .wire21(wire14), .wire20(wire12), .y(wire51), .wire22(wire15));
  assign wire53 = (wire51[(4'h9):(4'h8)] >> (wire16 <= ({$unsigned(wire12),
                          ((7'h44) ? wire15 : (8'hb5))} ?
                      ($unsigned(wire15) <= {wire51}) : wire12[(3'h5):(2'h2)])));
  assign wire54 = wire14[(5'h10):(4'hd)];
  always
    @(posedge clk) begin
      if (wire15)
        begin
          reg55 <= (wire51[(3'h6):(3'h5)] > wire15);
          reg56 <= (wire14[(3'h6):(1'h1)] | wire51);
          reg57 <= ((^wire15[(1'h0):(1'h0)]) >> wire15);
          if ((wire54 - (~(reg57[(3'h6):(1'h0)] ?
              $unsigned($signed(wire14)) : $unsigned(wire18)))))
            begin
              reg58 <= (wire12[(5'h10):(3'h5)] ^ (~^$unsigned(($signed(reg56) != wire18))));
              reg59 <= wire14[(4'hd):(4'hc)];
              reg60 <= (~|wire16);
              reg61 <= $signed(($signed(((wire53 != wire51) | (wire18 > wire18))) ?
                  $signed((wire15 ^~ (+wire53))) : $unsigned(((reg55 || wire15) ?
                      (~|reg58) : wire51[(1'h1):(1'h0)]))));
              reg62 <= reg55;
            end
          else
            begin
              reg58 <= (-((+(+wire53[(3'h7):(1'h1)])) > ($unsigned($signed(wire15)) <<< ((^~wire13) || $unsigned(reg57)))));
              reg59 <= $unsigned(((8'haa) ?
                  (^~$signed(reg61)) : {((^~(8'ha6)) ~^ (wire51 == wire51)),
                      ((~(7'h41)) & reg60)}));
              reg60 <= $signed($signed({reg58, $unsigned($unsigned(reg55))}));
            end
        end
      else
        begin
          reg55 <= wire16;
          reg56 <= (wire16 ?
              wire15[(1'h0):(1'h0)] : {$signed($signed((reg55 ?
                      (8'ha6) : reg59))),
                  {wire54}});
          if (wire53[(4'he):(3'h7)])
            begin
              reg57 <= (((&$signed((wire18 ? wire13 : wire13))) ?
                  (((reg57 ? wire53 : wire15) >= $signed(reg62)) ?
                      (~$signed((8'ha6))) : (8'hae)) : $signed({$signed(reg61),
                      wire18})) && wire15[(3'h4):(3'h4)]);
              reg58 <= wire15;
              reg59 <= (+(^$unsigned((~^(reg60 != wire18)))));
              reg60 <= reg58;
            end
          else
            begin
              reg57 <= $unsigned(reg61[(3'h5):(3'h5)]);
              reg58 <= (!(&(~|wire17)));
              reg59 <= wire13[(5'h13):(1'h1)];
            end
          if (reg60[(2'h3):(2'h2)])
            begin
              reg61 <= $signed((~(wire18[(2'h3):(2'h2)] ^~ (^~$unsigned(wire17)))));
              reg62 <= (~|(^wire14));
            end
          else
            begin
              reg61 <= $unsigned($unsigned($unsigned((wire18 + $signed(wire14)))));
              reg62 <= (&({$unsigned($signed(wire12))} >> $unsigned($unsigned($signed(reg55)))));
              reg63 <= {reg58, (wire12 <<< reg59)};
              reg64 <= (&(reg63 ? reg58 : reg61[(2'h2):(1'h0)]));
            end
        end
      reg65 <= $unsigned((!($unsigned(wire18[(2'h2):(1'h0)]) | reg57)));
    end
  assign wire66 = $signed((8'ha9));
  always
    @(posedge clk) begin
      reg67 <= wire12[(4'he):(4'h9)];
      if ((reg64[(4'hd):(3'h6)] ? wire66[(4'ha):(4'ha)] : reg58[(1'h0):(1'h0)]))
        begin
          if (reg56[(3'h7):(1'h0)])
            begin
              reg68 <= ((reg67 ?
                  (((&reg56) ? $unsigned(wire66) : $signed(reg56)) ?
                      (reg60[(4'hb):(4'ha)] && reg58) : wire51) : $signed($unsigned((8'hbe)))) < $signed(reg67[(1'h0):(1'h0)]));
              reg69 <= wire51;
              reg70 <= $signed((($unsigned($signed((8'hb9))) ?
                      $signed(wire12[(5'h10):(2'h3)]) : (&(~reg67))) ?
                  reg65[(1'h1):(1'h1)] : $signed((wire13 ?
                      $signed(reg69) : (wire12 || wire51)))));
            end
          else
            begin
              reg68 <= $signed(reg56[(2'h3):(1'h0)]);
              reg69 <= (8'ha4);
              reg70 <= $signed($unsigned(((8'h9f) ?
                  reg57[(1'h1):(1'h0)] : {$signed(reg57), $signed(wire18)})));
              reg71 <= reg58[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if ({wire51,
              {(^{(+wire53)}),
                  ((reg70[(1'h0):(1'h0)] ^~ $signed(wire66)) && ((reg63 ?
                          reg63 : (8'hb1)) ?
                      (wire13 ^~ (8'hb5)) : $unsigned(reg60)))}})
            begin
              reg68 <= {reg61[(2'h3):(2'h3)],
                  $unsigned($unsigned(((reg68 ?
                      wire53 : wire18) | (wire53 || wire12))))};
              reg69 <= $unsigned(($unsigned({{(8'hb9)}}) ^ ($unsigned(wire17[(4'hb):(4'hb)]) || (-$unsigned(reg68)))));
              reg70 <= {({(-(wire53 ?
                          wire16 : reg58))} * {($signed(reg62) ^ $unsigned(reg64)),
                      ((!wire18) >> (reg65 ? reg62 : wire16))}),
                  ({((wire12 ^~ wire16) ?
                              (reg57 ? wire16 : reg68) : (reg70 ?
                                  wire12 : reg69)),
                          (reg68 <<< (8'had))} ?
                      reg63[(5'h10):(1'h1)] : reg67[(3'h4):(2'h3)])};
              reg71 <= (reg61[(1'h0):(1'h0)] <<< ($signed(reg71[(3'h5):(2'h2)]) ?
                  ((&$unsigned(wire16)) ?
                      $unsigned((wire54 ~^ wire18)) : wire16[(3'h4):(1'h1)]) : reg58));
              reg72 <= (wire14[(5'h11):(3'h4)] ?
                  (~$unsigned($signed(reg57))) : ((-(reg60 * wire13)) ?
                      (8'ha6) : wire18[(2'h3):(2'h2)]));
            end
          else
            begin
              reg68 <= ($unsigned(((8'hb0) ?
                      $signed((reg63 == reg56)) : reg67)) ?
                  $unsigned(wire53) : reg71[(3'h6):(1'h1)]);
              reg69 <= $unsigned(($unsigned($signed(reg62[(1'h0):(1'h0)])) ?
                  $unsigned(wire54[(2'h2):(1'h1)]) : (^~(!reg61[(3'h4):(1'h0)]))));
            end
          reg73 <= $unsigned($unsigned(wire54));
          reg74 <= ($signed({$unsigned($signed(reg59))}) < reg70);
          reg75 <= ((!(($unsigned(wire54) || reg68[(4'h9):(1'h1)]) ?
              reg63[(1'h1):(1'h1)] : (|reg61[(3'h5):(1'h1)]))) * ($signed(((-wire17) ?
              (reg63 != reg58) : wire16[(1'h1):(1'h1)])) == $unsigned({(reg59 && (8'hb4))})));
        end
      reg76 <= $unsigned((reg73[(2'h2):(1'h0)] >= $unsigned($unsigned((~^reg72)))));
    end
  assign wire77 = wire17[(5'h11):(3'h6)];
  assign wire78 = (($signed($unsigned($unsigned(reg74))) || (-$signed($signed(reg76)))) ?
                      $signed($unsigned((&reg71[(3'h4):(1'h0)]))) : $signed(wire54));
  assign wire79 = $signed((($unsigned((reg75 ? reg67 : wire15)) || ((^~reg71) ?
                          wire17 : (reg60 <<< wire14))) ?
                      $unsigned(($signed((8'hb8)) << $signed(reg59))) : (!((wire54 ?
                              (8'ha1) : wire17) ?
                          $signed(reg68) : reg61[(3'h6):(1'h1)]))));
  module80 #() modinst139 (wire138, clk, reg72, wire79, wire12, reg71);
  assign wire140 = ((^(|(^~wire51))) ?
                       ($unsigned(wire16) ?
                           wire77[(2'h3):(2'h2)] : $signed((~&(!wire51)))) : (({(~|reg69)} ~^ (^(^~reg74))) ?
                           (((+reg64) ? $unsigned((8'hb0)) : $unsigned(reg71)) ?
                               (~|$signed((8'h9d))) : {reg70[(4'hb):(3'h5)]}) : {(~|reg67[(2'h3):(2'h2)])}));
  module141 #() modinst162 (wire161, clk, wire18, wire138, reg56, reg67);
  assign wire163 = (reg59[(2'h2):(1'h0)] ^ ((8'hb2) ^~ (8'ha7)));
  always
    @(posedge clk) begin
      reg164 <= $unsigned($unsigned(({reg65, $signed(reg59)} + wire17)));
      reg165 <= (-$signed(reg73[(3'h7):(3'h5)]));
      reg166 <= reg64[(4'h9):(4'h8)];
      if (reg69)
        begin
          reg167 <= ((~$signed((~^(~^reg74)))) ?
              ((((~|reg67) ? (wire53 != reg70) : $signed((8'ha4))) ?
                  (+reg165) : (wire140[(3'h6):(3'h6)] | wire53[(4'he):(4'h8)])) && (reg69[(1'h0):(1'h0)] * wire66[(3'h5):(3'h5)])) : (+(+$signed({reg59}))));
        end
      else
        begin
          reg167 <= {reg71,
              {((~$signed(reg64)) << (|(8'hba))),
                  ((~|$unsigned(wire18)) & ($unsigned(reg60) ?
                      reg64[(5'h10):(4'hc)] : $signed(reg164)))}};
          if (reg55)
            begin
              reg168 <= (~&reg167[(3'h6):(3'h4)]);
              reg169 <= wire54;
              reg170 <= reg68;
              reg171 <= $signed($signed($unsigned(((^wire16) | wire78))));
              reg172 <= (wire12[(1'h0):(1'h0)] * (-$signed((^~$unsigned(wire140)))));
            end
          else
            begin
              reg168 <= wire51;
              reg169 <= (^(wire78[(3'h6):(1'h0)] == wire53[(3'h6):(3'h6)]));
              reg170 <= wire53[(5'h11):(2'h3)];
            end
          reg173 <= $unsigned($signed((~&wire15[(2'h3):(2'h3)])));
          reg174 <= $signed($signed({$signed($signed(wire15))}));
        end
      reg175 <= reg69;
    end
  assign wire176 = reg70[(3'h7):(2'h3)];
  assign wire177 = {$signed((^$unsigned($signed((8'hb7))))),
                       reg76[(3'h6):(3'h4)]};
  assign wire178 = reg63;
  module179 #() modinst199 (wire198, clk, reg63, wire138, reg172, reg71, reg67);
endmodule

module module179  (y, clk, wire184, wire183, wire182, wire181, wire180);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire184;
  input wire signed [(4'hb):(1'h0)] wire183;
  input wire signed [(5'h10):(1'h0)] wire182;
  input wire signed [(4'he):(1'h0)] wire181;
  input wire [(2'h3):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire197;
  wire [(4'h9):(1'h0)] wire196;
  wire signed [(5'h11):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire signed [(3'h5):(1'h0)] wire193;
  wire [(2'h3):(1'h0)] wire192;
  wire [(4'he):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(5'h13):(1'h0)] wire189;
  wire [(4'h8):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire186;
  wire [(2'h3):(1'h0)] wire185;
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 (1'h0)};
  assign wire185 = $unsigned((^$signed($unsigned(wire183[(4'h8):(4'h8)]))));
  assign wire186 = (wire185[(1'h1):(1'h1)] ? wire182[(3'h6):(3'h4)] : (8'hb1));
  assign wire187 = $unsigned($unsigned($unsigned($unsigned($signed(wire182)))));
  assign wire188 = ((~^(8'hbc)) ?
                       (^~wire181) : $signed({wire184[(2'h2):(1'h0)]}));
  assign wire189 = $signed((^(((wire180 ^~ wire184) ?
                       ((8'ha8) - (7'h43)) : wire181) <<< $unsigned($unsigned((8'hbd))))));
  assign wire190 = ($unsigned($unsigned($signed($signed(wire183)))) ?
                       wire185 : (~&(~((+wire183) ?
                           wire181[(4'h9):(2'h3)] : {wire188}))));
  assign wire191 = $unsigned($signed(wire188));
  assign wire192 = $signed(((($unsigned(wire185) >>> (wire182 ~^ wire191)) | $signed(wire191)) ?
                       wire184[(2'h2):(2'h2)] : (((|wire191) ~^ wire189[(4'h9):(3'h4)]) ?
                           $signed(wire182) : (~wire188))));
  assign wire193 = wire185;
  assign wire194 = {(wire190[(3'h5):(2'h2)] ?
                           wire183[(4'ha):(2'h3)] : (-($signed(wire181) >= $unsigned(wire192)))),
                       $unsigned(($signed((8'hb2)) > wire183[(4'hb):(2'h2)]))};
  assign wire195 = (~|wire189);
  assign wire196 = (~^(8'hae));
  assign wire197 = ($signed(((^~wire180) ?
                           (wire191 + {wire196,
                               wire188}) : ((wire185 * wire191) ?
                               (wire189 == wire195) : $unsigned(wire183)))) ?
                       ((8'hb0) ?
                           wire196 : {$unsigned(wire187),
                               $signed($unsigned(wire182))}) : wire193);
endmodule

module module141  (y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire145;
  input wire signed [(5'h11):(1'h0)] wire144;
  input wire signed [(2'h2):(1'h0)] wire143;
  input wire signed [(2'h2):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(5'h11):(1'h0)] wire158;
  wire signed [(3'h6):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire155;
  wire [(4'h8):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(4'hc):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg146 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire151,
                 wire150,
                 wire149,
                 reg152,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((wire143[(2'h2):(1'h1)] ?
          $unsigned(wire142[(1'h1):(1'h1)]) : wire143[(2'h2):(1'h0)]) + $signed((~&$signed(wire145)))) << wire143[(2'h2):(1'h1)]))
        begin
          reg146 <= ($unsigned(($signed({wire145, wire143}) ?
              ((wire144 ? wire143 : wire145) ?
                  (wire144 >> wire143) : (wire145 != wire144)) : $unsigned((wire145 ?
                  wire144 : wire143)))) && (~^wire143[(2'h2):(1'h1)]));
        end
      else
        begin
          reg146 <= wire142;
        end
      reg147 <= {($unsigned($unsigned((~&wire144))) ?
              $signed(wire145) : (~&($signed(wire143) < (wire145 ?
                  wire142 : wire144))))};
      reg148 <= reg147[(3'h4):(2'h2)];
    end
  assign wire149 = (~|(&$signed((wire142[(1'h1):(1'h0)] ?
                       $unsigned(wire142) : wire142[(2'h2):(1'h1)]))));
  assign wire150 = $signed({$unsigned(((reg147 ^~ wire144) * (~^(8'ha9)))),
                       (wire145[(4'h8):(3'h7)] >> wire142[(2'h2):(1'h1)])});
  assign wire151 = reg148[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg152 <= wire149[(1'h0):(1'h0)];
    end
  assign wire153 = $unsigned((+wire142));
  assign wire154 = {reg148[(1'h1):(1'h1)]};
  assign wire155 = wire145;
  assign wire156 = (^((((wire149 ?
                           wire143 : wire155) >>> $signed(reg147)) ^ wire151) ?
                       $signed((^~$unsigned(wire142))) : $unsigned(wire154)));
  assign wire157 = $signed((!wire155[(3'h6):(3'h6)]));
  assign wire158 = wire150;
  assign wire159 = {wire149};
  assign wire160 = (wire151[(2'h3):(2'h3)] ? wire142[(1'h0):(1'h0)] : wire155);
endmodule

module module80
#(parameter param136 = ({({((8'ha8) <<< (8'h9d))} ? (((8'hac) ? (8'hbc) : (8'hb3)) <<< ((8'ha9) ? (8'ha2) : (7'h43))) : {(~|(7'h41)), ((8'hb1) ^~ (8'ha5))})} ? ((&(~^((8'hb3) <<< (8'hb1)))) ? ((((8'hae) ~^ (8'ha1)) ? (~&(8'hae)) : ((8'hac) ? (8'ha8) : (8'hb4))) && ((~&(8'ha9)) == {(8'had)})) : (8'hb3)) : {(8'hb8)}), 
parameter param137 = ((^~((~&param136) ? (&param136) : (7'h44))) & param136))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire84;
  input wire signed [(5'h14):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire signed [(5'h13):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire85;
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  assign y = {wire125,
                 wire123,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire85,
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
                 reg124,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
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
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire85 = (~wire81);
  always
    @(posedge clk) begin
      if ({wire85[(2'h3):(1'h1)]})
        begin
          reg86 <= (wire81[(4'hb):(4'ha)] ?
              wire83[(5'h12):(4'hc)] : $signed(wire85[(1'h1):(1'h1)]));
          reg87 <= (^~(8'hbb));
          reg88 <= wire83[(3'h6):(3'h4)];
          reg89 <= wire82;
        end
      else
        begin
          reg86 <= $unsigned(((wire81 ?
                  ({wire83} * (|(7'h42))) : (~^$signed(wire85))) ?
              (-(wire85[(2'h2):(1'h0)] * reg87)) : wire82[(2'h2):(1'h0)]));
          reg87 <= (~wire84[(3'h7):(3'h6)]);
        end
    end
  assign wire90 = reg88[(5'h14):(4'hf)];
  assign wire91 = reg87[(1'h1):(1'h0)];
  assign wire92 = (((wire81 ?
                      ($signed(wire90) & (wire83 || (8'hb0))) : {{wire90}}) != (((wire83 ?
                              reg87 : wire81) ?
                          (^reg88) : (~&reg89)) ?
                      wire91[(3'h6):(3'h6)] : $unsigned((wire91 | wire90)))) << {wire91,
                      $signed((wire84[(3'h5):(1'h1)] > $unsigned(wire84)))});
  assign wire93 = ($signed($signed((-$unsigned(wire83)))) ?
                      {$signed($signed((reg88 ? reg86 : wire92))),
                          (~^(wire82 && wire91))} : wire83);
  assign wire94 = ({wire85[(2'h3):(2'h3)]} ?
                      $unsigned(reg89[(4'hd):(1'h0)]) : (({(8'h9d),
                          (|reg87)} && $unsigned(wire93)) & ((+$signed(wire83)) ?
                          ($unsigned(reg86) ?
                              $signed(wire90) : ((8'hb4) != wire93)) : wire83[(3'h6):(3'h5)])));
  assign wire95 = {wire94};
  assign wire96 = (^((($unsigned(wire92) ? wire90 : (reg87 * (7'h44))) ?
                      $signed($signed(wire93)) : {(8'h9c),
                          $unsigned(reg87)}) <= $unsigned(((+reg89) ?
                      $unsigned(wire94) : wire85))));
  assign wire97 = ($signed(((-(wire90 ? wire82 : wire82)) ?
                      {wire93,
                          wire95[(3'h5):(3'h4)]} : wire90)) && (reg88[(3'h6):(3'h6)] ?
                      {(wire91[(2'h2):(1'h0)] ?
                              {wire85, reg87} : (reg89 >= (7'h40))),
                          ((|wire81) - wire96[(4'he):(3'h6)])} : ($signed((reg86 == wire93)) ?
                          {(8'h9f),
                              (wire96 ?
                                  wire92 : wire92)} : $signed($signed(wire91)))));
  assign wire98 = ($unsigned((wire82[(2'h2):(1'h0)] ?
                          wire82 : ((wire90 ^~ wire96) >>> (wire94 ?
                              wire95 : wire92)))) ?
                      {$signed((reg89[(4'h9):(3'h7)] >>> {(7'h44),
                              (8'ha1)}))} : reg87[(4'he):(4'hd)]);
  assign wire99 = reg88[(5'h10):(4'hb)];
  assign wire100 = ((($signed((wire93 > wire81)) ?
                       (wire92[(3'h6):(1'h0)] ?
                           (wire85 >>> (8'ha1)) : (wire96 ?
                               reg86 : wire98)) : {(~&(8'h9d)),
                           wire92[(4'hb):(4'h9)]}) >= $signed($unsigned((wire85 | wire99)))) * ((((^~wire82) ?
                           ((8'h9c) - reg87) : (wire91 * (8'haf))) ?
                       $unsigned(reg87[(4'hb):(1'h0)]) : (|((8'ha8) | (8'hb8)))) + $unsigned((&(wire90 >> (8'haf))))));
  assign wire101 = $signed($signed($unsigned(({wire83,
                       wire82} ~^ wire93[(1'h0):(1'h0)]))));
  assign wire102 = $signed(wire94);
  assign wire103 = $signed(($unsigned(wire101) ?
                       $unsigned((wire98 >> $signed(wire97))) : wire96));
  assign wire104 = ((8'ha1) >= wire92);
  always
    @(posedge clk) begin
      reg105 <= reg89[(3'h5):(3'h4)];
      reg106 <= $signed($unsigned($signed(wire98)));
      if (((~^(($unsigned(wire93) ?
          $unsigned(wire82) : $unsigned(wire83)) >= ($unsigned(reg89) - $unsigned((8'ha6))))) << (($signed((wire102 >> reg89)) ^ wire104) == wire90)))
        begin
          if ($signed(({$unsigned($signed(wire85))} ?
              wire99 : wire92[(1'h1):(1'h0)])))
            begin
              reg107 <= wire103;
              reg108 <= reg107;
            end
          else
            begin
              reg107 <= reg108;
              reg108 <= {$unsigned($signed((|$unsigned(wire81)))),
                  wire99[(3'h4):(1'h1)]};
              reg109 <= (wire90 ^ wire104);
              reg110 <= (((!wire85[(2'h2):(1'h0)]) ?
                  (&$unsigned(wire97)) : (~^(((8'ha8) ? reg86 : wire93) ?
                      $unsigned(reg88) : wire91))) == $unsigned(wire99));
              reg111 <= wire93;
            end
          reg112 <= wire104[(2'h2):(2'h2)];
          if ({$unsigned(wire98[(3'h7):(3'h5)]),
              (reg88[(3'h6):(3'h5)] || $signed(wire90[(2'h2):(1'h0)]))})
            begin
              reg113 <= reg86;
              reg114 <= reg111[(3'h6):(2'h2)];
            end
          else
            begin
              reg113 <= reg107[(3'h6):(3'h6)];
              reg114 <= reg110[(3'h4):(2'h3)];
            end
          reg115 <= wire98[(2'h3):(2'h3)];
          reg116 <= (~{$unsigned($unsigned(wire93))});
        end
      else
        begin
          reg107 <= ($signed($signed({$signed(reg110)})) >> reg116[(1'h0):(1'h0)]);
          if ($unsigned({$unsigned(((~reg110) == {(8'ha6)})),
              $unsigned($unsigned((reg113 ? reg88 : wire83)))}))
            begin
              reg108 <= wire100[(2'h3):(1'h1)];
              reg109 <= wire98[(1'h1):(1'h1)];
            end
          else
            begin
              reg108 <= (!(8'ha5));
              reg109 <= ({$signed({reg111}),
                  (^$signed((reg87 ?
                      reg111 : wire102)))} * (~&$unsigned((&(reg107 & wire83)))));
            end
          reg110 <= (|wire93);
        end
      if (($unsigned(((~&(wire85 << wire91)) != (reg105[(4'hf):(4'h9)] ?
          reg86[(1'h1):(1'h0)] : $unsigned(reg106)))) || ($signed(((reg111 > wire101) == {wire97,
          reg110})) << (8'h9c))))
        begin
          reg117 <= ($signed({$signed((^~wire96))}) ~^ ($signed(reg109) ^~ $unsigned({$signed(reg114),
              (8'h9d)})));
        end
      else
        begin
          reg117 <= (&$signed(wire90));
          reg118 <= wire102[(2'h3):(1'h1)];
          reg119 <= $unsigned($signed(wire99));
          reg120 <= $unsigned((~^((wire83 ?
              wire92[(3'h7):(2'h3)] : (wire100 < reg105)) >>> (wire90[(1'h0):(1'h0)] ?
              reg112 : {reg114, wire81}))));
          reg121 <= $unsigned(reg106);
        end
      reg122 <= $unsigned(($unsigned((8'hb0)) << (wire103[(3'h6):(2'h3)] & wire104)));
    end
  assign wire123 = wire103;
  always
    @(posedge clk) begin
      reg124 <= $signed($signed($signed($signed(wire98))));
    end
  assign wire125 = $signed($unsigned(reg109));
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(reg117[(1'h1):(1'h1)]))))
        begin
          reg126 <= (($signed((((8'hb6) ? wire98 : reg106) > (+wire103))) ?
                  reg88 : (&wire93[(1'h1):(1'h0)])) ?
              wire125[(1'h0):(1'h0)] : ((^~$unsigned((reg88 ?
                      wire84 : wire101))) ?
                  (&(&(reg113 <<< wire123))) : reg87));
          reg127 <= reg114[(2'h3):(2'h3)];
          reg128 <= reg119[(3'h6):(3'h6)];
          reg129 <= reg120;
        end
      else
        begin
          reg126 <= wire85;
          if ((8'hae))
            begin
              reg127 <= wire91[(1'h1):(1'h1)];
              reg128 <= $signed(wire100);
              reg129 <= $signed(reg126[(3'h7):(3'h4)]);
              reg130 <= (8'h9c);
            end
          else
            begin
              reg127 <= $unsigned(wire98);
              reg128 <= wire85[(1'h0):(1'h0)];
              reg129 <= {wire90[(2'h2):(1'h0)],
                  $unsigned($unsigned((~wire94)))};
              reg130 <= wire84[(4'h8):(1'h1)];
            end
        end
      if ((((!$signed(reg89[(5'h13):(4'hd)])) == (~^(wire93[(2'h2):(1'h0)] ?
          {wire84} : $unsigned(reg122)))) >>> ((wire90 ?
              (+wire95) : (!$unsigned((8'hb2)))) ?
          $unsigned($signed((wire104 > wire100))) : ($unsigned((8'h9c)) ?
              reg88[(4'hd):(1'h1)] : ($signed((8'ha1)) > (~&reg86))))))
        begin
          reg131 <= $unsigned($unsigned(((+wire102) + reg116)));
          reg132 <= ($signed((~^(|reg130))) < ((reg128[(3'h4):(2'h2)] << ((wire81 >> wire94) + $unsigned(wire97))) ?
              reg106 : (wire83[(4'ha):(4'h9)] ?
                  wire83[(2'h3):(1'h0)] : ((^~wire97) ?
                      (wire94 ? reg112 : reg108) : {wire101}))));
          reg133 <= {((((wire83 ? reg118 : wire93) * (|reg132)) ?
                  $unsigned($signed((8'hb2))) : ((wire101 != reg113) ?
                      (reg115 ?
                          reg112 : reg118) : (8'hb4))) - ($unsigned((wire100 ?
                  reg128 : wire90)) & (|$signed(reg128))))};
          reg134 <= wire96[(1'h0):(1'h0)];
        end
      else
        begin
          reg131 <= (reg131 - (~^(^wire90)));
        end
      reg135 <= wire91[(4'h8):(1'h0)];
    end
endmodule

module module19
#(parameter param50 = ({((~(+(8'h9c))) ? ({(8'hb5)} ? (&(8'hb7)) : ((7'h42) << (8'ha2))) : ({(8'h9f)} ? ((8'h9e) < (8'hba)) : (^~(8'hb2))))} ? ((~|(^((8'ha9) ? (8'hbd) : (8'ha2)))) && (((^(7'h43)) ? ((8'hbb) <= (8'ha6)) : ((8'hb9) ^~ (8'hbc))) ? (+((8'hbc) ~^ (8'h9c))) : (+((8'hb5) ? (8'ha0) : (8'ha2))))) : ((|(((8'hbd) != (8'hb9)) >= {(7'h41), (8'hbb)})) ? ({{(8'ha2), (8'ha2)}, (!(8'hbc))} ? (|{(8'hbc), (8'ha0)}) : (((8'hb4) < (8'ha2)) ? (&(8'h9f)) : (!(8'hb3)))) : ((((8'hb1) ? (8'h9d) : (8'hb7)) ^~ ((8'h9c) <= (8'had))) ^~ (+((8'ha3) ~^ (8'hbc)))))))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg41,
                 reg40,
                 reg39,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({(wire20[(5'h10):(2'h2)] ^ $unsigned($signed(wire23))), wire21} ?
          $unsigned($unsigned(($signed(wire23) ? wire22 : wire23))) : wire21))
        begin
          reg25 <= (!(8'haa));
          reg26 <= $unsigned((((^~reg25) ^~ $signed($signed(wire22))) ?
              (^$signed($signed(wire21))) : reg25[(3'h5):(1'h0)]));
          reg27 <= $unsigned((wire24[(2'h2):(1'h0)] == reg26[(5'h10):(4'ha)]));
          reg28 <= (($signed(reg25) - $unsigned({(wire22 + reg26),
              (wire20 != wire22)})) - wire22[(2'h2):(2'h2)]);
        end
      else
        begin
          reg25 <= wire22[(3'h5):(2'h2)];
        end
      reg29 <= (reg28[(1'h0):(1'h0)] ?
          (wire23[(4'ha):(3'h6)] + (&((reg25 ? wire20 : wire22) ?
              (^~reg27) : {reg25}))) : {((wire22 ^~ (8'ha0)) <<< ((reg25 < (8'hac)) ?
                  (wire21 >>> wire24) : reg27[(1'h1):(1'h0)]))});
      reg30 <= $unsigned(($unsigned(wire22[(3'h5):(1'h1)]) ?
          $signed(wire20) : (~&reg28[(3'h4):(3'h4)])));
      reg31 <= ((|(($signed(wire21) <<< reg28[(1'h1):(1'h0)]) ?
          reg28[(1'h0):(1'h0)] : ((8'hb8) ?
              (wire21 ?
                  (8'hb0) : reg27) : reg25[(2'h2):(1'h0)]))) >= wire21[(4'hb):(2'h2)]);
    end
  assign wire32 = ($signed((($unsigned(reg30) ?
                              $unsigned(reg28) : {(8'ha8), wire24}) ?
                          wire24 : $signed(wire23[(3'h6):(1'h0)]))) ?
                      ((((wire21 ?
                              (8'hb3) : (8'ha6)) >= (&wire22)) ^ ((~&reg31) ?
                              $signed(wire23) : (reg26 == wire22))) ?
                          (reg31 + ($unsigned(wire20) || $signed((8'hbf)))) : wire21) : $unsigned(wire21));
  assign wire33 = reg28[(1'h1):(1'h0)];
  assign wire34 = wire24[(4'hb):(4'hb)];
  assign wire35 = $unsigned(wire34);
  assign wire36 = ($signed(($signed(((8'h9f) << wire24)) != ($signed(wire20) ?
                          $unsigned(reg27) : wire21[(4'hb):(2'h2)]))) ?
                      $signed($signed(wire34)) : reg30);
  assign wire37 = (-((~^($signed(wire22) ?
                          (wire36 ? wire33 : wire24) : wire23[(3'h7):(3'h4)])) ?
                      (8'ha7) : $unsigned(wire34)));
  assign wire38 = wire23[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg39 <= (reg28 <<< (~^$signed(($signed(wire20) ?
          {wire33, wire37} : (~|wire20)))));
      reg40 <= (wire24 ?
          $unsigned({$signed({wire23, wire32}),
              wire35}) : $unsigned(($unsigned($unsigned((8'hb8))) ^~ ((|reg30) ?
              (wire21 ? wire33 : (8'hb3)) : reg27[(3'h5):(3'h5)]))));
      reg41 <= reg29;
    end
  assign wire42 = (8'ha7);
  assign wire43 = (~^(~|reg30[(1'h1):(1'h1)]));
  assign wire44 = ({(|(wire33[(4'h8):(3'h7)] ?
                          wire35[(4'hb):(1'h0)] : wire35[(4'hf):(4'hd)])),
                      $unsigned($signed((reg27 ? wire32 : wire34)))} >> reg28);
  assign wire45 = ((-wire42[(1'h1):(1'h1)]) ?
                      $unsigned(wire34) : ({(^$unsigned(wire24))} >= $signed(((~^wire37) ?
                          $signed(wire38) : (^~wire37)))));
  assign wire46 = {((reg41[(3'h5):(2'h2)] <<< $signed((reg41 ?
                          wire21 : wire45))) * (reg25 ?
                          (8'h9f) : wire44[(4'hb):(3'h6)]))};
  assign wire47 = (wire32 ?
                      reg28 : ($unsigned($signed({wire34,
                          reg30})) < ($unsigned((reg27 ?
                          (8'hbe) : reg31)) + $unsigned(reg41[(3'h4):(2'h2)]))));
  assign wire48 = wire37;
  assign wire49 = ({(((wire45 && wire43) ? {wire23} : wire46[(2'h2):(1'h0)]) ?
                              (~(wire21 < wire24)) : (+{wire23, (8'hae)})),
                          reg39} ?
                      (wire23 ?
                          wire21[(4'hc):(4'h9)] : wire48) : ({$unsigned(wire43[(4'h8):(2'h2)])} ?
                          (((wire38 ?
                              (8'hb8) : (8'hb7)) < wire32[(1'h0):(1'h0)]) >> (8'ha9)) : wire35[(3'h5):(1'h1)]));
endmodule
