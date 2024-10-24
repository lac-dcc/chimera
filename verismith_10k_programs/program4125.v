module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire174, wire172, wire106, wire104, wire88, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((7'h42));
  assign wire5 = (|((^(((8'ha1) >>> wire1) ? {wire4, wire3} : {(8'h9d)})) ?
                     $signed((wire3 < (wire3 <<< wire4))) : wire3));
  module6 #() modinst89 (.wire9(wire0), .y(wire88), .clk(clk), .wire8(wire4), .wire10(wire1), .wire7(wire2));
  module90 #() modinst105 (.wire91(wire2), .clk(clk), .y(wire104), .wire93(wire4), .wire92(wire3), .wire94(wire5));
  assign wire106 = $signed(wire1);
  module107 #() modinst173 (wire172, clk, wire0, wire106, wire88, wire4);
  assign wire174 = ($unsigned(((-wire4) ^ ((wire4 * wire5) < wire2[(4'he):(2'h3)]))) >>> wire1);
endmodule

module module107
#(parameter param171 = (~&((({(8'had)} && ((8'had) ? (8'ha8) : (7'h43))) ? ((^~(8'hac)) ? ((8'hbf) > (8'h9c)) : ((7'h42) ? (8'ha6) : (8'ha3))) : (((8'ha4) == (8'hb0)) * ((8'ha5) ? (8'hbc) : (8'hab)))) ? (-(8'hb8)) : (~^(+((8'hba) ? (8'hab) : (8'ha5)))))))
(y, clk, wire108, wire109, wire110, wire111);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire108;
  input wire [(4'hc):(1'h0)] wire109;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(5'h14):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire169;
  wire signed [(4'hb):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire [(3'h6):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(5'h10):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire161;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire161,
                 (1'h0)};
  assign wire112 = $unsigned($unsigned((~|(8'ha5))));
  assign wire113 = $unsigned(($signed(wire111) ^~ wire110[(3'h4):(2'h3)]));
  assign wire114 = wire109;
  assign wire115 = wire111[(4'h8):(1'h1)];
  module116 #() modinst162 (wire161, clk, wire109, wire111, wire110, wire114, wire113);
  assign wire163 = ($unsigned(wire113) ?
                       ((|({wire108} * wire114)) ?
                           $signed((|(^wire111))) : wire161[(5'h10):(4'h8)]) : $signed(wire161[(5'h11):(4'hc)]));
  assign wire164 = ($unsigned($unsigned($signed((wire108 ?
                       wire109 : wire163)))) ~^ $signed((~|wire109[(2'h3):(1'h1)])));
  assign wire165 = wire163;
  assign wire166 = {{wire164},
                       $unsigned($unsigned($signed(wire161[(1'h1):(1'h0)])))};
  assign wire167 = (|wire112[(1'h0):(1'h0)]);
  assign wire168 = ($unsigned($signed((~^wire167[(2'h2):(1'h1)]))) ~^ (&wire161));
  assign wire169 = ($unsigned(wire110) >= $signed(wire165[(3'h5):(2'h3)]));
  assign wire170 = (wire112 != ({wire114[(4'h9):(3'h7)], wire166} ?
                       wire114 : $signed({$unsigned(wire161),
                           (wire161 ? (8'ha8) : wire166)})));
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire94;
  input wire signed [(3'h7):(1'h0)] wire93;
  input wire signed [(3'h6):(1'h0)] wire92;
  input wire [(4'he):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire103;
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  assign y = {wire103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= {wire92[(1'h0):(1'h0)], (~(|$signed(wire93)))};
      reg96 <= $signed((~&wire91));
      reg97 <= $unsigned(wire94[(4'h9):(1'h0)]);
      reg98 <= (reg95[(2'h3):(2'h3)] * ($signed($signed({wire93, wire94})) ?
          $signed($unsigned($unsigned(reg95))) : {(+$unsigned(wire91)),
              reg97}));
    end
  always
    @(posedge clk) begin
      reg99 <= ($unsigned($signed($signed((^~reg97)))) ?
          (wire94[(3'h4):(1'h0)] >= reg95[(2'h2):(2'h2)]) : (wire93[(1'h1):(1'h0)] && reg96[(2'h2):(2'h2)]));
      reg100 <= wire91;
      reg101 <= $unsigned((8'hb2));
    end
  always
    @(posedge clk) begin
      reg102 <= (~^({reg98, $signed(((8'ha7) ? wire94 : reg97))} ?
          $signed($unsigned(((8'h9c) ? reg99 : (8'h9e)))) : reg96));
    end
  assign wire103 = $unsigned($unsigned(reg102[(4'ha):(4'ha)]));
endmodule

module module6
#(parameter param86 = {(|((!((8'hb7) ^ (8'hb6))) != (!(&(8'ha8))))), ((~|(~^((8'haa) ~^ (8'hb1)))) ? ((!(~|(8'haa))) ? ((^~(8'hb8)) << (~&(8'hb1))) : (((8'ha9) ? (8'hbd) : (8'ha2)) <<< ((8'h9f) ? (8'ha8) : (7'h44)))) : {(((8'hbe) ? (8'hb0) : (7'h40)) <<< (-(8'had)))})}, 
parameter param87 = param86)
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h22e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire11;
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire53,
                 wire44,
                 wire43,
                 wire32,
                 wire15,
                 wire11,
                 reg83,
                 reg80,
                 reg12,
                 reg13,
                 reg14,
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
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 (1'h0)};
  assign wire11 = (wire9[(1'h1):(1'h1)] ?
                      $signed(wire8) : $unsigned((wire10[(3'h4):(3'h4)] == (wire7 ?
                          (wire10 ? wire8 : (8'hba)) : (wire7 <<< wire7)))));
  always
    @(posedge clk) begin
      if ((8'h9f))
        begin
          reg12 <= wire10;
          reg13 <= ({(+reg12[(1'h0):(1'h0)]),
              (!wire8[(1'h0):(1'h0)])} || (^(|wire9[(1'h0):(1'h0)])));
        end
      else
        begin
          reg12 <= $unsigned($signed($unsigned($unsigned(((8'hbe) ?
              wire7 : wire9)))));
        end
      reg14 <= $unsigned($unsigned(wire7));
    end
  assign wire15 = {$unsigned((^~$signed($signed((8'ha8))))),
                      wire7[(5'h11):(3'h4)]};
  always
    @(posedge clk) begin
      reg16 <= {((reg12 >> (~((8'hab) >= wire10))) ?
              $unsigned(((!reg14) + (reg12 ?
                  wire9 : wire9))) : $unsigned(wire11[(3'h4):(1'h0)])),
          (reg14 ?
              wire8[(1'h1):(1'h0)] : (~|($signed((8'hbf)) ?
                  (wire9 * reg14) : reg12)))};
      reg17 <= (reg16[(3'h7):(1'h0)] >> ($signed((8'ha6)) <<< wire15[(1'h1):(1'h0)]));
      reg18 <= {((+$signed((reg16 ?
              wire8 : wire11))) < (!reg12[(3'h5):(3'h5)])),
          {(reg13 ^ {wire7[(4'hd):(4'hd)]}),
              ((&(reg14 ? wire8 : wire7)) ?
                  $signed($signed((8'hb6))) : (~&{(8'h9c), (8'ha1)}))}};
    end
  always
    @(posedge clk) begin
      reg19 <= (wire15[(1'h1):(1'h1)] >= {((8'hb3) != (8'ha1))});
      if (((reg17 > (~|((reg19 ? wire9 : wire8) ?
              (wire15 ? (8'ha1) : reg18) : (8'hbc)))) ?
          {$signed($unsigned($unsigned((7'h42)))),
              (reg16[(2'h2):(2'h2)] + ((~reg12) * reg19))} : (+((8'hbf) << $unsigned(reg16[(4'h8):(1'h1)])))))
        begin
          reg20 <= $unsigned($signed(((|(reg12 >>> reg14)) & wire7[(4'he):(4'ha)])));
          reg21 <= (8'hbb);
          reg22 <= wire7;
          reg23 <= $unsigned((~&(&reg12[(3'h4):(2'h2)])));
        end
      else
        begin
          reg20 <= $signed(((^$unsigned((reg19 < reg22))) < (~$signed(reg18[(3'h7):(1'h0)]))));
          reg21 <= ((reg20 ? wire8[(2'h2):(1'h0)] : reg14) <<< (wire15 ?
              reg16 : ({(reg12 ^ reg16)} == $signed($signed(reg13)))));
          reg22 <= ({wire11[(3'h4):(1'h1)], ($signed((~|(8'h9d))) <= reg19)} ?
              reg21[(3'h6):(2'h3)] : $unsigned($signed($signed($unsigned(reg13)))));
          if ({$signed(($signed(reg13) <= (reg14 ~^ $signed(wire8)))),
              $signed(reg22)})
            begin
              reg23 <= reg22;
              reg24 <= {reg16};
              reg25 <= wire9;
              reg26 <= (8'ha9);
            end
          else
            begin
              reg23 <= ($signed($signed($unsigned((^~(8'ha5))))) + ((~|($signed(wire11) & wire10)) ?
                  wire8 : {(^$signed((7'h41)))}));
              reg24 <= $signed((wire8 ?
                  reg25 : ((7'h40) ? reg18 : {$signed(reg19)})));
              reg25 <= $signed((reg18 ^ {((wire11 << reg18) ?
                      $signed(reg25) : (reg25 ^~ reg20)),
                  $signed($unsigned(wire10))}));
            end
          if ($unsigned(wire7))
            begin
              reg27 <= (^~reg16[(4'hd):(1'h1)]);
              reg28 <= reg13[(3'h4):(1'h0)];
              reg29 <= wire15;
              reg30 <= {(^{reg20[(2'h2):(2'h2)], reg13}), reg25[(4'hb):(4'ha)]};
              reg31 <= $unsigned($signed(reg28[(3'h4):(3'h4)]));
            end
          else
            begin
              reg27 <= $signed($unsigned(((((8'hb2) ?
                  wire8 : reg26) >> (wire8 + reg31)) || {((8'hac) ?
                      wire15 : wire8),
                  wire7[(4'h8):(3'h6)]})));
            end
        end
    end
  assign wire32 = {(~^{wire9}), {reg24[(4'hd):(2'h3)]}};
  always
    @(posedge clk) begin
      if ($signed($signed((($signed(wire9) ?
          wire11 : (8'hb4)) <= (reg23 + (reg13 == reg18))))))
        begin
          reg33 <= (8'hb7);
          reg34 <= wire15;
          reg35 <= {{reg24[(1'h0):(1'h0)]}};
          reg36 <= ((^~($signed({reg31, (8'hb8)}) ?
              ((wire10 ? reg33 : (8'hab)) ~^ {reg34}) : $unsigned(((8'h9d) ?
                  reg16 : wire7)))) - reg20);
        end
      else
        begin
          if (reg29)
            begin
              reg33 <= ((reg21 ?
                      (($unsigned((8'hb5)) ? $signed(reg20) : (~|reg36)) ?
                          $unsigned((reg17 == reg36)) : reg31) : (7'h40)) ?
                  (reg13 ?
                      $unsigned($unsigned((reg25 ?
                          (8'hb3) : reg30))) : (~|((reg25 ~^ reg26) ^ (reg22 >= reg22)))) : (~^$unsigned(((&reg25) ?
                      (reg34 ? reg22 : reg20) : ((8'hb3) <= wire15)))));
              reg34 <= reg13[(2'h3):(2'h2)];
              reg35 <= wire9[(1'h0):(1'h0)];
              reg36 <= $unsigned(reg28[(3'h6):(2'h2)]);
            end
          else
            begin
              reg33 <= reg13;
              reg34 <= (($signed($unsigned((~|reg27))) ?
                  {reg16} : (!reg30)) <= ((wire15 ?
                      (8'ha7) : (wire7[(4'he):(4'ha)] ? reg22 : reg30)) ?
                  $unsigned({$unsigned(reg20), reg30[(3'h4):(2'h2)]}) : reg17));
              reg35 <= ((reg20[(1'h0):(1'h0)] && $signed($signed({(8'hac)}))) <<< $signed($signed(reg26)));
              reg36 <= (8'hb7);
              reg37 <= ((reg16[(1'h0):(1'h0)] ?
                  ((|(reg12 ?
                      wire15 : reg28)) & $signed($signed((8'hb4)))) : (^~(~^(&wire8)))) || (~&$unsigned(wire9[(2'h2):(1'h0)])));
            end
          reg38 <= reg28;
          reg39 <= wire32[(1'h0):(1'h0)];
          reg40 <= $signed(($signed(($unsigned(reg31) ?
                  $signed(reg24) : {wire32, reg14})) ?
              reg25 : {(!reg36), (+(reg27 | reg28))}));
          reg41 <= $unsigned(wire10);
        end
      reg42 <= $signed((&(reg40 ?
          ((~|reg25) >= wire8[(1'h1):(1'h0)]) : $unsigned((~|reg28)))));
    end
  assign wire43 = (|{$signed(reg17)});
  assign wire44 = $signed($unsigned(wire15));
  always
    @(posedge clk) begin
      if ($unsigned(reg31))
        begin
          reg45 <= reg23[(3'h5):(1'h1)];
          reg46 <= wire10[(3'h6):(3'h5)];
          if (wire44[(3'h5):(3'h5)])
            begin
              reg47 <= (|$unsigned((wire11[(3'h4):(2'h3)] ?
                  (^~reg31) : reg29)));
              reg48 <= (($unsigned({(^reg41), (reg42 ? reg25 : reg28)}) ?
                      {wire8[(2'h3):(1'h1)]} : $unsigned((&{reg18}))) ?
                  {(({(8'ha9)} ?
                          (reg41 ? reg46 : reg23) : (reg27 ?
                              reg29 : reg33)) >> {wire11[(1'h0):(1'h0)]}),
                      (((~&reg12) < wire11) ?
                          (reg33[(4'hb):(3'h7)] ?
                              (reg31 | reg20) : reg37) : ((reg35 == reg40) ?
                              $unsigned(reg36) : reg20[(3'h5):(3'h4)]))} : $signed($unsigned((^~(!(8'ha8))))));
              reg49 <= reg35;
              reg50 <= (&$unsigned((8'hb8)));
              reg51 <= ((&$signed(($unsigned(wire44) >>> wire44))) ?
                  (reg45[(4'h8):(4'h8)] <= ((~^(~&reg42)) ?
                      ($signed(reg50) <<< (8'hb7)) : (+(reg20 ?
                          reg48 : reg14)))) : $signed($unsigned($unsigned((reg16 ?
                      reg38 : reg49)))));
            end
          else
            begin
              reg47 <= reg40;
              reg48 <= $signed((($unsigned($unsigned(reg47)) ?
                      (|(~&reg25)) : (-$signed(reg30))) ?
                  (+$unsigned((&reg41))) : reg36));
              reg49 <= (^~{(+$unsigned($unsigned((7'h44)))),
                  $unsigned($signed(reg21))});
              reg50 <= $signed((^~$signed($unsigned((!reg30)))));
            end
        end
      else
        begin
          reg45 <= wire11[(3'h5):(1'h0)];
          reg46 <= reg39[(2'h2):(2'h2)];
          if ({(8'ha4), reg17[(3'h6):(3'h4)]})
            begin
              reg47 <= (+(($unsigned($signed(reg46)) ?
                  $signed($signed(reg33)) : (|{wire15})) && reg16));
              reg48 <= reg37[(3'h6):(3'h6)];
              reg49 <= ((&($unsigned((&reg45)) ?
                      ($unsigned(reg25) ?
                          (!(8'ha4)) : (reg36 || reg24)) : $unsigned(reg49[(3'h5):(1'h0)]))) ?
                  reg35 : $unsigned($unsigned(($signed(reg18) ?
                      $unsigned(reg41) : reg48[(1'h0):(1'h0)]))));
              reg50 <= $unsigned(reg31);
              reg51 <= {(((reg19 == reg26[(4'hf):(3'h7)]) >>> reg16) ?
                      (reg29 ?
                          (wire15 ? (^reg27) : (~^reg39)) : {(reg41 ?
                                  (8'ha6) : reg23),
                              {reg26}}) : wire9)};
            end
          else
            begin
              reg47 <= reg45;
              reg48 <= $unsigned(reg21[(3'h6):(2'h2)]);
            end
        end
      reg52 <= $signed({$signed($unsigned($unsigned(wire7))), (8'h9d)});
    end
  assign wire53 = (reg52 - wire15[(3'h7):(3'h7)]);
  module54 #() modinst75 (.wire56(reg20), .wire58(reg36), .wire59(wire44), .y(wire74), .clk(clk), .wire57(reg41), .wire55(wire9));
  assign wire76 = wire15[(1'h1):(1'h1)];
  assign wire77 = wire15;
  assign wire78 = $unsigned({{{$signed(reg37), (wire7 ? wire76 : (8'hb5))},
                          (~(~wire53))},
                      (({wire43} >> (reg42 ?
                          wire10 : wire76)) & $signed((~&reg26)))});
  assign wire79 = $unsigned($unsigned($unsigned($unsigned({reg33}))));
  always
    @(posedge clk) begin
      reg80 <= (($signed($unsigned($signed(reg26))) & $unsigned(($signed(reg50) > (reg22 < reg50)))) == (^~wire77[(4'he):(3'h7)]));
    end
  assign wire81 = reg49;
  assign wire82 = $signed(reg17);
  always
    @(posedge clk) begin
      reg83 <= {(reg39[(2'h2):(2'h2)] ?
              wire11[(2'h2):(2'h2)] : (+$unsigned((reg12 - reg30)))),
          $unsigned($unsigned($signed((reg13 ? reg33 : reg20))))};
    end
  assign wire84 = ($unsigned(((reg19[(2'h3):(1'h0)] ?
                          (wire81 ?
                              wire9 : reg33) : (reg20 == reg14)) == wire8)) ?
                      $signed($unsigned((-(&wire76)))) : reg30[(2'h3):(1'h0)]);
  assign wire85 = ($unsigned((({wire81} ^ (reg14 ?
                          wire32 : wire10)) ^ wire11[(1'h0):(1'h0)])) ?
                      $unsigned(reg80) : reg50[(2'h2):(1'h1)]);
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire59;
  input wire [(5'h11):(1'h0)] wire58;
  input wire signed [(4'he):(1'h0)] wire57;
  input wire signed [(3'h6):(1'h0)] wire56;
  input wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 (1'h0)};
  assign wire60 = ($unsigned(wire59[(5'h10):(5'h10)]) ?
                      (-(|$signed(wire57))) : (~|wire56[(1'h0):(1'h0)]));
  assign wire61 = $signed($signed($signed($signed($unsigned((8'hb3))))));
  assign wire62 = wire58[(4'hc):(3'h7)];
  assign wire63 = {({(^~(wire60 ? wire57 : (8'ha4))), wire59} ?
                          wire59[(2'h3):(1'h0)] : (^wire59[(4'hb):(3'h5)])),
                      ({$unsigned((~^(8'hbe)))} != (wire59 ?
                          wire62[(3'h4):(3'h4)] : (-$unsigned((8'hb8)))))};
  assign wire64 = (wire55 ? wire57[(4'hd):(3'h4)] : wire56[(1'h1):(1'h1)]);
  assign wire65 = {$unsigned(wire55), wire55};
  assign wire66 = (+wire60[(3'h7):(2'h3)]);
  assign wire67 = $signed(({(wire64 * (8'hbd)), $unsigned({wire65, wire55})} ?
                      wire64 : $unsigned(wire58)));
  assign wire68 = (7'h41);
  assign wire69 = (8'ha9);
  assign wire70 = wire61[(4'he):(4'hd)];
  assign wire71 = $unsigned(($unsigned((~(wire61 ? (8'h9d) : wire64))) ?
                      $unsigned((~wire67)) : wire69[(2'h3):(1'h0)]));
  assign wire72 = $signed(wire59[(4'h9):(3'h7)]);
  assign wire73 = wire62[(1'h0):(1'h0)];
endmodule

module module116
#(parameter param160 = (~(((((8'hbe) ? (8'ha2) : (7'h43)) ? ((8'hb0) ? (8'h9d) : (8'hac)) : {(8'hbb)}) ? {((8'ha9) ? (8'ha9) : (8'hb4))} : (8'hb2)) ? ((^((8'hb6) ? (8'hba) : (8'hb7))) >>> (((8'hb3) != (7'h41)) <= (|(8'ha1)))) : (((8'ha5) ? ((8'ha9) == (8'haa)) : {(8'h9d)}) ? (&((8'hb9) ? (8'hac) : (8'ha2))) : ({(8'hbf), (8'ha8)} & (~(8'ha1)))))))
(y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire121;
  input wire signed [(5'h14):(1'h0)] wire120;
  input wire [(5'h13):(1'h0)] wire119;
  input wire signed [(4'hd):(1'h0)] wire118;
  input wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire [(3'h4):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire133,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire122 = $signed({($signed(wire117) << wire119[(4'h9):(1'h1)])});
  assign wire123 = $signed((wire121 >> ((((8'hb3) ? (8'hb4) : wire122) ?
                       (wire121 ? wire118 : wire120) : wire117) <<< (8'hbb))));
  assign wire124 = (-((7'h43) ?
                       {$unsigned(wire122)} : {(8'h9f),
                           (^~wire119[(4'ha):(2'h2)])}));
  assign wire125 = wire119;
  always
    @(posedge clk) begin
      reg126 <= wire118[(4'hb):(4'h9)];
      reg127 <= {$unsigned(wire123)};
      reg128 <= $signed((reg126 ?
          $signed($unsigned(wire125[(4'ha):(4'h9)])) : (reg126 | $unsigned(((8'hb0) ?
              wire123 : wire119)))));
      if (((({((8'hae) != reg128)} >>> $signed((wire121 ?
              wire120 : wire121))) >>> wire120) ?
          {($unsigned(reg128[(4'hc):(4'hb)]) ?
                  (|(|wire118)) : ((|wire119) | wire123[(3'h4):(1'h0)])),
              ({$unsigned(wire123)} >= (!(wire120 ?
                  wire118 : wire121)))} : (wire122[(3'h6):(3'h5)] ~^ $signed((~wire117)))))
        begin
          reg129 <= ($signed(({$unsigned(wire117)} != (^(wire118 ?
              wire125 : reg127)))) >> $signed(wire125[(1'h1):(1'h1)]));
          reg130 <= (~&(~^reg128));
        end
      else
        begin
          if ($signed((~$unsigned((|$unsigned(wire117))))))
            begin
              reg129 <= reg127[(4'hd):(3'h5)];
            end
          else
            begin
              reg129 <= wire118;
              reg130 <= wire119;
            end
          reg131 <= wire121[(3'h6):(2'h2)];
        end
      reg132 <= $signed(reg129);
    end
  assign wire133 = $unsigned(reg126);
  always
    @(posedge clk) begin
      reg134 <= $unsigned(reg131[(4'hc):(2'h2)]);
      if (($unsigned(wire122) ?
          ((reg127 != reg127) == (!(~|reg129[(2'h2):(1'h1)]))) : {reg127[(4'hb):(2'h3)],
              $unsigned(((&(8'hb9)) ?
                  {(8'hb3), wire122} : $unsigned(reg128)))}))
        begin
          reg135 <= $signed($unsigned(reg130[(3'h7):(3'h5)]));
          reg136 <= $unsigned((+reg131));
          reg137 <= wire121;
        end
      else
        begin
          reg135 <= $signed($signed(reg135));
          reg136 <= (-reg131);
          reg137 <= (reg131[(3'h4):(3'h4)] < ((reg127 + ((wire124 ?
                  wire119 : reg132) ^~ (reg137 > (7'h41)))) ?
              $unsigned($unsigned($unsigned(reg132))) : $unsigned($unsigned(reg136[(4'h8):(1'h0)]))));
          reg138 <= ((|(^~reg137[(1'h0):(1'h0)])) == (~$unsigned((wire125 ?
              $signed((8'hbc)) : $unsigned(reg129)))));
        end
      reg139 <= reg131[(3'h6):(1'h0)];
      reg140 <= $signed(reg130);
    end
  assign wire141 = (7'h43);
  assign wire142 = $signed(wire118[(4'ha):(2'h2)]);
  assign wire143 = {(8'h9d), (8'ha7)};
  assign wire144 = (((^~($unsigned(wire118) ?
                       (wire121 != reg137) : (-(8'ha5)))) << (+(~&$unsigned(reg132)))) >> wire142[(4'hb):(4'ha)]);
  always
    @(posedge clk) begin
      reg145 <= (wire124[(5'h10):(1'h1)] == (((~^wire142) & $signed((wire118 ?
          (8'hbf) : wire124))) << wire141));
      reg146 <= ($signed(((~|$signed((8'hb4))) ?
              $unsigned(((8'hb5) ?
                  wire144 : reg129)) : reg134[(3'h5):(3'h5)])) ?
          reg139 : reg129[(3'h7):(3'h6)]);
      reg147 <= ($unsigned($signed(wire122)) ?
          reg139 : (~$unsigned($signed(wire141[(3'h4):(2'h2)]))));
      reg148 <= (wire144 ? (~|wire125) : $signed($signed(reg130)));
      reg149 <= (-($unsigned((~^$signed(wire144))) ?
          (({reg146} ? (wire125 >= (8'hb3)) : (&(7'h42))) ?
              wire125[(1'h0):(1'h0)] : $unsigned($unsigned(wire125))) : ((-(wire144 ?
                  wire124 : reg148)) ?
              {reg137, $unsigned((8'ha3))} : $signed($unsigned(reg132)))));
    end
  assign wire150 = $signed(($signed(((reg135 || wire117) ?
                           $unsigned(reg127) : reg149[(3'h6):(3'h4)])) ?
                       (~^($signed(reg149) ?
                           (reg132 ?
                               wire143 : wire125) : $unsigned(reg145))) : wire143[(2'h2):(1'h0)]));
  assign wire151 = $unsigned((reg136[(5'h10):(4'h8)] ?
                       (|reg134) : (((wire122 < reg138) ?
                           reg148 : wire118) >>> reg129)));
  assign wire152 = {($unsigned($signed((wire144 ? wire150 : wire142))) ?
                           $signed($unsigned($signed(reg130))) : $unsigned((8'h9e)))};
  assign wire153 = $signed(($signed((^(^(7'h43)))) <<< ((^(reg140 ?
                           reg130 : wire124)) ?
                       (-$signed((8'hac))) : ((8'h9d) ?
                           wire152[(2'h2):(2'h2)] : (^~(8'ha7))))));
  assign wire154 = $signed((reg137 ?
                       (((wire121 ? reg132 : reg147) * $unsigned(reg147)) ?
                           $signed(reg145[(3'h4):(2'h3)]) : wire141) : (8'hac)));
  assign wire155 = $unsigned($unsigned(reg126[(4'hd):(1'h1)]));
  assign wire156 = $signed($signed($unsigned(($unsigned(wire151) ^ (8'h9d)))));
  assign wire157 = wire122;
  assign wire158 = (((&reg147) + $unsigned({reg145[(2'h2):(2'h2)],
                           ((8'ha1) ? wire133 : reg130)})) ?
                       (({(reg146 ? wire143 : wire144)} < (8'hae)) ?
                           (($signed(wire154) | $signed(wire152)) ^ $signed(reg135)) : $unsigned(wire123[(3'h5):(1'h1)])) : (wire141 ?
                           wire156 : ($unsigned((8'ha4)) == $signed((wire122 ?
                               reg149 : wire122)))));
  assign wire159 = ({(^~reg139[(2'h3):(2'h3)]),
                       $signed({wire122[(4'ha):(3'h6)]})} <<< wire142[(3'h6):(1'h0)]);
endmodule
