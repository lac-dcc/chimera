module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire124;
  assign y = {wire129, wire128, wire127, wire126, wire124, (1'h0)};
  module4 #() modinst125 (wire124, clk, wire0, wire2, wire3, wire1);
  assign wire126 = ((-$signed($signed($unsigned(wire124)))) ?
                       wire124[(4'he):(4'h9)] : ($unsigned(wire1[(2'h3):(2'h2)]) ?
                           wire2[(2'h3):(1'h1)] : $signed($unsigned((wire3 < (8'hb7))))));
  assign wire127 = wire3[(5'h12):(4'hc)];
  assign wire128 = wire124;
  assign wire129 = wire126;
endmodule

module module4
#(parameter param122 = (((+((~&(8'hac)) + ((7'h40) | (8'ha8)))) ? ((~^(~|(7'h42))) ? ((~|(8'hbf)) == (~&(7'h42))) : ((8'ha8) ^ ((8'hbb) < (8'ha9)))) : {(^{(7'h40), (8'hb0)}), (~^(~(8'ha1)))}) ? (-((8'hbc) ? (((8'h9c) | (8'hbd)) ^ ((8'hb8) << (7'h43))) : (8'hb6))) : {(~&(((7'h44) > (8'ha5)) != {(8'hab), (8'haa)}))}), 
parameter param123 = param122)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h321):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire5;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire80;
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire91,
                 wire9,
                 wire10,
                 wire25,
                 wire80,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 (1'h0)};
  assign wire9 = {$signed((&$unsigned({wire6, wire5})))};
  assign wire10 = ({wire7,
                      wire7[(1'h0):(1'h0)]} > ((~&$signed($unsigned(wire7))) ?
                      ($signed((8'ha8)) ?
                          wire7 : (&(7'h44))) : ((&wire5[(1'h1):(1'h1)]) <<< wire7)));
  always
    @(posedge clk) begin
      reg11 <= $signed((~^$unsigned(wire9[(4'h9):(3'h6)])));
      reg12 <= wire5[(2'h2):(1'h0)];
      reg13 <= $unsigned($signed((+$unsigned((!(8'ha1))))));
      if ($signed($unsigned((+((~^reg13) <<< $unsigned((8'hb1)))))))
        begin
          reg14 <= wire10[(2'h2):(2'h2)];
          reg15 <= (8'ha3);
          reg16 <= reg14[(3'h5):(2'h3)];
          reg17 <= {(^~(wire10 + $signed((reg14 ? wire9 : reg14)))),
              (reg15 < reg14)};
        end
      else
        begin
          if (($signed(wire5) ?
              (|(wire5[(1'h0):(1'h0)] >>> {(reg15 ? reg16 : wire5),
                  ((7'h41) == reg16)})) : $unsigned(((reg17[(4'h8):(3'h4)] ?
                      $signed(reg12) : ((8'ha1) ? reg13 : reg13)) ?
                  $unsigned((~wire9)) : {reg12, (wire10 << (7'h41))}))))
            begin
              reg14 <= reg11;
            end
          else
            begin
              reg14 <= ($signed((($unsigned(wire9) ?
                  $signed(reg12) : (|wire7)) * ($signed(reg14) >= (~&reg16)))) >> (-{(reg15 > $signed(reg11))}));
              reg15 <= $signed(($unsigned(((wire9 >= wire8) ?
                  $unsigned(wire8) : reg13[(1'h0):(1'h0)])) ^~ $unsigned((+(reg15 ?
                  wire8 : reg11)))));
              reg16 <= {wire6,
                  (reg13 ?
                      (reg13 ?
                          ((wire8 != (8'ha1)) ?
                              (reg17 || reg14) : (reg17 ?
                                  wire7 : (8'hbb))) : (!((8'ha8) ?
                              reg14 : wire6))) : reg14)};
              reg17 <= reg17[(4'hd):(1'h0)];
            end
          if ((^~$unsigned($unsigned((~|$signed(wire8))))))
            begin
              reg18 <= {(8'h9f), reg16};
              reg19 <= wire10[(2'h2):(1'h0)];
              reg20 <= $signed(wire10);
              reg21 <= {wire5, $unsigned($signed($signed((wire7 & reg19))))};
              reg22 <= $signed({{wire8[(3'h5):(3'h4)],
                      $signed($signed(wire6))}});
            end
          else
            begin
              reg18 <= ((($signed({reg17,
                  reg16}) >>> reg11[(1'h1):(1'h0)]) & ({((8'ha2) >>> (8'hac)),
                  {wire8}} >= wire7[(1'h0):(1'h0)])) + $signed((reg16[(2'h2):(1'h0)] | reg16)));
              reg19 <= (reg18 ?
                  {$signed($unsigned($signed(reg20))), reg17} : $signed(reg13));
              reg20 <= $signed((^~$unsigned($unsigned((wire9 == reg13)))));
              reg21 <= $signed($unsigned(wire6[(5'h13):(4'hc)]));
            end
          reg23 <= (wire9 ?
              (reg20[(2'h2):(1'h1)] ?
                  $signed({$unsigned(wire10)}) : (|reg15[(5'h10):(4'hf)])) : $signed(((~&(reg16 >> reg16)) < (8'ha8))));
        end
      reg24 <= (8'ha9);
    end
  assign wire25 = ($unsigned((|reg16[(1'h1):(1'h0)])) & $signed(reg17));
  always
    @(posedge clk) begin
      if ($signed((~(8'ha1))))
        begin
          reg26 <= {(^(+$signed($signed(reg15)))), (7'h42)};
          reg27 <= (~^reg14);
          reg28 <= (^~wire25[(4'hd):(4'hd)]);
          reg29 <= wire5;
          if ({($signed($unsigned(((8'hb5) ?
                  (8'hba) : wire25))) <= ($unsigned($signed(wire7)) ?
                  (~&$signed(reg13)) : (!(~&(7'h44))))),
              ($unsigned(reg12) ?
                  $signed({{reg15},
                      ((7'h43) ^~ wire9)}) : (reg11[(2'h3):(1'h0)] ?
                      reg20 : reg27[(1'h0):(1'h0)]))})
            begin
              reg30 <= (+($signed(($signed(reg24) == $signed(reg16))) ?
                  $signed(((+reg11) + $signed(wire7))) : ($unsigned((~&reg27)) ?
                      reg29[(5'h13):(4'he)] : $signed($signed(reg22)))));
              reg31 <= ($signed(({{reg24},
                  (wire6 ? (8'ha4) : reg30)} >> ((reg30 ? wire5 : wire7) ?
                  (reg30 ? reg18 : reg21) : (reg22 + reg26)))) >= (^~wire9));
              reg32 <= ((&reg18) ?
                  wire8 : ($unsigned({(reg31 ? reg29 : reg24),
                      (~&(8'hbe))}) ~^ (~&(+$signed((8'hbe))))));
              reg33 <= reg32[(1'h1):(1'h0)];
              reg34 <= (wire5 ? reg11 : reg14);
            end
          else
            begin
              reg30 <= (~^(&$signed(($unsigned(reg27) ?
                  $signed(reg20) : (reg32 - reg32)))));
              reg31 <= (!(|$signed($unsigned((reg34 * reg20)))));
              reg32 <= $unsigned(reg20);
            end
        end
      else
        begin
          if ($signed({{reg11},
              $signed(($unsigned(reg29) ? $signed(reg16) : reg24))}))
            begin
              reg26 <= ((~^reg30) * $unsigned(({(reg23 ~^ reg31)} | ({reg15} ?
                  reg16 : (reg19 > (8'h9d))))));
            end
          else
            begin
              reg26 <= (~&reg16);
              reg27 <= $unsigned(((wire9 ? reg20 : {$signed(reg17)}) ?
                  (($signed((8'hb3)) || {(8'hbf), (8'hb1)}) ?
                      reg24[(1'h0):(1'h0)] : $unsigned(reg21)) : $unsigned(((~|reg28) ?
                      $signed(wire10) : (-reg33)))));
            end
          reg28 <= (reg15[(3'h4):(3'h4)] ?
              {reg33, wire9[(3'h4):(2'h2)]} : (((!(&reg27)) >= wire6) ?
                  reg30[(3'h6):(3'h6)] : wire10));
          reg29 <= reg11;
        end
      reg35 <= $unsigned($signed(({reg16} != (8'h9d))));
      reg36 <= (^$unsigned((reg34 == (|$unsigned(reg35)))));
      reg37 <= (8'hb1);
    end
  module38 #() modinst81 (.wire41(reg13), .wire42(wire5), .wire40(reg31), .y(wire80), .clk(clk), .wire43(reg17), .wire39(reg19));
  always
    @(posedge clk) begin
      reg82 <= reg30[(4'ha):(4'h8)];
      if (((~$unsigned(reg30)) ?
          $signed({$unsigned((reg26 ?
                  (8'hb8) : reg16))}) : (!reg37[(2'h2):(1'h0)])))
        begin
          reg83 <= ($signed(reg15) ?
              wire8[(4'hb):(3'h4)] : $unsigned(((reg19[(2'h2):(1'h0)] ?
                      (reg21 ? reg18 : reg13) : reg34) ?
                  $unsigned($unsigned(reg22)) : {wire80, (^reg32)})));
          if ($signed($unsigned(reg32)))
            begin
              reg84 <= wire80[(2'h3):(1'h1)];
              reg85 <= $signed(wire25[(2'h2):(1'h0)]);
              reg86 <= wire6[(5'h10):(3'h6)];
              reg87 <= $unsigned(reg11[(1'h0):(1'h0)]);
              reg88 <= ($unsigned(reg19[(3'h7):(1'h1)]) ?
                  ($signed($signed(((8'hab) ?
                      reg21 : reg13))) ~^ reg37[(1'h1):(1'h0)]) : $signed(reg36));
            end
          else
            begin
              reg84 <= $unsigned(($signed((^~(|reg86))) - reg32));
              reg85 <= reg37[(1'h0):(1'h0)];
              reg86 <= reg37[(2'h2):(1'h1)];
              reg87 <= reg83[(1'h1):(1'h0)];
            end
          reg89 <= $unsigned((reg12 ?
              ($unsigned((reg82 ? reg26 : wire25)) ?
                  reg22[(3'h4):(2'h2)] : $unsigned((~|wire80))) : (^~{reg16})));
          reg90 <= wire5[(3'h6):(3'h5)];
        end
      else
        begin
          reg83 <= reg17[(3'h6):(1'h1)];
          reg84 <= $signed((((-(wire80 ? reg27 : reg36)) ?
                  reg82[(3'h7):(1'h1)] : reg34) ?
              wire8 : $signed((!$unsigned(reg88)))));
          reg85 <= $signed($unsigned((^~reg82[(1'h1):(1'h0)])));
          reg86 <= (((8'hbb) << (~^reg35)) << ({reg16[(1'h0):(1'h0)],
              (^~(^(8'ha6)))} >>> wire25[(4'ha):(3'h6)]));
        end
    end
  assign wire91 = reg23;
  always
    @(posedge clk) begin
      reg92 <= ((((8'ha3) ?
              wire80[(4'he):(4'h9)] : (|wire6[(4'ha):(4'ha)])) << $unsigned(((reg12 < reg24) ?
              reg88 : reg28))) ?
          $unsigned(reg89) : $unsigned($unsigned((+{reg35}))));
      if ((&(reg32 >= ((8'h9f) ?
          (reg86[(4'h8):(1'h0)] ?
              (reg14 == wire7) : (-reg26)) : reg89[(4'h9):(3'h6)]))))
        begin
          reg93 <= {(~wire7), $signed((|reg23))};
          reg94 <= (~reg34[(1'h1):(1'h1)]);
          reg95 <= (((8'h9c) <= ((~^reg37[(2'h3):(1'h0)]) ?
                  ({reg94, wire5} ?
                      (wire10 < reg30) : $signed((8'h9d))) : reg24)) ?
              reg27[(2'h2):(1'h1)] : wire5[(4'h9):(1'h1)]);
        end
      else
        begin
          if (reg84)
            begin
              reg93 <= reg89;
              reg94 <= {reg32[(3'h5):(2'h2)], reg93};
            end
          else
            begin
              reg93 <= (reg33 ?
                  (8'hb1) : ((((|wire25) ?
                      $unsigned(reg14) : $unsigned(reg26)) <<< ($signed(reg83) ?
                      wire91 : (reg84 >> reg14))) - $unsigned($unsigned(wire25[(4'hf):(4'he)]))));
              reg94 <= (wire5 <<< $unsigned($unsigned($unsigned((wire7 == (8'hb0))))));
            end
          reg95 <= ((|reg36) >= ((~|reg26[(4'hf):(1'h1)]) - (8'ha6)));
        end
      reg96 <= $unsigned(reg12[(2'h2):(1'h1)]);
      if ($unsigned($signed((7'h40))))
        begin
          reg97 <= (-$unsigned((^~reg22)));
          reg98 <= (reg15 ?
              reg12 : {((|(~|wire10)) ?
                      $unsigned((reg35 ^~ reg95)) : $signed(wire9[(5'h13):(3'h5)])),
                  $signed((-{wire25, reg88}))});
          reg99 <= {$unsigned($signed(wire9[(5'h11):(4'hd)]))};
        end
      else
        begin
          reg97 <= reg26;
        end
      reg100 <= $unsigned((&reg23[(3'h6):(1'h0)]));
    end
  assign wire101 = reg87;
  assign wire102 = reg100;
  assign wire103 = ({reg83[(2'h2):(2'h2)]} ~^ reg24);
  assign wire104 = $signed(reg16[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((&$signed((~(((8'hb1) || reg83) & (reg20 * (8'hab)))))))
        begin
          reg105 <= reg27;
          reg106 <= (($unsigned(reg99) ?
              ($unsigned($unsigned(reg94)) >>> reg93) : ((!(wire101 ?
                  reg31 : wire6)) < reg13)) <= (({(wire7 ?
                      reg92 : reg92)} ^~ $signed($signed(reg13))) ?
              wire6[(4'h9):(3'h7)] : $signed($unsigned(reg12))));
          reg107 <= $unsigned($unsigned($unsigned((reg95[(4'hf):(4'he)] ~^ $signed(reg89)))));
        end
      else
        begin
          reg105 <= {(8'hb7)};
          reg106 <= (8'hbe);
          reg107 <= ((reg92 ? (~|reg30[(2'h2):(1'h0)]) : reg82[(2'h3):(2'h2)]) ?
              (8'hbc) : $signed(reg12[(3'h6):(3'h5)]));
          if (({reg36[(1'h0):(1'h0)]} ?
              reg13 : $unsigned((^$unsigned($signed(wire6))))))
            begin
              reg108 <= $signed(($unsigned((7'h42)) * (~&reg105)));
            end
          else
            begin
              reg108 <= $signed($signed(wire5));
              reg109 <= $signed((reg21 && $unsigned(($signed((8'had)) - {reg35,
                  reg96}))));
            end
          reg110 <= reg32[(3'h4):(3'h4)];
        end
      reg111 <= {$signed((8'ha6)),
          (^~{{$unsigned((8'ha2)), reg108[(1'h1):(1'h0)]}, reg92})};
      if (reg20[(1'h1):(1'h1)])
        begin
          if (reg21)
            begin
              reg112 <= wire25[(3'h6):(3'h5)];
              reg113 <= reg17;
              reg114 <= $unsigned(reg35[(3'h5):(3'h5)]);
            end
          else
            begin
              reg112 <= (reg105[(1'h0):(1'h0)] ?
                  (~^reg16[(1'h1):(1'h0)]) : $signed(($unsigned((|reg106)) >>> {(reg31 <= reg84),
                      wire10[(2'h2):(2'h2)]})));
              reg113 <= reg112[(3'h4):(2'h3)];
              reg114 <= ((~|(|reg83)) ? reg87 : $unsigned((7'h43)));
              reg115 <= $unsigned(reg95);
            end
        end
      else
        begin
          if ((^({((8'hac) && (reg109 <<< wire5))} ?
              (((reg111 != wire5) ^~ reg33) + wire6) : reg24)))
            begin
              reg112 <= (&reg98);
              reg113 <= {({reg85[(1'h1):(1'h1)]} ?
                      $unsigned(reg33) : reg34[(1'h1):(1'h0)])};
              reg114 <= (&wire7);
              reg115 <= $unsigned($signed((-{$signed(reg105)})));
              reg116 <= $unsigned($unsigned({($signed(reg31) ?
                      reg95[(5'h13):(1'h1)] : (reg14 ? reg85 : reg86)),
                  $signed((reg34 ? wire25 : reg20))}));
            end
          else
            begin
              reg112 <= $unsigned(($unsigned($signed(((8'ha0) ?
                  (8'hb8) : reg113))) <<< ((&$signed((8'h9f))) ?
                  {(~^wire6)} : reg86)));
            end
          reg117 <= {((+$signed((wire104 >= reg82))) <<< $signed(($unsigned(reg11) ?
                  (8'h9f) : $unsigned((8'hb2)))))};
          reg118 <= wire7[(2'h3):(1'h0)];
          reg119 <= $signed((~(({reg94} ?
              (&wire101) : reg36[(3'h4):(2'h2)]) - wire6)));
          reg120 <= ($signed($signed(($unsigned(reg112) ?
              ((7'h44) >> (8'hb2)) : $unsigned(reg30)))) < $unsigned(({$signed(reg106),
              (8'haa)} >>> (~&((8'hb7) ? reg119 : reg87)))));
        end
    end
  always
    @(posedge clk) begin
      reg121 <= wire6[(4'he):(4'ha)];
    end
endmodule

module module38
#(parameter param78 = (-(((((8'hbe) != (8'ha2)) ? (-(8'hb9)) : ((7'h42) ? (8'hb7) : (8'hb9))) ? (((8'hbd) ? (8'h9e) : (8'hb1)) >= ((8'ha9) <= (8'h9e))) : (~&((8'hbe) ? (8'ha5) : (8'had)))) >= ((~(^(8'h9e))) >> (8'haf)))), 
parameter param79 = (~^(param78 + (-param78))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire [(3'h7):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire44 = wire40[(1'h1):(1'h1)];
  assign wire45 = (wire43 ?
                      wire41[(3'h5):(3'h4)] : $unsigned(($unsigned((wire42 >>> wire44)) >= wire41[(4'hb):(4'h8)])));
  assign wire46 = (~&($signed((~|(wire39 < wire44))) ?
                      (|wire39) : $unsigned({$unsigned(wire39), (^(8'hb3))})));
  assign wire47 = (^(wire46 ?
                      $signed(((^wire44) > (wire44 ?
                          wire39 : wire39))) : ($signed(wire42) << ((wire42 ?
                              wire45 : (8'h9c)) ?
                          {wire44} : wire39[(1'h0):(1'h0)]))));
  assign wire48 = ((((8'hac) && $signed(wire39)) ?
                          wire43 : (wire45 ?
                              wire40[(1'h1):(1'h1)] : {{wire44}})) ?
                      {$signed(wire46[(4'h8):(3'h4)])} : wire40);
  assign wire49 = (^wire48[(1'h0):(1'h0)]);
  assign wire50 = ($unsigned(wire44[(3'h4):(2'h2)]) ?
                      {(((wire47 > (7'h40)) ?
                              (!wire48) : (wire49 >>> wire46)) ^ (|$signed(wire43)))} : (wire46 ?
                          (!wire42) : $signed((^$signed(wire48)))));
  assign wire51 = $unsigned((8'hb8));
  assign wire52 = (((|({(8'hbc), (8'hb0)} >>> wire41)) ?
                          $unsigned($unsigned((wire40 ?
                              wire39 : wire48))) : {wire45[(3'h6):(2'h2)]}) ?
                      $signed(($signed((wire50 < wire49)) ?
                          wire51 : $unsigned($signed(wire50)))) : $unsigned(wire40));
  always
    @(posedge clk) begin
      if ({wire46, $signed($unsigned(wire46[(4'h9):(3'h5)]))})
        begin
          if ((+wire46[(1'h1):(1'h0)]))
            begin
              reg53 <= ($unsigned(wire47) ?
                  $signed((wire44 ?
                      $unsigned((wire41 * wire39)) : wire49)) : (~^$signed($unsigned($unsigned(wire51)))));
            end
          else
            begin
              reg53 <= (($signed(((wire43 ? wire40 : wire42) ?
                          {wire48} : (wire39 ? wire39 : wire49))) ?
                      (-(~&(-wire40))) : {(wire48 << ((8'hb1) ?
                              (8'ha4) : wire40))}) ?
                  ((8'ha4) ?
                      $unsigned(wire41) : wire44[(2'h2):(1'h0)]) : wire40);
              reg54 <= {$signed(wire46), wire48};
            end
          if (wire50)
            begin
              reg55 <= ({{(wire49[(5'h12):(2'h3)] <= $unsigned(wire46)),
                          ($unsigned(wire49) ? wire40[(4'ha):(1'h0)] : wire50)},
                      wire45} ?
                  wire43[(2'h2):(1'h0)] : ({{(~(8'ha5))}} << (wire51[(2'h2):(1'h0)] > $signed((8'ha0)))));
              reg56 <= ((~&($unsigned((wire52 <<< wire44)) != {wire45[(3'h5):(2'h2)]})) ?
                  (+$unsigned(((wire42 ?
                      wire40 : wire50) ~^ (reg54 || wire43)))) : (&wire51[(3'h7):(3'h5)]));
            end
          else
            begin
              reg55 <= $signed(wire52[(3'h4):(1'h1)]);
              reg56 <= (~&(reg53[(3'h6):(3'h6)] ? wire40 : wire49));
              reg57 <= (({((reg54 ? reg55 : wire51) - $signed(wire39)),
                      (reg54[(3'h7):(3'h6)] ?
                          reg55[(4'ha):(4'h9)] : (reg53 <<< wire43))} >>> $unsigned($signed($signed(wire52)))) ?
                  (-wire47[(1'h1):(1'h0)]) : ({(~reg55[(2'h2):(1'h0)]),
                          wire44} ?
                      $signed($signed($unsigned(wire46))) : $unsigned($unsigned(((8'ha8) >= reg56)))));
              reg58 <= ($unsigned(reg55) == ((8'hae) == $unsigned($signed($signed(wire52)))));
              reg59 <= (wire48 <<< (8'ha5));
            end
          reg60 <= (^~wire48);
          if ((reg58[(3'h5):(3'h5)] ?
              wire40[(1'h0):(1'h0)] : (wire51 >>> ($signed((wire44 << wire46)) != (wire49 ~^ {wire48})))))
            begin
              reg61 <= wire43;
              reg62 <= $unsigned((~^($signed((wire50 ^ wire48)) ?
                  $signed($unsigned(wire40)) : $signed({reg54}))));
              reg63 <= (~|$unsigned({(((8'hb8) ? reg56 : (8'hbc)) ^~ (^wire41)),
                  reg54}));
              reg64 <= ($signed((&(wire40 ? reg53 : $signed((8'hb6))))) ?
                  reg54 : ($signed({reg54}) <= $unsigned(((reg54 ?
                          wire52 : reg60) ?
                      $unsigned((8'h9e)) : wire47))));
            end
          else
            begin
              reg61 <= reg57[(1'h1):(1'h0)];
              reg62 <= $unsigned((wire48[(2'h3):(2'h2)] ?
                  (($signed(reg61) | $signed(wire52)) ?
                      $signed(wire40) : {(~|wire39),
                          (~wire48)}) : $unsigned($unsigned($unsigned(wire51)))));
            end
          reg65 <= ((~^wire51) ?
              $unsigned($signed($signed(reg55[(2'h3):(2'h2)]))) : (reg63[(4'hc):(4'h8)] ?
                  {wire46} : $unsigned({{wire46, wire44}})));
        end
      else
        begin
          reg53 <= (+($unsigned(($signed(wire47) >> $unsigned(reg53))) ?
              reg63[(4'h9):(2'h2)] : $signed(($unsigned(reg55) && $unsigned(wire45)))));
          reg54 <= reg53;
          reg55 <= (8'hbe);
          reg56 <= (~|(~(wire45[(3'h5):(2'h3)] ? reg58 : (|{reg64, reg63}))));
          if ({(8'hbc), (~(~wire52))})
            begin
              reg57 <= $unsigned(reg56[(4'hc):(4'hc)]);
            end
          else
            begin
              reg57 <= reg60;
              reg58 <= reg63;
              reg59 <= $signed($signed($unsigned(((reg59 << reg60) ?
                  (reg58 * reg60) : $unsigned(wire52)))));
            end
        end
      reg66 <= ((reg57[(1'h0):(1'h0)] ?
          (reg55[(4'h9):(1'h1)] ?
              {wire39} : reg65[(3'h5):(3'h4)]) : (wire47[(2'h3):(2'h3)] ?
              wire47[(1'h0):(1'h0)] : (wire51[(3'h6):(3'h4)] ?
                  (wire43 < (8'h9c)) : {wire43,
                      reg56}))) ^~ wire42[(4'hb):(3'h4)]);
      reg67 <= ((($signed((wire49 ? wire42 : reg55)) ?
          $signed((wire39 ?
              reg57 : reg65)) : (^~$unsigned(wire42))) >> (reg63[(4'hc):(4'ha)] ^ wire41[(4'he):(3'h5)])) != wire45[(1'h1):(1'h0)]);
      if ($unsigned({(wire52[(2'h3):(1'h0)] ?
              ({wire46} ? $signed(wire48) : (wire48 || reg66)) : ({reg66,
                      wire50} ?
                  (reg63 >= wire44) : reg53)),
          ((wire40[(3'h7):(1'h0)] ? (^reg56) : (~reg58)) <= (8'ha9))}))
        begin
          reg68 <= $unsigned($signed(reg54[(4'h9):(4'h8)]));
          reg69 <= reg56;
          reg70 <= {(-$signed((^{wire51}))), $unsigned(reg66)};
          reg71 <= (^~wire47[(2'h3):(2'h2)]);
        end
      else
        begin
          reg68 <= (((!wire40) >>> reg57[(3'h4):(3'h4)]) << ((|{$signed((8'haa))}) <<< (($signed(wire44) ?
              (reg57 << reg56) : (wire40 ?
                  reg63 : reg64)) & $signed(wire41[(4'hb):(2'h2)]))));
          reg69 <= {(~&(~^($signed((7'h43)) ? (reg57 << reg66) : (!reg71)))),
              $unsigned($unsigned(reg53))};
          reg70 <= reg56;
          if ($unsigned(reg63))
            begin
              reg71 <= (^$unsigned((({wire42, reg66} ?
                  (wire40 & wire48) : (wire51 ?
                      wire47 : (8'hb6))) * wire44[(1'h0):(1'h0)])));
              reg72 <= (^~(~(wire47 >= wire46[(1'h1):(1'h0)])));
            end
          else
            begin
              reg71 <= (-wire40[(3'h6):(1'h0)]);
              reg72 <= (reg61[(3'h6):(1'h1)] ?
                  $signed($unsigned((8'ha7))) : (wire43 ?
                      (^~wire39[(2'h2):(2'h2)]) : $unsigned(({(8'hba)} * reg59[(2'h3):(2'h2)]))));
              reg73 <= {reg68,
                  ((~&wire51) ?
                      reg55 : $unsigned(({reg67, reg58} ^ $signed(wire44))))};
              reg74 <= (^wire47[(2'h3):(2'h3)]);
              reg75 <= ((wire50[(4'hb):(1'h1)] ?
                      ((reg61[(1'h0):(1'h0)] ?
                          (reg61 & wire48) : $signed(wire45)) < $unsigned((~^wire42))) : wire51) ?
                  $unsigned(($unsigned((wire45 != reg55)) >>> $signed(wire48))) : $signed(reg54));
            end
        end
      if ((reg70[(5'h10):(3'h4)] >> reg62))
        begin
          reg76 <= (($signed((!$signed(reg55))) ?
              ((~^{reg69}) & $signed({reg63})) : $signed(wire39)) == wire42[(4'ha):(2'h2)]);
        end
      else
        begin
          reg76 <= $unsigned((8'hbd));
          reg77 <= (~|(~{reg56[(3'h4):(3'h4)], $signed(reg68)}));
        end
    end
endmodule
