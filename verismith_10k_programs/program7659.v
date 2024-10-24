module top
#(parameter param64 = ((|((-{(8'hbc), (8'ha5)}) <<< (8'ha9))) ? ({(~|((8'ha9) ? (8'haf) : (8'ha9)))} ? ({((8'ha8) < (8'h9d))} + (((7'h44) ? (8'hbe) : (8'hb5)) ? ((8'h9c) ? (8'hbb) : (7'h40)) : ((8'ha7) ? (8'haf) : (8'ha6)))) : (^~(8'ha8))) : (&{(!((8'had) ? (8'ha9) : (8'hb7))), ((8'hab) ? (8'h9c) : ((8'hbf) ? (8'h9e) : (8'hbe)))})), 
parameter param65 = (((8'hbb) ? param64 : (((param64 || param64) ? ((8'h9d) ? param64 : param64) : (~&param64)) ? param64 : ((param64 & (8'hb8)) ? {param64, param64} : (param64 ? (8'hb0) : param64)))) >>> (8'hb7)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire43,
                 wire42,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
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
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(2'h2)];
  assign wire5 = wire0;
  assign wire6 = (({($unsigned(wire0) < (wire5 ? (7'h43) : (8'hb9)))} ?
                     (&$signed($unsigned(wire0))) : $unsigned(($unsigned(wire0) ?
                         wire3[(4'he):(4'he)] : (wire4 || wire5)))) & (+$signed($signed(wire5[(4'hc):(4'hc)]))));
  assign wire7 = $unsigned($signed((wire1[(4'h8):(3'h4)] || (!$unsigned((8'ha3))))));
  assign wire8 = (-$signed((^~wire2[(4'h8):(3'h7)])));
  assign wire9 = $unsigned(wire4[(2'h2):(1'h0)]);
  assign wire10 = (wire7 ?
                      (($signed((-wire8)) - $unsigned(((8'ha2) <= (8'hae)))) - (((~|wire1) ?
                              {wire4} : (wire7 ? wire7 : wire4)) ?
                          wire2 : ((!wire5) ?
                              (+wire6) : wire1))) : ((wire4[(1'h1):(1'h1)] <<< wire0) < ($unsigned((8'hb2)) ?
                          $unsigned($signed(wire2)) : wire8[(3'h7):(3'h6)])));
  assign wire11 = {({$signed($signed((8'hba)))} << {wire7[(4'hf):(1'h1)]}),
                      (^~wire8[(4'h9):(1'h0)])};
  assign wire12 = $signed({wire10,
                      ({(wire3 ? (8'hb1) : wire10),
                          (wire5 <<< wire10)} <= $unsigned((wire7 ?
                          wire0 : wire5)))});
  assign wire13 = (~|$signed(wire5[(4'he):(2'h2)]));
  always
    @(posedge clk) begin
      reg14 <= wire13[(3'h7):(2'h2)];
      if ($signed((wire10 >> wire11)))
        begin
          if ($unsigned((wire6 ?
              (-(~|(wire4 && (8'hbf)))) : ((~^(~wire11)) & (wire9[(2'h2):(1'h1)] ?
                  wire0[(3'h7):(2'h2)] : (-reg14))))))
            begin
              reg15 <= {(!(reg14 ?
                      $unsigned((reg14 ? wire3 : wire3)) : ((wire5 ^~ wire10) ?
                          ((8'hbd) > wire4) : (wire6 ~^ wire12)))),
                  ({wire11, reg14} > (~(-wire7[(4'h9):(3'h7)])))};
              reg16 <= (~(reg14 ?
                  $signed(reg15[(2'h2):(1'h1)]) : wire3[(1'h0):(1'h0)]));
              reg17 <= (+(wire5 == $unsigned($unsigned($unsigned(wire9)))));
            end
          else
            begin
              reg15 <= $signed(((+(~^wire12[(2'h3):(2'h3)])) ?
                  $unsigned((8'hbb)) : ($signed(wire1) ?
                      (wire3 || ((8'ha3) ?
                          wire1 : wire13)) : ((reg14 & wire12) ?
                          (wire4 <<< wire7) : $signed((7'h42))))));
              reg16 <= reg15[(3'h5):(2'h2)];
              reg17 <= (~^wire6[(1'h0):(1'h0)]);
              reg18 <= $signed((~^{((wire11 << wire10) ?
                      wire3[(3'h7):(3'h6)] : reg17)}));
            end
          if ($signed({($unsigned($signed(wire1)) < (wire8[(2'h2):(2'h2)] ?
                  ((8'hbb) ? wire6 : wire1) : wire12[(1'h0):(1'h0)])),
              $signed(reg17[(1'h1):(1'h1)])}))
            begin
              reg19 <= $signed($unsigned(($unsigned($signed(wire10)) ?
                  $unsigned($unsigned(wire13)) : $unsigned(((8'ha2) + (8'ha2))))));
              reg20 <= $signed(((reg18 + $unsigned(wire5[(4'h9):(1'h1)])) ?
                  wire6 : {$unsigned($unsigned(reg14)),
                      (~|reg14[(2'h3):(2'h3)])}));
              reg21 <= ($unsigned((~^$unsigned((wire13 ?
                  reg17 : wire1)))) != $signed($unsigned($signed({wire11,
                  (8'hb8)}))));
              reg22 <= wire1;
            end
          else
            begin
              reg19 <= $signed($unsigned(wire4));
              reg20 <= $signed($signed($unsigned($unsigned(wire12))));
            end
          if (wire10[(5'h15):(4'hd)])
            begin
              reg23 <= wire9[(1'h1):(1'h1)];
              reg24 <= $unsigned($unsigned(reg23));
              reg25 <= $unsigned((wire1 ?
                  ((wire13[(2'h3):(2'h2)] & (-wire1)) && $signed(((8'h9c) ?
                      wire4 : wire6))) : (^~$signed({reg17, wire1}))));
              reg26 <= {wire13[(4'ha):(3'h7)]};
              reg27 <= {wire4, $unsigned({wire9[(3'h4):(1'h0)]})};
            end
          else
            begin
              reg23 <= wire4[(3'h5):(2'h2)];
            end
          reg28 <= $signed($signed(((8'hbc) * (+wire11))));
        end
      else
        begin
          reg15 <= (wire13[(3'h5):(2'h2)] ^ $signed(((|wire10[(4'h9):(1'h1)]) ?
              $signed((+reg25)) : wire4[(2'h3):(2'h2)])));
          if (((reg27[(4'he):(4'hb)] && {(~&wire1)}) > $unsigned($signed(({wire10} ^~ wire11[(1'h0):(1'h0)])))))
            begin
              reg16 <= $signed((~&$unsigned($unsigned(reg20))));
              reg17 <= reg15;
              reg18 <= $signed($unsigned(reg22));
            end
          else
            begin
              reg16 <= (($unsigned($unsigned(((8'ha4) * reg25))) ?
                      (((|wire10) ?
                          (wire10 < reg23) : $unsigned(reg17)) * ((+(8'hab)) ?
                          reg20 : $signed(wire12))) : $signed($unsigned({wire11}))) ?
                  (reg27[(2'h3):(2'h3)] && reg15[(1'h0):(1'h0)]) : {((wire4[(4'h8):(3'h6)] ?
                          reg15 : $signed(reg26)) | wire7)});
              reg17 <= wire10;
              reg18 <= ((&wire4[(3'h7):(3'h7)]) ?
                  reg17[(1'h0):(1'h0)] : (8'hb0));
              reg19 <= reg15[(4'h8):(2'h2)];
              reg20 <= {$signed(reg15),
                  {((8'ha0) <<< (reg24 ? (reg14 - reg17) : wire3)), reg15}};
            end
          if ((^~(+reg22[(3'h7):(3'h7)])))
            begin
              reg21 <= $signed($signed((+$signed({reg21, (8'hb2)}))));
              reg22 <= wire3[(3'h6):(1'h0)];
            end
          else
            begin
              reg21 <= $signed(($signed(((reg18 ? reg19 : (8'h9f)) & (reg19 ?
                      (8'had) : wire13))) ?
                  ($unsigned($unsigned(wire13)) ?
                      $unsigned((wire4 ? wire8 : wire6)) : wire7) : (8'ha9)));
              reg22 <= $unsigned((-$signed(wire12)));
              reg23 <= {$signed(reg21), wire10};
              reg24 <= (^~(!(reg14 <<< ($signed(reg16) ~^ (wire2 != reg23)))));
              reg25 <= (^~(~^(((reg21 ~^ wire12) >>> (wire9 ?
                  wire5 : wire12)) <= (8'hab))));
            end
          reg26 <= ($unsigned((~|$unsigned(wire5))) ?
              reg26[(3'h7):(1'h0)] : ($unsigned($signed($signed(reg28))) ?
                  {reg18[(3'h7):(3'h5)],
                      {(reg15 << reg26), wire12[(2'h2):(1'h0)]}} : (~&wire2)));
          if (reg20[(2'h2):(2'h2)])
            begin
              reg27 <= (($signed((~|reg26)) ^~ (8'hbc)) | ($unsigned((!((8'hbf) ?
                  reg19 : reg14))) && (wire2[(5'h10):(3'h4)] ?
                  (8'h9d) : ($unsigned(reg27) ^ (wire12 || wire10)))));
              reg28 <= $unsigned({$signed($signed((reg14 ? reg22 : (7'h40)))),
                  wire4[(3'h6):(1'h0)]});
            end
          else
            begin
              reg27 <= ($signed($signed((~$unsigned(wire12)))) < $unsigned(reg23));
              reg28 <= $signed(((^$unsigned(reg19)) ^~ wire9[(1'h0):(1'h0)]));
              reg29 <= ((((wire8[(4'h9):(3'h5)] ?
                              (~^reg16) : (reg26 ? wire13 : wire4)) ?
                          (reg21[(2'h2):(1'h1)] <= (&wire0)) : $signed((8'ha4))) ?
                      wire1 : $unsigned(wire3)) ?
                  $signed(wire4) : (({(&reg18),
                      wire0[(1'h0):(1'h0)]} + {((8'ha9) ? reg17 : reg17),
                      reg24}) << (~(^~wire10))));
              reg30 <= $unsigned($unsigned($unsigned(reg20)));
              reg31 <= (+(wire6 ?
                  ((~|wire10[(4'hd):(4'h9)]) ?
                      (-$signed((8'hbc))) : ((reg16 ?
                          reg21 : wire11) == (+wire12))) : (~|($unsigned(wire9) + $unsigned(reg18)))));
            end
        end
      reg32 <= reg20[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ($signed({(-reg14)}))
        begin
          reg33 <= (wire12[(1'h1):(1'h0)] ^~ ($signed({(wire10 ?
                  reg15 : wire11)}) ~^ $unsigned(({reg30} ?
              $unsigned(reg30) : $unsigned(reg25)))));
          reg34 <= ((($unsigned($signed(reg16)) >= (wire12[(4'h9):(4'h9)] > reg22)) << ($unsigned((wire2 - reg31)) || ((!reg28) << (reg32 ?
                  (8'haf) : wire1)))) ?
              $signed((((reg23 ?
                  (8'h9e) : reg33) ^ (~&wire8)) != (7'h41))) : reg16);
          if (reg20)
            begin
              reg35 <= $unsigned(reg18[(3'h4):(1'h0)]);
              reg36 <= (8'hbf);
              reg37 <= (8'haf);
              reg38 <= wire6;
              reg39 <= (($unsigned($signed((reg37 && (8'ha9)))) != (~&($signed(wire13) ?
                  $unsigned(reg24) : reg14))) + (($signed($unsigned((8'hae))) + wire5[(3'h7):(1'h1)]) + wire9[(1'h0):(1'h0)]));
            end
          else
            begin
              reg35 <= reg15[(4'hf):(3'h5)];
              reg36 <= $signed(((^~$signed((-reg26))) >> (reg35 ?
                  ($signed(reg25) <<< $unsigned(reg37)) : ($signed(reg19) || (^~reg18)))));
              reg37 <= (($signed(((&(8'h9e)) ?
                      $unsigned(reg21) : reg38[(4'h9):(3'h5)])) ?
                  $unsigned({reg38[(4'h8):(3'h6)], (8'hba)}) : (({(8'ha3),
                          reg34} ?
                      (reg17 > reg35) : reg30) >>> {(^wire6),
                      (wire11 ? wire11 : reg39)})) && (wire4 ?
                  {($signed(reg36) ?
                          $unsigned(wire12) : ((7'h44) >> reg20))} : {(((8'ha7) ?
                              reg26 : (8'hae)) ?
                          (~(8'hb7)) : reg19[(2'h2):(1'h1)])}));
            end
          reg40 <= reg33[(4'hc):(1'h0)];
        end
      else
        begin
          reg33 <= (({(|(-(8'hb4))),
              (^reg26)} & ($unsigned($signed(reg20)) == $unsigned($unsigned(wire10)))) > (8'hae));
          if (reg18)
            begin
              reg34 <= wire11;
              reg35 <= (-(~^$unsigned(reg40[(3'h5):(3'h4)])));
            end
          else
            begin
              reg34 <= (~|wire4[(4'ha):(2'h3)]);
            end
        end
      reg41 <= ($unsigned($signed($signed($unsigned((8'h9c))))) ?
          reg23[(1'h1):(1'h0)] : reg26);
    end
  assign wire42 = reg27[(4'h8):(3'h4)];
  assign wire43 = wire5;
  always
    @(posedge clk) begin
      reg44 <= $unsigned(wire5[(4'hb):(3'h4)]);
      reg45 <= ($signed((^~reg22[(4'h9):(3'h4)])) || wire6);
      if (reg31)
        begin
          reg46 <= reg36;
          if ($signed($unsigned($unsigned((-$unsigned(reg21))))))
            begin
              reg47 <= ((8'hb9) * reg20);
              reg48 <= $unsigned($signed((reg15 ?
                  ((~|reg20) ?
                      (wire5 & reg36) : $signed(reg14)) : ((wire2 ~^ reg27) ?
                      (wire11 ? reg35 : reg44) : $unsigned((8'hb8))))));
              reg49 <= $signed($signed(((^~(!reg26)) ?
                  wire8[(1'h0):(1'h0)] : $signed((wire13 + (8'hbd))))));
              reg50 <= ((reg16[(3'h4):(2'h2)] ?
                      (reg23 != $unsigned($signed(wire10))) : $unsigned(((~|wire3) | reg32))) ?
                  $signed((reg35[(4'h9):(1'h1)] ?
                      reg36[(1'h0):(1'h0)] : $unsigned((reg32 < reg49)))) : $unsigned(wire9[(4'h8):(1'h0)]));
              reg51 <= (!($unsigned(reg46) <= $unsigned((!wire3))));
            end
          else
            begin
              reg47 <= $signed($unsigned($signed($signed(reg29))));
            end
          if ({$signed((reg31[(1'h1):(1'h1)] || ((reg33 ? reg34 : reg14) ?
                  reg25 : {reg16}))),
              $signed(reg21[(2'h2):(2'h2)])})
            begin
              reg52 <= $signed((^(($signed(reg32) ?
                  $signed(reg24) : (reg39 || reg22)) ~^ (~^(reg35 ?
                  reg36 : wire13)))));
              reg53 <= (+wire4[(4'h8):(1'h0)]);
              reg54 <= (reg48[(1'h0):(1'h0)] ^~ (reg18[(1'h1):(1'h1)] ^ ($signed((~|wire43)) ?
                  ($unsigned(reg53) ?
                      (reg50 ? wire1 : reg24) : (&wire5)) : wire6)));
              reg55 <= $unsigned((reg49[(3'h6):(2'h2)] == (reg16 ?
                  $signed($signed(reg48)) : wire9[(2'h2):(2'h2)])));
            end
          else
            begin
              reg52 <= ((((wire2 ?
                  reg40 : (reg20 || wire13)) >> $signed($signed((8'hb5)))) <= (8'ha9)) >> reg55[(2'h2):(1'h1)]);
            end
          reg56 <= {$signed(reg52[(2'h2):(2'h2)]),
              {(((reg29 ? reg14 : reg39) ?
                      $unsigned(reg51) : $unsigned((8'h9f))) * ((reg29 || reg26) ?
                      $signed(reg21) : (reg19 >= wire4)))}};
          reg57 <= (wire10 >= (reg28 ? (8'ha1) : (^~{(~^reg37), {reg18}})));
        end
      else
        begin
          if ((reg30[(1'h0):(1'h0)] >>> reg41))
            begin
              reg46 <= ((8'ha0) ?
                  ($signed(($unsigned(wire0) ?
                      (7'h44) : wire10[(4'hc):(4'h8)])) ^ ((~&$signed(reg24)) * ((~wire42) ?
                      $unsigned(reg54) : reg50[(1'h0):(1'h0)]))) : {(8'hbf)});
            end
          else
            begin
              reg46 <= reg38[(4'hc):(4'ha)];
              reg47 <= {$unsigned(reg22),
                  (reg54 ?
                      $unsigned(($unsigned(reg26) ?
                          $signed(reg33) : reg44)) : ((reg24[(3'h5):(3'h5)] << reg22) ?
                          ((^~reg23) >> (reg45 - reg57)) : ($unsigned(reg28) ?
                              $signed(wire3) : $signed(reg29))))};
              reg48 <= reg57[(2'h2):(1'h1)];
              reg49 <= (reg53 ?
                  reg34 : (reg45[(1'h1):(1'h0)] ?
                      (~^wire0[(4'ha):(2'h3)]) : ((+reg37) ?
                          wire3[(4'hb):(4'hb)] : $unsigned((8'ha3)))));
            end
        end
      reg58 <= $signed(reg38[(4'hb):(3'h4)]);
    end
  assign wire59 = (8'h9d);
  assign wire60 = (($signed(reg40) ?
                          $signed((wire2[(4'hf):(4'he)] * reg55[(2'h3):(2'h3)])) : (^$signed(reg54))) ?
                      (-((wire2 ? (&wire1) : reg39) ?
                          (-reg46) : ((8'ha3) > $unsigned(reg47)))) : reg19[(4'h9):(1'h0)]);
  assign wire61 = (~reg58);
  assign wire62 = (~^(8'ha2));
  assign wire63 = (wire42[(1'h1):(1'h0)] ? reg44[(1'h0):(1'h0)] : reg30);
endmodule
