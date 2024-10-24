module top
#(parameter param211 = ((+((((8'ha2) | (8'hb6)) < ((7'h40) - (8'hb2))) ^ (((8'ha7) || (8'hb4)) ? ((8'hb8) ^ (8'h9c)) : {(7'h41), (8'hb0)}))) ? {(~(((8'ha1) == (8'ha8)) >= ((8'h9c) ? (7'h40) : (8'had)))), (~(((8'hbe) ? (8'hba) : (8'hbd)) ? ((8'had) && (8'hb1)) : ((7'h40) ? (8'hb2) : (8'ha7))))} : (~|(-(~((8'ha5) ? (7'h43) : (7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire210;
  wire signed [(2'h2):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(5'h12):(1'h0)] wire203;
  wire signed [(5'h12):(1'h0)] wire204;
  wire signed [(3'h4):(1'h0)] wire205;
  wire signed [(5'h12):(1'h0)] wire207;
  wire [(4'hb):(1'h0)] wire208;
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire210,
                 wire4,
                 wire5,
                 wire34,
                 wire35,
                 wire36,
                 wire38,
                 wire107,
                 wire109,
                 wire198,
                 wire203,
                 wire204,
                 wire205,
                 wire207,
                 wire208,
                 reg202,
                 reg201,
                 reg200,
                 reg37,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed((wire0[(1'h0):(1'h0)] == (8'hb5)));
  assign wire5 = (8'h9c);
  always
    @(posedge clk) begin
      if ((($unsigned($signed((wire4 ? wire4 : wire2))) ?
          (~$signed($signed(wire3))) : ({wire4} ?
              wire2[(4'hc):(3'h5)] : wire5[(2'h3):(1'h0)])) != wire1[(4'ha):(3'h7)]))
        begin
          reg6 <= wire4;
          reg7 <= wire1;
          if ((reg6 ~^ {$signed((wire0[(2'h3):(2'h2)] ?
                  (wire3 <<< wire0) : (~^(8'h9f)))),
              (8'ha1)}))
            begin
              reg8 <= $unsigned(((($unsigned(wire2) || (~|reg7)) <= ($signed(reg6) ?
                      $signed(reg7) : reg7)) ?
                  $unsigned((!$unsigned(wire2))) : (~|$unsigned($unsigned(wire5)))));
              reg9 <= $unsigned((~&$signed(reg8)));
              reg10 <= $signed((~|reg8[(3'h4):(1'h1)]));
            end
          else
            begin
              reg8 <= (7'h43);
              reg9 <= reg7;
              reg10 <= (reg9 ?
                  $signed((reg10 & {reg6})) : ((wire3 ?
                      wire3[(4'h8):(3'h6)] : (wire2 + wire3[(4'h8):(4'h8)])) ^~ ($unsigned(wire0) > $unsigned(wire0))));
              reg11 <= reg7;
              reg12 <= $unsigned(reg9);
            end
          reg13 <= $signed(wire1[(4'ha):(1'h0)]);
        end
      else
        begin
          if ({(^~$unsigned(({(8'haa), (8'hbe)} != $unsigned(reg12))))})
            begin
              reg6 <= (wire0[(2'h3):(2'h2)] ^ (reg13[(2'h2):(1'h1)] <= ($unsigned(reg8[(4'hc):(3'h5)]) * reg9[(2'h2):(1'h1)])));
              reg7 <= wire2;
            end
          else
            begin
              reg6 <= ($unsigned($signed(((reg12 ?
                  wire4 : reg11) * reg11))) ~^ ((({wire5, wire2} || (-reg10)) ?
                      (reg13 >= {(8'ha3), reg9}) : $unsigned(wire5)) ?
                  (((wire0 ? reg11 : wire1) * ((8'hb7) ?
                      wire1 : (8'hac))) >> ({reg6, reg8} << (wire5 ?
                      (8'hba) : reg8))) : wire2[(1'h1):(1'h1)]));
            end
        end
      if ((reg6 ?
          $unsigned($unsigned((+wire2[(1'h0):(1'h0)]))) : reg6[(2'h3):(2'h2)]))
        begin
          reg14 <= $unsigned(reg8[(2'h3):(2'h3)]);
          reg15 <= (wire0[(2'h2):(1'h0)] && (|$signed(reg13[(1'h0):(1'h0)])));
          if ((~(&{reg14[(4'h8):(2'h3)]})))
            begin
              reg16 <= reg13[(1'h0):(1'h0)];
              reg17 <= $unsigned($unsigned((|((8'ha8) | reg12))));
              reg18 <= (wire5[(3'h4):(1'h1)] ?
                  $unsigned(reg13[(1'h1):(1'h1)]) : reg6[(2'h3):(1'h0)]);
              reg19 <= (($signed($unsigned(((8'hbd) ?
                  reg14 : reg14))) != ($signed((+reg12)) >>> ((~&wire2) ^ {(8'had),
                  (8'ha6)}))) < reg6);
            end
          else
            begin
              reg16 <= $unsigned(reg16);
              reg17 <= reg11[(1'h0):(1'h0)];
              reg18 <= $unsigned($signed((~&$signed($unsigned(wire5)))));
              reg19 <= $unsigned(((^((reg16 ? reg8 : reg17) ^~ (reg15 ?
                  (8'hbe) : wire0))) <= $unsigned({wire4})));
              reg20 <= $signed((((&$unsigned(wire4)) ?
                  ((reg7 ?
                      reg8 : wire4) >>> $unsigned((8'hbf))) : (~&{reg18})) + $signed(wire1[(3'h4):(2'h2)])));
            end
          reg21 <= ($signed(reg8) ?
              {(reg11[(3'h4):(1'h0)] >> $unsigned(reg9)),
                  {reg14[(3'h4):(1'h0)],
                      $unsigned((reg10 ?
                          reg15 : (8'ha1)))}} : $unsigned($signed((-$unsigned(wire5)))));
        end
      else
        begin
          if ((+$signed((wire2 >>> $signed(reg20)))))
            begin
              reg14 <= (-$signed(reg13[(1'h0):(1'h0)]));
              reg15 <= wire1;
              reg16 <= wire3[(4'he):(2'h2)];
              reg17 <= reg12;
              reg18 <= (reg7[(4'ha):(2'h2)] ^ (~|reg9));
            end
          else
            begin
              reg14 <= reg21[(3'h4):(2'h2)];
              reg15 <= ((((reg19 ? (&(8'hae)) : reg6[(3'h4):(2'h3)]) ?
                      reg17 : (8'hb2)) ?
                  (reg19[(4'he):(3'h5)] ?
                      $unsigned(reg21[(3'h6):(1'h1)]) : (&{wire0,
                          (8'hae)})) : wire3) >>> {(({reg19} << (|wire1)) < reg17[(1'h1):(1'h1)]),
                  $unsigned(($signed(reg9) == (-reg11)))});
              reg16 <= {$unsigned((reg13 ^ $unsigned((reg19 ? reg7 : reg6)))),
                  (8'ha1)};
              reg17 <= reg15;
              reg18 <= ($signed(reg20) <<< reg19);
            end
          reg19 <= $unsigned(({$unsigned(reg15[(1'h1):(1'h0)])} ?
              (reg9 ?
                  reg19[(1'h1):(1'h1)] : (~&$unsigned(reg20))) : $unsigned({$signed(reg13)})));
          reg20 <= wire2;
          reg21 <= reg21;
        end
      reg22 <= {({(|$unsigned((8'h9f))),
                  ($signed(reg19) ? (reg15 && reg10) : (reg18 ^ reg13))} ?
              $unsigned((&(^~(7'h42)))) : ($signed({reg19, wire4}) ?
                  $signed($signed(reg18)) : wire4[(2'h2):(1'h1)]))};
      reg23 <= {((wire1[(1'h1):(1'h0)] <= reg16[(1'h0):(1'h0)]) ?
              wire4 : ($unsigned($unsigned(reg8)) ?
                  $unsigned(((8'hb3) != reg16)) : $unsigned((reg22 << wire5)))),
          (!(($unsigned(wire0) >= (reg13 ? reg6 : reg20)) >> (~^((8'hbf) ?
              reg11 : reg6))))};
      if (reg17)
        begin
          reg24 <= ($signed(($unsigned(reg22[(5'h12):(4'he)]) ?
                  (~reg23) : (&$unsigned(reg20)))) ?
              (((8'hb7) ^ ((~^reg15) <= reg20)) < $signed($unsigned((wire2 ?
                  (8'h9e) : (8'hb8))))) : wire4);
          reg25 <= ((&reg11[(1'h0):(1'h0)]) ?
              ($signed(($unsigned(reg21) <<< (wire1 ? reg9 : reg7))) ?
                  reg18[(4'hb):(3'h6)] : reg8[(3'h7):(2'h3)]) : ((8'h9f) ?
                  ((reg20 == (reg7 ~^ reg21)) ?
                      reg7 : $unsigned((8'haf))) : $signed((!{reg6}))));
          reg26 <= $unsigned($unsigned((|$signed((reg9 ? reg23 : wire3)))));
          reg27 <= (reg16[(1'h0):(1'h0)] ?
              (|$unsigned(((!reg9) ?
                  $signed(reg9) : $unsigned(reg12)))) : (~$unsigned((~^$signed(reg26)))));
        end
      else
        begin
          if (reg18[(4'hc):(4'ha)])
            begin
              reg24 <= reg6;
              reg25 <= (&(((reg7 ? (reg22 | reg8) : {reg19, wire1}) ?
                      (^(reg9 ^~ reg26)) : ((reg17 ?
                          reg8 : reg17) != reg27[(2'h3):(2'h2)])) ?
                  ($unsigned($signed(reg10)) ^~ (reg27 ?
                      (^reg21) : reg18[(4'he):(4'hc)])) : $unsigned(reg21[(1'h0):(1'h0)])));
            end
          else
            begin
              reg24 <= $unsigned({$signed(((~^reg22) ?
                      $unsigned(reg11) : $unsigned(reg23)))});
              reg25 <= reg10[(3'h7):(1'h0)];
              reg26 <= reg27;
              reg27 <= (((($signed((8'ha3)) + (reg10 ? reg17 : reg6)) ?
                      (8'haf) : {$signed(wire5)}) <<< $signed($unsigned($unsigned(reg9)))) ?
                  ((((reg22 != (8'hac)) >> (8'h9f)) + $unsigned($unsigned(reg17))) ?
                      ($unsigned(wire0[(2'h3):(1'h0)]) ?
                          reg27 : reg14) : ($unsigned(reg26[(5'h11):(4'h8)]) & reg27[(2'h2):(2'h2)])) : $signed($signed($signed((~^reg26)))));
              reg28 <= ($unsigned({{(wire4 < wire3),
                      reg12}}) + ({$unsigned((8'haf)), $signed(reg10)} ?
                  (^reg27[(1'h1):(1'h0)]) : (wire1 < reg10)));
            end
          if (reg17[(3'h5):(1'h0)])
            begin
              reg29 <= (&($unsigned($signed((^~reg11))) <= reg28[(3'h7):(3'h5)]));
              reg30 <= (!reg29);
              reg31 <= {(!({$signed((8'ha6)), (reg21 & wire1)} ?
                      wire3 : $signed(reg16)))};
            end
          else
            begin
              reg29 <= (reg11[(1'h0):(1'h0)] ? (+wire5) : reg9[(2'h2):(2'h2)]);
              reg30 <= $unsigned((reg20[(2'h2):(1'h1)] | $unsigned({{reg8,
                      (8'ha1)},
                  reg15[(3'h6):(1'h1)]})));
              reg31 <= (reg28 ? reg22 : $unsigned({reg29}));
            end
          reg32 <= $signed({($unsigned((reg14 < reg15)) ?
                  ((^~wire1) ?
                      reg20 : reg29[(2'h3):(2'h3)]) : wire2[(4'ha):(1'h1)])});
          reg33 <= {$signed((reg26[(4'hb):(4'ha)] ? reg10 : wire2)), wire3};
        end
    end
  assign wire34 = reg14[(2'h3):(1'h1)];
  assign wire35 = {($unsigned(($unsigned((8'h9e)) | {reg24})) ?
                          (-$unsigned($unsigned(reg17))) : (~|$unsigned({reg33})))};
  assign wire36 = $unsigned((reg13 ?
                      (8'ha4) : {(^$signed(reg31)), wire3[(4'hf):(4'hb)]}));
  always
    @(posedge clk) begin
      reg37 <= wire0;
    end
  assign wire38 = reg27[(4'h8):(4'h8)];
  module39 #() modinst108 (wire107, clk, reg7, wire3, reg32, wire36);
  assign wire109 = (~&reg32);
  module110 #() modinst199 (.wire114(wire34), .wire112(reg12), .clk(clk), .y(wire198), .wire111(wire3), .wire113(reg13));
  always
    @(posedge clk) begin
      reg200 <= (-$unsigned({(-$signed(reg22)), $signed($unsigned((8'hba)))}));
      reg201 <= $unsigned($signed($unsigned($unsigned((reg200 && wire107)))));
      reg202 <= reg18[(4'hb):(4'hb)];
    end
  assign wire203 = ($unsigned($signed($signed(reg28))) <<< $signed(reg26));
  assign wire204 = $signed((!(wire198[(2'h2):(1'h1)] && ($unsigned(reg23) ?
                       wire203[(4'hf):(3'h5)] : {reg29, reg26}))));
  module121 #() modinst206 (.y(wire205), .wire123(reg19), .clk(clk), .wire126(reg21), .wire125(reg33), .wire124(reg22), .wire122(reg25));
  assign wire207 = ($signed(wire107) & reg29);
  module110 #() modinst209 (wire208, clk, reg29, reg15, wire3, reg26);
  assign wire210 = reg23[(1'h0):(1'h0)];
endmodule

module module110
#(parameter param196 = (((((~|(8'ha6)) ^~ (+(8'hbe))) * (~^(~|(8'ha0)))) >= ((((8'ha1) ? (8'hb6) : (8'hb5)) ? (^~(8'ha6)) : (~^(8'ha8))) ? {(8'hab)} : (~(~(8'hb9))))) + (~|(8'ha2))), 
parameter param197 = ((-({(~param196)} >> param196)) && param196))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire signed [(5'h14):(1'h0)] wire112;
  input wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire194;
  wire [(3'h7):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire192;
  assign y = {wire195,
                 wire194,
                 wire135,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire137,
                 wire192,
                 (1'h0)};
  assign wire115 = ($signed($signed((wire114[(1'h0):(1'h0)] ?
                       $signed(wire114) : $signed((8'hbf))))) + {wire112[(4'h8):(1'h0)],
                       $unsigned((^~$signed(wire112)))});
  assign wire116 = $signed(wire115[(2'h3):(2'h2)]);
  assign wire117 = $signed($signed((-((8'ha3) ?
                       (~^wire112) : (wire111 ? wire116 : (8'hab))))));
  assign wire118 = (&{$unsigned((-(8'hb4))),
                       (&$signed(((8'hbf) ? wire114 : wire114)))});
  assign wire119 = ((~|wire112[(4'ha):(4'ha)]) ?
                       $unsigned(wire111) : (+(((wire117 ? (8'hb8) : (7'h44)) ?
                               $unsigned(wire113) : (wire112 ?
                                   wire116 : wire117)) ?
                           $signed((|wire114)) : ($unsigned(wire114) ?
                               $unsigned(wire118) : $unsigned(wire111)))));
  assign wire120 = (&$unsigned((wire114 ?
                       (~^$signed(wire111)) : ((wire115 ?
                           wire111 : wire115) == (8'hb3)))));
  module121 #() modinst136 (.clk(clk), .wire122(wire115), .wire126(wire119), .y(wire135), .wire125(wire114), .wire123(wire120), .wire124(wire113));
  assign wire137 = $unsigned(((wire135[(3'h4):(3'h4)] ?
                           wire111 : wire114[(4'ha):(2'h2)]) ?
                       (wire119[(2'h2):(1'h1)] ?
                           ({wire116, wire114} ?
                               (~&wire113) : (^~wire135)) : ((8'had) != (7'h43))) : {wire114[(3'h6):(1'h1)]}));
  module138 #() modinst193 (.wire140(wire115), .clk(clk), .wire139(wire117), .y(wire192), .wire142(wire120), .wire143(wire113), .wire141(wire111));
  assign wire194 = {($unsigned($unsigned((^(8'hbe)))) || wire119),
                       ((-$unsigned(wire115)) ?
                           (|(wire116 >>> (wire135 ?
                               wire112 : wire192))) : (8'haa))};
  assign wire195 = (-wire113[(4'hc):(2'h3)]);
endmodule

module module39
#(parameter param106 = {(((!{(8'hb0)}) ? (8'hbc) : (&((7'h42) ? (8'h9f) : (8'hbb)))) <<< {(((8'ha7) ? (8'hbc) : (8'ha4)) ? {(8'hb6)} : (~&(7'h44)))})})
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire [(4'h9):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  assign y = {wire104,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire66,
                 wire65,
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
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire41)
        begin
          reg44 <= wire41;
          reg45 <= {wire42,
              ((~|(wire41[(3'h4):(2'h3)] != ((8'hba) <= wire41))) ?
                  (-{wire40,
                      $unsigned(wire42)}) : ((+wire43) ~^ $unsigned((+wire40))))};
          reg46 <= $signed((wire42[(3'h6):(2'h3)] >= wire43));
        end
      else
        begin
          if (reg46)
            begin
              reg44 <= reg45;
              reg45 <= $signed(wire43);
              reg46 <= (|$signed((wire42 - reg45)));
              reg47 <= (wire42[(4'h8):(3'h6)] && (!{(~^$unsigned(wire40))}));
              reg48 <= wire41;
            end
          else
            begin
              reg44 <= $signed((~&($signed({reg44, reg47}) ?
                  wire43[(1'h1):(1'h0)] : ((~^wire42) ?
                      (reg48 ? reg46 : wire40) : reg44))));
            end
          reg49 <= (reg47[(2'h2):(1'h0)] & reg46[(5'h14):(1'h1)]);
          if ((((8'h9d) - (wire40[(1'h1):(1'h0)] ?
              wire40 : ((~&reg49) ?
                  wire43 : (reg46 ? wire40 : reg47)))) <<< reg46))
            begin
              reg50 <= reg46[(1'h1):(1'h1)];
              reg51 <= (reg45 + $signed({(~^(^reg44))}));
              reg52 <= $unsigned({(reg47[(3'h6):(3'h5)] >= {(+(8'hb1))}),
                  ((~&(reg46 || reg46)) ?
                      ((reg51 != wire42) * $unsigned(reg44)) : $unsigned((reg50 > reg49)))});
              reg53 <= reg47[(3'h4):(1'h0)];
            end
          else
            begin
              reg50 <= {(^({wire41[(3'h4):(2'h2)],
                      wire41[(2'h2):(1'h0)]} << reg53[(3'h6):(1'h0)]))};
              reg51 <= wire41[(2'h3):(1'h1)];
            end
          reg54 <= (~|wire41[(1'h1):(1'h1)]);
          reg55 <= $unsigned({reg52[(2'h3):(2'h3)]});
        end
      reg56 <= (|{{((reg45 ~^ reg55) >= reg51[(3'h6):(3'h5)])}});
      if (reg49[(3'h5):(1'h1)])
        begin
          reg57 <= $unsigned($signed(($unsigned(reg52) || $signed($unsigned(reg50)))));
          if ((($signed($signed({reg47,
                  reg45})) >> {$unsigned(reg44[(2'h3):(1'h0)])}) ?
              $unsigned((-(~^(reg47 ?
                  wire41 : (8'hbd))))) : ($signed((~|{reg51})) || ($unsigned((wire41 >>> reg56)) >>> $unsigned((8'haa))))))
            begin
              reg58 <= (reg47[(3'h7):(1'h0)] ?
                  (^~(^~reg48[(1'h1):(1'h1)])) : (|$signed(((wire40 ?
                          (7'h44) : reg45) ?
                      (reg53 <<< reg44) : reg52))));
            end
          else
            begin
              reg58 <= {(~^(reg55 && (((8'hbb) ?
                      (8'hbf) : reg46) <<< reg46[(2'h2):(1'h1)]))),
                  (($signed($unsigned((8'hbc))) <= $signed(reg52[(2'h3):(1'h0)])) > (reg47[(3'h6):(3'h6)] || wire41[(3'h4):(2'h2)]))};
              reg59 <= reg50;
              reg60 <= $signed(reg48);
            end
          reg61 <= {({{reg47}, {wire42[(3'h4):(1'h1)]}} ?
                  reg57[(3'h5):(3'h4)] : reg53[(1'h0):(1'h0)]),
              reg50};
          reg62 <= $signed(({$signed(reg48)} + (reg60[(4'ha):(4'h9)] ?
              (!(reg48 < reg49)) : $unsigned({reg45}))));
          reg63 <= $unsigned(reg55[(5'h14):(4'he)]);
        end
      else
        begin
          reg57 <= $signed($unsigned($signed((reg62[(3'h6):(1'h1)] ?
              (reg58 + reg55) : (reg48 ? (8'ha7) : reg60)))));
          reg58 <= reg58;
        end
      reg64 <= {wire42[(1'h1):(1'h0)],
          ($unsigned($signed({reg54, reg49})) >> reg63[(2'h2):(1'h0)])};
    end
  assign wire65 = $signed(reg50[(4'h8):(2'h3)]);
  assign wire66 = (&(~|((wire65 ? $signed(reg44) : {wire41}) ^ (8'ha8))));
  always
    @(posedge clk) begin
      if ($signed(((reg53 ? reg46 : {wire43[(1'h1):(1'h0)]}) ?
          reg55[(4'ha):(3'h6)] : $signed(((reg47 ?
              reg44 : reg44) ^~ $signed(wire65))))))
        begin
          reg67 <= $unsigned(($signed(($unsigned(reg62) ?
                  (^reg61) : (~|(8'hbc)))) ?
              $signed((~reg60[(4'hc):(3'h7)])) : {wire43}));
        end
      else
        begin
          reg67 <= reg46;
          reg68 <= {(^$signed((reg53 ? (reg63 ? wire43 : reg56) : reg58)))};
        end
      reg69 <= ((-$unsigned(reg48)) == wire65[(4'hc):(3'h6)]);
      reg70 <= ((&(wire40 ?
          (+(-reg59)) : $signed((+reg64)))) <= ({((wire40 >= reg61) ?
              $unsigned(wire66) : reg44[(2'h3):(1'h0)]),
          reg62[(3'h4):(2'h3)]} ~^ $unsigned(reg63)));
    end
  assign wire71 = $signed($signed(reg58[(1'h0):(1'h0)]));
  assign wire72 = $unsigned($signed(wire65));
  assign wire73 = $signed(wire71);
  assign wire74 = $unsigned(reg63);
  assign wire75 = $signed($unsigned(((8'ha3) >>> ((~wire66) ?
                      $unsigned(reg48) : {reg60, (8'hb0)}))));
  assign wire76 = reg70[(1'h0):(1'h0)];
  assign wire77 = ((8'hb6) >> (+{$signed((8'hac))}));
  assign wire78 = ({reg44[(1'h0):(1'h0)],
                      $unsigned(wire74[(3'h5):(2'h2)])} ~^ $signed((8'hbb)));
  assign wire79 = wire77;
  assign wire80 = reg51[(1'h0):(1'h0)];
  assign wire81 = wire73;
  assign wire82 = reg67[(1'h1):(1'h0)];
  assign wire83 = (reg52 | $unsigned({({wire40, wire72} < (&wire40)),
                      ((&reg55) ? $unsigned(wire82) : reg63[(3'h4):(2'h2)])}));
  assign wire84 = {(&wire77[(3'h6):(2'h3)])};
  module85 #() modinst105 (.wire90(reg62), .wire86(wire84), .wire89(reg53), .clk(clk), .wire88(reg46), .wire87(wire41), .y(wire104));
endmodule

module module85  (y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire90;
  input wire [(4'ha):(1'h0)] wire89;
  input wire signed [(5'h14):(1'h0)] wire88;
  input wire signed [(3'h4):(1'h0)] wire87;
  input wire signed [(5'h14):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = (|(8'ha9));
  assign wire92 = wire91;
  assign wire93 = $unsigned(wire88);
  assign wire94 = {(wire87[(1'h1):(1'h0)] ? (8'hbb) : wire93), wire92};
  assign wire95 = wire88;
  assign wire96 = $unsigned($unsigned($signed((~|wire91[(3'h5):(1'h1)]))));
  assign wire97 = (((wire92[(4'h9):(3'h4)] || $signed((|wire90))) <= wire92[(5'h11):(4'h8)]) | $signed(wire91[(3'h5):(1'h0)]));
  assign wire98 = (&wire90);
  assign wire99 = (|{(-(wire87 ? $signed(wire91) : wire91[(4'ha):(2'h3)])),
                      wire90});
  assign wire100 = (~&wire97[(3'h7):(1'h1)]);
  assign wire101 = $signed(wire89);
  assign wire102 = $signed((-wire87));
  assign wire103 = wire90;
endmodule

module module138
#(parameter param191 = (((~((~|(7'h41)) ? (8'hb3) : (-(8'hb8)))) ? (~(|{(8'h9d)})) : (^~(8'ha6))) > (((^(8'hbe)) ? (8'hb4) : ((~(8'h9e)) ? (8'ha8) : (!(8'h9d)))) ? (~^(((8'hbf) ? (8'hb7) : (8'haf)) ? (!(8'hb5)) : ((7'h42) <= (8'ha5)))) : (^(((8'hb1) ? (8'ha8) : (8'ha8)) ? (^(8'hb7)) : ((8'hb0) ^ (8'hbd)))))))
(y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire143;
  input wire signed [(5'h14):(1'h0)] wire142;
  input wire [(4'h8):(1'h0)] wire141;
  input wire [(4'he):(1'h0)] wire140;
  input wire signed [(4'ha):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(3'h7):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire188;
  wire signed [(3'h4):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire186;
  wire signed [(4'he):(1'h0)] wire185;
  wire [(5'h13):(1'h0)] wire184;
  wire [(4'hb):(1'h0)] wire183;
  wire signed [(4'hc):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire169;
  reg signed [(5'h10):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg [(3'h5):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire173,
                 wire170,
                 wire169,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg172,
                 reg171,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg144 <= (~&($unsigned(wire140[(4'hb):(2'h3)]) ^ ((-wire139) <<< ((wire142 ?
          wire141 : wire140) | wire139))));
      if (wire140[(4'hd):(4'hb)])
        begin
          reg145 <= ((reg144[(4'hb):(4'ha)] ?
                  (wire141[(1'h0):(1'h0)] ?
                      $signed($unsigned(reg144)) : $unsigned($signed(wire140))) : $signed(((+wire142) ?
                      wire143[(3'h5):(2'h3)] : (wire141 ^ wire141)))) ?
              wire140[(3'h4):(3'h4)] : wire143[(1'h1):(1'h1)]);
          if ($signed($unsigned(($signed((wire140 ?
              wire141 : wire142)) < $signed($unsigned(wire142))))))
            begin
              reg146 <= (((((8'ha5) ?
                      wire143 : reg144) >= wire140[(4'hc):(4'ha)]) ?
                  $unsigned($signed($unsigned(wire141))) : ($unsigned((reg145 > reg144)) ?
                      ((^reg144) >= wire143[(4'he):(4'he)]) : wire142)) ^ (wire143[(1'h1):(1'h1)] << (((wire142 ?
                      wire143 : wire143) <<< $unsigned((8'ha3))) ?
                  $unsigned((wire143 ?
                      wire142 : wire140)) : wire142[(4'he):(4'ha)])));
              reg147 <= (($signed(($signed(wire140) || (8'hb2))) ?
                      $unsigned(reg145) : $signed({(~^wire140)})) ?
                  reg144 : wire141[(1'h0):(1'h0)]);
              reg148 <= reg145;
              reg149 <= reg148[(4'he):(4'hd)];
              reg150 <= reg144[(4'hb):(4'ha)];
            end
          else
            begin
              reg146 <= (~|($unsigned((wire140 < ((8'hb5) >>> wire140))) ?
                  ((^$unsigned(reg147)) ?
                      $signed($unsigned(reg150)) : wire142[(5'h10):(1'h1)]) : reg150[(3'h4):(1'h0)]));
            end
          if ($signed((~&$unsigned(reg147[(4'hb):(4'h9)]))))
            begin
              reg151 <= reg148[(5'h13):(2'h3)];
              reg152 <= (($signed(wire141) ?
                  $unsigned(reg148[(4'he):(4'ha)]) : ($unsigned(reg145[(2'h3):(1'h1)]) ?
                      ($unsigned(reg144) >>> $signed(wire142)) : $signed($signed((8'hba))))) << wire141);
              reg153 <= $signed(wire143[(1'h0):(1'h0)]);
              reg154 <= {$signed($signed({$unsigned(wire142)}))};
              reg155 <= (wire140[(4'hb):(3'h4)] ?
                  ($unsigned((&(^(8'ha8)))) ?
                      $unsigned($signed((wire143 ?
                          (8'haf) : wire141))) : reg146) : wire140);
            end
          else
            begin
              reg151 <= ($unsigned($signed($unsigned($unsigned(reg152)))) ?
                  wire139[(3'h6):(2'h3)] : (^~$unsigned(($signed(reg151) ?
                      {reg155} : (reg147 ? reg146 : wire142)))));
              reg152 <= (reg151[(3'h4):(2'h2)] ?
                  reg144 : (reg155 ?
                      (wire140[(3'h6):(3'h4)] ?
                          wire140 : $unsigned({reg151,
                              wire141})) : (({(8'ha1)} + (reg149 - reg147)) ?
                          (^$unsigned(reg145)) : $signed(reg152[(4'hb):(3'h5)]))));
              reg153 <= $unsigned(reg147[(4'h8):(3'h6)]);
            end
          reg156 <= (!($unsigned(($signed(reg150) ?
                  $signed(wire141) : (8'hb5))) ?
              ($unsigned($unsigned(reg154)) ?
                  reg153 : $signed(reg148[(1'h1):(1'h1)])) : $signed($signed((|wire139)))));
          reg157 <= (~^wire142);
        end
      else
        begin
          reg145 <= reg145[(3'h5):(1'h0)];
        end
      reg158 <= $signed($signed($signed((~$signed((8'h9c))))));
      if (((^(8'h9f)) >= wire143))
        begin
          reg159 <= (+reg149);
          reg160 <= (+reg155[(4'h9):(1'h1)]);
          reg161 <= reg160[(4'ha):(1'h0)];
        end
      else
        begin
          if ($unsigned(reg150[(4'hb):(1'h1)]))
            begin
              reg159 <= $signed(((-wire140) ?
                  ($signed((-reg148)) == (~$unsigned(wire139))) : reg161));
              reg160 <= ($unsigned($signed({(reg161 | reg158),
                  reg154[(3'h4):(2'h3)]})) < ((~&(8'h9e)) ?
                  (~^(8'ha6)) : {$signed((^wire139)), reg147}));
              reg161 <= reg144;
              reg162 <= (reg160[(4'h9):(4'h9)] & ((8'hb8) ?
                  $unsigned($unsigned((reg160 ?
                      reg146 : reg156))) : (wire141[(1'h1):(1'h0)] <<< ((-wire141) * wire142[(2'h2):(2'h2)]))));
              reg163 <= reg146;
            end
          else
            begin
              reg159 <= (~|reg146);
            end
          if ((reg157 >>> wire139[(4'h8):(1'h1)]))
            begin
              reg164 <= $unsigned({wire140[(3'h7):(3'h6)]});
            end
          else
            begin
              reg164 <= ((($unsigned($unsigned((8'ha8))) ?
                      $unsigned((reg154 ?
                          (8'haf) : reg150)) : (7'h40)) == $signed({(reg144 ?
                          wire141 : (8'hae)),
                      $signed(reg152)})) ?
                  ({reg156[(3'h5):(1'h1)],
                      reg153[(3'h5):(3'h4)]} ~^ (((+(8'hbe)) - {reg159}) | wire141[(2'h2):(2'h2)])) : reg160[(4'h8):(3'h6)]);
              reg165 <= ((|reg161) != (~^(((wire141 <= wire141) == reg152) > {(wire142 ?
                      wire140 : reg163),
                  $signed(reg157)})));
              reg166 <= (~^$signed(reg160));
              reg167 <= (^~(~&(~|{wire140, reg157[(3'h5):(1'h1)]})));
            end
        end
      reg168 <= reg146;
    end
  assign wire169 = wire142[(3'h6):(2'h3)];
  assign wire170 = {($signed((wire142[(3'h4):(1'h0)] ?
                               (reg155 <<< reg153) : reg166[(2'h3):(1'h0)])) ?
                           reg146 : (~(!wire143[(5'h10):(3'h6)])))};
  always
    @(posedge clk) begin
      reg171 <= ((($signed(reg145[(3'h4):(1'h0)]) ~^ reg151[(1'h0):(1'h0)]) ?
          ($signed((~^reg168)) <<< ($unsigned(reg163) ?
              $signed(reg145) : {wire143})) : (((reg151 != reg158) && (reg150 & wire141)) != {reg154,
              ((8'h9c) ? reg158 : reg152)})) << (-{reg168[(1'h1):(1'h0)],
          $signed((reg161 <= reg165))}));
      reg172 <= ($signed($signed(reg154[(1'h1):(1'h1)])) * $signed(($unsigned((7'h43)) ?
          reg147 : ((^~reg150) ~^ (!reg161)))));
    end
  assign wire173 = ((($unsigned(((8'had) ?
                       (8'ha9) : reg164)) ^ (~|(~|wire142))) <<< (~^$unsigned((reg147 >> (8'hb5))))) >> $signed((-(reg157[(1'h0):(1'h0)] ?
                       ((7'h40) >>> reg171) : $unsigned(reg159)))));
  always
    @(posedge clk) begin
      reg174 <= $unsigned($signed((^~$unsigned(wire169[(4'hc):(3'h6)]))));
      reg175 <= (($signed((+reg156)) ^~ (((-(7'h40)) ? (^~reg151) : reg144) ?
          (~wire173[(1'h1):(1'h1)]) : (+(reg146 ?
              reg166 : reg166)))) != $unsigned(reg174));
      if (reg160)
        begin
          if ($unsigned(reg174))
            begin
              reg176 <= reg153;
              reg177 <= $signed((reg163 ?
                  (({reg161} ? (8'hab) : (reg145 ? reg153 : reg153)) ?
                      (|reg146) : (&(8'ha3))) : reg160[(4'hb):(2'h2)]));
              reg178 <= {{(((reg174 ? reg156 : reg156) ?
                          (reg167 || reg177) : $unsigned((8'hac))) > $unsigned($unsigned(reg160)))}};
            end
          else
            begin
              reg176 <= ($signed(((reg166 * ((8'ha8) ? (8'hba) : reg145)) ?
                  (^(reg150 << reg163)) : (8'hb2))) ~^ (reg174[(4'h9):(2'h3)] ?
                  reg175 : (&(wire140[(1'h0):(1'h0)] ?
                      (~^wire142) : (reg161 * (8'hb2))))));
              reg177 <= $signed(reg164[(4'h8):(4'h8)]);
            end
          reg179 <= wire170[(2'h3):(2'h2)];
        end
      else
        begin
          reg176 <= $unsigned(($signed($signed((wire141 && reg177))) ?
              {reg178} : ($signed((reg175 ? reg149 : wire173)) ?
                  $unsigned($signed((8'hb7))) : reg162[(1'h0):(1'h0)])));
          reg177 <= $unsigned((~|wire143[(4'ha):(2'h3)]));
          if ($signed({(^(reg177 ?
                  (reg150 ? (8'haf) : reg176) : $signed(reg172))),
              {reg155}}))
            begin
              reg178 <= reg178[(1'h1):(1'h1)];
            end
          else
            begin
              reg178 <= reg168;
              reg179 <= (reg147 ~^ wire143);
              reg180 <= (($unsigned($signed($unsigned(reg179))) ?
                      {(8'ha3)} : wire143[(5'h10):(3'h5)]) ?
                  $signed((((reg161 ? reg145 : (7'h43)) ?
                      $unsigned(reg145) : $unsigned((8'hab))) ~^ ((|wire169) ~^ (reg171 - reg165)))) : $unsigned(($unsigned($signed(reg153)) <<< ((reg160 ?
                      reg144 : reg177) >>> ((8'hba) ? reg153 : wire173)))));
              reg181 <= (-wire173[(4'h8):(2'h3)]);
              reg182 <= $signed($unsigned({((wire173 || reg163) >> $signed(reg149))}));
            end
        end
    end
  assign wire183 = reg172[(3'h4):(1'h0)];
  assign wire184 = $signed($unsigned((reg163[(4'hc):(4'h9)] <<< $signed((wire169 ?
                       reg144 : wire183)))));
  assign wire185 = $unsigned($signed(($signed($signed(wire169)) ?
                       ($signed(reg171) == reg163[(3'h6):(3'h5)]) : (8'ha7))));
  assign wire186 = ($unsigned(reg152[(1'h1):(1'h1)]) ?
                       (^({{reg168, reg180}} ?
                           wire170 : wire141)) : $signed({(8'ha3),
                           reg174[(3'h5):(3'h5)]}));
  assign wire187 = (reg147 >= $signed((reg144[(2'h2):(2'h2)] ?
                       reg152[(4'h9):(3'h7)] : reg154)));
  assign wire188 = $signed(((|$signed(reg148)) ?
                       reg174[(1'h1):(1'h1)] : reg156));
  assign wire189 = (wire187 ?
                       ($unsigned((8'ha0)) >>> $signed((wire169 <= reg164[(3'h4):(2'h2)]))) : $signed(($unsigned($unsigned(reg146)) ?
                           $signed($signed(reg150)) : (8'h9d))));
  assign wire190 = $unsigned($signed((^wire142[(4'hc):(4'h9)])));
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire126;
  input wire signed [(2'h2):(1'h0)] wire125;
  input wire signed [(2'h2):(1'h0)] wire124;
  input wire signed [(4'h9):(1'h0)] wire123;
  input wire [(3'h6):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 reg130,
                 (1'h0)};
  assign wire127 = (wire126 <= wire126[(2'h3):(1'h0)]);
  assign wire128 = (wire122[(1'h1):(1'h1)] ?
                       ({wire126, wire123} ?
                           wire122[(3'h5):(3'h4)] : (8'hbd)) : $unsigned((wire127[(1'h0):(1'h0)] < (wire126 ?
                           wire127 : (wire125 ? wire125 : wire124)))));
  assign wire129 = ($unsigned(((8'hbe) && (!$signed(wire127)))) ?
                       {{($signed(wire127) <= (wire125 ? (8'h9c) : wire125)),
                               (^(wire128 < (8'ha9)))}} : $unsigned((~^(~(^(8'ha4))))));
  always
    @(posedge clk) begin
      reg130 <= ((-{wire128[(1'h1):(1'h0)]}) & $unsigned(wire127));
    end
  assign wire131 = {(-((-(&wire127)) ?
                           (+$unsigned(wire124)) : $signed($signed(wire128)))),
                       wire127};
  assign wire132 = ($signed((($signed(wire123) ?
                           (wire128 ? (8'h9c) : wire128) : (wire126 ?
                               wire129 : wire131)) ?
                       wire131 : ((~^wire129) ?
                           (wire129 ?
                               wire129 : (7'h41)) : $signed((7'h40))))) <= $signed(wire129));
  assign wire133 = ({$signed(wire131[(2'h2):(1'h1)]),
                           {$unsigned((wire122 + wire124)),
                               ($signed(wire124) ?
                                   (wire122 ?
                                       reg130 : wire124) : wire128[(3'h6):(1'h1)])}} ?
                       $signed((($unsigned((8'hb8)) ?
                           (wire124 && wire126) : $unsigned(wire129)) * $unsigned((8'hb7)))) : wire125[(2'h2):(1'h1)]);
  assign wire134 = wire127[(4'hb):(3'h4)];
endmodule
