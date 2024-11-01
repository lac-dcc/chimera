module top
#(parameter param120 = (-({(&((8'hba) || (8'hb2))), {(^(7'h40))}} ? ((8'hb9) + (((8'hb1) & (8'hb5)) == ((8'hb4) ? (8'hb3) : (7'h40)))) : ((((8'hb1) ^ (8'ha5)) ? ((7'h44) ? (7'h40) : (8'ha4)) : ((7'h43) != (8'hac))) ? {((8'haf) ? (7'h43) : (8'hb0)), {(8'ha1)}} : (+((8'hb6) ^ (8'hbc)))))), 
parameter param121 = (+((^(param120 ? (param120 ? param120 : param120) : (~param120))) >> (((~&param120) >>> param120) >= param120))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire101,
                 wire38,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg8,
                 reg9,
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
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $unsigned((|$signed(wire1[(3'h4):(2'h2)])));
  assign wire6 = wire2[(2'h3):(2'h3)];
  assign wire7 = (!((((wire4 <<< wire5) ?
                     $signed(wire5) : wire5[(5'h10):(1'h0)]) * (&$unsigned(wire0))) ^~ ($unsigned($signed(wire0)) == $unsigned(wire6))));
  always
    @(posedge clk) begin
      if (($unsigned((8'hae)) > wire2[(1'h0):(1'h0)]))
        begin
          reg8 <= $signed((wire0 >>> {(8'hab)}));
        end
      else
        begin
          reg8 <= (((({wire4, (8'ha1)} ?
                          (wire4 | wire0) : (wire6 ? wire0 : (8'hac))) ?
                      wire4[(2'h3):(2'h3)] : (-$signed(wire3))) ?
                  $unsigned({(reg8 > wire0)}) : (^~(((8'haa) ? wire7 : reg8) ?
                      (!(8'hb1)) : (~^wire7)))) ?
              (!wire2) : wire6);
          if ((~|((^$signed((^(8'ha6)))) ?
              $unsigned(((wire7 ? wire1 : (8'hab)) ?
                  wire5[(3'h4):(1'h1)] : (wire2 ?
                      wire0 : wire3))) : wire7[(3'h4):(2'h3)])))
            begin
              reg9 <= (($unsigned((wire5[(4'h9):(4'h9)] ?
                          $unsigned(wire5) : (~^reg8))) ?
                      wire3 : {$signed($signed((8'h9f))),
                          $signed($unsigned(wire4))}) ?
                  ((((-wire0) - ((8'h9f) ? wire6 : (7'h44))) ?
                      (8'hbb) : wire2) != (((~&wire3) ?
                          (!wire2) : (wire2 ? wire3 : wire6)) ?
                      $signed((8'hab)) : (wire1 && (wire7 ?
                          wire5 : wire0)))) : {((wire6 << (wire3 > wire2)) ?
                          {{wire5}, wire4[(2'h2):(1'h0)]} : wire4),
                      ($signed((wire4 ? wire3 : wire0)) && wire1)});
              reg10 <= ($signed(($signed(wire6[(4'ha):(1'h1)]) ?
                      wire2[(2'h3):(1'h0)] : (~&(wire7 <= wire1)))) ?
                  wire2 : wire5[(3'h4):(1'h0)]);
              reg11 <= {wire1};
              reg12 <= {wire4};
            end
          else
            begin
              reg9 <= {wire3};
              reg10 <= ((+(((!reg9) & wire2[(1'h0):(1'h0)]) ?
                      {reg11[(1'h0):(1'h0)]} : reg9[(3'h4):(1'h1)])) ?
                  {{$unsigned((wire3 ? wire3 : reg9))},
                      {((wire2 > (7'h40)) <<< wire3[(3'h4):(1'h1)]),
                          reg10[(3'h6):(1'h0)]}} : $unsigned((8'hb5)));
              reg11 <= $signed(wire1);
              reg12 <= (~&wire3[(3'h5):(1'h0)]);
              reg13 <= ({{wire0[(1'h0):(1'h0)], $signed((+wire7))},
                      wire3[(2'h3):(2'h3)]} ?
                  $unsigned({(wire7 ? (8'hbd) : reg11),
                      $signed((wire6 ^~ reg12))}) : $unsigned(reg9));
            end
          reg14 <= (wire7 ^ wire3[(4'h8):(3'h6)]);
          if ((~&(reg11 ?
              $unsigned(reg10[(1'h0):(1'h0)]) : $signed($unsigned(((8'hb6) & wire4))))))
            begin
              reg15 <= $unsigned(wire1);
              reg16 <= $unsigned($signed($unsigned(((wire0 * wire3) != wire1[(5'h11):(3'h5)]))));
              reg17 <= (wire0[(4'he):(3'h4)] ? (|reg14) : reg16[(3'h7):(1'h1)]);
            end
          else
            begin
              reg15 <= $signed(((reg8 ? (8'hae) : reg13[(4'hb):(3'h7)]) ?
                  ({wire2} + $signed((wire6 * reg10))) : {(((8'hb3) ~^ wire7) ?
                          (wire2 * wire6) : $signed(reg14))}));
              reg16 <= (~$signed(wire0[(3'h6):(1'h0)]));
              reg17 <= reg17[(1'h1):(1'h1)];
              reg18 <= (wire4[(2'h3):(2'h2)] ?
                  {(|{wire0[(4'h8):(1'h1)]}),
                      $unsigned(((-wire0) == $signed(wire4)))} : wire6);
              reg19 <= $signed((((!$signed(wire7)) ?
                  wire6[(4'h9):(3'h7)] : $unsigned((8'h9c))) && ($unsigned((reg10 ?
                  reg18 : wire0)) || reg15)));
            end
          if (wire6[(4'hd):(2'h2)])
            begin
              reg20 <= $unsigned((~|$unsigned((!(reg17 ? (8'hab) : reg15)))));
            end
          else
            begin
              reg20 <= ($signed((wire1[(1'h1):(1'h1)] ?
                      wire3 : $signed(((8'hb3) ? reg16 : reg18)))) ?
                  $unsigned($unsigned($unsigned(reg17))) : $signed({$unsigned((reg17 >>> (8'hbc))),
                      $unsigned(reg18)}));
              reg21 <= (({$signed((-wire6))} ?
                      $unsigned((~$unsigned((8'hbd)))) : {(8'hb0), reg20}) ?
                  (&reg14[(2'h2):(1'h1)]) : reg13);
              reg22 <= reg18;
              reg23 <= (reg12[(1'h0):(1'h0)] ?
                  (~(~&(wire3 >>> wire4[(2'h3):(1'h0)]))) : $unsigned(({(reg8 ?
                              reg21 : (8'hac))} ?
                      {(reg16 ? wire5 : reg22)} : ((reg20 ? reg22 : reg10) ?
                          reg14 : reg14))));
              reg24 <= {$signed((+($signed(reg10) ?
                      (wire2 ? reg20 : (8'ha0)) : (wire5 ? wire0 : wire6)))),
                  (~|((!(reg8 ? wire1 : wire2)) >= $unsigned((8'had))))};
            end
        end
    end
  module25 #() modinst39 (wire38, clk, wire2, reg19, reg24, wire1);
  module40 #() modinst102 (wire101, clk, reg13, wire38, reg17, wire0, reg10);
  assign wire103 = reg23;
  assign wire104 = reg13;
  always
    @(posedge clk) begin
      reg105 <= $unsigned({(wire4 ?
              $signed($unsigned(reg9)) : reg13[(1'h1):(1'h0)]),
          ($signed((+reg14)) == $signed($signed((8'ha0))))});
      reg106 <= (($signed(wire3) ^~ wire0) - {$signed(wire6),
          ((-(-reg18)) <= $signed((~&wire38)))});
      if ((reg106 ?
          {$signed(((~^reg20) ^~ (~^wire4)))} : (wire101[(4'ha):(1'h0)] ?
              ($unsigned((reg106 ?
                  (8'h9f) : wire1)) & (reg105[(2'h3):(1'h1)] < ((8'hbe) << reg16))) : (^~$signed($signed(wire101))))))
        begin
          reg107 <= (~wire103[(4'ha):(1'h1)]);
          reg108 <= (~|($signed((reg22[(4'h9):(3'h4)] ?
              $signed(reg11) : $signed(reg21))) - (-((~^wire2) ?
              (reg107 | reg21) : (wire2 ? reg24 : reg10)))));
          reg109 <= ((($unsigned({(8'h9d),
              reg18}) ~^ (!(+wire104))) >> (wire7 + reg13)) && reg106[(1'h1):(1'h0)]);
          reg110 <= ($signed((wire5[(4'hc):(1'h1)] & $signed((^reg17)))) * (~^reg12));
          reg111 <= reg14[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned((reg106[(3'h5):(3'h4)] <= reg108)))
            begin
              reg107 <= reg108[(3'h5):(2'h3)];
              reg108 <= ($unsigned((~&reg13)) != (^(^~(~$signed(wire3)))));
              reg109 <= ($unsigned($signed({$signed(reg105)})) ?
                  ((&wire4[(2'h3):(1'h1)]) < $unsigned(reg106[(1'h1):(1'h1)])) : ((~&((!reg21) ?
                      {reg8} : reg8[(3'h4):(3'h4)])) != $unsigned($unsigned(wire4))));
            end
          else
            begin
              reg107 <= ({(reg9[(3'h5):(2'h3)] ?
                          ($unsigned(wire104) ^ (reg23 <<< reg19)) : ((~reg110) ?
                              (^reg8) : reg22[(3'h4):(1'h0)]))} ?
                  {(reg22[(4'h9):(1'h0)] | reg22[(1'h0):(1'h0)])} : $signed((&($signed(wire3) ?
                      reg12 : {(8'hb5), reg14}))));
              reg108 <= ($unsigned(wire38) ?
                  ($signed(wire1) & reg17) : (|(reg105[(5'h11):(1'h0)] >> $signed(wire38))));
              reg109 <= (8'haa);
            end
          if (reg16)
            begin
              reg110 <= ((((~^reg24) ?
                          $unsigned({reg19, reg21}) : $signed((+reg110))) ?
                      ((!(^(8'hbb))) ?
                          {$unsigned((8'ha0))} : $unsigned((~|wire103))) : (^$unsigned(reg8[(3'h4):(1'h0)]))) ?
                  (8'had) : $unsigned($signed((^$unsigned(reg23)))));
              reg111 <= ({$unsigned($unsigned($unsigned(wire3)))} ?
                  ((-$unsigned(wire38)) ?
                      ($signed((~&wire2)) == {$unsigned((8'h9d)),
                          (wire103 ?
                              reg9 : (8'ha5))}) : wire1) : (&$signed({(^~reg10)})));
            end
          else
            begin
              reg110 <= reg13;
              reg111 <= $unsigned(reg9);
              reg112 <= $unsigned((8'hb6));
            end
          reg113 <= {reg13[(4'hf):(3'h5)]};
        end
      if ($unsigned({{wire0, $signed((reg8 >= reg113))}}))
        begin
          reg114 <= $signed($signed($signed($signed((reg12 < wire6)))));
          reg115 <= ($signed(($signed((reg16 ? wire5 : reg20)) ?
                  $unsigned((reg114 ? wire101 : wire5)) : $signed((reg113 ?
                      reg112 : (8'hb4))))) ?
              (-$signed(reg13[(3'h5):(1'h1)])) : $signed($unsigned(wire6[(1'h1):(1'h0)])));
          reg116 <= reg111;
          reg117 <= {(($signed($signed((8'ha2))) ?
                      (~^$signed((8'ha2))) : {(reg12 ? (8'ha3) : reg8)}) ?
                  reg24 : $unsigned(reg9))};
        end
      else
        begin
          reg114 <= reg18[(4'he):(1'h0)];
          if ($unsigned((~(&$signed($unsigned(reg109))))))
            begin
              reg115 <= (~(wire101[(1'h0):(1'h0)] - ($signed(reg115) ?
                  reg108[(3'h4):(2'h2)] : $signed(reg115))));
              reg116 <= $unsigned((reg114[(1'h1):(1'h1)] <<< $unsigned(reg10[(3'h7):(1'h1)])));
              reg117 <= ((7'h44) + (8'ha0));
              reg118 <= {(&reg116)};
            end
          else
            begin
              reg115 <= ((((((8'h9f) ? (8'ha5) : reg20) ?
                      (wire104 >> reg113) : wire38[(4'h8):(1'h1)]) && {$unsigned(wire5),
                      (reg20 ?
                          reg115 : wire38)}) <= $unsigned($signed($signed(reg105)))) ?
                  wire101 : $signed((|({reg107, reg112} != (^reg24)))));
              reg116 <= (wire38[(2'h3):(1'h1)] || $signed((((!wire7) ?
                  $signed(wire3) : (reg16 ^ reg8)) <<< (+reg109[(1'h0):(1'h0)]))));
              reg117 <= reg106;
              reg118 <= ((~&$unsigned($signed((^reg106)))) ?
                  ($signed((~&reg12[(1'h1):(1'h1)])) ?
                      {{(~reg105), {reg114}}} : ({(~wire4)} ?
                          (8'had) : ($signed(wire103) ?
                              (+wire7) : (reg107 ?
                                  wire103 : wire5)))) : reg20[(2'h3):(1'h0)]);
            end
          reg119 <= $signed($unsigned(($unsigned((wire3 ?
              reg12 : wire1)) * $unsigned((reg106 ? reg118 : reg107)))));
        end
    end
endmodule

module module40
#(parameter param99 = (((+{{(7'h42), (8'hb2)}, (^~(8'haa))}) ? ((^~{(7'h43)}) ~^ (8'hba)) : ((8'hbb) - (((8'h9f) & (8'hb6)) ? (~(8'hbd)) : ((8'ha5) ? (8'hbb) : (8'ha9))))) ? {(~&{((8'hae) ? (8'hb5) : (8'ha4)), (^~(7'h40))})} : {(~^(((8'hb7) ? (8'hb8) : (7'h41)) <<< {(8'hb0)}))}), 
parameter param100 = (!(({(param99 ? param99 : param99)} & ((&param99) ? param99 : {param99})) ? ((((8'ha4) ? (8'hab) : param99) ? (+param99) : param99) ? ((param99 & param99) >> (param99 ? param99 : (8'hb1))) : param99) : param99)))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  input wire [(5'h15):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire92;
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire63,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire65,
                 wire92,
                 reg94,
                 (1'h0)};
  assign wire46 = ($unsigned(wire42) ~^ wire44);
  assign wire47 = ($unsigned(wire43) || wire44);
  assign wire48 = (~&{(wire46 ?
                          ((^wire45) ?
                              wire44[(1'h0):(1'h0)] : wire44) : ($unsigned(wire45) <= wire42[(1'h0):(1'h0)])),
                      (((|wire44) ~^ {wire45, wire43}) ?
                          ($unsigned(wire43) <= $signed(wire45)) : (wire44[(2'h2):(1'h1)] || (wire41 ^ wire44)))});
  assign wire49 = wire41;
  module50 #() modinst64 (wire63, clk, wire41, wire45, wire43, wire46, wire49);
  assign wire65 = $signed($signed((wire48[(1'h1):(1'h1)] ?
                      (wire48[(3'h7):(3'h6)] ?
                          wire63 : (wire49 & wire47)) : $signed(wire48))));
  module66 #() modinst93 (.wire68(wire43), .wire70(wire49), .wire71(wire47), .wire67(wire45), .clk(clk), .wire69(wire42), .y(wire92));
  always
    @(posedge clk) begin
      reg94 <= ($signed((~^$signed(wire63))) ?
          ((-(~^wire92[(4'h9):(2'h2)])) + (~|wire41)) : (+wire41[(1'h0):(1'h0)]));
    end
  assign wire95 = wire48;
  assign wire96 = {((((reg94 ? wire92 : wire41) || (wire63 != (8'ha1))) ?
                              {$unsigned(wire48),
                                  wire43} : $signed($unsigned((8'ha7)))) ?
                          $unsigned($unsigned(wire47)) : (({wire42,
                                  wire43} << (wire95 - wire44)) ?
                              {(&wire63)} : (wire49 ?
                                  (^~wire44) : $unsigned(wire45))))};
  assign wire97 = (((|((wire96 << wire44) > wire63)) ?
                          $unsigned({$signed(wire49)}) : $signed(wire45[(4'ha):(3'h7)])) ?
                      $signed(wire41[(4'ha):(1'h0)]) : ($unsigned($signed((wire41 >> wire49))) < $signed(($unsigned(wire96) ?
                          wire46[(5'h12):(4'he)] : (wire42 ?
                              wire47 : wire65)))));
  assign wire98 = $unsigned($unsigned($signed(wire48[(4'hc):(2'h2)])));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire30;
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire30,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = ($unsigned(wire27[(3'h4):(1'h0)]) ?
                      ($signed((^wire28[(1'h0):(1'h0)])) <<< ((((8'hbb) ?
                              wire26 : (8'hb2)) ?
                          wire26[(4'h8):(3'h4)] : (wire27 ?
                              (8'hb3) : wire28)) ~^ wire29[(5'h12):(3'h5)])) : {$signed(wire28)});
  always
    @(posedge clk) begin
      reg31 <= {wire27};
      reg32 <= wire26;
      reg33 <= wire28[(4'h8):(3'h6)];
      reg34 <= ($signed((8'h9d)) && reg32[(4'ha):(2'h2)]);
    end
  assign wire35 = reg34[(1'h0):(1'h0)];
  assign wire36 = $unsigned($signed(({$signed((8'h9f))} ^ wire26)));
  assign wire37 = ($signed((+(&(&wire28)))) >> (-reg31));
endmodule

module module66
#(parameter param91 = ({(~&((+(8'hac)) ? ((8'hbf) ^ (8'hb8)) : ((8'hb4) >>> (8'hbb)))), ((((8'h9e) ? (8'ha4) : (8'hbb)) ? (!(7'h41)) : {(8'hb4), (7'h44)}) ? (~^(&(7'h43))) : (((8'hb5) ? (8'hb3) : (8'ha1)) ? ((8'hb8) ? (8'ha5) : (8'h9c)) : ((8'hbb) ? (8'ha6) : (8'h9f))))} < (((|(8'hb1)) ? (^~((8'ha7) ? (8'ha7) : (8'hab))) : (~&((8'ha3) && (8'hb9)))) ? ((8'haf) ? ((!(8'h9c)) >> (8'hbe)) : {((8'ha7) ? (8'hb5) : (8'hab))}) : ((~&(~^(7'h43))) ? ({(8'h9d), (8'hbc)} ? ((8'h9d) ? (8'hbc) : (8'haf)) : (^(8'hae))) : (((8'ha9) ? (8'ha7) : (8'hbd)) | ((7'h42) ^~ (8'hb6)))))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire signed [(5'h11):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire signed [(5'h15):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire73,
                 wire72,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire72 = wire71;
  assign wire73 = ((~wire69[(2'h3):(1'h1)]) ?
                      (~wire69[(4'hd):(4'h9)]) : {({((8'hb3) ?
                                      wire70 : wire70)} ?
                              ($signed(wire72) ?
                                  (8'hbf) : (wire67 ?
                                      wire70 : wire72)) : (~(~&wire68)))});
  always
    @(posedge clk) begin
      reg74 <= $unsigned(((~({wire70} ? wire67 : wire73)) > $signed(wire68)));
      reg75 <= $signed($unsigned($signed((8'ha9))));
      reg76 <= (&((-wire70) && wire71));
    end
  assign wire77 = $unsigned($signed($unsigned(wire72)));
  assign wire78 = (wire71[(3'h7):(3'h6)] ^ {$signed(wire68[(4'h9):(1'h1)])});
  always
    @(posedge clk) begin
      reg79 <= (8'ha7);
      reg80 <= $signed((((&(wire73 ? wire69 : wire69)) ?
              (7'h40) : ($unsigned(reg75) ?
                  (wire68 ? wire73 : wire71) : $unsigned(reg74))) ?
          (8'hbb) : (^wire71)));
      reg81 <= reg79[(1'h0):(1'h0)];
      reg82 <= wire68[(2'h3):(2'h2)];
      reg83 <= {wire77[(3'h7):(2'h3)]};
    end
  always
    @(posedge clk) begin
      reg84 <= $signed((reg81[(1'h0):(1'h0)] ? (8'ha0) : wire77));
    end
  assign wire85 = reg76;
  assign wire86 = (reg79 != $signed((reg74[(2'h2):(1'h1)] ^~ (8'hb8))));
  assign wire87 = wire78;
  assign wire88 = $signed($signed({reg75[(1'h1):(1'h1)], wire85}));
  assign wire89 = $signed((reg74 ?
                      $unsigned($signed((-wire86))) : $signed($unsigned((^reg76)))));
  assign wire90 = wire72[(3'h4):(2'h3)];
endmodule

module module50
#(parameter param61 = ((((((8'h9e) ? (8'h9e) : (8'ha3)) + ((8'ha1) >= (8'ha1))) != ({(8'hb9)} >>> {(8'hbb), (8'hba)})) ? ((^(~&(8'h9f))) ? (((8'ha8) > (8'hb9)) ? ((8'hba) ? (8'hb6) : (8'hb5)) : (!(8'ha9))) : (~((8'hb4) | (8'hae)))) : (|{{(8'ha4)}, (~&(8'ha2))})) ^ (((8'hb6) ? (8'h9e) : (~((8'ha6) ? (8'hae) : (8'hb6)))) ? ((((8'hb1) <<< (8'hae)) ? (8'hb9) : ((8'hab) ? (8'ha5) : (8'hb4))) | (((8'hb2) - (8'hbd)) ~^ ((8'had) ? (8'haf) : (8'hb0)))) : ((+((8'hba) >>> (8'ha6))) ? (^((8'hae) ? (8'ha4) : (8'hb6))) : (8'hb4)))), 
parameter param62 = ((^param61) != (((^~(param61 - param61)) ? (-(~|param61)) : (&param61)) <= (-{{param61}, (8'ha2)}))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire55;
  input wire signed [(3'h4):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(5'h13):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  assign y = {wire60, wire59, wire58, wire57, wire56, (1'h0)};
  assign wire56 = wire55[(2'h3):(1'h1)];
  assign wire57 = $unsigned($signed((($unsigned(wire56) ?
                          (|(8'ha9)) : $unsigned(wire54)) ?
                      wire51[(2'h3):(1'h1)] : (wire52 > $signed((8'ha9))))));
  assign wire58 = wire52[(4'he):(1'h0)];
  assign wire59 = $unsigned((wire55 ?
                      $signed($unsigned($unsigned(wire55))) : wire53));
  assign wire60 = (wire51 ? wire51 : wire56[(1'h1):(1'h0)]);
endmodule
