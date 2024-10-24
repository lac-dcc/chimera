module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire76;
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire76,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed(wire0[(2'h2):(1'h0)]);
  assign wire6 = {(^~{wire1[(4'ha):(3'h4)]}), wire0};
  assign wire7 = (|wire2[(4'h8):(3'h4)]);
  assign wire8 = $unsigned($unsigned($unsigned((((8'hac) >>> wire3) >= $signed(wire1)))));
  assign wire9 = $unsigned(wire7);
  always
    @(posedge clk) begin
      reg10 <= (|wire0[(2'h2):(1'h1)]);
    end
  assign wire11 = (~{wire8});
  assign wire12 = $signed((8'ha4));
  assign wire13 = (8'ha9);
  assign wire14 = $unsigned((~wire6));
  assign wire15 = {$signed({(wire14 ^ (&wire1)), $signed($signed(wire4))}),
                      ($signed((wire0 >> wire4)) == (^(wire8[(4'hb):(3'h5)] + (reg10 >> wire2))))};
  assign wire16 = $unsigned((&$signed($signed($signed(wire0)))));
  assign wire17 = wire11;
  assign wire18 = (8'hb3);
  assign wire19 = (^~$unsigned(wire8[(4'h9):(3'h6)]));
  assign wire20 = $unsigned($signed($signed($unsigned(wire19[(4'h8):(1'h1)]))));
  assign wire21 = $unsigned(wire8);
  assign wire22 = $unsigned($unsigned((^{wire19[(3'h7):(1'h1)]})));
  module23 #() modinst77 (wire76, clk, wire13, reg10, wire12, wire18);
  assign wire78 = ((8'ha1) | $unsigned($unsigned($signed(wire4))));
  assign wire79 = (~|(~(~&$signed((^wire14)))));
endmodule

module module23
#(parameter param75 = (({{(+(7'h40)), (|(8'hba))}} * (((!(8'hae)) ? (|(8'haf)) : (~&(8'h9c))) ? (((8'hb2) >= (7'h42)) <= ((8'h9c) > (8'ha4))) : {{(8'hae)}, ((8'h9d) ? (8'hb0) : (8'hb9))})) ? ((((-(8'hb1)) ? ((8'hab) > (7'h40)) : (8'ha3)) ? (((8'ha1) == (8'hbb)) ? ((8'ha4) ? (8'hba) : (8'h9d)) : (|(8'hb5))) : {(-(8'h9d))}) >>> ((((8'h9e) + (8'ha0)) ? ((8'haf) >> (8'hab)) : ((8'h9f) ? (8'ha8) : (8'hb0))) >= ({(8'h9e)} ? (8'hb2) : {(8'hb2), (8'ha8)}))) : {((|((8'ha7) ? (8'hba) : (8'hb4))) ? ((8'hbe) <<< ((8'ha7) ? (8'haf) : (8'hb0))) : ((!(7'h40)) * (&(8'ha6))))}))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(4'hb):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire28;
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire28,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = $signed(wire24[(4'he):(3'h6)]);
  always
    @(posedge clk) begin
      if ($signed((wire28[(4'ha):(3'h7)] ?
          ((-wire24) ?
              {wire27, {(8'hb5), (8'h9f)}} : $signed({wire28,
                  wire25})) : $signed(wire26[(4'h8):(1'h0)]))))
        begin
          reg29 <= wire28[(4'hc):(4'hc)];
          if ((~|$signed($signed($signed(wire26[(1'h0):(1'h0)])))))
            begin
              reg30 <= {(~|{($signed(wire24) <<< $signed(wire24))}),
                  $signed(wire24)};
              reg31 <= wire26;
              reg32 <= (|wire24[(4'he):(4'hb)]);
              reg33 <= reg32;
              reg34 <= (wire28 ?
                  {{($unsigned(wire26) | (reg30 ~^ wire25))},
                      (reg32[(4'h8):(2'h3)] ^ wire27[(4'hb):(1'h1)])} : (reg30[(5'h10):(4'hd)] ?
                      {wire27, $unsigned({wire24})} : (+($signed(reg29) ?
                          {(8'ha2)} : {wire26, reg31}))));
            end
          else
            begin
              reg30 <= $signed($unsigned(({(wire28 ? wire24 : reg31)} ?
                  (-$unsigned(wire27)) : wire25)));
              reg31 <= ((!$unsigned({(wire27 ? reg33 : (8'hb5))})) && {reg31,
                  wire26[(3'h4):(2'h3)]});
            end
          reg35 <= ($signed(reg29) ?
              $signed(reg34[(4'hb):(2'h3)]) : (&$signed($unsigned($signed(wire26)))));
          if ((&$unsigned((~reg29))))
            begin
              reg36 <= (&reg33);
              reg37 <= ($unsigned((reg36 <= $signed((reg30 ?
                  reg34 : wire28)))) - $unsigned((((reg33 - wire25) & {wire26,
                      reg32}) ?
                  (wire25 <<< $signed(wire27)) : wire25[(4'h8):(3'h4)])));
            end
          else
            begin
              reg36 <= ($signed(((reg33 ? {wire26} : wire26) ?
                  ((reg29 * reg35) ?
                      (wire26 * reg35) : (reg37 ?
                          (8'hb5) : wire28)) : ($unsigned((8'hb1)) ?
                      (reg30 ?
                          reg36 : (8'hbf)) : $signed(reg29)))) - $signed({(reg33 < reg37[(2'h3):(2'h3)]),
                  wire28}));
            end
        end
      else
        begin
          reg29 <= wire24[(3'h7):(1'h1)];
          reg30 <= reg34[(4'hc):(4'hb)];
          reg31 <= (&reg37[(1'h1):(1'h1)]);
          reg32 <= $unsigned((wire28[(2'h3):(1'h0)] ?
              $unsigned(((-wire24) ?
                  reg30[(4'h9):(4'h9)] : (~^reg37))) : ($unsigned((-(8'hb9))) ?
                  ((reg29 ^ reg37) <= (reg31 ?
                      wire27 : reg31)) : {reg36[(1'h0):(1'h0)],
                      reg37[(3'h4):(2'h2)]})));
        end
      if ($signed($unsigned((+(reg35 ^ wire24)))))
        begin
          reg38 <= (^(+$unsigned(((8'hb7) ?
              (reg33 - reg31) : reg30[(1'h0):(1'h0)]))));
          reg39 <= {($unsigned($unsigned($unsigned(wire24))) ?
                  $unsigned(wire25) : (~reg35))};
        end
      else
        begin
          reg38 <= ($unsigned((reg38 >>> (((8'ha8) <= reg33) ?
                  (reg30 >= reg38) : reg39))) ?
              ((~&$signed((~^reg39))) ?
                  ($unsigned(reg36) ?
                      $signed(((8'hae) ?
                          wire27 : reg32)) : (reg35[(1'h1):(1'h1)] ?
                          $signed(reg37) : reg37)) : $unsigned(((reg34 >= reg36) != wire25[(3'h4):(3'h4)]))) : wire24[(3'h5):(2'h2)]);
          reg39 <= wire25;
          reg40 <= (~^wire26[(1'h1):(1'h0)]);
          reg41 <= (+(reg37[(4'h8):(1'h0)] << $unsigned(wire28[(3'h6):(1'h1)])));
          reg42 <= reg38[(1'h1):(1'h0)];
        end
      reg43 <= reg42[(1'h0):(1'h0)];
    end
  assign wire44 = (!$signed((reg33[(3'h7):(3'h7)] ?
                      $signed((reg42 ?
                          wire27 : reg32)) : reg32[(3'h6):(1'h0)])));
  assign wire45 = (-wire44[(2'h3):(2'h3)]);
  assign wire46 = $unsigned($signed((~|($unsigned(reg32) & (~&reg38)))));
  assign wire47 = reg32[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= $unsigned((~|wire46));
      reg49 <= ((~|(8'ha7)) ?
          $unsigned((reg38[(4'ha):(1'h0)] ?
              ((|(8'ha3)) ?
                  wire25 : (reg35 ?
                      reg39 : reg39)) : (wire44 * $signed(reg29)))) : (&({(7'h41)} ?
              ((reg34 ? wire45 : reg31) ?
                  $unsigned((8'ha1)) : (+reg35)) : $signed({reg31}))));
      if (wire44[(2'h3):(2'h3)])
        begin
          reg50 <= (8'hb9);
          reg51 <= $signed(($unsigned($signed((wire46 ?
              reg35 : wire25))) >> (reg34 ^ $signed(wire28[(2'h3):(1'h0)]))));
          reg52 <= ($unsigned((((|wire28) ? (!wire25) : (reg34 || reg35)) ?
                  wire47[(1'h1):(1'h0)] : ((^reg39) == {wire45, reg40}))) ?
              (~|(!$unsigned($signed((7'h44))))) : $signed(reg29[(3'h4):(1'h1)]));
          reg53 <= reg38;
          if ($unsigned((wire46 ~^ $unsigned($signed((reg50 + reg39))))))
            begin
              reg54 <= reg36[(2'h2):(2'h2)];
              reg55 <= ($unsigned(wire45[(3'h7):(3'h7)]) > $signed($unsigned($unsigned((reg50 ?
                  wire44 : reg40)))));
              reg56 <= (~|(reg41 ?
                  $unsigned(reg35) : (~&((reg50 << reg53) >>> {reg42}))));
            end
          else
            begin
              reg54 <= (reg41 >= ($signed(reg52) || ($unsigned((reg48 > reg49)) ?
                  reg48[(4'h8):(2'h2)] : $unsigned($unsigned(wire27)))));
              reg55 <= (7'h40);
              reg56 <= $signed($signed((reg42[(2'h2):(1'h0)] ?
                  {$signed(reg53),
                      (^reg50)} : ($signed((8'hba)) - reg55[(1'h1):(1'h0)]))));
              reg57 <= (|(+reg38));
              reg58 <= (|(wire25[(3'h7):(3'h7)] ?
                  (reg29 || (reg39 ?
                      $signed(reg48) : $signed(wire47))) : (({(8'h9d)} << $signed(reg41)) << reg56[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          if ((~&(^~($unsigned({reg48}) * (|(~reg37))))))
            begin
              reg50 <= $unsigned((($signed($unsigned((8'haf))) != ({wire44,
                          wire44} ?
                      (!reg33) : (wire25 ? reg55 : reg49))) ?
                  $signed({$unsigned(wire45),
                      (reg36 < reg30)}) : $unsigned(wire44)));
              reg51 <= ({(&((+reg53) ?
                          wire24[(4'ha):(3'h7)] : $unsigned(reg32))),
                      $unsigned((!reg39[(2'h2):(2'h2)]))} ?
                  $signed(reg32) : (~^($unsigned((reg32 == (7'h43))) ^~ (reg39[(2'h2):(2'h2)] ?
                      $signed(reg31) : reg36[(2'h2):(1'h0)]))));
              reg52 <= (^wire26[(4'h9):(1'h0)]);
              reg53 <= $unsigned((reg49 != reg31[(1'h0):(1'h0)]));
              reg54 <= ($unsigned((-reg50)) == ($unsigned((wire27[(4'h8):(3'h7)] ?
                      (wire25 ? (8'hb1) : reg40) : reg42)) ?
                  ({$signed(reg31), wire27} ?
                      ($signed(reg30) ?
                          (reg49 == wire44) : reg43[(4'hf):(4'hf)]) : (^reg48[(1'h1):(1'h0)])) : $signed((-wire44))));
            end
          else
            begin
              reg50 <= (reg30[(4'hd):(4'hd)] == {(~(reg57 ?
                      (!reg39) : reg53[(1'h0):(1'h0)]))});
              reg51 <= (~|$signed(($unsigned((reg41 ? (8'hb5) : wire24)) ?
                  (~|(wire26 ? (8'ha7) : reg30)) : $unsigned((-(8'haf))))));
              reg52 <= reg51[(3'h5):(2'h3)];
            end
          if ((wire26 ?
              wire26[(3'h4):(1'h0)] : ((~(~&reg37[(1'h1):(1'h0)])) ?
                  {((reg54 ? (8'hb2) : reg30) ?
                          $signed(wire27) : $signed(reg54)),
                      reg41[(5'h14):(3'h7)]} : (reg53 ?
                      $unsigned(reg54) : ({reg48} != (reg52 == reg53))))))
            begin
              reg55 <= reg30[(2'h3):(2'h2)];
              reg56 <= ($signed(reg50) ?
                  $unsigned($signed($signed((^reg52)))) : reg53[(1'h0):(1'h0)]);
              reg57 <= $unsigned(($signed(reg54[(4'h9):(3'h4)]) ?
                  (^~reg52[(3'h5):(1'h1)]) : {(8'hb3), (-((8'haa) ^ reg55))}));
              reg58 <= (-(((8'hb9) ?
                  $signed(reg54[(1'h1):(1'h0)]) : (reg52[(3'h6):(1'h1)] ?
                      reg57 : (reg43 ?
                          reg29 : reg31))) >> $signed((wire26[(4'hd):(1'h0)] & (wire44 != reg49)))));
            end
          else
            begin
              reg55 <= $unsigned($unsigned($unsigned((reg55[(3'h6):(2'h3)] != $unsigned(reg43)))));
              reg56 <= reg38[(4'hf):(4'ha)];
              reg57 <= $unsigned(wire25[(4'h8):(1'h0)]);
              reg58 <= (reg32 ?
                  $unsigned((((reg36 ? reg37 : wire26) + $unsigned(reg48)) ?
                      $unsigned((reg51 & reg51)) : wire46)) : (reg38[(3'h6):(1'h1)] || $signed((8'h9c))));
            end
          reg59 <= (~|(reg33[(3'h6):(3'h6)] ? reg43[(4'he):(4'hd)] : (|reg39)));
          if ($unsigned(reg34))
            begin
              reg60 <= (-((~|($signed(reg58) ?
                      wire26 : ((8'h9f) ? reg29 : (8'ha3)))) ?
                  wire26 : (+(reg59 >= wire28))));
              reg61 <= reg40;
              reg62 <= reg36[(2'h2):(1'h0)];
              reg63 <= ((((!$signed(wire28)) ?
                          {reg50, reg49[(4'hb):(3'h5)]} : (^~(^~(8'haa)))) ?
                      ((+wire28) != ({reg29} < wire24[(1'h1):(1'h1)])) : $unsigned((8'hab))) ?
                  (8'ha3) : $unsigned($signed({(reg43 >>> reg33),
                      $signed((8'h9c))})));
            end
          else
            begin
              reg60 <= reg31[(2'h2):(1'h1)];
            end
        end
      reg64 <= wire25[(2'h3):(1'h0)];
      if ($unsigned($signed((|$signed($unsigned(wire27))))))
        begin
          reg65 <= wire46;
          reg66 <= reg55;
          if ($signed((reg54[(3'h7):(3'h5)] ?
              reg36[(1'h1):(1'h0)] : (reg34 || $unsigned((wire46 ?
                  (8'ha6) : reg32))))))
            begin
              reg67 <= $unsigned(reg52);
              reg68 <= (reg43[(5'h11):(4'hb)] ?
                  $unsigned((&{$signed(reg50)})) : (~^$unsigned((&(reg54 ?
                      (8'hb1) : reg51)))));
              reg69 <= reg53[(1'h0):(1'h0)];
              reg70 <= wire26[(4'hc):(4'hc)];
            end
          else
            begin
              reg67 <= (wire27 ?
                  reg69[(3'h5):(3'h4)] : (|({$unsigned(reg49),
                      reg54} >>> (8'haa))));
              reg68 <= reg54;
            end
          reg71 <= reg51[(1'h1):(1'h0)];
        end
      else
        begin
          reg65 <= ($signed(reg48[(3'h4):(1'h1)]) ?
              ($signed((!(reg71 ? reg68 : reg35))) ?
                  (~$signed(reg55)) : ($signed($signed(reg61)) >= (reg71 ^~ $signed(reg39)))) : $signed(reg35[(3'h6):(3'h6)]));
          if (((reg32[(2'h3):(1'h0)] ~^ $signed(((^reg58) ?
              reg70 : (^~reg33)))) | {reg52, reg37}))
            begin
              reg66 <= $signed(reg58[(1'h1):(1'h1)]);
              reg67 <= ($signed((((reg50 && (8'hb2)) < (8'h9c)) < $unsigned(reg63[(3'h5):(2'h3)]))) >> $unsigned((|$signed((reg70 * reg51)))));
              reg68 <= (-$unsigned($unsigned(reg56)));
            end
          else
            begin
              reg66 <= ($signed($signed($unsigned((reg50 ?
                  wire24 : reg64)))) <<< $unsigned(reg61));
              reg67 <= reg53;
              reg68 <= ($unsigned(reg38[(4'h9):(4'h8)]) ?
                  reg69[(3'h6):(1'h0)] : (~|$signed($unsigned(reg40[(2'h3):(2'h2)]))));
              reg69 <= {$unsigned((&((wire24 >>> reg55) > $unsigned(reg35))))};
              reg70 <= $unsigned((~^{$unsigned((wire45 ? reg51 : wire44))}));
            end
        end
    end
  assign wire72 = (8'hb3);
  assign wire73 = ($unsigned((({wire47,
                          reg36} && reg70[(1'h0):(1'h0)]) ~^ {(wire44 || reg38)})) ?
                      reg65[(1'h0):(1'h0)] : ($unsigned((~&(reg40 ?
                              reg53 : reg33))) ?
                          $unsigned(reg61[(3'h4):(1'h1)]) : {(reg70 != reg70),
                              (reg39[(1'h0):(1'h0)] - reg39)}));
  assign wire74 = reg59;
endmodule
