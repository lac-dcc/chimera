module top
#(parameter param93 = ((~((((8'ha1) ? (8'ha2) : (8'hab)) ? ((8'hb1) ? (7'h42) : (8'ha3)) : (!(8'ha6))) <<< (((8'had) ? (8'haa) : (8'ha1)) ? ((8'hbf) << (8'haa)) : ((7'h41) ? (8'hab) : (8'hbf))))) ? ((((8'ha9) ? ((8'haa) == (8'haa)) : (-(8'ha5))) ? ({(8'ha0), (8'ha6)} + (~^(7'h40))) : ({(8'ha4), (8'ha6)} ? ((8'hbb) ? (8'hba) : (8'hb1)) : ((8'hbf) ? (8'ha5) : (7'h43)))) ? (~&((!(8'ha1)) ^ ((8'ha3) ? (8'hbc) : (8'hb8)))) : ((8'hb5) << (((7'h43) ? (8'hbf) : (8'hb7)) ? {(8'hbf), (8'hbb)} : ((8'haa) >> (8'ha6))))) : ((({(7'h43), (8'ha9)} + ((7'h40) << (8'hac))) ? ((!(8'h9c)) & ((8'ha6) ? (8'hbc) : (7'h43))) : ((!(8'hb6)) ? ((7'h40) ? (8'hae) : (8'hba)) : ((8'ha9) && (8'hbe)))) << (({(8'hbb)} ~^ (^~(8'haa))) ? ({(8'hae)} || (^(8'h9c))) : (~|((8'hb1) ? (8'ha2) : (7'h40)))))), 
parameter param94 = param93)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire89;
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire5,
                 wire8,
                 wire9,
                 wire89,
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
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (wire4 ? (+wire1) : wire1);
  always
    @(posedge clk) begin
      reg6 <= $unsigned(($unsigned(((wire2 <= wire4) || wire4[(2'h3):(1'h0)])) << ($signed({wire0,
              wire3}) ?
          ((wire2 <<< wire3) ?
              (^wire5) : wire5[(1'h1):(1'h1)]) : $unsigned(wire0[(3'h5):(3'h4)]))));
      reg7 <= $unsigned((~reg6[(2'h3):(2'h3)]));
    end
  assign wire8 = (((|(8'hab)) + $signed(((~&wire1) ?
                     (|wire1) : (wire1 ? wire3 : wire0)))) < (+{{(8'hbf),
                         ((8'hb1) ? wire0 : wire0)}}));
  assign wire9 = reg7[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire0[(1'h1):(1'h0)]);
      reg11 <= ((+wire1[(2'h3):(1'h1)]) ?
          $unsigned(($signed(reg10) ?
              (~|$signed(wire1)) : (wire9[(2'h2):(1'h1)] ?
                  ((8'had) ? wire2 : (8'hb7)) : (reg10 && wire8)))) : wire0);
      reg12 <= (8'hbd);
      if ($unsigned((8'hac)))
        begin
          reg13 <= $unsigned((8'hb6));
          if (wire5[(3'h5):(3'h4)])
            begin
              reg14 <= (((~wire2[(2'h3):(2'h2)]) ^ reg12[(1'h1):(1'h0)]) ?
                  ($signed($signed($signed(wire0))) ?
                      (reg10[(1'h1):(1'h1)] ?
                          reg12[(3'h5):(1'h1)] : {wire9,
                              $unsigned(wire4)}) : (&$unsigned({(8'ha9)}))) : (wire3 ?
                      $signed((reg11 && (^reg13))) : (8'hb5)));
              reg15 <= (wire2 || (~^(~&($signed(reg10) ?
                  (reg14 ? wire4 : reg12) : wire9[(1'h0):(1'h0)]))));
              reg16 <= $unsigned((|reg14));
            end
          else
            begin
              reg14 <= $unsigned(($unsigned((reg15[(3'h4):(1'h1)] ?
                  {reg11, wire4} : reg10)) * $signed($unsigned((^reg7)))));
              reg15 <= $signed({$signed((((8'hbb) ?
                      (8'ha4) : reg16) == (+wire2))),
                  reg15[(4'hd):(1'h0)]});
              reg16 <= ($signed(({$unsigned(reg16)} > ($unsigned(wire3) - (reg16 ?
                  reg14 : reg6)))) >= $signed((wire2[(2'h2):(2'h2)] ?
                  $signed((~wire5)) : reg7)));
              reg17 <= ((wire3 << $unsigned($signed($signed(wire8)))) ?
                  reg10 : $signed(reg14));
            end
          if (({(wire1[(1'h0):(1'h0)] != (reg6 != (wire0 < wire3)))} ?
              ((^((^~wire0) & (~|wire3))) ?
                  $unsigned($signed((!(8'hb8)))) : reg12[(2'h2):(1'h0)]) : $unsigned(reg17[(1'h1):(1'h0)])))
            begin
              reg18 <= (8'hb7);
              reg19 <= reg16[(3'h4):(1'h1)];
              reg20 <= ({$unsigned((8'ha0))} ? reg18[(3'h6):(3'h5)] : (8'hbc));
            end
          else
            begin
              reg18 <= $unsigned(({{$signed(wire5), wire3[(3'h4):(2'h3)]},
                      (reg16 ~^ {wire1})} ?
                  reg16[(1'h1):(1'h0)] : $unsigned($signed((reg17 ^ (8'hb3))))));
              reg19 <= (7'h40);
              reg20 <= wire9;
              reg21 <= $unsigned(($unsigned($unsigned(((8'ha0) * wire4))) ?
                  wire4[(2'h3):(2'h2)] : (wire9[(2'h2):(1'h1)] << {(+(8'hb7)),
                      (reg19 <= reg17)})));
              reg22 <= {reg12[(2'h2):(1'h0)],
                  ((+reg18) & $signed(reg13[(4'hb):(1'h1)]))};
            end
          reg23 <= ($unsigned((reg14[(1'h1):(1'h0)] ?
                  (~|reg15[(2'h2):(2'h2)]) : (((8'haf) | wire4) ?
                      wire2 : reg20[(1'h1):(1'h0)]))) ?
              wire3[(3'h6):(3'h6)] : reg7[(4'h9):(3'h4)]);
          reg24 <= $unsigned((~(({reg21} ?
              (reg14 & reg16) : (reg22 ? reg6 : reg10)) - ((reg6 < (8'hbf)) ?
              reg15[(4'h8):(3'h4)] : (reg21 ? reg22 : reg12)))));
        end
      else
        begin
          if ($signed((-(reg20[(3'h4):(1'h0)] ? wire4 : reg23[(3'h5):(1'h0)]))))
            begin
              reg13 <= reg7[(4'h9):(3'h5)];
              reg14 <= (|($unsigned(($signed(wire1) ? {reg7, wire2} : wire5)) ?
                  ($unsigned((reg17 ?
                      reg10 : reg19)) || {$unsigned(reg24)}) : (~&(^((8'ha3) ?
                      reg10 : reg21)))));
              reg15 <= $signed(((^~$unsigned($unsigned(reg20))) ?
                  wire9 : ({reg20[(3'h4):(2'h2)]} ?
                      (~((8'haf) ?
                          reg10 : reg12)) : $signed(reg13[(1'h0):(1'h0)]))));
              reg16 <= ($signed($signed(((+(8'hb1)) ?
                  $unsigned((8'ha5)) : reg24))) > (($signed($signed((8'ha9))) <= (~&reg12)) ?
                  ($unsigned({(8'ha2)}) ?
                      $signed((wire4 <<< (7'h43))) : {reg11[(4'ha):(2'h2)],
                          {(8'ha4), wire3}}) : (((wire1 ?
                          wire0 : reg24) >> reg19[(4'h9):(1'h0)]) ?
                      $signed($unsigned(wire8)) : $unsigned($unsigned(wire4)))));
              reg17 <= ((wire8[(4'he):(4'he)] & reg17) + (!$unsigned((reg12[(3'h7):(3'h7)] ?
                  (+wire1) : (wire3 | reg22)))));
            end
          else
            begin
              reg13 <= reg16;
              reg14 <= wire5;
              reg15 <= reg13;
              reg16 <= {({$signed($signed(reg10)), $signed((^~(8'hb6)))} ?
                      reg22[(4'hc):(3'h5)] : wire4[(1'h0):(1'h0)]),
                  (&($signed({wire2}) ~^ ($signed(wire0) ?
                      $signed(reg19) : $signed(reg17))))};
              reg17 <= (-wire8[(4'hd):(2'h3)]);
            end
          reg18 <= ((!$signed($unsigned($unsigned(reg19)))) ?
              $signed($unsigned($signed((~^wire2)))) : (~(reg10 ?
                  $unsigned(wire3[(4'h9):(3'h4)]) : ((reg11 ?
                      (8'hba) : wire8) < reg15))));
          reg19 <= reg10[(1'h0):(1'h0)];
          if ({reg14,
              ($signed($signed(reg22[(4'hc):(1'h1)])) == {reg7,
                  {$unsigned((8'hba)), reg18[(4'hc):(4'ha)]}})})
            begin
              reg20 <= ({reg15[(4'he):(4'hd)],
                  $unsigned($signed($signed(reg6)))} == reg18[(4'hd):(4'h9)]);
              reg21 <= (~((reg12[(2'h2):(1'h0)] ?
                  reg19 : wire3[(3'h6):(2'h2)]) != $unsigned(reg15[(2'h2):(2'h2)])));
              reg22 <= wire0[(4'he):(4'he)];
              reg23 <= (+$unsigned(($unsigned((reg19 ? wire5 : wire8)) ?
                  $unsigned(reg7[(4'hb):(4'h9)]) : $unsigned($unsigned(reg23)))));
              reg24 <= ($unsigned(wire3) ?
                  {(reg21 || $signed($signed(reg16))),
                      (|reg7)} : $unsigned((((wire8 * reg21) == $unsigned(reg7)) * (((8'ha4) ?
                          reg12 : reg22) ?
                      $unsigned(wire5) : (reg17 >>> reg22)))));
            end
          else
            begin
              reg20 <= $signed(reg11);
            end
        end
    end
  module25 #() modinst90 (wire89, clk, wire1, reg11, wire0, reg13, wire2);
  assign wire91 = $unsigned(wire89[(3'h6):(3'h4)]);
  assign wire92 = ($unsigned(reg10) ? (8'hbd) : reg18);
endmodule

module module25
#(parameter param87 = (8'ha8), 
parameter param88 = param87)
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire85;
  assign y = {wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire85,
                 (1'h0)};
  assign wire31 = $signed((wire28[(4'hc):(2'h2)] >>> ((~^(wire26 ?
                      wire28 : wire30)) >>> $signed(wire27))));
  assign wire32 = wire27;
  assign wire33 = {wire30,
                      {wire27[(2'h2):(2'h2)], (~|$unsigned($signed(wire28)))}};
  assign wire34 = (~|($signed($unsigned((wire27 << wire32))) <= (((^wire32) && $signed(wire32)) ?
                      wire31[(1'h0):(1'h0)] : {((8'hbc) ? wire28 : (8'hba))})));
  assign wire35 = wire34;
  assign wire36 = wire34;
  assign wire37 = (((^~$signed(wire26)) || wire29[(4'he):(2'h3)]) && wire33[(1'h0):(1'h0)]);
  assign wire38 = {(~|wire30)};
  module39 #() modinst86 (wire85, clk, wire29, wire27, wire37, wire33, wire32);
endmodule

module module39
#(parameter param84 = {((8'hb4) ? ({((8'hab) ? (8'ha3) : (8'ha9)), ((8'hb6) ? (8'hb1) : (8'hac))} < (~|(|(8'ha9)))) : (&(((8'h9c) ? (8'hba) : (8'haf)) ~^ (&(8'h9f)))))})
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire44;
  input wire signed [(2'h2):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg79,
                 reg78,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 (1'h0)};
  assign wire45 = (~|$signed(({((8'ha1) ? (8'hba) : wire42), $signed(wire40)} ?
                      ((wire40 ? wire40 : (8'ha8)) ?
                          (~^(8'hb3)) : (+wire42)) : $signed((+wire42)))));
  assign wire46 = ($unsigned(wire44[(3'h4):(1'h0)]) < (8'ha7));
  assign wire47 = $unsigned(wire46);
  assign wire48 = wire42[(4'he):(4'h8)];
  assign wire49 = wire46;
  always
    @(posedge clk) begin
      reg50 <= (~^(~(wire40[(1'h1):(1'h1)] > $signed(wire43[(1'h1):(1'h0)]))));
      reg51 <= $signed($unsigned((~^{(wire48 ? (8'hb2) : (8'hb2))})));
      reg52 <= ((wire45[(1'h0):(1'h0)] | $signed($unsigned($signed((7'h42))))) ^ wire41[(4'h9):(2'h2)]);
      if (wire48[(4'hd):(1'h0)])
        begin
          reg53 <= (($signed(reg52[(3'h6):(3'h6)]) ?
                  wire44[(2'h2):(1'h1)] : $signed({$signed(reg52)})) ?
              $unsigned(((wire41 ? (reg51 || reg52) : (reg52 && wire47)) ?
                  wire43 : ((|wire46) ?
                      {wire40,
                          wire42} : (wire49 <<< reg51)))) : $signed(wire42));
          if ($signed({(&(-(wire43 ^~ wire43))), reg53}))
            begin
              reg54 <= wire40[(2'h2):(1'h0)];
            end
          else
            begin
              reg54 <= $unsigned({$signed(((reg54 ? reg50 : (8'hbf)) ?
                      (reg51 <= wire41) : wire40[(3'h5):(3'h5)]))});
            end
          reg55 <= $unsigned(wire46);
          reg56 <= ((~reg54) >> $unsigned($unsigned(((wire43 ?
              wire42 : wire47) > reg55))));
          if (wire47[(4'h8):(3'h5)])
            begin
              reg57 <= wire48[(3'h4):(3'h4)];
              reg58 <= (({$unsigned((wire45 ?
                          reg51 : reg55))} || (wire44[(3'h5):(2'h3)] ?
                      {wire45} : ((reg55 ? wire46 : reg55) ? wire43 : reg55))) ?
                  $signed($signed(((wire48 || reg55) ?
                      (reg57 ?
                          (8'hbb) : wire47) : reg57[(4'ha):(2'h3)]))) : wire40[(3'h6):(1'h0)]);
              reg59 <= $signed(($unsigned($unsigned($signed(reg56))) ?
                  $unsigned($unsigned({(8'h9d)})) : (~((+reg52) ?
                      reg54 : ((8'h9f) >> wire45)))));
              reg60 <= {$signed({({wire41, reg51} ?
                          $unsigned(wire48) : (~^reg53)),
                      wire40}),
                  wire49};
              reg61 <= $signed(((!reg51[(3'h4):(2'h2)]) > (~^(wire41[(3'h5):(1'h1)] ?
                  (reg50 ? wire42 : reg54) : (reg52 ^ reg57)))));
            end
          else
            begin
              reg57 <= (((!$unsigned($unsigned(reg56))) ?
                      wire44 : reg61[(4'h9):(3'h4)]) ?
                  $signed((((wire49 ? reg60 : reg60) ?
                          {reg60} : (wire49 ? (8'hbb) : wire47)) ?
                      ((8'h9f) ?
                          (^reg57) : $signed(reg59)) : (~$unsigned(reg55)))) : reg55[(4'h9):(4'h9)]);
            end
        end
      else
        begin
          reg53 <= reg51;
        end
      reg62 <= reg51[(1'h0):(1'h0)];
    end
  assign wire63 = ($unsigned($unsigned({wire40, $signed(reg55)})) ?
                      $unsigned($signed((8'hb4))) : ($signed(($unsigned(wire45) ?
                              wire41[(3'h5):(3'h4)] : (reg54 ?
                                  wire41 : reg54))) ?
                          (7'h42) : (reg62 << wire41[(2'h3):(1'h1)])));
  assign wire64 = {$signed(reg52[(3'h6):(1'h1)])};
  assign wire65 = reg58[(4'hd):(4'h9)];
  assign wire66 = (8'hbd);
  assign wire67 = $signed((wire46[(1'h1):(1'h1)] ?
                      $signed($signed($unsigned(reg62))) : ((~^$signed(wire65)) == reg50)));
  assign wire68 = {wire41,
                      ((^wire42[(4'he):(3'h6)]) ?
                          $signed(((~|reg60) ?
                              reg53 : $signed(wire41))) : ((~|reg52) || ($signed(wire43) > $signed(wire44))))};
  assign wire69 = reg53[(4'hd):(4'hd)];
  assign wire70 = reg52[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg71 <= (~^($unsigned(((wire41 && wire64) >> wire69[(4'hd):(4'h8)])) << wire41[(3'h5):(2'h3)]));
      reg72 <= wire47[(3'h4):(2'h3)];
      reg73 <= $unsigned({reg71,
          (wire43[(1'h0):(1'h0)] != ($signed((8'haa)) ?
              (~&(8'h9d)) : wire48))});
      reg74 <= (&reg58);
    end
  assign wire75 = (^$unsigned(reg54));
  assign wire76 = ((reg74[(4'hf):(1'h0)] ?
                      $signed((~^{wire68, wire42})) : (($signed((8'hb1)) ?
                          reg55[(5'h15):(5'h13)] : $signed(reg56)) * ({wire44} ?
                          (reg61 ? reg56 : wire70) : {reg50}))) != {(wire40 ?
                          wire41 : reg51)});
  always
    @(posedge clk) begin
      reg77 <= $unsigned(wire42);
      reg78 <= $unsigned($unsigned($signed(wire63[(3'h7):(3'h5)])));
      reg79 <= {$signed(reg61)};
    end
  assign wire80 = {((|$unsigned(reg78[(2'h3):(1'h1)])) != {($signed(reg60) <= wire43),
                          reg61[(4'hb):(4'h8)]}),
                      wire65};
  assign wire81 = $signed($unsigned($signed(reg79[(4'hf):(4'hf)])));
  assign wire82 = $unsigned($signed(wire44[(1'h1):(1'h1)]));
  assign wire83 = $unsigned({{$unsigned((reg52 ? wire67 : (7'h40))), wire63}});
endmodule
