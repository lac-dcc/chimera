module top
#(parameter param106 = (+((~({(7'h41), (8'haf)} ? (~^(8'h9f)) : {(8'ha0)})) ? {(!((8'ha4) ? (8'hac) : (8'hb0)))} : ((8'h9f) || ({(8'ha9), (8'hac)} ? {(8'hb7)} : ((8'ha7) + (8'ha0)))))), 
parameter param107 = param106)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire101;
  assign y = {wire105, wire104, wire103, wire5, wire6, wire7, wire101, (1'h0)};
  assign wire5 = $unsigned($unsigned(wire2[(3'h4):(2'h3)]));
  assign wire6 = $unsigned(wire1);
  assign wire7 = $signed($signed((+$signed(wire2[(1'h1):(1'h1)]))));
  module8 #() modinst102 (wire101, clk, wire6, wire5, wire4, wire7, wire3);
  assign wire103 = ($unsigned(wire7) ?
                       (~(($signed(wire7) & (wire7 ?
                           wire7 : (8'ha8))) > ({wire4} ?
                           (wire7 ?
                               wire6 : (8'hbb)) : (!(8'hae))))) : wire6[(3'h7):(3'h6)]);
  assign wire104 = {$unsigned(wire5)};
  assign wire105 = wire104[(3'h6):(3'h5)];
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire14;
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  assign y = {wire100,
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
                 wire89,
                 wire87,
                 wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
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
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire14 = $signed(((8'hb3) ?
                      $signed(wire9[(3'h4):(2'h3)]) : (wire9 - ($signed(wire9) ?
                          wire13 : {(8'ha9), wire9}))));
  always
    @(posedge clk) begin
      if ((wire9[(2'h3):(1'h0)] << wire14))
        begin
          if (wire13)
            begin
              reg15 <= (~$unsigned(({(wire13 <<< wire9)} >>> $signed(wire12))));
            end
          else
            begin
              reg15 <= ({($signed(wire14) == {{wire12}}),
                  $signed($signed($signed(reg15)))} <= {(~&(wire9 != $signed((8'hb4))))});
              reg16 <= wire13;
              reg17 <= wire12[(2'h2):(1'h1)];
              reg18 <= $signed((~^$unsigned(({reg16, reg17} ?
                  {(8'ha1), reg17} : (wire11 ? reg16 : reg16)))));
            end
          reg19 <= $unsigned(((^(!wire12[(2'h3):(2'h3)])) ?
              $unsigned(wire12[(2'h2):(1'h0)]) : (wire12[(3'h4):(1'h1)] ?
                  $signed((+wire10)) : (~$signed(wire13)))));
          reg20 <= {reg19};
        end
      else
        begin
          reg15 <= (wire12[(3'h5):(1'h0)] ?
              reg15 : ($signed(wire14) ?
                  $unsigned({(|wire9),
                      (reg16 ? reg17 : reg19)}) : (+$unsigned((reg20 ?
                      (8'hbf) : reg18)))));
          reg16 <= $signed($signed(wire10));
        end
      if (((reg16 != $signed((&$unsigned(wire12)))) >>> (&$signed(reg19))))
        begin
          if ((8'hac))
            begin
              reg21 <= reg17[(4'h8):(4'h8)];
              reg22 <= $signed($signed((((^reg21) * $signed(reg19)) ?
                  (~^wire12) : (8'haa))));
              reg23 <= $signed(reg20[(5'h10):(4'hf)]);
              reg24 <= $unsigned({{reg21}});
            end
          else
            begin
              reg21 <= reg18[(3'h6):(2'h2)];
              reg22 <= reg23;
            end
          reg25 <= ((~&(~^$signed((wire10 - (8'ha6))))) ?
              ((^~reg20) || (reg19 && $signed(reg22))) : ($signed((+$signed((8'ha7)))) & ($signed($unsigned(reg15)) ?
                  wire9[(3'h7):(1'h0)] : {$unsigned((8'haa))})));
          reg26 <= (reg22 ? (^reg25[(4'hd):(3'h6)]) : reg21[(4'h9):(1'h0)]);
          reg27 <= reg24[(2'h2):(1'h1)];
        end
      else
        begin
          reg21 <= {((8'hbe) ?
                  ((~|((8'hbf) ? reg19 : reg18)) ?
                      (^reg25) : (~^reg19)) : (|$signed($unsigned(wire12))))};
          reg22 <= ($signed((~$unsigned(wire10[(3'h5):(2'h2)]))) ?
              $unsigned({((reg23 ? reg20 : (7'h44)) ?
                      $signed(reg21) : (|reg21)),
                  $signed(reg25)}) : (reg18 < ((+reg25) ?
                  $unsigned(reg21) : wire12[(1'h0):(1'h0)])));
          reg23 <= ($signed(((reg26 ^~ reg18) * $signed((reg25 ?
              reg17 : (7'h40))))) <= reg18[(3'h6):(3'h4)]);
          reg24 <= $signed(reg24[(1'h1):(1'h0)]);
        end
      reg28 <= $unsigned(reg26[(3'h6):(1'h1)]);
    end
  always
    @(posedge clk) begin
      if (reg19)
        begin
          reg29 <= {($unsigned(wire9) * (({reg26, wire10} ?
                  wire14 : reg20[(3'h4):(2'h2)]) >>> wire13)),
              reg16[(2'h2):(1'h0)]};
          reg30 <= ((((7'h44) ?
                  ($unsigned(wire12) ?
                      (reg18 + reg27) : reg20) : $signed(reg20)) ?
              reg23[(1'h1):(1'h1)] : $signed($signed($signed(reg26)))) && ($unsigned(($signed(reg21) >>> (reg25 ?
              reg24 : reg28))) >>> (~&(reg29 ?
              (-wire14) : reg29[(5'h14):(4'hf)]))));
          reg31 <= (^~$signed(reg22[(1'h1):(1'h1)]));
          reg32 <= ($unsigned($unsigned((|$unsigned((8'ha4))))) > wire9[(3'h5):(2'h3)]);
        end
      else
        begin
          reg29 <= (~&(+(7'h44)));
          reg30 <= $unsigned((({reg31[(2'h2):(1'h0)],
              (-reg20)} && reg31) | (~^(8'hb2))));
          reg31 <= {(~|((~$signed(wire10)) ? (-(~&reg27)) : (~^reg28))),
              $signed((($unsigned(reg19) ?
                  wire13 : $signed(wire11)) != $unsigned((+reg21))))};
          if ($unsigned(($signed($unsigned((&wire12))) ?
              (((~^reg22) > (reg15 ^~ reg19)) && $signed($unsigned(reg21))) : wire12[(3'h5):(2'h3)])))
            begin
              reg32 <= wire10[(1'h1):(1'h1)];
              reg33 <= reg23;
              reg34 <= (|$signed($unsigned(({reg25, (8'hb7)} ?
                  (|reg30) : ((8'hae) ? wire14 : wire14)))));
              reg35 <= reg31;
              reg36 <= {$unsigned({wire10[(2'h2):(1'h0)],
                      ((!reg29) ?
                          (reg30 >>> reg30) : (wire14 ? wire9 : reg23))}),
                  reg18[(4'hc):(3'h7)]};
            end
          else
            begin
              reg32 <= $signed($signed(reg15[(5'h13):(4'hc)]));
              reg33 <= (((reg30[(2'h2):(1'h0)] <= reg30[(3'h7):(3'h5)]) * reg34) <<< ($signed($signed((reg18 | reg31))) ?
                  (reg34[(3'h6):(3'h5)] ?
                      wire11 : $signed(((8'hb3) ? reg17 : reg31))) : wire12));
              reg34 <= reg18[(4'hd):(4'h9)];
              reg35 <= (~^{$signed($unsigned({reg31, reg36}))});
            end
          if (reg24)
            begin
              reg37 <= ($unsigned(reg35) ?
                  (wire11[(2'h3):(1'h0)] ?
                      reg17[(4'hf):(4'hf)] : (8'hb3)) : {{($unsigned(reg20) || $signed(reg20)),
                          $unsigned({reg23, reg17})}});
              reg38 <= {wire13};
              reg39 <= (wire13 ?
                  reg30[(1'h1):(1'h1)] : (reg28[(1'h0):(1'h0)] ?
                      {($signed(reg36) >>> $signed(wire13)),
                          {(reg24 != wire9), {wire13}}} : (+((reg31 ?
                              reg22 : reg32) ?
                          $signed(reg33) : reg19))));
              reg40 <= reg35[(3'h6):(3'h5)];
              reg41 <= (8'hb2);
            end
          else
            begin
              reg37 <= $unsigned($unsigned($signed(reg37[(4'h9):(3'h4)])));
              reg38 <= ($signed($signed($unsigned($signed(reg19)))) < $signed($unsigned(({wire12} > (~|reg36)))));
              reg39 <= $unsigned(reg24);
              reg40 <= ($signed(reg25[(3'h7):(3'h4)]) >>> {(reg34 | reg28[(4'hf):(2'h2)]),
                  (~^(reg21[(3'h4):(1'h1)] < reg34[(1'h0):(1'h0)]))});
              reg41 <= $signed(((~&wire12[(3'h4):(3'h4)]) || (!$unsigned(reg26))));
            end
        end
    end
  assign wire42 = ((!$signed(reg39[(1'h0):(1'h0)])) <= $unsigned((((reg23 ^~ reg37) ?
                          {(8'h9c)} : ((7'h43) ? reg40 : reg15)) ?
                      ((~|reg35) ~^ reg17[(4'hb):(4'h9)]) : reg17)));
  assign wire43 = (reg28 <<< ($unsigned(reg23) * $signed((wire9 <<< (wire12 ?
                      reg17 : reg38)))));
  assign wire44 = (+$unsigned($signed($unsigned((^reg26)))));
  always
    @(posedge clk) begin
      if (reg27)
        begin
          reg45 <= reg32[(3'h7):(1'h1)];
        end
      else
        begin
          reg45 <= ((reg18 ?
              $signed($unsigned($unsigned(reg25))) : ((reg39[(1'h0):(1'h0)] << {wire12}) ?
                  (8'hb6) : (!(reg30 | wire10)))) | {$unsigned($unsigned({wire11}))});
          reg46 <= wire12[(2'h2):(2'h2)];
        end
    end
  assign wire47 = $unsigned((wire14 == reg40[(3'h5):(2'h3)]));
  assign wire48 = ((reg22 ?
                          $unsigned((wire14[(4'hb):(3'h5)] >= (wire44 ~^ reg38))) : ($signed(reg22[(4'hd):(4'hc)]) < (|(|wire44)))) ?
                      ($unsigned(reg34) <<< reg28) : reg28);
  module49 #() modinst88 (wire87, clk, wire9, wire10, reg31, reg41, reg38);
  assign wire89 = ((((((8'ha1) ? reg17 : wire9) ?
                          {reg29,
                              reg16} : reg28[(2'h2):(1'h0)]) <= $signed(wire14)) ?
                      $unsigned(((wire10 != wire10) ^ reg15)) : {reg28[(5'h10):(4'hb)],
                          {(8'hb8), (~&reg46)}}) == reg33);
  assign wire90 = (~|(~|(($signed(reg26) ?
                          reg16[(3'h4):(2'h2)] : (wire10 + (8'ha1))) ?
                      $unsigned(wire48) : ((reg34 ? reg32 : reg40) >> ((8'h9c) ?
                          reg22 : reg15)))));
  assign wire91 = {$unsigned({(reg41[(2'h3):(1'h1)] ? reg29 : (7'h43))})};
  assign wire92 = {$unsigned($signed($unsigned($signed(reg23)))),
                      $signed($signed($unsigned((!wire47))))};
  assign wire93 = wire14;
  assign wire94 = wire92[(2'h3):(1'h0)];
  assign wire95 = wire43[(1'h1):(1'h1)];
  assign wire96 = (reg34 <<< reg16);
  assign wire97 = (~$signed($unsigned(reg20[(3'h4):(3'h4)])));
  assign wire98 = (8'hae);
  assign wire99 = ($signed($unsigned($signed((~|(8'ha8))))) ?
                      (-$signed(((reg41 ? reg25 : reg40) ?
                          (8'hb0) : $unsigned(wire90)))) : $unsigned(reg35));
  assign wire100 = $unsigned(((($signed(reg18) && (~^(8'hab))) ?
                           (&$signed(reg17)) : ($unsigned(wire90) ?
                               $unsigned(wire91) : reg15[(4'hb):(4'h8)])) ?
                       reg39[(2'h2):(2'h2)] : ($signed((!(8'hb0))) ?
                           $signed((|reg20)) : reg20)));
endmodule

module module49
#(parameter param85 = (~&{((((8'had) ? (8'h9e) : (8'ha5)) ? ((8'ha0) ? (8'hb2) : (8'h9d)) : (&(7'h42))) ? (((8'ha7) ? (8'hb1) : (8'haf)) >> (8'ha0)) : (~&((8'ha7) > (8'hbf)))), (({(8'hbb), (8'ha5)} >>> ((8'hb8) ? (7'h44) : (8'hb2))) ? (8'haf) : (((8'hb5) ^~ (8'h9d)) || ((8'ha2) ? (7'h41) : (8'ha4))))}), 
parameter param86 = (!((param85 ^~ {(|param85)}) ^ ((-(+param85)) * {param85, {param85}}))))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire [(3'h5):(1'h0)] wire52;
  input wire [(4'hb):(1'h0)] wire51;
  input wire [(3'h5):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire55;
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire84,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire63,
                 wire62,
                 wire55,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire55 = wire50[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg56 <= (8'ha6);
      reg57 <= (reg56[(4'h9):(4'h8)] ?
          $signed($unsigned($signed(wire53[(3'h4):(1'h1)]))) : ($signed((wire51[(3'h6):(3'h4)] ?
                  (8'hbe) : {(8'hb6), wire54})) ?
              (7'h41) : wire51[(3'h4):(1'h1)]));
      reg58 <= ($unsigned(wire51[(3'h4):(1'h1)]) & $signed((wire50 ?
          wire52[(2'h2):(2'h2)] : wire53[(1'h0):(1'h0)])));
      reg59 <= (^~(^~(!(wire51 <= wire54))));
      reg60 <= {{{(reg56[(4'hf):(1'h0)] ? $signed(wire55) : wire50)}},
          reg58[(4'hb):(3'h5)]};
    end
  always
    @(posedge clk) begin
      reg61 <= reg60[(3'h4):(1'h0)];
    end
  assign wire62 = wire54;
  assign wire63 = $signed(reg61[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg64 <= (reg58 ? reg57[(5'h11):(4'h9)] : wire52);
      reg65 <= wire55[(3'h7):(3'h6)];
      reg66 <= $signed((~($signed($signed(reg61)) ?
          $signed(wire54[(4'ha):(4'h9)]) : ((reg59 <= wire62) < wire62))));
      reg67 <= $signed(reg57);
      if ((reg56 ? $signed($unsigned(wire63[(2'h2):(1'h0)])) : reg60))
        begin
          reg68 <= $signed(reg64[(2'h2):(1'h1)]);
        end
      else
        begin
          reg68 <= wire55[(4'ha):(1'h1)];
          if (wire53)
            begin
              reg69 <= (wire53[(3'h5):(3'h4)] ?
                  wire55[(1'h0):(1'h0)] : ({({reg57} ?
                          (wire54 ?
                              (7'h41) : (8'hba)) : $unsigned(reg64))} + (({(8'hbe),
                          wire62} * (reg68 || reg56)) ?
                      ($signed(reg65) ?
                          $unsigned(reg66) : {wire53}) : reg56[(1'h0):(1'h0)])));
              reg70 <= reg67[(4'hc):(3'h5)];
              reg71 <= reg60;
              reg72 <= ((~$signed(((reg71 ^ reg61) ^ reg59))) ?
                  reg68[(2'h2):(1'h1)] : {(^reg68[(1'h1):(1'h1)]),
                      (!(((8'ha5) ? wire53 : reg68) <= (wire63 ~^ wire54)))});
              reg73 <= reg60[(2'h3):(1'h0)];
            end
          else
            begin
              reg69 <= $signed(((&$unsigned($unsigned(reg65))) ?
                  $signed($signed($signed(reg66))) : (~|reg60)));
              reg70 <= reg66[(4'hd):(4'hd)];
              reg71 <= (|($signed($unsigned((^~reg61))) < reg65));
            end
          reg74 <= (wire62 <= (((reg67[(4'hd):(4'ha)] ?
              (|(7'h41)) : {(7'h42)}) >> $unsigned(reg60)) ~^ ($unsigned(reg58) ?
              ($unsigned(reg61) > wire51[(3'h6):(3'h6)]) : ($unsigned(wire53) <<< reg73[(2'h3):(1'h1)]))));
        end
    end
  assign wire75 = {wire51, reg60};
  assign wire76 = $signed(wire52[(3'h5):(3'h4)]);
  assign wire77 = (~((^~$unsigned($signed(reg67))) == {({wire75} ?
                          reg57[(4'h9):(3'h6)] : $signed(wire54))}));
  assign wire78 = wire53;
  assign wire79 = $unsigned($unsigned((wire63[(1'h0):(1'h0)] > $signed((|wire76)))));
  always
    @(posedge clk) begin
      reg80 <= ((^$unsigned((wire77 ~^ wire79))) >> reg61[(1'h0):(1'h0)]);
      reg81 <= reg61;
      reg82 <= ($signed(reg61[(2'h3):(2'h3)]) && (~&(((~^wire51) <= $signed(wire77)) ?
          (+(wire50 * wire55)) : ({wire78} ?
              $unsigned(reg72) : $unsigned(reg80)))));
      reg83 <= $unsigned(($signed((!wire62)) ^ (8'hb1)));
    end
  assign wire84 = $unsigned((8'h9d));
endmodule
