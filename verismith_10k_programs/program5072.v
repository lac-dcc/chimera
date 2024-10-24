module top
#(parameter param128 = {({((^~(8'ha3)) ^~ (7'h42))} != (!((^(8'ha8)) * (|(8'hb2)))))}, 
parameter param129 = (-(~|param128)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h24b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire107;
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  assign y = {wire127,
                 wire113,
                 wire112,
                 wire109,
                 wire4,
                 wire5,
                 wire17,
                 wire18,
                 wire19,
                 wire34,
                 wire35,
                 wire36,
                 wire107,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg111,
                 reg110,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
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
                 (1'h0)};
  assign wire4 = $signed((($unsigned((wire1 ?
                     wire1 : wire1)) | $unsigned({wire1,
                     wire0})) ^ (!$unsigned($signed(wire0)))));
  assign wire5 = $unsigned(wire1);
  always
    @(posedge clk) begin
      if ((&$unsigned((8'ha4))))
        begin
          reg6 <= wire4[(1'h1):(1'h0)];
          reg7 <= $signed($signed((~&$unsigned((wire0 || wire5)))));
          reg8 <= (wire1 ?
              $unsigned({($signed(wire4) ? (^~wire3) : ((8'hbc) ^~ wire5)),
                  $unsigned(reg6)}) : {$signed((~^reg6[(2'h3):(2'h2)])),
                  wire3});
          reg9 <= ($unsigned(wire5[(3'h5):(3'h5)]) ?
              $unsigned($unsigned($unsigned(reg8))) : {reg8,
                  ((wire5[(3'h7):(3'h5)] >>> wire4) | ((wire2 ?
                      wire1 : (8'haa)) - (&(8'had))))});
          reg10 <= (wire1[(3'h6):(1'h1)] >>> $signed(({(wire3 ? reg8 : wire0)} ?
              ((wire3 ? (8'haf) : reg9) ?
                  (&reg6) : $signed((8'ha8))) : reg6[(3'h5):(2'h2)])));
        end
      else
        begin
          reg6 <= (reg6[(3'h5):(2'h3)] <<< $unsigned($unsigned($unsigned($signed(wire2)))));
        end
      if ($unsigned((($signed((wire3 ?
          wire5 : wire0)) > (+$signed(reg6))) || (|((-wire3) ?
          (|(8'had)) : $signed((8'h9d)))))))
        begin
          reg11 <= (^~$signed(wire2));
          reg12 <= $unsigned($signed(((|(reg7 ? reg11 : reg10)) ?
              (~|$unsigned(wire5)) : reg9[(1'h1):(1'h0)])));
          reg13 <= ((^$unsigned((~&$signed(reg11)))) ?
              ($unsigned(wire5) ?
                  wire5 : ({((7'h43) ? (8'hb6) : wire2),
                          ((8'h9e) ? reg11 : wire1)} ?
                      {reg10[(2'h3):(1'h1)]} : $unsigned((reg6 ?
                          reg11 : wire5)))) : $signed($signed(reg6[(2'h3):(2'h3)])));
          reg14 <= reg11[(2'h3):(2'h2)];
          reg15 <= reg13;
        end
      else
        begin
          if ($signed(reg10))
            begin
              reg11 <= (((reg14[(3'h6):(1'h0)] ?
                      ($signed(reg12) ?
                          (~|reg9) : (reg8 ?
                              reg15 : reg12)) : {(wire2 && reg6)}) | ({(-wire3),
                      wire0} * wire0)) ?
                  wire5[(3'h5):(1'h1)] : reg12[(3'h4):(1'h1)]);
            end
          else
            begin
              reg11 <= {$signed(reg11),
                  (((wire3[(5'h11):(3'h7)] - (|reg7)) >> reg14) ?
                      ($signed((reg10 ? reg12 : (8'hb0))) ?
                          ($unsigned(reg7) ?
                              wire5[(1'h0):(1'h0)] : $signed(wire1)) : $signed((wire5 ?
                              wire0 : wire0))) : $unsigned($unsigned((reg15 ^ reg12))))};
            end
          if ((~(({(~reg15)} ? (|wire4) : (8'ha1)) ?
              (reg13[(4'hf):(4'hf)] ?
                  (reg11[(2'h2):(1'h1)] || $unsigned(reg12)) : reg13) : ($unsigned({(7'h40),
                      reg15}) ?
                  ((8'hbc) >> $signed(wire0)) : reg6[(1'h0):(1'h0)]))))
            begin
              reg12 <= reg13;
              reg13 <= {(reg12 ?
                      {wire3[(4'ha):(3'h5)]} : (|wire4[(2'h2):(2'h2)])),
                  ($unsigned($unsigned($signed(reg10))) ?
                      $unsigned(wire5[(2'h2):(1'h1)]) : $unsigned(reg14))};
              reg14 <= $signed(reg10);
              reg15 <= $signed($signed((~|($unsigned(reg13) && $signed((8'ha3))))));
              reg16 <= $signed((|reg13[(3'h6):(3'h5)]));
            end
          else
            begin
              reg12 <= reg11[(2'h2):(1'h1)];
              reg13 <= reg16[(4'he):(4'hb)];
            end
        end
    end
  assign wire17 = {($signed($signed((reg7 ^~ reg7))) ?
                          {(^~(~^reg16)),
                              (reg14 == (wire5 + reg6))} : wire4[(1'h1):(1'h0)]),
                      ((~&(-$unsigned((7'h43)))) || (reg12[(3'h4):(2'h3)] != reg8[(4'hc):(1'h1)]))};
  assign wire18 = wire17;
  assign wire19 = (((+($signed(reg11) ?
                      (-wire0) : $signed(wire17))) & {(~|(~reg15))}) | (&(((reg10 & reg11) ?
                      (!(8'hab)) : $signed(reg12)) | wire4)));
  always
    @(posedge clk) begin
      reg20 <= (($signed($unsigned((8'hb9))) ?
              $signed($unsigned($signed(reg11))) : wire5[(3'h4):(2'h3)]) ?
          wire0[(1'h0):(1'h0)] : (-((!(reg6 ?
              wire2 : reg6)) * (reg15 > (+(8'ha7))))));
      reg21 <= (!(~|$unsigned($unsigned((wire19 >> wire0)))));
      reg22 <= reg6[(2'h2):(1'h1)];
      if ($signed(((8'ha8) != $unsigned($signed((wire17 ^ reg6))))))
        begin
          reg23 <= (-$signed((~(~|(~&reg15)))));
          reg24 <= wire2;
        end
      else
        begin
          if (reg21)
            begin
              reg23 <= {($unsigned(((reg16 ?
                          (8'haa) : (8'hb2)) >>> wire18[(5'h13):(4'ha)])) ?
                      (wire0[(3'h6):(3'h4)] ~^ reg16[(4'hc):(1'h1)]) : reg23)};
              reg24 <= reg7[(3'h6):(1'h0)];
            end
          else
            begin
              reg23 <= $signed((^~$unsigned($unsigned((8'h9e)))));
              reg24 <= (+(wire18[(3'h4):(3'h4)] >= ($unsigned(reg15[(4'h9):(4'h8)]) ?
                  $unsigned((-reg7)) : wire0[(3'h4):(2'h3)])));
              reg25 <= ($signed($unsigned(reg15[(4'hc):(3'h6)])) ?
                  ($signed(wire3) + {($signed(wire18) >>> (reg16 ?
                          (8'hae) : wire1))}) : (^~reg16));
              reg26 <= (({((^reg13) - (reg11 ? wire2 : wire5)),
                      $unsigned((&reg21))} >> (|((reg25 ?
                      wire19 : reg9) ^~ $unsigned(wire0)))) ?
                  (^~(wire4 ?
                      (&(reg24 ?
                          wire18 : reg25)) : $unsigned(reg13))) : (reg8[(4'ha):(1'h0)] >= (((wire5 ?
                          reg22 : wire2) ^ $unsigned(wire1)) ?
                      ((~reg9) ? (~^reg21) : wire19[(1'h1):(1'h0)]) : (reg16 ?
                          (reg22 ? reg9 : reg9) : {reg21}))));
              reg27 <= reg23;
            end
          if ((wire5[(3'h6):(3'h6)] ?
              $signed(wire19[(3'h4):(1'h0)]) : reg7[(3'h7):(3'h6)]))
            begin
              reg28 <= (&$unsigned((wire0[(4'hc):(2'h2)] <<< wire4[(1'h0):(1'h0)])));
            end
          else
            begin
              reg28 <= (^($signed({(~&(7'h41)),
                  reg23[(2'h3):(2'h3)]}) >>> (|(reg16 <<< $signed((8'haf))))));
              reg29 <= $signed((((((8'hbb) ? wire18 : wire3) ?
                          reg22[(1'h0):(1'h0)] : (reg21 ? reg8 : wire18)) ?
                      (8'ha6) : ($unsigned(wire17) <<< $signed(wire4))) ?
                  wire1 : reg7));
              reg30 <= reg12[(4'ha):(3'h7)];
              reg31 <= $signed($unsigned((reg23 ?
                  $signed($signed((8'hb0))) : reg12[(3'h4):(1'h1)])));
            end
          reg32 <= $signed({{(!(8'hbd))},
              ($unsigned(reg24[(3'h5):(2'h2)]) >= (8'ha4))});
          reg33 <= $unsigned($signed(reg12));
        end
    end
  assign wire34 = (!((^(^~((8'hbe) ? reg24 : reg12))) ~^ reg29));
  assign wire35 = reg9;
  assign wire36 = ($signed(reg33[(1'h0):(1'h0)]) ? reg20 : reg28);
  module37 #() modinst108 (.wire38(reg24), .clk(clk), .wire41(wire5), .y(wire107), .wire40(reg29), .wire39(reg30));
  assign wire109 = reg21;
  always
    @(posedge clk) begin
      reg110 <= $unsigned((reg12 ^ $unsigned(reg26)));
      reg111 <= (^~(~&(($signed(reg7) & $signed((7'h44))) ?
          {wire18[(4'hb):(3'h7)]} : reg11[(2'h2):(1'h0)])));
    end
  assign wire112 = (reg14 <<< $unsigned($unsigned($signed((reg26 ?
                       reg31 : wire4)))));
  assign wire113 = ($unsigned($unsigned(reg32)) ?
                       {((reg22 ? $signed(reg8) : $unsigned(reg110)) && wire18),
                           wire19[(1'h1):(1'h1)]} : wire1);
  always
    @(posedge clk) begin
      if ($unsigned(reg25[(3'h5):(1'h1)]))
        begin
          if ({reg12})
            begin
              reg114 <= reg26;
              reg115 <= wire35;
            end
          else
            begin
              reg114 <= (|({($unsigned((8'hbf)) <= (wire2 ^ reg12))} ?
                  (~&(reg21[(3'h6):(3'h6)] ?
                      wire36[(1'h1):(1'h0)] : {reg11})) : reg12[(5'h12):(5'h10)]));
              reg115 <= $signed(wire35[(3'h4):(2'h2)]);
            end
          reg116 <= (wire109[(4'hc):(4'hb)] ? (!(8'haa)) : {$unsigned(wire5)});
          reg117 <= (wire34[(2'h3):(1'h0)] ?
              reg8 : $unsigned($signed({(reg115 ? wire19 : reg10), {reg111}})));
        end
      else
        begin
          reg114 <= wire4[(2'h2):(1'h0)];
          reg115 <= (((wire3[(5'h11):(4'h8)] <= $signed(reg24[(1'h0):(1'h0)])) > $signed($signed((wire109 ?
              (7'h40) : wire18)))) >>> {(reg110 ?
                  (~wire18[(4'hc):(4'hc)]) : reg22)});
          reg116 <= $signed(((+reg7[(1'h1):(1'h0)]) * wire0));
          reg117 <= $signed((wire36 ?
              $signed($unsigned($unsigned(wire113))) : $signed(($signed(reg8) & (reg24 ?
                  wire1 : (8'h9d))))));
        end
      reg118 <= (reg115[(4'h8):(2'h2)] ? reg13[(3'h5):(3'h4)] : reg30);
      if ($unsigned(((~|{reg9[(1'h1):(1'h0)]}) ~^ ($unsigned(reg15) ?
          $signed({reg13, reg23}) : {reg114}))))
        begin
          if ((7'h42))
            begin
              reg119 <= reg8;
              reg120 <= $signed({$signed((reg114[(4'hc):(2'h2)] > (reg30 ?
                      wire107 : reg10)))});
              reg121 <= wire36;
              reg122 <= (~&(^~(((reg11 ^ (8'haa)) != $unsigned(reg29)) ~^ (reg118[(4'h9):(2'h2)] >>> $signed(wire34)))));
            end
          else
            begin
              reg119 <= $unsigned($unsigned(($unsigned((~|wire18)) ?
                  $signed((wire35 >>> wire4)) : (reg8 <<< $signed(reg118)))));
              reg120 <= {reg122[(1'h1):(1'h1)], $unsigned($signed(reg25))};
              reg121 <= reg26[(1'h1):(1'h1)];
              reg122 <= wire2;
            end
          if (reg7)
            begin
              reg123 <= $unsigned($unsigned({$unsigned((reg14 ?
                      wire17 : reg117)),
                  $signed($unsigned(reg10))}));
              reg124 <= (($unsigned({reg9}) == wire109) ?
                  $unsigned((((8'ha6) || $unsigned(reg31)) ?
                      $signed($unsigned(reg24)) : {(~|wire34),
                          ((8'hb2) ?
                              reg6 : wire1)})) : (~&reg25[(3'h4):(1'h1)]));
              reg125 <= ((reg121 && $unsigned($signed(reg12[(3'h5):(1'h0)]))) != $signed((($unsigned((8'hbf)) ?
                  (!reg25) : reg122) >>> $signed($unsigned(reg9)))));
              reg126 <= wire112[(1'h1):(1'h1)];
            end
          else
            begin
              reg123 <= $signed((^((reg33[(4'h9):(3'h4)] < $unsigned(reg12)) ?
                  {((8'h9c) ? reg122 : reg11), $unsigned(wire1)} : reg9)));
              reg124 <= reg28[(4'he):(2'h3)];
              reg125 <= reg33;
            end
        end
      else
        begin
          reg119 <= {(reg21[(3'h6):(3'h6)] ?
                  $unsigned($unsigned($signed(reg31))) : {(!reg118[(2'h2):(1'h1)])}),
              ((reg22[(4'ha):(4'h9)] ?
                  wire3[(1'h1):(1'h0)] : {$unsigned(reg114)}) >= {$unsigned($unsigned(reg111))})};
          reg120 <= (reg30[(2'h3):(1'h0)] != (({(reg110 > reg22),
                      $signed((8'hac))} ?
                  $unsigned($signed(reg23)) : (!(~|reg7))) ?
              (reg116 + wire0) : (~|reg33[(3'h7):(3'h6)])));
          if ((((((&reg26) ? (8'hb5) : (&(8'hab))) ?
                  wire2 : $unsigned((reg31 ? wire0 : wire19))) ?
              ($signed($unsigned(reg120)) >= $unsigned(reg9)) : $unsigned({(reg26 && reg29)})) ^~ ((reg31[(1'h1):(1'h1)] & reg32) ?
              (^~$signed($signed(reg23))) : (|(~^(~^reg21))))))
            begin
              reg121 <= reg8[(4'h9):(3'h4)];
              reg122 <= reg15;
              reg123 <= $unsigned($signed(reg22[(3'h6):(1'h0)]));
              reg124 <= wire4[(1'h1):(1'h1)];
              reg125 <= {(&wire19),
                  {(-reg14[(4'h9):(3'h5)]),
                      $unsigned({(reg32 ? reg117 : reg15)})}};
            end
          else
            begin
              reg121 <= (~^$unsigned({reg110[(3'h5):(1'h0)]}));
              reg122 <= reg14;
              reg123 <= (-reg126[(2'h3):(2'h3)]);
              reg124 <= (~^(~^(wire17 ?
                  $unsigned((wire5 ? wire0 : (8'hb4))) : reg118)));
            end
        end
    end
  assign wire127 = ($unsigned($unsigned((~(&wire35)))) ?
                       $signed(($signed(((8'h9e) ?
                           reg111 : reg31)) | reg120)) : {reg122, wire19});
endmodule

module module37
#(parameter param105 = (((~(~((8'hab) * (8'had)))) ? {{((8'hb9) ? (8'ha6) : (8'hab))}} : ({((8'hbf) ? (8'ha6) : (8'hac))} ? ((^~(8'h9c)) <= {(8'hb1)}) : ((7'h43) >> (!(8'h9f))))) ? ((((&(8'hb2)) || ((7'h40) ? (8'hae) : (8'had))) > (&{(7'h44)})) >= (((^~(8'hae)) ? ((8'ha1) ? (8'h9c) : (8'ha9)) : {(8'ha9), (8'hb4)}) ? ((&(7'h43)) ? {(8'haf)} : ((8'hbb) != (8'h9f))) : (((8'hab) ? (8'hb3) : (8'hb2)) ? (~(8'ha6)) : {(8'hae), (7'h41)}))) : (((+(8'hae)) ? (((8'hb2) ? (8'hac) : (8'ha6)) < ((8'hba) ? (8'ha8) : (8'hb0))) : (((8'hb8) ? (8'hb5) : (8'hb4)) ? ((8'hb0) ? (7'h40) : (8'h9f)) : ((8'hb1) <= (7'h43)))) & {(|(+(8'hbf)))})), 
parameter param106 = ((8'ha1) ? ((((param105 ? param105 : param105) ? (~param105) : (param105 ? param105 : param105)) ? ((!param105) ? (param105 ? param105 : param105) : param105) : {(param105 || param105)}) ? (~^(-param105)) : param105) : (!(~param105))))
(y, clk, wire38, wire39, wire40, wire41);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire40;
  input wire [(5'h12):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire91;
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  assign y = {wire93,
                 wire68,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire91,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  module42 #() modinst69 (wire68, clk, wire38, wire39, wire40, wire41);
  assign wire70 = $signed({(|$signed($unsigned(wire41))), (8'hac)});
  assign wire71 = $signed($signed(($signed(wire40[(3'h4):(2'h2)]) ?
                      ({wire40,
                          wire39} + $unsigned(wire40)) : $signed((wire41 > wire40)))));
  assign wire72 = (wire39 ^~ (wire39 < wire39));
  assign wire73 = {(|wire68)};
  always
    @(posedge clk) begin
      if (wire68[(2'h2):(1'h1)])
        begin
          reg74 <= {$signed(((^{wire40, (8'hb3)}) ?
                  $signed($signed(wire72)) : $unsigned($unsigned(wire71)))),
              wire73};
          reg75 <= $signed($unsigned(wire73));
          reg76 <= {{wire39}};
          reg77 <= wire40;
          if ((wire70[(4'h8):(4'h8)] ?
              (+($signed(wire71) + wire71[(4'ha):(3'h5)])) : reg75))
            begin
              reg78 <= $signed((wire38 ^ reg75));
              reg79 <= {wire68,
                  ($unsigned(((reg78 > wire72) ?
                      $unsigned(wire68) : (reg77 ?
                          wire73 : (8'ha9)))) ^ $signed({$signed(reg78)}))};
            end
          else
            begin
              reg78 <= {reg77[(1'h1):(1'h0)]};
            end
        end
      else
        begin
          reg74 <= (!reg74[(3'h4):(3'h4)]);
          reg75 <= (($signed((wire70[(2'h2):(1'h1)] | ((8'ha5) && reg76))) * ({{(8'hb0)},
                  (reg78 ^~ reg78)} - $signed($unsigned(reg79)))) ?
              ((reg79[(1'h1):(1'h1)] - reg77[(2'h2):(2'h2)]) | ((^~wire71[(3'h6):(3'h4)]) ?
                  reg76 : ((wire38 ? wire68 : wire39) ?
                      reg74[(3'h5):(2'h3)] : (&wire72)))) : ((reg76[(3'h4):(2'h3)] && $signed($signed(reg78))) & (($signed((8'hb1)) ?
                      $unsigned(wire68) : (wire41 ? reg75 : wire40)) ?
                  (-((7'h43) <= wire41)) : $signed($unsigned(wire39)))));
          reg76 <= (($unsigned(((wire39 ? wire38 : (8'hb8)) ?
                  $unsigned(reg77) : (wire71 ? (8'hae) : reg76))) ?
              (($signed(reg74) ?
                  {reg76} : reg75[(4'h9):(3'h7)]) & $unsigned({wire70,
                  wire68})) : $signed(wire71)) | ((reg78 ?
                  {(reg79 < (8'hb7))} : wire38) ?
              $unsigned(wire40) : (reg75[(1'h0):(1'h0)] ?
                  wire68 : ($signed(reg79) ?
                      $signed(reg74) : (reg79 >>> wire72)))));
          reg77 <= (&wire41[(3'h4):(3'h4)]);
          reg78 <= reg79;
        end
    end
  module80 #() modinst92 (.wire81(wire72), .wire83(reg76), .y(wire91), .wire82(wire38), .wire84(wire71), .clk(clk));
  assign wire93 = (reg79 < (&{$unsigned($unsigned(wire40)), wire73}));
  always
    @(posedge clk) begin
      reg94 <= (8'hb5);
      reg95 <= ((&(((wire91 ?
              (8'ha1) : wire41) || wire40[(1'h0):(1'h0)]) <<< ((reg75 - wire93) == (~&(8'hb9))))) ?
          reg78[(2'h2):(1'h1)] : $unsigned(($signed($unsigned((8'hbc))) ?
              (^~(reg75 >>> (8'hb7))) : (((8'h9e) ?
                  (8'hb3) : reg94) != $signed(wire38)))));
      if (($unsigned(reg77) ~^ {($signed(reg78) ^~ {(^~reg75)}), wire73}))
        begin
          if ((7'h44))
            begin
              reg96 <= {$unsigned((((reg94 ? wire68 : wire68) ?
                      (8'hb4) : $signed((8'hb1))) & wire39)),
                  (~&({$unsigned(reg94)} ?
                      $signed((reg74 | wire41)) : (~{reg94, reg95})))};
              reg97 <= (~&$unsigned((wire41 ? (~&(wire73 | wire70)) : wire71)));
              reg98 <= $signed((~&$signed(reg76[(1'h0):(1'h0)])));
              reg99 <= (&(7'h40));
              reg100 <= $signed(wire70);
            end
          else
            begin
              reg96 <= ({$unsigned(reg98)} ?
                  {wire72} : $signed(reg75[(3'h5):(1'h0)]));
              reg97 <= $unsigned($unsigned($unsigned(reg74[(4'hb):(3'h7)])));
            end
          reg101 <= (8'hbd);
          reg102 <= {$unsigned(reg78)};
          reg103 <= ({(((-wire41) ?
                      reg99 : (reg97 * wire71)) << $signed($unsigned(reg96)))} ?
              (((-$signed((8'haa))) ?
                      $signed($unsigned((8'hb9))) : (~(reg98 ?
                          reg99 : (8'hac)))) ?
                  reg99[(1'h0):(1'h0)] : ((reg98 & (reg100 ?
                      wire73 : wire72)) - ((wire71 < wire41) + (^reg98)))) : $unsigned($signed(((wire39 == wire71) ?
                  $unsigned(wire71) : (reg96 ? reg100 : (8'hbe))))));
          reg104 <= wire70;
        end
      else
        begin
          reg96 <= {wire41[(4'hb):(4'h8)]};
          reg97 <= wire71;
          if (wire93)
            begin
              reg98 <= (($unsigned(reg100) < reg103[(1'h1):(1'h1)]) << wire72);
              reg99 <= $signed((|$signed(wire38)));
              reg100 <= {(!(!reg94))};
              reg101 <= ($signed(((8'h9d) ? $signed((~|reg104)) : reg102)) ?
                  $signed({reg75[(3'h4):(2'h3)],
                      $signed(((7'h42) ?
                          reg79 : (8'h9d)))}) : $signed(((8'hbb) ?
                      wire91[(2'h2):(1'h1)] : ($unsigned(wire73) >= (wire91 && wire72)))));
            end
          else
            begin
              reg98 <= (!(($unsigned(wire73) ?
                  {(reg104 ? (8'haf) : reg99),
                      $unsigned((8'ha8))} : (!$signed(reg79))) == (~&$signed($unsigned(reg97)))));
              reg99 <= ($signed(wire41[(3'h7):(1'h0)]) ?
                  wire40[(1'h1):(1'h1)] : $unsigned(reg77));
              reg100 <= $unsigned($unsigned(reg99[(1'h0):(1'h0)]));
              reg101 <= ((wire91 - wire41[(1'h0):(1'h0)]) ?
                  (((~$signed(reg103)) ? (~^(~|reg79)) : (8'hbc)) ?
                      ($signed($unsigned((8'hb9))) ?
                          $unsigned((|reg76)) : (((7'h44) ?
                              wire91 : reg76) - (~^reg102))) : reg97) : (^((wire93 + ((8'h9d) ?
                      wire38 : reg99)) ^~ $signed($signed(reg94)))));
            end
        end
    end
endmodule

module module80
#(parameter param90 = (((((~^(8'haa)) & (~|(8'ha2))) ? (+(8'had)) : ((&(8'hb1)) <= (8'hb1))) ~^ (+(+((7'h40) ? (7'h40) : (8'hbe))))) ? (({((8'ha3) + (8'ha7))} ? (~|(~&(7'h43))) : (((7'h43) >>> (8'ha8)) > ((8'ha5) || (8'hb6)))) << ((((8'ha8) ? (8'h9f) : (8'ha5)) ? {(8'haf)} : (^~(7'h44))) ? {((8'h9f) ? (8'hb1) : (8'hb1))} : {((8'hac) >> (8'haa)), (~(8'hb2))})) : (+(~|({(8'hb7)} ? ((8'hbd) > (8'ha5)) : ((7'h40) ~^ (8'ha5)))))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(3'h7):(1'h0)] wire83;
  input wire [(5'h11):(1'h0)] wire82;
  input wire [(4'hd):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  assign y = {wire89, wire88, wire87, wire86, wire85, (1'h0)};
  assign wire85 = ({(wire82 != $signed({(8'hb7), wire82})),
                      wire83[(2'h3):(2'h3)]} ^ ($signed(wire84) < (8'hb2)));
  assign wire86 = (wire82 ?
                      (~|(wire81[(4'hc):(4'hb)] ?
                          $signed($unsigned(wire83)) : $unsigned(((7'h42) >= (8'hb4))))) : wire85);
  assign wire87 = {wire81};
  assign wire88 = ((8'hb4) << ($signed($signed((~wire87))) ?
                      wire87 : (($unsigned(wire84) <= $signed(wire85)) ?
                          $unsigned(wire84[(3'h5):(3'h5)]) : (!{wire81}))));
  assign wire89 = $signed($signed($signed(wire87)));
endmodule

module module42
#(parameter param66 = (8'ha6), 
parameter param67 = param66)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  input wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire47 = (|wire43[(1'h0):(1'h0)]);
  assign wire48 = $signed(wire44);
  assign wire49 = wire46;
  assign wire50 = (-$unsigned((wire47[(4'hf):(4'hb)] ?
                      (wire46 + $signed((8'hac))) : wire43)));
  assign wire51 = (wire49 >> wire47[(4'hc):(4'hb)]);
  assign wire52 = (^$signed($unsigned(wire48)));
  assign wire53 = ($unsigned(wire49) ?
                      wire46[(3'h5):(2'h3)] : (|$unsigned((^~{wire51,
                          wire52}))));
  assign wire54 = (wire46 << wire43[(2'h3):(2'h2)]);
  assign wire55 = wire53[(3'h6):(3'h6)];
  assign wire56 = $signed({(wire45 & ($unsigned(wire44) > $unsigned((8'hab)))),
                      wire54});
  always
    @(posedge clk) begin
      reg57 <= wire54[(4'he):(4'hb)];
      reg58 <= ((|$signed(wire47[(4'h9):(3'h4)])) ?
          ((8'ha1) >= ((!{wire44}) ?
              $signed((reg57 ? (8'hac) : (8'ha7))) : (wire56[(1'h1):(1'h1)] ?
                  $unsigned(wire44) : (wire50 ?
                      wire45 : wire44)))) : $signed($signed(($unsigned(wire55) ?
              $unsigned(wire47) : $unsigned(wire50)))));
      reg59 <= (~&($unsigned($signed($signed(reg58))) * $unsigned((wire49 >= (^wire53)))));
      reg60 <= (~{(-wire56[(1'h1):(1'h1)])});
    end
  assign wire61 = reg59[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= wire51[(3'h7):(1'h0)];
      reg63 <= {(+wire43)};
    end
  assign wire64 = wire49;
  assign wire65 = ((~wire55[(4'hc):(4'hc)]) ?
                      ((((wire50 ?
                          wire47 : (8'ha9)) * (8'ha9)) && (^~reg59[(2'h3):(1'h1)])) <<< (reg63 ?
                          wire56[(2'h3):(2'h3)] : ((~|(8'had)) - wire46))) : reg59[(2'h2):(1'h1)]);
endmodule
