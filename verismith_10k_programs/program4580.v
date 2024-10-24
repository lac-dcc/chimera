module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire80;
  assign y = {wire86, wire85, wire84, wire83, wire82, wire4, wire80, (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst81 (.wire8(wire3), .clk(clk), .wire6(wire4), .y(wire80), .wire7(wire0), .wire9(wire1), .wire10(wire2));
  assign wire82 = $signed((($signed($signed(wire80)) ?
                          (~^(wire0 > (7'h40))) : ($unsigned(wire4) ?
                              (wire3 ? wire4 : wire4) : (wire2 ?
                                  wire1 : wire4))) ?
                      $unsigned(wire1) : wire4[(4'hf):(1'h0)]));
  assign wire83 = ((-(~((|wire0) ?
                      wire82 : (wire80 ?
                          wire80 : wire82)))) >= (wire82[(4'hc):(4'hb)] ?
                      $signed($signed((wire1 > wire80))) : ({$unsigned(wire2),
                          (~|wire0)} & $unsigned($unsigned(wire1)))));
  assign wire84 = $unsigned((~$signed((^(wire4 | wire1)))));
  assign wire85 = wire82;
  assign wire86 = (!$unsigned(wire1));
endmodule

module module5
#(parameter param79 = (-(({((8'ha2) < (8'hb1)), ((8'ha5) + (8'hab))} + (((8'hbd) ? (8'hb5) : (8'h9e)) <<< (~^(8'ha2)))) == ((((8'hb2) ? (7'h43) : (8'hb4)) ? ((8'hb5) ? (8'ha0) : (8'ha6)) : (&(8'hbe))) ^ (^(~^(8'hbb)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h25a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire77;
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  assign y = {wire11,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire46,
                 wire50,
                 wire51,
                 wire77,
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
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg47,
                 reg48,
                 reg49,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire11 = $signed((~&(($signed(wire6) ?
                      $signed(wire7) : (wire10 + wire7)) ^~ wire10[(4'h8):(1'h1)])));
  always
    @(posedge clk) begin
      if ((wire10[(3'h6):(3'h5)] ?
          ($unsigned(((wire7 ^~ wire10) ?
              {wire9, (8'h9f)} : (wire10 ?
                  wire7 : wire11))) || wire11) : wire7[(4'h9):(4'h8)]))
        begin
          reg12 <= ((~|wire9) | wire9);
        end
      else
        begin
          if (wire7)
            begin
              reg12 <= {wire7, (wire9 ? wire9[(3'h4):(2'h3)] : (+{(-wire9)}))};
              reg13 <= wire11;
              reg14 <= (~$signed(wire10));
              reg15 <= ((8'ha3) > (reg13 ?
                  ((~^$signed(reg14)) > wire10) : (&((wire6 ?
                      (7'h43) : (8'hb5)) || $signed(wire10)))));
            end
          else
            begin
              reg12 <= $unsigned($unsigned(reg15[(2'h2):(2'h2)]));
              reg13 <= (wire7[(3'h4):(1'h0)] ?
                  $unsigned((($unsigned(wire6) ?
                      (^~wire8) : $signed(wire11)) <= $unsigned((wire6 <<< wire8)))) : $unsigned($signed({$unsigned((8'hb8))})));
            end
          reg16 <= $unsigned(({$unsigned((8'hbb))} ? (8'ha8) : wire7));
        end
      reg17 <= {{(~^{(wire8 ~^ reg15), $unsigned(reg15)})},
          (~|(wire8 * {wire6[(2'h3):(1'h1)], wire10[(1'h0):(1'h0)]}))};
      if ((~|{{$signed({(8'ha9)})}}))
        begin
          reg18 <= wire7[(2'h2):(2'h2)];
          reg19 <= reg18;
          reg20 <= wire6[(3'h5):(3'h5)];
        end
      else
        begin
          reg18 <= ($unsigned(wire6) ~^ (!$unsigned($signed($signed(reg14)))));
          reg19 <= wire8;
        end
      if (({wire6[(3'h7):(3'h4)]} ? wire8 : (8'ha0)))
        begin
          reg21 <= ((~&$unsigned($unsigned(wire11[(2'h3):(1'h1)]))) ?
              reg12 : reg12);
          reg22 <= $unsigned(((~|$unsigned(reg21[(5'h10):(1'h1)])) ?
              ($signed(wire6) || wire8) : wire11));
          reg23 <= (wire10 ?
              $signed((reg15 + (|(wire8 - (8'haa))))) : ($unsigned($unsigned(reg22[(1'h0):(1'h0)])) >>> {((wire11 >= reg16) ?
                      reg16 : $unsigned(reg13))}));
        end
      else
        begin
          reg21 <= wire6;
          reg22 <= (~|(({$unsigned(wire10)} >= $signed((wire8 ?
                  reg17 : reg19))) ?
              (~^($unsigned(wire6) >> $unsigned(reg18))) : $unsigned($signed($unsigned(wire6)))));
          reg23 <= $signed(({(|{reg19}),
              reg18[(3'h7):(1'h0)]} - (reg12 >>> (((8'hae) < reg19) << {reg17}))));
          if ((~reg21))
            begin
              reg24 <= (~&{{(reg21[(3'h5):(1'h1)] ?
                          $unsigned((8'hb3)) : (7'h42))}});
              reg25 <= reg19;
              reg26 <= ($signed(reg17[(1'h0):(1'h0)]) ?
                  ((reg13[(2'h3):(1'h0)] ?
                          $signed($unsigned(reg16)) : (8'hbe)) ?
                      $unsigned((|(reg14 < reg20))) : $unsigned($signed(reg20[(5'h11):(5'h10)]))) : (~|reg21));
              reg27 <= reg12;
            end
          else
            begin
              reg24 <= (^~reg23);
              reg25 <= $signed(reg13);
              reg26 <= $unsigned((^~({reg21} || wire8)));
            end
        end
      reg28 <= $signed($unsigned($signed({(reg24 ? wire11 : wire9),
          $signed(reg22)})));
    end
  assign wire29 = (reg25 ? reg17[(3'h6):(2'h2)] : (&(^~{{reg19}})));
  assign wire30 = wire10;
  assign wire31 = (reg21[(4'he):(3'h6)] & reg28[(1'h0):(1'h0)]);
  assign wire32 = ($signed(({wire6[(3'h6):(2'h2)], reg23[(1'h1):(1'h0)]} ?
                      (-wire10[(2'h3):(1'h1)]) : $signed((wire9 ~^ reg27)))) == ($unsigned((reg16[(3'h5):(3'h5)] ?
                          (+reg16) : (!reg15))) ?
                      ($unsigned($signed((8'ha6))) <<< $unsigned(wire8[(1'h0):(1'h0)])) : $unsigned((wire6[(5'h12):(4'hb)] >> {(8'hb8)}))));
  assign wire33 = wire30[(2'h2):(1'h0)];
  assign wire34 = (((-$signed((&(8'hab)))) ~^ reg28[(5'h12):(3'h5)]) << {{reg24,
                          ((reg24 ? reg24 : wire6) ?
                              reg21 : (wire30 ~^ reg20))}});
  assign wire35 = (~|wire7);
  assign wire36 = (+(8'hbe));
  always
    @(posedge clk) begin
      if ((^wire30[(3'h6):(3'h6)]))
        begin
          reg37 <= (^~$signed($signed(($unsigned(reg26) + (reg12 ?
              reg21 : reg19)))));
          reg38 <= reg22[(3'h6):(3'h5)];
          reg39 <= $signed((~|reg22));
        end
      else
        begin
          if ($signed(reg21))
            begin
              reg37 <= reg26;
            end
          else
            begin
              reg37 <= (reg13 ?
                  ($signed((wire9[(3'h6):(1'h1)] ?
                      reg13 : (wire36 >= reg24))) >= (^~{((8'hae) ?
                          reg24 : (8'hb7)),
                      {(8'haa), (8'h9c)}})) : $unsigned(reg20[(3'h6):(1'h0)]));
              reg38 <= (!wire32[(4'he):(4'hd)]);
              reg39 <= $unsigned((!wire35[(5'h11):(1'h1)]));
              reg40 <= $signed($signed($signed((reg17 ?
                  {(8'hac), reg39} : $signed(wire34)))));
            end
          reg41 <= reg27;
          if (((wire10 ? wire11[(2'h2):(1'h1)] : wire30) ?
              reg18 : (|(+$signed($unsigned(wire7))))))
            begin
              reg42 <= ($unsigned((reg28 ?
                  wire34 : ((^reg38) >> {wire32}))) ^~ ((reg15 ?
                      reg27[(3'h7):(2'h3)] : wire11[(4'h9):(2'h2)]) ?
                  $unsigned((~$unsigned(reg38))) : ($signed((reg39 ?
                          wire32 : reg18)) ?
                      $signed($unsigned(wire29)) : $signed(reg13[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg42 <= (8'haa);
              reg43 <= reg20[(5'h11):(4'he)];
              reg44 <= (|$unsigned((($unsigned(wire31) ?
                      (reg43 ? reg26 : wire9) : (|wire35)) ?
                  (reg37[(1'h0):(1'h0)] >= reg14[(1'h0):(1'h0)]) : {reg21,
                      ((7'h43) ? wire11 : reg20)})));
              reg45 <= $unsigned(reg19);
            end
        end
    end
  assign wire46 = reg41;
  always
    @(posedge clk) begin
      reg47 <= (reg15[(1'h0):(1'h0)] <= $signed(reg17[(3'h5):(1'h1)]));
      reg48 <= wire46;
      reg49 <= ((+reg47) & $signed(($unsigned(reg26[(3'h7):(2'h3)]) | $signed((reg12 ?
          wire46 : reg25)))));
    end
  assign wire50 = {$signed((~&reg42)),
                      ((|(&(wire36 ? wire36 : wire35))) << {$unsigned((reg18 ?
                              reg47 : wire33)),
                          $unsigned((reg22 ? reg13 : reg15))})};
  assign wire51 = $unsigned($unsigned(reg37[(4'hb):(2'h2)]));
  always
    @(posedge clk) begin
      reg52 <= (reg22[(1'h1):(1'h1)] == (|$unsigned((^(reg25 ?
          wire46 : reg14)))));
      reg53 <= reg28[(4'he):(3'h5)];
    end
  module54 #() modinst78 (.y(wire77), .wire55(reg25), .wire56(reg39), .wire57(reg44), .wire58(wire51), .clk(clk));
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire58;
  input wire signed [(5'h14):(1'h0)] wire57;
  input wire signed [(4'hb):(1'h0)] wire56;
  input wire [(4'h9):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire60;
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  assign y = {wire60,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= wire58;
    end
  assign wire60 = ((~({(reg59 | (8'hb3)), (reg59 <= wire55)} ?
                          (~|reg59[(3'h5):(1'h0)]) : ($unsigned(reg59) >>> (|(8'haf))))) ?
                      ((8'ha4) ?
                          (~((wire56 ? reg59 : (8'hb1)) ?
                              reg59[(4'hd):(2'h2)] : wire58[(3'h7):(3'h6)])) : wire55[(2'h2):(1'h0)]) : $signed(wire55[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg61 <= {$unsigned(((^$unsigned(wire55)) ^~ $signed((~reg59))))};
    end
  always
    @(posedge clk) begin
      reg62 <= $unsigned($signed($signed((reg59 ? wire56 : (8'h9d)))));
      if ({((|$signed({wire60, wire55})) > (&(~^{(8'hbb), (8'had)}))),
          {reg62[(1'h0):(1'h0)], (&wire56[(1'h0):(1'h0)])}})
        begin
          if ($unsigned((reg61 >> {(~$unsigned(wire60))})))
            begin
              reg63 <= wire55[(3'h6):(3'h6)];
              reg64 <= $unsigned($unsigned(($unsigned($unsigned(wire57)) ?
                  wire58 : (~^{reg63, (8'ha6)}))));
            end
          else
            begin
              reg63 <= {(|$unsigned($unsigned((~&(8'hbf))))),
                  {(~|(&$unsigned(wire60))), wire56[(3'h4):(3'h4)]}};
              reg64 <= ((~^reg59) ? $signed({reg63, (|(-(8'hb1)))}) : (8'hba));
              reg65 <= (~({((wire56 ? reg63 : reg62) ? (|wire56) : reg59)} ?
                  wire60[(1'h1):(1'h0)] : (^(-(^wire56)))));
              reg66 <= reg65;
            end
        end
      else
        begin
          reg63 <= reg64;
          reg64 <= {$unsigned(reg65)};
          reg65 <= {reg63, reg62[(4'hd):(1'h0)]};
          reg66 <= wire58;
          reg67 <= $unsigned(reg66);
        end
      reg68 <= $signed($signed((~^reg59[(3'h5):(3'h4)])));
      if (($signed($unsigned((wire58[(1'h1):(1'h1)] >>> $unsigned((8'had))))) && (^(^~(reg63 ^~ (reg68 && reg67))))))
        begin
          if ((^~{(^~$unsigned(reg64[(1'h1):(1'h0)])),
              $signed($unsigned($signed(reg66)))}))
            begin
              reg69 <= (reg62 ?
                  (!(~&($unsigned((8'hb8)) ?
                      $signed((8'ha3)) : (8'ha7)))) : wire56[(4'hb):(4'h9)]);
              reg70 <= $unsigned($unsigned((+{reg59,
                  (reg69 ? wire58 : reg67)})));
              reg71 <= (+$signed((reg64[(2'h2):(2'h2)] ^~ (reg64[(4'hb):(3'h5)] ?
                  reg65 : $unsigned(wire55)))));
              reg72 <= {(reg70 ?
                      (~^reg67) : (($unsigned(reg67) >>> (reg68 ?
                              reg69 : (7'h42))) ?
                          (8'h9e) : $unsigned(((8'hb0) && reg65)))),
                  reg63};
            end
          else
            begin
              reg69 <= wire57;
              reg70 <= reg66;
              reg71 <= ((~(8'ha4)) ?
                  $signed((~|($unsigned(reg68) >>> (wire57 ?
                      reg70 : reg68)))) : $signed({$signed({reg71, reg66}),
                      $signed(reg59)}));
            end
          reg73 <= (((^reg71) ?
                  $signed($unsigned(((8'ha9) && reg66))) : (reg64 ?
                      (~&(reg72 ^~ reg72)) : reg63)) ?
              (-$unsigned({(8'h9f),
                  ((8'ha8) ?
                      reg64 : reg70)})) : ($unsigned($unsigned($unsigned((8'hae)))) && $unsigned(($signed(reg62) ?
                  reg68[(3'h5):(3'h5)] : $signed(reg71)))));
          reg74 <= (~$unsigned((~|(|$signed((8'had))))));
          reg75 <= (~&$signed(wire57[(5'h11):(2'h3)]));
          reg76 <= (!($signed($unsigned((reg61 << reg68))) ?
              (+reg67) : {$signed((reg62 | reg63))}));
        end
      else
        begin
          if ($signed(((^($signed(reg70) && $unsigned(reg61))) == $signed(wire57))))
            begin
              reg69 <= (~wire56);
              reg70 <= reg73[(1'h1):(1'h1)];
            end
          else
            begin
              reg69 <= reg65;
              reg70 <= reg70[(2'h2):(1'h0)];
              reg71 <= wire58;
              reg72 <= reg76;
            end
        end
    end
endmodule
