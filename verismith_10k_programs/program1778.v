module top
#(parameter param312 = ({((~((8'hb2) ? (8'hb4) : (8'ha9))) ? ((8'hab) <= ((8'h9c) ? (8'hb3) : (8'haf))) : (((7'h44) ? (8'ha0) : (8'hbc)) ? ((8'ha7) >> (8'hb0)) : ((7'h42) ? (8'ha1) : (8'ha1)))), (+(&((8'hbe) ? (8'hbe) : (8'ha3))))} ? ({(~^((8'hb7) ? (8'ha8) : (8'hb6))), (&(|(8'ha5)))} ? ({{(7'h43)}, ((8'hb3) >>> (7'h43))} ? (((8'ha1) | (8'hb1)) ? ((8'ha9) ? (8'ha5) : (8'ha7)) : (~^(8'ha8))) : (8'ha2)) : (~|(8'ha0))) : ((((7'h40) < ((8'ha8) || (8'ha3))) | (8'hbe)) || ((((8'hb3) ? (8'hbc) : (8'hae)) ^ ((8'ha3) ? (8'ha9) : (8'hac))) ? (~^((8'ha0) || (8'hbc))) : ((8'hb5) >>> ((7'h40) ? (8'ha3) : (8'hbf)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h372):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire311;
  wire signed [(4'ha):(1'h0)] wire310;
  wire [(4'ha):(1'h0)] wire309;
  wire signed [(3'h6):(1'h0)] wire308;
  wire signed [(4'hc):(1'h0)] wire307;
  wire [(3'h7):(1'h0)] wire306;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire275;
  wire signed [(4'h8):(1'h0)] wire277;
  wire [(4'hb):(1'h0)] wire300;
  wire signed [(4'h8):(1'h0)] wire302;
  wire signed [(2'h3):(1'h0)] wire304;
  reg [(4'he):(1'h0)] reg303 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg279 = (1'h0);
  reg [(4'hc):(1'h0)] reg280 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg282 = (1'h0);
  reg [(3'h7):(1'h0)] reg283 = (1'h0);
  reg [(5'h14):(1'h0)] reg284 = (1'h0);
  reg [(4'hd):(1'h0)] reg285 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg286 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg287 = (1'h0);
  reg [(3'h7):(1'h0)] reg288 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg290 = (1'h0);
  reg [(2'h3):(1'h0)] reg291 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg293 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg294 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg295 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg296 = (1'h0);
  reg [(4'hd):(1'h0)] reg297 = (1'h0);
  reg [(3'h7):(1'h0)] reg298 = (1'h0);
  reg signed [(4'he):(1'h0)] reg299 = (1'h0);
  assign y = {wire311,
                 wire310,
                 wire309,
                 wire308,
                 wire307,
                 wire306,
                 wire4,
                 wire5,
                 wire38,
                 wire39,
                 wire40,
                 wire275,
                 wire277,
                 wire300,
                 wire302,
                 wire304,
                 reg303,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg279,
                 reg280,
                 reg281,
                 reg282,
                 reg283,
                 reg284,
                 reg285,
                 reg286,
                 reg287,
                 reg288,
                 reg289,
                 reg290,
                 reg291,
                 reg292,
                 reg293,
                 reg294,
                 reg295,
                 reg296,
                 reg297,
                 reg298,
                 reg299,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (8'hb8);
  always
    @(posedge clk) begin
      reg6 <= (&wire1);
      reg7 <= wire3;
      if ((+wire3[(1'h1):(1'h1)]))
        begin
          reg8 <= (&wire0[(3'h7):(3'h4)]);
          if ($unsigned($signed(reg6)))
            begin
              reg9 <= (!{(-$unsigned(reg7))});
              reg10 <= {({$unsigned((^~wire3))} >> $unsigned((((8'hb1) ?
                      reg8 : reg7) | $signed(wire2)))),
                  reg8};
              reg11 <= reg10;
              reg12 <= (($unsigned(({wire3,
                      reg6} <<< $signed((7'h44)))) == reg6[(4'h9):(2'h2)]) ?
                  (&$unsigned((wire1[(3'h7):(3'h6)] ?
                      $signed((8'hbc)) : (+wire2)))) : (~&$signed($unsigned((wire4 ?
                      wire2 : wire4)))));
              reg13 <= wire3;
            end
          else
            begin
              reg9 <= $unsigned(($unsigned(wire3) ?
                  wire1[(4'h8):(4'h8)] : reg10));
            end
          reg14 <= $unsigned($unsigned(reg13[(1'h0):(1'h0)]));
        end
      else
        begin
          if ($signed((reg12 ? reg14[(1'h0):(1'h0)] : reg13[(3'h4):(1'h1)])))
            begin
              reg8 <= (~(reg6[(2'h2):(2'h2)] ?
                  wire4 : ((-(reg13 ? wire4 : reg9)) >>> $unsigned(wire5))));
              reg9 <= wire1[(3'h4):(1'h1)];
              reg10 <= (~(wire4 ?
                  wire5[(2'h3):(1'h1)] : (wire3 & reg14[(3'h5):(2'h3)])));
              reg11 <= (+wire0[(2'h2):(2'h2)]);
            end
          else
            begin
              reg8 <= (8'h9d);
              reg9 <= $unsigned(wire2[(4'ha):(3'h6)]);
              reg10 <= ((8'hab) ? $unsigned({{{wire4}}}) : {(8'hb0)});
              reg11 <= $unsigned(reg9[(5'h13):(5'h11)]);
            end
          reg12 <= wire4;
          reg13 <= wire5[(1'h0):(1'h0)];
          reg14 <= $unsigned({(8'hbf), (~^($signed((8'hb4)) >>> (-reg7)))});
        end
      reg15 <= $unsigned((!$signed(reg14[(1'h0):(1'h0)])));
      reg16 <= {$unsigned(reg7)};
    end
  always
    @(posedge clk) begin
      if ((wire5[(3'h4):(3'h4)] ? reg10 : reg7[(2'h3):(2'h2)]))
        begin
          reg17 <= $signed($unsigned(reg6[(1'h1):(1'h0)]));
        end
      else
        begin
          reg17 <= (&$unsigned($signed(reg17)));
        end
      reg18 <= $unsigned(((({(8'haa), wire4} && (^reg15)) ?
          $unsigned($signed(wire5)) : {(reg8 ?
                  reg17 : reg15)}) <= $signed((+(~&reg17)))));
      if ({reg15[(3'h5):(3'h5)]})
        begin
          reg19 <= reg14[(2'h3):(2'h2)];
          reg20 <= wire2[(4'hd):(3'h6)];
          reg21 <= (reg7 ?
              {$signed(reg19[(1'h1):(1'h1)])} : reg17[(3'h5):(2'h3)]);
          reg22 <= $signed(wire0[(4'ha):(1'h0)]);
        end
      else
        begin
          reg19 <= (reg13 <<< (~(((reg13 ?
                  reg22 : reg20) | reg19[(2'h2):(1'h0)]) ?
              reg11[(3'h6):(2'h2)] : {$signed(reg7)})));
          if (($signed($unsigned(((reg20 || (8'hb7)) ?
                  (reg17 << reg11) : reg7))) ?
              $unsigned(reg15) : reg12))
            begin
              reg20 <= {(~|$unsigned({wire3[(2'h2):(1'h1)]}))};
              reg21 <= (wire0[(3'h4):(2'h3)] | ((((+reg16) ?
                          (reg21 && reg6) : $signed(reg21)) ?
                      {$unsigned((8'ha5))} : ($unsigned((7'h40)) ~^ $unsigned((8'ha6)))) ?
                  reg8[(2'h2):(2'h2)] : ((reg10[(2'h2):(2'h2)] ?
                      (+(8'hbd)) : wire4[(5'h13):(4'ha)]) > $unsigned(reg10))));
              reg22 <= reg15[(3'h4):(1'h1)];
            end
          else
            begin
              reg20 <= reg17;
              reg21 <= reg11[(1'h0):(1'h0)];
              reg22 <= reg15;
              reg23 <= $unsigned(reg11[(1'h0):(1'h0)]);
              reg24 <= reg21[(4'ha):(4'h8)];
            end
          reg25 <= $signed((8'ha3));
        end
      if (($unsigned(((8'ha4) ?
          (reg16[(3'h4):(3'h4)] ?
              (reg8 ? reg7 : reg13) : reg13) : (~|reg17))) ^~ ((~&({reg17,
          wire5} ^~ {reg24})) * (|(^~(+(8'h9d)))))))
        begin
          reg26 <= (~|(&wire3[(2'h2):(1'h1)]));
          reg27 <= reg14[(1'h1):(1'h1)];
          reg28 <= ($signed(reg18) + (8'hbf));
          reg29 <= reg24[(2'h2):(1'h0)];
          reg30 <= reg12;
        end
      else
        begin
          if ((($signed((~&((8'h9c) ? (8'ha5) : wire5))) ?
                  (({reg18, reg19} ?
                      (|(8'hbf)) : reg25[(1'h1):(1'h0)]) ^ ((~&reg25) - $signed(reg25))) : ((~&{wire3,
                          reg28}) ?
                      ((wire0 ^~ reg28) ?
                          (reg11 ?
                              reg13 : reg29) : (8'ha1)) : $unsigned((-reg24)))) ?
              reg21 : reg30))
            begin
              reg26 <= reg19[(2'h2):(1'h1)];
              reg27 <= reg12[(3'h6):(2'h2)];
              reg28 <= $unsigned($signed(wire0));
              reg29 <= $unsigned(reg22[(4'ha):(4'ha)]);
            end
          else
            begin
              reg26 <= wire0[(2'h2):(1'h1)];
              reg27 <= (&$unsigned(((^$unsigned((8'h9c))) >> ($signed(reg28) ?
                  (reg28 < (8'hba)) : (reg25 ? reg24 : (7'h40))))));
              reg28 <= reg11;
              reg29 <= wire1[(1'h0):(1'h0)];
            end
          reg30 <= reg23;
          reg31 <= reg10;
          if ((reg9[(5'h11):(4'h8)] & $signed($unsigned(reg8))))
            begin
              reg32 <= (reg23[(4'hd):(4'h8)] ?
                  $signed((($unsigned(wire2) ?
                      reg20 : {reg20}) < ($unsigned(reg15) ?
                      {reg6, (7'h44)} : {reg16,
                          reg22}))) : {(($signed((8'hb4)) ?
                          $unsigned(wire5) : ((8'h9e) ?
                              reg25 : wire5)) || (~(^reg22))),
                      ((-$unsigned(reg12)) ?
                          $signed(reg10) : {$unsigned(reg23),
                              (wire2 ^~ reg30)})});
              reg33 <= $unsigned($signed($unsigned(reg32[(4'h9):(3'h5)])));
              reg34 <= (^((|(!(reg26 <<< (8'ha7)))) << $signed(((wire4 ~^ reg32) == reg30))));
            end
          else
            begin
              reg32 <= ({(($signed(reg24) == ((8'ha7) ? reg7 : reg10)) ?
                      (reg24 ~^ $signed(wire2)) : $signed((reg11 ?
                          reg10 : (7'h44))))} == ((wire1[(3'h4):(2'h3)] ^~ (8'ha8)) ?
                  (reg31 - $unsigned($signed(reg19))) : $signed((|reg34[(4'h9):(4'h9)]))));
              reg33 <= reg8;
              reg34 <= {$unsigned((reg20 ?
                      ($unsigned(reg30) * wire1) : wire1))};
              reg35 <= $unsigned(wire1);
              reg36 <= reg15;
            end
          reg37 <= (reg24[(1'h1):(1'h1)] ?
              ((-((8'hac) ? (reg29 ? reg27 : reg24) : (reg8 || (8'h9d)))) ?
                  $signed($unsigned((wire1 ?
                      reg13 : wire5))) : $signed((+(~^reg23)))) : (8'hbb));
        end
    end
  assign wire38 = (reg24 ?
                      ((&reg17) ?
                          (((8'ha2) != ((8'haa) ^~ reg23)) ?
                              $unsigned(reg28) : {reg7[(3'h5):(2'h3)],
                                  ((8'ha1) ?
                                      reg11 : reg22)}) : wire0) : (~^(reg18 ?
                          $signed((wire1 != (8'ha6))) : ((reg26 >> (8'h9d)) - reg22[(2'h3):(2'h3)]))));
  assign wire39 = reg30;
  assign wire40 = (reg37 << (-{{{(8'hbb), reg11}}}));
  module41 #() modinst276 (.clk(clk), .wire44(reg11), .y(wire275), .wire43(reg17), .wire45(reg27), .wire42(reg10));
  module130 #() modinst278 (wire277, clk, reg28, reg29, reg26, reg13, reg7);
  always
    @(posedge clk) begin
      reg279 <= ($signed((~({reg8} ? reg23 : (wire3 >= reg26)))) ?
          $unsigned(wire5) : (&$signed(reg37[(1'h0):(1'h0)])));
      if ($signed($unsigned(($unsigned((reg8 ~^ wire277)) > reg31[(4'hb):(3'h4)]))))
        begin
          if (reg10)
            begin
              reg280 <= (+{$unsigned($signed((8'hba)))});
              reg281 <= ((8'hb2) ?
                  wire277[(4'h8):(1'h1)] : ($signed({$signed((8'ha2))}) <= (^((reg12 > reg17) ?
                      {reg34} : (&(8'hae))))));
              reg282 <= ((reg13[(4'ha):(3'h7)] ?
                      {$signed(wire0),
                          (~^{reg32, reg12})} : wire275[(3'h4):(3'h4)]) ?
                  (|(wire277 ^ ((reg13 << (8'ha2)) >>> $unsigned(reg34)))) : reg35);
            end
          else
            begin
              reg280 <= ((reg13[(4'h9):(2'h2)] ?
                  (+{wire38, reg13}) : reg7) >= {(8'hac), reg32});
              reg281 <= wire2[(4'hb):(1'h1)];
              reg282 <= ((reg20 <<< (|((~|(8'hbe)) ?
                  reg20 : (~&reg17)))) <<< (reg30 && wire39[(3'h4):(3'h4)]));
              reg283 <= {$signed((wire40[(3'h4):(1'h0)] ?
                      ($signed(reg23) << $signed(reg10)) : reg30)),
                  reg24[(1'h1):(1'h0)]};
            end
        end
      else
        begin
          reg280 <= ($signed((($signed((8'hb0)) >>> (reg25 ? reg279 : reg30)) ?
              $signed((+wire39)) : (~^(reg36 ? (8'hb8) : reg6)))) >>> reg7);
          reg281 <= reg19[(3'h6):(3'h4)];
          reg282 <= {$unsigned(reg32[(3'h6):(1'h0)]),
              $unsigned((~$unsigned((reg27 ? reg28 : reg283))))};
          if (({((~&(8'ha6)) ?
                      reg35[(1'h0):(1'h0)] : (reg22[(3'h5):(1'h0)] < (&reg20))),
                  ((~|wire38[(3'h5):(1'h0)]) >> wire275[(2'h2):(1'h0)])} ?
              ((8'hbd) <= (~$unsigned((reg17 ~^ (8'hae))))) : {((~^(-reg30)) ?
                      reg23 : reg282[(3'h4):(3'h4)])}))
            begin
              reg283 <= reg30;
            end
          else
            begin
              reg283 <= {((8'ha8) == $signed(wire39)),
                  ((reg27[(4'h8):(1'h1)] || ($signed(wire277) - reg19[(3'h5):(1'h0)])) ?
                      reg28[(3'h5):(2'h3)] : reg21)};
              reg284 <= ((wire275 == (~^(reg31[(3'h6):(1'h0)] ?
                  $unsigned(wire38) : (~^reg34)))) > {(|{reg12[(1'h1):(1'h1)],
                      $unsigned(reg22)})});
              reg285 <= wire40;
              reg286 <= reg284[(5'h13):(3'h7)];
              reg287 <= reg25[(4'hc):(4'h9)];
            end
        end
      reg288 <= $unsigned($unsigned((-((reg20 ? reg279 : (8'h9d)) | {reg26,
          reg279}))));
      reg289 <= ((reg284 < (reg10 ?
              {(reg6 ? reg31 : reg8)} : reg28[(3'h6):(3'h4)])) ?
          $unsigned((~^(+reg288))) : reg287);
      if ($unsigned(($unsigned((reg27[(3'h7):(1'h0)] ?
              $unsigned(wire277) : (reg24 >>> (8'hab)))) ?
          {wire2[(2'h2):(1'h0)]} : reg27)))
        begin
          if ((({((reg27 ? reg7 : reg31) ? (~^reg11) : (^~(8'haa))),
                  $unsigned((reg6 ? reg280 : reg19))} ?
              ((~&(8'hbb)) != {{reg8}}) : $unsigned(((wire1 ^ reg37) || $unsigned(reg25)))) && reg28[(3'h6):(3'h4)]))
            begin
              reg290 <= reg286;
              reg291 <= ({reg19[(3'h6):(1'h0)], {$unsigned((&reg7)), reg285}} ?
                  reg16[(4'hb):(4'ha)] : (~|(reg287 + reg9[(3'h5):(1'h0)])));
            end
          else
            begin
              reg290 <= (-(reg34[(2'h3):(1'h1)] ?
                  wire4[(4'hd):(4'h9)] : (reg29 || (-{reg9}))));
              reg291 <= reg27;
              reg292 <= ((~|$unsigned($unsigned(reg8))) && reg290);
              reg293 <= ({(reg28 >>> $signed(wire277[(4'h8):(4'h8)])),
                      reg291[(2'h3):(2'h3)]} ?
                  (8'hb7) : reg18[(3'h6):(1'h0)]);
            end
          reg294 <= $signed((((+wire5) & $signed($unsigned(reg27))) | (7'h42)));
          reg295 <= ((~|{$signed((reg280 < reg10)),
              $unsigned((reg284 ? reg29 : wire3))}) && (+(8'h9f)));
          reg296 <= $unsigned((~^$unsigned(reg21[(4'h9):(2'h2)])));
          reg297 <= wire38;
        end
      else
        begin
          if ((reg284 * (~reg22)))
            begin
              reg290 <= (reg15[(3'h5):(3'h5)] >>> wire5);
              reg291 <= ((~|(~reg24)) ?
                  ({(reg25[(4'h8):(3'h7)] <= {reg20, reg20}),
                          {(wire39 ? (8'ha8) : (8'hb3)), $unsigned(wire1)}} ?
                      (wire5 ^ (((8'ha0) >> (8'ha5)) ?
                          {reg16} : reg15)) : (-wire275[(3'h4):(2'h3)])) : ($signed((~&(reg292 ?
                          (8'ha0) : reg23))) ?
                      ($unsigned((reg15 ? reg14 : reg26)) ?
                          (((8'hb0) ? reg284 : reg287) << {reg18,
                              wire5}) : reg21[(2'h2):(2'h2)]) : $unsigned(reg287[(2'h3):(2'h2)])));
              reg292 <= reg23[(3'h6):(2'h2)];
              reg293 <= {$signed({($signed(reg28) ?
                          (reg285 & reg286) : (^(8'ha7))),
                      wire277}),
                  reg32};
              reg294 <= {{((~&(reg14 ? (8'hb2) : reg296)) ?
                          ((reg36 ?
                              reg31 : reg10) >>> $signed((8'hb7))) : wire39),
                      $unsigned(wire275)},
                  ($signed((+(8'ha5))) ?
                      $unsigned($signed($signed(reg24))) : (~(-(reg17 ?
                          reg28 : reg293))))};
            end
          else
            begin
              reg290 <= (reg37 ?
                  ($signed((~|$signed(reg18))) != (reg19 << (-{wire4}))) : reg297[(2'h2):(1'h1)]);
              reg291 <= reg30[(2'h3):(2'h3)];
              reg292 <= (({$unsigned(reg29[(5'h13):(4'hd)]),
                  (reg18 >> ((8'hbb) ? reg24 : wire277))} == (((|(8'hb7)) ?
                      $signed(reg29) : (reg20 || reg32)) ?
                  reg6[(3'h4):(2'h2)] : (wire277 != ((8'ha4) - reg32)))) >> (reg32 ?
                  ((~|(reg14 ?
                      reg281 : reg22)) ^ $unsigned((~|reg28))) : (|reg22[(3'h7):(3'h5)])));
              reg293 <= reg288;
              reg294 <= ({$unsigned($unsigned((reg281 ? reg12 : wire275))),
                      ($unsigned($unsigned((7'h42))) >>> {wire38[(5'h12):(3'h4)]})} ?
                  (~|reg11[(3'h5):(3'h5)]) : ((~$signed((reg291 ?
                      (8'hbe) : reg34))) - (wire2[(3'h7):(3'h6)] != reg294)));
            end
          reg295 <= $signed(($unsigned($signed($unsigned((8'haf)))) ?
              $signed($unsigned(reg13[(1'h0):(1'h0)])) : ($signed((reg36 - reg20)) ?
                  ((reg31 ?
                      reg284 : reg29) + reg289[(4'ha):(4'ha)]) : (((8'ha0) ?
                      reg297 : wire40) && (~|reg20)))));
          reg296 <= {$signed((8'hb4))};
          reg297 <= (~$signed((-$signed($unsigned(reg295)))));
        end
    end
  always
    @(posedge clk) begin
      reg298 <= wire275;
      reg299 <= {$signed($signed($signed({reg294}))),
          $unsigned(reg295[(3'h6):(1'h1)])};
    end
  module130 #() modinst301 (wire300, clk, wire1, reg290, reg282, wire3, reg33);
  assign wire302 = reg17[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg303 <= $signed((reg8 >> {$signed((reg282 ? reg280 : reg284))}));
    end
  module225 #() modinst305 (wire304, clk, reg11, reg20, wire5, reg37, reg35);
  assign wire306 = (^wire38);
  assign wire307 = $signed($unsigned($signed(wire300)));
  assign wire308 = $unsigned(reg15);
  assign wire309 = reg33;
  assign wire310 = (+$signed((^$unsigned((8'ha9)))));
  assign wire311 = wire4;
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire44;
  input wire signed [(5'h11):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire223;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(5'h12):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire273;
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  assign y = {wire223,
                 wire152,
                 wire151,
                 wire105,
                 wire47,
                 wire46,
                 wire107,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire149,
                 wire273,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 (1'h0)};
  assign wire46 = (($unsigned($unsigned($unsigned((8'hb5)))) ?
                          wire45 : (7'h40)) ?
                      (~^wire42) : wire43[(2'h3):(1'h1)]);
  assign wire47 = ($unsigned(wire46[(3'h6):(2'h3)]) - wire46);
  module48 #() modinst106 (wire105, clk, wire46, wire44, wire42, wire47, wire43);
  assign wire107 = wire42[(4'hb):(4'h9)];
  always
    @(posedge clk) begin
      if (wire43)
        begin
          reg108 <= wire44[(4'he):(4'hc)];
          reg109 <= wire107;
          reg110 <= wire43[(1'h1):(1'h1)];
        end
      else
        begin
          if ($signed((wire44[(3'h5):(1'h0)] < reg110)))
            begin
              reg108 <= wire43[(4'h8):(3'h7)];
              reg109 <= $unsigned($unsigned(wire45));
              reg110 <= (8'hb0);
              reg111 <= wire42[(3'h5):(2'h3)];
            end
          else
            begin
              reg108 <= ((~^$signed($signed(reg108[(4'hc):(4'h8)]))) ?
                  ($unsigned((wire46[(2'h3):(2'h3)] ?
                          (reg108 - wire42) : {(8'ha0)})) ?
                      reg108 : wire105) : (($signed($signed(reg111)) ^~ wire45[(4'h9):(1'h0)]) ?
                      (-((reg108 && wire42) ^ $unsigned(wire46))) : {{$unsigned(wire105),
                              wire44[(4'h8):(2'h2)]},
                          (wire42[(3'h6):(1'h1)] ?
                              (wire42 | reg111) : (!wire43))}));
              reg109 <= $signed($unsigned((wire46[(3'h7):(2'h2)] ?
                  $signed({reg110}) : reg110)));
              reg110 <= wire42[(3'h4):(2'h2)];
              reg111 <= (+{wire45[(3'h4):(2'h2)], wire44[(3'h7):(2'h2)]});
            end
          reg112 <= $signed(reg111);
          reg113 <= wire43[(4'hb):(3'h7)];
          reg114 <= $unsigned((+$unsigned(wire45[(3'h4):(2'h3)])));
        end
    end
  always
    @(posedge clk) begin
      reg115 <= (!{(+(((7'h43) ? reg109 : reg111) ?
              wire42[(3'h6):(2'h2)] : $unsigned((8'ha9)))),
          $unsigned($unsigned((wire105 ? wire42 : wire42)))});
      reg116 <= (wire105[(3'h6):(1'h1)] < $signed($signed($signed(reg109))));
      reg117 <= (~&(^wire43[(1'h1):(1'h0)]));
      if (wire45)
        begin
          reg118 <= ($signed($unsigned($signed($signed(reg111)))) < $unsigned(reg113[(1'h0):(1'h0)]));
          reg119 <= reg108;
          reg120 <= wire44[(4'hd):(4'ha)];
          if (({wire44[(5'h10):(2'h2)],
                  ($unsigned((!wire46)) ?
                      ($unsigned(wire44) ?
                          {(8'ha8)} : $unsigned(wire47)) : reg109[(2'h3):(1'h0)])} ?
              (8'hb5) : wire105))
            begin
              reg121 <= {((reg112 >= reg111) <= $unsigned($signed(wire105)))};
              reg122 <= $unsigned(wire107);
            end
          else
            begin
              reg121 <= reg120[(4'hc):(4'h9)];
              reg122 <= reg117[(3'h6):(2'h3)];
              reg123 <= ({(wire42 | $unsigned($signed(reg108))),
                      {(~&$unsigned(reg112))}} ?
                  reg119[(3'h5):(1'h1)] : $unsigned(wire45[(1'h0):(1'h0)]));
              reg124 <= (&$signed($signed((~&(reg119 > reg113)))));
              reg125 <= (^~((((~reg119) < (reg108 >>> wire107)) >> {wire46[(4'hb):(4'ha)],
                  (|reg113)}) + (reg118 - reg116)));
            end
        end
      else
        begin
          reg118 <= {wire46,
              (^{((wire46 * (8'h9d)) ? $unsigned((8'hb1)) : {(8'h9d), reg113}),
                  $unsigned(reg120)})};
          if ($unsigned({$unsigned(reg111)}))
            begin
              reg119 <= (reg116 | ((-(wire45[(2'h3):(1'h1)] ^ reg110)) | $signed(($signed(reg116) <<< $unsigned(reg124)))));
              reg120 <= (reg123 ?
                  (~reg118) : (!(($signed(wire46) ?
                          $signed(reg113) : (reg110 ? wire43 : reg113)) ?
                      wire46[(4'hd):(3'h4)] : $unsigned((^~reg111)))));
              reg121 <= (wire44[(4'hf):(2'h2)] ?
                  $unsigned(reg123) : ((^~(reg121 != {reg109, reg115})) ?
                      (reg122 ?
                          ((reg108 ?
                              reg110 : reg124) << $signed(reg121)) : ((reg125 == reg108) >> $unsigned(reg122))) : $unsigned((8'hb4))));
            end
          else
            begin
              reg119 <= ($unsigned(((reg112[(1'h0):(1'h0)] ?
                      {reg117, reg110} : (~&reg113)) ?
                  reg123 : (^reg116))) == wire107[(4'hb):(3'h4)]);
            end
          reg122 <= $unsigned(wire45);
          reg123 <= (((-$signed((wire47 ? reg119 : wire42))) >> wire43) ?
              $unsigned(reg109) : wire45);
          reg124 <= (8'ha4);
        end
    end
  assign wire126 = $unsigned({reg118});
  assign wire127 = reg109[(2'h2):(1'h0)];
  assign wire128 = (reg120[(3'h4):(3'h4)] <<< reg116[(5'h15):(2'h2)]);
  assign wire129 = $unsigned(reg116[(1'h1):(1'h1)]);
  module130 #() modinst150 (.wire134(reg124), .wire132(wire42), .y(wire149), .clk(clk), .wire133(reg119), .wire135(reg120), .wire131(reg118));
  assign wire151 = {(($unsigned(reg111) ?
                               reg108[(3'h5):(1'h1)] : (~&$signed(reg116))) ?
                           $signed(wire127) : (+(8'hbe))),
                       $signed(((wire107[(3'h4):(3'h4)] && (wire45 ?
                           (7'h42) : (8'hbb))) >= {{(8'ha4), reg118}}))};
  assign wire152 = $unsigned(reg125[(4'h8):(3'h7)]);
  module153 #() modinst224 (wire223, clk, reg111, reg112, wire151, reg118);
  module225 #() modinst274 (wire273, clk, reg111, wire42, reg119, wire46, wire127);
endmodule

module module225  (y, clk, wire230, wire229, wire228, wire227, wire226);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire230;
  input wire signed [(3'h4):(1'h0)] wire229;
  input wire signed [(4'h9):(1'h0)] wire228;
  input wire [(3'h7):(1'h0)] wire227;
  input wire signed [(4'hb):(1'h0)] wire226;
  wire signed [(3'h6):(1'h0)] wire272;
  wire signed [(5'h11):(1'h0)] wire271;
  wire signed [(4'hd):(1'h0)] wire270;
  wire signed [(3'h7):(1'h0)] wire269;
  wire [(2'h2):(1'h0)] wire268;
  wire signed [(5'h15):(1'h0)] wire255;
  wire [(5'h13):(1'h0)] wire254;
  wire signed [(4'hb):(1'h0)] wire253;
  wire signed [(3'h7):(1'h0)] wire252;
  wire signed [(3'h5):(1'h0)] wire234;
  wire [(4'h9):(1'h0)] wire233;
  wire [(4'hc):(1'h0)] wire232;
  wire [(5'h12):(1'h0)] wire231;
  reg signed [(4'h8):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg264 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg263 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg262 = (1'h0);
  reg [(4'hd):(1'h0)] reg261 = (1'h0);
  reg [(5'h15):(1'h0)] reg260 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg259 = (1'h0);
  reg [(5'h14):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg257 = (1'h0);
  reg [(5'h13):(1'h0)] reg256 = (1'h0);
  reg signed [(4'he):(1'h0)] reg251 = (1'h0);
  reg [(4'h9):(1'h0)] reg250 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg249 = (1'h0);
  reg [(5'h10):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg247 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg246 = (1'h0);
  reg [(3'h4):(1'h0)] reg245 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg244 = (1'h0);
  reg [(4'h9):(1'h0)] reg243 = (1'h0);
  reg [(2'h3):(1'h0)] reg242 = (1'h0);
  reg signed [(4'he):(1'h0)] reg241 = (1'h0);
  reg [(4'he):(1'h0)] reg240 = (1'h0);
  reg signed [(4'he):(1'h0)] reg239 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg238 = (1'h0);
  reg [(2'h2):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg236 = (1'h0);
  reg [(4'hf):(1'h0)] reg235 = (1'h0);
  assign y = {wire272,
                 wire271,
                 wire270,
                 wire269,
                 wire268,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  assign wire231 = $signed($signed((((-(7'h40)) ?
                       wire228[(3'h7):(1'h0)] : (~&wire228)) > wire228[(2'h3):(1'h1)])));
  assign wire232 = wire231;
  assign wire233 = $unsigned({$unsigned(wire232)});
  assign wire234 = {$unsigned($signed((!(wire226 ? wire228 : wire226))))};
  always
    @(posedge clk) begin
      if (wire229[(2'h3):(2'h2)])
        begin
          if ((wire228[(4'h8):(3'h6)] - $unsigned(($signed((wire233 ?
                  (8'hb5) : wire234)) ?
              {$signed(wire226)} : wire229))))
            begin
              reg235 <= ({wire234[(3'h4):(1'h1)], wire230} ^~ (wire232 ?
                  $signed(wire228) : ((~^(~&wire233)) ?
                      $unsigned(wire230[(3'h4):(2'h3)]) : $signed((+wire233)))));
            end
          else
            begin
              reg235 <= wire229;
              reg236 <= wire226[(2'h3):(1'h1)];
              reg237 <= (-$unsigned($signed({(wire229 ? wire227 : (8'ha2)),
                  $unsigned(wire230)})));
              reg238 <= (($unsigned(wire232[(3'h6):(1'h1)]) >>> $unsigned({((8'hac) ?
                      wire232 : wire230),
                  wire229[(2'h2):(1'h1)]})) != ((+wire229) != (((8'hb5) || wire232) ~^ (reg237 - $unsigned(wire232)))));
              reg239 <= wire226[(2'h2):(2'h2)];
            end
          reg240 <= (wire226 ? wire233[(3'h5):(3'h4)] : reg237);
        end
      else
        begin
          reg235 <= reg237[(2'h2):(2'h2)];
          reg236 <= $unsigned((&$signed(wire228[(4'h8):(1'h1)])));
          reg237 <= $unsigned(((wire232 ?
              $signed((+wire232)) : wire227[(1'h1):(1'h0)]) ^ wire231));
          reg238 <= wire226[(4'hb):(2'h3)];
        end
      if ((~|reg237))
        begin
          reg241 <= reg238;
          reg242 <= reg235;
        end
      else
        begin
          reg241 <= (^~(($unsigned(wire229) ?
              wire230[(4'h9):(4'h9)] : ((reg242 ?
                  reg240 : wire232) == (~&wire231))) * ((wire229[(1'h0):(1'h0)] ?
              $unsigned(wire227) : (!(7'h44))) - ($signed(wire229) ?
              {wire227, wire233} : $unsigned(wire233)))));
          if (reg240)
            begin
              reg242 <= reg235;
              reg243 <= reg240;
              reg244 <= {(((|$signed(wire226)) >= (wire227 ?
                          $unsigned(reg240) : {reg239})) ?
                      ((~&$signed(wire230)) ?
                          $unsigned({wire232}) : {(reg235 ? reg237 : reg240),
                              (wire230 ?
                                  wire233 : wire228)}) : reg240[(2'h2):(2'h2)]),
                  (-(reg238[(3'h5):(3'h5)] ?
                      (8'had) : {$signed(reg236), wire227[(2'h3):(1'h0)]}))};
              reg245 <= (~^(&wire229[(2'h3):(1'h0)]));
            end
          else
            begin
              reg242 <= $unsigned(((~&reg235) * $unsigned($signed(reg239))));
              reg243 <= wire234[(2'h2):(2'h2)];
            end
          if (($unsigned(reg236) ?
              ({wire230[(3'h7):(3'h7)],
                  wire226[(4'h8):(1'h1)]} << wire228) : ($signed((wire230[(1'h1):(1'h0)] ?
                  $signed(reg241) : (reg244 ?
                      wire233 : wire231))) << (($unsigned(wire233) >= (reg239 ?
                      reg239 : wire230)) ?
                  (reg245[(1'h0):(1'h0)] ?
                      wire232[(2'h2):(1'h1)] : $unsigned(wire231)) : wire231))))
            begin
              reg246 <= ($signed(((reg237[(1'h1):(1'h1)] ?
                      $unsigned(wire234) : ((8'hb6) ?
                          wire228 : reg238)) & wire231[(4'h9):(3'h4)])) ?
                  (!wire228) : {wire231,
                      $unsigned($unsigned(wire233[(1'h1):(1'h0)]))});
              reg247 <= ((~{$signed(((8'hbc) << reg238))}) * reg237);
              reg248 <= {$unsigned(($signed($unsigned(reg244)) + wire226))};
            end
          else
            begin
              reg246 <= ({reg236[(3'h7):(1'h0)],
                  (((8'hab) > {reg237}) | $unsigned($unsigned(reg236)))} <= $signed(((8'ha0) ?
                  (^((8'hbd) >> reg247)) : (((8'ha2) ? wire230 : reg244) ?
                      reg243 : $signed(reg236)))));
              reg247 <= ($unsigned(($signed($signed(wire229)) ?
                      {(7'h41), reg243[(2'h2):(1'h0)]} : reg247)) ?
                  wire231[(5'h11):(4'h8)] : $signed(((wire234 ~^ reg244) | $signed($unsigned(wire229)))));
            end
          reg249 <= $unsigned(wire233);
        end
      reg250 <= reg245[(2'h3):(2'h2)];
      reg251 <= (reg243 ? (~|($unsigned((!reg242)) != (8'hb6))) : reg245);
    end
  assign wire252 = (+(!({{reg239}, (wire227 ? wire228 : reg239)} - wire226)));
  assign wire253 = $unsigned(reg238);
  assign wire254 = $unsigned((reg243 <<< reg235[(4'ha):(4'h8)]));
  assign wire255 = ((8'ha1) < ($signed($signed((^reg240))) ?
                       wire233 : ({$signed((8'hbc))} ?
                           wire229 : ((reg241 > reg251) ?
                               (!wire233) : $unsigned((8'ha5))))));
  always
    @(posedge clk) begin
      if ($signed((8'ha4)))
        begin
          reg256 <= ((-$signed($unsigned(((8'h9d) << reg236)))) ?
              ((~|$signed((wire232 ?
                  wire252 : wire228))) <= $signed(wire226)) : $unsigned(($signed((wire228 ?
                  (8'hb2) : reg247)) ^ wire252[(3'h4):(1'h0)])));
          reg257 <= $unsigned(reg237[(1'h0):(1'h0)]);
          if (((^~{(^(~(8'hac))), reg244}) ?
              (wire254 == wire230[(3'h7):(3'h4)]) : ({{wire231[(3'h4):(2'h3)]},
                      reg247} ?
                  (^~(^(!reg235))) : $unsigned($signed($signed(reg250))))))
            begin
              reg258 <= ($signed(reg241[(4'hb):(3'h5)]) ?
                  (wire227 - {reg248[(3'h7):(2'h3)],
                      reg242}) : (~&$unsigned(wire227)));
              reg259 <= (reg245 ~^ reg237[(1'h0):(1'h0)]);
              reg260 <= ($unsigned($unsigned((reg257 | wire233))) ?
                  wire226[(4'hb):(2'h3)] : $unsigned((!(~^(8'ha0)))));
              reg261 <= $signed(reg244);
            end
          else
            begin
              reg258 <= (^~$unsigned((($signed((8'hb7)) ^ ((8'ha2) ?
                      (8'hbe) : wire253)) ?
                  (wire232[(4'h9):(1'h1)] < reg256) : reg249[(3'h6):(3'h4)])));
              reg259 <= (wire231[(4'hd):(3'h5)] || {reg261});
              reg260 <= ({reg247, wire232} <<< (!reg242[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          if ((((reg238[(4'h9):(1'h0)] >>> $signed({reg249})) ?
                  ((&(&reg241)) & reg240) : wire230) ?
              reg237 : $unsigned(($unsigned(((8'hbd) | wire229)) > wire255))))
            begin
              reg256 <= (!reg260);
            end
          else
            begin
              reg256 <= (({($unsigned(wire231) ?
                      {reg251,
                          wire227} : $unsigned(reg257))} >>> $unsigned(reg241[(3'h6):(2'h3)])) <= ((($signed(wire229) ?
                      $unsigned(reg238) : {wire255}) & {reg238, reg258}) ?
                  ($signed((^~wire255)) ?
                      (((8'hb1) ? reg251 : reg236) ?
                          $signed(reg248) : $unsigned(wire233)) : {$unsigned(wire232),
                          wire228}) : reg242));
              reg257 <= reg238[(3'h4):(2'h2)];
              reg258 <= ($unsigned($unsigned(($signed(wire230) & $signed((7'h44))))) ?
                  reg256 : $unsigned(reg243));
            end
          if ($signed(reg258[(5'h10):(2'h2)]))
            begin
              reg259 <= wire234[(3'h5):(2'h3)];
              reg260 <= (($unsigned($signed((~|wire231))) << $unsigned(reg248)) | reg260);
              reg261 <= reg247[(4'hb):(4'h9)];
              reg262 <= {$signed(reg246),
                  ((reg259 | ($unsigned(wire233) ?
                      ((8'ha5) > reg256) : wire252[(1'h0):(1'h0)])) < ({$unsigned(wire233)} != (wire232[(2'h3):(1'h1)] ?
                      reg249[(1'h1):(1'h0)] : reg243[(3'h4):(3'h4)])))};
              reg263 <= (($signed(wire255) ?
                  $unsigned((7'h42)) : ($unsigned($unsigned(wire228)) ?
                      $unsigned((~^(8'h9c))) : ($unsigned((8'hb0)) ?
                          (wire254 + reg243) : $signed(wire254)))) >>> $unsigned(((((8'ha7) - reg261) ?
                  wire234[(3'h5):(2'h3)] : {reg258,
                      (8'hbc)}) >= $signed(reg262[(4'h8):(3'h6)]))));
            end
          else
            begin
              reg259 <= (wire228 > reg258);
            end
        end
      reg264 <= wire234[(1'h0):(1'h0)];
      reg265 <= reg262[(2'h3):(2'h3)];
      reg266 <= wire231;
      reg267 <= ((~|wire228[(3'h7):(3'h6)]) << (&$signed($signed((reg237 & (8'hb6))))));
    end
  assign wire268 = $unsigned(((((reg266 ? reg262 : reg243) ?
                           wire233[(4'h9):(1'h1)] : (^reg263)) ?
                       ((wire233 | reg265) ?
                           (reg242 ? wire229 : reg244) : (reg250 ?
                               wire226 : reg264)) : (((8'hbc) + reg249) ?
                           ((8'hb4) & reg235) : reg239[(4'hb):(1'h0)])) && ($unsigned($unsigned(reg264)) ?
                       $unsigned({reg244, reg263}) : $signed((wire227 ?
                           wire233 : reg265)))));
  assign wire269 = ((reg241[(3'h6):(3'h5)] ?
                           $unsigned(wire228[(3'h5):(2'h2)]) : ($signed(reg257[(2'h3):(1'h0)]) ?
                               {(wire229 == reg257),
                                   (wire252 ?
                                       reg256 : reg243)} : ($unsigned(reg257) ?
                                   reg237[(2'h2):(2'h2)] : (^wire254)))) ?
                       reg249[(4'h8):(1'h0)] : ($unsigned((reg248[(2'h3):(1'h0)] << $unsigned(reg235))) ?
                           wire253[(3'h4):(3'h4)] : (($unsigned(reg237) ?
                                   $unsigned(reg248) : ((8'hb0) || reg266)) ?
                               (!wire232[(4'hc):(1'h1)]) : reg242[(1'h0):(1'h0)])));
  assign wire270 = wire255;
  assign wire271 = $unsigned(wire252);
  assign wire272 = reg260;
endmodule

module module153
#(parameter param221 = ((|{(~((8'haa) != (8'ha8)))}) ^ (~^(({(8'h9f), (8'ha6)} >= (&(8'ha0))) ? ((7'h43) ~^ ((8'hbc) ? (8'hbf) : (8'h9c))) : (((8'hb8) >= (8'ha9)) >= (|(8'hbf)))))), 
parameter param222 = {param221, ({(~|(param221 & param221))} >>> (~((param221 + param221) ? (param221 - param221) : param221)))})
(y, clk, wire157, wire156, wire155, wire154);
  output wire [(32'h2ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire157;
  input wire [(4'ha):(1'h0)] wire156;
  input wire signed [(5'h12):(1'h0)] wire155;
  input wire signed [(5'h12):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire220;
  wire signed [(4'hf):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  wire [(5'h12):(1'h0)] wire165;
  wire [(2'h3):(1'h0)] wire164;
  wire signed [(3'h6):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  reg [(5'h15):(1'h0)] reg219 = (1'h0);
  reg [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(3'h6):(1'h0)] reg217 = (1'h0);
  reg [(4'h9):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg215 = (1'h0);
  reg [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg213 = (1'h0);
  reg [(5'h10):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg211 = (1'h0);
  reg [(4'hb):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg207 = (1'h0);
  reg [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg [(4'hc):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg199 = (1'h0);
  reg [(5'h10):(1'h0)] reg198 = (1'h0);
  reg [(4'hf):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg190 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg175 = (1'h0);
  reg [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  assign y = {wire220,
                 wire180,
                 wire179,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire158 = (-$unsigned($unsigned((8'h9e))));
  assign wire159 = (7'h40);
  assign wire160 = (8'hac);
  assign wire161 = (wire158[(3'h5):(2'h2)] << $signed($signed((~^$signed(wire157)))));
  assign wire162 = (~^($unsigned($signed((wire159 ?
                       (7'h42) : wire161))) | $unsigned(wire158)));
  assign wire163 = $signed({{wire160[(4'hc):(1'h1)]}});
  assign wire164 = (wire155[(4'h8):(1'h1)] ^ $unsigned((wire163[(3'h4):(2'h3)] ?
                       wire157 : wire160[(2'h3):(2'h3)])));
  assign wire165 = (8'ha0);
  always
    @(posedge clk) begin
      if ((^wire161[(2'h2):(2'h2)]))
        begin
          reg166 <= wire158;
          if ((wire154 ?
              ((&(|wire154[(3'h6):(1'h0)])) || $signed(wire160)) : ({(|{wire160}),
                  wire163} - $unsigned(wire155))))
            begin
              reg167 <= ((8'ha4) > ($unsigned(wire154) <<< (~|wire160[(4'h9):(2'h2)])));
              reg168 <= $signed($signed((((wire156 ~^ wire158) != (^wire157)) + wire164)));
            end
          else
            begin
              reg167 <= (^$unsigned((8'ha3)));
              reg168 <= $unsigned(($unsigned(wire157[(3'h5):(3'h5)]) <<< wire156));
              reg169 <= $signed(wire161);
              reg170 <= $unsigned(wire155[(2'h3):(1'h0)]);
              reg171 <= reg170;
            end
          if ($unsigned(((wire161[(4'hb):(3'h4)] ^ $signed((!wire162))) < $signed(wire164))))
            begin
              reg172 <= {(-wire160), $signed({reg167[(4'h8):(2'h2)]})};
              reg173 <= {($signed((wire161[(3'h7):(1'h0)] ^ (!reg170))) & ({(wire159 ^ reg167)} ?
                      reg172[(1'h0):(1'h0)] : ($signed((8'hb8)) < {wire160})))};
              reg174 <= (8'hae);
              reg175 <= ($signed({$unsigned(((8'h9e) + (8'hab))),
                  $unsigned({wire155, reg166})}) << wire157);
              reg176 <= wire160;
            end
          else
            begin
              reg172 <= {(^~$unsigned($unsigned(wire156))),
                  (wire163 ?
                      {$unsigned($signed(reg172))} : $signed(((^reg174) ?
                          {reg173, wire164} : wire158)))};
            end
          reg177 <= (8'had);
          reg178 <= (reg174 <= reg170[(4'hc):(3'h6)]);
        end
      else
        begin
          reg166 <= (reg170[(5'h10):(1'h0)] ?
              (^reg167) : ((|reg172[(2'h2):(1'h0)]) ?
                  $unsigned($signed((wire155 | (8'hbd)))) : $signed(($signed((8'ha2)) >> (wire158 > wire154)))));
          reg167 <= {((((7'h40) ? (~|wire163) : reg173[(1'h1):(1'h0)]) ?
                  wire163 : (~|wire162[(2'h2):(1'h0)])) ^~ (({reg177} ?
                      $signed(reg172) : (~wire164)) ?
                  {(wire160 ? wire156 : reg178),
                      $unsigned((8'ha9))} : wire161[(1'h0):(1'h0)]))};
          reg168 <= wire159[(1'h1):(1'h1)];
        end
    end
  assign wire179 = wire163[(3'h4):(2'h3)];
  assign wire180 = $unsigned((^(8'ha2)));
  always
    @(posedge clk) begin
      if ((((((reg168 ? reg169 : (8'hb7)) ?
          ((8'h9c) ?
              wire159 : wire179) : wire155[(3'h4):(2'h2)]) > $signed((wire180 ?
          (8'hb5) : reg178))) >>> (($signed(reg173) ^ (-wire154)) ^ ((reg172 ?
          (8'hb1) : reg169) << $unsigned(wire157)))) ^~ (|(8'ha6))))
        begin
          reg181 <= ({wire164} ~^ ((|((~^wire154) || $signed((8'h9f)))) | wire154));
        end
      else
        begin
          reg181 <= (wire157[(1'h0):(1'h0)] ?
              (7'h41) : ((8'hbb) && $signed({(^reg178)})));
          reg182 <= (reg174 >> $unsigned(wire154));
          reg183 <= reg169;
        end
      reg184 <= (~&($signed({reg174}) << (8'hb2)));
      if ((&$signed((reg175 ? $signed($unsigned(wire154)) : (8'hb2)))))
        begin
          if (reg169)
            begin
              reg185 <= reg183;
              reg186 <= $unsigned($unsigned($unsigned(($signed(reg185) >>> $unsigned(wire164)))));
            end
          else
            begin
              reg185 <= reg171;
            end
        end
      else
        begin
          reg185 <= $unsigned((8'ha4));
          if ((((((wire179 ? wire162 : reg171) < reg175[(4'hb):(4'hb)]) ?
                      reg166[(2'h2):(1'h1)] : reg173[(2'h2):(2'h2)]) ?
                  reg182 : ($signed($unsigned(wire156)) && (wire160 ?
                      (+reg169) : wire160[(4'h9):(4'h8)]))) ?
              (~|($unsigned((reg175 < reg166)) <<< reg184)) : ($unsigned(((!wire163) < reg172[(2'h3):(1'h0)])) < ($signed((wire160 > (8'haa))) ?
                  $signed({reg181}) : reg175[(1'h0):(1'h0)]))))
            begin
              reg186 <= (~^$signed($unsigned((wire179[(1'h1):(1'h0)] >= {reg175}))));
            end
          else
            begin
              reg186 <= {{(8'ha7)}, wire158};
              reg187 <= $signed(wire161[(3'h5):(1'h0)]);
              reg188 <= reg176;
              reg189 <= $unsigned((($signed((reg188 ^ reg172)) ^ reg182) <<< wire180));
            end
        end
      reg190 <= ($unsigned(($signed((reg186 ?
          (8'h9e) : wire158)) ~^ (reg168[(4'h8):(3'h4)] | (reg167 >= wire158)))) != (reg166[(3'h4):(1'h1)] ?
          reg181 : (wire164 ?
              {$signed(wire165),
                  $signed(reg185)} : $signed((reg185 == reg167)))));
    end
  always
    @(posedge clk) begin
      reg191 <= wire163[(2'h2):(1'h0)];
      reg192 <= $unsigned({($signed((8'ha9)) ?
              ((8'hb1) ?
                  $unsigned(reg191) : $unsigned(wire163)) : $signed((wire161 ?
                  wire179 : reg168)))});
      reg193 <= reg191;
      reg194 <= $signed(reg166[(1'h0):(1'h0)]);
      reg195 <= (wire159[(2'h3):(1'h0)] ?
          $signed((reg188 >> $signed($unsigned(reg182)))) : $unsigned((wire154[(3'h7):(3'h4)] ?
              $signed(reg187) : reg170)));
    end
  always
    @(posedge clk) begin
      reg196 <= (wire154 ^ {(reg193 ?
              ((wire163 == reg182) || (reg181 ? wire159 : reg166)) : reg187)});
      reg197 <= reg193[(4'he):(4'ha)];
      if (wire159)
        begin
          reg198 <= $signed((|(&($signed(reg178) * (|reg175)))));
          reg199 <= reg187[(3'h7):(1'h1)];
          if ($unsigned($unsigned((-((reg175 ?
              reg175 : reg172) || reg172[(2'h3):(2'h3)])))))
            begin
              reg200 <= (((^$signed(reg168[(4'h9):(1'h0)])) | reg171[(4'h8):(3'h7)]) ?
                  (reg173 ?
                      wire159[(3'h7):(3'h6)] : reg194[(2'h2):(2'h2)]) : ($unsigned(reg181) < (7'h40)));
            end
          else
            begin
              reg200 <= {$unsigned(reg200[(4'hb):(3'h4)])};
              reg201 <= wire157;
              reg202 <= (~^{$signed((~^reg168))});
            end
          if (wire162)
            begin
              reg203 <= $unsigned({((^~wire155[(1'h0):(1'h0)]) ?
                      ((~&(8'had)) | reg196[(2'h2):(1'h1)]) : $unsigned((wire159 << wire156))),
                  wire157[(3'h5):(2'h2)]});
              reg204 <= (reg182 ?
                  $unsigned(wire158[(4'h8):(2'h3)]) : $signed($signed(reg177)));
              reg205 <= $unsigned((((reg182[(3'h4):(1'h1)] ?
                          (|(8'ha9)) : (wire161 <<< reg172)) ?
                      $signed((~^wire163)) : (reg188 ?
                          ((8'had) ? reg176 : wire180) : reg202)) ?
                  (~|($unsigned(reg169) >= $signed(reg178))) : (^(~&reg166))));
              reg206 <= reg168;
            end
          else
            begin
              reg203 <= (reg173 ?
                  (!$unsigned(((+reg198) ?
                      (~&(7'h43)) : $signed(reg196)))) : (~$signed($signed(reg205[(5'h10):(3'h7)]))));
              reg204 <= reg191;
              reg205 <= $signed($signed($signed($signed({reg193, reg197}))));
              reg206 <= reg191[(1'h1):(1'h0)];
              reg207 <= wire179[(4'he):(4'ha)];
            end
        end
      else
        begin
          reg198 <= $unsigned($signed(($signed(((8'ha7) ?
              reg193 : reg167)) >> ((7'h42) ?
              $signed(reg199) : reg169[(4'hb):(1'h0)]))));
        end
      if ($signed($unsigned(reg200)))
        begin
          reg208 <= wire160[(5'h10):(3'h5)];
          reg209 <= ((reg193[(4'h8):(3'h6)] - {{{reg194},
                  reg178}}) && (reg207 & ((~&{(8'hbf)}) ?
              ({reg187} <<< (~|reg192)) : $signed(wire163[(2'h3):(1'h0)]))));
          if ((^~(-reg203)))
            begin
              reg210 <= (8'hb5);
            end
          else
            begin
              reg210 <= (reg202[(4'h8):(4'h8)] ?
                  reg184[(3'h7):(3'h7)] : wire162[(2'h3):(1'h1)]);
              reg211 <= $unsigned($signed((reg185 ?
                  $unsigned((~^reg177)) : $unsigned((-reg191)))));
              reg212 <= (^~($unsigned((!{(8'ha8)})) ?
                  {reg207} : (reg182 - $signed((8'hb4)))));
            end
        end
      else
        begin
          reg208 <= $signed(reg193);
          if ($unsigned((wire162[(1'h1):(1'h1)] ?
              ($unsigned({wire160, (8'hbe)}) ^~ ((wire156 ~^ wire157) ?
                  reg212[(4'he):(4'h8)] : (~&reg184))) : $signed(({reg181} ?
                  reg197[(1'h0):(1'h0)] : (wire161 != wire156))))))
            begin
              reg209 <= ($signed(((reg208[(1'h0):(1'h0)] ?
                      wire160 : $signed(wire155)) ?
                  reg182 : $signed((reg170 ? (8'hb9) : reg188)))) & reg173);
            end
          else
            begin
              reg209 <= (($signed(({wire159, reg204} ^ $unsigned(reg193))) ?
                      reg198 : (~&((~|reg195) ?
                          (reg203 ? reg192 : wire159) : {(8'hbd), (8'hb6)}))) ?
                  $signed($signed(($unsigned((7'h42)) <= reg186[(3'h6):(3'h6)]))) : $signed($unsigned($signed((reg176 & wire159)))));
              reg210 <= $unsigned(((8'ha1) < reg187[(4'h8):(3'h4)]));
              reg211 <= (((|$unsigned((|reg201))) ?
                  (reg212[(1'h0):(1'h0)] - wire161[(4'h8):(3'h4)]) : (~|$signed(reg196[(4'hc):(1'h0)]))) != reg201);
              reg212 <= ($unsigned((((8'hbc) ?
                          (~wire159) : reg195[(3'h4):(2'h3)]) ?
                      {wire180[(3'h6):(2'h3)], {reg196}} : $signed({wire180,
                          (8'hb9)}))) ?
                  (7'h40) : $unsigned(reg211[(2'h2):(1'h1)]));
              reg213 <= reg195;
            end
          if (({($signed($signed(reg207)) ?
                  wire164 : reg206)} > (^~($unsigned(reg200) - (wire160[(5'h12):(4'hb)] >= $signed(reg170))))))
            begin
              reg214 <= (~{reg189[(4'ha):(2'h2)]});
              reg215 <= (reg185[(1'h0):(1'h0)] ?
                  $unsigned($unsigned({$unsigned((8'haf))})) : $signed((reg189[(3'h5):(2'h3)] || $unsigned($unsigned((7'h40))))));
              reg216 <= (^($signed((((8'hb7) == reg183) ~^ reg202[(4'h9):(3'h7)])) ^ (^~((reg203 ?
                  (8'hb8) : (7'h44)) >> reg203))));
              reg217 <= reg174[(2'h2):(2'h2)];
              reg218 <= $unsigned((reg194 <<< ($signed(reg185[(1'h0):(1'h0)]) & $signed(reg209[(4'hc):(3'h5)]))));
            end
          else
            begin
              reg214 <= (~&(8'hb0));
              reg215 <= wire156;
            end
          reg219 <= ((reg170[(4'hc):(2'h3)] ?
              $signed(reg195[(1'h0):(1'h0)]) : ($signed(reg172[(1'h1):(1'h0)]) + $signed($signed(reg218)))) ~^ $signed((reg166 ?
              ((+reg210) ^~ (~|(8'h9c))) : $signed((wire180 ?
                  (8'hb1) : (7'h40))))));
        end
    end
  assign wire220 = wire155[(2'h3):(1'h1)];
endmodule

module module130  (y, clk, wire135, wire134, wire133, wire132, wire131);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire135;
  input wire [(5'h14):(1'h0)] wire134;
  input wire [(2'h3):(1'h0)] wire133;
  input wire signed [(4'ha):(1'h0)] wire132;
  input wire signed [(4'hd):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(4'h8):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire136;
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire137,
                 wire136,
                 reg148,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire136 = wire134[(1'h0):(1'h0)];
  assign wire137 = ($unsigned((^$signed($unsigned((7'h41))))) ?
                       ($unsigned((^(wire135 ?
                           wire133 : wire134))) >= ((wire132[(4'h9):(4'h9)] <<< wire134) ?
                           $unsigned({wire136,
                               wire133}) : $signed($signed((8'hbf))))) : $signed(wire136[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg138 <= $signed((~(wire134 ?
          wire137[(3'h7):(2'h3)] : (wire135[(2'h3):(2'h3)] ~^ $unsigned((8'ha1))))));
      reg139 <= (8'ha2);
    end
  assign wire140 = $signed((wire136 > (|wire136[(4'hd):(4'h9)])));
  assign wire141 = ((+((^$signed(reg139)) ?
                       reg139[(4'hb):(3'h7)] : $signed((reg139 ~^ wire134)))) == $unsigned((+({wire134,
                       reg139} | (reg139 ? wire133 : (8'hb8))))));
  assign wire142 = {reg138, wire132[(3'h5):(1'h1)]};
  assign wire143 = (~^reg139);
  assign wire144 = {(($unsigned((~&wire132)) ~^ $signed(((8'had) ?
                               wire132 : wire140))) ?
                           ({(reg139 ? wire140 : wire136)} ?
                               wire131 : ((wire140 || wire140) <= (reg138 & wire141))) : $unsigned(wire135[(3'h5):(1'h1)])),
                       $signed({(!$signed((8'h9c)))})};
  assign wire145 = ({$unsigned(wire143)} ?
                       (|wire137[(4'hd):(2'h2)]) : (&(8'had)));
  assign wire146 = (wire133[(2'h3):(1'h1)] || ((wire137[(2'h2):(1'h0)] ?
                       (^~(wire131 <<< wire133)) : $signed($signed(wire143))) - wire143[(1'h0):(1'h0)]));
  assign wire147 = (+$unsigned(wire131));
  always
    @(posedge clk) begin
      reg148 <= wire132[(4'h9):(4'h8)];
    end
endmodule

module module48
#(parameter param103 = ((^~(^~(~|(~^(7'h40))))) ? ((((~&(8'hb2)) + ((7'h40) ? (8'hb2) : (8'hbd))) == ({(8'hb6), (8'haf)} == ((8'h9e) * (8'hac)))) ? ({(-(8'hb8))} | (((7'h42) ~^ (8'hb1)) ? (~&(8'hbb)) : ((7'h43) ? (8'ha7) : (8'hb5)))) : (^~(((8'hb4) ? (8'h9d) : (8'ha7)) ? ((8'hbe) < (7'h44)) : ((8'hb1) ? (8'ha0) : (8'h9c))))) : (((((7'h42) ? (7'h42) : (8'h9d)) ? ((8'ha2) ? (8'hbd) : (8'hac)) : ((8'ha8) ? (8'ha8) : (8'ha5))) ? (^((8'hb0) ? (8'hab) : (8'hbe))) : ((~(7'h42)) >> (-(8'h9d)))) && (8'ha4))), 
parameter param104 = param103)
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire53;
  input wire [(3'h4):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire66,
                 wire65,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire55,
                 wire54,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg64,
                 reg63,
                 reg57,
                 (1'h0)};
  assign wire54 = $signed(wire50[(3'h4):(2'h2)]);
  assign wire55 = ((!wire50[(1'h0):(1'h0)]) & ($signed((~$signed(wire50))) - (^~wire49)));
  assign wire56 = $signed($signed(((&((8'ha2) == (8'hae))) <= ((~&wire50) ?
                      {wire51} : $signed((7'h42))))));
  always
    @(posedge clk) begin
      reg57 <= $signed(((wire49 ?
          $unsigned($signed(wire56)) : $signed((!wire56))) ~^ $unsigned($unsigned((wire51 ?
          (8'h9d) : (8'hb9))))));
    end
  assign wire58 = (-{(wire56[(3'h7):(1'h0)] || wire52), $signed(wire51)});
  assign wire59 = wire49;
  assign wire60 = (wire55[(2'h3):(1'h1)] ?
                      (+wire51) : $signed(wire58[(3'h7):(3'h6)]));
  assign wire61 = (wire49[(4'hf):(2'h2)] && (wire52[(1'h0):(1'h0)] >> $signed($signed($signed(wire51)))));
  assign wire62 = wire56[(4'h8):(2'h3)];
  always
    @(posedge clk) begin
      reg63 <= wire61;
      reg64 <= (($unsigned(((~(8'ha5)) >>> {wire59})) ?
          (($unsigned(reg57) <<< $unsigned(wire54)) - (wire62 ?
              $unsigned(wire62) : {wire59, wire59})) : {$signed((wire59 ?
                  wire49 : wire56)),
              ({wire56} ? wire49 : $signed((8'h9d)))}) + wire60);
    end
  assign wire65 = $signed((^~wire61[(3'h6):(3'h6)]));
  assign wire66 = $signed($unsigned((&$signed(wire52[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned(wire61[(1'h1):(1'h0)])}))
        begin
          if (reg64)
            begin
              reg67 <= $signed(wire52[(1'h0):(1'h0)]);
              reg68 <= wire56[(4'h8):(3'h7)];
              reg69 <= ($signed(($unsigned((reg63 ^~ wire59)) + (!$unsigned(reg63)))) ?
                  wire65[(3'h5):(2'h2)] : ((8'hb9) ?
                      $signed({{wire60, wire55}}) : (+((!(8'ha2)) ?
                          (-wire65) : $unsigned(wire66)))));
              reg70 <= $signed($signed(reg63[(3'h7):(3'h4)]));
              reg71 <= $unsigned($signed(reg63[(4'hb):(3'h6)]));
            end
          else
            begin
              reg67 <= (({wire55,
                      ((wire55 <<< wire61) ? $signed((8'hbc)) : (&reg70))} ?
                  ($unsigned(wire49) ?
                      reg63 : (~$signed((8'hb7)))) : $unsigned((wire65[(2'h2):(2'h2)] < (!(8'hb6))))) != (8'hbf));
              reg68 <= {reg63,
                  {(((wire50 + wire56) ?
                              $signed(wire59) : ((7'h41) ? wire59 : reg67)) ?
                          ($unsigned(reg68) + wire54[(2'h3):(1'h0)]) : wire66[(1'h1):(1'h1)])}};
              reg69 <= wire60[(1'h1):(1'h1)];
            end
          if (wire65[(4'h8):(3'h4)])
            begin
              reg72 <= wire59[(2'h2):(1'h1)];
              reg73 <= {{(^~($unsigned(reg69) ?
                          $unsigned(wire65) : $signed(wire51))),
                      ($unsigned($unsigned(reg69)) ?
                          (reg70[(5'h11):(5'h11)] ?
                              wire54[(1'h1):(1'h1)] : wire54) : ((^~wire50) ?
                              reg57 : wire65[(1'h1):(1'h0)]))},
                  reg67[(4'h8):(3'h4)]};
              reg74 <= ({$signed(((wire65 << wire51) ?
                          ((7'h41) ? wire62 : wire66) : (~wire55))),
                      wire56[(1'h1):(1'h0)]} ?
                  (7'h40) : wire55[(4'hd):(2'h2)]);
              reg75 <= $unsigned((~|wire52[(1'h0):(1'h0)]));
            end
          else
            begin
              reg72 <= $unsigned(reg70[(3'h6):(3'h6)]);
              reg73 <= {(reg63[(3'h4):(1'h1)] ^~ ((|reg73) ?
                      (&{reg75}) : (8'hbb))),
                  $signed(wire62[(1'h0):(1'h0)])};
              reg74 <= reg64[(1'h1):(1'h0)];
              reg75 <= (+$signed((($signed(wire51) ?
                  (reg69 ? wire54 : (8'ha7)) : {reg57,
                      reg63}) + $signed(((8'hbf) ? wire52 : wire55)))));
            end
          reg76 <= (reg68[(3'h7):(1'h1)] ?
              $unsigned($unsigned(($signed(wire55) << reg57))) : reg68);
          if ({(|(~&$unsigned((reg57 + reg68))))})
            begin
              reg77 <= (reg76[(2'h2):(2'h2)] ?
                  wire59[(4'ha):(1'h1)] : $signed(($unsigned(wire55) ^~ {reg67[(4'hf):(4'hc)],
                      $unsigned(reg70)})));
            end
          else
            begin
              reg77 <= {$unsigned(wire56[(4'hd):(4'hd)])};
              reg78 <= wire53[(4'h8):(4'h8)];
              reg79 <= ((reg74 + (^~reg71[(4'ha):(3'h4)])) && ($unsigned($signed((wire66 <<< wire61))) ?
                  {reg69[(1'h0):(1'h0)],
                      ($unsigned(wire61) >>> (8'hb4))} : reg63));
              reg80 <= $unsigned(reg72);
              reg81 <= (|(((8'hae) ?
                  ((reg73 ?
                      reg70 : reg63) <= (wire50 & (8'hbb))) : reg69[(3'h4):(1'h1)]) > $signed(($signed((8'hbe)) != reg80[(5'h12):(5'h10)]))));
            end
          reg82 <= (^(8'hb7));
        end
      else
        begin
          reg67 <= (($unsigned(reg68[(4'h8):(3'h7)]) >>> $signed({$unsigned(wire61)})) ?
              {(|{((8'h9e) - wire60), {reg67}}),
                  $unsigned(wire49[(2'h3):(2'h3)])} : ((-(-{wire52})) ?
                  wire65[(2'h2):(2'h2)] : ($unsigned(reg77[(4'hb):(4'h9)]) ?
                      ($unsigned(reg71) != reg80[(4'he):(3'h4)]) : {(reg70 > wire54)})));
          reg68 <= (!wire52);
          reg69 <= ($unsigned($unsigned({(wire58 ? reg63 : (8'hb7)),
                  $signed(reg74)})) ?
              $unsigned($unsigned(($signed(reg80) ?
                  {reg72} : $signed((8'hbb))))) : $unsigned({reg75,
                  ({wire55, wire62} ? (~^wire59) : reg82)}));
          reg70 <= reg70[(4'hc):(4'h9)];
          reg71 <= (^~(wire65 ?
              wire52 : ((-(reg68 ? wire65 : reg71)) ? reg67 : (^~reg57))));
        end
      if ($signed((($signed(wire62[(4'he):(1'h1)]) ?
          {{(8'h9d),
                  wire49}} : ((wire49 ^~ reg74) > reg79)) != $signed(($signed(wire60) <= wire54[(1'h1):(1'h1)])))))
        begin
          reg83 <= reg78[(4'hc):(3'h4)];
          reg84 <= $signed($signed(reg76));
          reg85 <= $unsigned(($unsigned(wire51[(3'h7):(3'h7)]) ?
              reg69 : $signed(((8'ha0) * ((8'hab) & reg81)))));
        end
      else
        begin
          if (reg76)
            begin
              reg83 <= ($unsigned(($unsigned({reg78}) ^~ $signed($unsigned(reg69)))) ?
                  (~|((!{(7'h43), (8'h9e)}) < (((8'hbf) + (8'ha1)) ?
                      $signed(reg71) : reg71))) : ((&((reg82 ?
                          wire61 : reg81) && $unsigned(wire60))) ?
                      reg71[(4'hc):(3'h4)] : (((-reg77) ?
                              (reg77 + reg70) : $signed((7'h42))) ?
                          reg70 : ({(8'h9f), reg70} ?
                              reg64[(1'h1):(1'h0)] : $unsigned((7'h42))))));
              reg84 <= $unsigned(reg82);
              reg85 <= ((8'haa) ?
                  (~&{((wire59 ?
                          (8'hb1) : wire51) - {reg71})}) : $unsigned(reg72));
            end
          else
            begin
              reg83 <= ((^{((^wire66) ?
                      (wire54 < (8'ha2)) : $unsigned(wire61))}) ^~ (((~$unsigned(reg78)) ?
                      {{reg64}} : $unsigned({reg78})) ?
                  $unsigned($signed({(8'h9f)})) : $unsigned((^reg83))));
              reg84 <= reg82[(1'h0):(1'h0)];
              reg85 <= reg63[(4'he):(3'h4)];
              reg86 <= $signed($signed($unsigned(reg78[(4'hd):(2'h2)])));
            end
          if (wire60)
            begin
              reg87 <= $signed((wire60[(1'h1):(1'h0)] ~^ reg72));
              reg88 <= (reg68[(4'h8):(3'h5)] ^ (($signed($signed(wire60)) ?
                      {(wire65 == reg87), $unsigned(wire60)} : $unsigned({reg70,
                          reg79})) ?
                  (^~reg87[(1'h0):(1'h0)]) : wire55[(4'h8):(1'h0)]));
              reg89 <= wire56[(1'h0):(1'h0)];
            end
          else
            begin
              reg87 <= wire56;
              reg88 <= (8'hab);
              reg89 <= $unsigned((+$signed(({reg67, reg77} - $signed(reg64)))));
              reg90 <= reg82;
              reg91 <= (((reg87 ?
                  reg90[(1'h1):(1'h0)] : ((~^reg90) ?
                      reg73 : $signed(wire50))) >>> reg79) - $unsigned(($unsigned(reg68) ?
                  $unsigned((reg77 ? (8'hab) : (7'h43))) : ((reg75 ?
                          wire51 : reg82) ?
                      (|reg85) : reg68))));
            end
          if ((((reg91 ? $unsigned($signed(wire50)) : (~&(8'hbd))) ?
              $unsigned(wire53) : wire53) ^ $unsigned(((-wire59[(4'h9):(3'h6)]) ?
              $unsigned(reg70) : wire66))))
            begin
              reg92 <= (~&(8'had));
              reg93 <= wire58;
              reg94 <= $signed($unsigned(reg63));
            end
          else
            begin
              reg92 <= (!reg67[(3'h6):(2'h3)]);
            end
          reg95 <= (^$unsigned((($unsigned(wire59) ?
                  reg75[(2'h2):(1'h1)] : reg91[(1'h0):(1'h0)]) ?
              (reg90 ? reg64[(1'h1):(1'h0)] : {wire51}) : {reg80[(4'hb):(3'h7)],
                  reg70[(4'h9):(3'h7)]})));
          reg96 <= (&{reg75});
        end
      reg97 <= ($signed(reg82[(1'h1):(1'h1)]) != $unsigned($signed(((reg76 >> wire55) ?
          reg77[(4'ha):(3'h7)] : $signed(reg69)))));
      reg98 <= wire55;
    end
  assign wire99 = $signed($unsigned($signed({((8'ha6) + (8'ha4)),
                      (!(8'h9f))})));
  assign wire100 = (reg92[(4'hb):(3'h7)] * ($unsigned((+$unsigned(wire50))) || reg94[(4'hd):(3'h7)]));
  assign wire101 = $unsigned(({wire100[(2'h3):(1'h1)]} | $unsigned($unsigned(reg64))));
  assign wire102 = $unsigned($unsigned(wire58));
endmodule
