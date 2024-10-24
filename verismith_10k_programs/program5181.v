module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire127;
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire127,
                 reg36,
                 reg35,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed(wire2[(3'h4):(2'h2)]);
  assign wire6 = (($signed({(wire5 ? wire2 : wire0),
                     {wire3, (8'hb3)}}) != (wire0 ?
                     $signed((wire2 == wire3)) : $signed({wire0}))) + ((+$unsigned((8'h9c))) ?
                     (^~($unsigned(wire0) >= (wire2 == wire1))) : {wire4[(1'h1):(1'h1)]}));
  always
    @(posedge clk) begin
      reg7 <= wire2[(4'h8):(1'h0)];
      reg8 <= wire5;
    end
  assign wire9 = (+(~^$signed(wire6)));
  assign wire10 = {$unsigned(reg8[(4'he):(3'h5)]),
                      (wire0 ?
                          (wire2[(1'h1):(1'h1)] ?
                              (&$signed(reg8)) : reg8[(1'h0):(1'h0)]) : (($unsigned(wire1) ~^ (wire0 ?
                              reg7 : reg8)) << ((~^wire5) ?
                              reg8 : (reg7 ? wire0 : wire9))))};
  assign wire11 = ($unsigned((8'had)) ?
                      ((~|$signed(wire10)) ?
                          wire3[(4'hf):(3'h6)] : (+$signed(((8'hb4) << wire6)))) : wire4);
  assign wire12 = $signed(wire4);
  always
    @(posedge clk) begin
      reg13 <= {$unsigned((wire6 ?
              ((7'h43) ? (reg8 ? wire10 : (8'ha6)) : (~wire6)) : reg7)),
          (+wire10[(3'h5):(3'h5)])};
      if (($unsigned(wire3[(2'h3):(2'h3)]) == wire4))
        begin
          reg14 <= (~^{($signed(wire2[(4'hc):(3'h7)]) ?
                  wire9 : $signed((wire4 ? wire10 : wire4)))});
          reg15 <= ((-(reg13 ~^ {(wire11 > reg8),
              (wire0 && wire12)})) < (-(wire1 ?
              ({reg8, (8'h9d)} - $signed(wire4)) : $signed((^reg7)))));
          reg16 <= $signed(wire1[(3'h5):(3'h5)]);
          if ($signed($unsigned($signed(reg13[(1'h0):(1'h0)]))))
            begin
              reg17 <= $unsigned(reg8);
              reg18 <= (($unsigned({wire11[(3'h4):(1'h0)]}) < wire4[(4'ha):(4'h8)]) ?
                  (8'haf) : (reg7[(2'h2):(1'h1)] ?
                      ($unsigned(wire0) || ((wire3 >> (8'hb0)) || (^wire12))) : wire10));
            end
          else
            begin
              reg17 <= (&{(+($signed(wire5) >>> $signed(wire3))), reg13});
              reg18 <= $unsigned(($unsigned(reg7) || {($unsigned((8'hab)) ?
                      (wire11 ? (8'haa) : reg14) : $unsigned(wire10))}));
            end
        end
      else
        begin
          reg14 <= (7'h43);
        end
      if ($signed(wire3))
        begin
          if ((wire9 << reg17[(4'h8):(4'h8)]))
            begin
              reg19 <= wire3[(1'h0):(1'h0)];
              reg20 <= ($unsigned({$signed({reg7, (8'ha9)}),
                  (~|(+reg7))}) <<< (8'hb3));
              reg21 <= reg20[(2'h3):(2'h2)];
              reg22 <= wire2;
              reg23 <= $unsigned($signed({wire4}));
            end
          else
            begin
              reg19 <= $unsigned((!($signed(((8'haf) ? (8'ha7) : (8'h9e))) ?
                  wire3[(4'hd):(4'h8)] : (|((8'hb5) ? reg22 : wire4)))));
              reg20 <= $signed($unsigned(reg8[(4'hc):(3'h7)]));
              reg21 <= (wire12[(1'h0):(1'h0)] ?
                  ((~&(((8'h9e) ?
                      reg13 : reg22) * $unsigned((8'hb6)))) ^ $unsigned($signed({wire1,
                      wire6}))) : (-{(^~wire4)}));
            end
          reg24 <= (~|$signed(((((8'h9e) != reg14) ?
              {(8'ha8)} : (8'hb8)) ^ $unsigned({(8'ha3)}))));
          reg25 <= (!$unsigned($signed($signed($signed(reg19)))));
          if (((~^($signed((wire2 ^ (8'hbb))) ^ $unsigned(((8'ha2) ?
              reg19 : reg22)))) > (~^$unsigned(wire12[(3'h4):(2'h3)]))))
            begin
              reg26 <= $unsigned({$signed((!(+reg24)))});
              reg27 <= {reg26[(1'h0):(1'h0)]};
              reg28 <= (^((((wire5 ? reg26 : wire0) ?
                  {wire5, reg20} : (reg22 ?
                      reg24 : reg19)) & ($unsigned(reg26) ?
                  (reg18 ? wire1 : reg13) : reg26)) >> reg25[(4'h8):(4'h8)]));
              reg29 <= {(~&$unsigned(wire2[(5'h10):(2'h3)]))};
              reg30 <= $signed($unsigned($signed(((wire2 >= reg19) ?
                  reg18 : (reg29 - reg7)))));
            end
          else
            begin
              reg26 <= {((8'hb5) ?
                      $signed(wire3[(4'he):(4'hd)]) : {(reg28 + $signed(reg7)),
                          (7'h41)})};
              reg27 <= wire9[(2'h3):(2'h2)];
              reg28 <= $unsigned((((wire6[(3'h5):(2'h3)] ?
                      $unsigned(reg16) : $unsigned((8'h9e))) > reg7) ?
                  $signed(reg22[(3'h4):(1'h0)]) : (~&$unsigned((reg8 ?
                      (8'hab) : reg25)))));
              reg29 <= $signed(($unsigned(reg29[(2'h2):(2'h2)]) ?
                  reg20[(3'h7):(1'h0)] : reg19[(2'h3):(2'h3)]));
              reg30 <= (~reg28[(3'h5):(1'h0)]);
            end
          if (reg28[(3'h7):(2'h3)])
            begin
              reg31 <= $signed((8'hb8));
              reg32 <= ($signed((8'hbe)) ?
                  $unsigned(reg22) : (((^reg19[(2'h2):(1'h0)]) & $unsigned((reg22 <= reg19))) ?
                      $signed((reg13 ?
                          $signed(reg8) : reg27)) : $unsigned($unsigned(((8'hb5) && reg7)))));
              reg33 <= $signed((($signed((wire9 ? (8'hb5) : reg27)) ?
                      (!wire6[(4'h8):(3'h4)]) : ((wire3 | wire3) + $unsigned(reg21))) ?
                  (wire0 ?
                      $signed($signed(wire12)) : reg28) : reg15[(3'h7):(2'h2)]));
              reg34 <= reg25[(1'h0):(1'h0)];
            end
          else
            begin
              reg31 <= $unsigned((reg22 <<< (&reg25[(4'h9):(3'h7)])));
              reg32 <= (($unsigned((!reg8[(4'hb):(2'h2)])) ^~ (!wire10)) ?
                  {wire6,
                      {wire2[(3'h4):(2'h2)],
                          ($unsigned(reg16) ?
                              $signed(wire2) : (wire1 ?
                                  wire11 : reg23))}} : (reg31[(5'h11):(3'h4)] ?
                      reg25[(1'h1):(1'h1)] : {((+reg28) > (reg26 ?
                              reg14 : reg15))}));
              reg33 <= (reg21 << ((reg26[(1'h0):(1'h0)] ?
                      $unsigned((reg31 ~^ reg25)) : $unsigned(reg20[(3'h5):(3'h4)])) ?
                  (!(^~((8'ha9) ? reg14 : reg26))) : (wire4 ?
                      $unsigned({reg26}) : $unsigned(reg25[(3'h7):(2'h2)]))));
              reg34 <= reg22[(5'h11):(3'h6)];
            end
        end
      else
        begin
          reg19 <= (^~$signed((reg21[(1'h0):(1'h0)] ?
              (8'ha8) : (wire0 ? wire2 : (reg21 ? reg18 : reg19)))));
          reg20 <= (reg30[(4'hb):(4'h8)] ^ $signed($signed((8'had))));
          reg21 <= reg21[(2'h3):(2'h2)];
          reg22 <= ($unsigned(($signed(((7'h43) && reg8)) < $unsigned($signed(reg29)))) && reg25);
        end
      reg35 <= ($signed(wire9) ?
          $unsigned((~^reg18[(4'h9):(2'h2)])) : $signed(reg21[(3'h4):(2'h2)]));
      reg36 <= reg14[(1'h0):(1'h0)];
    end
  assign wire37 = $signed((8'had));
  assign wire38 = (~^wire37[(3'h5):(2'h3)]);
  assign wire39 = $signed(reg29[(2'h2):(1'h1)]);
  assign wire40 = (7'h40);
  assign wire41 = (reg26[(4'hc):(1'h0)] ?
                      (^~(~(^$unsigned(reg36)))) : $signed($signed($unsigned((wire0 ?
                          (8'h9e) : (8'hab))))));
  assign wire42 = $signed($unsigned(wire11));
  assign wire43 = reg27[(4'hd):(4'ha)];
  assign wire44 = {wire5, {reg30[(3'h4):(1'h0)]}};
  assign wire45 = reg20;
  module46 #() modinst128 (.wire51(wire1), .wire47(reg34), .wire50(wire12), .clk(clk), .wire48(wire38), .y(wire127), .wire49(reg22));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire51;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire signed [(5'h14):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  assign y = {wire125, wire86, wire54, wire53, wire52, (1'h0)};
  assign wire52 = wire49;
  assign wire53 = (((~|($signed(wire50) ?
                          (wire47 > wire52) : $unsigned(wire47))) >= $unsigned(({wire51,
                              wire48} ?
                          $unsigned(wire49) : {wire51}))) ?
                      ($unsigned((wire51 ?
                          $signed(wire52) : wire51[(3'h7):(3'h6)])) > wire48) : $unsigned(wire51));
  assign wire54 = (~|((wire48[(1'h1):(1'h1)] ?
                          (!((7'h40) >>> wire52)) : ({wire47} ^ (wire48 ?
                              wire48 : wire49))) ?
                      $signed((wire49 >= {wire51})) : ($signed((wire53 ^~ wire49)) < ({wire50} < ((7'h42) ?
                          wire53 : wire47)))));
  module55 #() modinst87 (.wire57(wire50), .y(wire86), .wire58(wire47), .wire56(wire49), .wire59(wire48), .clk(clk));
  module88 #() modinst126 (.wire91(wire52), .y(wire125), .wire92(wire53), .clk(clk), .wire89(wire47), .wire90(wire54));
endmodule

module module88
#(parameter param124 = (~(((!((8'hb9) || (8'hbb))) & (&(+(8'hb3)))) - (((-(8'hb0)) != ((8'ha6) == (8'hb3))) >>> (~^(^~(7'h44)))))))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire93;
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire117,
                 wire114,
                 wire113,
                 wire110,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire93 = (&(($unsigned({wire92}) ?
                      wire89[(1'h1):(1'h0)] : ((wire91 ? wire90 : wire89) ?
                          $unsigned((8'hbc)) : wire92[(2'h2):(2'h2)])) == $unsigned(wire91[(3'h7):(1'h0)])));
  assign wire94 = ((&$signed(((wire91 - wire91) < {wire89}))) ?
                      ($unsigned($unsigned($unsigned(wire90))) != $signed($signed(((8'hbb) != wire92)))) : (~&$signed((|(&wire92)))));
  assign wire95 = $signed(wire89);
  assign wire96 = wire89;
  assign wire97 = wire95;
  assign wire98 = {$unsigned((($signed(wire95) ^~ (8'ha4)) != (7'h41)))};
  assign wire99 = $signed((7'h40));
  assign wire100 = (~wire97);
  assign wire101 = wire97;
  assign wire102 = (wire89[(3'h6):(1'h0)] ^~ wire90);
  always
    @(posedge clk) begin
      reg103 <= wire99;
      reg104 <= ((wire99[(4'hb):(3'h5)] ?
          $signed((wire90 <<< (wire97 >= (7'h41)))) : $signed(wire98[(1'h0):(1'h0)])) ~^ (&(wire97[(4'h9):(3'h4)] != $unsigned($signed(wire98)))));
      reg105 <= (((($signed(wire100) ? $signed((8'hb5)) : wire102) ?
          ((wire99 ? wire93 : wire101) ?
              reg104[(2'h3):(2'h2)] : (wire93 & wire90)) : $unsigned(wire100[(3'h6):(1'h0)])) ~^ $signed($signed((8'ha1)))) > wire90);
      if ($signed(((!{(wire98 & wire90)}) ?
          wire101[(2'h2):(1'h0)] : ((^(~|wire92)) == wire100))))
        begin
          reg106 <= (8'ha2);
          reg107 <= {$signed($unsigned({wire91, wire100[(1'h1):(1'h1)]})),
              (+$signed($signed($signed(wire98))))};
          reg108 <= (($unsigned($unsigned((|wire92))) || reg103) ?
              (wire98 ?
                  $unsigned(reg107[(4'hb):(4'hb)]) : wire91[(2'h2):(2'h2)]) : reg107[(1'h1):(1'h0)]);
        end
      else
        begin
          reg106 <= (8'ha7);
          reg107 <= (reg105 & wire93);
          reg108 <= (7'h43);
          reg109 <= (((($signed(reg105) ?
                          reg103[(4'he):(4'h9)] : $signed(wire89)) ?
                      (8'haa) : $unsigned($unsigned(reg106))) ?
                  ($signed((^~wire91)) ?
                      ($unsigned(wire89) ?
                          {wire100} : reg104[(3'h7):(3'h4)]) : (!(wire91 ~^ (7'h44)))) : (!$signed($signed((7'h44))))) ?
              (reg105 - $signed(($signed((7'h42)) ?
                  (wire99 > reg105) : $signed(wire101)))) : reg106);
        end
    end
  assign wire110 = ((!$unsigned(reg105[(1'h1):(1'h1)])) - (wire89[(4'h9):(3'h6)] | ((reg106 ?
                       (wire99 - (8'hb7)) : $signed(wire95)) || reg106[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg111 <= $unsigned(reg104[(4'h9):(3'h7)]);
      reg112 <= $signed(($signed({(wire102 ?
              reg103 : reg104)}) >= wire99[(4'h8):(1'h0)]));
    end
  assign wire113 = reg108;
  assign wire114 = (&(~&{$signed($unsigned(wire100)), $unsigned(wire102)}));
  always
    @(posedge clk) begin
      reg115 <= ($signed($unsigned($unsigned(wire93))) ?
          $signed((~&(8'hbd))) : ($unsigned(reg111[(4'h8):(3'h4)]) ?
              ({wire95, (^(8'hbf))} ?
                  wire90[(4'hb):(2'h3)] : (wire95[(4'hb):(3'h7)] != wire99)) : $unsigned($unsigned(((8'hb9) | reg109)))));
      reg116 <= wire99[(5'h15):(2'h2)];
    end
  assign wire117 = $signed(({$signed({wire99, wire91})} & {(~^(wire96 ?
                           wire97 : (7'h41)))}));
  always
    @(posedge clk) begin
      reg118 <= wire101;
      reg119 <= (($unsigned({wire93}) && $unsigned((+{wire92}))) ~^ (8'hb0));
      reg120 <= wire113[(3'h4):(3'h4)];
      reg121 <= ((reg103[(2'h2):(2'h2)] ?
          (^~$signed((wire90 ? wire93 : wire94))) : (((wire113 || reg116) ?
                  wire90 : reg103[(4'h9):(2'h3)]) ?
              (~|(reg120 <<< reg112)) : wire91[(3'h7):(1'h0)])) > $signed((&wire89)));
    end
  assign wire122 = (^{$unsigned(wire95[(4'h8):(4'h8)]),
                       $unsigned((~^{wire98, reg104}))});
  assign wire123 = $unsigned((wire91 ? wire117 : (-(~&reg119[(4'hb):(3'h5)]))));
endmodule

module module55
#(parameter param84 = (((8'hbe) ? (^(^~{(8'hb8)})) : (~|((^~(8'ha4)) ? (|(8'h9c)) : (~(8'hbe))))) ? ((-(+(-(8'ha7)))) ^ ((((8'hb3) + (8'h9f)) ? ((8'hbb) ? (8'hb1) : (8'h9e)) : (!(8'ha0))) || (-((8'hac) >= (8'hb9))))) : (~^((((8'hac) >= (8'hba)) ? {(8'hb3), (8'h9f)} : (&(7'h43))) ? (|(~(8'hb9))) : (~^((8'ha2) ? (8'hb2) : (8'hab)))))), 
parameter param85 = param84)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(3'h4):(1'h0)] wire58;
  input wire signed [(3'h4):(1'h0)] wire57;
  input wire [(3'h7):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire60 = $signed(wire57);
  assign wire61 = $signed((~wire59[(3'h4):(1'h0)]));
  assign wire62 = $signed(($signed((&wire58[(1'h0):(1'h0)])) & $unsigned((8'hac))));
  assign wire63 = wire56;
  assign wire64 = (~^wire56);
  assign wire65 = wire56;
  always
    @(posedge clk) begin
      reg66 <= ($unsigned($signed({(wire65 != (8'ha6))})) == {wire63[(1'h0):(1'h0)]});
      reg67 <= wire63;
      reg68 <= wire64;
      if (wire59[(1'h1):(1'h0)])
        begin
          if (wire63)
            begin
              reg69 <= wire65[(4'he):(2'h2)];
              reg70 <= wire59[(3'h4):(3'h4)];
            end
          else
            begin
              reg69 <= {$unsigned((^((8'ha9) ?
                      $unsigned(reg67) : $unsigned(wire65)))),
                  reg70};
              reg70 <= reg69;
            end
        end
      else
        begin
          reg69 <= {((~wire63) ?
                  wire65[(5'h12):(4'ha)] : (~|(wire62 & $unsigned(wire58))))};
          reg70 <= {wire64,
              ($signed(((+reg69) <= reg69[(3'h7):(1'h1)])) > (~&(((8'haa) ?
                  wire65 : reg70) ^ (~wire61))))};
          if ($unsigned(reg70[(5'h10):(4'hf)]))
            begin
              reg71 <= (wire57[(1'h1):(1'h0)] & ($unsigned(($signed((8'hbd)) ?
                  $signed(wire57) : reg66)) ~^ $signed({((8'hae) ^ (8'hb7)),
                  wire56[(2'h3):(2'h2)]})));
              reg72 <= (reg66 * (7'h43));
              reg73 <= (wire65 ?
                  $unsigned(((|(reg72 > reg71)) ?
                      (~(reg72 ?
                          wire64 : reg70)) : ((wire62 && wire64) & wire63))) : wire60);
            end
          else
            begin
              reg71 <= reg72[(1'h0):(1'h0)];
            end
        end
    end
  assign wire74 = wire59[(3'h4):(1'h0)];
  assign wire75 = reg72[(4'hc):(2'h2)];
  assign wire76 = ($unsigned(wire74) - (-reg67));
  assign wire77 = (|$unsigned($unsigned(wire61)));
  assign wire78 = (((8'hb1) ?
                      ((wire62 - $signed(wire77)) ?
                          ($unsigned(wire65) ?
                              wire77 : $unsigned(wire56)) : (reg72 ?
                              $unsigned(reg73) : reg70[(2'h3):(2'h2)])) : {reg73[(3'h4):(1'h1)],
                          reg70}) ~^ $unsigned((reg71 ?
                      ((wire63 ?
                          (8'ha9) : wire63) | $unsigned(reg67)) : (|wire75))));
  assign wire79 = (+{((~&(wire76 - wire63)) ^~ {(^~wire78),
                          $unsigned(reg72)})});
  assign wire80 = (8'ha8);
  assign wire81 = reg67[(4'h9):(3'h5)];
  assign wire82 = ((8'h9f) || wire59);
  assign wire83 = ((8'ha0) >= reg68);
endmodule
