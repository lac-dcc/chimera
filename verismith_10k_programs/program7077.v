module top
#(parameter param107 = {(+(~|(((8'hb7) ? (8'hb0) : (8'ha1)) ? ((8'ha6) != (8'ha3)) : (~&(8'hbf)))))}, 
parameter param108 = (param107 | (-param107)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire95;
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire16,
                 wire17,
                 wire95,
                 reg5,
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
  always
    @(posedge clk) begin
      reg5 <= (-$unsigned(wire2[(3'h7):(3'h7)]));
      if ({((~(8'hba)) ?
              (!$signed((~|(8'h9c)))) : {(wire1[(4'h8):(2'h2)] >> ((8'hbe) == (8'ha4)))})})
        begin
          reg6 <= $signed(((~&$signed($unsigned((7'h44)))) == (((wire4 ~^ wire1) ~^ wire3[(3'h6):(3'h4)]) * $signed($signed(wire1)))));
          reg7 <= reg6;
          reg8 <= wire3[(2'h3):(1'h1)];
          if (reg5[(4'h8):(3'h5)])
            begin
              reg9 <= {$unsigned(reg7)};
              reg10 <= wire4[(2'h3):(2'h3)];
              reg11 <= ($unsigned({{(^(8'ha0)), {(8'hab), wire0}},
                  ((~^reg6) > reg5[(5'h10):(4'hc)])}) <= $unsigned(reg7[(1'h1):(1'h1)]));
              reg12 <= {reg5[(3'h5):(3'h4)]};
              reg13 <= (-((~({(8'had), wire2} ?
                      (wire1 & reg7) : $signed(wire3))) ?
                  reg11[(3'h7):(2'h2)] : ($signed(wire3[(2'h2):(1'h0)]) ?
                      ((-wire4) >= (+wire1)) : (~|{(8'hbb)}))));
            end
          else
            begin
              reg9 <= ((($unsigned({wire3, wire2}) ?
                  reg11 : {(reg5 & reg5),
                      $unsigned(reg7)}) || {(~&$signed(reg10)),
                  reg9[(1'h1):(1'h1)]}) >>> (reg6 & (~(8'ha2))));
              reg10 <= {$signed($signed((wire2 * (reg11 >>> wire2))))};
              reg11 <= $unsigned(($signed(((8'ha6) >= wire0)) ?
                  wire4[(1'h0):(1'h0)] : (wire2 ?
                      wire4[(1'h1):(1'h0)] : ((reg5 ? wire1 : wire3) ?
                          (!reg13) : reg13))));
              reg12 <= {(~^wire2[(3'h6):(1'h1)]),
                  ((8'hb8) ^ wire2[(4'hd):(2'h2)])};
            end
        end
      else
        begin
          reg6 <= reg12[(2'h2):(1'h0)];
          reg7 <= {$unsigned(reg9), reg13[(4'ha):(2'h3)]};
          reg8 <= ({($unsigned((reg10 << reg7)) ?
                      wire2[(4'ha):(4'h9)] : ($signed(reg13) ?
                          (8'ha6) : (&wire0)))} ?
              reg11[(5'h10):(4'h8)] : reg11[(4'hc):(4'h9)]);
          reg9 <= (wire3[(2'h2):(1'h0)] ^~ reg13[(4'ha):(3'h7)]);
        end
      reg14 <= wire4;
      reg15 <= $unsigned($signed(wire3));
    end
  assign wire16 = wire1;
  assign wire17 = ((&{reg13,
                      $unsigned(reg12)}) ^~ $signed(((reg15[(1'h0):(1'h0)] || wire16[(2'h3):(1'h1)]) ?
                      {reg8[(2'h3):(1'h1)]} : (wire4[(1'h0):(1'h0)] >> $unsigned(reg6)))));
  module18 #() modinst96 (wire95, clk, reg13, reg14, reg9, wire1);
  assign wire97 = (($signed((~^wire1)) ?
                      (8'ha1) : reg15) & $signed({reg10[(2'h3):(1'h1)],
                      ($signed(reg6) ? $unsigned(reg13) : (&wire4))}));
  assign wire98 = wire1;
  assign wire99 = reg7[(3'h7):(1'h0)];
  assign wire100 = {$unsigned($unsigned((8'hb6)))};
  assign wire101 = (!($signed(wire98[(5'h10):(4'h9)]) ?
                       (reg7[(2'h2):(1'h0)] ?
                           ((+reg8) ?
                               $unsigned(wire0) : wire16[(3'h7):(3'h5)]) : (8'hb0)) : (|(~|wire100[(5'h10):(3'h7)]))));
  assign wire102 = $unsigned((wire98 == (^~(!wire3))));
  assign wire103 = ($signed(wire98[(4'hc):(1'h1)]) - wire99);
  assign wire104 = (7'h41);
  assign wire105 = ((({wire104, (wire98 ? wire16 : reg9)} ?
                       (|$unsigned((8'haf))) : ({wire97} >> $unsigned(wire16))) ^ reg7) | wire103[(4'hb):(3'h4)]);
  assign wire106 = (~$unsigned($signed(wire98[(1'h1):(1'h0)])));
endmodule

module module18
#(parameter param93 = ((((+{(8'hb4), (8'hb3)}) ? (((8'haa) ? (8'ha3) : (8'hb8)) ? (8'hbd) : (8'ha2)) : (((8'ha8) ? (7'h43) : (8'hb5)) && ((8'ha3) <<< (8'hbd)))) <<< ((-((8'hb3) >> (8'hbc))) - (~&((8'hb0) ? (8'hba) : (8'haf))))) < (((((8'haa) ? (8'h9c) : (8'ha8)) << ((8'hb1) < (7'h41))) ? (^~((8'ha7) ~^ (7'h42))) : ((|(8'ha9)) ? (~&(8'hbc)) : ((8'h9d) ~^ (8'ha7)))) ? (((8'hb1) ? ((7'h43) < (8'hbc)) : (^~(8'haa))) <<< (~{(8'hb7), (7'h44)})) : ({(8'haa)} ? (8'ha7) : ({(8'ha9), (8'ha9)} ? (~&(8'hb9)) : {(7'h44), (8'ha7)})))), 
parameter param94 = ((((((7'h44) ? param93 : param93) ? (~param93) : param93) ? ((8'hbf) > param93) : (^~param93)) + {((param93 ? param93 : param93) && param93), (~^(!param93))}) ^~ {{{{param93}, (param93 ? (8'h9c) : param93)}, {(-param93), (param93 * param93)}}, (((param93 ? param93 : param93) ^ (~|param93)) * (param93 ? ((8'ha8) >= (7'h44)) : (param93 ? param93 : param93)))}))
(y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire87;
  assign y = {wire92, wire91, wire90, wire89, wire23, wire24, wire87, (1'h0)};
  assign wire23 = wire22;
  assign wire24 = {(wire22 > $signed($signed($unsigned(wire20))))};
  module25 #() modinst88 (.wire28(wire23), .clk(clk), .wire26(wire22), .y(wire87), .wire29(wire24), .wire27(wire19), .wire30(wire21));
  assign wire89 = wire21[(3'h7):(3'h7)];
  assign wire90 = (~(8'h9d));
  assign wire91 = (wire19[(1'h0):(1'h0)] ^ $unsigned(wire89[(3'h4):(1'h1)]));
  assign wire92 = (7'h41);
endmodule

module module25
#(parameter param85 = (|(+((!((8'h9d) >= (8'hb3))) ? (((8'hb3) ? (8'h9d) : (8'hab)) ? {(8'hbb), (8'ha8)} : {(8'hb1), (8'hb2)}) : (&{(7'h43), (8'h9c)})))), 
parameter param86 = (&param85))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire68,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire43,
                 wire39,
                 wire32,
                 wire31,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = wire27[(4'hd):(4'h8)];
  assign wire32 = ((($signed((8'hae)) ?
                          (((8'ha5) ? wire29 : wire31) ?
                              (~|wire29) : {wire26,
                                  (8'hb9)}) : {$unsigned(wire30)}) - wire30[(4'h8):(2'h2)]) ?
                      (-$unsigned({(|wire29)})) : {(~^wire31)});
  always
    @(posedge clk) begin
      reg33 <= $signed((^~((~^{wire27, wire28}) || $unsigned((wire31 ?
          (8'h9f) : wire30)))));
      if (((^~(~&{((8'hb2) ? wire28 : wire28),
          (8'hb3)})) == (wire31[(1'h1):(1'h0)] ?
          (wire30 >> $signed({wire31, wire28})) : $unsigned((((8'ha8) ?
                  wire28 : (8'h9e)) ?
              $unsigned(wire30) : (wire30 ? (7'h43) : wire31))))))
        begin
          reg34 <= (&$unsigned(wire29));
        end
      else
        begin
          reg34 <= $signed($signed($unsigned(wire26)));
          reg35 <= (($unsigned(wire32[(2'h3):(2'h3)]) ^~ wire32) ?
              (+$unsigned($unsigned((wire28 ?
                  wire26 : wire31)))) : ((($signed(wire32) ?
                          reg34[(1'h0):(1'h0)] : (8'hab)) ?
                      (reg34 || $unsigned((8'hb5))) : (8'hae)) ?
                  reg33 : (~|((&wire28) ?
                      (wire27 ? wire30 : (8'haa)) : $signed((8'hbf))))));
          reg36 <= ($signed((!(+$unsigned((7'h41))))) ?
              ($signed((!$unsigned((8'haa)))) ?
                  wire28[(4'hc):(2'h2)] : ($signed($signed((8'had))) ?
                      $signed($signed(wire31)) : ((wire26 ?
                          wire26 : wire27) < wire27))) : (&wire27[(1'h0):(1'h0)]));
          reg37 <= $signed(((wire28 > wire32) ?
              wire31 : $signed((!(&wire27)))));
        end
      reg38 <= (((|(reg33 << $unsigned(wire32))) ?
              $signed($unsigned((~&(8'h9c)))) : (-{$unsigned(wire26),
                  (|wire28)})) ?
          (((~reg36) ?
                  $unsigned({reg36}) : {$unsigned(reg35),
                      (reg35 ? wire29 : (8'hbd))}) ?
              wire31 : (((+wire30) >> $signed(wire30)) ?
                  (~|wire27) : reg34[(2'h2):(1'h1)])) : reg33);
    end
  assign wire39 = (~^wire28);
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg40 <= (~|{reg38, (&(~wire26))});
          reg41 <= (~wire32[(5'h10):(4'ha)]);
        end
      else
        begin
          reg40 <= (&wire29[(4'ha):(1'h0)]);
        end
      reg42 <= (wire32 ^ (($signed((8'h9d)) ^ (wire27 ?
              $unsigned(reg34) : (~^reg35))) ?
          $unsigned((8'hb0)) : ((8'ha2) ?
              $unsigned(((8'hae) ? wire26 : (8'ha3))) : (!$signed((8'hab))))));
    end
  assign wire43 = ((~$unsigned((~&$signed(reg41)))) ?
                      wire39[(4'hc):(4'ha)] : ($signed((((8'hb9) << wire28) * (wire31 ?
                          reg38 : wire26))) <= $unsigned(({wire26, wire29} ?
                          (reg37 != wire26) : wire39[(3'h4):(1'h1)]))));
  always
    @(posedge clk) begin
      if ($unsigned((~(7'h42))))
        begin
          reg44 <= {$signed($signed(($unsigned(reg37) ?
                  $signed(reg36) : (7'h44))))};
          reg45 <= ($unsigned($unsigned((~&(8'h9c)))) ?
              reg33 : ((reg38 <<< ($signed(reg42) >= (wire27 ?
                      reg42 : wire43))) ?
                  (&((wire26 + wire26) ?
                      $unsigned(reg40) : reg37[(3'h4):(2'h3)])) : $signed($signed(reg41[(4'hb):(2'h2)]))));
          if ($signed(((reg42 < ((8'hbe) || {(8'hb5)})) ?
              $signed(((reg33 * reg33) ?
                  (^reg34) : (reg37 && (8'ha2)))) : (&(wire27 >= (reg44 ?
                  wire30 : reg40))))))
            begin
              reg46 <= ($signed(($unsigned((~^reg41)) ?
                      reg42[(1'h1):(1'h0)] : $unsigned({reg33, reg37}))) ?
                  wire27[(4'h8):(3'h6)] : wire27);
              reg47 <= ({(reg38[(4'h9):(3'h5)] < {$unsigned(reg46)}), reg44} ?
                  ((+{(8'hbc)}) ?
                      wire31[(2'h2):(1'h0)] : {{(-(8'hb4)), (-reg42)},
                          ({wire43,
                              wire28} <<< ((8'hbf) > reg37))}) : $signed(wire29));
              reg48 <= wire29[(2'h3):(1'h0)];
              reg49 <= {{(((reg40 ?
                          reg44 : wire28) >> (~reg40)) - ($signed(reg41) << (reg45 ?
                          reg37 : (8'ha0)))),
                      (+$signed((wire31 == reg44)))}};
            end
          else
            begin
              reg46 <= $unsigned($unsigned(reg42));
              reg47 <= reg49[(3'h7):(3'h4)];
              reg48 <= (~|(wire29[(3'h7):(3'h6)] ?
                  $signed($unsigned((reg46 ? reg34 : (8'hba)))) : (-((reg36 ?
                          reg49 : wire29) ?
                      (wire29 ? reg36 : wire31) : (reg49 ? wire43 : reg45)))));
              reg49 <= ((reg48[(4'h9):(3'h6)] ?
                  (wire43[(4'he):(1'h0)] <= $unsigned((&reg42))) : $signed($unsigned((reg36 ?
                      reg35 : reg33)))) >>> ((wire26[(1'h0):(1'h0)] ?
                  $unsigned((wire32 ? reg46 : reg38)) : ($unsigned(reg46) ?
                      $signed(reg48) : $unsigned(reg49))) > (~{reg49,
                  (wire27 ? wire26 : wire32)})));
            end
          reg50 <= $signed(wire30);
          reg51 <= $unsigned((~^reg37));
        end
      else
        begin
          reg44 <= reg41;
          reg45 <= $signed((($signed((reg51 ? reg44 : reg48)) ?
              $signed((-reg41)) : $signed($unsigned(wire32))) == (reg38[(3'h4):(2'h2)] + $signed((8'haa)))));
          reg46 <= $unsigned($signed(({{reg35}, $signed(wire31)} ?
              ((!reg33) | (~|wire31)) : $signed($unsigned(wire31)))));
        end
    end
  assign wire52 = wire31[(2'h2):(2'h2)];
  assign wire53 = (8'ha6);
  assign wire54 = reg51;
  assign wire55 = $signed($signed((reg44 - $unsigned((reg41 ?
                      reg41 : wire26)))));
  assign wire56 = wire30;
  always
    @(posedge clk) begin
      reg57 <= ($signed($signed(wire56[(4'h8):(1'h1)])) ?
          reg50[(1'h0):(1'h0)] : wire29[(1'h0):(1'h0)]);
      if ($unsigned((-($signed($unsigned(wire52)) ~^ wire26[(2'h3):(1'h0)]))))
        begin
          reg58 <= reg37;
        end
      else
        begin
          reg58 <= reg37[(4'he):(4'h9)];
        end
      if (reg35)
        begin
          reg59 <= $unsigned(($signed(reg41) ?
              wire39[(3'h5):(3'h4)] : (reg37[(3'h6):(2'h2)] ?
                  wire55 : $unsigned(((7'h44) ^ reg46)))));
          reg60 <= ($signed(($signed((|wire56)) ?
              reg42[(3'h4):(3'h4)] : ($unsigned((8'haa)) || $signed(wire28)))) << {$signed(wire52),
              (8'ha2)});
          if ((reg59[(3'h5):(1'h0)] ?
              {{$signed($signed(wire55)),
                      (|(reg51 ? reg48 : reg46))}} : (wire53 ?
                  ($signed({(8'hb9)}) ?
                      (|reg45[(4'hb):(3'h4)]) : $signed($unsigned(reg33))) : $signed((~$signed(wire28))))))
            begin
              reg61 <= reg36;
            end
          else
            begin
              reg61 <= $signed($unsigned((^($signed(wire28) < (-(8'h9c))))));
              reg62 <= (^~((^~({reg47} <<< $unsigned((8'hbe)))) <<< (!$unsigned((reg57 ?
                  reg37 : wire56)))));
              reg63 <= $signed(((-$signed({wire56})) ^~ $unsigned({$unsigned(reg42),
                  reg62[(4'hd):(1'h1)]})));
              reg64 <= ({reg48} ?
                  $signed($signed($unsigned($signed(wire54)))) : $unsigned($signed(((reg44 >> (8'ha0)) ?
                      {(8'hb8), reg33} : $signed((8'hbd))))));
              reg65 <= reg62[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg59 <= wire28;
          reg60 <= reg44[(5'h10):(3'h7)];
          if ((~^((((8'hb1) >= (reg42 - reg60)) == (8'hb5)) - ((^~wire30[(3'h5):(3'h4)]) >= (&wire32[(3'h6):(1'h0)])))))
            begin
              reg61 <= $unsigned($signed($unsigned(reg63[(4'he):(3'h4)])));
              reg62 <= (reg62[(4'hc):(1'h0)] ?
                  wire27[(3'h6):(3'h4)] : wire53[(1'h1):(1'h1)]);
              reg63 <= reg50;
            end
          else
            begin
              reg61 <= reg51[(4'he):(2'h3)];
              reg62 <= ($unsigned({({(8'ha9), wire26} ?
                      (reg36 >> reg40) : (wire30 * wire27))}) >> $unsigned((-$unsigned((reg44 ?
                  reg38 : reg42)))));
            end
          reg64 <= (8'ha4);
        end
      reg66 <= (!((7'h44) ?
          wire55[(1'h0):(1'h0)] : {(~wire29[(5'h11):(3'h6)]),
              {$unsigned((8'h9e)), (~reg44)}}));
      reg67 <= $signed($signed((reg59 >> ((reg34 < wire52) ?
          $signed(reg50) : $signed(reg41)))));
    end
  assign wire68 = (8'hbe);
  always
    @(posedge clk) begin
      if ({wire32[(5'h10):(4'hc)],
          $unsigned({(-(wire53 && (8'ha5))),
              (reg41[(4'h9):(1'h1)] ~^ ((7'h40) ? (8'hac) : reg63))})})
        begin
          reg69 <= $unsigned((!$unsigned(reg40[(2'h2):(1'h1)])));
          reg70 <= ($signed({(~&(+wire30))}) ?
              (+(^~((reg67 ?
                  reg50 : wire29) ^ {wire68}))) : (-$unsigned($signed(reg36[(4'hb):(1'h0)]))));
          if ({((($unsigned(reg60) ? (wire54 - wire55) : {wire55}) ?
                  ({wire53,
                      reg40} < (~|(8'hb6))) : (~$unsigned(reg66))) ^ reg65)})
            begin
              reg71 <= reg57;
            end
          else
            begin
              reg71 <= $signed(((|reg64[(3'h4):(2'h2)]) ?
                  (+$signed((8'hb9))) : $signed(reg60)));
            end
          reg72 <= reg50;
        end
      else
        begin
          reg69 <= (~^(8'hb2));
          reg70 <= reg45[(2'h2):(1'h0)];
          reg71 <= reg64;
        end
      reg73 <= reg70[(2'h3):(1'h1)];
    end
  assign wire74 = wire55;
  assign wire75 = {reg38[(5'h11):(4'hb)], reg37};
  assign wire76 = $unsigned(((^($unsigned(reg51) ?
                      {(8'ha7), reg46} : reg47[(4'ha):(4'h9)])) >>> (^(+(reg49 ?
                      reg60 : reg36)))));
  assign wire77 = ({reg42[(3'h4):(2'h3)]} <<< $signed((wire31[(2'h2):(2'h2)] ?
                      {reg61[(4'h9):(3'h7)]} : $signed((^~wire55)))));
  assign wire78 = wire27;
  always
    @(posedge clk) begin
      reg79 <= (+(~($signed((wire39 ^~ wire39)) ?
          reg37[(4'h8):(1'h0)] : (8'hb3))));
      reg80 <= (-wire74[(2'h2):(2'h2)]);
      reg81 <= {reg67[(3'h4):(3'h4)], ($unsigned(reg50) >= wire75)};
      reg82 <= $signed((^~(|($signed(reg81) ^ $unsigned(wire68)))));
    end
  assign wire83 = (reg44[(3'h7):(3'h5)] ?
                      $signed((~&wire78)) : reg81[(1'h0):(1'h0)]);
  assign wire84 = wire30;
endmodule
