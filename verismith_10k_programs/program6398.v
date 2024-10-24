module top
#(parameter param75 = (~|((^~({(8'hb4)} ? {(8'ha1), (8'ha0)} : ((8'ha9) * (8'hb7)))) ? ((((8'hb0) ? (8'ha1) : (7'h43)) < ((8'hb7) ? (8'hae) : (7'h44))) ? {((8'hac) ? (8'ha9) : (7'h41))} : ((^(8'hb1)) && (8'ha7))) : (8'hbc))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire71;
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire71,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($unsigned(wire1) + (~^(~&(~wire3)))) + $unsigned($unsigned(wire2)));
      reg5 <= {(-(~{reg4}))};
      if (reg4[(3'h5):(3'h4)])
        begin
          if (reg5[(1'h1):(1'h0)])
            begin
              reg6 <= $signed(wire3[(1'h0):(1'h0)]);
              reg7 <= wire0[(1'h1):(1'h0)];
              reg8 <= $unsigned((~reg6));
              reg9 <= (|wire3);
            end
          else
            begin
              reg6 <= (~^wire0);
              reg7 <= reg4[(3'h6):(3'h4)];
              reg8 <= $signed($signed((|wire1[(4'h9):(2'h2)])));
              reg9 <= (|(({(reg5 * reg8), $unsigned(reg9)} | (!{reg9})) ?
                  $unsigned(wire2[(4'h9):(3'h6)]) : (~^{$signed(reg7)})));
              reg10 <= (~^({(!(^reg4))} ?
                  reg5 : (((wire2 | reg9) ? {reg5} : (~^reg6)) ?
                      $signed($unsigned(wire2)) : reg6)));
            end
          if ({{$signed(reg5)}, reg5[(2'h3):(2'h2)]})
            begin
              reg11 <= $signed($signed($signed((~&(+reg10)))));
              reg12 <= (($unsigned($signed((reg6 ?
                  reg8 : reg8))) < reg4[(5'h10):(5'h10)]) + (wire1[(1'h1):(1'h1)] ?
                  ($signed({reg5}) ?
                      $signed($signed(reg5)) : ((~|reg11) <<< (^~wire0))) : reg10[(3'h7):(3'h4)]));
              reg13 <= $unsigned($unsigned({({(8'h9f),
                      reg11} <= $signed(reg4))}));
              reg14 <= $signed((wire2 ? wire1 : (^(8'had))));
              reg15 <= ($unsigned($signed($signed((~wire0)))) ?
                  $unsigned(reg11[(1'h1):(1'h1)]) : wire1[(3'h7):(1'h1)]);
            end
          else
            begin
              reg11 <= (-reg12[(4'h8):(3'h5)]);
              reg12 <= {$signed($unsigned((wire2 ^ (~|reg9)))),
                  (reg15[(2'h3):(2'h3)] ? wire0 : wire3)};
              reg13 <= (~&wire2);
              reg14 <= ((^$unsigned($unsigned(reg12[(3'h4):(3'h4)]))) ?
                  (($signed($unsigned(reg9)) ?
                          wire2 : (reg9[(2'h2):(2'h2)] || (reg13 <= reg10))) ?
                      (^{reg8[(5'h12):(4'h9)]}) : {(wire3[(4'hf):(1'h1)] + ((8'ha2) ?
                              reg10 : reg12)),
                          reg4[(4'hb):(4'hb)]}) : ({{(reg4 ? reg13 : reg5),
                              $unsigned(wire1)}} ?
                      {reg6[(3'h5):(1'h0)]} : ((8'hb0) && reg8)));
            end
        end
      else
        begin
          reg6 <= ((~|reg4[(5'h11):(4'hc)]) ?
              ($signed({reg8[(2'h3):(2'h3)]}) == $signed((8'hbe))) : $unsigned($signed((~|$signed(wire0)))));
        end
      if (($unsigned((reg12[(1'h1):(1'h1)] >> (+(+wire3)))) ?
          $unsigned(reg12) : $signed(reg8)))
        begin
          reg16 <= ($signed({$signed({reg4}),
                  $unsigned((wire0 ? reg6 : reg13))}) ?
              $signed(reg4) : (&wire1[(3'h5):(3'h4)]));
          reg17 <= $signed((((reg13 != wire3) ?
                  (reg16 >= (reg4 && wire2)) : wire2) ?
              $signed($unsigned({(7'h43)})) : wire2));
          reg18 <= (+((reg13 && (~&{wire3})) || (wire1[(4'h8):(1'h1)] ?
              $signed($unsigned((8'hb4))) : $unsigned({reg17}))));
          reg19 <= (~&$unsigned((~(~|(reg9 ? reg14 : reg9)))));
          reg20 <= {$unsigned((reg12[(4'h9):(4'h9)] >> $signed((wire3 ?
                  (8'hbe) : wire2)))),
              (wire2 + (^~(reg7 ? {reg7} : $signed(reg16))))};
        end
      else
        begin
          if ((($signed(reg16) ?
                  reg9 : $unsigned(((~reg5) ?
                      reg13[(2'h3):(1'h1)] : $unsigned((7'h43))))) ?
              (7'h44) : ((|reg5) ?
                  ((((8'hac) ?
                      reg19 : (8'hb9)) >> reg5[(4'hb):(4'h9)]) >> $signed(reg16[(2'h2):(1'h0)])) : $signed((~&(wire3 ?
                      wire2 : (8'had)))))))
            begin
              reg16 <= (^~reg11[(1'h0):(1'h0)]);
              reg17 <= (~($signed((~((8'hb5) ? (8'hb7) : reg18))) ?
                  wire2 : {{$signed(reg13), reg8[(4'hc):(2'h3)]}}));
            end
          else
            begin
              reg16 <= $signed((reg16 >= $signed((8'ha7))));
              reg17 <= ((^(reg11 ?
                  reg15 : (((8'hbd) ?
                      reg4 : reg7) - (reg19 * (8'hb8))))) ^~ $signed({reg15[(5'h11):(2'h2)],
                  $unsigned((-reg8))}));
            end
          reg18 <= $signed($signed((~$signed($signed(reg11)))));
          reg19 <= {(~^$signed(reg15)),
              ($unsigned(wire0[(2'h3):(2'h3)]) ?
                  ($signed($signed((8'had))) >> ((reg15 ?
                      reg12 : reg13) < reg8)) : $unsigned(($signed((8'hb8)) <<< $unsigned(reg4))))};
          if (($signed(reg18) ?
              (-$signed($signed(reg13))) : {{reg13[(3'h7):(1'h1)],
                      $unsigned((+reg11))}}))
            begin
              reg20 <= reg7;
              reg21 <= reg16;
            end
          else
            begin
              reg20 <= (+reg15[(5'h13):(5'h12)]);
              reg21 <= (^~$signed((!(-wire2))));
            end
        end
    end
  assign wire22 = reg15[(4'ha):(4'h8)];
  assign wire23 = reg8[(4'he):(1'h1)];
  assign wire24 = {$unsigned(wire23),
                      ((~|reg10) ? reg19[(2'h2):(2'h2)] : reg6)};
  assign wire25 = ($signed((~|$unsigned((reg13 <<< wire22)))) ?
                      ((((reg20 < reg7) ? (~(8'hba)) : {reg6}) ?
                              reg17[(2'h3):(1'h0)] : wire23) ?
                          {$unsigned($signed(reg16))} : $unsigned({(wire3 ?
                                  reg8 : reg9),
                              (reg6 ~^ reg5)})) : ($unsigned($signed(((8'hbc) ^~ reg5))) || (((wire0 ?
                          reg14 : reg20) & (|reg19)) ~^ reg17[(2'h2):(2'h2)])));
  assign wire26 = reg4[(4'ha):(4'h9)];
  assign wire27 = (&reg18);
  assign wire28 = $signed((|reg8));
  assign wire29 = $signed(reg9[(5'h11):(4'he)]);
  assign wire30 = (|{(reg16[(1'h1):(1'h0)] ? wire26 : (8'h9e))});
  module31 #() modinst72 (wire71, clk, wire1, reg4, reg16, reg5, reg14);
  assign wire73 = ({(-$signed(reg11[(2'h2):(1'h1)])),
                          {wire23[(5'h10):(4'ha)], reg19[(4'h9):(1'h0)]}} ?
                      wire0 : ((($signed((8'ha8)) ? (reg13 < wire1) : reg7) ?
                          wire71[(4'h8):(1'h1)] : reg11[(2'h2):(2'h2)]) <<< wire1[(4'hb):(1'h0)]));
  assign wire74 = ((~|(!$unsigned({reg18}))) ?
                      $unsigned(((~((8'ha8) ? reg8 : reg9)) ?
                          ((~reg20) ? $signed(reg8) : wire28) : (^~{reg9,
                              reg17}))) : ((((^reg11) & $unsigned(reg5)) ~^ reg13) ~^ wire30[(3'h7):(2'h3)]));
endmodule

module module31
#(parameter param69 = (~^(^(8'h9e))), 
parameter param70 = ({param69, param69} ? ((param69 ? (param69 ? param69 : (param69 >= (8'hb6))) : ({param69, param69} >> (7'h41))) ? ((param69 ? param69 : (param69 ? param69 : (8'hb4))) - {(~&param69)}) : ((-((8'hb9) ? (8'hbc) : param69)) >>> param69)) : ({{param69, (&param69)}, (~^(param69 ? param69 : param69))} ? ((&((8'h9e) ? param69 : param69)) ? param69 : {(param69 + param69)}) : (|param69))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire signed [(3'h7):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire39,
                 wire38,
                 wire37,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire37 = ((((-(|wire36)) ^~ $unsigned((8'ha3))) ?
                          $unsigned($signed(wire35[(1'h0):(1'h0)])) : ($signed($unsigned(wire35)) && (^~wire32[(5'h10):(3'h5)]))) ?
                      ((8'hb9) ?
                          $signed((~|$unsigned(wire32))) : (|wire35)) : (8'h9c));
  assign wire38 = wire37;
  assign wire39 = (wire34 * wire35);
  always
    @(posedge clk) begin
      reg40 <= $unsigned((&($signed(wire39[(3'h5):(2'h3)]) || $signed(wire33[(2'h3):(1'h0)]))));
      if (wire36)
        begin
          if ((8'hb0))
            begin
              reg41 <= $unsigned($unsigned((8'ha9)));
              reg42 <= (8'ha4);
            end
          else
            begin
              reg41 <= (8'had);
            end
          if ($signed((((((8'hbe) ?
              wire32 : reg42) || $signed(wire34)) <<< $signed((wire39 > (8'hae)))) << ($signed(wire34) ?
              ((^wire33) < $unsigned(reg40)) : ({reg40,
                  wire33} >>> (~(8'h9e)))))))
            begin
              reg43 <= $unsigned(reg41);
              reg44 <= {((wire34[(1'h1):(1'h1)] + $signed($signed(wire38))) >= ((~reg40[(3'h7):(1'h0)]) ?
                      (-(|wire37)) : $signed(wire32))),
                  {($unsigned((reg40 < (8'hb6))) ?
                          wire32 : ((8'ha2) ?
                              {reg43} : (reg42 ? (8'ha6) : (8'ha0))))}};
              reg45 <= ($signed((reg43[(1'h1):(1'h1)] ?
                  $unsigned(wire34[(1'h1):(1'h1)]) : $signed(reg42))) >> $unsigned({reg43}));
              reg46 <= wire39;
              reg47 <= $signed((|$unsigned({wire32[(5'h11):(5'h11)],
                  {reg43}})));
            end
          else
            begin
              reg43 <= ((({wire37, wire38[(5'h10):(4'h9)]} ?
                      ((reg43 ? reg43 : wire38) ?
                          (reg42 ~^ wire36) : ((8'ha9) ?
                              (8'ha7) : (8'hbd))) : $unsigned(wire34[(3'h7):(3'h5)])) || ((((8'hb3) != reg41) ~^ {wire37}) ?
                      wire37 : (!{reg45}))) ?
                  (8'hb4) : (^$unsigned((8'hb8))));
              reg44 <= wire39;
              reg45 <= $signed(reg40);
            end
          reg48 <= wire38;
        end
      else
        begin
          reg41 <= {(($unsigned($signed(reg46)) + $unsigned(wire39[(2'h2):(1'h0)])) + $unsigned(({wire39} ?
                  {reg43} : wire34[(2'h2):(1'h1)])))};
          if (({(!($signed(wire33) ? $unsigned((7'h41)) : (~^wire37)))} ?
              {reg43} : (($unsigned($unsigned(wire37)) | wire38[(3'h5):(1'h1)]) ?
                  $signed((&$signed(reg47))) : wire33)))
            begin
              reg42 <= wire39;
              reg43 <= wire36[(4'ha):(3'h7)];
              reg44 <= $unsigned(reg40);
              reg45 <= $signed(wire34);
              reg46 <= $unsigned(((reg41 && $signed($unsigned(wire39))) ?
                  (&(wire39[(1'h1):(1'h0)] ?
                      wire32[(5'h10):(4'hf)] : $signed(wire33))) : $signed({reg45})));
            end
          else
            begin
              reg42 <= ((((~|wire33) ?
                      wire34[(1'h0):(1'h0)] : $unsigned($unsigned((8'ha5)))) ?
                  reg41[(3'h6):(2'h2)] : $unsigned(($unsigned(reg45) ?
                      $signed(reg42) : wire32[(2'h3):(1'h0)]))) << ((reg45 ?
                      (8'haf) : (8'hbf)) ?
                  $signed($unsigned($unsigned(reg44))) : $signed($signed($unsigned(reg42)))));
              reg43 <= {(wire36[(4'hb):(1'h1)] >>> $unsigned($unsigned($unsigned(reg48))))};
              reg44 <= ($unsigned(reg46) & $unsigned(((+(^~wire36)) ?
                  {(wire37 ? reg47 : wire36)} : $unsigned(wire36))));
              reg45 <= (reg48[(4'h8):(3'h7)] ?
                  (&({(^reg41), reg48[(3'h6):(3'h4)]} << $signed({wire36,
                      reg41}))) : reg48);
              reg46 <= ($signed(reg44[(3'h4):(2'h3)]) != reg47);
            end
          reg47 <= (($unsigned(((^(8'hab)) + (wire34 && (8'h9c)))) - wire36[(4'h8):(1'h0)]) * {reg48[(1'h1):(1'h0)]});
        end
      reg49 <= $signed($unsigned({(^reg45)}));
      reg50 <= (8'h9e);
      if (($unsigned($unsigned(wire34)) ?
          (~|(|$signed((+reg42)))) : ((^wire39) && {reg43,
              $unsigned(wire34[(1'h0):(1'h0)])})))
        begin
          if (reg48[(3'h6):(1'h0)])
            begin
              reg51 <= (8'hb7);
              reg52 <= wire39[(3'h6):(3'h4)];
              reg53 <= ({reg40, $unsigned(wire39)} == ({(~&{wire34,
                      reg45})} > wire38[(4'h9):(3'h7)]));
            end
          else
            begin
              reg51 <= ((((8'hbe) ^~ (~(~&reg51))) ?
                      $unsigned({reg46}) : (^$unsigned(wire38[(3'h7):(2'h3)]))) ?
                  $unsigned(wire37) : (wire39 ~^ wire38[(4'ha):(4'h8)]));
              reg52 <= $unsigned($unsigned((&{$signed(wire37),
                  $signed(wire33)})));
              reg53 <= $unsigned(wire32);
            end
          if (wire34[(3'h4):(3'h4)])
            begin
              reg54 <= (($unsigned(reg42[(4'h9):(3'h4)]) ?
                  (~wire35) : (~|(~|reg45))) >= wire37);
              reg55 <= ((wire39 ?
                      $unsigned($signed($signed(wire37))) : wire36[(1'h1):(1'h1)]) ?
                  {reg44[(4'ha):(4'ha)]} : reg54);
              reg56 <= reg53[(3'h5):(1'h1)];
              reg57 <= (wire32 <<< $signed((((reg56 * (8'ha0)) < (~wire36)) ?
                  ($unsigned(wire38) && $unsigned(wire37)) : ({(8'hac),
                          (8'hb2)} ?
                      $signed(reg47) : $unsigned(wire36)))));
              reg58 <= $signed(((^~((+reg48) ^~ ((7'h43) ?
                  wire35 : reg48))) + $signed($signed((^wire32)))));
            end
          else
            begin
              reg54 <= $unsigned(($unsigned((~{reg58})) ?
                  $unsigned((reg51[(3'h7):(3'h6)] < (reg52 ?
                      reg53 : reg48))) : (reg51[(3'h4):(1'h1)] ?
                      $unsigned((~reg58)) : {(~&reg53),
                          wire39[(2'h2):(2'h2)]})));
              reg55 <= (((((reg53 <<< reg49) && (8'ha1)) ?
                  $signed((wire34 <<< (8'h9d))) : $signed(reg54)) >= $unsigned({(!reg51),
                  {reg51,
                      wire34}})) ~^ $unsigned({(reg43[(2'h2):(1'h0)] & (^~(8'haa))),
                  reg41}));
              reg56 <= reg52[(1'h1):(1'h1)];
              reg57 <= $unsigned((-(wire34[(3'h4):(1'h0)] * ($unsigned(wire36) >> (reg42 ?
                  wire36 : reg53)))));
              reg58 <= ($signed($unsigned(($unsigned(reg55) - {wire32,
                      reg47}))) ?
                  (reg55[(1'h0):(1'h0)] ?
                      ($signed((reg53 ^~ reg45)) ?
                          reg57[(4'ha):(3'h6)] : $unsigned($signed(wire38))) : ((-{reg40}) + wire37[(1'h0):(1'h0)])) : (reg52 && $unsigned(wire34)));
            end
          if ($signed($signed($unsigned($signed((reg47 ? (8'ha5) : reg41))))))
            begin
              reg59 <= $unsigned((+((reg47 ^~ {wire37, (8'had)}) ?
                  $signed($unsigned((8'hb7))) : $unsigned({reg42}))));
              reg60 <= (reg44 ?
                  {wire34[(3'h6):(2'h3)],
                      (8'h9c)} : $unsigned($signed($unsigned($unsigned(reg50)))));
              reg61 <= $signed(wire36[(3'h7):(3'h7)]);
            end
          else
            begin
              reg59 <= $unsigned((reg61[(4'he):(2'h2)] || (reg45[(4'he):(4'h9)] ?
                  (~&$unsigned(wire34)) : ($signed(reg55) && (reg55 ?
                      wire34 : wire37)))));
            end
        end
      else
        begin
          reg51 <= $signed(($signed(wire37) >> (~(((8'ha4) < wire34) - (reg59 * wire33)))));
          reg52 <= (|{$unsigned($unsigned(wire32)), reg46[(1'h0):(1'h0)]});
          reg53 <= (^reg45[(2'h3):(1'h1)]);
          if ((&$unsigned({({reg40, reg44} ? $signed(reg52) : wire34)})))
            begin
              reg54 <= $signed(wire32);
              reg55 <= reg42;
            end
          else
            begin
              reg54 <= reg61[(4'h8):(2'h3)];
              reg55 <= ($signed($unsigned(reg45[(4'h9):(4'h9)])) < $unsigned((-$unsigned($unsigned(reg49)))));
              reg56 <= (~$signed((^~$signed(reg46))));
              reg57 <= ({(~&$signed((+reg61))),
                  $unsigned($unsigned({wire34}))} * $signed({(^$signed(wire38))}));
              reg58 <= $signed(((wire35[(4'ha):(2'h3)] || (&{reg59})) + $signed(reg53)));
            end
          reg59 <= ($signed(reg42[(1'h1):(1'h0)]) < $unsigned((+(reg46[(1'h1):(1'h1)] ?
              (wire39 >>> (8'hb5)) : $unsigned(reg50)))));
        end
    end
  assign wire62 = $signed({reg40[(2'h2):(1'h1)]});
  assign wire63 = ($signed((reg60[(3'h4):(1'h1)] ? (8'had) : reg59)) ?
                      $unsigned(((reg40[(1'h0):(1'h0)] ?
                          ((8'haa) >>> reg59) : $unsigned(reg42)) >> ((reg45 <= reg41) ?
                          {(7'h44),
                              reg57} : $signed(reg48)))) : (~&wire36[(1'h1):(1'h1)]));
  assign wire64 = reg49[(2'h3):(1'h1)];
  assign wire65 = ($unsigned((8'hb0)) ?
                      $unsigned((({reg43, (7'h40)} ?
                          reg46 : {reg55,
                              reg40}) && ($unsigned((8'haa)) == (8'hb6)))) : reg47[(3'h7):(3'h6)]);
  assign wire66 = {wire32[(4'hf):(3'h4)],
                      (($signed($signed(wire63)) >> wire33) ?
                          reg51[(3'h5):(3'h5)] : $signed({(~&(8'ha3)),
                              reg60[(2'h3):(1'h0)]}))};
  assign wire67 = (wire35 > (~{(wire35 | (reg40 ? reg44 : wire66))}));
  assign wire68 = {wire36[(1'h0):(1'h0)]};
endmodule
