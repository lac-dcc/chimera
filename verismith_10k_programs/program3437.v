module top
#(parameter param101 = (8'ha3), 
parameter param102 = ({{((~&param101) || {param101, param101}), param101}} ? (param101 ? (&(param101 || param101)) : ((^~(~param101)) ? {{(8'h9e), param101}, (!param101)} : {((8'hb9) & param101), ((8'hb8) ? param101 : param101)})) : param101))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h31c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  assign y = {wire99,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire9,
                 wire8,
                 reg5,
                 reg6,
                 reg7,
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
                 reg25,
                 reg26,
                 reg27,
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
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (|$unsigned($signed(wire4)));
      reg6 <= reg5;
      reg7 <= reg6;
    end
  assign wire8 = wire1;
  assign wire9 = wire2[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg10 <= (((|(wire8[(3'h5):(1'h1)] ? $unsigned((8'ha7)) : (~|wire8))) ?
          (((reg6 >= (8'hb4)) << $unsigned(wire3)) & $signed(wire8)) : $signed(((|reg5) >>> wire9[(3'h4):(3'h4)]))) && wire3);
      reg11 <= reg10[(3'h6):(3'h6)];
      if ($signed(reg7))
        begin
          reg12 <= ((8'haf) ?
              wire1[(4'ha):(4'ha)] : (!$unsigned({$signed(reg6),
                  ((8'hb7) ? wire9 : reg5)})));
          reg13 <= $unsigned(($unsigned(wire1) ?
              {{wire0[(3'h5):(1'h1)],
                      (reg10 != reg6)}} : (wire4[(4'hf):(3'h4)] ?
                  reg7 : (+(~^wire4)))));
          reg14 <= reg10[(4'ha):(2'h3)];
        end
      else
        begin
          reg12 <= wire0;
        end
      if ($unsigned(reg11))
        begin
          reg15 <= (((wire9 ?
                  ((~^reg6) & $signed((8'ha3))) : ((wire4 ? wire2 : wire1) ?
                      $signed((8'haa)) : (-wire8))) ~^ reg6) ?
              {$unsigned(((wire8 && reg5) ?
                      $unsigned(reg13) : ((8'hac) < reg11)))} : wire2);
        end
      else
        begin
          reg15 <= ({$unsigned($unsigned($unsigned(wire9)))} - ($unsigned($unsigned(wire9)) ?
              (reg7 && ((wire1 ?
                  wire0 : reg6) >= (reg6 + wire9))) : $signed((reg13[(2'h2):(2'h2)] >> (wire2 ?
                  (8'hb9) : reg11)))));
          if ((reg11[(4'h9):(1'h1)] && $unsigned(((wire9[(4'h8):(3'h4)] ^~ (~&wire1)) ?
              reg5[(2'h3):(1'h0)] : reg5))))
            begin
              reg16 <= (|$signed(($signed((reg15 ? reg5 : wire4)) ?
                  reg10[(4'hf):(4'hd)] : reg11[(3'h7):(1'h0)])));
              reg17 <= reg10;
              reg18 <= $signed($signed($signed((reg5 - $signed(wire1)))));
              reg19 <= ($signed((reg13 ?
                  ((reg17 ? reg11 : reg17) ?
                      $signed(reg18) : wire8[(3'h4):(2'h3)]) : (~|reg6))) >= wire9[(4'h8):(3'h6)]);
              reg20 <= (reg14[(2'h2):(1'h0)] + (-wire1[(4'hf):(4'hd)]));
            end
          else
            begin
              reg16 <= (((8'hbc) >= (((^reg11) ?
                  reg13 : (~reg15)) ^~ wire9[(4'h9):(2'h3)])) + ($signed((reg16[(4'h8):(3'h7)] ?
                      reg13[(1'h1):(1'h1)] : (~|reg15))) ?
                  {$signed(((8'h9f) ? reg6 : reg20))} : {{wire4, wire2},
                      $unsigned($signed(reg14))}));
              reg17 <= $unsigned((reg14[(2'h3):(2'h3)] >> (wire9[(3'h5):(3'h5)] <<< reg15[(4'h9):(3'h6)])));
              reg18 <= $signed($unsigned((-{$signed(reg5)})));
              reg19 <= {{(-reg12[(5'h12):(1'h1)]), {$signed((~|reg5))}}, wire1};
              reg20 <= reg12;
            end
          if ($unsigned(wire1))
            begin
              reg21 <= (!($unsigned(((+wire9) ? $unsigned(reg10) : (&wire2))) ?
                  ({(wire0 ? (8'had) : reg20), {reg15}} ?
                      {$unsigned((8'ha6))} : (reg20[(4'h8):(3'h7)] ?
                          $unsigned((8'h9c)) : $signed(reg18))) : $signed(reg12)));
              reg22 <= ((~^reg12[(5'h11):(5'h10)]) ?
                  $unsigned(reg12[(4'h8):(3'h5)]) : $signed((~($unsigned(wire9) ?
                      reg18 : (~^reg5)))));
              reg23 <= (~|$unsigned({(reg16 > wire8[(4'h8):(3'h6)])}));
              reg24 <= $signed((8'hb6));
              reg25 <= {reg15, (^~$signed($unsigned((&reg22))))};
            end
          else
            begin
              reg21 <= (7'h41);
              reg22 <= ($signed((~|(reg22[(1'h1):(1'h0)] ?
                      {reg10} : $signed(reg10)))) ?
                  ((-($unsigned(reg25) - $unsigned((8'hb8)))) ?
                      wire1 : ($signed((reg11 <<< reg15)) ?
                          reg19[(3'h4):(3'h4)] : ((~wire1) ^ wire9[(4'h9):(1'h0)]))) : (($unsigned((reg11 || wire8)) * ($signed(reg25) > wire8[(3'h5):(2'h2)])) + $unsigned($unsigned($signed(reg17)))));
            end
          reg26 <= reg7[(2'h3):(1'h0)];
        end
      reg27 <= reg6;
    end
  assign wire28 = $unsigned((~^($signed($signed(reg11)) ?
                      $unsigned(reg26[(1'h1):(1'h0)]) : {(~(8'hbf))})));
  assign wire29 = ((((reg27 ? {reg24} : {(8'h9f), reg14}) ?
                          reg27 : reg17[(4'hb):(3'h7)]) ?
                      {(!(reg11 != reg22))} : $signed($unsigned({reg15,
                          reg7}))) & (|(+(&$unsigned(reg27)))));
  assign wire30 = $signed(wire2[(3'h5):(2'h2)]);
  assign wire31 = ($signed((+$unsigned((~^wire0)))) << wire4[(3'h6):(3'h4)]);
  assign wire32 = reg17[(4'ha):(3'h7)];
  assign wire33 = $signed((&($signed($unsigned(reg10)) + $signed(wire30[(2'h3):(2'h3)]))));
  assign wire34 = reg24[(2'h3):(2'h3)];
  assign wire35 = ((-reg19) << (($signed($unsigned((8'haf))) == {$signed(wire8)}) ?
                      ($unsigned((+reg26)) ?
                          ($unsigned(reg12) ?
                              (wire4 && wire1) : $signed(reg13)) : $unsigned($signed(reg5))) : $signed(($unsigned(wire29) - $unsigned((8'hba))))));
  always
    @(posedge clk) begin
      reg36 <= ((^(8'haf)) ?
          {(+((+(8'hba)) ? wire34[(3'h7):(2'h3)] : ((7'h43) + reg13))),
              (~$unsigned(reg16))} : {$signed(wire1[(1'h0):(1'h0)])});
      if (reg27)
        begin
          reg37 <= $signed($unsigned((|($signed(reg36) >>> reg11))));
          reg38 <= $signed((reg7[(3'h5):(1'h0)] >> (wire30[(1'h0):(1'h0)] && ((reg5 ?
                  (7'h41) : wire32) ?
              (~|reg16) : reg27))));
        end
      else
        begin
          reg37 <= (-$unsigned((((reg22 == wire1) ?
              $signed(reg26) : $unsigned(wire33)) ~^ {{wire34, wire31},
              $signed(wire0)})));
          reg38 <= reg5[(1'h1):(1'h0)];
          if ((reg27 ^ reg22[(2'h2):(1'h1)]))
            begin
              reg39 <= wire3[(4'h8):(3'h7)];
            end
          else
            begin
              reg39 <= ((wire32[(4'hb):(4'h8)] ?
                  $unsigned((~^wire29)) : $signed((~(~^reg37)))) >> ({wire3} > ($signed({wire34,
                  wire29}) >>> reg36)));
              reg40 <= reg12[(1'h1):(1'h1)];
            end
          reg41 <= reg17;
          reg42 <= $signed(reg39[(3'h6):(1'h0)]);
        end
      reg43 <= reg6;
      reg44 <= ($signed(($unsigned((reg27 ?
          reg25 : wire3)) <= wire32[(3'h4):(2'h3)])) + $unsigned($signed(wire28[(2'h2):(1'h1)])));
      if (reg26)
        begin
          reg45 <= $signed(wire0[(4'he):(3'h4)]);
          reg46 <= ($unsigned($unsigned((|$unsigned(reg6)))) * $signed($signed(reg17)));
          reg47 <= $signed(wire4[(4'he):(3'h5)]);
          reg48 <= (8'haf);
          reg49 <= ($unsigned(wire35) ?
              $unsigned($unsigned($signed({reg19}))) : (8'ha6));
        end
      else
        begin
          reg45 <= $unsigned(({$unsigned($unsigned(reg7)),
              $unsigned(wire4[(1'h0):(1'h0)])} == reg6[(3'h5):(2'h2)]));
          reg46 <= (~wire35[(3'h5):(1'h0)]);
          reg47 <= (reg46[(2'h2):(2'h2)] - reg25);
          reg48 <= (^~(($unsigned((reg18 ? reg7 : reg43)) ?
              $signed({reg27}) : ((-wire32) >= (~(7'h42)))) >= (^~($unsigned(reg44) ?
              $unsigned(wire1) : (reg47 * reg48)))));
          reg49 <= (~&$unsigned((~&((~reg19) & reg10))));
        end
    end
  always
    @(posedge clk) begin
      reg50 <= ($signed(reg16) ^~ ({{$unsigned(reg39)},
          (wire28 ?
              $unsigned(reg47) : (8'hbe))} != (wire3[(3'h4):(3'h4)] <= ($signed(reg49) & (8'hab)))));
      if (wire8)
        begin
          reg51 <= reg41;
          if ((wire4[(4'h9):(4'h8)] ?
              $unsigned((|((reg45 ?
                  wire1 : reg18) <= ((8'hb3) || wire30)))) : $unsigned((~|(~{reg20})))))
            begin
              reg52 <= (wire3 ? reg21[(2'h3):(1'h1)] : reg50);
              reg53 <= {(+$unsigned((^(-reg12))))};
              reg54 <= $signed((7'h44));
              reg55 <= wire35;
            end
          else
            begin
              reg52 <= reg39[(1'h1):(1'h0)];
              reg53 <= ({(reg24 << $unsigned({reg46})),
                      $unsigned((wire2[(3'h4):(3'h4)] ?
                          {(8'ha3), (7'h41)} : (reg49 ? reg41 : reg40)))} ?
                  (reg41 ?
                      ($signed((~^(8'ha4))) && reg40[(4'hf):(3'h6)]) : ($unsigned((wire28 < wire29)) ?
                          {{reg53},
                              (reg52 ^~ reg14)} : $unsigned({reg41}))) : ((~|{reg16}) ?
                      {reg6[(4'he):(4'ha)]} : $signed($signed(reg12[(4'h9):(1'h0)]))));
              reg54 <= (reg27[(2'h3):(1'h0)] >= ($signed((~$signed(reg43))) ~^ reg15));
              reg55 <= (~&(+(reg37 ? reg16 : $signed((8'hbb)))));
            end
          reg56 <= ($unsigned((!(^~$unsigned(reg16)))) <= reg51);
          if (wire3)
            begin
              reg57 <= {(^~wire31)};
              reg58 <= (reg18 >= (-$unsigned(reg57[(3'h4):(2'h3)])));
            end
          else
            begin
              reg57 <= $unsigned(reg11[(3'h5):(2'h3)]);
              reg58 <= {(^~(reg54 ^~ $signed((~reg43))))};
              reg59 <= $signed($signed(reg44));
            end
        end
      else
        begin
          if ($signed((reg49[(4'h9):(4'h8)] & wire0)))
            begin
              reg51 <= wire2;
              reg52 <= (~^$unsigned((!wire8[(3'h6):(3'h5)])));
            end
          else
            begin
              reg51 <= {$unsigned(((reg47 | $unsigned(reg45)) ?
                      $signed((reg52 - (8'ha7))) : wire3)),
                  $unsigned(wire4)};
              reg52 <= $signed($unsigned($signed({$unsigned(reg58),
                  {reg12, reg15}})));
              reg53 <= wire33[(3'h6):(1'h0)];
              reg54 <= $signed(reg12);
              reg55 <= reg22;
            end
          reg56 <= $signed(reg37);
          reg57 <= $unsigned((^wire35[(3'h5):(3'h4)]));
        end
      reg60 <= wire2[(2'h3):(2'h2)];
      reg61 <= ($signed({wire2[(1'h0):(1'h0)],
          $signed($signed(reg36))}) >> (($signed((reg55 ?
              reg5 : wire33)) << (~|(wire0 ? wire35 : reg20))) ?
          (($signed(wire8) ? $signed(reg23) : $signed(reg47)) ?
              {reg15, $unsigned(reg47)} : {$unsigned(wire4),
                  {(8'h9c), reg15}}) : reg14[(3'h6):(1'h0)]));
      reg62 <= reg6;
    end
  always
    @(posedge clk) begin
      reg63 <= $unsigned(reg58[(3'h5):(1'h1)]);
      if ((~($signed(reg5) ?
          wire33[(3'h4):(1'h0)] : $unsigned(($signed(wire1) <<< (wire4 >> reg19))))))
        begin
          reg64 <= $signed($unsigned($signed(((wire2 ? reg52 : reg39) ?
              wire32[(2'h3):(1'h1)] : (reg26 ? reg18 : reg18)))));
          reg65 <= reg13[(2'h2):(1'h0)];
          reg66 <= $signed($signed({reg61}));
          reg67 <= {($unsigned(($unsigned(reg5) << reg43)) ?
                  (((+reg15) != (wire28 <<< wire31)) != (reg66 << wire0)) : (^{wire34})),
              reg47};
        end
      else
        begin
          reg64 <= (($signed($unsigned($signed((8'ha7)))) ~^ (!($unsigned(reg61) ?
                  $unsigned(reg66) : $unsigned(reg37)))) ?
              wire0 : (~(wire9[(2'h2):(2'h2)] ?
                  reg19 : $unsigned((reg47 ? (8'hb3) : wire35)))));
          reg65 <= ({($signed({wire2, wire9}) ?
                      $signed((~reg11)) : $unsigned((-reg55)))} ?
              $unsigned(((~^wire2[(1'h0):(1'h0)]) != (~&(reg25 != (8'ha4))))) : (+(({reg7,
                      reg66} ^~ $unsigned(wire4)) ?
                  ({(8'ha5), (8'hb6)} && (8'ha4)) : reg11)));
          reg66 <= reg13[(1'h0):(1'h0)];
          if (reg13[(1'h1):(1'h1)])
            begin
              reg67 <= $signed($unsigned($signed(reg60)));
              reg68 <= $signed($unsigned($signed($unsigned({reg10, reg57}))));
              reg69 <= reg56[(5'h12):(3'h4)];
              reg70 <= ($signed(wire2[(2'h2):(1'h1)]) ?
                  $unsigned(reg21[(2'h3):(1'h1)]) : ((wire32 ?
                          $signed(reg65[(2'h2):(1'h1)]) : {$unsigned(wire28)}) ?
                      (~&($unsigned(reg45) == {reg52})) : reg26[(4'hd):(3'h7)]));
              reg71 <= (((reg63 > reg6) ~^ $unsigned((wire30 ?
                      (reg70 < reg20) : $unsigned(reg69)))) ?
                  {(|($unsigned(reg45) ? (^~reg63) : (8'ha4))),
                      (^~(~^$unsigned(reg7)))} : reg66);
            end
          else
            begin
              reg67 <= ($signed(wire9) <<< $signed((((reg11 ?
                  reg39 : reg10) >> {wire2, (8'hb1)}) | reg21)));
              reg68 <= ({wire29, $unsigned(wire28)} ^ {reg51[(3'h6):(3'h4)]});
              reg69 <= {((^($unsigned(wire30) != {reg52,
                      reg53})) << (~$signed({wire30})))};
              reg70 <= (~^$signed($signed(reg65[(1'h0):(1'h0)])));
            end
        end
    end
  module72 #() modinst100 (wire99, clk, wire30, reg45, reg24, reg19, wire31);
endmodule

module module72  (y, clk, wire73, wire74, wire75, wire76, wire77);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire signed [(3'h4):(1'h0)] wire74;
  input wire signed [(5'h11):(1'h0)] wire75;
  input wire signed [(4'hb):(1'h0)] wire76;
  input wire [(5'h13):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire96;
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  assign y = {wire98, wire78, wire79, wire81, wire82, wire96, reg80, (1'h0)};
  assign wire78 = $unsigned(wire76[(2'h3):(1'h0)]);
  assign wire79 = $signed($unsigned($unsigned($signed(wire77))));
  always
    @(posedge clk) begin
      reg80 <= wire75[(4'h8):(3'h6)];
    end
  assign wire81 = $signed(wire75[(4'hb):(3'h4)]);
  assign wire82 = ({{{$signed((8'hb0)), $unsigned(wire77)}}} ?
                      ((&wire81) + $unsigned($unsigned($signed(wire73)))) : wire73[(1'h0):(1'h0)]);
  module83 #() modinst97 (wire96, clk, wire76, wire77, wire78, wire75, wire81);
  assign wire98 = (((~|((wire77 == wire96) ?
                          ((8'ha9) ? wire79 : wire82) : (wire79 >> (8'ha8)))) ?
                      {$unsigned((~wire77))} : $signed($unsigned(wire74[(2'h3):(2'h2)]))) >> {$signed($unsigned($unsigned(wire74))),
                      (wire76 + $unsigned($signed((8'hb2))))});
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire88;
  input wire signed [(4'hc):(1'h0)] wire87;
  input wire [(3'h6):(1'h0)] wire86;
  input wire [(4'hb):(1'h0)] wire85;
  input wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  assign y = {wire95, wire94, wire93, wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = $signed((({wire86[(3'h6):(1'h1)]} ?
                      $signed(wire84) : $unsigned((wire85 | wire88))) <<< (((wire87 ?
                      wire87 : (8'hba)) ^ (wire86 ?
                      (8'ha0) : wire85)) >> (~&(~|(8'hb7))))));
  assign wire90 = wire84[(1'h0):(1'h0)];
  assign wire91 = $unsigned(((~^$unsigned($unsigned(wire86))) ?
                      ($signed((-wire85)) - {(+wire88), wire85}) : (({wire89,
                              (8'hac)} ?
                          wire87 : (wire90 ~^ wire86)) <<< $unsigned(wire85[(2'h3):(1'h0)]))));
  assign wire92 = wire87[(4'h8):(2'h3)];
  assign wire93 = (^wire88[(4'h9):(2'h3)]);
  assign wire94 = (^wire84[(3'h6):(1'h1)]);
  assign wire95 = (wire87 >>> {(^$unsigned($unsigned(wire94)))});
endmodule
