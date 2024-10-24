module top
#(parameter param101 = (+((~((~^(8'hae)) ? (+(8'hb4)) : (~^(8'hab)))) << ((8'ha1) >>> (((8'hb0) * (7'h42)) ? ((8'hb8) >> (8'hb0)) : ((8'ha8) ? (8'hb0) : (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire97;
  assign y = {wire100, wire99, wire4, wire5, wire97, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire2;
  module6 #() modinst98 (wire97, clk, wire4, wire5, wire1, wire0, wire2);
  assign wire99 = wire3;
  assign wire100 = wire97;
endmodule

module module6
#(parameter param95 = {(|(({(8'hb6), (8'hb9)} ? (+(8'ha8)) : ((8'ha0) ? (8'hbb) : (8'h9e))) ? {((8'hbb) ? (8'h9e) : (8'ha7)), (~(8'ha0))} : (+(~(7'h44)))))}, 
parameter param96 = (((+{(param95 ? param95 : param95), ((8'haf) * param95)}) >= ((&(param95 & param95)) ? ((+(8'hb4)) * (8'hac)) : param95)) > {(-(~&{param95})), param95}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h341):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire84,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg88,
                 reg87,
                 reg86,
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
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire9[(1'h1):(1'h1)])
        begin
          reg12 <= (($signed($unsigned($unsigned(wire7))) ^ ((8'hb8) << {wire10})) >= $unsigned(((-wire11) <<< wire7[(2'h3):(1'h1)])));
          reg13 <= (^$signed(wire9[(4'h8):(3'h5)]));
          reg14 <= {wire7[(2'h2):(1'h1)], {(wire8 >> wire10[(1'h1):(1'h1)])}};
          reg15 <= $unsigned(wire8[(3'h7):(3'h4)]);
        end
      else
        begin
          reg12 <= {reg13[(1'h0):(1'h0)],
              $signed((wire8[(3'h6):(2'h2)] ?
                  $unsigned(wire7) : wire9[(3'h7):(2'h2)]))};
          reg13 <= reg13;
          reg14 <= (-(reg15 ? reg14[(3'h5):(3'h4)] : reg13));
          reg15 <= reg13;
          reg16 <= {$signed((~^(((8'ha5) ? wire11 : (8'hbd)) ^~ (wire7 ?
                  reg12 : wire10)))),
              $signed({{(^~wire10)}})};
        end
      reg17 <= $unsigned((8'ha9));
      reg18 <= {wire7};
      if ((^~reg13))
        begin
          if (wire7)
            begin
              reg19 <= (&(^~reg12[(4'h8):(1'h1)]));
            end
          else
            begin
              reg19 <= $unsigned(((~^(~&{reg19, reg16})) ?
                  (((reg14 + reg17) ?
                      {reg17,
                          wire10} : $unsigned((8'hbf))) - reg18) : ($signed((reg12 ?
                          (8'ha7) : reg17)) ?
                      (wire10 ? {(8'ha4), wire8} : $signed((7'h41))) : ((reg15 ?
                              wire7 : wire11) ?
                          $unsigned(reg18) : ((8'hbf) ? (8'haf) : reg17)))));
              reg20 <= ($signed(reg16[(2'h2):(1'h0)]) ^~ ($unsigned($signed($signed(reg13))) ?
                  $signed(((wire10 ? reg18 : reg17) ?
                      wire7[(4'hd):(4'ha)] : wire7[(4'h9):(2'h3)])) : (+(+{reg17}))));
              reg21 <= (-($unsigned(($unsigned(reg15) ?
                  (wire10 - wire8) : (|wire8))) && {($unsigned(wire7) ?
                      $unsigned((8'ha0)) : (wire11 ? reg20 : wire9)),
                  ($unsigned(wire10) ? $unsigned(wire7) : $signed(wire8))}));
              reg22 <= (|(reg20 ?
                  ((-$signed(wire7)) & wire10[(1'h0):(1'h0)]) : $unsigned(reg12)));
            end
          reg23 <= wire7[(3'h5):(1'h0)];
          if ($unsigned(reg13[(2'h2):(2'h2)]))
            begin
              reg24 <= (wire7 ?
                  ($unsigned(reg17[(1'h0):(1'h0)]) || (&(reg21 + $signed((8'ha6))))) : {$unsigned($signed($unsigned(wire10)))});
              reg25 <= reg16;
              reg26 <= $unsigned(wire9[(4'hb):(2'h2)]);
              reg27 <= $unsigned(((((reg12 << reg23) ?
                          $unsigned(reg25) : reg19[(1'h0):(1'h0)]) ?
                      reg15 : reg16) ?
                  $unsigned(reg22) : (^$unsigned($unsigned(wire7)))));
              reg28 <= $signed({$signed(((reg21 >= reg26) ?
                      $signed(reg24) : $unsigned(wire11)))});
            end
          else
            begin
              reg24 <= (((wire11 ?
                  ($signed((8'ha6)) >= reg18[(1'h1):(1'h0)]) : (8'ha0)) << $unsigned($signed((reg22 - reg13)))) ^~ (~|$signed(reg21)));
            end
        end
      else
        begin
          reg19 <= reg22;
        end
      if ((((8'hb3) ?
              (~|($signed(reg26) ?
                  (reg13 ?
                      reg20 : wire8) : (reg12 + reg21))) : {$unsigned($signed(wire7)),
                  wire10}) ?
          reg27[(1'h0):(1'h0)] : reg27))
        begin
          if (reg16[(2'h3):(1'h1)])
            begin
              reg29 <= $unsigned((^(|reg28[(1'h1):(1'h1)])));
              reg30 <= ($unsigned({reg26}) ~^ {$unsigned(reg17[(4'hb):(4'h8)]),
                  $unsigned($unsigned((reg21 * wire7)))});
              reg31 <= wire9[(4'hb):(3'h5)];
            end
          else
            begin
              reg29 <= $unsigned(($unsigned(({wire11, reg13} ?
                      (wire7 ? wire10 : reg23) : (~reg14))) ?
                  {$signed((|(8'ha7)))} : (8'h9f)));
              reg30 <= $signed($signed((&wire7[(3'h4):(1'h0)])));
            end
        end
      else
        begin
          reg29 <= (^~wire7[(5'h13):(5'h11)]);
          reg30 <= ($signed(({(reg13 ? wire9 : (7'h42)),
              (wire7 > reg13)} >>> {reg19[(1'h0):(1'h0)],
              (&reg26)})) >= $unsigned($signed(reg20[(2'h2):(2'h2)])));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= (~$signed(reg31[(3'h4):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned(((!(|(~|(8'hb1)))) >>> reg20[(2'h2):(2'h2)])))
        begin
          if ($signed($unsigned((((reg18 > wire8) ?
              reg12 : (reg18 >> reg14)) >>> $signed(reg24[(2'h2):(1'h0)])))))
            begin
              reg33 <= reg29;
              reg34 <= $unsigned(($unsigned(reg18) - (($unsigned(reg33) + (reg24 ?
                  reg33 : reg12)) >= reg31)));
              reg35 <= (({((wire11 && reg19) + (reg28 > reg31))} < reg13) ?
                  ($unsigned($signed((!wire11))) ?
                      reg27 : ((7'h40) + ($unsigned(reg21) ?
                          reg15[(2'h2):(1'h1)] : reg26[(3'h4):(2'h3)]))) : ((reg26[(2'h3):(1'h0)] < ((-reg30) ?
                          $unsigned(reg15) : $unsigned(reg13))) ?
                      $unsigned($unsigned({reg28})) : $unsigned($signed((reg13 <= reg24)))));
              reg36 <= {reg20};
            end
          else
            begin
              reg33 <= (8'ha1);
              reg34 <= ((reg29 ^ reg33[(4'ha):(3'h6)]) <<< reg25);
              reg35 <= ({((~(reg12 ? wire8 : reg29)) ?
                          ($signed(reg34) ?
                              (reg30 == reg16) : wire10[(3'h4):(1'h1)]) : $unsigned({reg35}))} ?
                  (|reg22) : (8'ha3));
            end
          if (reg29)
            begin
              reg37 <= reg29;
              reg38 <= reg32[(4'h8):(1'h0)];
            end
          else
            begin
              reg37 <= {($signed($unsigned($signed(reg16))) >= {reg38})};
              reg38 <= (wire8 ?
                  ((^~(~&(reg31 ?
                      reg36 : wire10))) <<< wire7[(1'h0):(1'h0)]) : {(reg32 ?
                          ($unsigned(wire9) >> reg22) : $signed(reg24[(2'h2):(2'h2)]))});
              reg39 <= reg28;
              reg40 <= ((^$unsigned(reg27[(1'h1):(1'h0)])) ?
                  (reg14[(2'h2):(1'h1)] ?
                      {$signed(reg37[(1'h1):(1'h1)]),
                          $unsigned($unsigned(reg16))} : (((&reg33) - $signed(reg33)) ?
                          $signed(((8'hbd) ~^ (8'ha7))) : ((|reg26) ?
                              $signed(reg27) : $unsigned(reg30)))) : ($unsigned((!{reg25,
                      reg18})) >> $signed((reg27[(2'h2):(2'h2)] ^~ ((8'ha3) ?
                      reg34 : reg15)))));
              reg41 <= $signed(reg20[(2'h2):(1'h1)]);
            end
          reg42 <= reg31[(4'h8):(1'h1)];
          if ($signed($unsigned({((reg37 ? reg15 : reg32) ?
                  (reg14 ? reg30 : reg34) : reg18)})))
            begin
              reg43 <= (($unsigned((8'h9f)) ?
                  ($signed($signed(reg33)) ?
                      {reg37} : $signed($signed(wire8))) : $signed($signed(reg33[(4'hc):(2'h3)]))) ~^ $unsigned($signed(reg17)));
              reg44 <= $unsigned($unsigned((-$signed((reg43 ~^ wire11)))));
              reg45 <= {(7'h41)};
            end
          else
            begin
              reg43 <= (reg34 && $signed(reg27));
              reg44 <= reg44[(3'h5):(3'h4)];
              reg45 <= (((reg30[(4'hc):(4'hb)] ?
                      reg30[(2'h3):(2'h2)] : (wire9 ?
                          $signed(reg22) : reg27[(2'h2):(2'h2)])) >> {$signed((reg30 ?
                          (7'h44) : (8'hb7)))}) ?
                  {(8'h9e)} : reg37[(2'h2):(1'h0)]);
            end
          if (reg34)
            begin
              reg46 <= reg40[(3'h7):(1'h1)];
              reg47 <= (reg37[(1'h1):(1'h1)] | ($unsigned(((reg25 || (8'hab)) ^ $signed(reg36))) ?
                  (((~&reg22) ? reg21[(1'h0):(1'h0)] : {reg34, reg24}) ?
                      (8'h9e) : ($unsigned((8'ha2)) | reg18[(2'h2):(1'h1)])) : (reg36 ?
                      $unsigned(reg23[(1'h1):(1'h0)]) : reg14)));
              reg48 <= (~^reg23);
              reg49 <= (reg45[(2'h2):(1'h0)] ~^ reg40[(5'h10):(3'h4)]);
              reg50 <= ((~&reg41[(2'h2):(1'h1)]) - ($unsigned($unsigned(reg25[(2'h2):(1'h1)])) != reg37));
            end
          else
            begin
              reg46 <= $unsigned(reg30[(1'h0):(1'h0)]);
              reg47 <= reg23;
            end
        end
      else
        begin
          reg33 <= (^~$unsigned($signed(wire11[(3'h7):(3'h7)])));
          if ({(((wire9[(4'hc):(2'h3)] ? $signed(reg33) : (~&reg14)) ?
                      ($unsigned(reg32) * reg31) : reg33) ?
                  $unsigned(reg47[(5'h13):(5'h10)]) : ($unsigned(reg22[(1'h1):(1'h1)]) <<< reg24[(2'h2):(1'h0)])),
              reg40[(4'he):(2'h2)]})
            begin
              reg34 <= ((((~^(reg27 - reg39)) ? (8'ha5) : reg12) ?
                  ({reg26,
                      {(8'ha5),
                          reg28}} > {reg19[(2'h2):(2'h2)]}) : reg37[(2'h2):(1'h1)]) < ((+$unsigned((~^wire7))) ?
                  reg31[(4'hc):(3'h5)] : reg47[(3'h5):(1'h1)]));
              reg35 <= (wire9[(4'ha):(1'h0)] != reg15[(3'h5):(2'h3)]);
            end
          else
            begin
              reg34 <= (reg29[(4'ha):(4'ha)] ?
                  (~&{({reg42, reg13} ? (-reg15) : reg12[(3'h5):(2'h3)]),
                      $signed($signed(reg34))}) : {((^reg30) ?
                          reg33[(5'h14):(3'h6)] : reg41)});
            end
          if (({{(~|(reg19 + reg33))},
              (~|reg40[(4'h9):(4'h8)])} - (+reg41[(3'h6):(3'h6)])))
            begin
              reg36 <= reg27[(3'h4):(1'h0)];
              reg37 <= (&reg26);
              reg38 <= (~reg40[(5'h10):(5'h10)]);
              reg39 <= $unsigned({((~$unsigned(reg30)) >>> (((8'haf) ^~ reg12) >>> reg47)),
                  $unsigned(reg34[(3'h4):(3'h4)])});
            end
          else
            begin
              reg36 <= $signed((8'hbc));
              reg37 <= (reg35 ?
                  ((~((8'hba) ?
                      (~|reg22) : $unsigned((8'hbd)))) != $signed((^~(reg45 ?
                      reg49 : wire9)))) : (reg12 ?
                      (!$unsigned($signed(reg23))) : (8'ha3)));
              reg38 <= $signed($signed((!(~&(wire10 < (8'hbd))))));
              reg39 <= {(8'hac),
                  (&(reg13[(2'h3):(2'h3)] ?
                      $signed((reg18 - reg31)) : {reg43,
                          reg32[(1'h0):(1'h0)]}))};
              reg40 <= $unsigned(reg13);
            end
        end
    end
  always
    @(posedge clk) begin
      reg51 <= ($signed(reg29[(4'hd):(4'h8)]) ?
          reg42[(3'h6):(2'h2)] : reg16[(3'h5):(2'h2)]);
      reg52 <= (-(-($signed((reg43 ? wire9 : (8'hae))) * (!(reg14 ?
          reg24 : reg39)))));
      if ({wire11[(1'h1):(1'h0)]})
        begin
          reg53 <= ({reg24} <<< $unsigned($unsigned(reg50[(4'hf):(4'ha)])));
          reg54 <= ($unsigned(((((8'h9f) ? reg15 : (8'haa)) ?
                      reg42 : reg29[(3'h7):(1'h0)]) ?
                  reg51 : reg42)) ?
              reg51[(3'h4):(1'h1)] : reg24[(3'h6):(2'h3)]);
        end
      else
        begin
          reg53 <= reg54[(5'h12):(5'h12)];
          if ($signed(($unsigned($signed($signed(reg23))) ?
              (reg15[(4'h9):(3'h5)] * (|(~reg41))) : {$signed($signed((7'h42)))})))
            begin
              reg54 <= $signed({({$unsigned(wire7)} ?
                      reg37 : $unsigned((&reg18))),
                  $signed((~|{reg34, reg12}))});
              reg55 <= reg31[(4'hb):(1'h0)];
              reg56 <= (($signed(($signed(reg32) ?
                  (wire11 ?
                      reg42 : reg44) : (reg20 << reg44))) && {$unsigned((reg45 ?
                      (8'haf) : reg46)),
                  $signed(reg53[(3'h7):(3'h6)])}) != $unsigned((~&$signed((^~reg21)))));
            end
          else
            begin
              reg54 <= reg30[(4'he):(4'ha)];
              reg55 <= ((-$signed((&reg21))) <= $signed($signed((reg56 ?
                  $unsigned(reg53) : $signed(reg20)))));
              reg56 <= $unsigned((8'h9c));
              reg57 <= wire9;
              reg58 <= reg26;
            end
          reg59 <= {(&(^~$unsigned((reg29 < (8'haa))))), $unsigned((+wire8))};
          reg60 <= {(((((8'hae) <= wire9) && (reg28 ? reg35 : reg15)) ?
                      ($unsigned(reg40) ?
                          (~&wire11) : reg41[(4'hb):(4'ha)]) : (&(reg31 ?
                          reg25 : reg17))) ?
                  $signed(wire10) : (^~($unsigned((8'hb3)) ?
                      (reg44 ^ reg30) : $unsigned(reg16))))};
        end
      reg61 <= (reg32 == reg25[(2'h3):(2'h3)]);
    end
  assign wire62 = {((({reg40} ? {reg17, (8'hb2)} : (reg57 || reg39)) * ((reg18 ?
                              reg12 : reg58) ?
                          (reg19 || reg28) : (wire9 ?
                              (8'h9e) : (8'hae)))) != $signed(((8'hb6) ?
                          (reg33 ? (8'hb9) : reg27) : (^~wire8))))};
  assign wire63 = $unsigned(wire9[(3'h4):(1'h0)]);
  assign wire64 = $signed(reg13[(1'h1):(1'h1)]);
  assign wire65 = reg37;
  assign wire66 = $signed(reg20);
  assign wire67 = reg42;
  assign wire68 = (~|$unsigned($unsigned(reg19)));
  assign wire69 = wire11;
  assign wire70 = ($signed($unsigned($signed($signed(reg55)))) ?
                      (|(~^{reg25[(1'h0):(1'h0)],
                          (~(8'ha6))})) : ({(wire8 == (reg55 ?
                              (8'had) : wire62))} <<< wire64));
  module71 #() modinst85 (.wire74(reg36), .wire75(wire64), .wire72(wire68), .clk(clk), .wire76(reg15), .wire73(reg50), .y(wire84));
  always
    @(posedge clk) begin
      reg86 <= $unsigned(($unsigned($signed((reg38 | (8'hb8)))) ?
          $signed($signed({reg57})) : (reg31[(3'h4):(2'h3)] ^~ {reg13[(2'h2):(2'h2)],
              reg49})));
      reg87 <= reg45[(2'h3):(1'h1)];
      reg88 <= (&reg40[(5'h10):(4'hc)]);
    end
  assign wire89 = $unsigned(($signed(($unsigned(reg55) ~^ (reg47 <= (8'ha4)))) || $signed(((~reg18) ^ (wire7 < reg18)))));
  assign wire90 = {reg38};
  assign wire91 = reg47[(4'hf):(4'ha)];
  assign wire92 = wire8[(3'h7):(3'h4)];
  assign wire93 = {(^~$signed((8'hb4))), (+reg18[(1'h1):(1'h0)])};
  assign wire94 = $unsigned((~&$signed($unsigned($unsigned(wire92)))));
endmodule

module module71
#(parameter param82 = (7'h42), 
parameter param83 = (^(((param82 >> (8'ha8)) ? param82 : ((+param82) | (param82 <<< param82))) ? param82 : (param82 > (param82 ^~ (-param82))))))
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire76;
  input wire signed [(5'h11):(1'h0)] wire75;
  input wire [(3'h5):(1'h0)] wire74;
  input wire [(4'hf):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  assign y = {wire81, wire80, wire79, wire78, wire77, (1'h0)};
  assign wire77 = $signed(wire76[(1'h0):(1'h0)]);
  assign wire78 = $signed((wire73 ^ $signed(wire75)));
  assign wire79 = wire75;
  assign wire80 = (((~|wire77[(4'ha):(1'h0)]) << wire78) && ($unsigned((~&(wire77 != wire79))) && (~|($unsigned((8'hbe)) ?
                      $signed(wire75) : (wire73 ? wire74 : wire76)))));
  assign wire81 = ($unsigned(($unsigned(wire72) > ($unsigned(wire75) < wire75))) ?
                      $signed({((wire78 > (8'hae)) << {wire77, (8'haa)}),
                          wire73}) : wire80);
endmodule
