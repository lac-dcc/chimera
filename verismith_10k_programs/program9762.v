module top
#(parameter param155 = (~&({((8'ha5) >> ((7'h42) ? (8'h9f) : (8'hbc))), ((~^(7'h42)) ? (^~(8'h9d)) : {(8'hbb)})} || (-(+((8'hab) == (7'h43)))))), 
parameter param156 = {(+(-(^param155)))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire145;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire138;
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire16,
                 wire18,
                 wire19,
                 wire20,
                 wire74,
                 wire138,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg146,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  module5 #() modinst17 (.y(wire16), .wire7(wire1), .clk(clk), .wire8(wire2), .wire6(wire4), .wire9(wire0));
  assign wire18 = $signed((wire2[(4'hc):(3'h5)] ?
                      (((wire0 ?
                          (8'h9d) : wire4) * wire1[(2'h3):(2'h3)]) ^ (+$unsigned(wire1))) : $signed((+$signed(wire2)))));
  assign wire19 = wire18;
  assign wire20 = $unsigned($unsigned($unsigned({wire18[(1'h0):(1'h0)]})));
  module21 #() modinst75 (wire74, clk, wire4, wire1, wire20, wire16);
  module76 #() modinst139 (.wire81(wire16), .y(wire138), .wire80(wire19), .clk(clk), .wire77(wire4), .wire78(wire18), .wire79(wire2));
  always
    @(posedge clk) begin
      reg140 <= wire19;
      reg141 <= (~&(~$unsigned($unsigned((wire19 ? wire74 : (8'hb4))))));
      reg142 <= ((8'hbf) ?
          (!$signed(wire3)) : $signed($unsigned($unsigned((wire18 ?
              reg140 : wire18)))));
      reg143 <= $signed($unsigned($signed(({wire20} ^~ (^wire3)))));
      reg144 <= $signed($unsigned(reg141[(2'h2):(2'h2)]));
    end
  assign wire145 = wire0;
  always
    @(posedge clk) begin
      reg146 <= {(wire2[(4'hc):(1'h1)] ?
              $signed(($unsigned(wire0) ?
                  (+wire138) : $unsigned(wire3))) : (reg140[(2'h3):(2'h3)] - $unsigned(wire138)))};
    end
  assign wire147 = wire20;
  assign wire148 = reg146[(4'h9):(3'h6)];
  assign wire149 = (~|(&$unsigned((reg146 ?
                       (^reg142) : (wire4 ? wire145 : wire138)))));
  assign wire150 = ($unsigned((^wire0[(3'h5):(3'h4)])) ?
                       ($signed((|$unsigned(wire147))) ^~ (~&$unsigned((wire138 >>> wire147)))) : reg143);
  always
    @(posedge clk) begin
      if (wire0[(2'h2):(1'h0)])
        begin
          reg151 <= $unsigned(wire1[(4'h8):(3'h7)]);
          reg152 <= wire150[(4'h8):(3'h5)];
          reg153 <= $unsigned(wire2);
        end
      else
        begin
          reg151 <= (reg141[(1'h0):(1'h0)] ?
              ($signed(($signed(reg141) && $signed(reg143))) >> $signed($signed($signed(wire2)))) : ((-($unsigned((7'h42)) ?
                      $signed(wire1) : $signed(wire149))) ?
                  {wire138[(2'h3):(1'h1)]} : $unsigned(((!(8'hb1)) < (&reg142)))));
        end
      reg154 <= reg142[(3'h7):(3'h5)];
    end
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire81;
  input wire [(5'h10):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire79;
  input wire signed [(4'h9):(1'h0)] wire78;
  input wire [(3'h5):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  assign y = {wire136,
                 wire96,
                 wire95,
                 wire94,
                 reg98,
                 reg97,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((~&($unsigned(wire81) ?
          wire77[(1'h1):(1'h1)] : $signed(wire81)))))
        begin
          reg82 <= ((wire81 & ((^~(~^wire77)) ~^ $unsigned((wire80 >= wire79)))) ?
              {($signed($unsigned(wire78)) + wire79[(3'h5):(2'h3)])} : ({$signed((~^wire77))} | $signed(wire80)));
          reg83 <= ((~&((^wire81) ?
              $unsigned((wire80 ?
                  wire77 : wire78)) : (|$unsigned((8'hb7))))) && $unsigned(((8'hb3) ?
              (!wire79) : (-wire78))));
          reg84 <= $unsigned(wire80[(4'hb):(2'h3)]);
          reg85 <= $signed(reg82);
          reg86 <= (($unsigned($signed((wire77 >>> reg85))) ?
                  (8'had) : wire79[(3'h7):(2'h2)]) ?
              $unsigned($unsigned($signed((~^reg84)))) : (~|({$signed(wire78)} ~^ {reg83})));
        end
      else
        begin
          reg82 <= reg84[(4'h8):(1'h0)];
          reg83 <= $signed($signed((^~$unsigned((~|wire77)))));
        end
      reg87 <= reg84[(4'hc):(3'h7)];
      if ($unsigned($unsigned(((&(wire80 + (8'h9c))) <<< $signed((!wire77))))))
        begin
          if ({wire79[(3'h4):(3'h4)], reg84})
            begin
              reg88 <= (8'hbf);
              reg89 <= $signed(wire79[(3'h6):(2'h2)]);
              reg90 <= (~^$unsigned($unsigned($signed(((7'h41) < reg89)))));
            end
          else
            begin
              reg88 <= wire81;
              reg89 <= ((reg90 ?
                  ((~((8'h9f) ? reg85 : reg90)) ?
                      {(reg82 <<< reg86), reg85} : ($signed((8'ha3)) ?
                          $unsigned((7'h44)) : $signed(reg87))) : wire81[(3'h4):(2'h3)]) > (^~{((reg86 || (8'hbb)) ?
                      (wire81 && wire79) : (8'ha4))}));
            end
          reg91 <= reg86;
          reg92 <= (reg85 < ($unsigned(((+(8'ha8)) ?
                  wire78[(2'h2):(1'h0)] : (wire79 << (8'ha6)))) ?
              $signed(reg91) : ({(reg89 - reg85)} <<< reg89[(4'hc):(4'hb)])));
        end
      else
        begin
          reg88 <= $unsigned(reg82);
        end
      reg93 <= reg85[(1'h1):(1'h0)];
    end
  assign wire94 = $signed($signed(reg87));
  assign wire95 = {(~|(!$signed($unsigned(reg83)))), reg86};
  assign wire96 = (wire79[(3'h7):(2'h3)] ? (8'hb7) : reg83);
  always
    @(posedge clk) begin
      reg97 <= $unsigned($unsigned(wire80[(5'h10):(4'ha)]));
      reg98 <= ((7'h42) & ($signed((8'hb8)) <= (((^~wire95) ?
              $signed(reg93) : wire80) ?
          reg93[(5'h11):(2'h2)] : $signed(reg92[(1'h1):(1'h0)]))));
    end
  module99 #() modinst137 (wire136, clk, wire77, wire96, reg82, reg98);
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire22;
  input wire [(5'h14):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire61;
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
                 wire26,
                 wire61,
                 (1'h0)};
  assign wire26 = wire24;
  module27 #() modinst62 (wire61, clk, wire26, wire25, wire24, wire22, wire23);
  assign wire63 = ((wire26[(4'he):(4'hd)] ^ (wire24[(3'h7):(3'h7)] ?
                          wire22[(2'h2):(1'h0)] : ((-wire23) << (wire26 ?
                              wire61 : wire24)))) ?
                      $unsigned((wire25[(4'h9):(2'h2)] ?
                          $unsigned((wire25 ?
                              wire24 : wire25)) : wire61)) : (wire61[(3'h7):(2'h2)] != wire23[(4'hf):(1'h0)]));
  assign wire64 = ($unsigned((wire24 ~^ $signed((7'h42)))) ? wire25 : (8'hba));
  assign wire65 = ($signed((wire61 & ($unsigned(wire22) ?
                          (wire64 >> wire61) : {wire22, wire25}))) ?
                      (($unsigned((wire22 || wire26)) ?
                              (^~(wire26 ? wire61 : wire26)) : (~&(wire25 ?
                                  wire24 : wire26))) ?
                          (~|$signed((wire25 | (7'h40)))) : wire26[(2'h2):(1'h0)]) : (+$signed($unsigned((~(8'hae))))));
  assign wire66 = ((~&(~$signed((wire26 >>> wire26)))) && $signed(($signed((^wire64)) ?
                      (wire22 >>> (7'h40)) : wire63)));
  assign wire67 = (~&((8'ha0) || (wire66 ?
                      {(wire61 >= wire25)} : $unsigned($signed(wire23)))));
  assign wire68 = ($unsigned((-($unsigned(wire63) != wire61[(4'he):(4'hb)]))) < ((!wire65) ?
                      (~^{$signed(wire26)}) : $unsigned(wire22[(4'h8):(3'h7)])));
  assign wire69 = $signed($unsigned(wire24[(4'hf):(4'hf)]));
  assign wire70 = $unsigned($unsigned((($unsigned(wire23) & wire65) <<< wire65[(3'h6):(2'h2)])));
  assign wire71 = ((&($unsigned(wire26[(3'h7):(1'h1)]) <= $unsigned(wire26))) > (($signed(wire23[(3'h5):(1'h0)]) ?
                          $signed(wire65[(2'h2):(1'h1)]) : $signed(wire69[(3'h4):(2'h3)])) ?
                      ({wire23[(1'h0):(1'h0)]} - $unsigned($signed(wire22))) : $signed((wire64 ?
                          wire66 : (wire22 ^~ wire66)))));
  assign wire72 = $signed(wire63);
  assign wire73 = (wire64[(3'h4):(2'h3)] ? {wire72} : wire71[(3'h6):(2'h3)]);
endmodule

module module5
#(parameter param15 = (8'hb8))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire14, wire13, wire12, reg11, reg10, (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (wire8 == wire8[(4'h8):(3'h7)]);
      reg11 <= (wire7[(4'ha):(2'h3)] ?
          wire7[(3'h7):(2'h2)] : ({wire9[(1'h0):(1'h0)]} <= (wire7 ~^ ((wire7 ?
                  wire6 : wire8) ?
              $unsigned(wire6) : (&wire9)))));
    end
  assign wire12 = (~|(~^(wire8 & ($unsigned(reg11) & (reg11 ?
                      wire6 : wire8)))));
  assign wire13 = ((^wire8[(2'h2):(1'h1)]) ?
                      $signed({{$unsigned(wire7)}}) : ((wire6[(4'h8):(2'h2)] ^~ wire9[(2'h2):(2'h2)]) ^~ $signed((wire7 <= $unsigned(wire8)))));
  assign wire14 = wire12;
endmodule

module module27
#(parameter param59 = {({(~&((8'ha2) <= (8'hb3))), ((^~(8'h9e)) ~^ {(8'hb5), (8'ha9)})} + ((+((8'hb9) < (8'h9f))) + ((~|(7'h44)) == ((8'hbb) & (8'h9d))))), (8'had)}, 
parameter param60 = (((8'hb4) || ({(param59 & (8'hbf)), (param59 ? param59 : param59)} <<< param59)) ? (param59 << ((7'h44) << (((7'h43) ? param59 : param59) - param59))) : param59))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  assign y = {wire58,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = wire30[(5'h11):(4'h8)];
  assign wire34 = $unsigned($signed({wire32[(1'h1):(1'h1)]}));
  assign wire35 = ($unsigned($signed(((-(8'h9c)) ^ ((8'hab) ?
                          wire32 : wire34)))) ?
                      {wire33} : wire29);
  assign wire36 = $unsigned(($signed({wire30, wire32[(1'h0):(1'h0)]}) ?
                      $unsigned(((^~(8'hba)) ?
                          wire34[(1'h0):(1'h0)] : ((8'ha3) <<< wire35))) : wire29[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg37 <= wire35[(4'hc):(3'h4)];
      if (wire36)
        begin
          if (wire28)
            begin
              reg38 <= $unsigned($unsigned(wire31));
              reg39 <= reg38;
            end
          else
            begin
              reg38 <= ({$unsigned($signed((wire35 ? wire33 : wire29))),
                  $signed((reg38 >>> $unsigned(reg39)))} == wire28);
              reg39 <= $unsigned($unsigned(wire36[(3'h4):(2'h3)]));
              reg40 <= $unsigned((wire33[(4'h8):(1'h1)] | (^$signed($unsigned(wire30)))));
              reg41 <= (|{(reg39[(2'h2):(2'h2)] ?
                      (wire34 ?
                          wire28 : {(8'hbf),
                              reg39}) : (!reg39[(2'h3):(1'h1)]))});
              reg42 <= wire36;
            end
          reg43 <= $unsigned(wire31[(4'hc):(4'ha)]);
          if (wire36[(4'h8):(1'h1)])
            begin
              reg44 <= reg42;
              reg45 <= $signed(reg41[(4'hf):(1'h1)]);
              reg46 <= reg42[(1'h0):(1'h0)];
              reg47 <= (^~($unsigned($unsigned((^~wire36))) >>> wire28[(3'h6):(1'h0)]));
              reg48 <= (wire35[(3'h4):(1'h1)] & reg39);
            end
          else
            begin
              reg44 <= {((($signed(wire28) ?
                              $unsigned(wire31) : (wire35 < wire34)) ?
                          reg40 : (-(~|wire34))) ?
                      $signed($signed((8'ha1))) : $signed(($unsigned(reg38) ?
                          (wire34 < (8'hb1)) : {(8'ha9), reg40})))};
              reg45 <= $unsigned(reg38);
              reg46 <= $unsigned($signed(($unsigned($unsigned(reg46)) ^ ($signed((8'hb0)) - wire34[(2'h3):(1'h0)]))));
              reg47 <= reg46[(2'h3):(1'h0)];
              reg48 <= (~{(!reg48), ($signed({reg48, reg44}) >= reg44)});
            end
        end
      else
        begin
          if ($unsigned($signed(reg45[(1'h0):(1'h0)])))
            begin
              reg38 <= $unsigned((&reg43[(1'h0):(1'h0)]));
              reg39 <= ({(($unsigned(wire30) ^ wire29[(3'h7):(3'h7)]) ?
                          (~^$unsigned(wire28)) : reg45[(4'h9):(1'h0)])} ?
                  wire36[(3'h7):(3'h4)] : {(~&($signed(reg40) ^ (reg42 & wire29)))});
              reg40 <= $unsigned($unsigned(wire30[(5'h10):(4'he)]));
            end
          else
            begin
              reg38 <= (($signed($unsigned((!(8'had)))) ^~ $signed($signed((reg40 ?
                      reg41 : wire30)))) ?
                  $unsigned((^$unsigned(reg47[(4'ha):(4'ha)]))) : (~|$signed(((reg44 <<< reg38) << (wire29 != (8'hb7))))));
              reg39 <= wire33[(1'h1):(1'h0)];
              reg40 <= wire35[(4'hc):(1'h0)];
            end
        end
      if ({(wire36 ?
              (+reg42) : ($unsigned((wire29 >>> reg48)) != $signed((wire36 ?
                  reg42 : reg38))))})
        begin
          reg49 <= $signed($unsigned({(~|wire31)}));
          reg50 <= {$signed($unsigned((|reg38[(5'h10):(1'h0)]))),
              ($signed(wire36[(3'h5):(1'h0)]) ?
                  (wire28[(3'h5):(2'h2)] ?
                      wire36 : $unsigned(wire28)) : (reg38[(4'hb):(3'h5)] && $unsigned((wire31 <= reg47))))};
          if (((8'hba) * (|(($unsigned(reg45) ?
              (~|reg41) : reg49) << (-$unsigned(reg48))))))
            begin
              reg51 <= (~^($signed($unsigned((~wire35))) ?
                  $unsigned(wire31[(5'h10):(3'h5)]) : wire30[(2'h2):(1'h1)]));
              reg52 <= (((|(!(wire36 & wire28))) ?
                      (((~^(8'ha2)) ~^ wire31[(2'h3):(2'h2)]) ?
                          wire31 : $unsigned(reg51)) : ($signed((reg40 * reg50)) ~^ reg48[(2'h3):(2'h2)])) ?
                  $signed((-reg37)) : $signed($unsigned((^~$signed((8'ha8))))));
              reg53 <= (wire32[(1'h1):(1'h0)] ^ ((reg39 ?
                  $signed(wire36) : (8'ha1)) ^~ $signed(reg39[(2'h3):(2'h2)])));
              reg54 <= (~&$signed((reg40 | ((reg37 ?
                  (8'hb5) : reg43) << reg49[(4'hf):(2'h3)]))));
            end
          else
            begin
              reg51 <= (wire34 <= {((+reg43[(4'hb):(3'h5)]) ?
                      ($signed(wire35) ?
                          reg53 : {(8'hab)}) : (&$unsigned((8'hbb)))),
                  ((+{reg53}) ? (!reg45) : {(|reg38), reg51})});
              reg52 <= $signed(wire28[(4'h8):(3'h5)]);
              reg53 <= (($signed({$unsigned(reg38)}) * reg40[(3'h7):(1'h1)]) ^ wire31[(4'hb):(4'h9)]);
              reg54 <= wire31;
            end
          if (wire32[(1'h1):(1'h1)])
            begin
              reg55 <= reg42;
            end
          else
            begin
              reg55 <= reg41;
              reg56 <= reg52;
            end
        end
      else
        begin
          reg49 <= reg41;
          if (reg51)
            begin
              reg50 <= reg47;
              reg51 <= reg37;
            end
          else
            begin
              reg50 <= ((~$signed((7'h40))) + (~^(^{$signed(reg43)})));
            end
        end
      reg57 <= reg50[(1'h0):(1'h0)];
    end
  assign wire58 = reg53[(4'h9):(3'h7)];
endmodule

module module99
#(parameter param135 = (8'h9c))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire103;
  input wire signed [(4'ha):(1'h0)] wire102;
  input wire signed [(4'hb):(1'h0)] wire101;
  input wire signed [(4'he):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg134,
                 reg133,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg112,
                 (1'h0)};
  assign wire104 = ($signed(($signed(((8'ha3) ?
                       wire103 : wire103)) << {(wire103 ?
                           (8'hb1) : wire102)})) << (^{((^wire100) == wire102[(1'h0):(1'h0)])}));
  assign wire105 = (+$signed($unsigned(wire104)));
  assign wire106 = (~|$signed((((wire100 ? wire100 : (8'h9c)) == (~wire101)) ?
                       (&$unsigned(wire104)) : (wire105[(2'h2):(1'h1)] ^ (8'ha7)))));
  assign wire107 = (wire106[(2'h3):(2'h2)] < ($signed(((wire103 * wire106) ~^ (~|wire102))) ?
                       $signed(wire105) : $signed(($unsigned(wire103) ?
                           (wire103 >> wire104) : wire102))));
  assign wire108 = (({$unsigned(wire102)} >= ({((8'hb1) ? wire101 : wire102),
                           $signed((8'hbc))} != wire100)) ?
                       wire103[(2'h3):(2'h3)] : $unsigned((((~&wire101) ?
                               $signed(wire100) : (wire103 ?
                                   wire102 : wire102)) ?
                           wire101[(3'h4):(1'h1)] : wire104)));
  assign wire109 = ($signed($unsigned($signed((wire104 == wire102)))) ?
                       ((wire107 ?
                           (8'hbe) : $unsigned($signed(wire106))) <= {(wire101[(3'h7):(1'h0)] ?
                               (^wire106) : $signed(wire103))}) : (wire100 ^~ {$unsigned($signed((8'haf))),
                           ($signed(wire101) ?
                               $unsigned((8'hb8)) : (wire105 ?
                                   wire104 : (8'ha5)))}));
  assign wire110 = ($unsigned(wire106[(3'h5):(2'h3)]) || (({(wire104 ?
                               wire108 : wire102)} ?
                       {wire103[(2'h3):(2'h2)],
                           {wire109}} : {$unsigned(wire100),
                           (wire100 < wire109)}) << (wire107 | wire104)));
  assign wire111 = wire110;
  always
    @(posedge clk) begin
      reg112 <= {(+(((+wire100) ? ((8'hba) >>> wire106) : (8'hb2)) ?
              (wire105[(1'h0):(1'h0)] ?
                  (~^wire102) : {wire106}) : (~&$unsigned(wire108)))),
          ($unsigned($signed(wire106)) && ($signed(wire111[(2'h2):(1'h1)]) ?
              (wire105[(1'h0):(1'h0)] ?
                  (~&(7'h43)) : {wire104,
                      wire104}) : ($signed(wire108) <<< $signed(wire108))))};
    end
  assign wire113 = {$unsigned((+((wire111 && wire107) <<< wire101[(3'h6):(2'h3)])))};
  assign wire114 = {wire100};
  assign wire115 = $unsigned($unsigned($signed(wire107)));
  assign wire116 = $unsigned($unsigned((8'h9d)));
  assign wire117 = (wire111 ?
                       wire111[(2'h2):(1'h0)] : (wire103[(3'h5):(2'h3)] < (+(^(wire116 ?
                           wire110 : wire116)))));
  assign wire118 = ((wire103 ~^ reg112[(2'h3):(1'h0)]) + ({{$signed((8'ha3)),
                           {wire105, wire104}},
                       $unsigned(((8'haa) ~^ wire100))} == (|wire100[(1'h0):(1'h0)])));
  assign wire119 = ({$unsigned(((~^wire105) <<< wire111)),
                           $signed($signed((|(8'hb7))))} ?
                       (~(^(wire100 ^ wire115[(3'h6):(1'h0)]))) : $unsigned(wire115));
  always
    @(posedge clk) begin
      reg120 <= wire106[(4'hb):(1'h1)];
      if ($signed(((wire118[(2'h3):(1'h0)] + wire110) ?
          (~^$signed($unsigned(wire104))) : (wire106[(5'h14):(5'h12)] ?
              ((8'hbb) >= (wire105 + (8'ha0))) : (wire107[(1'h1):(1'h1)] || {(8'ha5)})))))
        begin
          if ($unsigned($unsigned(wire118[(2'h2):(2'h2)])))
            begin
              reg121 <= wire102[(3'h5):(2'h3)];
              reg122 <= (^~{(wire115 >= {$signed(wire111), (~&wire101)})});
              reg123 <= $signed(wire102);
              reg124 <= (($signed((~&wire110[(1'h1):(1'h0)])) * {{{wire107}},
                  ($signed((8'ha7)) ?
                      (8'hae) : wire107[(3'h6):(2'h3)])}) | wire116[(1'h0):(1'h0)]);
              reg125 <= $signed($unsigned($signed($unsigned((-wire111)))));
            end
          else
            begin
              reg121 <= reg122[(1'h0):(1'h0)];
              reg122 <= (8'ha5);
            end
          reg126 <= wire102[(1'h1):(1'h0)];
        end
      else
        begin
          reg121 <= $unsigned((~|$unsigned(($unsigned(wire106) ?
              wire101[(3'h7):(1'h1)] : wire109))));
        end
      reg127 <= wire117[(1'h0):(1'h0)];
      reg128 <= wire107[(3'h4):(3'h4)];
      reg129 <= $unsigned((8'ha1));
    end
  assign wire130 = $unsigned((-(wire102 >> (((8'hbb) ? wire109 : (8'hb8)) ?
                       wire105 : (~wire118)))));
  assign wire131 = (8'ha7);
  assign wire132 = $signed($unsigned($unsigned((~^(~|reg122)))));
  always
    @(posedge clk) begin
      reg133 <= ((~^(&wire117)) ?
          ($signed((8'hb9)) ?
              wire130[(4'ha):(3'h7)] : $unsigned($unsigned(reg121))) : wire103);
      reg134 <= {wire111};
    end
endmodule
