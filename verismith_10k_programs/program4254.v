module top
#(parameter param91 = {(-(((-(8'h9e)) ? ((8'ha5) > (8'hbd)) : (|(8'hb9))) & (!(8'hbe))))}, 
parameter param92 = {((&(param91 ? param91 : {(8'hb8), param91})) ? param91 : (param91 <= (param91 ? (param91 ? param91 : param91) : (param91 ? param91 : param91))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire85;
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire5,
                 wire7,
                 wire25,
                 wire35,
                 wire85,
                 reg87,
                 reg6,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire5 = ((+wire2) + wire1);
  always
    @(posedge clk) begin
      reg6 <= (wire2 ? (+{$unsigned((wire4 ~^ wire4))}) : $signed(wire0));
    end
  assign wire7 = (|$signed(wire1[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if (((!(~|wire1[(3'h6):(2'h2)])) != (~&wire5[(5'h12):(4'he)])))
        begin
          reg8 <= (((~&$unsigned((8'hbb))) ?
                  (^(~^$unsigned(wire7))) : ((~|$unsigned((8'h9f))) >> (8'hae))) ?
              {{wire5,
                      ((~&(8'ha9)) ?
                          $signed(wire3) : (reg6 ? wire7 : (8'hac)))},
                  (~|wire1)} : $signed({wire2[(3'h5):(2'h3)]}));
          reg9 <= $signed({((^~(^~wire7)) >>> wire7[(4'ha):(3'h4)]),
              $signed(reg8[(4'hb):(3'h4)])});
          reg10 <= ($unsigned((~|$unsigned(((8'had) >> reg8)))) | $unsigned(wire4));
          if (reg6[(4'he):(3'h5)])
            begin
              reg11 <= $signed((wire4 ?
                  (((wire0 && wire0) && (wire1 ? wire4 : wire4)) ?
                      $signed((wire0 <= wire2)) : wire0) : ($unsigned(((8'ha6) >> reg9)) ^ ((wire1 ?
                          wire4 : reg10) ?
                      wire7 : (wire5 ? wire2 : reg8)))));
              reg12 <= wire4[(4'hd):(3'h4)];
            end
          else
            begin
              reg11 <= {$signed(wire3[(3'h6):(2'h2)]), reg6};
            end
          reg13 <= (8'ha6);
        end
      else
        begin
          reg8 <= wire1[(2'h3):(2'h2)];
          reg9 <= reg12;
          if ($unsigned(reg6))
            begin
              reg10 <= wire3[(3'h6):(1'h0)];
              reg11 <= ((&wire4[(4'he):(3'h4)]) != reg12);
              reg12 <= (reg12 != (~$signed({reg11[(3'h7):(1'h0)]})));
            end
          else
            begin
              reg10 <= $unsigned((~(((wire5 ? wire4 : wire4) ?
                  $unsigned(wire4) : (reg11 ?
                      (8'ha1) : reg12)) <= (reg9[(3'h7):(1'h0)] ?
                  $signed((7'h40)) : wire2[(4'h8):(2'h3)]))));
              reg11 <= wire7;
            end
          reg13 <= ($signed(reg13) != ((((reg8 <<< wire7) >= (wire5 - wire1)) <<< ((reg11 ~^ wire0) ?
              $unsigned(reg8) : $unsigned(wire3))) && $unsigned($signed((reg10 ?
              wire4 : (8'hb9))))));
        end
      reg14 <= {wire3[(1'h1):(1'h0)], reg9};
      if ($signed($unsigned($unsigned($signed((8'ha4))))))
        begin
          reg15 <= (&wire0);
          if ((~($signed({$signed((8'ha9)),
              wire4}) != (+$signed((wire0 ^~ reg15))))))
            begin
              reg16 <= {$signed((~({reg6} ? reg15 : $unsigned(wire4)))),
                  reg10[(4'h8):(3'h4)]};
              reg17 <= wire3;
              reg18 <= ($signed((($unsigned(reg11) && $unsigned(reg12)) ?
                  $unsigned(reg9[(1'h1):(1'h0)]) : (+wire4[(3'h7):(1'h1)]))) >= (8'hbe));
            end
          else
            begin
              reg16 <= reg9;
            end
        end
      else
        begin
          reg15 <= $unsigned($unsigned(((&reg11) ?
              reg14[(2'h2):(1'h1)] : reg12)));
          reg16 <= $unsigned(reg18[(2'h3):(2'h3)]);
          reg17 <= reg14;
          reg18 <= $signed($unsigned($signed(((reg14 ?
              (7'h42) : (8'hb0)) || $signed(reg9)))));
        end
      reg19 <= (8'hb1);
      if (wire0)
        begin
          if (wire0[(2'h2):(1'h0)])
            begin
              reg20 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg21 <= wire5[(5'h14):(4'h8)];
              reg22 <= ((reg21 > $signed($signed($unsigned(reg11)))) ?
                  reg6[(3'h4):(1'h1)] : $signed($signed(wire2)));
            end
          else
            begin
              reg20 <= (!(reg15[(4'ha):(4'h8)] ?
                  ((8'hae) & reg22) : $signed((reg13 ? {reg6} : wire2))));
              reg21 <= {$signed(reg21[(4'he):(2'h3)])};
              reg22 <= {((~^$signed((wire7 ? reg6 : wire1))) >= (&{{(8'hbb),
                          (8'ha0)}})),
                  {(~($signed(reg17) >> (-reg6))),
                      $unsigned(reg21[(4'hb):(1'h1)])}};
              reg23 <= (reg8 ?
                  $unsigned((|$signed(wire0[(4'hf):(4'h8)]))) : $unsigned(($unsigned($unsigned(reg18)) >> reg21)));
            end
          reg24 <= $signed(reg20[(2'h2):(1'h0)]);
        end
      else
        begin
          reg20 <= $signed($signed(reg20));
          reg21 <= (&reg16[(1'h0):(1'h0)]);
          reg22 <= $signed(reg8[(4'hf):(4'hf)]);
        end
    end
  assign wire25 = wire7[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      if ((^$signed(wire3[(2'h2):(2'h2)])))
        begin
          if ($unsigned(wire1))
            begin
              reg26 <= (~((|{reg17[(3'h5):(3'h4)]}) ?
                  {$unsigned(wire1[(3'h5):(3'h4)]),
                      ((reg14 ^ wire1) ?
                          (wire5 && reg11) : (reg11 ?
                              wire3 : reg14))} : $unsigned((|$signed((8'hbc))))));
            end
          else
            begin
              reg26 <= $unsigned((((+$unsigned(wire7)) <<< (reg22 ?
                      {wire2} : (|reg14))) ?
                  reg12[(5'h10):(1'h1)] : reg10[(3'h7):(1'h0)]));
              reg27 <= (-wire3[(5'h10):(4'h8)]);
              reg28 <= {(~^(-reg16[(1'h1):(1'h1)])), reg18[(2'h2):(2'h2)]};
            end
          if ($signed(($unsigned($unsigned(wire7[(1'h1):(1'h1)])) ?
              {(+reg21[(2'h2):(2'h2)]),
                  ($signed(wire0) == {reg16,
                      reg8})} : (wire3[(4'h9):(1'h0)] - $signed((+reg19))))))
            begin
              reg29 <= $signed($unsigned(((+(&reg13)) ?
                  $signed($signed((8'hb7))) : reg27[(4'ha):(3'h5)])));
            end
          else
            begin
              reg29 <= (8'hbe);
              reg30 <= $unsigned(($signed((reg26 >> reg16[(2'h2):(1'h0)])) ?
                  $signed($signed($unsigned((8'ha2)))) : $signed(($unsigned(wire1) ?
                      (reg14 * reg22) : (wire3 >= wire4)))));
              reg31 <= reg27[(3'h7):(1'h0)];
              reg32 <= (wire0 ?
                  $unsigned((($unsigned(wire0) || {reg24}) ?
                      wire0[(4'h9):(1'h1)] : $unsigned(reg9))) : reg24[(1'h1):(1'h1)]);
              reg33 <= reg29[(4'ha):(1'h1)];
            end
          reg34 <= $signed($unsigned($unsigned($unsigned({reg8, (8'ha7)}))));
        end
      else
        begin
          reg26 <= ($signed($signed({(~&(8'hb8))})) ~^ (^~(reg19 <= $unsigned($unsigned(wire25)))));
          reg27 <= ((~|(reg8 + (!((8'ha8) != reg32)))) ?
              $unsigned(((8'ha9) ?
                  reg15[(5'h10):(3'h4)] : $unsigned((wire5 ?
                      reg13 : wire3)))) : {(^~$signed($signed(reg13)))});
        end
    end
  assign wire35 = $unsigned(($unsigned((((8'h9f) ? reg24 : (8'ha4)) ?
                      {reg18, (8'hbf)} : reg12[(3'h6):(3'h5)])) ^~ (reg21 ?
                      ($signed(wire0) > {reg6}) : {(reg34 ? wire4 : reg29),
                          (8'hae)})));
  module36 #() modinst86 (wire85, clk, wire35, wire7, wire2, reg14);
  always
    @(posedge clk) begin
      reg87 <= ($unsigned({reg9[(3'h4):(2'h2)], {$unsigned(reg20), reg22}}) ?
          wire1[(2'h2):(1'h0)] : (-reg11));
    end
  assign wire88 = reg30[(1'h0):(1'h0)];
  assign wire89 = $unsigned($unsigned(($signed($signed(reg23)) - $unsigned(reg26))));
  assign wire90 = $signed(reg11[(1'h0):(1'h0)]);
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  input wire [(4'he):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  assign y = {wire83, wire43, wire42, wire41, (1'h0)};
  assign wire41 = $unsigned($unsigned((~^wire37[(5'h10):(4'he)])));
  assign wire42 = $unsigned((-(wire37 ?
                      ({wire39} ?
                          $unsigned((8'hb6)) : (wire41 ^ (8'ha1))) : $signed((8'hb4)))));
  assign wire43 = (-(~|(~&$unsigned($signed(wire41)))));
  module44 #() modinst84 (.wire48(wire39), .wire46(wire40), .wire47(wire43), .clk(clk), .y(wire83), .wire45(wire41));
endmodule

module module44
#(parameter param82 = {{((~^((8'had) ? (8'haa) : (7'h43))) ? (^~(~^(8'hb3))) : (((8'hab) ? (8'ha7) : (8'ha0)) ? ((8'ha0) ? (8'hb2) : (8'ha0)) : {(8'h9f), (8'haf)}))}, ({(~^((8'h9d) ? (7'h41) : (8'hbe))), (((8'ha7) ^~ (8'ha8)) | ((8'ha5) <= (8'h9d)))} ? ((((8'hb4) || (8'h9d)) ? ((7'h40) ~^ (8'hbf)) : ((8'ha6) ~^ (8'hb3))) ? (^((8'hb0) >> (8'ha6))) : (+{(8'hb7), (8'ha1)})) : {(^{(8'hb8)})})})
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire48;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire [(5'h13):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire49 = (-(~|$unsigned($unsigned(wire45[(1'h0):(1'h0)]))));
  assign wire50 = ($unsigned({(!$signed(wire47))}) == wire48[(1'h0):(1'h0)]);
  assign wire51 = ((wire47 <<< $unsigned(($unsigned(wire46) <= ((8'h9c) ~^ (8'hae))))) ?
                      ($signed(wire50) >> ((!$unsigned(wire46)) ?
                          ($signed(wire47) ~^ (wire45 != wire48)) : (~^$signed(wire45)))) : (-$unsigned({(wire48 && wire49),
                          wire45[(2'h2):(1'h1)]})));
  assign wire52 = {$signed(wire50),
                      ({((&wire48) ?
                                  (wire51 ?
                                      wire51 : wire51) : (wire48 ^~ wire47))} ?
                          wire51[(3'h6):(2'h2)] : wire46)};
  always
    @(posedge clk) begin
      reg53 <= ((~|wire50[(1'h1):(1'h1)]) ?
          ((wire52[(2'h2):(1'h1)] >> (wire49[(1'h1):(1'h1)] << ((8'ha7) ?
                  wire47 : (8'hac)))) ?
              ((7'h40) ?
                  wire45 : (~|(wire47 | wire49))) : $unsigned({$signed(wire51),
                  (wire51 ? wire45 : wire45)})) : ((~&$signed((8'hb2))) ?
              (($signed(wire50) ? $unsigned(wire48) : wire50[(3'h4):(2'h3)]) ?
                  wire46 : {wire51[(2'h2):(1'h0)]}) : $signed((^wire50))));
      reg54 <= ($signed((((+reg53) - $signed(wire52)) - ($signed(wire51) ?
              (~&wire48) : ((8'hb7) ? wire50 : reg53)))) ?
          wire47[(4'hc):(1'h0)] : reg53);
      reg55 <= wire49[(3'h4):(3'h4)];
    end
  assign wire56 = (((wire52[(3'h5):(2'h3)] - (wire48 ?
                          $unsigned(wire47) : (wire47 ?
                              wire47 : wire46))) >= (reg53 <<< wire48)) ?
                      wire48[(1'h0):(1'h0)] : (8'h9d));
  assign wire57 = (&{$unsigned(((wire56 & wire51) ?
                          (8'hba) : $unsigned((8'ha5))))});
  assign wire58 = wire49[(4'ha):(2'h3)];
  assign wire59 = $unsigned($signed((reg53 ?
                      wire46[(3'h6):(3'h5)] : $unsigned($signed(wire46)))));
  always
    @(posedge clk) begin
      if ((~^$signed(wire50)))
        begin
          reg60 <= $unsigned(wire56[(1'h1):(1'h0)]);
          if ({wire51[(4'h8):(2'h2)]})
            begin
              reg61 <= reg60[(5'h13):(4'h8)];
              reg62 <= wire59;
              reg63 <= ((wire57 & reg53[(4'h8):(3'h7)]) && $unsigned(wire56));
            end
          else
            begin
              reg61 <= (reg54[(5'h10):(3'h7)] ?
                  (^~(^~((wire56 != reg63) << (reg63 < wire48)))) : (wire50 ?
                      wire48[(4'hc):(2'h3)] : $signed((|$signed((8'hb9))))));
              reg62 <= $unsigned((~|$signed(reg63)));
              reg63 <= wire48;
            end
          reg64 <= ($signed(wire57) + (~^{wire51[(1'h0):(1'h0)]}));
          reg65 <= (reg62 == (wire50 < ({(reg53 ? wire52 : (8'ha1))} ?
              reg63 : {reg53})));
          reg66 <= {(8'ha7), {{$unsigned($unsigned(wire51))}}};
        end
      else
        begin
          reg60 <= (^$signed({(+(wire56 != (8'ha7))), reg55}));
          if ((((|(8'h9c)) && (($signed((8'haa)) != {wire47, wire52}) ?
              $signed($signed(wire45)) : $signed((wire48 <<< reg60)))) & (~^wire47[(3'h6):(3'h5)])))
            begin
              reg61 <= ($unsigned((~^(((8'hbe) ? wire49 : reg65) ?
                      {wire48, wire56} : (wire51 <<< reg66)))) ?
                  $signed($signed((8'hb2))) : (~$signed(wire59[(3'h4):(2'h2)])));
              reg62 <= $unsigned(($signed(((reg62 ?
                      wire51 : wire59) != (reg60 >>> wire52))) ?
                  (-reg62) : (|(((8'ha1) <<< wire48) * reg60))));
              reg63 <= $unsigned($unsigned($signed($unsigned($unsigned(wire50)))));
            end
          else
            begin
              reg61 <= $unsigned($signed((wire46 ?
                  wire57 : ((reg55 - reg64) ^~ (wire58 ? wire48 : wire48)))));
            end
          reg64 <= $signed((reg64[(3'h6):(1'h1)] ?
              wire50 : (!wire56[(1'h1):(1'h1)])));
          reg65 <= wire51;
          reg66 <= (8'haa);
        end
      reg67 <= wire56;
      reg68 <= wire48[(1'h0):(1'h0)];
    end
  assign wire69 = $signed((reg64 ?
                      $unsigned(reg68[(1'h0):(1'h0)]) : $signed(($signed(reg61) ?
                          (!reg67) : (reg54 ? reg62 : reg67)))));
  assign wire70 = ($signed(wire58[(2'h2):(1'h1)]) * reg62);
  assign wire71 = $signed((~|wire52));
  assign wire72 = (|(wire51[(3'h7):(2'h3)] ?
                      ($signed($unsigned(wire70)) <<< $signed((wire70 ?
                          reg61 : reg61))) : (wire58 <<< $signed(wire46))));
  always
    @(posedge clk) begin
      reg73 <= $unsigned((($signed(wire52) & ((wire52 ?
          reg54 : (8'ha6)) <= $unsigned(wire56))) != $signed((-wire59[(4'h8):(4'h8)]))));
      reg74 <= $unsigned($unsigned((($unsigned((8'hba)) ?
              (wire47 ? wire49 : reg64) : reg54) ?
          $signed($signed(reg64)) : ((+(8'hbe)) > wire70))));
      reg75 <= (wire51 ?
          ($unsigned({(&wire45), (wire57 - wire70)}) ?
              (($signed((8'hac)) ? reg54 : $unsigned(reg63)) ?
                  $signed($signed(reg64)) : reg67[(3'h5):(2'h3)]) : ((8'ha4) ?
                  (|(~|reg64)) : {$unsigned(reg67)})) : $unsigned((reg68[(2'h2):(1'h0)] & $signed($unsigned(wire48)))));
      reg76 <= $unsigned(wire46);
    end
  assign wire77 = wire51;
  assign wire78 = wire77[(3'h7):(3'h6)];
  assign wire79 = {reg64[(1'h0):(1'h0)],
                      (~&(({reg62,
                          reg67} && (wire69 && wire56)) * $signed((~reg68))))};
  assign wire80 = $signed(reg61);
  assign wire81 = (~|wire69);
endmodule
