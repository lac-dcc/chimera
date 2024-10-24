module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire305;
  wire signed [(5'h12):(1'h0)] wire297;
  wire signed [(3'h5):(1'h0)] wire296;
  wire signed [(5'h14):(1'h0)] wire295;
  wire [(2'h2):(1'h0)] wire279;
  wire signed [(4'hb):(1'h0)] wire278;
  wire [(4'hb):(1'h0)] wire276;
  wire signed [(5'h10):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire126;
  reg [(2'h3):(1'h0)] reg304 = (1'h0);
  reg [(3'h5):(1'h0)] reg303 = (1'h0);
  reg [(3'h7):(1'h0)] reg302 = (1'h0);
  reg [(5'h10):(1'h0)] reg301 = (1'h0);
  reg [(4'hb):(1'h0)] reg300 = (1'h0);
  reg [(3'h4):(1'h0)] reg299 = (1'h0);
  reg [(3'h5):(1'h0)] reg298 = (1'h0);
  reg [(4'he):(1'h0)] reg294 = (1'h0);
  reg [(5'h14):(1'h0)] reg293 = (1'h0);
  reg [(4'hf):(1'h0)] reg292 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg291 = (1'h0);
  reg [(5'h10):(1'h0)] reg290 = (1'h0);
  reg signed [(4'he):(1'h0)] reg289 = (1'h0);
  reg [(4'hc):(1'h0)] reg288 = (1'h0);
  reg [(5'h10):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg286 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg284 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg283 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg282 = (1'h0);
  reg [(4'ha):(1'h0)] reg281 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg280 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  assign y = {wire305,
                 wire297,
                 wire296,
                 wire295,
                 wire279,
                 wire278,
                 wire276,
                 wire128,
                 wire4,
                 wire5,
                 wire126,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire4 = $unsigned(($unsigned($signed($signed(wire1))) >= $signed(wire2)));
  assign wire5 = $signed(wire2);
  module6 #() modinst127 (.wire9(wire5), .wire8(wire3), .wire11(wire1), .wire10(wire4), .y(wire126), .wire7(wire2), .clk(clk));
  assign wire128 = (-wire3[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg129 <= $signed($unsigned(wire0));
      if (wire5[(4'hc):(3'h5)])
        begin
          reg130 <= wire128;
          reg131 <= ($unsigned($unsigned($unsigned((wire2 ?
              wire128 : wire5)))) < (+(|({(7'h43)} >>> {wire1, wire2}))));
          if (((8'hbc) ? $unsigned(reg130) : {reg131[(3'h5):(1'h0)]}))
            begin
              reg132 <= {(|$unsigned((wire5[(2'h2):(1'h0)] ^~ $unsigned(reg129)))),
                  reg130[(4'hb):(4'hb)]};
              reg133 <= wire5;
            end
          else
            begin
              reg132 <= reg129;
              reg133 <= reg131[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg130 <= reg129[(1'h1):(1'h0)];
        end
      reg134 <= $signed((!reg130[(4'h8):(2'h3)]));
      reg135 <= wire3[(4'ha):(2'h3)];
      reg136 <= (^{{$unsigned($unsigned(wire2)), reg131},
          ($unsigned((~^reg133)) == wire0[(1'h1):(1'h0)])});
    end
  module137 #() modinst277 (.clk(clk), .wire139(wire128), .wire141(wire2), .wire140(wire4), .y(wire276), .wire138(wire0));
  assign wire278 = $signed((8'ha9));
  assign wire279 = (!reg129);
  always
    @(posedge clk) begin
      reg280 <= $unsigned(reg133);
      reg281 <= $signed(wire3);
      if ($signed(reg281[(3'h4):(1'h1)]))
        begin
          reg282 <= wire0[(4'h9):(3'h7)];
          reg283 <= {$signed((&$unsigned(reg135))), wire279};
        end
      else
        begin
          reg282 <= (((reg130 <<< $signed((reg136 - wire4))) ?
              $signed({$signed(wire5)}) : (8'had)) <= ($signed($unsigned(wire0)) ?
              ((~^{reg132}) <<< $unsigned((reg134 ?
                  wire126 : (8'hbe)))) : (~^(^~reg129))));
          if ((|reg132))
            begin
              reg283 <= wire5;
              reg284 <= (^wire2);
            end
          else
            begin
              reg283 <= wire1[(5'h13):(4'hc)];
              reg284 <= $unsigned((({wire279[(1'h0):(1'h0)]} >>> (wire1[(4'he):(4'hc)] ?
                      (reg129 == wire128) : $signed(wire279))) ?
                  $unsigned((wire3[(4'hd):(4'ha)] ?
                      (8'hac) : wire276)) : ($signed((~wire279)) <<< reg131)));
              reg285 <= $unsigned((8'hb8));
              reg286 <= reg282[(2'h2):(1'h1)];
              reg287 <= reg131;
            end
          if ($signed(wire0[(4'hb):(3'h5)]))
            begin
              reg288 <= reg131;
              reg289 <= $unsigned($signed(($unsigned({wire2,
                  wire1}) >>> reg286[(4'h8):(3'h5)])));
            end
          else
            begin
              reg288 <= {({wire128,
                      (7'h40)} << ({wire4[(4'he):(4'h8)]} >>> (|(wire5 < reg287)))),
                  ((+(reg133 | $signed(wire276))) * ($unsigned({reg284,
                          wire2}) ?
                      (~|(^~reg133)) : $signed((^~(8'ha5)))))};
            end
          reg290 <= (reg287 ?
              ({$signed({reg132})} ?
                  (wire5 & wire1) : ({wire4,
                      (wire278 && wire2)} == reg134[(2'h3):(2'h3)])) : {$unsigned(reg283[(3'h5):(1'h0)]),
                  {($unsigned(wire1) | $signed((7'h43)))}});
          if (reg284[(5'h13):(5'h12)])
            begin
              reg291 <= $signed($signed((~$signed((wire5 | reg280)))));
            end
          else
            begin
              reg291 <= (8'hbc);
              reg292 <= $signed($unsigned(((~&wire3[(1'h1):(1'h0)]) ?
                  $unsigned(wire5[(4'hb):(2'h2)]) : (!wire5[(4'h9):(2'h3)]))));
            end
        end
      reg293 <= $signed($unsigned(wire4));
      reg294 <= $signed({$signed((wire0[(4'he):(3'h5)] < $signed(reg291)))});
    end
  assign wire295 = (~|reg287);
  assign wire296 = ($unsigned($signed(($signed(reg284) == $unsigned(reg283)))) ?
                       wire4 : {reg294, (8'ha1)});
  assign wire297 = (&{((~|reg129[(2'h2):(1'h0)]) || $signed(reg281[(3'h4):(1'h0)]))});
  always
    @(posedge clk) begin
      reg298 <= reg285;
      if ($signed($unsigned((!reg130))))
        begin
          reg299 <= (reg136 ?
              reg135[(4'hd):(4'h8)] : (-(^$signed((reg129 ?
                  wire4 : (8'hbf))))));
          reg300 <= (|({$unsigned($signed(reg134))} || $signed((~|(reg132 | wire276)))));
          reg301 <= (reg289 ?
              (~|$unsigned((wire5[(1'h1):(1'h1)] ?
                  $signed((8'ha2)) : $unsigned(reg131)))) : $signed($signed($signed(wire2))));
          reg302 <= (8'ha3);
          reg303 <= (|((reg130 - wire3[(5'h12):(4'hf)]) && ($unsigned($signed(reg300)) ?
              $signed(((8'ha7) ? wire297 : reg132)) : wire5)));
        end
      else
        begin
          if (reg286)
            begin
              reg299 <= reg285;
            end
          else
            begin
              reg299 <= {$unsigned($unsigned(wire278))};
              reg300 <= {($unsigned(reg292) >= (~$signed((^reg298)))),
                  wire126[(1'h1):(1'h0)]};
            end
          reg301 <= ($unsigned(((8'ha6) ^~ {$unsigned(reg299)})) >= wire276);
          reg302 <= wire278[(3'h7):(3'h4)];
          reg303 <= ($signed((wire4[(4'hb):(1'h0)] ?
                  $signed(wire126[(3'h5):(1'h0)]) : (~&$unsigned(wire278)))) ?
              {$signed(wire126[(3'h5):(2'h3)])} : wire296[(2'h2):(1'h1)]);
        end
      reg304 <= $unsigned((|(^$unsigned((reg286 <= reg283)))));
    end
  assign wire305 = reg282[(1'h1):(1'h1)];
endmodule

module module137  (y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire141;
  input wire signed [(5'h14):(1'h0)] wire140;
  input wire [(4'hc):(1'h0)] wire139;
  input wire [(5'h15):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire273;
  wire [(2'h2):(1'h0)] wire271;
  wire signed [(5'h10):(1'h0)] wire223;
  wire signed [(4'hb):(1'h0)] wire222;
  wire signed [(5'h12):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire181;
  wire signed [(4'he):(1'h0)] wire182;
  wire [(4'he):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire185;
  wire [(3'h4):(1'h0)] wire186;
  wire signed [(2'h2):(1'h0)] wire187;
  wire [(5'h14):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire220;
  reg signed [(4'hc):(1'h0)] reg275 = (1'h0);
  reg [(5'h13):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  assign y = {wire273,
                 wire271,
                 wire223,
                 wire222,
                 wire179,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 wire186,
                 wire187,
                 wire188,
                 wire189,
                 wire220,
                 reg275,
                 reg274,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~{((8'hba) ? {{(8'ha4)}} : wire140[(5'h13):(3'h5)]), (!wire141)}))
        begin
          reg142 <= $signed((^($signed((wire141 ?
              wire141 : wire141)) >= $signed({wire138, wire138}))));
        end
      else
        begin
          reg142 <= (($unsigned(({(8'h9c)} ^~ $signed(wire140))) == ($signed(wire139[(3'h6):(3'h4)]) ?
                  ($signed((8'haa)) >= $signed(wire139)) : (|{wire141}))) ?
              (~&{reg142[(4'ha):(4'ha)]}) : {wire139[(4'hb):(1'h0)],
                  wire140[(5'h13):(2'h3)]});
          if (wire139)
            begin
              reg143 <= (~wire141[(3'h6):(1'h0)]);
            end
          else
            begin
              reg143 <= reg143;
              reg144 <= ({$signed((wire141 & $signed((8'hb5))))} >= (-(~|((8'hbc) ~^ wire139[(4'hc):(2'h2)]))));
            end
        end
    end
  assign wire145 = (&$signed($unsigned(({reg142, reg144} ?
                       (|(8'ha8)) : (~^(8'hb7))))));
  assign wire146 = reg143[(4'h8):(1'h0)];
  assign wire147 = ((~|reg143[(1'h1):(1'h1)]) && wire141);
  assign wire148 = ($unsigned((reg143 ?
                       (~|$signed(wire141)) : (8'h9f))) == wire138);
  module149 #() modinst180 (wire179, clk, wire148, wire138, wire140, reg144);
  assign wire181 = (wire147[(3'h4):(2'h3)] < {reg144});
  assign wire182 = $signed((&$signed(wire179[(4'h9):(3'h5)])));
  assign wire183 = (~^{wire141});
  assign wire184 = {(wire145[(2'h3):(2'h3)] + wire140[(3'h7):(2'h2)]),
                       {$signed({(wire148 * wire179)}),
                           (wire182 <= $signed($unsigned(reg144)))}};
  assign wire185 = $unsigned({(wire182 != ((wire182 ? wire147 : wire182) ?
                           (wire140 < reg143) : {(8'hab), wire138}))});
  assign wire186 = (wire145[(1'h0):(1'h0)] ?
                       ($unsigned((((8'hae) ?
                               wire146 : wire138) <<< ((8'hbf) ^ (8'ha7)))) ?
                           $unsigned(wire139[(4'h9):(3'h5)]) : ((+{wire140}) ?
                               $unsigned($unsigned(wire185)) : ({reg143} ?
                                   {wire183,
                                       wire184} : $signed(wire181)))) : wire140);
  assign wire187 = ((~|reg143[(1'h1):(1'h0)]) ?
                       (~|((reg143 != wire179[(4'hb):(3'h5)]) ?
                           ((wire148 < (8'hb6)) ?
                               (^~(8'ha2)) : reg142[(4'hc):(1'h0)]) : (wire140 ^ reg142[(3'h7):(3'h6)]))) : (^(reg142 ?
                           $unsigned((wire145 ?
                               (8'haf) : wire140)) : $signed((-(8'hb7))))));
  assign wire188 = (~|$unsigned($unsigned(wire182[(4'h8):(3'h4)])));
  assign wire189 = $unsigned(wire141[(3'h4):(2'h2)]);
  module190 #() modinst221 (.wire194(wire145), .clk(clk), .wire195(wire182), .wire191(wire183), .wire193(wire188), .wire192(wire141), .y(wire220));
  assign wire222 = $signed(((^$signed($signed(wire186))) == (reg144 && $signed((wire146 ?
                       wire139 : wire188)))));
  assign wire223 = {wire182};
  module224 #() modinst272 (wire271, clk, wire141, reg144, wire138, wire220, wire189);
  assign wire273 = wire223;
  always
    @(posedge clk) begin
      reg274 <= wire271;
      reg275 <= {{(|($unsigned(wire186) ?
                  (wire146 ? wire139 : wire147) : {wire182, wire182})),
              (~^wire179)}};
    end
endmodule

module module6
#(parameter param124 = (^~(~(({(8'hb5), (7'h44)} ? ((8'hb6) ~^ (7'h40)) : {(8'hb6), (7'h43)}) ? ((7'h41) << (~(8'hbf))) : (|((7'h41) ? (8'hb5) : (7'h44)))))), 
parameter param125 = {((^{(param124 ? param124 : param124)}) << (&param124)), {({(8'hb9)} ? ({param124} << (~&param124)) : {{param124}}), (((~^param124) ? param124 : (~param124)) <= param124)}})
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire122;
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  assign y = {wire58,
                 wire48,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire122,
                 reg47,
                 reg42,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire12 = ({{(wire7 ? (~wire9) : (wire8 == wire11)),
                              $signed((|(7'h42)))},
                          (wire10 == {(^wire11), wire8[(4'hc):(2'h3)]})} ?
                      ($signed(wire7[(3'h6):(1'h0)]) < {$unsigned($signed(wire10))}) : ({$signed(wire11[(1'h1):(1'h0)])} ?
                          $unsigned((wire11 ?
                              (^(8'hb8)) : (wire7 ?
                                  wire9 : wire7))) : $signed((wire11 ?
                              wire7 : $signed(wire11)))));
  assign wire13 = wire7[(3'h6):(3'h4)];
  assign wire14 = wire12;
  assign wire15 = wire12[(2'h3):(2'h2)];
  assign wire16 = (~^$signed($signed(wire14[(1'h1):(1'h1)])));
  assign wire17 = (wire14[(3'h6):(3'h5)] ? (~&{(~(^wire11))}) : {wire11});
  assign wire18 = $signed($unsigned(((wire8 ?
                          wire13[(2'h3):(2'h3)] : $unsigned(wire9)) ?
                      ((wire16 ? (8'hac) : wire16) <= (~&wire12)) : wire8)));
  module19 #() modinst38 (wire37, clk, wire9, wire17, wire13, wire7);
  assign wire39 = wire7;
  assign wire40 = ((7'h43) ^ (wire11 >>> $signed(wire15)));
  assign wire41 = ((~&(&($unsigned(wire11) ^~ (wire9 ? wire16 : wire8)))) ?
                      (wire39[(2'h2):(1'h0)] ^ $unsigned((|(wire37 <= (8'hb6))))) : ($unsigned(wire18) ^ (~|$unsigned($signed(wire11)))));
  always
    @(posedge clk) begin
      reg42 <= (wire17 < {{{{(8'hbe)}}}});
    end
  assign wire43 = $signed(($signed(wire7) ^~ (wire10 ?
                      (~&(wire14 ?
                          wire9 : wire8)) : (((8'ha4) > wire9) >> (wire13 == wire15)))));
  assign wire44 = (wire18 < {$signed((~&(wire18 - wire10))),
                      (wire43 ?
                          $unsigned((wire16 ?
                              wire14 : wire7)) : $unsigned(wire17))});
  assign wire45 = {(!wire18[(3'h6):(2'h3)])};
  assign wire46 = $unsigned($signed((wire16 ?
                      ({(7'h41)} ?
                          $unsigned(wire7) : (+(8'h9c))) : $signed((wire14 >= wire44)))));
  always
    @(posedge clk) begin
      reg47 <= $unsigned($signed(wire18[(1'h1):(1'h0)]));
    end
  assign wire48 = ((~^$signed((~|wire37[(1'h1):(1'h0)]))) <<< reg42[(3'h4):(1'h0)]);
  module49 #() modinst59 (wire58, clk, wire45, wire17, reg47, wire41);
  always
    @(posedge clk) begin
      reg60 <= reg42[(2'h2):(1'h0)];
      reg61 <= wire48;
      reg62 <= {$signed(reg61[(2'h2):(1'h1)])};
    end
  module63 #() modinst123 (.wire67(wire11), .clk(clk), .wire65(reg47), .wire64(wire39), .y(wire122), .wire66(wire43));
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h253):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire67;
  input wire [(4'ha):(1'h0)] wire66;
  input wire signed [(4'ha):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire79,
                 wire78,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
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
                 reg104,
                 reg103,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire68 = (~(wire65[(3'h6):(2'h3)] > $signed(wire67)));
  assign wire69 = wire66[(1'h0):(1'h0)];
  assign wire70 = ((({(+(8'h9e))} ? wire66 : (|(8'h9d))) > wire66) ?
                      (|(((wire65 ? wire67 : wire64) ?
                              (+wire64) : {wire64, wire68}) ?
                          (~|(wire65 - (8'hb6))) : $unsigned((~|wire68)))) : (+($signed($unsigned(wire65)) ?
                          {wire65, $signed(wire68)} : ((~^wire69) > {wire67,
                              (8'h9f)}))));
  assign wire71 = wire65;
  always
    @(posedge clk) begin
      reg72 <= {wire69[(4'hc):(4'hb)], wire71};
      if (wire71[(2'h2):(1'h1)])
        begin
          reg73 <= wire66;
          reg74 <= (+($unsigned(($unsigned(wire65) ?
              wire70[(3'h7):(3'h5)] : $signed((8'h9e)))) | {($signed(wire70) ?
                  (wire68 | wire67) : ((8'h9d) ? wire65 : (8'hb6)))}));
          reg75 <= $unsigned(wire65);
          reg76 <= $signed($signed(wire65));
          reg77 <= wire71[(2'h2):(2'h2)];
        end
      else
        begin
          if ((&(!$signed($unsigned(reg77[(1'h0):(1'h0)])))))
            begin
              reg73 <= reg77;
              reg74 <= (8'hbc);
              reg75 <= $signed(((wire71 != (wire71 ^~ $signed(reg74))) < ({{reg72}} ?
                  $signed({reg73}) : $signed((wire64 ? wire67 : wire68)))));
            end
          else
            begin
              reg73 <= (~&($signed($signed(reg75[(4'h8):(3'h6)])) ~^ $signed((^~$unsigned(reg74)))));
              reg74 <= ((~|(~^($signed(wire64) ?
                      $unsigned(wire66) : (wire68 ? reg74 : wire64)))) ?
                  (^~wire71[(4'hc):(1'h0)]) : {($signed((reg75 ?
                          wire64 : reg73)) <= ((wire67 ?
                          reg73 : (8'haf)) & reg77[(4'h9):(4'h8)])),
                      (wire68[(3'h4):(2'h2)] ?
                          reg73 : (|(wire71 ? wire68 : wire65)))});
              reg75 <= {{wire71, {{reg73, wire68}, wire70}},
                  (~&$signed(reg72[(4'h9):(3'h5)]))};
              reg76 <= $signed(({($signed(wire69) ?
                      (reg77 ^~ reg72) : $signed(wire65)),
                  (((8'hb0) || reg73) + wire71)} >> (~(8'hbd))));
              reg77 <= (reg75 >>> wire69[(3'h4):(1'h0)]);
            end
        end
    end
  assign wire78 = ($unsigned((^~$signed($signed((8'h9d))))) ?
                      $signed((^$signed(wire71))) : wire65);
  assign wire79 = wire66;
  always
    @(posedge clk) begin
      if (reg77)
        begin
          if (wire71)
            begin
              reg80 <= $signed($signed(($unsigned((reg76 ?
                  reg75 : reg76)) ~^ (&$unsigned(wire79)))));
            end
          else
            begin
              reg80 <= wire79;
              reg81 <= $signed($unsigned((($unsigned((7'h42)) ?
                      $unsigned(wire64) : (wire64 << (8'ha0))) ?
                  (reg73 ~^ reg73) : (~|{reg76, reg80}))));
            end
          reg82 <= wire71[(1'h0):(1'h0)];
          reg83 <= (((wire64[(1'h1):(1'h1)] ? wire67[(4'h9):(2'h3)] : reg81) ?
              $unsigned(($unsigned(wire64) * (8'ha0))) : (8'h9e)) >> reg75);
          if ((reg80 ?
              (^(reg82[(4'h9):(3'h7)] ?
                  $unsigned(wire64[(2'h3):(1'h0)]) : reg81[(3'h6):(2'h2)])) : ((~^wire66) | (!({reg83,
                      reg80} ?
                  (reg80 ? wire78 : wire66) : (reg82 ? wire71 : wire69))))))
            begin
              reg84 <= (reg72[(4'hc):(3'h6)] ?
                  ($signed((reg81 <= (wire71 ?
                      (8'ha7) : wire79))) ~^ $unsigned($unsigned((wire69 ?
                      wire64 : wire69)))) : {wire70});
              reg85 <= ($unsigned({$unsigned(wire70)}) ?
                  reg76[(3'h6):(3'h6)] : wire78);
            end
          else
            begin
              reg84 <= (reg84 ?
                  (&reg74) : (^(~^((wire68 >> reg73) | (reg75 && reg73)))));
              reg85 <= $signed((reg84 ?
                  $unsigned((&$unsigned(reg80))) : wire64[(2'h2):(2'h2)]));
              reg86 <= $unsigned($unsigned((8'ha5)));
            end
        end
      else
        begin
          if ($signed((~({((8'hb4) ? reg80 : reg83), $unsigned((8'hbb))} ?
              $unsigned({(8'ha4), wire69}) : (reg82[(3'h4):(2'h2)] ?
                  {reg85} : $signed(wire70))))))
            begin
              reg80 <= wire69;
            end
          else
            begin
              reg80 <= {reg76, reg72};
              reg81 <= wire64;
              reg82 <= (~|($signed(((reg75 || reg83) + reg80[(1'h1):(1'h1)])) == (~wire69[(1'h0):(1'h0)])));
            end
          reg83 <= $unsigned($unsigned(reg76[(4'h9):(2'h3)]));
          reg84 <= ((~&{({(8'hbf)} >>> ((8'hab) == wire66))}) >>> {$signed($unsigned((~^wire68))),
              $unsigned(($signed(reg75) ? $signed(reg84) : $signed((8'haa))))});
        end
      reg87 <= ($unsigned($signed(reg85[(2'h3):(2'h2)])) <<< (wire70 * (~&($unsigned(wire70) ?
          (wire70 ? (7'h44) : wire71) : (wire65 ? wire69 : (8'hbe))))));
      reg88 <= $signed(reg82);
      reg89 <= reg75[(4'h8):(1'h1)];
      reg90 <= reg82;
    end
  always
    @(posedge clk) begin
      if ((wire68 ? $signed((reg84 > $signed(wire71[(4'he):(3'h5)]))) : reg83))
        begin
          reg91 <= ($unsigned(wire65) ^~ reg82);
        end
      else
        begin
          reg91 <= $unsigned((((-$unsigned(reg83)) >>> wire66[(1'h0):(1'h0)]) ?
              (!((-reg82) ?
                  wire66[(3'h4):(3'h4)] : reg73)) : (reg89[(4'ha):(3'h7)] * ($unsigned(reg81) ?
                  $unsigned(reg88) : {reg90, wire65}))));
          reg92 <= (reg75 - (-$unsigned(((&(8'ha2)) && wire71))));
          reg93 <= ({reg73, $unsigned({wire70})} | (8'ha9));
          reg94 <= $unsigned($unsigned(((8'haa) >> $unsigned($signed(wire69)))));
        end
      if (((wire70 ?
          reg73 : (((reg75 ?
              wire79 : reg89) ^ (~reg73)) ~^ (wire66 || (|(8'ha7))))) >>> wire67))
        begin
          reg95 <= (({{{reg89, wire71}, $signed(wire66)},
                      wire64[(2'h2):(2'h2)]} ?
                  (!reg92) : $unsigned($signed($signed(wire69)))) ?
              (reg80 ?
                  ({{wire70}} & ($signed((8'ha8)) ?
                      (|reg76) : (wire66 ?
                          reg86 : (8'ha3)))) : (!{$signed(reg86)})) : $unsigned($signed((!$signed(reg90)))));
        end
      else
        begin
          if (reg92[(2'h2):(2'h2)])
            begin
              reg95 <= $unsigned(reg95);
              reg96 <= (-reg73);
              reg97 <= ($unsigned((wire69 & reg73)) ?
                  (+$unsigned($unsigned((reg74 ?
                      reg94 : reg86)))) : $signed(wire71[(3'h6):(1'h1)]));
            end
          else
            begin
              reg95 <= (($signed(reg81[(1'h1):(1'h0)]) ?
                      $signed(wire64) : $unsigned((!((8'ha4) + reg83)))) ?
                  {(~^$signed($unsigned(wire79)))} : (8'ha7));
              reg96 <= ({((7'h41) ?
                          (reg87 >>> wire64[(1'h1):(1'h0)]) : (reg96 ?
                              $unsigned((8'hb9)) : (wire66 + (8'ha3)))),
                      ($signed(((8'hbf) ? reg73 : wire68)) * ((-wire70) ?
                          reg91[(3'h6):(3'h5)] : $unsigned(reg87)))} ?
                  wire70[(3'h5):(1'h0)] : reg93[(3'h4):(2'h3)]);
            end
          reg98 <= wire64[(1'h0):(1'h0)];
          if (((reg86 >> $signed($unsigned(reg96[(3'h5):(2'h2)]))) + $signed(($unsigned(reg84) >>> {reg83[(3'h4):(2'h2)]}))))
            begin
              reg99 <= $unsigned((^~reg82[(4'hc):(2'h2)]));
              reg100 <= $signed($signed($unsigned(((^~reg98) >>> (~^(8'had))))));
              reg101 <= reg97[(1'h0):(1'h0)];
              reg102 <= (-reg80);
              reg103 <= (reg85[(1'h0):(1'h0)] ? reg80 : reg92);
            end
          else
            begin
              reg99 <= (8'hae);
            end
          reg104 <= wire70;
        end
      reg105 <= reg73;
      reg106 <= $signed($unsigned({wire71[(4'h8):(2'h3)]}));
    end
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg107 <= (((($signed(reg73) ?
                          $unsigned(reg89) : reg75[(1'h1):(1'h0)]) ?
                      reg106[(4'ha):(3'h7)] : (~|(~wire66))) ?
                  wire67 : ((~^wire67[(3'h5):(1'h1)]) == ($signed(reg76) ?
                      (reg81 != reg83) : (^reg100)))) ?
              $signed($unsigned(reg102)) : {reg75[(3'h5):(2'h3)],
                  $signed(((reg75 ? (8'ha3) : reg102) ^ (reg100 ?
                      wire71 : reg85)))});
          reg108 <= $signed((!reg80[(1'h0):(1'h0)]));
          if ((reg93 ^ reg81[(3'h4):(3'h4)]))
            begin
              reg109 <= wire79;
              reg110 <= (wire71 ? $signed(wire79[(4'h9):(2'h2)]) : reg82);
              reg111 <= (!reg87);
            end
          else
            begin
              reg109 <= $unsigned({$signed(((-reg103) ?
                      (8'hb9) : $signed((8'hb5)))),
                  $unsigned($unsigned($unsigned(wire64)))});
              reg110 <= $unsigned(reg103[(1'h1):(1'h1)]);
              reg111 <= wire64;
            end
          if ($signed($signed($unsigned(($unsigned(reg76) ^~ (reg96 ?
              reg104 : reg110))))))
            begin
              reg112 <= wire65;
              reg113 <= $signed((~reg107[(2'h2):(1'h0)]));
              reg114 <= ((($unsigned((+reg72)) < reg88) ?
                      (reg90 ?
                          $unsigned($unsigned(reg112)) : reg99[(2'h2):(2'h2)]) : (-(reg108 >= reg101))) ?
                  $unsigned($signed(reg75)) : (wire78[(4'hd):(4'hb)] ?
                      $signed(({reg83} ?
                          reg80 : (~reg86))) : reg83[(3'h4):(2'h3)]));
              reg115 <= ((8'hb5) << reg106);
            end
          else
            begin
              reg112 <= reg102[(4'h9):(2'h2)];
            end
        end
      else
        begin
          if ((($signed((-$unsigned(wire65))) ? reg97 : wire69) < (~&reg72)))
            begin
              reg107 <= $unsigned($signed(($signed((reg104 || reg89)) || reg108[(3'h5):(1'h0)])));
              reg108 <= reg104[(3'h7):(2'h2)];
            end
          else
            begin
              reg107 <= reg90;
              reg108 <= reg86[(1'h1):(1'h0)];
              reg109 <= (8'ha7);
            end
          reg110 <= $signed(wire68);
          if ((|($signed($unsigned($signed((8'hb7)))) + (($unsigned((8'hb6)) >= $unsigned(reg91)) ?
              $signed(wire78[(3'h7):(3'h5)]) : (^{(8'hbb), reg115})))))
            begin
              reg111 <= $signed(($signed(($signed(wire79) ?
                      reg89[(2'h3):(1'h0)] : ((8'hac) < wire79))) ?
                  $signed($unsigned((reg84 ?
                      wire69 : reg85))) : $signed($unsigned((reg77 | reg108)))));
              reg112 <= (|(&(reg92 == $unsigned(reg107))));
              reg113 <= reg90[(2'h3):(1'h1)];
              reg114 <= (((|$unsigned($unsigned(reg92))) <<< reg109) >>> ((~&wire69[(4'hc):(4'hb)]) ?
                  reg87 : (8'hb6)));
            end
          else
            begin
              reg111 <= reg92[(4'ha):(2'h2)];
              reg112 <= ($signed((reg80 ?
                      (-reg108) : $unsigned($signed(reg104)))) ?
                  ((reg106[(3'h7):(2'h2)] ^~ reg100[(4'h9):(3'h7)]) ?
                      ($signed(wire68) ?
                          (reg93 - wire71) : (~&$unsigned(reg109))) : (8'ha1)) : (((&reg99[(4'he):(4'hb)]) ?
                      reg103 : ($unsigned(reg100) ?
                          (^~reg74) : $unsigned(reg76))) > (~^reg104[(4'h8):(2'h2)])));
            end
          reg115 <= {(~|$signed($signed($unsigned((8'ha2)))))};
        end
      reg116 <= {reg98, wire69[(5'h12):(3'h4)]};
    end
  always
    @(posedge clk) begin
      reg117 <= ((wire70 < $unsigned($signed((reg107 == reg95)))) | ($signed((!$unsigned(wire70))) ?
          ((~^reg90[(2'h2):(2'h2)]) << $unsigned((reg88 * reg86))) : reg75));
      reg118 <= $signed((^(~|reg93[(1'h1):(1'h0)])));
      reg119 <= reg88;
    end
  assign wire120 = $signed((((^~reg88[(1'h1):(1'h1)]) ?
                           reg82[(4'hf):(3'h6)] : ($unsigned(reg110) ?
                               (8'hbd) : $signed(reg104))) ?
                       (^~(8'ha7)) : {(~&$signed(reg101)), {wire65}}));
  assign wire121 = $signed((!(reg106[(3'h6):(1'h1)] ?
                       reg113[(1'h1):(1'h0)] : ((reg118 ?
                           reg117 : reg118) << (8'hbf)))));
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(5'h11):(1'h0)] wire52;
  input wire [(4'hc):(1'h0)] wire51;
  input wire [(5'h13):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  assign y = {wire57, wire56, wire55, wire54, (1'h0)};
  assign wire54 = $signed((8'hb8));
  assign wire55 = wire52[(4'h9):(1'h0)];
  assign wire56 = (-$unsigned((+($signed(wire53) ?
                      wire54[(4'ha):(3'h6)] : wire55))));
  assign wire57 = ((+$unsigned($signed((wire55 <= wire53)))) ~^ wire51[(4'h9):(3'h6)]);
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 (1'h0)};
  assign wire24 = $unsigned(($unsigned(((!wire23) != ((8'hb9) ?
                      wire21 : wire21))) ~^ wire23));
  assign wire25 = $signed((~$signed(wire20)));
  assign wire26 = (8'haf);
  assign wire27 = $unsigned((|$signed(wire22[(2'h3):(1'h0)])));
  assign wire28 = $unsigned((~^$unsigned($unsigned((7'h42)))));
  assign wire29 = {wire25, $signed($unsigned($signed($signed(wire24))))};
  assign wire30 = {$signed($signed(((^wire28) & (wire28 - wire26))))};
  assign wire31 = $signed({($unsigned((wire26 ? wire26 : wire21)) ?
                          wire28[(1'h1):(1'h1)] : $signed((~&wire28))),
                      ($signed(wire23) ?
                          (wire24[(3'h7):(3'h4)] ?
                              (wire28 ?
                                  wire25 : wire28) : (~|(8'ha2))) : wire22[(2'h2):(1'h1)])});
  assign wire32 = (((!$unsigned((wire27 ?
                      wire26 : wire23))) << wire30[(4'hf):(3'h6)]) * ($unsigned((wire29[(4'ha):(1'h1)] > ((8'ha2) ?
                      wire20 : wire24))) == wire23));
  assign wire33 = (-$signed($signed(((7'h41) ?
                      wire20[(4'h8):(2'h3)] : (wire20 ? (8'hb9) : wire21)))));
  assign wire34 = ({$signed(wire29[(4'ha):(3'h5)]),
                          (-$signed($signed(wire30)))} ?
                      ($unsigned(wire25[(2'h2):(1'h0)]) >= wire20) : (8'ha4));
  assign wire35 = {{$unsigned({(wire22 ? (8'hac) : wire34),
                              (wire22 ? (8'haf) : wire24)}),
                          wire28[(3'h7):(3'h4)]}};
  assign wire36 = ($unsigned({$unsigned((wire29 ? wire31 : wire24))}) ?
                      ((wire27[(3'h5):(1'h0)] <<< wire21) ?
                          wire26 : $signed(wire35)) : wire27[(1'h1):(1'h0)]);
endmodule

module module224
#(parameter param269 = (7'h43), 
parameter param270 = (param269 ? ((~&((param269 ? param269 : param269) - (param269 & param269))) >>> ((~|(^param269)) || ((param269 << param269) ? (+param269) : (~|param269)))) : param269))
(y, clk, wire229, wire228, wire227, wire226, wire225);
  output wire [(32'h1fd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire229;
  input wire [(2'h2):(1'h0)] wire228;
  input wire [(5'h15):(1'h0)] wire227;
  input wire [(2'h2):(1'h0)] wire226;
  input wire signed [(4'hf):(1'h0)] wire225;
  wire signed [(3'h7):(1'h0)] wire263;
  wire signed [(2'h2):(1'h0)] wire262;
  wire signed [(5'h12):(1'h0)] wire261;
  wire signed [(4'hc):(1'h0)] wire260;
  wire signed [(5'h13):(1'h0)] wire242;
  wire signed [(5'h10):(1'h0)] wire241;
  wire [(5'h10):(1'h0)] wire238;
  wire signed [(4'hb):(1'h0)] wire237;
  wire [(5'h12):(1'h0)] wire236;
  wire signed [(4'he):(1'h0)] wire235;
  wire [(5'h11):(1'h0)] wire234;
  wire [(4'hc):(1'h0)] wire233;
  wire signed [(4'h9):(1'h0)] wire232;
  wire [(4'hc):(1'h0)] wire231;
  reg [(4'he):(1'h0)] reg268 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg267 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg266 = (1'h0);
  reg [(4'hd):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg264 = (1'h0);
  reg [(2'h3):(1'h0)] reg259 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg258 = (1'h0);
  reg [(4'ha):(1'h0)] reg257 = (1'h0);
  reg [(4'hb):(1'h0)] reg256 = (1'h0);
  reg [(5'h11):(1'h0)] reg255 = (1'h0);
  reg [(5'h12):(1'h0)] reg254 = (1'h0);
  reg [(5'h12):(1'h0)] reg253 = (1'h0);
  reg [(5'h14):(1'h0)] reg252 = (1'h0);
  reg [(5'h11):(1'h0)] reg251 = (1'h0);
  reg signed [(4'he):(1'h0)] reg250 = (1'h0);
  reg [(4'he):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg248 = (1'h0);
  reg [(5'h15):(1'h0)] reg247 = (1'h0);
  reg [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(4'he):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg244 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg243 = (1'h0);
  reg [(5'h14):(1'h0)] reg240 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg230 = (1'h0);
  assign y = {wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire242,
                 wire241,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg240,
                 reg239,
                 reg230,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg230 <= (~&(~|$unsigned($unsigned((wire225 ~^ wire229)))));
    end
  assign wire231 = $signed(wire225);
  assign wire232 = wire227;
  assign wire233 = {wire226[(2'h2):(1'h1)], $unsigned(wire225)};
  assign wire234 = {(reg230[(1'h1):(1'h1)] ?
                           (wire231 + ((wire226 ^ wire229) ?
                               wire232 : (wire233 || wire229))) : ((-(reg230 ?
                                   wire226 : wire233)) ?
                               wire228 : {$unsigned(wire228)}))};
  assign wire235 = ($unsigned((wire227 ~^ $unsigned((wire225 ?
                           wire226 : (8'ha2))))) ?
                       $signed($signed({(~|wire231),
                           wire234[(4'h9):(4'h9)]})) : $signed(({(+wire232)} | ($unsigned(wire225) >> (wire234 >= reg230)))));
  assign wire236 = $signed(wire225);
  assign wire237 = wire226;
  assign wire238 = ((~^wire228) - ($unsigned($signed((8'hb7))) ?
                       (wire229 ?
                           $signed($unsigned(wire235)) : ((reg230 ?
                               wire236 : wire232) ^ $signed((8'ha3)))) : wire229[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg239 <= wire234[(3'h7):(3'h5)];
      reg240 <= $unsigned(wire226);
    end
  assign wire241 = ($unsigned((~|(-(8'haf)))) ?
                       ($unsigned($unsigned((wire234 ?
                           wire225 : (8'hbc)))) * ({reg230} ?
                           (8'hb4) : {(~reg239),
                               (^~wire238)})) : wire225[(4'ha):(3'h4)]);
  assign wire242 = wire225[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      reg243 <= (~|$unsigned(wire232));
      reg244 <= $unsigned((wire231[(4'h9):(2'h3)] ^~ (-($unsigned(wire225) <= {(8'hbb)}))));
      if ($unsigned(reg239[(1'h0):(1'h0)]))
        begin
          if ((~{wire237[(4'ha):(4'ha)],
              ($signed((^~(8'hb2))) <= (-(reg239 + (7'h40))))}))
            begin
              reg245 <= (8'hb8);
              reg246 <= reg244;
            end
          else
            begin
              reg245 <= $unsigned({(wire226[(2'h2):(1'h1)] ?
                      $unsigned($unsigned(wire227)) : wire232[(4'h8):(4'h8)]),
                  ($unsigned($signed(wire228)) && ((wire238 ?
                      reg230 : wire225) - (reg245 | (8'hb4))))});
              reg246 <= (reg230 & wire234[(4'hc):(1'h1)]);
              reg247 <= reg230;
              reg248 <= $unsigned(wire233);
            end
          if (reg230)
            begin
              reg249 <= ((wire235[(3'h5):(1'h0)] ?
                  (&((reg230 ? (8'hbb) : wire225) ?
                      (8'ha3) : wire236)) : wire228[(1'h0):(1'h0)]) <<< (($unsigned($signed(wire232)) <<< {(wire236 ?
                          wire235 : reg239),
                      $unsigned(wire242)}) ?
                  $unsigned(reg248) : (8'h9c)));
              reg250 <= $unsigned((-wire234[(1'h1):(1'h0)]));
              reg251 <= wire237[(2'h2):(1'h0)];
            end
          else
            begin
              reg249 <= $unsigned(reg239);
              reg250 <= (&reg246[(3'h7):(3'h5)]);
            end
          reg252 <= ((~&$signed($signed((~wire228)))) <= reg248);
        end
      else
        begin
          if ($signed((|(reg251 ?
              $signed($signed(reg251)) : $unsigned({wire227})))))
            begin
              reg245 <= {reg245, $signed({(~|(^~wire229))})};
              reg246 <= wire233;
              reg247 <= $signed(($unsigned(($signed(reg252) ?
                      reg246 : $unsigned(wire227))) ?
                  (~wire227[(3'h7):(3'h7)]) : (~|($unsigned(wire242) ?
                      $signed(wire227) : reg245[(3'h4):(1'h1)]))));
              reg248 <= (($signed($unsigned(wire235[(4'hd):(3'h7)])) - ((&(reg244 ?
                      wire238 : (8'ha7))) ?
                  (reg230[(2'h2):(1'h1)] ?
                      $unsigned(wire235) : {(8'hb5)}) : (((8'h9d) ?
                      reg230 : wire235) <= reg243))) + ((wire242[(5'h10):(4'h8)] << $unsigned($unsigned(wire226))) == ($signed((wire225 ?
                      reg240 : wire229)) ?
                  ((wire232 ? reg244 : wire225) ?
                      (8'hbf) : $signed(reg247)) : (~&(reg247 ?
                      (8'hb5) : wire241)))));
              reg249 <= (!(($unsigned($unsigned(wire226)) < ($unsigned((8'had)) + ((8'hb3) ?
                      wire242 : reg251))) ?
                  $unsigned($unsigned(wire238[(1'h1):(1'h0)])) : $signed((8'haf))));
            end
          else
            begin
              reg245 <= (!$unsigned(wire226[(1'h1):(1'h1)]));
              reg246 <= {wire237[(1'h1):(1'h0)]};
              reg247 <= $signed((reg244 >= $unsigned(((wire227 ?
                      reg250 : wire236) ?
                  wire235[(1'h0):(1'h0)] : reg252[(4'he):(2'h3)]))));
              reg248 <= wire235;
            end
          reg250 <= reg246;
          reg251 <= $unsigned(wire236[(1'h1):(1'h1)]);
        end
      reg253 <= ($unsigned($unsigned(((wire229 | wire234) <= {wire235,
              reg249}))) ?
          {reg252[(3'h7):(2'h3)]} : wire227);
      if ((reg248[(3'h6):(1'h0)] > $unsigned(($signed((reg230 ?
          wire226 : reg240)) >>> $signed((wire231 ? reg251 : reg244))))))
        begin
          reg254 <= ((reg249[(3'h7):(3'h7)] ?
                  ((~|reg239[(2'h2):(2'h2)]) ?
                      {wire238,
                          $unsigned(wire241)} : $unsigned($signed(reg230))) : (|$unsigned($signed(reg249)))) ?
              $unsigned(reg244) : $signed($unsigned($unsigned($unsigned((8'hb8))))));
          reg255 <= reg247;
          reg256 <= $signed($unsigned(wire228));
          reg257 <= (((~|$unsigned((~&reg244))) ?
              (&reg254) : (reg239[(1'h0):(1'h0)] < (8'hac))) != reg247);
        end
      else
        begin
          reg254 <= (|((reg255[(3'h7):(2'h2)] ?
                  ((wire225 ? reg240 : wire225) ?
                      ((8'ha5) && reg255) : (~&reg230)) : (reg256 ?
                      $unsigned(reg243) : reg248[(3'h6):(1'h0)])) ?
              $unsigned($unsigned({reg247})) : $unsigned((~|{(8'had)}))));
          if ((wire241[(4'he):(2'h2)] ?
              wire227[(4'hd):(4'hb)] : ((!$unsigned((reg248 >> reg251))) <<< {($signed(reg255) <= $unsigned((8'hb1))),
                  {wire229}})))
            begin
              reg255 <= reg244;
              reg256 <= wire237[(4'h9):(3'h7)];
              reg257 <= reg230;
              reg258 <= wire235;
            end
          else
            begin
              reg255 <= ((wire233[(4'hb):(1'h1)] ?
                  ($signed((^~wire233)) ?
                      reg253[(4'h8):(4'h8)] : $signed($signed(wire236))) : (reg253 && (-(wire226 && reg253)))) >> $signed((~^(wire238[(4'he):(4'hd)] ?
                  $unsigned(wire237) : {wire242, reg256}))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg259 <= {{$signed(wire225[(4'he):(3'h7)]),
              $unsigned({(wire236 | wire232)})}};
    end
  assign wire260 = $unsigned((8'ha6));
  assign wire261 = (^~$unsigned((wire260 ?
                       $unsigned((reg239 - wire232)) : reg245[(4'h8):(1'h0)])));
  assign wire262 = wire234[(4'h9):(1'h0)];
  assign wire263 = wire233[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg264 <= (((reg243 >= ((wire231 ? reg245 : wire225) ?
              $signed(reg243) : $unsigned((8'hbf)))) >> reg256[(4'h9):(3'h5)]) ?
          ($signed($signed($unsigned(reg251))) || (((reg243 ?
              reg239 : reg243) << wire231) > $signed((reg245 ~^ wire225)))) : (($unsigned(wire242[(2'h2):(1'h0)]) >= wire235[(3'h5):(2'h3)]) <<< wire242));
      reg265 <= (8'h9c);
      reg266 <= (({{(reg265 && (8'hae))}, wire225[(2'h3):(2'h2)]} < (8'haf)) ?
          $signed($signed(reg259)) : wire237[(2'h3):(2'h3)]);
      reg267 <= ($signed($unsigned(((wire225 >> reg245) && {reg248, reg240}))) ?
          $unsigned(reg259[(1'h0):(1'h0)]) : (($unsigned($unsigned(wire238)) ?
                  $unsigned(reg265) : ($unsigned(wire232) && $unsigned((8'hb5)))) ?
              $unsigned($unsigned({(8'ha9),
                  reg247})) : $unsigned(wire229[(3'h5):(1'h0)])));
      reg268 <= (~&reg251);
    end
endmodule

module module190  (y, clk, wire195, wire194, wire193, wire192, wire191);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire195;
  input wire signed [(4'ha):(1'h0)] wire194;
  input wire signed [(3'h5):(1'h0)] wire193;
  input wire signed [(4'hd):(1'h0)] wire192;
  input wire signed [(4'he):(1'h0)] wire191;
  wire signed [(3'h4):(1'h0)] wire214;
  wire [(4'ha):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire203;
  wire signed [(4'hc):(1'h0)] wire202;
  wire signed [(3'h5):(1'h0)] wire201;
  wire [(3'h7):(1'h0)] wire200;
  wire signed [(4'hd):(1'h0)] wire199;
  wire signed [(4'hb):(1'h0)] wire198;
  wire signed [(2'h3):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire196;
  reg [(4'h8):(1'h0)] reg219 = (1'h0);
  reg [(4'hf):(1'h0)] reg218 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg215 = (1'h0);
  reg [(5'h12):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(5'h10):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(5'h14):(1'h0)] reg208 = (1'h0);
  reg [(5'h12):(1'h0)] reg207 = (1'h0);
  reg [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(3'h7):(1'h0)] reg205 = (1'h0);
  assign y = {wire214,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 (1'h0)};
  assign wire196 = (&$unsigned({((wire193 ? wire192 : wire194) ?
                           wire193 : $unsigned(wire195))}));
  assign wire197 = wire196[(2'h2):(2'h2)];
  assign wire198 = ((wire196[(2'h3):(1'h0)] ?
                       (~wire194) : $signed(($unsigned(wire196) ?
                           $unsigned(wire193) : wire197[(2'h3):(1'h1)]))) >= (^(|wire191[(4'h8):(3'h6)])));
  assign wire199 = ((~{(8'hb5), $signed((&wire193))}) != (wire196 ?
                       ($signed(((8'hba) == wire197)) ?
                           $unsigned((wire197 ? wire197 : wire192)) : ({wire195,
                                   wire198} ?
                               $signed(wire192) : (wire192 ?
                                   wire196 : (8'hb6)))) : wire197));
  assign wire200 = (~^$unsigned($unsigned(({wire198,
                       wire198} > $unsigned(wire191)))));
  assign wire201 = ($unsigned(((~$unsigned(wire198)) ?
                       (&{wire192, wire197}) : wire193)) & wire200);
  assign wire202 = (!($unsigned(wire200[(2'h2):(1'h1)]) ^~ wire198));
  assign wire203 = (+($signed($unsigned((wire192 < wire202))) ?
                       wire196 : {$unsigned((wire193 * wire199))}));
  assign wire204 = $signed($signed($signed(wire199[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      reg205 <= $signed($signed(((8'hb3) ? (8'ha8) : wire192)));
      reg206 <= (wire194 < $signed(((&wire194) ?
          (wire193 ? $signed(wire199) : wire201) : (~wire194))));
      reg207 <= wire196;
      reg208 <= ((((~|$unsigned(wire194)) ?
              (wire191[(4'hb):(4'ha)] - wire203[(3'h5):(1'h1)]) : ($unsigned(reg206) ?
                  $unsigned(wire200) : {wire195,
                      wire198})) - $signed(({wire197} >> (wire193 ~^ wire197)))) ?
          wire198 : ($signed($unsigned((^wire193))) >= wire199[(4'hd):(3'h5)]));
      if (wire191)
        begin
          reg209 <= (&$signed({reg206}));
          reg210 <= (~|(wire198 ? wire191 : wire202));
          reg211 <= (^$unsigned((((~|wire195) ?
              wire203[(1'h0):(1'h0)] : $unsigned(reg205)) + ((reg206 > wire191) ?
              (reg205 < reg210) : wire198[(2'h2):(1'h1)]))));
          reg212 <= wire195;
        end
      else
        begin
          reg209 <= ((-$signed($unsigned((~&(8'ha6))))) >>> wire195);
          reg210 <= (-(^~$signed({$unsigned((8'haf)), $unsigned(reg208)})));
          reg211 <= ($unsigned(wire192) ?
              $unsigned(wire204[(4'ha):(3'h7)]) : ({({reg206} ?
                          $unsigned(reg209) : reg208[(2'h2):(1'h0)]),
                      (reg210 ? (reg212 >= (8'h9e)) : (wire201 + reg210))} ?
                  $signed((~|(~&reg205))) : $unsigned($signed({(8'had)}))));
          reg212 <= $signed($signed($unsigned(wire203[(1'h0):(1'h0)])));
          reg213 <= (reg209 ?
              (($unsigned((wire199 ?
                  wire195 : wire201)) <<< $unsigned(wire196)) << (^$signed((&wire193)))) : ((-$signed((~wire194))) == (7'h42)));
        end
    end
  assign wire214 = $unsigned((wire197[(1'h1):(1'h0)] ?
                       (($signed(reg212) <<< reg206) ?
                           wire198[(4'ha):(3'h5)] : $unsigned(reg207[(4'h8):(2'h3)])) : ($unsigned(reg208[(5'h13):(2'h2)]) ?
                           (wire196[(5'h13):(5'h11)] ?
                               wire200[(3'h6):(1'h1)] : (^wire200)) : (^(8'hbe)))));
  always
    @(posedge clk) begin
      reg215 <= $signed(wire202);
      reg216 <= {(^$signed({wire199}))};
      reg217 <= $signed(($unsigned(reg215) * wire191));
      reg218 <= (reg206 ? reg212 : reg217);
      reg219 <= (~^($signed((~^(reg211 ?
          wire202 : reg210))) * ((wire214[(2'h2):(1'h0)] ?
          (~reg207) : (~(8'hb1))) ~^ ($unsigned(reg205) ?
          (reg208 ? (8'hbb) : reg211) : wire195[(2'h3):(2'h2)]))));
    end
endmodule

module module149
#(parameter param178 = (-(~|((&(&(8'hac))) | {((8'ha7) ? (8'hb5) : (7'h40))}))))
(y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire153;
  input wire signed [(3'h6):(1'h0)] wire152;
  input wire signed [(5'h11):(1'h0)] wire151;
  input wire [(5'h10):(1'h0)] wire150;
  wire signed [(5'h12):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire signed [(3'h6):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  wire signed [(5'h15):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire154;
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(3'h7):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire162,
                 wire161,
                 wire155,
                 wire154,
                 reg177,
                 reg176,
                 reg175,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  assign wire154 = ((+$signed(((wire151 ? (8'hb5) : (8'ha6)) ?
                       $unsigned(wire151) : (8'hae)))) >> ((!$signed($signed(wire150))) != (^wire152[(3'h5):(1'h1)])));
  assign wire155 = {(&(!wire154[(3'h6):(3'h5)])),
                       $signed((-$signed(wire152[(2'h3):(2'h3)])))};
  always
    @(posedge clk) begin
      reg156 <= $signed($unsigned($signed(($unsigned(wire155) ?
          ((8'hae) && (8'ha6)) : (wire153 < wire154)))));
      reg157 <= (~|wire151);
      reg158 <= ({(reg156 ? wire154 : wire151)} ? wire155 : (8'hb8));
      reg159 <= $signed(((+({reg156, (7'h44)} << $signed(reg157))) ?
          (($unsigned(wire151) ?
              wire154 : wire154[(5'h13):(3'h4)]) + $unsigned((wire150 ~^ wire150))) : (reg158 ?
              reg156 : $unsigned($signed(wire150)))));
      reg160 <= $unsigned(wire151[(3'h4):(1'h1)]);
    end
  assign wire161 = {reg157,
                       {$signed(reg157[(2'h3):(1'h1)]),
                           (^((~|wire151) ? (~reg158) : $signed((8'ha6))))}};
  assign wire162 = (^(!wire155));
  always
    @(posedge clk) begin
      if ({reg157[(3'h6):(3'h6)]})
        begin
          if ({$unsigned((~(~&wire161[(3'h6):(2'h3)]))), reg160})
            begin
              reg163 <= $unsigned(($signed({wire154}) > $unsigned(reg156[(4'he):(3'h5)])));
            end
          else
            begin
              reg163 <= (|reg159);
              reg164 <= wire162;
            end
        end
      else
        begin
          if (reg156[(3'h6):(1'h1)])
            begin
              reg163 <= (reg156 || (((reg164 != (wire154 & wire150)) == ((^wire162) ?
                      (wire153 ? reg156 : wire155) : (reg158 ?
                          reg164 : reg163))) ?
                  $unsigned($signed($unsigned(wire151))) : {wire152[(3'h4):(2'h3)],
                      ((wire152 ? wire161 : (7'h44)) != (-(8'hb6)))}));
              reg164 <= (-$unsigned($unsigned($unsigned($signed(reg158)))));
            end
          else
            begin
              reg163 <= $signed($signed(wire161));
              reg164 <= $signed((^(reg158[(3'h6):(2'h2)] ^~ reg164[(3'h5):(1'h1)])));
              reg165 <= (~wire150[(5'h10):(4'hd)]);
            end
          reg166 <= (8'hb5);
          reg167 <= ($unsigned($unsigned(wire162[(2'h2):(2'h2)])) ?
              (-{reg165}) : {reg166[(2'h2):(1'h1)],
                  (reg157[(3'h7):(3'h7)] ? $signed((&reg156)) : (^(!reg163)))});
          reg168 <= $unsigned((((~^$unsigned(reg164)) ?
              {wire154[(1'h1):(1'h0)]} : $unsigned($unsigned(wire151))) <<< $signed({(reg159 ?
                  wire153 : wire151)})));
        end
    end
  assign wire169 = (+(($unsigned((~reg166)) && ((wire152 && reg167) ?
                           (~&wire151) : {reg158, reg160})) ?
                       $unsigned((^~$signed(reg158))) : (8'ha4)));
  assign wire170 = wire155[(1'h1):(1'h1)];
  assign wire171 = reg160;
  assign wire172 = wire155[(4'hc):(4'ha)];
  assign wire173 = wire170[(4'ha):(2'h3)];
  assign wire174 = ($unsigned(($signed($unsigned(wire155)) ?
                           ((reg167 ? reg157 : wire173) ?
                               (~^reg159) : ((7'h40) ~^ wire152)) : (reg158 ^ ((7'h41) ^ (8'hb3))))) ?
                       (&$unsigned(wire151[(1'h1):(1'h0)])) : {(~^(wire150[(3'h4):(1'h1)] ?
                               reg164[(1'h1):(1'h1)] : (reg157 + reg160))),
                           (8'ha7)});
  always
    @(posedge clk) begin
      reg175 <= wire161;
      reg176 <= {wire174[(3'h7):(3'h6)]};
      reg177 <= wire153;
    end
endmodule
