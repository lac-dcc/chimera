module top
#(parameter param121 = {{(-(~^(~|(8'hbe)))), ((|((8'hb3) >> (8'h9f))) - (((8'had) ~^ (8'hb2)) ? {(8'hb7), (7'h43)} : (^(8'h9c))))}, (~(({(7'h42), (8'ha8)} ? (!(8'ha6)) : ((7'h43) ? (8'hba) : (8'hb8))) ? (8'hac) : (((7'h44) ? (8'hb7) : (7'h42)) ? ((8'ha6) ? (8'hbf) : (8'h9e)) : (~^(8'hbc)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire107;
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire120,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire9,
                 wire69,
                 wire107,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ({(~&wire3), (8'hb9)} ?
          {(!wire2[(4'hc):(2'h3)])} : {((&$unsigned(wire4)) || $signed($unsigned((8'hb9)))),
              wire3[(1'h0):(1'h0)]});
      reg6 <= (^(wire1 ?
          ((wire0[(1'h0):(1'h0)] ? $unsigned((8'hba)) : (wire4 <<< (8'had))) ?
              ((wire3 ? reg5 : reg5) ?
                  (|wire1) : (^wire3)) : reg5) : {$signed((wire1 ^ (8'hbf)))}));
      reg7 <= $unsigned($unsigned($signed((reg6 ? (!wire3) : (7'h43)))));
      reg8 <= ($unsigned(((^(^wire4)) ? $unsigned((^wire0)) : (^(!wire3)))) ?
          reg6[(4'hd):(2'h2)] : ({wire1} != reg5[(2'h2):(2'h2)]));
    end
  assign wire9 = ($unsigned((reg6[(4'h9):(3'h4)] < (wire2[(4'h8):(1'h0)] << $signed(wire1)))) ?
                     reg6[(1'h1):(1'h1)] : reg7[(5'h13):(2'h2)]);
  always
    @(posedge clk) begin
      if ((8'hb2))
        begin
          reg10 <= (($signed((~(8'ha8))) > ($unsigned($signed(reg6)) == {reg8})) >>> $unsigned(({(wire0 >= (8'haf)),
              $unsigned((8'hb8))} & reg8[(2'h3):(2'h2)])));
        end
      else
        begin
          reg10 <= $signed((({wire1} ?
                  $unsigned($signed(reg10)) : $signed($unsigned(reg8))) ?
              $unsigned(((wire2 ~^ wire9) >= (wire0 >>> wire2))) : $signed($unsigned($unsigned(wire2)))));
          if (reg7[(3'h7):(3'h7)])
            begin
              reg11 <= $signed((+$unsigned(reg8)));
              reg12 <= reg8;
              reg13 <= ((8'hb8) ?
                  (reg6 > $signed(((wire4 ?
                      reg8 : wire0) | $unsigned(reg8)))) : ($unsigned(reg10) << $unsigned($unsigned(reg5[(4'hc):(3'h7)]))));
              reg14 <= reg6[(3'h6):(2'h2)];
            end
          else
            begin
              reg11 <= (($signed(((&wire0) >> (reg11 ?
                      wire1 : reg13))) & $unsigned($signed((^~wire2)))) ?
                  (^({$unsigned((7'h42)),
                      (reg7 > reg13)} >> reg10[(2'h3):(2'h2)])) : reg6);
              reg12 <= $signed(({{wire0[(2'h2):(2'h2)], (wire4 ^ (8'hb3))},
                  (+reg8[(2'h2):(1'h1)])} >> wire2));
            end
        end
      reg15 <= {reg10};
      if ((+$signed(reg8)))
        begin
          reg16 <= wire1[(1'h0):(1'h0)];
          if ((((^~({reg16} | $unsigned(wire2))) ?
              (-($signed((8'hb9)) ?
                  $unsigned((8'hb2)) : ((8'hb2) && reg16))) : {(8'hbe)}) * $unsigned(($signed((reg15 ?
              wire9 : reg10)) & wire1))))
            begin
              reg17 <= (reg6 > wire1[(4'hb):(3'h4)]);
              reg18 <= (reg15 ?
                  {(!$unsigned($signed(reg14))), wire0} : $unsigned({reg8,
                      reg11}));
              reg19 <= {wire4[(2'h3):(1'h1)]};
            end
          else
            begin
              reg17 <= (~($unsigned(((reg14 ?
                  reg5 : reg12) ^ (^~(8'hab)))) || reg12));
              reg18 <= $signed((wire2 ?
                  ((+wire9[(4'hb):(4'h8)]) ?
                      ((reg16 <<< reg6) & $signed(wire9)) : wire1[(2'h3):(2'h3)]) : ({$signed((8'hae)),
                          reg19[(4'ha):(1'h0)]} ?
                      ($signed((8'hb2)) ?
                          $signed(wire0) : $signed(reg10)) : $unsigned(reg11[(3'h7):(2'h2)]))));
              reg19 <= ({$unsigned(reg19[(4'ha):(4'h9)])} ?
                  $signed($unsigned((|{wire3}))) : $unsigned({wire0}));
              reg20 <= {((($unsigned(wire9) ?
                          reg6[(2'h3):(1'h0)] : reg16[(4'hb):(1'h0)]) ?
                      ($signed(reg14) ?
                          wire1[(4'hc):(3'h6)] : (~|reg11)) : $signed((&reg18))) >>> (~&wire2[(3'h7):(1'h1)]))};
            end
        end
      else
        begin
          reg16 <= reg6[(4'ha):(1'h1)];
          reg17 <= (reg7 ?
              (^~(&(reg13 << (reg15 ~^ reg20)))) : ($signed(reg7[(5'h12):(1'h0)]) ?
                  reg13[(1'h0):(1'h0)] : {(&(reg5 ? (8'had) : reg5)),
                      (^~$unsigned(wire9))}));
          reg18 <= reg18[(4'hb):(2'h2)];
        end
      reg21 <= (+wire3[(2'h2):(1'h1)]);
      reg22 <= ((~^((^~(^reg6)) ?
          ($unsigned(reg19) ? {reg11} : reg14[(1'h0):(1'h0)]) : ({wire4} ?
              (reg14 >> reg10) : (-wire9)))) != ((({wire4,
              wire2} || wire0[(3'h6):(2'h2)]) ?
          (reg11[(1'h1):(1'h0)] ?
              (reg11 ?
                  reg11 : reg19) : reg18[(3'h5):(1'h0)]) : wire0[(3'h6):(3'h6)]) && (({(8'hbc),
                  reg17} ?
              (!reg17) : reg20) ?
          $unsigned(reg13) : reg11[(4'h8):(4'h8)])));
    end
  module23 #() modinst70 (wire69, clk, reg8, reg18, reg14, reg5, reg21);
  module71 #() modinst108 (.wire73(reg5), .wire75(reg20), .wire74(wire1), .wire76(reg18), .clk(clk), .y(wire107), .wire72(reg7));
  assign wire109 = (reg18[(2'h2):(2'h2)] != {(($signed(reg12) ?
                               (|wire69) : {reg16}) ?
                           (+$unsigned(reg6)) : reg20),
                       $unsigned($unsigned($unsigned(wire2)))});
  assign wire110 = wire109;
  assign wire111 = {({((8'h9f) ? (reg16 - wire107) : ((8'hba) < reg12)),
                               wire107[(4'hc):(4'hc)]} ?
                           (($signed(reg15) <<< $unsigned(wire109)) & reg14) : (8'hbb))};
  assign wire112 = wire1[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      if (((!$unsigned(reg15[(4'ha):(2'h3)])) + wire111))
        begin
          reg113 <= $unsigned((8'hbf));
          reg114 <= ({$signed(reg14), (7'h43)} ?
              (+wire4) : reg13[(3'h7):(2'h3)]);
        end
      else
        begin
          reg113 <= reg11;
        end
      reg115 <= (~&(^(reg16 ? $signed(wire9) : ($signed(wire111) - (^reg11)))));
      reg116 <= $unsigned((+(reg20[(2'h2):(2'h2)] ?
          wire2[(3'h4):(2'h2)] : $unsigned((reg20 ^ reg17)))));
      if ((7'h40))
        begin
          reg117 <= wire3;
          reg118 <= (+{{$unsigned(wire3)},
              (($signed(wire69) ?
                  {reg18,
                      (7'h44)} : reg6[(4'h8):(2'h2)]) == (~|$unsigned((8'hb2))))});
          reg119 <= ((reg117[(4'ha):(4'ha)] & (($unsigned(reg118) ?
                  reg19[(4'hb):(1'h1)] : ((8'ha4) - (8'h9f))) - (reg21 ?
                  $signed(reg14) : (+wire107)))) ?
              wire9 : ((((+reg17) ^~ $signed(reg7)) ^ reg8[(5'h12):(2'h2)]) ?
                  $signed(wire111) : ((!(reg11 << reg7)) <= $unsigned((8'hb0)))));
        end
      else
        begin
          reg117 <= $signed(((~&reg15) ?
              {$signed(wire111[(4'hf):(3'h7)]),
                  (wire109 ? {reg115} : (~|reg117))} : reg6));
          reg118 <= (^(~^(reg113[(2'h2):(2'h2)] ?
              reg13[(2'h2):(2'h2)] : (8'ha5))));
          reg119 <= reg16[(5'h12):(3'h4)];
        end
    end
  assign wire120 = $unsigned($unsigned(($signed((reg19 <<< (8'hb1))) >>> $signed(wire110[(3'h6):(2'h3)]))));
endmodule

module module71  (y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire76;
  input wire [(4'he):(1'h0)] wire75;
  input wire signed [(4'he):(1'h0)] wire74;
  input wire [(5'h10):(1'h0)] wire73;
  input wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire77;
  assign y = {wire106, wire104, wire80, wire79, wire78, wire77, (1'h0)};
  assign wire77 = wire73[(1'h1):(1'h1)];
  assign wire78 = $signed($signed(wire73));
  assign wire79 = (^wire74[(4'hc):(3'h6)]);
  assign wire80 = $signed($signed(((~(~^wire74)) ?
                      ((~^wire76) & (wire74 ? wire72 : wire76)) : (&wire79))));
  module81 #() modinst105 (.wire82(wire76), .wire83(wire75), .clk(clk), .wire85(wire79), .y(wire104), .wire84(wire77));
  assign wire106 = wire74;
endmodule

module module23  (y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire67;
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  assign y = {wire29,
                 wire30,
                 wire40,
                 wire41,
                 wire67,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = wire26;
  assign wire30 = (((wire28 ? $unsigned((wire28 ? wire26 : (7'h44))) : wire25) ?
                          wire28 : $unsigned((wire24[(5'h12):(3'h5)] + (-wire28)))) ?
                      (wire26 < wire25[(1'h1):(1'h1)]) : ($signed(wire29) || {wire28}));
  always
    @(posedge clk) begin
      reg31 <= wire28[(1'h0):(1'h0)];
      if ($signed(($signed((|(-wire30))) ?
          $signed(wire27[(4'hc):(2'h2)]) : ($signed($signed(wire27)) ?
              $unsigned(reg31[(3'h5):(1'h1)]) : $signed({wire29})))))
        begin
          reg32 <= ((wire28 + ($signed((wire29 * (8'hba))) ?
              ((wire24 ? wire29 : wire26) ?
                  wire27[(4'h8):(3'h7)] : (wire29 ?
                      wire26 : wire27)) : ({wire29} | (~|wire26)))) ^ (wire27[(1'h1):(1'h1)] ?
              $unsigned((wire30[(3'h4):(1'h0)] ?
                  wire30 : (wire29 ^ wire25))) : $unsigned({$signed(wire29),
                  (~&wire27)})));
          if (((~^((^~(wire24 ? wire27 : wire29)) << ({reg32} ?
              (+(8'ha9)) : (reg31 ?
                  wire28 : wire30)))) <<< reg31[(1'h0):(1'h0)]))
            begin
              reg33 <= $unsigned((wire26[(2'h2):(2'h2)] ?
                  (($unsigned(reg31) ?
                      (-wire26) : (wire24 ?
                          wire26 : wire27)) && wire27) : wire24[(3'h4):(2'h2)]));
              reg34 <= {$signed(wire26[(2'h2):(1'h0)]),
                  $unsigned({($signed(wire24) ?
                          $unsigned(reg32) : (wire24 - wire27)),
                      $unsigned((&wire30))})};
              reg35 <= $unsigned((wire28[(1'h0):(1'h0)] ?
                  ($unsigned($unsigned(wire30)) > wire28) : (-wire27[(3'h4):(1'h0)])));
              reg36 <= $signed({reg31[(1'h0):(1'h0)], $signed(reg35)});
              reg37 <= $signed((reg31 ? reg36 : (8'haf)));
            end
          else
            begin
              reg33 <= reg35;
              reg34 <= ($signed($unsigned($unsigned(reg35[(2'h2):(2'h2)]))) - {(((8'hac) <= (reg31 ?
                          reg31 : wire29)) ?
                      (!$unsigned(reg33)) : ({reg34,
                          reg32} - $unsigned(reg33)))});
              reg35 <= $signed(((!wire29[(1'h1):(1'h0)]) ?
                  ($unsigned(wire24[(4'hd):(4'hd)]) ?
                      reg31[(4'hc):(3'h6)] : wire30[(4'h8):(3'h6)]) : ($unsigned($unsigned(reg32)) > wire30)));
            end
        end
      else
        begin
          if (({reg33[(3'h4):(2'h2)], wire24} << $unsigned(wire27)))
            begin
              reg32 <= {$unsigned(((reg35 ? (~&wire29) : (-wire30)) ?
                      reg36 : (|wire26[(2'h3):(1'h0)]))),
                  $unsigned($unsigned(($signed(reg36) + {wire26})))};
              reg33 <= $unsigned($unsigned($unsigned(({wire28, (8'had)} ?
                  (&wire26) : $signed(wire24)))));
            end
          else
            begin
              reg32 <= $unsigned(((~$signed((reg31 >>> reg32))) | (8'hae)));
              reg33 <= (~|wire25);
              reg34 <= wire30[(2'h3):(1'h1)];
            end
        end
      reg38 <= $signed((+((!$unsigned(reg34)) ?
          $signed($unsigned(wire29)) : (~{reg36, wire25}))));
      reg39 <= $signed((7'h44));
    end
  assign wire40 = (&($signed($signed((~&reg31))) ?
                      reg32[(1'h1):(1'h1)] : (wire27[(4'hd):(1'h0)] * ((wire27 ?
                              wire24 : wire29) ?
                          wire27[(4'hd):(1'h1)] : $unsigned(wire25)))));
  assign wire41 = $unsigned($signed($signed((wire25 ?
                      (reg38 ? wire24 : wire26) : wire40[(2'h2):(1'h1)]))));
  module42 #() modinst68 (wire67, clk, reg36, wire24, reg38, wire27, wire25);
endmodule

module module42
#(parameter param65 = (~(~^{(((8'hab) ^~ (8'hb8)) << ((8'ha3) ? (8'hbb) : (8'hb9)))})), 
parameter param66 = param65)
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire48 = (~^wire46[(2'h2):(1'h1)]);
  assign wire49 = (!(^((wire45[(1'h0):(1'h0)] ?
                      $unsigned(wire44) : (+wire45)) == wire47[(4'hc):(2'h3)])));
  always
    @(posedge clk) begin
      reg50 <= (wire45[(2'h2):(1'h0)] != (~^((-$unsigned(wire44)) || (~|{wire45,
          wire43}))));
      reg51 <= (reg50 ?
          wire46 : (($unsigned($unsigned(wire45)) ?
              wire43[(1'h1):(1'h1)] : (^~(+reg50))) <<< wire45));
    end
  always
    @(posedge clk) begin
      reg52 <= (($signed(($signed((8'hbf)) & $unsigned(wire49))) ?
          {$unsigned(wire43),
              (((8'hb9) - wire44) == (wire43 * wire47))} : $unsigned({(wire43 | wire44),
              $unsigned(reg50)})) <<< {wire46[(1'h0):(1'h0)]});
      reg53 <= $signed(((~&{$unsigned(reg51)}) ?
          $signed({(~reg51), $unsigned((8'hb8))}) : $unsigned((wire44 ?
              $signed(wire47) : $signed(wire43)))));
      reg54 <= $unsigned(($unsigned($unsigned({(8'ha0)})) ?
          $signed((((8'ha9) <= reg53) | {(8'ha1)})) : (~|wire49[(1'h1):(1'h1)])));
    end
  assign wire55 = reg54;
  assign wire56 = $unsigned($unsigned((wire47[(3'h4):(1'h0)] ?
                      (wire47[(3'h5):(3'h4)] ?
                          $signed(wire47) : (wire55 ^~ (8'ha2))) : ((wire49 & wire44) * $unsigned(reg52)))));
  assign wire57 = $unsigned($signed({$unsigned(reg53[(4'h8):(3'h5)]), wire46}));
  assign wire58 = ({(wire46 ? wire49 : (wire56[(1'h1):(1'h1)] ^~ (^(8'ha1)))),
                      ({(wire48 ? (7'h40) : reg53)} & ((reg54 ?
                              wire47 : wire43) ?
                          (^~wire45) : (|(7'h43))))} && $signed(reg52));
  assign wire59 = wire49[(3'h6):(1'h0)];
  assign wire60 = wire47[(3'h5):(2'h3)];
  assign wire61 = $unsigned((((wire49 ? (~|wire45) : wire59) ?
                          $unsigned((~&wire55)) : ($unsigned(wire59) ?
                              {wire56, wire56} : (&reg53))) ?
                      (!(|$signed(wire47))) : $signed(wire57)));
  assign wire62 = {$unsigned($signed(wire60[(3'h5):(1'h1)])),
                      (^wire56[(1'h1):(1'h1)])};
  assign wire63 = ((((~&wire58[(4'h9):(2'h2)]) ?
                          {(wire55 ? reg51 : wire55)} : (-((8'hb4) ?
                              wire59 : wire49))) ?
                      {$signed((+wire59))} : {$signed((wire49 ?
                              (8'hbd) : (8'hb7))),
                          $signed($signed(reg52))}) <= (wire46[(3'h4):(3'h4)] + wire59));
  assign wire64 = (~|wire62[(4'hf):(3'h4)]);
endmodule

module module81
#(parameter param103 = (^~(((~^(&(8'hb1))) ? (^((8'h9f) ? (7'h43) : (8'hb2))) : (((8'ha6) + (8'hbb)) ? ((8'hba) ? (8'hbd) : (8'ha3)) : ((8'hb7) ^ (7'h44)))) ^ (+(((7'h40) ? (8'hac) : (8'ha7)) << ((8'hbc) >> (8'hbf)))))))
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  input wire [(4'he):(1'h0)] wire83;
  input wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire86;
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
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
                 reg87,
                 (1'h0)};
  assign wire86 = wire84[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg87 <= (&(8'hbd));
    end
  assign wire88 = ($signed($signed(((wire85 ?
                          wire85 : wire83) < (reg87 - wire84)))) ?
                      $unsigned($signed($signed((wire86 ?
                          reg87 : reg87)))) : {$signed($unsigned(wire84)),
                          ($signed(wire82[(4'hf):(3'h7)]) ?
                              $signed((wire82 ? reg87 : wire82)) : {(~&wire82),
                                  (wire84 << wire82)})});
  assign wire89 = reg87;
  assign wire90 = wire88;
  always
    @(posedge clk) begin
      reg91 <= (wire83[(3'h5):(2'h3)] <= wire83[(3'h6):(3'h5)]);
      reg92 <= reg87[(3'h4):(2'h2)];
      if ({$unsigned(reg87),
          (($signed($unsigned(reg92)) ?
                  $unsigned((reg92 ? reg91 : wire84)) : reg87) ?
              (((reg87 ?
                  wire86 : wire83) >>> wire83) << {((8'ha3) * (7'h41))}) : reg91[(1'h1):(1'h1)])})
        begin
          reg93 <= $unsigned($unsigned(((+reg91[(1'h1):(1'h1)]) ?
              {(8'hb9), reg87[(1'h0):(1'h0)]} : (~&(wire83 ?
                  (8'hb0) : wire86)))));
        end
      else
        begin
          reg93 <= (|$unsigned(wire88));
          if ({((wire84 ?
                  {((7'h43) ^~ (8'hbd))} : $signed((reg93 ?
                      reg93 : (8'hbe)))) << wire85[(5'h12):(1'h1)]),
              (~reg93)})
            begin
              reg94 <= reg92[(2'h2):(1'h0)];
              reg95 <= ({((8'hb8) ?
                          $unsigned(((8'had) == wire90)) : $unsigned((^reg94))),
                      (wire89 || (reg91[(1'h0):(1'h0)] ?
                          wire82[(4'hb):(4'ha)] : $signed(reg91)))} ?
                  reg93[(1'h1):(1'h0)] : reg87);
              reg96 <= ($unsigned((-$signed($unsigned(wire84)))) ?
                  (~|({wire90,
                      $unsigned(wire85)} > wire82[(3'h4):(2'h3)])) : $signed($signed({(wire89 + reg87),
                      $signed(wire82)})));
              reg97 <= (wire85 == $unsigned(wire89[(3'h5):(3'h5)]));
              reg98 <= (($unsigned($unsigned((7'h44))) + wire88) << reg94[(2'h3):(1'h0)]);
            end
          else
            begin
              reg94 <= ({((^~$unsigned(reg98)) >> (8'hb0))} ?
                  (8'ha5) : $unsigned((~^((~&wire86) ?
                      (wire86 ? (8'hab) : wire84) : ((8'hb3) | reg92)))));
            end
          reg99 <= (8'hae);
          reg100 <= reg91[(1'h1):(1'h1)];
        end
    end
  assign wire101 = $unsigned(wire86);
  assign wire102 = {wire90,
                       ((~$unsigned((-reg98))) ?
                           $unsigned($signed($unsigned((8'h9d)))) : $signed((((8'ha8) ^~ wire83) ?
                               (reg92 >> reg93) : (wire85 || wire88))))};
endmodule
